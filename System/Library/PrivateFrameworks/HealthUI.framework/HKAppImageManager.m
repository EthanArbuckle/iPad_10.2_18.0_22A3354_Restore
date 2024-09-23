@implementation HKAppImageManager

+ (id)sharedImageManager
{
  if (sharedImageManager_onceToken != -1)
    dispatch_once(&sharedImageManager_onceToken, &__block_literal_global_84);
  return (id)sharedImageManager___appImageManager;
}

void __39__HKAppImageManager_sharedImageManager__block_invoke()
{
  HKAppImageManager *v0;
  void *v1;

  v0 = objc_alloc_init(HKAppImageManager);
  v1 = (void *)sharedImageManager___appImageManager;
  sharedImageManager___appImageManager = (uint64_t)v0;

}

- (HKAppImageManager)init
{
  HKAppImageManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURLSession *session;
  NSMutableDictionary *v8;
  NSMutableDictionary *iconCacheByProductType;
  NSMutableDictionary *v10;
  NSMutableDictionary *outstandingRequests;
  uint64_t v12;
  NSMapTable *containers;
  NSMutableDictionary *v14;
  NSMutableDictionary *urlConnections;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *managerQueue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HKAppImageManager;
  v2 = -[HKAppImageManager init](&v21, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithConfiguration:delegate:delegateQueue:", v4, v2, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iconCacheByProductType = v2->_iconCacheByProductType;
    v2->_iconCacheByProductType = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    containers = v2->_containers;
    v2->_containers = (NSMapTable *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    urlConnections = v2->_urlConnections;
    v2->_urlConnections = v14;

    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    managerQueue = v2->_managerQueue;
    v2->_managerQueue = (OS_dispatch_queue *)v18;

  }
  return v2;
}

+ (id)defaultAppIcon
{
  if (defaultAppIcon_onceToken != -1)
    dispatch_once(&defaultAppIcon_onceToken, &__block_literal_global_221);
  return (id)defaultAppIcon___defaultAppIcon;
}

void __35__HKAppImageManager_defaultAppIcon__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScale:", v2);
  objc_msgSend(v10, "prepareImageForDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    v7 = objc_msgSend(v4, "CGImage");
    objc_msgSend(v5, "scale");
    objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)defaultAppIcon___defaultAppIcon;
    defaultAppIcon___defaultAppIcon = v8;

  }
}

+ (id)defaultAppIconTableUI
{
  if (defaultAppIconTableUI_onceToken != -1)
    dispatch_once(&defaultAppIconTableUI_onceToken, &__block_literal_global_226);
  return (id)defaultAppIconTableUI___defaultAppIconTableUI;
}

void __42__HKAppImageManager_defaultAppIconTableUI__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScale:", v2);
  objc_msgSend(v10, "prepareImageForDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    v7 = objc_msgSend(v4, "CGImage");
    objc_msgSend(v5, "scale");
    objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)defaultAppIconTableUI___defaultAppIconTableUI;
    defaultAppIconTableUI___defaultAppIconTableUI = v8;

  }
}

+ (id)defaultDeviceIconTableUIForSource:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurationWithHierarchicalColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "_isAppleWatch");
  if ((_DWORD)v6)
    v9 = CFSTR("Watch1,2");
  else
    v9 = CFSTR("iPhone10,6");
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "symbolForTypeIdentifier:error:", v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v13, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_systemImageNamed:withConfiguration:", v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)clearImageCache
{
  NSObject *managerQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HKAppImageManager_clearImageCache__block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_sync(managerQueue, block);
}

uint64_t __36__HKAppImageManager_clearImageCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

- (void)cacheAppIcon:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *managerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKAppImageManager_cacheAppIcon_forIdentifier___block_invoke;
  block[3] = &unk_1E9C3FB90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(managerQueue, block);

}

void __48__HKAppImageManager_cacheAppIcon_forIdentifier___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_cacheAppIcon:forIdentifier:productType:", v2, v3, v4);

}

- (void)loadIconForSource:(id)a3 productType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managerQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HKAppImageManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  managerQueue = self->_managerQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HKAppImageManager_loadIconForSource_productType_completionHandler___block_invoke;
  v15[3] = &unk_1E9C46328;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(managerQueue, v15);

}

