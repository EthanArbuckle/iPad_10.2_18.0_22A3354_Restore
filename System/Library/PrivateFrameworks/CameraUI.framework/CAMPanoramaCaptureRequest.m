@implementation CAMPanoramaCaptureRequest

- (CAMPanoramaCaptureRequest)init
{
  CAMPanoramaCaptureRequest *v2;
  CAMPanoramaCaptureRequest *v3;
  CAMPanoramaCaptureRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaCaptureRequest;
  v2 = -[CAMCaptureRequest initWithType:](&v6, sel_initWithType_, 2);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (CAMPanoramaCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CAMPanoramaCaptureRequest *v9;
  void *v10;
  CAMPanoramaCaptureRequest *v11;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMPanoramaCaptureRequest;
  v9 = -[CAMCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:](&v13, sel_initWithRequest_distinctPersistence_includeAnalytics_, v8, v6, v5);
  if (v9)
  {
    objc_msgSend(v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_delegate, v10);

    v11 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CAMPanoramaCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:]([CAMMutablePanoramaCaptureRequest alloc], "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (CAMPanoramaCaptureRequestDelegate)delegate
{
  return (CAMPanoramaCaptureRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
