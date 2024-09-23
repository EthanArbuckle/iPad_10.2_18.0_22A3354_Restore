@implementation SYDevice

+ (SYDevice)targetableDevice
{
  void *v2;
  void *v3;

  +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTargetableDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SYDevice *)v3;
}

+ (NSSet)knownDevices
{
  void *v2;
  void *v3;

  +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

+ (id)deviceForNRDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForNRDevice:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)deviceForIDSDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE6B4E0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForIDSDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceForNRDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)deviceForIDSDeviceID:(id)a3 fromList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("device:")))
  {
    objc_msgSend(v5, "substringFromIndex:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "uniqueIDOverride", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          if ((v14 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "deviceForIDSDevice:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "deviceForNRDevice:", v16);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SYDevice)init
{
  -[SYDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SYDevice)initWithNRDevice:(id)a3
{
  id v5;
  SYDevice *v6;
  SYDevice *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *pairingID;
  NRDevice *nrDevice;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *pairingStorePath;
  uint64_t v21;
  NSDate *lastActiveDate;
  uint64_t v23;
  NSString *deviceClass;
  uint64_t v25;
  NSString *systemVersion;
  uint64_t v27;
  NSString *systemBuildVersion;
  SYDevice *v29;
  objc_super v31;
  _QWORD v32[4];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SYDevice;
  v6 = -[SYDevice init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nrDevice, a3);
    v8 = *MEMORY[0x24BE6B3A8];
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v9 = objc_claimAutoreleasedReturnValue();
    pairingID = v7->_pairingID;
    v7->_pairingID = (NSUUID *)v9;

    nrDevice = v7->_nrDevice;
    v12 = *MEMORY[0x24BE6B378];
    v32[0] = v8;
    v32[1] = v12;
    v13 = *MEMORY[0x24BE6B338];
    v32[2] = *MEMORY[0x24BE6B358];
    v32[3] = v13;
    v15 = *MEMORY[0x24BE6B3F0];
    v33 = *MEMORY[0x24BE6B2F8];
    v14 = v33;
    v34 = v15;
    v17 = *MEMORY[0x24BE6B368];
    v35 = *MEMORY[0x24BE6B3E0];
    v16 = v35;
    v36 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevice addPropertyObserver:forPropertyChanges:](nrDevice, "addPropertyObserver:forPropertyChanges:", v7, v18);

    -[SYDevice _updateStateFlagsPostingNotifications:](v7, "_updateStateFlagsPostingNotifications:", 0);
    -[NRDevice valueForProperty:](v7->_nrDevice, "valueForProperty:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    pairingStorePath = v7->_pairingStorePath;
    v7->_pairingStorePath = (NSString *)v19;

    -[NRDevice valueForProperty:](v7->_nrDevice, "valueForProperty:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    lastActiveDate = v7->_lastActiveDate;
    v7->_lastActiveDate = (NSDate *)v21;

    -[NRDevice valueForProperty:](v7->_nrDevice, "valueForProperty:", v14);
    v23 = objc_claimAutoreleasedReturnValue();
    deviceClass = v7->_deviceClass;
    v7->_deviceClass = (NSString *)v23;

    -[NRDevice valueForProperty:](v7->_nrDevice, "valueForProperty:", v15);
    v25 = objc_claimAutoreleasedReturnValue();
    systemVersion = v7->_systemVersion;
    v7->_systemVersion = (NSString *)v25;

    -[NRDevice valueForProperty:](v7->_nrDevice, "valueForProperty:", v16);
    v27 = objc_claimAutoreleasedReturnValue();
    systemBuildVersion = v7->_systemBuildVersion;
    v7->_systemBuildVersion = (NSString *)v27;

    v29 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *pairingID;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    pairingID = self->_pairingID;
    objc_msgSend(v4, "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](pairingID, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isTargetable
{
  SYDevice *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (~LODWORD(v2->_state) & 0xBLL) == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPaired
{
  SYDevice *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SYDevice state](v2, "state") & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isActive
{
  SYDevice *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)-[SYDevice state](v2, "state") >> 1) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)deviceCode
{
  void *v2;
  int v3;

  -[SYDevice deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Watch"));

  if (v3)
    return 5;
  else
    return 2;
}

- (BOOL)supportsFileTransferMessageSend
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  -[SYDevice deviceClass](self, "deviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Watch"));

  -[SYDevice systemBuildVersion](self, "systemBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("14S190");
  else
    v7 = CFSTR("14A194");
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8 != -1;
}

- (id)findMatchingIDSDeviceFromList:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BE6B4E0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceForNRDevice:fromIDSDevices:", self->_nrDevice, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  NSUUID *pairingID;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "valueForProperty:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543874;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "NRDevice property changed: %{public}@, %@ -> %@", (uint8_t *)&v21, 0x20u);
  }
  -[SYDevice _updateCachedStateForProperty:](self, "_updateCachedStateForProperty:", v9);
  v13 = *MEMORY[0x24BE6B3A8];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE6B3A8]))
  {
    objc_msgSend(v8, "valueForProperty:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = (NSUUID *)objc_msgSend(v14, "copy");
      pairingID = self->_pairingID;
      self->_pairingID = v16;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("SYDevicePairingIDChangedNotification"), self);

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_211704000, v20, OS_LOG_TYPE_DEFAULT, "Disregarding NR attempt to zap pairing ID", (uint8_t *)&v21, 2u);
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (_StateAffectingPropertyKeys_onceToken != -1)
    dispatch_once(&_StateAffectingPropertyKeys_onceToken, &__block_literal_global_208);
  if (objc_msgSend((id)_StateAffectingPropertyKeys___set, "containsObject:", v9))
  {
    -[SYDevice _updateStateFlagsPostingNotifications:](self, "_updateStateFlagsPostingNotifications:", 1);
  }
  else
  {
    if (_OSInfoAffectingPropertyKeys_onceToken != -1)
      dispatch_once(&_OSInfoAffectingPropertyKeys_onceToken, &__block_literal_global_210);
    if (objc_msgSend((id)_OSInfoAffectingPropertyKeys___set, "containsObject:", v9))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v19 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "Posting SYDeviceOSInfoChangedNotification", (uint8_t *)&v21, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("SYDeviceOSInfoChangedNotification"), self);
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (void)_updateCachedStateForProperty:(id)a3
{
  NSString *v4;
  NSDate *pairingStorePath;
  NSDate *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6B378]))
  {
    -[NRDevice valueForProperty:](self->_nrDevice, "valueForProperty:", v10);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    pairingStorePath = (NSDate *)self->_pairingStorePath;
    self->_pairingStorePath = v4;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6B368]))
  {
    -[NRDevice valueForProperty:](self->_nrDevice, "valueForProperty:", v10);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pairingStorePath = self->_lastActiveDate;
    self->_lastActiveDate = v6;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6B2F8]))
  {
    -[NRDevice valueForProperty:](self->_nrDevice, "valueForProperty:", v10);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    pairingStorePath = (NSDate *)self->_deviceClass;
    self->_deviceClass = v7;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6B3F0]))
  {
    -[NRDevice valueForProperty:](self->_nrDevice, "valueForProperty:", v10);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    pairingStorePath = (NSDate *)self->_systemVersion;
    self->_systemVersion = v8;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6B3E0]))
  {
    -[NRDevice valueForProperty:](self->_nrDevice, "valueForProperty:", v10);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    pairingStorePath = (NSDate *)self->_systemBuildVersion;
    self->_systemBuildVersion = v9;
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_updateStateFlagsPostingNotifications:(BOOL)a3
{
  _BOOL4 v3;
  SYDevice *v4;
  int64_t state;
  void *v6;
  unsigned int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  NSUUID *pairingID;
  NSObject *v16;
  void *v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  void *v22;
  NSUUID *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  state = v4->_state;
  -[NRDevice valueForProperty:](v4->_nrDevice, "valueForProperty:", *MEMORY[0x24BE6B358]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v4->_state = v4->_state & 0xFFFFFFFFFFFFFFFELL | v7;
  -[NRDevice valueForProperty:](v4->_nrDevice, "valueForProperty:", *MEMORY[0x24BE6B338]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = 2;
  if (!v9)
    v10 = 0;
  v4->_state = v4->_state & 0xFFFFFFFFFFFFFFFDLL | v10;
  -[NRDevice valueForProperty:](v4->_nrDevice, "valueForProperty:", *MEMORY[0x24BE6B378]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length") != 0;

  v13 = v4->_state & 0xFFFFFFFFFFFFFFF7 | (8 * v12);
  v4->_state = v13;
  objc_sync_exit(v4);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v14 = (void *)_sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    pairingID = v4->_pairingID;
    v16 = v14;
    -[NSUUID UUIDString](pairingID, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v4->_state;
    v30 = 138543618;
    v31 = (uint64_t)v17;
    v32 = 1024;
    LODWORD(v33) = v18;
    _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Device %{public}@ state changed: %{companionsync:SYDeviceState}d", (uint8_t *)&v30, 0x12u);

  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("SYDeviceStateChangedNotification"), v4);

  }
  v20 = state & 0xB;
  v21 = v13 & 0xB;
  if ((v20 != 11) == (v21 == 11))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v22 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v4->_pairingID;
      v24 = v22;
      -[NSUUID UUIDString](v23, "UUIDString");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = "un";
      if (v21 == 11)
        v27 = "";
      v30 = 138543618;
      v31 = v25;
      v32 = 2080;
      v33 = v27;
      _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Device %{public}@ became %stargetable", (uint8_t *)&v30, 0x16u);

    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:", CFSTR("SYDeviceTargetabilityChangedNotification"), v4);

      if (v21 == 11)
      {
        +[_SYDeviceMonitor sharedInstance](_SYDeviceMonitor, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "deviceBecameTargetable:", v4);

      }
    }
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYDevice;
  -[SYDevice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_pairingID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)SYDevice;
  -[SYDevice debugDescription](&v14, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_pairingID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice pairingStorePath](self, "pairingStorePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SYDevice isPaired](self, "isPaired"))
    v7 = "YES";
  else
    v7 = "NO";
  if (-[SYDevice isActive](self, "isActive"))
    v8 = "YES";
  else
    v8 = "NO";
  -[SYDevice deviceClass](self, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice systemVersion](self, "systemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice systemBuildVersion](self, "systemBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ (%@). Paired=%s, Active=%s. Class='%@', Version='%@', Build='%@'."), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (PBCodable)stateForLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[SYDevice pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v5);

  objc_msgSend(v3, "setState:", -[SYDevice state](self, "state"));
  -[SYDevice deviceClass](self, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceClass:", v6);

  -[SYDevice systemBuildVersion](self, "systemBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuildVersion:", v7);

  return (PBCodable *)v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)pairingStorePath
{
  return self->_pairingStorePath;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (NSDate)lastActiveDate
{
  return self->_lastActiveDate;
}

- (BOOL)hasCachedNearby
{
  return self->_hasCachedNearby;
}

- (void)setHasCachedNearby:(BOOL)a3
{
  self->_hasCachedNearby = a3;
}

- (BOOL)cachedIsNearby
{
  return self->_cachedIsNearby;
}

- (void)setCachedIsNearby:(BOOL)a3
{
  self->_cachedIsNearby = a3;
}

- (BOOL)hasCachedConnected
{
  return self->_hasCachedConnected;
}

- (void)setHasCachedConnected:(BOOL)a3
{
  self->_hasCachedConnected = a3;
}

- (BOOL)cachedConnected
{
  return self->_cachedConnected;
}

- (void)setCachedConnected:(BOOL)a3
{
  self->_cachedConnected = a3;
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveDate, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
}

@end
