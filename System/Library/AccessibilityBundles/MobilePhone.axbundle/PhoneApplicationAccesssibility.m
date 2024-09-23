@implementation PhoneApplicationAccesssibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhoneApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PhoneTabBarController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PHVoicemailGreetingViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MPVoicemailTableViewController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("sharedPlayerController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PhoneApplication"), CFSTR("rootViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioRecorder"), CFSTR("stop"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("pause"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("play"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVoicemailTableViewController"), CFSTR("detailIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailGreetingViewController"), CFSTR("recordStopButtonTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PhoneRootViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PhoneTabBarController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PhoneTabBarController"), CFSTR("keypadViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PhoneTabBarController"), CFSTR("currentTabViewType"), "i", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPKeypadViewController"), CFSTR("DialerController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DialerController"), CFSTR("_dialerView"), "PHAbstractDialerView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PhoneTabBarController"), CFSTR("_voicemailViewController"), "PHVoicemailNavigationController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHVoicemailNavigationController"), CFSTR("_inboxViewController"), "MPVoicemailTableViewController<PHVoicemailListProtocol>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPVoicemailTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("phonePadView"), "@", 0);

}

- (id)_accessibilitySoftwareMimicKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  __int16 v14;

  v14 = 0;
  -[PhoneApplicationAccesssibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("baseViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "safeIntForKey:", CFSTR("currentTabViewType")) != 4)
    goto LABEL_5;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("keypadViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HIBYTE(v14) = 0;
  objc_msgSend(v8, "safeValueForKey:", CFSTR("_dialerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "safeValueForKey:", CFSTR("phonePadView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "_accessibilityViewIsVisible"))
  {

LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)PhoneApplicationAccesssibility;
    -[PhoneApplicationAccesssibility _accessibilitySoftwareMimicKeyboard](&v13, sel__accessibilitySoftwareMimicKeyboard);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

LABEL_6:
  return v11;
}

- (BOOL)accessibilityStartStopToggle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PhoneApplicationAccesssibility;
  if (!-[PhoneApplicationAccesssibility accessibilityStartStopToggle](&v20, sel_accessibilityStartStopToggle))
  {
    -[PhoneApplicationAccesssibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("baseViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    NSClassFromString(CFSTR("PhoneTabBarController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("modalViewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("visibleViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      NSClassFromString(CFSTR("PHVoicemailGreetingViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v7;
        AXPerformSafeBlock();

      }
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_voicemailViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("PHVoicemailNavigationController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "safeValueForKey:", CFSTR("_inboxViewController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safeValueForKey:", CFSTR("selectedVoicemail"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          objc_msgSend(v9, "safeValueForKey:", CFSTR("detailIndexPath"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          objc_msgSend(v9, "safeValueForKey:", CFSTR("tableView"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "cellForRowAtIndexPath:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[objc_class safeValueForKey:](NSClassFromString(CFSTR("PHVoicemailPlayerController")), "safeValueForKey:", CFSTR("sharedPlayerController"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v18;
            AXPerformSafeBlock();

          }
        }

      }
    }

  }
  return 1;
}

uint64_t __62__PhoneApplicationAccesssibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordStopButtonTapped");
}

uint64_t __62__PhoneApplicationAccesssibility_accessibilityStartStopToggle__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isPlaying"));
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "pause");
  else
    return objc_msgSend(v3, "play");
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __83__PhoneApplicationAccesssibility__accessibilityAllowsNotificationsDuringSuspension__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "currentCallCount") != 0;

}

@end
