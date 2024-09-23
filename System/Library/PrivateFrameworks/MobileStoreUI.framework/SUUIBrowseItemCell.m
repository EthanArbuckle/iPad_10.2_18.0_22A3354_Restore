@implementation SUUIBrowseItemCell

- (SUUIBrowseItemCell)initWithFrame:(CGRect)a3
{
  SUUIBrowseItemCell *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UIView *v14;
  UIView *borderView;
  UIView *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SUUIBrowseItemCell;
  v3 = -[SUUIBrowseItemCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[SUUIBrowseItemCell addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v8;

    v10 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 1);
    v12 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[SUUIBrowseItemCell addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v14 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    borderView = v3->_borderView;
    v3->_borderView = v14;

    v16 = v3->_borderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[SUUIBrowseItemCell addSubview:](v3, "addSubview:", v3->_borderView);
    -[SUUIBrowseItemCell setSemanticContentAttribute:](v3, "setSemanticContentAttribute:", storeSemanticContentAttribute());
  }
  return v3;
}

- (void)setDecorationImage:(id)a3
{
  UIImage **p_decorationImage;
  UIImageView *decorationImageView;
  UIImage *v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  id v11;

  p_decorationImage = &self->_decorationImage;
  v11 = a3;
  if (v11)
  {
    objc_storeStrong((id *)&self->_decorationImage, a3);
    decorationImageView = self->_decorationImageView;
    if (decorationImageView)
    {
      -[UIImageView setImage:](decorationImageView, "setImage:", *p_decorationImage);
    }
    else
    {
      v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", *p_decorationImage);
      v10 = self->_decorationImageView;
      self->_decorationImageView = v9;

      -[SUUIBrowseItemCell addSubview:](self, "addSubview:", self->_decorationImageView);
    }
  }
  else
  {
    v7 = *p_decorationImage;
    *p_decorationImage = 0;

    -[UIImageView removeFromSuperview](self->_decorationImageView, "removeFromSuperview");
    v8 = self->_decorationImageView;
    self->_decorationImageView = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[SUUIBrowseItemCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);
    -[SUUIBrowseItemCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setShowTopBorder:(BOOL)a3
{
  UIView *topBorderView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;

  self->_showTopBorder = a3;
  topBorderView = self->_topBorderView;
  if (a3)
  {
    if (!topBorderView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v6 = self->_topBorderView;
      self->_topBorderView = v5;

      v7 = self->_topBorderView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      -[SUUIBrowseItemCell addSubview:](self, "addSubview:", self->_topBorderView);
    }
  }
  else if (topBorderView)
  {
    -[UIView removeFromSuperview](topBorderView, "removeFromSuperview");
    v9 = self->_topBorderView;
    self->_topBorderView = 0;

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIBrowseItemCell;
  -[SUUIBrowseItemCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUIBrowseItemCell _reloadHighlightState](self, "_reloadHighlightState");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIBrowseItemCell;
  -[SUUIBrowseItemCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUIBrowseItemCell _reloadHighlightState](self, "_reloadHighlightState");
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  int ShouldReverseLayoutDirection;
  UIImageView *decorationImageView;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  CGFloat MaxY;
  void *v29;
  double v30;
  CGFloat v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32.receiver = self;
  v32.super_class = (Class)SUUIBrowseItemCell;
  -[SUUIBrowseItemCell layoutSubviews](&v32, sel_layoutSubviews);
  -[SUUIBrowseItemCell bounds](self, "bounds");
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v7 = CGRectGetMaxX(v33) + -15.0;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  decorationImageView = self->_decorationImageView;
  if (decorationImageView)
  {
    -[UIImageView frame](decorationImageView, "frame");
    v11 = v10;
    v13 = v12;
    v14 = v7 - v10;
    v15 = y + (height - v12) * 0.5;
    -[UIImageView setFrame:](self->_decorationImageView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v14, v15, v10, v12, x, y, width, height));
    v34.origin.x = v14;
    v34.origin.y = v15;
    v34.size.width = v11;
    v34.size.height = v13;
    v7 = CGRectGetMinX(v34) + -10.0;
  }
  if (ShouldReverseLayoutDirection)
    v16 = 2;
  else
    v16 = 0;
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[UILabel frame](self->_subtitleLabel, "frame");
  v18 = v17;
  v20 = v19;
  v21 = v7 - v17;
  v22 = y + (height - v19) * 0.5;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21, v22, v17, v19, x, y, width, height));
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v16);
  v35.origin.x = v21;
  v35.origin.y = v22;
  v35.size.width = v18;
  v35.size.height = v20;
  v23 = CGRectGetMinX(v35) + -10.0;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x + 15.0, y + (height - v24) * 0.5, v23 - x + -15.0, v24, x, y, width, height));
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v16);
  -[UIView frame](self->_borderView, "frame");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  v27 = 1.0 / v26;

  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MaxY = CGRectGetMaxY(v36);
  -[UIView setFrame:](self->_borderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, MaxY - v27, width + -15.0, v27, x, y, width, height));
  -[UIView frame](self->_topBorderView, "frame");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scale");
  v31 = 1.0 / v30;

  -[UIView setFrame:](self->_topBorderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 0.0, width + -15.0, v31, x, y, width, height));
}

- (void)_reloadHighlightState
{
  _BOOL4 hasBlueBackgroundWhenSelected;
  char v4;
  char v5;
  UILabel *titleLabel;
  void *v7;
  UILabel *subtitleLabel;
  void *v9;
  uint64_t v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UIView *borderView;
  uint64_t v18;
  UIView *topBorderView;
  uint64_t v20;

  hasBlueBackgroundWhenSelected = self->_hasBlueBackgroundWhenSelected;
  v4 = -[SUUIBrowseItemCell isHighlighted](self, "isHighlighted");
  v5 = v4;
  if (hasBlueBackgroundWhenSelected)
  {
    if ((v4 & 1) != 0 || -[SUUIBrowseItemCell isSelected](self, "isSelected"))
    {
      titleLabel = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v7);

      subtitleLabel = self->_subtitleLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](subtitleLabel, "setTextColor:", v9);

      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.298039216, 0.631372549, 1.0, 1.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v12 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v11 = (void *)MEMORY[0x24BEBD4B8];
  }
  else
  {
    v11 = (void *)MEMORY[0x24BEBD4B8];
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend(v11, "whiteColor");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v16 = (void *)v10;
  -[SUUIBrowseItemCell setBackgroundColor:](self, "setBackgroundColor:", v10);

  borderView = self->_borderView;
  if ((-[SUUIBrowseItemCell isHighlighted](self, "isHighlighted") & 1) != 0)
    v18 = 1;
  else
    v18 = -[SUUIBrowseItemCell isSelected](self, "isSelected");
  -[UIView setHidden:](borderView, "setHidden:", v18);
  topBorderView = self->_topBorderView;
  if ((-[SUUIBrowseItemCell isHighlighted](self, "isHighlighted") & 1) != 0)
    v20 = 1;
  else
    v20 = -[SUUIBrowseItemCell isSelected](self, "isSelected");
  -[UIView setHidden:](topBorderView, "setHidden:", v20);
}

- (UIImage)decorationImage
{
  return self->_decorationImage;
}

- (BOOL)showTopBorder
{
  return self->_showTopBorder;
}

- (BOOL)hasBlueBackgroundWhenSelected
{
  return self->_hasBlueBackgroundWhenSelected;
}

- (void)setHasBlueBackgroundWhenSelected:(BOOL)a3
{
  self->_hasBlueBackgroundWhenSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationImage, 0);
  objc_storeStrong((id *)&self->_decorationImageView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
