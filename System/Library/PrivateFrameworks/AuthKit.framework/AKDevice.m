@implementation AKDevice

- (NSString)localUserUUID
{
  return 0;
}

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_48);
  return (id)currentDevice_currentDevice;
}

- (NSLocale)locale
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__AKDevice_locale__block_invoke;
  v5[3] = &unk_1E2E61828;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __18__AKDevice_locale__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSLocale *)v3;
}

id __18__AKDevice_locale__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 120) && *(_BYTE *)(v2 + 39))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 39) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 120);
}

- (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_113);
  return isInternalBuild_isInternalBuild;
}

- (NSString)serverFriendlyDescription
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AKDevice_serverFriendlyDescription__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __37__AKDevice_serverFriendlyDescription__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __37__AKDevice_serverFriendlyDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 72) && *(_BYTE *)(v2 + 33))
  {
    +[AKDevice _hardwareModel](AKDevice, "_hardwareModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    +[AKDevice _osName](AKDevice, "_osName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKDevice _osVersion](AKDevice, "_osVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKDevice _buildNumber](AKDevice, "_buildNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@;%@;%@"), v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C9AE90];
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C9AE90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "infoDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("1.0");
    if (v14)
      v19 = v14;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v16, v11, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v25, v7, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 72);
    *(_QWORD *)(v22 + 72) = v21;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 33) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 72);
}

+ (id)_osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

+ (id)_osName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

+ (id)_hardwareModel
{
  return (id)MGCopyAnswer();
}

+ (id)_buildNumber
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_systemVersionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_systemVersionDictionary
{
  if (_systemVersionDictionary_onceToken != -1)
    dispatch_once(&_systemVersionDictionary_onceToken, &__block_literal_global_89);
  return (id)_systemVersionDictionary_platformDictionary;
}

uint64_t __25__AKDevice_currentDevice__block_invoke()
{
  AKDevice *v0;
  void *v1;

  v0 = objc_alloc_init(AKDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

  objc_msgSend((id)currentDevice_currentDevice, "setLinkType:", 1);
  return objc_msgSend((id)currentDevice_currentDevice, "_setShouldUpdateToValue:", 1);
}

- (void)setLinkType:(unint64_t)a3
{
  self->_linkType = a3;
}

- (AKDevice)init
{
  AKDevice *v2;
  AKDevice *v3;
  NSLock *v4;
  NSLock *telephonyLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKDevice;
  v2 = -[AKDevice init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_unfairLock._os_unfair_lock_opaque = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    telephonyLock = v3->_telephonyLock;
    v3->_telephonyLock = v4;

    -[AKDevice _setShouldUpdateToValue:](v3, "_setShouldUpdateToValue:", 0);
  }
  return v3;
}

- (void)_setShouldUpdateToValue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x101010101010101 * a3;
  *(_QWORD *)&self->_shouldUpdateUniqueDeviceIdentifier = v3;
  *(_DWORD *)&self->_shouldUpdateROMAddress = v3;
}

uint64_t __27__AKDevice_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

void __36__AKDevice__systemVersionDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = _CFCopySystemVersionDictionary();
  v1 = (void *)_systemVersionDictionary_platformDictionary;
  _systemVersionDictionary_platformDictionary = v0;

}

+ (id)activeIDSPeerDevice
{
  void *v3;
  void *v4;
  AKDevice *v5;
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

  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(AKDevice);
    -[AKDevice setLinkType:](v5, "setLinkType:", 2);
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51790]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setUniqueDeviceIdentifier:](v5, "setUniqueDeviceIdentifier:", v6);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51658]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setColor:](v5, "setColor:", v7);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D516B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setEnclosureColor:](v5, "setEnclosureColor:", v8);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51678]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setCoverGlassColor:](v5, "setCoverGlassColor:", v9);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51680]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setHousingColor:](v5, "setHousingColor:", v10);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51670]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setBackingColor:](v5, "setBackingColor:", v11);

    objc_msgSend(a1, "_generateServerFriendlyDescriptionForPairedDevice:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKDevice setServerFriendlyDescription:](v5, "setServerFriendlyDescription:", v12);

    v13 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51660]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKDevice setLocale:](v5, "setLocale:", v15);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSURL)systemContainerURL
{
  if (systemContainerURL_onceToken != -1)
    dispatch_once(&systemContainerURL_onceToken, &__block_literal_global_49);
  return (NSURL *)(id)systemContainerURL_systemContainerUrl;
}

