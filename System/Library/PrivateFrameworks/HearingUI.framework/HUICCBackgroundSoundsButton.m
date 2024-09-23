@implementation HUICCBackgroundSoundsButton

- (HUICCBackgroundSoundsButton)initWithFrame:(CGRect)a3
{
  HUICCBackgroundSoundsButton *v3;
  uint64_t v4;
  CCUILabeledRoundButtonViewController *buttonVC;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUICCBackgroundSoundsButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    HUICCButtonVCWithSystemImageName(CFSTR("music.quarternote.3"));
    v4 = objc_claimAutoreleasedReturnValue();
    buttonVC = v3->_buttonVC;
    v3->_buttonVC = (CCUILabeledRoundButtonViewController *)v4;

    hearingLocString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUILabeledRoundButtonViewController setTitle:](v3->_buttonVC, "setTitle:", v6);

    -[CCUILabeledRoundButtonViewController button](v3->_buttonVC, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v3, sel_buttonTapped, 64);

    -[CCUILabeledRoundButtonViewController button](v3->_buttonVC, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setIconView:](v3, "setIconView:", v8);

  }
  return v3;
}

- (void)updateValue
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUICCBackgroundSoundsButton;
  -[HUICCCapsuleButton updateValue](&v6, sel_updateValue);
  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HUICCBackgroundSoundsButton_updateValue__block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_async(v4, block);

}

void __42__HUICCBackgroundSoundsButton_updateValue__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  hearingLocString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "backgroundSoundsRouteDecision");

  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "comfortSoundsEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedComfortSound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (v2 != 3 && v2 != 2)
  {
    v7 = 0;
    goto LABEL_7;
  }
  hearingLocString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_8:
  v12 = v0;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v0;
  AXPerformBlockOnMainThread();

}

uint64_t __42__HUICCBackgroundSoundsButton_updateValue__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitleText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitleText:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateButtonView");
  return objc_msgSend(*(id *)(a1 + 32), "setAxHintStr:", *(_QWORD *)(a1 + 56));
}

- (void)buttonTapped
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUICCBackgroundSoundsButton;
  -[HUICCCapsuleButton buttonTapped](&v3, sel_buttonTapped);
  -[HUICCBackgroundSoundsButton updateValue](self, "updateValue");
}

- (void)_updateButtonView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  char v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "comfortSoundsEnabled");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v6;
    v7 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    v7 = v17;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPaletteColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HUICCBackgroundSoundsButton__updateButtonView__block_invoke;
  block[3] = &unk_24DD610A0;
  block[4] = self;
  v14 = v9;
  v16 = v4;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __48__HUICCBackgroundSoundsButton__updateButtonView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "buttonVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "glyphImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageByApplyingSymbolConfiguration:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGlyphImage:", v5);

  objc_msgSend(*(id *)(a1 + 32), "buttonVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityUserInputLabels:", v8);

}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)subscribeListeners
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BS button: Registering Live Listen listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUICCBackgroundSoundsButton subscribeListeners]", 129, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_21A95E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke;
  v9[3] = &unk_24DD61340;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v8, "registerListener:forLiveListenLevelsHandler:", self, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  int v5;
  id v6;
  id v7;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "isListening");

  if (v5 != (_DWORD)a2)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setIsListening:", a2);

    objc_copyWeak(&v7, v3);
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v7);
  }
}

void __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (void)unsubscribeListeners
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BS button: Unregistering Live Listen listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUICCBackgroundSoundsButton unsubscribeListeners]", 145, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_21A95E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterLiveListenLevelListener:", self);

  -[HUICCBackgroundSoundsButton setIsListening:](self, "setIsListening:", 0);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v18.receiver = self;
  v18.super_class = (Class)HUICCBackgroundSoundsButton;
  -[HUICCCapsuleButton accessibilityCustomActions](&v18, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUICCCapsuleButton iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "comfortSoundsEnabled");

    hearingLocString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x24BEBD378]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __57__HUICCBackgroundSoundsButton_accessibilityCustomActions__block_invoke;
    v15 = &unk_24DD61078;
    objc_copyWeak(&v16, &location);
    v10 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v8, &v12);
    objc_msgSend(v5, "addObject:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v5;
}

uint64_t __57__HUICCBackgroundSoundsButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "buttonTapped");

  return 1;
}

- (BOOL)shouldIncludeIconViewInFooterViews
{
  void *v2;
  BOOL v3;

  -[HUICCCapsuleButton iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CCUILabeledRoundButtonViewController)buttonVC
{
  return self->_buttonVC;
}

- (void)setButtonVC:(id)a3
{
  objc_storeStrong((id *)&self->_buttonVC, a3);
}

- (NSString)axHintStr
{
  return self->_axHintStr;
}

- (void)setAxHintStr:(id)a3
{
  objc_storeStrong((id *)&self->_axHintStr, a3);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHintStr, 0);
  objc_storeStrong((id *)&self->_buttonVC, 0);
}

@end
