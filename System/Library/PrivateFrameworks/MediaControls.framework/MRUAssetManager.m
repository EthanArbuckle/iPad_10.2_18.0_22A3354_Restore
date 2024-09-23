@implementation MRUAssetManager

+ (MRUAssetManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_22);
  return (MRUAssetManager *)(id)sharedManager_shared;
}

void __32__MRUAssetManager_sharedManager__block_invoke()
{
  MRUAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(MRUAssetManager);
  v1 = (void *)sharedManager_shared;
  sharedManager_shared = (uint64_t)v0;

}

- (MRUAssetManager)init
{
  MRUAssetManager *v2;
  SFDeviceAssetManager *v3;
  SFDeviceAssetManager *assetManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUAssetManager;
  v2 = -[MRUAssetManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (SFDeviceAssetManager *)objc_alloc_init(MEMORY[0x1E0D97438]);
    assetManager = v2->_assetManager;
    v2->_assetManager = v3;

    -[SFDeviceAssetManager activate](v2->_assetManager, "activate");
  }
  return v2;
}

- (void)imageForEndpointRoute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[MRUAssetManager symbolImageForEndpointRoute:](self, "symbolImageForEndpointRoute:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUAssetManager shouldLoadPhotorealisticAssetForRoute:](self, "shouldLoadPhotorealisticAssetForRoute:", v6))
  {
    objc_msgSend(v6, "endpointObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outputDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceEnclosureColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__MRUAssetManager_imageForEndpointRoute_completion___block_invoke;
    v14[3] = &unk_1E581A200;
    v16 = v7;
    v15 = v8;
    -[MRUAssetManager imageForModelIdentifier:color:allowFallback:completion:](self, "imageForModelIdentifier:color:allowFallback:completion:", v12, v13, 0, v14);

  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }

}

uint64_t __52__MRUAssetManager_imageForEndpointRoute_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)imageForOutputDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "modelID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceEnclosureColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAssetManager imageForModelIdentifier:color:completion:](self, "imageForModelIdentifier:color:completion:", v9, v8, v6);
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 completion:(id)a6
{
  -[MRUAssetManager imageForModelIdentifier:color:allowFallback:timeout:completion:](self, "imageForModelIdentifier:color:allowFallback:timeout:completion:", a3, a4, a5, a6, 0.0);
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 completion:(id)a5
{
  -[MRUAssetManager imageForModelIdentifier:color:allowFallback:completion:](self, "imageForModelIdentifier:color:allowFallback:completion:", a3, a4, 0, a5);
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 allowFallback:(BOOL)a5 timeout:(double)a6 completion:(id)a7
{
  -[MRUAssetManager imageForModelIdentifier:color:name:allowFallback:timeout:completion:](self, "imageForModelIdentifier:color:name:allowFallback:timeout:completion:", a3, a4, CFSTR("ProxCard_Setup"), a5, a7, a6);
}

- (void)imageForModelIdentifier:(id)a3 color:(id)a4 name:(id)a5 allowFallback:(BOOL)a6 timeout:(double)a7 completion:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, int, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v10 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  MCLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v39 = v19;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    v44 = 1024;
    v45 = v10;
    v46 = 2048;
    v47 = a7;
    _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEBUG, "[AssetManager] Request<%@> Bundle for model: %@, color: %@, allow fallback? %{BOOL}u, timeout: %f", buf, 0x30u);
  }

  if (v15)
  {
    v21 = objc_alloc(MEMORY[0x1E0D97448]);
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __87__MRUAssetManager_imageForModelIdentifier_color_name_allowFallback_timeout_completion___block_invoke;
    v31 = &unk_1E581A228;
    v32 = v19;
    v34 = v17;
    v35 = v10;
    v33 = v16;
    v22 = (void *)objc_msgSend(v21, "initWithQueryResultHandler:", &v28);
    objc_msgSend(v22, "setTimeout:", a7, v28, v29, v30, v31);
    v23 = objc_alloc(MEMORY[0x1E0D97440]);
    v36 = *MEMORY[0x1E0D974F8];
    v37 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithProductType:additionalQueryParameters:", v14, v24);

    -[SFDeviceAssetManager getAssetBundleForDeviceQuery:withRequestConfiguration:](self->_assetManager, "getAssetBundleForDeviceQuery:withRequestConfiguration:", v25, v22);
    v26 = v32;
  }
  else
  {
    MCLogCategoryDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_1AA991000, v27, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> No color provided, not requesting bundle", buf, 0xCu);
    }

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MRUAssetManagerErrorDomain"), 0, 0);
    (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v26);
  }

}

void __87__MRUAssetManager_imageForModelIdentifier_color_name_allowFallback_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(void);
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  MCLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v24 = 138413314;
    v25 = v13;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 1024;
    v31 = a4;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEBUG, "[AssetManager] Update<%@> Got bundle: %@, type: %@, fallback: %{BOOL}u, error: %@", (uint8_t *)&v24, 0x30u);
  }

  if (!v9)
  {
    MCLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v24 = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Failed to obtain bundle", (uint8_t *)&v24, 0xCu);
    }

    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = 1;
    goto LABEL_15;
  }
  if (a4 && !*(_BYTE *)(a1 + 56))
  {
    MCLogCategoryDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = 138412290;
      v25 = v23;
      _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Fallback bundle not allowed", (uint8_t *)&v24, 0xCu);
    }

    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = 2;
LABEL_15:
    v16 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("MRUAssetManagerErrorDomain"), v21, 0);
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  MCLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v24 = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEBUG, "[AssetManager] Response<%@> Bundle found", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", *(_QWORD *)(a1 + 40), v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
  v17();

}

- (id)symbolImageForEndpointRoute:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D4C4F8];
  objc_msgSend(a3, "endpointObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolNameForOutputDevices:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldLoadPhotorealisticAssetForRoute:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count") == 1 && objc_msgSend(v5, "deviceSubtype") == 12;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
