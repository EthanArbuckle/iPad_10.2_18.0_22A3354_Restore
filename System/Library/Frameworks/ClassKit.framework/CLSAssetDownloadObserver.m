@implementation CLSAssetDownloadObserver

- (CLSAssetDownloadObserver)initWithAsset:(id)a3
{
  id v5;
  CLSAssetDownloadObserver *v6;
  CLSAssetDownloadObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSAssetDownloadObserver;
  v6 = -[CLSAssetDownloadObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_asset, a3);

  return v7;
}

- (BOOL)isDownloaded
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isDownloaded;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isDownloaded = objc_msgSend_isDownloaded(v3, v4, v5);

  return isDownloaded;
}

- (double)downloadProgress
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fractionDownloaded(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (NSError)downloadError
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadError(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v6;
}

- (void)startObserving
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_asset(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addDownloadObserver_(v5, v4, (uint64_t)self);

}

- (void)stopObserving
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_asset(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeDownloadObserver_(v5, v4, (uint64_t)self);

}

- (CLSAbstractAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (id)onDownloadProgress
{
  return self->_onDownloadProgress;
}

- (void)setOnDownloadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onDownloadComplete
{
  return self->_onDownloadComplete;
}

- (void)setOnDownloadComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDownloadComplete, 0);
  objc_storeStrong(&self->_onDownloadProgress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->downloadError, 0);
}

@end
