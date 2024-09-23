@implementation AMSBTLEConnectionManager

- (AMSBTLEConnectionManager)initWithUIController:(id)a3
{
  AMSBTLEConnectionManager *v4;
  AMSBTLEConnectionManager *v5;
  CBCentralManager *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSBTLEConnectionManager;
  v4 = -[AMSBTLEConnectionManager init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->controller = (BTLEConnectionTable *)a3;
    v6 = (CBCentralManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB220]), "initWithDelegate:queue:", v4, 0);
    v5->centralManager = v6;
    v5->centralState = -[CBCentralManager state](v6, "state");
    v5->peripheralList = (NSMutableArray *)objc_opt_new();
    v5->connectedBTPeripherals = (NSMutableArray *)objc_opt_new();
    v5->connectedAMSPeripherals = (NSMutableArray *)objc_opt_new();
    -[AMSBTLEConnectionManager createPeripheralList](v5, "createPeripheralList");
    -[AMSBTLEConnectionManager startTimer](v5, "startTimer");
    if (!gNotificationClient)
      MIDIClientCreate(&stru_24CF57660, (MIDINotifyProc)NotifyProc, v5, (MIDIClientRef *)&gNotificationClient);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_updateAdvertisingState_, kAdvertisementNotification, 0);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  CBCentralManager *centralManager;
  objc_super v5;

  if (gNotificationClient)
  {
    MIDIClientDispose(gNotificationClient);
    gNotificationClient = 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:", kAdvertisementNotification);

  self->peripheralList = 0;
  centralManager = self->centralManager;
  if (centralManager)
  {

    self->centralManager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSBTLEConnectionManager;
  -[AMSBTLEConnectionManager dealloc](&v5, sel_dealloc);
}

- (void)updateAdvertisingState:(id)a3
{
  self->isAdvertising = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("isAdvertising")), "BOOLValue");
}

- (void)setUIController:(id)a3
{
  self->controller = (BTLEConnectionTable *)a3;
}

