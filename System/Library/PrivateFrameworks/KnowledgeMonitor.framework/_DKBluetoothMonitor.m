@implementation _DKBluetoothMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  NSObject *v26;
  unint64_t v27;
  _BYTE v28[18];
  _BYTE buf[24];
  void *v30;
  id v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.bluetooth.pairing"));

    if (v7)
    {
      v27 = 0;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_State"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedLongLongValue");

      +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_DKBluetoothMonitor receiveNotificationEvent:].cold.2(v9, v10);

      v27 = bswap64(v9);
      LOWORD(v27) = HIWORD(v9);
      if (BTDeviceAddressToString())
      {
        +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[_DKBluetoothMonitor receiveNotificationEvent:].cold.1((uint64_t)&v27, v11, v12, v13, v14, v15, v16, v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28);
        v11 = objc_claimAutoreleasedReturnValue();
        +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = CFSTR("pairing");
          if ((v27 & 1) == 0)
            v19 = CFSTR("unpairing");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_219056000, v18, OS_LOG_TYPE_INFO, "Handling %@ of %@", buf, 0x16u);
        }

        if ((v27 & 1) == 0)
        {
          -[_DKMonitor queue](self, "queue");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = MEMORY[0x24BDAC760];
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __48___DKBluetoothMonitor_receiveNotificationEvent___block_invoke;
          v25[3] = &unk_24DA66D60;
          v25[4] = self;
          v11 = v11;
          v26 = v11;
          v22 = v25;
          v23 = (void *)os_transaction_create();
          *(_QWORD *)buf = v21;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_6;
          v30 = &unk_24DA66E28;
          v31 = v23;
          v32 = v22;
          v24 = v23;
          dispatch_async(v20, buf);

        }
      }

    }
  }
  objc_autoreleasePoolPop(v5);

}

- (_DKBluetoothMonitor)init
{
  _DKBluetoothMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMSource *source;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *activeConnections;
  uint64_t v16;
  NSMutableDictionary *inactiveConnections;
  uint64_t v18;
  NSMutableDictionary *previousVendorIDs;
  id v20;
  NSLock *v21;
  NSLock *connectionUpdateLock;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_DKBluetoothMonitor;
  v2 = -[_DKMonitor init](&v24, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Wireless");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Bluetooth");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = objc_claimAutoreleasedReturnValue();
    source = v2->_source;
    v2->_source = (BMSource *)v7;

    BiomeLibrary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "Device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "Wireless");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "Bluetooth");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pruner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKBluetoothMonitor setPruner:](v2, "setPruner:", v13);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    inactiveConnections = v2->_inactiveConnections;
    v2->_inactiveConnections = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    previousVendorIDs = v2->_previousVendorIDs;
    v2->_previousVendorIDs = (NSMutableDictionary *)v18;

    v20 = -[_DKBluetoothMonitor loadState](v2, "loadState");
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connectionUpdateLock = v2->_connectionUpdateLock;
    v2->_connectionUpdateLock = v21;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKBluetoothMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKBluetoothMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("BluetoothConnected");
}

+ (id)entitlements
{
  return 0;
}

+ (id)audioProductsBatteryLevels
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  void *v6;
  __int128 v7;
  CFIndex v8;
  const void *ValueAtIndex;
  const __CFDictionary *v10;
  const void *Value;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFNumber *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  void *v22;
  __int128 v23;
  unsigned int valuePtr;
  const void *v25;
  __int16 v26;
  const void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (IOPSCopyPowerSourcesByTypePrecise())
    return MEMORY[0x24BDBD1B8];
  v3 = IOPSCopyPowerSourcesList(0);
  if (!v3)
    return MEMORY[0x24BDBD1B8];
  v4 = v3;
  Count = CFArrayGetCount(v3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (Count >= 1)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412546;
    v23 = v7;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, v8);
      v10 = IOPSGetPowerSourceDescription(0, ValueAtIndex);
      Value = CFDictionaryGetValue(v10, CFSTR("Accessory Category"));
      v12 = CFDictionaryGetValue(v10, CFSTR("Part Identifier"));
      CFDictionaryGetValue(v10, CFSTR("Group Identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        break;
      objc_msgSend(v6, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);

      }
      valuePtr = 0;
      if (!Value)
        goto LABEL_24;
      if (!CFEqual(Value, CFSTR("Headphone")))
      {
        if (!v12 || !CFEqual(Value, CFSTR("Audio Battery Case")) || !CFEqual(v12, CFSTR("Case")))
          goto LABEL_24;
        v20 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Current Capacity"));
        CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", valuePtr);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneCase");
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v22 = (void *)v19;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19, v23);

LABEL_23:
        goto LABEL_24;
      }
      if (v12)
      {
        if (CFEqual(v12, CFSTR("Left")))
        {
          v16 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Current Capacity"));
          CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", valuePtr);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneLeft");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        if (CFEqual(v12, CFSTR("Right")))
        {
          v21 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Current Capacity"));
          CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", valuePtr);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneRight");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
LABEL_24:

      if (Count == ++v8)
        goto LABEL_25;
    }
    +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      valuePtr = v23;
      v25 = Value;
      v26 = 2112;
      v27 = v12;
      _os_log_error_impl(&dword_219056000, v17, OS_LOG_TYPE_ERROR, "Could not retrieve device address for connected device: %@ - %@", (uint8_t *)&valuePtr, 0x16u);
    }
    goto LABEL_23;
  }
