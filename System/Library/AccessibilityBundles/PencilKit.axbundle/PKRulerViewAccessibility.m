@implementation PKRulerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKRulerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(CFSTR("ruler.name"));
}

@end
