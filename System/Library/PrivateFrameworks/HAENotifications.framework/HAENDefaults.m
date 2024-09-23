@implementation HAENDefaults

+ (id)sharedInstance
{
  if (sharedInstance_once_5 != -1)
    dispatch_once(&sharedInstance_once_5, &__block_literal_global_7);
  return (id)sharedInstance_instance_5;
}

void __30__HAENDefaults_sharedInstance__block_invoke()
{
  HAENDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(HAENDefaults);
  v1 = (void *)sharedInstance_instance_5;
  sharedInstance_instance_5 = (uint64_t)v0;

}

- (HAENDefaults)init
{
  HAENDefaults *v2;
  HAENDefaults *v3;
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HAENDefaults;
  v2 = -[HAENDefaults init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BE0A230]);
      objc_msgSend(v4, "removePreferenceFor:notify:", *MEMORY[0x24BE0A1A0], 0);

    }
    -[HAENDefaults forceReadDefaults](v3, "forceReadDefaults");
    -[HAENDefaults _registerNotification:](v3, "_registerNotification:", *MEMORY[0x24BE0A170]);
    -[HAENDefaults _registerNotification:](v3, "_registerNotification:", *MEMORY[0x24BE0A158]);
    -[HAENDefaults _registerNotification:](v3, "_registerNotification:", *MEMORY[0x24BE0A178]);
    if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd"))
    {
      -[HAENDefaults _registerNotification:](v3, "_registerNotification:", *MEMORY[0x24BE0A160]);
      -[HAENDefaults _registerNotification:](v3, "_registerNotification:", *MEMORY[0x24BE0A180]);
    }
    v5 = (void *)MGGetStringAnswer();
    if (-[HAENDefaults isHAENFeatureEnabled](v3, "isHAENFeatureEnabled")
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("iPad")) & 1) == 0)
    {
      v3->_EUVolumeLimitFlag = MGGetBoolAnswer();
      v6 = MGGetBoolAnswer();
    }
    else
    {
      v6 = 0;
      v3->_EUVolumeLimitFlag = 0;
    }
    v3->_SKVolumeLimitFlag = v6;

  }
  return v3;
}

- (void)forceReadDefaults
{
  NSObject *v3;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *domainSettings;
  NSObject *v15;
  NSMutableDictionary *v16;
  _QWORD v17[11];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("re-load");
    if (!self->_domainSettings)
      v4 = CFSTR("load");
    *(_DWORD *)buf = 138412290;
    v19 = (void *)v4;
    _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, "%@ defaults...", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v5 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v6 = *MEMORY[0x24BE0A200];
  v17[0] = *MEMORY[0x24BE0A1E0];
  v17[1] = v6;
  v7 = *MEMORY[0x24BE0A1F0];
  v17[2] = *MEMORY[0x24BE0A220];
  v17[3] = v7;
  v8 = *MEMORY[0x24BE0A1D8];
  v17[4] = *MEMORY[0x24BE0A1D0];
  v17[5] = v8;
  v9 = *MEMORY[0x24BE0A1A0];
  v17[6] = *MEMORY[0x24BE0A1F8];
  v17[7] = v9;
  v10 = *MEMORY[0x24BE0A218];
  v17[8] = *MEMORY[0x24BE0A210];
  v17[9] = v10;
  v17[10] = *MEMORY[0x24BE0A208];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreferencesFor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
  domainSettings = self->_domainSettings;
  self->_domainSettings = v13;

  os_unfair_lock_unlock(&self->_lock);
  HAENotificationsLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_domainSettings;
    *(_DWORD *)buf = 138412290;
    v19 = v16;
    _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_DEFAULT, "HAEN Defaults: %@", buf, 0xCu);
  }

}

- (void)updateUserVolumeForVolumeLimit
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  char v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v4 = *MEMORY[0x24BE0A210];
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "VolumeLimit: %@ -> %@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject BOOLValue](v8, "BOOLValue"))
    goto LABEL_6;
  v9 = objc_msgSend(v5, "BOOLValue");

  if ((v9 & 1) == 0)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__HAENDefaults_updateUserVolumeForVolumeLimit__block_invoke;
    block[3] = &unk_24D19F190;
    block[4] = self;
    dispatch_async(v8, block);
LABEL_6:

  }
}

uint64_t __46__HAENDefaults_updateUserVolumeForVolumeLimit__block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = 0.5;
  LODWORD(a3) = 0.5;
  return objc_msgSend(*(id *)(a1 + 32), "setUserVolumeWithValue:mininum:", a2, a3);
}

