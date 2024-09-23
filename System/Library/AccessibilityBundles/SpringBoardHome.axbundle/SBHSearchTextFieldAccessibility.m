@implementation SBHSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHSearchTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHSearchTextField"), CFSTR("updateVisualStyling"), "v", 0);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BDF73F8];
  v4.receiver = self;
  v4.super_class = (Class)SBHSearchTextFieldAccessibility;
  return -[SBHSearchTextFieldAccessibility accessibilityTraits](&v4, sel_accessibilityTraits) | v2;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  AXSBIconControllerSharedInstance();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1 && objc_msgSend(v4, "_axIsShowingAppLibrary"))
  {
    objc_msgSend(v5, "_axHideAppLibrary");
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  BOOL v4;
  objc_super v6;

  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_axIsShowingAppLibrary"))
  {
    objc_msgSend(v3, "_axHideAppLibrary");
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHSearchTextFieldAccessibility;
    v4 = -[SBHSearchTextFieldAccessibility accessibilityPerformEscape](&v6, sel_accessibilityPerformEscape);
  }

  return v4;
}

- (void)updateVisualStyling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHSearchTextFieldAccessibility;
  -[SBHSearchTextFieldAccessibility updateVisualStyling](&v3, sel_updateVisualStyling);
  if (-[SBHSearchTextFieldAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    if (-[SBHSearchTextFieldAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], self);
  }
}

@end
