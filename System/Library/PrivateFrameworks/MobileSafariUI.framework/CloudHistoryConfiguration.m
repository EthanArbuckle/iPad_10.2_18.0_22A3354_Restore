@implementation CloudHistoryConfiguration

+ (id)sharedConfiguration
{
  if (+[CloudHistoryConfiguration sharedConfiguration]::onceToken != -1)
    dispatch_once(&+[CloudHistoryConfiguration sharedConfiguration]::onceToken, &__block_literal_global_11);
  return (id)sharedCloudHistoryConfiguration;
}

void __48__CloudHistoryConfiguration_sharedConfiguration__block_invoke()
{
  CloudHistoryConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(CloudHistoryConfiguration);
  v1 = (void *)sharedCloudHistoryConfiguration;
  sharedCloudHistoryConfiguration = (uint64_t)v0;

}

- (CloudHistoryConfiguration)init
{
  CloudHistoryConfiguration *v2;
  CloudHistoryConfiguration *v3;
  CloudHistoryConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CloudHistoryConfiguration;
  v2 = -[WBSCloudHistoryConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CloudHistoryConfiguration _reloadConfigurationDataIfNecessary](v2, "_reloadConfigurationDataIfNecessary");
    v4 = v3;
  }

  return v3;
}

- (id)platformBuiltInConfiguration
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D8AEF8];
  v5[0] = *MEMORY[0x1E0D8AF08];
  v5[1] = v2;
  v6[0] = CFSTR("1:1440");
  v6[1] = CFSTR("15:1 | 1:1425");
  v3 = *MEMORY[0x1E0D8AEF0];
  v5[2] = *MEMORY[0x1E0D8AF00];
  v5[3] = v3;
  v6[2] = CFSTR("1:1440");
  v6[3] = CFSTR("31:5 | 1:1285");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteConfiguration
{
  NSDictionary *remoteConfigurationDictionary;
  NSDictionary *v3;
  NSObject *v5;
  _QWORD block[5];

  remoteConfigurationDictionary = self->_remoteConfigurationDictionary;
  if (remoteConfigurationDictionary)
  {
    v3 = remoteConfigurationDictionary;
  }
  else if (!self->_fetchedAssetData)
  {
    self->_fetchedAssetData = 1;
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke;
    block[3] = &unk_1E9CF31B0;
    block[4] = self;
    dispatch_async(v5, block);

  }
  return remoteConfigurationDictionary;
}

void __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_cloudConfigurationAssetsSortedByVersionNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v16 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v5, "state") == 1)
        {
          v6 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v5, "localURL");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("data.plist"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dataWithContentsOfURL:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke_2;
              block[3] = &unk_1E9CF3358;
              block[4] = *(_QWORD *)(a1 + 32);
              v14 = v10;
              v11 = v10;
              dispatch_async(MEMORY[0x1E0C80D38], block);

              goto LABEL_14;
            }

          }
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_14:

}

uint64_t __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "applyRemoteConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (id)_cloudConfigurationAssetsSortedByVersionNumber
{
  NSArray *assetsSortedByVersionNumber;
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  assetsSortedByVersionNumber = self->_assetsSortedByVersionNumber;
  if (assetsSortedByVersionNumber)
    return assetsSortedByVersionNumber;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E028]), "initWithAssetType:", CFSTR("com.apple.MobileAsset.SafariCloudHistoryConfiguration"));
  v11 = 0;
  objc_msgSend(v5, "runQueryAndReturnError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_193);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_assetsSortedByVersionNumber;
    self->_assetsSortedByVersionNumber = v8;

    v10 = self->_assetsSortedByVersionNumber;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __75__CloudHistoryConfiguration__cloudConfigurationAssetsSortedByVersionNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  objc_msgSend(a3, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D4DEE8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (void)_reloadConfigurationDataIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double Current;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("LastCloudHistoryConfigurationUpdateTime"));
  v5 = v4;

  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v5 >= 604800.0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDouble:forKey:", CFSTR("LastCloudHistoryConfigurationUpdateTime"), Current);

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CloudHistoryConfiguration__reloadConfigurationDataIfNecessary__block_invoke;
    block[3] = &unk_1E9CF31B0;
    block[4] = self;
    dispatch_async(v8, block);

  }
}

void __64__CloudHistoryConfiguration__reloadConfigurationDataIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cloudConfigurationAssetsSortedByVersionNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "state");
  if (v3)
  {
    if (v3 == 3)
      objc_msgSend(v2, "resumeDownloadAndReturnError:", 0);
  }
  else
  {
    v5 = *MEMORY[0x1E0D4DF30];
    v6[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "beginDownloadWithOptions:", v4);

  }
}

- (BOOL)shouldUseLongLivedOperationsToSaveRecords
{
  return objc_msgSend(MEMORY[0x1E0DD9900], "accessLevel") == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_assetsSortedByVersionNumber, 0);
}

@end
