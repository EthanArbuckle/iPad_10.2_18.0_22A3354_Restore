@implementation AFBTEvent

- (AFBTEvent)initWithMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AFBTEvent *v16;
  void *v18;
  id v19;
  uint64_t v20;
  void *v22;
  objc_super v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventDeviceTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = objc_msgSend(v4, "integerValue");
  else
    v20 = 0;
  v22 = v4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v5 = (void *)getBMDeviceBluetoothClass_softClass;
  v28 = getBMDeviceBluetoothClass_softClass;
  if (!getBMDeviceBluetoothClass_softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __getBMDeviceBluetoothClass_block_invoke;
    v24[3] = &unk_1E3A365A8;
    v24[4] = &v25;
    __getBMDeviceBluetoothClass_block_invoke((uint64_t)v24);
    v5 = (void *)v26[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v25, 8);
  v19 = [v6 alloc];
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventAddressKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventNameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventProductIdKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventStartingKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventBatteryLevelHeadphoneCaseKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventBatteryLevelHeadphoneRightKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventBatteryLevelHeadphoneLeftKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventBatteryLevelAppleAudioDeviceKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kAFBTEventBatteryLevelUserWearingKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v19, "initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:", v18, v7, v8, v9, v20, v10, v11, v12, v13, v14);

  v23.receiver = self;
  v23.super_class = (Class)AFBTEvent;
  v16 = -[AFEvent initWithBMEvent:](&v23, sel_initWithBMEvent_, v15);

  return v16;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (BOOL)hasProductID
{
  return self->_hasProductID;
}

- (void)setHasProductID:(BOOL)a3
{
  self->_hasProductID = a3;
}

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (NSNumber)batteryLevelHeadphoneCase
{
  return self->_batteryLevelHeadphoneCase;
}

- (BOOL)hasBatteryLevelHeadphoneCase
{
  return self->_hasBatteryLevelHeadphoneCase;
}

- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneCase = a3;
}

- (NSNumber)batteryLevelHeadphoneRight
{
  return self->_batteryLevelHeadphoneRight;
}

- (BOOL)hasBatteryLevelHeadphoneRight
{
  return self->_hasBatteryLevelHeadphoneRight;
}

- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneRight = a3;
}

- (NSNumber)batteryLevelHeadphoneLeft
{
  return self->_batteryLevelHeadphoneLeft;
}

- (BOOL)hasBatteryLevelHeadphoneLeft
{
  return self->_hasBatteryLevelHeadphoneLeft;
}

- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneLeft = a3;
}

- (BOOL)appleAudioDevice
{
  return self->_appleAudioDevice;
}

- (BOOL)hasAppleAudioDevice
{
  return self->_hasAppleAudioDevice;
}

- (void)setHasAppleAudioDevice:(BOOL)a3
{
  self->_hasAppleAudioDevice = a3;
}

- (BOOL)userWearing
{
  return self->_userWearing;
}

- (BOOL)hasUserWearing
{
  return self->_hasUserWearing;
}

- (void)setHasUserWearing:(BOOL)a3
{
  self->_hasUserWearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneLeft, 0);
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneRight, 0);
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneCase, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
