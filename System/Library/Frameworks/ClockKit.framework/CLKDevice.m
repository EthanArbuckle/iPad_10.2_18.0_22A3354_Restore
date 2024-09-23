@implementation CLKDevice

- (unint64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (unint64_t)version
{
  os_unfair_lock_s *p_capabilitiesLock;
  unint64_t version;

  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  version = self->_version;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return version;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)isRunningGraceOrLater
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_runningGraceOrLater;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

+ (CLKDevice)currentDevice
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)&__deviceLock);
  v3 = (void *)__currentDevice;
  if (!__currentDevice)
  {
    if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1)
      dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_470);
    if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
    {
      +[CLKDevice activeNRDevice](CLKDevice, "activeNRDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(a1, "_createCurrentDeviceWithNRDevice:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__currentDevice;
    __currentDevice = v5;

    v3 = (void *)__currentDevice;
  }
  v7 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&__deviceLock);
  return (CLKDevice *)v7;
}

+ (id)_createCurrentDeviceWithNRDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    CLKLoggingObjectForDomain(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CLKDevice _createCurrentDeviceWithNRDevice:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  objc_msgSend(a1, "deviceForNRDevice:forced:", v4, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)deviceForNRDevice:(id)a3 forced:(BOOL)a4
{
  void *v4;
  void *v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v8 = a3;
  v9 = v8;
  if (!a4)
  {
    objc_msgSend(a1, "currentDevice");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (v9)
        goto LABEL_12;
      goto LABEL_14;
    }
    v12 = (void *)v11;
    if (!v9)
    {
      objc_msgSend(a1, "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nrDevice");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {

        goto LABEL_16;
      }
      v5 = (void *)v13;
    }
    objc_msgSend(a1, "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nrDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqual:", v15);

    if (v9)
    {

      if (!v16)
        goto LABEL_12;
    }
    else
    {

      if ((v16 & 1) == 0)
        goto LABEL_14;
    }
LABEL_16:
    objc_msgSend(a1, "currentDevice");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!v8)
  {
LABEL_14:
    objc_msgSend(a1, "_cachedDeviceForUUID:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v18 = (void *)v19;
    goto LABEL_18;
  }
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeCachedDeviceForUUID:", v10);

LABEL_12:
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cachedDeviceForUUID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v18;
}

+ (void)_createCurrentDeviceWithNRDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a1, a3, "Creating a CLKDevice without an NRDevice: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (id)_cachedDeviceForUUID:(id)a3
{
  id v4;
  CLKDevice *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  if (cachedDevices)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v8 = objc_opt_new();
    v9 = (void *)cachedDevices;
    cachedDevices = v8;

    if (v4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  objc_msgSend((id)cachedDevices, "objectForKeyedSubscript:", v4);
  v5 = (CLKDevice *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "nrDeviceForNRDeviceUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLKDevice initWithNRDevice:]([CLKDevice alloc], "initWithNRDevice:", v6);
    objc_msgSend((id)cachedDevices, "setObject:forKeyedSubscript:", v5, v4);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v5;
}

- (CLKDevice)initWithNRDevice:(id)a3
{
  id v4;
  CLKDevice *v5;
  CLKDevice *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKDevice;
  v5 = -[CLKDevice init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_protectedLock._os_unfair_lock_opaque = 0;
    CLKLoggingObjectForDomain(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2114F4000, v7, OS_LOG_TYPE_DEFAULT, "Creating a CLKDevice. nrDevice: %{public}@", buf, 0xCu);

    }
    -[CLKDevice setNrDevice:](v6, "setNrDevice:", v4);
    -[CLKDevice _loadDeviceInfo](v6, "_loadDeviceInfo");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_handleDeviceDidPairNotification, *MEMORY[0x24BE6B440], 0);

    -[CLKDevice customCompanionSetup](v6, "customCompanionSetup");
  }

  return v6;
}

- (void)setNrDevice:(id)a3
{
  objc_storeStrong((id *)&self->_nrDevice, a3);
}

- (void)customCompanionSetup
{
  NSMutableDictionary *v3;
  NSMutableDictionary *supportedCapabilitiesCache;
  const char *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  self->_version = 1;
  self->_capabilitiesLock._os_unfair_lock_opaque = 0;
  v3 = (NSMutableDictionary *)objc_opt_new();
  supportedCapabilitiesCache = self->_supportedCapabilitiesCache;
  self->_supportedCapabilitiesCache = v3;

  -[CLKDevice _queryAndCacheNanoRegistryDeviceCapabilities](self, "_queryAndCacheNanoRegistryDeviceCapabilities");
  objc_initWeak(&location, self);
  v5 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6B460], "UTF8String");
  v6 = MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC9B8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__CLKDevice_customCompanionSetup__block_invoke;
  v8[3] = &unk_24CBF9FE0;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v5, &self->_pairedDeviceCapabilitiesChangeNotificationToken, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (id)nrDeviceForNRDeviceUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  if (!v3)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_13;
  }
  if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1)
    dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_470);
  if (!_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
  {
    CLKLoggingObjectForDomain(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[CLKDevice nrDeviceForNRDeviceUUID:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __37__CLKDevice_nrDeviceForNRDeviceUUID___block_invoke;
  v16[3] = &unk_24CBFA098;
  v17 = v3;
  objc_msgSend(v4, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

LABEL_13:
  return v6;
}

+ (id)activeNRDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1)
    dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_470);
  if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
  {
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[CLKDevice activeNRDevice].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
  }
  return v5;
}

- (void)_loadDeviceInfo
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Gizmo(%@) has invalid size class! %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4;
  os_unfair_lock_s *p_capabilitiesLock;
  NSMutableDictionary *supportedCapabilitiesCache;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;

  v4 = a3;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  supportedCapabilitiesCache = self->_supportedCapabilitiesCache;
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](supportedCapabilitiesCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_capabilitiesLock);
  if (v8)
  {
    LOBYTE(v9) = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    v9 = -[CLKDevice _supportsCapabilityUncached:](self, "_supportsCapabilityUncached:", v4);
    os_unfair_lock_lock(&self->_capabilitiesLock);
    v10 = self->_supportedCapabilitiesCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, v12);

    os_unfair_lock_unlock(p_capabilitiesLock);
  }

  return v9;
}

