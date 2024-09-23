@implementation AXMDeviceInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_36);
  return (id)sharedInstance_Info;
}

void __31__AXMDeviceInfo_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXMDeviceInfo _init]([AXMDeviceInfo alloc], "_init");
  v1 = (void *)sharedInstance_Info;
  sharedInstance_Info = (uint64_t)v0;

}

- (id)_init
{
  AXMDeviceInfo *v2;
  AXMDeviceInfo *v3;
  _QWORD block[4];
  AXMDeviceInfo *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMDeviceInfo;
  v2 = -[AXMDeviceInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__AXMDeviceInfo__init__block_invoke;
    block[3] = &unk_1E625CCC0;
    v6 = v2;
    if (_init__AXIsInternalInstallOnceToken != -1)
      dispatch_once(&_init__AXIsInternalInstallOnceToken, block);

  }
  return v3;
}

void __22__AXMDeviceInfo__init__block_invoke(uint64_t a1)
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID())
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = CFBooleanGetValue(v3) != 0;
    CFRelease(v3);
  }
}

- (NSNumber)supportsARM64
{
  NSNumber *v3;
  NSNumber *supportsARM64;

  if (!self->_supportsARM64)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supportsARM64 = self->_supportsARM64;
    self->_supportsARM64 = v3;

  }
  return self->_supportsARM64;
}

- (NSNumber)supportsARMv6
{
  NSNumber *v3;
  NSNumber *supportsARMv6;

  if (!self->_supportsARMv6)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supportsARMv6 = self->_supportsARMv6;
    self->_supportsARMv6 = v3;

  }
  return self->_supportsARMv6;
}

- (NSNumber)supportsARMv7
{
  NSNumber *v3;
  NSNumber *supportsARMv7;

  if (!self->_supportsARMv7)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supportsARMv7 = self->_supportsARMv7;
    self->_supportsARMv7 = v3;

  }
  return self->_supportsARMv7;
}

- (NSNumber)supportsARMv7s
{
  NSNumber *v3;
  NSNumber *supportsARMv7s;

  if (!self->_supportsARMv7s)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supportsARMv7s = self->_supportsARMv7s;
    self->_supportsARMv7s = v3;

  }
  return self->_supportsARMv7s;
}

- (NSString)cpuArchitecture
{
  __CFString *v3;
  NSString *cpuArchitecture;

  if (!self->_cpuArchitecture)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    cpuArchitecture = self->_cpuArchitecture;
    self->_cpuArchitecture = &v3->isa;

  }
  return self->_cpuArchitecture;
}

- (NSNumber)processorCount
{
  void *processorCount;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  processorCount = self->_processorCount;
  if (!processorCount)
  {
    if (self->_isInternalInstall)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      processorCount = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(processorCount, "processorCount"));
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v6 = self->_processorCount;
      self->_processorCount = v5;

    }
    else
    {
      self->_processorCount = (NSNumber *)&unk_1E6288AE0;
    }

  }
  return self->_processorCount;
}

- (NSNumber)physicalMemory
{
  void *physicalMemory;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  physicalMemory = self->_physicalMemory;
  if (!physicalMemory)
  {
    if (self->_isInternalInstall)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      physicalMemory = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(physicalMemory, "physicalMemory"));
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v6 = self->_physicalMemory;
      self->_physicalMemory = v5;

    }
    else
    {
      self->_physicalMemory = (NSNumber *)&unk_1E6288AE0;
    }

  }
  return self->_physicalMemory;
}

- (NSNumber)supports720pPlayback
{
  NSNumber *v3;
  NSNumber *supports720pPlayback;

  if (!self->_supports720pPlayback)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supports720pPlayback = self->_supports720pPlayback;
    self->_supports720pPlayback = v3;

  }
  return self->_supports720pPlayback;
}

- (NSNumber)supports1080pPlayback
{
  NSNumber *v3;
  NSNumber *supports1080pPlayback;

  if (!self->_supports1080pPlayback)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    supports1080pPlayback = self->_supports1080pPlayback;
    self->_supports1080pPlayback = v3;

  }
  return self->_supports1080pPlayback;
}

