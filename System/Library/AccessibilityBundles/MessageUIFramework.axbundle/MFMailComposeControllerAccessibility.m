@implementation MFMailComposeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMailComposeController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeController"), CFSTR("_composeViewDidDraw:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeController"), CFSTR("_toField"), "MFMailComposeToField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeController"), CFSTR("_sendButtonItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMailComposeController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("WKScrollView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMailComposeController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeControllerAccessibility;
  -[MFMailComposeControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MFMailComposeControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetShouldUseFallbackForVisibleContentInset:", 1);
  -[MFMailComposeControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sendButtonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("send.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

uint64_t __82__MFMailComposeControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("WKScrollView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_composeViewDidDraw:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeControllerAccessibility;
  -[MFMailComposeControllerAccessibility _composeViewDidDraw:](&v3, sel__composeViewDidDraw_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __60__MFMailComposeControllerAccessibility__composeViewDidDraw___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("_toField"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeControllerAccessibility;
  -[MFMailComposeControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MFMailComposeControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
