@implementation HAENLocationGatingHelper

uint64_t __34__HAENLocationGatingHelper_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateImpl");
}

- (void)_contryConfigurationDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "Received Geo Location Notification from GeoServices", v5, 2u);
  }

  -[HAENLocationGatingHelper update](self, "update");
}

- (void)update
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HAENLocationGatingHelper_update__block_invoke;
  block[3] = &unk_24D19F190;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

- (void)_updateImpl
{
  HAENGeoLocation *v3;
  NSObject *v4;
  HAENGeoLocation *geoLocation;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  HAENGeoLocation *v12;
  __int16 v13;
  HAENGeoLocation *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HAENLocationGatingHelper _logLocationGatingFlags](self, "_logLocationGatingFlags");
  v3 = objc_alloc_init(HAENGeoLocation);
  if (-[HAENGeoLocation source](self->_geoLocation, "source") == 2)
  {
    HAENotificationsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      geoLocation = self->_geoLocation;
      v11 = 138412546;
      v12 = geoLocation;
      v13 = 2112;
      v14 = v3;
      v6 = "geo location since was overriden: %@, new location: %@";
      v7 = v4;
      v8 = 22;
LABEL_7:
      _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = -[HAENLocationGatingHelper _shouldUpdateLocation:](self, "_shouldUpdateLocation:", v3);
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "updating to new geo location: %@";
      v7 = v4;
      v8 = 12;
      goto LABEL_7;
    }
LABEL_8:

    objc_storeStrong((id *)&self->_geoLocation, v3);
    -[HAENLocationGatingHelper _updateLocationGatingFlags](self, "_updateLocationGatingFlags");
    goto LABEL_12;
  }
  if (v10)
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAEN GeoLocation update skipped for new location: %@", (uint8_t *)&v11, 0xCu);
  }

LABEL_12:
}

- (BOOL)_shouldUpdateLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  GetDeviceSpecificDefaults(CFSTR("HAENFeatureMandatory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAENLocationGatingHelper _isIPad](self, "_isIPad") && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    GetDeviceSpecificDefaults(CFSTR("HAENGeoLocationSource"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)v7;
    else
      v8 = &unk_24D1A3020;
    v6 = -[HAENLocationGatingHelper _validCountryCodeSource:](self, "_validCountryCodeSource:", objc_msgSend(v4, "source"));
    HAENotificationsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "describeSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2144B3000, v9, OS_LOG_TYPE_DEFAULT, "Stored geo location source: %@, new source: %@, valid: %@", (uint8_t *)&v13, 0x20u);

    }
    if ((_DWORD)v6)
    {
      LODWORD(v6) = objc_msgSend(v4, "source");
      LOBYTE(v6) = v6 > objc_msgSend(v8, "intValue");
    }

  }
  return v6;
}

- (BOOL)_validCountryCodeSource:(unsigned int)a3
{
  return a3 == 2 || (a3 & 0xFFFFFFFE) == 4;
}

- (void)_logLocationGatingFlags
{
  const __CFString *v2;
  CFDictionaryRef v3;
  NSObject *v4;
  int v5;
  CFDictionaryRef v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFString *)*MEMORY[0x24BE0A198];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BE0A198]);
  v3 = CFPreferencesCopyMultiple(0, v2, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAEN flags: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)_isIPad
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_7 != -1)
    dispatch_once(&sharedInstance_once_7, &__block_literal_global_10);
  return (id)sharedInstance_instance_7;
}

void __42__HAENLocationGatingHelper_sharedInstance__block_invoke()
{
  HAENLocationGatingHelper *v0;
  void *v1;

  v0 = objc_alloc_init(HAENLocationGatingHelper);
  v1 = (void *)sharedInstance_instance_7;
  sharedInstance_instance_7 = (uint64_t)v0;

}

- (HAENLocationGatingHelper)init
{
  HAENLocationGatingHelper *v2;
  HAENGeoLocation *v3;
  HAENGeoLocation *geoLocation;
  NSObject *v5;
  HAENGeoLocation *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *updateQueue;
  id v10;
  uint64_t v11;
  NSNumber *productTypeOverride;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v15;
  HAENGeoLocation *v16;
  objc_super v18;
  uint8_t buf[4];
  HAENGeoLocation *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)HAENLocationGatingHelper;
  v2 = -[HAENLocationGatingHelper init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HAENGeoLocation);
    geoLocation = v2->_geoLocation;
    v2->_geoLocation = v3;

    HAENotificationsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v2->_geoLocation;
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "HAENLocationGating: geo location at init time: %@", buf, 0xCu);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreaudio.hae.location_gating", v7);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v10, "getPreferenceFor:", *MEMORY[0x24BE0A1C8]);
    v11 = objc_claimAutoreleasedReturnValue();
    productTypeOverride = v2->_productTypeOverride;
    v2->_productTypeOverride = (NSNumber *)v11;

    if (-[HAENGeoLocation source](v2->_geoLocation, "source") != 2)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__contryConfigurationDidChange_, *MEMORY[0x24BE3C9E0], 0);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)GeoLocationDidChange, (CFStringRef)*MEMORY[0x24BE0A168], 0, (CFNotificationSuspensionBehavior)0);
    v2->_EUVolumeLimitFlagOn = MGGetBoolAnswer();
    HAENotificationsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2->_EUVolumeLimitFlagOn);
      v16 = (HAENGeoLocation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_DEFAULT, "HAENLocationGating: EU Volume Limit behavior: %@", buf, 0xCu);

    }
    -[HAENLocationGatingHelper _loadRegionPlistFile](v2, "_loadRegionPlistFile");
    -[HAENLocationGatingHelper update](v2, "update");
    -[HAENLocationGatingHelper _donateSignalToTipsKitOnInitialization](v2, "_donateSignalToTipsKitOnInitialization");
  }
  return v2;
}

