@implementation HUAnnounceRecordingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAnnounceRecordingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HURecordingButton"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("beginRecording:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("stopRecordAndSend:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("largeTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnounceRecordingViewController"), CFSTR("recordButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[HUAnnounceRecordingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("largeTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (BOOL)accessibilityPerformMagicTap
{
  AXPerformSafeBlock();
  return 1;
}

void __78__HUAnnounceRecordingViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("recordButton"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 64);

}

- (void)beginRecording:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility beginRecording:](&v6, sel_beginRecording_, a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", MEMORY[0x24BDBD1C8]);
  v4 = *MEMORY[0x24BDF72C8];
  -[HUAnnounceRecordingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recordButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)stopRecordAndSend:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility stopRecordAndSend:](&v3, sel_stopRecordAndSend_, a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUAnnounceRecordingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E8], (id)*MEMORY[0x24BDF72D0]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  -[HUAnnounceRecordingViewControllerAccessibility viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7320], (id)*MEMORY[0x24BDF72D0]);
}

@end
