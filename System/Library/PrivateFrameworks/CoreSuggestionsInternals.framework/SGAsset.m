@implementation SGAsset

+ (id)asset
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)assetInstance;
}

+ (id)notificationQueue
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)notificationQueue;
}

+ (id)localeAsset
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)localeAssetInstance;
}

+ (id)localeAssetIdentifier
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)localeAssetIdentifier;
}

+ (id)regionAsset
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)regionAssetInstance;
}

+ (id)regionAssetIdentifier
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_34804);
  return (id)regionAssetIdentifier;
}

+ (void)downloadMetadataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;

  v4 = a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_msgSend(a1, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke;
  v25[3] = &unk_1E7DB7430;
  v27 = v32;
  v8 = v5;
  v26 = v8;
  objc_msgSend(v6, "downloadMetadataWithCompletion:", v25);

  dispatch_group_enter(v8);
  objc_msgSend(a1, "localeAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_176;
  v22[3] = &unk_1E7DB7430;
  v24 = v30;
  v10 = v8;
  v23 = v10;
  objc_msgSend(v9, "downloadMetadataWithCompletion:", v22);

  if (+[SGMessageEventDissector mobileAssetsEnabled](SGMessageEventDissector, "mobileAssetsEnabled"))
  {
    dispatch_group_enter(v10);
    objc_msgSend(a1, "regionAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_177;
    v19[3] = &unk_1E7DB7430;
    v21 = v28;
    v20 = v10;
    objc_msgSend(v11, "downloadMetadataWithCompletion:", v19);

  }
  dispatch_get_global_queue(17, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __42__SGAsset_downloadMetadataWithCompletion___block_invoke_178;
  v14[3] = &unk_1E7DB7458;
  v15 = v4;
  v16 = v32;
  v17 = v30;
  v18 = v28;
  v13 = v4;
  dispatch_group_notify(v10, v12, v14);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [common] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke_176(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [locale] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__SGAsset_downloadMetadataWithCompletion___block_invoke_177(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets [region] metadata download success? %d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __42__SGAsset_downloadMetadataWithCompletion___block_invoke_178(_QWORD *a1)
{
  _QWORD *v2;
  _BOOL8 v3;

  if (!+[SGMessageEventDissector mobileAssetsEnabled](SGMessageEventDissector, "mobileAssetsEnabled"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v2 = a1 + 6;
      goto LABEL_7;
    }
LABEL_8:
    v3 = 0;
    return (*(uint64_t (**)(_QWORD, _BOOL8))(a1[4] + 16))(a1[4], v3);
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) || !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    goto LABEL_8;
  v2 = a1 + 7;
LABEL_7:
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*v2 + 8) + 24) != 0;
  return (*(uint64_t (**)(_QWORD, _BOOL8))(a1[4] + 16))(a1[4], v3);
}

@end
