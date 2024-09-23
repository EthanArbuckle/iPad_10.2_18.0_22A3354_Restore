@implementation AXLiveListenModuleViewController

- (AXLiveListenModuleViewController)init
{
  AXLiveListenModuleViewController *v2;
  uint64_t v3;
  HACCShortcutViewController *shortcutController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXLiveListenModuleViewController;
  v2 = -[AXLiveListenModuleViewController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE4BDE8]), "initWithDelegate:andAvailableModules:", v2, &unk_2503F96B0);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v3;

    -[AXLiveListenModuleViewController addChildViewController:](v2, "addChildViewController:", v2->_shortcutController);
    -[HACCShortcutViewController didMoveToParentViewController:](v2->_shortcutController, "didMoveToParentViewController:", v2);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("mic.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 30.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingSymbolConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setGlyphImage:](v2, "setGlyphImage:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setSelectedGlyphColor:](v2, "setSelectedGlyphColor:", v8);

  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateSelectedStatus
{
  -[AXLiveListenModuleViewController isLiveListenEnabled](self, "isLiveListenEnabled");
  MEMORY[0x24BEDD108](self, sel_setSelected_);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AXLiveListenModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[AXLiveListenModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCShortcutViewController view](self->_shortcutController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_initWeak(&location, self);
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_232BF9E78;
  v16[3] = &unk_2503F8B70;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v5, "_setAccessibilityTraitsBlock:", v16);

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("AX_LIVE_LISTEN"));

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityHint:", v11);

  hearingLocString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setTitle:](self, "setTitle:", v12);

  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = sub_232BF9ED4;
  v14[3] = &unk_2503F8BC0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "registerListener:forLiveListenLevelsHandler:", self, v14);

  -[AXLiveListenModuleViewController _updateSelectedStatus](self, "_updateSelectedStatus");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXLiveListenModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  v3 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
  -[HACCShortcutViewController view](self->_shortcutController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (v3)
    v6 = 1.0;
  objc_msgSend(v4, "setAlpha:", v6);

}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AXLiveListenModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_);
  if (v3)
    -[AXLiveListenModuleViewController pauseSoundRecognitionIfNecessary](self, "pauseSoundRecognitionIfNecessary");
  else
    -[AXLiveListenModuleViewController restartSoundRecognitionIfNecessary](self, "restartSoundRecognitionIfNecessary");
}

- (BOOL)canDismissPresentedContent
{
  void *v2;
  BOOL v3;

  -[HACCShortcutViewController expandedController](self->_shortcutController, "expandedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)shortcutDidChangeSize:(id)a3
{
  void *v4;

  -[AXLiveListenModuleViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[AXLiveListenModuleViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    MEMORY[0x24BEDD108](self, sel_setPreferredContentSize_);
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Dismissing Control Center"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXLiveListenModuleViewController dismissPresentedContentAnimated:completion:]", 152, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v14 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_232BF8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXLiveListenModuleViewController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", v4, v6);

}

- (double)preferredExpandedContentHeight
{
  double result;

  -[HACCShortcutViewController preferredExpandedContentHeight](self->_shortcutController, "preferredExpandedContentHeight");
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
  -[HACCShortcutViewController setContentModuleContext:](self->_shortcutController, "setContentModuleContext:", a3);
}

- (void)expandLiveListenModule
{
  id v2;

  -[HACCShortcutViewController contentModuleContext](self->_shortcutController, "contentModuleContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestExpandModule");

}

- (void)pauseSoundRecognitionIfNecessary
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "soundDetectionState");

  if (v4 == 2)
  {
    AXLogUltron();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_232BF8000, v5, OS_LOG_TYPE_DEFAULT, "Pausing Sound Recognition for Live Listen UI", v7, 2u);
    }

    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSoundDetectionState:", 1);

    self->_pausedSoundRecognition = 1;
  }
}

- (void)restartSoundRecognitionIfNecessary
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (self->_pausedSoundRecognition)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "soundDetectionState");

    if (v4 == 1)
    {
      AXLogUltron();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_232BF8000, v5, OS_LOG_TYPE_DEFAULT, "Resuming Sound Recognition for Live Listen UI", v7, 2u);
      }

      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSoundDetectionState:", 2);

      self->_pausedSoundRecognition = 0;
    }
  }
}

- (void)buttonTouchDown:(id)a3 forEvent:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXLiveListenModuleViewController setTouchDownTime:](self, "setTouchDownTime:", v5);

}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  -[AXLiveListenModuleViewController touchDownTime](self, "touchDownTime", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[AXLiveListenModuleViewController touchDownTime](self, "touchDownTime"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceNow"),
        v9 = fabs(v8),
        v7,
        v6,
        v9 <= 0.4))
  {
    -[AXLiveListenModuleViewController setTouchDownTime:](self, "setTouchDownTime:", 0);
    if ((liveListenStreamSelected() & 1) != 0)
    {
      v10 = -[AXLiveListenModuleViewController isLiveListenEnabled](self, "isLiveListenEnabled");
      objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
        objc_msgSend(v11, "stopLiveListen");
      else
        objc_msgSend(v11, "startLiveListen");

    }
    else
    {
      MEMORY[0x24BEDD108](self, sel_expandLiveListenModule);
    }
  }
  else
  {
    -[AXLiveListenModuleViewController setTouchDownTime:](self, "setTouchDownTime:", 0);
  }
}

- (BOOL)isLiveListenEnabled
{
  return self->_isLiveListenEnabled;
}

- (void)setIsLiveListenEnabled:(BOOL)a3
{
  self->_isLiveListenEnabled = a3;
}

- (NSDate)touchDownTime
{
  return self->_touchDownTime;
}

- (void)setTouchDownTime:(id)a3
{
  objc_storeStrong((id *)&self->_touchDownTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDownTime, 0);
  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end
