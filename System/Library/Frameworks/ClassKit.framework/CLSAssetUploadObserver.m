@implementation CLSAssetUploadObserver

- (CLSAssetUploadObserver)initWithAsset:(id)a3
{
  id v5;
  CLSAssetUploadObserver *v6;
  CLSAssetUploadObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSAssetUploadObserver;
  v6 = -[CLSAssetUploadObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_asset, a3);

  return v7;
}

- (BOOL)isUploaded
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isUploaded;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUploaded = objc_msgSend_isUploaded(v3, v4, v5);

  return isUploaded;
}

- (double)uploadProgress
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fractionUploaded(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (NSError)uploadError
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadError(v3, v4, v5);
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
  objc_msgSend_addUploadObserver_(v5, v4, (uint64_t)self);

}

- (void)stopObserving
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_asset(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeUploadObserver_(v5, v4, (uint64_t)self);

}

- (CLSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (id)onUploadProgress
{
  return self->_onUploadProgress;
}

- (void)setOnUploadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onUploadComplete
{
  return self->_onUploadComplete;
}

- (void)setOnUploadComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onUploadComplete, 0);
  objc_storeStrong(&self->_onUploadProgress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->uploadError, 0);
}

@end