- (NSUUID)nrDeviceUUID
{
  void *v2;
  void *v3;

  -[CLKDevice nrDevice](self, "nrDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)updateTinkerState
{
  os_unfair_lock_s *p_protectedLock;
  _BOOL4 isTinker;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  int v9;
  _BOOL8 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_protectedLock = &self->_protectedLock;
  os_unfair_lock_lock(&self->_protectedLock);
  isTinker = self->_isTinker;
  -[CLKDevice nrDevice](self, "nrDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B340]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isTinker = objc_msgSend(v6, "BOOLValue");

  v7 = self->_isTinker;
  os_unfair_lock_unlock(p_protectedLock);
  if (isTinker != v7)
  {
    CLKLoggingObjectForDomain(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v7;
      _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "Tinker state changed: %lu", (uint8_t *)&v9, 0xCu);
    }

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_6);
  }
}

- (int64_t)retrieveProductType
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CLKDevice nrDevice](self, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CLKDevice productTypeFromProductTypeString:](self, "productTypeFromProductTypeString:", v4);
  return v5;
}

- (int64_t)productTypeFromProductTypeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (v3)
  {
    if (productTypeFromProductTypeString__onceToken != -1)
      dispatch_once(&productTypeFromProductTypeString__onceToken, &__block_literal_global_38);
    objc_msgSend((id)productTypeFromProductTypeString__mapping, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "integerValue");
    else
      v6 = -1;

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (BOOL)isM8SOCInDeviceOfProductType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 7;
}

- (BOOL)isLimitedToPreGloryDeviceOfProductType:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (BOOL)_supportsCapabilityUncached:(id)a3
{
  NRDevice *nrDevice;

  nrDevice = self->_nrDevice;
  if (nrDevice)
    return -[NRDevice supportsCapability:](nrDevice, "supportsCapability:", a3);
  else
    return 1;
}

- (void)_loadSupportsVictoryFaces
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("E7B1CD81-445C-4840-9F24-3A32B510B6A1"));
  if (-[CLKDevice supportsCapability:](self, "supportsCapability:", v3))
  {

LABEL_4:
    self->_supportsVictoryFaces = 1;
    return;
  }
  v4 = -[CLKDevice collectionType](self, "collectionType");

  if (v4 == 6)
    goto LABEL_4;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("35165B81-461F-4423-8903-A50CEFB1C204"));
  if (-[CLKDevice supportsCapability:](self, "supportsCapability:"))
    v5 = -[CLKDevice collectionType](self, "collectionType") != 5;
  else
    v5 = 0;
  self->_supportsVictoryFaces = v5;

}

