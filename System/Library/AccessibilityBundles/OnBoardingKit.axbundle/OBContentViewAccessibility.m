@implementation OBContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end
