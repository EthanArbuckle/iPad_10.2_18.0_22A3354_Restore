@implementation SBFolderControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("folderViewDidEndScrolling:"), "v", "@", 0);

}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  AXSBIconControllerSharedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityIconListIndex");

  if (v6)
  {
    v7 = *MEMORY[0x24BDF7328];
    accessibilityLocalizedString(CFSTR("home"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFolderControllerAccessibility;
  -[SBFolderControllerAccessibility scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:](&v9, sel_scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler_, v4);

}

void __102__SBFolderControllerAccessibility_scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler___block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF7328];
  accessibilityLocalizedString(CFSTR("home"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (void)_closeFolderTimerFired
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBFolderControllerAccessibility;
  -[SBFolderControllerAccessibility _closeFolderTimerFired](&v2, sel__closeFolderTimerFired);
  SBAXIconCloseFolderTimerStatus = 0;
}

- (void)_setCloseFolderTimerIfNecessary
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
  objc_super v16;

  -[SBFolderControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeFolderTimer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SBFolderControllerAccessibility;
  -[SBFolderControllerAccessibility _setCloseFolderTimerIfNecessary](&v16, sel__setCloseFolderTimerIfNecessary);
  if (!SBAXPerformingAXDrag)
  {
    -[SBFolderControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeFolderTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 && UIAccessibilityIsVoiceOverRunning())
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFireDate:", v5);

      -[SBFolderControllerAccessibility _accessibilityScheduleSBAXClosingFolderTimer](self, "_accessibilityScheduleSBAXClosingFolderTimer");
    }
    SBAXIconCloseFolderTimerStatus = 1;
    SBHAXCancelSBAXIconMoveSpeakTimer();
    if (v4)
    {
      AXSBHIconManagerFromSharedIconController();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("openedFolder"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("dragged.outside.folder"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safeValueForKey:", CFSTR("displayName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("dragged.outside.folder.hint"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringWithFormat:", v13, 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v13) = *MEMORY[0x24BDF71E8];
        __UIAXStringForVariables();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v13, v15);

      }
    }

  }
}

- (void)_cancelCloseFolderTimer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderControllerAccessibility;
  -[SBFolderControllerAccessibility _cancelCloseFolderTimer](&v3, sel__cancelCloseFolderTimer);
  -[SBFolderControllerAccessibility _accessibilityCancelSBAXClosingFolderTimer](self, "_accessibilityCancelSBAXClosingFolderTimer");
  SBAXIconCloseFolderTimerStatus = 2;
}

- (void)_accessibilitySBAXClosingFolderTimerFired:(id)a3
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDF8]);
}

- (void)_accessibilityCancelSBAXClosingFolderTimer
{
  void *v2;

  objc_msgSend((id)SBAXClosingFolderTimer, "invalidate");
  v2 = (void *)SBAXClosingFolderTimer;
  SBAXClosingFolderTimer = 0;

}

- (void)_accessibilityScheduleSBAXClosingFolderTimer
{
  uint64_t v3;
  void *v4;

  if (SBAXClosingFolderTimer)
    -[SBFolderControllerAccessibility _accessibilityCancelSBAXClosingFolderTimer](self, "_accessibilityCancelSBAXClosingFolderTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__accessibilitySBAXClosingFolderTimerFired_, 0, 1, 1.25);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)SBAXClosingFolderTimer;
  SBAXClosingFolderTimer = v3;

}

- (void)folderViewDidEndScrolling:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFolderControllerAccessibility;
  -[SBFolderControllerAccessibility folderViewDidEndScrolling:](&v10, sel_folderViewDidEndScrolling_, a3);
  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axDragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axGrabbedIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") && !SBAXPerformingAXDrag)
  {
    v6 = objc_msgSend(v3, "_accessibilityIconListIndex") + 1;
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("icon.finished.scroll"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }

}

@end
