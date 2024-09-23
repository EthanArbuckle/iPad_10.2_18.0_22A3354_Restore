@implementation BSBrandManager

- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4
{
  if (self)
    return -[BSBrandManager initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:](self, "initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:", a4, 0, 0);
  return self;
}

- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  _BOOL8 v5;
  id v7;
  BSBrandManager *v8;
  _BOOL8 v9;
  id v10;
  BSBrandManager *v11;
  BSBrandManager *v12;

  v5 = a4;
  v7 = a5;
  if (v7)
  {
    v8 = self;
    v9 = v5;
    v10 = v7;
  }
  else
  {
    if (!self)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v8 = self;
    v9 = v5;
    v10 = 0;
  }
  v11 = -[BSBrandManager initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:](v8, "initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:", v9, 0, v10);
LABEL_6:
  v12 = v11;

  return v12;
}

- (BSBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  BSBrandManager *v10;
  IMBrandChatBotBrandDataSourceObjcShim *v11;
  BSBrandManagerObjcShim *v12;
  BSBrandManagerObjcShim *shim;
  objc_super v15;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BSBrandManager;
  v10 = -[BSBrandManager init](&v15, sel_init);
  if (v10)
  {
    if (!v9)
    {
      v11 = objc_alloc_init(IMBrandChatBotBrandDataSourceObjcShim);
      -[IMBrandChatBotBrandDataSourceObjcShim opaqueWrapper](v11, "opaqueWrapper");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = -[BSBrandManagerObjcShim initWithCachingEnabled:cacheURL:brandDataSourceWrapper:]([BSBrandManagerObjcShim alloc], "initWithCachingEnabled:cacheURL:brandDataSourceWrapper:", v6, v8, v9);
    shim = v10->_shim;
    v10->_shim = v12;

  }
  return v10;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  if (self)
    self = (BSBrandManager *)self->_shim;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__BSBrandManager_brandWithURI_completion___block_invoke;
  v8[3] = &unk_24E0A6BC0;
  v9 = v6;
  v7 = v6;
  -[BSBrandManager brandWithURI:completion:](self, "brandWithURI:completion:", a3, v8);

}

void __42__BSBrandManager_brandWithURI_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[BSBrand _initWithShim:]([BSBrand alloc], "_initWithShim:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)clearUnusedCachedLogos:(id)a3
{
  if (self)
    self = (BSBrandManager *)self->_shim;
  -[BSBrandManager clearUnusedCachedLogos:](self, "clearUnusedCachedLogos:", a3);
}

- (void)fetchAssetWithURL:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  if (self)
    self = (BSBrandManager *)self->_shim;
  -[BSBrandManager fetchAssetWithURL:assetType:completion:](self, "fetchAssetWithURL:assetType:completion:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
}

@end