void __30__AKDevice_systemContainerURL__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = 1;
  v0 = (void *)container_system_path_for_identifier();
  _AKLogSystem();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      __30__AKDevice_systemContainerURL__block_invoke_cold_2((uint64_t)v0, v2, v3, v4, v5, v6, v7, v8);

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)systemContainerURL_systemContainerUrl;
    systemContainerURL_systemContainerUrl = v9;

    free(v0);
  }
  else
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __30__AKDevice_systemContainerURL__block_invoke_cold_1((uint64_t)&v17, v2, v11, v12, v13, v14, v15, v16);

  }
}

+ (NSURL)systemContainerCacheURL
{
  void *v2;
  void *v3;

  +[AKDevice systemContainerURL](AKDevice, "systemContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library/Caches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (AKDevice)deviceWithSerializedData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v5)
    {
      _AKLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[AKDevice deviceWithSerializedData:].cold.1();

    }
  }
  else
  {
    v4 = 0;
  }

  return (AKDevice *)v4;
}

- (NSData)serializedData
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AKDevice serializedData].cold.1();

  }
  return (NSData *)v2;
}

- (AKDevice)initWithCoder:(id)a3
{
  id v4;
  AKDevice *v5;
  uint64_t v6;
  NSString *uniqueDeviceIdentifier;
  uint64_t v8;
  NSString *provisioningDeviceIdentifier;
  uint64_t v10;
  NSString *serverFriendlyDescription;
  uint64_t v12;
  NSString *color;
  uint64_t v14;
  NSString *enclosureColor;
  uint64_t v16;
  NSNumber *coverGlassColor;
  uint64_t v18;
  NSNumber *housingColor;
  uint64_t v20;
  NSNumber *backingColor;
  uint64_t v22;
  NSLocale *locale;
  uint64_t v24;
  NSString *ROMAddress;
  uint64_t v26;
  NSString *MLBSerialNumber;
  uint64_t v28;
  NSString *modelNumber;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AKDevice;
  v5 = -[AKDevice init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueDeviceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueDeviceIdentifier = v5->_uniqueDeviceIdentifier;
    v5->_uniqueDeviceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_provisioningDeviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningDeviceIdentifier = v5->_provisioningDeviceIdentifier;
    v5->_provisioningDeviceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverFriendlyDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    serverFriendlyDescription = v5->_serverFriendlyDescription;
    v5->_serverFriendlyDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_color"));
    v12 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enclosureColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_coverGlassColor"));
    v16 = objc_claimAutoreleasedReturnValue();
    coverGlassColor = v5->_coverGlassColor;
    v5->_coverGlassColor = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_housingColor"));
    v18 = objc_claimAutoreleasedReturnValue();
    housingColor = v5->_housingColor;
    v5->_housingColor = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingColor"));
    v20 = objc_claimAutoreleasedReturnValue();
    backingColor = v5->_backingColor;
    v5->_backingColor = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_locale"));
    v22 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ROMAddress"));
    v24 = objc_claimAutoreleasedReturnValue();
    ROMAddress = v5->_ROMAddress;
    v5->_ROMAddress = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_MLBSerialNumber"));
    v26 = objc_claimAutoreleasedReturnValue();
    MLBSerialNumber = v5->_MLBSerialNumber;
    v5->_MLBSerialNumber = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelNumber"));
    v28 = objc_claimAutoreleasedReturnValue();
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_linkType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_linkType = objc_msgSend(v30, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
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
  id v17;

  v4 = a3;
  -[AKDevice uniqueDeviceIdentifier](self, "uniqueDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_uniqueDeviceIdentifier"));

  -[AKDevice provisioningDeviceIdentifier](self, "provisioningDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_provisioningDeviceIdentifier"));

  -[AKDevice serverFriendlyDescription](self, "serverFriendlyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_serverFriendlyDescription"));

  -[AKDevice color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_color"));

  -[AKDevice enclosureColor](self, "enclosureColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_enclosureColor"));

  -[AKDevice coverGlassColor](self, "coverGlassColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_coverGlassColor"));

  -[AKDevice housingColor](self, "housingColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_housingColor"));

  -[AKDevice backingColor](self, "backingColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_backingColor"));

  -[AKDevice locale](self, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_locale"));

  -[AKDevice ROMAddress](self, "ROMAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_ROMAddress"));

  -[AKDevice MLBSerialNumber](self, "MLBSerialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_MLBSerialNumber"));

  -[AKDevice modelNumber](self, "modelNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_modelNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_linkType);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_linkType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AKDevice *v4;
  void *v5;
  uint64_t v6;
  NSString *uniqueDeviceIdentifier;
  void *v8;
  uint64_t v9;
  NSString *provisioningDeviceIdentifier;
  void *v11;
  uint64_t v12;
  NSString *serverFriendlyDescription;
  void *v14;
  uint64_t v15;
  NSString *color;
  void *v17;
  uint64_t v18;
  NSString *enclosureColor;
  void *v20;
  uint64_t v21;
  NSNumber *coverGlassColor;
  void *v23;
  uint64_t v24;
  NSNumber *housingColor;
  void *v26;
  uint64_t v27;
  NSNumber *backingColor;
  void *v29;
  uint64_t v30;
  NSLocale *locale;
  void *v32;
  uint64_t v33;
  NSString *ROMAddress;
  void *v35;
  uint64_t v36;
  NSString *MLBSerialNumber;
  void *v38;
  uint64_t v39;
  NSString *modelNumber;

  v4 = objc_alloc_init(AKDevice);
  -[AKDevice uniqueDeviceIdentifier](self, "uniqueDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  uniqueDeviceIdentifier = v4->_uniqueDeviceIdentifier;
  v4->_uniqueDeviceIdentifier = (NSString *)v6;

  -[AKDevice provisioningDeviceIdentifier](self, "provisioningDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  provisioningDeviceIdentifier = v4->_provisioningDeviceIdentifier;
  v4->_provisioningDeviceIdentifier = (NSString *)v9;

  -[AKDevice serverFriendlyDescription](self, "serverFriendlyDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  serverFriendlyDescription = v4->_serverFriendlyDescription;
  v4->_serverFriendlyDescription = (NSString *)v12;

  -[AKDevice color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  color = v4->_color;
  v4->_color = (NSString *)v15;

  -[AKDevice enclosureColor](self, "enclosureColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  enclosureColor = v4->_enclosureColor;
  v4->_enclosureColor = (NSString *)v18;

  -[AKDevice coverGlassColor](self, "coverGlassColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  coverGlassColor = v4->_coverGlassColor;
  v4->_coverGlassColor = (NSNumber *)v21;

  -[AKDevice housingColor](self, "housingColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "copy");
  housingColor = v4->_housingColor;
  v4->_housingColor = (NSNumber *)v24;

  -[AKDevice backingColor](self, "backingColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "copy");
  backingColor = v4->_backingColor;
  v4->_backingColor = (NSNumber *)v27;

  -[AKDevice locale](self, "locale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "copy");
  locale = v4->_locale;
  v4->_locale = (NSLocale *)v30;

  -[AKDevice ROMAddress](self, "ROMAddress");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "copy");
  ROMAddress = v4->_ROMAddress;
  v4->_ROMAddress = (NSString *)v33;

  -[AKDevice MLBSerialNumber](self, "MLBSerialNumber");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "copy");
  MLBSerialNumber = v4->_MLBSerialNumber;
  v4->_MLBSerialNumber = (NSString *)v36;

  -[AKDevice modelNumber](self, "modelNumber");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copy");
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v39;

  v4->_linkType = self->_linkType;
  return v4;
}

- (id)description
{
  void *v3;
  NSString *serverFriendlyDescription;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  serverFriendlyDescription = self->_serverFriendlyDescription;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_linkType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AKDevice <%p> {%@} link %@"), self, serverFriendlyDescription, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  __CTServerConnection *telephonyConnectionRef;
  objc_super v4;

  telephonyConnectionRef = self->_telephonyConnectionRef;
  if (telephonyConnectionRef)
    CFRelease(telephonyConnectionRef);
  v4.receiver = self;
  v4.super_class = (Class)AKDevice;
  -[AKDevice dealloc](&v4, sel_dealloc);
}

- (NSString)color
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __17__AKDevice_color__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __17__AKDevice_color__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __17__AKDevice_color__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 80) && *(_BYTE *)(v2 + 34))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 34) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 80);
}

- (void)setColor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__AKDevice_setColor___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __21__AKDevice_setColor___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __21__AKDevice_setColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
}

- (NSString)enclosureColor
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__AKDevice_enclosureColor__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __26__AKDevice_enclosureColor__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __26__AKDevice_enclosureColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 88) && *(_BYTE *)(v2 + 35))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 35) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