- (NSNumber)hasAmbientLightSensor
{
  NSNumber *v3;
  NSNumber *hasAmbientLightSensor;

  if (!self->_hasAmbientLightSensor)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    hasAmbientLightSensor = self->_hasAmbientLightSensor;
    self->_hasAmbientLightSensor = v3;

  }
  return self->_hasAmbientLightSensor;
}

- (NSNumber)hasDualLensCamera
{
  NSNumber *v3;
  NSNumber *hasDualLensCamera;

  if (!self->_hasDualLensCamera)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSNumber *)&unk_1E6288AE0;
    }
    hasDualLensCamera = self->_hasDualLensCamera;
    self->_hasDualLensCamera = v3;

  }
  return self->_hasDualLensCamera;
}

- (NSDictionary)displayZoomSizes
{
  NSDictionary *v3;
  NSDictionary *displayZoomSizes;

  if (!self->_displayZoomSizes)
  {
    if (self->_isInternalInstall)
      v3 = (NSDictionary *)MGCopyAnswer();
    else
      v3 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    displayZoomSizes = self->_displayZoomSizes;
    self->_displayZoomSizes = v3;

  }
  return self->_displayZoomSizes;
}

- (NSString)buildVersion
{
  __CFString *v3;
  NSString *buildVersion;

  if (!self->_buildVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    buildVersion = self->_buildVersion;
    self->_buildVersion = &v3->isa;

  }
  return self->_buildVersion;
}

- (NSString)computerName
{
  __CFString *v3;
  NSString *computerName;

  if (!self->_computerName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    computerName = self->_computerName;
    self->_computerName = &v3->isa;

  }
  return self->_computerName;
}

- (NSString)deviceName
{
  __CFString *v3;
  NSString *deviceName;

  if (!self->_deviceName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceName = self->_deviceName;
    self->_deviceName = &v3->isa;

  }
  return self->_deviceName;
}

- (NSString)deviceNameClassic
{
  __CFString *v3;
  NSString *deviceNameClassic;

  if (!self->_deviceNameClassic)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceNameClassic = self->_deviceNameClassic;
    self->_deviceNameClassic = &v3->isa;

  }
  return self->_deviceNameClassic;
}

- (NSString)deviceNameGS
{
  __CFString *v3;
  NSString *deviceNameGS;

  if (!self->_deviceNameGS)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceNameGS = self->_deviceNameGS;
    self->_deviceNameGS = &v3->isa;

  }
  return self->_deviceNameGS;
}

- (NSString)deviceNameLocalized
{
  __CFString *v3;
  NSString *deviceNameLocalized;

  if (!self->_deviceNameLocalized)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceNameLocalized = self->_deviceNameLocalized;
    self->_deviceNameLocalized = &v3->isa;

  }
  return self->_deviceNameLocalized;
}

- (NSString)deviceClass
{
  __CFString *v3;
  NSString *deviceClass;

  if (!self->_deviceClass)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceClass = self->_deviceClass;
    self->_deviceClass = &v3->isa;

  }
  return self->_deviceClass;
}

- (NSString)deviceVariant
{
  __CFString *v3;
  NSString *deviceVariant;

  if (!self->_deviceVariant)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceVariant = self->_deviceVariant;
    self->_deviceVariant = &v3->isa;

  }
  return self->_deviceVariant;
}

- (NSString)hardwareModel
{
  __CFString *v3;
  NSString *hardwareModel;

  if (!self->_hardwareModel)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    hardwareModel = self->_hardwareModel;
    self->_hardwareModel = &v3->isa;

  }
  return self->_hardwareModel;
}

- (NSString)deviceModelNumber
{
  __CFString *v3;
  NSString *deviceModelNumber;

  if (!self->_deviceModelNumber)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    deviceModelNumber = self->_deviceModelNumber;
    self->_deviceModelNumber = &v3->isa;

  }
  return self->_deviceModelNumber;
}

- (NSString)marketingName
{
  __CFString *v3;
  NSString *marketingName;

  if (!self->_marketingName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    marketingName = self->_marketingName;
    self->_marketingName = &v3->isa;

  }
  return self->_marketingName;
}

