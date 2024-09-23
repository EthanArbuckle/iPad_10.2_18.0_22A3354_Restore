@implementation HACCModuleViewController

- (HACCModuleViewController)init
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HACCModuleViewController;
  v2 = -[HACCModuleViewController init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE4BDE8]);
    v6 = objc_msgSend_initWithDelegate_(v3, v4, (uint64_t)v2, v5);
    v7 = (void *)*((_QWORD *)v2 + 127);
    *((_QWORD *)v2 + 127) = v6;

    objc_msgSend_addChildViewController_(v2, v8, *((_QWORD *)v2 + 127), v9);
    *((_BYTE *)v2 + 1033) = 0;
    *((_DWORD *)v2 + 259) = 0;
    objc_msgSend_updateViewWithState_(v2, v10, HACCIconAssetStateOff, v11);
    objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedGlyphColor_(v2, v16, (uint64_t)v15, v17);

  }
  return (HACCModuleViewController *)v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  UIView *v6;
  UIView *collapsedBackgroundView;
  UIView *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  UIView *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  id location;
  objc_super v84;

  v84.receiver = self;
  v84.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v84, sel_viewDidLoad);
  objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x24BE19B38], v3, v4, v5);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  collapsedBackgroundView = self->_collapsedBackgroundView;
  self->_collapsedBackgroundView = v6;

  v8 = self->_collapsedBackgroundView;
  objc_msgSend_view(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v12, v13, v14, v15);
  objc_msgSend_setFrame_(v8, v16, v17, v18);

  objc_msgSend_setAutoresizingMask_(self->_collapsedBackgroundView, v19, 18, v20);
  v21 = self->_collapsedBackgroundView;
  objc_msgSend_compactContinuousCornerRadius(self, v22, v23, v24);
  objc_msgSend__setContinuousCornerRadius_(v21, v25, v26, v27);
  objc_msgSend_view(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_insertSubview_atIndex_(v31, v32, (uint64_t)self->_collapsedBackgroundView, 0);

  objc_msgSend_view(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self->_shortcutController, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v36, v41, (uint64_t)v40, v42);

  objc_initWeak(&location, self);
  objc_msgSend_view(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = MEMORY[0x24BDAC760];
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = sub_230FD0EF4;
  v81[3] = &unk_24FFD4650;
  objc_copyWeak(&v82, &location);
  objc_msgSend__setAccessibilityTraitsBlock_(v46, v48, (uint64_t)v81, v49);

  objc_msgSend_view(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v47;
  v79[1] = 3221225472;
  v79[2] = sub_230FD0F74;
  v79[3] = &unk_24FFD4678;
  objc_copyWeak(&v80, &location);
  objc_msgSend__setAccessibilityValueBlock_(v53, v54, (uint64_t)v79, v55);

  objc_msgSend_buttonView(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v59, v61, (uint64_t)v60, v62);

  objc_msgSend_buttonView(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityIdentifier_(v66, v67, (uint64_t)CFSTR("AX_HEARING_DEVICES"), v68);

  objc_msgSend_buttonView(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityHint_(v72, v74, (uint64_t)v73, v75);

  hearingLocString();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(self, v77, (uint64_t)v76, v78);

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)HACCModuleViewController;
  -[HACCModuleViewController viewWillAppear:](&v26, sel_viewWillAppear_, a3);
  objc_msgSend_startListening(self, v4, v5, v6);
  objc_initWeak(&location, self);
  objc_msgSend_sharedInstance(MEMORY[0x24BE4BE68], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230FD11A4;
  v23[3] = &unk_24FFD46A0;
  objc_copyWeak(&v24, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v10, v12, (uint64_t)v23, (uint64_t)sel_comfortSoundsEnabled, self);

  objc_msgSend_sharedInstance(MEMORY[0x24BE4BE48], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = sub_230FD11D0;
  v21[3] = &unk_24FFD46F0;
  objc_copyWeak(&v22, &location);
  objc_msgSend_registerListener_forLiveListenLevelsHandler_(v16, v17, (uint64_t)self, (uint64_t)v21);

  objc_msgSend__updateSelectedStatus(self, v18, v19, v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HACCModuleViewController;
  -[HACCModuleViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  objc_msgSend_stopListening(self, v4, v5, v6);
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int isExpanded;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v32, sel_viewWillLayoutSubviews);
  isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (isExpanded)
  {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 1.0);

    objc_msgSend_buttonView(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0.0;
    objc_msgSend_setAlpha_(v18, v20, v21, v22, 0.0);
  }
  else
  {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 0.0);

    objc_msgSend_buttonView(self, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1.0;
    objc_msgSend_setAlpha_(v18, v26, v27, v28, 1.0);
  }

  objc_msgSend_setAlpha_(self->_collapsedBackgroundView, v29, v30, v31, v19);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v8, sel_willTransitionToExpandedContentMode_);
  if (v3)
    objc_msgSend_pauseSoundRecognitionIfNecessary(self, v5, v6, v7);
  else
    objc_msgSend_restartSoundRecognitionIfNecessary(self, v5, v6, v7);
}

- (BOOL)canDismissPresentedContent
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_expandedController(self->_shortcutController, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)shortcutDidChangeSize:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_view(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v5, v6, v7, v8);
  objc_msgSend_preferredExpandedContentHeight(self, v9, v10, v11);

  if (objc_msgSend_isExpanded(self, v12, v13, v14))
    MEMORY[0x24BEDD108](self, sel_setPreferredContentSize_, v15, v16);
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HAInitializeLogging();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("Dismissing Control Center"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%s:%d %@"), v11, "-[HACCModuleViewController dismissPresentedContentAnimated:completion:]", 209, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v25 = objc_msgSend_UTF8String(v14, v16, v17, v18);
    _os_log_impl(&dword_230FCF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend_presentedViewController(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dismissViewControllerAnimated_completion_(v22, v23, v4, (uint64_t)v6);

}

- (double)preferredExpandedContentHeight
{
  uint64_t v2;
  uint64_t v3;
  double result;

  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
  uint64_t v3;

  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)haccIconButtonTapped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule((void *)v5, v6, v7, v8);

  objc_msgSend_assetState(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend_isEqualToString_(v12, v13, HACCIconAssetStateOff, v14);

  if ((v5 & 1) == 0)
  {
    AXLogAggregate();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = &unk_24FFD54A0;
      _os_log_impl(&dword_230FCF000, v15, OS_LOG_TYPE_INFO, "Live headphone level opened: %@", buf, 0xCu);
    }

    AnalyticsSendEventLazy();
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_haccIconButtonTapped, a3, a4);
}

- (void)pauseSoundRecognitionIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint8_t v17[16];

  objc_msgSend_sharedInstance(MEMORY[0x24BDFF278], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_soundDetectionState(v5, v6, v7, v8);

  if (v9 == 2)
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_230FCF000, v10, OS_LOG_TYPE_DEFAULT, "Pausing Sound Recognition for Live Listen UI", v17, 2u);
    }

    objc_msgSend_sharedInstance(MEMORY[0x24BDFF278], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSoundDetectionState_(v14, v15, 1, v16);

    self->_pausedSoundRecognition = 1;
  }
}

- (void)restartSoundRecognitionIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint8_t v17[16];

  if (self->_pausedSoundRecognition)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BDFF278], a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_soundDetectionState(v5, v6, v7, v8);

    if (v9 == 1)
    {
      AXLogUltron();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_230FCF000, v10, OS_LOG_TYPE_DEFAULT, "Resuming Sound Recognition for Live Listen UI", v17, 2u);
      }

      objc_msgSend_sharedInstance(MEMORY[0x24BDFF278], v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSoundDetectionState_(v14, v15, 2, v16);

      self->_pausedSoundRecognition = 0;
    }
  }
}

