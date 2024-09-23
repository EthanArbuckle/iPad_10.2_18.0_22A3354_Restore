@implementation NonRotatingARSCNViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NonRotatingARSCNView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  return 0;
}

@end
