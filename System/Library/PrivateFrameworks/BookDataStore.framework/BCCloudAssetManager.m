@implementation BCCloudAssetManager

- (id)initClientXPCProxy
{
  BCCloudAssetManager *v2;
  NSObject *v3;
  BDSServiceProxy *v4;
  BDSServiceProxy *serviceProxy;
  BCCloudDataSource *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BCCloudDataSource *assetDataSource;
  BCCloudAssetAnnotationManager *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BCCloudAssetAnnotationManager *assetAnnotationManager;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BCCloudChangeTokenController *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  BCCloudChangeTokenController *changeTokenController;
  uint8_t v42[16];
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)BCCloudAssetManager;
  v2 = -[BCCloudAssetManager init](&v43, sel_init);
  if (v2)
  {
    BDSCloudKitLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_DEFAULT, "Initializing BCCloudAssetManager - Proxy Build", v42, 2u);
    }

    v4 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v4;

    objc_storeStrong((id *)&v2->_assetDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_readingNowDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_assetReviewManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_storeAssetManager, v2->_serviceProxy);
    v6 = [BCCloudDataSource alloc];
    objc_msgSend_objectModel(v2, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_initWithManagedObjectModel_nameOnDisk_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("BCAssetData"), v13);
    assetDataSource = v2->_assetDataSource;
    v2->_assetDataSource = (BCCloudDataSource *)v14;

    v16 = [BCCloudAssetAnnotationManager alloc];
    v17 = (uint64_t)v2->_assetDataSource;
    objc_msgSend_sharedInstance(BCCloudKitController, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_initWithCloudDataSource_cloudKitController_(v16, v23, v17, (uint64_t)v22, v24);
    assetAnnotationManager = v2->_assetAnnotationManager;
    v2->_assetAnnotationManager = (BCCloudAssetAnnotationManager *)v25;

    objc_msgSend_sharedInstance(BCCloudKitController, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [BCCloudChangeTokenController alloc];
    objc_msgSend_managedObjectContext(v2->_assetDataSource, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_initWithMOC_zoneName_cloudKitController_(v32, v38, (uint64_t)v37, (uint64_t)CFSTR("AssetZone"), (uint64_t)v31);
    changeTokenController = v2->_changeTokenController;
    v2->_changeTokenController = (BCCloudChangeTokenController *)v39;

    v2->_proxyMode = 1;
  }
  return v2;
}

+ (id)sharedManager
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class();
  return (id)MEMORY[0x24BEDD108](v2, sel_sharedClientXPCProxy, v3, v4, v5);
}

+ (id)sharedClientXPCProxy
{
  if (qword_253F3C628 != -1)
    dispatch_once(&qword_253F3C628, &unk_24F08B2D0);
  return (id)qword_253F3C650;
}

- (BCCloudReadingNowDetailManager)readingNowDetailManager
{
  return self->_readingNowDetailManager;
}

- (NSManagedObjectModel)objectModel
{
  NSManagedObjectModel *objectModel;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObjectModel *v20;
  NSManagedObjectModel *v21;

  objectModel = self->_objectModel;
  if (!objectModel)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("BCAssetData"), (uint64_t)CFSTR("momd"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v13, (uint64_t)v12, 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BDBB6B0]);
    v20 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v16, v17, (uint64_t)v15, v18, v19);
    v21 = self->_objectModel;
    self->_objectModel = v20;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (BCCloudAssetReviewManager)assetReviewManager
{
  return self->_assetReviewManager;
}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "Dealloc BCCloudAssetManager", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BCCloudAssetManager;
  -[BCCloudAssetManager dealloc](&v4, sel_dealloc);
}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v5 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v28 = 138412546;
    v29 = v9;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager - Proxy build -  #enableCloudSync setEnableCloudSync %@ enableReadingNowSync %@", (uint8_t *)&v28, 0x16u);
  }

  objc_msgSend_serviceProxy(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCloudSync_enableReadingNowSync_(v14, v15, v5, v4, v16);

  objc_msgSend_setEnableCloudSync_(self->_assetAnnotationManager, v17, v5, v18, v19);
  objc_msgSend_changeTokenController(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCloudSync_(v24, v25, v5, v26, v27);

}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint8_t v26[16];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager dissociateCloudDataFromSyncWithCompletion - Proxy modee", v26, 2u);
  }

  objc_msgSend_serviceProxy(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend_assetAnnotationManager(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  objc_msgSend_changeTokenController(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, (uint64_t)v27, 3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bds_chainSuccessAndErrorCompletionSelectorCallsForSelector_completion_(v23, v24, (uint64_t)sel_dissociateCloudDataFromSyncWithCompletion_, (uint64_t)v4, v25);

}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (BCCloudDataSource)assetDataSource
{
  return self->_assetDataSource;
}

- (void)setAssetDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_assetDataSource, a3);
}

- (BCCloudAssetAnnotationManager)assetAnnotationManager
{
  return self->_assetAnnotationManager;
}

- (void)setAssetAnnotationManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetAnnotationManager, a3);
}

- (void)setAssetDetailManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetDetailManager, a3);
}

- (void)setReadingNowDetailManager:(id)a3
{
  objc_storeStrong((id *)&self->_readingNowDetailManager, a3);
}

- (void)setAssetReviewManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetReviewManager, a3);
}

- (BCCloudStoreAssetManager)storeAssetManager
{
  return self->_storeAssetManager;
}

- (void)setStoreAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_storeAssetManager, a3);
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
  objc_storeStrong((id *)&self->_changeTokenController, a3);
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, a3);
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (BOOL)proxyMode
{
  return self->_proxyMode;
}

- (void)setProxyMode:(BOOL)a3
{
  self->_proxyMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_storeAssetManager, 0);
  objc_storeStrong((id *)&self->_assetReviewManager, 0);
  objc_storeStrong((id *)&self->_readingNowDetailManager, 0);
  objc_storeStrong((id *)&self->_assetDetailManager, 0);
  objc_storeStrong((id *)&self->_assetAnnotationManager, 0);
  objc_storeStrong((id *)&self->_assetDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end