- (BOOL)_queryAndCacheNanoRegistryDeviceCapabilities
{
  int supportsCompanionSync;
  void *v4;
  void *v5;
  int v6;
  int isExplorer;
  int AppBooleanValue;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  _BOOL4 hasRichMediaComplications;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int supportsUrsa;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int supportsPolaris;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int supportsCharon;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int runningGraceOrLater;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  _BOOL4 v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  _BOOL4 v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  _BOOL4 v50;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  _BOOL4 v54;
  NSObject *v55;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  _BOOL4 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  lock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  supportsCompanionSync = self->_supportsCompanionSync;
  -[CLKDevice nrDevice](self, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("46526F47-0B4B-41FF-A959-AC358550958C"));
  self->_supportsCompanionSync = objc_msgSend(v4, "supportsCapability:", v5);

  v6 = self->_supportsCompanionSync;
  isExplorer = self->_isExplorer;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("Explorer"), CFSTR("com.apple.ClockKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    CLKLoggingObjectForDomain(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2114F4000, v9, OS_LOG_TYPE_DEFAULT, "OVERRIDE explorer", buf, 2u);
    }

    v10 = 1;
  }
  else
  {
    -[CLKDevice nrDevice](self, "nrDevice", lock);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("4AA3FF3B-3224-42E6-995E-481F49AE9260"));
    v10 = objc_msgSend(v11, "supportsCapability:", v12);

  }
  self->_isExplorer = v10;
  hasRichMediaComplications = self->_hasRichMediaComplications;
  -[CLKDevice nrDevice](self, "nrDevice", lock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("873627CA-D131-46F4-B477-E653F7445DF9"));
  self->_hasRichMediaComplications = objc_msgSend(v14, "supportsCapability:", v15);

  v16 = 1;
  if (v6 == supportsCompanionSync && isExplorer == v10)
    v16 = self->_hasRichMediaComplications != hasRichMediaComplications;
  supportsUrsa = self->_supportsUrsa;
  keyExistsAndHasValidFormat = 0;
  v18 = CFPreferencesGetAppBooleanValue(CFSTR("Ursa"), CFSTR("com.apple.ClockKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v18)
  {
    CLKLoggingObjectForDomain(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2114F4000, v19, OS_LOG_TYPE_DEFAULT, "OVERRIDE ursa", buf, 2u);
    }

  }
  else
  {
    -[CLKDevice nrDevice](self, "nrDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[CLKDevice nrDevice](self, "nrDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AB764CE8-D4DF-4DB6-991C-3A298E380BD1"));
      v23 = objc_msgSend(v21, "supportsCapability:", v22);

      goto LABEL_18;
    }
  }
  v23 = 1;
LABEL_18:
  self->_supportsUrsa = v23;
  if (supportsUrsa != v23)
    v16 = 1;
  supportsPolaris = self->_supportsPolaris;
  keyExistsAndHasValidFormat = 0;
  v25 = CFPreferencesGetAppBooleanValue(CFSTR("AbsoluteAltitudeEnabled"), CFSTR("com.apple.locationd"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v25)
  {
    CLKLoggingObjectForDomain(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2114F4000, v26, OS_LOG_TYPE_DEFAULT, "OVERRIDE polaris", buf, 2u);
    }

  }
  else
  {
    -[CLKDevice nrDevice](self, "nrDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[CLKDevice nrDevice](self, "nrDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("FEBBC201-B013-4680-94B0-7F4129F4CCB8"));
      v30 = objc_msgSend(v28, "supportsCapability:", v29);

      goto LABEL_28;
    }
  }
  v30 = 1;
