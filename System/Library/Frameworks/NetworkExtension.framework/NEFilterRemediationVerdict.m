@implementation NEFilterRemediationVerdict

- (int64_t)filterAction
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NEFilterRemediationVerdict;
  result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterVerdict drop](self, "drop") || self && self->super._remediate)
      return 4;
    else
      return 1;
  }
  return result;
}

+ (NEFilterRemediationVerdict)allowVerdict
{
  return -[NEFilterVerdict initWithDrop:remediate:]([NEFilterRemediationVerdict alloc], "initWithDrop:remediate:", 0, 0);
}

+ (NEFilterRemediationVerdict)dropVerdict
{
  return -[NEFilterVerdict initWithDrop:remediate:]([NEFilterRemediationVerdict alloc], "initWithDrop:remediate:", 1, 0);
}

+ (NEFilterRemediationVerdict)needRulesVerdict
{
  void *v2;

  +[NEFilterRemediationVerdict allowVerdict](NEFilterRemediationVerdict, "allowVerdict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedRules:", 1);
  return (NEFilterRemediationVerdict *)v2;
}

@end
