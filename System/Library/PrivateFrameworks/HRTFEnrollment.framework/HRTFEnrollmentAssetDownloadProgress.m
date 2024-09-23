@implementation HRTFEnrollmentAssetDownloadProgress

- (HRTFEnrollmentAssetDownloadProgress)initWithTotalBytes:(int64_t)a3 downloadedBytes:(int64_t)a4 isStalled:(BOOL)a5 estimatedRemainingTime:(double)a6
{
  HRTFEnrollmentAssetDownloadProgress *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HRTFEnrollmentAssetDownloadProgress;
  result = -[HRTFEnrollmentAssetDownloadProgress init](&v11, sel_init);
  if (result)
  {
    result->_totalBytes = a3;
    result->_downloadedBytes = a4;
    result->_isStalled = a5;
    result->_estimatedRemainingTime = a6;
  }
  return result;
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (int64_t)downloadedBytes
{
  return self->_downloadedBytes;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (double)estimatedRemainingTime
{
  return self->_estimatedRemainingTime;
}

@end
