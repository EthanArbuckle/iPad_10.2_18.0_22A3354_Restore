@implementation AKPeripheralAvailabilityManager_iOS

+ (BOOL)onlyDrawWithApplePencil
{
  return 0;
}

- (AKPeripheralAvailabilityManager_iOS)init
{
  AKPeripheralAvailabilityManager_iOS *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKPeripheralAvailabilityManager_iOS;
  result = -[AKPeripheralAvailabilityManager_iOS init](&v3, sel_init);
  if (result)
    result->_currentAvailability = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[AKPeripheralAvailabilityManager_iOS teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)AKPeripheralAvailabilityManager_iOS;
  -[AKPeripheralAvailabilityManager_iOS dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  MEMORY[0x24BEDD108](self, sel_stopMonitoringForPeripheralConnection);
}

- (void)postConnectionStatusNotification
{
  void *v3;
  id v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AKPeripheralAvailabilityManagerAvailabilityNotification"), self, 0);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_228FFB178;
    block[3] = &unk_24F1A7328;
    block[4] = self;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)startMonitoringForPeripheralConnection
{
  __IOHIDManager *v3;
  void *v4;
  void *v5;
  void *v6;
  __IOHIDManager *stylusHidManager;
  void *v8;
  __CFRunLoop *v9;
  CFDictionaryRef matching;

  if (!self->stylusHidManager)
  {
    v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    self->stylusHidManager = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      matching = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 76);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "VendorID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKey:](matching, "setObject:forKey:", v4, v5);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ProductIDArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKey:](matching, "setObject:forKey:", &unk_24F1CF0F0, v6);

      IOHIDManagerSetDeviceMatching(self->stylusHidManager, matching);
      IOHIDManagerOpen(self->stylusHidManager, 0);
      IOHIDManagerRegisterDeviceMatchingCallback(self->stylusHidManager, (IOHIDDeviceCallback)sub_228FFB338, self);
      IOHIDManagerRegisterDeviceRemovalCallback(self->stylusHidManager, (IOHIDDeviceCallback)sub_228FFB398, self);
      stylusHidManager = self->stylusHidManager;
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (__CFRunLoop *)objc_msgSend(v8, "getCFRunLoop");
      IOHIDManagerScheduleWithRunLoop(stylusHidManager, v9, (CFStringRef)*MEMORY[0x24BDBD598]);

    }
  }
}

- (void)stopMonitoringForPeripheralConnection
{
  __IOHIDManager *stylusHidManager;

  stylusHidManager = self->stylusHidManager;
  if (stylusHidManager)
  {
    CFRelease(stylusHidManager);
    self->stylusHidManager = 0;
  }
}

- (unint64_t)currentAvailability
{
  return self->_currentAvailability;
}

- (void)setCurrentAvailability:(unint64_t)a3
{
  self->_currentAvailability = a3;
}

@end
