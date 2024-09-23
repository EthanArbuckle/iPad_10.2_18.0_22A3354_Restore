@implementation HUCCControlCenterModule

- (void)smartGridContentViewController:(id)a3 viewWillAppear:(BOOL)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_smartGridViewController(a3, a2, (uint64_t)a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemManager(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allDisplayedItems(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v10);
        v17 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v18 = &unk_255EEBEC0;
        if (objc_msgSend_conformsToProtocol_(v17, v19, (uint64_t)v18))
          v20 = v17;
        else
          v20 = 0;
        v21 = v20;

        objc_msgSend_accessories(v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_na_filter_(v24, v25, (uint64_t)&unk_24FFD8160);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v14 += objc_msgSend_count(v26, v27, v28);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v29, (uint64_t)&v31, v35, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  HUCCUpdateRunningStateWithAppleMediaAccessories(1, v14, v30);
}

- (void)smartGridContentViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
  HUCCUpdateRunningState(0, (uint64_t)a2, (uint64_t)a3);
}

- (HUCCControlCenterModule)init
{
  HUCCControlCenterModule *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  HUCCLockStateHandler *v10;
  const char *v11;
  uint64_t v12;
  HUCCLockStateHandler *lockStateHandler;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCCControlCenterModule;
  v2 = -[HUCCControlCenterModule init](&v15, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend_sharedManager(MEMORY[0x24BE4F448], v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bootstrap(v5, v6, v7);

      objc_msgSend_registerForAnalytics(v2, v8, v9);
    }
    else
    {
      HUCCPerformCommonInitialization();
    }
    v10 = [HUCCLockStateHandler alloc];
    v12 = objc_msgSend_initWithDelegate_(v10, v11, (uint64_t)v2);
    lockStateHandler = v2->_lockStateHandler;
    v2->_lockStateHandler = (HUCCLockStateHandler *)v12;

    if (qword_25414D0D8[0] != -1)
      dispatch_once(qword_25414D0D8, &unk_24FFD8120);
  }
  return v2;
}

- (unint64_t)supportedGridSizeClasses
{
  return 2040;
}

- (NSString)moduleDescription
{
  return (NSString *)HULocalizedString();
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  HUCCSmartGridContentViewController *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint8_t v28[16];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_viewController(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (_os_feature_enabled_impl())
    {
      v10 = (void *)MEMORY[0x2348CD3C0]();
      sub_230FE1B68((uint64_t)self, CFSTR("Home 2x2"), 2, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_230FE1B68((uint64_t)self, CFSTR("Home 2x2"), 2, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_230FE1B68((uint64_t)self, CFSTR("Home Page Size"), 2, 6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_230FDD000, v14, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule will initialize: HUControlCenterModuleViewController", v28, 2u);
      }

      v15 = objc_alloc(MEMORY[0x24BE4F440]);
      v29[0] = v11;
      v29[1] = v12;
      v29[2] = v13;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v29, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_initWithDelegate_ofKind_withPreviews_(v15, v18, (uint64_t)self, 0, v17);
      objc_msgSend_setViewController_(self, v20, (uint64_t)v19);

      objc_autoreleasePoolPop(v10);
    }
    else
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_230FDD000, v21, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule will initialize: HUCCSmartGridContentViewController", v28, 2u);
      }

      v22 = [HUCCSmartGridContentViewController alloc];
      v24 = (void *)objc_msgSend_initWithDelegate_(v22, v23, (uint64_t)self);
      objc_msgSend_setViewController_(self, v25, (uint64_t)v24);

    }
  }
  objc_msgSend_viewController(self, v8, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setContentModuleContext:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HUCCOpenURLHandler *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;

  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  v5 = a3;
  objc_opt_class();
  objc_msgSend_viewController(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v14 = v9;

  v10 = [HUCCOpenURLHandler alloc];
  v12 = (void *)objc_msgSend_initWithCCModuleContext_(v10, v11, (uint64_t)v5);

  objc_msgSend_setURLHandler_(v14, v13, (uint64_t)v12);
}

- (void)lockStateWasUpdated:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = a3;
  objc_opt_class();
  objc_msgSend_viewController(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend_setAccessAllowedForCurrentLockState_(v9, v10, v3);
  objc_opt_class();
  objc_msgSend_viewController(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v16 = v14;

  objc_msgSend_setAccessAllowedForCurrentLockState_(v16, v15, v3);
}

- (void)launchHomeAppForSmartGridContentViewController:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend_contentModuleContext(self, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  launchHomeAppForModuleViewController(v4, v7);

}

- (BOOL)isDeviceUnlockedForSmartGridContentViewController:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  char isDeviceUnlocked;

  objc_msgSend_lockStateHandler(self, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceUnlocked = objc_msgSend_isDeviceUnlocked(v3, v4, v5);

  return isDeviceUnlocked;
}

- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_230FDD000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend_sharedManager(MEMORY[0x24BE4F448], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enterModuleViewWillAppear(v12, v13, v14);

  objc_msgSend_cancelScheduledCharacteristicDeregistration(self, v15, v16);
}

- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_230FDD000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend_sharedManager(MEMORY[0x24BE4F448], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exitModuleViewDidDisappear(v12, v13, v14);

  objc_msgSend_scheduleCharacteristicDeregistration(self, v15, v16);
}

- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  _QWORD v41[4];
  id v42;
  _BYTE location[12];
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend_allowsCharacteristicNotifications(v7, v9, v10))
    goto LABEL_4;
  objc_msgSend_itemManager(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_home(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_characteristicsToEnableNotificationsForItems_(self, v20, (uint64_t)v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    objc_msgSend_itemManager(v7, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_home(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characteristicRegistrationObject(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = sub_230FE26A8;
    v41[3] = &unk_24FFD81B0;
    objc_copyWeak(&v42, (id *)location);
    objc_msgSend_registerForCharacteristics_items_inHome_currentRegistration_completionBlock_(self, v31, (uint64_t)v21, v8, v27, v30, v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)location);

  }
  else
  {
LABEL_4:
    HFLogForCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v34;
      v44 = 2112;
      v45 = v35;
      _os_log_impl(&dword_230FDD000, v32, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called while view controller had characteristic notifications disabled. Clearing registration", location, 0x16u);

    }
    objc_msgSend_characteristicRegistrationObject(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelRegistration_(self, v39, (uint64_t)v38);

    objc_msgSend_setCharacteristicRegistrationObject_(self, v40, 0);
  }

}

- (void)cancelScheduledCharacteristicDeregistration
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  HUCCControlCenterModule *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_characteristicRegistrationScheduledCancelation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_230FDD000, v7, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration canceling scheduled characteristic deregistration", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend_characteristicRegistrationScheduledCancelation(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v8, v9, v10);

  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(self, v11, 0);
}

- (void)scheduleCharacteristicDeregistration
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  HUCCControlCenterModule *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_characteristicRegistrationScheduledCancelation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v4, v5, v6);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_230FDD000, v7, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration scheduling characteristic deregistration", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_mainThreadScheduler(MEMORY[0x24BE6B628], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230FE2A14;
  v14[3] = &unk_24FFD81D8;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend_afterDelay_performBlock_(v10, v11, (uint64_t)v14, 5.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(self, v13, (uint64_t)v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)launchHomeAppForControlCenterModuleViewController:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_230FDD000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend_contentModuleContext(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  launchHomeAppForModuleViewController(v5, v12);

}

- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char isDeviceUnlocked;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend_lockStateHandler(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceUnlocked = objc_msgSend_isDeviceUnlocked(v11, v12, v13);

  return isDeviceUnlocked;
}

- (CCUIContentModuleContentViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (HUCCLockStateHandler)lockStateHandler
{
  return self->_lockStateHandler;
}

- (void)setLockStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateHandler, a3);
}

- (id)characteristicRegistrationObject
{
  return self->_characteristicRegistrationObject;
}

- (void)setCharacteristicRegistrationObject:(id)a3
{
  objc_storeStrong(&self->_characteristicRegistrationObject, a3);
}

- (NACancelable)characteristicRegistrationScheduledCancelation
{
  return self->_characteristicRegistrationScheduledCancelation;
}

- (void)setCharacteristicRegistrationScheduledCancelation:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicRegistrationScheduledCancelation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicRegistrationScheduledCancelation, 0);
  objc_storeStrong(&self->_characteristicRegistrationObject, 0);
  objc_storeStrong((id *)&self->_lockStateHandler, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)registerForCharacteristics:(NSSet *)a3 items:(NSSet *)a4 inHome:(HMHome *)a5 currentRegistration:(id)a6 completionBlock:(id)a7
{
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSSet *v20;
  NSSet *v21;
  HMHome *v22;
  HUCCControlCenterModule *v23;
  uint64_t v24;

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  v17 = sub_230FF487C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_255EB1998;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_255EB1860;
  v19[5] = v18;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  swift_unknownObjectRetain();
  v23 = self;
  sub_230FF33B4((uint64_t)v14, (uint64_t)&unk_255EB1868, (uint64_t)v19);
  swift_release();
}

- (void)cancelRegistration:(id)a3
{
  uint64_t v4;
  char *v5;
  HUCCControlCenterModule *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230FF469C();
  swift_unknownObjectRetain_n();
  v6 = self;
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = v7;
    v9 = sub_230FF487C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v8;
    sub_230FF071C((uint64_t)v5, (uint64_t)&unk_255EB1980, (uint64_t)v10);
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
}

- (id)characteristicsToEnableNotificationsForItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  HUCCControlCenterModule *v6;
  void *v7;
  _QWORD v9[5];

  sub_230FF4034(0, &qword_255EB1948);
  v4 = MEMORY[0x24BEE5BD8];
  sub_230FF3D6C(&qword_255EB1950, &qword_255EB1948, 0x24BE4D0C0, MEMORY[0x24BEE5BD8]);
  v5 = sub_230FF4894();
  sub_230FF46D8();
  v9[3] = sub_230FEF0A8(&qword_255EB1958);
  v9[4] = sub_230FF3DAC();
  v9[0] = v5;
  v6 = self;
  swift_bridgeObjectRetain();
  sub_230FF46A8();
  sub_230FF3FD4((uint64_t)v9);

  swift_bridgeObjectRelease();
  sub_230FF4034(0, &qword_255EB1968);
  sub_230FF3D6C(&qword_255EB1970, &qword_255EB1968, 0x24BDD75B8, v4);
  v7 = (void *)sub_230FF4888();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)registerForAnalytics
{
  HUCCControlCenterModule *v2;

  v2 = self;
  sub_230FF2538();

}

@end
