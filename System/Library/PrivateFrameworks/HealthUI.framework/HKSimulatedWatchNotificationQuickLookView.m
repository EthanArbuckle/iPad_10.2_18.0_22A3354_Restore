@implementation HKSimulatedWatchNotificationQuickLookView

- (HKSimulatedWatchNotificationQuickLookView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKSimulatedWatchNotificationQuickLookView *v14;
  HKSimulatedWatchNotificationQuickLookView *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKSimulatedWatchNotificationQuickLookView;
  v14 = -[HKSimulatedWatchNotificationQuickLookView initWithFrame:](&v17, sel_initWithFrame_, 0.0, 0.0, 156.0, 195.0);
  v15 = v14;
  if (v14)
  {
    -[HKSimulatedWatchNotificationQuickLookView setIconImage:](v14, "setIconImage:", v10);
    -[HKSimulatedWatchNotificationQuickLookView setTitleLabelText:](v15, "setTitleLabelText:", v11);
    -[HKSimulatedWatchNotificationQuickLookView setDetailLabelText:](v15, "setDetailLabelText:", v12);
    -[HKSimulatedWatchNotificationQuickLookView setTintColor:](v15, "setTintColor:", v13);
    -[HKSimulatedWatchNotificationQuickLookView _setUpSubviews](v15, "_setUpSubviews");
    -[HKSimulatedWatchNotificationQuickLookView _layoutQuickLook](v15, "_layoutQuickLook");
  }

  return v15;
}

- (void)_setUpSubviews
{
  UIImageView *v3;
  UIImageView *quickLookIconView;
  UIView *v5;
  UIView *quickLookTitleContainer;
  UIView *v7;
  void *v8;
  UILabel *v9;
  UILabel *quickLookTitleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UIView *v15;
  UIView *quickLookSubtitleContainer;
  UIView *v17;
  void *v18;
  UILabel *v19;
  UILabel *quickLookSubtitleLabel;

  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  quickLookIconView = self->_quickLookIconView;
  self->_quickLookIconView = v3;

  -[UIImageView setImage:](self->_quickLookIconView, "setImage:", self->_iconImage);
  -[HKSimulatedWatchNotificationQuickLookView addSubview:](self, "addSubview:", self->_quickLookIconView);
  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  quickLookTitleContainer = self->_quickLookTitleContainer;
  self->_quickLookTitleContainer = v5;

  v7 = self->_quickLookTitleContainer;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[HKSimulatedWatchNotificationQuickLookView addSubview:](self, "addSubview:", self->_quickLookTitleContainer);
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  quickLookTitleLabel = self->_quickLookTitleLabel;
  self->_quickLookTitleLabel = v9;

  -[UILabel setMinimumScaleFactor:](self->_quickLookTitleLabel, "setMinimumScaleFactor:", 0.8);
  v11 = self->_quickLookTitleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[UILabel setTextAlignment:](self->_quickLookTitleLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_quickLookTitleLabel, "setLineBreakMode:", 4);
  v13 = self->_quickLookTitleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[UILabel setNumberOfLines:](self->_quickLookTitleLabel, "setNumberOfLines:", 2);
  -[UIView addSubview:](self->_quickLookTitleContainer, "addSubview:", self->_quickLookTitleLabel);
  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  quickLookSubtitleContainer = self->_quickLookSubtitleContainer;
  self->_quickLookSubtitleContainer = v15;

  v17 = self->_quickLookSubtitleContainer;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[HKSimulatedWatchNotificationQuickLookView addSubview:](self, "addSubview:", self->_quickLookSubtitleContainer);
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  quickLookSubtitleLabel = self->_quickLookSubtitleLabel;
  self->_quickLookSubtitleLabel = v19;

  -[UILabel setNumberOfLines:](self->_quickLookSubtitleLabel, "setNumberOfLines:", 1);
  -[UIView addSubview:](self->_quickLookSubtitleContainer, "addSubview:", self->_quickLookSubtitleLabel);
}

