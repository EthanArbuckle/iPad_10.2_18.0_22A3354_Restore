@implementation TPSSingleTipViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSSingleTipViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSSingleTipViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TPSSingleTipViewController"), CFSTR("_imageAssetView"), "TPSImageAssetView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSImageAssetView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSSingleTipViewController"), CFSTR("tip"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSTip"), CFSTR("fullContentAssets"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSAssets"), CFSTR("alt"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSSingleTipViewController"), CFSTR("setTip:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TPSSingleTipViewController"), CFSTR("_pendingTip"), "TPSTip");

}

- (void)setTip:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSSingleTipViewControllerAccessibility;
  -[TPSSingleTipViewControllerAccessibility setTip:](&v4, sel_setTip_, a3);
  -[TPSSingleTipViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TPSSingleTipViewControllerAccessibility;
  -[TPSSingleTipViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[TPSSingleTipViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageAssetView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSSingleTipViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TPSSingleTipViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pendingTip"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_0);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("fullContentAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeStringForKey:", CFSTR("alt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
    objc_msgSend(v4, "setAccessibilityLabel:", v10);
    objc_msgSend(v4, "setAccessibilityHint:", 0);
  }
  else
  {
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
    accessibilityTipsLocalizedString(CFSTR("video.role"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v12, v10, CFSTR("__AXStringForVariablesSentinel"));

  }
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessibilityIdentifier:", kAXSingleTipsViewIdentifier);
}

uint64_t __85__TPSSingleTipViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isHidden") ^ 1;
  else
    v3 = 0;

  return v3;
}

@end
