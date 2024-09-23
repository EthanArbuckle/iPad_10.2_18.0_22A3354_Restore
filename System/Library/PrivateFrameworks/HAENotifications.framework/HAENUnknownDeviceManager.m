@implementation HAENUnknownDeviceManager

+ (id)sharedInstance
{
  if ((+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd")
     || +[HAENDefaults isRunningCITests](HAENDefaults, "isRunningCITests"))
    && sharedInstance_once_6 != -1)
  {
    dispatch_once(&sharedInstance_once_6, &__block_literal_global_9);
  }
  return (id)sharedInstance_instance_6;
}

void __42__HAENUnknownDeviceManager_sharedInstance__block_invoke()
{
  HAENUnknownDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(HAENUnknownDeviceManager);
  v1 = (void *)sharedInstance_instance_6;
  sharedInstance_instance_6 = (uint64_t)v0;

}

- (HAENUnknownDeviceManager)init
{
  HAENUnknownDeviceManager *v2;
  HAENUnknownDeviceManager *v3;
  NSString *deviceName;
  NSString *deviceUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HAENUnknownDeviceManager;
  v2 = -[HAENUnknownDeviceManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_alertSupported = -[HAENUnknownDeviceManager _isAlertSupported](v2, "_isAlertSupported");
    deviceName = v3->_deviceName;
    v3->_deviceName = 0;

    deviceUID = v3->_deviceUID;
    v3->_deviceUID = 0;

    v3->_connectionCnt = 0;
    v3->_alertPending = 0;
    v3->_isWiredUnknown = 0;
    v3->_adamSessionID = 561211748;
  }
  return v3;
}

- (void)deviceSessionCreated:(id)a3 SessionID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *deviceUID;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    self->_isWiredUnknown = 0;
    objc_msgSend(v6, "objectForKey:", CFSTR("_HAENMetadataIdentifierHeadsetIsWired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("_HAENMetadataIdentifierDeviceName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("_HAENMetadataIdentifierHeadsetIsUnknown"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isWiredUnknown = objc_msgSend(v11, "BOOLValue");

      objc_msgSend(v7, "objectForKey:", CFSTR("_HAENMetadataIdentifierDeviceIdentifier"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      deviceUID = self->_deviceUID;
      self->_deviceUID = v12;

      if (v10)
      {
        -[HAENUnknownDeviceManager _wiredDeviceSessionCreated:SessionID:](self, "_wiredDeviceSessionCreated:SessionID:", v10, a4);
      }
      else
      {
        HAENotificationsLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HAENUnknownDeviceManager deviceSessionCreated:SessionID:].cold.1((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);

      }
    }
    +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceInfo:", v7);

  }
}

- (void)registerDevice:(id)a3
{
  id v4;
  NSString *v5;
  NSString *deviceUID;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  NSString *deviceName;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort"))
  {
    HAENotificationsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HAENUnknownDeviceManager registerDevice:].cold.2((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMetadataIdentifierDeviceIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceUID = self->_deviceUID;
    self->_deviceUID = v5;

    objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMetadataIdentifierHeadsetIsUnknown"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMetadataIdentifierHeadsetIsWired"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isWiredUnknown = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      self->_isWiredUnknown = 0;
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMetadataIdentifierDeviceName"));
    v16 = objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (self->_deviceUID)
    {
      v17 = -[NSObject copy](v16, "copy");
      deviceName = self->_deviceName;
      self->_deviceName = v17;

      if (self->_alertSupported && -[HAENUnknownDeviceManager _shouldSurfaceAlert:](self, "_shouldSurfaceAlert:", v9))
      {
        +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "getAudioAccessoryConnectionInfoWithKey:", self->_deviceUID);

        HAENotificationsLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 134217984;
          v30 = v20;
          _os_log_impl(&dword_2144B3000, v21, OS_LOG_TYPE_DEFAULT, "accessory returned value: %ld", (uint8_t *)&v29, 0xCu);
        }

        if (v20 == -1)
          -[HAENUnknownDeviceManager surfaceAlertBox](self, "surfaceAlertBox");
      }
LABEL_7:

      os_unfair_lock_unlock(&self->_lock);
      goto LABEL_8;
    }
    HAENotificationsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[HAENUnknownDeviceManager deviceSessionCreated:SessionID:].cold.1((uint64_t)v4, v22, v23, v24, v25, v26, v27, v28);

  }
LABEL_8:

}

- (void)setDeviceConnectionState:(id)a3 isConnected:(BOOL)a4
{
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort"))
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "getAudioAccessoryConnectionInfoWithKey:", v14);

    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BE0A230]);
      v10 = v9;
      v11 = *MEMORY[0x24BE0A1A0];
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v10, "setPreferenceFor:value:notify:", v11, v12, 1);

      }
      else
      {
        objc_msgSend(v9, "removePreferenceFor:", *MEMORY[0x24BE0A1A0]);
      }

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)_wiredDeviceSessionCreated:(id)a3 SessionID:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[HAENUnknownDeviceManager _wiredDeviceSessionInit:](self, "_wiredDeviceSessionInit:", v7);
  if (self->_adamSessionID != a4)
  {
    ++self->_connectionCnt;
    self->_adamSessionID = a4;
  }
  -[HAENUnknownDeviceManager _processWiredDevice:](self, "_processWiredDevice:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_wiredDeviceSessionInit:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *deviceName;
  int connectionCnt;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  id v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", self->_deviceName) & 1) == 0)
  {
    HAENotificationsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      connectionCnt = self->_connectionCnt;
      v11 = 138412802;
      v12 = v4;
      v13 = 2112;
      v14 = deviceName;
      v15 = 1024;
      v16 = connectionCnt;
      _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "new wired headset [%@], previous [%@], session count [%d]", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_connectionCnt >= 1)
    {
      HAENotificationsLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2144B3000, v8, OS_LOG_TYPE_DEFAULT, "**** old device has not been released yet, but replacing with new device", (uint8_t *)&v11, 2u);
      }

    }
    -[HAENUnknownDeviceManager _resetWiredStatus](self, "_resetWiredStatus");
    v9 = (NSString *)objc_msgSend(v4, "copy");
    v10 = self->_deviceName;
    self->_deviceName = v9;

  }
}

