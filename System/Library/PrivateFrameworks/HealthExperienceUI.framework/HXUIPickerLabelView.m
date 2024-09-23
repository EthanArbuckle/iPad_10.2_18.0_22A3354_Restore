@implementation HXUIPickerLabelView

- (HXUIPickerLabelView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  HXUIPickerLabelView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  HXUILabelWithBackgroundView *v15;
  HXUILabelWithBackgroundView *detailLabel;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)HXUIPickerLabelView;
  v5 = -[HXUIPickerLabelView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v11;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v13);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[HXUIPickerLabelView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v15 = -[HXUILabelWithBackgroundView initWithFrame:]([HXUILabelWithBackgroundView alloc], "initWithFrame:", v7, v8, v9, v10);
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = v15;

    -[HXUILabelWithBackgroundView setNumberOfLines:](v5->_detailLabel, "setNumberOfLines:", 0);
    -[HXUIPickerLabelView addSubview:](v5, "addSubview:", v5->_detailLabel);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HXUIPickerLabelView getLabelFramesForSize:titleFrame:detailFrame:](v5, "getLabelFramesForSize:titleFrame:detailFrame:", &v20, &v18, width, height);
    -[UILabel setFrame:](v5->_titleLabel, "setFrame:", v20, v21);
    -[HXUILabelWithBackgroundView setFrame:](v5->_detailLabel, "setFrame:", v18, v19);
  }
  return v5;
}

- (void)getLabelFramesForSize:(CGSize)a3 titleFrame:(CGRect *)a4 detailFrame:(CGRect *)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  v11 = v10;
  v13 = v12;
  -[HXUILabelWithBackgroundView sizeThatFits:](self->_detailLabel, "sizeThatFits:", width, height);
  if (v11 + v14 + 8.0 >= width)
  {
    v16 = floor((width + -8.0) * 0.5);
    if (v11 >= v16)
    {
      v11 = v16;
      if (v14 < v16)
      {
        v11 = width - v14 + -8.0;
        v16 = v14;
      }
    }
    else if (v14 >= width - v11 + -8.0)
    {
      v16 = width - v11 + -8.0;
    }
    else
    {
      v16 = v14;
    }
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v11, height);
    v11 = v17;
    v19 = v18;
    -[HXUILabelWithBackgroundView sizeThatFits:](self->_detailLabel, "sizeThatFits:", v16, height);
    if (v19 >= v15)
      v15 = v19;
  }
  else if (v13 >= v15)
  {
    v15 = v13;
  }
  a4->origin.x = 0.0;
  a4->origin.y = 0.0;
  a4->size.width = v11;
  a4->size.height = v15;
  a5->origin.x = width - v14;
  a5->origin.y = 0.0;
  a5->size.width = v14;
  a5->size.height = v15;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HXUIPickerLabelView;
  -[HXUIPickerLabelView layoutSubviews](&v16, sel_layoutSubviews);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HXUIPickerLabelView bounds](self, "bounds");
  -[HXUIPickerLabelView getLabelFramesForSize:titleFrame:detailFrame:](self, "getLabelFramesForSize:titleFrame:detailFrame:", &v14, &v12, v3, v4);
  if (-[HXUIPickerLabelView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[HXUIPickerLabelView bounds](self, "bounds");
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v5 - *(double *)&v14 - *(double *)&v15, *((double *)&v14 + 1), v15);
    -[HXUIPickerLabelView bounds](self, "bounds");
    v7 = v6;
    v8 = *((double *)&v12 + 1);
    v10 = *((double *)&v13 + 1);
    v9 = *(double *)&v13;
    v11 = v7 - *(double *)&v12 - *(double *)&v13;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15);
    v8 = *((double *)&v12 + 1);
    v11 = *(double *)&v12;
    v10 = *((double *)&v13 + 1);
    v9 = *(double *)&v13;
  }
  -[HXUILabelWithBackgroundView setFrame:](self->_detailLabel, "setFrame:", v11, v8, v9, v10);
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[HXUIPickerLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setDetailText:(id)a3
{
  -[HXUILabelWithBackgroundView setText:](self->_detailLabel, "setText:", a3);
  -[HXUIPickerLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)detailText
{
  return -[HXUILabelWithBackgroundView text](self->_detailLabel, "text");
}

- (void)setDetailTextColor:(id)a3
{
  -[HXUILabelWithBackgroundView setTextColor:](self->_detailLabel, "setTextColor:", a3);
}

- (UIColor)detailTextColor
{
  return -[HXUILabelWithBackgroundView textColor](self->_detailLabel, "textColor");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double MaxY;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect v9;
  CGSize result;

  memset(&v9, 0, sizeof(v9));
  if (a3.width <= 0.0)
    width = 10000.0;
  else
    width = a3.width;
  memset(&v8, 0, sizeof(v8));
  -[HXUIPickerLabelView getLabelFramesForSize:titleFrame:detailFrame:](self, "getLabelFramesForSize:titleFrame:detailFrame:", &v9, &v8, width);
  MaxY = CGRectGetMaxY(v9);
  v5 = CGRectGetMaxY(v8);
  if (MaxY >= v5)
    v6 = MaxY;
  else
    v6 = v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
