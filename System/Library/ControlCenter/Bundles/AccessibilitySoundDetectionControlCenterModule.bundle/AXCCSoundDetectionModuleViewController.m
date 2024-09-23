@implementation AXCCSoundDetectionModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXCCSoundDetectionModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("SoundDetectionIcon"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphImage:](self, "setGlyphImage:", v4);
  -[AXCCSoundDetectionModuleViewController _calculateAmountOfVisibleItems](self, "_calculateAmountOfVisibleItems");
  -[CCUIMenuModuleViewController setVisibleMenuItems:](self, "setVisibleMenuItems:");
  -[CCUIMenuModuleViewController setUseTrailingCheckmarkLayout:](self, "setUseTrailingCheckmarkLayout:", 1);
  sub_230F76B30(CFSTR("sound.recognition.title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v5);

  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 1);
  objc_initWeak(&location, self);
  sub_230F76B30(CFSTR("settings.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_230F76F08;
  v11[3] = &unk_24FFC2BA8;
  objc_copyWeak(&v12, &location);
  -[CCUIMenuModuleViewController setFooterButtonTitle:handler:](self, "setFooterButtonTitle:handler:", v6, v11);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = sub_230F76F48;
  v9[3] = &unk_24FFC2BD0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v9, sel_soundDetectionState, self);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  _DWORD v23[2];
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl(&dword_230F75000, v5, OS_LOG_TYPE_INFO, "SR CC Button Tapped.", (uint8_t *)v23, 2u);
  }

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "soundDetectionState"))
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[AXCCSoundDetectionModuleViewController soundDetectionDelegate](self, "soundDetectionDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openSoundDetectionSettings");
      goto LABEL_10;
    }
    LOWORD(v23[0]) = 0;
    v9 = "SR CC Button Tapped - Sound Detection State is OFF. Directing the user to settings.";
LABEL_8:
    _os_log_impl(&dword_230F75000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)v23, 2u);
    goto LABEL_9;
  }
  objc_msgSend(v6, "supportedSoundDetectionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

    goto LABEL_12;
  }
  objc_msgSend(v6, "enabledKShotDetectorIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    LOWORD(v23[0]) = 0;
    v9 = "SR CC Button Tapped - no detectors supported. Directing the user to settings";
    goto LABEL_8;
  }
LABEL_12:
  objc_msgSend(v6, "enabledSoundDetectionTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v6, "enabledKShotDetectorIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
      goto LABEL_15;
    AXLogUltron();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_230F75000, v21, OS_LOG_TYPE_INFO, "SR CC Button Tapped - no detectors on. Expanding module", (uint8_t *)v23, 2u);
    }

    -[AXCCSoundDetectionModuleViewController module](self, "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentModuleContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "requestExpandModule");

LABEL_10:
    goto LABEL_24;
  }

LABEL_15:
  v16 = objc_msgSend(v6, "soundDetectionState");
  AXLogUltron();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning");
    v19 = -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert");
    v23[0] = 67109632;
    v23[1] = v16 != 2;
    v24 = 1024;
    v25 = v18;
    v26 = 1024;
    v27 = v19;
    _os_log_impl(&dword_230F75000, v17, OS_LOG_TYPE_INFO, "SR CC Button Tapped with detectors already on. shouldEnable: %d, isHSRunning: %d, needsHSAlert: %d", (uint8_t *)v23, 0x14u);
  }

  if (v16 != 2
    && -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert")
    && -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning"))
  {
    AXLogUltron();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_230F75000, v20, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)v23, 2u);
    }

    -[AXCCSoundDetectionModuleViewController _showConfirmationAlertForType:](self, "_showConfirmationAlertForType:", 0);
  }
  else
  {
    -[AXCCSoundDetectionModuleViewController _confirmedEnableSoundDetection:](self, "_confirmedEnableSoundDetection:", v16 != 2);
  }
LABEL_24:

}

