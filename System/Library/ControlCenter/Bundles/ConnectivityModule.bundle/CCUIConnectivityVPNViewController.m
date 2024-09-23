@implementation CCUIConnectivityVPNViewController

- (CCUIConnectivityVPNViewController)init
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CCUIConnectivityVPNViewController *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  objc_msgSend_configurationWithPointSize_weight_scale_(MEMORY[0x24BDF6AE0], a2, 6, 2, 22.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v4, (uint64_t)CFSTR("network.connected.to.line.below.fill"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageFlippedForRightToLeftLayoutDirection(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CCUIConnectivityVPNViewController;
  v12 = -[CCUIConnectivityButtonViewController initWithGlyphImage:highlightColor:](&v17, sel_initWithGlyphImage_highlightColor_, v8, v11);

  if (v12)
  {
    objc_msgSend_sharedInstance(CCUIConnectivityManager, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_connectivityManager, v15);

  }
  return v12;
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
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_VPN_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.VPN");
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
  v7.super_class = (Class)CCUIConnectivityVPNViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v7, sel_buttonTapped_, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityVPNViewController;
  -[CCUIConnectivityVPNViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityVPNViewController;
  -[CCUIConnectivityVPNViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
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
  v7.super_class = (Class)CCUIConnectivityVPNViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v7, sel_startObservingStateChanges);
  objc_msgSend_connectivityManager(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addVPNViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);

}

- (void)stopObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityVPNViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v7, sel_stopObservingStateChanges);
  objc_msgSend_connectivityManager(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeVPNViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);

}

- (void)_toggleState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEnabled;
  const char *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_connectivityManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vpnConnectivityManager(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEnabled = objc_msgSend_isEnabled(self, v8, v9);
  objc_msgSend_toggleVPNConnectivity_(v7, v11, isEnabled ^ 1u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE19AA0];
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_ERROR))
      sub_230FB316C((uint64_t)v12, v13);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("On");
    if (isEnabled)
      v14 = CFSTR("Off");
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_230FA3000, v13, OS_LOG_TYPE_DEFAULT, "[VPN] Toggling VPN %{public}@", (uint8_t *)&v15, 0xCu);
  }

}

- (void)_updateState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_connectivityManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vpnConnectivityManager(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_visibilityStyle(v7, v8, v9);
  v14 = objc_msgSend_connectivityState(v7, v11, v12);
  switch(v14)
  {
    case 0:
    case 4:
      v15 = (void *)MEMORY[0x24BDD1488];
      v16 = objc_opt_class();
      objc_msgSend_bundleForClass_(v15, v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v19, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_VPN_OFF"), &stru_24FFCAEF8, 0);
      goto LABEL_7;
    case 1:
      v26 = (void *)MEMORY[0x24BDD1488];
      v27 = objc_opt_class();
      objc_msgSend_bundleForClass_(v26, v28, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v29, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_VPN_CONNECTING"), &stru_24FFCAEF8, 0);
      goto LABEL_7;
    case 2:
    case 5:
      v20 = (void *)MEMORY[0x24BDD1488];
      v21 = objc_opt_class();
      objc_msgSend_bundleForClass_(v20, v22, v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v23, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_VPN_ON"), &stru_24FFCAEF8, 0);
      goto LABEL_7;
    case 3:
      v30 = (void *)MEMORY[0x24BDD1488];
      v31 = objc_opt_class();
      objc_msgSend_bundleForClass_(v30, v32, v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v33, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_VPN_DISCONNECTING"), &stru_24FFCAEF8, 0);
LABEL_7:
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setSubtitle_(self, v34, (uint64_t)v24);
      break;
    default:
      v24 = 0;
      objc_msgSend_setSubtitle_(self, v13, 0);
      break;
  }
  objc_msgSend_setInoperative_(self, v25, v10 == 0);
  if (v14 == 2 || v14 == 5)
  {
    v37 = 1;
    objc_msgSend_setEnabled_(self, v35, 1);
  }
  else
  {
    v37 = 0;
    objc_msgSend_setEnabled_(self, v35, 0);
  }
  v38 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)MEMORY[0x24BDD16E0];
    v40 = v38;
    objc_msgSend_numberWithBool_(v39, v41, v10 == 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v43, v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138543874;
    v46 = v24;
    v47 = 2114;
    v48 = v42;
    v49 = 2114;
    v50 = v44;
    _os_log_impl(&dword_230FA3000, v40, OS_LOG_TYPE_DEFAULT, "[VPN] Updated VPN control (subtitle: %{public}@, inoperative: %{public}@, enabled: %{public}@)", (uint8_t *)&v45, 0x20u);

  }
}

- (CCUIConnectivityManager)connectivityManager
{
  return (CCUIConnectivityManager *)objc_loadWeakRetained((id *)&self->_connectivityManager);
}

- (void)setConnectivityManager:(id)a3
{
  objc_storeWeak((id *)&self->_connectivityManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectivityManager);
}

@end
