@implementation CNUIColorRepository

+ (UIColor)transparentBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)contactCardStaticHeaderDefaultTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)quickActionViewDefaultPosterTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)contactCardStaticAvatarHeaderDefaultTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)contactCardStaticHeaderDefaultTaglineTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.75);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)contactStyleDefaultSeparatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
}

+ (UIColor)contactStyleWithInsetPlattersDefaultContactHeaderDropShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

+ (UIColor)contactStyleWithInsetPlattersDefaultContactHeaderBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

+ (UIColor)contactStyleDefaultTransportBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)contactStyleDefaultTransportBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
}

+ (UIColor)contactStyleDefaultTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)contactStyleDefaultTaglineTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.44, 1.0);
}

+ (UIColor)contactStyleDefaultSuggestedValueTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
}

+ (UIColor)contactStyleDefaultSuggestedLabelTextColor
{
  return 0;
}

+ (UIColor)contactStyleDefaultSelectedCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
}

+ (UIColor)contactStyleDefaultSearchCellBackgroundColor
{
  return 0;
}

+ (UIColor)contactStyleDefaultReadOnlyTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.6, 1.0);
}

+ (UIColor)contactStyleDefaultPlaceholderTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (UIColor)contactStyleDefaultNotesTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.784313725, 0.784313725, 0.784313738, 1.0);
}

+ (UIColor)contactStyleDefaultHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)contactStyleDefaultGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (UIColor)contactStyleDefaultDisabledTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)contactStyleDefaultBlueSelectionSecondaryTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 60.0, 60.0, 67.0, 0.6);
}

+ (UIColor)contactListEmergencyContactAddTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)contactsApplicationTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)contactStyleDefaultBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
}

+ (UIColor)contactCardPhotoEditButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)monogrammerBackgroundWhiteColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
}

+ (UIColor)monogrammerBackTextWhiteColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)contactListBannerFootnoteTextColorPrimary
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (UIColor)popoverBackgroundColor
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = popoverBackgroundColor_shouldUseGreenPopoverTestBackground;
  if (popoverBackgroundColor_shouldUseGreenPopoverTestBackground == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    popoverBackgroundColor_shouldUseGreenPopoverTestBackground = objc_msgSend(v4, "BOOLForKey:", CFSTR("ShouldUseGreenPopoverTestBackground"));

    v3 = popoverBackgroundColor_shouldUseGreenPopoverTestBackground;
  }
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return (UIColor *)v2;
}

+ (UIColor)siriTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)navigationListCellBackgroundColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)navigationListCellBackgroundExpandedColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondarySystemBackgroundColor");
}

+ (UIColor)navigationListCellBackgroundHighlightedColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_tertiarySystemBackgroundColor");
}

+ (UIColor)navigationListCellTitleTextColorRegular
{
  if (navigationListCellTitleTextColorRegular_cn_once_token_1 != -1)
    dispatch_once(&navigationListCellTitleTextColorRegular_cn_once_token_1, &__block_literal_global_43848);
  return (UIColor *)(id)navigationListCellTitleTextColorRegular_cn_once_object_1;
}

+ (UIColor)navigationListCellSubtitleTextColorRegular
{
  if (navigationListCellSubtitleTextColorRegular_cn_once_token_2 != -1)
    dispatch_once(&navigationListCellSubtitleTextColorRegular_cn_once_token_2, &__block_literal_global_3_43847);
  return (UIColor *)(id)navigationListCellSubtitleTextColorRegular_cn_once_object_2;
}

+ (UIColor)navigationListDetailCellSubtitleTextColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (UIColor)navigationListActionIconFillColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (UIColor)navigationListActionIconFillHighlightedColorRegular
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
}

+ (UIColor)navigationListDisclosureImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (UIColor)navigationListDisclosureImageHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
}

+ (UIColor)contactListBannerFootnoteTextColorSecondary
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)contactListMeLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
}

+ (UIColor)contactListEmergencyContactGlyphColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (UIColor)contactListContactCountTextColor
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
    objc_msgSend(a1, "contactStyleDefaultTextColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)contactListAddNewContactLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)contactPickerBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_6_43845);
}

+ (UIColor)contactCardDestructiveActionTitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
}

+ (UIColor)contactCardChevronImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (UIColor)contactCardLabeledBadgeBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
}

+ (UIColor)contactCardStarImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
}

+ (UIColor)contactCardBackgroundiPadOverwriteColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (UIColor)contactCardStaticIdentityBadgeGlyphColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (UIColor)contactCardStaticIdentityValidTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)contactCardStaticIdentityInvalidTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (UIColor)contactCardStaticAvatarHeaderDefaultDarkTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)contactCardStaticHeaderGeminiTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)contactCardStaticHeaderDefaultTaglineDarkTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)photoPickerBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (UIColor)photoPickerBackgroundShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
}

+ (UIColor)photoPickerHeaderSeparatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (UIColor)photoPickerSelectionBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (UIColor)photoPickerCaptureBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend((id)objc_opt_class(), "photoPickerCaptureLightBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v10[0] = v4;
  objc_msgSend((id)objc_opt_class(), "photoPickerCaptureDarkBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "_dynamicColorWithColorsByTraitCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v7;
}

+ (UIColor)photoPickerCaptureLightBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
}

+ (UIColor)photoPickerCaptureDarkBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.11, 0.11, 0.12, 1.0);
}

+ (UIColor)photoPickerCaptureCancelButtonTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)photoPickerCapturePromptLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (UIColor)photoPickerCropOverlayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.043, 0.043, 0.043, 0.73);
}

+ (UIColor)photoPickerAvatarBackgroundDefaultColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (UIColor)photoPickerSymbolImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)photoPickerSymbolImageBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)photoPickerTrapViewMessageTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)photoPickerActionButtonBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (UIColor)photoPickerActionButtonTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)photoPickerActionButtonDestructiveTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (UIColor)visualIdentityEditorBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (UIColor)visualIdentityEditorMonogramTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)visualIdentityEditorSegmentedControlNormalColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)visualIdentityEditorSegmentedControlDisabledColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (UIColor)visualIdentityEditorDividerColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
}

+ (UIColor)quickActionBackgroundColorRegular
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "_secondarySystemGroupedBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.75);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)quickActionBackgroundColorReducedTransparency
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (UIColor)quickActionBorderColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (UIColor)quickActionContentColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)quickActionContentColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)quickActionContentColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (UIColor)quickActionContentColorDisabledVibrant
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
}

+ (UIColor)quickActionContentColorDisabledPill
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
}

+ (UIColor)quickActionContentColorPlatterHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
}

+ (UIColor)quickActionContentColorPlatterUnhighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
}

+ (UIColor)quickActionContentColorPlatterHitActionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
}

+ (UIColor)quickActionButtonTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
}

+ (UIColor)quickActionViewRoundedRectBackgroundColor
{
  void *v2;
  int v3;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runningInContactsAppOniPad");

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)quickActionViewRoundedRectBorderColor
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runningInContactsAppOniPad");

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.08;
  if (v3)
    v6 = 0.01;
  objc_msgSend(v4, "colorWithAlphaComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v7;
}

+ (UIColor)quickActionViewPosterBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIColor)orbActionCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.05);
}

+ (UIColor)orbCardBackgroundDimmedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
}

+ (UIColor)orbCardBackgroundShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)contactStyleLightStyleHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)contactCardLabeledBadgeBackgroundDynamicColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__CNUIColorRepository_contactCardLabeledBadgeBackgroundDynamicColor__block_invoke;
  v3[3] = &__block_descriptor_40_e36___UIColor_16__0__UITraitCollection_8l;
  v3[4] = a1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)contactCardRecentBadgeTextDynamicColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CNUIColorRepository_contactCardRecentBadgeTextDynamicColor__block_invoke;
  v3[3] = &__block_descriptor_40_e36___UIColor_16__0__UITraitCollection_8l;
  v3[4] = a1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)contactCardRecentBadgeTextColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("contactCardRecentBadgeTextColor"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

+ (UIColor)contactStyleDefaultSectionIndexBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)contactStyleDefaultContactHeaderBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
}

+ (UIColor)contactStyleDefaultContactHeaderDropShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
}

+ (UIColor)contactStyleDefaultHeaderBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.95, 1.0);
}

+ (UIColor)contactStyleDefaultSectionBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_secondarySystemBackgroundColor");
}

+ (UIColor)monogrammerBackgroundStandardGrayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)monogrammerTextStandardGrayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)monogrammerBackgroundGrayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)monogrammerTextGrayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)monogrammerBackgroundLightColor
{
  return (UIColor *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithWhite:alpha:", 0.0, 0.300000012);
}

+ (UIColor)monogrammerBackgroundDarkColor
{
  return (UIColor *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithWhite:alpha:", 1.0, 0.649999976);
}

+ (UIColor)monogrammerBackgroundFlatDarkColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (UIColor)faceTimeLightSeparatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.521568627, 0.521568627, 0.521568627, 1.0);
}

+ (UIColor)faceTimeSeparatorColorWithBlurUnsupported
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.501960784, 0.501960784, 0.501960784, 0.800000012);
}

