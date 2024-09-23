@implementation SBHomeScreenOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeScreenOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayViewController"), CFSTR("isFromLeading"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenOverlayViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHomeScreenOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryViewController"), CFSTR("popNestedViewControllerAnimated:withCompletion:"), "v", "B", "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenOverlayViewControllerAccessibility;
  -[SBHomeScreenOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHomeScreenOverlayViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityElementsHiddenBlock:", &__block_literal_global_19);

}

uint64_t __92__SBHomeScreenOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  int v1;

  +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_axIsAppLibraryOrTodayViewPresent");

  return v1 ^ 1u;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v8;
  char v9;

  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isMainDisplayLibraryViewVisible"));

  if (v4)
  {
    AXLibraryViewController(CFSTR("activeDisplayWindowScene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPresentingFolder")))
    {
      v6 = v5;
      AXPerformSafeBlock();

      return 1;
    }

  }
  -[SBHomeScreenOverlayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "accessibilityPerformEscape");

  return v9;
}

uint64_t __76__SBHomeScreenOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "popNestedViewControllerAnimated:withCompletion:", 1, 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5;

  v5 = -[SBHomeScreenOverlayViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFromLeading"));
  if (a3 == 1)
  {
    if (v5
      && !-[SBHomeScreenOverlayViewControllerAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL"))
    {
      return 0;
    }
    return -[SBHomeScreenOverlayViewControllerAccessibility accessibilityPerformEscape](self, "accessibilityPerformEscape");
  }
  if (a3 == 2
    && ((v5 & 1) != 0
     || (-[SBHomeScreenOverlayViewControllerAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") & 1) != 0))
  {
    return -[SBHomeScreenOverlayViewControllerAccessibility accessibilityPerformEscape](self, "accessibilityPerformEscape");
  }
  return 0;
}

@end
