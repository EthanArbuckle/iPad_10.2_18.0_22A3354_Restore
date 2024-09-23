@implementation AXAssetPolicy

+ (id)policy
{
  return objc_alloc_init((Class)a1);
}

- (AXAssetPolicy)init
{
  AXAssetPolicy *v2;
  AXAssetPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXAssetPolicy;
  v2 = -[AXAssetPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXAssetPolicy setDownloadResourceTimeout:](v2, "setDownloadResourceTimeout:", 3600.0);
    -[AXAssetPolicy setUpdateCatalogTimeout:](v3, "setUpdateCatalogTimeout:", 90.0);
    -[AXAssetPolicy setRefreshRetryInterval:](v3, "setRefreshRetryInterval:", 3600.0);
    -[AXAssetPolicy setDownloadRetryInterval:](v3, "setDownloadRetryInterval:", 43200.0);
    -[AXAssetPolicy setUpdateInterval:](v3, "setUpdateInterval:", 604800.0);
  }
  return v3;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (void)setUpdateCatalogTimeout:(double)a3
{
  self->_updateCatalogTimeout = a3;
}

- (void)setRefreshRetryInterval:(double)a3
{
  self->_refreshRetryInterval = a3;
}

- (void)setDownloadRetryInterval:(double)a3
{
  self->_downloadRetryInterval = a3;
}

- (void)setDownloadResourceTimeout:(double)a3
{
  self->_downloadResourceTimeout = a3;
}

- (id)newAssetQuery
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getMAAssetQueryClass_softClass;
  v13 = getMAAssetQueryClass_softClass;
  if (!getMAAssetQueryClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getMAAssetQueryClass_block_invoke;
    v9[3] = &unk_1E95D3900;
    v9[4] = &v10;
    __getMAAssetQueryClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v5 = [v4 alloc];
  -[AXAssetPolicy assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:", v6);

  objc_msgSend(v7, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v7, "returnTypes:", 2);
  return v7;
}

- (NSString)assetTypeSuffix
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[AXAssetPolicy assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[AXAssetPolicy assetType](self, "assetType");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return 1;
}

- (BOOL)shouldCopyLocally
{
  return 0;
}

- (BOOL)isAssetSupported:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[AXAssetPolicy _isAssetSupportedBasedOnCompatibilityVersion:](self, "_isAssetSupportedBasedOnCompatibilityVersion:", v4))
  {
    v5 = -[AXAssetPolicy _isAssetSupportedBasedOnMinMaxFormatVersion:](self, "_isAssetSupportedBasedOnMinMaxFormatVersion:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isAssetSupportedBasedOnMinMaxFormatVersion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v4 = a3;
  -[AXAssetPolicy minSupportedFormatVersion](self, "minSupportedFormatVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        v7 = objc_msgSend(v4, "formatVersion"),
        -[AXAssetPolicy minSupportedFormatVersion](self, "minSupportedFormatVersion"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "unsignedIntegerValue"),
        v8,
        v6,
        v7 < v9))
  {
    v10 = 0;
  }
  else
  {
    -[AXAssetPolicy maxSupportedFormatVersion](self, "maxSupportedFormatVersion");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(v4, "formatVersion");
      -[AXAssetPolicy maxSupportedFormatVersion](self, "maxSupportedFormatVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = v13 > objc_msgSend(v14, "unsignedIntegerValue");

      v10 = v13 ^ 1;
    }
    else
    {
      v10 = 1;
    }
  }

  return v10 & 1;
}

- (NSNumber)minSupportedFormatVersion
{
  return self->_minSupportedFormatVersion;
}

- (NSNumber)maxSupportedFormatVersion
{
  return self->_maxSupportedFormatVersion;
}