LABEL_25:
  CFRelease(v4);
  CFRelease(0);
  return v6;
}

+ (id)_eventWithState:(BOOL)a3 name:(id)a4 address:(id)a5 type:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9 accessoryBatteryLevels:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v10 = a8;
  v11 = a7;
  v12 = *(_QWORD *)&a6;
  v14 = a4;
  v15 = a5;
  v16 = a10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE1B040], "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v14, v18);

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE1B040], "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v15, v19);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "deviceType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v20, v21);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "isAppleAudioDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v22, v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "isUserWearing");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v25);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "productID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v26, v27);

  objc_msgSend(v16, "objectForKeyedSubscript:", v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v30);

  }
  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "on");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "off");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "bluetoothIsConnectedStream");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "eventWithStream:startDate:endDate:value:metadata:", v33, v34, v35, v31, v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

+ (int)BMDeviceBluetoothDeviceTypeFromBTDeviceType:(int)a3
{
  if (a3 < 0x32)
    return a3 + 1;
  else
    return 0;
}

+ (id)_BMEventFromDKEvent:(id)a3 starting:(BOOL)a4 vendorID:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "deviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v11;
  if (v11)
    v31 = objc_msgSend((id)objc_opt_class(), "BMDeviceBluetoothDeviceTypeFromBTDeviceType:", objc_msgSend(v11, "intValue"));
  else
    v31 = 0;
  v12 = objc_alloc(MEMORY[0x24BE0C338]);
  objc_msgSend(v8, "metadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "address");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "valueForKey:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "valueForKey:", v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "productID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "valueForKey:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneCase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueForKey:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneRight");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "valueForKey:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "batteryLevelHeadphoneLeft");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "isAppleAudioDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B040], "isUserWearing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v12, "initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:", v41, v40, v26, v25, v31, v22, v20, v13, v15, v18, v7);

  return v32;
}

- (BOOL)_inEarStatusForDevice:(id)a3
{
  return 1;
}

- (void)updateCurrentBatteryLevels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[_DKBluetoothMonitor batteryLevels](self, "batteryLevels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[_DKBluetoothMonitor batteryLevels](self, "batteryLevels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[_DKBluetoothMonitor batteryLevels](self, "batteryLevels");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v4, "setValue:forKey:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  objc_msgSend((id)objc_opt_class(), "audioProductsBatteryLevels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v15, "allKeys", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValue:forKey:", v23, v21);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addEntriesFromDictionary:", v25);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  -[_DKBluetoothMonitor setBatteryLevels:](self, "setBatteryLevels:", v4);
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *batteryLevelPollingQueue;
  uint64_t v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *batteryLevelPollingTimer;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD handler[5];

  v3 = (void *)MEMORY[0x24BE0F9E0];
  -[_DKMonitor queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedInstanceQueue:", v4);

  v5 = (id)objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v6 = objc_alloc_init(MEMORY[0x24BDD1710]);
  -[_DKMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnderlyingQueue:", v7);

  if (!self->_batteryLevelPollingQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.duetknowledge.bluetoothBatteryPollingQueue", v8);
    batteryLevelPollingQueue = self->_batteryLevelPollingQueue;
    self->_batteryLevelPollingQueue = v9;

  }
  v11 = MEMORY[0x24BDAC760];
  if (!self->_batteryLevelPollingTimer)
  {
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_batteryLevelPollingQueue);
    batteryLevelPollingTimer = self->_batteryLevelPollingTimer;
    self->_batteryLevelPollingTimer = v12;

    v14 = self->_batteryLevelPollingTimer;
    handler[0] = v11;
    handler[1] = 3221225472;
    handler[2] = __28___DKBluetoothMonitor_start__block_invoke;
    handler[3] = &unk_24DA66D10;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_batteryLevelPollingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)self->_batteryLevelPollingTimer);
  }
  -[_DKBluetoothMonitor batteryLevels](self, "batteryLevels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[_DKBluetoothMonitor setBatteryLevels:](self, "setBatteryLevels:", MEMORY[0x24BDBD1B8]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BE0F948];
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __28___DKBluetoothMonitor_start__block_invoke_2;
  v27[3] = &unk_24DA673D8;
  v27[4] = self;
  v18 = (id)objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v17, 0, v6, v27);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE0F918];
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __28___DKBluetoothMonitor_start__block_invoke_4;
  v26[3] = &unk_24DA673D8;
  v26[4] = self;
  v21 = (id)objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", v20, 0, v6, v26);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BE0F958];
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __28___DKBluetoothMonitor_start__block_invoke_5;
  v25[3] = &unk_24DA673D8;
  v25[4] = self;
  v24 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v23, 0, v6, v25);

  self->_enabled = 1;
}

