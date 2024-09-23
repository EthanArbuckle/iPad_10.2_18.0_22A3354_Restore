@implementation PHAudioCallViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHAudioCallViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityMiddleViewStateDepth
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_accessibilitySetMiddleViewStateDepth:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (BOOL)_accessibilityWantsToShowKeypad
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetWantsToShowKeypad:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_accessibilityHasSubscribedForBottomBarNotifications
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetHasSubscribedToBottomBarNotifications:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_accessibilityDidAnnounceIncomingCall
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetDidAnnounceIncomingCall:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHAudioCallViewController"), CFSTR("PHCallViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallViewController"), CFSTR("bottomBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("setMiddleViewState:"), "v", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("setCurrentState: animated:"), "v", "S", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallViewController"), CFSTR("currentState"), "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("middleViewState"), "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("slidingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("mainRightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("animating"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("callForBackgroundImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUCall"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("setMiddleViewState: animated: completion:"), "v", "S", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallViewController"), CFSTR("callParticipantsViewController"), "@", 0);

}

- (void)_accessibilitySubscribeForBottomBarNotificationsIfNecessary
{
  void *v3;

  if (!-[PHAudioCallViewControllerAccessibility _accessibilityHasSubscribedForBottomBarNotifications](self, "_accessibilityHasSubscribedForBottomBarNotifications"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilityBottomBarStoppedAnimating_, CFSTR("AXPHBottomBarStoppedAnimatingNotification"), 0);

    -[PHAudioCallViewControllerAccessibility _accessibilitySetHasSubscribedToBottomBarNotifications:](self, "_accessibilitySetHasSubscribedToBottomBarNotifications:", 1);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AXPHBottomBarStoppedAnimatingNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  -[PHAudioCallViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  -[PHAudioCallViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PHAudioCallViewControllerAccessibility _accessibilitySubscribeForBottomBarNotificationsIfNecessary](self, "_accessibilitySubscribeForBottomBarNotificationsIfNecessary");
  -[PHAudioCallViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __84__PHAudioCallViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceIncomingCall");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  -[PHAudioCallViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PHAudioCallViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[PHAudioCallViewControllerAccessibility _accessibilityAnnounceIncomingCall](self, "_accessibilityAnnounceIncomingCall");
}

- (void)_accessibilityAnnounceIncomingCall
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  if (!-[PHAudioCallViewControllerAccessibility _accessibilityDidAnnounceIncomingCall](self, "_accessibilityDidAnnounceIncomingCall"))
  {
    -[PHAudioCallViewControllerAccessibility _accessibilitySetDidAnnounceIncomingCall:](self, "_accessibilitySetDidAnnounceIncomingCall:", 1);
    if (UIAccessibilityIsVoiceOverRunning())
    {
      -[PHAudioCallViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomBar"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("slidingButton"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("mainRightButton"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v4)
        v7 = v4;
      else
        v7 = (void *)v5;
      v8 = v7;
      -[PHAudioCallViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("callParticipantsViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      axStringForCallParticipantsView(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "incomingCall");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && v12)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("incoming.call"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v19 = *MEMORY[0x24BDFEAD8];
        v23[0] = *MEMORY[0x24BDFECB0];
        v23[1] = v19;
        v24[0] = MEMORY[0x24BDBD1C8];
        v24[1] = &unk_250248C60;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v18, "initWithString:attributes:", v17, v20);

        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v21);
      }
      if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
      {
        v22 = v8;
        AXPerformBlockOnMainThreadAfterDelay();

      }
    }
  }
}

uint64_t __76__PHAudioCallViewControllerAccessibility__accessibilityAnnounceIncomingCall__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], *(id *)(a1 + 32));
  return _AXIgnoreNextNotification();
}

- (void)_axSetPhoneToMiddleState:(unsigned __int16)a3 totalTimeTried:(double)a4
{
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[PHAudioCallViewControllerAccessibility _accessibilitySetWantsToShowKeypad:](self, "_accessibilitySetWantsToShowKeypad:", 0);
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCalls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 4
    && a4 <= 4.0
    && UIAccessibilityIsVoiceOverRunning()
    && objc_msgSend(v8, "service") == 1
    && (objc_msgSend(v8, "isTTY") & 1) == 0
    && (objc_msgSend(v8, "isRTT") & 1) == 0)
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }

}

