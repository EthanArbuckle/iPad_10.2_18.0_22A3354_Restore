@implementation AXSB

double __85__AXSB_UIAlertControllerSafeCategory__applyAccessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;

  return v3;
}

void __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    v5 = v7;
  }
  objc_msgSend(v5, "addTransactionDidCompleteBlock:", &__block_literal_global_2048);

}

uint64_t __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x24BEBDF78], "_performBlockAfterCATransactionCommits:", &__block_literal_global_2049);
}

uint64_t __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_3()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_4()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE00410], 0, 0, 1u);
}

uint64_t __73__AXSB_SBAssistantControllerSafeCategory__axDismissSiriForAssistiveTouch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_axSetSiriDismissalIsForAssistiveTouch:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_axSiriDismissalOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:", 1, 0, v3, v6, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_axSetSiriDismissalIsForAssistiveTouch:", 0);
}

@end
