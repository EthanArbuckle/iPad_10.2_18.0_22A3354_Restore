@implementation ACHRemoteTemplateSource

- (ACHRemoteTemplateSource)initWithMobileAssetProvider:(id)a3 backCompatWriter:(id)a4 remoteTemplateAvailabilityKeyProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACHRemoteTemplateSource *v12;
  ACHRemoteTemplateSource *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSDictionary *resourceAssetURLsByUniqueName;
  uint64_t v18;
  NSDictionary *stickerAssetURLsByUniqueName;
  uint64_t v20;
  NSDictionary *assetVersionsByUniqueName;
  const char *v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ACHRemoteTemplateSource;
  v12 = -[ACHRemoteTemplateSource init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mobileAssetProvider, a3);
    objc_storeStrong((id *)&v13->_backCompatAvailabilityKeyWriter, a4);
    objc_storeStrong((id *)&v13->_remoteTemplateAvailabilityKeyProvider, a5);
    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    resourceAssetURLsByUniqueName = v13->_resourceAssetURLsByUniqueName;
    v13->_resourceAssetURLsByUniqueName = (NSDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    stickerAssetURLsByUniqueName = v13->_stickerAssetURLsByUniqueName;
    v13->_stickerAssetURLsByUniqueName = (NSDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    assetVersionsByUniqueName = v13->_assetVersionsByUniqueName;
    v13->_assetVersionsByUniqueName = (NSDictionary *)v20;

    objc_initWeak(&location, v13);
    v22 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01568], "UTF8String");
    v23 = MEMORY[0x24BDAC9B8];
    v24 = MEMORY[0x24BDAC9B8];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __110__ACHRemoteTemplateSource_initWithMobileAssetProvider_backCompatWriter_remoteTemplateAvailabilityKeyProvider___block_invoke;
    v26[3] = &unk_24D13A2C0;
    objc_copyWeak(&v27, &location);
    notify_register_dispatch(v22, &v13->_availabilityChangeToken, v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __110__ACHRemoteTemplateSource_initWithMobileAssetProvider_backCompatWriter_remoteTemplateAvailabilityKeyProvider___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "templateSourceDidUpdateAssets:", v4);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "assetSourceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "templateAssetSourceDidUpdateAssets:", v6);

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_availabilityChangeToken))
    notify_cancel(self->_availabilityChangeToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHRemoteTemplateSource;
  -[ACHRemoteTemplateSource dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x24BE01648];
}

- (int64_t)runCadence
{
  return 2;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStandalonePhoneFitnessMode");

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCF20]);
      (*((void (**)(id, id, _QWORD, _QWORD))v7 + 2))(v7, v10, 0, 0);

    }
    else
    {
      -[ACHRemoteTemplateSource mobileAssetProvider](self, "mobileAssetProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke;
      v12[3] = &unk_24D13BA48;
      v12[4] = self;
      v13 = v7;
      objc_msgSend(v11, "availableAssetsWithCompletion:", v12);

    }
  }

}

void __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke_2;
  block[3] = &unk_24D13B530;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __55__ACHRemoteTemplateSource_templatesForDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  id obja;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v57;
    v5 = *MEMORY[0x24BE01940];
    v6 = *MEMORY[0x24BE01948];
    v42 = *MEMORY[0x24BE01958];
    v41 = *MEMORY[0x24BE01960];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v57 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x2199C8FE0]();
        objc_msgSend(v8, "attributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", v6))
        {
          objc_msgSend(v45, "addObject:", v8);
          objc_msgSend(*(id *)(a1 + 40), "_addAssetVersionsByUniqueNameToDictionary:fromAsset:", v43, v8);
          goto LABEL_13;
        }
        if (objc_msgSend(v11, "isEqualToString:", v42))
        {
          v12 = *(void **)(a1 + 40);
          v13 = v49;
        }
        else
        {
          if (!objc_msgSend(v11, "isEqualToString:", v41))
            goto LABEL_13;
          v12 = *(void **)(a1 + 40);
          v13 = v44;
        }
        objc_msgSend(v12, "_addURLsByUniqueNameToDictionary:fromAsset:", v13, v8);