- (void)_processWiredDevice:(id)a3
{
  NSString *v4;
  _BOOL4 alertSupported;
  NSObject *v6;
  _BOOL4 v7;
  int connectionCnt;
  NSString *deviceUID;
  HAENUnknownDeviceManager *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  alertSupported = self->_alertSupported;
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (alertSupported)
  {
    if (v7)
    {
      connectionCnt = self->_connectionCnt;
      v11 = 138412546;
      v12 = v4;
      v13 = 1024;
      v14 = connectionCnt;
      _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "wired headset connected [%@], session count [%d]", (uint8_t *)&v11, 0x12u);
    }

    if (-[HAENUnknownDeviceManager _shouldSurfaceAlert:](self, "_shouldSurfaceAlert:", v4))
    {
      if (-[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort"))
      {
        deviceUID = self->_deviceUID;
        v10 = self;
      }
      else
      {
        v10 = self;
        deviceUID = v4;
      }
      -[HAENUnknownDeviceManager _processPrompt:](v10, "_processPrompt:", deviceUID);
    }
    else
    {
      -[HAENUnknownDeviceManager _updateMXVolumeLimitStatus:](self, "_updateMXVolumeLimitStatus:", v4);
    }
  }
  else
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "Alert not supported: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)updateWiredDeviceStatus
{
  OUTLINED_FUNCTION_0(&dword_2144B3000, a2, a3, "device [%@] alread released?", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (BOOL)unknownWiredHeadsetConnectedThroughB204
{
  HAENUnknownDeviceManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[HAENUnknownDeviceManager _isUnknownWiredHeadset:](v2, "_isUnknownWiredHeadset:", v2->_deviceName);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)getDeviceName
{
  return self->_deviceName;
}

- (id)getDeviceUID
{
  return self->_deviceUID;
}

- (BOOL)isDeviceHeadphoneJack:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("Codec"));
}

- (BOOL)isUSBCPort
{
  return MGGetBoolAnswer();
}

- (void)unknownWiredConnectionDidChange:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[HAENUnknownDeviceManager _isUnknownWiredHeadset:](self, "_isUnknownWiredHeadset:", self->_deviceName))
  {
    +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wiredHeadphoneConnected:", v3);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_processPrompt:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  int v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "found unknown wired headset!", (uint8_t *)&v18, 2u);
  }

  v6 = -[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort");
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "getAudioAccessoryConnectionInfoWithKey:", v4);
  else
    v9 = objc_msgSend(v7, "getAudioAccessoryConnectionInfo");
  v10 = v9;

  HAENotificationsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = v10;
    _os_log_impl(&dword_2144B3000, v11, OS_LOG_TYPE_DEFAULT, "accessory returned value: %ld", (uint8_t *)&v18, 0xCu);
  }

  if (v10 < 2)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE0A230]);
    v13 = *MEMORY[0x24BE0A1A0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10 == 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[NSObject setPreferenceFor:value:notify:](v12, "setPreferenceFor:value:notify:", v13, v14, 1);

LABEL_14:
    goto LABEL_15;
  }
  if (v10 != -1)
  {
    v16 = objc_alloc_init(MEMORY[0x24BE0A230]);
    v17 = (id)objc_msgSend(v16, "setPreferenceFor:value:notify:", *MEMORY[0x24BE0A1A0], &unk_24D1A3008, 1);

    HAENotificationsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v10;
      _os_log_impl(&dword_2144B3000, v12, OS_LOG_TYPE_DEFAULT, "notice: could not get accessory info: %ld, assumed to be headphone", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_14;
  }
  -[HAENUnknownDeviceManager surfaceAlertBox](self, "surfaceAlertBox");
LABEL_15:

}