void __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  v7 = *(_QWORD *)(a1 + 40);
  LOBYTE(v6) = 1;
  _AXLogWithFacility();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("bottomBar"), v6, CFSTR("Setting middle state to keyboard: %f"), v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("animating"));
  if (objc_msgSend(*(id *)(a1 + 32), "_accessibilityMiddleViewStateDepth") > 0)
    v4 = 1;
  else
    v4 = v3;
  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetWantsToShowKeypad:", 1);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke_2;
    v8[3] = &unk_250244F40;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)(a1 + 40);
    objc_msgSend(v5, "setMiddleViewState:animated:completion:", 2, 1, v8);
    objc_destroyWeak(v9);
  }

  objc_destroyWeak(&location);
}

void __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "safeIntForKey:", CFSTR("middleViewState"));

  if (v4 != 2)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_axSetPhoneToMiddleState:totalTimeTried:", (unsigned __int16)objc_msgSend(v5, "safeIntForKey:", CFSTR("currentState")), *(double *)(a1 + 40) + 0.5);

  }
}

- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  unsigned __int16 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[PHAudioCallViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("currentState"));
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallViewControllerAccessibility;
  -[PHAudioCallViewControllerAccessibility setCurrentState:animated:](&v8, sel_setCurrentState_animated_, v5, v4);
  if ((_DWORD)v5 != v7)
  {
    -[PHAudioCallViewControllerAccessibility _axSetPhoneToMiddleState:totalTimeTried:](self, "_axSetPhoneToMiddleState:totalTimeTried:", v5, 0.0);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }
}

- (void)_accessibilityBottomBarStoppedAnimating:(id)a3
{
  if (-[PHAudioCallViewControllerAccessibility _accessibilityWantsToShowKeypad](self, "_accessibilityWantsToShowKeypad", a3))
  {
    -[PHAudioCallViewControllerAccessibility _axSetPhoneToMiddleState:totalTimeTried:](self, "_axSetPhoneToMiddleState:totalTimeTried:", (unsigned __int16)-[PHAudioCallViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("currentState")), 0.0);
  }
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  int64_t v9;
  int v10;
  BOOL v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  id location;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = -[PHAudioCallViewControllerAccessibility _accessibilityMiddleViewStateDepth](self, "_accessibilityMiddleViewStateDepth");
  v10 = -[PHAudioCallViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("middleViewState"));
  v11 = v10 == (_DWORD)v6;
  if (v10 != (_DWORD)v6)
    -[PHAudioCallViewControllerAccessibility _accessibilitySetMiddleViewStateDepth:](self, "_accessibilitySetMiddleViewStateDepth:", v9 + 1);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__PHAudioCallViewControllerAccessibility_setMiddleViewState_animated_completion___block_invoke;
  v14[3] = &unk_250244F90;
  v12 = v8;
  v15 = v12;
  objc_copyWeak(&v16, &location);
  v17 = v11;
  v14[4] = self;
  v13.receiver = self;
  v13.super_class = (Class)PHAudioCallViewControllerAccessibility;
  -[PHAudioCallViewControllerAccessibility setMiddleViewState:animated:completion:](&v13, sel_setMiddleViewState_animated_completion_, v6, v5, v14);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __81__PHAudioCallViewControllerAccessibility_setMiddleViewState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "_accessibilityMiddleViewStateDepth");
  v4 = v3 - 1;
  if (*(_BYTE *)(a1 + 56))
    v5 = 1;
  else
    v5 = v3 < 1;
  if (!v5)
    objc_msgSend(WeakRetained, "_accessibilitySetMiddleViewStateDepth:", v4);
  if (!v4 && objc_msgSend(*(id *)(a1 + 32), "_accessibilityWantsToShowKeypad"))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_axSetPhoneToMiddleState:totalTimeTried:", (unsigned __int16)objc_msgSend(v6, "safeIntForKey:", CFSTR("currentState")), 0.0);

  }
}

@end
