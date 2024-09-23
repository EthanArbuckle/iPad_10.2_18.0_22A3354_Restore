@implementation NCNotificationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PLPlatterView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PLPlatterHeaderContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationShortLookView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationLongLookView"));
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationLongLookViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationLongLookView"), CFSTR("_headerContentView"), "PLPlatterHeaderContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("notificationRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDimmableView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationShortLookView"), CFSTR("_notificationContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_notifyObserversWithBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationStructuredListViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("NCNotificationViewControllerObserving"), CFSTR("notificationViewControllerWillBeginUserInteraction:"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("NCNotificationViewControllerObserving"), CFSTR("notificationViewControllerDidEndUserInteraction:"));
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("notificationDispatcher"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBNCNotificationDispatcher"), CFSTR("_dispatcher"), "NCNotificationDispatcher");
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCAlertingController"), CFSTR("screenController"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCScreenController"), CFSTR("canTurnOnScreenForNotificationRequest:"), "B", "@", 0);
  }

}

- (BOOL)_accessibilityAppearanceAnnouncementHandledByEnclosingEntity
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_9, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __105__NCNotificationViewControllerAccessibility__accessibilityAppearanceAnnouncementHandledByEnclosingEntity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349233D4](CFSTR("NCNotificationStructuredListViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  void *v2;
  BOOL v3;

  -[NCNotificationViewControllerAccessibility _axLongLookView](self, "_axLongLookView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationViewControllerAccessibility;
  -[NCNotificationViewControllerAccessibility viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[NCNotificationViewControllerAccessibility _axLongLookView](self, "_axLongLookView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (_AXSAutomationEnabled())
      UIAccessibilityPostNotification(0x3EEu, 0);
    MEMORY[0x23492347C](*MEMORY[0x24BDF7328]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    if (!-[NCNotificationViewControllerAccessibility _accessibilityAppearanceAnnouncementHandledByEnclosingEntity](self, "_accessibilityAppearanceAnnouncementHandledByEnclosingEntity"))AXPerformBlockOnMainThreadAfterDelay();
  }

}

uint64_t __59__NCNotificationViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_axHasSentAnnouncement");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_axSetHasSentAnnouncement:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "_axAnnounceNotification");
  }
  return result;
}

- (BOOL)_axHasSentAnnouncement
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetHasSentAnnouncement:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axHasFinishedAnnouncement
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetHasFinishedAnnouncement:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_axAnnounceNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[NCNotificationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewControllerAccessibility _logNotificationMessage:](self, "_logNotificationMessage:", CFSTR("Notification tried to appear"));
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    MEMORY[0x2349233D4](CFSTR("NCNotificationShortLookView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x24BDFEA60];
      objc_msgSend(v5, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "axAttributedStringWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFECB0]);
      objc_msgSend(v8, "setAttribute:forKey:", v9, *MEMORY[0x24BDFEC18]);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__axHandleAnnouncementFinished, *MEMORY[0x24BDF71D0], 0);

      -[NCNotificationViewControllerAccessibility _logNotificationMessage:](self, "_logNotificationMessage:", CFSTR("Notification posting announcement to VO"));
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);
      if (UIAccessibilityIsVoiceOverRunning())
        -[NCNotificationViewControllerAccessibility _axNotifyWillBeginUserInteraction:](self, "_axNotifyWillBeginUserInteraction:", 0);

    }
  }

}

- (void)_axHandleAnnouncementFinished
{
  void *v3;

  -[NCNotificationViewControllerAccessibility _logNotificationMessage:](self, "_logNotificationMessage:", CFSTR("Notification announcement finished"));
  -[NCNotificationViewControllerAccessibility _axSetHasFinishedAnnouncement:](self, "_axSetHasFinishedAnnouncement:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF71D0], 0);

  -[NCNotificationViewControllerAccessibility _axNotifyWillBeginUserInteraction:](self, "_axNotifyWillBeginUserInteraction:", 0);
  -[NCNotificationViewControllerAccessibility _axNotifyDidEndUserInteraction](self, "_axNotifyDidEndUserInteraction");
}

- (void)_axNotifyWillBeginUserInteraction:(BOOL)a3
{
  if (a3)
  {
    -[NCNotificationViewControllerAccessibility _logNotificationMessage:](self, "_logNotificationMessage:", CFSTR("Notification notifying did begin interaction for focus"));
    -[NCNotificationViewControllerAccessibility _axSetHasFinishedAnnouncement:](self, "_axSetHasFinishedAnnouncement:", 1);
  }
  AXPerformSafeBlock();
}

uint64_t __79__NCNotificationViewControllerAccessibility__axNotifyWillBeginUserInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversWithBlock:", &__block_literal_global_256);
}

void __79__NCNotificationViewControllerAccessibility__axNotifyWillBeginUserInteraction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_logNotificationMessage:", CFSTR("Notification notifying did begin interaction"));
    objc_msgSend(v4, "notificationViewControllerWillBeginUserInteraction:", v5);
  }

}

- (void)_axNotifyDidEndUserInteraction
{
  AXPerformSafeBlock();
}

uint64_t __75__NCNotificationViewControllerAccessibility__axNotifyDidEndUserInteraction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversWithBlock:", &__block_literal_global_261);
}

void __75__NCNotificationViewControllerAccessibility__axNotifyDidEndUserInteraction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_logNotificationMessage:", CFSTR("Notification notifying did end interaction"));
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);
  }

}

- (void)_logNotificationMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  buf[0] = 0;
  -[NCNotificationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00718], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreLogging");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00718], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      AXColorizeFormatLog();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v14;
        _os_log_impl(&dword_232B20000, v11, v12, "%{public}@", buf, 0xCu);
      }

    }
  }

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[NCNotificationViewControllerAccessibility _axLongLookView](self, "_axLongLookView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke;
  v12[3] = &unk_2503BE330;
  v14 = v8;
  v13 = v6;
  v9 = v6;
  v10 = (void *)MEMORY[0x2349236A4](v12);
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationViewControllerAccessibility;
  -[NCNotificationViewControllerAccessibility dismissViewControllerWithTransition:completion:](&v11, sel_dismissViewControllerWithTransition_completion_, v4, v10);

}

uint64_t __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  AXPerformBlockOnMainThreadAfterDelay();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_axLongLookView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349233D4](CFSTR("NCNotificationLongLookViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