void __69__HKAppImageManager_loadIconForSource_productType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB6C20], "bundleIdentifierForIconForSource:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v4;

    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (!v13)
      goto LABEL_18;
    objc_msgSend(*(id *)(a1 + 48), "iconCacheByProductType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
LABEL_18:
      if (objc_msgSend(*(id *)(a1 + 32), "_isApplication"))
      {
        objc_msgSend(*(id *)(a1 + 48), "_queue_loadAppIconForSource:productType:onCompletion:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 56));
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 48), "_queue_synchronousLoadIconForSource:productType:", *(_QWORD *)(a1 + 32), v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD, uint64_t, _QWORD))(v11 + 16))(v11, v12, 0, 1, 0);

      }
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (id)iconForSource:(id)a3 productType:(id)a4
{
  id v6;
  id v7;
  NSObject *managerQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HKAppImageManager_iconForSource_productType___block_invoke;
  v13[3] = &unk_1E9C46350;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(managerQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __47__HKAppImageManager_iconForSource_productType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_synchronousLoadIconForSource:productType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)loadIconForSource:(id)a3 syncHandler:(id)a4 asyncHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0CB6F18];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "currentDeviceProductType");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HKAppImageManager loadIconForSource:productType:syncHandler:asyncHandler:](self, "loadIconForSource:productType:syncHandler:asyncHandler:", v11, v12, v10, v9);

}

- (void)loadIconForSource:(id)a3 productType:(id)a4 syncHandler:(id)a5 asyncHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  void *v14;
  NSObject *managerQueue;
  id *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a5;
  v13 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  if (v10)
  {
    -[HKAppImageManager iconForSource:productType:](self, "iconForSource:productType:", v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v12[2](v12, v14);
      managerQueue = self->_managerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_2;
      block[3] = &unk_1E9C41C00;
      v16 = &v22;
      v22 = v13;
      dispatch_async(managerQueue, block);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultAppIconTableUI");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v18);

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_3;
      v19[3] = &unk_1E9C46378;
      v16 = &v20;
      v20 = v13;
      -[HKAppImageManager loadIconForSource:productType:completionHandler:](self, "loadIconForSource:productType:completionHandler:", v10, v11, v19);
    }

  }
  else
  {
    v12[2](v12, 0);
    v17 = self->_managerQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke;
    v23[3] = &unk_1E9C41C00;
    v24 = v13;
    dispatch_async(v17, v23);
    v14 = v24;
  }

}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_queue_synchronousLoadIconForSource:(id)a3 productType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB6C20], "bundleIdentifierForIconForSource:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v6, "bundleIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    if (v7)
    {
      if (!v12)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_11;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_iconCacheByProductType, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_25:

      goto LABEL_26;
    }
