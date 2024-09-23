@implementation PGLayerHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGLayerHostView");
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
  return accessibilityLocalizedString(CFSTR("pip.video"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
