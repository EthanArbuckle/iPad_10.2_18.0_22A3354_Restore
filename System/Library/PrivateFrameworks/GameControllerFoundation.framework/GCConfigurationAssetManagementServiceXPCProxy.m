@implementation GCConfigurationAssetManagementServiceXPCProxy

- (GCConfigurationAssetManagementServiceXPCProxy)initWithService:(id)a3
{
  GCConfigurationAssetManagementService *v5;
  GCConfigurationAssetManagementServiceXPCProxy *v6;
  GCConfigurationAssetManagementService *service;
  void *v9;
  objc_super v10;

  v5 = (GCConfigurationAssetManagementService *)a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCConfigurationAssetManagementServiceXPCProxy.m"), 78, CFSTR("Invalid parameter not satisfying: %s"), "service != nil");

  }
  v10.receiver = self;
  v10.super_class = (Class)GCConfigurationAssetManagementServiceXPCProxy;
  v6 = -[GCConfigurationAssetManagementServiceXPCProxy init](&v10, sel_init);
  service = v6->_service;
  v6->_service = v5;

  return v6;
}

- (GCConfigurationAssetManagementServiceXPCProxy)init
{
  -[GCConfigurationAssetManagementServiceXPCProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)assetsWithReply:(id)a3
{
  GCConfigurationAssetManagementService *service;
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  service = self->_service;
  v4 = (void (**)(id, void *, id))a3;
  -[GCConfigurationAssetManagementService assets](service, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = 0;
  objc_msgSend(v5, "waitForResult:error:", &v11, &v10);
  v6 = v11;
  v7 = v10;
  v8 = v6;

  objc_msgSend(v8, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v9, v7);
}

GCConfigurationAssetXPCProxy *__65__GCConfigurationAssetManagementServiceXPCProxy_assetsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GCConfigurationAssetXPCProxy *v3;

  v2 = a2;
  v3 = -[GCConfigurationAssetXPCProxy initWithAsset:]([GCConfigurationAssetXPCProxy alloc], "initWithAsset:", v2);

  return v3;
}

- (void)currentAsset:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, GCConfigurationAssetXPCProxy *, id);
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  GCConfigurationAssetXPCProxy *v11;
  GCConfigurationAssetXPCProxy *v12;
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = (void (**)(id, GCConfigurationAssetXPCProxy *, id))a4;
  v7 = _os_activity_create(&dword_1DC79E000, "[Config Service/XPC/AssetManagementService] Current Asset", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  -[GCConfigurationAssetManagementService currentAsset:](self->_service, "currentAsset:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 0;
  objc_msgSend(v8, "waitForResult:error:", &v14, &v13);
  v9 = v14;
  v10 = v13;

  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F03A3910))
  {
    v11 = -[GCConfigurationAssetXPCProxy initWithAsset:]([GCConfigurationAssetXPCProxy alloc], "initWithAsset:", v9);
  }
  else
  {
    +[NSNull null](&off_1F03A9C88, "null");
    v11 = (GCConfigurationAssetXPCProxy *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v6[2](v6, v11, v10);

  os_activity_scope_leave(&state);
}

- (void)lastUpdateDateWithReply:(id)a3
{
  GCConfigurationAssetManagementService *service;
  void (**v4)(id, id, id);
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  service = self->_service;
  v4 = (void (**)(id, id, id))a3;
  -[GCConfigurationAssetManagementService lastUpdateDate](service, "lastUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v5, "waitForResult:error:", &v10, &v9);
  v6 = v10;
  v7 = v9;
  v8 = v6;

  v4[2](v4, v8, v7);
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  os_activity_scope_state_s v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = _os_activity_create(&dword_1DC79E000, "[Config Service/XPC/AssetManagementService] Check For New Assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v9, &v12);
  -[GCConfigurationAssetManagementService checkForNewAssets:forceCatalogRefresh:completion:](self->_service, "checkForNewAssets:forceCatalogRefresh:completion:", v6, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v12);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