+ (UIColor)faceTimeGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
}

+ (UIColor)catalystNameTextFieldsBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
}

+ (UIColor)catalystAudienceDetailLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)groupsOutlineBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
}

+ (UIColor)groupsInsetBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

+ (UIColor)groupsMailActionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)groupsTextActionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

+ (UIColor)groupsDisabledTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (UIColor)groupHeaderSubTitleImageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (UIColor)groupHeaderSubTitleLabelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)carPlayContactCardLabeledBadgeBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (UIColor)carPlayContactCardRecentBadgeTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
}

+ (UIColor)carPlayTableViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
}

+ (UIColor)carPlayTableViewCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableCellPlainBackgroundColor");
}

+ (UIColor)carPlayTableViewCellBackgroundHighlightedColor
{
  return 0;
}

+ (UIColor)carPlayTableViewCellTitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayTableViewCellTitleTextHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (UIColor)carPlayTableViewCellSubtitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemSecondaryColor");
}

+ (UIColor)carPlayTableViewCellSubtitleTextHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusSecondaryColor");
}

+ (UIColor)carPlayTableViewGlyphColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayTableViewGlyphHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (UIColor)carPlayContactInfoViewPrimaryLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayContactInfoViewSecondaryLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayNavigationBarContactNameTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayQuickActionButtonTitleTextColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayQuickActionButtonTitleTextColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (UIColor)carPlayQuickActionButtonBackgroundStrokeColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (UIColor)carPlayQuickActionButtonBackgroundStrokeColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)carPlayQuickActionButtonBackgroundStrokeColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)carPlayQuickActionButtonBackgroundFillColorDisabled
{
  return 0;
}

+ (UIColor)carPlayQuickActionButtonBackgroundFillColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (UIColor)carPlayQuickActionButtonBackgroundFillColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
}

+ (UIColor)carPlayQuickActionButtonGlyphColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (UIColor)carPlayQuickActionButtonGlyphColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayQuickActionButtonGlyphColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (UIColor)carPlayTransportButtonBackgroundStrokeColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)carPlayTransportButtonBackgroundStrokeColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayTransportButtonBackgroundStrokeColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)carPlayTransportButtonBackgroundFillColorDisabled
{
  return 0;
}

+ (UIColor)carPlayTransportButtonBackgroundFillColorEnabled
{
  return 0;
}

+ (UIColor)carPlayTransportButtonBackgroundFillColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
}

+ (UIColor)carPlayTransportButtonGlyphColorDisabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayTransportButtonGlyphColorEnabled
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
}

+ (UIColor)carPlayTransportButtonGlyphColorSelected
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (UIColor)carPlaySiriButtonBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemQuaternaryColor");
}

+ (UIColor)carPlaySiriButtonBackgroundHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
}

+ (UIColor)carPlaySiriButtonTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
}

+ (UIColor)carPlaySiriButtonTextHighlightedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
}

+ (UIColor)contactSuggestionsBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (UIColor)contactSuggestionsTextLabelColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (UIColor)contactSuggestionsCheckmarkBackgroundViewColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (UIColor)contactSuggestionsCheckmarkBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (UIColor)sharedProfileBannerSubtitleDefaultColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (UIColor)sharedProfileBannerSubtitleUpdatedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (UIColor)sharedProfileBannerSubtitleRevertedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

id __61__CNUIColorRepository_contactCardRecentBadgeTextDynamicColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "userInterfaceIdiom");
  v4 = *(void **)(a1 + 32);
  if (v3 == 3)
    objc_msgSend(v4, "carPlayContactCardRecentBadgeTextColor");
  else
    objc_msgSend(v4, "contactCardRecentBadgeTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__CNUIColorRepository_contactCardLabeledBadgeBackgroundDynamicColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "userInterfaceIdiom");
  v4 = *(void **)(a1 + 32);
  if (v3 == 3)
    objc_msgSend(v4, "carPlayContactCardLabeledBadgeBackgroundColor");
  else
    objc_msgSend(v4, "contactCardLabeledBadgeBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __51__CNUIColorRepository_contactPickerBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __65__CNUIColorRepository_navigationListCellSubtitleTextColorRegular__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)navigationListCellSubtitleTextColorRegular_cn_once_object_2;
  navigationListCellSubtitleTextColorRegular_cn_once_object_2 = v0;

}

void __62__CNUIColorRepository_navigationListCellTitleTextColorRegular__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)navigationListCellTitleTextColorRegular_cn_once_object_1;
  navigationListCellTitleTextColorRegular_cn_once_object_1 = v0;

}

@end
