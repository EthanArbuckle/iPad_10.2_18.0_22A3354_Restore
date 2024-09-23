@implementation MultiwayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.MultiwayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("isShowingReactions"), "B");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("localParticipantView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("setControlsState:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("axShouldDisableAutoHidingControls"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("accessibilityConstraintController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("isPipped"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNKFaceTimeConstraintsController"), CFSTR("inCallControlsState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("isOnScreen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("isDisplayedInBanner"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("setDeviceOrientation:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("call"), "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  char v4;
  BOOL result;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  -[MultiwayViewControllerAccessibility _axSetDidExpandControls:](self, "_axSetDidExpandControls:", 0);
  if (-[MultiwayViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isShowingReactions")))
  {
    -[MultiwayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("localParticipantView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityActivate");

    return v4;
  }
  else
  {
    -[MultiwayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("inCallControlsState"));

    v8 = 0;
    result = 0;
    switch(v7)
    {
      case 0:
        return result;
      case 1:
      case 2:
      case 3:
        goto LABEL_6;
      case 4:
        v8 = 1;
        goto LABEL_6;
      case 5:
        v8 = 2;
LABEL_6:
        -[MultiwayViewControllerAccessibility setControlsState:animated:](self, "setControlsState:animated:", v8, 1);
        break;
      default:
        return 1;
    }
    return 1;
  }
}

- (BOOL)_axGetDidExpandControls
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetDidExpandControls:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (int64_t)_axGetExpectedExpandedState
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_axSetExpectedExpandedState:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (void)_accessibilityExpandControls
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[MultiwayViewControllerAccessibility _axSetDidExpandControls:](self, "_axSetDidExpandControls:", 1);
  -[MultiwayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("inCallControlsState"));

  v5 = 4;
  if (v4 == 3)
    v5 = 6;
  if (v4 == 2)
    v6 = 5;
  else
    v6 = v5;
  -[MultiwayViewControllerAccessibility _axSetExpectedExpandedState:](self, "_axSetExpectedExpandedState:", v6);
  -[MultiwayViewControllerAccessibility setControlsState:animated:](self, "setControlsState:animated:", v6, 1);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __67__MultiwayViewControllerAccessibility__accessibilityExpandControls__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axSetDidExpandControls:", 0);
}

- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  BOOL v10;
  UIAccessibilityNotifications *v11;
  objc_super v12;

  v4 = a4;
  if (-[MultiwayViewControllerAccessibility _axGetDidExpandControls](self, "_axGetDidExpandControls")
    && -[MultiwayViewControllerAccessibility _axGetExpectedExpandedState](self, "_axGetExpectedExpandedState") != a3)
  {
    -[MultiwayViewControllerAccessibility _axSetDidExpandControls:](self, "_axSetDidExpandControls:", 0);
  }
  else
  {
    -[MultiwayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("inCallControlsState"));

    v12.receiver = self;
    v12.super_class = (Class)MultiwayViewControllerAccessibility;
    -[MultiwayViewControllerAccessibility setControlsState:animated:](&v12, sel_setControlsState_animated_, a3, v4);
    v10 = a3 != 4 && v8 != 4;
    if (v8 == a3 || v10)
      v11 = (UIAccessibilityNotifications *)MEMORY[0x24BDF72C8];
    else
      v11 = (UIAccessibilityNotifications *)MEMORY[0x24BDF7328];
    UIAccessibilityPostNotification(*v11, 0);
  }
}

- (BOOL)axShouldDisableAutoHidingControls
{
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    return 1;
  else
    return _UIAccessibilityFullKeyboardAccessEnabled();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)MultiwayViewControllerAccessibility;
  -[MultiwayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  -[MultiwayViewControllerAccessibility _axParticipantShutters](self, "_axParticipantShutters");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        accessibilityLocalizedString(CFSTR("take.live.photo"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAccessibilityLabel:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v4);
  }

  -[MultiwayViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__MultiwayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_2501E5B80;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "_setAccessibilityElementsHiddenBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

uint64_t __81__MultiwayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "safeSwiftBoolForKey:", CFSTR("isInVideoMessageFlow")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_loadWeakRetained(v1);
    if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPipped")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v5 = objc_loadWeakRetained(v1);
      if ((objc_msgSend(v5, "safeBoolForKey:", CFSTR("isOnScreen")) & 1) != 0)
      {
        v3 = 0;
      }
      else
      {
        v6 = objc_loadWeakRetained(v1);
        v3 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isDisplayedInBanner")) ^ 1;

      }
    }

  }
  return v3;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MultiwayViewControllerAccessibility;
  -[MultiwayViewControllerAccessibility setDeviceOrientation:](&v14, sel_setDeviceOrientation_);
  if ((AXDeviceIsPad() & 1) == 0)
  {
    objc_opt_class();
    -[MultiwayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("call"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "service") == 3)
    {
      switch(a3)
      {
        case 0:
          v7 = 0;
          v8 = CFSTR("rotate.landscape");
          v9 = 3;
          break;
        case 1:
          v7 = 0;
          v8 = CFSTR("rotate.portrait");
          v9 = 1;
          break;
        case 2:
          v7 = 0;
          v8 = CFSTR("rotate.landscape");
          v9 = 4;
          break;
        case 3:
          v7 = 0;
          v8 = CFSTR("rotate.portrait.upsidedown");
          v9 = 2;
          break;
        default:
          v8 = 0;
          v9 = 1;
          v7 = 1;
          break;
      }
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "_accessibilityApplicationOrientation") != v9)
      {
        objc_msgSend(v10, "_accessibilitySetApplicationOrientation:", v9);
        v11 = -[MultiwayViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOnScreen"));
        v12 = -[MultiwayViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPipped"));
        if (v11)
        {
          if ((v12 & 1) == 0)
          {
            if ((v7 & 1) == 0)
            {
              accessibilityLocalizedString(v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              UIAccessibilitySpeakAndDoNotBeInterrupted();

            }
            UIAccessibilityPostNotification(0x3E8u, 0);
          }
        }
      }

    }
  }
}

- (id)_axParticipantShutters
{
  void *v2;
  void *v3;

  -[MultiwayViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__MultiwayViewControllerAccessibility__axParticipantShutters__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("participant-shutter"));

  return v3;
}

@end
