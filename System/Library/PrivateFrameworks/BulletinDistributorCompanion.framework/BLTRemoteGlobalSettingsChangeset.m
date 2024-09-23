@implementation BLTRemoteGlobalSettingsChangeset

- (BLTRemoteGlobalSettingsChangeset)initWithProvider:(id)a3
{
  id v4;
  BLTRemoteGlobalSettingsChangeset *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  BLTRemoteGlobalSettingsChangeset *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLTRemoteGlobalSettingsChangeset;
  v5 = -[BLTRemoteGlobalSettingsChangeset init](&v8, sel_init);
  if (v5)
  {
    -[BLTRemoteGlobalSettingsChangeset setGlobalScheduledDeliverySetting:](v5, "setGlobalScheduledDeliverySetting:", objc_msgSend(v4, "globalScheduledDeliverySetting"));
    -[BLTRemoteGlobalSettingsChangeset setGlobalSummarizationSetting:](v5, "setGlobalSummarizationSetting:", objc_msgSend(v4, "globalSummarizationSetting"));
    blt_global_settings_sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ initWithProvider: %@", buf, 0x16u);
    }

  }
  return v5;
}

+ (id)remoteGlobalSettingsChangesetWithProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:", v4);

  return v5;
}

- (NSString)remoteInfoDirectoryLocation
{
  void *v2;
  void *v3;

  BLTPairingPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("BulletinDistributor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)remoteInfoFileLocation
{
  void *v2;
  void *v3;

  -[BLTRemoteGlobalSettingsChangeset remoteInfoDirectoryLocation](self, "remoteInfoDirectoryLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("bb_global_remote_settings.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)needsSend
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v17;
  BLTRemoteGlobalSettingsChangeset *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting")
    || -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"))
  {
    v3 = (void *)MEMORY[0x24BDBCE70];
    -[BLTRemoteGlobalSettingsChangeset remoteInfoFileLocation](self, "remoteInfoFileLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("globalScheduledDeliverySetting"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue");
      if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting") == v7)
      {
        -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("globalSummarizationSetting"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");
        v10 = -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting");

        if (v10 == v9)
        {
          blt_global_settings_sync_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 138412546;
            v18 = self;
            v19 = 2112;
            v20 = v5;
            _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "%@ needsSend: remoteSettings: %@ SHOULD NOT SEND", (uint8_t *)&v17, 0x16u);
          }
          v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {

      }
      blt_global_settings_sync_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v5;
        v13 = "%@ needsSend: remoteSettings: %@ SHOULD SEND";
        v14 = v11;
        v15 = 22;
        goto LABEL_14;
      }
    }
    else
    {
      blt_global_settings_sync_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = self;
        v13 = "%@ needsSend: !remoteSettings";
        v14 = v11;
        v15 = 12;
LABEL_14:
        _os_log_impl(&dword_2173D9000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
      }
    }
    v12 = 1;
LABEL_16:

    goto LABEL_17;
  }
  blt_global_settings_sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[BLTRemoteGlobalSettingsChangeset needsSend].cold.1((uint64_t)self, v5);
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)sendSuccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  BLTRemoteGlobalSettingsChangeset *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("globalScheduledDeliverySetting");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("globalSummarizationSetting");
  v17[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGlobalSettingsChangeset remoteInfoFileLocation](self, "remoteInfoFileLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "writeToFile:atomically:", v6, 1);

  blt_global_settings_sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ sendSuccess: infoFile: %@ saveSuccess: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (BLTPBSetRemoteGlobalSettingsRequest)blt_protobuf
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  BLTRemoteGlobalSettingsChangeset *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setSettingDate:");

  objc_msgSend(v3, "setGlobalScheduledDeliverySetting:", -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  objc_msgSend(v3, "setGlobalSummarizationSetting:", -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"));
  blt_global_settings_sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ blt_protobuf: %@", (uint8_t *)&v7, 0x16u);
  }

  return (BLTPBSetRemoteGlobalSettingsRequest *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "globalScheduledDeliverySetting"),
        v5 == -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting")))
  {
    v6 = objc_msgSend(v4, "globalSummarizationSetting");
    v7 = v6 == -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySettingDescription](self, "globalScheduledDeliverySettingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteGlobalSettingsChangeset descriptionForBBSystemSetting:](self, "descriptionForBBSystemSetting:", -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@, %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)globalScheduledDeliverySettingDescription
{
  __CFString *v3;

  if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting") == -1)
  {
    v3 = CFSTR("BBScheduledDeliverySettingUninitialized");
  }
  else if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"))
  {
    if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting") == 1)
    {
      v3 = CFSTR("BBScheduledDeliverySettingDisabled");
    }
    else if (-[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting") == 2)
    {
      v3 = CFSTR("BBScheduledDeliverySettingEnabled");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<BBScheduledDeliverySetting: <unknown> %ld>"), -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = CFSTR("BBScheduledDeliverySettingDefault");
  }
  return v3;
}

- (id)descriptionForBBSystemSetting:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 4)
    return off_24D762218[a3 + 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<BBSystemSetting: <unknown> %ld>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_globalScheduledDeliverySetting = a3;
}

- (int64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  self->_globalSummarizationSetting = a3;
}

- (void)needsSend
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "%@ needsSend: UNEXPECTED: globalScheduledDeliverySetting == BBScheduledDeliverySettingDefault && globalSummarizationSetting == BBSystemSettingDefault - not sending and this should never happen", (uint8_t *)&v2, 0xCu);
}

@end
