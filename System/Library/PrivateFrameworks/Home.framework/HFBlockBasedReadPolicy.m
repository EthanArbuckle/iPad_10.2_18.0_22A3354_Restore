@implementation HFBlockBasedReadPolicy

- (HFBlockBasedReadPolicy)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithReadPolicyBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicReadPolicy.m"), 385, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFBlockBasedReadPolicy init]",
    v5);

  return 0;
}

- (HFBlockBasedReadPolicy)initWithReadPolicyBlock:(id)a3
{
  id v4;
  HFBlockBasedReadPolicy *v5;
  uint64_t v6;
  id readPolicyBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFBlockBasedReadPolicy;
  v5 = -[HFBlockBasedReadPolicy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    readPolicyBlock = v5->_readPolicyBlock;
    v5->_readPolicyBlock = (id)v6;

  }
  return v5;
}

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  unint64_t v8;

  v6 = a3;
  -[HFBlockBasedReadPolicy readPolicyBlock](self, "readPolicyBlock");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, id *))v7)[2](v7, v6, a4);

  return v8;
}

- (id)readPolicyBlock
{
  return self->_readPolicyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readPolicyBlock, 0);
}

@end