- (void)setEnclosureColor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__AKDevice_setEnclosureColor___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __30__AKDevice_setEnclosureColor___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __30__AKDevice_setEnclosureColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = 0;
}

- (NSNumber)coverGlassColor
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AKDevice_coverGlassColor__block_invoke;
  v5[3] = &unk_1E2E617E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __27__AKDevice_coverGlassColor__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSNumber *)v3;
}

id __27__AKDevice_coverGlassColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 96) && *(_BYTE *)(v2 + 36))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 36) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 96);
}

- (void)setCoverGlassColor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__AKDevice_setCoverGlassColor___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __31__AKDevice_setCoverGlassColor___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __31__AKDevice_setCoverGlassColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 0;
}

- (NSNumber)housingColor
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AKDevice_housingColor__block_invoke;
  v5[3] = &unk_1E2E617E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __24__AKDevice_housingColor__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSNumber *)v3;
}

id __24__AKDevice_housingColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 104) && *(_BYTE *)(v2 + 37))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 37) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 104);
}

- (void)setHousingColor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__AKDevice_setHousingColor___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __28__AKDevice_setHousingColor___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __28__AKDevice_setHousingColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 37) = 0;
}

- (NSNumber)backingColor
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AKDevice_backingColor__block_invoke;
  v5[3] = &unk_1E2E617E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __24__AKDevice_backingColor__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSNumber *)v3;
}