- (void)setUserVolumeWithValue:(float)a3 mininum:(float)a4
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  getpid();
  v5 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HAENDefaults setUserVolumeWithValue:mininum:].cold.2(v5, v7, v8, v9, v10, v11, v12, v13);
LABEL_4:

    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = -1.0;
    _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "[VolumeLimit] current Volume  %f", buf, 0xCu);
  }

  if (a4 < -1.0)
  {
    getpid();
    v14 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
    HAENotificationsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if ((_DWORD)v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[HAENDefaults setUserVolumeWithValue:mininum:].cold.1(v14, v7, v16, v17, v18, v19, v20, v21);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = -1.0;
      _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "setUserVolumeWithValue success to %f", buf, 0xCu);
    }
    goto LABEL_4;
  }
}

- (double)getLiveMonitoringThreshold
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 100.0;
  }

  return v6;
}

- (BOOL)isHAENFeatureEnabled
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v4, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v7 = _os_feature_enabled_impl();
  v8 = +[HAENDefaults HAENSupportedForCurrentDeviceClass](HAENDefaults, "HAENSupportedForCurrentDeviceClass");
  v9 = v8;
  v10 = 0;
  if ((_DWORD)v7 && v8)
    v10 = objc_msgSend(v6, "BOOLValue");
  HAENotificationsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413314;
    v17 = v12;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_2144B3000, v11, OS_LOG_TYPE_DEFAULT, "hean feature status: [%@] mandatory: %@, enabled: %@, feature flag: %@ device supported: %@", (uint8_t *)&v16, 0x34u);

  }
  return v10;
}

- (BOOL)isHAENFeatureOptedIn
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;
  char v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v4, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isEUVolumeLimitOn
{
  return self->_EUVolumeLimitFlag;
}

- (BOOL)isSKVolumeLimitOn
{
  return self->_SKVolumeLimitFlag;
}

- (BOOL)isHAENFeatureMandatory
{
  os_unfair_lock_s *p_lock;
  id v3;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A1E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = objc_msgSend(v4, "BOOLValue");

  return (char)p_lock;
}

- (BOOL)isConnectedUnknownWiredDeviceHeadphone
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = objc_msgSend(v4, "BOOLValue");

  return (char)p_lock;
}

- (double)getLiveMonitorTimeWindowInSeconds
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 30.0;
  }

  return v6;
}

- (BOOL)isReduceLoudSoundEnabled
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A210]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = objc_msgSend(v4, "BOOLValue");

  return (char)p_lock;
}

- (BOOL)isHKWriteEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isHAEOtherDevicesEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v2, "getPreferenceFor:", *MEMORY[0x24BE0A1B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)getReduceLoudSoundThreshold
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A218]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  LODWORD(p_lock) = objc_msgSend(v4, "intValue");

  return (int)p_lock;
}

- (void)updateRLSSettings
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *domainSettings;
  NSMutableDictionary *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v4 = *MEMORY[0x24BE0A210];
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE0A218];
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  if (v5)
    -[NSMutableDictionary setObject:forKey:](domainSettings, "setObject:forKey:", v5, v4);
  else
    -[NSMutableDictionary removeObjectForKey:](domainSettings, "removeObjectForKey:", v4);
  v9 = self->_domainSettings;
  if (v7)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
  HAENotificationsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_DEFAULT, "updated RLS status, enabled: (%@), threshold: (%@)", (uint8_t *)&v11, 0x16u);
  }

}

- (double)volumeReductionDelta
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  double v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A220]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    if (v5 > 1.0 || v5 < 0.0)
      v7 = 0.125;
    else
      v7 = v5;
  }
  else
  {
    v7 = 0.125;
  }

  return v7;
}

- (id)_generateAccessoryKeyWithManufacture:(id)a3 andSerialNumber:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@_%@"), v7, v6);

  return v8;
}

- (int64_t)getAudioAccessoryConnectionInfoWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    v11 = -1;
    goto LABEL_25;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v11 = -1;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9 == 1)
  {
    v11 = 1;
    goto LABEL_24;
  }
  if (v9)
  {
    HAENotificationsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HAENDefaults getAudioAccessoryConnectionInfoWithKey:].cold.1();
    v11 = -1;
    goto LABEL_23;
  }
  v10 = MGGetStringAnswer();
  if (!-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("iPad"))
    || (MGGetBoolAnswer() & 1) == 0)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v13 <= 2
      && (objc_msgSend(v7, "objectForKey:", CFSTR("date")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = -[HAENDefaults _shouldRepromptSinceDate:](self, "_shouldRepromptSinceDate:", v14),
          v14,
          v15))
    {
      HAENotificationsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109120;
        v19 = v13;
        _os_log_impl(&dword_2144B3000, v16, OS_LOG_TYPE_DEFAULT, "re-surfacing prompt for not headphone. query count: %d", (uint8_t *)&v18, 8u);
      }
      v11 = -1;
    }
    else
    {
      HAENotificationsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109120;
        v19 = v13;
        _os_log_impl(&dword_2144B3000, v16, OS_LOG_TYPE_DEFAULT, "skipped re-surfacing prompt for not headphone. query count: %d", (uint8_t *)&v18, 8u);
      }
      v11 = 0;
    }

