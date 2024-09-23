@implementation HFLegacyBlockBasedReadPolicy

- (HFLegacyBlockBasedReadPolicy)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithReadValidator_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicReadPolicy.m"), 410, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFLegacyBlockBasedReadPolicy init]",
    v5);

  return 0;
}

- (HFLegacyBlockBasedReadPolicy)initWithReadValidator:(id)a3
{
  id v4;
  HFLegacyBlockBasedReadPolicy *v5;
  uint64_t v6;
  id readValidator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLegacyBlockBasedReadPolicy;
  v5 = -[HFLegacyBlockBasedReadPolicy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    readValidator = v5->_readValidator;
    v5->_readValidator = (id)v6;

  }
  return v5;
}

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  unsigned int v8;

  v6 = a3;
  -[HFLegacyBlockBasedReadPolicy readValidator](self, "readValidator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, _QWORD))v7)[2](v7, v6, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ExplicitlyDisallowed"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)readValidator
{
  return self->_readValidator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readValidator, 0);
}

@end
