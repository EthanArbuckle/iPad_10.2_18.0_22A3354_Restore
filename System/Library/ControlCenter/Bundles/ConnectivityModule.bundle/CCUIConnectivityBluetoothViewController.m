@implementation CCUIConnectivityBluetoothViewController

- (void)stopObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityBluetoothViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v11, sel_stopObservingStateChanges);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, *MEMORY[0x24BE0F9D0], self->_bluetoothManager);

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, *MEMORY[0x24BE0F930], self->_bluetoothManager);

}

- (CCUIConnectivityBluetoothViewController)init
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
  CCUIConnectivityBluetoothViewController *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  BluetoothManager *bluetoothManager;
  NSArray *connectedDeviceNames;
  objc_super v20;

  v3 = (void *)MEMORY[0x24BE19B00];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("Bluetooth"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)CCUIConnectivityBluetoothViewController;
  v13 = -[CCUIConnectivityButtonViewController initWithGlyphPackageDescription:highlightColor:](&v20, sel_initWithGlyphPackageDescription_highlightColor_, v9, v12);

  if (v13)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE0F9E0], v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    bluetoothManager = v13->_bluetoothManager;
    v13->_bluetoothManager = (BluetoothManager *)v16;

    connectedDeviceNames = v13->_connectedDeviceNames;
    v13->_connectedDeviceNames = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v13;
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
  v7.super_class = (Class)CCUIConnectivityBluetoothViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v7, sel_buttonTapped_, v4);

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
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_NAME"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.Bluetooth");
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
  v15.super_class = (Class)CCUIConnectivityBluetoothViewController;
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
  const char *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityBluetoothViewController;
  -[CCUIConnectivityBluetoothViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
  objc_msgSend__updateConnectedDeviceNames(self, v8, v9);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityBluetoothViewController;
  -[CCUIConnectivityBluetoothViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
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
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityBluetoothViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v11, sel_startObservingStateChanges);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)self, sel__bluetoothStateDidChange_, *MEMORY[0x24BE0F9D0], self->_bluetoothManager);

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v9, v10, (uint64_t)self, sel__bluetoothConnectionStatusDidChange_, *MEMORY[0x24BE0F930], self->_bluetoothManager);

}

- (BOOL)showsMenuModuleAsPrimaryAction
{
  return 1;
}

- (void)presentMenuModule
{
  ((void (*)(CCUIContentModuleDetailClickPresentationInteractionManager *, char *))MEMORY[0x24BEDD108])(self->_clickPresentationInteractionManager, sel_presentViewController);
}

- (void)_toggleState
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  BluetoothManager *bluetoothManager;
  const char *v12;
  _QWORD v13[5];
  id v14;
  int v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__currentState(self, a2, v2);
  v6 = objc_msgSend__stateWithOverridesApplied_(self, v5, v4);
  v7 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend__debugDescriptionForState_(self, v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_230FA3000, v8, OS_LOG_TYPE_DEFAULT, "[Bluetooth (Connectivity)] Toggle Bluetooth state from %{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  bluetoothManager = self->_bluetoothManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_230FA6890;
  v13[3] = &unk_24FFCA928;
  v13[4] = self;
  v15 = v6;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend_bluetoothStateActionWithCompletion_(bluetoothManager, v12, (uint64_t)v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_presentBehaviorPromptWithCompletion:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)CFSTR("CONTROL_CENTER_BLUETOOTH_BEHAVIOR_ALERT_TITLE"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR("CONTROL_CENTER_BLUETOOTH_BEHAVIOR_ALERT_MESSAGE"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_presentAlertWithTitle_message_completion_(self, v16, (uint64_t)v17, v15, v5);
}

- (void)_bluetoothStateDidChange:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[16];

  v4 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_230FA3000, v4, OS_LOG_TYPE_DEFAULT, "[Bluetooth (Connectivity)] Bluetooth state changed", v7, 2u);
  }
  objc_msgSend__updateState(self, v5, v6);
}

- (void)_bluetoothConnectionStatusDidChange:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint8_t v9[16];

  v4 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_230FA3000, v4, OS_LOG_TYPE_DEFAULT, "[Bluetooth (Connectivity)] Bluetooth connection status changed", v9, 2u);
  }
  objc_msgSend__updateState(self, v5, v6);
  objc_msgSend__updateConnectedDeviceNames(self, v7, v8);
}

- (void)_updateState
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend__currentState(self, a2, v2);
  objc_msgSend__updateWithState_(self, v5, v4);
}

- (void)_updateWithState:(int)a3
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
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__stateWithOverridesApplied_(self, a2, *(uint64_t *)&a3);
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
    v24 = 138544387;
    v25 = v23;
    v26 = 1024;
    v27 = v6;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = v14;
    v32 = 2113;
    v33 = v12;
    _os_log_impl(&dword_230FA3000, v21, OS_LOG_TYPE_DEFAULT, "[Bluetooth (Connectivity)] Bluetooth state updated to %{public}@ [ inoperative: %d enabled: %d useAlternateBackground: %d subtitle: %{private}@ ]", (uint8_t *)&v24, 0x28u);

  }
}

