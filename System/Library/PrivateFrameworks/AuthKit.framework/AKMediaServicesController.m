@implementation AKMediaServicesController

- (AKMediaServicesController)init
{
  AKMediaServicesController *v2;
  AKMediaServicesController *v3;
  uint64_t v4;
  NSMutableDictionary *activeLockupGroupForBundleID;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *imageDownloadQueue;
  objc_class *ASCLockupViewGroupClass;
  uint64_t v10;
  ASCLockupViewGroup *group;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AKMediaServicesController;
  v2 = -[AKMediaServicesController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_activeLockupGroupLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    activeLockupGroupForBundleID = v3->_activeLockupGroupForBundleID;
    v3->_activeLockupGroupForBundleID = (NSMutableDictionary *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.authkit.AKMediaServicesController.imagedownloadqueue", v6);
    imageDownloadQueue = v3->_imageDownloadQueue;
    v3->_imageDownloadQueue = (OS_dispatch_queue *)v7;

    ASCLockupViewGroupClass = (objc_class *)AppStoreComponentsLibraryCore();
    if (ASCLockupViewGroupClass)
      ASCLockupViewGroupClass = (objc_class *)getASCLockupViewGroupClass();
    v10 = objc_msgSend([ASCLockupViewGroupClass alloc], "initWithName:", CFSTR("AKMediaServicesController Lockup Group"));
    group = v3->_group;
    v3->_group = (ASCLockupViewGroup *)v10;

  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_17);
  return (id)sharedInstance_sharedInstance_0;
}

void __43__AKMediaServicesController_sharedInstance__block_invoke()
{
  AKMediaServicesController *v0;
  void *v1;

  v0 = objc_alloc_init(AKMediaServicesController);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (void)appIconForBundleID:(id)a3 size:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ASCLockupViewGroup *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  AKMediaServicesController *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Fetching Icon for bundleID: %@", buf, 0xCu);
  }

  v12 = self->_group;
  if (v9)
  {
    objc_msgSend(v9, "CGSizeValue");
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v14 = 0x4052000000000000;
    v16 = 0x4052000000000000;
  }
  os_unfair_lock_lock(&self->_activeLockupGroupLock);
  -[NSMutableDictionary setObject:forKey:](self->_activeLockupGroupForBundleID, "setObject:forKey:", v12, v8);
  os_unfair_lock_unlock(&self->_activeLockupGroupLock);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke;
  v19[3] = &unk_1E2E600F0;
  v19[4] = v12;
  v20 = v8;
  v21 = self;
  v22 = v10;
  v23 = v14;
  v24 = v16;
  v17 = v10;
  v18 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v19);

}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = AppStoreComponentsLibraryCore();
  if (v4)
  {
    getASCLockupContextSignInWithApple();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2;
  v9[3] = &unk_1E2E600C8;
  v8 = *(int8x16_t *)(a1 + 40);
  v6 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v7 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "_lockupRequestForBundleID:withContext:enableAppDistribution:completionBlock:", v3, v5, 1, v9);
  if (v4)

}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  __int128 v20;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_isRequestCancelledForBundleID:", *(_QWORD *)(a1 + 40)))
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1();
LABEL_4:

    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKGenericError"), -17001, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
    goto LABEL_13;
  }
  if (!v6)
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_32;
      block[3] = &unk_1E2E600A0;
      block[4] = *(_QWORD *)(a1 + 48);
      v12 = v5;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v16 = v12;
      v17 = v13;
      v18 = v14;
      v19 = *(id *)(a1 + 56);
      v20 = *(_OWORD *)(a1 + 64);
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_13;
    }
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_2();
    goto LABEL_4;
  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_3();

  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