LABEL_28:
  self->_supportsPolaris = v30;
  if (supportsPolaris != v30)
    v16 = 1;
  supportsCharon = self->_supportsCharon;
  -[CLKDevice nrDevice](self, "nrDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CLKDevice nrDevice](self, "nrDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("E553D9C1-2587-4142-B286-C556E89F51F3"));
    v35 = objc_msgSend(v33, "supportsCapability:", v34);

  }
  else
  {
    v35 = 1;
  }
  self->_supportsCharon = v35;
  v36 = supportsCharon != v35 || v16;
  runningGraceOrLater = self->_runningGraceOrLater;
  -[CLKDevice nrDevice](self, "nrDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[CLKDevice nrDevice](self, "nrDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("887DC9F2-A55D-41F6-8639-64776A041BF1"));
    self->_runningGraceOrLater = objc_msgSend(v39, "supportsCapability:", v40);

  }
  else
  {
    self->_runningGraceOrLater = 1;
  }

  if (v36)
  {
    -[CLKDevice _checkUpdateFlushCapabilitiesCache_locked](self, "_checkUpdateFlushCapabilitiesCache_locked");
  }
  else
  {
    v41 = self->_runningGraceOrLater;
    if (!-[CLKDevice _checkUpdateFlushCapabilitiesCache_locked](self, "_checkUpdateFlushCapabilitiesCache_locked")
      && v41 == runningGraceOrLater)
    {
      v42 = 0;
      goto LABEL_45;
    }
  }
  ++self->_version;
  v42 = 1;
LABEL_45:
  os_unfair_lock_unlock(locka);
  CLKLoggingObjectForDomain(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = self->_isExplorer;
    *(_DWORD *)buf = 67109120;
    v61 = v44;
    _os_log_impl(&dword_2114F4000, v43, OS_LOG_TYPE_DEFAULT, "CLKDevice isExplorer: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = self->_hasRichMediaComplications;
    *(_DWORD *)buf = 67109120;
    v61 = v46;
    _os_log_impl(&dword_2114F4000, v45, OS_LOG_TYPE_DEFAULT, "CLKDevice hasRichMediaComplications: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = self->_runningGraceOrLater;
    *(_DWORD *)buf = 67109120;
    v61 = v48;
    _os_log_impl(&dword_2114F4000, v47, OS_LOG_TYPE_DEFAULT, "CLKDevice runningGraceOrLater: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = self->_supportsUrsa;
    *(_DWORD *)buf = 67109120;
    v61 = v50;
    _os_log_impl(&dword_2114F4000, v49, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsUrsa: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = self->_supportsPolaris;
    *(_DWORD *)buf = 67109120;
    v61 = v52;
    _os_log_impl(&dword_2114F4000, v51, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsPolaris: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = self->_supportsCharon;
    *(_DWORD *)buf = 67109120;
    v61 = v54;
    _os_log_impl(&dword_2114F4000, v53, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsCharon: %u", buf, 8u);
  }

  CLKLoggingObjectForDomain(0);
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v61 = v42;
    _os_log_impl(&dword_2114F4000, v55, OS_LOG_TYPE_DEFAULT, "CLKDevice capabilityChanged: %u", buf, 8u);
  }

  return v42;
}

- (BOOL)_checkUpdateFlushCapabilitiesCache_locked
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_supportedCapabilitiesCache, "allKeys");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_supportedCapabilitiesCache, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        v12 = -[CLKDevice _supportsCapabilityUncached:](self, "_supportsCapabilityUncached:", v9);
        if (v11 != v12)
        {
          v13 = v12;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_supportedCapabilitiesCache, "setObject:forKeyedSubscript:", v14, v8);

          CLKLoggingObjectForDomain(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v23 = v8;
            v24 = 1024;
            v25 = v13;
            _os_log_impl(&dword_2114F4000, v15, OS_LOG_TYPE_DEFAULT, "CLKDevice _checkUpdateFlushCapabilitiesCache_locked: [%{public}@] changed to [%d]", buf, 0x12u);
          }

          v5 = 1;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

+ (double)screenScaleForSizeClass:(unint64_t)a3
{
  return 2.0;
}

+ (double)screenCornerRadiusForSizeClass:(unint64_t)a3
{
  double result;

  result = 28.0;
  if (a3 <= 8)
    return dbl_211565B38[a3];
  return result;
}

+ (CGRect)screenBoundsForSizeClass:(unint64_t)a3
{
  __int128 v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  CGRect result;

  switch(a3)
  {
    case 0uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 170.0;
      v5 = 0x4061000000000000;
      goto LABEL_11;
    case 1uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 195.0;
      v6 = 156.0;
      break;
    case 2uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 197.0;
      v6 = 162.0;
      break;
    case 3uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 224.0;
      v5 = 0x4067000000000000;
      goto LABEL_11;
    case 4uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 215.0;
      v5 = 0x4066000000000000;
      goto LABEL_11;
    case 5uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 242.0;
      v6 = 198.0;
      break;
    case 6uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 251.0;
      v6 = 205.0;
      break;
    case 7uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 223.0;
      v6 = 187.0;
      break;
    case 8uLL:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = 248.0;
      v5 = 0x406A000000000000;
LABEL_11:
      v6 = *(double *)&v5;
      break;
    default:
      break;
  }
  v7 = *((double *)&v3 + 1);
  result.origin.x = *(double *)&v3;
  result.size.height = v4;
  result.size.width = v6;
  result.origin.y = v7;
  return result;
}

- (BOOL)supportsVictoryFaces
{
  return self->_supportsVictoryFaces;
}

- (void)setIsBridgeActive:(BOOL)a3
{
  self->_isBridgeActive = a3;
}

- (double)screenCornerRadius
{
  return self->_screenCornerRadius;
}

- (BOOL)isBridgeActive
{
  return self->_isBridgeActive;
}

+ (void)initialize
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Bridge"));

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__deviceDidBecomeActive_, *MEMORY[0x24BE6B420], 0);

    }
  }
}

