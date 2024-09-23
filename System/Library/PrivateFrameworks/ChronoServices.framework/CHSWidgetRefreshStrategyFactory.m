@implementation CHSWidgetRefreshStrategyFactory

+ (CHSWidgetRefreshStrategy)defaultStrategy
{
  return (CHSWidgetRefreshStrategy *)-[_CHSSimpleWidgetRefreshStrategy initWithDefaultStrategy]([_CHSSimpleWidgetRefreshStrategy alloc], "initWithDefaultStrategy");
}

+ (CHSWidgetRefreshStrategy)disabledStrategy
{
  return (CHSWidgetRefreshStrategy *)-[_CHSSimpleWidgetRefreshStrategy initWithDisabledStrategy]([_CHSSimpleWidgetRefreshStrategy alloc], "initWithDisabledStrategy");
}

+ (id)rateLimitedWithPolicyIdentifier:(id)a3
{
  id v5;
  _CHSSimpleWidgetRefreshStrategy *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSWidgetRefreshStrategy.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v6 = -[_CHSSimpleWidgetRefreshStrategy initWithRateLimitIdentifier:]([_CHSSimpleWidgetRefreshStrategy alloc], "initWithRateLimitIdentifier:", v5);

  return v6;
}

@end
