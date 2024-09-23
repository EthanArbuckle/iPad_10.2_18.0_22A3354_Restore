@implementation HKSource

- (HKSource)initWithCoder:(id)a3
{
  id v4;
  HKSource *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *productType;
  uint64_t v12;
  NSString *owningAppBundleIdentifier;
  uint64_t v14;
  NSDate *modificationDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKSource;
  v5 = -[HKSource init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_localDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localDevice"));
    v5->_options = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v10 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owningApp"));
    v12 = objc_claimAutoreleasedReturnValue();
    owningAppBundleIdentifier = v5->_owningAppBundleIdentifier;
    v5->_owningAppBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v14;

  }
  return v5;
}

+ (id)_sourceBundleIdentifierWithEntitlements:(id)a3 processBundleIdentifier:(id)a4 isExtension:(BOOL)a5
{
  id v5;
  id *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.private.healthkit.health-app-source")))
  {
    v6 = (id *)&kHKHealthAppBundleIdentifier;
LABEL_5:
    v7 = *v6;
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.private.healthkit.local-device-source")))
  {
    v6 = (id *)&kHKLocalDeviceBundleIdentifier;
    goto LABEL_5;
  }
  objc_msgSend(v5, "stringForEntitlement:", CFSTR("com.apple.private.healthkit.source.default"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "stringForEntitlement:", CFSTR("com.apple.private.healthkit.source_override"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v5, "applicationIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSource *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HKSource *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v7 = 1;
    }
    else
    {
      -[HKSource bundleIdentifier](v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSource bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_localDevice, CFSTR("localDevice"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_options, CFSTR("sourceOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_owningAppBundleIdentifier, CFSTR("owningApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)_sourceID
{
  return self->_sourceID;
}

+ (id)_localDeviceSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HKSource__localDeviceSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_localDeviceSource_onceToken != -1)
    dispatch_once(&_localDeviceSource_onceToken, block);
  return (id)_localDeviceSource__localDeviceSource;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_isLocalDevice
{
  return self->_localDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_owningAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSource;
  return -[HKSource init](&v3, sel_init);
}

- (void)_setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (void)_setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)_setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)_setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (void)_setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)_setSourceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceID, a3);
}

- (BOOL)_isApplication
{
  return self->_options & 1;
}

uint64_t __30__HKSource__localDeviceSource__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[HKSource _init]([HKSource alloc], "_init");
  v3 = (void *)_localDeviceSource__localDeviceSource;
  _localDeviceSource__localDeviceSource = (uint64_t)v2;

  objc_msgSend((id)_localDeviceSource__localDeviceSource, "_setBundleIdentifier:", CFSTR("com.apple.private.health.localdevice"));
  v4 = (void *)_localDeviceSource__localDeviceSource;
  objc_msgSend(*(id *)(a1 + 32), "_currentSourceProductType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setProductType:", v5);

  v6 = (void *)_localDeviceSource__localDeviceSource;
  objc_msgSend(*(id *)(a1 + 32), "_sourceNameWithRepresentsCurrentDevice:defaultSource:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setName:", v7);

  objc_msgSend((id)_localDeviceSource__localDeviceSource, "_setLocalDevice:", 1);
  return objc_msgSend((id)_localDeviceSource__localDeviceSource, "_setOptions:", 2);
}

+ (id)_currentSourceProductType:(BOOL)a3
{
  if (!a3)
    return 0;
  +[_HKBehavior currentDeviceProductType](_HKBehavior, "currentDeviceProductType");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_sourceNameWithRepresentsCurrentDevice:(BOOL)a3 defaultSource:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    +[_HKBehavior currentDeviceDisplayName](_HKBehavior, "currentDeviceDisplayName", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v4 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_isAppleWatch
{
  void *v2;
  char v3;

  -[HKSource _productType](self, "_productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall")
    && ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPod6,3")) & 1) != 0
     || (objc_msgSend(v2, "isEqualToString:", CFSTR("iPod6,4")) & 1) != 0))
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("Watch"));
  }

  return v3;
}

