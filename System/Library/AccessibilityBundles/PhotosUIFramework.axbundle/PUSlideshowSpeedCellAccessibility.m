@implementation PUSlideshowSpeedCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUSlideshowSpeedCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUSlideshowSpeedCell"), CFSTR("_slider"), "UISlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUSlideshowSpeedCell"), CFSTR("initWithStyle: reuseIdentifier:"), "q", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowSpeedCellAccessibility;
  -[PUSlideshowSpeedCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PUSlideshowSpeedCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("slideshow.speed.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (PUSlideshowSpeedCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUSlideshowSpeedCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSpeedCellAccessibility;
  v4 = -[PUSlideshowSpeedCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[PUSlideshowSpeedCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
