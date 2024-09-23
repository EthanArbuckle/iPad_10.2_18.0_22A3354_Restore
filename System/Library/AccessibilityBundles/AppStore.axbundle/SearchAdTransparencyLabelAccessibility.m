@implementation SearchAdTransparencyLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.SearchAdTransparencyLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(CFSTR("advertisement.button"));
}

@end
