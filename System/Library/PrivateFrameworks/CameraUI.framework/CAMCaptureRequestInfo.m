@implementation CAMCaptureRequestInfo

- (CAMCaptureRequestInfo)initWithRequest:(id)a3
{
  id v5;
  CAMCaptureRequestInfo *v6;
  CAMCaptureRequestInfo *v7;
  NSMutableArray *v8;
  NSMutableArray *receivedCallbacks;
  uint64_t v10;
  CAMCaptureRequestInfo *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMCaptureRequestInfo;
  v6 = -[CAMCaptureRequestInfo init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    receivedCallbacks = v7->__receivedCallbacks;
    v7->__receivedCallbacks = v8;

    v10 = objc_msgSend(v5, "userInitiationTime");
    v7->__userInitiationTime = v10;
    if (!v10)
      v7->__userInitiationTime = mach_absolute_time();
    v11 = v7;
  }

  return v7;
}

- (void)didReceiveCallback:(int64_t)a3 atAbsoluteTime:(unint64_t)a4
{
  unint64_t v6;
  CAMCaptureCallbackReceipt *v7;
  void *v8;
  mach_timebase_info info;

  v6 = a4 - -[CAMCaptureRequestInfo _userInitiationTime](self, "_userInitiationTime");
  info = 0;
  mach_timebase_info(&info);
  v7 = -[CAMCaptureCallbackReceipt initWithCallback:duration:]([CAMCaptureCallbackReceipt alloc], "initWithCallback:duration:", a3, (double)(v6 * info.numer / info.denom) / 1000000000.0);
  -[CAMCaptureRequestInfo _receivedCallbacks](self, "_receivedCallbacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

- (CAMStillImageCaptureRequest)request
{
  return self->_request;
}

- (NSMutableArray)_receivedCallbacks
{
  return self->__receivedCallbacks;
}

- (unint64_t)_userInitiationTime
{
  return self->__userInitiationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__receivedCallbacks, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
