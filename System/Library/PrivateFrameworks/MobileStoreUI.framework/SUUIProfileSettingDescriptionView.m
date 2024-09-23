@implementation SUUIProfileSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0], a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 36.0);
  v11 = v10 + 0.0;
  objc_msgSend(v8, "_scaledValueForValue:", 16.0);
  v13 = v11 + v12;
  objc_msgSend(v9, "_scaledValueForValue:", 20.0);
  v15 = v13 + v14;

  v16 = a3;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *handleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *nameLabel;
  void *v17;
  UILabel *v18;
  UILabel *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  SUUIImageView *imageView;
  SUUIImageView *v24;
  SUUIImageView *v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstChildForElementType:", 29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasDisclosureChevron = v7 != 0;

  if (!self->_handleLabel)
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    handleLabel = self->_handleLabel;
    self->_handleLabel = v8;

    v10 = self->_handleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v10, "setColor:", v11);

    -[SUUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_handleLabel);
  }
  objc_msgSend(v27, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "length"))
  {
    -[UILabel setHidden:](self->_handleLabel, "setHidden:", 0);
    v14 = self->_handleLabel;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%@"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v15);

  }
  else
  {
    -[UILabel setHidden:](self->_handleLabel, "setHidden:", 1);
  }
  nameLabel = self->_nameLabel;
  v17 = v27;
  if (!nameLabel)
  {
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v19 = self->_nameLabel;
    self->_nameLabel = v18;

    v20 = self->_nameLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v20, "setColor:", v21);

    -[SUUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_nameLabel);
    v17 = v27;
    nameLabel = self->_nameLabel;
  }
  objc_msgSend(v17, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](nameLabel, "setText:", v22);

  imageView = self->_imageView;
  if (!imageView)
  {
    v24 = objc_alloc_init(SUUIImageView);
    v25 = self->_imageView;
    self->_imageView = v24;

    -[SUUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  objc_msgSend(v27, "photo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIImageView setImage:](imageView, "setImage:", v26);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29.receiver = self;
  v29.super_class = (Class)SUUIProfileSettingDescriptionView;
  -[SUUIProfileSettingDescriptionView layoutSubviews](&v29, sel_layoutSubviews);
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[SUUIProfileSettingDescriptionView bounds](self, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v11 = floor((CGRectGetHeight(v30) + -56.0) * 0.5);
  -[SUUIImageView setFrame:](self->_imageView, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v4, v11, 56.0, 56.0, x, y, width, height));
  v31.origin.x = v4;
  v31.origin.y = v11;
  v31.size.width = 56.0;
  v31.size.height = 56.0;
  v12 = CGRectGetMaxX(v31) + 8.0;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v13 = CGRectGetWidth(v32) - v12 - v6;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v14);
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v13, 1.0);
  v16 = v15;
  if (-[UILabel isHidden](self->_handleLabel, "isHidden"))
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v17 = CGRectGetHeight(v33);
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, floor((v17 - v16) * 0.5), v13, v16, x, y, width, height));
  }
  else
  {
    objc_msgSend(v14, "_scaledValueForValue:", 36.0);
    v19 = v18;
    -[UILabel _firstBaselineOffsetFromTop](self->_nameLabel, "_firstBaselineOffsetFromTop");
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, v19 - v20, v13, v16, x, y, width, height));
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_handleLabel, "setFont:", v21);
    -[UILabel sizeThatFits:](self->_handleLabel, "sizeThatFits:", v13, 1.0);
    v23 = v22;
    objc_msgSend(v21, "_scaledValueForValue:", 16.0);
    v25 = v24;
    -[UILabel _lastLineBaselineFrameOriginY](self->_nameLabel, "_lastLineBaselineFrameOriginY");
    v27 = v25 + v26;
    -[UILabel _firstBaselineOffsetFromTop](self->_handleLabel, "_firstBaselineOffsetFromTop");
    -[UILabel setFrame:](self->_handleLabel, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, v27 - v28, v13, v23, x, y, width, height));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
}

@end
