@implementation HREActionAnyVarianceRule

+ (id)anyVarianceRuleWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithKey:", v4);

  return v5;
}

- (BOOL)passesForAction:(id)a3
{
  return 1;
}

@end
