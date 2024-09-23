@implementation CCUILowPowerModuleViewController

- (CCUILowPowerModuleViewController)init
{
  CCUILowPowerModuleViewController *v2;
  _PMLowPowerMode *v3;
  _PMLowPowerMode *lowPowerMode;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  PowerUISmartChargeClient *smartChargeClient;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)CCUILowPowerModuleViewController;
  v2 = -[CCUILowPowerModuleViewController init](&v10, sel_init);
  if (v2)
  {
    v3 = (_PMLowPowerMode *)objc_alloc_init(MEMORY[0x24BE60CC8]);
    lowPowerMode = v2->_lowPowerMode;
    v2->_lowPowerMode = v3;

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)qword_25414D210;
    v15 = qword_25414D210;
    if (!qword_25414D210)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = sub_2310093F0;
      v11[3] = &unk_24FFDE888;
      v11[4] = &v12;
      sub_2310093F0((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend([v6 alloc], "initWithClientName:", CFSTR("BatteryModule"));
    smartChargeClient = v2->_smartChargeClient;
    v2->_smartChargeClient = (PowerUISmartChargeClient *)v7;

    -[CCUILowPowerModuleViewController _observeSystemNotifications](v2, "_observeSystemNotifications");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CCUILowPowerModuleViewController _unobserveSystemNotifications](self, "_unobserveSystemNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CCUILowPowerModuleViewController;
  -[CCUILowPowerModuleViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUILowPowerModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUILowPowerModuleViewController reconfigureView](self, "reconfigureView");
  -[CCUILowPowerModuleViewController refreshStateAnimated:](self, "refreshStateAnimated:", 0);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUILowPowerModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_, a3);
  -[CCUILowPowerModuleViewController glyphPackageDescription](self, "glyphPackageDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v4);

  -[CCUILowPowerModuleViewController refreshStateAnimated:](self, "refreshStateAnimated:", 0);
}

- (void)reconfigureView
{
  void *v3;
  void *v4;
  void *v5;

  -[CCUILowPowerModuleViewController glyphPackageDescription](self, "glyphPackageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v3);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_TITLE"), &stru_24FFDE900, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v5);

  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 1);
  MEMORY[0x24BEDD108](self, sel_setUseTrailingCheckmarkLayout_);
}

- (void)refreshStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_231008838;
  v9[3] = &unk_24FFDE810;
  v9[4] = self;
  v5 = (void *)MEMORY[0x2348CDAB0](v9, a2);
  if (v3)
  {
    v6 = (void *)MEMORY[0x24BE19B10];
    -[CCUILowPowerModuleViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performWithoutAnimationWhileHiddenInWindow:actions:", v8, v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v5);
  }

}

- (id)_makeLocalizedMenuItem:(id)a3 handler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_24FFDE900, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19B60]), "initWithTitle:identifier:handler:", v9, v9, v6);
  return v10;
}

