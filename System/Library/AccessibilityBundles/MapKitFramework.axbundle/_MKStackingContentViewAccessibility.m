@implementation _MKStackingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKStackingContentView");
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
