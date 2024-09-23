@implementation AFUISiriCompactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AFUISiriCompactView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriCompactView"), CFSTR("_siriContentDelegate"), "<AFUISiriContentDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriCompactView"), CFSTR("_orbView"), "SUICOrbView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriCompactView"), CFSTR("_reportBugButton"), "SiriUIContentButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriCompactView"), CFSTR("setSiriSessionState:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriCompactView"), CFSTR("_setupContentViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriCompactView"), CFSTR("_constructAndAddBugReportButtonWithImage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("siriContentDidReceiveOrbTappedAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("stopRequestWithOptions:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("_session"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("cancelSpeechRequest"), "v", 0);
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriPresentationViewController"), CFSTR("dismissSiriViewController:withReason:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriCompactView"), CFSTR("_lockContainerView"), "AFUIPasscodeContainerView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AFUISiriCompactViewAccessibility _axSetLabelForSessionState:](self, "_axSetLabelForSessionState:", -[AFUISiriCompactViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_siriSessionState")));
  -[AFUISiriCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reportBugButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AssistantUIAccessibilityLocalizedString(CFSTR("assistant.reportbug.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

- (BOOL)accessibilityPerformMagicTap
{
  id v2;
  void *v4;

  -[AFUISiriCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_siriContentDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __64__AFUISiriCompactViewAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "siriContentDidReceiveOrbTappedAction:", *(_QWORD *)(a1 + 40));
}

- (void)accessibilityElementDidLoseFocus
{
  if (_AXSVoiceOverTouchEnabled())
    AXPerformSafeBlock();
}

void __68__AFUISiriCompactViewAccessibility_accessibilityElementDidLoseFocus__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  id v6;

  UIAccessibilityPostNotification(0x1645u, 0);
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_lockContainerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_siriContentDelegate"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_session"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("VoiceOverCancelRequestInProgress"));
    objc_msgSend(v6, "stopRequestWithOptions:", 0);
    v5 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("cancelSpeechRequest"));
    objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("VoiceOverCancelRequestInProgress"));

  }
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __62__AFUISiriCompactViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_siriContentDelegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissSiriViewController:withReason:", v2, 23);

}

- (void)_axSetLabelForSessionState:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id argument;

  -[AFUISiriCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orbView"));
  argument = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    _UIAccessibilityBlockPostingOfNotification();
    _UIAccessibilityBlockPostingOfNotification();
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], argument);
    objc_msgSend(argument, "setAccessibilityLabel:", 0);
    objc_msgSend(argument, "setAccessibilityHint:", 0);
    objc_msgSend(argument, "setAccessibilityIdentifier:", CFSTR("Listening"));
    objc_msgSend(argument, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
  }
  else
  {
    AssistantUIAccessibilityLocalizedString(CFSTR("listen.button.label"));
    if (a3 == 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(argument, "setAccessibilityLabel:", v4);

      v5 = CFSTR("listen.button.hint.thinking");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(argument, "setAccessibilityLabel:", v6);

      v5 = CFSTR("listen.button.hint.idle");
    }
    AssistantUIAccessibilityLocalizedString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(argument, "setAccessibilityHint:", v7);

    objc_msgSend(argument, "setAccessibilityIdentifier:", CFSTR("Listen"));
    objc_msgSend(argument, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);
    _UIAccessibilityUnblockPostingOfNotification();
    _UIAccessibilityUnblockPostingOfNotification();
  }
  _AXIgnoreNextNotification();

}

- (void)setSiriSessionState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility setSiriSessionState:](&v5, sel_setSiriSessionState_);
  -[AFUISiriCompactViewAccessibility _axSetLabelForSessionState:](self, "_axSetLabelForSessionState:", a3);
}

- (void)_setupContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility _setupContentViews](&v3, sel__setupContentViews);
  -[AFUISiriCompactViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_constructAndAddBugReportButtonWithImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility _constructAndAddBugReportButtonWithImage:](&v4, sel__constructAndAddBugReportButtonWithImage_, a3);
  -[AFUISiriCompactViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)dealloc
{
  objc_super v3;

  _UIAccessibilityUnblockPostingOfNotification();
  _UIAccessibilityUnblockPostingOfNotification();
  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility dealloc](&v3, sel_dealloc);
}

@end
