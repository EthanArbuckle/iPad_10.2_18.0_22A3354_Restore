@implementation CKMessagesSceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate sceneWillEnterForeground:](&v5, sel_sceneWillEnterForeground_, a3);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate _prepareForResume:](self, "_prepareForResume:", objc_msgSend(v4, "systemIsAnimatingApplicationLifecycleEvent"));

}

- (void)_prepareForResume:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "prepareForResume, animating %@", (uint8_t *)&v18, 0xCu);
    }

  }
  +[CKPluginExtensionStateObserver _sharedInstanceIfInitialized](CKPluginExtensionStateObserver, "_sharedInstanceIfInitialized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForResume");

  if (-[CKMessagesSceneDelegate isSuspended](self, "isSuspended"))
  {
    CKResetCachedUserSettings();
    IMResetCachedUserSettings();
    IMResetCachedCarrierSettings();
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetCacheSubscriptionInfo");

    if (CKiMessageSupported())
    {
      objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "blockUntilConnected");

    }
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareForResume");

    -[CKMessagesSceneDelegate _scheduleDeferredSetup](self, "_scheduleDeferredSetup");
    if (-[CKMessagesSceneDelegate _shouldShowMadridRegistrationView](self, "_shouldShowMadridRegistrationView"))
    {
      -[CKMessagesSceneDelegate _updateMadridRegistrationViewAnimated:](self, "_updateMadridRegistrationViewAnimated:", 1);
    }
    else if (!-[CKMessagesSceneDelegate handlingLaunchTask](self, "handlingLaunchTask"))
    {
      -[CKMessagesSceneDelegate storedState](self, "storedState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUserActivityHandler restoreState:navigationProvider:](CKUserActivityHandler, "restoreState:navigationProvider:", v11, v12);

    }
    -[CKMessagesSceneDelegate setHandlingLaunchTask:](self, "setHandlingLaunchTask:", 0);
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentControllerDidResume:animating:", -[CKMessagesSceneDelegate isLocked](self, "isLocked"), v3);

    -[CKMessagesSceneDelegate setLocked:](self, "setLocked:", 0);
    -[CKMessagesSceneDelegate setSuspended:](self, "setSuspended:", 0);
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentConversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateUserActivity");

    -[CKSceneDelegate updateSceneActivationConditions](self, "updateSceneActivationConditions");
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_clearFailureBadge");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CKClientDidResumeNotification"), 0, 0, 1u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CKMessagesSceneDelegate sceneDidBecomeActive:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate sceneDidBecomeActive:](&v7, sel_sceneDidBecomeActive_, v4);
  if (!-[CKMessagesSceneDelegate isSuspended](self, "isSuspended"))
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentControllerDidBecomeActive");

  }
  -[CKMessagesSceneDelegate _showMadridRegistrationViewIfNecessary](self, "_showMadridRegistrationViewIfNecessary");

}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)_showMadridRegistrationViewIfNecessary
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnected");

  if ((v4 & 1) != 0)
  {
    if (CKRegistrationBypassEnabled()
      || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isRunningInStoreDemoMode"),
          v5,
          v6))
    {
      -[CKMessagesSceneDelegate presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___showMadridRegistrationViewIfNecessary, 0);
      -[CKMessagesSceneDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___showMadridRegistrationViewIfNecessary, 0, 0.0);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(33);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Not showing registration view as we aren't connected to the daemon", v8, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    -[CKMessagesSceneDelegate presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
  }
}

- (void)presentOnboardingViewControllerIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPresentOnboarding");

  if (v4)
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentOnboardingViewControllerIfNeeded");

  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
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
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "scene %@ will connect to session: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v10, "URLContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_itemProviderCollections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v12, "count"))
      -[CKMessagesSceneDelegate scene:openURLContexts:](self, "scene:openURLContexts:", v8, v12);
    if (objc_msgSend(v13, "count"))
      -[CKMessagesSceneDelegate _scene:openItemProviders:](self, "_scene:openItemProviders:", v8, v13);
  }
  else if (!-[CKMessagesSceneDelegate handlingLaunchTask](self, "handlingLaunchTask"))
  {
    objc_msgSend(v10, "shortcutItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v10, "shortcutItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "chatController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKShortcutHandler performActionForShortcutItem:navigationProvider:chatController:completion:](CKShortcutHandler, "performActionForShortcutItem:navigationProvider:chatController:completion:", v21, v22, v24, &__block_literal_global_82_2);

    }
    else
    {
      objc_msgSend(v10, "userActivities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stateRestorationActivity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUserActivityHandler messagesScene:willConnectToSession:userActivities:stateRestorationActivity:windowSceneDelegate:](CKUserActivityHandler, "messagesScene:willConnectToSession:userActivities:stateRestorationActivity:windowSceneDelegate:", v8, v9, v21, v25, self);

    }
  }
  -[CKMessagesSceneDelegate _scheduleDeferredSetup](self, "_scheduleDeferredSetup");
  v26.receiver = self;
  v26.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate scene:willConnectToSession:options:](&v26, sel_scene_willConnectToSession_options_, v8, v9, v10);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pendingAppleEventInfoDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPendingAppleEventInfoDictionary:", 0);

    -[CKMessagesSceneDelegate processAppleEventDictionary:](self, "processAppleEventDictionary:", v15);
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pendingLaunchEventContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPendingLaunchEventContext:", 0);

    -[CKMessagesSceneDelegate processLaunchEventContext:](self, "processLaunchEventContext:", v18);
  }

}

