@implementation WDElectrocardiogramSetupView

- (id)createHeroView
{
  id v2;
  id v3;
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
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v4 = (void *)MEMORY[0x24BDF6AC8];
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("setup-watch-Cinnamon"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithImage:", v6);

  v23 = v7;
  objc_msgSend(v2, "addSubview:", v7);
  objc_msgSend(v7, "hk_alignConstraintsWithView:", v2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4C0B0]), "initWithFrame:isLargeDevice:", 0, 18.0, 45.0, 80.0, 98.0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setTimeRemaining:", 11.0);
  objc_msgSend(v2, "addSubview:", v8);
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 18.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(v8, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 45.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(v8, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 80.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  objc_msgSend(v8, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 98.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v17);

  return v2;
}

- (id)titleString
{
  void *v2;
  void *v3;
  void *v4;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SETUP_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bodyString
{
  void *v2;
  void *v3;
  void *v4;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SETUP_BODY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;
  void *v4;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM_SETUP_BUTTON_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)accessibilityGroupID
{
  return 1;
}

@end