id __24__AKDevice_backingColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 112) && *(_BYTE *)(v2 + 38))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 38) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

- (void)setBackingColor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__AKDevice_setBackingColor___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __28__AKDevice_setBackingColor___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __28__AKDevice_setBackingColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 38) = 0;
}

- (NSString)uniqueDeviceIdentifier
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AKDevice_uniqueDeviceIdentifier__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __34__AKDevice_uniqueDeviceIdentifier__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __34__AKDevice_uniqueDeviceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 64) && *(_BYTE *)(v2 + 32))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 32) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (void)setUniqueDeviceIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AKDevice_setUniqueDeviceIdentifier___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __38__AKDevice_setUniqueDeviceIdentifier___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __38__AKDevice_setUniqueDeviceIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
}

- (NSString)provisioningDeviceIdentifier
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AKDevice_provisioningDeviceIdentifier__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __40__AKDevice_provisioningDeviceIdentifier__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __40__AKDevice_provisioningDeviceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 152) && *(_BYTE *)(v2 + 43))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 43) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 152);
}

- (void)setProvisioningDeviceIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AKDevice_setProvisioningDeviceIdentifier___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __44__AKDevice_setProvisioningDeviceIdentifier___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __44__AKDevice_setProvisioningDeviceIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 43) = 0;
}

- (NSString)ROMAddress
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AKDevice_ROMAddress__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __22__AKDevice_ROMAddress__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __22__AKDevice_ROMAddress__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 128) && *(_BYTE *)(v1 + 40))
  {
    *(_QWORD *)(v1 + 128) = 0;
    v1 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v1 + 40) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 128);
}

- (void)setROMAddress:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__AKDevice_setROMAddress___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __26__AKDevice_setROMAddress___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __26__AKDevice_setROMAddress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

- (NSString)MLBSerialNumber
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AKDevice_MLBSerialNumber__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __27__AKDevice_MLBSerialNumber__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __27__AKDevice_MLBSerialNumber__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 136) && *(_BYTE *)(v1 + 41))
  {
    *(_QWORD *)(v1 + 136) = 0;
    v1 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v1 + 41) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 136);
}

- (void)setMLBSerialNumber:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__AKDevice_setMLBSerialNumber___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __31__AKDevice_setMLBSerialNumber___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __31__AKDevice_setMLBSerialNumber___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
}

