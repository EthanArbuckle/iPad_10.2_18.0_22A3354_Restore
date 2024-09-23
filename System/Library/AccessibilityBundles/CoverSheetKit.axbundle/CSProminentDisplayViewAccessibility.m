@implementation CSProminentDisplayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSProminentDisplayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