- (BOOL)supportsWidgetMigration
{
  return self->_nrDevice != 0;
}

- (int64_t)productFamilyType
{
  unint64_t productType;

  productType = self->_productType;
  if (productType > 0x32)
    return -1;
  else
    return qword_2115659A0[productType];
}

- (unint64_t)materialType
{
  return self->_materialType;
}

- (BOOL)isZeusBlack
{
  return self->_isZeusBlack;
}

- (BOOL)isExplorer
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_isExplorer;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (NSNumber)deviceBrand
{
  return self->_deviceBrand;
}

- (CLKDeviceDescriptor)descriptor
{
  CLKDeviceDescriptor *v3;
  void *v4;
  CLKDeviceDescriptor *v5;

  v3 = [CLKDeviceDescriptor alloc];
  -[NRDevice pairingID](self->_nrDevice, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLKDeviceDescriptor initWithNRDeviceUUID:](v3, "initWithNRDeviceUUID:", v4);

  return v5;
}

+ (id)deviceForDescriptor:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "nrDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceForNRDeviceUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setCurrentDevice:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CLKLoggingObjectForDomain(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "nrDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Setting new current device. %{public}@, %{public}@", (uint8_t *)&v8, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&__deviceLock);
  v7 = (void *)__currentDevice;
  __currentDevice = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&__deviceLock);
}

+ (void)resetCurrentDevice
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL8 v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1)
    dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_470);
  v3 = _CLKDeviceHasNanoRegistryEntitlement_hasEntitlement;
  if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
  {
    +[CLKDevice activeNRDevice](CLKDevice, "activeNRDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  CLKLoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v4 == 0;
    v12 = 2048;
    v13 = v3;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "Resetting current device with nrdevice %{public}@ - isNil:%lu hasEntitlement:%lu", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(a1, "_createCurrentDeviceWithNRDevice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCurrentDevice:", v7);

}

+ (void)enumerateSizeClasses:(id)a3
{
  void (**v3)(id, uint64_t, _BYTE *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t, _BYTE *))a3;
  v12 = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(&unk_24CC18190, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(&unk_24CC18190);
      if (v12)
        break;
      v3[2](v3, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "integerValue"), &v12);
      if (v5 == v7)
      {
        v5 = objc_msgSend(&unk_24CC18190, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __33__CLKDevice_customCompanionSetup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CLKLoggingObjectForDomain(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = WeakRetained;
      _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Got NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification refresh CLKDevice: %@", (uint8_t *)&v5, 0xCu);
    }

    if (objc_msgSend(WeakRetained, "_queryAndCacheNanoRegistryDeviceCapabilities"))
    {
      CLKLoggingObjectForDomain(0);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138412290;
        v6 = WeakRetained;
        _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification capabilities changed sending CLKActiveDeviceChangedNotification for CLKDevice: %@", (uint8_t *)&v5, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("CLKActiveDeviceChangedNotification"), WeakRetained);

    }
  }

}

- (void)handleDeviceDidPairNotification
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CLKDevice *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CLKDevice nrDevice](self, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CLKLoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "Received device paired notification: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__CLKDevice_handleDeviceDidPairNotification__block_invoke;
  v7[3] = &unk_24CBFA008;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __44__CLKDevice_handleDeviceDidPairNotification__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "nrDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleNRDeviceChanged:", v3);

  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__CLKDevice_handleDeviceDidPairNotification__block_invoke_cold_1(v4);

  }
  return objc_msgSend(*(id *)(a1 + 40), "updateTinkerState");
}

