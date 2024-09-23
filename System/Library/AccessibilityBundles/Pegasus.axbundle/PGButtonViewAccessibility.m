@implementation PGButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCustomActions
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
