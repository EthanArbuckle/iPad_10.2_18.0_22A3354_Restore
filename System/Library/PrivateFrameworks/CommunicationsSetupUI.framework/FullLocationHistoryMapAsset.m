@implementation FullLocationHistoryMapAsset

- (FullLocationHistoryMapAsset)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  FullLocationHistoryMapAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIView *assetView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FullLocationHistoryMapAsset;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", CFSTR("fullLocationHistoryMap"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v8);
    assetView = v5->_assetView;
    v5->_assetView = (UIView *)v9;

    -[FullLocationHistoryMapAsset setUpConstraints](v5, "setUpConstraints");
  }
  return v5;
}

- (void)setUpConstraints
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
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 2);

  -[FullLocationHistoryMapAsset contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v19 = (void *)MEMORY[0x24BDD1628];
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FullLocationHistoryMapAsset contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FullLocationHistoryMapAsset contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FullLocationHistoryMapAsset contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v10;
  -[FullLocationHistoryMapAsset contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FullLocationHistoryMapAsset assetView](self, "assetView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

}

- (UIView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_assetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetView, 0);
}

@end
