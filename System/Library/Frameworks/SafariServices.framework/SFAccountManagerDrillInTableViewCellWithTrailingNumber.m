@implementation SFAccountManagerDrillInTableViewCellWithTrailingNumber

+ (id)_numberFormatter
{
  if (_numberFormatter_onceToken != -1)
    dispatch_once(&_numberFormatter_onceToken, &__block_literal_global_68);
  return (id)_numberFormatter_numberFormatter;
}

uint64_t __74__SFAccountManagerDrillInTableViewCellWithTrailingNumber__numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_numberFormatter_numberFormatter;
  _numberFormatter_numberFormatter = (uint64_t)v0;

  objc_msgSend((id)_numberFormatter_numberFormatter, "setFormatterBehavior:", 1040);
  return objc_msgSend((id)_numberFormatter_numberFormatter, "setNumberStyle:", 1);
}

- (SFAccountManagerDrillInTableViewCellWithTrailingNumber)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v4;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v5;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAccountManagerDrillInTableViewCellWithTrailingNumber;
  v4 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setAccessoryType:](v4, "setAccessoryType:", 1);
    v6 = v5;
  }

  return v5;
}

- (void)configureForSecurityRecommendationsWithNumberOfRecommendations:(unint64_t)a3 subtitleText:(id)a4 warningStyle:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0DC39A8];
  v9 = a4;
  objc_msgSend(v8, "subtitleCellConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "setHyphenationFactor:", v12);
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0DC32C0];
  v39[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v15);
  objc_msgSend(v10, "setAttributedText:", v16);

  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(v10, "setSecondaryText:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v19);

  +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "secondaryTextProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

  objc_msgSend(v10, "secondaryTextProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v10, "secondaryTextProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMinimumScaleFactor:", 0.7);

  objc_msgSend(v10, "secondaryTextProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLineBreakMode:", 0);

  objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setContentConfiguration:](self, "setContentConfiguration:", v10);
  if (!a5)
  {
    -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeText:](self, "_setBadgeText:", 0);
    -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Passwords List Security Recommendations Cell"));
    goto LABEL_6;
  }
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringWithFormat:", CFSTR("%@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeText:](self, "_setBadgeText:", v28);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeColor:](self, "_setBadgeColor:", v29);

  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeFont:](self, "_setBadgeFont:", v30);

  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Passwords List Security Recommendations Cell"));
  if ((unint64_t)(a5 - 1) < 2)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.filled.trianglebadge.exclamationmark"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a5 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.filled.badge.checkmark"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }
LABEL_7:
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __147__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureForSecurityRecommendationsWithNumberOfRecommendations_subtitleText_warningStyle___block_invoke;
  v35[3] = &unk_1E4AC7820;
  v36 = v31;
  v37 = v32;
  v33 = v32;
  v34 = v31;
  -[UITableViewCell sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:](self, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", v35);

}

id __147__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureForSecurityRecommendationsWithNumberOfRecommendations_subtitleText_warningStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resolvedColorWithTraitCollection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v3, v4, v6, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)configureCellWithGroup:(id)a3 numberOfSavedAccounts:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "displayName");
  else
    _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  +[_SFAccountManagerAppearanceValues edgeInsetsForTopLevelCells](_SFAccountManagerAppearanceValues, "edgeInsetsForTopLevelCells");
  objc_msgSend(v7, "setDirectionalLayoutMargins:");
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setContentConfiguration:](self, "setContentConfiguration:", v7);
  objc_msgSend((id)objc_opt_class(), "_numberFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeText:](self, "_setBadgeText:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeColor:](self, "_setBadgeColor:", v12);

  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeFont:](self, "_setBadgeFont:", v13);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureCellWithGroup_numberOfSavedAccounts___block_invoke;
  v15[3] = &unk_1E4AC7848;
  v16 = v6;
  v14 = v6;
  -[UITableViewCell sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:](self, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", v15);

}

id __103__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureCellWithGroup_numberOfSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v2 = (void *)MEMORY[0x1E0DC3870];
  if (*(_QWORD *)(a1 + 32))
    v3 = CFSTR("person.2.fill");
  else
    v3 = CFSTR("person.fill");
  v4 = a2;
  objc_msgSend(v2, "systemImageNamed:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v5, v7, v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)configureGroupInvitationsDrillInWithNumberOfInvitations:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v5);

  +[_SFAccountManagerAppearanceValues edgeInsetsForTopLevelCells](_SFAccountManagerAppearanceValues, "edgeInsetsForTopLevelCells");
  objc_msgSend(v11, "setDirectionalLayoutMargins:");
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setContentConfiguration:](self, "setContentConfiguration:", v11);
  objc_msgSend((id)objc_opt_class(), "_numberFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeText:](self, "_setBadgeText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeColor:](self, "_setBadgeColor:", v9);

  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeFont:](self, "_setBadgeFont:", v10);

  -[UITableViewCell sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:](self, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", &__block_literal_global_30);
}

id __114__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureGroupInvitationsDrillInWithNumberOfInvitations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = a2;
  objc_msgSend(v2, "systemImageNamed:", CFSTR("tray.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v4, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)configureForRecentlyDeletedWithNumberOfRecentlyDeletedAccounts:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v5);

  +[_SFAccountManagerAppearanceValues edgeInsetsForTopLevelCells](_SFAccountManagerAppearanceValues, "edgeInsetsForTopLevelCells");
  objc_msgSend(v11, "setDirectionalLayoutMargins:");
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber setContentConfiguration:](self, "setContentConfiguration:", v11);
  objc_msgSend((id)objc_opt_class(), "_numberFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeText:](self, "_setBadgeText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeColor:](self, "_setBadgeColor:", v9);

  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountManagerDrillInTableViewCellWithTrailingNumber _setBadgeFont:](self, "_setBadgeFont:", v10);

  -[UITableViewCell sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:](self, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", &__block_literal_global_35_0);
}

id __121__SFAccountManagerDrillInTableViewCellWithTrailingNumber_configureForRecentlyDeletedWithNumberOfRecentlyDeletedAccounts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = a2;
  objc_msgSend(v2, "systemImageNamed:", CFSTR("trash.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v4, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