- (void)_setFeatureMandatoryFlag:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "*** setting HAEN feature mandatory flag to %@", (uint8_t *)&v6, 0xCu);
  }

  SetDeviceSpecificDefaultsFor(CFSTR("HAENFeatureMandatory"), v4);
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BE0A198]);
  -[HAENLocationGatingHelper _updateSampleTransient:](self, "_updateSampleTransient:", v4);
  -[HAENLocationGatingHelper _setHEANEnabled:](self, "_setHEANEnabled:", v4);

}

- (void)_updateLocationGatingFlags
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[HAENGeoLocation source](self->_geoLocation, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SetDeviceSpecificDefaultsFor(CFSTR("HAENGeoLocationSource"), v3);

  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BE0A198]);
  -[HAENLocationGatingHelper _readDeviceDisposition](self, "_readDeviceDisposition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[HAENLocationGatingHelper _isHAENFeatureMandatory:dataDisposition:](self, "_isHAENFeatureMandatory:dataDisposition:", self->_geoLocation, v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAENLocationGatingHelper _setFeatureMandatoryFlag:](self, "_setFeatureMandatoryFlag:", v5);

}

- (void)_setHEANEnabled:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v4 = (id)objc_msgSend(v3, "setPreferenceFor:value:", *MEMORY[0x24BE0A1E0], v5);

}

- (void)_updateSampleTransient:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "BOOLValue"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v3, "removePreferenceFor:", *MEMORY[0x24BE0A200]);
    objc_msgSend(v3, "migrateKeyEnableHAEHKMeasurement:", 0);

  }
}

- (void)deviceDataDispositionDidChange
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HAENLocationGatingHelper_deviceDataDispositionDidChange__block_invoke;
  block[3] = &unk_24D19F190;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __58__HAENLocationGatingHelper_deviceDataDispositionDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "HAEN Location Gating updating device data disposition", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateImpl");
}

- (BOOL)_isMandatoryDeviceClass
{
  if (_isMandatoryDeviceClass_once != -1)
    dispatch_once(&_isMandatoryDeviceClass_once, &__block_literal_global_69);
  return _isMandatoryDeviceClass_ans;
}

void __51__HAENLocationGatingHelper__isMandatoryDeviceClass__block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGGetStringAnswer();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Watch"));
  }
  _isMandatoryDeviceClass_ans = v0;

}

- (BOOL)_isHAENFeatureMandatory:(id)a3 dataDisposition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAENLocationGatingHelper _regionAndDeviceMandatesFeature:](self, "_regionAndDeviceMandatesFeature:", v8);

  v10 = !v9 | objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE0A190]);
  if (self->_EUVolumeLimitFlagOn)
    v11 = 0;
  else
    v11 = v10;
  v12 = (-[HAENLocationGatingHelper _isIPad](self, "_isIPad") | v11) ^ 1;
  HAENotificationsLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_EUVolumeLimitFlagOn);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_2144B3000, v13, OS_LOG_TYPE_DEFAULT, "*** HAE Feature Regional Status: ** %@ ** [ Mandatory: %@, Dispositon: %@, EUVolumeLimit: %@ ]", (uint8_t *)&v18, 0x2Au);

  }
  -[HAENLocationGatingHelper _updateStatsWithGeoLocation:disposition:andMandatoryFlag:](self, "_updateStatsWithGeoLocation:disposition:andMandatoryFlag:", v7, v6, v12);

  -[HAENLocationGatingHelper _donateSignalToTipsKit:](self, "_donateSignalToTipsKit:", v12);
  return v12;
}

- (id)_readDeviceDisposition
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  GetDeviceSpecificDefaults((const __CFString *)*MEMORY[0x24BE0A1C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, "*** Device data disposition is: %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (BOOL)_validDataDisposition:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A190]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A188]);

  return v4;
}

- (BOOL)_isIPod
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPod"));

  return v3;
}

- (void)_loadRegionPlistFile
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144B3000, log, OS_LOG_TYPE_ERROR, "Failed to load regional behavior plist", v1, 2u);
}

- (BOOL)_regionAndDeviceMandatesFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  BOOL v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_regionBehavior, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("haen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = -[HAENLocationGatingHelper _isMandatoryDeviceClass](self, "_isMandatoryDeviceClass");
    HAENotificationsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "optional";
      if (v7)
        v11 = "mandatory";
      else
        v11 = "optional";
      v14 = 136315650;
      v15 = v11;
      if (v8)
        v10 = "mandatory";
      v16 = 2112;
      v17 = v4;
      v18 = 2080;
      v19 = v10;
      _os_log_impl(&dword_2144B3000, v9, OS_LOG_TYPE_DEFAULT, "HAEN is [%s] for country: [%@] with device [%s]", (uint8_t *)&v14, 0x20u);
    }

    v12 = v7 & v8;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int)_getMGProductType
{
  int v3;
  NSNumber *productTypeOverride;
  NSObject *v5;
  unint64_t v6;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = MGGetProductType();
  productTypeOverride = self->_productTypeOverride;
  if (productTypeOverride)
  {
    v3 = -[NSNumber unsignedIntValue](productTypeOverride, "unsignedIntValue");
    HAENotificationsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSNumber unsignedLongValue](self->_productTypeOverride, "unsignedLongValue");
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "HAEN device product type is overriden: 0x%08lx", (uint8_t *)&v8, 0xCu);
    }

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[HAENGeoLocation source](self->_geoLocation, "source") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE3C9E0], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)HAENLocationGatingHelper;
  -[HAENLocationGatingHelper dealloc](&v4, sel_dealloc);
}

- ($B3539EB95208BC17E9E1039C55835172)getStats
{
  return ($B3539EB95208BC17E9E1039C55835172 *)__copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)retstr, (uint64_t)&self->_stats);
}

- (void)_updateStatsWithGeoLocation:(id)a3 disposition:(id)a4 andMandatoryFlag:(BOOL)a5
{
  id v9;
  id v10;
  objc_class *v11;
  NSString *countryCode;
  HAENGeoLocation *v13;
  HAENGeoLocation *geoLocation;
  void *v15;
  id v16[4];

  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "countryCode");
  v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
  countryCode = self->_stats.countryCode;
  self = (HAENLocationGatingHelper *)((char *)self + 48);
  self->super.isa = v11;

  objc_msgSend(v10, "describeSource");
  v13 = (HAENGeoLocation *)objc_claimAutoreleasedReturnValue();

  geoLocation = self->_geoLocation;
  self->_geoLocation = v13;

  objc_storeStrong((id *)&self->_updateQueue, a4);
  LOBYTE(self->_regionBehavior) = a5;
  BYTE1(self->_regionBehavior) = self[-1]._stats.disposition;
  +[HAENStatistics sharedInstance](HAENStatistics, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)v16, (uint64_t)self);
  if (v15)
  {
    objc_msgSend(v15, "processStatsForLocationGating:", v16);
  }
  else
  {

  }
}

- (void)_donateSignalToTipsKit:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE0CDB8], "discoverabilitySignal");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE0CB78]);
  if (v3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.Health.Hearing.HAENRequired"), CFSTR("com.apple.Health"), v6);
  objc_msgSend(v4, "sendEvent:", v7);
  if (!v3)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v8, "getPreferenceFor:", *MEMORY[0x24BE0A1E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = objc_alloc(MEMORY[0x24BE0CB78]);
    if (v10)
      v12 = CFSTR("true");
    else
      v12 = CFSTR("false");
    v13 = (void *)objc_msgSend(v11, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.Health.Hearing.HAENOptIn"), CFSTR("com.apple.Health"), v12);
    objc_msgSend(v4, "sendEvent:", v13);

  }
}

- (void)_donateSignalToTipsKitOnInitialization
{
  void *v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BE0A198]);
  GetDeviceSpecificDefaults(CFSTR("HAENFeatureMandatory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 60000000000);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__HAENLocationGatingHelper__donateSignalToTipsKitOnInitialization__block_invoke;
  v6[3] = &unk_24D19F1B8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v6);

}

uint64_t __66__HAENLocationGatingHelper__donateSignalToTipsKitOnInitialization__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
    goto LABEL_5;
  if ((objc_msgSend(v3, "_isMandatoryDeviceClass") & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
LABEL_5:
    v4 = objc_msgSend(v2, "BOOLValue");
    return objc_msgSend(v3, "_donateSignalToTipsKit:", v4);
  }
  v4 = 1;
  return objc_msgSend(v3, "_donateSignalToTipsKit:", v4);
}

- (void)reloadProductTypeOverride
{
  NSNumber *v3;
  NSNumber *productTypeOverride;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v5, "getPreferenceFor:", *MEMORY[0x24BE0A1C8]);
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  productTypeOverride = self->_productTypeOverride;
  self->_productTypeOverride = v3;

}

- (void).cxx_destruct
{
  __destructor_8_s0_s8_s16((id *)&self->_stats.countryCode);
  objc_storeStrong((id *)&self->_productTypeOverride, 0);
  objc_storeStrong((id *)&self->_regionBehavior, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
}

@end
