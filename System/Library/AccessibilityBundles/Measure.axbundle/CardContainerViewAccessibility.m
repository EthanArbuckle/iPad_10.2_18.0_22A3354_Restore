@implementation CardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.CardContainerView");
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
