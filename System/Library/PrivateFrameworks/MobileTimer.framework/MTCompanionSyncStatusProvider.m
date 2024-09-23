@implementation MTCompanionSyncStatusProvider

- (MTCompanionSyncStatusProvider)init
{
  MTCompanionSyncStatusProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTCompanionSyncStatusProvider;
  v2 = -[MTCompanionSyncStatusProvider init](&v5, sel_init);
  if (v2)
  {
    +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerObserver:", v2);

  }
  return v2;
}

+ (BOOL)deviceSupportsSyncing
{
  if (deviceSupportsSyncing_onceToken != -1)
    dispatch_once(&deviceSupportsSyncing_onceToken, &__block_literal_global_46);
  return deviceSupportsSyncing_deviceSupportsSyncing;
}

uint64_t __54__MTCompanionSyncStatusProvider_deviceSupportsSyncing__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  deviceSupportsSyncing_deviceSupportsSyncing = result;
  return result;
}

- (unint64_t)syncStatus
{
  void *v3;
  char v4;
  NSObject *v6;
  const char *v7;
  int v8;
  MTCompanionSyncStatusProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "deviceSupportsSyncing"))
  {
    +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasActivePairedDeviceSupportingSyncing");

    if ((v4 & 1) != 0)
      return 1;
    MTLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      v7 = "%{public}@ no active paired device supporting syncing.  Syncing is disabled";
      goto LABEL_8;
    }
  }
  else
  {
    MTLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      v7 = "%{public}@ this device doesn't support syncing.";
LABEL_8:
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
    }
  }

  return 3;
}

- (void)activePairedDeviceDidChange
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  MTCompanionSyncStatusProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ active paired device changed.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_syncStatusProviderDelegate);
  objc_msgSend(WeakRetained, "syncStatusProvider:didChangeSyncStatus:", self, -[MTCompanionSyncStatusProvider syncStatus](self, "syncStatus"));

}

- (MTSyncStatusProviderDelegate)syncStatusProviderDelegate
{
  return (MTSyncStatusProviderDelegate *)objc_loadWeakRetained((id *)&self->_syncStatusProviderDelegate);
}

- (void)setSyncStatusProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_syncStatusProviderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncStatusProviderDelegate);
}

@end