LABEL_11:
    if (!objc_msgSend(v6, "_isBTLEServer"))
    {
      if (objc_msgSend(v6, "_isConnectedGymSource"))
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
          -[HKAppImageManager _queue_synchronousLoadIconForSource:productType:].cold.1(v15);
        objc_msgSend(v6, "_productType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUIIconUtilties appleDeviceIconForHardwareVersion:](HKUIIconUtilties, "appleDeviceIconForHardwareVersion:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = v17;
        }
        else
        {
          HKDeviceImage(CFSTR("watch"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v18;

        goto LABEL_25;
      }
      if (objc_msgSend(v6, "_isResearchStudy"))
      {
        -[HKAppImageManager _queue_researchStudyIconForSource:](self, "_queue_researchStudyIconForSource:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v6, "_isApplication"))
      {
        -[HKAppImageManager _queue_fetchIconFromLaunchServicesWithIdentifier:](self, "_queue_fetchIconFromLaunchServicesWithIdentifier:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v6, "_isPreferredSource") && (objc_msgSend(v6, "_isApplication") & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E0CEC3F8];
        objc_msgSend(v6, "_productType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_typeWithDeviceModelCode:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0D3A838];
        v33 = v22;
        objc_msgSend(v22, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v23, "symbolForTypeIdentifier:error:", v24, &v34);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v34;

        v27 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_configurationWithHierarchicalColors:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25
          || (v31 = (void *)MEMORY[0x1E0DC3870],
              objc_msgSend(v25, "name"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v31, "_systemImageNamed:withConfiguration:", v32, v30),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v32,
              !v11))
        {
          objc_msgSend((id)objc_opt_class(), "defaultDeviceIconTableUIForSource:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_25;
      }
    }
    HKBluetoothIcon();
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v11 = (void *)v14;
    goto LABEL_25;
  }
  v11 = 0;
LABEL_26:

  return v11;
}

- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4
{
  -[HKAppImageManager loadAppImageAtURL:productType:completionHandler:](self, "loadAppImageAtURL:productType:completionHandler:", a3, 0, a4);
}

- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 completionHandler:(id)a5
{
  -[HKAppImageManager loadAppImageAtURL:productType:crop:completionHandler:](self, "loadAppImageAtURL:productType:crop:completionHandler:", a3, a4, 0, a5);
}

- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 crop:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *managerQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke;
  block[3] = &unk_1E9C463C8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(managerQueue, block);

}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _HKAppImageManagerContainer *v7;
  _HKAppImageManagerContainer *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _HKAppImageManagerContainer *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  _HKAppImageManagerContainer *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconCacheByProductType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = objc_alloc_init(_HKAppImageManagerContainer);
    v8 = v7;
    if (*(_QWORD *)(a1 + 48))
    {
      -[_HKAppImageManagerContainer setProductType:](v7, "setProductType:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKAppImageManagerContainer setProductType:](v8, "setProductType:", v9);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    -[_HKAppImageManagerContainer setData:](v8, "setData:", v10);

    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_2;
    v24[3] = &unk_1E9C463A0;
    v12 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(a1 + 64);
    v24[4] = v12;
    v25 = v2;
    v26 = *(id *)(a1 + 40);
    v27 = *(id *)(a1 + 56);
    -[_HKAppImageManagerContainer setCompletionHandler:](v8, "setCompletionHandler:", v24);
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKAppImageManagerContainer setUrlString:](v8, "setUrlString:", v13);

    v14 = *(void **)(a1 + 40);
    v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_3;
    block[3] = &unk_1E9C40210;
    v16 = v14;
    v17 = *(_QWORD *)(a1 + 32);
    v20 = v16;
    v21 = v17;
    v22 = v8;
    v23 = *(id *)(a1 + 56);
    v18 = v8;
    dispatch_async(v15, block);

  }
}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  CGSize v45;

  v44 = a2;
  v7 = a5;
  if (v44)
  {
    if (*(_QWORD *)(a1 + 64) == 1)
    {
      objc_msgSend(v44, "hk_watchIconImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_20;
      goto LABEL_19;
    }
    v9 = (void *)MEMORY[0x1E0DC3870];
    v10 = objc_retainAutorelease(v44);
    v11 = objc_msgSend(v10, "CGImage");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v10, "imageOrientation"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v21 = v20;
    v45.width = v16;
    v45.height = v18;
    UIGraphicsBeginImageContextWithOptions(v45, 0, v21);

    objc_msgSend(v14, "size");
    v23 = v22;
    objc_msgSend(v14, "size");
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v14, "size");
    if (v28 >= v27)
      v27 = v28;
    objc_msgSend(v26, "_bezierPathWithPillRect:cornerRadius:", 0.0, 0.0, v23, v25, v27 / 57.0 * 13.5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    if (v31 >= v30)
      v32 = v31;
    else
      v32 = v30;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scale");
    if (v32 <= 29.0)
      v35 = v34 * 0.100000001;
    else
      v35 = v34;

    objc_msgSend(v29, "setLineWidth:", v35);
    objc_msgSend(v29, "addClip");
    objc_msgSend(v14, "drawInRect:", 0.0, 0.0, v23, v25);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "set");

    objc_msgSend(v14, "size");
    if (v38 >= v37)
      v37 = v38;
    v39 = v37 > 29.0;
    v40 = 0.600000024;
    if (v39)
      v40 = 1.0;
    objc_msgSend(v29, "strokeWithBlendMode:alpha:", 0, v40);
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    if (v8)
    {
LABEL_19:
      objc_msgSend(*(id *)(a1 + 32), "iconCacheByProductType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "absoluteString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v8, v43);

    }
  }
  else
  {
    v8 = 0;
  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D829F904]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:cachePolicy:timeoutInterval:", *(_QWORD *)(a1 + 32), 0, 5.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "dataTaskWithRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(*(id *)(a1 + 32), "absoluteString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 48), v4);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, v7);

    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_DEFAULT, "Begining data task for url %@.", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(v4, "resume");
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HKAppImageManager"), 1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, v11);

  }
  objc_autoreleasePoolPop(v2);
}

- (id)iconForDevice:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  if (!objc_msgSend(v3, "_isConnectedGymDevice"))
  {
    objc_msgSend(v3, "hardwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKUIIconUtilties appleDeviceIconForHardwareVersion:](HKUIIconUtilties, "appleDeviceIconForHardwareVersion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5 = v7;
      goto LABEL_6;
    }
    HKBluetoothIcon();
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v9;
    v5 = 0;
    goto LABEL_10;
  }
  +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:](HKUIConnectedGymIconUtilties, "iconForConnectedGymDevice:preferredIconWidth:", v3, 29.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HKDeviceImage(CFSTR("watch"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v5 = v4;
LABEL_6:
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)researchStudyIconForSource:(id)a3
{
  id v4;
  NSObject *managerQueue;
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
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = 0;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKAppImageManager_researchStudyIconForSource___block_invoke;
  block[3] = &unk_1E9C463F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(managerQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__HKAppImageManager_researchStudyIconForSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_researchStudyIconForSource:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_researchStudyIconForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAppImageManager iconCacheByProductType](self, "iconCacheByProductType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v24 = 0;
    objc_msgSend(v4, "_fetchBundleWithError:", &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (v12)
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKAppImageManager _queue_researchStudyIconForSource:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      objc_msgSend((id)objc_opt_class(), "defaultAppIconTableUI");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("Icon"), v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAppImageManager _queue_cacheAppIcon:forIdentifier:productType:](self, "_queue_cacheAppIcon:forIdentifier:productType:", v10, v22, v5);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "defaultAppIconTableUI");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v10;
}

- (void)_queue_cacheAppIcon:(id)a3 forIdentifier:(id)a4 productType:(id)a5
{
  NSMutableDictionary *iconCacheByProductType;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  iconCacheByProductType = self->_iconCacheByProductType;
  v9 = a4;
  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](iconCacheByProductType, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iconCacheByProductType, "setObject:forKeyedSubscript:", v12, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconCacheByProductType, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)_queue_loadAppIconForSource:(id)a3 productType:(id)a4 onCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAppImageManager _queue_fetchIconFromLaunchServicesWithIdentifier:](self, "_queue_fetchIconFromLaunchServicesWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    (*((void (**)(id, void *, _QWORD, uint64_t, _QWORD))v10 + 2))(v10, v12, 0, 1, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke;
    v13[3] = &unk_1E9C46440;
    v13[4] = self;
    v14 = v9;
    v16 = v10;
    v15 = v8;
    +[HKSourceListDataSource fetchIconForSource:completion:](HKSourceListDataSource, "fetchIconForSource:completion:", v15, v13);

  }
}

void __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke_2;
  block[3] = &unk_1E9C46418;
  v10 = v4;
  v11 = v3;
  v14 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D829F904]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", *MEMORY[0x1E0CB59E8]);
  if (!*(_QWORD *)(a1 + 40) || (v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6C20], "bundleIdentifierForIconForSource:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_msgSend(*(id *)(a1 + 56), "outstandingRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
    v11 = v10;
    if (v9)
    {
      v12 = _Block_copy(v10);
      objc_msgSend(v9, "addObject:", v12);

    }
    else
    {
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(*(id *)(a1 + 56), "outstandingRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v7);

      objc_msgSend(*(id *)(a1 + 56), "_enqueueRequestForAppIconForIdentifier:productType:", v7, *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

- (id)_queue_fetchIconFromLaunchServicesWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v11);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    objc_msgSend(v6, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAppImageManager _queue_cacheAppIcon:forIdentifier:productType:](self, "_queue_cacheAppIcon:forIdentifier:productType:", v8, v4, v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_dispatchResponsesForAppIconForIdentifier:(id)a3 appImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *managerQueue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HKAppImageManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    managerQueue = self->_managerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HKAppImageManager__dispatchResponsesForAppIconForIdentifier_appImage___block_invoke;
    block[3] = &unk_1E9C3FB90;
    v12 = v7;
    v13 = self;
    v14 = v6;
    dispatch_async(managerQueue, block);

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5320], OS_LOG_TYPE_ERROR))
      -[HKAppImageManager _dispatchResponsesForAppIconForIdentifier:appImage:].cold.1((uint64_t)v6, (uint64_t)v8, v10);
  }

}

