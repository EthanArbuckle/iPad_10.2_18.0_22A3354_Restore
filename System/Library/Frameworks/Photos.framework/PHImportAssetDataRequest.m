@implementation PHImportAssetDataRequest

- (PHImportAssetDataRequest)initWithAsset:(id)a3
{
  id v5;
  PHImportAssetDataRequest *v6;
  PHImportAssetDataRequest *v7;
  uint64_t v8;
  PHImportCanceler *canceler;

  v5 = a3;
  v6 = -[PHImportAssetDataRequest init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v8 = objc_opt_new();
    canceler = v7->_canceler;
    v7->_canceler = (PHImportCanceler *)v8;

  }
  return v7;
}

- (PHImportAsset)requestAsset
{
  void *v3;
  void *v4;
  PHImportAsset *v5;
  PHImportAsset *v6;
  PHImportAsset *asset;

  -[PHImportAsset largeRender](self->_asset, "largeRender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PHImportAsset largeMovieRender](self->_asset, "largeMovieRender");
    v6 = (PHImportAsset *)objc_claimAutoreleasedReturnValue();
    asset = v6;
    if (!v6)
      asset = self->_asset;
    v5 = asset;

  }
  return v5;
}

- (void)cancel
{
  PHImportCanceler *canceler;
  void *v4;
  void (**v5)(void);

  canceler = self->_canceler;
  if (canceler)
    canceler->_isCanceled = 1;
  -[PHImportAssetDataRequest cancelBlock](self, "cancelBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PHImportAssetDataRequest cancelBlock](self, "cancelBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (BOOL)isCanceled
{
  PHImportCanceler *canceler;

  canceler = self->_canceler;
  return canceler && canceler->_isCanceled;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PHImportAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_canceler, 0);
}

@end
