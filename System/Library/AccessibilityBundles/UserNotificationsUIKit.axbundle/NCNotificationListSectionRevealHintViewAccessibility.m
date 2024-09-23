@implementation NCNotificationListSectionRevealHintViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListSectionRevealHintView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationListSectionRevealHintView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionRevealHintView"), CFSTR("revealHintTitle"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[NCNotificationListSectionRevealHintViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("revealHintTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)_accessibilityIsHintTitleVisible
{
  void *v2;
  char v3;

  -[NCNotificationListSectionRevealHintViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("revealHintTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

@end