- (BOOL)handlingLaunchTask
{
  return self->_handlingLaunchTask;
}

- (void)_scheduleDeferredSetup
{
  id v2;

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_performResumeDeferredSetup, 0, 0.0);

}

- (CKMessagesSceneDelegate)init
{
  CKMessagesSceneDelegate *v2;
  CKMessagesController *v3;
  CKMessagesController *messagesController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKMessagesSceneDelegate;
  v2 = -[CKSceneDelegate init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CKMessagesController);
    messagesController = v2->_messagesController;
    v2->_messagesController = v3;

    -[CKMessagesSceneDelegate messagesController](v2, "messagesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessagesControllerDelegate:", v2);

    -[CKSceneDelegate window](v2, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesSceneDelegate messagesController](v2, "messagesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRootViewController:", v7);

    if ((objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleAccountsChanged_, *MEMORY[0x1E0D35268], 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleDaemonConnected_, *MEMORY[0x1E0D35530], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleDaemonDisconnected_, *MEMORY[0x1E0D35538], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__chatItemsDidChange_, *MEMORY[0x1E0D35328], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__conversationFilteringStateChangedNotification_, CKMessageFilteringChangedNotification[0], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__conversationFilteringStateChangedNotification_, CKMessageSpamFilteringChangedNotification, 0);
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, &__block_literal_global_272);

    +[CKLinkIntentsManager sharedManager](CKLinkIntentsManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesSceneDelegate messagesController](v2, "messagesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerMessagesNavigator:", v12);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_shouldShowRegistrationOverride = objc_msgSend(v13, "BOOLForKey:", CFSTR("AlwaysShowMadridRegistration"));

  }
  return v2;
}

- (CKMessagesController)messagesController
{
  return self->_messagesController;
}

- (void)__showMadridRegistrationViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  CKMessagesSceneDelegate *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((CKiMessageSupported() && !objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled")
     || self->_shouldShowRegistrationOverride)
    && -[CKMessagesSceneDelegate _shouldShowMadridRegistrationView](self, "_shouldShowMadridRegistrationView"))
  {
    v22 = self;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountsForService:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v30)
    {
      v6 = *(_QWORD *)v34;
      v29 = *MEMORY[0x1E0D36E28];
      v28 = *MEMORY[0x1E0D36E18];
      v27 = *MEMORY[0x1E0D36E20];
      v26 = *MEMORY[0x1E0D35280];
      v25 = *MEMORY[0x1E0D35288];
      v24 = *MEMORY[0x1E0D35278];
      v23 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v8, "registrationFailureReason") == 20
            || objc_msgSend(v8, "registrationFailureReason") == 26)
          {
            objc_msgSend(v8, "registrationFailureAlertInfo");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v29);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v28);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v27);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v26);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "valueForKey:", v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "integerValue");

            if (v15 == 1)
            {
              objc_msgSend(v13, "valueForKey:", v24);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
            if (v10)
              v17 = 0;
            else
              v17 = v12 == 0;
            v18 = v17 && v11 == 0;
            if (!v18 && (sAlreadyShowUserNotificationDialogForCurrentLoginCycle & 1) == 0)
            {
              sAlreadyShowUserNotificationDialogForCurrentLoginCycle = 1;
              objc_msgSend(MEMORY[0x1E0D36B00], "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", CFSTR("ServerAlerts"), v10, v12, v11, v16, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
              v20 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __66__CKMessagesSceneDelegate___showMadridRegistrationViewIfNecessary__block_invoke;
              v31[3] = &unk_1E275A900;
              v32 = v13;
              objc_msgSend(v21, "addUserNotification:listener:completionHandler:", v19, 0, v31);

              v5 = v20;
              v6 = v23;

            }
          }
        }
        v30 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v30);
    }

    -[CKMessagesSceneDelegate _updateMadridRegistrationViewAnimated:](v22, "_updateMadridRegistrationViewAnimated:", 1);
  }
  else
  {
    -[CKMessagesSceneDelegate presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
  }
}

