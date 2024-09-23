@implementation BLTSpokenSettingSync

- (BLTSpokenSettingSync)initWithSettingsGateway:(id)a3 syncServer:(id)a4
{
  id v7;
  id v8;
  BLTSpokenSettingSync *v9;
  BLTSpokenSettingSync *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  _QWORD block[4];
  BLTSpokenSettingSync *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BLTSpokenSettingSync;
  v9 = -[BLTSpokenSettingSync init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settingsGateway, a3);
    objc_storeStrong((id *)&v10->_syncServer, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.bulletindistributor.spokensettingsync", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = v10->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__BLTSpokenSettingSync_initWithSettingsGateway_syncServer___block_invoke;
    block[3] = &unk_24D761AD0;
    v17 = v10;
    dispatch_async(v14, block);

  }
  return v10;
}

uint64_t __59__BLTSpokenSettingSync_initWithSettingsGateway_syncServer___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_readSettings");
  result = objc_msgSend(*(id *)(a1 + 32), "_queue_updateLocalSetting");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_resolveState");
  return result;
}

- (id)_remoteSettingStoreURL
{
  NSURL *remoteSettingStoreURL;
  NSURL *v4;
  NSURL *v5;

  remoteSettingStoreURL = self->_remoteSettingStoreURL;
  if (!remoteSettingStoreURL)
  {
    BLTFileURLInPairingPathWait(CFSTR("spokensettingsync.plist"));
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_remoteSettingStoreURL;
    self->_remoteSettingStoreURL = v4;

    remoteSettingStoreURL = self->_remoteSettingStoreURL;
  }
  return remoteSettingStoreURL;
}

- (void)_queue_readSettings
{
  void *v3;
  NSDate *v4;
  NSDate *localGlobalSpokenSettingDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *remoteGlobalSpokenSettingDate;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
  self->_localGlobalSpokenSettingEnabled = CFPreferencesGetAppIntegerValue(CFSTR("BLTSpokenSettingLocalGlobalSettingEnabled"), CFSTR("com.apple.bulletindistributor"), 0) != 0;
  v12 = (id)CFPreferencesCopyAppValue(CFSTR("BLTSpokenSettingLocalGlobalSettingDate"), CFSTR("com.apple.bulletindistributor"));
  if (v12)
  {
    v3 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    localGlobalSpokenSettingDate = self->_localGlobalSpokenSettingDate;
    self->_localGlobalSpokenSettingDate = v4;

  }
  v6 = (void *)MEMORY[0x24BDBCE70];
  -[BLTSpokenSettingSync _remoteSettingStoreURL](self, "_remoteSettingStoreURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BLTSpokenSettingsSyncRemoteEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_remoteGlobalSpokenSettingEnabled = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BLTSpokenSettingsSyncRemoteDate"));
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  remoteGlobalSpokenSettingDate = self->_remoteGlobalSpokenSettingDate;
  self->_remoteGlobalSpokenSettingDate = v10;

}

- (void)_queue_writeLocalSetting
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFPreferencesSetAppValue(CFSTR("BLTSpokenSettingLocalGlobalSettingEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_localGlobalSpokenSettingEnabled), CFSTR("com.apple.bulletindistributor"));
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSince1970](self->_localGlobalSpokenSettingDate, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("BLTSpokenSettingLocalGlobalSettingDate"), v4, CFSTR("com.apple.bulletindistributor"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));

}

- (void)_queue_writeRemoteSetting
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Error storing remote spoken settings.", a5, a6, a7, a8, 0);
}

- (BOOL)_queue_updateLocalSetting
{
  void *v3;
  uint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BLTSpokenSettingSync settingsGateway](self, "settingsGateway");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveGlobalSpokenNotificationSetting");

  return v4 != -1
      && -[BLTSpokenSettingSync _queue_updateLocalGlobalSpokenSettingEnabledFromUser:](self, "_queue_updateLocalGlobalSpokenSettingEnabledFromUser:", v4 == 2);
}

