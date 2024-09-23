@implementation HFStandardReadPolicy

- (HFStandardReadPolicy)init
{
  void *v3;
  void *v4;
  void *v5;
  HFStandardReadPolicy *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v9[0] = v3;
  v4 = (void *)objc_opt_new();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HFStandardReadPolicy;
  v6 = -[HFAggregatedCharacteristicReadPolicy initWithPolicies:](&v8, sel_initWithPolicies_, v5);

  return v6;
}

- (HFStandardReadPolicy)initWithPolicies:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_init);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicReadPolicy.m"), 179, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFStandardReadPolicy initWithPolicies:]",
    v6);

  return 0;
}

@end