- (NSString)_productType
{
  return self->_productType;
}

- (BOOL)_isPreferredSource
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)_isConnectedGymSource
{
  return (~-[HKSource _options](self, "_options") & 0x12) == 0;
}

- (unint64_t)_options
{
  return self->_options;
}

+ (HKSource)defaultSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__HKSource_defaultSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSource_onceToken != -1)
    dispatch_once(&defaultSource_onceToken, block);
  return (HKSource *)(id)defaultSource_defaultSource;
}

void __25__HKSource_defaultSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_uncachedDefaultSource");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultSource_defaultSource;
  defaultSource_defaultSource = v1;

}

+ (id)_uncachedDefaultSource
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;

  v8 = 0;
  +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKSource _uncachedDefaultSource].cold.1((uint64_t)v4, v5);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Unable to create default source, failed to retrieve entitlements: %@"), v4);
  }
  objc_msgSend(a1, "_uncachedDefaultSourceWithEntitlements:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_uncachedDefaultSourceWithEntitlements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sourceBundleIdentifierWithEntitlements:processBundleIdentifier:isExtension:", v4, v6, _HKCurrentTaskIsAppExtension());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _HKInitializeLogging();
    v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKSource _uncachedDefaultSourceWithEntitlements:].cold.1(v8);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("unable to create default source from entitlements"));
  }
  v9 = objc_msgSend(a1, "_representsCurrentDeviceWithBundleIdentifier:", v7);
  if ((v9 & 1) != 0)
    v10 = 2;
  else
    v10 = objc_msgSend(a1, "_sourceOptionsForAppEntitlements:", v4);
  objc_msgSend(a1, "_currentSourceProductType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sourceNameWithRepresentsCurrentDevice:defaultSource:", v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSource _init]([HKSource alloc], "_init");
  objc_msgSend(v13, "_setBundleIdentifier:", v7);
  objc_msgSend(v13, "_setProductType:", v11);
  objc_msgSend(v13, "_setName:", v12);
  objc_msgSend(v13, "_setLocalDevice:", v9);
  objc_msgSend(v13, "_setOptions:", v10);

  return v13;
}

+ (id)_connectedGymSource
{
  if (_connectedGymSource_onceToken != -1)
    dispatch_once(&_connectedGymSource_onceToken, &__block_literal_global_35);
  return (id)_connectedGymSource__connectedGymSource;
}

uint64_t __31__HKSource__connectedGymSource__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = -[HKSource _init]([HKSource alloc], "_init");
  v1 = (void *)_connectedGymSource__connectedGymSource;
  _connectedGymSource__connectedGymSource = (uint64_t)v0;

  objc_msgSend((id)_connectedGymSource__connectedGymSource, "_setBundleIdentifier:", CFSTR("com.apple.health.GymKit"));
  v2 = (void *)_connectedGymSource__connectedGymSource;
  HKConnectedGymSourceName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setName:", v3);

  return objc_msgSend((id)_connectedGymSource__connectedGymSource, "_setOptions:", 18);
}

+ (id)_blePeripheralSource
{
  if (_blePeripheralSource_onceToken != -1)
    dispatch_once(&_blePeripheralSource_onceToken, &__block_literal_global_15);
  return (id)_blePeripheralSource__blePeripheralSource;
}

uint64_t __32__HKSource__blePeripheralSource__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = -[HKSource _init]([HKSource alloc], "_init");
  v1 = (void *)_blePeripheralSource__blePeripheralSource;
  _blePeripheralSource__blePeripheralSource = (uint64_t)v0;

  objc_msgSend((id)_blePeripheralSource__blePeripheralSource, "_setBundleIdentifier:", CFSTR("com.apple.BTLEServer"));
  v2 = (void *)_blePeripheralSource__blePeripheralSource;
  HKBLEPeripheralSourceName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setName:", v3);

  return objc_msgSend((id)_blePeripheralSource__blePeripheralSource, "_setOptions:", 18);
}

+ (BOOL)_representsCurrentDeviceWithBundleIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.private.health.localdevice"));
}