- (BOOL)_queue_isUpdatingLocalStateFromRemote
{
  unint64_t updatingLocalStateFromRemoteCount;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  updatingLocalStateFromRemoteCount = self->_updatingLocalStateFromRemoteCount;
  if (updatingLocalStateFromRemoteCount)
    self->_updatingLocalStateFromRemoteCount = updatingLocalStateFromRemoteCount - 1;
  return updatingLocalStateFromRemoteCount != 0;
}

- (void)_queue_setUpdatingLocalStateFromRemote
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_updatingLocalStateFromRemoteCount;
}

- (void)bbUpdateLocalGlobalSpokenSettingEnabled:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__BLTSpokenSettingSync_bbUpdateLocalGlobalSpokenSettingEnabled___block_invoke;
  v4[3] = &unk_24D7621F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __64__BLTSpokenSettingSync_bbUpdateLocalGlobalSpokenSettingEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  uint8_t v8[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_isUpdatingLocalStateFromRemote");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == -1)
  {
    blt_settings_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Received updated global settings with spoken notification not supported", v8, 2u);
    }

  }
  else
  {
    v4 = v2;
    v5 = *(void **)(a1 + 32);
    v6 = v3 == 2;
    if (v4)
      objc_msgSend(v5, "_queue_synchronizeSettingsWithLocalEnabled:", v6);
    else
      objc_msgSend(v5, "_queue_updateLocalGlobalSpokenSettingEnabledFromUser:", v6);
  }
}

- (BOOL)_queue_updateLocalGlobalSpokenSettingEnabledFromUser:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BLTSpokenSettingSync localGlobalSpokenSettingEnabled](self, "localGlobalSpokenSettingEnabled") == v3
    && (-[BLTSpokenSettingSync localGlobalSpokenSettingDate](self, "localGlobalSpokenSettingDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    blt_settings_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "Received local global spoken setting that is the same as the cached version: %{BOOL}u", (uint8_t *)v9, 8u);
    }

    return 0;
  }
  else
  {
    -[BLTSpokenSettingSync setLocalGlobalSpokenSettingEnabled:](self, "setLocalGlobalSpokenSettingEnabled:", v3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSpokenSettingSync setLocalGlobalSpokenSettingDate:](self, "setLocalGlobalSpokenSettingDate:", v8);

    -[BLTSpokenSettingSync _queue_writeLocalSetting](self, "_queue_writeLocalSetting");
    -[BLTSpokenSettingSync _queue_resolveState](self, "_queue_resolveState");
    return 1;
  }
}

- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__BLTSpokenSettingSync_transportUpdateRemoteGlobalSpokenSettingEnabled_date___block_invoke;
  block[3] = &unk_24D7627E8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __77__BLTSpokenSettingSync_transportUpdateRemoteGlobalSpokenSettingEnabled_date___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "remoteGlobalSpokenSettingEnabled");
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != v2)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "remoteGlobalSpokenSettingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 40));

  if (v5 == -1)
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "setRemoteGlobalSpokenSettingEnabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteGlobalSpokenSettingDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_queue_writeRemoteSetting");
    objc_msgSend(*(id *)(a1 + 32), "_queue_resolveState");
    return;
  }
  blt_settings_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(unsigned __int8 *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = 67109378;
    v9[1] = v7;
    v10 = 2112;
    v11 = v8;
    _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "Received remote global spoken setting and dropping: %{BOOL}u date: %@", (uint8_t *)v9, 0x12u);
  }

}

- (void)_queue_resolveState
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Trying to resolve global spoken setting state with 2 unknown states!", a5, a6, a7, a8, 0);
}

- (void)_queue_setNewLocalStateFromRemote:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  blt_settings_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Setting spoken settings on BulletinBoard to enabled: %{BOOL}u", (uint8_t *)v7, 8u);
  }

  -[BLTSpokenSettingSync _queue_setUpdatingLocalStateFromRemote](self, "_queue_setUpdatingLocalStateFromRemote");
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  -[BBSettingsGateway setEffectiveGlobalSpokenNotificationSetting:](self->_settingsGateway, "setEffectiveGlobalSpokenNotificationSetting:", v6);
}

