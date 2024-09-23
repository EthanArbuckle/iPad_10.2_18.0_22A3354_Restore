@implementation QLOverlayPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLOverlayPlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLOverlayPlayButton"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLOverlayPlayButton"), CFSTR("_playButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLOverlayPlayButton"), CFSTR("_button"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLOverlayPlayButtonAccessibility;
  -[QLOverlayPlayButtonAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[QLOverlayPlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("play.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (QLOverlayPlayButtonAccessibility)initWithFrame:(CGRect)a3
{
  QLOverlayPlayButtonAccessibility *v3;
  QLOverlayPlayButtonAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLOverlayPlayButtonAccessibility;
  v3 = -[QLOverlayPlayButtonAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[QLOverlayPlayButtonAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)_playButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLOverlayPlayButtonAccessibility;
  -[QLOverlayPlayButtonAccessibility _playButtonTapped:](&v3, sel__playButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
