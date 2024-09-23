@implementation SFUnifiedBarButtonView

- (SFUnifiedBarButtonView)initWithFrame:(CGRect)a3
{
  SFUnifiedBarButtonView *v3;
  SFUnifiedBarButtonView *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *imageViewLeadingConstraint;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFUnifiedBarButtonView *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SFUnifiedBarButtonView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v3, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_imageView, "setPreferredSymbolConfiguration:", v7);

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFUnifiedBarItemView contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_imageView);
    -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    imageViewLeadingConstraint = v4->_imageViewLeadingConstraint;
    v4->_imageViewLeadingConstraint = (NSLayoutConstraint *)v11;

    v24 = (void *)MEMORY[0x1E0CB3718];
    v31[0] = v4->_imageViewLeadingConstraint;
    -[UIImageView topAnchor](v4->_imageView, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    objc_msgSend(v8, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v16;
    objc_msgSend(v8, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[SFUnifiedBarButtonView addInteraction:](v4, "addInteraction:", v21);
    objc_initWeak(&location, v4);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __40__SFUnifiedBarButtonView_initWithFrame___block_invoke;
    v27[3] = &unk_1E21E4140;
    objc_copyWeak(&v28, &location);
    -[SFUnifiedBarButtonView setPointerStyleProvider:](v4, "setPointerStyleProvider:", v27);
    -[SFUnifiedBarButtonView updateTitleFont](v4, "updateTitleFont");
    v22 = v4;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v4;
}

id __40__SFUnifiedBarButtonView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = objc_msgSend(WeakRetained, "platterStyle");

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v7);
    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3B30], "sf_shapeForToolbarButton:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSComparisonResult v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFUnifiedBarButtonView;
  v4 = a3;
  -[SFUnifiedBarButtonView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _SFToolbarContentSizeCategoryForPreferredCategory(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedBarButtonView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SFToolbarContentSizeCategoryForPreferredCategory(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedBarButtonView _titleView](self, "_titleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v12 = UIContentSizeCategoryCompareToCategory(v6, v9);

    if (v12)
      -[SFUnifiedBarButtonView updateTitleFont](self, "updateTitleFont");
  }
  else
  {

  }
}

- (void)updateTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC3E88];
  -[SFUnifiedBarButtonView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFToolbarContentSizeCategoryForPreferredCategory(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedBarButtonView _titleView](self, "_titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:weight:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B10], v9, *MEMORY[0x1E0DC1420]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  objc_msgSend(v7, "setLineBreakMode:", 4);
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SFUnifiedBarButtonView isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFUnifiedBarButtonView;
    -[SFUnifiedBarButtonView setEnabled:](&v5, sel_setEnabled_, v3);
    -[SFUnifiedBarButtonView tintColorDidChange](self, "tintColorDidChange");
  }
}

- (BOOL)shouldTrailingAlignImage
{
  return !-[NSLayoutConstraint isActive](self->_imageViewLeadingConstraint, "isActive");
}

- (void)setShouldTrailingAlignImage:(BOOL)a3
{
  -[NSLayoutConstraint setActive:](self->_imageViewLeadingConstraint, "setActive:", !a3);
}

- (void)tintColorDidChange
{
  id v3;

  if ((-[SFUnifiedBarButtonView isEnabled](self, "isEnabled") & 1) != 0)
    -[SFUnifiedBarButtonView tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v3);
  -[SFUnifiedBarButtonView setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

}

- (double)preferredWidth
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
    return v4;
  }
  -[SFUnifiedBarButtonView titleForState:](self, "titleForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[SFUnifiedBarButtonView attributedTitleForState:](self, "attributedTitleForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0.0;
  }
  -[SFUnifiedBarButtonView bounds](self, "bounds");
  v7 = 200.0;
  -[SFUnifiedBarButtonView sizeThatFits:](self, "sizeThatFits:", 200.0, v8);
  if (v9 < 200.0)
  {
    -[SFUnifiedBarButtonView bounds](self, "bounds");
    -[SFUnifiedBarButtonView sizeThatFits:](self, "sizeThatFits:", 200.0, v10);
    return v4;
  }
  return v7;
}

- (CGRect)_selectedIndicatorBounds
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[SFUnifiedBarButtonView _titleView](self, "_titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SFUnifiedBarButtonView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v29 = CGRectInset(v28, 6.0, 0.0);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  else
  {
    -[SFUnifiedBarButtonView imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    x = v20;
    y = v21;
    width = v22;
    height = v23;

  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_hitRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[SFUnifiedBarButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimumItemSpacing");
  v13 = v12 * -0.5;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v23 = CGRectInset(v22, v13, 0.0);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SFUnifiedBarButtonView _hitRect](self, "_hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[SFUnifiedBarButtonView _hitRect](self, "_hitRect", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", CFSTR("UnifiedBarButton"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