- (void)createPeripheralList
{
  ItemCount v3;
  ItemCount v4;
  ItemCount v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  AMSBTLEPeripheral *v10;
  AMSBTLEPeripheral *v11;
  BTLEConnectionTable *controller;
  const __CFString *propertyID;
  SInt32 v14[2];
  CFStringRef v15;
  CFStringRef v16;
  SInt32 outValue;
  CFStringRef str;

  v3 = MIDIGetNumberOfDevices();
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = (const __CFString *)*MEMORY[0x24BDBFBF0];
    propertyID = (const __CFString *)*MEMORY[0x24BDBFBF8];
    v7 = (const __CFString *)*MEMORY[0x24BDBFC00];
    do
    {
      v8 = MIDIGetDevice(v5);
      if ((_DWORD)v8)
      {
        v9 = v8;
        str = 0;
        MIDIObjectGetStringProperty(v8, v6, &str);
        if (str)
        {
          if (CFEqual(str, CFSTR("com.apple.AppleMIDIBluetoothDriver")))
          {
            CFRelease(str);
            outValue = 0;
            if ((objc_msgSend(MEMORY[0x24BDBFBE8], "deviceIsNullDevice:", v9) & 1) == 0
              && (objc_msgSend(MEMORY[0x24BDBFBE8], "deviceIsLocalPeripheral:", v9) & 1) == 0)
            {
              v16 = 0;
              MIDIObjectGetStringProperty(v9, CFSTR("BLE MIDI Device UUID"), &v16);
              if (v16)
              {
                v15 = 0;
                MIDIObjectGetStringProperty(v9, propertyID, &v15);
                MIDIObjectGetIntegerProperty(v9, v7, &outValue);
                v10 = [AMSBTLEPeripheral alloc];
                v11 = -[AMSBTLEPeripheral initWithID:name:manager:](v10, "initWithID:name:manager:", v16, v15, self->centralManager);
                CFRelease(v16);
                CFRelease(v15);
                *(_QWORD *)v14 = 0;
                MIDIObjectGetIntegerProperty(v9, CFSTR("MIDI Input Supported"), &v14[1]);
                MIDIObjectGetIntegerProperty(v9, CFSTR("MIDI Output Supported"), v14);
                -[AMSBTLEPeripheral setInputAvailable:](v11, "setInputAvailable:", v14[1] != 0);
                -[AMSBTLEPeripheral setOutputAvailable:](v11, "setOutputAvailable:", v14[0] != 0);
                -[AMSBTLEPeripheral setOnline:](v11, "setOnline:", outValue == 0);
                -[AMSBTLEPeripheral updateAvailableStateChanged](v11, "updateAvailableStateChanged");
                controller = self->controller;
                objc_sync_enter(controller);
                -[NSMutableArray addObject:](self->peripheralList, "addObject:", v11);
                objc_sync_exit(controller);
              }
            }
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
      ++v5;
    }
    while (v4 != v5);
  }
  -[BTLEConnectionTable updatePeripheralTable](self->controller, "updatePeripheralTable", propertyID);
}

- (void)checkAlreadyConnectedPeripherals
{
  void *v3;
  CBCentralManager *centralManager;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  AMSBTLEPeripheral *v20;
  BTLEConnectionTable *controller;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (!self->isAdvertising)
  {
    v3 = (void *)objc_opt_new();
    centralManager = self->centralManager;
    v32[0] = objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"));
    v5 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:](centralManager, "retrieveConnectedPeripheralsWithServices:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v10 = objc_msgSend(MEMORY[0x24BDBFBE8], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v9, "identifier"), "UUIDString"));
          if ((_DWORD)v10 && !objc_msgSend(MEMORY[0x24BDBFBE8], "deviceIsOnline:", v10)
            || !objc_msgSend(MEMORY[0x24BDBFBE8], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v9, "identifier", v10), "UUIDString")))
          {
            objc_msgSend(v3, "addObject:", v9);
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v6);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (!v11)
    {

      return;
    }
    v12 = 0;
    v13 = *(_QWORD *)v23;
    while (1)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v3);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        v16 = objc_msgSend(MEMORY[0x24BDBFBE8], "midiDeviceForUUID:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"));
        if ((_DWORD)v16)
          v17 = objc_msgSend(MEMORY[0x24BDBFBE8], "nameForMIDIDevice:", v16);
        else
          v17 = objc_msgSend(v15, "name", v16);
        v18 = v17;
        v19 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:", v15);
        if (v19)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
          objc_msgSend(v19, "setLastSeen:");
          if (!objc_msgSend(v19, "updateAvailableStateChanged"))
            continue;
          NSLog(CFSTR("peripheral isAvailable changed to %d in checkAlreadyConnectedPeripherals"), objc_msgSend(v19, "isAvailable"));
        }
        else
        {
          NSLog(CFSTR("Retrieved a new MIDI peripheral: %@ (UUID: %@)"), v18, objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"));
          v20 = -[AMSBTLEPeripheral initWithID:name:manager:]([AMSBTLEPeripheral alloc], "initWithID:name:manager:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "UUIDString"), v18, self->centralManager);
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
          -[AMSBTLEPeripheral setLastSeen:](v20, "setLastSeen:");
          -[AMSBTLEPeripheral updateAvailableStateChanged](v20, "updateAvailableStateChanged");
          controller = self->controller;
          objc_sync_enter(controller);
          -[NSMutableArray addObject:](self->peripheralList, "addObject:", v20);
          objc_sync_exit(controller);

        }
        v12 = 1;
      }
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (!v11)
      {

        if ((v12 & 1) != 0)
          -[BTLEConnectionTable updatePeripheralTable](self->controller, "updatePeripheralTable");
        return;
      }
    }
  }
}

