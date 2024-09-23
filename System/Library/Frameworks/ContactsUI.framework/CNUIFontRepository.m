@implementation CNUIFontRepository

+ (id)fontWithBoldWeightStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (UIFont)contactCardStaticHeaderDefaultTaglineFont
{
  return (UIFont *)objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4AB8]);
}

+ (UIFont)contactCardStaticHeaderDefaultNameFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

+ (UIFont)contactStyleDefaultBoldTextFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "contactStyleDefaultTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "contactStyleDefaultTextFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v6, "fontWithDescriptor:size:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v8;
}

+ (UIFont)contactStyleDefaultTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)contactListBannerTitleFontPrimary
{
  return (UIFont *)objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4B60]);
}

+ (UIFont)contactListBannerFootnoteFontPrimary
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

+ (UIFont)groupsAllButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
}

+ (UIFont)navigationListCellTitleFontRegular
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)navigationListCellSubtitleFontRegular
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)navigationListDetailCellTitleFontRegular
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)navigationListDetailCellSubtitleFontRegular
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

+ (UIFont)contactListBannerFootnoteFontSecondary
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)contactListContactCountFont
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 8);

  if (v5)
    objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4A88]);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)contactListDuplicateCountFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

+ (UIFont)contactStyleDefaultItalicTextFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "contactStyleDefaultTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "contactStyleDefaultTextFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v6, "fontWithDescriptor:size:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v8;
}

+ (UIFont)contactCardRecentBadgeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)contactCardWarningHeaderLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)contactCardStaticHeaderNicknameTaglineFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "contactCardStaticHeaderDefaultTaglineFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v5;
}

+ (UIFont)contactCardPhotoPickerCaptionFont
{
  return (UIFont *)objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)contactCardPhotoPickerActionButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
}

+ (UIFont)groupHeaderTitleFont
{
  return (UIFont *)objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4B50]);
}

+ (UIFont)groupHeaderWrappedTitleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B58]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 32770);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

+ (UIFont)groupHeaderSubTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

+ (UIFont)groupHeaderActionButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

+ (UIFont)groupHeaderActionButtonWrappedFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

+ (UIFont)visualIdentityPickerHeaderTitleFont
{
  return (UIFont *)objc_msgSend(a1, "fontWithBoldWeightStyle:", *MEMORY[0x1E0DC4AE8]);
}

+ (UIFont)visualIdentityPickerHeaderPlaceholderFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AE8]);
}

+ (UIFont)visualIdentityEditorTextFont
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC1448];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 120.0, *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x1E0CA82E8];
  v12[0] = v6;
  v12[1] = &unk_1E20D2D48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v9;
}

+ (UIFont)visualIdentityEditorSegmentedControlFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
}

+ (UIFont)catalystNameTextFieldsFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)catalystLabelsFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (UIFont)catalystAudienceDetailsLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

+ (UIFont)carPlayTableViewCellTitleFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithMediumWeightStyle:", *MEMORY[0x1E0DC4A90]);
}

+ (UIFont)carPlayTableViewCellSubtitleFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)carPlayContactInfoViewPrimaryLabelFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithBoldWeightStyle:", *MEMORY[0x1E0DC4B58]);
}

+ (UIFont)carPlayContactInfoViewSecondaryLabelFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)carPlayQuickActionButtonTitleFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)carPlayQuickActionButtonTitleFontBold
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithBoldWeightStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (UIFont)carPlayNavigationBarContactNameFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithMediumWeightStyle:", *MEMORY[0x1E0DC4A90]);
}

+ (UIFont)carPlaySymbolImageFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithMediumWeightStyle:", *MEMORY[0x1E0DC4A90]);
}

+ (UIFont)carPlayNoContentViewTitleFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithStyle:", *MEMORY[0x1E0DC4B50]);
}

+ (UIFont)carPlayNoContentViewSiriButtonFont
{
  return (UIFont *)objc_msgSend(a1, "carPlayFontWithBoldWeightStyle:", *MEMORY[0x1E0DC4A90]);
}

+ (id)boldFontWithFontDescriptor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)carPlayFontWithStyle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a3;
  objc_msgSend(v4, "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)carPlayFontWithMediumWeightStyle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a3;
  objc_msgSend(v4, "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)carPlayFontWithBoldWeightStyle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a3;
  objc_msgSend(v4, "_carScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (UIFont)contactSuggestionsHeaderTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
}

+ (UIFont)contactSuggestionsNameFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], 0);
}

@end
