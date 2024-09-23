@implementation PHSlidingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSlidingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("animatedSlidingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("findMyButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("createFindMyUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("medicalIDSlidingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("showSlidingViewModel:animatedSliderCompletion:medicalIDSliderCompletion:shouldMaxVolumeCompletion:"), "v", "@", "@?", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("repeatingUpdateAnimatedSliderForCountdownNumber:forModel:"), "v", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("setSlidingViewState:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingView"), CFSTR("interactiveStartWithCountdownModel:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSNotifyCountdownViewModel"), CFSTR("playsSound"), "B", 0);

}

- (void)createFindMyUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility createFindMyUI](&v3, sel_createFindMyUI);
  -[PHSlidingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PHSlidingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("findMyButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__PHSlidingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2502450B0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __72__PHSlidingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attributedTitleForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility repeatingUpdateAnimatedSliderForCountdownNumber:forModel:](&v6, sel_repeatingUpdateAnimatedSliderForCountdownNumber_forModel_, a3, a4);
  if (a3 <= 4)
  {
    AXFormatInteger();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (void)setSlidingViewState:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  UIAccessibilityNotifications v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PHSlidingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  v15.receiver = self;
  v15.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility setSlidingViewState:](&v15, sel_setSlidingViewState_, a3);
  -[PHSlidingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v10 = v9;

  if (v10 > 0.0 && v7 == 0.0)
  {
    v11 = *MEMORY[0x24BDF72C8];
    -[PHSlidingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v11, v12);

  }
  if (a3 != 1)
  {
    AXLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl(&dword_2326BB000, v13, OS_LOG_TYPE_DEFAULT, "Resetting VO quiet state: %@", buf, 0xCu);

    }
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
  }
}

- (void)interactiveStartWithCountdownModel:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning() && (objc_msgSend(v4, "safeBoolForKey:", CFSTR("playsSound")) & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2326BB000, v5, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we're in quiet mode", buf, 2u);
    }

    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", MEMORY[0x24BDBD1C8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], &stru_250245590);
  }
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility interactiveStartWithCountdownModel:](&v6, sel_interactiveStartWithCountdownModel_, v4);

}

- (void)showSlidingViewModel:(id)a3 animatedSliderCompletion:(id)a4 medicalIDSliderCompletion:(id)a5 shouldMaxVolumeCompletion:(id)a6
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSlidingViewAccessibility;
  -[PHSlidingViewAccessibility showSlidingViewModel:animatedSliderCompletion:medicalIDSliderCompletion:shouldMaxVolumeCompletion:](&v8, sel_showSlidingViewModel_animatedSliderCompletion_medicalIDSliderCompletion_shouldMaxVolumeCompletion_, a3, a4, a5, a6);
  -[PHSlidingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("animatedSlidingButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PHSlidingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("medicalIDSlidingButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v7);

}

@end
