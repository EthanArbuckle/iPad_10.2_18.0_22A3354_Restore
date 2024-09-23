@implementation CNSharedProfileBannerStyle

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (UIButtonConfiguration)actionButtonConfiguration
{
  return self->_actionButtonConfiguration;
}

- (void)setActionButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonConfiguration, a3);
}

- (UIImageSymbolConfiguration)xmarkButtonColorConfiguration
{
  return self->_xmarkButtonColorConfiguration;
}

- (void)setXmarkButtonColorConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_xmarkButtonColorConfiguration, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (double)leadingTrailingInset
{
  return self->_leadingTrailingInset;
}

- (void)setLeadingTrailingInset:(double)a3
{
  self->_leadingTrailingInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_xmarkButtonColorConfiguration, 0);
  objc_storeStrong((id *)&self->_actionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
}

+ (id)defaultStyle
{
  CNSharedProfileBannerStyle *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(CNSharedProfileBannerStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setTitleTextColor:](v3, "setTitleTextColor:", v4);

  +[CNUIColorRepository sharedProfileBannerSubtitleDefaultColor](CNUIColorRepository, "sharedProfileBannerSubtitleDefaultColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setSubtitleTextColor:](v3, "setSubtitleTextColor:", v5);

  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setTitleFont:](v3, "setTitleFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setSubtitleFont:](v3, "setSubtitleFont:", v8);

  objc_msgSend(a1, "defaultActionButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setActionButtonConfiguration:](v3, "setActionButtonConfiguration:", v9);

  v10 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setXmarkButtonColorConfiguration:](v3, "setXmarkButtonColorConfiguration:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerStyle setBackgroundColor:](v3, "setBackgroundColor:", v13);

  -[CNSharedProfileBannerStyle setLeadingTrailingInset:](v3, "setLeadingTrailingInset:", 0.0);
  return v3;
}

+ (id)defaultActionButtonConfiguration
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonSize:", 1);
  objc_msgSend(v2, "setTitleTextAttributesTransformer:", &__block_literal_global_39220);
  return v2;
}

id __62__CNSharedProfileBannerStyle_defaultActionButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFontRepository boldFontWithFontDescriptor:](CNUIFontRepository, "boldFontWithFontDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v4);

  return v3;
}

@end
