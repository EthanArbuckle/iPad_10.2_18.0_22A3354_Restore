@implementation HUHomePodStereoSwapperCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUHomePodStereoSwapperCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUHomePodStereoSwapperCell"), CFSTR("_swapButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUHomePodStereoSwapperCell"), CFSTR("_leftHomePod"), "HUHomePodDetailView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUHomePodStereoSwapperCell"), CFSTR("_rightHomePod"), "HUHomePodDetailView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUHomePodStereoSwapperCell"), CFSTR("initWithStyle:reuseIdentifier:"), "q", "@", 0);

}

- (HUHomePodStereoSwapperCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUHomePodStereoSwapperCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUHomePodStereoSwapperCellAccessibility;
  v4 = -[HUHomePodStereoSwapperCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[HUHomePodStereoSwapperCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUHomePodStereoSwapperCellAccessibility;
  -[HUHomePodStereoSwapperCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HUHomePodStereoSwapperCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_swapButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeLocalizedString(CFSTR("swap.speakers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
