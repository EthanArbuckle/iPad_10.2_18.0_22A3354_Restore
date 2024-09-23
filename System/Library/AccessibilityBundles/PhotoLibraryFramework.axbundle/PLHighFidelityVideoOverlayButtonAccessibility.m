@implementation PLHighFidelityVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLHighFidelityVideoOverlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLHighFidelityVideoOverlayButton"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLHighFidelityVideoOverlayButton"), CFSTR("initWithStyle:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLHighFidelityVideoOverlayButton"), CFSTR("_playButtonTapped:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  -[PLHighFidelityVideoOverlayButtonAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PLHighFidelityVideoOverlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("play.video.button.txt"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PLHighFidelityVideoOverlayButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7408];
}

- (PLHighFidelityVideoOverlayButtonAccessibility)initWithStyle:(int64_t)a3
{
  PLHighFidelityVideoOverlayButtonAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  v3 = -[PLHighFidelityVideoOverlayButtonAccessibility initWithStyle:](&v5, sel_initWithStyle_, a3);
  -[PLHighFidelityVideoOverlayButtonAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_playButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButtonAccessibility;
  -[PLHighFidelityVideoOverlayButtonAccessibility _playButtonTapped:](&v3, sel__playButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
