@implementation WDDataTableViewCell

- (WDDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDDataTableViewCell *v4;
  UIImageView *v5;
  UIImageView *imageView;
  UILabel *v7;
  UILabel *textLabel;
  void *v9;
  uint64_t v10;
  UILabel *v11;
  UILabel *detailTextLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WDDataTableViewCell;
  v4 = -[WDDataTableViewCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v7;

    -[UILabel setTextAlignment:](v4->_textLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_textLabel, "setTextColor:", v9);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_textLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v10 = 2
        * (-[WDDataTableViewCell effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection") == 0);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v11;

    -[UILabel setTextAlignment:](v4->_detailTextLabel, "setTextAlignment:", v10);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_detailTextLabel, "setTextColor:", v13);

    -[UILabel setNumberOfLines:](v4->_detailTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_detailTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[WDDataTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_imageView);

    -[WDDataTableViewCell imageViewFrame](v4, "imageViewFrame");
    -[UIImageView setFrame:](v4->_imageView, "setFrame:");
    -[WDDataTableViewCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_textLabel);

    -[WDDataTableViewCell textLabelFrame](v4, "textLabelFrame");
    -[UILabel setFrame:](v4->_textLabel, "setFrame:");
    -[WDDataTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_detailTextLabel);

    -[WDDataTableViewCell detailTextLabelFrame](v4, "detailTextLabelFrame");
    -[UILabel setFrame:](v4->_detailTextLabel, "setFrame:");
    -[WDDataTableViewCell _contentSizeCategoryDidChange:](v4, "_contentSizeCategoryDidChange:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDDataTableViewCell;
  -[WDDataTableViewCell dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDDataTableViewCell;
  -[WDDataTableViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[WDDataTableViewCell imageViewFrame](self, "imageViewFrame");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[WDDataTableViewCell detailTextLabelFrame](self, "detailTextLabelFrame");
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:");
  -[WDDataTableViewCell textLabelFrame](self, "textLabelFrame");
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
  -[WDDataTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 48.0;
  else
    v5 = 16.0;

  -[WDDataTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);
}

- (UIFont)bodyFont
{
  UIFont *bodyFont;
  UIFont *v4;
  UIFont *v5;

  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (id)imageView
{
  return self->_imageView;
}

- (CGRect)imageViewFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[WDDataTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[WDDataTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      -[WDDataTableViewCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6 + -24.0 + -16.0;

      -[WDDataTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = round((v9 + -24.0) * 0.5);

      v11 = 24.0;
    }
    else
    {
      -[WDDataTableViewCell bounds](self, "bounds");
      v10 = round((v13 + -24.0) * 0.5);
      v11 = 24.0;
      v7 = 16.0;
    }
    v12 = 24.0;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v14 = v7;
  v15 = v10;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)textLabel
{
  return self->_textLabel;
}

- (CGRect)textLabelFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double MinX;
  double MaxX;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[WDDataTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (-[WDDataTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[WDDataTableViewCell detailTextLabelFrame](self, "detailTextLabelFrame");
    v6 = CGRectGetMaxX(v20) + 8.0;
    -[WDDataTableViewCell imageViewFrame](self, "imageViewFrame");
    if (CGRectIsEmpty(v21))
    {
      -[WDDataTableViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      MinX = v8;

    }
    else
    {
      -[WDDataTableViewCell imageViewFrame](self, "imageViewFrame");
      MinX = CGRectGetMinX(v24);
    }
    v14 = MinX - v6;
    v15 = -16.0;
  }
  else
  {
    -[WDDataTableViewCell imageViewFrame](self, "imageViewFrame");
    MaxX = CGRectGetMaxX(v22);
    -[WDDataTableViewCell imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 8.0;
    if (!v12)
      v13 = 16.0;
    v6 = MaxX + v13;
    -[WDDataTableViewCell detailTextLabelFrame](self, "detailTextLabelFrame");
    v14 = CGRectGetMinX(v23) - v6;
    v15 = -8.0;
  }
  v16 = v14 + v15;
  v17 = v5 + -8.0;
  v18 = 4.0;
  v19 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (id)detailTextLabel
{
  return self->_detailTextLabel;
}

- (CGRect)detailTextLabelFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  -[WDDataTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "sizeThatFits:", 0.0, v5);
  v7 = v6;

  -[WDDataTableViewCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "sizeThatFits:", 0.0, v10);
  v12 = v11;

  -[WDDataTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 + -32.0;
  -[WDDataTableViewCell imageViewFrame](self, "imageViewFrame");
  v17 = v15 - v16 + -8.0 + -4.0;

  v18 = v7 + v12;
  if (v7 + v12 > v17)
  {
    v19 = v17 - v7;
    -[WDDataTableViewCell contentView](self, "contentView", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21 / 3.0;
    -[WDDataTableViewCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;

    -[WDDataTableViewCell detailTextLabel](self, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeThatFits:", v22, v25);
    v12 = v27;

    if (v12 < v19)
      v12 = v19;
  }
  -[WDDataTableViewCell contentView](self, "contentView", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;

  v31 = 16.0;
  if (!-[WDDataTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[WDDataTableViewCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v31 = v33 - v12 + -16.0;

  }
  v34 = v30 + -8.0;
  v35 = v31;
  v36 = 4.0;
  v37 = v12;
  result.size.height = v34;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)setDisplayValue:(id)a3
{
  id v4;
  NSString *v5;
  NSString *displayValue;
  void *v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  displayValue = self->_displayValue;
  self->_displayValue = v5;

  -[WDDataTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  -[WDDataTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDateString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *dateString;
  void *v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  dateString = self->_dateString;
  self->_dateString = v5;

  -[WDDataTableViewCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  -[WDDataTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDisplayValueAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_displayValueAdjustsFontSizeToFitWidth = a3;
  -[WDDataTableViewCell textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", v3);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  UIFont *bodyFont;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  -[WDDataTableViewCell bodyFont](self, "bodyFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[WDDataTableViewCell bodyFont](self, "bodyFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[WDDataTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (BOOL)displayValueAdjustsFontSizeToFitWidth
{
  return self->_displayValueAdjustsFontSizeToFitWidth;
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
