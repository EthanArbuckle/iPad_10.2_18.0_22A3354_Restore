@implementation PRXCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRXCardContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 6;
}

@end
