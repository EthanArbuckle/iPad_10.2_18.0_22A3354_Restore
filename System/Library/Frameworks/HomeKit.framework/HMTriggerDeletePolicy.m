@implementation HMTriggerDeletePolicy

- (HMTriggerDeletePolicy)init
{

  return 0;
}

- (id)_initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMTriggerDeletePolicy;
  return -[HMTriggerPolicy _initWithIdentifier:](&v4, sel__initWithIdentifier_, a3);
}

- (HMTriggerDeletePolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMTriggerDeletePolicy;
  return -[HMTriggerPolicy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
