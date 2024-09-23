@implementation AutomationController

- (AutomationController)init
{
  AutomationController *v2;
  uint64_t v3;
  NSMapTable *activeDialogs;
  void *v5;
  void *v6;
  void *v7;
  AutomationController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AutomationController;
  v2 = -[AutomationController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    activeDialogs = v2->_activeDialogs;
    v2->_activeDialogs = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__developerPreferencesChanged, *MEMORY[0x1E0CD5870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    -[AutomationController processPool](v2, "processPool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAutomationDelegate:", v2);

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[AutomationController processPool](self, "processPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAutomationDelegate:", 0);

  v6.receiver = self;
  v6.super_class = (Class)AutomationController;
  -[AutomationController dealloc](&v6, sel_dealloc);
}

- (id)processPool
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultProcessPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_browserControllerForAutomation
{
  void *v2;
  void *v3;
  void *v4;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__AutomationController__browserControllerForAutomation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isControlledByAutomation");
}

- (BOOL)canCreateNewAutomationTabs
{
  void *v3;
  BOOL v4;

  -[AutomationController automationSession](self, "automationSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !self->_closingAutomationTabsForSessionTeardown;
  else
    v4 = 0;

  return v4;
}

- (void)updatePreferencesForAutomation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setFraudulentWebsiteWarningEnabled:", 0);
  objc_msgSend(v4, "_setFullScreenEnabled:", 1);
  objc_msgSend(v4, "_setVideoQualityIncludesDisplayCompositingEnabled:", 1);
  objc_msgSend(v4, "_setMockCaptureDevicesEnabled:", 1);
  objc_msgSend(v4, "_setMockCaptureDevicesPromptEnabled:", 0);
  if (self->_provisionalSessionConfiguration)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AutomationController updatePreferencesForAutomation:].cold.2(-[_WKAutomationSessionConfiguration allowsInsecureMediaCapture](self->_provisionalSessionConfiguration, "allowsInsecureMediaCapture"), (uint64_t)v8);

    objc_msgSend(v4, "_setMediaCaptureRequiresSecureConnection:", -[_WKAutomationSessionConfiguration allowsInsecureMediaCapture](self->_provisionalSessionConfiguration, "allowsInsecureMediaCapture") ^ 1);
    v6 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AutomationController updatePreferencesForAutomation:].cold.1(-[_WKAutomationSessionConfiguration suppressesICECandidateFiltering](self->_provisionalSessionConfiguration, "suppressesICECandidateFiltering"), (uint64_t)&v7);

    objc_msgSend(v4, "_setICECandidateFilteringEnabled:", -[_WKAutomationSessionConfiguration suppressesICECandidateFiltering](self->_provisionalSessionConfiguration, "suppressesICECandidateFiltering") ^ 1);
  }

}

- (void)createAutomationSessionWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_opt_new();
  -[AutomationController createAutomationSessionWithIdentifier:configuration:retryBehavior:](self, "createAutomationSessionWithIdentifier:configuration:retryBehavior:", v5, v4, 0);

}

