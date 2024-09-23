@implementation SFCrashBanner

- (SFCrashBanner)initWithFrame:(CGRect)a3
{
  SFCrashBanner *v3;
  SFCrashBanner *v4;
  void *v5;
  uint64_t v6;
  NSString *bannerText;
  uint64_t v8;
  NSString *manuallyWrappedBannerText;
  SFThemeColorEffectView *v10;
  void *v11;
  uint64_t v12;
  SFThemeColorEffectView *backdrop;
  UIButton *v14;
  UIButton *closeButton;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  UIVisualEffectView *contentEffectView;
  void *v22;
  UILabel *v23;
  UILabel *label;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SFCrashBanner *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)SFCrashBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFCrashBanner setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[SFCrashBanner layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    _WBSLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();
    bannerText = v4->_bannerText;
    v4->_bannerText = (NSString *)v6;

    _WBSLocalizedString();
    v8 = objc_claimAutoreleasedReturnValue();
    manuallyWrappedBannerText = v4->_manuallyWrappedBannerText;
    v4->_manuallyWrappedBannerText = (NSString *)v8;

    v4->_messageType = 0;
    v10 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SFThemeColorEffectView initWithEffect:](v10, "initWithEffect:", v11);
    backdrop = v4->_backdrop;
    v4->_backdrop = (SFThemeColorEffectView *)v12;

    -[SFCrashBanner bounds](v4, "bounds");
    -[SFThemeColorEffectView setFrame:](v4->_backdrop, "setFrame:");
    -[SFThemeColorEffectView setAutoresizingMask:](v4->_backdrop, "setAutoresizingMask:", 18);
    -[SFCrashBanner addSubview:](v4, "addSubview:", v4->_backdrop);
    v14 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    closeButton = v4->_closeButton;
    v4->_closeButton = v14;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3888];
    v17 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v18);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v4->_closeButton, "setImage:forState:", v45, 0);
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v4->_closeButton, "setPreferredSymbolConfiguration:forImageInState:", v44, 0);
    v19 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[SFCrashBanner bounds](v4, "bounds");
    v20 = objc_msgSend(v19, "initWithFrame:");
    contentEffectView = v4->_contentEffectView;
    v4->_contentEffectView = (UIVisualEffectView *)v20;

    -[UIVisualEffectView setAutoresizingMask:](v4->_contentEffectView, "setAutoresizingMask:", 18);
    -[SFCrashBanner addSubview:](v4, "addSubview:", v4->_contentEffectView);
    -[UIVisualEffectView contentView](v4->_contentEffectView, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_closeButton);

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v23;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v25);

    -[UILabel setLineBreakMode:](v4->_label, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[UIVisualEffectView contentView](v4->_contentEffectView, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v4->_label);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v38 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerYAnchor](v4->_closeButton, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCrashBanner centerYAnchor](v4, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v41;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCrashBanner centerYAnchor](v4, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v27;
    -[SFCrashBanner safeAreaLayoutGuide](v4, "safeAreaLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4->_closeButton, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -8.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v31;
    -[UIButton trailingAnchor](v4->_closeButton, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -2.5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v35);

    v36 = v4;
  }

  return v4;
}

- (void)themeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *closeButton;
  void *v13;
  void *v14;
  id v15;

  -[SFPinnableBanner theme](self, "theme");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "backdropIsDark") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v3);
  objc_msgSend(v15, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCrashBanner _setLocalOverrideTraitCollection:](self, "_setLocalOverrideTraitCollection:", v4);

  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v15);
  if (v15)
  {
    v5 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectForBlurEffect:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_contentEffectView, "setEffect:", v7);

  }
  else
  {
    v8 = objc_msgSend(0, "backdropIsTinted");
    v9 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(0, "backdropEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v9, "effectForBlurEffect:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_contentEffectView, "setEffect:", v11);

      closeButton = self->_closeButton;
      v13 = v3;
    }
    else
    {
      objc_msgSend(v9, "effectForBlurEffect:style:", v10, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_contentEffectView, "setEffect:", v14);

      closeButton = self->_closeButton;
      v13 = 0;
    }
    -[UIButton setTintColor:](closeButton, "setTintColor:", v13);
  }

}

