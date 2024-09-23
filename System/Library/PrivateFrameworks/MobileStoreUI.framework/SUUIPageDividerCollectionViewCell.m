@implementation SUUIPageDividerCollectionViewCell

- (SUUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIPageDividerCollectionViewCell *v3;
  UIView *v4;
  UIView *topDividerLine;
  UIView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIPageDividerCollectionViewCell;
  v3 = -[SUUIPageDividerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topDividerLine = v3->_topDividerLine;
    v3->_topDividerLine = v4;

    v6 = v3->_topDividerLine;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIPageDividerCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_topDividerLine);

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(v7, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SUUIViewElementPaddingForStyle(v9, 0);
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x24BEBE158];
    v12 = *(double *)(MEMORY[0x24BEBE158] + 16);
  }
  objc_msgSend(v8, "displayScale");
  v14 = 1.0 / v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v7;
    if (objc_msgSend(v15, "dividerType") == 2)
    {
      +[SUUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:](SUUIPageTitledDividerCollectionViewCell, "viewElementInsetDividerHeight:", v15);
      v14 = v16 + v14 * 2.0;
    }

  }
  v17 = a3;
  v18 = v12 + v10 + v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setColoringWithColorScheme:(id)a3
{
  uint64_t v4;
  UIView *topDividerLine;
  UIView *bottomDividerLine;
  void *v7;
  UIView *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "primaryTextColor");
  v4 = objc_claimAutoreleasedReturnValue();
  topDividerLine = self->_topDividerLine;
  v10 = (id)v4;
  if (v4)
  {
    -[UIView setBackgroundColor:](topDividerLine, "setBackgroundColor:", v4);
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine)
      -[UIView setBackgroundColor:](bottomDividerLine, "setBackgroundColor:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](topDividerLine, "setBackgroundColor:", v7);

    v8 = self->_bottomDividerLine;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    }
  }

}

- (void)setColoringWithStyle:(id)a3
{
  void *v4;
  UIView *topDividerLine;
  UIView *bottomDividerLine;
  void *v7;
  UIView *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "ikBorderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  topDividerLine = self->_topDividerLine;
  if (v10)
  {
    -[UIView setBackgroundColor:](self->_topDividerLine, "setBackgroundColor:", v10);
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine)
      -[UIView setBackgroundColor:](bottomDividerLine, "setBackgroundColor:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](topDividerLine, "setBackgroundColor:", v7);

    v8 = self->_bottomDividerLine;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    }
  }

}

- (void)setDividerType:(int64_t)a3
{
  int64_t v4;
  UIView *bottomDividerLine;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  UIView *v11;
  UIView *insetView;
  UIView *v13;
  UIView *v14;
  void *v15;
  id v16;

  if (self->_dividerType != a3)
  {
    self->_dividerType = a3;
    v4 = -[SUUIPageDividerCollectionViewCell dividerType](self, "dividerType");
    bottomDividerLine = self->_bottomDividerLine;
    if (v4 == 2)
    {
      if (!bottomDividerLine)
      {
        v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v7 = self->_bottomDividerLine;
        self->_bottomDividerLine = v6;

        v8 = self->_bottomDividerLine;
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      }
      -[SUUIPageDividerCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_bottomDividerLine);

      if (!self->_insetView)
      {
        v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        insetView = self->_insetView;
        self->_insetView = v11;

        v13 = self->_insetView;
        if (self->_insetColor)
        {
          -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.968627451, 1.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v15);

        }
      }
      -[SUUIPageDividerCollectionViewCell contentView](self, "contentView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", self->_insetView);

    }
    else
    {
      if (bottomDividerLine)
        -[UIView removeFromSuperview](bottomDividerLine, "removeFromSuperview");
      v14 = self->_insetView;
      if (v14)
        -[UIView removeFromSuperview](v14, "removeFromSuperview");
    }
  }
}