void __31__CKMessagesSceneDelegate_init__block_invoke()
{
  void *v0;
  NSObject *v1;
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v2 = CFSTR("YES");
      if (!v0)
        v2 = CFSTR("NO");
      v3 = 138412290;
      v4 = v2;
      _os_log_impl(&dword_18DFCD000, v1, OS_LOG_TYPE_INFO, "Initialized IDSServerBag: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)setHandlingLaunchTask:(BOOL)a3
{
  self->_handlingLaunchTask = a3;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[CKMessagesSceneDelegate setHandlingLaunchTask:](self, "setHandlingLaunchTask:", 1);
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chatController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler messagesScene:continueUserActivity:withNavigationProvider:chatController:completion:](CKUserActivityHandler, "messagesScene:continueUserActivity:withNavigationProvider:chatController:completion:", v7, v6, v10, v9, &__block_literal_global_99_4);

}

- (void)dealloc
{
  objc_super v3;

  -[CKMessagesSceneDelegate _destroyMadridRegistrationView](self, "_destroyMadridRegistrationView");
  v3.receiver = self;
  v3.super_class = (Class)CKMessagesSceneDelegate;
  -[CKMessagesSceneDelegate dealloc](&v3, sel_dealloc);
}

- (int64_t)type
{
  return 0;
}

- (void)processAppleEventDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler processAppleEventDictionary:animate:navigationProvider:chatController:](CKUserActivityHandler, "processAppleEventDictionary:animate:navigationProvider:chatController:", v4, 1, v7, v6);

}

- (void)processLaunchEventContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler processLaunchEventContext:animate:navigationProvider:chatController:](CKUserActivityHandler, "processLaunchEventContext:animate:navigationProvider:chatController:", v4, 1, v7, v6);

}

void __62__CKMessagesSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (a2)
        v4 = CFSTR("YES");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "performActionForShortcutItem in willConnectToSession completed: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CKMessagesSceneDelegate sceneWillResignActive:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate sceneWillResignActive:](&v6, sel_sceneWillResignActive_, v4);
  -[CKMessagesSceneDelegate setHandlingLaunchTask:](self, "setHandlingLaunchTask:", 0);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CKMessagesSceneDelegate sceneDidEnterBackground:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate sceneDidEnterBackground:](&v6, sel_sceneDidEnterBackground_, v4);
  -[CKMessagesSceneDelegate _prepareForSuspend](self, "_prepareForSuspend");

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CKMessagesSceneDelegate sceneDidDisconnect:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate sceneDidDisconnect:](&v9, sel_sceneDidDisconnect_, v4);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistColumnWidths:", self);

    }
  }
  -[CKMessagesSceneDelegate _cancelPendingAppSnapshotUpdate](self, "_cancelPendingAppSnapshotUpdate");
  -[CKMessagesSceneDelegate _prepareForSuspend](self, "_prepareForSuspend");

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesSceneDelegate;
  -[CKSceneDelegate stateRestorationActivityForScene:](&v10, sel_stateRestorationActivityForScene_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate _updateStoredState](self, "_updateStoredState");
  -[CKMessagesSceneDelegate storedState](self, "storedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Archiving messages scene state object: %@", buf, 0xCu);
    }

  }
  +[CKSceneDelegate userInfoDictionaryForState:](CKSceneDelegate, "userInfoDictionaryForState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addUserInfoEntriesFromDictionary:", v8);

  return v5;
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  -[CKMessagesSceneDelegate setHandlingLaunchTask:](self, "setHandlingLaunchTask:", 1);
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__CKMessagesSceneDelegate_windowScene_performActionForShortcutItem_completionHandler___block_invoke;
  v13[3] = &unk_1E274C308;
  v14 = v7;
  v12 = v7;
  +[CKShortcutHandler performActionForShortcutItem:navigationProvider:chatController:completion:](CKShortcutHandler, "performActionForShortcutItem:navigationProvider:chatController:completion:", v8, v9, v11, v13);

}

uint64_t __86__CKMessagesSceneDelegate_windowScene_performActionForShortcutItem_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_prepareForSuspend
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "prepareForSuspend", buf, 2u);
    }

  }
  +[CKSpringBoardActionManager sharedInstance](CKSpringBoardActionManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateShortcutItems");

  if (!-[CKMessagesSceneDelegate isSuspended](self, "isSuspended"))
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForSuspend");

    -[CKMessagesSceneDelegate setLocked:](self, "setLocked:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "isSuspendedUnderLock"));
    if (-[CKMessagesSceneDelegate isLocked](self, "isLocked"))
      goto LABEL_13;
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isComposingMessage"))
    {
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "currentCompositionHasContent"))
      {

      }
      else
      {
        +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasActiveConversations");

        if (!v9)
          goto LABEL_13;
        -[CKMessagesSceneDelegate messagesController](self, "messagesController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cancelNewMessageCompositionAnimated:", 0);
      }
    }

