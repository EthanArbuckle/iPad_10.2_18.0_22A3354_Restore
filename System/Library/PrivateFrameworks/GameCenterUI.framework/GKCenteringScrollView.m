@implementation GKCenteringScrollView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCenteringScrollView;
  -[GKCenteringScrollView layoutSubviews](&v3, sel_layoutSubviews);
  -[GKCenteringScrollView centerContentViewIfDesirable](self, "centerContentViewIfDesirable");
}

- (void)centerContentViewIfDesirable
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  UIView *footerView;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MaxY;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat rect;
  CGRect v45;
  CGRect v46;

  if (self->_contentView)
  {
    -[GKCenteringScrollView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    rect = v7;
    v9 = v8;
    -[UIView frame](self->_contentView, "frame");
    v42 = v11;
    v43 = v10;
    v41 = v12;
    v14 = v13;
    -[GKCenteringScrollView contentInset](self, "contentInset");
    v16 = v15;
    v18 = v17;
    -[GKCenteringScrollView safeAreaInsets](self, "safeAreaInsets");
    v19 = v16 + v18;
    v20 = v9 - (v16 + v18);
    if (v20 > v14)
    {
      UIRectCenteredYInRect();
      -[UIView setFrame:](self->_contentView, "setFrame:");
    }
    v40 = v6;
    -[GKCenteringScrollView contentSize](self, "contentSize");
    v22 = v21;
    v24 = v23;
    -[GKCenteringScrollView contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;

    if (v22 > v27)
    {
      -[GKCenteringScrollView contentView](self, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      v30 = v29;

      -[GKCenteringScrollView setContentSize:](self, "setContentSize:", v30, v24);
    }
    footerView = self->_footerView;
    if (footerView)
    {
      -[UIView frame](footerView, "frame");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      if (v20 <= v14)
      {
        v46.origin.y = v42;
        v46.origin.x = v43;
        v46.size.width = v41;
        v46.size.height = v14;
        MaxY = CGRectGetMaxY(v46);
        v39 = v37;
      }
      else
      {
        v45.origin.x = v4;
        v45.origin.y = v40;
        v45.size.width = rect;
        v45.size.height = v9;
        MaxY = CGRectGetMaxY(v45);
        v39 = v19 + v37;
      }
      -[UIView setFrame:](self->_footerView, "setFrame:", v33, MaxY - (v39 + 8.0), v35, v37);
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
