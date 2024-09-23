@implementation WDSourcesListTableViewCell

- (WDSourcesListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDSourcesListTableViewCell *v4;
  WDSourcesListTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDSourcesListTableViewCell;
  v4 = -[WDSourcesListTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDSourcesListTableViewCell setUpSubviews](v4, "setUpSubviews");
    -[WDSourcesListTableViewCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[WDSourcesListTableViewCell setSourceModel:](self, "setSourceModel:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WDSourcesListTableViewCell;
  -[WDSourcesListTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setUpSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  -[WDSourcesListTableViewCell setIconImage:](self, "setIconImage:", v4);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentMode:", 2);

  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[WDSourcesListTableViewCell setTitleLabel:](self, "setTitleLabel:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", 4);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v17);

}

- (void)setupConstraints
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

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 29.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 29.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell iconImage](self, "iconImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:constant:", v37, -16.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[WDSourcesListTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 61.0, 0.0, 0.0);
}

- (void)setSourceModel:(id)a3
{
  HKSourceDataModel *v5;
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
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  id location;

  v5 = (HKSourceDataModel *)a3;
  if (self->_sourceModel != v5)
  {
    objc_storeStrong((id *)&self->_sourceModel, a3);
    if (v5)
    {
      -[HKSourceDataModel source](v5, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_isConnectedGymSource"))
        HKConnectedGymSourceName();
      else
        objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      -[HKSourceDataModel icon](v5, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HKSourceDataModel icon](v5, "icon");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDSourcesListTableViewCell iconImage](self, "iconImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v12);

      }
      else
      {
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke;
        v22[3] = &unk_24D38CF38;
        v22[4] = self;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_2;
        v19[3] = &unk_24D38E5C0;
        objc_copyWeak(&v21, &location);
        v20 = v6;
        objc_msgSend(v14, "loadIconForSource:syncHandler:asyncHandler:", v20, v22, v19);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      v15 = (void *)*MEMORY[0x24BE4A178];
      -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(".Source.%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDSourcesListTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v18);

    }
    else
    {
      -[WDSourcesListTableViewCell titleLabel](self, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", 0);

      -[WDSourcesListTableViewCell iconImage](self, "iconImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", 0);

    }
  }

}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_3;
  v9[3] = &unk_24D38E598;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:fetchError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 fetchError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14)
  {
    if (!v9)
    {
      -[WDSourcesListTableViewCell sourceModel](self, "sourceModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqual:", v11);

      if (v12)
      {
        -[WDSourcesListTableViewCell iconImage](self, "iconImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v14);

      }
    }
  }

}

- (HKSourceDataModel)sourceModel
{
  return self->_sourceModel;
}

- (UIImageView)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_sourceModel, 0);
}

@end
