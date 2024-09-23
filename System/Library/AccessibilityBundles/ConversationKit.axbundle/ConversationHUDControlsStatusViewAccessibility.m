@implementation ConversationHUDControlsStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ConversationHUDControlsStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationHUDControlsStatusView"), CFSTR("conversationDetailsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationDetailsView"), CFSTR("conversationTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationDetailsView"), CFSTR("conversationSubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationHUDControlsStatusView"), CFSTR("setupRootView"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHUDControlsStatusViewAccessibility;
  -[ConversationHUDControlsStatusViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ConversationHUDControlsStatusViewAccessibility _accessibilitySetupVStack](self, "_accessibilitySetupVStack");
}

- (void)setupRootView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHUDControlsStatusViewAccessibility;
  -[ConversationHUDControlsStatusViewAccessibility setupRootView](&v3, sel_setupRootView);
  -[ConversationHUDControlsStatusViewAccessibility _accessibilitySetupVStack](self, "_accessibilitySetupVStack");
  AXPerformBlockOnMainThreadAfterDelay();
}

void __63__ConversationHUDControlsStatusViewAccessibility_setupRootView__block_invoke(uint64_t a1)
{
  id argument;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("conversationDetailsView"));
  argument = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(argument, "_accessibilityViewIsVisible"))
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], argument);

}

- (void)_accessibilitySetupVStack
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[ConversationHUDControlsStatusViewAccessibility _accessibilityConversationDetailsView](self, "_accessibilityConversationDetailsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  v5 = *MEMORY[0x24BDF73B0] | v4;
  accessibilityLocalizedString(CFSTR("show.call.details.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v6);

  objc_msgSend(v3, "setAccessibilityTraits:", v5);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __75__ConversationHUDControlsStatusViewAccessibility__accessibilitySetupVStack__block_invoke;
  v10 = &unk_2501E5BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v7);
  objc_msgSend(v3, "setIsAccessibilityElement:", 1, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __75__ConversationHUDControlsStatusViewAccessibility__accessibilitySetupVStack__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityConversationDetailsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("conversationTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "_accessibilityConversationDetailsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("conversationSubtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_accessibilityConversationDetailsView
{
  return (id)-[ConversationHUDControlsStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversationDetailsView"));
}

@end