void __72__HKAppImageManager__dispatchResponsesForAppIconForIdentifier_appImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_queue_cacheAppIcon:forIdentifier:productType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v2);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "outstandingRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "outstandingRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

}

- (void)_enqueueRequestForAppIconForIdentifier:(id)a3 productType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *managerQueue;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  HKAppImageManager *v35;
  id v36;
  char v37;
  char v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB59E8];
  v10 = objc_msgSend(v8, "hasPrefix:", *MEMORY[0x1E0CB59E8]);
  v11 = *MEMORY[0x1E0CB7848];
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7848]))
  {
    -[HKAppImageManager MindfulnessAppIconForVisionPro:](self, "MindfulnessAppIconForVisionPro:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      managerQueue = self->_managerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke;
      block[3] = &unk_1E9C44AB8;
      block[4] = self;
      v13 = v12;
      v40 = v13;
      v15 = v6;
      v41 = v15;
      v42 = v7;
      dispatch_async(managerQueue, block);
      -[HKAppImageManager _dispatchResponsesForAppIconForIdentifier:appImage:](self, "_dispatchResponsesForAppIconForIdentifier:appImage:", v15, v13);

    }
    else
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5320], OS_LOG_TYPE_ERROR))
        -[HKAppImageManager _enqueueRequestForAppIconForIdentifier:productType:].cold.1(v11, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    v16 = objc_msgSend(v7, "hasPrefix:", v9);
    v17 = (void *)MEMORY[0x1E0CFD9E8];
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bagForProfile:profileVersion:", v18, v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0CFDB48]);
    v21 = (void *)objc_msgSend(v20, "initWithType:clientIdentifier:clientVersion:bag:", 0, *MEMORY[0x1E0CB7630], CFSTR("1"), v13);
    v46[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBundleIdentifiers:", v22);

    if (v16)
    {
      v45 = *MEMORY[0x1E0CFD8F8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAdditionalPlatforms:", v23);

    }
    objc_msgSend(v21, "perform");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5320], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      _os_log_impl(&dword_1D7813000, v25, OS_LOG_TYPE_DEFAULT, "Enqueuing request to download App information for identifier %@", buf, 0xCu);
    }
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_254;
    v33[3] = &unk_1E9C46490;
    v34 = v6;
    v35 = self;
    v37 = v16;
    v38 = v10;
    v36 = v7;
    objc_msgSend(v24, "addFinishBlock:", v33);

  }
}