- (void)createAutomationSessionWithIdentifier:(id)a3 configuration:(id)a4 retryBehavior:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id *v22;
  id *v23;
  NSObject *v24;
  dispatch_time_t v25;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[5];
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[_SFAutomationController allowsRemoteAutomation](self, "allowsRemoteAutomation"))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = (uint64_t)v8;
      _os_log_impl(&dword_1D7CA3000, v10, OS_LOG_TYPE_DEFAULT, "Checking if a new session (%{public}@) can be created.", buf, 0xCu);
    }
    v11 = (void *)MEMORY[0x1E0D8A7B0];
    -[AutomationController automationSession](self, "automationSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "canCreateSessionWithExistingSession:retryBehavior:", v12, a5);

    switch(v13)
    {
      case 1:
        v14 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[AutomationController automationSession](self, "automationSession");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sessionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = (uint64_t)v16;
          v36 = 2114;
          v37 = v8;
          _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "Terminating unpaired session (%{public}@) so new session request (%{public}@) can be fulfilled.", buf, 0x16u);

        }
        -[AutomationController terminateSession](self, "terminateSession");
        break;
      case 2:
        v24 = WBS_LOG_CHANNEL_PREFIXWebDriver();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v35 = 1;
          _os_log_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_DEFAULT, "Waiting %{public}lld seconds and trying session creation again.", buf, 0xCu);
        }
        v25 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke;
        block[3] = &unk_1E9CF3C30;
        block[4] = self;
        v22 = &v32;
        v32 = v8;
        v23 = &v33;
        v33 = v9;
        dispatch_after(v25, MEMORY[0x1E0C80D38], block);
        goto LABEL_15;
      case 3:
        goto LABEL_16;
    }
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_2;
    aBlock[3] = &unk_1E9CF3C30;
    aBlock[4] = self;
    v29 = v9;
    v30 = v8;
    v18 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC34C0], "defaultConfigurationForStyle:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsAutoLock:", 0);
    objc_msgSend(v19, "setAllowsLockButton:", 1);
    objc_msgSend(v19, "setAutomaticallyRelaunchesAfterAppCrash:", 0);
    v20 = (void *)MEMORY[0x1E0DC34C8];
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_49;
    v26[3] = &unk_1E9CF4768;
    v26[4] = self;
    v21 = v18;
    v27 = v21;
    objc_msgSend(v20, "requestSessionWithConfiguration:completion:", v19, v26);

    v22 = &v29;
    v23 = &v30;
LABEL_15:

  }
LABEL_16:

}

uint64_t __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createAutomationSessionWithIdentifier:configuration:retryBehavior:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3;
  v5[3] = &unk_1E9CF4740;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setUpAutomationWindowWithCompletionHandler:", v5);

}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  if (v3)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3_cold_1(v7, (uint64_t)v13, v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "_uninstallGuidedAccessSession");
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D973E8]);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventProxCards"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6A0]), "initWithConfiguration:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11, "setSessionIdentifier:", *(_QWORD *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v11);
    objc_msgSend(*(id *)(a1 + 32), "processPool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setAutomationSession:", v11);

  }
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_49_cold_1(v10, (uint64_t)v11, v9);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
    v8 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Successfully started Guided Access session used for WebDriver.", v11, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)terminateSession
{
  id v2;

  -[AutomationController automationSession](self, "automationSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminate");

}

- (void)_uninstallGuidedAccessSession
{
  UIAutonomousSingleAppModeSession *guidedAccessSession;
  UIAutonomousSingleAppModeSession *v4;
  UIAutonomousSingleAppModeSession *v5;
  UIAutonomousSingleAppModeSession *v6;

  guidedAccessSession = self->_guidedAccessSession;
  if (guidedAccessSession)
  {
    v4 = guidedAccessSession;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC34C8], "currentlyActiveSession");
    v4 = (UIAutonomousSingleAppModeSession *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  v5 = self->_guidedAccessSession;
  self->_guidedAccessSession = 0;

  if (-[UIAutonomousSingleAppModeSession isActive](v6, "isActive"))
    -[UIAutonomousSingleAppModeSession endWithCompletion:](v6, "endWithCompletion:", &__block_literal_global_51);

}

void __53__AutomationController__uninstallGuidedAccessSession__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      __53__AutomationController__uninstallGuidedAccessSession__block_invoke_cold_1(v4, (uint64_t)v6, v3);
    }

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully ended Guided Access session used for WebDriver.", v6, 2u);
    }
  }

}

