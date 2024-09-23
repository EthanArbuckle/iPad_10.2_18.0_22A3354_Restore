@implementation CAMCaptureCallbackReceipt

- (CAMCaptureCallbackReceipt)initWithCallback:(int64_t)a3 duration:(double)a4
{
  CAMCaptureCallbackReceipt *v6;
  CAMCaptureCallbackReceipt *v7;
  CAMCaptureCallbackReceipt *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMCaptureCallbackReceipt;
  v6 = -[CAMCaptureCallbackReceipt init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_callback = a3;
    v6->_secondsSinceBegin = a4;
    v8 = v6;
  }

  return v7;
}

- (int64_t)callback
{
  return self->_callback;
}

- (double)secondsSinceBegin
{
  return self->_secondsSinceBegin;
}

@end
