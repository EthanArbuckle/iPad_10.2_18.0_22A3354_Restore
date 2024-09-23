@implementation MKLookAroundContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKLookAroundContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(CFSTR("LOOK_AROUND"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