- (NSString)marketingProductName
{
  __CFString *v3;
  NSString *marketingProductName;

  if (!self->_marketingProductName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    marketingProductName = self->_marketingProductName;
    self->_marketingProductName = &v3->isa;

  }
  return self->_marketingProductName;
}

- (NSString)marketingVersion
{
  __CFString *v3;
  NSString *marketingVersion;

  if (!self->_marketingVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    marketingVersion = self->_marketingVersion;
    self->_marketingVersion = &v3->isa;

  }
  return self->_marketingVersion;
}

- (NSString)productName
{
  __CFString *v3;
  NSString *productName;

  if (!self->_productName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    productName = self->_productName;
    self->_productName = &v3->isa;

  }
  return self->_productName;
}

- (NSString)productType
{
  __CFString *v3;
  NSString *productType;

  if (!self->_productType)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    productType = self->_productType;
    self->_productType = &v3->isa;

  }
  return self->_productType;
}

- (NSString)productVersion
{
  __CFString *v3;
  NSString *productVersion;

  if (!self->_productVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E6260C18;
    }
    productVersion = self->_productVersion;
    self->_productVersion = &v3->isa;

  }
  return self->_productVersion;
}

- (NSValue)mainScreenSizeWidth
{
  NSValue *v3;
  NSValue *mainScreenSizeWidth;

  if (!self->_mainScreenSizeWidth)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", MGGetSInt32Answer());
      v3 = (NSValue *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSValue *)&unk_1E6288AE0;
    }
    mainScreenSizeWidth = self->_mainScreenSizeWidth;
    self->_mainScreenSizeWidth = v3;

  }
  return self->_mainScreenSizeWidth;
}

- (NSValue)mainScreenSizeHeight
{
  NSValue *v3;
  NSValue *mainScreenSizeHeight;

  if (!self->_mainScreenSizeHeight)
  {
    if (self->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", MGGetSInt32Answer());
      v3 = (NSValue *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSValue *)&unk_1E6288AE0;
    }
    mainScreenSizeHeight = self->_mainScreenSizeHeight;
    self->_mainScreenSizeHeight = v3;

  }
  return self->_mainScreenSizeHeight;
}

- (NSNumber)mainScreenScale
{
  void *v3;
  NSNumber *v4;
  NSNumber *mainScreenScale;

  if (!self->_mainScreenScale)
  {
    if (self->_isInternalInstall)
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      MGGetFloat32Answer();
      objc_msgSend(v3, "numberWithFloat:");
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (NSNumber *)&unk_1E6288AE0;
    }
    mainScreenScale = self->_mainScreenScale;
    self->_mainScreenScale = v4;

  }
  return self->_mainScreenScale;
}

- (NSNumber)mainScreenOrientation
{
  void *v3;
  NSNumber *v4;
  NSNumber *mainScreenOrientation;

  if (!self->_mainScreenOrientation)
  {
    if (self->_isInternalInstall)
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      MGGetFloat32Answer();
      objc_msgSend(v3, "numberWithFloat:");
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (NSNumber *)&unk_1E6288AE0;
    }
    mainScreenOrientation = self->_mainScreenOrientation;
    self->_mainScreenOrientation = v4;

  }
  return self->_mainScreenOrientation;
}

- (id)_jetsamInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/LaunchDaemons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 0, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (!v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (!v7)
      goto LABEL_17;
    v8 = v7;
    v18 = v4;
    v19 = v3;
    v20 = v2;
    v9 = *(_QWORD *)v23;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      objc_msgSend(v11, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("plist")))
        goto LABEL_13;
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsString:", CFSTR("com.apple.jetsamproperties"));

      if (v14)
        break;
LABEL_14:
      if (v8 == ++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (!v8)
        {
          v3 = v19;
          v2 = v20;
          v4 = v18;
          v5 = 0;
          goto LABEL_17;
        }
        goto LABEL_6;
      }
    }
    v15 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v11, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v15, "initWithContentsOfFile:", v16);

    if (v12)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v11);
LABEL_13:

    goto LABEL_14;
  }
  AXMediaLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v5, v6);
