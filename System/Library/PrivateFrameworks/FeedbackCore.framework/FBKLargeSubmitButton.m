@implementation FBKLargeSubmitButton

- (FBKLargeSubmitButton)initWithTableView:(id)a3 target:(id)a4 action:(SEL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  FBKLargeSubmitButton *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BEBD438];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "filledButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBaseBackgroundColor:", v12);

  objc_msgSend(v11, "setCornerStyle:", 3);
  objc_msgSend(v11, "setButtonSize:", 3);
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SUBMIT_BUTTON"), &stru_24E15EAF8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "sizeToFit");
  objc_msgSend(v13, "addTarget:action:forControlEvents:", v9, a5, 0x2000);

  objc_msgSend(v10, "frame");
  v17 = v16;

  v36.receiver = self;
  v36.super_class = (Class)FBKLargeSubmitButton;
  v18 = -[FBKLargeSubmitButton initWithFrame:](&v36, sel_initWithFrame_, 0.0, 0.0, v17, 94.0);
  if (v18)
  {
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FBKLargeSubmitButton addSubview:](v18, "addSubview:", v13);
    v29 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v13, "leftAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLargeSubmitButton safeAreaLayoutGuide](v18, "safeAreaLayoutGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 20.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    objc_msgSend(v13, "rightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLargeSubmitButton safeAreaLayoutGuide](v18, "safeAreaLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v28, -20.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v27;
    objc_msgSend(v13, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLargeSubmitButton topAnchor](v18, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 22.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v21;
    objc_msgSend(v13, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLargeSubmitButton bottomAnchor](v18, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -22.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v25);

  }
  return v18;
}

@end
