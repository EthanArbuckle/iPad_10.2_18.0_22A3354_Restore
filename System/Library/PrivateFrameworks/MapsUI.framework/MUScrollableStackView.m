@implementation MUScrollableStackView

- (MUScrollableStackView)initWithFrame:(CGRect)a3
{
  MUScrollableStackView *v3;
  MUScrollableStackView *v4;
  objc_class *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUScrollableStackView;
  v3 = -[MUScrollableStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUScrollableStackView _setupViews](v3, "_setupViews");
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUScrollableStackView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v6);

  }
  return v4;
}

- (void)_setupViews
{
  MUStackView *v3;
  MUStackView *v4;
  MUStackView *stackView;
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = [MUStackView alloc];
  v4 = -[MUStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  -[MUStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUScrollableStackView addSubview:](self, "addSubview:", self->_stackView);
  -[MUScrollableStackView setScrollEnabled:](self, "setScrollEnabled:", 1);
  -[MUScrollableStackView setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", 0);
  -[MUScrollableStackView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[MUStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableStackView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  -[MUStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableStackView trailingAnchor](self, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  -[MUStackView topAnchor](self->_stackView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableStackView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  -[MUStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableStackView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

  -[MUScrollableStackView _updateOrientationWithNewAxis:](self, "_updateOrientationWithNewAxis:", 1);
}

- (int64_t)axis
{
  return -[MUStackView axis](self->_stackView, "axis");
}

- (void)setDistribution:(int64_t)a3
{
  -[MUStackView setDistribution:](self->_stackView, "setDistribution:", a3);
}

- (int64_t)distribution
{
  return -[MUStackView distribution](self->_stackView, "distribution");
}

- (void)setAlignment:(int64_t)a3
{
  -[MUStackView setAlignment:](self->_stackView, "setAlignment:", a3);
}

- (int64_t)alignment
{
  return -[MUStackView alignment](self->_stackView, "alignment");
}

- (NSArray)arrangedSubviews
{
  return -[MUStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
}

- (void)addArrangedSubview:(id)a3
{
  -[MUStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", a3);
}

- (void)removeArrangedSubview:(id)a3
{
  -[MUStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", a3);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  -[MUStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", a3, a4);
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
  -[MUStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", a4, a3);
}

- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4
{
  -[MUStackView addArrangedSubview:withCustomSpacing:](self->_stackView, "addArrangedSubview:withCustomSpacing:", a3, a4);
}

- (void)_updateOrientationWithNewAxis:(int64_t)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *axisConstraint;

  -[MUStackView setAxis:](self->_stackView, "setAxis:", a3);
  -[NSLayoutConstraint setActive:](self->_axisConstraint, "setActive:", 0);
  v4 = -[MUScrollableStackView axis](self, "axis");
  if (v4 == 1)
  {
    -[MUStackView widthAnchor](self->_stackView, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUScrollableStackView widthAnchor](self, "widthAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    -[MUStackView heightAnchor](self->_stackView, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUScrollableStackView heightAnchor](self, "heightAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    axisConstraint = self->_axisConstraint;
    self->_axisConstraint = v8;

  }
  -[NSLayoutConstraint setActive:](self->_axisConstraint, "setActive:", 1);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[MUStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[MUStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUScrollableStackView;
  -[MUScrollableStackView layoutSubviews](&v3, sel_layoutSubviews);
  if (!-[MUScrollableStackView axis](self, "axis"))
    -[MUScrollableStackView _updateForHorizontalAxisIfNeeded](self, "_updateForHorizontalAxisIfNeeded");
}

- (void)_updateForHorizontalAxisIfNeeded
{
  double v3;
  double v4;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  CGRect v10;

  if (!-[MUScrollableStackView axis](self, "axis"))
  {
    -[MUScrollableStackView contentSize](self, "contentSize");
    if (self->_cachedContentSize.width != v4 || self->_cachedContentSize.height != v3)
    {
      -[MUScrollableStackView contentSize](self, "contentSize");
      self->_cachedContentSize.width = v6;
      self->_cachedContentSize.height = v7;
      if (-[UIView _mapsui_isRTL](self, "_mapsui_isRTL"))
      {
        -[MUScrollableStackView contentSize](self, "contentSize");
        v9 = v8;
        -[MUScrollableStackView frame](self, "frame");
        -[MUScrollableStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v9 - CGRectGetWidth(v10), 0.0);
      }
    }
  }
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;
  CGRect v7;

  height = a3.height;
  width = a3.width;
  if (!-[MUScrollableStackView axis](self, "axis"))
  {
    -[MUScrollableStackView frame](self, "frame");
    height = CGRectGetHeight(v7);
  }
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableStackView;
  -[MUScrollableStackView setContentSize:](&v6, sel_setContentSize_, width, height);
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  -[MUStackView setContentEdgeInsets:](self->_stackView, "setContentEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UIEdgeInsets)contentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[MUStackView contentEdgeInsets](self->_stackView, "contentEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setArrangedSubviews:(id)a3
{
  -[MUStackView setArrangedSubviews:](self->_stackView, "setArrangedSubviews:", a3);
}

- (void)setSpacing:(double)a3
{
  -[MUStackView setSpacing:](self->_stackView, "setSpacing:", a3);
}

- (double)spacing
{
  double result;

  -[MUStackView spacing](self->_stackView, "spacing");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (id)addArrangedCardShadowViewForView:(id)a3
{
  id v4;
  MUPlatterView *v5;

  v4 = a3;
  v5 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", v4);

  -[MUScrollableStackView addArrangedSubview:](self, "addArrangedSubview:", v5);
  return v5;
}

@end
