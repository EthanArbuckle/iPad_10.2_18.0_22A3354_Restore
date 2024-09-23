@implementation PHContentEditingInputRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PHContentEditingInputRequestOptions canHandleAdjustmentData](self, "canHandleAdjustmentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanHandleAdjustmentData:", v5);

  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHContentEditingInputRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  -[PHContentEditingInputRequestOptions progressHandler](self, "progressHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressHandler:", v6);

  -[PHContentEditingInputRequestOptions targetSize](self, "targetSize");
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setContentMode:", -[PHContentEditingInputRequestOptions contentMode](self, "contentMode"));
  objc_msgSend(v4, "setDontAllowRAW:", -[PHContentEditingInputRequestOptions dontAllowRAW](self, "dontAllowRAW"));
  -[PHContentEditingInputRequestOptions canHandleRAW](self, "canHandleRAW");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanHandleRAW:", v7);

  objc_msgSend(v4, "setOriginalChoice:", -[PHContentEditingInputRequestOptions originalChoice](self, "originalChoice"));
  objc_msgSend(v4, "setForceRunAsUnadjustedAsset:", -[PHContentEditingInputRequestOptions forceRunAsUnadjustedAsset](self, "forceRunAsUnadjustedAsset"));
  objc_msgSend(v4, "setForceReturnFullLivePhoto:", -[PHContentEditingInputRequestOptions forceReturnFullLivePhoto](self, "forceReturnFullLivePhoto"));
  objc_msgSend(v4, "setForcePrepareCurrentBaseVersionInAddition:", -[PHContentEditingInputRequestOptions forcePrepareCurrentBaseVersionInAddition](self, "forcePrepareCurrentBaseVersionInAddition"));
  -[PHContentEditingInputRequestOptions resultHandlerQueue](self, "resultHandlerQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultHandlerQueue:", v8);

  objc_msgSend(v4, "setShouldForceOriginalChoice:", -[PHContentEditingInputRequestOptions shouldForceOriginalChoice](self, "shouldForceOriginalChoice"));
  objc_msgSend(v4, "setDisallowFallbackAdjustmentBase:", -[PHContentEditingInputRequestOptions disallowFallbackAdjustmentBase](self, "disallowFallbackAdjustmentBase"));
  objc_msgSend(v4, "setSkipDisplaySizeImage:", -[PHContentEditingInputRequestOptions skipDisplaySizeImage](self, "skipDisplaySizeImage"));
  objc_msgSend(v4, "setSkipLivePhotoImageAndAVAsset:", -[PHContentEditingInputRequestOptions skipLivePhotoImageAndAVAsset](self, "skipLivePhotoImageAndAVAsset"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHContentEditingInputRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setRequireOriginalsDownloaded:", -[PHContentEditingInputRequestOptions requireOriginalsDownloaded](self, "requireOriginalsDownloaded"));
  return v4;
}

- (void)setOriginalChoice:(unint64_t)a3
{
  self->_forceRunAsUnadjustedAsset = 1;
  self->_shouldForceOriginalChoice = 1;
  self->_originalChoice = a3;
}

- (void)canHandleAdjustmentData
{
  return self->_canHandleAdjustmentData;
}

- (void)setCanHandleAdjustmentData:(void *)canHandleAdjustmentData
{
  objc_setProperty_nonatomic_copy(self, a2, canHandleAdjustmentData, 24);
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (void)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(void *)progressHandler
{
  objc_setProperty_nonatomic_copy(self, a2, progressHandler, 32);
}

- (BOOL)shouldForceOriginalChoice
{
  return self->_shouldForceOriginalChoice;
}

- (void)setShouldForceOriginalChoice:(BOOL)a3
{
  self->_shouldForceOriginalChoice = a3;
}

- (BOOL)disallowFallbackAdjustmentBase
{
  return self->_disallowFallbackAdjustmentBase;
}

- (void)setDisallowFallbackAdjustmentBase:(BOOL)a3
{
  self->_disallowFallbackAdjustmentBase = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (id)canHandleRAW
{
  return self->_canHandleRAW;
}

- (void)setCanHandleRAW:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)originalChoice
{
  return self->_originalChoice;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (BOOL)forceReturnFullLivePhoto
{
  return self->_forceReturnFullLivePhoto;
}

- (void)setForceReturnFullLivePhoto:(BOOL)a3
{
  self->_forceReturnFullLivePhoto = a3;
}

- (BOOL)forcePrepareCurrentBaseVersionInAddition
{
  return self->_forcePrepareCurrentBaseVersionInAddition;
}

- (void)setForcePrepareCurrentBaseVersionInAddition:(BOOL)a3
{
  self->_forcePrepareCurrentBaseVersionInAddition = a3;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (BOOL)loadResourcesToFlip
{
  return self->_loadResourcesToFlip;
}

- (void)setLoadResourcesToFlip:(BOOL)a3
{
  self->_loadResourcesToFlip = a3;
}

- (BOOL)skipDisplaySizeImage
{
  return self->_skipDisplaySizeImage;
}

- (void)setSkipDisplaySizeImage:(BOOL)a3
{
  self->_skipDisplaySizeImage = a3;
}

- (BOOL)skipLivePhotoImageAndAVAsset
{
  return self->_skipLivePhotoImageAndAVAsset;
}

- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3
{
  self->_skipLivePhotoImageAndAVAsset = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (BOOL)requireOriginalsDownloaded
{
  return self->_requireOriginalsDownloaded;
}

- (void)setRequireOriginalsDownloaded:(BOOL)a3
{
  self->_requireOriginalsDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_canHandleRAW, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_canHandleAdjustmentData, 0);
}

- (BOOL)isSynchronous
{
  return 0;
}

@end
