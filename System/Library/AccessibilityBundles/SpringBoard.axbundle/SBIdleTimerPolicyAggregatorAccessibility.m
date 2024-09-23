@implementation SBIdleTimerPolicyAggregatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIdleTimerPolicyAggregator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIdleTimerPolicyAggregator"), CFSTR("idleTimerDidWarn:"), "v", "@", 0);
}

- (void)idleTimerDidWarn:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[SBBacklightControllerAccessibility isIdling](SBBacklightControllerAccessibility, "isIdling");
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerPolicyAggregatorAccessibility;
  -[SBIdleTimerPolicyAggregatorAccessibility idleTimerDidWarn:](&v5, sel_idleTimerDidWarn_, v4);

}

@end