- (void)_configureMenu
{
  id v3;
  uint64_t v4;
  void *v5;
  PowerUISmartChargeClient *smartChargeClient;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_231008B78;
  v24[3] = &unk_24FFDE838;
  objc_copyWeak(&v25, &location);
  -[CCUILowPowerModuleViewController _makeLocalizedMenuItem:handler:](self, "_makeLocalizedMenuItem:handler:", CFSTR("CONTROL_CENTER_TITLE"), v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", -[CCUILowPowerModuleViewController isSelected](self, "isSelected"));
  objc_msgSend(v3, "addObject:", v5);
  smartChargeClient = self->_smartChargeClient;
  v23 = 0;
  v7 = -[PowerUISmartChargeClient isMCMCurrentlyEnabled:](smartChargeClient, "isMCMCurrentlyEnabled:", &v23);
  v8 = v23;
  if (v8)
  {
    v9 = *MEMORY[0x24BE19A98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19A98], OS_LOG_TYPE_ERROR))
      sub_231009504(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    if (-[CCUILowPowerModuleViewController isEAconnected](self, "isEAconnected"))
    {
      v18 = v4;
      v19 = 3221225472;
      v20 = sub_231008BA8;
      v21 = &unk_24FFDE838;
      objc_copyWeak(&v22, &location);
      -[CCUILowPowerModuleViewController _makeLocalizedMenuItem:handler:](self, "_makeLocalizedMenuItem:handler:", CFSTR("MENU_MCM_DISABLE"), &v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelected:", v7 == 2, v18, v19, v20, v21);
      objc_msgSend(v3, "addObject:", v17);

      objc_destroyWeak(&v22);
    }
    -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", v3);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (id)glyphPackageDescription
{
  _BOOL4 v2;
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = CFSTR("LowPower");
  if (v2)
    v3 = CFSTR("LowPower_IC");
  v4 = (void *)MEMORY[0x24BE19B00];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = v3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForPackageNamed:inBundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFlipsForRightToLeftLayoutDirection:", 1);
  return v8;
}

- (id)glyphState
{
  if (-[CCUIButtonModuleViewController appearsSelected](self, "appearsSelected"))
    return CFSTR("enabled");
  else
    return CFSTR("disabled");
}

- (BOOL)isSelected
{
  return -[_PMLowPowerMode getPowerMode](self->_lowPowerMode, "getPowerMode") == 1;
}

- (BOOL)isEAconnected
{
  PowerUISmartChargeClient *smartChargeClient;
  BOOL result;
  uint64_t v4;

  smartChargeClient = self->_smartChargeClient;
  v4 = 0;
  result = -[PowerUISmartChargeClient shouldMCMBeDisplayed:](smartChargeClient, "shouldMCMBeDisplayed:", &v4);
  if (v4)
    return 0;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return MGGetBoolAnswer();
}

- (void)_observeSystemNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateState, *MEMORY[0x24BDD1160], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_231008E24();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateState, v5, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateForDarkerSystemColorsChange, *MEMORY[0x24BDF7230], 0);

}

- (void)_unobserveSystemNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD1160], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_231008E24();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF7230], 0);

}

- (void)_updateState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_231008FD4;
  block[3] = &unk_24FFDE810;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)toggleLowPowerMode
{
  -[CCUILowPowerModuleViewController isSelected](self, "isSelected");
  MEMORY[0x24BEDD108](self, sel_setLowPowerMode_);
}

- (void)setLowPowerMode:(BOOL)a3
{
  _BOOL4 v3;
  _PMLowPowerMode *lowPowerMode;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v3 = a3;
  if (-[CCUILowPowerModuleViewController isSelected](self, "isSelected") != a3)
  {
    objc_initWeak(&location, self);
    lowPowerMode = self->_lowPowerMode;
    v6 = *MEMORY[0x24BE60CD0];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_2310090F4;
    v7[3] = &unk_24FFDE860;
    v9 = v3;
    objc_copyWeak(&v8, &location);
    -[_PMLowPowerMode setPowerMode:fromSource:withCompletion:](lowPowerMode, "setPowerMode:fromSource:withCompletion:", v3, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)toggleMobileChargeMode
{
  PowerUISmartChargeClient *smartChargeClient;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  smartChargeClient = self->_smartChargeClient;
  v14 = 0;
  v4 = -[PowerUISmartChargeClient isMCMCurrentlyEnabled:](smartChargeClient, "isMCMCurrentlyEnabled:", &v14);
  v5 = v14;
  if (v5)
  {
    v6 = *MEMORY[0x24BE19A98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19A98], OS_LOG_TYPE_ERROR))
      sub_231009504(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    -[CCUILowPowerModuleViewController setMobileChargeMode:](self, "setMobileChargeMode:", v4 != 1);
  }

}

- (void)setMobileChargeMode:(BOOL)a3
{
  PowerUISmartChargeClient *smartChargeClient;
  id *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  smartChargeClient = self->_smartChargeClient;
  if (a3)
  {
    v15 = 0;
    v4 = (id *)&v15;
    -[PowerUISmartChargeClient enableMCM:](smartChargeClient, "enableMCM:", &v15);
  }
  else
  {
    v14 = 0;
    v4 = (id *)&v14;
    -[PowerUISmartChargeClient temporarilyDisableMCM:](smartChargeClient, "temporarilyDisableMCM:", &v14);
  }
  v5 = *v4;
  if (v5)
  {
    v6 = *MEMORY[0x24BE19A98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19A98], OS_LOG_TYPE_ERROR))
      sub_2310095A8(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargeClient, 0);
  objc_storeStrong((id *)&self->_lowPowerMode, 0);
}

@end
