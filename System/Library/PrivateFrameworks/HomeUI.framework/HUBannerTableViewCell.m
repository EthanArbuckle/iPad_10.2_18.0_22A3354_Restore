@implementation HUBannerTableViewCell

- (HUBannerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUBannerTableViewCell *v4;
  id v5;
  void *v6;
  uint64_t v7;
  HUBannerView *bannerView;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HUBannerTableViewCell;
  v4 = -[HUBannerTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bannerViewClass"));
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = objc_msgSend(v5, "initWithFrame:");
    bannerView = v4->_bannerView;
    v4->_bannerView = (HUBannerView *)v7;

    -[HUBannerView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_bannerView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView leadingAnchor](v4->_bannerView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    -[HUBannerView trailingAnchor](v4->_bannerView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

    -[HUBannerView topAnchor](v4->_bannerView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    -[HUBannerView bottomAnchor](v4->_bannerView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  }
  return v4;
}

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setLayoutOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutOptions:", v4);

}

- (HUGridCellLayoutOptions)layoutOptions
{
  void *v2;
  void *v3;

  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUGridCellLayoutOptions *)v3;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellContentsHidden:", v3);

}

- (BOOL)areCellContentsHidden
{
  void *v2;
  char v3;

  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areCellContentsHidden");

  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)HUBannerTableViewCell;
  -[HUBannerTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:animated:", v5, v4);

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (HUBannerViewDelegate)delegate
{
  void *v2;
  void *v3;

  -[HUBannerTableViewCell bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUBannerViewDelegate *)v3;
}

- (HUBannerView)bannerView
{
  return self->_bannerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