LABEL_13:
    -[CKMessagesSceneDelegate _updateStoredState](self, "_updateStoredState");
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke;
    v16[3] = &unk_1E274A178;
    v16[4] = buf;
    v11 = objc_msgSend(v10, "beginBackgroundTaskWithExpirationHandler:", v16);

    *((_QWORD *)v18 + 3) = v11;
    -[CKMessagesSceneDelegate _clearOldInputContextIdentifiersIfNeeded](self, "_clearOldInputContextIdentifiersIfNeeded");
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isProtectedDataAvailable"))
    {
      if (CKHasAnyWatchPaired())
      {
        v13 = CKActivePairedWatchSupportsEncryptedKeys();

        if ((v13 & 1) == 0)
          goto LABEL_20;
      }
      else
      {

      }
      CKMigrateTextInputIdentifiersIfNeeded();
    }
    else
    {

    }
LABEL_20:
    v14 = *MEMORY[0x1E0CEB390];
    if (*((_QWORD *)v18 + 3) != *MEMORY[0x1E0CEB390])
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endBackgroundTask:", *((_QWORD *)v18 + 3));

      *((_QWORD *)v18 + 3) = v14;
    }
    -[CKMessagesSceneDelegate setSuspended:](self, "setSuspended:", 1);
    _Block_object_dispose(buf, 8);
  }
}

void __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke(uint64_t a1)
{
  NSObject *v2;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke_cold_1(v2);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0CEB390];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKMessagesSceneDelegate;
  v6 = a4;
  v7 = a3;
  -[CKSceneDelegate scene:openURLContexts:](&v18, sel_scene_openURLContexts_, v7, v6);
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_sourceProcessHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessagesSceneDelegate setHandlingLaunchTask:](self, "setHandlingLaunchTask:", 1);
  v14 = objc_msgSend(v7, "activationState");

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chatController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler openURL:animate:sourceApplication:originatingProcess:navigationProvider:chatController:completion:](CKUserActivityHandler, "openURL:animate:sourceApplication:originatingProcess:navigationProvider:chatController:completion:", v9, v14 == 0, v11, v13, v15, v17, &__block_literal_global_109_3);

}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKMessagesSceneDelegate;
  v6 = a4;
  -[CKSceneDelegate _scene:openItemProviders:](&v10, sel__scene_openItemProviders_, a3, v6);
  -[CKMessagesSceneDelegate messagesController](self, "messagesController", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chatController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler openItemProviders:navigationProvider:chatController:](CKUserActivityHandler, "openItemProviders:navigationProvider:chatController:", v6, v7, v9);

}

- (void)_updateStoredState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Updating stored CKSceneDelegateState", buf, 2u);
    }

  }
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isComposingMessage");

  if ((_DWORD)v5)
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentCompositionHasContent");

  }
  else
  {
    v7 = 0;
  }
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v8, "isShowingSelectionView");

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v9, "isCollapsed");

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v10, "isTopVCChatNavigationController");

  if ((_DWORD)v5
    && (-[CKMessagesSceneDelegate messagesController](self, "messagesController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isCollapsed"),
        v11,
        v12))
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "composeChatController");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatController");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  objc_msgSend(v15, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conversationListController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "filterMode");

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isShowingInboxViewController");

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "relevantUnreadLastMessages");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("NO");
      *(_DWORD *)buf = 138414338;
      if (v35)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      if (v36)
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      if (v37)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      if ((_DWORD)v7)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      if ((_DWORD)v5)
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      v39 = v32;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v30;
      v44 = 2112;
      v45 = v29;
      if (v21)
        v27 = CFSTR("YES");
      v46 = 2112;
      v47 = v28;
      v48 = 2112;
      v49 = v16;
      v50 = 2112;
      v51 = v25;
      v52 = 2112;
      v53 = v27;
      v54 = 2112;
      v55 = v23;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "upating stored state. isComposingNewMessage: %@ messageHasContent: %@ isShowingSelectionView: %@ isControllerCollapsed: %@ isTopVCChatNavigationController: %@ conversation: %@ filterMode: %@ isShowingInbox: %@ unreadLastMessages: %@", buf, 0x5Cu);

    }
  }
  LOBYTE(v34) = v21;
  +[CKSceneDelegateState stateFromIsComposingNewMessage:messageHasContent:isShowingBlankTranscript:isControllerCollapsed:isTopVCChatNavigationController:conversation:filterMode:isShowingInbox:unreadMessages:](CKSceneDelegateState, "stateFromIsComposingNewMessage:messageHasContent:isShowingBlankTranscript:isControllerCollapsed:isTopVCChatNavigationController:conversation:filterMode:isShowingInbox:unreadMessages:", v5, v7, v37, v36, v35, v16, v19, v34, v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesSceneDelegate setStoredState:](self, "setStoredState:", v33);

}