LABEL_17:

  return v21;
}

- (id)systemReport
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  if (self->_isInternalInstall)
  {
    v23 = (void *)MEMORY[0x1E0CB37A0];
    -[AXMDeviceInfo deviceName](self, "deviceName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceNameClassic](self, "deviceNameClassic");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceNameGS](self, "deviceNameGS");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceNameLocalized](self, "deviceNameLocalized");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo computerName](self, "computerName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo hardwareModel](self, "hardwareModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceClass](self, "deviceClass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceModelNumber](self, "deviceModelNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo deviceVariant](self, "deviceVariant");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo cpuArchitecture](self, "cpuArchitecture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo processorCount](self, "processorCount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo physicalMemory](self, "physicalMemory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo physicalMemory](self, "physicalMemory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v4 = v3 / 1000000.0;
    -[AXMDeviceInfo physicalMemory](self, "physicalMemory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v6 = v5 / 1000000000.0;
    -[AXMDeviceInfo mainScreenSizeWidth](self, "mainScreenSizeWidth");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo mainScreenSizeHeight](self, "mainScreenSizeHeight");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo mainScreenScale](self, "mainScreenScale");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo mainScreenOrientation](self, "mainScreenOrientation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo hasAmbientLightSensor](self, "hasAmbientLightSensor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo hasDualLensCamera](self, "hasDualLensCamera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo marketingName](self, "marketingName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo marketingProductName](self, "marketingProductName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo marketingVersion](self, "marketingVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo productName](self, "productName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo productType](self, "productType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo productVersion](self, "productVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDeviceInfo buildVersion](self, "buildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("----------------------------------\nAXMedia Utilities System Report:\n----------------------------------\n  Device:\n    Name: '%@' (classic:'%@') (GS:'%@') (Loc:'%@') (Computer:'%@')\n    Hardware Model: %@\n    Class: %@\n    Model Number: %@\n    Variant: %@\n  CPU:\n    Architecture: %@\n    # of Cores: %@\n  Memory:\n    Physical Memory: %@ (%.2f MB) (%.2f GB)\n  Display:\n    Size: %@ x %@\n    Scale: %@\n    Orientation: %@\n  Capabilities:\n    Has Ambient Light Sensor: %@\n    Has Dual Lens Camera: %@\n  Marketing:\n    Name: %@\n    Product Name: %@\n    Version: %@\n  Product:\n    Name: %@\n    Type: %@\n    Version: %@\n  Build:\n    Version: %@\n----------------------------------\n"), v37, v36, v35, v32, v34, v31, v33, v20, v30, v19, v29, v18, *(_QWORD *)&v4, *(_QWORD *)&v6, v28, v27,
      v26,
      v25,
      v17,
      v7,
      v16,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13);
    v24 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v24;
  }
  else
  {
    v14 = CFSTR("AXMedia Utilities System Report: <Redacted>");
  }
  return v14;
}

- (id)privilegedSystemReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[AXMDeviceInfo systemReport](self, "systemReport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("  Jetsam Info:\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDeviceInfo _jetsamInfo](self, "_jetsamInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke;
    v10[3] = &unk_1E625F670;
    v11 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@----------------------------------\n"), v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __39__AXMDeviceInfo_privilegedSystemReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "URLByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    %@:\n"), v8);

  objc_msgSend(v6, "objectForKey:", CFSTR("Version4"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("SystemXPCService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Override"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.accessibility.AccessibilityUIServer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("      com.apple.accessibility.AccessibilityUIServer:\n"));
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_2;
    v17[3] = &unk_1E625F648;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.AXMediaUtilitiesService"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("      com.apple.AXMediaUtilitiesService:\n"));
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_3;
    v15[3] = &unk_1E625F648;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
}

uint64_t __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("        %@ -> %@\n"), a2, a3);
}

uint64_t __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("        %@ -> %@\n"), a2, a3);
}

- (void)setSupportsARM64:(id)a3
{
  objc_storeStrong((id *)&self->_supportsARM64, a3);
}

- (void)setSupportsARMv6:(id)a3
{
  objc_storeStrong((id *)&self->_supportsARMv6, a3);
}

