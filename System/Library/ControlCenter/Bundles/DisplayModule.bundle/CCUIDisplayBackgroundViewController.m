@implementation CCUIDisplayBackgroundViewController

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  void *brightnessClient;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isFrontBoard;
  CBClient *v12;
  NSMutableArray *v13;
  NSMutableArray *buttons;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  CCUILabeledRoundButtonViewController *v28;
  CCUILabeledRoundButtonViewController *styleModeButton;
  CCUILabeledRoundButtonViewController *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  CBBlueLightClient *v49;
  CBBlueLightClient *nightShiftClient;
  void *v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  CCUILabeledRoundButtonViewController *v68;
  CCUILabeledRoundButtonViewController *nightShiftButton;
  CCUILabeledRoundButtonViewController *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  CBAdaptationClient *v88;
  CBAdaptationClient *trueToneClient;
  void *v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  CCUILabeledRoundButtonViewController *v107;
  CCUILabeledRoundButtonViewController *trueToneButton;
  CCUILabeledRoundButtonViewController *v109;
  void *v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  objc_super v126;

  v126.receiver = self;
  v126.super_class = (Class)CCUIDisplayBackgroundViewController;
  -[CCUICustomContentModuleBackgroundViewController viewDidLoad](&v126, sel_viewDidLoad);
  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v3, v4);
  brightnessClient = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isFrontBoard = objc_msgSend_isFrontBoard(v8, v9, v10);

    if (!isFrontBoard)
      goto LABEL_5;
    v12 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = self->_brightnessClient;
    self->_brightnessClient = v12;
  }