- (void)_layoutQuickLook
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  UILabel *quickLookSubtitleLabel;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  UIImageView *quickLookIconView;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _OWORD v32[3];
  CGRect v33;

  v3 = self->_titleLabelText;
  -[NSString localizedUppercaseString](self->_detailLabelText, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 19.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_quickLookTitleLabel, "setFont:", v5);
  -[UILabel setFont:](self->_quickLookSubtitleLabel, "setFont:", v6);
  -[UILabel setText:](self->_quickLookTitleLabel, "setText:", v3);
  -[UILabel sizeThatFits:](self->_quickLookTitleLabel, "sizeThatFits:", 156.0, 47.0);
  v31 = v7;
  v9 = v8;
  quickLookSubtitleLabel = self->_quickLookSubtitleLabel;
  if (v8 <= 25.0)
  {
    -[UILabel setNumberOfLines:](quickLookSubtitleLabel, "setNumberOfLines:", 2);
    v18 = objc_msgSend(v4, "length");
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "setLineSpacing:", 2.5);
    objc_msgSend(v20, "setAlignment:", 1);
    objc_msgSend(v20, "setLineBreakMode:", 0);
    LODWORD(v21) = 1.0;
    objc_msgSend(v20, "setHyphenationFactor:", v21);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], self->_tintColor, 0, v18);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v6, 0, v18);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v20, 0, v18);
    -[UILabel setAttributedText:](self->_quickLookSubtitleLabel, "setAttributedText:", v22);
    -[UILabel sizeThatFits:](self->_quickLookSubtitleLabel, "sizeThatFits:", 156.0, 37.5);
    v14 = v23;
    v13 = v24;

    v16 = 27.0;
    v15 = 69.5;
    v17 = 163.0;
  }
  else
  {
    -[UILabel setAttributedText:](quickLookSubtitleLabel, "setAttributedText:", 0);
    -[UILabel setLineBreakMode:](self->_quickLookSubtitleLabel, "setLineBreakMode:", 4);
    -[UILabel setText:](self->_quickLookSubtitleLabel, "setText:", v4);
    -[UILabel setTextColor:](self->_quickLookSubtitleLabel, "setTextColor:", self->_tintColor);
    -[UILabel sizeToFit](self->_quickLookSubtitleLabel, "sizeToFit");
    -[UILabel frame](self->_quickLookSubtitleLabel, "frame");
    v13 = v12;
    if (v11 <= 153.0)
      v14 = v11;
    else
      v14 = 153.0;
    v15 = 62.5;
    v16 = 25.5;
    v17 = 178.0;
  }
  quickLookIconView = self->_quickLookIconView;
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v32[0] = *MEMORY[0x1E0C9BAA8];
  v32[1] = v26;
  v32[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIImageView setTransform:](quickLookIconView, "setTransform:", v32);
  -[UIImageView setFrame:](self->_quickLookIconView, "setFrame:", 0.0, 0.0, 98.0, 98.0);
  -[UIImageView setCenter:](self->_quickLookIconView, "setCenter:", 78.0, v15);
  v27 = fmin(v31, 156.0);
  -[UILabel setFrame:](self->_quickLookTitleLabel, "setFrame:", 0.0, 0.0, v27, v9);
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_quickLookTitleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v29 = v16 - v28;
  -[UIImageView frame](self->_quickLookIconView, "frame");
  v30 = v29 + CGRectGetMaxY(v33);
  -[UILabel frame](self->_quickLookTitleLabel, "frame");
  -[UIView setFrame:](self->_quickLookTitleContainer, "setFrame:", 0.0, 0.0, v27);
  -[UIView setCenter:](self->_quickLookTitleContainer, "setCenter:", 78.0, v9 * 0.5 + v30);
  -[UILabel setFrame:](self->_quickLookSubtitleLabel, "setFrame:", 0.0, 0.0, v14, v13);
  -[UILabel frame](self->_quickLookSubtitleLabel, "frame");
  -[UIView setFrame:](self->_quickLookSubtitleContainer, "setFrame:", 0.0, 0.0, v14);
  -[UIView setCenter:](self->_quickLookSubtitleContainer, "setCenter:", 78.0, v17);

}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (NSString)titleLabelText
{
  return self->_titleLabelText;
}

- (void)setTitleLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelText, a3);
}

- (NSString)detailLabelText
{
  return self->_detailLabelText;
}

- (void)setDetailLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabelText, a3);
}

- (UIImageView)quickLookIconView
{
  return self->_quickLookIconView;
}

- (void)setQuickLookIconView:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookIconView, a3);
}

- (UILabel)quickLookTitleLabel
{
  return self->_quickLookTitleLabel;
}

- (void)setQuickLookTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookTitleLabel, a3);
}

- (UILabel)quickLookSubtitleLabel
{
  return self->_quickLookSubtitleLabel;
}

- (void)setQuickLookSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookSubtitleLabel, a3);
}

- (UIView)quickLookTitleContainer
{
  return self->_quickLookTitleContainer;
}

- (void)setQuickLookTitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookTitleContainer, a3);
}

- (UIView)quickLookSubtitleContainer
{
  return self->_quickLookSubtitleContainer;
}

- (void)setQuickLookSubtitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookSubtitleContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookSubtitleContainer, 0);
  objc_storeStrong((id *)&self->_quickLookTitleContainer, 0);
  objc_storeStrong((id *)&self->_quickLookSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_quickLookTitleLabel, 0);
  objc_storeStrong((id *)&self->_quickLookIconView, 0);
  objc_storeStrong((id *)&self->_detailLabelText, 0);
  objc_storeStrong((id *)&self->_titleLabelText, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
