@implementation PHRecentCallDetailsItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHRecentCallDetailsItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHRecentCallDetailsItemView"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHRecentCallDetailsItemView"), CFSTR("statusLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHRecentCallDetailsItemView"), CFSTR("_ttyDetailDisclosureImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHRecentCallDetailsItemView"), CFSTR("durationAndDataLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHRecentCallDetailsItemView"), CFSTR("verifiedBadgeView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsTTYCall
{
  void *v2;
  BOOL v3;

  -[PHRecentCallDetailsItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ttyDetailDisclosureImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[PHRecentCallDetailsItemViewAccessibility _axIsTTYCall](self, "_axIsTTYCall");
  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  return *v3;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[PHRecentCallDetailsItemViewAccessibility _axIsTTYCall](self, "_axIsTTYCall"))
  {
    accessibilityMobilePhoneLocalizedString(CFSTR("view.tty.conversation"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[PHRecentCallDetailsItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("verifiedBadgeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (-[PHRecentCallDetailsItemViewAccessibility _axIsTTYCall](self, "_axIsTTYCall"))
  {
    accessibilityMobilePhoneLocalizedString(CFSTR("tty.text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[PHRecentCallDetailsItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRecentCallDetailsItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("statusLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    accessibilityMobilePhoneLocalizedString(CFSTR("verified.call"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[PHRecentCallDetailsItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("durationAndDataLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  return v12;
}

@end
