@implementation ArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ArtworkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

@end
