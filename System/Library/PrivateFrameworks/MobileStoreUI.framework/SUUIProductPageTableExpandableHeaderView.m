@implementation SUUIProductPageTableExpandableHeaderView

- (NSString)actionString
{
  return -[UILabel text](self->_actionLabel, "text");
}

- (UIColor)bottomBorderColor
{
  return -[UIView backgroundColor](self->_bottomBorderView, "backgroundColor");
}

- (void)setActionString:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *actionLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SUUIProductPageTableExpandableHeaderView actionString](self, "actionString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v17 && (objc_msgSend(v4, "isEqualToString:", v17) & 1) == 0)
  {
    v5 = objc_msgSend(v17, "length");
    actionLabel = self->_actionLabel;
    if (v5)
    {
      if (!actionLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_actionLabel;
        self->_actionLabel = v7;

        v9 = self->_actionLabel;
        -[SUUIProductPageTableExpandableHeaderView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_actionLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_actionLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UILabel setTextColor:](v13, "setTextColor:", v14);
        }
        else
        {
          -[SUUIProductPageTableExpandableHeaderView tintColor](self, "tintColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        -[SUUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_actionLabel);
        actionLabel = self->_actionLabel;
      }
      -[UILabel setText:](actionLabel, "setText:", v17);
      -[UILabel sizeToFit](self->_actionLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](actionLabel, "removeFromSuperview");
      v15 = self->_actionLabel;
      self->_actionLabel = 0;

    }
    -[SUUIProductPageTableExpandableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBottomBorderColor:(id)a3
{
  id v4;
  UIView *bottomBorderView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  id v9;

  v4 = a3;
  bottomBorderView = self->_bottomBorderView;
  v9 = v4;
  if (v4)
  {
    if (!bottomBorderView)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v7 = self->_bottomBorderView;
      self->_bottomBorderView = v6;

      -[SUUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_bottomBorderView);
      bottomBorderView = self->_bottomBorderView;
    }
    -[UIView setBackgroundColor:](bottomBorderView, "setBackgroundColor:", v9);
  }
  else
  {
    -[UIView removeFromSuperview](bottomBorderView, "removeFromSuperview");
    v8 = self->_bottomBorderView;
    self->_bottomBorderView = 0;

  }
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UILabel *actionLabel;
  void *v8;
  void *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  SUUIColorScheme *v13;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    actionLabel = self->_actionLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](actionLabel, "setTextColor:", v8);
    }
    else
    {
      -[SUUIProductPageTableExpandableHeaderView tintColor](self, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](actionLabel, "setTextColor:", v9);

    }
    titleLabel = self->_titleLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v12);

    }
    v5 = v13;
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SUUIProductPageTableExpandableHeaderView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v17 && (objc_msgSend(v4, "isEqualToString:", v17) & 1) == 0)
  {
    v5 = objc_msgSend(v17, "length");
    titleLabel = self->_titleLabel;
    if (v5)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        -[SUUIProductPageTableExpandableHeaderView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_titleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UILabel setTextColor:](v13, "setTextColor:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        -[SUUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v17);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v15 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIProductPageTableExpandableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTopBorderColor:(id)a3
{
  id v4;
  UIView *topBorderView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  id v9;

  v4 = a3;
  topBorderView = self->_topBorderView;
  v9 = v4;
  if (v4)
  {
    if (!topBorderView)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v7 = self->_topBorderView;
      self->_topBorderView = v6;

      -[SUUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_topBorderView);
      topBorderView = self->_topBorderView;
    }
    -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:", v9);
  }
  else
  {
    -[UIView removeFromSuperview](topBorderView, "removeFromSuperview");
    v8 = self->_topBorderView;
    self->_topBorderView = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (UIColor)topBorderColor
{
  return -[UIView backgroundColor](self->_topBorderView, "backgroundColor");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *bottomBorderView;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  UILabel *actionLabel;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  float v20;
  CGFloat v21;
  UILabel *titleLabel;
  double v23;
  float v24;
  CGRect v25;

  -[SUUIProductPageTableExpandableHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  bottomBorderView = self->_bottomBorderView;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v6 - 1.0 / v9;
  v11 = v4 + -15.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  -[UIView setFrame:](bottomBorderView, "setFrame:", 15.0, v10, v11, 1.0 / v13);

  -[UIView setFrame:](self->_topBorderView, "setFrame:", 15.0, 0.0, v11, 1.0);
  actionLabel = self->_actionLabel;
  if (actionLabel)
  {
    -[UILabel frame](actionLabel, "frame");
    v16 = v15;
    v18 = v17;
    v19 = v11 - v15;
    v20 = (v6 - v17) * 0.5;
    v21 = (float)(floorf(v20) + 1.0);
    -[UILabel setFrame:](self->_actionLabel, "setFrame:", v19, v21);
    v25.origin.x = v19;
    v25.origin.y = v21;
    v25.size.width = v16;
    v25.size.height = v18;
    v11 = CGRectGetMinX(v25) + -10.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v24 = (v6 - v23) * 0.5;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, floorf(v24), v11 + -15.0);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *actionLabel;
  id v5;
  objc_super v6;

  actionLabel = self->_actionLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](actionLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableExpandableHeaderView;
  -[SUUIProductPageTableExpandableHeaderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end