- (int)_currentState
{
  return ((uint64_t (*)(BluetoothManager *, char *))MEMORY[0x24BEDD108])(self->_bluetoothManager, sel_bluetoothState);
}

- (int)_stateWithOverridesApplied:(int)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  char shouldExcludeControlCenterFromStatusBarOverrides;
  const char *v10;
  uint64_t v11;
  _BYTE *StatusBarOverrideData;

  if (CCSIsInternalInstall())
  {
    objc_msgSend_standardDefaults(MEMORY[0x24BE19A20], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    shouldExcludeControlCenterFromStatusBarOverrides = objc_msgSend_shouldExcludeControlCenterFromStatusBarOverrides(v6, v7, v8);

    if ((shouldExcludeControlCenterFromStatusBarOverrides & 1) == 0)
    {
      StatusBarOverrideData = (_BYTE *)objc_msgSend_getStatusBarOverrideData(MEMORY[0x24BDF6DE0], v10, v11);
      if (StatusBarOverrideData[16])
      {
        if (StatusBarOverrideData[80])
        {
          if ((StatusBarOverrideData[2593] & 1) != 0)
            return 3;
          else
            return 2;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return a3;
}

- (id)_subtitleTextWithState:(int)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;

  switch(a3)
  {
    case 2:
      v11 = (void *)MEMORY[0x24BDD1488];
      v12 = objc_opt_class();
      objc_msgSend_bundleForClass_(v11, v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_DISCONNECTED"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
      break;
    case 4:
      v16 = (void *)MEMORY[0x24BDD1488];
      v17 = objc_opt_class();
      objc_msgSend_bundleForClass_(v16, v18, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v19, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_BUSY"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
      break;
    case 3:
      v4 = objc_msgSend_count(self->_connectedDeviceNames, a2, *(uint64_t *)&a3);
      v7 = (void *)v4;
      if (v4)
      {
        if (v4 == 1)
        {
          objc_msgSend_firstObject(self->_connectedDeviceNames, v5, v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend_length(v7, v8, v9);
LABEL_17:
          if (v10)
            return v7;
          v33 = (void *)MEMORY[0x24BDD1488];
          v34 = objc_opt_class();
          objc_msgSend_bundleForClass_(v33, v35, v34);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedStringForKey_value_table_(v14, v36, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_ON"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
          v37 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v37;
          goto LABEL_12;
        }
        v25 = (void *)MEMORY[0x24BDD17C8];
        v26 = (void *)MEMORY[0x24BDD1488];
        v27 = objc_opt_class();
        objc_msgSend_bundleForClass_(v26, v28, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v29, v30, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_DEVICES"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringWithFormat_(v25, v32, (uint64_t)v31, v7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v10 = objc_msgSend_length(v7, v5, v6);
      goto LABEL_17;
    default:
      if (a3 > 1)
      {
        v7 = 0;
        return v7;
      }
      v20 = (void *)MEMORY[0x24BDD1488];
      v21 = objc_opt_class();
      objc_msgSend_bundleForClass_(v20, v22, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v23, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_OFF"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
      break;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

- (void)_updateConnectedDeviceNames
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FA7230;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)_inoperativeForState:(int)a3
{
  return (a3 - 5) < 0xFFFFFFFC;
}

- (BOOL)_enabledForState:(int)a3
{
  return a3 == 3;
}

- (id)_glyphStateForState:(int)a3
{
  if ((a3 - 2) > 2)
    return CFSTR("poweroff");
  else
    return off_24FFCA970[a3 - 2];
}

- (id)_debugDescriptionForState:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("unavailable");
  else
    return off_24FFCA988[a3 - 1];
}

- (BOOL)_useAlternateSelectedBackgroundForState:(int)a3
{
  return ((a3 - 2) & 0xFFFFFFFD) == 0;
}

- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;

  v4 = objc_msgSend__currentState(self, a2, (uint64_t)a3);
  v6 = objc_msgSend__stateWithOverridesApplied_(self, v5, v4);
  if ((objc_msgSend__inoperativeForState_(self, v7, v6) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    if ((v6 - 3) >= 2)
      objc_msgSend__toggleState(self, v8, v9);
    v10 = objc_alloc_init(MEMORY[0x24BE19A18]);
    objc_msgSend_contentModuleContext(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentModuleContext_(v10, v14, (uint64_t)v13);

    objc_msgSend_setModalPresentationStyle_(v10, v15, 4);
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
    v10[2] = sub_230FA748C;
    v10[3] = &unk_24FFCA950;
    v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);

  }
}

- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  self->_presentingMenuViewController = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);
  objc_storeStrong((id *)&self->_connectedDeviceNames, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