+ (void)_deviceDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6B418]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CLKLoggingObjectForDomain(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2114F4000, v6, OS_LOG_TYPE_DEFAULT, "new NRDevice became active - %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(a1, "_handleNRDeviceChanged:", v5);

}

+ (void)_handleNRDeviceChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "_createCurrentDeviceWithNRDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCurrentDevice:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CLKActiveDeviceChangedNotification"), 0);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_pairedDeviceCapabilitiesChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CLKDevice;
  -[CLKDevice dealloc](&v3, sel_dealloc);
}

- (BOOL)isTinker
{
  CLKDevice *v2;
  os_unfair_lock_s *p_protectedLock;

  v2 = self;
  p_protectedLock = &self->_protectedLock;
  os_unfair_lock_lock(&self->_protectedLock);
  LOBYTE(v2) = v2->_isTinker;
  os_unfair_lock_unlock(p_protectedLock);
  return (char)v2;
}

void __30__CLKDevice_updateTinkerState__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("CLKActiveDeviceChangedTinkerState"), 0);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "nrDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[CLKDevice nrDevice](self, "nrDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v6 = 1;
        goto LABEL_7;
      }
    }
    objc_msgSend(v4, "nrDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKDevice nrDevice](self, "nrDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return -[NRDevice hash](self->_nrDevice, "hash");
}

void __46__CLKDevice_productTypeFromProductTypeString___block_invoke()
{
  void *v0;

  v0 = (void *)productTypeFromProductTypeString__mapping;
  productTypeFromProductTypeString__mapping = (uint64_t)&unk_24CC18140;

}

- (BOOL)hasRichMediaComplications
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_hasRichMediaComplications;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsUrsa
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsUrsa;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsPolaris
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsPolaris;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsCharon
{
  CLKDevice *v2;
  os_unfair_lock_s *p_capabilitiesLock;

  v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsCharon;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)isLocked
{
  uint64_t v3;
  BOOL v4;

  if (_RegisterForLockedStatusChangeIfNecessary_onceToken != -1)
    dispatch_once(&_RegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_497);
  v3 = MKBGetDeviceLockState();
  -[CLKDevice updateKeybagLockStateCacheWithState:](self, "updateKeybagLockStateCacheWithState:", v3);
  if ((_DWORD)v3)
    v4 = (_DWORD)v3 == 3;
  else
    v4 = 1;
  return !v4;
}

- (BOOL)unlockedSinceBoot
{
  uint64_t v3;

  if (_RegisterForLockedStatusChangeIfNecessary_onceToken != -1)
    dispatch_once(&_RegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_497);
  v3 = MKBGetDeviceLockState();
  -[CLKDevice updateKeybagLockStateCacheWithState:](self, "updateKeybagLockStateCacheWithState:", v3);
  return (_DWORD)v3 == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

- (void)updateKeybagLockStateCacheWithState:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__CLKDevice_updateKeybagLockStateCacheWithState___block_invoke;
  v3[3] = &unk_24CBFA070;
  v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __49__CLKDevice_updateKeybagLockStateCacheWithState___block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  v2 = *(_DWORD *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "cachedKeybagLockState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedKeybagLockState:", *(unsigned int *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CLKDeviceLockStateChangedNotification"), 0);

  }
}

+ (id)deviceForNRDevice:(id)a3
{
  return (id)objc_msgSend(a1, "deviceForNRDevice:forced:", a3, 0);
}

+ (void)_removeCachedDeviceForUUID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (cachedDevices)
    {
      objc_msgSend((id)cachedDevices, "removeObjectForKey:", v3);
      CLKLoggingObjectForDomain(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "UUIDString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Purged CLKDevice with UUID %@", (uint8_t *)&v6, 0xCu);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  }

}

+ (unsigned)NRProductVersionForNRDevice:(id)a3
{
  return NRWatchOSVersionForRemoteDevice();
}