- (void)timerFired:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  BTLEConnectionTable *controller;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AMSBTLEConnectionManager checkAlreadyConnectedPeripherals](self, "checkAlreadyConnectedPeripherals", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  v5 = v4;
  v6 = (void *)-[NSMutableArray copy](self->peripheralList, "copy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v11, "lastSeen");
        if (v5 - v12 <= 7.0
          || -[AMSBTLEConnectionManager midiDeviceForUUID:](self, "midiDeviceForUUID:", objc_msgSend(v11, "uuid")))
        {
          v8 |= objc_msgSend(v11, "updateAvailableStateChanged");
        }
        else
        {
          controller = self->controller;
          objc_sync_enter(controller);
          objc_msgSend(v11, "setOnline:", 0);
          -[NSMutableArray removeObject:](self->peripheralList, "removeObject:", v11);
          objc_sync_exit(controller);
          v8 = 1;
        }
        ++v10;
      }
      while (v7 != v10);
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v14;
    }
    while (v14);
    if ((v8 & 1) != 0)
      -[BTLEConnectionTable updatePeripheralTable](self->controller, "updatePeripheralTable");
  }

}

- (BOOL)isLECapableHardware
{
  uint64_t v2;
  const __CFString *v3;
  BOOL v4;
  const __CFString *v5;

  v2 = -[CBCentralManager state](self->centralManager, "state");
  v3 = CFSTR("Bluetooth is powered on and LE capable.");
  v4 = 1;
  v5 = CFSTR("The platform/hardware doesn't support Bluetooth Low Energy.");
  switch(v2)
  {
    case 2:
      goto LABEL_5;
    case 3:
      v5 = CFSTR("The app is not authorized to use Bluetooth Low Energy.");
      goto LABEL_5;
    case 4:
      v5 = CFSTR("Bluetooth is currently powered off.");
LABEL_5:
      v4 = 0;
      v3 = v5;
      goto LABEL_6;
    case 5:
LABEL_6:
      NSLog(CFSTR("Central manager state: %@"), v3);
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (int64_t)bluetoothState
{
  return -[CBCentralManager state](self->centralManager, "state");
}

- (void)startScan
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBB058];
  v6[0] = MEMORY[0x24BDBD1C8];
  v3 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  NSLog(CFSTR("Scanning for MIDI service %s"), "03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  v4 = objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"));
  -[CBCentralManager scanForPeripheralsWithServices:options:](self->centralManager, "scanForPeripheralsWithServices:options:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 1), v3);
}

- (void)stopScan
{
  -[CBCentralManager stopScan](self->centralManager, "stopScan");
  NSLog(CFSTR("No longer scanning for MIDI peripherals."));
}

- (void)killTimer
{
  NSTimer *refreshTimer;
  NSTimer *connectionTimer;

  refreshTimer = self->refreshTimer;
  if (refreshTimer)
  {
    -[NSTimer invalidate](refreshTimer, "invalidate");

    self->refreshTimer = 0;
  }
  connectionTimer = self->connectionTimer;
  if (connectionTimer)
  {
    -[NSTimer invalidate](connectionTimer, "invalidate");

    self->connectionTimer = 0;
  }
}

