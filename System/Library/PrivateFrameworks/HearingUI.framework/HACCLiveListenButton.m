@implementation HACCLiveListenButton

- (HACCLiveListenButton)initWithFrame:(CGRect)a3
{
  HACCLiveListenButton *v3;
  void *v4;
  uint64_t v5;
  CCUILabeledRoundButtonViewController *buttonVC;
  void *v7;
  void *v8;
  HACCLiveListenLevelGroup *v9;
  uint64_t v10;
  HACCLiveListenLevelGroup *levelGroup;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HACCLiveListenButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    hearingLocString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setTitleText:](v3, "setTitleText:", v4);
    HUICCButtonVCWithSystemImageName(CFSTR("mic.fill"));
    v5 = objc_claimAutoreleasedReturnValue();
    buttonVC = v3->_buttonVC;
    v3->_buttonVC = (CCUILabeledRoundButtonViewController *)v5;

    -[CCUILabeledRoundButtonViewController setTitle:](v3->_buttonVC, "setTitle:", v4);
    -[CCUILabeledRoundButtonViewController button](v3->_buttonVC, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v3, sel_buttonTapped, 64);

    -[CCUILabeledRoundButtonViewController button](v3->_buttonVC, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setIconView:](v3, "setIconView:", v8);

    v9 = [HACCLiveListenLevelGroup alloc];
    v10 = -[HACCLiveListenLevelGroup initWithFrame:](v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    levelGroup = v3->_levelGroup;
    v3->_levelGroup = (HACCLiveListenLevelGroup *)v10;

    -[HACCLiveListenLevelGroup setHidden:](v3->_levelGroup, "setHidden:", 1);
    -[HUICCCapsuleButton setAccessoryView:](v3, "setAccessoryView:", v3->_levelGroup);

  }
  return v3;
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Registering Live Listen listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCLiveListenButton subscribeListeners]", 141, v3);
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
  v9[2] = __42__HACCLiveListenButton_subscribeListeners__block_invoke;
  v9[3] = &unk_24DD61340;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v8, "registerListener:forLiveListenLevelsHandler:", self, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __42__HACCLiveListenButton_subscribeListeners__block_invoke(uint64_t a1, char a2, double a3)
{
  id v5[2];
  char v6;

  objc_copyWeak(v5, (id *)(a1 + 32));
  v6 = a2;
  v5[1] = *(id *)&a3;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v5);
}

void __42__HACCLiveListenButton_subscribeListeners__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "isListening");
  v5 = *(unsigned __int8 *)(a1 + 48);

  if (v5 != v4)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setIsListening:", *(unsigned __int8 *)(a1 + 48));

    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "updateStatusBarOverride");

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "_updateAXValueString");

  }
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "liveListenAudioLevelDidChange:", *(double *)(a1 + 40));

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "updateValue");

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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unregistering Live Listen listener"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCLiveListenButton unsubscribeListeners]", 179, v3);
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

}

- (void)updateStatusBarOverride
{
  _BOOL4 v3;
  SBSStatusBarStyleOverridesAssertion *v4;
  SBSStatusBarStyleOverridesAssertion *statusBarAssertion;
  SBSStatusBarStyleOverridesAssertion *v6;
  void *v7;
  SBSStatusBarStyleOverridesAssertion *v8;

  v3 = -[HACCLiveListenButton isListening](self, "isListening");
  -[SBSStatusBarStyleOverridesAssertion invalidate](self->_statusBarAssertion, "invalidate");
  if (v3)
  {
    v4 = (SBSStatusBarStyleOverridesAssertion *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0B38]), "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 1024, getpid(), 0, 0);
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = v4;

    v6 = self->_statusBarAssertion;
    hearingLocString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSStatusBarStyleOverridesAssertion setStatusString:](v6, "setStatusString:", v7);

    -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](self->_statusBarAssertion, "acquireWithHandler:invalidationHandler:", &__block_literal_global_1, &__block_literal_global_215);
  }
  else
  {
    v8 = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;

  }
}

- (HACCLiveListenLevelGroup)levelGroup
{
  HACCLiveListenLevelGroup *levelGroup;
  HACCLiveListenLevelGroup *v4;
  HACCLiveListenLevelGroup *v5;
  HACCLiveListenLevelGroup *v6;

  levelGroup = self->_levelGroup;
  if (!levelGroup)
  {
    v4 = [HACCLiveListenLevelGroup alloc];
    v5 = -[HACCLiveListenLevelGroup initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_levelGroup;
    self->_levelGroup = v5;

    levelGroup = self->_levelGroup;
  }
  return levelGroup;
}

- (void)liveListenAudioLevelDidChange:(double)a3
{
  id v4;

  -[HACCLiveListenButton levelGroup](self, "levelGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLevel:", a3);

}

- (id)contentValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HACCLiveListenButton isListening](self, "isListening"));
}

