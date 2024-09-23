@implementation SBFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("folder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("scalingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("_titleTextField"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBHIconManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("closingFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("closeFolderAnimated:withCompletion:"), "v", "B", "@?", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderViewAccessibility;
  -[SBFolderViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SBFolderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFolderViewAccessibility;
  -[SBFolderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scalingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("SBFolderScalingView"));

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automationElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("pageControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v7);

  objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v4);
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v5);

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  BOOL v4;
  id v6;

  AXSBHIconManagerFromSharedIconController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasOpenFolder")))
  {
    v6 = v2;
    AXPerformSafeBlock();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("closingFolder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __55__SBFolderViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeFolderAnimated:withCompletion:", 1, 0);
}

@end
