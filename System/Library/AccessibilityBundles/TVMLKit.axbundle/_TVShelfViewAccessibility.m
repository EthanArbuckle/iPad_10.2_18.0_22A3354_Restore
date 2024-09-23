@implementation _TVShelfViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVShelfView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 9;
}

@end
