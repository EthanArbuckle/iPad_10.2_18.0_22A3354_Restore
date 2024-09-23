@implementation VideosUI_MonogramLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MonogramLockupCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VUIMonogramView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MonogramLockupCell"), CFSTR("monogramView"), "Optional<VUIMonogramView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIMonogramView"), CFSTR("overlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MonogramLockupCell"), CFSTR("titleLabel"), "Optional<VUILabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MonogramLockupCell"), CFSTR("subtitleLabel"), "Optional<VUILabel>");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[VideosUI_MonogramLockupCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosUI_MonogramLockupCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "length", v6, CFSTR("__AXStringForVariablesSentinel")))
  {
    -[VideosUI_MonogramLockupCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUIMonogramView")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[VideosUI_MonogramLockupCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("monogramView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("overlayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    accessibilityLocalizedString(CFSTR("sports.favorites.isFavorited"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    -[VideosUI_MonogramLockupCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;
  objc_super v5;

  if (-[VideosUI_MonogramLockupCellAccessibility _accessibilityHasDescendantOfType:](self, "_accessibilityHasDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUIMonogramView"), a2)))
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    return *MEMORY[0x24BDF73B0] | -[VideosUI_MonogramLockupCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)VideosUI_MonogramLockupCellAccessibility;
    return -[VideosUI_MonogramLockupCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
  }
}

@end