LABEL_23:
    goto LABEL_24;
  }

  v11 = 0;
LABEL_25:

  return v11;
}

- (int64_t)getAudioAccessoryConnectionInfo
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;

  v15 = 0;
  +[HAENAccessoryInfo getAccessoryInfo:](HAENAccessoryInfo, "getAccessoryInfo:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v3, "manufacturer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAENDefaults _generateAccessoryKeyWithManufacture:andSerialNumber:](self, "_generateAccessoryKeyWithManufacture:andSerialNumber:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = -[HAENDefaults getAudioAccessoryConnectionInfoWithKey:](self, "getAudioAccessoryConnectionInfoWithKey:", v13);
    goto LABEL_14;
  }
  if (v4)
  {
    v7 = HAENAccessoryInfoErrorDomain;
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v8) & 1) != 0)
    {
      v9 = objc_msgSend(v5, "code");

      if (v9 == 1)
        goto LABEL_8;
    }
    else
    {

    }
    HAENotificationsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HAENDefaults getAudioAccessoryConnectionInfo].cold.1();
    v10 = -2;
LABEL_14:

    goto LABEL_15;
  }
LABEL_8:
  v10 = -2;
LABEL_15:

  return v10;
}

- (BOOL)isCurrentAudioAccessoryHeadphoneWithKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  NSObject *v12;

  v4 = a3;
  if (+[HAENDefaults isRunningCITests](HAENDefaults, "isRunningCITests"))
    -[HAENDefaults forceReadDefaults](self, "forceReadDefaults");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    v11 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v7, "objectForKey:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v11 = v10 != 0;
  if (v10 >= 2)
  {
    HAENotificationsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HAENDefaults getAudioAccessoryConnectionInfoWithKey:].cold.1();

LABEL_9:
    v11 = 1;
  }

LABEL_12:
  return v11;
}

- (BOOL)isCurrentAudioAccessoryHeadphone
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;

  v15 = 0;
  +[HAENAccessoryInfo getAccessoryInfo:](HAENAccessoryInfo, "getAccessoryInfo:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v3, "manufacturer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAENDefaults _generateAccessoryKeyWithManufacture:andSerialNumber:](self, "_generateAccessoryKeyWithManufacture:andSerialNumber:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = -[HAENDefaults isCurrentAudioAccessoryHeadphoneWithKey:](self, "isCurrentAudioAccessoryHeadphoneWithKey:", v13);
    goto LABEL_14;
  }
  if (v4)
  {
    v7 = HAENAccessoryInfoErrorDomain;
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v8) & 1) != 0)
    {
      v9 = objc_msgSend(v5, "code");

      if (v9 == 1)
        goto LABEL_8;
    }
    else
    {

    }
    HAENotificationsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HAENDefaults getAudioAccessoryConnectionInfo].cold.1();
    v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_8:
  v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)_shouldRepromptSinceDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v10)
  {
    HAENotificationsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = 0;
      _os_log_impl(&dword_2144B3000, v11, OS_LOG_TYPE_DEFAULT, "invalid expiryDays %@", (uint8_t *)&v16, 0xCu);
    }

    v10 = &unk_24D1A2FD8;
  }
  objc_msgSend(v10, "doubleValue");
  v13 = v12 * 24.0 * 60.0 * 60.0;
  if (v8 >= v13)
  {
    HAENotificationsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2144B3000, v14, OS_LOG_TYPE_DEFAULT, "re-surface prompt", (uint8_t *)&v16, 2u);
    }

  }
  return v8 >= v13;
}

- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withKey:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  v31 = *MEMORY[0x24BE0A1D0];
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v32 = v10;
  if (v10)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  objc_msgSend(v11, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  if (v13
    && (objc_msgSend(v13, "objectForKey:", CFSTR("value")),
        v14 = a3,
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = (int)objc_msgSend(v15, "intValue"),
        v15,
        a3 = v14,
        v16 == v14))
  {
    v17 = v14;
    v18 = (void *)objc_msgSend(v33, "mutableCopy");
    objc_msgSend(v33, "objectForKey:", CFSTR("count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue") + 1;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("count"));

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v22, CFSTR("date"));

    v23 = v17;
    objc_msgSend(v18, "setObject:forKey:", v9, CFSTR("name"));
  }
  else
  {
    v30 = v8;
    v24 = (void *)MEMORY[0x24BDBCED8];
    v35[0] = &unk_24D1A2FF0;
    v34[0] = CFSTR("count");
    v34[1] = CFSTR("date");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    v34[2] = CFSTR("value");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = CFSTR("name");
    v35[2] = v26;
    v35[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryWithDictionary:", v27);
    v23 = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v30;
  }
  objc_msgSend(v12, "setValue:forKey:", v18, v8);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKey:](self->_domainSettings, "setObject:forKey:", v12, v31);
  os_unfair_lock_unlock(&self->_lock);
  -[HAENDefaults _updateSetting:value:notify:](self, "_updateSetting:value:notify:", v31, v12, 1);
  v28 = *MEMORY[0x24BE0A1A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23 == 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAENDefaults _updateSetting:value:notify:](self, "_updateSetting:value:notify:", v28, v29, 1);

}

- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = 0;
  +[HAENAccessoryInfo getAccessoryInfo:](HAENAccessoryInfo, "getAccessoryInfo:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    objc_msgSend(v7, "manufacturer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAENDefaults _generateAccessoryKeyWithManufacture:andSerialNumber:](self, "_generateAccessoryKeyWithManufacture:andSerialNumber:", v12, v13);
    v11 = objc_claimAutoreleasedReturnValue();

    -[HAENDefaults setAudioAccessoryIsConnectedToHeadphones:withKey:name:](self, "setAudioAccessoryIsConnectedToHeadphones:withKey:name:", a3, v11, v6);
  }
  else
  {
    HAENotificationsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HAENDefaults setAudioAccessoryIsConnectedToHeadphones:withName:].cold.1();
  }

}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 WithKey:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[8];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = *MEMORY[0x24BE0A1D0];
  -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:", *MEMORY[0x24BE0A1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
    v8 = (id)objc_msgSend(v7, "mutableCopy");
  else
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = v8;
  objc_msgSend(v8, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "objectForKey:", CFSTR("value")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = v5,
        v14 = (int)objc_msgSend(v12, "intValue"),
        v12,
        v15 = v14 == a3,
        v5 = v13,
        !v15))
  {
    v22 = v5;
    HAENotificationsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144B3000, v16, OS_LOG_TYPE_DEFAULT, "reset accessory info...", buf, 2u);
    }

    v17 = (void *)MEMORY[0x24BDBCED8];
    v26[0] = &unk_24D1A2FF0;
    v25[0] = CFSTR("count");
    v25[1] = CFSTR("date");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v18;
    v25[2] = CFSTR("value");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v22;
    objc_msgSend(v9, "setValue:forKey:", v21, v22);
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKey:](self->_domainSettings, "setObject:forKey:", v9, v6);
    os_unfair_lock_unlock(&self->_lock);
    -[HAENDefaults _updateSetting:value:notify:](self, "_updateSetting:value:notify:", v6, v9, 1);

  }
}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = a3;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "Update AudioAccessory Is Connected To Headphones %d", buf, 8u);
  }

  if (-[HAENDefaults isHAENFeatureEnabled](self, "isHAENFeatureEnabled"))
  {
    if ((MGGetBoolAnswer() & 1) != 0)
    {
      +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getDeviceUID");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      +[HAENAccessoryInfo getAccessoryInfo:](HAENAccessoryInfo, "getAccessoryInfo:", &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v6 = v9;
      if (!v8 || v9)
      {
        HAENotificationsLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[HAENDefaults setAudioAccessoryIsConnectedToHeadphones:withName:].cold.1();
        v7 = 0;
      }
      else
      {
        objc_msgSend(v8, "manufacturer");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "serialNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAENDefaults _generateAccessoryKeyWithManufacture:andSerialNumber:](self, "_generateAccessoryKeyWithManufacture:andSerialNumber:", v10, v11);
        v7 = objc_claimAutoreleasedReturnValue();

      }
    }

    if (v7)
    {
      -[HAENDefaults updateAudioAccessoryIsConnectedToHeadphones:WithKey:](self, "updateAudioAccessoryIsConnectedToHeadphones:WithKey:", a3, v7);
    }
    else
    {
      HAENotificationsLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[HAENDefaults updateAudioAccessoryIsConnectedToHeadphones:].cold.1(v12);

    }
  }
  else
  {
    HAENotificationsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "do not update accessory database since HAEN is disabled", buf, 2u);
    }
  }

}

