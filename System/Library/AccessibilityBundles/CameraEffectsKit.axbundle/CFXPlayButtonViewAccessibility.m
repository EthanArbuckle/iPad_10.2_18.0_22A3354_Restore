@implementation CFXPlayButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXPlayButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPlayButtonView"), CFSTR("playButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPlayButtonView"), CFSTR("playButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[CFXPlayButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("selected"));

  if (v3)
    v4 = CFSTR("pause.button");
  else
    v4 = CFSTR("play.button");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXPlayButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CFXPlayButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)playButtonTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonViewAccessibility;
  -[CFXPlayButtonViewAccessibility playButtonTapped:](&v6, sel_playButtonTapped_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[CFXPlayButtonViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
