@implementation SUUIBrickCollectionViewCell

- (SUUICountdown)countdown
{
  return -[SUUICountdownView countdown](self->_countdownView, "countdown");
}

- (UIImage)itemImage
{
  return -[UIImageView image](self->_itemImageView, "image");
}

- (void)setAccessibilityLabel:(id)a3
{
  NSString *v4;
  NSString *accessibilityLabel;

  if (self->_accessibilityLabel != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v4;

    -[UIImageView setAccessibilityLabel:](self->_itemImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
  }
}

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
  if (v4 != titleColor)
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
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](titleLabel, "setTextColor:", v9);

      }
      v4 = obj;
    }
  }

}

- (void)setCountdown:(id)a3
{
  id v4;
  SUUICountdownView *countdownView;
  SUUICountdownView *v6;
  SUUICountdownView *v7;
  id v8;

  v8 = a3;
  -[SUUICountdownView countdown](self->_countdownView, "countdown");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v8)
  {
    -[SUUICountdownView removeFromSuperview](self->_countdownView, "removeFromSuperview");
    countdownView = self->_countdownView;
    self->_countdownView = 0;

    if (v8)
    {
      v6 = -[SUUICountdownView initWithCountdown:clientContext:]([SUUICountdownView alloc], "initWithCountdown:clientContext:", v8, self->_clientContext);
      v7 = self->_countdownView;
      self->_countdownView = v6;

      -[SUUICountdownView sizeToFit](self->_countdownView, "sizeToFit");
      -[SUUIBrickCollectionViewCell addSubview:](self, "addSubview:", self->_countdownView);
      -[SUUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIBrickCollectionViewCell;
  -[SUUIBrickCollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUIBrickCollectionViewCell _reloadHighlight](self, "_reloadHighlight");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIBrickCollectionViewCell;
  -[SUUIBrickCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUIBrickCollectionViewCell _reloadHighlight](self, "_reloadHighlight");
}

- (void)setItemImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *itemImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  v13 = a3;
  -[UIImageView image](self->_itemImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 != v13)
  {
    itemImageView = self->_itemImageView;
    if (v13)
    {
      if (!itemImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_itemImageView;
        self->_itemImageView = v7;

        -[UIImageView setAccessibilityLabel:](self->_itemImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
        v9 = self->_itemImageView;
        -[SUUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[UIImageView setHidden:](self->_itemImageView, "setHidden:", -[SUUIBrickCollectionViewCell isItemImageHidden](self, "isItemImageHidden"));
        -[SUUIBrickCollectionViewCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", self->_itemImageView);

        itemImageView = self->_itemImageView;
      }
      -[UIImageView setImage:](itemImageView, "setImage:");
      -[UIImageView sizeToFit](self->_itemImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](itemImageView, "removeFromSuperview");
      v12 = self->_itemImageView;
      self->_itemImageView = 0;

    }
    -[SUUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (void)setItemImageHidden:(BOOL)a3
{
  if (self->_itemImageHidden != a3)
  {
    self->_itemImageHidden = a3;
    -[UIImageView setHidden:](self->_itemImageView, "setHidden:");
  }
}

- (void)setItemImageInsets:(UIEdgeInsets)a3
{
  if (self->_itemImageInsets.left != a3.left
    || self->_itemImageInsets.top != a3.top
    || self->_itemImageInsets.right != a3.right
    || self->_itemImageInsets.bottom != a3.bottom)
  {
    self->_itemImageInsets = a3;
    -[SUUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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
  id v15;

  v15 = a3;
  -[SUUIBrickCollectionViewCell title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v14);

        }
        -[SUUIBrickCollectionViewCell addSubview:](self, "addSubview:", self->_titleLabel);
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
    -[SUUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *itemImageView;
  id v5;
  objc_super v6;

  itemImageView = self->_itemImageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](itemImageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIBrickCollectionViewCell;
  -[SUUIBrickCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double left;
  double top;
  UILabel *titleLabel;
  double v10;
  double v11;
  SUUICountdownView *countdownView;
  CGRect v13;

  -[UIImageView frame](self->_itemImageView, "frame");
  v4 = v3;
  v6 = v5;
  top = self->_itemImageInsets.top;
  left = self->_itemImageInsets.left;
  -[UIImageView setFrame:](self->_itemImageView, "setFrame:", left, top);
  -[UIImageView setFrame:](self->_overlayImageView, "setFrame:", left, top, v4, v6);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v11 = v10;
    v13.origin.x = left;
    v13.origin.y = top;
    v13.size.width = v4;
    v13.size.height = v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", left, CGRectGetMaxY(v13) + 6.0, v4, v11);
  }
  countdownView = self->_countdownView;
  if (countdownView)
    -[SUUICountdownView setFrame:](countdownView, "setFrame:", left, top, v4, v6);
}

- (void)_reloadHighlight
{
  UIImageView *v3;
  UIImageView *overlayImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  UIImageView *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  if ((-[SUUIBrickCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SUUIBrickCollectionViewCell isSelected](self, "isSelected"))
  {
    if (!self->_overlayImageView)
    {
      v3 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      overlayImageView = self->_overlayImageView;
      self->_overlayImageView = v3;

      v5 = self->_overlayImageView;
      -[SUUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v5, "setBackgroundColor:", v6);

      -[SUUIBrickCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_overlayImageView);

      -[SUUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    -[SUUICountdownView backgroundImage](self->_countdownView, "backgroundImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[UIImageView image](self->_itemImageView, "image");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v10;

    v11 = self->_overlayImageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_flatImageWithColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v11, "setImage:", v13);

    -[UIImageView setAlpha:](self->_overlayImageView, "setAlpha:", 0.3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__SUUIBrickCollectionViewCell__reloadHighlight__block_invoke;
    v15[3] = &unk_2511F47C0;
    v15[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v15);
    -[UIImageView setAlpha:](self->_overlayImageView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

uint64_t __47__SUUIBrickCollectionViewCell__reloadHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeOverlay");
}

- (void)_removeOverlay
{
  double v3;
  UIImageView *overlayImageView;

  -[UIImageView alpha](self->_overlayImageView, "alpha");
  if (v3 == 0.0)
  {
    -[UIImageView removeFromSuperview](self->_overlayImageView, "removeFromSuperview");
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = 0;

  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)isItemImageHidden
{
  return self->_itemImageHidden;
}

- (UIEdgeInsets)itemImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_itemImageInsets.top;
  left = self->_itemImageInsets.left;
  bottom = self->_itemImageInsets.bottom;
  right = self->_itemImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)itemImageView
{
  return &self->_itemImageView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
