@implementation SUUIGiftItemView

- (SUUIGiftItemView)initWithStyle:(int64_t)a3 item:(id)a4 clientContext:(id)a5
{
  id v9;
  id v10;
  SUUIGiftItemView *v11;
  SUUIGiftItemView *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGiftItemView;
  v11 = -[SUUIGiftItemView init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_item, a4);
    v12->_itemStyle = a3;
    objc_storeStrong((id *)&v12->_clientContext, a5);
    -[SUUIGiftItemView _reloadUserRatingViews](v12, "_reloadUserRatingViews");
    -[SUUIGiftItemView _reloadItemState:](v12, "_reloadItemState:", 0);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_leftToRight = objc_msgSend(v13, "userInterfaceLayoutDirection") == 0;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftItemView;
  -[SUUIGiftItemView dealloc](&v3, sel_dealloc);
}

- (SUUIItemArtworkContext)artworkContext
{
  SUUIItemArtworkContext *v3;
  int64_t itemStyle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(SUUIItemArtworkContext);
  itemStyle = self->_itemStyle;
  if ((unint64_t)(itemStyle - 2) < 2)
  {
    +[SUUIStyledImageDataConsumer giftResultIconConsumer](SUUIStyledImageDataConsumer, "giftResultIconConsumer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setIconConsumer:](v3, "setIconConsumer:", v10);

    +[SUUIStyledImageDataConsumer giftResultProductImageConsumer](SUUIStyledImageDataConsumer, "giftResultProductImageConsumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setNewsstandConsumer:](v3, "setNewsstandConsumer:", v11);

    +[SUUIProductImageDataConsumer giftResultConsumer](SUUIProductImageDataConsumer, "giftResultConsumer");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (itemStyle == 1)
  {
    +[SUUIStyledImageDataConsumer giftThemeIconConsumer](SUUIStyledImageDataConsumer, "giftThemeIconConsumer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setIconConsumer:](v3, "setIconConsumer:", v12);

    +[SUUIStyledImageDataConsumer giftThemeProductImageConsumer](SUUIStyledImageDataConsumer, "giftThemeProductImageConsumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setNewsstandConsumer:](v3, "setNewsstandConsumer:", v13);

    +[SUUIProductImageDataConsumer giftThemePosterConsumer](SUUIProductImageDataConsumer, "giftThemePosterConsumer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setPosterConsumer:](v3, "setPosterConsumer:", v14);

    +[SUUIProductImageDataConsumer giftThemeLetterboxConsumer](SUUIProductImageDataConsumer, "giftThemeLetterboxConsumer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setLetterboxConsumer:](v3, "setLetterboxConsumer:", v15);

    +[SUUIProductImageDataConsumer giftThemeConsumer](SUUIProductImageDataConsumer, "giftThemeConsumer");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!itemStyle)
  {
    +[SUUIStyledImageDataConsumer roomIconConsumer](SUUIStyledImageDataConsumer, "roomIconConsumer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setIconConsumer:](v3, "setIconConsumer:", v5);

    +[SUUIStyledImageDataConsumer giftComposeProductImageConsumer](SUUIStyledImageDataConsumer, "giftComposeProductImageConsumer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setNewsstandConsumer:](v3, "setNewsstandConsumer:", v6);

    +[SUUIProductImageDataConsumer giftComposePosterConsumer](SUUIProductImageDataConsumer, "giftComposePosterConsumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setPosterConsumer:](v3, "setPosterConsumer:", v7);

    +[SUUIProductImageDataConsumer giftComposeLetterboxConsumer](SUUIProductImageDataConsumer, "giftComposeLetterboxConsumer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setLetterboxConsumer:](v3, "setLetterboxConsumer:", v8);

    +[SUUIProductImageDataConsumer giftComposeConsumer](SUUIProductImageDataConsumer, "giftComposeConsumer");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = (void *)v9;
    -[SUUIItemArtworkContext setGeneralConsumer:](v3, "setGeneralConsumer:", v9);

  }
  return v3;
}

- (UIImage)itemImage
{
  return -[UIImageView image](self->_itemImageView, "image");
}

- (SUUIItemOfferButton)itemOfferButton
{
  SUUIItemOfferButton *itemOfferButton;
  SUUIItemOfferButton *v4;
  SUUIItemOfferButton *v5;
  SUUIItemOfferButton *v6;
  void *v7;

  itemOfferButton = self->_itemOfferButton;
  if (!itemOfferButton)
  {
    v4 = objc_alloc_init(SUUIItemOfferButton);
    v5 = self->_itemOfferButton;
    self->_itemOfferButton = v4;

    v6 = self->_itemOfferButton;
    -[SUUIGiftItemView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__itemOfferConfirmAction_, 0x20000);
    -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_itemOfferButton);
    itemOfferButton = self->_itemOfferButton;
  }
  return itemOfferButton;
}

- (void)setArtistName:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *artistName;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_artistName != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      artistName = self->_artistName;
      self->_artistName = v7;

      -[SUUIGiftItemView _reloadSubtitles](self, "_reloadSubtitles");
      v5 = v9;
    }
  }

}

- (void)setCategoryName:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *categoryName;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_categoryName != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      categoryName = self->_categoryName;
      self->_categoryName = v7;

      -[SUUIGiftItemView _reloadSubtitles](self, "_reloadSubtitles");
      v5 = v9;
    }
  }

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
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_itemImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    itemImageView = self->_itemImageView;
    if (v12)
    {
      if (!itemImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_itemImageView;
        self->_itemImageView = v7;

        v9 = self->_itemImageView;
        -[SUUIGiftItemView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_itemImageView);
        itemImageView = self->_itemImageView;
      }
      -[UIImageView setImage:](itemImageView, "setImage:");
      -[UIImageView sizeToFit](self->_itemImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](itemImageView, "removeFromSuperview");
      v11 = self->_itemImageView;
      self->_itemImageView = 0;

    }
    -[SUUIGiftItemView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setItemState:(id)a3
{
  -[SUUIGiftItemView setItemState:animated:](self, "setItemState:animated:", a3, 0);
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SUUIItemState *v6;
  SUUIItemState *itemState;

  if (self->_itemState != a3)
  {
    v4 = a4;
    v6 = (SUUIItemState *)objc_msgSend(a3, "copy");
    itemState = self->_itemState;
    self->_itemState = v6;

    -[SUUIGiftItemView _reloadItemState:](self, "_reloadItemState:", v4);
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings != a3)
  {
    self->_numberOfUserRatings = a3;
    -[SUUIGiftItemView _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (void)setPrice:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *price;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_price != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      price = self->_price;
      self->_price = v7;

      -[SUUIGiftItemView _reloadSubtitles](self, "_reloadSubtitles");
      v5 = v9;
    }
  }

}

- (void)setTheme:(id)a3
{
  SUUIGiftTheme *v4;
  SUUIGiftTheme *theme;
  void *v6;
  id v7;

  if (self->_theme != a3)
  {
    v4 = (SUUIGiftTheme *)objc_msgSend(a3, "copy");
    theme = self->_theme;
    self->_theme = v4;

    -[SUUIGiftItemView _subtitleColor](self, "_subtitleColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitleLabel1, "setTextColor:", v7);
    -[UILabel setTextColor:](self->_subtitleLabel2, "setTextColor:", v7);
    -[SUUIGiftItemView _titleColor](self, "_titleColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);
    -[UILabel setTextColor:](self->_userRatingCountLabel, "setTextColor:", v6);

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
  int64_t itemStyle;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[SUUIGiftItemView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v21 && (objc_msgSend(v21, "isEqualToString:", v4) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!v21)
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v13 = self->_titleLabel;
      self->_titleLabel = 0;

LABEL_17:
      -[SUUIGiftItemView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_18;
    }
    if (titleLabel)
    {
LABEL_16:
      -[UILabel setText:](titleLabel, "setText:");
      goto LABEL_17;
    }
    v6 = -[SUUIGiftItemView _newLabel](self, "_newLabel");
    v7 = self->_titleLabel;
    self->_titleLabel = v6;

    v8 = self->_titleLabel;
    -[SUUIGiftItemView _titleColor](self, "_titleColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    itemStyle = self->_itemStyle;
    if ((unint64_t)(itemStyle - 2) < 2)
    {
      v14 = self->_titleLabel;
      v15 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceIdiom");

      v18 = 16.0;
      if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v18 = 24.0;
      v19 = v15;
    }
    else
    {
      if (itemStyle != 1)
      {
        if (!itemStyle)
        {
          v11 = self->_titleLabel;
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v11, "setFont:", v12);

        }
        goto LABEL_15;
      }
      v14 = self->_titleLabel;
      v19 = (void *)MEMORY[0x24BEBB520];
      v18 = 15.0;
    }
    objc_msgSend(v19, "systemFontOfSize:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v20);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
LABEL_15:
    -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
    goto LABEL_16;
  }
LABEL_18:

}

- (void)setUserRating:(float)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    -[SUUIGiftItemView _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  SUUIItemOfferButton *itemOfferButton;
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
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  UIImageView *itemImageView;
  double v30;
  double v31;
  float v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  float v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  float v61;
  SUUIItemOfferButton *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double rect;
  _QWORD v72[12];
  _QWORD v73[5];
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  const char *v81;
  __int128 v82;
  CGRect v83;
  CGRect v84;

  -[SUUIGiftItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[SUUIGiftItemView leftToRight](self, "leftToRight");
  -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
  v70 = v4;
  if (v7)
    v9 = v4 - v8;
  else
    v9 = v8;
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
  {
    -[SUUIItemOfferButton frame](itemOfferButton, "frame");
    v9 = v9 - v11;
  }
  -[SUUIGiftItemView _imageSize](self, "_imageSize");
  v13 = v12;
  rect = v14;
  -[SUUIGiftItemView _imageEdgeInsets](self, "_imageEdgeInsets");
  v16 = v15;
  v69 = v17;
  v19 = v18;
  v21 = v20;
  v22 = -[SUUIGiftItemView leftToRight](self, "leftToRight");
  -[SUUIGiftItemView _paddingLeading](self, "_paddingLeading");
  v24 = v23;
  if (!v22)
  {
    v25 = v70 - v23;
    -[UIImageView frame](self->_itemImageView, "frame");
    if (v25 - v26 == 0.0)
      v24 = v13;
    else
      v24 = v25 - v26;
  }
  v27 = v16 + (v6 - v16 - v19 - rect) * 0.5;
  v28 = floorf(v27);
  itemImageView = self->_itemImageView;
  if (itemImageView)
  {
    -[UIImageView frame](itemImageView, "frame");
    v13 = v30;
    v32 = (rect - v31) * 0.5;
    -[UIImageView setFrame:](self->_itemImageView, "setFrame:", v24, v28 + floorf(v32));
  }
  v78 = 0;
  v79 = (double *)&v78;
  v80 = 0x3010000000;
  v81 = "";
  v82 = *MEMORY[0x24BDBEFB0];
  if (-[SUUIGiftItemView leftToRight](self, "leftToRight"))
  {
    v83.origin.x = v24;
    v83.origin.y = v28;
    v83.size.width = v13;
    v83.size.height = rect;
    v33 = v21 + CGRectGetMaxX(v83);
  }
  else
  {
    -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
  }
  v34 = v79;
  v79[4] = v33;
  v34[5] = v28;
  -[UILabel frame](self->_titleLabel, "frame");
  v36 = v35;
  v37 = v79[4];
  -[SUUIGiftItemView _paddingLeading](self, "_paddingLeading");
  v39 = v38;
  -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
  v41 = v40;
  v42 = -[SUUIGiftItemView leftToRight](self, "leftToRight");
  v43 = v69;
  if (v42)
    v43 = v21;
  v44 = v70 - v39 - v41 - v13 - v43;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v44, 1.79769313e308);
  v46 = v45;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v37, v36, v44, v45);
  v74 = 0;
  v75 = (double *)&v74;
  v76 = 0x2020000000;
  v47 = MEMORY[0x24BDAC760];
  v77 = 0;
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __34__SUUIGiftItemView_layoutSubviews__block_invoke;
  v73[3] = &unk_2511F4868;
  v73[4] = &v74;
  -[SUUIGiftItemView _enumerateMetadataViewsUsingBlock:](self, "_enumerateMetadataViewsUsingBlock:", v73);
  v48 = (rect - v75[3]) * 0.5;
  v79[5] = v28 + floorf(v48);
  v72[0] = v47;
  v72[1] = 3221225472;
  v72[2] = __34__SUUIGiftItemView_layoutSubviews__block_invoke_2;
  v72[3] = &unk_2511F4890;
  v72[4] = self;
  v72[5] = &v78;
  *(double *)&v72[6] = v9;
  *(double *)&v72[7] = v44;
  *(double *)&v72[8] = v37;
  *(double *)&v72[9] = v36;
  *(double *)&v72[10] = v44;
  *(double *)&v72[11] = v46;
  -[SUUIGiftItemView _enumerateMetadataViewsUsingBlock:](self, "_enumerateMetadataViewsUsingBlock:", v72);
  if (self->_userRatingCountLabel)
  {
    -[UIImageView frame](self->_starRatingImageView, "frame");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    -[UILabel frame](self->_userRatingCountLabel, "frame");
    v58 = v57;
    if (-[SUUIGiftItemView leftToRight](self, "leftToRight"))
    {
      v84.origin.x = v50;
      v84.origin.y = v52;
      v84.size.width = v54;
      v84.size.height = v56;
      v59 = CGRectGetMaxX(v84) + 3.0;
      v60 = v9 - v59;
      v9 = v59;
    }
    else
    {
      v60 = v50 + -3.0;
    }
    v61 = (v56 - v58) * 0.5;
    -[UILabel setFrame:](self->_userRatingCountLabel, "setFrame:", v9, v52 + floorf(v61) + -1.0, v60, v58);
  }
  v62 = self->_itemOfferButton;
  if (v62)
  {
    -[SUUIItemOfferButton frame](v62, "frame");
    v64 = v63;
    v66 = v65;
    if (-[SUUIGiftItemView leftToRight](self, "leftToRight"))
    {
      -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
      v68 = v70 - v67 - v64;
    }
    else
    {
      -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
    }
    -[SUUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v68, (rect - v66) * 0.5 + v28, v64, v66);
  }
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
}

double __34__SUUIGiftItemView_layoutSubviews__block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  uint64_t v6;
  double result;

  objc_msgSend(a2, "frame");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v6 + 24) + v5 + a3;
  *(double *)(v6 + 24) = result;
  return result;
}

void __34__SUUIGiftItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  int v14;
  id v15;
  CGRect v16;

  v15 = a2;
  objc_msgSend(v15, "frame");
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(double *)(v10 + 32);
  v11 = *(double *)(v10 + 40);
  v13 = (id)v9[62];
  v14 = objc_msgSend(v9, "leftToRight");
  if (v13 == v15)
  {
    if ((v14 & 1) == 0)
      v12 = *(double *)(a1 + 64) + *(double *)(a1 + 80) - v6;
  }
  else if (v14)
  {
    v6 = *(double *)(a1 + 48) - v12;
  }
  else
  {
    v6 = *(double *)(a1 + 56);
  }
  objc_msgSend(v15, "setFrame:", v12, v11, v6, v8);
  v16.origin.x = v12;
  v16.origin.y = v11;
  v16.size.width = v6;
  v16.size.height = v8;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v16) + a3;

}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *itemImageView;
  id v5;
  objc_super v6;

  itemImageView = self->_itemImageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](itemImageView, "setBackgroundColor:", v5);
  -[SUUIItemOfferButton setBackgroundColor:](self->_itemOfferButton, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_starRatingImageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_subtitleLabel1, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_subtitleLabel2, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_userRatingCountLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftItemView;
  -[SUUIGiftItemView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  float v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[6];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  CGSize result;

  width = a3.width;
  -[SUUIGiftItemView _imageEdgeInsets](self, "_imageEdgeInsets", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIGiftItemView _imageSize](self, "_imageSize");
  v12 = v11;
  v14 = v13;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[SUUIGiftItemView _paddingTrailing](self, "_paddingTrailing");
  v16 = v15;
  -[SUUIGiftItemView _paddingLeading](self, "_paddingLeading");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __33__SUUIGiftItemView_sizeThatFits___block_invoke;
  v23[3] = &unk_2511F48B8;
  *(double *)&v23[5] = width - v16 - v17 - v12 - v10;
  v23[4] = &v24;
  -[SUUIGiftItemView _enumerateMetadataViewsUsingBlock:](self, "_enumerateMetadataViewsUsingBlock:", v23);
  v18 = v25[3];
  if (v14 >= v18)
    v18 = v14;
  v19 = v8 + v6 + v18;
  v20 = ceilf(v19);
  _Block_object_dispose(&v24, 8);
  v21 = width;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

double __33__SUUIGiftItemView_sizeThatFits___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  uint64_t v6;
  double result;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + a3 + *(double *)(v6 + 24);
  *(double *)(v6 + 24) = result;
  return result;
}

- (void)_itemOfferConfirmAction:(id)a3
{
  id v4;
  id v5;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "performActionForItem:clientContext:", self->_item, self->_clientContext);

}

- (void)_enumerateMetadataViewsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *, double);
  UILabel *v5;
  int64_t itemStyle;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  unsigned __int8 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[2];
  UIImageView *v15;
  UIImageView *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, unsigned __int8 *, double))a3;
  v14[0] = self->_titleLabel;
  v14[1] = self->_subtitleLabel1;
  v5 = self->_subtitleLabel2;
  v15 = (UIImageView *)v5;
  v16 = 0;
  v12 = xmmword_241EFB758;
  v13 = unk_241EFB768;
  itemStyle = self->_itemStyle;
  if (itemStyle == 3 || itemStyle == 2)
  {
    *((_QWORD *)&v12 + 1) = 0x4010000000000000;
    v15 = self->_starRatingImageView;

  }
  else if (!itemStyle)
  {
    *(_QWORD *)&v13 = 0x4010000000000000;
    v16 = self->_starRatingImageView;
  }
  v7 = 0;
  v11 = 0;
  do
  {
    v8 = v14[v7];
    if (v8)
    {
      v4[2](v4, v8, &v11, *((double *)&v12 + v7));
      v9 = v11;
    }
    else
    {
      v9 = 0;
    }
    if (v7 > 2)
      break;
    ++v7;
  }
  while (!v9);
  for (i = 3; i != -1; --i)

}

