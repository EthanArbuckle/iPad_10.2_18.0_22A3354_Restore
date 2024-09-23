@implementation NotifyMeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.NotifyMeButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.NotifyMeButton"), CFSTR("layoutSubviews"), "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NotifyMeButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[NotifyMeButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(CFSTR("notify.button"));
}

@end
