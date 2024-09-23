@implementation CCUIConnectivityWifiViewController

- (CCUIConnectivityWifiViewController)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CCUIConnectivityWifiViewController *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v3 = (void *)MEMORY[0x24BE19B00];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("WiFi"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)CCUIConnectivityWifiViewController;
  v13 = -[CCUIConnectivityButtonViewController initWithGlyphPackageDescription:highlightColor:](&v21, sel_initWithGlyphPackageDescription_highlightColor_, v9, v12);

  if (v13)
  {
    objc_msgSend_sharedInstance(CCUIConnectivityManager, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_connectivityManager, v16);
    objc_msgSend_wifiStateMonitor(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_stateMonitor, v19);

  }
  return v13;
}

- (void)buttonTapped:(id)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v6, sel_buttonTapped_, a3);
  objc_msgSend__toggleState(self, v4, v5);
}

- (id)displayName
{
  int v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;

  v2 = MGGetBoolAnswer();
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v2)
    objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_WLAN_NAME"), &stru_24FFCAEF8, 0);
  else
    objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_WIFI_NAME"), &stru_24FFCAEF8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.Wifi");
}

- (void)containerWillTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  id v6;
  const char *v7;
  CCUIContentModuleDetailClickPresentationInteractionManager *v8;
  CCUIContentModuleDetailClickPresentationInteractionManager *clickPresentationInteractionManager;
  CCUIContentModuleDetailClickPresentationInteractionManager *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityButtonViewController containerWillTransitionToExpandedContentMode:](&v15, sel_containerWillTransitionToExpandedContentMode_);
  if (v3)
  {
    v6 = objc_alloc(MEMORY[0x24BE19B18]);
    v8 = (CCUIContentModuleDetailClickPresentationInteractionManager *)objc_msgSend_initWithPresentingViewController_delegate_(v6, v7, (uint64_t)self, self);
    clickPresentationInteractionManager = self->_clickPresentationInteractionManager;
    self->_clickPresentationInteractionManager = v8;

    v10 = self->_clickPresentationInteractionManager;
    objc_msgSend_templateView(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setViewForInteraction_(v10, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setViewForInteraction_(self->_clickPresentationInteractionManager, v5, 0);
    v13 = self->_clickPresentationInteractionManager;
    self->_clickPresentationInteractionManager = 0;
  }

}

- (BOOL)isPresentingMenuModuleViewController
{
  return self->_presentingMenuViewController;
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityWifiViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityWifiViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v7, sel_startObservingStateChanges);
  objc_msgSend_connectivityManager(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addWiFiViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);

}

- (void)stopObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityWifiViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v7, sel_stopObservingStateChanges);
  objc_msgSend_connectivityManager(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeWiFiViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);

}

- (void)_toggleState
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  id WeakRetained;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  id v23[2];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__currentState(self, a2, v2);
  v6 = (void *)objc_msgSend__stateWithOverridesApplied_(self, v5, v4);
  v7 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend__debugDescriptionForState_(self, v9, (uint64_t)v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_230FA3000, v8, OS_LOG_TYPE_DEFAULT, "Toggle WiFi state from %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
  objc_msgSend_linkQuality(WeakRetained, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ssid(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v18 = objc_loadWeakRetained((id *)&self->_stateMonitor);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230FABF94;
  v21[3] = &unk_24FFCAA98;
  v21[4] = self;
  v23[1] = v6;
  v19 = v17;
  v22 = v19;
  objc_copyWeak(v23, (id *)buf);
  objc_msgSend_performAction_(v18, v20, (uint64_t)v21);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);

}

- (void)_presentBehaviorPromptWithCompletion:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;

  v4 = a3;
  v5 = MGGetBoolAnswer();
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = objc_opt_class();
  objc_msgSend_bundleForClass_(v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v5)
  {
    objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)CFSTR("CONTROL_CENTER_WLAN_BEHAVIOR_ALERT_TITLE"), &stru_24FFCAEF8, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD1488];
    v13 = objc_opt_class();
    objc_msgSend_bundleForClass_(v12, v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v15, v16, (uint64_t)CFSTR("CONTROL_CENTER_WLAN_BEHAVIOR_ALERT_MESSAGE"), &stru_24FFCAEF8, 0);
  }
  else
  {
    objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)CFSTR("CONTROL_CENTER_WIFI_BEHAVIOR_ALERT_TITLE"), &stru_24FFCAEF8, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD1488];
    v18 = objc_opt_class();
    objc_msgSend_bundleForClass_(v17, v19, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v15, v20, (uint64_t)CFSTR("CONTROL_CENTER_WIFI_BEHAVIOR_ALERT_MESSAGE"), &stru_24FFCAEF8, 0);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_presentAlertWithTitle_message_completion_(self, v22, (uint64_t)v23, v21, v4);
}

