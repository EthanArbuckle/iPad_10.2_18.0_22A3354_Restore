@implementation SUUIGiftThemeCollectionViewCell

- (UIImage)itemImage
{
  void *v2;
  void *v3;

  -[SUUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)reloadThemeHeaderImage
{
  SUUIGiftTheme *theme;
  id v4;

  theme = self->_theme;
  if (theme)
  {
    -[SUUIGiftTheme headerImage](theme, "headerImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell _setHeaderImage:](self, "_setHeaderImage:", v4);

  }
}

- (void)setGift:(id)a3
{
  SUUIGift *v5;
  SUUIGift **p_gift;
  void *v7;
  void *v8;
  void *v9;
  SUUIGiftItemView *itemView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SUUIGift *v18;

  v5 = (SUUIGift *)a3;
  p_gift = &self->_gift;
  if (self->_gift != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_gift, a3);
    -[SUUIGift message](*p_gift, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell _setMessage:](self, "_setMessage:", v7);

    -[SUUIGift senderName](*p_gift, "senderName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell _setSenderName:](self, "_setSenderName:", v8);

    -[SUUIGift item](*p_gift, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SUUIGiftThemeCollectionViewCell _setPrice:](self, "_setPrice:", 0);
      -[SUUIGiftThemeCollectionViewCell _reloadItemView](self, "_reloadItemView");
    }
    else
    {
      -[SUUIGiftItemView removeFromSuperview](self->_itemView, "removeFromSuperview");
      itemView = self->_itemView;
      self->_itemView = 0;

      v11 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUUIGift giftAmount](*p_gift, "giftAmount"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringFromNumber:numberStyle:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIGiftConfiguration currencySymbol](self->_giftConfiguration, "currencySymbol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUUIGiftConfiguration currencySymbolPosition](self->_giftConfiguration, "currencySymbolPosition") == 1)
      {
        v15 = v13;
        v16 = v14;
      }
      else
      {
        v15 = v14;
        v16 = v13;
      }
      objc_msgSend(v15, "stringByAppendingString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftThemeCollectionViewCell _setPrice:](self, "_setPrice:", v17);

    }
    v5 = v18;
  }

}

- (void)setItemImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemImage:", v4);

}

- (void)setTheme:(id)a3
{
  SUUIGiftTheme **p_theme;
  void *v6;
  void *v7;
  void *v8;
  UILabel *priceLabel;
  void *v10;
  UILabel *messageLabel;
  void *v12;
  UILabel *senderNameLabel;
  void *v14;
  UILabel *senderNameLabelLabel;
  void *v16;
  void *v17;
  SUUIGiftTheme *v18;

  p_theme = &self->_theme;
  v18 = (SUUIGiftTheme *)a3;
  if (*p_theme != v18)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    -[SUUIGiftTheme headerImage](*p_theme, "headerImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell _setHeaderImage:](self, "_setHeaderImage:", v6);

    -[SUUIGiftTheme backgroundColor](*p_theme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[UIImageView setBackgroundColor:](self->_headerImageView, "setBackgroundColor:", v7);
    -[SUUIGiftItemView setBackgroundColor:](self->_itemView, "setBackgroundColor:", v7);
    -[SUUIGiftItemView setTheme:](self->_itemView, "setTheme:", *p_theme);
    -[UILabel setBackgroundColor:](self->_priceLabel, "setBackgroundColor:", v7);
    priceLabel = self->_priceLabel;
    -[SUUIGiftTheme primaryTextColor](*p_theme, "primaryTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](priceLabel, "setTextColor:", v10);

    -[UILabel setBackgroundColor:](self->_messageLabel, "setBackgroundColor:", v7);
    messageLabel = self->_messageLabel;
    -[SUUIGiftTheme bodyTextColor](*p_theme, "bodyTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v12);

    -[UILabel setBackgroundColor:](self->_senderNameLabel, "setBackgroundColor:", v7);
    senderNameLabel = self->_senderNameLabel;
    -[SUUIGiftTheme bodyTextColor](*p_theme, "bodyTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](senderNameLabel, "setTextColor:", v14);

    -[UILabel setBackgroundColor:](self->_senderNameLabelLabel, "setBackgroundColor:", v7);
    senderNameLabelLabel = self->_senderNameLabelLabel;
    -[SUUIGiftTheme primaryTextColor](*p_theme, "primaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](senderNameLabelLabel, "setTextColor:", v16);

    -[SUUIGiftTheme themeName](v18, "themeName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftThemeCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v17);

    -[SUUIGiftThemeCollectionViewCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
    -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  float v24;
  double v25;
  UIImageView *headerImageView;
  SUUIGiftItemView *itemView;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  UILabel *priceLabel;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat MaxX;
  UILabel *messageLabel;
  double v49;
  double v50;
  double v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v52.receiver = self;
  v52.super_class = (Class)SUUIGiftThemeCollectionViewCell;
  -[SUUIGiftThemeCollectionViewCell layoutSubviews](&v52, sel_layoutSubviews);
  -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = 25.0;
  else
    v10 = 5.0;
  -[SUUIGiftThemeCollectionViewCell bounds](self, "bounds");
  v12 = v11;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  v15 = 50.0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v15 = 10.0;
  v16 = v12 - v15;
  objc_msgSend(v3, "setFrame:", v10, v5, v16, v7);
  -[SUUIGiftThemeCollectionViewCell backgroundView](self, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53.origin.x = v10;
  v53.origin.y = v5;
  v53.size.width = v16;
  v53.size.height = v7;
  v54 = CGRectInset(v53, -4.0, -4.0);
  objc_msgSend(v17, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  objc_msgSend(v3, "bounds");
  v19 = v18;
  v21 = v20;
  -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23 * 0.5;
  v25 = (float)(floorf(v24) + -4.0);

  headerImageView = self->_headerImageView;
  if (headerImageView)
  {
    -[UIImageView frame](headerImageView, "frame");
    -[UIImageView setFrame:](self->_headerImageView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v19, v25);
  }
  itemView = self->_itemView;
  if (itemView)
  {
    -[SUUIGiftItemView frame](itemView, "frame");
    -[SUUIGiftItemView sizeThatFits:](self->_itemView, "sizeThatFits:", v19 + -25.0 + -25.0, 1.79769313e308);
    v29 = v28;
    v31 = v30;
    v32 = 25.0;
    -[SUUIGiftItemView setFrame:](self->_itemView, "setFrame:", 25.0, v25, v28, v30);
    v33 = 20.0;
  }
  else
  {
    priceLabel = self->_priceLabel;
    if (!priceLabel)
      goto LABEL_13;
    -[UILabel frame](priceLabel, "frame");
    v29 = v35;
    v31 = v36;
    v37 = (v19 - v35) * 0.5;
    v32 = floorf(v37);
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v32, v25);
    v33 = 21.0;
  }
  v55.origin.x = v32;
  v55.origin.y = v25;
  v55.size.width = v29;
  v55.size.height = v31;
  v25 = CGRectGetMaxY(v55) + v33;
LABEL_13:
  v38 = v21 + -16.0;
  if (self->_senderNameLabel)
  {
    -[UILabel frame](self->_senderNameLabelLabel, "frame");
    v40 = v39;
    v42 = v41;
    -[UILabel frame](self->_senderNameLabel, "frame");
    -[UILabel sizeThatFits:](self->_senderNameLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v44 = v43;
    *(float *)&v45 = (v19 - (v40 + 3.0 + v45)) * 0.5;
    v46 = fmaxf(floorf(*(float *)&v45), 25.0);
    -[UILabel setFrame:](self->_senderNameLabelLabel, "setFrame:", v46, v38 - v42, v40, v42);
    v56.origin.x = v46;
    v56.origin.y = v38 - v42;
    v56.size.width = v40;
    v56.size.height = v42;
    MaxX = CGRectGetMaxX(v56);
    -[UILabel setFrame:](self->_senderNameLabel, "setFrame:", MaxX + 3.0, v38 - v44, v19 + -25.0 - (MaxX + 3.0), v44);
    v38 = v38 - v42 + -15.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    -[UILabel frame](messageLabel, "frame");
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v19 + -50.0, v38 - v25);
    if (v50 >= v38 - v25)
      v51 = v38 - v25;
    else
      v51 = v50;
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", 25.0, v25, v49, v51);
  }

}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftThemeCollectionViewCell;
  -[SUUIGiftThemeCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, a3);
  -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (id)_itemView
{
  void *v3;
  SUUIGiftItemView *itemView;
  SUUIGiftItemView *v5;
  SUUIGiftItemView *v6;
  void *v7;
  SUUIGiftItemView *v8;

  -[SUUIGift item](self->_gift, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    itemView = self->_itemView;
    if (!itemView)
    {
      v5 = -[SUUIGiftItemView initWithStyle:item:clientContext:]([SUUIGiftItemView alloc], "initWithStyle:item:clientContext:", 1, v3, 0);
      v6 = self->_itemView;
      self->_itemView = v5;

      -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_itemView);

      itemView = self->_itemView;
    }
    v8 = itemView;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_reloadItemView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  id v12;

  -[SUUIGift item](self->_gift, "item");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "artistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtistName:", v4);

  -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v12, "categoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategoryName:", v6);

  objc_msgSend(v3, "setNumberOfUserRatings:", objc_msgSend(v12, "numberOfUserRatings"));
  objc_msgSend(v12, "primaryItemOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrice:", v8);

  objc_msgSend(v3, "setTheme:", self->_theme);
  objc_msgSend(v12, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v9);

  objc_msgSend(v12, "userRating");
  *(float *)&v11 = v10 / 5.0;
  objc_msgSend(v3, "setUserRating:", v11);
  -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_setHeaderImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *headerImageView;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v11 = a3;
  -[UIImageView image](self->_headerImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 != v11)
  {
    headerImageView = self->_headerImageView;
    if (v11)
    {
      if (!headerImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_headerImageView;
        self->_headerImageView = v7;

        -[UIImageView setContentMode:](self->_headerImageView, "setContentMode:", 1);
        -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", self->_headerImageView);

        headerImageView = self->_headerImageView;
      }
      -[UIImageView setImage:](headerImageView, "setImage:");
      -[UIImageView sizeToFit](self->_headerImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](headerImageView, "removeFromSuperview");
      v10 = self->_headerImageView;
      self->_headerImageView = 0;

    }
    -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)_setMessage:(id)a3
{
  id v4;
  UILabel *messageLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_messageLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v16)
    {
      if (!messageLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_messageLabel;
        self->_messageLabel = v6;

        v8 = self->_messageLabel;
        -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_messageLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        v12 = self->_messageLabel;
        -[SUUIGiftTheme bodyTextColor](self->_theme, "bodyTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_messageLabel);

        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
      v15 = self->_messageLabel;
      self->_messageLabel = 0;

    }
    -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setPrice:(id)a3
{
  id v4;
  UILabel *priceLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_priceLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    priceLabel = self->_priceLabel;
    if (v16)
    {
      if (!priceLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_priceLabel;
        self->_priceLabel = v6;

        v8 = self->_priceLabel;
        -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_priceLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 35.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_priceLabel;
        -[SUUIGiftTheme primaryTextColor](self->_theme, "primaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_priceLabel);

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
      -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](priceLabel, "removeFromSuperview");
      v15 = self->_priceLabel;
      self->_priceLabel = 0;

    }
    -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setSenderName:(id)a3
{
  id v4;
  UILabel *senderNameLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *senderNameLabelLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  -[UILabel text](self->_senderNameLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v33 && (objc_msgSend(v33, "isEqualToString:", v4) & 1) == 0)
  {
    senderNameLabel = self->_senderNameLabel;
    if (v33)
    {
      if (!senderNameLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_senderNameLabel;
        self->_senderNameLabel = v6;

        v8 = self->_senderNameLabel;
        -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_senderNameLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

        v12 = self->_senderNameLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        v14 = self->_senderNameLabel;
        -[SUUIGiftTheme bodyTextColor](self->_theme, "bodyTextColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", self->_senderNameLabel);

        senderNameLabel = self->_senderNameLabel;
      }
      -[UILabel setText:](senderNameLabel, "setText:");
      if (self->_senderNameLabelLabel)
        goto LABEL_13;
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      senderNameLabelLabel = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = v17;

      v19 = self->_senderNameLabelLabel;
      -[SUUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

      v21 = self->_senderNameLabelLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v21, "setBackgroundColor:", v22);

      v23 = self->_senderNameLabelLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 12.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v23, "setFont:", v24);

      v25 = self->_senderNameLabelLabel;
      -[SUUIGiftTheme primaryTextColor](self->_theme, "primaryTextColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v25, "setTextColor:", v26);

      v27 = self->_senderNameLabelLabel;
      -[SUUIGiftConfiguration clientContext](self->_giftConfiguration, "clientContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "localizedStringForKey:inTable:", CFSTR("GIFTING_THEME_SENDER_LABEL"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_THEME_SENDER_LABEL"), 0, CFSTR("Gifting"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v27, "setText:", v32);

      -[UILabel sizeToFit](self->_senderNameLabelLabel, "sizeToFit");
      -[SUUIGiftThemeCollectionViewCell contentView](self, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", self->_senderNameLabelLabel);
    }
    else
    {
      -[UILabel removeFromSuperview](senderNameLabel, "removeFromSuperview");
      v30 = self->_senderNameLabel;
      self->_senderNameLabel = 0;

      -[UILabel removeFromSuperview](self->_senderNameLabelLabel, "removeFromSuperview");
      v31 = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = 0;
    }

LABEL_13:
    -[SUUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (SUUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_giftConfiguration, a3);
}

- (SUUIGift)gift
{
  return self->_gift;
}

- (SUUIGiftTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderNameLabelLabel, 0);
  objc_storeStrong((id *)&self->_senderNameLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_gift, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
}

@end
