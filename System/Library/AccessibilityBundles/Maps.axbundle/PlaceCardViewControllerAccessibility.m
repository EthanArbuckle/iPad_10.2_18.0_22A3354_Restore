@implementation PlaceCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PlaceCardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PlaceCardViewController"), CFSTR("updateContent"), "v", 0);
}

- (void)updateContent
{
  void *v2;
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PlaceCardViewControllerAccessibility;
  -[PlaceCardViewControllerAccessibility updateContent](&v5, sel_updateContent);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF7328];
  objc_msgSend(v2, "_accessibilityFirstNonGrabberElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end
