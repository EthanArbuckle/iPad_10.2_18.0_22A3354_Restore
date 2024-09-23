@implementation BCCloudCollectionsManager

- (BCCloudCollectionMemberManager)collectionMemberManager
{
  return self->_collectionMemberManager;
}

- (BCCloudCollectionDetailManager)collectionDetailManager
{
  return self->_collectionDetailManager;
}

- (id)initClientXPCProxy
{
  BCCloudCollectionsManager *v2;
  BDSServiceProxy *v3;
  BDSServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCCloudCollectionsManager;
  v2 = -[BCCloudCollectionsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

    objc_storeStrong((id *)&v2->_collectionDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_collectionMemberManager, v2->_serviceProxy);
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
  if (qword_253F3C620 != -1)
    dispatch_once(&qword_253F3C620, &unk_24F08B290);
  return (id)qword_253F3C648;
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
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("BCCloudCollections"), (uint64_t)CFSTR("momd"), v11);
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

- (void)setEnableCloudSync:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager #enableCloudSync setEnableCloudSync %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_serviceProxy(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCollectionSync_(v11, v12, v3, v13, v14);

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
  uint8_t v14[16];

  v4 = a3;
  BDSCloudKitSyncLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager dissociateCloudDataFromSyncWithCompletion", v14, 2u);
  }

  objc_msgSend_serviceProxy(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v10, v11, (uint64_t)v4, v12, v13);

}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (BCCloudDataSource)collectionDataSource
{
  return self->_collectionDataSource;
}

- (void)setCollectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionDataSource, a3);
}

- (void)setCollectionDetailManager:(id)a3
{
  objc_storeStrong((id *)&self->_collectionDetailManager, a3);
}

- (void)setCollectionMemberManager:(id)a3
{
  objc_storeStrong((id *)&self->_collectionMemberManager, a3);
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

- (BOOL)proxyMode
{
  return self->_proxyMode;
}

- (void)setProxyMode:(BOOL)a3
{
  self->_proxyMode = a3;
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_collectionMemberManager, 0);
  objc_storeStrong((id *)&self->_collectionDetailManager, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end