- (void)setSupportsARMv7:(id)a3
{
  objc_storeStrong((id *)&self->_supportsARMv7, a3);
}

- (void)setSupportsARMv7s:(id)a3
{
  objc_storeStrong((id *)&self->_supportsARMv7s, a3);
}

- (void)setSupports720pPlayback:(id)a3
{
  objc_storeStrong((id *)&self->_supports720pPlayback, a3);
}

- (void)setSupports1080pPlayback:(id)a3
{
  objc_storeStrong((id *)&self->_supports1080pPlayback, a3);
}

- (void)setCpuArchitecture:(id)a3
{
  objc_storeStrong((id *)&self->_cpuArchitecture, a3);
}

- (void)setProcessorCount:(id)a3
{
  objc_storeStrong((id *)&self->_processorCount, a3);
}

- (void)setPhysicalMemory:(id)a3
{
  objc_storeStrong((id *)&self->_physicalMemory, a3);
}

- (void)setHasAmbientLightSensor:(id)a3
{
  objc_storeStrong((id *)&self->_hasAmbientLightSensor, a3);
}

- (void)setHasDualLensCamera:(id)a3
{
  objc_storeStrong((id *)&self->_hasDualLensCamera, a3);
}

- (void)setDisplayZoomSizes:(id)a3
{
  objc_storeStrong((id *)&self->_displayZoomSizes, a3);
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (void)setComputerName:(id)a3
{
  objc_storeStrong((id *)&self->_computerName, a3);
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void)setDeviceNameClassic:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameClassic, a3);
}

- (void)setDeviceNameGS:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameGS, a3);
}

- (void)setDeviceNameLocalized:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameLocalized, a3);
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (void)setDeviceVariant:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVariant, a3);
}

- (void)setHardwareModel:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareModel, a3);
}

- (void)setDeviceModelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelNumber, a3);
}

- (void)setMarketingName:(id)a3
{
  objc_storeStrong((id *)&self->_marketingName, a3);
}

- (void)setMarketingProductName:(id)a3
{
  objc_storeStrong((id *)&self->_marketingProductName, a3);
}

- (void)setMarketingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_marketingVersion, a3);
}

- (void)setProductName:(id)a3
{
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (void)setMainScreenSizeWidth:(id)a3
{
  objc_storeStrong((id *)&self->_mainScreenSizeWidth, a3);
}

- (void)setMainScreenSizeHeight:(id)a3
{
  objc_storeStrong((id *)&self->_mainScreenSizeHeight, a3);
}

- (void)setMainScreenOrientation:(id)a3
{
  objc_storeStrong((id *)&self->_mainScreenOrientation, a3);
}

- (void)setMainScreenScale:(id)a3
{
  objc_storeStrong((id *)&self->_mainScreenScale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScreenScale, 0);
  objc_storeStrong((id *)&self->_mainScreenOrientation, 0);
  objc_storeStrong((id *)&self->_mainScreenSizeHeight, 0);
  objc_storeStrong((id *)&self->_mainScreenSizeWidth, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_marketingProductName, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_deviceVariant, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceNameLocalized, 0);
  objc_storeStrong((id *)&self->_deviceNameGS, 0);
  objc_storeStrong((id *)&self->_deviceNameClassic, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_displayZoomSizes, 0);
  objc_storeStrong((id *)&self->_hasDualLensCamera, 0);
  objc_storeStrong((id *)&self->_hasAmbientLightSensor, 0);
  objc_storeStrong((id *)&self->_physicalMemory, 0);
  objc_storeStrong((id *)&self->_processorCount, 0);
  objc_storeStrong((id *)&self->_cpuArchitecture, 0);
  objc_storeStrong((id *)&self->_supports1080pPlayback, 0);
  objc_storeStrong((id *)&self->_supports720pPlayback, 0);
  objc_storeStrong((id *)&self->_supportsARMv7s, 0);
  objc_storeStrong((id *)&self->_supportsARMv7, 0);
  objc_storeStrong((id *)&self->_supportsARMv6, 0);
  objc_storeStrong((id *)&self->_supportsARM64, 0);
}

@end
