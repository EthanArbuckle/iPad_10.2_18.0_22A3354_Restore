@implementation PRXCardContentViewController(CARSetupPrompts)

- (id)carSetup_carPlayIconView
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.CarPlayApp"), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v2);
  return v3;
}

- (void)carSetup_addCarPlayIconCenteredInMainContent
{
  id v2;

  objc_msgSend(a1, "carSetup_carPlayIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "carSetup_addMainContentCenteredView:size:", v2, 98.0, 98.0);

}

- (void)carSetup_addMainContentCenteredView:()CARSetupPrompts size:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  objc_msgSend(a1, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainContentGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v29;
  objc_msgSend(v8, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  objc_msgSend(v8, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v16;
  objc_msgSend(v8, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  objc_msgSend(v11, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v20);

  if (a2 != *MEMORY[0x24BDBF148] || a3 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v21 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v23;
    objc_msgSend(v8, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v26);

  }
}

@end