LABEL_13:

        objc_autoreleasePoolPop(v9);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v3);
  }

  ACHLogAssets();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v38 = objc_msgSend(v45, "count");
    v39 = objc_msgSend(v49, "count");
    v40 = objc_msgSend(v44, "count");
    *(_DWORD *)buf = 134218496;
    v62 = v38;
    v63 = 2048;
    v64 = v39;
    v65 = 2048;
    v66 = v40;
    _os_log_debug_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEBUG, "Available assets: %lu template assets, %lu resource assets, %lu sticker assets", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setResourceAssetURLsByUniqueName:", v49);
  objc_msgSend(*(id *)(a1 + 40), "setStickerAssetURLsByUniqueName:", v44);
  objc_msgSend(*(id *)(a1 + 40), "setAssetVersionsByUniqueName:", v43);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v46 = v45;
  v15 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v53;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v53 != v17)
          objc_enumerationMutation(v46);
        v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x2199C8FE0]();
        objc_msgSend(*(id *)(a1 + 40), "buildVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        RemoteAchievementTemplateFromTemplateAssetAndBuildVersion();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = *(void **)(a1 + 40);
        if (v22)
        {
          objc_msgSend(v23, "backCompatAvailabilityKeyWriter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          v25 = objc_msgSend(v24, "markTemplateAvailable:error:", v22, &v51);
          v26 = v51;

          if ((v25 & 1) == 0)
          {
            ACHLogTemplates();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v22, "uniqueName");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v62 = (uint64_t)v32;
              v63 = 2114;
              v64 = (uint64_t)v26;
              _os_log_error_impl(&dword_21407B000, v27, OS_LOG_TYPE_ERROR, "Error writing backcompat availability key for template %{public}@: %{public}@", buf, 0x16u);

            }
          }
          objc_msgSend(*(id *)(a1 + 40), "remoteTemplateAvailabilityKeyProvider");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          v29 = objc_msgSend(v28, "markTemplateAvailable:error:", v22, &v50);
          v30 = v50;

          if ((v29 & 1) == 0)
          {
            ACHLogTemplates();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v22, "uniqueName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v62 = (uint64_t)v33;
              v63 = 2114;
              v64 = (uint64_t)v30;
              _os_log_error_impl(&dword_21407B000, v31, OS_LOG_TYPE_ERROR, "Error writing remote template availability key for template %{public}@: %{public}@", buf, 0x16u);

            }
          }
          objc_msgSend(obja, "addObject:", v22);

        }
        else
        {
          objc_msgSend(v23, "_removeURLsByUniqueNameFromDictionary:fromAsset:", v49, v19);
          objc_msgSend(*(id *)(a1 + 40), "_removeURLsByUniqueNameFromDictionary:fromAsset:", v44, v19);
        }

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v16);
  }

  v34 = *(_QWORD *)(a1 + 48);
  v35 = (void *)objc_msgSend(obja, "copy");
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v34 + 16))(v34, v35, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "templateSourceDidUpdateAssets:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "assetSourceDelegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "templateAssetSourceDidUpdateAssets:", *(_QWORD *)(a1 + 40));

}

- (id)stickerBundleURLForTemplate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[ACHRemoteTemplateSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ACHRemoteTemplateSource_stickerBundleURLForTemplate___block_invoke;
  block[3] = &unk_24D13AC68;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__ACHRemoteTemplateSource_stickerBundleURLForTemplate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "stickerAssetURLsByUniqueName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int64_t)mobileAssetVersionForTemplate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[ACHRemoteTemplateSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ACHRemoteTemplateSource_mobileAssetVersionForTemplate___block_invoke;
  block[3] = &unk_24D13AC68;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(v5, block);

  v7 = objc_msgSend((id)v13[5], "integerValue");
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ACHRemoteTemplateSource_mobileAssetVersionForTemplate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assetVersionsByUniqueName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)buildVersion
{
  NSString *buildVersionOverride;

  if (buildVersion_onceToken != -1)
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_12);
  if (self->_buildVersionOverride)
    buildVersionOverride = self->_buildVersionOverride;
  else
    buildVersionOverride = (NSString *)buildVersion_buildNumber;
  return buildVersionOverride;
}

void __39__ACHRemoteTemplateSource_buildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSBuild");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)buildVersion_buildNumber;
  buildVersion_buildNumber = v0;

}

- (id)_resourceAssetURLForTemplate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[ACHRemoteTemplateSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ACHRemoteTemplateSource__resourceAssetURLForTemplate___block_invoke;
  block[3] = &unk_24D13AC68;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__ACHRemoteTemplateSource__resourceAssetURLForTemplate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "resourceAssetURLsByUniqueName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_addURLsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE01950]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "getLocalFileUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);
}

- (void)_removeURLsByUniqueNameFromDictionary:(id)a3 fromAsset:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE01950]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);
}

- (void)_addAssetVersionsByUniqueNameToDictionary:(id)a3 fromAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE01950]);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE66A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);
}

- (void)setBuildVersionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersionOverride, a3);
}

- (ACHTemplateAssetSourceDelegate)assetSourceDelegate
{
  return (ACHTemplateAssetSourceDelegate *)objc_loadWeakRetained((id *)&self->assetSourceDelegate);
}

- (void)setAssetSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assetSourceDelegate, a3);
}

- (ACHTemplateSourceDelegate)delegate
{
  return (ACHTemplateSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, a3);
}

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)backCompatAvailabilityKeyWriter
{
  return self->_backCompatAvailabilityKeyWriter;
}

- (void)setBackCompatAvailabilityKeyWriter:(id)a3
{
  objc_storeStrong((id *)&self->_backCompatAvailabilityKeyWriter, a3);
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, a3);
}

- (NSDictionary)resourceAssetURLsByUniqueName
{
  return self->_resourceAssetURLsByUniqueName;
}

- (void)setResourceAssetURLsByUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_resourceAssetURLsByUniqueName, a3);
}

- (NSDictionary)stickerAssetURLsByUniqueName
{
  return self->_stickerAssetURLsByUniqueName;
}

- (void)setStickerAssetURLsByUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_stickerAssetURLsByUniqueName, a3);
}

- (NSDictionary)assetVersionsByUniqueName
{
  return self->_assetVersionsByUniqueName;
}

- (void)setAssetVersionsByUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersionsByUniqueName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int)availabilityChangeToken
{
  return self->_availabilityChangeToken;
}

- (void)setAvailabilityChangeToken:(int)a3
{
  self->_availabilityChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetVersionsByUniqueName, 0);
  objc_storeStrong((id *)&self->_stickerAssetURLsByUniqueName, 0);
  objc_storeStrong((id *)&self->_resourceAssetURLsByUniqueName, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_storeStrong((id *)&self->_backCompatAvailabilityKeyWriter, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->assetSourceDelegate);
  objc_storeStrong((id *)&self->_buildVersionOverride, 0);
}

@end
