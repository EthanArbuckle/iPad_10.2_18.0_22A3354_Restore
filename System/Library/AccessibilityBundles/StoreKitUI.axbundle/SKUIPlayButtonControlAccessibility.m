@implementation SKUIPlayButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIPlayButtonControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIPlayButtonControl"), CFSTR("_showPlayIndicator:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIPlayButtonControl"), CFSTR("beginIndeterminateAnimation"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIPlayButtonControl"), CFSTR("endIndeterminateAnimation"), "v", 0);

}

- (void)_showPlayIndicator:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKUIPlayButtonControlAccessibility;
  -[SKUIPlayButtonControlAccessibility _showPlayIndicator:](&v7, sel__showPlayIndicator_);
  if (v3)
    v5 = CFSTR("play.button");
  else
    v5 = CFSTR("pause.button");
  accessibilitySKUILocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPlayButtonControlAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v6);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  float v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SKUIPlayButtonControlAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("_progress"));
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilitySKUILocalizedString(CFSTR("playback.progress"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButtonControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SKUIPlayButtonControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)beginIndeterminateAnimation
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIPlayButtonControlAccessibility;
  -[SKUIPlayButtonControlAccessibility beginIndeterminateAnimation](&v4, sel_beginIndeterminateAnimation);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilitySKUILocalizedString(CFSTR("indeterminate.playback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (void)endIndeterminateAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SKUIPlayButtonControlAccessibility;
  -[SKUIPlayButtonControlAccessibility endIndeterminateAnimation](&v2, sel_endIndeterminateAnimation);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