- (BOOL)_uninstallAutomationSession
{
  void *v3;
  void *v4;
  void *v5;
  _WKAutomationSession *automationSession;
  void *v7;
  void *v8;
  void *v9;
  SFClient *sharingClient;

  -[AutomationController automationSession](self, "automationSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self->_closingAutomationTabsForSessionTeardown = 1;
    -[AutomationController _browserControllerForAutomation](self, "_browserControllerForAutomation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeAllOpenTabsAnimated:", 0);

    self->_closingAutomationTabsForSessionTeardown = 0;
    -[_WKAutomationSession setDelegate:](self->_automationSession, "setDelegate:", 0);
    automationSession = self->_automationSession;
    self->_automationSession = 0;

    self->_automationSessionRequestedFirstWebView = 0;
    -[AutomationController processPool](self, "processPool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAutomationSession:", 0);

    +[Application sharedApplication](Application, "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tearDownAutomationWindow");

    -[SFClient invalidate](self->_sharingClient, "invalidate");
    sharingClient = self->_sharingClient;
    self->_sharingClient = 0;

    -[AutomationController _uninstallGuidedAccessSession](self, "_uninstallGuidedAccessSession");
  }
  return v3 != 0;
}

- (void)_developerPreferencesChanged
{
  BOOL v3;
  id v4;
  id v5;

  -[AutomationController automationSession](self, "automationSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = -[_SFAutomationController allowsRemoteAutomation](self, "allowsRemoteAutomation");

    if (!v3)
      -[AutomationController terminateSession](self, "terminateSession");
  }
  -[AutomationController processPool](self, "processPool");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_automationCapabilitiesDidChange");

}

- (void)_processPool:(id)a3 didRequestAutomationSessionWithIdentifier:(id)a4 configuration:(id)a5
{
  -[AutomationController createAutomationSessionWithIdentifier:configuration:retryBehavior:](self, "createAutomationSessionWithIdentifier:configuration:retryBehavior:", a4, a5, 0);
}

- (void)_processPoolDidRequestInspectorDebuggablesToWakeUp:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[Application sharedApplication](Application, "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allWebExtensionsControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v8, "enabledExtensions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v16;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v9);
              objc_msgSend(v8, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "loadBackgroundPageIfNecessaryWithCompletionHandler:", &__block_literal_global_52);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (void)_automationSession:(id)a3 requestNewWebViewWithOptions:(unint64_t)a4 completionHandler:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(id, _QWORD);

  v15 = (void (**)(id, _QWORD))a5;
  -[AutomationController _browserControllerForAutomation](self, "_browserControllerForAutomation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_automationSessionRequestedFirstWebView)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadURLInNewTab:inBackground:animated:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v15[2](v15, 0);
      goto LABEL_8;
    }
  }
  else
  {
    self->_automationSessionRequestedFirstWebView = 1;
    objc_msgSend(v6, "tabController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeTabDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isControlledByAutomation") & 1) == 0)
    {
      objc_msgSend(v7, "tabController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "closeAllOpenTabsAnimated:", 0);

      objc_msgSend(v7, "tabController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeTabDocument");
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
  }
  objc_msgSend(v9, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v15)[2](v15, v14);

LABEL_8:
}

- (void)_automationSession:(id)a3 requestSwitchToWebView:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a5;
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AutomationController _browserControllerForAutomation](self, "_browserControllerForAutomation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveTabDocument:animated:", v7, 0);

    v10[2]();
  }
  else
  {
    v10[2]();
  }

}

- (BOOL)_automationSession:(id)a3 isShowingJavaScriptDialogForWebView:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_automationSession:(id)a3 dismissCurrentJavaScriptDialogForWebView:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMapTable removeObjectForKey:](self->_activeDialogs, "removeObjectForKey:", v8);
      objc_msgSend(v6, "completionHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, 0);

    }
    v5 = v8;
  }

}

- (void)_automationSession:(id)a3 acceptCurrentJavaScriptDialogForWebView:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMapTable removeObjectForKey:](self->_activeDialogs, "removeObjectForKey:", v9);
      objc_msgSend(v6, "completionHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v7)[2](v7, 1, v8);

    }
    v5 = v9;
  }

}