- (void)_updateState
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend__currentState(self, a2, v2);
  objc_msgSend__updateWithState_(self, v5, v4);
}

- (void)_updateWithState:(int64_t)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__stateWithOverridesApplied_(self, a2, a3);
  v6 = objc_msgSend__inoperativeForState_(self, v5, v4);
  v8 = objc_msgSend__enabledForState_(self, v7, v4);
  objc_msgSend__glyphStateForState_(self, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subtitleTextWithState_(self, v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__useAlternateSelectedBackgroundForState_(self, v13, v4);
  objc_msgSend_setInoperative_(self, v15, v6);
  objc_msgSend_setEnabled_(self, v16, v8);
  objc_msgSend_setGlyphState_(self, v17, (uint64_t)v10);
  objc_msgSend_setSubtitle_(self, v18, (uint64_t)v12);
  objc_msgSend_setUseAlternateBackground_(self, v19, v14);
  v20 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend__debugDescriptionForState_(self, v22, v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544643;
    v25 = v23;
    v26 = 1024;
    v27 = v6;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = v14;
    v32 = 2114;
    v33 = v10;
    v34 = 2113;
    v35 = v12;
    _os_log_impl(&dword_230FA3000, v21, OS_LOG_TYPE_DEFAULT, "WiFi state updated to %{public}@ [ inoperative: %d enabled: %d useAlternateBackground: %d, glyphState: %{public}@ subtitle: %{private}@ ]", (uint8_t *)&v24, 0x32u);

  }
}

- (int64_t)_currentState
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
  v5 = objc_msgSend_state(WeakRetained, v3, v4);

  return v5;
}

- (int64_t)_stateWithOverridesApplied:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  char shouldExcludeControlCenterFromStatusBarOverrides;
  const char *v10;
  uint64_t v11;
  uint64_t StatusBarOverrideData;

  if (CCSIsInternalInstall())
  {
    objc_msgSend_standardDefaults(MEMORY[0x24BE19A20], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    shouldExcludeControlCenterFromStatusBarOverrides = objc_msgSend_shouldExcludeControlCenterFromStatusBarOverrides(v6, v7, v8);

    if ((shouldExcludeControlCenterFromStatusBarOverrides & 1) == 0)
    {
      StatusBarOverrideData = objc_msgSend_getStatusBarOverrideData(MEMORY[0x24BDF6DE0], v10, v11);
      if (*(_BYTE *)(StatusBarOverrideData + 9))
      {
        if ((*(_DWORD *)(StatusBarOverrideData + 2160) - 5) >= 2)
          return 2;
        else
          return 4;
      }
    }
  }
  return a3;
}

