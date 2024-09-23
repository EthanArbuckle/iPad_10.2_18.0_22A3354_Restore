@implementation NEOnDemandRuleConnect

- (NEOnDemandRuleConnect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEOnDemandRuleConnect;
  return -[NEOnDemandRule initWithAction:](&v3, sel_initWithAction_, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NEOnDemandRuleConnect;
  return -[NEOnDemandRule copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
