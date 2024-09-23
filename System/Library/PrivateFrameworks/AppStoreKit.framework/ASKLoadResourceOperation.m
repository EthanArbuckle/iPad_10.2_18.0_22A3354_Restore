@implementation ASKLoadResourceOperation

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[ASKLoadResourceOperation outputBlock](self, "outputBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ASKLoadResourceOperation setOutputBlock:](self, "setOutputBlock:", 0);
    ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v6);
  }

}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 248, 1);
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)setOutputBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
}

- (ASKLoadResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASKLoadResourceOperation;
  return -[ASKLoadResourceOperation init](&v5, sel_init, a3, a4);
}

+ (id)supportedScheme
{
  return 0;
}

- (void)main
{
  -[ASKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, 0);
}

@end