- (id)_subtitleTextWithState:(int64_t)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  id WeakRetained;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;

  switch(a3)
  {
    case 2:
    case 5:
      v3 = MGGetBoolAnswer();
      v4 = (void *)MEMORY[0x24BDD1488];
      v5 = objc_opt_class();
      objc_msgSend_bundleForClass_(v4, v6, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v9 = CFSTR("CONTROL_CENTER_STATUS_WLAN_DISCONNECTED");
      else
        v9 = CFSTR("CONTROL_CENTER_STATUS_WIFI_DISCONNECTED");
      goto LABEL_13;
    case 3:
      v14 = MGGetBoolAnswer();
      v15 = (void *)MEMORY[0x24BDD1488];
      v16 = objc_opt_class();
      objc_msgSend_bundleForClass_(v15, v17, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v9 = CFSTR("CONTROL_CENTER_STATUS_WLAN_BUSY");
      else
        v9 = CFSTR("CONTROL_CENTER_STATUS_WIFI_BUSY");
LABEL_13:
      objc_msgSend_localizedStringForKey_value_table_(v8, v7, (uint64_t)v9, &stru_24FFCAEF8, 0);
      goto LABEL_14;
    case 4:
      WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
      objc_msgSend_linkQuality(WeakRetained, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ssid(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v24, v25, v26))
        return v24;
      v27 = (void *)MEMORY[0x24BDD1488];
      v28 = objc_opt_class();
      objc_msgSend_bundleForClass_(v27, v29, v28);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v8, v30, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_WIFI_ON"), &stru_24FFCAEF8, 0);
      v31 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v31;
      goto LABEL_15;
    default:
      if ((unint64_t)a3 > 1)
      {
        v24 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x24BDD1488];
        v11 = objc_opt_class();
        objc_msgSend_bundleForClass_(v10, v12, v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v8, v13, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_WIFI_OFF"), &stru_24FFCAEF8, 0);
LABEL_14:
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      }
      return v24;
  }
}

- (BOOL)_inoperativeForState:(int64_t)a3
{
  return (unint64_t)(a3 - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)_enabledForState:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (id)_glyphStateForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return CFSTR("poweroff");
  else
    return off_24FFCAAB8[a3 - 2];
}

- (id)_menuGlyphStateForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 4)
    return CFSTR("poweroff");
  else
    return CFSTR("associated");
}

- (id)_debugDescriptionForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unavailable");
  else
    return off_24FFCAAD8[a3 - 1];
}

- (BOOL)_useAlternateSelectedBackgroundForState:(int64_t)a3
{
  return a3 == 5 || a3 == 2;
}

- (BOOL)showsMenuModuleAsPrimaryAction
{
  return 1;
}

- (void)presentMenuModule
{
  ((void (*)(CCUIContentModuleDetailClickPresentationInteractionManager *, char *))MEMORY[0x24BEDD108])(self->_clickPresentationInteractionManager, sel_presentViewController);
}

- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  CCUIWiFiMenuModuleViewController *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;

  v4 = objc_msgSend__currentState(self, a2, (uint64_t)a3);
  v6 = objc_msgSend__stateWithOverridesApplied_(self, v5, v4);
  if ((objc_msgSend__inoperativeForState_(self, v7, v6) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    if ((unint64_t)(v6 - 3) >= 2)
      objc_msgSend__toggleState(self, v8, v9);
    v10 = objc_alloc_init(CCUIWiFiMenuModuleViewController);
    objc_msgSend_contentModuleContext(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentModuleContext_(v10, v14, (uint64_t)v13);

    objc_msgSend_displayName(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v10, v18, (uint64_t)v17);

    objc_msgSend_setModalPresentationStyle_(v10, v19, 4);
    objc_msgSend__menuGlyphStateForState_(self, v20, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphState_(v10, v22, (uint64_t)v21);
    self->_presentingMenuViewController = 1;

  }
  return v10;
}

- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v7 = a4;
  if (v7)
  {
    objc_msgSend_contentModuleContext(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_230FACBF8;
    v10[3] = &unk_24FFCA950;
    v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);

  }
}

- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  self->_presentingMenuViewController = 0;
}

- (CCUIConnectivityManager)connectivityManager
{
  return (CCUIConnectivityManager *)objc_loadWeakRetained((id *)&self->_connectivityManager);
}

- (void)setConnectivityManager:(id)a3
{
  objc_storeWeak((id *)&self->_connectivityManager, a3);
}

- (WFControlCenterStateMonitor)stateMonitor
{
  return (WFControlCenterStateMonitor *)objc_loadWeakRetained((id *)&self->_stateMonitor);
}

- (void)setStateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_stateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateMonitor);
  objc_destroyWeak((id *)&self->_connectivityManager);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);
}

@end
