@implementation ACHAchievementsDaemonExtension

- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4
{
  id v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/private/var")) & 1) != 0)
  {
    if (a3 == 4)
      v7 = -[ACHMobileAssetProvider downloadedAssetDiskUsageInBytes](self->_mobileAssetProvider, "downloadedAssetDiskUsageInBytes");
    else
      v7 = 0;
    ACHLogAssets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v7;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Returning purgable space %llu for urgency %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    ACHLogAssets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (int64_t)v6;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "No purgable space for requested volume %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (ACHAchievementsDaemonExtension)initWithDaemon:(id)a3 mobileAssetProvider:(id)a4
{
  id v6;
  id v7;
  ACHAchievementsDaemonExtension *v8;
  ACHAchievementsDaemonExtension *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACHAchievementsDaemonExtension;
  v8 = -[ACHAchievementsDaemonExtension init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mobileAssetProvider, a4);
    objc_msgSend(v6, "registerDaemonReadyObserver:queue:", v9, 0);
  }

  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "cacheDeleteCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerCacheDeleteProvider:", self);

}

- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4
{
  id v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/private/var")) & 1) != 0)
  {
    if (a3 == 4)
      v7 = -[ACHMobileAssetProvider purgeAllDownloadedAssets](self->_mobileAssetProvider, "purgeAllDownloadedAssets");
    else
      v7 = 0;
    ACHLogAssets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v7;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Returning purged space %llu for urgency %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    ACHLogAssets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (int64_t)v6;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to purge for requested volume %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
}

@end
