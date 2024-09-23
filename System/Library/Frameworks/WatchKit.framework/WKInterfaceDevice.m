@implementation WKInterfaceDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  return (id)currentDevice___currentDevice;
}

void __34__WKInterfaceDevice_currentDevice__block_invoke()
{
  WKInterfaceDevice *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double *v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v0 = objc_alloc_init(WKInterfaceDevice);
  v1 = (void *)currentDevice___currentDevice;
  currentDevice___currentDevice = (uint64_t)v0;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v5 = (_QWORD *)getNRDevicePropertyMainScreenWidthSymbolLoc_ptr;
  v35 = getNRDevicePropertyMainScreenWidthSymbolLoc_ptr;
  if (!getNRDevicePropertyMainScreenWidthSymbolLoc_ptr)
  {
    v6 = (void *)NanoRegistryLibrary();
    v5 = dlsym(v6, "NRDevicePropertyMainScreenWidth");
    v33[3] = (uint64_t)v5;
    getNRDevicePropertyMainScreenWidthSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v32, 8);
  if (!v5)
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_1();
  objc_msgSend(v4, "valueForProperty:", *v5, v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v8 = (_QWORD *)getNRDevicePropertyMainScreenHeightSymbolLoc_ptr;
  v35 = getNRDevicePropertyMainScreenHeightSymbolLoc_ptr;
  if (!getNRDevicePropertyMainScreenHeightSymbolLoc_ptr)
  {
    v9 = (void *)NanoRegistryLibrary();
    v8 = dlsym(v9, "NRDevicePropertyMainScreenHeight");
    v33[3] = (uint64_t)v8;
    getNRDevicePropertyMainScreenHeightSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v32, 8);
  if (!v8)
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_2();
  objc_msgSend(v4, "valueForProperty:", *v8, v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v11 = (_QWORD *)getNRDevicePropertyScreenScaleSymbolLoc_ptr;
  v35 = getNRDevicePropertyScreenScaleSymbolLoc_ptr;
  if (!getNRDevicePropertyScreenScaleSymbolLoc_ptr)
  {
    v12 = (void *)NanoRegistryLibrary();
    v11 = dlsym(v12, "NRDevicePropertyScreenScale");
    v33[3] = (uint64_t)v11;
    getNRDevicePropertyScreenScaleSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v32, 8);
  if (!v11)
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_3();
  objc_msgSend(v4, "valueForProperty:", *v11, v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "floatValue");
    v16 = v15;
  }
  else
  {
    v16 = 2.0;
  }
  objc_msgSend((id)currentDevice___currentDevice, "setScreenScale:", v16);
  v17 = (double *)MEMORY[0x24BDBEFB0];
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v19 = v18;
    objc_msgSend((id)currentDevice___currentDevice, "screenScale");
    v21 = v19 / v20;
  }
  else
  {
    v21 = 156.0;
  }
  v22 = *v17;
  v23 = v17[1];
  v24 = 195.0;
  if (v10)
  {
    objc_msgSend(v10, "floatValue");
    v26 = v25;
    objc_msgSend((id)currentDevice___currentDevice, "screenScale");
    v24 = v26 / v27;
  }
  objc_msgSend((id)currentDevice___currentDevice, "setScreenBounds:", v22, v23, v21, v24);
  objc_msgSend((id)currentDevice___currentDevice, "screenBounds");
  if (v28 < 195.0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v29 = (_QWORD *)getUIContentSizeCategorySmallSymbolLoc_ptr;
    v35 = getUIContentSizeCategorySmallSymbolLoc_ptr;
    if (!getUIContentSizeCategorySmallSymbolLoc_ptr)
    {
      v31 = (void *)UIKitLibrary();
      v29 = dlsym(v31, "UIContentSizeCategorySmall");
      v33[3] = (uint64_t)v29;
      getUIContentSizeCategorySmallSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v32, 8);
    if (!v29)
      __34__WKInterfaceDevice_currentDevice__block_invoke_cold_5();
  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v29 = (_QWORD *)getUIContentSizeCategoryLargeSymbolLoc_ptr;
    v35 = getUIContentSizeCategoryLargeSymbolLoc_ptr;
    if (!getUIContentSizeCategoryLargeSymbolLoc_ptr)
    {
      v30 = (void *)UIKitLibrary();
      v29 = dlsym(v30, "UIContentSizeCategoryLarge");
      v33[3] = (uint64_t)v29;
      getUIContentSizeCategoryLargeSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v32, 8);
    if (!v29)
      __34__WKInterfaceDevice_currentDevice__block_invoke_cold_4();
  }
  objc_msgSend((id)currentDevice___currentDevice, "setPreferredContentSizeCategory:", *v29, v32);

}

- (NSString)systemVersion
{
  NSString *deviceSystemVersion;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  deviceSystemVersion = self->_deviceSystemVersion;
  if (!deviceSystemVersion)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v7 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
    v16 = getNRDevicePropertySystemVersionSymbolLoc_ptr;
    if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v7 = (id *)dlsym(v8, "NRDevicePropertySystemVersion");
      v14[3] = (uint64_t)v7;
      getNRDevicePropertySystemVersionSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v13, 8);
    if (!v7)
      -[WKInterfaceDevice systemVersion].cold.1();
    v9 = *v7;
    objc_msgSend(v6, "valueForProperty:", v9, v13);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_deviceSystemVersion;
    self->_deviceSystemVersion = v10;

    deviceSystemVersion = self->_deviceSystemVersion;
  }
  return deviceSystemVersion;
}

