@implementation SUUILockupMetadataView

- (SUUILockupMetadataView)initWithFrame:(CGRect)a3
{
  SUUILockupMetadataView *v3;
  SUUILockupMetadataView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUILockupMetadataView;
  v3 = -[SUUILockupMetadataView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUUILockupMetadataView setContentMode:](v3, "setContentMode:", 7);
  return v4;
}

+ (double)maximumHeightWithVisibleFields:(unint64_t)a3
{
  double v3;
  unint64_t v4;
  double v5;
  double result;

  v3 = 37.0;
  if ((a3 & 0x10) == 0)
    v3 = 0.0;
  if ((a3 & 8) != 0)
    v3 = v3 + 15.0;
  if ((a3 & 0x80) != 0)
    v3 = v3 + 15.0;
  if ((a3 & 1) != 0)
    v3 = v3 + 15.0;
  if ((a3 & 0x20) != 0)
    v3 = v3 + 15.0;
  if ((a3 & 0x100) != 0)
    v3 = v3 + 15.0;
  v4 = (a3 & 1)
     + ((unint64_t)(a3 & 0x80) >> 7)
     + ((a3 & 8) >> 3)
     + ((a3 & 0x20) >> 5)
     + ((a3 & 0x100) >> 8);
  v5 = (float)(uint64_t)(v4 - 1);
  if (v4 <= 1)
    v5 = -0.0;
  result = v5 + v3;
  if ((a3 & 0x40) != 0)
    return result + 14.0;
  return result;
}

- (NSString)artistName
{
  return -[UILabel text](self->_artistNameLabel, "text");
}

- (NSString)editorialBadgeString
{
  return (NSString *)-[SUUIBadgeLabel text](self->_editorialBadgeLabel, "text");
}

- (NSString)categoryString
{
  return -[UILabel text](self->_categoryLabel, "text");
}

- (NSString)itemCountString
{
  return -[UILabel text](self->_itemCountLabel, "text");
}

- (NSString)itemOfferString
{
  return -[UILabel text](self->_itemOfferLabel, "text");
}

- (NSString)releaseDateString
{
  return -[UILabel text](self->_releaseDateLabel, "text");
}

