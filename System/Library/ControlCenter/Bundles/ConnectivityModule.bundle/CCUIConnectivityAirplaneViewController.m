@implementation CCUIConnectivityAirplaneViewController

- (void)startObservingStateChanges
{
  NSObject *queue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityAirplaneViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v5, sel_startObservingStateChanges);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FA8354;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityAirplaneViewController;
  -[CCUIConnectivityAirplaneViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (CCUIConnectivityAirplaneViewController)init
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
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("AirplaneGlyph"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageFlippedForRightToLeftLayoutDirection(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemOrangeColor(MEMORY[0x24BDF6950], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CCUIConnectivityAirplaneViewController;
  v16 = -[CCUIConnectivityButtonViewController initWithGlyphImage:highlightColor:](&v24, sel_initWithGlyphImage_highlightColor_, v12, v15);

  if (v16)
  {
    v17 = dispatch_queue_create("com.apple.ControlCenter.AirplaneViewController", 0);
    v18 = (void *)*((_QWORD *)v16 + 138);
    *((_QWORD *)v16 + 138) = v17;

    v19 = objc_alloc(MEMORY[0x24BE04788]);
    v21 = objc_msgSend_initWithQueue_(v19, v20, *((_QWORD *)v16 + 138));
    v22 = (void *)*((_QWORD *)v16 + 137);
    *((_QWORD *)v16 + 137) = v21;

  }
  return (CCUIConnectivityAirplaneViewController *)v16;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FA8180;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivityAirplaneViewController;
  -[CCUIConnectivityAirplaneViewController dealloc](&v4, sel_dealloc);
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
  v7.super_class = (Class)CCUIConnectivityAirplaneViewController;
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
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_AIRPLANE_MODE_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.Airplane");
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
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_AIRPLANE_MODE_ON"), &stru_24FFCAEF8, 0);
  else
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_AIRPLANE_MODE_OFF"), &stru_24FFCAEF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityAirplaneViewController;
  -[CCUIConnectivityAirplaneViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (void)stopObservingStateChanges
{
  NSObject *queue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityAirplaneViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v5, sel_stopObservingStateChanges);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FA8410;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)airplaneModeChanged
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  char v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230FA3000, v3, OS_LOG_TYPE_DEFAULT, "Airplane Mode state changed", buf, 2u);
  }
  v6 = objc_msgSend_airplaneMode(self->_airplaneModeController, v4, v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FA84FC;
  v7[3] = &unk_24FFCA9D0;
  v7[4] = self;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);
}

- (void)_setAirplaneModeEnabled:(BOOL)a3
{
  uint64_t v4;
  const char *v5;

  self->_airplaneModeEnabled = a3;
  v4 = objc_msgSend__stateWithEffectiveOverrides(self, a2, a3);
  objc_msgSend_setEnabled_(self, v5, v4);
}

- (void)_updateState
{
  NSObject *queue;
  const char *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FA85F4;
  v5[3] = &unk_24FFCA9F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  objc_msgSend__updateStateWithEnabled_(self, v4, *((unsigned __int8 *)v7 + 24));
  _Block_object_dispose(&v6, 8);
}

- (void)_updateStateWithEnabled:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend__setAirplaneModeEnabled_(self, v5, v3);
  objc_msgSend_subtitleText(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(self, v9, (uint64_t)v8);

  v10 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend__debugDescriptionForState_(self, v12, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_230FA3000, v11, OS_LOG_TYPE_DEFAULT, "Airplane Mode state updated to %{public}@", (uint8_t *)&v14, 0xCu);

  }
}

- (BOOL)_toggleState
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  NSObject *queue;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__isAirplaneModeEnabled(self, a2, v2) ^ 1;
  v5 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend__debugDescriptionForState_(self, v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_230FA3000, v6, OS_LOG_TYPE_DEFAULT, "Toggle AirPlane Mode state to %{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_230FA8858;
  v11[3] = &unk_24FFCA9D0;
  v11[4] = self;
  v12 = v4;
  dispatch_sync(queue, v11);
  return 1;
}

- (BOOL)_stateWithEffectiveOverrides
{
  uint64_t v2;
  int airplaneModeEnabled;
  const char *v4;
  uint64_t v5;

  airplaneModeEnabled = self->_airplaneModeEnabled;
  if (objc_msgSend__isStateOverridden(self, a2, v2))
    airplaneModeEnabled = *(unsigned __int8 *)(objc_msgSend_getStatusBarOverrideData(MEMORY[0x24BDF6DE0], v4, v5) + 67);
  return airplaneModeEnabled != 0;
}

- (BOOL)_isStateOverridden
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_standardDefaults(MEMORY[0x24BE19A20], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_shouldExcludeControlCenterFromStatusBarOverrides(v3, v4, v5) & 1) != 0)
  {

  }
  else
  {
    v6 = CCSIsInternalInstall();

    if ((v6 & 1) != 0)
      return *(_BYTE *)(objc_msgSend_getStatusBarOverrideData(MEMORY[0x24BDF6DE0], v7, v8) + 3) != 0;
  }
  return 0;
}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3)
    return CFSTR("on");
  else
    return CFSTR("off");
}

- (RadiosPreferences)airplaneModeController
{
  return self->_airplaneModeController;
}

- (void)setAirplaneModeController:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneModeController, a3);
}

- (BOOL)_isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_airplaneModeController, 0);
}

@end
