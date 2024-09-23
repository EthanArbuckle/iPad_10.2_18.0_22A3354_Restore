@implementation CPUIImageRowCell

+ (double)minimumHeight
{
  return 123.0;
}

+ (double)rowHeight
{
  return 123.0;
}

- (void)_updateTintColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPUIImageRowCell;
  -[_CPUIBaseTableCell _updateTintColors](&v7, sel__updateTintColors);
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell chevronView](self, "chevronView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPUIImageRowCell isHighlighted](self, "isHighlighted"))
    v6 = v4;
  else
    v6 = v3;
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)configureCell
{
  id v3;
  void *v4;
  id selectTitleBlock;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *trailingView;
  void *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  UIImage *fallbackImage;
  uint64_t v15;
  CGFloat height;
  NSArray *v17;
  NSArray *imageTitles;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _CPUIImageRowHighlightButton *v23;
  _CPUIImageRowHighlightButton *focusIndicator;
  void *v25;
  void *v26;
  void *v27;
  UIImageView *v28;
  UIImageView *chevronView;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  objc_super v66;
  _QWORD v67[11];

  v67[9] = *MEMORY[0x24BDAC8D0];
  v66.receiver = self;
  v66.super_class = (Class)CPUIImageRowCell;
  -[_CPUIBaseTableCell configureCell](&v66, sel_configureCell);
  v3 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  selectTitleBlock = self->_selectTitleBlock;
  self->_selectTitleBlock = v4;

  objc_msgSend(self->_selectTitleBlock, "setAxis:", 0);
  objc_msgSend(self->_selectTitleBlock, "setAlignment:", 3);
  objc_msgSend(self->_selectTitleBlock, "setDistribution:", 3);
  objc_msgSend(self->_selectTitleBlock, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(self->_selectTitleBlock, "setClipsToBounds:", 0);
  -[CPUIImageRowCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (UIView *)objc_opt_new();
  trailingView = self->_trailingView;
  self->_trailingView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setFont:](self->_trailingView, "setFont:", v10);

  -[CPUIImageRowCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 21);
  fallbackImage = self->_fallbackImage;
  self->_fallbackImage = v13;

  -[UIImage setTranslatesAutoresizingMaskIntoConstraints:](self->_fallbackImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = objc_opt_new();
  height = self->_lastKnownBoundingSize.height;
  *(_QWORD *)&self->_lastKnownBoundingSize.height = v15;

  v17 = (NSArray *)objc_opt_new();
  imageTitles = self->_imageTitles;
  self->_imageTitles = v17;

  -[NSArray addTarget:action:forControlEvents:](self->_imageTitles, "addTarget:action:forControlEvents:", self, sel_coreCellItemTapped_, 0x2000);
  -[NSArray setTranslatesAutoresizingMaskIntoConstraints:](self->_imageTitles, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUIImageRowCell addSubview:](self, "addSubview:", self->_imageTitles);
  -[CPUIImageRowCell sendSubviewToBack:](self, "sendSubviewToBack:", self->_imageTitles);
  v19 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[CPUIImageRowCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIChevronRightGlyph();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageWithRenderingMode:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (_CPUIImageRowHighlightButton *)objc_msgSend(v19, "initWithImage:", v22);
  focusIndicator = self->_focusIndicator;
  self->_focusIndicator = v23;

  -[_CPUIImageRowHighlightButton setTranslatesAutoresizingMaskIntoConstraints:](self->_focusIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUIImageRowCell setTrailingView:](self, "setTrailingView:", self->_focusIndicator);
  v25 = (void *)MEMORY[0x24BDF6AC8];
  CPUIFrameworkBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PlaceholderMusic"), v26, v27);
  v28 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  chevronView = self->_chevronView;
  self->_chevronView = v28;

  -[CPUIImageRowCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v52 = (void *)MEMORY[0x24BDD1628];
  -[UIView leadingAnchor](self->_trailingView, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 12.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v62;
  -[UIView topAnchor](self->_trailingView, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v58;
  -[UIView heightAnchor](self->_trailingView, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", 44.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v56;
  -[NSArray leadingAnchor](self->_imageTitles, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 4.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v51;
  -[NSArray trailingAnchor](self->_imageTitles, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -4.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v47;
  -[NSArray topAnchor](self->_imageTitles, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 4.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v67[5] = v43;
  -[NSArray bottomAnchor](self->_imageTitles, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, -4.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v67[6] = v30;
  objc_msgSend(self->_selectTitleBlock, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell leadingAnchor](self, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 12.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v67[7] = v33;
  objc_msgSend(self->_selectTitleBlock, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v67[8] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v38);

  -[CPUIImageRowCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CPListImageRowItem"));
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("CPListItemTitle"));

}

- (void)applyConfiguration:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", objc_msgSend(v4, "enabled"));
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[CPUIImageRowCell _updateTintColors](self, "_updateTintColors");
  objc_msgSend(v4, "selectGridItemBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell setSelectGridItemBlock:](self, "setSelectGridItemBlock:", v7);

  objc_msgSend(v4, "selectTitleBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell setSelectTitleBlock:](self, "setSelectTitleBlock:", v8);

  objc_msgSend(v4, "artworkCatalogs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell setArtworkCatalogs:](self, "setArtworkCatalogs:", v9);

  objc_msgSend(v4, "imageTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell setImageTitles:](self, "setImageTitles:", v10);

  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CPUIImageRowCell titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIImageRowCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v15);

  }
  else
  {
    -[CPUIImageRowCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", MEMORY[0x24BDBD1A8]);
  }
  objc_msgSend(v4, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CPUIPlaceholderTypeForBundleIdentifier(v16);

  -[CPUIImageRowCell traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIImageForPlaceholderTypeWithTraitCollection(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell setFallbackImage:](self, "setFallbackImage:", v19);

  -[CPUIImageRowCell setLoading:](self, "setLoading:", objc_msgSend(v4, "showActivityIndicator"));
  -[CPUIImageRowCell setNeedsLayout](self, "setNeedsLayout");
  -[CPUIImageRowCell _setNeedsArtworkImagesLayout](self, "_setNeedsArtworkImagesLayout");

}

- (double)_artworkContentWidth
{
  void *v2;
  double v3;
  CGRect v5;

  -[CPUIImageRowCell contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v3 = CGRectGetWidth(v5) + -24.0;

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  float v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  -[CPUIImageRowCell artworkCatalogs](self, "artworkCatalogs", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[CPUIImageRowCell _maxArtworkCountFittingSize](self, "_maxArtworkCountFittingSize");
  -[CPUIImageRowCell _artworkContentWidth](self, "_artworkContentWidth");
  v9 = 0.0;
  if (v8 >= 61.0)
  {
    if (v6 >= v7)
      v10 = v7;
    else
      v10 = v6;
    v11 = (v8 + 8.0) / (double)v10;
    v9 = (double)(uint64_t)vcvtms_s32_f32(v11) + -8.0;
  }
  if (v9 <= 95.0)
    v12 = v9 + 44.0;
  else
    v12 = 139.0;
  v13 = -[CPUIImageRowCell _showsImageTitles](self, "_showsImageTitles");
  v14 = 32.0;
  if (!v13)
    v14 = 0.0;
  v15 = v12 + v14 + 12.0;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (int64_t)_maxArtworkCountFittingSize
{
  double v3;
  int64_t v4;
  double v5;
  float v6;
  void *v7;
  unint64_t v8;
  float v9;
  double v10;
  int64_t result;

  -[CPUIImageRowCell _artworkContentWidth](self, "_artworkContentWidth");
  if (v3 < 61.0)
  {
    v4 = 0;
LABEL_10:
    if (v4 <= 4)
      return 4;
    else
      return v4;
  }
  v5 = v3 + 8.0;
  v6 = (v3 + 8.0) / 103.0;
  v4 = vcvtms_s32_f32(v6);
  -[CPUIImageRowCell artworkCatalogs](self, "artworkCatalogs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= v4)
    goto LABEL_10;
  v9 = v5 / (double)(v4 + 1);
  v10 = (double)(uint64_t)vcvtms_s32_f32(v9) + -8.0;
  if (v10 > 95.0)
    v10 = 95.0;
  result = v4 + 1 > 4 ? v4 + 1 : 4;
  if (v10 < 61.0)
    goto LABEL_10;
  return result;
}

- (void)setLoading:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[CPUIImageRowCell setTrailingView:](self, "setTrailingView:", self->_fallbackImage);
    -[CPUIImageRowCell activityIndicator](self, "activityIndicator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimating");
  }
  else
  {
    -[CPUIImageRowCell setTrailingView:](self, "setTrailingView:", self->_focusIndicator);
    -[CPUIImageRowCell activityIndicator](self, "activityIndicator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimating");
  }

}

- (void)setTrailingView:(id)a3
{
  NSLayoutConstraint *v4;
  NSLayoutConstraint *stackViewHeightConstraint;
  NSLayoutConstraint *v6;
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = (NSLayoutConstraint *)a3;
  -[NSLayoutConstraint removeFromSuperview](self->_stackViewHeightConstraint, "removeFromSuperview");
  stackViewHeightConstraint = self->_stackViewHeightConstraint;
  self->_stackViewHeightConstraint = v4;
  v6 = v4;

  -[CPUIImageRowCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  v17 = (void *)MEMORY[0x24BDD1628];
  -[NSLayoutConstraint trailingAnchor](self->_stackViewHeightConstraint, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -12.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  -[NSLayoutConstraint centerYAnchor](self->_stackViewHeightConstraint, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  -[CPUIImageRowCell focusIndicator](self, "focusIndicator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFocusedItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CPUIImageRowCell setHighlighted:](self, "setHighlighted:", v7 == v6);
}

- (BOOL)_showsImageTitles
{
  void *v2;
  BOOL v3;

  -[CPUIImageRowCell imageTitles](self, "imageTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPUIImageRowCell;
  -[CPUIImageRowCell setHighlighted:animated:](&v12, sel_setHighlighted_animated_, a3, a4);
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIImageRowCell _updateTintColors](self, "_updateTintColors");
  -[CPUIImageRowCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    v10 = v7;
  else
    v10 = v6;
  objc_msgSend(v8, "setTextColor:", v10);

  -[CPUIImageRowCell focusIndicator](self, "focusIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowHighlight:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double width;
  double v5;
  uint64_t v7;
  CGFloat v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPUIImageRowCell;
  -[CPUIImageRowCell layoutSubviews](&v9, sel_layoutSubviews);
  -[CPUIImageRowCell bounds](self, "bounds");
  width = self->_lastKnownBoundingSize.width;
  if (*(double *)&self->_needsArtworkImagesLayout != v5 || width != v3)
  {
    -[CPUIImageRowCell _setNeedsArtworkImagesLayout](self, "_setNeedsArtworkImagesLayout", *(double *)&self->_needsArtworkImagesLayout, width);
    -[CPUIImageRowCell _layoutArtworkImagesIfNeeded](self, "_layoutArtworkImagesIfNeeded");
  }
  -[CPUIImageRowCell bounds](self, "bounds");
  *(_QWORD *)&self->_needsArtworkImagesLayout = v7;
  self->_lastKnownBoundingSize.width = v8;
}

- (void)_setNeedsArtworkImagesLayout
{
  _QWORD block[5];

  if (!*(&self->super._itemEnabled + 1))
  {
    *(&self->super._itemEnabled + 1) = 1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__CPUIImageRowCell__setNeedsArtworkImagesLayout__block_invoke;
    block[3] = &unk_24DF241A0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __48__CPUIImageRowCell__setNeedsArtworkImagesLayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutArtworkImagesIfNeeded");
}

- (void)_layoutArtworkImagesIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[6];

  if (*(&self->super._itemEnabled + 1))
  {
    *(&self->super._itemEnabled + 1) = 0;
    -[CPUIImageRowCell artworkCatalogs](self, "artworkCatalogs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[CPUIImageRowCell artworkCatalogs](self, "artworkCatalogs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      v7 = -[CPUIImageRowCell _maxArtworkCountFittingSize](self, "_maxArtworkCountFittingSize");
      if (v6 >= v7)
        v8 = v7;
      else
        v8 = v6;
      -[CPUIImageRowCell artworkCatalogs](self, "artworkCatalogs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subarrayWithRange:", 0, v8);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      -[CPUIImageRowCell _artworkContentWidth](self, "_artworkContentWidth");
      v11 = (v10 + 8.0) / (double)v8;
      v12 = (double)(uint64_t)vcvtms_s32_f32(v11) + -8.0;
      if (v10 < 61.0)
        v12 = 0.0;
      if (v12 <= 95.0)
        v13 = v12;
      else
        v13 = 95.0;
      v14 = 8 * v8 - 8;
      if ((double)v14 + (double)v8 * v13 <= v10 + -12.0 - v13)
        v15 = (double)v14 + (double)v8 * v13;
      else
        v15 = v10;
      -[CPUIImageRowCell stackViewWidthConstraint](self, "stackViewWidthConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[CPUIImageRowCell stackViewWidthConstraint](self, "stackViewWidthConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setConstant:", v15);
      }
      else
      {
        -[CPUIImageRowCell stackView](self, "stackView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "widthAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPUIImageRowCell setStackViewWidthConstraint:](self, "setStackViewWidthConstraint:", v20);

        -[CPUIImageRowCell stackViewWidthConstraint](self, "stackViewWidthConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActive:", 1);
      }

      v21 = -[CPUIImageRowCell _showsImageTitles](self, "_showsImageTitles");
      v22 = 32.0;
      if (!v21)
        v22 = 0.0;
      v23 = v13 + v22;
      -[CPUIImageRowCell stackViewHeightConstraint](self, "stackViewHeightConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[CPUIImageRowCell stackViewHeightConstraint](self, "stackViewHeightConstraint");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setConstant:", v23);
      }
      else
      {
        -[CPUIImageRowCell stackView](self, "stackView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "heightAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToConstant:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPUIImageRowCell setStackViewHeightConstraint:](self, "setStackViewHeightConstraint:", v28);

        -[CPUIImageRowCell stackViewHeightConstraint](self, "stackViewHeightConstraint");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setActive:", 1);
      }

      -[CPUIImageRowCell reusableMediaViews](self, "reusableMediaViews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30 > v8)
      {
        while (--v30 >= v8)
        {
          -[CPUIImageRowCell reusableMediaViews](self, "reusableMediaViews");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[CPUIImageRowCell _removeArtworkTitleItem:](self, "_removeArtworkTitleItem:", v32);
        }
      }
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __48__CPUIImageRowCell__layoutArtworkImagesIfNeeded__block_invoke;
      v34[3] = &unk_24DF24418;
      v34[4] = self;
      *(double *)&v34[5] = v13;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v34);

    }
  }
}

void __48__CPUIImageRowCell__layoutArtworkImagesIfNeeded__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _CPUIImageRowCellImageTitleItem *v9;
  _CPUIImageRowCellImageTitleItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  double v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  _CPUIImageRowCellImageTitleItem *v23;
  _CPUIImageRowCellImageTitleItem *v24;
  _CPUIImageRowCellImageTitleItem *v25;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "reusableMediaViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reusableMediaViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v23 = (_CPUIImageRowCellImageTitleItem *)objc_claimAutoreleasedReturnValue();

    v9 = v23;
    if (v23)
      goto LABEL_6;
  }
  v10 = [_CPUIImageRowCellImageTitleItem alloc];
  v24 = -[_CPUIImageRowCellImageTitleItem initWithFrame:](v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_CPUIImageRowCellImageTitleItem setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_CPUIImageRowCellImageTitleItem button](v24, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_gridCellItemTapped_, 0x2000);

  objc_msgSend(*(id *)(a1 + 32), "reusableMediaViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v24);

  objc_msgSend(*(id *)(a1 + 32), "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addArrangedSubview:", v24);

  v9 = v24;
LABEL_6:
  v25 = v9;
  -[_CPUIImageRowCellImageTitleItem button](v9, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTag:", a3);

  objc_msgSend(*(id *)(a1 + 32), "imageTitles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") <= a3)
  {
    v17 = &stru_24DF24E68;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageTitles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v18 = *(double *)(a1 + 40);
  v19 = objc_msgSend(*(id *)(a1 + 32), "_showsImageTitles");
  v20 = 32.0;
  if (!v19)
    v20 = 0.0;
  -[_CPUIImageRowCellImageTitleItem setPreferredSize:](v25, "setPreferredSize:", v18, v18 + v20);
  v21 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fallbackImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIImageRowCellImageTitleItem configureWithArtwork:title:imageSize:fallbackImage:](v25, "configureWithArtwork:title:imageSize:fallbackImage:", v6, v17, v22, v21);

}

- (void)gridCellItemTapped:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v9;
    -[CPUIImageRowCell selectGridItemBlock](self, "selectGridItemBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CPUIImageRowCell selectGridItemBlock](self, "selectGridItemBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, objc_msgSend(v6, "tag"));

    }
    v5 = v9;
  }

}

- (void)coreCellItemTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CPUIImageRowCell selectTitleBlock](self, "selectTitleBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CPUIImageRowCell selectTitleBlock](self, "selectTitleBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_removeArtworkTitleItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearArtworkCatalogs");

  -[CPUIImageRowCell stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v7);

  -[CPUIImageRowCell reusableMediaViews](self, "reusableMediaViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  objc_msgSend(v7, "removeFromSuperview");
}

- (NSMutableArray)reusableMediaViews
{
  return *(NSMutableArray **)&self->_lastKnownBoundingSize.height;
}

- (void)setReusableMediaViews:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownBoundingSize.height, a3);
}

- (NSArray)artworkCatalogs
{
  return &self->_reusableMediaViews->super;
}

- (void)setArtworkCatalogs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSArray)imageTitles
{
  return self->_artworkCatalogs;
}

- (void)setImageTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (_CPUIImageRowHighlightButton)focusIndicator
{
  return (_CPUIImageRowHighlightButton *)self->_imageTitles;
}

- (void)setFocusIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_imageTitles, a3);
}

- (UIImageView)chevronView
{
  return (UIImageView *)self->_focusIndicator;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_focusIndicator, a3);
}

- (UIImage)fallbackImage
{
  return (UIImage *)self->_chevronView;
}

- (void)setFallbackImage:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)self->_fallbackImage;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackImage, a3);
}

- (id)selectGridItemBlock
{
  return self->_activityIndicator;
}

- (void)setSelectGridItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (id)selectTitleBlock
{
  return self->_selectGridItemBlock;
}

- (void)setSelectTitleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (UIStackView)stackView
{
  return (UIStackView *)self->_selectTitleBlock;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong(&self->_selectTitleBlock, a3);
}

- (NSLayoutConstraint)stackViewWidthConstraint
{
  return (NSLayoutConstraint *)self->_stackView;
}

- (void)setStackViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewHeightConstraint
{
  return self->_stackViewWidthConstraint;
}

- (void)setStackViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, a3);
}

- (UIView)trailingView
{
  return (UIView *)self->_stackViewHeightConstraint;
}

- (UILabel)titleLabel
{
  return (UILabel *)self->_trailingView;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_selectTitleBlock, 0);
  objc_storeStrong(&self->_selectGridItemBlock, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_reusableMediaViews, 0);
  objc_storeStrong((id *)&self->_lastKnownBoundingSize.height, 0);
}

@end
