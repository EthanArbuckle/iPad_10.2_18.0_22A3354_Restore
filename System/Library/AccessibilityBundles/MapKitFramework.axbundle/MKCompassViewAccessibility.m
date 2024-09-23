@implementation MKCompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKCompassView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKCompassView"), CFSTR("_assetImageView"), "UIImageView");
}

- (id)accessibilityHint
{
  return AXMapKitLocString(CFSTR("COMPASS_HINT"));
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
  void *v6;
  void *v7;
  void *v8;

  -[MKCompassViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_assetImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("transform.rotation.z"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");

  v5 = (void *)MEMORY[0x24BDD17C8];
  AXMapKitLocString(CFSTR("HEADING_FORMAT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXDescriptionForHeadingInDegrees();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
