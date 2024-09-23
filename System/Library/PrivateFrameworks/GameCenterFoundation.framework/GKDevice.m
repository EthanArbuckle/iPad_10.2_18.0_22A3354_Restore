@implementation GKDevice

+ (id)currentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__GKDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_sDispatchOnceToken != -1)
    dispatch_once(&currentDevice_sDispatchOnceToken, block);
  return (id)currentDevice_sCurrentDevice;
}

void __25__GKDevice_currentDevice__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)currentDevice_sCurrentDevice;
  currentDevice_sCurrentDevice = (uint64_t)v1;

}

- (GKDevice)init
{
  GKDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *gameKitVersion;
  uint64_t v9;
  NSString *versionlessDeviceType;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKDevice;
  v2 = -[GKDevice init](&v12, sel_init);
  if (v2)
  {
    GKGameKitBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "infoDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C9AE90]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("GameKit-%@"), v6);
      gameKitVersion = v2->_gameKitVersion;
      v2->_gameKitVersion = (NSString *)v7;

    }
    v2->_gameKitAvailable = 1;
    -[GKDevice _initPlatform](v2, "_initPlatform");
    if (!v2->_deviceType)
    {
      v2->_deviceType = (NSString *)CFSTR("Unknown");

    }
    if (!v2->_buildVersion)
    {
      v2->_buildVersion = (NSString *)CFSTR("Unknown");

    }
    if (!v2->_osVersion)
    {
      v2->_osVersion = (NSString *)CFSTR("Unknown");

    }
    if (!v2->_gameKitVersion)
    {
      v2->_gameKitVersion = (NSString *)CFSTR("Unknown");

    }
    +[GKDevice zeroOutVersionWithDeviceType:](GKDevice, "zeroOutVersionWithDeviceType:", v2->_deviceType);
    v9 = objc_claimAutoreleasedReturnValue();
    versionlessDeviceType = v2->_versionlessDeviceType;
    v2->_versionlessDeviceType = (NSString *)v9;

  }
  return v2;
}

- (NSString)udid
{
  NSString *v3;
  NSString *udid;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKDevice _platformUDID](self, "_platformUDID");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    udid = self->_udid;
    self->_udid = v3;

  }
  return self->_udid;
}

- (id)deviceTypeForUserAgent
{
  void *v3;
  void *v4;

  +[GKPreferences shared](GKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "requestHeadersPrivacyEnabled") & 1) != 0)
    -[GKDevice versionlessDeviceType](self, "versionlessDeviceType");
  else
    -[GKDevice deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userAgentWithProcessName:(id)a3 protocolVersion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 256);
  objc_msgSend(v9, "appendString:", v8);

  objc_msgSend(v9, "appendString:", CFSTR("/"));
  objc_msgSend(v9, "appendString:", v7);

  objc_msgSend(v9, "appendString:", CFSTR(" ("));
  -[GKDevice deviceTypeForUserAgent](self, "deviceTypeForUserAgent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  objc_msgSend(v9, "appendString:", CFSTR("; "));
  -[GKDevice osVersion](self, "osVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v11);

  objc_msgSend(v9, "appendString:", CFSTR("; "));
  -[GKDevice buildVersion](self, "buildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v12);

  objc_msgSend(v9, "appendString:", CFSTR("; "));
  -[GKDevice gameKitVersion](self, "gameKitVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v13);

  objc_msgSend(v9, "appendString:", CFSTR(")"));
  return v9;
}

- (id)processNameHeader
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AE88]);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        v5 = CFSTR("GameKit");
    }

  }
  else
  {
    v5 = CFSTR("GameKit");
  }

  return v5;
}

- (id)buildVersionHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 256);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDevice deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("; "));
  -[GKDevice buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR("; "));
  -[GKDevice gameKitVersion](self, "gameKitVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  return v3;
}

- (id)platformBuildVersion
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 256);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("iOS"));
  objc_msgSend(v3, "appendString:", CFSTR("."));
  -[GKDevice osVersion](self, "osVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("."));
  -[GKDevice buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_2);
  return isInternalBuild_isInternalInstall;
}

uint64_t __27__GKDevice_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalBuild_isInternalInstall = result;
  return result;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)gameKitVersion
{
  return self->_gameKitVersion;
}

- (BOOL)isGameKitAvailable
{
  return self->_gameKitAvailable;
}

- (NSString)versionlessDeviceType
{
  return self->_versionlessDeviceType;
}

- (void)setVersionlessDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_versionlessDeviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionlessDeviceType, 0);
  objc_storeStrong((id *)&self->_gameKitVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_udid, 0);
}

- (void)_initPlatform
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *deviceType;
  NSString *v7;
  NSString *osVersion;
  NSString *v9;
  NSString *buildVersion;
  void *v11;
  NSObject *v12;
  id v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  NSString *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("ProductType");
  v23[1] = CFSTR("ProductVersion");
  v23[2] = CFSTR("BuildVersion");
  v23[3] = CFSTR("ipad");
  v23[4] = CFSTR("gamekit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MGCopyMultipleAnswers();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductType"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceType = self->_deviceType;
  self->_deviceType = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  osVersion = self->_osVersion;
  self->_osVersion = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  buildVersion = self->_buildVersion;
  self->_buildVersion = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gamekit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_gameKitAvailable = objc_msgSend(v11, "BOOLValue");

  v12 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v13 = GKOSLoggers();
    v12 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = self->_deviceType;
    v15 = self->_osVersion;
    v16 = self->_buildVersion;
    v17 = 138412802;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Game Center DeviceType:%@, OS:%@ Build:%@", (uint8_t *)&v17, 0x20u);
  }

}

- (id)_platformUDID
{
  if (_platformUDID_onceToken != -1)
    dispatch_once(&_platformUDID_onceToken, &__block_literal_global_48);
  if (!self->_udid)
    objc_storeStrong((id *)&self->_udid, (id)_platformUDID_uuid);
  return (id)_platformUDID_uuid;
}

void __44__GKDevice_PlatformDependent___platformUDID__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_platformUDID_uuid;
  _platformUDID_uuid = v0;

}

- (BOOL)isDevelopmentDevice
{
  if (isDevelopmentDevice_onceToken != -1)
    dispatch_once(&isDevelopmentDevice_onceToken, &__block_literal_global_12);
  return isDevelopmentDevice_isDevelopment;
}

void __50__GKDevice_PlatformDependent__isDevelopmentDevice__block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  isDevelopmentDevice_isDevelopment = objc_msgSend(v0, "fileExistsAtPath:", CFSTR("/Developer"));

}

- (BOOL)isFocusDevice
{
  if (isFocusDevice_onceToken != -1)
    dispatch_once(&isFocusDevice_onceToken, &__block_literal_global_16);
  return 0;
}

- (BOOL)isProductType:(unsigned int)a3
{
  return MGGetProductType() == a3;
}

+ (id)zeroOutVersionWithDeviceType:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = sub_1BCF15628();
  static GKDevice.zeroOutVersion(deviceType:)(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1BCF15604();
  swift_bridgeObjectRelease();
  return v4;
}

@end