- (void)stop
{
  self->_enabled = 0;
  -[_DKBluetoothMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

+ (id)contextValueForBluetoothConnectionStatus:(BOOL)a3 name:(id)a4 address:(id)a5 deviceType:(int)a6 isAppleAudioDevice:(BOOL)a7 isUserWearing:(BOOL)a8 productID:(unsigned int)a9
{
  _BOOL8 v9;
  uint64_t v10;
  _BOOL8 v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;

  v31 = a8;
  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "bluetoothConnectionStatusKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObject:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "bluetoothNameKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v13, v20);

  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "bluetoothAddressKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v14, v21);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "bluetoothDeviceTypeKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v22, v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "bluetoothIsAppleAudioDeviceKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v24, v25);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "bluetoothIsUserWearingKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v27);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "bluetoothProductIDKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v28, v29);

  return v18;
}

+ (id)log
{
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, &__block_literal_global_7);
  return (id)log_log_2;
}

- (void)saveState
{
  NSMutableDictionary *activeConnections;
  NSMutableDictionary *inactiveConnections;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4;
  v12[4] = __Block_byref_object_dispose__4;
  activeConnections = self->_activeConnections;
  v17[0] = CFSTR("_DKBluetoothMonitor-activeConnections");
  v17[1] = CFSTR("_DKBluetoothMonitor-inactiveConnections");
  inactiveConnections = self->_inactiveConnections;
  v18[0] = activeConnections;
  v18[1] = inactiveConnections;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKMonitor queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32___DKBluetoothMonitor_saveState__block_invoke;
  v11[3] = &unk_24DA67010;
  v11[4] = self;
  v11[5] = v12;
  v7 = v11;
  v8 = v5;
  v9 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_24DA66E28;
  v15 = v9;
  v16 = v7;
  v10 = v9;
  dispatch_async(v8, block);

  _Block_object_dispose(v12, 8);
}

- (id)loadState
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_INFO, "load state called", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  -[_DKMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32___DKBluetoothMonitor_loadState__block_invoke;
  v7[3] = &unk_24DA66FE8;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(v4, v7);

  v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

- (void)handleUnpairingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)os_transaction_create();
  -[_DKBluetoothMonitor historicalDeletingHandler](self, "historicalDeletingHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD14C0];
    v9 = (void *)MEMORY[0x24BE1B0F8];
    objc_msgSend(MEMORY[0x24BE1B130], "bluetoothIsConnectedStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForEventsWithStreamName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v13 = (void *)MEMORY[0x24BE1B0F8];
    objc_msgSend(MEMORY[0x24BE1B040], "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForObjectsWithMetadataKey:andStringValue:", v14, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKBluetoothMonitor historicalDeletingHandler](self, "historicalDeletingHandler");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v17);

  }
  -[_DKBluetoothMonitor pruner](self, "pruner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __44___DKBluetoothMonitor_handleUnpairingEvent___block_invoke;
  v21[3] = &unk_24DA67138;
  v22 = v4;
  v20 = v4;
  objc_msgSend(v19, "deleteWithPolicy:eventsPassingTest:", CFSTR("forget-this-device"), v21);

}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableDictionary)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnections, a3);
}

- (NSMutableDictionary)inactiveConnections
{
  return self->_inactiveConnections;
}

- (void)setInactiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveConnections, a3);
}

- (NSMutableDictionary)previousVendorIDs
{
  return self->_previousVendorIDs;
}

- (void)setPreviousVendorIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previousVendorIDs, a3);
}

- (BMPruner)pruner
{
  return self->_pruner;
}

- (void)setPruner:(id)a3
{
  objc_storeStrong((id *)&self->_pruner, a3);
}

- (OS_dispatch_queue)batteryLevelPollingQueue
{
  return self->_batteryLevelPollingQueue;
}

- (void)setBatteryLevelPollingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelPollingQueue, a3);
}

- (OS_dispatch_source)batteryLevelPollingTimer
{
  return self->_batteryLevelPollingTimer;
}

- (void)setBatteryLevelPollingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelPollingTimer, a3);
}

- (NSDictionary)batteryLevels
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBatteryLevels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSLock)connectionUpdateLock
{
  return self->_connectionUpdateLock;
}

- (void)setConnectionUpdateLock:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUpdateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUpdateLock, 0);
  objc_storeStrong((id *)&self->_batteryLevels, 0);
  objc_storeStrong((id *)&self->_batteryLevelPollingTimer, 0);
  objc_storeStrong((id *)&self->_batteryLevelPollingQueue, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_previousVendorIDs, 0);
  objc_storeStrong((id *)&self->_inactiveConnections, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong(&self->historicalDeletingHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)receiveNotificationEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_219056000, a2, a3, "Failed to format address for com.apple.bluetooth.pairing 0x%{private}llx", a5, a6, a7, a8, 1u);
  OUTLINED_FUNCTION_1();
}

- (void)receiveNotificationEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134283521;
  v3 = a1;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "com.apple.bluetooth.pairing 0x%{private}llx", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