- (void)startTimer
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  if (!self->refreshTimer)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF40]);
    self->refreshTimer = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0), self, sel_timerFired_, 0, 1, 1.0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    objc_msgSend(v4, "addTimer:forMode:", self->refreshTimer, *MEMORY[0x24BDBCB80]);
    -[NSTimer setTolerance:](self->refreshTimer, "setTolerance:", 0.1);
  }
  if (!self->connectionTimer)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF40]);
    self->connectionTimer = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0), self, sel_connectionTimerFired_, 0, 1, 5.0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    objc_msgSend(v6, "addTimer:forMode:", self->connectionTimer, *MEMORY[0x24BDBCB80]);
    -[NSTimer setTolerance:](self->connectionTimer, "setTolerance:", 0.25);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  int64_t v4;
  BTLEConnectionTable *controller;
  uint64_t v6;

  if (self->centralManager == a3)
  {
    v4 = objc_msgSend(a3, "state");
    if (v4 != self->centralState)
    {
      self->centralState = v4;
      if (v4)
      {
        if (v4 == 5)
        {
          -[BTLEConnectionTable setUIEnabled:](self->controller, "setUIEnabled:", 1);
          -[AMSBTLEConnectionManager startScan](self, "startScan");
          return;
        }
        controller = self->controller;
        v6 = 0;
      }
      else
      {
        controller = self->controller;
        v6 = 1;
      }
      -[BTLEConnectionTable setUIEnabled:](controller, "setUIEnabled:", v6);
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  AMSBTLEPeripheral *v15;
  BTLEConnectionTable **p_controller;
  BTLEConnectionTable *controller;

  if (!-[AMSBTLEConnectionManager peripheralIsConnectedCentral:](self, "peripheralIsConnectedCentral:", a4))
  {
    v9 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFC0]);
    v10 = v9;
    if (!v9)
      v10 = objc_msgSend(a4, "name");
    v11 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:", a4);
    if (!v11)
    {
      NSLog(CFSTR("Discovered a new MIDI peripheral: %@ (UUID: %@)"), v10, objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString"));
      v15 = -[AMSBTLEPeripheral initWithID:name:manager:]([AMSBTLEPeripheral alloc], "initWithID:name:manager:", objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString"), v10, self->centralManager);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
      -[AMSBTLEPeripheral setLastSeen:](v15, "setLastSeen:");
      -[AMSBTLEPeripheral updateAvailableStateChanged](v15, "updateAvailableStateChanged");
      controller = self->controller;
      p_controller = &self->controller;
      objc_sync_enter(controller);
      -[BTLEConnectionTable addObject:](*(p_controller - 5), "addObject:", v15);
      objc_sync_exit(controller);

LABEL_17:
      -[BTLEConnectionTable updatePeripheralTable](*p_controller, "updatePeripheralTable");
      return;
    }
    v12 = v11;
    v13 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFE8]);
    if (objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700")))&& (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970"), objc_msgSend(v12, "setLastSeen:"), objc_msgSend(v12, "updateAvailableStateChanged")))
    {
      NSLog(CFSTR("peripheral isAvailable changed to %d in didDiscoverPeripheral"), objc_msgSend(v12, "isAvailable"));
      v14 = 1;
      if (!v9)
        goto LABEL_12;
    }
    else
    {
      v14 = 0;
      if (!v9)
        goto LABEL_12;
    }
    if ((objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", v10) & 1) == 0)
    {
      objc_msgSend(v12, "setName:", v10);
LABEL_16:
      p_controller = &self->controller;
      goto LABEL_17;
    }
LABEL_12:
    if (!v14)
      return;
    goto LABEL_16;
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *connectedAMSPeripherals;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->centralManager == a3)
  {
    v6 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:", a4);
    if (v6)
    {
      v7 = v6;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      connectedAMSPeripherals = self->connectedAMSPeripherals;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(connectedAMSPeripherals);
            v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v13, "uuid"), "isEqualToString:", objc_msgSend(v7, "uuid")))
            {
              -[NSMutableArray removeObject:](self->connectedAMSPeripherals, "removeObject:", v13);
              goto LABEL_13;
            }
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_13:
      -[NSMutableArray addObject:](self->connectedAMSPeripherals, "addObject:", v7);
      if ((-[NSMutableArray containsObject:](self->connectedBTPeripherals, "containsObject:", a4) & 1) == 0)
        -[NSMutableArray addObject:](self->connectedBTPeripherals, "addObject:", a4);
      objc_msgSend(a4, "setDelegate:", self);
      v18 = objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"));
      objc_msgSend(a4, "discoverServices:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1));
    }
    else
    {
      NSLog(CFSTR("Stored peripheral information disappeared before we could connect. Please try again."));
    }
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  NSMutableArray *connectedAMSPeripherals;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->centralManager == a3)
  {
    if (a5)
      NSLog(CFSTR("centralManager:didDisconnectPeripheral:error: %@"), a2, a5);
    objc_msgSend(a4, "setDelegate:", 0);
    -[NSMutableArray removeObject:](self->connectedBTPeripherals, "removeObject:", a4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    connectedAMSPeripherals = self->connectedAMSPeripherals;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(connectedAMSPeripherals);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "uuid"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "identifier"), "UUIDString")))
          {
            -[NSMutableArray removeObject:](self->connectedAMSPeripherals, "removeObject:", v12);
            return;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  NSLog(CFSTR("ERROR: Failed to connect to peripheral: %@ with error = %@"), a4, objc_msgSend(a5, "localizedDescription", a3));
  if (a4)
    objc_msgSend(a4, "setDelegate:", 0);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  AMSBTLEConnectionManager *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    NSLog(CFSTR("peripheral:didDiscoverServices error %@"), a2, a4);
    -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_msgSend(a3, "services");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
      goto LABEL_13;
    v8 = v7;
    v14 = self;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(v12, "UUID");
        if (objc_msgSend(v13, "isEqual:", objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"))))
        {
          objc_msgSend(a3, "discoverCharacteristics:forService:", 0, v12);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
    self = v14;
    if ((v9 & 1) == 0)
    {
LABEL_13:
      NSLog(CFSTR("MIDI service not discovered on peripheral %@. Cancelling connection ..."), objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"));
      -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:");
  if (a5 || !v9)
  {
    if (a5)
      NSLog(CFSTR("peripheral:didDiscoverCharacteristicsForService error %@"), a5);
    -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
  }
  else
  {
    v10 = (void *)objc_msgSend(a4, "UUID");
    if (objc_msgSend(v10, "isEqual:", objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"))))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = (void *)objc_msgSend(a4, "characteristics");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v17 = (void *)objc_msgSend(v16, "UUID");
            if (objc_msgSend(v17, "isEqual:", objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("7772E5DB-3868-4112-A1A9-F2669D106BF3"))))
            {
              if ((objc_msgSend(v16, "properties") & 2) != 0)
              {
                NSLog(CFSTR("Checking pairing status..."));
                objc_msgSend(a3, "readValueForCharacteristic:", v16);
              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  NSMutableArray *connectedAMSPeripherals;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  MIDIObjectRef v16;
  MIDIObjectRef v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(a4, "UUID");
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("7772E5DB-3868-4112-A1A9-F2669D106BF3"))))
  {
    if (a5)
    {
      NSLog(CFSTR("Error encountered checking pairing status: %@"), a5);
      -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
    }
    else
    {
      NSLog(CFSTR("Pairing authentication successful."));
      v9 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:", a3);
      if ((objc_msgSend(v9, "isOnline") & 1) == 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        connectedAMSPeripherals = self->connectedAMSPeripherals;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(connectedAMSPeripherals);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              if ((objc_msgSend((id)objc_msgSend(v15, "uuid"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString")) & 1) != 0)
              {
                v9 = v15;
                goto LABEL_15;
              }
            }
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAMSPeripherals, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_15:
        v16 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
        if (v16)
        {
          if (v9)
          {
            v17 = v16;
            v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(v18, "setValue:forKey:", objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"), CFSTR("BLE MIDI Device UUID"));
            v19 = objc_msgSend(v9, "name");
            objc_msgSend(v18, "setValue:forKey:", v19, *MEMORY[0x24BDBFBF8]);
            objc_msgSend(v18, "setValue:forKey:", &unk_24CF62B70, CFSTR("MIDI Local Peripheral"));
            objc_msgSend(v18, "setValue:forKey:", &unk_24CF62B88, CFSTR("MIDI Remote Peripheral"));
            if (-[AMSBTLEConnectionManager peripheralIsConnectedCentral:](self, "peripheralIsConnectedCentral:", a3))
            {
              NSLog(CFSTR("Already acting as a peripheral to this Bluetooth entity. Canceling connect request."));
            }
            else
            {
              NSLog(CFSTR("Instructing the driver to connect to peripheral with UUID %@"), objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString"));
              MIDIObjectSetDictionaryProperty(v17, CFSTR("BLE MIDI Remote Peripheral"), (CFDictionaryRef)v18);
              sleep(1u);
              NSLog(CFSTR("Disconnecting from UI for peripheral %@. The driver will manage the connection."), a3);
              -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
            }
          }
          else
          {
            NSLog(CFSTR("Could not locate the peripheral in the list of connected peripherals. Canceling connect request."));
          }
        }
        else
        {
          NSLog(CFSTR("Could not communicate with the Bluetooth driver to connect."));
        }
      }
    }
  }
}

- (id)amsPeripheralForCBPeripheral:(id)a3
{
  uint64_t v4;
  NSMutableArray *peripheralList;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  peripheralList = self->peripheralList;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peripheralList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_4:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(peripheralList);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend((id)objc_msgSend(v10, "uuid"), "isEqualToString:", v4) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peripheralList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        goto LABEL_4;
      return v10;
    }
  }
}

- (void)removeAMSPeripheralForCBPeripheral:(id)a3
{
  id v5;
  id v6;
  BTLEConnectionTable *controller;

  NSLog(CFSTR("removeAMSPeripheralForCBPeripheral:%@"), a2, a3);
  v5 = -[AMSBTLEConnectionManager amsPeripheralForCBPeripheral:](self, "amsPeripheralForCBPeripheral:", a3);
  if (v5)
  {
    v6 = v5;
    controller = self->controller;
    objc_sync_enter(controller);
    -[NSMutableArray removeObject:](self->peripheralList, "removeObject:", v6);
    objc_sync_exit(controller);
    -[BTLEConnectionTable updatePeripheralTable](self->controller, "updatePeripheralTable");
  }
}

- (unsigned)midiDeviceForUUID:(id)a3
{
  ItemCount v4;
  ItemCount v5;
  ItemCount v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  CFTypeRef cf1;
  CFStringRef str;

  if (a3)
  {
    v4 = MIDIGetNumberOfDevices();
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = (const __CFString *)*MEMORY[0x24BDBFBF0];
      do
      {
        v8 = MIDIGetDevice(v6);
        if ((_DWORD)v8)
        {
          v9 = v8;
          str = 0;
          MIDIObjectGetStringProperty(v8, v7, &str);
          if (str)
          {
            if (CFEqual(str, CFSTR("com.apple.AppleMIDIBluetoothDriver")))
            {
              CFRelease(str);
              if ((objc_msgSend(MEMORY[0x24BDBFBE8], "deviceIsNullDevice:", v9) & 1) == 0
                && (objc_msgSend(MEMORY[0x24BDBFBE8], "deviceIsLocalPeripheral:", v9) & 1) == 0)
              {
                cf1 = 0;
                MIDIObjectGetStringProperty(v9, CFSTR("BLE MIDI Device UUID"), (CFStringRef *)&cf1);
                if (cf1)
                {
                  v10 = CFEqual(cf1, a3);
                  CFRelease(cf1);
                  if (v10)
                    return v9;
                }
              }
            }
            else if (str)
            {
              CFRelease(str);
            }
          }
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }
  LODWORD(v9) = 0;
  return v9;
}

- (BOOL)peripheralIsConnectedCentral:(id)a3
{
  MIDIObjectRef v4;
  void *v5;
  char v6;
  CFStringRef str;

  v4 = objc_msgSend(MEMORY[0x24BDBFBE8], "localPeripheral");
  str = 0;
  if (!v4)
    return 0;
  MIDIObjectGetStringProperty(v4, CFSTR("BLE MIDI Device UUID"), &str);
  if (!str)
    return 0;
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "UUIDString");
  v6 = objc_msgSend(v5, "isEqualToString:", str);
  CFRelease(str);
  return v6;
}

- (NSMutableArray)peripheralList
{
  return self->peripheralList;
}

@end