- (void)updateValue
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HACCLiveListenButton;
  -[HUICCCapsuleButton updateValue](&v2, sel_updateValue);
  liveListenStreamSelectedAsync();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke()
{
  return hearingAidStreamAvailableAsync();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke_2()
{
  return AXPerformBlockOnMainThread();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isLiveListenAvailable");
  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setIsLiveListenAvailable:", objc_msgSend(v4, "count") == 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsLiveListenAvailable:", 0);
  }
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "isLiveListenAvailable"))
    objc_msgSend(*(id *)(a1 + 32), "_updateAXValueString");
  return objc_msgSend(*(id *)(a1 + 32), "updateUI");
}

- (void)updateUI
{
  _BOOL4 v3;
  HACCLiveListenLevelGroup *levelGroup;
  void *v5;
  HACCLiveListenButton *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = -[HACCLiveListenButton isListening](self, "isListening");
  levelGroup = self->_levelGroup;
  if (v3)
  {
    -[HACCLiveListenLevelGroup setHidden:](levelGroup, "setHidden:", 0);
    -[HACCLiveListenButton setAxHintStr:](self, "setAxHintStr:", 0);
    hearingLocString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setSubtitleText:](self, "setSubtitleText:", v5);

    v6 = self;
    v7 = 0;
  }
  else
  {
    -[HACCLiveListenLevelGroup setHidden:](levelGroup, "setHidden:", 1);
    hearingLocString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCLiveListenButton setAxHintStr:](self, "setAxHintStr:", v8);

    if (-[HACCLiveListenButton enabled](self, "enabled"))
    {
      -[HACCLiveListenButton setAxHintStr:](self, "setAxHintStr:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "wirelessSplitterEnabled");

      if (v10)
      {
        hearingLocString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HACCLiveListenButton setAxHintStr:](self, "setAxHintStr:", v11);

      }
    }
    -[HUICCCapsuleButton setSubtitleText:](self, "setSubtitleText:", 0);
    v7 = -[HACCLiveListenButton enabled](self, "enabled") ^ 1;
    v6 = self;
  }
  -[HUICCCapsuleButton setDimmingState:](v6, "setDimmingState:", v7);
  -[HACCLiveListenButton _updateButtonView](self, "_updateButtonView");
}

- (void)_updateButtonView
{
  BOOL v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[HACCLiveListenButton isListening](self, "isListening");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    v5 = (void **)v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v4;
    v5 = &v15;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPaletteColors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HACCLiveListenButton__updateButtonView__block_invoke;
  block[3] = &unk_24DD610A0;
  block[4] = self;
  v12 = v7;
  v14 = v3;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __41__HACCLiveListenButton__updateButtonView__block_invoke(uint64_t a1)
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

- (void)_updateAXValueString
{
  id v3;

  -[HACCLiveListenButton setAccessibilityValueString:](self, "setAccessibilityValueString:", 0);
  if (-[HACCLiveListenButton isListening](self, "isListening") || -[HACCLiveListenButton enabled](self, "enabled"))
  {
    hearingLocString();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[HACCLiveListenButton setAccessibilityValueString:](self, "setAccessibilityValueString:", v3);

  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t *v3;

  if (-[HACCLiveListenButton isListening](self, "isListening")
    || -[HACCLiveListenButton isEnabled](self, "isEnabled"))
  {
    v3 = (unint64_t *)MEMORY[0x24BEBDF00];
  }
  else
  {
    v3 = (unint64_t *)MEMORY[0x24BEBDF20];
  }
  return *v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v19.receiver = self;
  v19.super_class = (Class)HACCLiveListenButton;
  -[HUICCCapsuleButton accessibilityCustomActions](&v19, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUICCCapsuleButton iconView](self, "iconView");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[HACCLiveListenButton isEnabled](self, "isEnabled");

    if (v8)
    {
      -[HACCLiveListenButton isListening](self, "isListening");
      hearingLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v10 = objc_alloc(MEMORY[0x24BEBD378]);
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __50__HACCLiveListenButton_accessibilityCustomActions__block_invoke;
      v16 = &unk_24DD61078;
      objc_copyWeak(&v17, &location);
      v11 = (void *)objc_msgSend(v10, "initWithName:actionHandler:", v9, &v13);
      objc_msgSend(v5, "addObject:", v11, v13, v14, v15, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }
  return v5;
}

uint64_t __50__HACCLiveListenButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "buttonTapped");

  return 1;
}

- (NSString)accessibilityValueString
{
  return self->_accessibilityValueString;
}

- (void)setAccessibilityValueString:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityValueString, a3);
}

- (void)setLevelGroup:(id)a3
{
  objc_storeStrong((id *)&self->_levelGroup, a3);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isLiveListenAvailable
{
  return self->_isLiveListenAvailable;
}

- (void)setIsLiveListenAvailable:(BOOL)a3
{
  self->_isLiveListenAvailable = a3;
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

- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_axHintStr, 0);
  objc_storeStrong((id *)&self->_buttonVC, 0);
  objc_storeStrong((id *)&self->_levelGroup, 0);
  objc_storeStrong((id *)&self->_accessibilityValueString, 0);
}

@end