uint64_t __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cacheAppIcon:forIdentifier:productType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  objc_class *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5320], OS_LOG_TYPE_ERROR))
      __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_254_cold_1();
    v34 = a1 + 32;
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v34 + 8);
    objc_msgSend((id)objc_opt_class(), "defaultAppIcon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_dispatchResponsesForAppIconForIdentifier:appImage:", v32, v18);
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
      v8 = CFSTR("xros");
    else
      v8 = CFSTR("ios");
    v9 = (objc_class *)MEMORY[0x1E0CFDB28];
    v10 = v8;
    v11 = [v9 alloc];
    objc_msgSend(v5, "responseDataItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("artwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v11, "initWithDictionary:", v17);

    if (*(_BYTE *)(a1 + 57))
      v19 = 32.0;
    else
      v19 = 29.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v22 = v19 * v21;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    objc_msgSend(v18, "URLWithSize:cropStyle:format:", *MEMORY[0x1E0CFD870], *MEMORY[0x1E0CFD880], v22, v19 * v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("com.apple.Nano"));
    v28 = *(void **)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 48);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_268;
    v35[3] = &unk_1E9C46468;
    v29 = *(id *)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(void **)(a1 + 48);
    v36 = v29;
    v37 = v30;
    v38 = v31;
    objc_msgSend(v28, "loadAppImageAtURL:productType:crop:completionHandler:", v25, v27, v26, v35);

  }
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_268(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5320];
  v10 = *MEMORY[0x1E0CB5320];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_268_cold_1();
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v9;
      objc_msgSend(v7, "size");
      v14 = v13;
      objc_msgSend(v7, "size");
      *(_DWORD *)buf = 134218240;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_DEFAULT, "app image size from loadAppImage: %f %f", buf, 0x16u);

    }
    v11 = v7;
    if (v7)
    {
      v16 = a1[5];
      v17 = *((_QWORD *)v16 + 4);
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_269;
      v21 = &unk_1E9C44AB8;
      v22 = v16;
      v11 = v7;
      v23 = v11;
      v24 = a1[4];
      v25 = a1[6];
      dispatch_async(v17, &v18);

    }
  }
  objc_msgSend(a1[5], "_dispatchResponsesForAppIconForIdentifier:appImage:", a1[4], v11, v18, v19, v20, v21, v22);

}

