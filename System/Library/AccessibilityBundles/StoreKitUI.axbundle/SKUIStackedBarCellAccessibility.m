@implementation SKUIStackedBarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStackedBarCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIStackedBarCell"), CFSTR("_backButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIStackedBarCell"), CFSTR("_expanded"), "BOOL");

}

- (BOOL)accessibilityActivate
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[SKUIStackedBarCellAccessibility _axIsTappable](self, "_axIsTappable");
  if (v3)
  {
    objc_opt_class();
    -[SKUIStackedBarCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sendActionsForControlEvents:", 64);
  }
  return v3;
}

- (id)accessibilityHint
{
  void *v3;

  if (-[SKUIStackedBarCellAccessibility _axIsTappable](self, "_axIsTappable")
    && -[SKUIStackedBarCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_expanded")))
  {
    accessibilitySKUILocalizedString(CFSTR("explore.category.collapse"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (!-[SKUIStackedBarCellAccessibility _axIsTappable](self, "_axIsTappable"))
    return *MEMORY[0x24BDF7410];
  v4.receiver = self;
  v4.super_class = (Class)SKUIStackedBarCellAccessibility;
  return -[SKUIStackedBarCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (BOOL)_axIsTappable
{
  void *v3;
  void *v4;
  int v5;

  objc_opt_class();
  -[SKUIStackedBarCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isHidden") ^ 1;
  return v5;
}

@end