+ (id)_generateIdentifierForAppleDevice
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_generateIdentifierForAppleDeviceWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_generateIdentifierForAppleDeviceWithUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.health."), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_isPlaceholderBundleIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.private.health.localdevice"));
}

+ (id)_researchStudiesDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  HKSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Research/Studies/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_sourceWithBundleIdentifier:(id)a3 name:(id)a4 productType:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  if (a3)
  {
    v6 = a6;
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
    v14 = objc_msgSend(v12, "copy");

    v15 = (void *)v13[2];
    v13[2] = v14;

    v16 = objc_msgSend(v11, "copy");
    v17 = (void *)v13[1];
    v13[1] = v16;

    v18 = objc_msgSend(v10, "copy");
    v19 = (void *)v13[7];
    v13[7] = v18;

    v13[8] = v6 & 0x7F;
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)_privateSourceForClinicalAccountIdentifier:(id)a3 name:(id)a4
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = (__CFString *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSource.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.private.health.clinical"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v13 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v11;
  v14 = v11;

  if (v8)
    v15 = v8;
  else
    v15 = CFSTR("com.apple.private.health.clinical");
  objc_storeStrong((id *)(v12 + 8), v15);
  v16 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = 0;

  *(_QWORD *)(v12 + 64) = 8;
  return (id)v12;
}

+ (id)_publicSourceForClinicalExternalIdentifier:(id)a3 name:(id)a4
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v19;

  v7 = a3;
  v8 = (__CFString *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSource.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(v7, "hk_MD5HashAsUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.public.health.clinical"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v14 = *(void **)(v13 + 16);
  *(_QWORD *)(v13 + 16) = v12;
  v15 = v12;

  if (v8)
    v16 = v8;
  else
    v16 = CFSTR("com.apple.public.health.clinical");
  objc_storeStrong((id *)(v13 + 8), v16);
  v17 = *(void **)(v13 + 56);
  *(_QWORD *)(v13 + 56) = 0;

  *(_QWORD *)(v13 + 64) = 8;
  return (id)v13;
}

+ (id)_sourceWithBundleIdentifier:(id)a3 defaultBundleIdentifier:(id)a4 appEntitlements:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Health")))
  {
    HKHealthKitFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("HEALTH_APP"), &stru_1E37FD4C0, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSource _sourceWithBundleIdentifier:name:productType:options:](HKSource, "_sourceWithBundleIdentifier:name:productType:options:", CFSTR("com.apple.Health"), v15, 0, 3);
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(a1, "_representsCurrentDeviceWithBundleIdentifier:", v10))
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentDeviceDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentDeviceProductType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSource _sourceWithBundleIdentifier:name:productType:options:](HKSource, "_sourceWithBundleIdentifier:name:productType:options:", CFSTR("com.apple.private.health.localdevice"), v18, v19, 2);
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.BTLEServer")))
  {
    +[HKSource _blePeripheralSource](HKSource, "_blePeripheralSource");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HKSource _sourceWithBundleIdentifier:name:productType:options:](HKSource, "_sourceWithBundleIdentifier:name:productType:options:", v10, v13, 0, objc_msgSend(a1, "_sourceOptionsForAppEntitlements:", v12));
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.private.healthkit.source.research-study")))
    {
      v20 = objc_msgSend(v11, "copy");
      v21 = (void *)v16[5];
      v16[5] = v20;

    }
  }

  return v16;
}

+ (unint64_t)_sourceOptionsForAppEntitlements:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.private.healthkit.preferred_source"));
  v5 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.private.healthkit.authorization_bypass"));
  v6 = objc_msgSend(v3, "hasBackgroundDeliveryAPIAccess");
  if ((objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.private.healthkit.source.research-study")) & 1) != 0)
    v7 = 32;
  else
    v7 = objc_msgSend(v3, "arrayEntitlement:containsString:", CFSTR("com.apple.private.healthkit.source.identities"), CFSTR("com.apple.health.[any-device-uuid]")) ^ 1;
  v8 = 2;
  if (!v4)
    v8 = 0;
  if (!v5)
    v8 |= 4uLL;
  if (v6)
    v8 |= 0x40uLL;
  v9 = v8 | v7;

  return v9;
}

- (BOOL)_requiresAuthorization
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)_isHidden
{
  NSString *bundleIdentifier;
  void *v4;
  void *v5;
  char v6;

  if (!-[HKSource _isApplication](self, "_isApplication"))
    return 0;
  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier)
    return 0;
  -[NSString hk_MD5Hash](bundleIdentifier, "hk_MD5Hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("9a954967ccb5d9e033a8732bf9396b91"));
  else
    v6 = 0;

  return v6;
}

