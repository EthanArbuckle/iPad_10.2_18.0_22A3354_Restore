@implementation SVSCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SVSCardContainerView");
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