LABEL_5:
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  buttons = self->_buttons;
  self->_buttons = v13;

  if (_UIUpdatedVisualStyleEnabled())
  {
    v17 = (void *)MEMORY[0x24BE19B00];
    v18 = (void *)MEMORY[0x24BDD1488];
    v19 = objc_opt_class();
    objc_msgSend_bundleForClass_(v18, v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionForPackageNamed_inBundle_(v17, v22, (uint64_t)CFSTR("StyleMode"), v21);
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc(MEMORY[0x24BE19B58]);
    objc_msgSend_clearColor(MEMORY[0x24BDF6950], v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphPackageDescription_highlightColor_(v23, v27, (uint64_t)v125, v26);
    styleModeButton = self->_styleModeButton;
    self->_styleModeButton = v28;

    v30 = self->_styleModeButton;
    v31 = (void *)MEMORY[0x24BDD1488];
    v32 = objc_opt_class();
    objc_msgSend_bundleForClass_(v31, v33, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v34, v35, (uint64_t)CFSTR("CONTROL_CENTER_STYLE_MODE_SETTING_NAME"), &stru_24FFD1AB8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v30, v37, (uint64_t)v36);

    objc_msgSend_setLabelsVisible_(self->_styleModeButton, v38, 1);
    objc_msgSend_button(self->_styleModeButton, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addTarget_action_forControlEvents_(v41, v42, (uint64_t)self, sel__styleModeButtonPressed_, 64);

    objc_msgSend_addObject_(self->_buttons, v43, (uint64_t)self->_styleModeButton);
    objc_msgSend__setupStyleMode(self, v44, v45);

  }
  v46 = 0x24BDF6000;
  if (self->_brightnessClient)
  {
    if (!objc_msgSend_supportsBlueLightReduction(MEMORY[0x24BE1A2E0], v15, v16))
      goto LABEL_12;
    objc_msgSend_blueLightClient(self->_brightnessClient, v47, v48);
  }
  else
  {
    objc_msgSend_blueLightClient(0, v15, v16);
  }
  v49 = (CBBlueLightClient *)objc_claimAutoreleasedReturnValue();
  nightShiftClient = self->_nightShiftClient;
  self->_nightShiftClient = v49;

  v51 = (void *)MEMORY[0x24BDF6AC8];
  v52 = (void *)MEMORY[0x24BDD1488];
  v53 = objc_opt_class();
  objc_msgSend_bundleForClass_(v52, v54, v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(v51, v56, (uint64_t)CFSTR("NightShift"), v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__flatImageWithColor_(v57, v61, (uint64_t)v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = objc_alloc(MEMORY[0x24BE19B58]);
  objc_msgSend_systemOrangeColor(MEMORY[0x24BDF6950], v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphImage_highlightColor_(v63, v67, (uint64_t)v62, v66);
  nightShiftButton = self->_nightShiftButton;
  self->_nightShiftButton = v68;

  v70 = self->_nightShiftButton;
  v71 = (void *)MEMORY[0x24BDD1488];
  v72 = objc_opt_class();
  objc_msgSend_bundleForClass_(v71, v73, v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v74, v75, (uint64_t)CFSTR("CONTROL_CENTER_NIGHT_SHIFT_SETTING_NAME"), &stru_24FFD1AB8, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v70, v77, (uint64_t)v76);

  objc_msgSend_setLabelsVisible_(self->_nightShiftButton, v78, 1);
  objc_msgSend_button(self->_nightShiftButton, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v81, v82, (uint64_t)self, sel__nightShiftButtonPressed_, 64);

  objc_msgSend_addObject_(self->_buttons, v83, (uint64_t)self->_nightShiftButton);
  objc_msgSend__setupNightShift(self, v84, v85);

  v46 = 0x24BDF6000uLL;
LABEL_12:
  if (!self->_brightnessClient)
  {
    objc_msgSend_adaptationClient(0, v47, v48);
    goto LABEL_16;
  }
  if (objc_msgSend_supportsAdaptation(MEMORY[0x24BE1A2E0], v47, v48))
  {
    objc_msgSend_adaptationClient(self->_brightnessClient, v86, v87);
LABEL_16:
    v88 = (CBAdaptationClient *)objc_claimAutoreleasedReturnValue();
    trueToneClient = self->_trueToneClient;
    self->_trueToneClient = v88;

    v90 = *(void **)(v46 + 2760);
    v91 = (void *)MEMORY[0x24BDD1488];
    v92 = objc_opt_class();
    objc_msgSend_bundleForClass_(v91, v93, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v90, v95, (uint64_t)CFSTR("TrueTone"), v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__flatImageWithColor_(v96, v100, (uint64_t)v99);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = objc_alloc(MEMORY[0x24BE19B58]);
    objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphImage_highlightColor_(v102, v106, (uint64_t)v101, v105);
    trueToneButton = self->_trueToneButton;
    self->_trueToneButton = v107;

    v109 = self->_trueToneButton;
    v110 = (void *)MEMORY[0x24BDD1488];
    v111 = objc_opt_class();
    objc_msgSend_bundleForClass_(v110, v112, v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v113, v114, (uint64_t)CFSTR("CONTROL_CENTER_TRUE_TONE_SETTING_NAME"), &stru_24FFD1AB8, 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v109, v116, (uint64_t)v115);

    objc_msgSend_setLabelsVisible_(self->_trueToneButton, v117, 1);
    objc_msgSend_button(self->_trueToneButton, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addTarget_action_forControlEvents_(v120, v121, (uint64_t)self, sel__trueToneButtonPressed_, 64);

    objc_msgSend_addObject_(self->_buttons, v122, (uint64_t)self->_trueToneButton);
    objc_msgSend__setupTrueTone(self, v123, v124);

  }
  objc_msgSend_setFooterButtons_(self, v86, (uint64_t)self->_buttons);
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  objc_msgSend_setStatusNotificationBlock_(self->_nightShiftClient, a2, 0);
  objc_msgSend_unregisterNotificationCallbackBlock(self->_trueToneClient, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)CCUIDisplayBackgroundViewController;
  -[CCUIDisplayBackgroundViewController dealloc](&v5, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayBackgroundViewController;
  -[CCUIDisplayBackgroundViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend__updateState(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_styleModeButtonPressed:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__toggleStyleMode, a3);
}

- (void)_nightShiftButtonPressed:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__toggleNightShift, a3);
}

- (void)_trueToneButtonPressed:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__toggleTrueTone, a3);
}

- (void)_setupStyleMode
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__styleModeDidChange, *MEMORY[0x24BDF7FA8], 0);

}

- (void)_setupNightShift
{
  CBBlueLightClient *nightShiftClient;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  nightShiftClient = self->_nightShiftClient;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FC41EC;
  v5[3] = &unk_24FFD1860;
  objc_copyWeak(&v6, &location);
  objc_msgSend_setStatusNotificationBlock_(nightShiftClient, v4, (uint64_t)v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupTrueTone
{
  CBAdaptationClient *trueToneClient;
  uint64_t v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  trueToneClient = self->_trueToneClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FC4588;
  v7[3] = &unk_24FFD18B0;
  objc_copyWeak(&v8, &location);
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  objc_msgSend_registerNotificationCallbackBlock_withQueue_(trueToneClient, v6, (uint64_t)v7, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateState
{
  uint64_t v2;
  uint64_t Enabled;
  const char *v5;
  CCUILabeledRoundButtonViewController *trueToneButton;
  const char *v7;
  void *v8;
  const char *v9;
  CCUILabeledRoundButtonViewController *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const __CFString *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  _QWORD v48[5];

  Enabled = objc_msgSend_getEnabled(self->_trueToneClient, a2, v2);
  objc_msgSend_setEnabled_(self->_trueToneButton, v5, Enabled);
  trueToneButton = self->_trueToneButton;
  objc_msgSend__subtitleForTrueToneEnabled_(self, v7, Enabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(trueToneButton, v9, (uint64_t)v8);

  v10 = self->_trueToneButton;
  v13 = objc_msgSend_available(self->_trueToneClient, v11, v12);
  objc_msgSend_setInoperative_(v10, v14, v13 ^ 1u);
  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_currentStyle(v17, v18, v19);

  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextTransition(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_styleModeButton(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v29, v30, 0);

  objc_msgSend_styleModeButton(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33;
  if (v20 == 2)
    v36 = CFSTR("light");
  else
    v36 = CFSTR("dark");
  objc_msgSend_setUseAlternateBackground_(v33, v34, v20 == 2);

  objc_msgSend_styleModeButton(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphState_(v39, v40, (uint64_t)v36);

  objc_msgSend_styleModeButton(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subtitleForUserInterfaceStyle_nextTransition_(self, v44, v20, v26);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v43, v46, (uint64_t)v45);

  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_230FC4904;
  v48[3] = &unk_24FFD18D8;
  v48[4] = self;
  objc_msgSend__getBlueLightStatus_(self, v47, (uint64_t)v48);

}

- (void)_toggleStyleMode
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toggleCurrentStyle(v4, v5, v6);

  objc_msgSend__updateState(self, v7, v8);
}

- (BOOL)_toggleNightShift
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FC4A80;
  v3[3] = &unk_24FFD18D8;
  v3[4] = self;
  objc_msgSend__getBlueLightStatus_(self, a2, (uint64_t)v3);
  return 1;
}

- (void)_toggleTrueTone
{
  uint64_t v2;
  int Enabled;
  const char *v5;
  const char *v6;
  uint64_t v7;

  Enabled = objc_msgSend_getEnabled(self->_trueToneClient, a2, v2);
  objc_msgSend_setEnabled_(self->_trueToneClient, v5, Enabled ^ 1u);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)_getBlueLightStatus:(id)a3
{
  _QWORD *v4;
  const char *v5;
  void (*v6)(_QWORD *, _OWORD *);
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v4 = a3;
  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  if (objc_msgSend_getBlueLightStatus_(self->_nightShiftClient, v5, (uint64_t)&v9))
  {
    v6 = (void (*)(_QWORD *, _OWORD *))v4[2];
    v7[0] = v9;
    v7[1] = v10;
    v8 = v11;
    v6(v4, v7);
  }

}

- (void)_setNightShiftEnabled:(BOOL)a3
{
  MEMORY[0x24BEDD108](self->_nightShiftClient, sel_setEnabled_withOption_, a3);
}

- (id)_alertControllerForDisablingAccessibilityScreenFilter:(id)a3 cancelBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  id v40;
  const char *v41;
  void *v42;
  const char *v43;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;

  v5 = a3;
  v45 = a4;
  v6 = (void *)MEMORY[0x24BDF67F0];
  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v10, v11, (uint64_t)CFSTR("CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_TITLE"), &stru_24FFD1AB8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD1488];
  v14 = objc_opt_class();
  objc_msgSend_bundleForClass_(v13, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_MESSAGE"), &stru_24FFD1AB8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alertControllerWithTitle_message_preferredStyle_(v6, v19, (uint64_t)v12, v18, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDF67E8];
  v22 = (void *)MEMORY[0x24BDD1488];
  v23 = objc_opt_class();
  objc_msgSend_bundleForClass_(v22, v24, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)CFSTR("CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_ENABLE"), &stru_24FFD1AB8, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_230FC4FC0;
  v48[3] = &unk_24FFD1928;
  v49 = v5;
  v29 = v5;
  objc_msgSend_actionWithTitle_style_handler_(v21, v30, (uint64_t)v27, 0, v48);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAction_(v20, v32, (uint64_t)v31);

  v33 = (void *)MEMORY[0x24BDF67E8];
  v34 = (void *)MEMORY[0x24BDD1488];
  v35 = objc_opt_class();
  objc_msgSend_bundleForClass_(v34, v36, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v37, v38, (uint64_t)CFSTR("CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_CANCEL"), &stru_24FFD1AB8, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v28;
  v46[1] = 3221225472;
  v46[2] = sub_230FC4FF8;
  v46[3] = &unk_24FFD1928;
  v47 = v45;
  v40 = v45;
  objc_msgSend_actionWithTitle_style_handler_(v33, v41, (uint64_t)v39, 1, v46);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAction_(v20, v43, (uint64_t)v42);

  return v20;
}

- (id)_subtitleForBlueLightStatus:(id *)a3
{
  int var3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  _BOOL4 var1;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;

  var3 = a3->var3;
  if (var3 == 1)
  {
    var1 = a3->var1;
    v22 = (void *)MEMORY[0x24BDD1488];
    v23 = objc_opt_class();
    objc_msgSend_bundleForClass_(v22, v24, v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (var1)
      objc_msgSend_localizedStringForKey_value_table_(v7, v25, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_ON_UNTIL_SUNRISE"), &stru_24FFD1AB8, 0);
    else
      objc_msgSend_localizedStringForKey_value_table_(v7, v25, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_OFF_UNTIL_SUNSET"), &stru_24FFD1AB8, 0);
    goto LABEL_12;
  }
  if (var3 != 2)
  {
    v26 = a3->var1;
    v27 = (void *)MEMORY[0x24BDD1488];
    v28 = objc_opt_class();
    objc_msgSend_bundleForClass_(v27, v29, v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend_localizedStringForKey_value_table_(v7, v30, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_ON_MANUAL"), &stru_24FFD1AB8, 0);
    else
      objc_msgSend_localizedStringForKey_value_table_(v7, v30, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_OFF_MANUAL"), &stru_24FFD1AB8, 0);
LABEL_12:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v5 = 16;
  if (!a3->var1)
    v5 = 8;
  v6 = *(_QWORD *)(&a3->var0 + v5);
  objc_msgSend__subtitleFormatStringForBlueLightEnabled_transitionTime_(self, a2, a3->var1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = objc_opt_class();
  objc_msgSend_bundleForClass_(v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)v7, &stru_24FFD1AB8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_msgSend__formattedHourForTransitionTime_(self, v15, v6);
  objc_msgSend__timeStringForBlueLightTransitionTime_(self, v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v14, v19, (uint64_t)v13, v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v20;
}

- (id)_timeStringForBlueLightTransitionTime:(id)a3
{
  return (id)objc_msgSend__timeStringForHour_minute_(self, a2, a3.var0, a3.var1);
}

- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;

  v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend_setHour_(v7, v8, a3);
  objc_msgSend_setMinute_(v7, v9, a4);
  objc_msgSend_currentCalendar(MEMORY[0x24BDBCE48], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCalendar_(v7, v13, (uint64_t)v12);

  objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x24BDBCF38], v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v7, v16, (uint64_t)v15);

  objc_msgSend__timeFormatter(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(v7, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v19, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_subtitleFormatStringForBlueLightEnabled:(BOOL)a3 transitionTime:(id)a4
{
  if (a3)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_%@_UNTIL_FORMAT"), a4, CFSTR("ON"));
  else
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_NIGHT_SHIFT_%@_UNTIL_FORMAT"), a4, CFSTR("OFF"));
}

- (unint64_t)_formattedHourForTransitionTime:(id)a3
{
  return objc_msgSend__formattedHourForHour_(self, a2, a3.var0);
}

- (unint64_t)_formattedHourForHour:(unint64_t)a3
{
  int v4;
  int v5;

  v4 = objc_msgSend__uses24HourTime(self, a2, a3);
  if (a3 < 0xD)
    v5 = 1;
  else
    v5 = v4;
  if (v5)
    return a3;
  else
    return a3 - 12;
}

- (BOOL)_uses24HourTime
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  BOOL v9;

  objc_msgSend__timeFormatter(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateFormat(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_rangeOfString_(v6, v7, (uint64_t)CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend_rangeOfString_(v6, v8, (uint64_t)CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)_timeFormatter
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_setDateStyle_(v2, v3, 0);
  objc_msgSend_setTimeStyle_(v2, v4, 1);
  objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_(v2, v8, (uint64_t)v7);

  objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x24BDBCF38], v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v2, v11, (uint64_t)v10);

  objc_msgSend_currentCalendar(MEMORY[0x24BDBCE48], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCalendar_(v2, v15, (uint64_t)v14);

  return v2;
}

- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;

  v6 = a4;
  v9 = v6;
  if (v6 && (v10 = objc_msgSend_type(v6, v7, v8), v10 <= 2))
    v11 = off_24FFD1948[v10];
  else
    v11 = CFSTR("_MANUAL");
  if (a3 == 2)
    objc_msgSend_stringByAppendingString_(CFSTR("CONTROL_CENTER_STATUS_STYLE_MODE"), v7, (uint64_t)CFSTR("_DARK"));
  else
    objc_msgSend_stringByAppendingString_(CFSTR("CONTROL_CENTER_STATUS_STYLE_MODE"), v7, (uint64_t)CFSTR("_LIGHT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v12, v13, (uint64_t)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD1488];
  v16 = objc_opt_class();
  objc_msgSend_bundleForClass_(v15, v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v18, v19, (uint64_t)v14, &stru_24FFD1AB8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_type(v9, v21, v22))
  {
    v25 = v20;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = objc_msgSend_hour(v9, v23, v24);
    v29 = objc_msgSend__formattedHourForHour_(self, v28, v27);
    v32 = objc_msgSend_hour(v9, v30, v31);
    v35 = objc_msgSend_minute(v9, v33, v34);
    objc_msgSend__timeStringForHour_minute_(self, v36, v32, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v38, (uint64_t)v20, v29, v37);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

- (id)_subtitleForTrueToneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v3)
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_TRUE_TONE_ON"), &stru_24FFD1AB8, 0);
  else
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_TRUE_TONE_OFF"), &stru_24FFD1AB8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CCUILabeledRoundButtonViewController)styleModeButton
{
  return self->_styleModeButton;
}

- (void)setStyleModeButton:(id)a3
{
  objc_storeStrong((id *)&self->_styleModeButton, a3);
}

- (CCUILabeledRoundButtonViewController)nightShiftButton
{
  return self->_nightShiftButton;
}

- (void)setNightShiftButton:(id)a3
{
  objc_storeStrong((id *)&self->_nightShiftButton, a3);
}

- (CCUILabeledRoundButtonViewController)trueToneButton
{
  return self->_trueToneButton;
}

- (void)setTrueToneButton:(id)a3
{
  objc_storeStrong((id *)&self->_trueToneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueToneButton, 0);
  objc_storeStrong((id *)&self->_nightShiftButton, 0);
  objc_storeStrong((id *)&self->_styleModeButton, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_presentedAlertController, 0);
  objc_storeStrong((id *)&self->_nightShiftClient, 0);
  objc_storeStrong((id *)&self->_trueToneClient, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end