- (BOOL)_isClinicalSource
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_isResearchStudy
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)_isAllowedBackgroundDelivery
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)_isSiri
{
  __CFString *bundleIdentifier;

  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  if (bundleIdentifier == CFSTR("com.apple.siri"))
    return 1;
  if (CFSTR("com.apple.siri"))
    return -[__CFString isEqualToString:](bundleIdentifier, "isEqualToString:");
  return 0;
}

- (BOOL)_isBTLEServer
{
  __CFString *bundleIdentifier;

  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  if (bundleIdentifier == CFSTR("com.apple.BTLEServer"))
    return 1;
  if (CFSTR("com.apple.BTLEServer"))
    return -[__CFString isEqualToString:](bundleIdentifier, "isEqualToString:");
  return 0;
}

- (id)_deducedClinicalAccountIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@."), CFSTR("com.apple.private.health.clinical"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString hasPrefix:](self->_bundleIdentifier, "hasPrefix:", v3))
  {
    -[NSString substringFromIndex:](self->_bundleIdentifier, "substringFromIndex:", objc_msgSend(v3, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_fetchBundleWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  -[HKSource bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource _owningAppBundleIdentifier](self, "_owningAppBundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    || (objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForCompanionIdentifier:", v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "bundleURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v11);
    if (v13)
    {
      if (objc_msgSend(v5, "isEqualToString:", v9))
      {
        v14 = v13;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_researchStudiesDirectoryURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "hk_findContainedBundleWithIdentifier:directoryURL:", v5, v15);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v13, "hk_findContainedBundleWithIdentifier:", v5);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v16 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v15, "path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "hk_assignError:code:format:", a3, 100, CFSTR("Failed to find bundle with identifier %@ in directory \"%@\" or in application bundle \"%@\"), v5, v17, v13);

            v14 = 0;
          }
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Unable to instantiate app bundle at URL %@ for source %@"), v11, self);
      v14 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Application proxy missing bundle URL for source %@ with identifier %@"), self, v9);
    v14 = 0;
  }

  return v14;
}

- (HKSource)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p \"%@\", bundle identifier: %@, localDeviceSource: %d, modification date: %@>"), objc_opt_class(), self, self->_name, self->_bundleIdentifier, self->_localDevice, self->_modificationDate);
}

- (BOOL)_isAppleDevice
{
  return -[NSString hasPrefix:](self->_bundleIdentifier, "hasPrefix:", CFSTR("com.apple.health."))
      || -[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", CFSTR("com.apple.private.health.localdevice"));
}

+ (BOOL)isAppleDeviceBundleIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.health."));
}

- (BOOL)_hasFirstPartyBundleID
{
  NSString *bundleIdentifier;

  bundleIdentifier = self->_bundleIdentifier;
  return bundleIdentifier
      && -[NSString rangeOfString:options:](bundleIdentifier, "rangeOfString:options:", CFSTR("com.apple"), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)_setModificationDate:(id)a3
{
  NSDate *v4;
  NSDate *modificationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  modificationDate = self->_modificationDate;
  self->_modificationDate = v4;

}

- (NSString)_owningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier;
}

- (void)_setOwningAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)asJSONObject
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[HKSource bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));

  return v3;
}

+ (void)_uncachedDefaultSource
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "unable to create default source, cannot retrieve entitlements for the current task: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_uncachedDefaultSourceWithEntitlements:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "unable to create default source from entitlements", v1, 2u);
}

@end