- (void)_queue_synchronizeSettingsWithLocalEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  blt_settings_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Synchronizing spoken settings with enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }

  -[BLTSpokenSettingSync localGlobalSpokenSettingDate](self, "localGlobalSpokenSettingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BLTSpokenSettingSync localGlobalSpokenSettingDate](self, "localGlobalSpokenSettingDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSpokenSettingSync remoteGlobalSpokenSettingDate](self, "remoteGlobalSpokenSettingDate");
  }
  else
  {
    -[BLTSpokenSettingSync remoteGlobalSpokenSettingDate](self, "remoteGlobalSpokenSettingDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSpokenSettingSync localGlobalSpokenSettingDate](self, "localGlobalSpokenSettingDate");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "laterDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTSpokenSettingSync setLocalGlobalSpokenSettingDate:](self, "setLocalGlobalSpokenSettingDate:", v9);
  -[BLTSpokenSettingSync setRemoteGlobalSpokenSettingDate:](self, "setRemoteGlobalSpokenSettingDate:", v9);
  -[BLTSpokenSettingSync setLocalGlobalSpokenSettingEnabled:](self, "setLocalGlobalSpokenSettingEnabled:", v3);
  -[BLTSpokenSettingSync setRemoteGlobalSpokenSettingEnabled:](self, "setRemoteGlobalSpokenSettingEnabled:", v3);
  -[BLTSpokenSettingSync _queue_writeRemoteSetting](self, "_queue_writeRemoteSetting");
  -[BLTSpokenSettingSync _queue_writeLocalSetting](self, "_queue_writeLocalSetting");
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsSpokenNotificationSettings"))
  {
    -[BLTSpokenSettingSync syncServer](self, "syncServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSpokenSettingSync localGlobalSpokenSettingDate](self, "localGlobalSpokenSettingDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendRemoteGlobalSpokenSettingEnabled:date:", v3, v11);

  }
}

- (BOOL)localGlobalSpokenSettingEnabled
{
  return self->_localGlobalSpokenSettingEnabled;
}

- (void)setLocalGlobalSpokenSettingEnabled:(BOOL)a3
{
  self->_localGlobalSpokenSettingEnabled = a3;
}

- (BOOL)remoteGlobalSpokenSettingEnabled
{
  return self->_remoteGlobalSpokenSettingEnabled;
}

- (void)setRemoteGlobalSpokenSettingEnabled:(BOOL)a3
{
  self->_remoteGlobalSpokenSettingEnabled = a3;
}

- (NSDate)localGlobalSpokenSettingDate
{
  return self->_localGlobalSpokenSettingDate;
}

- (void)setLocalGlobalSpokenSettingDate:(id)a3
{
  objc_storeStrong((id *)&self->_localGlobalSpokenSettingDate, a3);
}

- (NSDate)remoteGlobalSpokenSettingDate
{
  return self->_remoteGlobalSpokenSettingDate;
}

- (void)setRemoteGlobalSpokenSettingDate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteGlobalSpokenSettingDate, a3);
}

- (unint64_t)updatingLocalStateFromRemoteCount
{
  return self->_updatingLocalStateFromRemoteCount;
}

- (void)setUpdatingLocalStateFromRemoteCount:(unint64_t)a3
{
  self->_updatingLocalStateFromRemoteCount = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGateway, a3);
}

- (BLTSettingSyncServer)syncServer
{
  return self->_syncServer;
}

- (void)setSyncServer:(id)a3
{
  objc_storeStrong((id *)&self->_syncServer, a3);
}

- (NSURL)remoteSettingStoreURL
{
  return self->_remoteSettingStoreURL;
}

- (void)setRemoteSettingStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSettingStoreURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSettingStoreURL, 0);
  objc_storeStrong((id *)&self->_syncServer, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteGlobalSpokenSettingDate, 0);
  objc_storeStrong((id *)&self->_localGlobalSpokenSettingDate, 0);
}

@end
