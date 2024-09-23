@implementation HFStaticReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  unint64_t v11;

  v6 = a3;
  if (a4)
  {
    v7 = -[HFStaticReadPolicy decision](self, "decision");
    switch(v7)
    {
      case 2uLL:
        v8 = (void *)MEMORY[0x1E0C99E60];
        v9 = CFSTR("ExplicitlyRequired");
        goto LABEL_7;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 0uLL:
        v8 = (void *)MEMORY[0x1E0C99E60];
        v9 = CFSTR("ExplicitlyDisallowed");
LABEL_7:
        objc_msgSend(v8, "setWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        *a4 = v10;
        break;
    }
  }
  v11 = -[HFStaticReadPolicy decision](self, "decision");

  return v11;
}

- (unint64_t)decision
{
  return self->_decision;
}

+ (id)policyWithDecision:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDecision:", a3);
}

- (HFStaticReadPolicy)initWithDecision:(unint64_t)a3
{
  HFStaticReadPolicy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFStaticReadPolicy;
  result = -[HFStaticReadPolicy init](&v5, sel_init);
  if (result)
    result->_decision = a3;
  return result;
}

- (HFStaticReadPolicy)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDecision_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicReadPolicy.m"), 341, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFStaticReadPolicy init]",
    v5);

  return 0;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFStaticReadPolicy decision](self, "decision");
  v5 = v4;
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *HFStringFromReadPolicyDecision(HFCharacteristicReadPolicyDecision)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HFCharacteristicReadPolicy.m"), 53, CFSTR("Unknown decision value: %d"), v5);

    v6 = 0;
  }
  else
  {
    v6 = off_1EA733C20[v4];
  }
  v9 = v6;
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("decision"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

@end
