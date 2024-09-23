@implementation SUUIProductPageInAppPurchaseTableCell

- (NSString)indexString
{
  return -[UILabel text](self->_indexLabel, "text");
}

- (NSString)priceString
{
  return -[UILabel text](self->_priceLabel, "text");
}

- (NSString)productName
{
  return -[UILabel text](self->_nameLabel, "text");
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UILabel *indexLabel;
  void *v8;
  void *v9;
  UILabel *priceLabel;
  void *v11;
  void *v12;
  UILabel *nameLabel;
  void *v14;
  void *v15;
  SUUIColorScheme *v16;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    indexLabel = self->_indexLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](indexLabel, "setTextColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](indexLabel, "setTextColor:", v9);

    }
    priceLabel = self->_priceLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UILabel setTextColor:](priceLabel, "setTextColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](priceLabel, "setTextColor:", v12);

    }
    nameLabel = self->_nameLabel;
    -[SUUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UILabel setTextColor:](nameLabel, "setTextColor:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](nameLabel, "setTextColor:", v15);

    }
    v5 = v16;
  }

}

- (void)setIndexString:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *indexLabel;
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
  void *v17;
  id v18;

  v18 = a3;
  -[SUUIProductPageInAppPurchaseTableCell indexString](self, "indexString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    v5 = objc_msgSend(v18, "length");
    indexLabel = self->_indexLabel;
    if (v5)
    {
      if (!indexLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_indexLabel;
        self->_indexLabel = v7;

        v9 = self->_indexLabel;
        -[SUUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_indexLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        -[UILabel setTextAlignment:](self->_indexLabel, "setTextAlignment:", 1);
        v13 = self->_indexLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UILabel setTextColor:](v13, "setTextColor:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        -[SUUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", self->_indexLabel);

        indexLabel = self->_indexLabel;
      }
      -[UILabel setText:](indexLabel, "setText:", v18);
    }
    else
    {
      -[UILabel removeFromSuperview](indexLabel, "removeFromSuperview");
      v15 = self->_indexLabel;
      self->_indexLabel = 0;

    }
    -[SUUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPriceString:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *priceLabel;
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
  void *v17;
  id v18;

  v18 = a3;
  -[SUUIProductPageInAppPurchaseTableCell priceString](self, "priceString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    v5 = objc_msgSend(v18, "length");
    priceLabel = self->_priceLabel;
    if (v5)
    {
      if (!priceLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_priceLabel;
        self->_priceLabel = v7;

        v9 = self->_priceLabel;
        -[SUUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_priceLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_priceLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UILabel setTextColor:](v13, "setTextColor:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v13, "setTextColor:", v16);

        }
        -[SUUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", self->_priceLabel);

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:", v18);
      -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](priceLabel, "removeFromSuperview");
      v15 = self->_priceLabel;
      self->_priceLabel = 0;

    }
    -[SUUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setProductName:(id)a3
{
  id v4;
  uint64_t v5;
  UILabel *nameLabel;
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
  void *v17;
  id v18;

  v18 = a3;
  -[SUUIProductPageInAppPurchaseTableCell productName](self, "productName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    v5 = objc_msgSend(v18, "length");
    nameLabel = self->_nameLabel;
    if (v5)
    {
      if (!nameLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_nameLabel;
        self->_nameLabel = v7;

        v9 = self->_nameLabel;
        -[SUUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_nameLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 14.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_nameLabel;
        -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
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
        -[SUUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", self->_nameLabel);

        nameLabel = self->_nameLabel;
      }
      -[UILabel setText:](nameLabel, "setText:", v18);
    }
    else
    {
      -[UILabel removeFromSuperview](nameLabel, "removeFromSuperview");
      v15 = self->_nameLabel;
      self->_nameLabel = 0;

    }
    -[SUUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *indexLabel;
  double v9;
  double v10;
  float v11;
  double v12;
  UILabel *priceLabel;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  float v19;
  CGFloat v20;
  UILabel *nameLabel;
  double v22;
  float v23;
  objc_super v24;
  CGRect v25;

  -[SUUIProductPageInAppPurchaseTableCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = self->_contentInsets.left + 15.0;
  indexLabel = self->_indexLabel;
  if (indexLabel)
  {
    -[UILabel sizeToFit](indexLabel, "sizeToFit");
    -[UILabel frame](self->_indexLabel, "frame");
    if (v9 < 15.0)
      v9 = 15.0;
    v11 = (v6 - v10) * 0.5;
    -[UILabel setFrame:](self->_indexLabel, "setFrame:", v7 + floor((15.0 - v9) * 0.5), ceilf(v11));
    v7 = v7 + 15.0 + 15.0;
  }
  v12 = v4 + -15.0;
  priceLabel = self->_priceLabel;
  if (priceLabel)
  {
    -[UILabel sizeToFit](priceLabel, "sizeToFit");
    -[UILabel frame](self->_priceLabel, "frame");
    v15 = v14;
    v17 = v16;
    v18 = v12 - v14;
    v19 = (v6 - v16) * 0.5;
    v20 = ceilf(v19);
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v18, v20);
    v25.origin.x = v18;
    v25.origin.y = v20;
    v25.size.width = v15;
    v25.size.height = v17;
    v12 = floor(CGRectGetMinX(v25) + -22.5);
  }
  nameLabel = self->_nameLabel;
  if (nameLabel)
  {
    -[UILabel sizeToFit](nameLabel, "sizeToFit");
    -[UILabel frame](self->_nameLabel, "frame");
    v23 = (v6 - v22) * 0.5;
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", v7, ceilf(v23), v12 - v7);
  }
  v24.receiver = self;
  v24.super_class = (Class)SUUIProductPageInAppPurchaseTableCell;
  -[SUUITableViewCell layoutSubviews](&v24, sel_layoutSubviews);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *indexLabel;
  id v5;
  objc_super v6;

  indexLabel = self->_indexLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](indexLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_nameLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_priceLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageInAppPurchaseTableCell;
  -[SUUIProductPageInAppPurchaseTableCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_indexLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
