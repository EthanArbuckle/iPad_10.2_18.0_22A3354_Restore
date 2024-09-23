@implementation CPSAppStoreButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSAppStoreButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("appstore.view.button"));
}

@end
