@implementation SketchSurfaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.SketchSurface");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("RECTANGLE_DIAGRAM"));
}

@end
