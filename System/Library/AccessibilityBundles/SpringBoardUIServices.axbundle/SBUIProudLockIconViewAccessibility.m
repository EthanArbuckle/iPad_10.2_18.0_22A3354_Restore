@implementation SBUIProudLockIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIProudLockIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIProudLockIconView"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIProudLockIconView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIProudLockIconView"), CFSTR("setState:animated:updateText:options:completion:"), "v", "q", "B", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIProudLockIconView"), CFSTR("_lockView"), "BSUICAPackageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUICAPackageView"), CFSTR("_stateController"), "CAStateController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUICAPackageView"), CFSTR("_rootLayer"), "CALayer");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBUIProudLockIconViewAccessibility;
  -[SBUIProudLockIconViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v10 = 0;
  objc_opt_class();
  -[SBUIProudLockIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250390308;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_2503901F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

uint64_t __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "lockViewIsAccessibilityElement");

  return v2;
}

id __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lockViewAccessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)lockViewIsAccessibilityElement
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  v3 = -[SBUIProudLockIconViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state"));
  v4 = AXRequestingClient();
  v5 = -[SBUIProudLockIconViewAccessibility _accessibilityIsBuddyRunning](self, "_accessibilityIsBuddyRunning");
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 4;
  v7 = v6;
  return !v5 && v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)lockViewAccessibilityLabel
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIProudLockIconViewAccessibility;
  -[SBUIProudLockIconViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUIProudLockIconViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state")) - 1;
  if (v4 <= 0x12 && ((0x4007Fu >> v4) & 1) != 0)
  {
    accessibilitySBLocalizedString(*(&off_250390348 + v4));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)_accessibilityIsInSleepState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[SBUIProudLockIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_stateController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_rootLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v7 && v5)
  {
    objc_msgSend(v5, "stateOfLayer:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("Sleep"));
  }

  return v8;
}

- (BOOL)_accessibilityIsBuddyRunning
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "purpleBuddyPID") != -1;

  return v3;
}

- (SBUIProudLockIconViewAccessibility)initWithFrame:(CGRect)a3
{
  SBUIProudLockIconViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIProudLockIconViewAccessibility;
  v3 = -[SBUIProudLockIconViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBUIProudLockIconViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  int64_t v18;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  if (-[SBUIProudLockIconViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state")) != a3
    && UIAccessibilityIsVoiceOverRunning()
    && !-[SBUIProudLockIconViewAccessibility _accessibilityIsBuddyRunning](self, "_accessibilityIsBuddyRunning")
    && !-[SBUIProudLockIconViewAccessibility _accessibilityIsInSleepState](self, "_accessibilityIsInSleepState"))
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __86__SBUIProudLockIconViewAccessibility_setState_animated_updateText_options_completion___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0l;
    v18 = a3;
    AXPerformBlockOnMainThread();
  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIProudLockIconViewAccessibility;
  -[SBUIProudLockIconViewAccessibility setState:animated:updateText:options:completion:](&v13, sel_setState_animated_updateText_options_completion_, a3, v9, v8, a6, v12);

}

void __86__SBUIProudLockIconViewAccessibility_setState_animated_updateText_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1 == 7 || v1 == 3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6C10]);
    objc_msgSend(v3, "notificationOccurred:", 2);

  }
  else if (v1 == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6C10]);
    objc_msgSend(v4, "notificationOccurred:", 0);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE18]);

  }
}

@end