- (NSString)modelNumber
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AKDevice_modelNumber__block_invoke;
  v5[3] = &unk_1E2E617B8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __23__AKDevice_modelNumber__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return (NSString *)v3;
}

id __23__AKDevice_modelNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 144) && *(_BYTE *)(v2 + 42))
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 144);
    *(_QWORD *)(v4 + 144) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 42) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 144);
}

- (void)setModelNumber:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__AKDevice_setModelNumber___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __27__AKDevice_setModelNumber___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __27__AKDevice_setModelNumber___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = 0;
}

- (void)setServerFriendlyDescription:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AKDevice_setServerFriendlyDescription___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __41__AKDevice_setServerFriendlyDescription___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __41__AKDevice_setServerFriendlyDescription___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
}

+ (id)_generateServerFriendlyDescriptionForPairedDevice:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = *MEMORY[0x1E0D51740];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51770]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51780]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51768]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@;%@;%@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9AE90];
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "infoDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v19, v14, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v5, v10, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)userChosenName
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)userFullName
{
  return 0;
}

- (NSString)internationalMobileEquipmentIdentity
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)internationalMobileEquipmentIdentity2
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer();
}

- (void)setLocale:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__AKDevice_setLocale___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_unfairLock);
  __22__AKDevice_setLocale___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_unfairLock);

}

void __22__AKDevice_setLocale___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 39) = 0;
}

- (BOOL)isUnlocked
{
  int v2;
  NSObject *v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1E0D4E4C8])
  {
    v2 = MKBGetDeviceLockState();
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v2;
      _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "MKB reported lock state: %d", (uint8_t *)v6, 8u);
    }

    return v2 == 0;
  }
  else
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "MKB not available", (uint8_t *)v6, 2u);
    }

    return 1;
  }
}

- (BOOL)isInCircle
{
  return SOSCCThisDeviceIsInCircle() == 0;
}

- (BOOL)isProtectedWithPasscode
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AKDevice isProtectedWithPasscode].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return v3;
}

- (BOOL)isBiometricAuthCapable
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)objc_opt_new();
  v14 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 1, &v14);
  v4 = v14;
  if ((v3 & 1) == 0)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
        -[AKDevice isBiometricAuthCapable].cold.2((uint64_t)v4, v5, v7, v8, v9, v10, v11, v12);
    }
    else if (v6)
    {
      -[AKDevice isBiometricAuthCapable].cold.1(v5);
    }

  }
  return v3;
}

- (BOOL)isFaceIDCapable
{
  int v2;

  v2 = -[AKDevice isBiometricAuthCapable](self, "isBiometricAuthCapable");
  if (v2)
    LOBYTE(v2) = _isFaceIDPlatform();
  return v2;
}

- (BOOL)isBiometricIDCapable
{
  return 0;
}

- (BOOL)usesTouchID
{
  void *v2;
  char v3;
  void *v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFaceIDCapable") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[AKDevice currentDevice](AKDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isBiometricAuthCapable");

  }
  return v3;
}

- (NSString)mobileEquipmentIdentifier
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)integratedCircuitCardIdentifier
{
  return (NSString *)(id)MGCopyAnswer();
}

- (BOOL)isSeedBuild
{
  if (isSeedBuild_onceToken != -1)
    dispatch_once(&isSeedBuild_onceToken, &__block_literal_global_115);
  return 0;
}

- (BOOL)isMultiUserMode
{
  if (isMultiUserMode_onceToken != -1)
    dispatch_once(&isMultiUserMode_onceToken, &__block_literal_global_116);
  return isMultiUserMode_isMultiUserMode;
}

void __27__AKDevice_isMultiUserMode__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MKBUserTypeDeviceMode();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0D4E5A8]))
    isMultiUserMode_isMultiUserMode = 1;

}

- (__CTServerConnection)_telephonyConnection
{
  -[NSLock lock](self->_telephonyLock, "lock");
  if (!self->_telephonyConnectionRef)
    self->_telephonyConnectionRef = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  -[NSLock unlock](self->_telephonyLock, "unlock");
  return self->_telephonyConnectionRef;
}