- (void)_updateMXVolumeLimitStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HAENUnknownDeviceManager _isUnknownWiredHeadset:](self, "_isUnknownWiredHeadset:", v4))
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "softwareVersionEnabled") & 1) != 0)
    {

    }
    else
    {
      v10 = _os_feature_enabled_impl();

      if ((v10 & 1) == 0)
        goto LABEL_9;
    }
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isConnectedUnknownWiredDeviceHeadphone");

    if ((v12 & 1) == 0)
    {
      v13 = objc_alloc_init(MEMORY[0x24BE0A230]);
      v14 = (id)objc_msgSend(v13, "setPreferenceFor:value:", *MEMORY[0x24BE0A1A0], &unk_24D1A3008);

    }
LABEL_9:
    HAENotificationsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v7 = "assuming connected unknown device is headphone.";
      v8 = v6;
      v9 = 2;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    v7 = "Calibrated wired connection: %@";
    v8 = v6;
    v9 = 12;
LABEL_11:
    _os_log_impl(&dword_2144B3000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
  }
LABEL_12:

  +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wiredHeadphoneConnected:", 1);

}

- (void)surfaceAlertBox
{
  NSObject *v2;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (self->_alertPending)
  {
    HAENotificationsLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "alert box pending...", buf, 2u);
    }

  }
  else
  {
    self->_alertPending = 1;
    HAENotificationsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "surfacing alert box", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v7 = buf;
    v8 = 0x3042000000;
    v9 = __Block_byref_object_copy_;
    v10 = __Block_byref_object_dispose_;
    objc_initWeak(&v11, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__HAENUnknownDeviceManager_surfaceAlertBox__block_invoke;
    v5[3] = &unk_24D19F498;
    v5[4] = self;
    v5[5] = buf;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v11);
  }
}

void __43__HAENUnknownDeviceManager_surfaceAlertBox__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  _QWORD *WeakRetained;
  __CFUserNotification *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v28;
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[8];
  CFOptionFlags responseFlags;

  v26 = (void *)MEMORY[0x24BDBCE70];
  HAENLocalizationUtilityGetBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("AlertUnknownHeadsetTitle"), &stru_24D19FC68, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BDBD6D8];
  HAENLocalizationUtilityGetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer())
    v4 = CFSTR("AlertUnknownHeadsetMessage");
  else
    v4 = CFSTR("AlertUnknownHeadsetMessageNoHaptics");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D19FC68, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBD6E0];
  HAENLocalizationUtilityGetBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AlertButtonHeadphone"), &stru_24D19FC68, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBD6F8];
  HAENLocalizationUtilityGetBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AlertButtonOtherDevice"), &stru_24D19FC68, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v1, v2, v5, v6, v8, v9, v11, *MEMORY[0x24BDBD6F0], 0);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v12);
  WeakRetained[2] = v14;
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  if (responseFlags == 1)
  {
    HAENotificationsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_2144B3000, v22, OS_LOG_TYPE_INFO, "device is not a headphone", v30, 2u);
    }

    v23 = objc_msgSend(*(id *)(a1 + 32), "isUSBCPort");
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v23)
    {
      v20 = WeakRetained[3];
      v19 = WeakRetained[4];
      v21 = 0;
      goto LABEL_14;
    }
    v24 = WeakRetained[3];
    v25 = 0;
LABEL_19:
    -[NSObject setAudioAccessoryIsConnectedToHeadphones:withName:](v17, "setAudioAccessoryIsConnectedToHeadphones:withName:", v25, v24);
    goto LABEL_20;
  }
  if (!responseFlags)
  {
    HAENotificationsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_INFO, "device is a headphone", buf, 2u);
    }

    v16 = objc_msgSend(*(id *)(a1 + 32), "isUSBCPort");
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      v20 = WeakRetained[3];
      v19 = WeakRetained[4];
      v21 = 1;