- (void)startListening
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_sharedInstance(MEMORY[0x24BE4BE48], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_230FD1A24;
  v8[3] = &unk_24FFD4768;
  objc_copyWeak(&v9, &location);
  objc_msgSend_registerListener_forLiveHeadphoneLevelHandler_(v6, v7, (uint64_t)self, (uint64_t)v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopListening
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_sharedInstance(MEMORY[0x24BE4BE48], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterLiveHeadphoneLevelHandler_(v5, v6, (uint64_t)self, v7);

  objc_msgSend_updateViewWithState_(self, v8, HACCIconAssetStateOff, v9);
}

- (void)updateViewWithAudioSample:(id)a3
{
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString **v28;

  v4 = *MEMORY[0x24BE4BE20];
  v5 = a3;
  objc_msgSend_objectForKey_(v5, v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v8, v9, v10, v11);

  objc_msgSend_objectForKey_(v5, v12, *MEMORY[0x24BE4BE30], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_unsignedIntegerValue(v14, v15, v16, v17);

  objc_msgSend_objectForKey_(v5, v19, *MEMORY[0x24BE4BE18], v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend_BOOLValue(v21, v22, v23, v24);
  if (!(_DWORD)v5)
  {
    objc_msgSend_updateViewWithState_(self, v25, HACCIconAssetStateOff, v27);
    return;
  }
  if (v18)
  {
    if (v18 != 100 && v18 != 80)
      goto LABEL_9;
    v28 = &HACCIconAssetStateWarning;
  }
  else
  {
    v28 = &HACCIconAssetStateSafe;
  }
  objc_msgSend_updateViewWithState_(self, v25, (uint64_t)*v28, v27);
LABEL_9:
  MEMORY[0x24BEDD108](self, sel_updateViewWithExposure_, v26, v27);
}

- (void)updateViewWithState:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char isEqualToString;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  objc_msgSend_assetState(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v12 = (void *)v8,
        objc_msgSend_assetState(self, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v25, v15),
        v13,
        v12,
        (isEqualToString & 1) == 0))
  {
    objc_storeStrong((id *)&self->_assetState, a3);
    objc_msgSend_exposure(self, v17, v18, v19);
    objc_msgSend__symbolForState_withExposure_(self, v20, (uint64_t)v25, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(self, v23, (uint64_t)v22, v24);

  }
}

- (void)updateViewWithExposure:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  objc_msgSend_exposure(self, a2, v3, v4);
  if (v10 != a3)
  {
    self->_exposure = a3;
    objc_msgSend_assetState(self, v7, v8, v9);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = a3;
    objc_msgSend__symbolForState_withExposure_(self, v12, (uint64_t)v17, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(self, v15, (uint64_t)v14, v16);

  }
}

- (id)_symbolForState:(id)a3 withExposure:(float)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  float v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  float v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;

  v5 = a3;
  objc_msgSend_configurationPreferringMulticolor(MEMORY[0x24BDF6AE0], v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((float)((float)(a4 + -20.0) / 90.0) >= 0.0)
    v12 = (float)(a4 + -20.0) / 90.0;
  else
    v12 = 0.0;
  if (objc_msgSend_isEqualToString_(v5, v9, HACCIconAssetStateOff, v10))
  {
    objc_msgSend_systemImageNamed_(MEMORY[0x24BDF6AC8], v13, (uint64_t)CFSTR("ear"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithTintColor_(v15, v20, (uint64_t)v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = fminf(v12, 1.0);
    if (objc_msgSend_isEqualToString_(v5, v13, (uint64_t)HACCIconAssetStateSafe, v14))
    {
      v26 = (void *)MEMORY[0x24BDF6AC8];
      v27 = (void *)MEMORY[0x24BDD1488];
      v28 = objc_opt_class();
      objc_msgSend_bundleForClass_(v27, v29, v28, v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageNamed_inBundle_variableValue_withConfiguration_(v26, v31, (uint64_t)CFSTR("ear.badge.checkmark.dots"), (uint64_t)v15, v11, v23);
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v5, v24, (uint64_t)HACCIconAssetStateWarning, v25))
      {
        v22 = 0;
        goto LABEL_12;
      }
      v32 = (void *)MEMORY[0x24BDF6AC8];
      v33 = (void *)MEMORY[0x24BDD1488];
      v34 = objc_opt_class();
      objc_msgSend_bundleForClass_(v33, v35, v34, v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageNamed_inBundle_variableValue_withConfiguration_(v32, v37, (uint64_t)CFSTR("ear.trianglebadge.exclamationmark.dots"), (uint64_t)v15, v11, v23);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v22;
}

- (void)_updateSelectedStatus
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isLiveListenEnabled;
  const char *v12;
  uint64_t v13;
  id v14;

  objc_msgSend_sharedInstance(MEMORY[0x24BE4BE68], a2, v2, v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_comfortSoundsEnabled(v14, v5, v6, v7) & 1) != 0)
  {
    objc_msgSend_setSelected_(self, v8, 1, v10);
  }
  else
  {
    isLiveListenEnabled = objc_msgSend_isLiveListenEnabled(self, v8, v9, v10);
    objc_msgSend_setSelected_(self, v12, isLiveListenEnabled, v13);
  }

}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController setCompactContinuousCornerRadius:](&v8, sel_setCompactContinuousCornerRadius_);
  objc_msgSend__setContinuousCornerRadius_(self->_collapsedBackgroundView, v5, v6, v7, a3);
}

- (NSString)assetState
{
  return self->_assetState;
}

- (BOOL)isLiveListenEnabled
{
  return self->_isLiveListenEnabled;
}

- (void)setIsLiveListenEnabled:(BOOL)a3
{
  self->_isLiveListenEnabled = a3;
}

- (float)exposure
{
  return self->_exposure;
}

- (void)setExposure:(float)a3
{
  self->_exposure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetState, 0);
  objc_storeStrong((id *)&self->_collapsedBackgroundView, 0);
  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end