- (void)removeAllAdapters
{
  NSObject *v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *domainSettings;
  uint64_t v6;
  id v7;
  uint8_t v8[16];

  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, "removing all adapters...", v8, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  v6 = *MEMORY[0x24BE0A1D0];
  -[NSMutableDictionary removeObjectForKey:](domainSettings, "removeObjectForKey:", *MEMORY[0x24BE0A1D0]);
  os_unfair_lock_unlock(p_lock);
  v7 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v7, "removePreferenceFor:notify:", v6, 1);

}

- (void)wiredDeviceStatusDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *domainSettings;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v4 = *MEMORY[0x24BE0A1A0];
  objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  if (v5)
  {
    -[NSMutableDictionary setObject:forKey:](domainSettings, "setObject:forKey:", v5, v4);
    os_unfair_lock_unlock(&self->_lock);
    -[HAENDefaults updateAudioAccessoryIsConnectedToHeadphones:](self, "updateAudioAccessoryIsConnectedToHeadphones:", objc_msgSend(v5, "BOOLValue"));
    +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "BOOLValue");
    v9 = v7;
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](domainSettings, "removeObjectForKey:", v4);
    os_unfair_lock_unlock(&self->_lock);
    +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = 0;
  }
  objc_msgSend(v9, "unknownWiredConnectionDidChange:", v8);

  HAENotificationsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_DEFAULT, "wired device is headphone: %@ ", (uint8_t *)&v11, 0xCu);
  }

}

- (void)_updateSetting:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BE0A230]);
  objc_msgSend(v9, "setPreferenceFor:value:notify:", v7, v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    HAENotificationsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HAENDefaults _updateSetting:value:notify:].cold.1();

  }
}

- (BOOL)softwareVersionEnabled
{
  return 1;
}

- (void)_registerNotification:(id)a3
{
  __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)settingsChanged, v4, 0, (CFNotificationSuspensionBehavior)0);
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "HAENDefaults registered darwin notification: %@", (uint8_t *)&v7, 0xCu);
  }

}

+ (BOOL)HAENSupportedForCurrentDeviceClass
{
  if (HAENSupportedForCurrentDeviceClass_once != -1)
    dispatch_once(&HAENSupportedForCurrentDeviceClass_once, &__block_literal_global_37);
  return HAENSupportedForCurrentDeviceClass_ans;
}

void __50__HAENDefaults_HAENSupportedForCurrentDeviceClass__block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGGetStringAnswer();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("iPad")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Watch"));
  }
  HAENSupportedForCurrentDeviceClass_ans = v0;

}

+ (BOOL)isCurrentProcessMediaserverd
{
  if (isCurrentProcessMediaserverd_once != -1)
    dispatch_once(&isCurrentProcessMediaserverd_once, &__block_literal_global_44);
  return isCurrentProcessMediaserverd_ans;
}

void __44__HAENDefaults_isCurrentProcessMediaserverd__block_invoke()
{
  int v0;
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  char v5;
  id v6;

  v0 = _os_feature_enabled_impl();
  v1 = CFSTR("mediaserverd");
  if (v0)
    v1 = CFSTR("audiomxd");
  v2 = (void *)MEMORY[0x24BDD1760];
  v3 = v1;
  objc_msgSend(v2, "processInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  isCurrentProcessMediaserverd_ans = v5;
}

+ (BOOL)isRunningCITests
{
  if (isRunningCITests_once != -1)
    dispatch_once(&isRunningCITests_once, &__block_literal_global_52);
  return isRunningCITests_ans;
}

void __32__HAENDefaults_isRunningCITests__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningCITests_ans = objc_msgSend(v0, "isEqualToString:", CFSTR("xctest"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSettings, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)setUserVolumeWithValue:(uint64_t)a3 mininum:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2144B3000, a2, a3, "CMSessionManager failed to set volume with Error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)setUserVolumeWithValue:(uint64_t)a3 mininum:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2144B3000, a2, a3, "CMSessionManager failed to get the existing volume with Error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)getAudioAccessoryConnectionInfoWithKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "unknown accessory info stored: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getAudioAccessoryConnectionInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "Unable to obtain accessory info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAudioAccessoryIsConnectedToHeadphones:withName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2144B3000, v0, v1, "failed to fetch current accesorry info %@, %@");
  OUTLINED_FUNCTION_1();
}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144B3000, log, OS_LOG_TYPE_ERROR, "accessory key not available ", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_updateSetting:value:notify:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2144B3000, v0, v1, "failed to update known accessory settings for key: %@, value: %@");
  OUTLINED_FUNCTION_1();
}

@end
