@implementation HMDTriggerDeleteAfterExecutionPolicy

- (HMDTriggerDeleteAfterExecutionPolicy)init
{
  id v3;
  void *v4;
  HMDTriggerDeleteAfterExecutionPolicy *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  v4 = (void *)objc_msgSend(v3, "initWithUUIDString:", *MEMORY[0x24BDD6FB8]);
  v7.receiver = self;
  v7.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  v5 = -[HMDTriggerDeletePolicy initWithIdentifier:](&v7, sel_initWithIdentifier_, v4);

  return v5;
}

- (void)applyPolicy:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  -[HMDTriggerDeletePolicy applyPolicy:](&v3, sel_applyPolicy_, a3);
}

- (id)description
{
  return CFSTR("Delete After Execution");
}

- (HMDTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  return -[HMDTriggerDeletePolicy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  -[HMDTriggerDeletePolicy encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeleteAfterExecutionPolicy;
  return -[HMDTriggerDeletePolicy isEqual:](&v4, sel_isEqual_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