- (NSString)phoneNumber
{
  uint64_t active;
  const void *v4;
  NSObject *v5;

  if (-[AKDevice linkType](self, "linkType") == 1)
  {
    active = CPPhoneNumberCopyActiveCountryCode();
    if (active)
    {
      v4 = (const void *)active;
      -[AKDevice _telephonyConnection](self, "_telephonyConnection");
      _CTServerConnectionCopyEffectiveSimInfo();
      CFRelease(v4);
      return (NSString *)0;
    }
  }
  else
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AKDevice phoneNumber].cold.1(v5);

  }
  return (NSString *)0;
}

+ (id)deviceSpecificLocalizedStringWithKey:(id)a3
{
  return (id)objc_msgSend(a1, "deviceSpecificLocalizedStringWithKey:inTable:", a3, 0);
}

+ (id)deviceSpecificLocalizedStringWithKey:(id)a3 inTable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)MGCopyAnswer();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_1E2E647A8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (int64_t)currentDeviceAuthenticationModeForAuthContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  __CFString *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "_currentDeviceAuthenticationMode");
  if (v5 == 1)
  {
    objc_msgSend(v4, "proxiedDeviceAnisetteData");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxiedDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (v7 | v6) != 0;

  }
  else
  {
    v8 = v5;
    objc_msgSend(v4, "appProvidedContext");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v9 == CFSTR("dependent"))
      v8 = 3;
  }

  return v8;
}

+ (int64_t)_currentDeviceAuthenticationMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;

  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51840], "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51840], "activeDeviceSelectorBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D516D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[AKDevice _currentDeviceAuthenticationMode].cold.1((uint64_t)v5, v10, v11);

  return v10;
}

- (id)_volumeGroupUUID
{
  return 0;
}

+ (BOOL)hasUniqueDeviceIdentifier
{
  return 0;
}

- (void)_setCurrentSharingMode
{
  self->_isInRestrictedSharingMode = 0;
}

- (BOOL)isStrongDeviceIdentitySupported
{
  uint64_t (*v2)(void);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getDeviceIdentityIsSupportedSymbolLoc_ptr_0;
  v9 = getDeviceIdentityIsSupportedSymbolLoc_ptr_0;
  if (!getDeviceIdentityIsSupportedSymbolLoc_ptr_0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getDeviceIdentityIsSupportedSymbolLoc_block_invoke;
    v5[3] = &unk_1E2E5E328;
    v5[4] = &v6;
    __getDeviceIdentityIsSupportedSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)_BYSetupAssistantNeedsToRun_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2();
}

- (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1)
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_131);
  return isVirtualMachine_result;
}

uint64_t __28__AKDevice_isVirtualMachine__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    isVirtualMachine_result = v2 != 0;
  return result;
}

- (NSData)sfrManifest
{
  NSData *sfrManifest;
  void *v4;
  NSData *v5;
  NSData *v6;

  sfrManifest = self->_sfrManifest;
  if (!sfrManifest)
  {
    +[AKIORegistryReader sharedInstance](AKIORegistryReader, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sfrManifest");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfrManifest;
    self->_sfrManifest = v5;

    sfrManifest = self->_sfrManifest;
  }
  return sfrManifest;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (BOOL)isInRestrictedSharingMode
{
  return self->_isInRestrictedSharingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_MLBSerialNumber, 0);
  objc_storeStrong((id *)&self->_ROMAddress, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_backingColor, 0);
  objc_storeStrong((id *)&self->_housingColor, 0);
  objc_storeStrong((id *)&self->_coverGlassColor, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_serverFriendlyDescription, 0);
  objc_storeStrong((id *)&self->_uniqueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sfrManifest, 0);
  objc_storeStrong((id *)&self->_telephonyLock, 0);
}

void __30__AKDevice_systemContainerURL__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Error getting system container: %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __30__AKDevice_systemContainerURL__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "System container path is %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)deviceWithSerializedData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Caught error (%@) unserializing AKDevice data (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)serializedData
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Caught error (%@) serializing self (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)isInCircle
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Failed to check circle status: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isProtectedWithPasscode
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "System reports isPasscodeSet: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isBiometricAuthCapable
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Local auth returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)phoneNumber
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Attempted to fetch phone number for non-native device!", v1, 2u);
}

+ (void)_currentDeviceAuthenticationMode
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_19202F000, a3, OS_LOG_TYPE_DEBUG, "Device status: %@ - ALT: %@", (uint8_t *)&v6, 0x16u);

}

@end
