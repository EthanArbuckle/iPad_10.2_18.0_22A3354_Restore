@implementation CondensedAppEventCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.CondensedAppEventCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Arcade.CondensedAppEventCardView"), CFSTR("appEventFormattedDateView"), "AppPromotionFormattedDateView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.CondensedAppEventCardView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("Arcade.AppPromotionFormattedDateView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Arcade.AppPromotionFormattedDateView"), CFSTR("textLabel"), "DynamicTypeLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityAppStoreLocalizedString(CFSTR("view.event.hint"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CondensedAppEventCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CondensedAppEventCardViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("appEventFormattedDateView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490667C](CFSTR("AppStore.AppPromotionFormattedDateView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("textLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CondensedAppEventCardViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CondensedAppEventCardViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
