@implementation HACCSSLButton

- (HACCSSLButton)initWithFrame:(CGRect)a3
{
  HACCSSLButton *v3;
  void *v4;
  uint64_t v5;
  CCUILabeledRoundButtonViewController *buttonVC;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HACCSSLButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    paLocString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setTitleText:](v3, "setTitleText:", v4);
    HUICCButtonVCWithSystemImageName(CFSTR("person.wave.2.fill"));
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

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __31__HACCSSLButton_initWithFrame___block_invoke;
    v11[3] = &unk_24DD60E18;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_sslEnabled, v3);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __31__HACCSSLButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (void)updateValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HACCSSLButton;
  -[HUICCCapsuleButton updateValue](&v3, sel_updateValue);
  -[HUICCCapsuleButton setDimmingState:](self, "setDimmingState:", -[HACCSSLButton enabled](self, "enabled") ^ 1);
  -[HACCSSLButton _updateButtonView](self, "_updateButtonView");
}

- (void)_updateButtonView
{
  void *v3;
  char v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  char v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[HACCSSLButton contentValue](self, "contentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v6 = (void **)v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v5;
    v6 = &v16;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPaletteColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  paLocString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HACCSSLButton__updateButtonView__block_invoke;
  block[3] = &unk_24DD610A0;
  block[4] = self;
  v13 = v8;
  v15 = v4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __34__HACCSSLButton__updateButtonView__block_invoke(uint64_t a1)
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

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sslEnabledForAddress:", v3);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  hearingLocString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCSSLButton contentValue](self, "contentValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    hearingLocString();
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonVC, 0);
}

@end