- (NSString)name
{
  NSString *deviceName;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  deviceName = self->_deviceName;
  if (!deviceName)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v7 = (id *)getNRDevicePropertyNameSymbolLoc_ptr;
    v16 = getNRDevicePropertyNameSymbolLoc_ptr;
    if (!getNRDevicePropertyNameSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v7 = (id *)dlsym(v8, "NRDevicePropertyName");
      v14[3] = (uint64_t)v7;
      getNRDevicePropertyNameSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v13, 8);
    if (!v7)
      -[WKInterfaceDevice name].cold.1();
    v9 = *v7;
    objc_msgSend(v6, "valueForProperty:", v9, v13);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_deviceName;
    self->_deviceName = v10;

    deviceName = self->_deviceName;
  }
  return deviceName;
}

- (NSString)model
{
  NSString *deviceModel;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  deviceModel = self->_deviceModel;
  if (!deviceModel)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    getNRDevicePropertyLocalizedModel();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_deviceModel;
    self->_deviceModel = v8;

    deviceModel = self->_deviceModel;
  }
  return deviceModel;
}

- (NSString)localizedModel
{
  NSString *deviceLocalizedModel;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  deviceLocalizedModel = self->_deviceLocalizedModel;
  if (!deviceLocalizedModel)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    getNRDevicePropertyLocalizedModel();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_deviceLocalizedModel;
    self->_deviceLocalizedModel = v8;

    deviceLocalizedModel = self->_deviceLocalizedModel;
  }
  return deviceLocalizedModel;
}

- (NSString)systemName
{
  NSString *deviceSystemName;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  deviceSystemName = self->_deviceSystemName;
  if (!deviceSystemName)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v7 = (id *)getNRDevicePropertySystemNameSymbolLoc_ptr;
    v17 = getNRDevicePropertySystemNameSymbolLoc_ptr;
    if (!getNRDevicePropertySystemNameSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v7 = (id *)dlsym(v8, "NRDevicePropertySystemName");
      v15[3] = (uint64_t)v7;
      getNRDevicePropertySystemNameSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v14, 8);
    if (!v7)
      -[WKInterfaceDevice systemName].cold.1();
    v9 = *v7;
    objc_msgSend(v6, "valueForProperty:", v9, v14);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_deviceSystemName;
    self->_deviceSystemName = v10;

    if (-[NSString isEqualToString:](self->_deviceSystemName, "isEqualToString:", CFSTR("Watch OS")))
    {
      v12 = self->_deviceSystemName;
      self->_deviceSystemName = (NSString *)CFSTR("watchOS");

    }
    deviceSystemName = self->_deviceSystemName;
  }
  return deviceSystemName;
}

- (BOOL)addCachedImage:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;

  v5 = a4;
  if (a3)
  {
    +[SPRemoteInterface SerializablePropertyValue:](SPRemoteInterface, "SerializablePropertyValue:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copy");
    v9 = objc_msgSend(v7, "addImageToPermanentCache:withName:", v6, v8);

  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WKInterfaceDevice addCachedImage:name:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)addCachedImageWithData:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copy");
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = objc_msgSend(v7, "addImageToPermanentCache:withName:", v8, v9);

  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceDevice addCachedImageWithData:name:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (void)removeCachedImageWithName:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v5, "removeImageFromPermanentCacheWithName:", v4);
}

- (void)removeAllCachedImages
{
  id v2;

  +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllImagesFromPermanentCache");

}

- (NSDictionary)cachedImages
{
  void *v2;
  void *v3;

  +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (CGRect)screenBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_screenBounds.origin.x;
  y = self->_screenBounds.origin.y;
  width = self->_screenBounds.size.width;
  height = self->_screenBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (BOOL)isBatteryMonitoringEnabled
{
  return self->_batteryMonitoringEnabled;
}

- (void)setBatteryMonitoringEnabled:(BOOL)a3
{
  self->_batteryMonitoringEnabled = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)wristLocation
{
  return self->_wristLocation;
}

- (int64_t)crownOrientation
{
  return self->_crownOrientation;
}

- (NSString)deviceSystemVersion
{
  return self->_deviceSystemVersion;
}

- (void)setDeviceSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deviceLocalizedModel
{
  return self->_deviceLocalizedModel;
}

- (void)setDeviceLocalizedModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)deviceSystemName
{
  return self->_deviceSystemName;
}

- (void)setDeviceSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSystemName, 0);
  objc_storeStrong((id *)&self->_deviceLocalizedModel, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceSystemVersion, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyMainScreenWidth(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyMainScreenHeight(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyScreenScale(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getUIContentSizeCategoryLarge(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getUIContentSizeCategorySmall(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)systemVersion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)name
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)systemName
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 47, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)addCachedImage:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error: WKInterfaceDevice, addCachedImageWithData - image is nil", v2, v3, v4, v5, v6);
}

- (void)addCachedImageWithData:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error: WKInterfaceDevice addCachedImageWithData:name: - imageData is nil", v2, v3, v4, v5, v6);
}

@end
