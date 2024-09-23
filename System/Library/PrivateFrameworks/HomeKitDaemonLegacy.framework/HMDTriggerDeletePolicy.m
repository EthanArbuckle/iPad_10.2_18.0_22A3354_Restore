@implementation HMDTriggerDeletePolicy

- (HMDTriggerDeletePolicy)init
{

  return 0;
}

- (HMDTriggerDeletePolicy)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return -[HMDTriggerPolicy initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (void)applyPolicy:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "home");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTrigger:", v3);

}

- (HMDTriggerDeletePolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return -[HMDTriggerPolicy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDTriggerDeletePolicy;
  -[HMDTriggerPolicy encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTriggerDeletePolicy;
  return -[HMDTriggerPolicy isEqual:](&v4, sel_isEqual_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
