@implementation PHLivePhotoRequestOptions

- (BOOL)isCurrentVersion
{
  return -[PHLivePhotoRequestOptions version](self, "version") == PHImageRequestOptionsVersionCurrent;
}

- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently
{
  return 0;
}

- (id)renderResultHandlerQueue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

- (PHLivePhotoRequestOptions)init
{
  PHLivePhotoRequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHLivePhotoRequestOptions;
  result = -[PHLivePhotoRequestOptions init](&v3, sel_init);
  if (result)
    result->_includeImage = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeliveryMode:", -[PHLivePhotoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHLivePhotoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  -[PHLivePhotoRequestOptions progressHandler](self, "progressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressHandler:", v5);

  objc_msgSend(v4, "setDownloadIntent:", -[PHLivePhotoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHLivePhotoRequestOptions downloadPriority](self, "downloadPriority"));
  objc_msgSend(v4, "setIncludeImage:", -[PHLivePhotoRequestOptions includeImage](self, "includeImage"));
  objc_msgSend(v4, "setPreferHDR:", -[PHLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  return v4;
}

- (PHImageRequestOptionsVersion)version
{
  return self->_version;
}

- (void)setVersion:(PHImageRequestOptionsVersion)version
{
  self->_version = version;
}

- (PHImageRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (PHAssetImageProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler
{
  objc_setProperty_nonatomic_copy(self, a2, progressHandler, 32);
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (BOOL)includeImage
{
  return self->_includeImage;
}

- (void)setIncludeImage:(BOOL)a3
{
  self->_includeImage = a3;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

- (BOOL)isSynchronous
{
  return 0;
}

- (id)resultHandlerQueue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

@end