LABEL_13:

}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_32(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = AppStoreComponentsLibraryCore();
  if (v3)
  {
    get_ASCLockupKeyIcon();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!AppStoreComponentsLibraryCore())
  {
    v6 = (void *)objc_msgSend(v2, "initWithObjects:", v4, 0, 0);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  get_ASCLockupKeyTitle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjects:", v4, v5, 0);

  if (v3)
LABEL_6:

LABEL_7:
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34;
  v10[3] = &unk_1E2E5E5E8;
  v9 = *(void **)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 48);
  v11 = v9;
  v12 = *(id *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v7, "_lockupDictionaryForRequest:includingKeys:withCompletionBlock:", v8, v6, v10);

}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD block[5];
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[6];

  v43[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_isRequestCancelledForBundleID:", *(_QWORD *)(a1 + 40)))
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1();
LABEL_4:

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKGenericError"), -17001, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
    goto LABEL_53;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v6)
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (!v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_2();
      goto LABEL_4;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_4();

    if (AppStoreComponentsLibraryCore())
    {
      get_ASCLockupKeyIcon();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_16:
        v15 = AppStoreComponentsLibraryCore();
        v36 = v15;
        if (v15)
        {
          getASCArtworkTemplateKeyWidth();
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v31 = (void *)v15;
        v42[0] = v15;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)(a1 + 56));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v35;
        v16 = AppStoreComponentsLibraryCore();
        v34 = v16;
        if (v16)
        {
          getASCArtworkTemplateKeyHeight();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v30 = (void *)v16;
        v42[1] = v16;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)(a1 + 64));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v33;
        v17 = AppStoreComponentsLibraryCore();
        v32 = v17;
        v37 = v14;
        if (v17)
        {
          getASCArtworkTemplateKeyCrop();
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)v17;
        v42[2] = v17;
        v18 = AppStoreComponentsLibraryCore();
        if (v18)
        {
          getASCArtworkCropBoundingBox();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        v43[2] = v19;
        v23 = AppStoreComponentsLibraryCore();
        if (v23)
        {
          getASCArtworkTemplateKeyFormat();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        v42[3] = v24;
        v25 = AppStoreComponentsLibraryCore();
        if (v25)
        {
          getASCArtworkFormatPNG();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
        v43[3] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)

        if (v23)
        if (v18)

        if (v32)
        v14 = v37;
        if (v34)

        if (v36)
        objc_msgSend(v37, "makeURLWithSubstitutions:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39;
        block[3] = &unk_1E2E5EC00;
        block[4] = v27;
        v39 = v5;
        v40 = v37;
        v41 = *(id *)(a1 + 48);
        dispatch_async(v28, block);

        goto LABEL_51;
      }
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_16;
    }
    _AKLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_3();

    v21 = *(_QWORD *)(a1 + 48);
    if (!v21)
      goto LABEL_52;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKGenericError"), -17001, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);
LABEL_51:

LABEL_52:
    goto LABEL_53;
  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_5();

  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
LABEL_53:

}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  AKIconContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;

  v2 = *(_QWORD *)(a1 + 32);
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 1, &v41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v41;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_5((uint64_t *)(a1 + 32), v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_4();
  }

  v7 = objc_alloc_init(AKIconContext);
  -[AKIconContext setData:](v7, "setData:", v3);
  v8 = *(void **)(a1 + 40);
  v9 = AppStoreComponentsLibraryCore();
  if (v9)
  {
    get_ASCLockupKeyTitle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIconContext setAppName:](v7, "setAppName:", v11);

  if (v9)
  objc_msgSend(*(id *)(a1 + 48), "decoration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppStoreComponentsLibraryCore())
  {
    getASCArtworkDecorationNone();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_13;
  }
  else
  {
    v24 = objc_msgSend(v12, "isEqualToString:", 0);

    if (v24)
    {
LABEL_13:
      _AKLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_1(v15, v17, v18, v19, v20, v21, v22, v23);
        v16 = 2;
      }
      goto LABEL_25;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "decoration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppStoreComponentsLibraryCore())
  {
    getASCArtworkDecorationRoundedRect();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqualToString:", v26);

    if ((v27 & 1) != 0)
    {
LABEL_18:
      _AKLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_2(v15, v28, v29, v30, v31, v32, v33, v34);
      v16 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    v35 = objc_msgSend(v25, "isEqualToString:", 0);

    if (v35)
      goto LABEL_18;
  }
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_3((id *)(a1 + 48), v15);
  v16 = 0;
LABEL_25:

  -[AKIconContext setMaskingStyle:](v7, "setMaskingStyle:", v16);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_42;
  v38[3] = &unk_1E2E60078;
  v36 = *(id *)(a1 + 56);
  v39 = v4;
  v40 = v36;
  v38[4] = v7;
  v37 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v38);

}

uint64_t __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_42(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)cancelAppIconRequestForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[AKMediaServicesController _isRequestCancelledForBundleID:](self, "_isRequestCancelledForBundleID:", v6))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKMediaServicesController cancelAppIconRequestForBundleID:completion:].cold.1();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKSignInWithAppleError"), -16007, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v9);

    }
  }
  else
  {
    os_unfair_lock_lock(&self->_activeLockupGroupLock);
    -[NSMutableDictionary removeObjectForKey:](self->_activeLockupGroupForBundleID, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_activeLockupGroupLock);
    if (v7)
      v7[2](v7, 1, 0);
  }

}

- (BOOL)_isRequestCancelledForBundleID:(id)a3
{
  os_unfair_lock_s *p_activeLockupGroupLock;
  id v5;
  void *v6;

  p_activeLockupGroupLock = &self->_activeLockupGroupLock;
  v5 = a3;
  os_unfair_lock_lock(p_activeLockupGroupLock);
  -[NSMutableDictionary objectForKey:](self->_activeLockupGroupForBundleID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_activeLockupGroupLock);
  return v6 == 0;
}

