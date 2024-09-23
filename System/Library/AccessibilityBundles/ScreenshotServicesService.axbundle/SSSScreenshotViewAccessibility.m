@implementation SSSScreenshotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSScreenshotView");
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