LABEL_14:
      -[NSObject setAudioAccessoryIsConnectedToHeadphones:withKey:name:](v17, "setAudioAccessoryIsConnectedToHeadphones:withKey:name:", v21, v19, v20);
      goto LABEL_20;
    }
    v24 = WeakRetained[3];
    v25 = 1;
    goto LABEL_19;
  }
  HAENotificationsLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_2144B3000, v18, OS_LOG_TYPE_DEFAULT, "device is unknown", v29, 2u);
  }
LABEL_20:

  WeakRetained[2] = 0;
  *((_BYTE *)WeakRetained + 48) = 0;

}

- (BOOL)_isAlertSupported
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPod"));
  }

  return v3;
}

- (BOOL)_shouldSurfaceAlert:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isHAENFeatureEnabled") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isReduceLoudSoundEnabled") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isHKWriteEnabled"))
      {
        +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isHAEOtherDevicesEnabled") & 1) != 0)
          v6 = 1;
        else
          v6 = (_os_feature_enabled_impl() & 1) != 0 && -[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort");

      }
      else if (_os_feature_enabled_impl())
      {
        v6 = -[HAENUnknownDeviceManager isUSBCPort](self, "isUSBCPort");
      }
      else
      {
        v6 = 0;
      }

    }
  }

  v10 = -[HAENUnknownDeviceManager _isUnknownWiredHeadset:](self, "_isUnknownWiredHeadset:", v4);
  return v10 && v6;
}

- (void)deviceSessionDestroyed:(id)a3 isWired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (v4)
      -[HAENUnknownDeviceManager _wiredDeviceSessionDestroyed:](self, "_wiredDeviceSessionDestroyed:", v6);
    +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject applyVolumeLoweringAtNextSession](v7, "applyVolumeLoweringAtNextSession");
  }
  else
  {
    HAENotificationsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HAENUnknownDeviceManager deviceSessionDestroyed:isWired:].cold.1(v7);
  }

}

- (void)_wiredDeviceSessionDestroyed:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  char v6;
  __CFUserNotification *notification;
  int connectionCnt;
  BOOL v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSString *deviceName;
  int v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "isEqualToString:", self->_deviceName);

  if ((v6 & 1) != 0)
  {
    notification = self->_notification;
    if (notification)
    {
      CFUserNotificationCancel(notification);
      self->_notification = 0;
      self->_alertPending = 0;
    }
    connectionCnt = self->_connectionCnt;
    v9 = __OFSUB__(connectionCnt--, 1);
    self->_connectionCnt = connectionCnt;
    if ((connectionCnt < 0) ^ v9 | (connectionCnt == 0))
    {
      HAENotificationsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_connectionCnt;
        v14 = 67109120;
        LODWORD(v15) = v11;
        _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_DEFAULT, "reset wire due to ZERO session count: %d", (uint8_t *)&v14, 8u);
      }

      -[HAENUnknownDeviceManager _resetWiredStatus](self, "_resetWiredStatus");
    }
  }
  else
  {
    HAENotificationsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      v14 = 138412290;
      v15 = deviceName;
      _os_log_impl(&dword_2144B3000, v12, OS_LOG_TYPE_DEFAULT, "**** device [%@] already released?", (uint8_t *)&v14, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_resetWiredStatus
{
  NSObject *v3;
  NSString *deviceName;
  id v5;
  NSString *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_deviceName)
  {
    HAENotificationsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      v7 = 138412290;
      v8 = deviceName;
      _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, "reset wired status: %@", (uint8_t *)&v7, 0xCu);
    }

    if (-[HAENUnknownDeviceManager _isUnknownWiredHeadset:](self, "_isUnknownWiredHeadset:", self->_deviceName))
    {
      v5 = objc_alloc_init(MEMORY[0x24BE0A230]);
      objc_msgSend(v5, "removePreferenceFor:", *MEMORY[0x24BE0A1A0]);
    }
    else
    {
      +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wiredHeadphoneConnected:", 0);
    }

    v6 = self->_deviceName;
    self->_deviceName = 0;

  }
  self->_connectionCnt = 0;
  self->_adamSessionID = 561211748;
}

- (BOOL)_isUnknownWiredHeadset:(id)a3
{
  return (objc_msgSend(a3, "isEqualToString:", CFSTR("Wired")) & 1) != 0 || self->_isWiredUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)deviceSessionCreated:(uint64_t)a3 SessionID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2144B3000, a2, a3, "no device UID in device information for wired headset %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)registerDevice:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2144B3000, a2, a3, "device registration is only for unknown USBC ports %@ ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deviceSessionDestroyed:(os_log_t)log isWired:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144B3000, log, OS_LOG_TYPE_ERROR, "no device UID", v1, 2u);
}

@end
