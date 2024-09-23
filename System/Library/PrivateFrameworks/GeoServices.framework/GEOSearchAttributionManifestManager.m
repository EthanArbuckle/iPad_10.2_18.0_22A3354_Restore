@implementation GEOSearchAttributionManifestManager

+ (void)useProxy:(Class)a3
{
  _proxyClass_1 = (uint64_t)a3;
}

+ (void)useLocalProxy
{
  objc_msgSend(a1, "useProxy:", objc_opt_class());
}

+ (void)useRemoteProxy
{
  objc_msgSend(a1, "useProxy:", objc_opt_class());
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  if (a3)
    objc_msgSend(a1, "useLocalProxy");
  else
    objc_msgSend(a1, "useRemoteProxy");
}

+ (id)sharedManager
{
  if (qword_1ECDBC640 != -1)
    dispatch_once(&qword_1ECDBC640, &__block_literal_global_153);
  return (id)_MergedGlobals_290;
}

void __52__GEOSearchAttributionManifestManager_sharedManager__block_invoke()
{
  GEOSearchAttributionManifestManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOSearchAttributionManifestManager);
  v1 = (void *)_MergedGlobals_290;
  _MergedGlobals_290 = (uint64_t)v0;

}

- (GEOSearchAttributionManifestManager)init
{
  GEOSearchAttributionManifestManager *v2;
  objc_class *v3;
  GEOSearchAttributionServerProxy *v4;
  GEOSearchAttributionServerProxy *serverProxy;
  GEOSearchAttributionManifestManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionManifestManager;
  v2 = -[GEOSearchAttributionManifestManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)_proxyClass_1;
    if (!_proxyClass_1)
    {
      objc_msgSend((id)objc_opt_class(), "useRemoteProxy");
      v3 = (objc_class *)_proxyClass_1;
    }
    v4 = (GEOSearchAttributionServerProxy *)objc_alloc_init(v3);
    serverProxy = v2->_serverProxy;
    v2->_serverProxy = v4;

    v6 = v2;
  }

  return v2;
}

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  GEOSearchAttributionServerProxy *serverProxy;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__GEOSearchAttributionManifestManager_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
  v9[3] = &unk_1E1C0CF10;
  v10 = v6;
  v8 = v6;
  -[GEOSearchAttributionServerProxy loadAttributionInfoForIdentifiers:completionHandler:](serverProxy, "loadAttributionInfoForIdentifiers:completionHandler:", a3, v9);

}

uint64_t __91__GEOSearchAttributionManifestManager_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (GEOSearchAttributionServerProxy)serverProxy
{
  return self->_serverProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end
