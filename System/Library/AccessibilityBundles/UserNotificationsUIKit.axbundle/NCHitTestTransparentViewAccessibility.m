@implementation NCHitTestTransparentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCHitTestTransparentView");
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