- (void)setArtistName:(id)a3
{
  id v4;
  UILabel *artistNameLabel;
  UILabel *v6;
  UILabel *v7;
  id v8;

  v8 = a3;
  -[UILabel text](self->_artistNameLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v8)
    {
      if (!artistNameLabel)
      {
        v6 = -[SUUILockupMetadataView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
      -[UILabel sizeToFit](self->_artistNameLabel, "sizeToFit");
    }
    else
    {
      self->_artistNameLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setEditorialBadgeString:(id)a3
{
  id v4;
  SUUIBadgeLabel *editorialBadgeLabel;
  SUUIBadgeLabel *v6;
  SUUIBadgeLabel *v7;
  SUUIBadgeLabel *v8;
  void *v9;
  void *v10;
  SUUIBadgeLabel *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SUUIBadgeLabel text](self->_editorialBadgeLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v13 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) == 0)
  {
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (v13)
    {
      if (!editorialBadgeLabel)
      {
        v6 = objc_alloc_init(SUUIBadgeLabel);
        v7 = self->_editorialBadgeLabel;
        self->_editorialBadgeLabel = v6;

        v8 = self->_editorialBadgeLabel;
        -[SUUILockupMetadataView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SUUIBadgeLabel setTextColor:](v8, "setTextColor:", v9);
        }
        else
        {
          +[SUUIBadgeLabel defaultTextColor](SUUIBadgeLabel, "defaultTextColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIBadgeLabel setTextColor:](v8, "setTextColor:", v10);

        }
        v11 = self->_editorialBadgeLabel;
        if (self->_textColor)
        {
          -[SUUIBadgeLabel setBackgroundColor:](self->_editorialBadgeLabel, "setBackgroundColor:");
        }
        else
        {
          +[SUUIBadgeLabel defaultBackgroundColor](SUUIBadgeLabel, "defaultBackgroundColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIBadgeLabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

        }
      }
      -[SUUIBadgeLabel setText:](self->_editorialBadgeLabel, "setText:");
      -[SUUIBadgeLabel sizeToFit](self->_editorialBadgeLabel, "sizeToFit");
    }
    else
    {
      self->_editorialBadgeLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setCategoryString:(id)a3
{
  id v4;
  UILabel *categoryLabel;
  UILabel *v6;
  UILabel *v7;
  id v8;

  v8 = a3;
  -[UILabel text](self->_categoryLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    categoryLabel = self->_categoryLabel;
    if (v8)
    {
      if (!categoryLabel)
      {
        v6 = -[SUUILockupMetadataView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_categoryLabel;
        self->_categoryLabel = v6;

        categoryLabel = self->_categoryLabel;
      }
      -[UILabel setText:](categoryLabel, "setText:");
      -[UILabel sizeToFit](self->_categoryLabel, "sizeToFit");
    }
    else
    {
      self->_categoryLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setColoringWithColorScheme:(id)a3
{
  UIColor *v4;
  UIColor **p_textColor;
  UIColor *textColor;
  UILabel *categoryLabel;
  void *v8;
  UILabel *itemCountLabel;
  void *v10;
  UILabel *userRatingLabel;
  void *v12;
  SUUIBadgeLabel *editorialBadgeLabel;
  void *v14;
  UIColor *v15;
  UIColor **p_titleColor;
  UIColor *titleColor;
  UILabel *titleLabel;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "primaryTextColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_textColor = &self->_textColor;
  textColor = self->_textColor;
  if (textColor != v4 && (-[UIColor isEqual:](textColor, "isEqual:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, v4);
    categoryLabel = self->_categoryLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_categoryLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](categoryLabel, "setTextColor:", v8);

    }
    itemCountLabel = self->_itemCountLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_itemCountLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](itemCountLabel, "setTextColor:", v10);

    }
    userRatingLabel = self->_userRatingLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_userRatingLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](userRatingLabel, "setTextColor:", v12);

    }
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (*p_textColor)
    {
      -[SUUIBadgeLabel setBackgroundColor:](self->_editorialBadgeLabel, "setBackgroundColor:");
    }
    else
    {
      +[SUUIBadgeLabel defaultBackgroundColor](SUUIBadgeLabel, "defaultBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIBadgeLabel setBackgroundColor:](editorialBadgeLabel, "setBackgroundColor:", v14);

    }
  }
  objc_msgSend(v20, "secondaryTextColor");
  v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (titleColor != v15 && (-[UIColor isEqual:](titleColor, "isEqual:", v15) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v15);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v19);

    }
  }

}

- (void)setItemCountString:(id)a3
{
  id v4;
  UILabel *itemCountLabel;
  UILabel *v6;
  UILabel *v7;
  id v8;

  v8 = a3;
  -[UILabel text](self->_itemCountLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    itemCountLabel = self->_itemCountLabel;
    if (v8)
    {
      if (!itemCountLabel)
      {
        v6 = -[SUUILockupMetadataView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_itemCountLabel;
        self->_itemCountLabel = v6;

        itemCountLabel = self->_itemCountLabel;
      }
      -[UILabel setText:](itemCountLabel, "setText:");
      -[UILabel sizeToFit](self->_itemCountLabel, "sizeToFit");
    }
    else
    {
      self->_itemCountLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setItemOfferString:(id)a3
{
  id v4;
  UILabel *itemOfferLabel;
  UILabel *v6;
  UILabel *v7;
  id v8;

  v8 = a3;
  -[UILabel text](self->_itemOfferLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    itemOfferLabel = self->_itemOfferLabel;
    if (v8)
    {
      if (!itemOfferLabel)
      {
        v6 = -[SUUILockupMetadataView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_itemOfferLabel;
        self->_itemOfferLabel = v6;

        itemOfferLabel = self->_itemOfferLabel;
      }
      -[UILabel setText:](itemOfferLabel, "setText:");
      -[UILabel sizeToFit](self->_itemOfferLabel, "sizeToFit");
    }
    else
    {
      self->_itemOfferLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings != a3 || !self->_userRatingLabel)
  {
    self->_numberOfUserRatings = a3;
    -[SUUILockupMetadataView _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (void)setReleaseDateString:(id)a3
{
  id v4;
  UILabel *releaseDateLabel;
  UILabel *v6;
  UILabel *v7;
  id v8;

  v8 = a3;
  -[UILabel text](self->_releaseDateLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8 && (objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    releaseDateLabel = self->_releaseDateLabel;
    if (v8)
    {
      if (!releaseDateLabel)
      {
        v6 = -[SUUILockupMetadataView _newDefaultLabel](self, "_newDefaultLabel");
        v7 = self->_releaseDateLabel;
        self->_releaseDateLabel = v6;

        releaseDateLabel = self->_releaseDateLabel;
      }
      -[UILabel setText:](releaseDateLabel, "setText:");
      -[UILabel sizeToFit](self->_releaseDateLabel, "sizeToFit");
    }
    else
    {
      self->_releaseDateLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
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
  void *v13;
  id v14;

  v14 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v14 && (objc_msgSend(v4, "isEqualToString:", v14) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v14)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUILockupMetadataView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v13);

        }
      }
      -[UILabel setText:](self->_titleLabel, "setText:");
    }
    else
    {
      self->_titleLabel = 0;

    }
    -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setUserRating:(float)a3
{
  if (self->_userRating != a3 || !self->_userRatingImageView)
  {
    self->_userRating = a3;
    -[SUUILockupMetadataView _reloadUserRatingViews](self, "_reloadUserRatingViews");
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SUUILockupMetadataView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  unint64_t visibleFields;
  UILabel *titleLabel;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  UILabel *categoryLabel;
  double v13;
  CGFloat v14;
  UILabel *artistNameLabel;
  double v16;
  CGFloat v17;
  UILabel *itemCountLabel;
  double v19;
  CGFloat v20;
  UILabel *releaseDateLabel;
  double v22;
  CGFloat v23;
  UILabel *itemOfferLabel;
  double v25;
  CGFloat v26;
  UIImageView *userRatingImageView;
  UILabel **p_userRatingLabel;
  UILabel *userRatingLabel;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  CGFloat v37;
  SUUIBadgeLabel *editorialBadgeLabel;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  uint64_t v43;
  void *v44;
  UIImageView *v45;
  UIImageView *v46;
  void *v47;
  uint64_t i;
  uint64_t v49;
  _QWORD v50[9];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v50[8] = *MEMORY[0x24BDAC8D0];
  -[SUUILockupMetadataView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  visibleFields = self->_visibleFields;
  titleLabel = self->_titleLabel;
  if ((visibleFields & 0x10) == 0)
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
LABEL_8:
    v11 = 0.0;
    goto LABEL_9;
  }
  if (!titleLabel)
    goto LABEL_8;
  if (((self->_editorialBadgeLabel != 0) & (visibleFields >> 11)) != 0)
    v8 = 1;
  else
    v8 = 2;
  -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", v8);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
  v10 = v9;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v5, v9);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
  v51.origin.x = 0.0;
  v51.origin.y = 0.0;
  v51.size.width = v5;
  v51.size.height = v10;
  v11 = CGRectGetMaxY(v51) + 1.0;
LABEL_9:
  categoryLabel = self->_categoryLabel;
  if ((self->_visibleFields & 8) != 0)
  {
    if (categoryLabel)
    {
      -[UILabel frame](categoryLabel, "frame");
      -[UILabel sizeThatFits:](self->_categoryLabel, "sizeThatFits:", v5, 1.79769313e308);
      v14 = v13;
      -[UILabel setFrame:](self->_categoryLabel, "setFrame:", 0.0, v11, v5, v13);
      -[UILabel setHidden:](self->_categoryLabel, "setHidden:", 0);
      v52.origin.x = 0.0;
      v52.origin.y = v11;
      v52.size.width = v5;
      v52.size.height = v14;
      v11 = CGRectGetMaxY(v52) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](categoryLabel, "setHidden:", 1);
  }
  artistNameLabel = self->_artistNameLabel;
  if ((self->_visibleFields & 1) != 0)
  {
    if (artistNameLabel)
    {
      -[UILabel frame](artistNameLabel, "frame");
      -[UILabel sizeThatFits:](self->_artistNameLabel, "sizeThatFits:", v5, 1.79769313e308);
      v17 = v16;
      -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", 0.0, v11, v5, v16);
      -[UILabel setHidden:](self->_artistNameLabel, "setHidden:", 0);
      v53.origin.x = 0.0;
      v53.origin.y = v11;
      v53.size.width = v5;
      v53.size.height = v17;
      v11 = CGRectGetMaxY(v53) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](artistNameLabel, "setHidden:", 1);
  }
  itemCountLabel = self->_itemCountLabel;
  if ((self->_visibleFields & 0x80) != 0)
  {
    if (itemCountLabel)
    {
      -[UILabel frame](itemCountLabel, "frame");
      -[UILabel sizeThatFits:](self->_itemCountLabel, "sizeThatFits:", v5, 1.79769313e308);
      v20 = v19;
      -[UILabel setFrame:](self->_itemCountLabel, "setFrame:", 0.0, v11, v5, v19);
      -[UILabel setHidden:](self->_itemCountLabel, "setHidden:", 0);
      v54.origin.x = 0.0;
      v54.origin.y = v11;
      v54.size.width = v5;
      v54.size.height = v20;
      v11 = CGRectGetMaxY(v54) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](itemCountLabel, "setHidden:", 1);
  }
  releaseDateLabel = self->_releaseDateLabel;
  if ((self->_visibleFields & 0x20) != 0)
  {
    if (releaseDateLabel)
    {
      -[UILabel frame](releaseDateLabel, "frame");
      -[UILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v5, 1.79769313e308);
      v23 = v22;
      -[UILabel setFrame:](self->_releaseDateLabel, "setFrame:", 0.0, v11, v5, v22);
      -[UILabel setHidden:](self->_releaseDateLabel, "setHidden:", 0);
      v55.origin.x = 0.0;
      v55.origin.y = v11;
      v55.size.width = v5;
      v55.size.height = v23;
      v11 = CGRectGetMaxY(v55) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](releaseDateLabel, "setHidden:", 1);
  }
  itemOfferLabel = self->_itemOfferLabel;
  if ((self->_visibleFields & 0x100) != 0)
  {
    if (itemOfferLabel)
    {
      -[UILabel frame](itemOfferLabel, "frame");
      -[UILabel sizeThatFits:](self->_itemOfferLabel, "sizeThatFits:", v5, 1.79769313e308);
      v26 = v25;
      -[UILabel setFrame:](self->_itemOfferLabel, "setFrame:", 0.0, v11, v5, v25);
      -[UILabel setHidden:](self->_itemOfferLabel, "setHidden:", 0);
      v56.origin.x = 0.0;
      v56.origin.y = v11;
      v56.size.width = v5;
      v56.size.height = v26;
      v11 = CGRectGetMaxY(v56) + 1.0;
    }
  }
  else
  {
    -[UILabel setHidden:](itemOfferLabel, "setHidden:", 1);
  }
  v49 = 416;
  userRatingImageView = self->_userRatingImageView;
  if ((self->_visibleFields & 0x40) == 0)
  {
    -[UIImageView setHidden:](userRatingImageView, "setHidden:", 1, 416);
    -[UILabel setHidden:](self->_userRatingLabel, "setHidden:", 1);
    goto LABEL_43;
  }
  if (!userRatingImageView || (-[UIImageView isHidden](userRatingImageView, "isHidden", 416) & 1) != 0)
  {
    p_userRatingLabel = &self->_userRatingLabel;
    userRatingLabel = self->_userRatingLabel;
    if (!userRatingLabel)
      goto LABEL_43;
    -[UILabel frame](userRatingLabel, "frame");
    v30 = 0.0;
    v31 = 0.0;
    goto LABEL_42;
  }
  -[UIImageView frame](self->_userRatingImageView, "frame");
  p_userRatingLabel = &self->_userRatingLabel;
  v33 = 16.0;
  if (v32 >= 16.0)
    v33 = v32;
  if (self->_userRatingLabel)
    v34 = v33;
  else
    v34 = v32;
  -[UIImageView frame](self->_userRatingImageView, "frame", v33);
  v36 = (v34 - v35) * 0.5;
  -[UIImageView setFrame:](self->_userRatingImageView, "setFrame:", 0.0, v11 + floorf(v36));
  -[UIImageView setHidden:](self->_userRatingImageView, "setHidden:", 0);
  if (*p_userRatingLabel)
  {
    -[UILabel frame](*p_userRatingLabel, "frame");
    -[UIImageView frame](self->_userRatingImageView, "frame");
    v30 = CGRectGetMaxX(v57) + 3.0;
    v31 = (v34 + -16.0) * 0.5;
LABEL_42:
    v37 = v11 + floorf(v31) + -1.0;
    -[UILabel setFrame:](*p_userRatingLabel, "setFrame:", v30, v37, v5 - v30, 16.0, v49);
    -[UILabel setHidden:](*p_userRatingLabel, "setHidden:", 0);
    v58.size.height = 16.0;
    v58.origin.x = v30;
    v58.origin.y = v37;
    v58.size.width = v5 - v30;
    v11 = CGRectGetMaxY(v58) + 1.0;
  }
LABEL_43:
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if ((self->_visibleFields & 0x800) != 0)
  {
    if (editorialBadgeLabel)
    {
      -[SUUIBadgeLabel frame](editorialBadgeLabel, "frame");
      v39 = floor(v11);
      -[SUUIBadgeLabel sizeThatFits:](self->_editorialBadgeLabel, "sizeThatFits:", v5, 1.79769313e308);
      v42 = v41;
      if (v5 >= v40)
        v5 = v40;
      -[SUUIBadgeLabel setFrame:](self->_editorialBadgeLabel, "setFrame:", 0.0, v39, v5, v41, v49);
      -[SUUIBadgeLabel setHidden:](self->_editorialBadgeLabel, "setHidden:", 0);
      v59.origin.x = 0.0;
      v59.origin.y = v39;
      v59.size.width = v5;
      v59.size.height = v42;
      CGRectGetMaxY(v59);
    }
  }
  else
  {
    -[SUUIBadgeLabel setHidden:](editorialBadgeLabel, "setHidden:", 1);
  }
  v50[0] = self->_titleLabel;
  v50[1] = self->_categoryLabel;
  v50[2] = *(id *)((char *)&self->super.super.super.isa + v49);
  v50[3] = self->_itemCountLabel;
  v50[4] = self->_releaseDateLabel;
  v50[5] = self->_itemOfferLabel;
  v50[6] = self->_userRatingLabel;
  v43 = 0;
  v50[7] = self->_editorialBadgeLabel;
  do
  {
    v44 = (void *)v50[v43];
    if (v44 && (objc_msgSend((id)v50[v43], "isHidden") & 1) == 0)
    {
      objc_msgSend(v44, "frame");
      objc_msgSend(v44, "drawTextInRect:");
    }
    ++v43;
  }
  while (v43 != 8);
  v45 = self->_userRatingImageView;
  v46 = v45;
  if (v45 && (-[UIImageView isHidden](v45, "isHidden") & 1) == 0)
  {
    -[UIImageView image](v46, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView frame](v46, "frame");
    objc_msgSend(v47, "drawInRect:");

  }
  for (i = 7; i != -1; --i)

}

- (void)setBackgroundColor:(id)a3
{
  SUUIBadgeLabel *editorialBadgeLabel;
  id v6;
  void *v7;
  objc_super v8;

  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (a3)
  {
    -[SUUIBadgeLabel setTextColor:](editorialBadgeLabel, "setTextColor:", a3);
  }
  else
  {
    v6 = 0;
    +[SUUIBadgeLabel defaultTextColor](SUUIBadgeLabel, "defaultTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBadgeLabel setTextColor:](editorialBadgeLabel, "setTextColor:", v7);

  }
  -[UILabel setBackgroundColor:](self->_artistNameLabel, "setBackgroundColor:", a3);
  -[UILabel setBackgroundColor:](self->_categoryLabel, "setBackgroundColor:", a3);
  -[UILabel setBackgroundColor:](self->_itemCountLabel, "setBackgroundColor:", a3);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", a3);
  -[UIImageView setBackgroundColor:](self->_userRatingImageView, "setBackgroundColor:", a3);
  -[UILabel setBackgroundColor:](self->_userRatingLabel, "setBackgroundColor:", a3);
  v8.receiver = self;
  v8.super_class = (Class)SUUILockupMetadataView;
  -[SUUILockupMetadataView setBackgroundColor:](&v8, sel_setBackgroundColor_, a3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UILabel *titleLabel;
  double v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  UILabel *categoryLabel;
  unint64_t v11;
  double v12;
  UILabel *artistNameLabel;
  double v14;
  UILabel *itemCountLabel;
  double v16;
  UILabel *releaseDateLabel;
  double v18;
  UILabel *itemOfferLabel;
  double v20;
  SUUIBadgeLabel *editorialBadgeLabel;
  double v22;
  double v23;
  double v24;
  UIImageView *userRatingImageView;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  width = a3.width;
  titleLabel = self->_titleLabel;
  v6 = 0.0;
  if (titleLabel && (self->_visibleFields & 0x10) != 0)
  {
    if (self->_editorialBadgeLabel)
      v7 = (self->_visibleFields & 0x800) == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 2;
    else
      v8 = 1;
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", v8, a3.width, a3.height);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v9 + 0.0 + 1.0;
  }
  categoryLabel = self->_categoryLabel;
  if (categoryLabel && (self->_visibleFields & 8) != 0)
  {
    -[UILabel sizeThatFits:](categoryLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v12;
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  artistNameLabel = self->_artistNameLabel;
  if (artistNameLabel && (self->_visibleFields & 1) != 0)
  {
    -[UILabel sizeThatFits:](artistNameLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v14;
    ++v11;
  }
  itemCountLabel = self->_itemCountLabel;
  if (itemCountLabel && (self->_visibleFields & 0x80) != 0)
  {
    -[UILabel sizeThatFits:](itemCountLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v16;
    ++v11;
  }
  releaseDateLabel = self->_releaseDateLabel;
  if (releaseDateLabel && (self->_visibleFields & 0x20) != 0)
  {
    -[UILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v18;
    ++v11;
  }
  itemOfferLabel = self->_itemOfferLabel;
  if (itemOfferLabel && (self->_visibleFields & 0x100) != 0)
  {
    -[UILabel sizeThatFits:](itemOfferLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v20;
    ++v11;
  }
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel && (self->_visibleFields & 0x800) != 0)
  {
    -[SUUIBadgeLabel sizeThatFits:](editorialBadgeLabel, "sizeThatFits:", width, 1.79769313e308);
    v6 = v6 + v22;
    ++v11;
  }
  v23 = (float)(uint64_t)(v11 - 1);
  if (v11 <= 1)
    v23 = -0.0;
  v24 = v6 + v23;
  if ((self->_visibleFields & 0x40) != 0)
  {
    userRatingImageView = self->_userRatingImageView;
    if (userRatingImageView)
      -[UIImageView frame](userRatingImageView, "frame");
    else
      v26 = 0.0;
    v27 = 16.0;
    if (v26 >= 16.0)
      v27 = v26;
    if (!self->_userRatingLabel)
      v27 = v26;
    if (v27 <= 0.00000011920929)
      v27 = -0.0;
    v24 = v24 + v27;
  }
  v28 = width;
  v29 = v24;
  result.height = v29;
  result.width = v28;
  return result;
}

- (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_sOnce != -1)
    dispatch_once(&_decimalNumberFormatter_sOnce, &__block_literal_global_13);
  return (id)_decimalNumberFormatter_sNumberFormatter;
}

uint64_t __49__SUUILockupMetadataView__decimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_decimalNumberFormatter_sNumberFormatter;
  _decimalNumberFormatter_sNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)_decimalNumberFormatter_sNumberFormatter, "setNumberStyle:", 1);
}

- (id)_newDefaultLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SUUILockupMetadataView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  if (self->_textColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v6);

  }
  return v3;
}

- (void)_reloadUserRatingViews
{
  UILabel *v3;
  UILabel *userRatingLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *userRatingImageView;
  UIImageView *v19;
  void *v20;
  void *v21;
  UIImageView *v22;
  void *v23;
  UILabel *v24;
  void *v25;

  if (!self->_userRatingLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    userRatingLabel = self->_userRatingLabel;
    self->_userRatingLabel = v3;

    v5 = self->_userRatingLabel;
    -[SUUILockupMetadataView backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = self->_userRatingLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_userRatingLabel;
    if (self->_textColor)
    {
      -[UILabel setTextColor:](self->_userRatingLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v9, "setTextColor:", v10);

    }
  }
  if (self->_numberOfUserRatings)
  {
    -[SUUILockupMetadataView _decimalNumberFormatter](self, "_decimalNumberFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_userRatingLabel;
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfUserRatings);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@)"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v16);

    if (!self->_userRatingImageView)
    {
      v17 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      userRatingImageView = self->_userRatingImageView;
      self->_userRatingImageView = v17;

      v19 = self->_userRatingImageView;
      -[SUUILockupMetadataView backgroundColor](self, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    }
    +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_userRatingImageView;
    objc_msgSend(v21, "ratingStarsImageForRating:", self->_userRating);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v22, "setImage:", v23);

    -[UIImageView setHidden:](self->_userRatingImageView, "setHidden:", 0);
    -[UIImageView sizeToFit](self->_userRatingImageView, "sizeToFit");
  }
  else
  {
    -[UIImageView setHidden:](self->_userRatingImageView, "setHidden:", 1);
    v24 = self->_userRatingLabel;
    -[SUUILockupMetadataView clientContext](self, "clientContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    if (v25)
      objc_msgSend(v25, "localizedStringForKey:", CFSTR("NO_RATINGS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NO_RATINGS"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v24, "setText:", v21);
  }

  -[SUUILockupMetadataView setNeedsDisplay](self, "setNeedsDisplay");
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (UIColor)primaryTextColor
{
  return self->_textColor;
}

- (float)userRating
{
  return self->_userRating;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_userRatingImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferLabel, 0);
  objc_storeStrong((id *)&self->_itemCountLabel, 0);
  objc_storeStrong((id *)&self->_editorialBadgeLabel, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

@end
