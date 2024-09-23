@implementation CAMViewfinderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMViewfinderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
