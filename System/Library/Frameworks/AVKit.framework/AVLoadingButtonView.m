@implementation AVLoadingButtonView

- (AVLoadingButtonView)initWithTitle:(id)a3
{
  id v4;
  AVLoadingButtonView *v5;
  AVLoadingButtonView *v6;
  uint64_t v7;
  UIActivityIndicatorView *loadingIndicator;
  UIActivityIndicatorView *v9;
  void *v10;
  uint64_t v11;
  AVButton *button;
  void *v13;
  void *v14;
  AVLayoutItemAttributes *v15;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v17;
  AVLayoutItemAttributes *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVLoadingButtonView;
  v5 = -[AVLoadingButtonView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[AVLoadingButtonView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    loadingIndicator = v6->_loadingIndicator;
    v6->_loadingIndicator = (UIActivityIndicatorView *)v7;

    v9 = v6->_loadingIndicator;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v9, "setColor:", v10);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", v4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    button = v6->_button;
    v6->_button = (AVButton *)v11;

    -[AVButton setAccessibilityLabel:](v6->_button, "setAccessibilityLabel:", v4);
    -[AVButton setTitle:forState:](v6->_button, "setTitle:forState:", v4, 0);
    -[AVButton titleLabel](v6->_button, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    v6->_included = 1;
    v6->_showsLoadingIndicator = 0;
    v15 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v6->_layoutAttributes;
    v6->_layoutAttributes = v15;

    v17 = v6->_layoutAttributes;
    -[AVLoadingButtonView intrinsicContentSize](v6, "intrinsicContentSize");
    -[AVLayoutItemAttributes setMinimumSize:](v17, "setMinimumSize:");
    -[AVLayoutItemAttributes setCollapsed:](v6->_layoutAttributes, "setCollapsed:", -[AVLoadingButtonView isCollapsed](v6, "isCollapsed"));
    -[AVLayoutItemAttributes setIncluded:](v6->_layoutAttributes, "setIncluded:", -[AVLoadingButtonView isIncluded](v6, "isIncluded"));
    -[AVLayoutItemAttributes setHasFlexibleContentSize:](v6->_layoutAttributes, "setHasFlexibleContentSize:", 0);
    v18 = v6->_layoutAttributes;
    -[AVButton accessibilityIdentifier](v6->_button, "accessibilityIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutItemAttributes setAccessibilityIdentifier:](v18, "setAccessibilityIdentifier:", v19);

    -[AVLoadingButtonView addSubview:](v6, "addSubview:", v6->_loadingIndicator);
    -[AVLoadingButtonView addSubview:](v6, "addSubview:", v6->_button);
  }

  return v6;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_showsLoadingIndicator != a3)
  {
    v3 = a3;
    self->_showsLoadingIndicator = a3;
    -[AVLoadingButtonView button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setHidden:", 1);

      -[AVLoadingButtonView loadingIndicator](self, "loadingIndicator");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startAnimating");
    }
    else
    {
      objc_msgSend(v5, "setHidden:", 0);

      -[AVLoadingButtonView loadingIndicator](self, "loadingIndicator");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopAnimating");
    }

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVLoadingButtonView;
  -[AVLoadingButtonView layoutSubviews](&v17, sel_layoutSubviews);
  -[AVLoadingButtonView center](self, "center");
  v4 = v3;
  v6 = v5;
  -[AVLoadingButtonView loadingIndicator](self, "loadingIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  -[AVLoadingButtonView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVLoadingButtonView button](self, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVLoadingButtonView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[AVLoadingButtonView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtrinsicContentSize:", width, height);

  -[AVLoadingButtonView _updateLayoutItem](self, "_updateLayoutItem");
}

- (CGSize)extrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVLoadingButtonView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVLoadingButtonView isCollapsed](self, "isCollapsed")
      || !-[AVLoadingButtonView isIncluded](self, "isIncluded")
      || -[AVLoadingButtonView isRemoved](self, "isRemoved");
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVLoadingButtonView _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[AVLoadingButtonView _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVLoadingButtonView _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hasFullScreenAppearance != a3)
  {
    v3 = a3;
    self->_hasFullScreenAppearance = a3;
    -[AVLoadingButtonView button](self, "button");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasFullScreenAppearance:", v3);

  }
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hasAlternateAppearance != a3)
  {
    v3 = a3;
    self->_hasAlternateAppearance = a3;
    -[AVLoadingButtonView button](self, "button");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasAlternateAppearance:", v3);

  }
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVLoadingButtonView layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVLoadingButtonView setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AVLoadingButtonView layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLoadingButtonView intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVLoadingButtonView layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVLoadingButtonView isIncluded](self, "isIncluded"))
    v5 = -[AVLoadingButtonView isRemoved](self, "isRemoved") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  -[AVLoadingButtonView layoutAttributes](self, "layoutAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollapsed:", -[AVLoadingButtonView isCollapsed](self, "isCollapsed"));

}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (AVButton)button
{
  return self->_button;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end
