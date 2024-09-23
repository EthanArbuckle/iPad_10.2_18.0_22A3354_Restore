@implementation BackgroundSoundsCCModuleViewController

- (BackgroundSoundsCCModuleViewController)init
{
  BackgroundSoundsCCModuleViewController *v2;
  uint64_t v3;
  HACCShortcutViewController *shortcutController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BackgroundSoundsCCModuleViewController;
  v2 = -[BackgroundSoundsCCModuleViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE4BDE8]), "initWithDelegate:andAvailableModules:", v2, &unk_2503FAC68);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v3;

    -[HACCShortcutViewController setPrefersContentToAlwaysExpand:](v2->_shortcutController, "setPrefersContentToAlwaysExpand:", 1);
    -[BackgroundSoundsCCModuleViewController addChildViewController:](v2, "addChildViewController:", v2->_shortcutController);
  }
  return v2;
}

- (void)_updateSelectedState
{
  id v3;

  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", objc_msgSend(v3, "comfortSoundsEnabled"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BackgroundSoundsCCModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[BackgroundSoundsCCModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCShortcutViewController view](self->_shortcutController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("AX_HEARING_DEVICES"));

  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityHint:", v9);

  hearingLocString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setTitle:](self, "setTitle:", v10);

  v11 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 3, 30.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_systemImageNamed:withConfiguration:", CFSTR("music.quarternote.3"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setGlyphImage:](self, "setGlyphImage:", v13);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](self, "setSelectedGlyphColor:", v14);

  -[BackgroundSoundsCCModuleViewController _updateSelectedState](self, "_updateSelectedState");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_232C00E08;
  v16[3] = &unk_2503FA318;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", v16, sel_comfortSoundsEnabled, self);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BackgroundSoundsCCModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[HACCShortcutViewController view](self->_shortcutController, "view");
  }
  else
  {
    -[HACCShortcutViewController view](self->_shortcutController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (double)preferredExpandedContentHeight
{
  double result;

  -[HACCShortcutViewController preferredExpandedContentHeight](self->_shortcutController, "preferredExpandedContentHeight");
  return result;
}

- (void)setContentModuleContext:(id)a3
{
  -[HACCShortcutViewController setContentModuleContext:](self->_shortcutController, "setContentModuleContext:", a3);
}

- (void)shortcutDidChangeSize:(id)a3
{
  void *v4;

  -[BackgroundSoundsCCModuleViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[BackgroundSoundsCCModuleViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
    MEMORY[0x24BEDD108](self, sel_setPreferredContentSize_);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "comfortSoundsEnabled") ^ 1;
  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComfortSoundsEnabled:", v6);

  -[BackgroundSoundsCCModuleViewController _updateSelectedState](self, "_updateSelectedState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end
