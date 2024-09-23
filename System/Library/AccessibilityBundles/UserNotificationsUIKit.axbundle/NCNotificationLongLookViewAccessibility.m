@implementation NCNotificationLongLookViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationLongLookView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("NCDimmableView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationViewController"), CFSTR("_notificationRequest"), "NCNotificationRequest");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationLongLookView"), CFSTR("PLExpandedPlatterView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandedPlatterView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("options"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationOptions"), CFSTR("dismissAutomatically"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationLongLookViewController"), CFSTR("contentProviderDismissCustomContent:animated:"), "v", "@", "B", 0);

}

- (unint64_t)_accessibilityAutomationType
{
  return 8;
}

- (BOOL)_accessibilityBannerIsSticky
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NCNotificationLongLookViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349233D4](CFSTR("NCDimmableView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_notificationRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "safeBoolForKey:", CFSTR("dismissAutomatically")) ^ 1;
  return (char)v6;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __69__NCNotificationLongLookViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentProviderDismissCustomContent:animated:", 0, 1);

}

@end
