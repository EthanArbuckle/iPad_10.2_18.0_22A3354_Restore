@implementation PHAssetResourceRequestOptions

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
  if (a3 == 6)
    self->_pruneAfterAvailableOnLowDisk = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetResourceRequestOptions *v4;

  v4 = objc_alloc_init(PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v4, "setNetworkAccessAllowed:", self->_networkAccessAllowed);
  -[PHAssetResourceRequestOptions setProgressHandler:](v4, "setProgressHandler:", self->_progressHandler);
  -[PHAssetResourceRequestOptions setResistentToPrune:](v4, "setResistentToPrune:", self->_resistentToPrune);
  -[PHAssetResourceRequestOptions setDownloadIsTransient:](v4, "setDownloadIsTransient:", self->_downloadIsTransient);
  -[PHAssetResourceRequestOptions setPruneAfterAvailableOnLowDisk:](v4, "setPruneAfterAvailableOnLowDisk:", self->_pruneAfterAvailableOnLowDisk);
  -[PHAssetResourceRequestOptions setPruneAfterAvailableLowDiskThresholdBytes:](v4, "setPruneAfterAvailableLowDiskThresholdBytes:", self->_pruneAfterAvailableLowDiskThresholdBytes);
  -[PHAssetResourceRequestOptions setDownloadIntent:](v4, "setDownloadIntent:", self->_downloadIntent);
  -[PHAssetResourceRequestOptions setDownloadPriority:](v4, "setDownloadPriority:", self->_downloadPriority);
  return v4;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (PHAssetResourceProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(PHAssetResourceProgressHandler)progressHandler
{
  objc_setProperty_nonatomic_copy(self, a2, progressHandler, 16);
}

- (BOOL)resistentToPrune
{
  return self->_resistentToPrune;
}

- (void)setResistentToPrune:(BOOL)a3
{
  self->_resistentToPrune = a3;
}

- (BOOL)downloadIsTransient
{
  return self->_downloadIsTransient;
}

- (void)setDownloadIsTransient:(BOOL)a3
{
  self->_downloadIsTransient = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (BOOL)pruneAfterAvailableOnLowDisk
{
  return self->_pruneAfterAvailableOnLowDisk;
}

- (void)setPruneAfterAvailableOnLowDisk:(BOOL)a3
{
  self->_pruneAfterAvailableOnLowDisk = a3;
}

- (NSNumber)pruneAfterAvailableLowDiskThresholdBytes
{
  return self->_pruneAfterAvailableLowDiskThresholdBytes;
}

- (void)setPruneAfterAvailableLowDiskThresholdBytes:(id)a3
{
  self->_pruneAfterAvailableLowDiskThresholdBytes = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
