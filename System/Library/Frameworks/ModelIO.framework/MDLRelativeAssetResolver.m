@implementation MDLRelativeAssetResolver

- (MDLRelativeAssetResolver)initWithAsset:(MDLAsset *)asset
{
  MDLAsset *v4;
  MDLRelativeAssetResolver *v5;
  MDLRelativeAssetResolver *v6;
  MDLRelativeAssetResolver *v7;
  objc_super v9;

  v4 = asset;
  v9.receiver = self;
  v9.super_class = (Class)MDLRelativeAssetResolver;
  v5 = -[MDLRelativeAssetResolver init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_asset, v4);
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_asset);
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  id v4;
  const char *v5;
  id WeakRetained;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
    if (WeakRetained)
    {
      objc_msgSend_resolveAssetNamed_(self, v5, (uint64_t)v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id WeakRetained;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (objc_msgSend_isAbsolutePath(v4, v5, v6))
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v8, (uint64_t)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
      objc_msgSend_URL(WeakRetained, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByDeletingLastPathComponent(v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_URLByAppendingPathComponent_(v16, v17, (uint64_t)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MDLAsset)asset
{
  return (MDLAsset *)objc_loadWeakRetained((id *)&self->_asset);
}

- (void)setAsset:(MDLAsset *)asset
{
  objc_storeWeak((id *)&self->_asset, asset);
}

@end