- (void)setInsetColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *insetColor;
  UIView *insetView;
  void *v8;
  UIColor *v9;

  v4 = (UIColor *)a3;
  if (self->_insetColor != v4)
  {
    v9 = v4;
    v5 = (UIColor *)-[UIColor copy](v4, "copy");
    insetColor = self->_insetColor;
    self->_insetColor = v5;

    v4 = v9;
    insetView = self->_insetView;
    if (insetView)
    {
      if (self->_insetColor)
      {
        -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.968627451, 1.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](insetView, "setBackgroundColor:", v8);

      }
      v4 = v9;
    }
  }

}

- (void)setLeftEdgeInset:(double)a3
{
  if (self->_leftEdgeInset != a3)
  {
    self->_leftEdgeInset = a3;
    -[SUUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRightEdgeInset:(double)a3
{
  if (self->_rightEdgeInset != a3)
  {
    self->_rightEdgeInset = a3;
    -[SUUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[SUUIPageDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPageDividerCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SUUIPageDividerCollectionViewCell;
  -[SUUIPageDividerCollectionViewCell applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int *v22;
  int64_t verticalAlignment;
  double v24;
  double leftEdgeInset;
  double v26;
  double top;
  double left;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SUUIPageDividerCollectionViewCell;
  -[SUUIPageDividerCollectionViewCell layoutSubviews](&v29, sel_layoutSubviews);
  -[SUUIPageDividerCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = -[SUUIPageDividerCollectionViewCell dividerType](self, "dividerType");
  -[SUUIPageDividerCollectionViewCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  if (v10 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v11 = v13;

  }
  v14 = 1.0 / v11;
  if (v8 != 2)
  {
    verticalAlignment = self->_verticalAlignment;
    if (verticalAlignment)
    {
      if (verticalAlignment != 1)
      {
        v26 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
        leftEdgeInset = *MEMORY[0x24BDBF090];
        v24 = *(double *)(MEMORY[0x24BDBF090] + 8);
        goto LABEL_11;
      }
      v24 = v7 - v14;
    }
    else
    {
      v24 = 0.0;
    }
    leftEdgeInset = self->_leftEdgeInset;
    v26 = v5 - leftEdgeInset - self->_rightEdgeInset;
LABEL_11:
    top = self->_contentInset.top;
    left = self->_contentInset.left;
    v18 = leftEdgeInset + left;
    v20 = v24 + top;
    v21 = v26 - (left + self->_contentInset.right);
    v14 = v14 - (top + self->_contentInset.bottom);
    v22 = &OBJC_IVAR___SUUIPageDividerCollectionViewCell__topDividerLine;
    goto LABEL_12;
  }
  -[UIView setFrame:](self->_topDividerLine, "setFrame:", self->_leftEdgeInset, 0.0, v5 - self->_leftEdgeInset - self->_rightEdgeInset, v14);
  v15 = self->_leftEdgeInset;
  v16 = v5 - v15 - self->_rightEdgeInset;
  -[SUUIPageDividerCollectionViewCell dividerHeight](self, "dividerHeight");
  -[UIView setFrame:](self->_insetView, "setFrame:", v15, v14, v16, v17 + v14 * -2.0);
  v18 = self->_leftEdgeInset;
  -[SUUIPageDividerCollectionViewCell dividerHeight](self, "dividerHeight");
  v20 = v19;
  v21 = v5 - self->_leftEdgeInset - self->_rightEdgeInset;
  v22 = &OBJC_IVAR___SUUIPageDividerCollectionViewCell__bottomDividerLine;
LABEL_12:
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v22), "setFrame:", v18, v20, v21, v14);

}

- (double)dividerHeight
{
  return self->_dividerHeight;
}

- (void)setDividerHeight:(double)a3
{
  self->_dividerHeight = a3;
}

- (int64_t)dividerType
{
  return self->_dividerType;
}

- (double)leftEdgeInset
{
  return self->_leftEdgeInset;
}

- (double)rightEdgeInset
{
  return self->_rightEdgeInset;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetColor, 0);
  objc_storeStrong((id *)&self->_insetView, 0);
  objc_storeStrong((id *)&self->_bottomDividerLine, 0);
  objc_storeStrong((id *)&self->_topDividerLine, 0);
}

@end
