@implementation SearchAdTransparencyLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.SearchAdTransparencyLabel");
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
