@implementation TodayCardChinLockupListIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.TodayCardChinLockupListIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(CFSTR("app.suggestion"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TodayCardChinLockupListIconViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TodayCardChinLockupListIconViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
