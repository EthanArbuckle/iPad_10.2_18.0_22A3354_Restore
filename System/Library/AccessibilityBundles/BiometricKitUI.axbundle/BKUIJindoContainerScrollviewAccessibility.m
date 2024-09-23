@implementation BKUIJindoContainerScrollviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIJindoContainerScrollview");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