+ (BOOL)NRDeviceIsRunningDaytonaOrLater:(id)a3
{
  return NRWatchOSVersionForRemoteDevice() >> 16 > 2;
}

- (unsigned)nrDeviceVersion
{
  void *v2;
  unsigned int v3;

  -[CLKDevice nrDevice](self, "nrDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NRWatchOSVersionForRemoteDevice();

  return v3;
}

uint64_t __37__CLKDevice_nrDeviceForNRDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)CLKDeviceUUIDForNRDevice:(id)a3
{
  return (id)objc_msgSend(a3, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
}

- (BOOL)isPaired
{
  void *v2;
  void *v3;
  BOOL v4;

  +[CLKDevice activeNRDevice](CLKDevice, "activeNRDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setSizeClass:(unint64_t)a3
{
  self->_sizeClass = a3;
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

- (void)setScreenCornerRadius:(double)a3
{
  self->_screenCornerRadius = a3;
}

- (BOOL)isLuxo
{
  return self->_isLuxo;
}

- (void)setIsLuxo:(BOOL)a3
{
  self->_isLuxo = a3;
}

- (void)setIsExplorer:(BOOL)a3
{
  self->_isExplorer = a3;
}

- (void)setHasRichMediaComplications:(BOOL)a3
{
  self->_hasRichMediaComplications = a3;
}

- (void)setSupportsUrsa:(BOOL)a3
{
  self->_supportsUrsa = a3;
}

- (BOOL)supportsTritium
{
  return self->_supportsTritium;
}

- (void)setIsTinker:(BOOL)a3
{
  self->_isTinker = a3;
}

- (void)setSupportsPolaris:(BOOL)a3
{
  self->_supportsPolaris = a3;
}

- (void)setSupportsCharon:(BOOL)a3
{
  self->_supportsCharon = a3;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (void)setMaterialType:(unint64_t)a3
{
  self->_materialType = a3;
}

- (int64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(int64_t)a3
{
  self->_productType = a3;
}

- (BOOL)isRunningDaytonaOrLater
{
  return self->_isRunningDaytonaOrLater;
}

- (BOOL)isRunningGloryFOrLater
{
  return self->_isRunningGloryFOrLater;
}

- (BOOL)isRunningGloryGMOrLater
{
  return self->_isRunningGloryGMOrLater;
}

- (BOOL)limitedToPreGlory
{
  return self->_limitedToPreGlory;
}

- (BOOL)limitedToPreHunter
{
  return self->_limitedToPreHunter;
}

- (int)pairedDeviceCapabilitiesChangeNotificationToken
{
  return self->_pairedDeviceCapabilitiesChangeNotificationToken;
}

- (os_unfair_lock_s)capabilitiesLock
{
  return self->_capabilitiesLock;
}

- (NSMutableDictionary)supportedCapabilitiesCache
{
  return self->_supportedCapabilitiesCache;
}

- (void)setSupportedCapabilitiesCache:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCapabilitiesCache, a3);
}

- (int)cachedKeybagLockState
{
  return self->_cachedKeybagLockState;
}

- (void)setCachedKeybagLockState:(int)a3
{
  self->_cachedKeybagLockState = a3;
}

- (os_unfair_lock_s)protectedLock
{
  return self->_protectedLock;
}

- (void)setProtectedLock:(os_unfair_lock_s)a3
{
  self->_protectedLock = a3;
}

- (BOOL)supportsCompanionSync
{
  return self->_supportsCompanionSync;
}

- (void)setSupportsCompanionSync:(BOOL)a3
{
  self->_supportsCompanionSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCapabilitiesCache, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
  objc_storeStrong((id *)&self->_deviceBrand, 0);
}

- (CLKDevice)initWithSizeClass:(unint64_t)a3
{
  CLKDevice *result;

  result = -[CLKDevice initWithNRDevice:](self, "initWithNRDevice:", 0);
  if (result)
    result->_sizeClass = a3;
  return result;
}

void __44__CLKDevice_handleDeviceDidPairNotification__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Received device paired notification, but skipping NRDevice update because UUID is nil", v1, 2u);
}

+ (void)nrDeviceForNRDeviceUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2114F4000, a1, a3, "Calls to %s require NanoRegistry entitlement!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)activeNRDevice
{
  OUTLINED_FUNCTION_2_2(&dword_2114F4000, a1, a3, "Calls to %s require NanoRegistry entitlement!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
