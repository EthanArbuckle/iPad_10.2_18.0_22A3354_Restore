@implementation _HKDateContentLayout

- (_HKDateContentLayout)init
{
  _HKDateContentLayout *v2;
  _HKDateContentLayout *v3;
  UIView *contentView;
  UIView *dateView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKDateContentLayout;
  v2 = -[_HKDateContentLayout initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    contentView = v2->_contentView;
    v2->_contentView = 0;

    dateView = v3->_dateView;
    v3->_dateView = 0;

  }
  return v3;
}

- (void)setContentView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIView isEqual:](self->_contentView, "isEqual:") & 1) == 0)
  {
    -[_HKDateContentLayout contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeStrong((id *)&self->_contentView, a3);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_HKDateContentLayout addSubview:](self, "addSubview:", v6);
    -[_HKDateContentLayout _invalidateLayout](self, "_invalidateLayout");
  }

}

- (void)setDateView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIView isEqual:](self->_dateView, "isEqual:") & 1) == 0)
  {
    -[_HKDateContentLayout dateView](self, "dateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeStrong((id *)&self->_dateView, a3);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_HKDateContentLayout addSubview:](self, "addSubview:", v6);
    -[_HKDateContentLayout _invalidateLayout](self, "_invalidateLayout");
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[_HKDateContentLayout _maximumViewWidth](self, "_maximumViewWidth");
  v4 = v3;
  -[_HKDateContentLayout _totalViewHeight](self, "_totalViewHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_HKDateContentLayout;
  -[_HKDateContentLayout layoutSubviews](&v25, sel_layoutSubviews);
  -[_HKDateContentLayout bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_HKDateContentLayout dateView](self, "dateView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v7)
  {
    v9 = (void *)v7;
    -[_HKDateContentLayout dateView](self, "dateView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHidden");

    v8 = v6;
    if ((v11 & 1) == 0)
    {
      -[_HKDateContentLayout dateView](self, "dateView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v4, v6);
      v14 = v13;

      v8 = v6 - v14;
      -[_HKDateContentLayout dateView](self, "dateView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", 0.0, v6 - v14, v4, v14);

    }
  }
  -[_HKDateContentLayout contentView](self, "contentView");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_HKDateContentLayout contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isHidden");

    if ((v19 & 1) == 0)
    {
      -[_HKDateContentLayout contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "systemLayoutSizeFittingSize:", v4, v6);
      v22 = v21;

      if (v8 - v22 >= 0.0)
        v23 = v8 - v22;
      else
        v23 = 0.0;
      -[_HKDateContentLayout contentView](self, "contentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFrame:", 0.0, v23, v4, v8 - v23);

    }
  }
}

- (void)_invalidateLayout
{
  -[_HKDateContentLayout invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[_HKDateContentLayout setNeedsLayout](self, "setNeedsLayout");
}

- (double)_maximumViewWidth
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double result;

  -[_HKDateContentLayout bounds](self, "bounds");
  v4 = v3;
  -[_HKDateContentLayout dateView](self, "dateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_HKDateContentLayout dateView](self, "dateView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    v8 = v7;

    v9 = fmax(v8, 0.0);
  }
  else
  {
    v9 = 0.0;
  }
  -[_HKDateContentLayout contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_HKDateContentLayout contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    v13 = v12;

    if (v9 < v13)
      v9 = v13;
  }
  result = 1.0;
  if (v9 >= 1.0)
    return v9;
  return result;
}

- (double)_totalViewHeight
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double result;

  -[_HKDateContentLayout bounds](self, "bounds");
  v4 = v3;
  -[_HKDateContentLayout dateView](self, "dateView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5)
  {
    v7 = (void *)v5;
    -[_HKDateContentLayout dateView](self, "dateView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHidden");

    if ((v9 & 1) == 0)
    {
      -[_HKDateContentLayout dateView](self, "dateView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", v4, 1.79769313e308);
      v12 = v11;

      v6 = v12 + 0.0;
    }
  }
  -[_HKDateContentLayout contentView](self, "contentView");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_HKDateContentLayout contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isHidden");

    if ((v16 & 1) == 0)
    {
      -[_HKDateContentLayout contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "systemLayoutSizeFittingSize:", v4, 1.79769313e308);
      v19 = v18;

      v6 = v6 + v19;
    }
  }
  result = 1.0;
  if (v6 >= 1.0)
    return v6;
  return result;
}

- (int64_t)_viewCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[_HKDateContentLayout dateView](self, "dateView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_HKDateContentLayout dateView](self, "dateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden") ^ 1;

  }
  else
  {
    v6 = 0;
  }
  -[_HKDateContentLayout contentView](self, "contentView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_HKDateContentLayout contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden") ^ 1;

    v6 += v10;
  }
  return v6;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)dateView
{
  return self->_dateView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