- (BOOL)_isAssetSupportedBasedOnCompatibilityVersion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[AXAssetPolicy compatibilityVersion](self, "compatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "compatibilityVersion");
    -[AXAssetPolicy compatibilityVersion](self, "compatibilityVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 <= objc_msgSend(v7, "unsignedIntegerValue");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXAssetPolicy;
  -[AXAssetPolicy description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetPolicy assetTypeSuffix](self, "assetTypeSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (assetType=%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAssetContentVersion:(id)a3 greatherThanInstalledAssets:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v5, "contentVersion", (_QWORD)v15);
        if (v12 < objc_msgSend(v11, "contentVersion"))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke_2;
  v9[3] = &unk_1E95D3978;
  v9[4] = self;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

uint64_t __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isInstalled") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "shouldDownloadAsset:withInstalledAssets:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (-[AXAssetPolicy isAssetSupported:](self, "isAssetSupported:", v13))
        {
          if (v10 && (v14 = objc_msgSend(v10, "unsignedIntegerValue"), v14 >= objc_msgSend(v13, "contentVersion")))
          {
            v16 = v6;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "contentVersion"));
            v15 = objc_claimAutoreleasedReturnValue();

            v16 = v6;
            v10 = (void *)v15;
          }
        }
        else
        {
          v16 = v5;
        }
        objc_msgSend(v16, "addObject:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);

    if (!v10)
    {
      v17 = 0;
      goto LABEL_19;
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__AXAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke;
    v20[3] = &unk_1E95D39D8;
    v17 = v10;
    v21 = v17;
    objc_msgSend(v6, "ax_removeObjectsFromArrayUsingBlock:", v20);
    objc_msgSend(v5, "addObjectsFromArray:", v6);
    v18 = v21;
  }
  else
  {
    v17 = 0;
    v18 = v7;
  }

LABEL_19:
  return v5;
}

BOOL __50__AXAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;

  v3 = objc_msgSend(a2, "contentVersion");
  return v3 >= objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXAssetPolicy assetType](self, "assetType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXAssetPolicy assetType](self, "assetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return self->_daemonShouldDownloadInBackgroundIfNeeded;
}

- (void)setDaemonShouldDownloadInBackgroundIfNeeded:(BOOL)a3
{
  self->_daemonShouldDownloadInBackgroundIfNeeded = a3;
}

- (void)setMinSupportedFormatVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minSupportedFormatVersion, a3);
}

- (void)setMaxSupportedFormatVersion:(id)a3
{
  objc_storeStrong((id *)&self->_maxSupportedFormatVersion, a3);
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (double)downloadResourceTimeout
{
  return self->_downloadResourceTimeout;
}

- (double)updateCatalogTimeout
{
  return self->_updateCatalogTimeout;
}

- (double)refreshRetryInterval
{
  return self->_refreshRetryInterval;
}

- (double)downloadRetryInterval
{
  return self->_downloadRetryInterval;
}

- (NSString)launchActivityIdentifier
{
  return self->_launchActivityIdentifier;
}

- (void)setLaunchActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_launchActivityIdentifier, a3);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_maxSupportedFormatVersion, 0);
  objc_storeStrong((id *)&self->_minSupportedFormatVersion, 0);
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v11;
  objc_class *v12;
  id v13;
  double v14;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v11 = (void *)getMADownloadOptionsClass_softClass;
  v21 = getMADownloadOptionsClass_softClass;
  if (!getMADownloadOptionsClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getMADownloadOptionsClass_block_invoke;
    v17[3] = &unk_1E95D3900;
    v17[4] = &v18;
    __getMADownloadOptionsClass_block_invoke((uint64_t)v17, (uint64_t)a2, a3, a4, v4, v5, v6, v7, v16);
    v11 = (void *)v19[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v18, 8);
  v13 = objc_alloc_init(v12);
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_8;
    -[AXAssetPolicy downloadResourceTimeout](self, "downloadResourceTimeout");
  }
  else
  {
    -[AXAssetPolicy updateCatalogTimeout](self, "updateCatalogTimeout");
  }
  objc_msgSend(v13, "setTimeoutIntervalForResource:", (uint64_t)v14);
LABEL_8:
  if (v8)
  {
    objc_msgSend(v13, "setDiscretionary:", 0);
    objc_msgSend(v13, "setAllowsExpensiveAccess:", 1);
  }
  return v13;
}

- (NSString)assetType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
