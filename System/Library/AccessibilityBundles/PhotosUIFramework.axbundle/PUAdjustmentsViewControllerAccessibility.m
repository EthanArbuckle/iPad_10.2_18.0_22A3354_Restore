@implementation PUAdjustmentsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAdjustmentsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAdjustmentsSlider
{
  JUMPOUT(0x2348C1CECLL);
}

- (void)_setAXAdjustmentsSlider:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("slider"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUAdjustmentsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsDataSource"), CFSTR("infoForItemAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("selectedIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("layoutDirection"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("setSelectedIndexPath:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("_updateSliderForControlAtIndexPath:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentInfo"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentInfo"), CFSTR("localizedSectionName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("isEnabled"), "B", 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsViewControllerAccessibility;
  -[PUAdjustmentsViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUAdjustmentsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  AXPUAdjustmentSlider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAdjustmentsViewControllerAccessibility;
  -[PUAdjustmentsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[PUAdjustmentsViewControllerAccessibility _axAdjustmentsSlider](self, "_axAdjustmentsSlider");
  v3 = (AXPUAdjustmentSlider *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AXPUAdjustmentSlider initWithAccessibilityContainer:]([AXPUAdjustmentSlider alloc], "initWithAccessibilityContainer:", self);
    -[PUAdjustmentsViewControllerAccessibility _setAXAdjustmentsSlider:](self, "_setAXAdjustmentsSlider:", v3);
  }
  objc_opt_class();
  -[PUAdjustmentsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElements:", v7);

}

@end