- (NSString)backdropGroupName
{
  return -[SFThemeColorEffectView _groupName](self->_backdrop, "_groupName");
}

- (void)setBackdropGroupName:(id)a3
{
  -[SFThemeColorEffectView _setGroupName:](self->_backdrop, "_setGroupName:", a3);
}

- (BOOL)_shouldUseManuallyWrappedCrashMessageForWidth:(double)a3
{
  id v5;
  NSString *bannerText;
  void *v7;
  void *v8;
  const __CFAttributedString *v9;
  const __CTTypesetter *v10;
  unint64_t v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  bannerText = self->_bannerText;
  v13 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const __CFAttributedString *)objc_msgSend(v5, "initWithString:attributes:", bannerText, v8);

  v10 = CTTypesetterCreateWithAttributedString(v9);
  v11 = CTTypesetterSuggestLineBreak(v10, 0, a3);
  CFRelease(v10);
  LOBYTE(v10) = v11 < -[__CFAttributedString length](v9, "length");

  return (char)v10;
}

- (CGSize)_labelLayoutSizeForWidth:(double)a3
{
  CGSize *p_cachedLabelLayoutSize;
  double width;
  double v6;
  double v7;
  NSString **p_bannerText;
  double v9;
  double height;
  double v11;
  CGSize result;

  p_cachedLabelLayoutSize = &self->_cachedLabelLayoutSize;
  width = self->_cachedLabelLayoutSize.width;
  if (width == a3)
  {
    height = self->_cachedLabelLayoutSize.height;
  }
  else
  {
    v6 = a3 + -16.0;
    -[UIButton bounds](self->_closeButton, "bounds");
    width = v6 - (v7 + 2.5);
    if (!-[SFCrashBanner _shouldUseManuallyWrappedCrashMessageForWidth:](self, "_shouldUseManuallyWrappedCrashMessageForWidth:", width)|| (p_bannerText = &self->_manuallyWrappedBannerText, !-[NSString length](self->_manuallyWrappedBannerText, "length")))
    {
      p_bannerText = &self->_bannerText;
    }
    -[UILabel setText:](self->_label, "setText:", *p_bannerText);
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, 1.79769313e308);
    height = v9 + 18.0;
    p_cachedLabelLayoutSize->width = width;
    p_cachedLabelLayoutSize->height = height;
  }
  v11 = width;
  result.height = height;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCrashBanner;
  -[SFCrashBanner layoutSubviews](&v6, sel_layoutSubviews);
  -[SFPinnableBanner theme](self, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "backdropIsDark"))
  {
    objc_msgSend(v3, "separatorColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }
  -[SFPinnableBanner setShowsTopSeparator:](self, "setShowsTopSeparator:", v5);
  -[SFPinnableBanner setShowsBottomSeparator:](self, "setShowsBottomSeparator:", v5 ^ 1);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[SFCrashBanner _labelLayoutSizeForWidth:](self, "_labelLayoutSizeForWidth:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setBannerText:(id)a3 manuallyWrappedBannerText:(id)a4
{
  id v6;
  NSString *v7;
  NSString *bannerText;
  NSString *v9;
  NSString *manuallyWrappedBannerText;

  v6 = a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  bannerText = self->_bannerText;
  self->_bannerText = v7;

  v9 = (NSString *)objc_msgSend(v6, "copy");
  manuallyWrappedBannerText = self->_manuallyWrappedBannerText;
  self->_manuallyWrappedBannerText = v9;

  -[SFCrashBanner setNeedsLayout](self, "setNeedsLayout");
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (NSString)manuallyWrappedBannerText
{
  return self->_manuallyWrappedBannerText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manuallyWrappedBannerText, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