- (void)setStoredState:(id)a3
{
  CKSceneDelegateState *v4;
  NSObject *v5;
  CKSceneDelegateState *storedState;
  int v7;
  CKSceneDelegateState *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (CKSceneDelegateState *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating stored state to: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  storedState = self->_storedState;
  self->_storedState = v4;

}

- (void)_handleAccountsChanged:(id)a3
{
  _BOOL4 v4;
  CKRegistrationViewController *madridRegistrationController;

  v4 = -[CKMessagesSceneDelegate _shouldShowMadridRegistrationView](self, "_shouldShowMadridRegistrationView", a3);
  madridRegistrationController = self->_madridRegistrationController;
  if (v4)
  {
    if (!madridRegistrationController)
    {
      -[CKMessagesSceneDelegate _updateStoredState](self, "_updateStoredState");
      -[CKMessagesSceneDelegate _showMadridRegistrationViewIfNecessary](self, "_showMadridRegistrationViewIfNecessary");
    }
  }
  else if (madridRegistrationController)
  {
    -[CKMessagesSceneDelegate _updateMadridRegistrationViewAnimated:](self, "_updateMadridRegistrationViewAnimated:", 1);
  }
}

- (void)_handleDaemonConnected:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_handleDaemonConnected: [%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  if (-[CKMessagesSceneDelegate _shouldShowMadridRegistrationView](self, "_shouldShowMadridRegistrationView"))
    -[CKMessagesSceneDelegate _updateMadridRegistrationViewAnimated:](self, "_updateMadridRegistrationViewAnimated:", 1);

}

- (void)_handleDaemonDisconnected:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectToDaemon");

  if (!self->_madridRegistrationController)
  {
    -[CKMessagesSceneDelegate _updateStoredState](self, "_updateStoredState");
    -[CKMessagesSceneDelegate _showMadridRegistrationViewIfNecessary](self, "_showMadridRegistrationViewIfNecessary");
  }
}

void __66__CKMessagesSceneDelegate___showMadridRegistrationViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *MEMORY[0x1E0D35288]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") != 1)
    goto LABEL_4;
  v4 = objc_msgSend(v7, "response");

  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *MEMORY[0x1E0D35290]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openSensitiveURL:withOptions:", v6, 0);

LABEL_4:
  }

}

