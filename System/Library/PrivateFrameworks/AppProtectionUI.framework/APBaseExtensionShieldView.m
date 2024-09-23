@implementation APBaseExtensionShieldView

- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4
{
  return -[APBaseExtensionShieldView initWithLocalizedApplicationName:iconImage:unlockButtonHidden:](self, "initWithLocalizedApplicationName:iconImage:unlockButtonHidden:", a3, a4, 0);
}

- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4 unlockButtonHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  APBaseExtensionShieldView *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  APSymbolBadgedAppIconView *v14;
  uint64_t v15;
  APSymbolBadgedAppIconView *iconView;
  UILabel *v17;
  UILabel *label;
  UILabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIButton *unlockButton;
  UIButton *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _BYTE v73[40];
  _QWORD v74[8];
  uint64_t v75;
  _QWORD v76[3];

  v5 = a5;
  v76[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[APBaseExtensionShieldView init](self, "init");
  if (v10)
  {
    v11 = APGetPreferredAuthenticationMechanism();
    v12 = CFSTR("com.apple.appprotection.badge.touchid");
    if (v11 == 3)
      v12 = CFSTR("com.apple.appprotection.badge.passcode");
    if (v11 == 1)
      v13 = CFSTR("com.apple.appprotection.badge.faceid");
    else
      v13 = v12;
    v72 = v8;
    v14 = [APSymbolBadgedAppIconView alloc];
    +[APSymbolBadgedAppIconView metricsForExtensionShield](APSymbolBadgedAppIconView, "metricsForExtensionShield");
    v15 = -[APSymbolBadgedAppIconView initWithApplicationIconImage:symbolType:metrics:](v14, "initWithApplicationIconImage:symbolType:metrics:", v9, v13, v73);
    iconView = v10->_iconView;
    v10->_iconView = (APSymbolBadgedAppIconView *)v15;

    -[APSymbolBadgedAppIconView setTranslatesAutoresizingMaskIntoConstraints:](v10->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[APBaseExtensionShieldView addSubview:](v10, "addSubview:", v10->_iconView);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v10->_label;
    v10->_label = v17;

    v19 = v10->_label;
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBE258]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scaledFontForFont:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v22);

    v23 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("BASE_EXTENSION_SHIELD_VIEW_LABEL_%@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v25);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](v10->_label, "setText:", v71);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[APBaseExtensionShieldView addSubview:](v10, "addSubview:", v10->_label);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v26 = objc_claimAutoreleasedReturnValue();
    unlockButton = v10->_unlockButton;
    v10->_unlockButton = (UIButton *)v26;

    -[UIButton addTarget:action:forControlEvents:](v10->_unlockButton, "addTarget:action:forControlEvents:", v10, sel_unlockTapped_, 0x2000);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_unlockButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = v10->_unlockButton;
    v29 = (void *)MEMORY[0x24BDD17C8];
    APUILocStr(CFSTR("EXTENSION_SHIELD_RETRY_BUTTON_AX_HINT_FMT"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v30, v72);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityHint:](v28, "setAccessibilityHint:", v31);

    -[UIButton setHidden:](v10->_unlockButton, "setHidden:", v5);
    v75 = *MEMORY[0x24BEBD270];
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BEBE268]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scaledFontForFont:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("BASE_EXTENSION_SHIELD_VIEW_UNLOCK_BUTTON_%@"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v37);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v10->_unlockButton;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v69, v70);
    -[UIButton setAttributedTitle:forState:](v38, "setAttributedTitle:forState:", v39, 0);

    -[APBaseExtensionShieldView addSubview:](v10, "addSubview:", v10->_unlockButton);
    -[APSymbolBadgedAppIconView centerXAnchor](v10->_iconView, "centerXAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView centerXAnchor](v10, "centerXAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v66;
    -[APSymbolBadgedAppIconView centerYAnchor](v10->_iconView, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView centerYAnchor](v10, "centerYAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -56.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v63;
    -[UILabel centerXAnchor](v10->_label, "centerXAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView centerXAnchor](v10, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v60;
    -[UILabel centerYAnchor](v10->_label, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView centerYAnchor](v10, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 10.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v57;
    -[UILabel widthAnchor](v10->_label, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView widthAnchor](v10, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v54;
    -[UILabel heightAnchor](v10->_label, "heightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView heightAnchor](v10, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74[5] = v41;
    -[UIButton centerXAnchor](v10->_unlockButton, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView centerXAnchor](v10, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v74[6] = v44;
    -[UIButton firstBaselineAnchor](v10->_unlockButton, "firstBaselineAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v10->_label, "lastBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 2.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v74[7] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v53);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseExtensionShieldView setBackgroundColor:](v10, "setBackgroundColor:", v48);

    v49 = v10->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_22);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v49, "setTextColor:", v50);

    v8 = v72;
  }

  return v10;
}

id __91__APBaseExtensionShieldView_initWithLocalizedApplicationName_iconImage_unlockButtonHidden___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __91__APBaseExtensionShieldView_initWithLocalizedApplicationName_iconImage_unlockButtonHidden___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)unlockTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shieldViewUnlockButtonPressed:", self);

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (APBaseExtensionShieldViewDelegate)delegate
{
  return (APBaseExtensionShieldViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unlockButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
