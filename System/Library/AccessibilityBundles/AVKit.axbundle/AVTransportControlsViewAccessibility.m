@implementation AVTransportControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTransportControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTransportControlsView"), CFSTR("elapsedTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTransportControlsView"), CFSTR("timeRemainingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTransportControlsView"), CFSTR("scrubber"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTransportControlsView"), CFSTR("_standardPlayPauseButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTransportControlsView"), CFSTR("_skipBackButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTransportControlsView"), CFSTR("_skipForwardButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTransportControlsView"), CFSTR("_startRightwardContentTransitionButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTransportControlsView"), CFSTR("_startLeftwardContentTransitionButton"), "AVButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTransportControlsView"), CFSTR("initWithFrame:styleSheet:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);

}

- (AVTransportControlsViewAccessibility)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  AVTransportControlsViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTransportControlsViewAccessibility;
  v4 = -[AVTransportControlsViewAccessibility initWithFrame:styleSheet:](&v6, sel_initWithFrame_styleSheet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVTransportControlsViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id from;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)AVTransportControlsViewAccessibility;
  -[AVTransportControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v40, sel__accessibilityLoadAccessibilityInformation);
  -[AVTransportControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("elapsedTimeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  accessibilityLocalizedString(CFSTR("elapsed.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6 = *MEMORY[0x24BDF7430] | *MEMORY[0x24BDF7410];
  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v7, "setAccessibilityTraits:", v6);

  v8 = objc_loadWeakRetained(&location);
  v9 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v37[3] = &unk_250141278;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v8, "_setAccessibilityValueBlock:", v37);

  -[AVTransportControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("timeRemainingLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v10);

  v11 = objc_loadWeakRetained(&from);
  objc_msgSend(v11, "setAccessibilityTraits:", v6);

  v12 = objc_loadWeakRetained(&from);
  accessibilityLocalizedString(CFSTR("remaining.label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);

  v14 = objc_loadWeakRetained(&from);
  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v34[3] = &unk_250141278;
  objc_copyWeak(&v35, &from);
  objc_msgSend(v14, "_setAccessibilityValueBlock:", v34);

  -[AVTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrubber"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v30 = 3221225472;
  v31 = __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v32 = &unk_250141278;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v15, "_setAccessibilityValueBlock:", &v29);

  -[AVTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_standardPlayPauseButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilitySetIdentification:", CFSTR("axPlayPauseButton"));

  -[AVTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_skipBackButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("media.skip.backwards"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v19, 0x402E000000000000, v29, v30, v31, v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v20);

  -[AVTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_skipForwardButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("media.skip.forward"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringWithFormat:", v23, 0x402E000000000000);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v24);

  accessibilityLocalizedString(CFSTR("next.track"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_startRightwardContentTransitionButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAccessibilityLabel:", v25);

  accessibilityLocalizedString(CFSTR("previous.track"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransportControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_startLeftwardContentTransitionButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAccessibilityLabel:", v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __82__AVTransportControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
