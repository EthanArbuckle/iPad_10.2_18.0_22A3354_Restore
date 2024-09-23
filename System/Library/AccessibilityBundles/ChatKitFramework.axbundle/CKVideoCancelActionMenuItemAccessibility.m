@implementation CKVideoCancelActionMenuItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKVideoCancelActionMenuItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("cancel.button"));
}

@end
