@implementation AVCaptureDeviceControlRequest

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

+ (id)deviceControlRequestWithCompletionBlock:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCompletionBlock:", a3);
}

- (id)_initWithCompletionBlock:(id)a3
{
  AVCaptureDeviceControlRequest *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDeviceControlRequest;
  v4 = -[AVCaptureDeviceControlRequest init](&v8, sel_init);
  if (v4)
  {
    v4->_completionBlock = (id)objc_msgSend(a3, "copy");
    do
    {
      v5 = __ldxr((unsigned int *)&sDeviceControlRequestID);
      v6 = v5 + 1;
    }
    while (__stxr(v6, (unsigned int *)&sDeviceControlRequestID));
    v4->_requestID = v6;
  }
  return v4;
}

- (int)requestID
{
  return self->_requestID;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceControlRequest;
  -[AVCaptureDeviceControlRequest dealloc](&v3, sel_dealloc);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

@end
