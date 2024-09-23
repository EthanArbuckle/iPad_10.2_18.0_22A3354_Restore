@implementation SFCapsuleURLFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCapsuleURLField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFCapsuleURLField"), CFSTR("_voiceSearchButton"), "_SFDimmingButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFCapsuleURLField"), CFSTR("_clearTextButton"), "_SFDimmingButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleURLField"), CFSTR("initWithTextField:"), "@", 0);

}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if ((AXDeviceIsPhoneIdiom() & 1) != 0)
    return 1000;
  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleURLFieldAccessibility;
  return -[SFCapsuleURLFieldAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCapsuleURLFieldAccessibility;
  -[SFCapsuleURLFieldAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.voicesearch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleURLFieldAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_voiceSearchButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  UIKitAccessibilityLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleURLFieldAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_clearTextButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (SFCapsuleURLFieldAccessibility)initWithTextField:(id)a3
{
  SFCapsuleURLFieldAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCapsuleURLFieldAccessibility;
  v3 = -[SFCapsuleURLFieldAccessibility initWithTextField:](&v5, sel_initWithTextField_, a3);
  -[SFCapsuleURLFieldAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
