@implementation CAMCameraViewControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMCameraViewControllerContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCameraViewControllerContainerView"), CFSTR("viewfinderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCameraViewControllerContainerView"), CFSTR("customOverlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCameraViewControllerContainerView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCameraViewControllerContainerView"), CFSTR("verifyViewOrdering"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("isPerformingReviewUsingOverlay"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  -[CAMCameraViewControllerContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CAMCameraViewControllerContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewfinderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPerformingReviewUsingOverlay")));

}

- (void)verifyViewOrdering
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  -[CAMCameraViewControllerContainerViewAccessibility verifyViewOrdering](&v3, sel_verifyViewOrdering);
  -[CAMCameraViewControllerContainerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  -[CAMCameraViewControllerContainerViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMCameraViewControllerContainerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