- (UIEdgeInsets)_imageEdgeInsets
{
  int64_t itemStyle;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  itemStyle = self->_itemStyle;
  v3 = *MEMORY[0x24BEBE158];
  v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
  if (itemStyle == 2)
    v5 = 30.0;
  else
    v5 = *(double *)(MEMORY[0x24BEBE158] + 16);
  if (itemStyle == 1)
  {
    v6 = 5.0;
  }
  else
  {
    v4 = v5;
    v6 = *MEMORY[0x24BEBE158];
  }
  if (itemStyle)
    v7 = v4;
  else
    v7 = 30.0;
  if (itemStyle)
    v8 = 9.0;
  else
    v8 = 8.0;
  if (itemStyle)
    v3 = v6;
  v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v3;
  return result;
}

- (CGSize)_imageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SUUIGiftItemView artworkContext](self, "artworkContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSizeForItem:", self->_item);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_newLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v2, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (double)_paddingLeading
{
  double result;

  result = 0.0;
  if (!self->_itemStyle)
    return 15.0;
  return result;
}

- (double)_paddingTrailing
{
  double result;

  result = 0.0;
  if (!self->_itemStyle)
    return 15.0;
  return result;
}

- (void)_reloadItemState:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  id v6;

  if (self->_itemStyle == 3)
  {
    v3 = a3;
    if (-[SUUIItemState state](self->_itemState, "state"))
    {
      v5 = -[SUUIItemState state](self->_itemState, "state");
      -[SUUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", v5 == 8);
      if (v5 != 8)
      {
        v6 = -[SUUIGiftItemView itemOfferButton](self, "itemOfferButton");
        -[SUUIItemOfferButton setValuesUsingItemOffer:itemState:clientContext:animated:](self->_itemOfferButton, "setValuesUsingItemOffer:itemState:clientContext:animated:", 0, self->_itemState, self->_clientContext, v3);
        -[SUUIItemOfferButton sizeToFit](self->_itemOfferButton, "sizeToFit");
      }
    }
    else
    {
      -[SUUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
    }
    -[SUUIGiftItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_reloadSubtitles
{
  unint64_t itemStyle;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *v10;
  UILabel *subtitleLabel2;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  NSString *v17;
  NSString *v18;
  BOOL v19;
  UILabel *subtitleLabel1;
  UILabel *v21;
  UILabel *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  NSString *v26;
  NSString *v27;

  itemStyle = self->_itemStyle;
  switch(itemStyle)
  {
    case 0uLL:
      v26 = self->_categoryName;
      v4 = 488;
      goto LABEL_5;
    case 1uLL:
      v26 = self->_artistName;
      v4 = 424;
LABEL_5:
      v6 = *(Class *)((char *)&self->super.super.super.isa + v4);
      v5 = v6;
      goto LABEL_9;
    case 2uLL:
      v5 = 0;
      v7 = 424;
      goto LABEL_8;
    case 3uLL:
      v5 = 0;
      v7 = 416;
LABEL_8:
      v6 = *(Class *)((char *)&self->super.super.super.isa + v7);
      v26 = (NSString *)v6;
LABEL_9:
      v8 = v6;
      itemStyle = self->_itemStyle;
      break;
    default:
      v26 = 0;
      v5 = 0;
      break;
  }
  if (itemStyle > 3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", dbl_241EFB778[itemStyle]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UILabel text](self->_subtitleLabel2, "text");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v26 != v10 && (objc_msgSend(v5, "isEqualToString:", v10) & 1) == 0)
  {
    subtitleLabel2 = self->_subtitleLabel2;
    if (v26)
    {
      if (!subtitleLabel2)
      {
        v12 = -[SUUIGiftItemView _newLabel](self, "_newLabel");
        v13 = self->_subtitleLabel2;
        self->_subtitleLabel2 = v12;

        -[UILabel setFont:](self->_subtitleLabel2, "setFont:", v9);
        v14 = self->_subtitleLabel2;
        -[SUUIGiftItemView _subtitleColor](self, "_subtitleColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_subtitleLabel2);
        subtitleLabel2 = self->_subtitleLabel2;
      }
      -[UILabel setText:](subtitleLabel2, "setText:", v5);
      -[UILabel sizeToFit](self->_subtitleLabel2, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel2, "removeFromSuperview");
      v16 = self->_subtitleLabel2;
      self->_subtitleLabel2 = 0;

    }
  }
  -[UILabel text](self->_subtitleLabel1, "text");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();

  v18 = v26;
  if (v26 != v17)
  {
    v19 = -[NSString isEqualToString:](v26, "isEqualToString:", v17);
    v18 = v26;
    if (!v19)
    {
      subtitleLabel1 = self->_subtitleLabel1;
      if (v26)
      {
        if (!subtitleLabel1)
        {
          v21 = -[SUUIGiftItemView _newLabel](self, "_newLabel", v26);
          v22 = self->_subtitleLabel1;
          self->_subtitleLabel1 = v21;

          -[UILabel setFont:](self->_subtitleLabel1, "setFont:", v9);
          v23 = self->_subtitleLabel1;
          -[SUUIGiftItemView _subtitleColor](self, "_subtitleColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v23, "setTextColor:", v24);

          -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_subtitleLabel1);
          v18 = v26;
          subtitleLabel1 = self->_subtitleLabel1;
        }
        -[UILabel setText:](subtitleLabel1, "setText:", v18);
        -[UILabel sizeToFit](self->_subtitleLabel1, "sizeToFit");
      }
      else
      {
        -[UILabel removeFromSuperview](subtitleLabel1, "removeFromSuperview");
        v25 = self->_subtitleLabel1;
        self->_subtitleLabel1 = 0;

      }
      v18 = v26;
    }
  }
  v27 = v18;

}

- (void)_reloadUserRatingViews
{
  UILabel *userRatingCountLabel;
  void *starRatingImageView;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  id v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  UIImageView *v19;
  void *v20;
  UIImageView *v21;
  void *v22;

  if (self->_numberOfUserRatings < 1 || self->_itemStyle == 1)
  {
    -[UILabel removeFromSuperview](self->_userRatingCountLabel, "removeFromSuperview");
    userRatingCountLabel = self->_userRatingCountLabel;
    self->_userRatingCountLabel = 0;

    -[UIImageView removeFromSuperview](self->_starRatingImageView, "removeFromSuperview");
    starRatingImageView = self->_starRatingImageView;
    self->_starRatingImageView = 0;
  }
  else
  {
    if (!self->_userRatingCountLabel)
    {
      v5 = -[SUUIGiftItemView _newLabel](self, "_newLabel");
      v6 = self->_userRatingCountLabel;
      self->_userRatingCountLabel = v5;

      v7 = self->_userRatingCountLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v7, "setFont:", v8);

      v9 = self->_userRatingCountLabel;
      -[SUUIGiftItemView _userRatingColor](self, "_userRatingColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v9, "setTextColor:", v10);

      -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_userRatingCountLabel);
    }
    v11 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v11, "setNumberStyle:", 1);
    objc_msgSend(v11, "setUsesGroupingSeparator:", 0);
    v12 = self->_userRatingCountLabel;
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfUserRatings);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@)"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v16);

    -[UILabel sizeToFit](self->_userRatingCountLabel, "sizeToFit");
    if (!self->_starRatingImageView)
    {
      v17 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v18 = self->_starRatingImageView;
      self->_starRatingImageView = v17;

      v19 = self->_starRatingImageView;
      -[SUUIGiftItemView backgroundColor](self, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v19, "setBackgroundColor:", v20);

      -[UIImageView setContentMode:](self->_starRatingImageView, "setContentMode:", 7);
      -[SUUIGiftItemView addSubview:](self, "addSubview:", self->_starRatingImageView);
    }
    +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
    starRatingImageView = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_starRatingImageView;
    objc_msgSend(starRatingImageView, "ratingStarsImageForRating:", self->_userRating);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v21, "setImage:", v22);

    -[UIImageView sizeToFit](self->_starRatingImageView, "sizeToFit");
  }

  -[SUUIGiftItemView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_subtitleColor
{
  SUUIGiftTheme *theme;

  theme = self->_theme;
  if (theme)
    -[SUUIGiftTheme bodyTextColor](theme, "bodyTextColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_titleColor
{
  SUUIGiftTheme *theme;

  theme = self->_theme;
  if (theme)
    -[SUUIGiftTheme primaryTextColor](theme, "primaryTextColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_userRatingColor
{
  SUUIGiftTheme *theme;

  theme = self->_theme;
  if (theme)
    -[SUUIGiftTheme primaryTextColor](theme, "primaryTextColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (int64_t)giftItemStyle
{
  return self->_itemStyle;
}

- (SUUIItem)item
{
  return self->_item;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (NSString)price
{
  return self->_price;
}

- (SUUIGiftTheme)theme
{
  return self->_theme;
}

- (float)userRating
{
  return self->_userRating;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_subtitleLabel2, 0);
  objc_storeStrong((id *)&self->_subtitleLabel1, 0);
  objc_storeStrong((id *)&self->_starRatingImageView, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end
