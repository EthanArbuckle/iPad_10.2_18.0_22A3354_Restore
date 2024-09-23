@implementation DDSAssetDownloadAnalytic

- (DDSAssetDownloadAnalytic)initWithAsset:(id)a3
{
  id v5;
  void *v6;
  DDSAssetDownloadAnalytic *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DDSAssetDownloadAnalytic;
  v7 = -[DDSTimedAnalytic initWithIdentifier:](&v9, sel_initWithIdentifier_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_asset, a3);

  return v7;
}

- (DDSAssetDownloadAnalytic)init
{

  return 0;
}

- (DDSAsset)asset
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
}

@end
