@implementation PKContinuousButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKContinuousButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKContinuousButton"), CFSTR("_activityIndicatorView"), "UIActivityIndicatorView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKContinuousButton"), CFSTR("setShowSpinner:"), "v", "B", 0);

}

- (void)setShowSpinner:(BOOL)a3
{
  _BOOL4 v3;
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKContinuousButtonAccessibility;
  -[PKContinuousButtonAccessibility setShowSpinner:](&v6, sel_setShowSpinner_);
  if (v3)
  {
    v4 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("loading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v5);

  }
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[PKContinuousButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_activityIndicatorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("loading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKContinuousButtonAccessibility;
    -[PKContinuousButtonAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
