@implementation BSUIBrandManager

- (BSUIBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4
{
  _BOOL8 v4;
  BSUIMapKitBrandDataSourceObjcShim *v7;
  void *v8;
  BSUIBrandManager *v9;
  objc_super v11;

  v4 = a4;
  if (a3 == 1)
  {
    v7 = objc_alloc_init(BSUIMapKitBrandDataSourceObjcShim);
    -[BSUIMapKitBrandDataSourceObjcShim opaqueWrapper](v7, "opaqueWrapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)BSUIBrandManager;
  v9 = -[BSBrandManager initWithBrandType:cachingEnabled:brandDataSourceOpaqueWrapper:](&v11, sel_initWithBrandType_cachingEnabled_brandDataSourceOpaqueWrapper_, a3, v4, v8);

  return v9;
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3
{
  return -[BSUIBrandManager initWithCachingEnabled:cacheURL:](self, "initWithCachingEnabled:cacheURL:", a3, 0);
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4
{
  _BOOL8 v4;
  id v6;
  BSUIMapKitBrandDataSourceObjcShim *v7;
  void *v8;
  BSUIBrandManager *v9;

  v4 = a3;
  v6 = a4;
  v7 = objc_alloc_init(BSUIMapKitBrandDataSourceObjcShim);
  -[BSUIMapKitBrandDataSourceObjcShim opaqueWrapper](v7, "opaqueWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BSUIBrandManager initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:](self, "initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:", v4, v6, v8);

  return v9;
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIBrandManager;
  return -[BSBrandManager initWithCachingEnabled:cacheURL:brandDataSourceOpaqueWrapper:](&v6, sel_initWithCachingEnabled_cacheURL_brandDataSourceOpaqueWrapper_, a3, a4, a5);
}

@end
