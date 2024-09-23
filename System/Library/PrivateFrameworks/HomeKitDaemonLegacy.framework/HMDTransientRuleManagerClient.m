@implementation HMDTransientRuleManagerClient

- (HMDTransientRuleManagerClient)initWithDescription:(id)a3
{
  id v5;
  HMDTransientRuleManagerClient *v6;
  HMDTransientRuleManagerClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTransientRuleManagerClient;
  v6 = -[HMDTransientRuleManagerClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_description, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (self->_description)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p - %@>"), v5, self, self->_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDTransientRuleManagerClient;
    -[HMDTransientRuleManagerClient description](&v8, sel_description);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
