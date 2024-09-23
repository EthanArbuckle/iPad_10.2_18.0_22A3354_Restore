@implementation SUUITrendingSearchView

- (SUUITrendingSearchView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SUUITrendingSearchView *v7;
  SUUITrendingSearchView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SUUITrendingSearchView;
  v7 = -[SUUITrendingSearchView initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7)
    -[SUUITrendingSearchView commonInitWithFrame:](v7, "commonInitWithFrame:", x, y, width, height);
  return v8;
}

- (SUUITrendingSearchView)initWithCoder:(id)a3
{
  SUUITrendingSearchView *v3;
  SUUITrendingSearchView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUITrendingSearchView;
  v3 = -[SUUITrendingSearchView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[SUUITrendingSearchView frame](v3, "frame");
    -[SUUITrendingSearchView commonInitWithFrame:](v4, "commonInitWithFrame:");
  }
  return v4;
}

- (void)commonInitWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *verticalMarginRelatedConstraints;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29[1] = *MEMORY[0x24BDAC8D0];
  -[SUUITrendingSearchView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD978]), "initWithFrame:", x, y, width, height);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAxis:", 1);
  objc_msgSend(v8, "setAlignment:", 3);
  objc_msgSend(v8, "setDistribution:", 3);
  objc_msgSend(v8, "setSpacing:", 18.0);
  objc_storeWeak((id *)&self->_titleStackView, v8);
  -[SUUITrendingSearchView addSubview:](self, "addSubview:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD978]), "initWithFrame:", x, y, width, height);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAxis:", 1);
  objc_msgSend(v9, "setAlignment:", 3);
  objc_msgSend(v9, "setDistribution:", 3);
  objc_msgSend(v9, "setSpacing:", 2.0);
  objc_msgSend(v8, "addArrangedSubview:", v9);
  objc_storeWeak((id *)&self->_trendingSearchesStackView, v9);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD1628];
    -[SUUITrendingSearchView titleStackView](self, "titleStackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, self, 10, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = 1144733696;
    objc_msgSend(v10, "setPriority:", v15);
    v29[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUITrendingSearchView addConstraints:](self, "addConstraints:", v16);

LABEL_4:
  }
  _NSDictionaryOfVariableBindings(CFSTR("titleStackView"), v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=TITLE_MINIMUM_ORIGIN_Y)-[titleStackView]"), 0, &unk_2512EEEF0, v17);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  verticalMarginRelatedConstraints = self->_verticalMarginRelatedConstraints;
  self->_verticalMarginRelatedConstraints = v18;

  -[SUUITrendingSearchView addConstraints:](self, "addConstraints:", self->_verticalMarginRelatedConstraints);
  objc_msgSend(v8, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchView leadingAnchor](self, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  objc_msgSend(v8, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchView trailingAnchor](self, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  objc_msgSend(v8, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchView widthAnchor](self, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

}

- (void)setTrendingTitleView:(id)a3
{
  UIView *v4;
  UIView *trendingTitleView;
  UIView *v6;
  double v7;
  id v8;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_trendingTitleView, "removeFromSuperview");
  trendingTitleView = self->_trendingTitleView;
  self->_trendingTitleView = v4;
  v6 = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_trendingTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_trendingTitleView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[SUUITrendingSearchView titleStackView](self, "titleStackView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertArrangedSubview:atIndex:", v6, 0);

}

- (void)setTrendingSearchViews:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *trendingSearchViews;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_trendingSearchViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  trendingSearchViews = self->_trendingSearchViews;
  self->_trendingSearchViews = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_trendingSearchViews;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
        -[SUUITrendingSearchView trendingSearchesStackView](self, "trendingSearchesStackView", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addArrangedSubview:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[SUUITrendingSearchView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double MaxY;
  double v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)SUUITrendingSearchView;
  -[SUUITrendingSearchView layoutSubviews](&v11, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != 1)
  {
LABEL_5:
    -[SUUITrendingSearchView bounds](self, "bounds");
    v7 = v6;
    -[SUUITrendingSearchView titleStackView](self, "titleStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    MaxY = CGRectGetMaxY(v12);
    -[SUUITrendingSearchView safeAreaInsets](self, "safeAreaInsets");
    -[SUUITrendingSearchView setContentSize:](self, "setContentSize:", v7, MaxY + v10);

  }
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUUITrendingSearchView verticalMarginRelatedConstraints](self, "verticalMarginRelatedConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SUUITrendingSearchView safeAreaInsets](self, "safeAreaInsets");
        objc_msgSend(v8, "setConstant:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUITrendingSearchView;
  -[SUUITrendingSearchView updateConstraints](&v9, sel_updateConstraints);
}

- (UIView)trendingTitleView
{
  return self->_trendingTitleView;
}

- (NSArray)trendingSearchViews
{
  return self->_trendingSearchViews;
}

- (UIStackView)trendingSearchesStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_trendingSearchesStackView);
}

- (void)setTrendingSearchesStackView:(id)a3
{
  objc_storeWeak((id *)&self->_trendingSearchesStackView, a3);
}

- (UIStackView)titleStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_titleStackView);
}

- (void)setTitleStackView:(id)a3
{
  objc_storeWeak((id *)&self->_titleStackView, a3);
}

- (NSArray)verticalMarginRelatedConstraints
{
  return self->_verticalMarginRelatedConstraints;
}

- (void)setVerticalMarginRelatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalMarginRelatedConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalMarginRelatedConstraints, 0);
  objc_destroyWeak((id *)&self->_titleStackView);
  objc_destroyWeak((id *)&self->_trendingSearchesStackView);
  objc_storeStrong((id *)&self->_trendingSearchViews, 0);
  objc_storeStrong((id *)&self->_trendingTitleView, 0);
}

@end
