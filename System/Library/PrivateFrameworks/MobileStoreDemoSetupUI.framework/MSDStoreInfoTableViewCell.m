@implementation MSDStoreInfoTableViewCell

- (id)initSpinnerCellWithReuseIdentifier:(id)a3
{
  MSDStoreInfoTableViewCell *v3;
  MSDStoreInfoTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)MSDStoreInfoTableViewCell;
  v3 = -[MSDStoreInfoTableViewCell initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    -[MSDStoreInfoTableViewCell setSelectionStyle:](v3, "setSelectionStyle:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MSDStoreInfoTableViewCell addSubview:](v4, "addSubview:", v5);
    objc_msgSend(v5, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoTableViewCell centerXAnchor](v4, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(v5, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoTableViewCell centerYAnchor](v4, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v6;
    objc_msgSend(v5, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoTableViewCell heightAnchor](v4, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:multiplier:", v8, 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v9;
    objc_msgSend(v5, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
    objc_msgSend(v5, "startAnimating");

  }
  return v4;
}

- (MSDStoreInfoTableViewCell)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 imageColor:(id)a6 reuseIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MSDStoreInfoTableViewCell *v16;
  MSDStoreInfoTableViewCell *v17;
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
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MSDStoreInfoTableViewCell;
  v16 = -[MSDStoreInfoTableViewCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, 3, a7);
  v17 = v16;
  if (v16)
  {
    -[MSDStoreInfoTableViewCell defaultContentConfiguration](v16, "defaultContentConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v12);
    objc_msgSend(v18, "setSecondaryText:", v13);
    objc_msgSend(v18, "setImage:", v14);
    objc_msgSend(v18, "imageProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v15);

    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v20);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "secondaryTextProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v22);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "secondaryTextProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setColor:", v24);

    objc_msgSend(v18, "image");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 25.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageByApplyingSymbolConfiguration:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v28);

    objc_msgSend(v18, "imageProperties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setReservedLayoutSize:", 50.0, 50.0);

    objc_msgSend(v18, "setTextToSecondaryTextVerticalPadding:", 3.0);
    -[MSDStoreInfoTableViewCell setContentConfiguration:](v17, "setContentConfiguration:", v18);
    -[MSDStoreInfoTableViewCell contentView](v17, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);

  }
  return v17;
}

@end
