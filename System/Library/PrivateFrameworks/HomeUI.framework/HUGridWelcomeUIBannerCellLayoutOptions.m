@implementation HUGridWelcomeUIBannerCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUGridWelcomeUIBannerCellLayoutOptions;
  objc_msgSendSuper2(&v14, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB5C0], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB588], 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v6);

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 0x8000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterViewLabelFont:", v7);

  objc_msgSend(v4, "setVerticalSpacingForLineView:", 48.0);
  v15[0] = &unk_1E7041A10;
  v15[1] = &unk_1E70419F8;
  v16[0] = &unk_1E70438E8;
  v16[1] = &unk_1E70438E8;
  v15[2] = &unk_1E7041A28;
  v15[3] = &unk_1E7041A88;
  v16[2] = &unk_1E70438E8;
  v16[3] = &unk_1E7043818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingInset:", HUConstantForCellSizeSubclass(a3, v8));

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterLabelColor:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleLabelColor:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionLabelColor:", v11);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContinueButtonColor:", v12);

  return v4;
}

- (void)setContinueButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUGridWelcomeUIBannerCellLayoutOptions;
  v4 = -[HUGridBannerCellLayoutOptions copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[HUGridWelcomeUIBannerCellLayoutOptions footerLabelColor](self, "footerLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterLabelColor:", v5);

  -[HUGridWelcomeUIBannerCellLayoutOptions titleLabelColor](self, "titleLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleLabelColor:", v6);

  -[HUGridWelcomeUIBannerCellLayoutOptions descriptionLabelColor](self, "descriptionLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionLabelColor:", v7);

  return v4;
}

- (void)setTitleLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelColor, a3);
}

- (void)setFooterLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerLabelColor, a3);
}

- (void)setDescriptionLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabelColor, a3);
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (UIColor)footerLabelColor
{
  return self->_footerLabelColor;
}

- (UIColor)descriptionLabelColor
{
  return self->_descriptionLabelColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtonColor, 0);
  objc_storeStrong((id *)&self->_footerLabelColor, 0);
  objc_storeStrong((id *)&self->_descriptionLabelColor, 0);
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
}

- (UIColor)continueButtonColor
{
  return self->_continueButtonColor;
}

@end
