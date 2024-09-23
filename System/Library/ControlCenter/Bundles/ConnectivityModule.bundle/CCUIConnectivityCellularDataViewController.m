@implementation CCUIConnectivityCellularDataViewController

- (void)_updateState
{
  const char *v3;
  uint64_t v4;
  const void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (const void *)_CTServerConnectionCreateWithIdentifier();
  if (v5)
  {
    _CTServerConnectionGetCellularDataSettings();
    CFRelease(v5);
    v5 = 0;
  }
  if ((objc_msgSend__isCellularDataButtonDemoMode(self, v3, v4) & 1) == 0)
    objc_msgSend_setEnabled_(self, v6, (uint64_t)v5);
  objc_msgSend_subtitleText(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInoperative_(self, v9, 1);
  objc_msgSend_setSubtitle_(self, v10, (uint64_t)v8);
  v11 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend__debugDescriptionForState_(self, v13, (uint64_t)v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v16 = v14;
    v17 = 1024;
    v18 = 0;
    v19 = 1024;
    v20 = 0;
    v21 = 1024;
    v22 = 0;
    v23 = 2113;
    v24 = v8;
    _os_log_impl(&dword_230FA3000, v12, OS_LOG_TYPE_DEFAULT, "Cellular Data state updated to %{public}@ [ capable: %d enabled: %d airplaneMode: %d subtitle: %{private}@ ]", buf, 0x28u);

  }
}

- (CCUIConnectivityCellularDataViewController)init
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  CCUIConnectivityCellularDataViewController *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v15;

  objc_msgSend_configurationWithPointSize_weight_scale_(MEMORY[0x24BDF6AE0], a2, 6, 2, 18.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v4, (uint64_t)CFSTR("cellularbars"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemGreenColor(MEMORY[0x24BDF6950], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CCUIConnectivityCellularDataViewController;
  v9 = -[CCUIConnectivityButtonViewController initWithGlyphImage:highlightColor:](&v15, sel_initWithGlyphImage_highlightColor_, v5, v8);

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDC2810]);
    v12 = objc_msgSend_initWithQueue_(v10, v11, MEMORY[0x24BDAC9B8]);
    coreTelephonyClient = v9->_coreTelephonyClient;
    v9->_coreTelephonyClient = (CoreTelephonyClient *)v12;

  }
  return v9;
}

- (id)displayName
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.CellularData");
}

- (id)subtitleText
{
  uint64_t v2;
  int isEnabled;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;

  isEnabled = objc_msgSend_isEnabled(self, a2, v2);
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (isEnabled)
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_ON"), &stru_24FFCAEF8, 0);
  else
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_OFF"), &stru_24FFCAEF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)buttonTapped:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend__toggleState(self, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v7, sel_buttonTapped_, v4);

}

+ (BOOL)isSupported
{
  return MGGetBoolAnswer();
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
  v15.super_class = (Class)CCUIConnectivityCellularDataViewController;
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

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityCellularDataViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityCellularDataViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_toggleState
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  int isEnabled;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend__isCellularDataButtonDemoMode(self, a2, v2))
  {
    isEnabled = objc_msgSend_isEnabled(self, v4, v5);
    objc_msgSend_setEnabled_(self, v7, isEnabled ^ 1u);
  }
  else
  {
    _CTServerConnectionCreateWithIdentifier();
    _CTServerConnectionGetCellularDataIsEnabled();
    v10 = (void *)*MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend__debugDescriptionForState_(self, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_230FA3000, v11, OS_LOG_TYPE_DEFAULT, "Toggle Cellular Data state from %{public}@", buf, 0xCu);

    }
    _CTServerConnectionSetCellularDataIsEnabled();
  }
  objc_msgSend__updateState(self, v8, v9);
  return 1;
}

- (BOOL)_isCellularDataRestricted
{
  uint64_t v2;
  void *v3;
  const char *v4;
  BOOL v5;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_effectiveBoolValueForSetting_(v3, v4, *MEMORY[0x24BE637A8]) == 2;

  return v5;
}

- (BOOL)_isCellularDataButtonDemoMode
{
  int v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  char v7;

  v2 = CCSIsInternalInstall();
  if (v2)
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("ControlCenterCellularDataButtonDemoMode"));

    LOBYTE(v2) = v7;
  }
  return v2;
}

- (BOOL)_multipleSubscriptionsAvailable
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  char isEnabled;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  id v17;

  coreTelephonyClient = self->_coreTelephonyClient;
  v17 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, a2, (uint64_t)&v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7)
  {
    v8 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_ERROR))
      sub_230FB31E0((uint64_t)v7, v8);
  }
  isEnabled = objc_msgSend_isEnabled(self, v5, v6);
  objc_msgSend_subscriptionsInUse(v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v12, v13, v14);

  if (v15 <= 1)
    isEnabled = 0;

  return isEnabled;
}

- (void)startObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v7, sel_startObservingStateChanges);
  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v5, v6, (uint64_t)self);

}

- (void)stopObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v7, sel_stopObservingStateChanges);
  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v5, v6, (uint64_t)self);

}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3)
    return CFSTR("on");
  else
    return CFSTR("off");
}

- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3
{
  CCUIConnectivityCellularModuleViewController *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;

  if (objc_msgSend__multipleSubscriptionsAvailable(self, a2, (uint64_t)a3))
  {
    v4 = objc_alloc_init(CCUIConnectivityCellularModuleViewController);
    objc_msgSend_contentModuleContext(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentModuleContext_(v4, v8, (uint64_t)v7);

    objc_msgSend_displayName(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v4, v12, (uint64_t)v11);

    objc_msgSend_setModalPresentationStyle_(v4, v13, 4);
    self->_presentingMenuViewController = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4;
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
    v10[2] = sub_230FAB910;
    v10[3] = &unk_24FFCA950;
    v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);

  }
}

- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  self->_presentingMenuViewController = 0;
}

- (void)presentMenuModule
{
  ((void (*)(CCUIContentModuleDetailClickPresentationInteractionManager *, char *))MEMORY[0x24BEDD108])(self->_clickPresentationInteractionManager, sel_presentViewController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end