- (void)_madridRegistrationControllerDidComplete
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "First run controller finished. Dismissing and restoring state", buf, 2u);
    }

  }
  if ((-[CKRegistrationViewController isViewLoaded](self->_madridRegistrationController, "isViewLoaded") & 1) != 0)
  {
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__CKMessagesSceneDelegate__madridRegistrationControllerDidComplete__block_invoke;
    v7[3] = &unk_1E274A208;
    v7[4] = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    -[CKMessagesSceneDelegate _destroyMadridRegistrationView](self, "_destroyMadridRegistrationView");
    -[CKMessagesSceneDelegate storedState](self, "storedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUserActivityHandler restoreState:navigationProvider:](CKUserActivityHandler, "restoreState:navigationProvider:", v5, v6);

    -[CKMessagesSceneDelegate presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
  }
}

uint64_t __67__CKMessagesSceneDelegate__madridRegistrationControllerDidComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_destroyMadridRegistrationView");
  objc_msgSend(*(id *)(a1 + 32), "storedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messagesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler restoreState:navigationProvider:](CKUserActivityHandler, "restoreState:navigationProvider:", v2, v3);

  return objc_msgSend(*(id *)(a1 + 32), "presentOnboardingViewControllerIfNeeded");
}

- (void)_createMadridRegistrationViewIfNecessary
{
  CKRegistrationViewController *v3;
  CKRegistrationViewController *madridRegistrationController;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (CKiMessageSupported())
  {
    if (!self->_madridRegistrationController)
    {
      v3 = objc_alloc_init(CKRegistrationViewController);
      madridRegistrationController = self->_madridRegistrationController;
      self->_madridRegistrationController = v3;

      -[CKRegistrationViewController setModalPresentationStyle:](self->_madridRegistrationController, "setModalPresentationStyle:", 2);
      location = 0;
      objc_initWeak(&location, self);
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __67__CKMessagesSceneDelegate__createMadridRegistrationViewIfNecessary__block_invoke;
      v9 = &unk_1E274DCB8;
      objc_copyWeak(&v10, &location);
      v5 = _Block_copy(&v6);
      -[CKRegistrationViewController setCompletionBlock:](self->_madridRegistrationController, "setCompletionBlock:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __67__CKMessagesSceneDelegate__createMadridRegistrationViewIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_madridRegistrationControllerDidComplete");

}

- (void)_destroyMadridRegistrationView
{
  CKRegistrationViewController *madridRegistrationController;
  CKRegistrationViewController *v4;
  void *v5;
  void *v6;
  CKRegistrationViewController *v7;

  madridRegistrationController = self->_madridRegistrationController;
  if (madridRegistrationController)
  {
    if (-[CKRegistrationViewController isViewLoaded](madridRegistrationController, "isViewLoaded"))
    {
      v4 = self->_madridRegistrationController;
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRegistrationViewController setErrorPresentationViewController:](v4, "setErrorPresentationViewController:", v5);

      -[CKRegistrationViewController view](self->_madridRegistrationController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

    }
    v7 = self->_madridRegistrationController;
    self->_madridRegistrationController = 0;

    sAlreadyShowUserNotificationDialogForCurrentLoginCycle = 0;
  }
}

- (void)_mainThread_updateMadridRegistrationViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CKRegistrationViewController *madridRegistrationController;
  CKRegistrationViewController *v6;
  NSObject *v7;
  void *v8;
  CKRegistrationViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKRegistrationViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  CKRegistrationViewController *v23;
  BOOL v24;
  uint8_t buf[16];

  v3 = a3;
  -[CKMessagesSceneDelegate _createMadridRegistrationViewIfNecessary](self, "_createMadridRegistrationViewIfNecessary");
  madridRegistrationController = self->_madridRegistrationController;
  if (madridRegistrationController)
  {
    v6 = madridRegistrationController;
    if (+[CKRegistrationViewController shouldShowRegistration](CKRegistrationViewController, "shouldShowRegistration")|| self->_shouldShowRegistrationOverride)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(33);
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Showing registration view", buf, 2u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
      -[CKMessagesSceneDelegate messagesController](self, "messagesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentedViewController");
      v9 = (CKRegistrationViewController *)objc_claimAutoreleasedReturnValue();

      if (v9 != v6)
      {
        -[CKMessagesSceneDelegate messagesController](self, "messagesController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (!-[CKMessagesSceneDelegate willPresentRegistrationViewController](self, "willPresentRegistrationViewController"))
          {
            -[CKMessagesSceneDelegate setWillPresentRegistrationViewController:](self, "setWillPresentRegistrationViewController:", 1);
            -[CKMessagesSceneDelegate messagesController](self, "messagesController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke;
            v22[3] = &unk_1E274E150;
            v22[4] = self;
            v23 = v6;
            v24 = v3;
            objc_msgSend(v12, "dismissViewControllerAnimated:completion:", v3, v22);

          }
        }
        else
        {
          -[CKMessagesSceneDelegate messagesController](self, "messagesController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "presentViewController:animated:completion:", v6, v3, 0);

        }
      }
      goto LABEL_21;
    }
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentedViewController");
    v15 = (CKRegistrationViewController *)objc_claimAutoreleasedReturnValue();
    if (v15 == v6)
    {
      -[CKRegistrationViewController view](v6, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[CKMessagesSceneDelegate messagesController](self, "messagesController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_3;
        v21[3] = &unk_1E274A208;
        v21[4] = self;
        objc_msgSend(v20, "dismissViewControllerAnimated:completion:", v3, v21);

        goto LABEL_21;
      }
    }
    else
    {

    }
    -[CKMessagesSceneDelegate _destroyMadridRegistrationView](self, "_destroyMadridRegistrationView");
    -[CKMessagesSceneDelegate storedState](self, "storedState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesSceneDelegate messagesController](self, "messagesController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUserActivityHandler restoreState:navigationProvider:](CKUserActivityHandler, "restoreState:navigationProvider:", v16, v17);

    -[CKMessagesSceneDelegate presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
LABEL_21:

  }
}

void __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "presentViewController:animated:completion:", v4, v3, v5);

}

uint64_t __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWillPresentRegistrationViewController:", 0);
}

uint64_t __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_destroyMadridRegistrationView");
  objc_msgSend(*(id *)(a1 + 32), "storedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messagesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler restoreState:navigationProvider:](CKUserActivityHandler, "restoreState:navigationProvider:", v2, v3);

  return objc_msgSend(*(id *)(a1 + 32), "presentOnboardingViewControllerIfNeeded");
}

- (void)_updateMadridRegistrationViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[CKMessagesSceneDelegate _mainThread_updateMadridRegistrationViewAnimated:](self, "_mainThread_updateMadridRegistrationViewAnimated:", v3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__CKMessagesSceneDelegate__updateMadridRegistrationViewAnimated___block_invoke;
    v5[3] = &unk_1E274CA88;
    v5[4] = self;
    v6 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __65__CKMessagesSceneDelegate__updateMadridRegistrationViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainThread_updateMadridRegistrationViewAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_shouldShowMadridRegistrationView
{
  _BOOL4 v3;
  int v4;
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = CKiMessageSupported() == 0;
  v4 = objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningInStoreDemoMode");

  v7 = CKRegistrationBypassEnabled();
  if (((v3 | v4) & 1) != 0
    || v7
    || (v6 & 1) != 0
    || !+[CKRegistrationViewController shouldShowRegistration](CKRegistrationViewController, "shouldShowRegistration"))
  {
    return self->_shouldShowRegistrationOverride;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(33);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v11 = CFSTR("YES");
      v12 = 2112;
      v13 = CFSTR("NO");
      v14 = 2112;
      v15 = CFSTR("NO");
      v16 = 2112;
      v17 = CFSTR("NO");
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "_shouldShowMadridRegistrationView: %@, smsEnabled: %@, registrationBypassEnabled: %@, isDemoMode: %@", buf, 0x2Au);
    }

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_CKShouldLogExternal())
      _CKLogExternal();
  }
  return 1;
}

