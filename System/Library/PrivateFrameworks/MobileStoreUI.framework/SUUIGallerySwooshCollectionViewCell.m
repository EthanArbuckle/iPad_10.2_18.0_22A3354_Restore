@implementation SUUIGallerySwooshCollectionViewCell

- (void)setColoringWithColorScheme:(id)a3
{
  UIColor *v4;
  UIColor **p_titleColor;
  UIColor *titleColor;
  char v7;
  UILabel *titleLabel;
  void *v9;
  UIColor *obj;

  objc_msgSend(a3, "primaryTextColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (titleColor != v4)
  {
    obj = v4;
    v7 = -[UIColor isEqual:](titleColor, "isEqual:", v4);
    v4 = obj;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleColor, obj);
      titleLabel = self->_titleLabel;
      if (*p_titleColor)
      {
        -[UILabel setTextColor:](titleLabel, "setTextColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.235294118, 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](titleLabel, "setTextColor:", v9);

      }
      v4 = obj;
    }
  }

}

- (void)setContentChildView:(id)a3
{
  UIView *v5;
  UIView **p_contentChildView;
  UIView *contentChildView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_contentChildView = &self->_contentChildView;
  contentChildView = self->_contentChildView;
  v9 = v5;
  if (contentChildView != v5)
  {
    if (-[UIView isDescendantOfView:](contentChildView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_contentChildView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentChildView, a3);
    -[SUUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = *p_contentChildView;
  }
  if (v5 && !-[UIView isDescendantOfView:](v5, "isDescendantOfView:", self))
  {
    -[SUUIGallerySwooshCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_contentChildView);
    -[SUUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUIGallerySwooshCollectionViewCell backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.235294118, 1.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v14);

        }
        -[SUUIGallerySwooshCollectionViewCell contentView](self, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", self->_titleLabel);

        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v13 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double MaxY;
  UILabel *titleLabel;
  double v14;
  CGFloat v15;
  CGFloat v16;
  UIView *contentChildView;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SUUIGallerySwooshCollectionViewCell;
  -[SUUIGallerySwooshCollectionViewCell layoutSubviews](&v19, sel_layoutSubviews);
  -[SUUIGallerySwooshCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  MaxY = CGRectGetMaxY(v20);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v15 = v14;
    v16 = MaxY - v14;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v16, v9);
    v21.origin.x = 0.0;
    v21.origin.y = v16;
    v21.size.width = v9;
    v21.size.height = v15;
    MaxY = CGRectGetMinY(v21) + -6.0;
  }
  contentChildView = self->_contentChildView;
  if (contentChildView)
  {
    -[UIView frame](contentChildView, "frame");
    -[UIView setFrame:](self->_contentChildView, "setFrame:", 0.0, MaxY - v18);
  }
}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_contentChildView, 0);
}

@end
