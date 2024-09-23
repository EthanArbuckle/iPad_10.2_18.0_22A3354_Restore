@implementation VKMapCanvasAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKMapCanvas");
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
