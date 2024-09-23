@implementation MCDLoadingContentView

- (MCDLoadingContentView)initWithFrame:(CGRect)a3
{
  MCDLoadingContentView *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MCDLoadingContentView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  _QWORD v48[9];

  v48[7] = *MEMORY[0x24BDAC8D0];
  v47.receiver = self;
  v47.super_class = (Class)MCDLoadingContentView;
  v3 = -[MCDLoadingContentView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    MCDCarDisplayBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LOADING_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v12);

    _MCDNoContentFontWithTextStyle(*MEMORY[0x24BEBE248]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v13);

    objc_msgSend(v10, "setTextAlignment:", 1);
    objc_msgSend(v10, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColor:", v16);

    objc_msgSend(v15, "setActivityIndicatorViewStyle:", 21);
    objc_msgSend(v15, "sizeToFit");
    objc_msgSend(v15, "startAnimating");
    v17 = objc_alloc_init(MEMORY[0x24BEBD718]);
    -[MCDLoadingContentView addLayoutGuide:](v3, "addLayoutGuide:", v17);
    -[MCDLoadingContentView addSubview:](v3, "addSubview:", v15);
    -[MCDLoadingContentView addSubview:](v3, "addSubview:", v10);
    v35 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v17, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v42 = v17;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    objc_msgSend(v17, "heightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView heightAnchor](v3, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:multiplier:constant:", v40, 0.15, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v39;
    objc_msgSend(v10, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v36;
    objc_msgSend(v10, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 12.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    objc_msgSend(v10, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v27;
    objc_msgSend(v15, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDLoadingContentView centerXAnchor](v3, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v20;
    objc_msgSend(v15, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 28.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[6] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v24);

    v25 = v3;
  }

  return v3;
}

@end
