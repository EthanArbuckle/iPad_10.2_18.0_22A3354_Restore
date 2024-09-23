@implementation HUQuickControlElasticSliderInteractionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlElasticSliderInteractionCoordinator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("initWithControlView: delegate:"), "@", "@", 0);
}

- (HUQuickControlElasticSliderInteractionCoordinatorAccessibility)initWithControlView:(id)a3 delegate:(id)a4
{
  id v5;
  HUQuickControlElasticSliderInteractionCoordinatorAccessibility *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinatorAccessibility;
  v5 = a3;
  v6 = -[HUQuickControlElasticSliderInteractionCoordinatorAccessibility initWithControlView:delegate:](&v8, sel_initWithControlView_delegate_, v5, a4);
  objc_msgSend(v5, "_accessibilitySetAssignedValue:forKey:", v6, AXControlUpdateDelegateKey, v8.receiver, v8.super_class);

  return v6;
}

@end