- (void)__updateAppSnapshot
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CKSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activationState");

  if (v3 == 2)
  {
    if (CKIsScreenLocked())
    {
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Not snapshotting, iOS device is locked", (uint8_t *)&v5, 2u);
      }
      goto LABEL_6;
    }
    im_main_thread();
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Not snapshotting, scene state is %ld", (uint8_t *)&v5, 0xCu);
    }
LABEL_6:

  }
}

void __46__CKMessagesSceneDelegate___updateAppSnapshot__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Telling UIKit to update scene snapshot", v6, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestSceneSessionRefresh:", v5);

}

- (void)_cancelPendingAppSnapshotUpdate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___updateAppSnapshot, 0);
}

- (void)_updateAppSnapshot
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Scheduling snapshot generation", v4, 2u);
    }

  }
  -[CKMessagesSceneDelegate _cancelPendingAppSnapshotUpdate](self, "_cancelPendingAppSnapshotUpdate");
  -[CKMessagesSceneDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___updateAppSnapshot, 0, 10.0);
}

- (void)_chatItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  __int128 *p_buf;
  uint8_t v46[4];
  void *v47;
  __int128 buf;
  uint64_t v49;
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKMessagesSceneDelegate isSuspended](self, "isSuspended"))
  {
    +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "passKitUIPresented");

    if ((v6 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          -[CKSceneDelegate scene](self, "scene");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "session");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "persistentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v10;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Chat items did change while suspended %@", (uint8_t *)&buf, 0xCu);

        }
      }
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D35330]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v49 = 0x2020000000;
      v50 = 0;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __47__CKMessagesSceneDelegate__chatItemsDidChange___block_invoke;
      v43[3] = &unk_1E274B3A8;
      v14 = v12;
      v44 = v14;
      p_buf = &buf;
      objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", 2, v43);
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        -[CKMessagesSceneDelegate messagesController](self, "messagesController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isShowingChatController");

        if (v16)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              -[CKMessagesSceneDelegate messagesController](self, "messagesController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "chatController");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "conversation");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v46 = 138412290;
              v47 = v20;
              _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Messages controller showing chat controller with conversation: %@", v46, 0xCu);

            }
          }
          -[CKMessagesSceneDelegate messagesController](self, "messagesController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "chatController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "conversation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "chat");
          v42 = (id)objc_claimAutoreleasedReturnValue();

          if (v42 == v14)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v46 = 0;
                _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Updated chat is visible chat, not popping back to conversation list before snapshotting", v46, 2u);
              }

            }
            v26 = 1;
          }
          else
          {
            -[CKMessagesSceneDelegate storedState](self, "storedState");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "groupID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v25, "isEqualToString:", CFSTR("-1")) & 1) != 0)
            {
              -[CKMessagesSceneDelegate messagesController](self, "messagesController", 0);
            }
            else
            {
              -[CKMessagesSceneDelegate sharedConversationList](self, "sharedConversationList");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "conversationForExistingChatWithChatIdentifier:", v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                v41 = v29;
              }
              else
              {
                -[CKMessagesSceneDelegate sharedConversationList](self, "sharedConversationList");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "conversationForExistingChatWithGroupID:", v25);
                v41 = (id)objc_claimAutoreleasedReturnValue();

              }
              -[CKMessagesSceneDelegate messagesController](self, "messagesController", v41);
            }
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKMessagesSceneDelegate storedState](self, "storedState");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v32, "shouldRestoreToConversationListForState:", v33);

            if (v26)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v46 = 0;
                  _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, " => Showing unread conversations for snapshot", v46, 2u);
                }

              }
              -[CKMessagesSceneDelegate messagesController](self, "messagesController");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKMessagesSceneDelegate storedState](self, "storedState");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "unreadLastMessages");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v35, "showUnreadConversationsWithLastConversation:ignoringMessages:", v40, v37);

            }
          }

        }
        else
        {
          v26 = 0;
        }
        -[CKMessagesSceneDelegate messagesController](self, "messagesController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isShowingConversationListController");

        if ((v39 | v26) == 1)
          -[CKMessagesSceneDelegate _updateAppSnapshot](self, "_updateAppSnapshot");
      }

      _Block_object_dispose(&buf, 8);
    }
  }

}

