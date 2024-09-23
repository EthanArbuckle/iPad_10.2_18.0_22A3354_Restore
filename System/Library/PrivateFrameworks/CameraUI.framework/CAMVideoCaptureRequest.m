@implementation CAMVideoCaptureRequest

- (CAMVideoCaptureRequest)init
{
  CAMVideoCaptureRequest *v2;
  CAMVideoCaptureRequest *v3;
  CAMVideoCaptureRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoCaptureRequest;
  v2 = -[CAMCaptureRequest initWithType:](&v6, sel_initWithType_, 1);
  v3 = v2;
  if (v2)
  {
    *(&v2->_shouldGenerateVideoPreviewImage + 3) = 1;
    v2->_remainingDiskUsageThreshold = 0;
    v2->_userInitationTimestamp = 0.0;
    v4 = v2;
  }

  return v3;
}

- (CAMVideoCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CAMVideoCaptureRequest *v9;
  void *v10;
  double v11;
  double v12;
  CAMVideoCaptureRequest *v13;
  objc_super v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMVideoCaptureRequest;
  v9 = -[CAMCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:](&v15, sel_initWithRequest_distinctPersistence_includeAnalytics_, v8, v6, v5);
  if (v9)
  {
    objc_msgSend(v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_delegate, v10);

    v9->_captureVideoConfiguration = objc_msgSend(v8, "captureVideoConfiguration");
    v9->_torchMode = objc_msgSend(v8, "torchMode");
    v9->_wantsWhiteBalanceLocked = objc_msgSend(v8, "wantsWhiteBalanceLocked");
    objc_msgSend(v8, "maximumRecordedDuration");
    v9->_maximumRecordedDuration = v11;
    v9->_maximumRecordedFileSize = objc_msgSend(v8, "maximumRecordedFileSize");
    v9->_remainingDiskUsageThreshold = objc_msgSend(v8, "remainingDiskUsageThreshold");
    *(&v9->_shouldGenerateVideoPreviewImage + 3) = objc_msgSend(v8, "shouldGenerateVideoPreviewImage");
    *(&v9->_shouldGenerateVideoPreviewImage + 2) = objc_msgSend(v8, "isTimelapse");
    objc_msgSend(v8, "userInitationTimestamp");
    v9->_userInitationTimestamp = v12;
    v9->_trueVideoEnabled = objc_msgSend(v8, "trueVideoEnabled");
    v13 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CAMVideoCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:]([CAMMutableVideoCaptureRequest alloc], "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[CAMCaptureRequest sessionIdentifier](self, "sessionIdentifier");
  -[CAMCaptureRequest localDestinationURL](self, "localDestinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: sessionIdentifier:%d, localDestinationURL:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CAMVideoCaptureRequestDelegate)delegate
{
  return (CAMVideoCaptureRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)captureVideoConfiguration
{
  return self->_captureVideoConfiguration;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (BOOL)wantsWhiteBalanceLocked
{
  return self->_wantsWhiteBalanceLocked;
}

- (BOOL)trueVideoEnabled
{
  return self->_trueVideoEnabled;
}

- (double)userInitationTimestamp
{
  return self->_userInitationTimestamp;
}

- (BOOL)isTimelapse
{
  return *(&self->_shouldGenerateVideoPreviewImage + 2);
}

- (BOOL)shouldGenerateVideoPreviewImage
{
  return *(&self->_shouldGenerateVideoPreviewImage + 3);
}

- (double)maximumRecordedDuration
{
  return self->_maximumRecordedDuration;
}

- (int64_t)maximumRecordedFileSize
{
  return self->_maximumRecordedFileSize;
}

- (int64_t)remainingDiskUsageThreshold
{
  return self->_remainingDiskUsageThreshold;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
