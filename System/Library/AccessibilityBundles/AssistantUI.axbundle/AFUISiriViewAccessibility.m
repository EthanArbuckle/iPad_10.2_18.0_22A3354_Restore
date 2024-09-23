@implementation AFUISiriViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AFUISiriView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_reportBugButton"), "SiriUIContentButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_siriStatusView"), "UIView<SiriUISiriStatusViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_helpButton"), "SiriUIHelpButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_audioRoutePickerButton"), "SiriUIAudioRoutePickerButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_lockContainerView"), "AFUIPasscodeContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_lockViewHidden"), "BOOL");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriView"), CFSTR("configureReportBugButtonToShowHoldToTalkState:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriView"), CFSTR("remoteContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriView"), CFSTR("_animateButtonsHidden:"), "v", "B", 0);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewAccessibility;
  -[AFUISiriViewAccessibility automationElements](&v7, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteContentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v3, "arrayByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if ((-[AFUISiriViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_lockViewHidden")) & 1) != 0
    || (-[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockContainerView")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v6 = AFPreferencesTypeToSiriEnabled();
    v7 = (void *)MEMORY[0x24BDBCE30];
    -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteContentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_audioRoutePickerButton"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_helpButton"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_siriStatusView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reportBugButton"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_audioRoutePickerButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v8, v9, v10, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockContainerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_accessibilityFuzzyHitTestElements
{
  void *v2;
  void *v3;
  void *v4;

  -[AFUISiriViewAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriViewAccessibility;
  -[AFUISiriViewAccessibility configureReportBugButtonToShowHoldToTalkState:](&v4, sel_configureReportBugButtonToShowHoldToTalkState_, a3);
  -[AFUISiriViewAccessibility _axUpdateReportBug](self, "_axUpdateReportBug");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  -[AFUISiriViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[AFUISiriViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axUpdateReportBug
{
  void *v3;
  void *v4;
  id v5;

  -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reportBugButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  -[AFUISiriViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reportBugButton"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  AssistantUIAccessibilityLocalizedString(CFSTR("assistant.reportbug.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  -[AFUISiriViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[AFUISiriViewAccessibility _axUpdateReportBug](self, "_axUpdateReportBug");
}

- (void)_animateButtonsHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  -[AFUISiriViewAccessibility _animateButtonsHidden:](&v3, sel__animateButtonsHidden_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

@end
