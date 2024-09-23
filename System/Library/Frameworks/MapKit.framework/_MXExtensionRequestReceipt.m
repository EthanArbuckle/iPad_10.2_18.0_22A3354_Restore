@implementation _MXExtensionRequestReceipt

- (_MXExtensionRequestReceipt)initWithCompletion:(id)a3
{
  id v4;
  _MXExtensionRequestReceipt *v5;
  uint64_t v6;
  id completion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXExtensionRequestReceipt;
  v5 = -[_MXExtensionRequestReceipt init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  NSTimer *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
    -[NSTimer invalidate](timer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionRequestReceipt;
  -[_MXExtensionRequestReceipt dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  id completion;
  id v4;
  void (**v5)(_QWORD);

  completion = self->_completion;
  if (completion)
  {
    v5 = (void (**)(_QWORD))MEMORY[0x18D778DB8](completion, a2);
    v4 = self->_completion;
    self->_completion = 0;

    if (v5)
    {
      v5[2](v5);

    }
  }
}

- (void)cancelWithTimeInterval:(double)a3
{
  NSTimer *timer;
  NSTimer *v6;
  NSTimer *v7;

  timer = self->_timer;
  if (timer)
    -[NSTimer invalidate](timer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_cancel, 0, 0, a3);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_timer;
  self->_timer = v6;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