uint64_t __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_269(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cacheAppIcon:forIdentifier:productType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  NSObject *managerQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKAppImageManager_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E9C3FB90;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(managerQueue, block);

}

void __56__HKAppImageManager_URLSession_dataTask_didReceiveData___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", a1[6]);

    v2 = v4;
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *managerQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKAppImageManager_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E9C3FB90;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(managerQueue, block);

}

void __58__HKAppImageManager_URLSession_task_didCompleteWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;

  v2 = (void *)MEMORY[0x1D829F904]();
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a1[6])
  {
    if (v3)
    {
      v5 = *(void **)(a1[4] + 40);
      objc_msgSend(v3, "productType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "urlString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "completionHandler");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v10;
      if (v9)
      {
        v12 = v9;
        v13 = 1;
        v14 = 1;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
      }
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, v12, v13, v14, a1[6]);
LABEL_13:

      v17 = *(void **)(a1[4] + 24);
      objc_msgSend(v4, "urlString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v18);

      objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
    }
  }
  else if (v3)
  {
    objc_msgSend(v3, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length")
      && (objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v9), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v15;
      objc_msgSend(v4, "completionHandler");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16[2](v16, v11, 0, 1, 0);
    }
    else
    {
      objc_msgSend(v4, "completionHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HKAppImageManager"), 1002, 0);
      v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, 0, 0, v16);
    }

    goto LABEL_13;
  }

  objc_autoreleasePoolPop(v2);
}

- (id)MindfulnessAppIconForVisionPro:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("mindfulness_app_icon"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableDictionary)iconCacheByProductType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIconCacheByProductType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)outstandingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutstandingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_iconCacheByProductType, 0);
  objc_storeStrong((id *)&self->_managerQueue, 0);
  objc_storeStrong((id *)&self->_urlConnections, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_queue_synchronousLoadIconForSource:(os_log_t)log productType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "GymKit icons should be derived from the device", v1, 2u);
}

- (void)_queue_researchStudyIconForSource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to load bundle with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)_dispatchResponsesForAppIconForIdentifier:(NSObject *)a3 appImage:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "_dispatchResponsesForAppIconForIdentifier identifier: %@ appImage: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7_0();
}

- (void)_enqueueRequestForAppIconForIdentifier:(uint64_t)a3 productType:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to create app image for %@ identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_254_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "AMS Promise failed for: %@ error: %{public}@");
  OUTLINED_FUNCTION_7_0();
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_268_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "Couldn't load app image failed for: %@ error: %{public}@");
  OUTLINED_FUNCTION_7_0();
}

@end