- (void)_confirmedEnableSoundDetection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v5, "setSoundDetectionState:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "setSelected:", v3);

  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v3);
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedSoundDetectionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_axSettingsDidChange
{
  id v3;

  if (!-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", objc_msgSend(v3, "soundDetectionState") == 2);

  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AXCCSoundDetectionModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v6, sel_willTransitionToExpandedContentMode_);
  -[AXCCSoundDetectionModuleViewController _configureMenuItems](self, "_configureMenuItems");
  if (v3)
  {
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", 0);
  }
  else
  {
    -[AXCCSoundDetectionModuleViewController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", objc_msgSend(v5, "isSelected"));

  }
}

- (double)_calculateAmountOfVisibleItems
{
  void *v2;
  void *v3;
  unint64_t v4;
  double result;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedSoundDetectionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  result = 5.5;
  if (v4 <= 5)
    return (double)v4;
  return result;
}

- (void)_toggleSoundDetectionStatusForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledSoundDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enabledSoundDetectionTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v4) ^ 1;

  }
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138413058;
    v13 = v4;
    v14 = 1024;
    v15 = v7;
    v16 = 1024;
    v17 = -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning");
    v18 = 1024;
    v19 = -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert");
    _os_log_impl(&dword_230F75000, v10, OS_LOG_TYPE_INFO, "Toggle Detector: %@. isTransitioningToRunning = %d. isHSRunning = %d, needsHSAlert = %d", (uint8_t *)&v12, 0x1Eu);
  }

  if (v7
    && -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert")
    && -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning"))
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_230F75000, v11, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)&v12, 2u);
    }

    -[AXCCSoundDetectionModuleViewController _showConfirmationAlertForType:](self, "_showConfirmationAlertForType:", v4);
  }
  else
  {
    -[AXCCSoundDetectionModuleViewController _confirmedToggleSoundDetectionStatusForType:](self, "_confirmedToggleSoundDetectionStatusForType:", v4);
  }

}

- (void)_toggleSoundDetectionStatusForCustomType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledKShotDetectorIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enabledKShotDetectorIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v10) ^ 1;

  }
  AXLogUltron();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v12;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning");
    v20 = 1024;
    v21 = -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert");
    _os_log_impl(&dword_230F75000, v11, OS_LOG_TYPE_INFO, "Toggle Custom Detector: %@. isTransitioningToRunning = %d. isHSRunning = %d, needsHSAlert = %d", (uint8_t *)&v14, 0x1Eu);

  }
  if (v7
    && -[AXCCSoundDetectionModuleViewController _needsHeySiriConfirmationAlert](self, "_needsHeySiriConfirmationAlert")
    && -[AXCCSoundDetectionModuleViewController _isHeySiriRunning](self, "_isHeySiriRunning"))
  {
    AXLogUltron();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_230F75000, v13, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)&v14, 2u);
    }

    -[AXCCSoundDetectionModuleViewController _showConfirmationAlertForCustomType:](self, "_showConfirmationAlertForCustomType:", v4);
  }
  else
  {
    -[AXCCSoundDetectionModuleViewController _confirmedToggleSoundDetectionStatusForCustomType:](self, "_confirmedToggleSoundDetectionStatusForCustomType:", v4);
  }

}

- (void)_confirmedToggleSoundDetectionStatusForType:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledSoundDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "removeSoundDetectionType:", v9);
  else
    objc_msgSend(v7, "addSoundDetectionType:", v9);

  -[AXCCSoundDetectionModuleViewController _configureMenuItems](self, "_configureMenuItems");
  -[AXCCSoundDetectionModuleViewController _updateSoundDetectionState](self, "_updateSoundDetectionState");

}

- (void)_confirmedToggleSoundDetectionStatusForCustomType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDFF278];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabledKShotDetectorIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKShotDetectorIsEnabled:isEnabled:", v5, v9 ^ 1u);

  -[AXCCSoundDetectionModuleViewController _configureMenuItems](self, "_configureMenuItems");
  -[AXCCSoundDetectionModuleViewController _updateSoundDetectionState](self, "_updateSoundDetectionState");
}

