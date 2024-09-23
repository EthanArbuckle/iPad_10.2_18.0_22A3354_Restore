@implementation AMSBTLEAdvertisementManager

- (AMSBTLEAdvertisementManager)init
{
  AMSBTLEAdvertisementManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSBTLEAdvertisementManager;
  v2 = -[AMSBTLEAdvertisementManager init](&v4, sel_init);
  if (v2)
    v2->peripheralManager = (CBPeripheralManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB280]), "initWithDelegate:queue:", v2, 0);
  return v2;
}

- (void)dealloc
{
  CBPeripheralManager *peripheralManager;
  objc_super v4;

  peripheralManager = self->peripheralManager;
  if (peripheralManager)
  {

    self->peripheralManager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSBTLEAdvertisementManager;
  -[AMSBTLEAdvertisementManager dealloc](&v4, sel_dealloc);
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  void *v4;
  uint64_t v5;

  if (a4)
  {
    NSLog(CFSTR("%@ : %@"), a2, a3, a4);
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
    objc_msgSend(v4, "postNotificationName:object:userInfo:", kAdvertisementNotification, 0, &unk_24CF62B20);
    NSLog(CFSTR("Advertising started successfully."), v5);
  }
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  objc_msgSend(a3, "respondToRequest:withResult:", a4, 0);
}

- (BOOL)isAdvertising
{
  return -[CBPeripheralManager isAdvertising](self->peripheralManager, "isAdvertising");
}

- (BOOL)isLECapableHardware
{
  uint64_t v2;
  const __CFString *v3;
  BOOL v4;
  const __CFString *v5;

  v2 = -[CBPeripheralManager state](self->peripheralManager, "state");
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
      NSLog(CFSTR("Peripheral manager state: %@"), v3);
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (void)advertiseMIDIService
{
  id v3;
  MIDIObjectRef v4;
  uint64_t v5;
  CFStringRef v6;
  uint64_t v7;
  CFStringRef str;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (-[CBPeripheralManager isAdvertising](self->peripheralManager, "isAdvertising"))
  {
    NSLog(CFSTR("Already advertising MIDI Service."));
  }
  else if (-[AMSBTLEAdvertisementManager isLECapableHardware](self, "isLECapableHardware"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
    str = 0;
    if (v4)
    {
      if (MIDIObjectGetStringProperty(v4, CFSTR("Bluetooth Advertising Name"), &str))
      {
        v5 = *MEMORY[0x24BDBAFC0];
        v6 = CFSTR("Bluetooth MIDI Device");
      }
      else
      {
        v6 = str;
        v5 = *MEMORY[0x24BDBAFC0];
      }
      objc_msgSend(v3, "setValue:forKey:", v6, v5);
      v9[0] = objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700"));
      v7 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      objc_msgSend(v3, "setValue:forKey:", v7, *MEMORY[0x24BDBAFE8]);
      NSLog(CFSTR("Starting advertisement..."));
      -[CBPeripheralManager startAdvertising:](self->peripheralManager, "startAdvertising:", v3);
      if (str)
        CFRelease(str);
    }
    else
    {
      NSLog(CFSTR("Can't communicate with driver node."));
    }
  }
  else
  {
    NSLog(CFSTR("Not in a Bluetooth LE capable mode. Advertising is disabled"));
  }
}

- (void)stopAdvertisingMIDIService
{
  void *v3;

  NSLog(CFSTR("Stopped advertising. However, other processes may still be advertising."), a2);
  -[CBPeripheralManager stopAdvertising](self->peripheralManager, "stopAdvertising");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:userInfo:", kAdvertisementNotification, 0, &unk_24CF62B48);
}

@end
