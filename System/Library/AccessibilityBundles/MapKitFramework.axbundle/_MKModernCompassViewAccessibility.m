@implementation _MKModernCompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKModernCompassView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKModernCompassView"), CFSTR("mapHeading"), "d", 0);
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(CFSTR("COMPASS_BUTTON"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430] | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_MKModernCompassViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("mapHeading"));
  v2 = (void *)MEMORY[0x24BDD17C8];
  AXMapKitLocString(CFSTR("HEADING_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXDescriptionForHeadingInDegrees();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