- (void)appMetadataForBundleIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  id obj;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2810000000;
  v34[3] = "";
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  v15 = v7;
  v33 = (id)objc_opt_new();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  v30[4] = __Block_byref_object_dispose__5;
  v31 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
        dispatch_group_enter(v8);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke;
        v21[3] = &unk_1E2E60118;
        v23 = v34;
        v24 = v32;
        v25 = v30;
        v22 = v8;
        -[AKMediaServicesController _appMetadataForBundleID:completion:](self, "_appMetadataForBundleID:completion:", v12, v21);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v9);
  }

  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke_2;
  block[3] = &unk_1E2E60140;
  v19 = v32;
  v20 = v30;
  v18 = v15;
  v14 = v15;
  dispatch_group_notify(v8, v13, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

void __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addEntriesFromDictionary:", v9);
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, a3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t (*v2)(void);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count") || !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v2 = *(uint64_t (**)(void))(a1[4] + 16);
  else
    v2 = *(uint64_t (**)(void))(a1[4] + 16);
  return v2();
}

- (void)_appMetadataForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ASCLockupViewGroup *group;
  id v9;
  id v10;
  ASCLockupViewGroup *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  group = self->_group;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke;
  block[3] = &unk_1E2E60190;
  block[4] = group;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = group;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = AppStoreComponentsLibraryCore();
  if (v4)
  {
    getASCLockupContextSignInWithApple();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2;
  v7[3] = &unk_1E2E60168;
  v8 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  objc_msgSend(v2, "_lockupRequestForBundleID:withContext:enableAppDistribution:completionBlock:", v3, v5, 1, v7);
  if (v4)

}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_2();

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_46;
    v12[3] = &unk_1E2E5EC00;
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v5;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_1();

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKGenericError"), -17001, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
  }

}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_46(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = AppStoreComponentsLibraryCore();
  if (v3)
  {
    get_ASCLockupKeyDeveloperName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = AppStoreComponentsLibraryCore();
  if (v5)
  {
    get_ASCLockupKeyTitle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = AppStoreComponentsLibraryCore();
  if (v7)
  {
    get_ASCLockupKeyShortName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (AppStoreComponentsLibraryCore())
  {
    get_ASCLockupKeyAdamID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v2, "initWithObjects:", v4, v6, v8, v9, 0);

    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = (void *)objc_msgSend(v2, "initWithObjects:", v4, v6, v8, 0, 0);
  if (v7)
LABEL_12:

LABEL_13:
  if (v5)

  if (v3)
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47;
  v13[3] = &unk_1E2E5F0B0;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v11, "_lockupDictionaryForRequest:includingKeys:withCompletionBlock:", v12, v10, v13);

}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  AKAppiTunesMetadata *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AKAppiTunesMetadata *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47_cold_2();

    if (AppStoreComponentsLibraryCore())
    {
      get_ASCLockupKeyAdamID();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = [AKAppiTunesMetadata alloc];
    v25 = *(_QWORD *)(a1 + 32);
    v26 = AppStoreComponentsLibraryCore();
    if (v26)
    {
      get_ASCLockupKeyShortName();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v24 = (void *)v12;
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = AppStoreComponentsLibraryCore();
    v27 = a1;
    if (v13)
    {
      get_ASCLockupKeyTitle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = AppStoreComponentsLibraryCore();
    v28 = v6;
    if (v16)
    {
      get_ASCLockupKeyDeveloperName();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(v10, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AKAppiTunesMetadata initWithBundleId:shortName:appName:appDeveloperName:adamID:](v11, "initWithBundleId:shortName:appName:appDeveloperName:adamID:", v25, v29, v15, v18, v20);

    if (v16)
    if (v13)

    if (v26)
    v22 = *(_QWORD *)(v27 + 40);
    v30 = *(_QWORD *)(v27 + 32);
    v31[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

    v6 = v28;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_imageDownloadQueue, 0);
  objc_storeStrong((id *)&self->_activeLockupGroupForBundleID, 0);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "App icon request for bundleID %@ was cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Lockup request for bundleID %@ is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Failed to fetch lockup request for bundleID %@ with error %@");
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Lockup dictionary for bundleID %@ is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Lockup dictionary does not contain artwork for bundleID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Lockup dictionary result: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_34_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Failed to fetch lockup dictionary for bundleID %@ with error %@");
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Setting masking style to AKIconMaskingStyleUnmasked for artwork decoration style ASCArtworkDecorationNone", a5, a6, a7, a8, 0);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Setting masking style to AKIconMaskingStyleMasked for artwork decoration style ASCArtworkDecorationRoundedRect", a5, a6, a7, a8, 0);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "decoration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Setting masking style to AKIconMaskingStyleUnknown for artwork decoration style %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Request for %@ failed %@");
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_39_cold_5(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "length");
  _os_log_debug_impl(&dword_19202F000, a3, OS_LOG_TYPE_DEBUG, "Request for %@ received data of length %lu", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)cancelAppIconRequestForBundleID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "No active lockup group found for bundleID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Lockup request for bundleID %@ is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Failed to fetch lockup request for bundleID %@ with error %@");
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19202F000, v0, v1, "Error fetching app metadata for %@: %@");
  OUTLINED_FUNCTION_1();
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_47_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "App metadata results: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
