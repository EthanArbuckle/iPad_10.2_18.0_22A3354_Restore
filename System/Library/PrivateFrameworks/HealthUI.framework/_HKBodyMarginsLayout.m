@implementation _HKBodyMarginsLayout

- (_HKBodyMarginsLayout)init
{
  _HKBodyMarginsLayout *v2;
  _HKBodyMarginsLayout *v3;
  UIView *leftMarginView;
  UIView *bodyView;
  UIView *rightMarginView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKBodyMarginsLayout;
  v2 = -[_HKBodyMarginsLayout initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    leftMarginView = v2->_leftMarginView;
    v2->_leftMarginView = 0;

    bodyView = v3->_bodyView;
    v3->_bodyView = 0;

    rightMarginView = v3->_rightMarginView;
    v3->_rightMarginView = 0;

  }
  return v3;
}

- (void)setLeftMarginView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIView isEqual:](self->_leftMarginView, "isEqual:") & 1) == 0)
  {
    -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeStrong((id *)&self->_leftMarginView, a3);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_HKBodyMarginsLayout addSubview:](self, "addSubview:", v6);
    -[_HKBodyMarginsLayout _invalidateLayout](self, "_invalidateLayout");
  }

}

- (void)setBodyView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIView isEqual:](self->_bodyView, "isEqual:") & 1) == 0)
  {
    -[_HKBodyMarginsLayout bodyView](self, "bodyView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeStrong((id *)&self->_bodyView, a3);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_HKBodyMarginsLayout addSubview:](self, "addSubview:", v6);
    -[_HKBodyMarginsLayout _invalidateLayout](self, "_invalidateLayout");
  }

}

- (void)setRightMarginView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIView isEqual:](self->_rightMarginView, "isEqual:") & 1) == 0)
  {
    -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeStrong((id *)&self->_rightMarginView, a3);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_HKBodyMarginsLayout addSubview:](self, "addSubview:", v6);
    -[_HKBodyMarginsLayout _invalidateLayout](self, "_invalidateLayout");
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

  -[_HKBodyMarginsLayout _totalViewWidth](self, "_totalViewWidth");
  v4 = v3;
  -[_HKBodyMarginsLayout _maximumViewHeight](self, "_maximumViewHeight");
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  double v28;
  double v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_HKBodyMarginsLayout;
  -[_HKBodyMarginsLayout layoutSubviews](&v31, sel_layoutSubviews);
  -[_HKBodyMarginsLayout bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (v7)
  {
    v9 = (void *)v7;
    -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHidden");

    if ((v11 & 1) == 0)
    {
      -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v4, v6);
      v8 = v13;

      -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", 0.0, 0.0, v8, v6);

    }
  }
  -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15
    && (v16 = (void *)v15,
        -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isHidden"),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "systemLayoutSizeFittingSize:", v4, v6);
    v22 = v21;

    v19 = v4 - v22;
    -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v4 - v22, 0.0, v22, v6);

  }
  else
  {
    v19 = v4;
  }
  -[_HKBodyMarginsLayout bodyView](self, "bodyView");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_HKBodyMarginsLayout bodyView](self, "bodyView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isHidden");

    if ((v27 & 1) == 0)
    {
      if (v8 > 0.0)
        v8 = v8 + 16.0;
      v28 = v19 + -16.0;
      if (v19 >= v4)
        v28 = v19;
      v29 = v28 - v8;
      -[_HKBodyMarginsLayout bodyView](self, "bodyView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", v8, 0.0, v29, v6);

    }
  }
}

- (void)_invalidateLayout
{
  -[_HKBodyMarginsLayout invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[_HKBodyMarginsLayout setNeedsLayout](self, "setNeedsLayout");
}

- (double)_maximumViewHeight
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
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  double v25;
  double v26;
  double result;

  -[_HKBodyMarginsLayout bounds](self, "bounds");
  v4 = v3;
  -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5)
  {
    v7 = (void *)v5;
    -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHidden");

    if ((v9 & 1) == 0)
    {
      -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      v12 = v11;

      v6 = fmax(v12, 0.0);
    }
  }
  -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isHidden");

    if ((v16 & 1) == 0)
    {
      -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      v19 = v18;

      if (v6 < v19)
        v6 = v19;
    }
  }
  -[_HKBodyMarginsLayout bodyView](self, "bodyView");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_HKBodyMarginsLayout bodyView](self, "bodyView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isHidden");

    if ((v23 & 1) == 0)
    {
      -[_HKBodyMarginsLayout bodyView](self, "bodyView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      v26 = v25;

      if (v6 < v26)
        v6 = v26;
    }
  }
  result = 1.0;
  if (v6 >= 1.0)
    return v6;
  return result;
}

- (double)_totalViewWidth
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  double v26;
  double v27;
  double result;

  -[_HKBodyMarginsLayout bounds](self, "bounds");
  v4 = v3;
  -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5
    && (v7 = (void *)v5,
        -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isHidden"),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    -[_HKBodyMarginsLayout leftMarginView](self, "leftMarginView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    v13 = v12;

    v6 = v13 + 0.0;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isHidden");

    if ((v17 & 1) == 0)
    {
      -[_HKBodyMarginsLayout rightMarginView](self, "rightMarginView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      v20 = v19;

      v6 = v6 + v20;
      ++v10;
    }
  }
  -[_HKBodyMarginsLayout bodyView](self, "bodyView");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_HKBodyMarginsLayout bodyView](self, "bodyView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isHidden");

    if ((v24 & 1) == 0)
    {
      -[_HKBodyMarginsLayout bodyView](self, "bodyView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      v27 = v26;

      v6 = v6 + v27;
      ++v10;
    }
  }
  result = v6 + (double)(v10 - 1) * 16.0;
  if (result < 1.0)
    return 1.0;
  return result;
}

- (UIView)leftMarginView
{
  return self->_leftMarginView;
}

- (UIView)bodyView
{
  return self->_bodyView;
}

- (UIView)rightMarginView
{
  return self->_rightMarginView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightMarginView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_leftMarginView, 0);
}

@end