void __47__CKMessagesSceneDelegate__chatItemsDidChange___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  void *v4;
  int v5;

  -[CKMessagesSceneDelegate messagesController](self, "messagesController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingConversationListController");

  if (v5)
    -[CKMessagesSceneDelegate _updateAppSnapshot](self, "_updateAppSnapshot");
}

- (NSSet)alertSuppressionContexts
{
  void *v2;
  void *v3;

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertSuppressionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)prefersToActivatePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (id)canActivatePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

- (void)messagesController:(id)a3 didUpdateCurrentConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Messages controller updated current conversation to: %@, updating scene activation conditions", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CKSceneDelegate updateSceneActivationConditions](self, "updateSceneActivationConditions");
  -[CKSceneDelegate updateSceneTitleForConversation:](self, "updateSceneTitleForConversation:", v7);

}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (id)sharedConversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (void)_clearOldInputContextIdentifiersIfNeeded
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loadingConversations");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "skipping UITextInputContextIdentifiers cleanup since conversations list is loading", (uint8_t *)&v20, 2u);
      }

    }
  }
  else
  {
    if (CKIsRunningInMessages())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.MobileSMS"));
    }
    v7 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("__CK_clearTextInputContextIdentifierKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("__CK_clearTextInputContextIdentifierKey"));
      -[CKMessagesSceneDelegate _oldInputContextIdentifiers](self, "_oldInputContextIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v20 = 134217984;
          v21 = objc_msgSend(v9, "count");
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "cleaning %lu UITextInputContextIdentifiers", (uint8_t *)&v20, 0xCu);
        }

      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(MEMORY[0x1E0CEA900], "clearTextInputContextIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }

    }
  }
}

- (id)_oldInputContextIdentifiers
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("max-number-of-text-input-context-identifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 300;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") >= v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__CKMessagesSceneDelegate__oldInputContextIdentifiers__block_invoke;
    v10[3] = &unk_1E275A928;
    v12 = v4;
    v7 = v8;
    v11 = v7;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v10);

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

void __54__CKMessagesSceneDelegate__oldInputContextIdentifiers__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = objc_msgSend(v10, "isPending");
  v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 40) <= a3)
    {
      objc_msgSend(v10, "deviceIndependentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

      v8 = v10;
    }
    else
    {
      *a4 = 1;
    }
  }

}

- (id)conversation
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMessagesSceneDelegate messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (CKSceneDelegateState)storedState
{
  return self->_storedState;
}

- (CKRegistrationViewController)madridRegistrationController
{
  return self->_madridRegistrationController;
}

- (void)setMadridRegistrationController:(id)a3
{
  objc_storeStrong((id *)&self->_madridRegistrationController, a3);
}

- (BOOL)shouldShowRegistrationOverride
{
  return self->_shouldShowRegistrationOverride;
}

- (void)setShouldShowRegistrationOverride:(BOOL)a3
{
  self->_shouldShowRegistrationOverride = a3;
}

- (BOOL)willPresentRegistrationViewController
{
  return self->_willPresentRegistrationViewController;
}

- (void)setWillPresentRegistrationViewController:(BOOL)a3
{
  self->_willPresentRegistrationViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madridRegistrationController, 0);
  objc_storeStrong((id *)&self->_storedState, 0);
  objc_storeStrong((id *)&self->_messagesController, 0);
}

void __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "migration task has timed out", v1, 2u);
}

@end