- (id)_automationSession:(id)a3 messageOfCurrentJavaScriptDialogForWebView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_automationSession:(id)a3 typeOfCurrentJavaScriptDialogForWebView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "type");
    else
      v8 = 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_automationSession:(id)a3 setUserInput:(id)a4 forCurrentJavaScriptDialogForWebView:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMapTable objectForKey:](self->_activeDialogs, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setCurrentInput:", v10);

  }
}

- (int64_t)_automationSession:(id)a3 currentPresentationForWebView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "browserController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "usesTabBar") & 1) != 0)
    {
      objc_msgSend(v6, "tabController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unint64_t)objc_msgSend(v7, "numberOfCurrentNonHiddenTabs") < 2;

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)tabDocument:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  JavaScriptDialogState *v11;
  id v12;
  JavaScriptDialogState *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [JavaScriptDialogState alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__AutomationController_tabDocument_runJavaScriptAlertPanelWithMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E9CF47D0;
  v12 = v10;
  v15 = v12;
  v13 = -[JavaScriptDialogState initWithMessage:type:completionHandler:](v11, "initWithMessage:type:completionHandler:", v9, 2, v14);
  -[NSMapTable setObject:forKey:](self->_activeDialogs, "setObject:forKey:", v13, v8);

}

uint64_t __89__AutomationController_tabDocument_runJavaScriptAlertPanelWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tabDocument:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  JavaScriptDialogState *v11;
  id v12;
  JavaScriptDialogState *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [JavaScriptDialogState alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__AutomationController_tabDocument_runJavaScriptConfirmPanelWithMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E9CF47D0;
  v12 = v10;
  v15 = v12;
  v13 = -[JavaScriptDialogState initWithMessage:type:completionHandler:](v11, "initWithMessage:type:completionHandler:", v9, 3, v14);
  -[NSMapTable setObject:forKey:](self->_activeDialogs, "setObject:forKey:", v13, v8);

}

uint64_t __91__AutomationController_tabDocument_runJavaScriptConfirmPanelWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tabDocument:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  JavaScriptDialogState *v12;
  id v13;
  JavaScriptDialogState *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = [JavaScriptDialogState alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__AutomationController_tabDocument_runJavaScriptTextInputPanelWithPrompt_defaultText_completionHandler___block_invoke;
  v15[3] = &unk_1E9CF47D0;
  v13 = v11;
  v16 = v13;
  v14 = -[JavaScriptDialogState initWithMessage:type:completionHandler:](v12, "initWithMessage:type:completionHandler:", v10, 4, v15);
  -[NSMapTable setObject:forKey:](self->_activeDialogs, "setObject:forKey:", v14, v9);

}

uint64_t __104__AutomationController_tabDocument_runJavaScriptTextInputPanelWithPrompt_defaultText_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (_WKAutomationSession)automationSession
{
  return self->_automationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSession, 0);
  objc_storeStrong((id *)&self->_provisionalSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_guidedAccessSession, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_activeDialogs, 0);
}

- (void)updatePreferencesForAutomation:(char)a1 .cold.1(char a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_4_2(a1, CFSTR("NO"));
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_1_0(&dword_1D7CA3000, v4, v5, "Applying session configuration: suppressesICECandidateFiltering = %{public}@");

  OUTLINED_FUNCTION_2_1();
}

- (void)updatePreferencesForAutomation:(char)a1 .cold.2(char a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_4_2(a1, CFSTR("NO"));
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_1_0(&dword_1D7CA3000, v4, v5, "Applying session configuration: allowsInsecureMediaCapture = %{public}@");

  OUTLINED_FUNCTION_2_1();
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_3_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Unable to set up a window for WebDriver: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

void __90__AutomationController_createAutomationSessionWithIdentifier_configuration_retryBehavior___block_invoke_49_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Unable to start Guided Access session used for WebDriver: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

void __53__AutomationController__uninstallGuidedAccessSession__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Unable to end Guided Access session used for WebDriver: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

@end