- (void)_updateSoundDetectionState
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledSoundDetectionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enabledKShotDetectorIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      v5 = 2;
    else
      v5 = 1;

  }
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSoundDetectionState:", v5);

}

- (BOOL)_needsHeySiriConfirmationAlert
{
  return AXDeviceSupportsConcurrentHPLPMics() ^ 1;
}

- (BOOL)_isHeySiriRunning
{
  NSObject *v2;
  void *v3;
  char v4;
  uint8_t v6[16];

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230F75000, v2, OS_LOG_TYPE_INFO, "Checking is HS Running?", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "voiceTriggerEnabled");

  return v4;
}

- (id)_confirmationAlertController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDF67F0];
  sub_230F76B30(CFSTR("confirmation.alert.title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F76B30(CFSTR("confirmation.alert.body"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDF67E8];
  sub_230F76B30(CFSTR("confirmation.alert.cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v8);
  return v5;
}

- (void)_showConfirmationAlertForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  AXCCSoundDetectionModuleViewController *v14;

  v4 = a3;
  -[AXCCSoundDetectionModuleViewController _confirmationAlertController](self, "_confirmationAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF67E8];
  sub_230F76B30(CFSTR("confirmation.alert.ok"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230F77D88;
  v12[3] = &unk_24FFC2BF8;
  v13 = v4;
  v14 = self;
  v8 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v9);
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_230F75000, v10, OS_LOG_TYPE_INFO, "Presenting confirmation alert.", v11, 2u);
  }

  -[AXCCSoundDetectionModuleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_showConfirmationAlertForCustomType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  AXCCSoundDetectionModuleViewController *v14;

  v4 = a3;
  -[AXCCSoundDetectionModuleViewController _confirmationAlertController](self, "_confirmationAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF67E8];
  sub_230F76B30(CFSTR("confirmation.alert.ok"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230F77ED4;
  v12[3] = &unk_24FFC2BF8;
  v13 = v4;
  v14 = self;
  v8 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v9);
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_230F75000, v10, OS_LOG_TYPE_INFO, "Presenting confirmation alert.", v11, 2u);
  }

  -[AXCCSoundDetectionModuleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_configureMenuItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  _QWORD *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id obj;
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[5];
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[4];
  id v137;
  _QWORD v138[4];
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[5];
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  id location;
  _BYTE v167[128];
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v123 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedSoundDetectionTypes");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodedKShotDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v118, "axFilterObjectsUsingBlock:", &unk_24FFC2C38);
  v120 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "axFilterObjectsUsingBlock:", &unk_24FFC2C58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x24BDFF220];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF220]))
  {
    sub_230F76B30(CFSTR("fire.alarm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE19B60]);
    v164[0] = MEMORY[0x24BDAC760];
    v164[1] = 3221225472;
    v164[2] = sub_230F79558;
    v164[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v165, &location);
    v9 = (void *)objc_msgSend(v8, "initWithTitle:identifier:handler:", v7, v7, v164);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enabledSoundDetectionTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:", objc_msgSend(v11, "containsObject:", *v6));

    objc_msgSend(v123, "addObject:", v9);
    objc_destroyWeak(&v165);

  }
  v12 = (_QWORD *)MEMORY[0x24BDFF258];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF258]))
  {
    sub_230F76B30(CFSTR("siren"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE19B60]);
    v162[0] = MEMORY[0x24BDAC760];
    v162[1] = 3221225472;
    v162[2] = sub_230F79594;
    v162[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v163, &location);
    v15 = (void *)objc_msgSend(v14, "initWithTitle:identifier:handler:", v13, v13, v162);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enabledSoundDetectionTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelected:", objc_msgSend(v17, "containsObject:", *v12));

    objc_msgSend(v123, "addObject:", v15);
    objc_destroyWeak(&v163);

  }
  v18 = (_QWORD *)MEMORY[0x24BDFF260];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF260]))
  {
    sub_230F76B30(CFSTR("smoke.alarm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BE19B60]);
    v160[0] = MEMORY[0x24BDAC760];
    v160[1] = 3221225472;
    v160[2] = sub_230F795D0;
    v160[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v161, &location);
    v21 = (void *)objc_msgSend(v20, "initWithTitle:identifier:handler:", v19, v19, v160);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "enabledSoundDetectionTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSelected:", objc_msgSend(v23, "containsObject:", *v18));

    objc_msgSend(v123, "addObject:", v21);
    objc_destroyWeak(&v161);

  }
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v157;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v157 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
        objc_msgSend(v27, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc(MEMORY[0x24BE19B60]);
        v154[0] = MEMORY[0x24BDAC760];
        v154[1] = 3221225472;
        v154[2] = sub_230F7960C;
        v154[3] = &unk_24FFC2C80;
        objc_copyWeak(&v155, &location);
        v154[4] = v27;
        v30 = (void *)objc_msgSend(v29, "initWithTitle:identifier:handler:", v28, v28, v154);
        objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "enabledKShotDetectorIdentifiers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSelected:", objc_msgSend(v32, "containsObject:", v33));

        objc_msgSend(v123, "addObject:", v30);
        objc_destroyWeak(&v155);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
    }
    while (v24);
  }

  v34 = (_QWORD *)MEMORY[0x24BDFF1F0];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1F0]))
  {
    sub_230F76B30(CFSTR("cat"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x24BE19B60]);
    v152[0] = MEMORY[0x24BDAC760];
    v152[1] = 3221225472;
    v152[2] = sub_230F79644;
    v152[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v153, &location);
    v37 = (void *)objc_msgSend(v36, "initWithTitle:identifier:handler:", v35, v35, v152);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "enabledSoundDetectionTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSelected:", objc_msgSend(v39, "containsObject:", *v34));

    objc_msgSend(v123, "addObject:", v37);
    objc_destroyWeak(&v153);

  }
  v40 = (_QWORD *)MEMORY[0x24BDFF208];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF208]))
  {
    sub_230F76B30(CFSTR("dog"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x24BE19B60]);
    v150[0] = MEMORY[0x24BDAC760];
    v150[1] = 3221225472;
    v150[2] = sub_230F79680;
    v150[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v151, &location);
    v43 = (void *)objc_msgSend(v42, "initWithTitle:identifier:handler:", v41, v41, v150);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "enabledSoundDetectionTypes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSelected:", objc_msgSend(v45, "containsObject:", *v40));

    objc_msgSend(v123, "addObject:", v43);
    objc_destroyWeak(&v151);

  }
  v46 = (_QWORD *)MEMORY[0x24BDFF1D0];
  if ((objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1D0]) & 1) != 0
    || (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1D8]) & 1) != 0
    || objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1E0]))
  {
    sub_230F76B30(CFSTR("appliances"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc(MEMORY[0x24BE19B60]);
    v148[0] = MEMORY[0x24BDAC760];
    v148[1] = 3221225472;
    v148[2] = sub_230F796BC;
    v148[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v149, &location);
    v49 = (void *)objc_msgSend(v48, "initWithTitle:identifier:handler:", v47, v47, v148);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "enabledSoundDetectionTypes");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v51, "containsObject:", *v46)
      && objc_msgSend(v51, "containsObject:", *MEMORY[0x24BDFF1D8]))
    {
      v52 = objc_msgSend(v51, "containsObject:", *MEMORY[0x24BDFF1E0]);
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v49, "setSelected:", v52);
    objc_msgSend(v123, "addObject:", v49);

    objc_destroyWeak(&v149);
  }
  v53 = (_QWORD *)MEMORY[0x24BDFF1E8];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1E8]))
  {
    sub_230F76B30(CFSTR("car.horn"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_alloc(MEMORY[0x24BE19B60]);
    v146[0] = MEMORY[0x24BDAC760];
    v146[1] = 3221225472;
    v146[2] = sub_230F7973C;
    v146[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v147, &location);
    v56 = (void *)objc_msgSend(v55, "initWithTitle:identifier:handler:", v54, v54, v146);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "enabledSoundDetectionTypes");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSelected:", objc_msgSend(v58, "containsObject:", *v53));

    objc_msgSend(v123, "addObject:", v56);
    objc_destroyWeak(&v147);

  }
  v59 = (_QWORD *)MEMORY[0x24BDFF218];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF218]))
  {
    sub_230F76B30(CFSTR("door.bell"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_alloc(MEMORY[0x24BE19B60]);
    v144[0] = MEMORY[0x24BDAC760];
    v144[1] = 3221225472;
    v144[2] = sub_230F79778;
    v144[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v145, &location);
    v62 = (void *)objc_msgSend(v61, "initWithTitle:identifier:handler:", v60, v60, v144);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "enabledSoundDetectionTypes");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setSelected:", objc_msgSend(v64, "containsObject:", *v59));

    objc_msgSend(v123, "addObject:", v62);
    objc_destroyWeak(&v145);

  }
  v65 = (_QWORD *)MEMORY[0x24BDFF210];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF210]))
  {
    sub_230F76B30(CFSTR("door.knock"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc(MEMORY[0x24BE19B60]);
    v142[0] = MEMORY[0x24BDAC760];
    v142[1] = 3221225472;
    v142[2] = sub_230F797B4;
    v142[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v143, &location);
    v68 = (void *)objc_msgSend(v67, "initWithTitle:identifier:handler:", v66, v66, v142);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "enabledSoundDetectionTypes");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setSelected:", objc_msgSend(v70, "containsObject:", *v65));

    objc_msgSend(v123, "addObject:", v68);
    objc_destroyWeak(&v143);

  }
  v71 = (_QWORD *)MEMORY[0x24BDFF230];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF230]))
  {
    sub_230F76B30(CFSTR("glass.breaking"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_alloc(MEMORY[0x24BE19B60]);
    v140[0] = MEMORY[0x24BDAC760];
    v140[1] = 3221225472;
    v140[2] = sub_230F797F0;
    v140[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v141, &location);
    v74 = (void *)objc_msgSend(v73, "initWithTitle:identifier:handler:", v72, v72, v140);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "enabledSoundDetectionTypes");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setSelected:", objc_msgSend(v76, "containsObject:", *v71));

    objc_msgSend(v123, "addObject:", v74);
    objc_destroyWeak(&v141);

  }
  v77 = (_QWORD *)MEMORY[0x24BDFF240];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF240]))
  {
    sub_230F76B30(CFSTR("kettle"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_alloc(MEMORY[0x24BE19B60]);
    v138[0] = MEMORY[0x24BDAC760];
    v138[1] = 3221225472;
    v138[2] = sub_230F7982C;
    v138[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v139, &location);
    v80 = (void *)objc_msgSend(v79, "initWithTitle:identifier:handler:", v78, v78, v138);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "enabledSoundDetectionTypes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setSelected:", objc_msgSend(v82, "containsObject:", *v77));

    objc_msgSend(v123, "addObject:", v80);
    objc_destroyWeak(&v139);

  }
  v83 = (_QWORD *)MEMORY[0x24BDFF268];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF268]))
  {
    sub_230F76B30(CFSTR("water.running"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_alloc(MEMORY[0x24BE19B60]);
    v136[0] = MEMORY[0x24BDAC760];
    v136[1] = 3221225472;
    v136[2] = sub_230F79868;
    v136[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v137, &location);
    v86 = (void *)objc_msgSend(v85, "initWithTitle:identifier:handler:", v84, v84, v136);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "enabledSoundDetectionTypes");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setSelected:", objc_msgSend(v88, "containsObject:", *v83));

    objc_msgSend(v123, "addObject:", v86);
    objc_destroyWeak(&v137);

  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v121 = v120;
  v89 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v132, v167, 16);
  if (v89)
  {
    v90 = *(_QWORD *)v133;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v133 != v90)
          objc_enumerationMutation(v121);
        v92 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
        objc_msgSend(v92, "name");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_alloc(MEMORY[0x24BE19B60]);
        v130[0] = MEMORY[0x24BDAC760];
        v130[1] = 3221225472;
        v130[2] = sub_230F798A4;
        v130[3] = &unk_24FFC2C80;
        objc_copyWeak(&v131, &location);
        v130[4] = v92;
        v95 = (void *)objc_msgSend(v94, "initWithTitle:identifier:handler:", v93, v93, v130);
        objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "enabledKShotDetectorIdentifiers");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "identifier");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setSelected:", objc_msgSend(v97, "containsObject:", v98));

        objc_msgSend(v123, "addObject:", v95);
        objc_destroyWeak(&v131);

      }
      v89 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v132, v167, 16);
    }
    while (v89);
  }

  v99 = (_QWORD *)MEMORY[0x24BDFF200];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF200]))
  {
    sub_230F76B30(CFSTR("baby.crying"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_alloc(MEMORY[0x24BE19B60]);
    v128[0] = MEMORY[0x24BDAC760];
    v128[1] = 3221225472;
    v128[2] = sub_230F798DC;
    v128[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v129, &location);
    v102 = (void *)objc_msgSend(v101, "initWithTitle:identifier:handler:", v100, v100, v128);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "enabledSoundDetectionTypes");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setSelected:", objc_msgSend(v104, "containsObject:", *v99));

    objc_msgSend(v123, "addObject:", v102);
    objc_destroyWeak(&v129);

  }
  v105 = (_QWORD *)MEMORY[0x24BDFF250];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF250]))
  {
    sub_230F76B30(CFSTR("shouting"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_alloc(MEMORY[0x24BE19B60]);
    v126[0] = MEMORY[0x24BDAC760];
    v126[1] = 3221225472;
    v126[2] = sub_230F79918;
    v126[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v127, &location);
    v108 = (void *)objc_msgSend(v107, "initWithTitle:identifier:handler:", v106, v106, v126);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "enabledSoundDetectionTypes");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setSelected:", objc_msgSend(v110, "containsObject:", *v105));

    objc_msgSend(v123, "addObject:", v108);
    objc_destroyWeak(&v127);

  }
  v111 = (_QWORD *)MEMORY[0x24BDFF1F8];
  if (objc_msgSend(v119, "containsObject:", *MEMORY[0x24BDFF1F8]))
  {
    sub_230F76B30(CFSTR("cough"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_alloc(MEMORY[0x24BE19B60]);
    v124[0] = MEMORY[0x24BDAC760];
    v124[1] = 3221225472;
    v124[2] = sub_230F79954;
    v124[3] = &unk_24FFC2BA8;
    objc_copyWeak(&v125, &location);
    v114 = (void *)objc_msgSend(v113, "initWithTitle:identifier:handler:", v112, v112, v124);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "enabledSoundDetectionTypes");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setSelected:", objc_msgSend(v116, "containsObject:", *v111));

    objc_msgSend(v123, "addObject:", v114);
    objc_destroyWeak(&v125);

  }
  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", v123);

  objc_destroyWeak(&location);
}

- (id)contentModuleContext
{
  return objc_loadWeakRetained((id *)&self->_contentModuleContext);
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeWeak((id *)&self->_contentModuleContext, a3);
}

- (CCUIToggleModule)module
{
  return (CCUIToggleModule *)objc_loadWeakRetained((id *)&self->_module);
}

- (void)setModule:(id)a3
{
  objc_storeWeak((id *)&self->_module, a3);
}

- (AXCCSoundDetectionModuleViewControllerDelegate)soundDetectionDelegate
{
  return (AXCCSoundDetectionModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_soundDetectionDelegate);
}

- (void)setSoundDetectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_soundDetectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_soundDetectionDelegate);
  objc_destroyWeak((id *)&self->_module);
  objc_destroyWeak((id *)&self->_contentModuleContext);
}

@end
