@implementation HUBannerCollectionViewCell

- (HUBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUBannerCollectionViewCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  HUBannerView *bannerView;
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HUBannerCollectionViewCell;
  v3 = -[HUBannerCollectionViewCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bannerViewClass"));
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    bannerView = v3->_bannerView;
    v3->_bannerView = (HUBannerView *)v6;

    -[HUBannerView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_bannerView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerView leadingAnchor](v3->_bannerView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

    -[HUBannerView trailingAnchor](v3->_bannerView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);

    -[HUBannerView topAnchor](v3->_bannerView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

    -[HUBannerView bottomAnchor](v3->_bannerView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerCollectionViewCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
  }
  return v3;
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
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
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

  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
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
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
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
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutOptions:", v4);

}

- (HUGridCellLayoutOptions)layoutOptions
{
  void *v2;
  void *v3;

  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
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
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellContentsHidden:", v3);

}

- (BOOL)areCellContentsHidden
{
  void *v2;
  char v3;

  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areCellContentsHidden");

  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)HUBannerCollectionViewCell;
  -[HUBannerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:animated:", v3, 0);

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (HUBannerViewDelegate)delegate
{
  void *v2;
  void *v3;

  -[HUBannerCollectionViewCell bannerView](self, "bannerView");
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
