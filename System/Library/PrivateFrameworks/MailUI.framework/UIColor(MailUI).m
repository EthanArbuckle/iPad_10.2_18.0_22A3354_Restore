@implementation UIColor(MailUI)

+ (id)mailMailboxPickerBackgroundColorForTraitCollection:()MailUI
{
  if (objc_msgSend(a3, "mf_usePrimarySidebarStyling"))
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)mailDockViewDarkBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
}

+ (uint64_t)mailSplitViewBorderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
}

+ (uint64_t)mailSplitViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)mailMessageListBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
}

+ (id)_mui_mailUIBundleColorNamed:()MailUI
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mui_MailUIBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)mailFlaggedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
}

+ (uint64_t)mailFlaggedColorRed
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (uint64_t)mailFlaggedColorIncreasedContrastRed
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailIncreasedContrastRed"));
}

+ (uint64_t)mailFlaggedColorOrange
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
}

+ (uint64_t)mailFlaggedColorYellow
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

+ (uint64_t)mailFlaggedColorGreen
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

+ (uint64_t)mailFlaggedColorTeal
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
}

+ (uint64_t)mailFlaggedColorIndigo
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
}

+ (uint64_t)mailFlaggedColorGray
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (uint64_t)mailDestructiveActionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (uint64_t)mailDestructiveActionSwipeColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailDestructiveActionSwipeColor"));
}

+ (uint64_t)mailArchiveActionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
}

+ (uint64_t)mailReadLaterActionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
}

+ (uint64_t)mailTransparentLightGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)mailDarkGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailDarkGrayColor"));
}

+ (uint64_t)mailMoreButtonGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailMoreButtonGrayColor"));
}

+ (uint64_t)mailRemoveReminderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

+ (uint64_t)mailRemoveFollowUpColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

+ (uint64_t)mailRemoveTimeSensitiveColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
}

+ (uint64_t)mailAppBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

+ (uint64_t)mailSystemLightGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailSystemLightGrayColor"));
}

+ (uint64_t)mailSecondaryLabelDarkColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_36);
}

+ (uint64_t)mailVibrantDarkColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailVibrantDarkColor"));
}

+ (uint64_t)mailVibrantLightColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailVibrantLightColor"));
}

+ (uint64_t)mailAccountCellTitleColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailAccountCellTitleColor"));
}

+ (uint64_t)mailPreviousDraftPickerHeaderTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailPreviousDraftPickerHeaderTextColor"));
}

+ (uint64_t)mailSearchImageBorderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
}

+ (uint64_t)mailConversationViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)mailConversationViewExpandedCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailConversationViewCellBackgroundColor"));
}

+ (uint64_t)mailConversationViewFooterBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewExpandedCellBackgroundColor");
}

+ (uint64_t)mailConversationViewCollapsedCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewExpandedCellBackgroundColor");
}

+ (id)mailConversationViewCollapsedCellHighlightedBackgroundColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewExpandedCellBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.75);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mailConversationViewCollapsedCellLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailConversationViewCollapsedCellLabelColor"));
}

+ (uint64_t)mailConversationViewCollapsedCellSubjectLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailConversationViewFindOverlayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.101960786, 0.101960786, 0.101960786, 0.25);
}

+ (uint64_t)mailHeaderSeparatorLayerColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (uint64_t)mailTransferConversationViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
}

+ (uint64_t)mailDockViewLightBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSystemLightGrayColor");
}

+ (uint64_t)mailDockedPlaceholderViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (id)mailDockViewShadowGradientColors
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)mailDockViewShadowGradientColorLocations
{
  return &unk_1E9A017F0;
}

+ (uint64_t)mailTiltedTabCloseButtonTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailExpandedConversationViewCellDateLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (uint64_t)mailTransferStackViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

+ (uint64_t)mailMessageListPrimarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailMessageListPrimarySelectionColor"));
}

+ (uint64_t)mailMessageListSecondarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailMessageListSecondarySelectionColor"));
}

+ (uint64_t)mailMessageListTertiarySelectionColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailMessageListTertiarySelectionColor"));
}

+ (uint64_t)mailMessageListSelectedSummaryColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSecondaryLabelDarkColor");
}

+ (uint64_t)mailMessageListSelectedAnnotationColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSecondaryLabelDarkColor");
}

+ (uint64_t)mailMessageListSelectedStatusIndicatorColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSecondaryLabelDarkColor");
}

+ (uint64_t)mailMessageListSelectedRecipientColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSecondaryLabelDarkColor");
}

+ (uint64_t)mailMessageListSummarySymbolColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

+ (uint64_t)mailMessageListSelectedSummarySymbolColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mailSecondaryLabelDarkColor");
}

+ (id)mailFocusBannerTitleColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mailMessageListHighlightColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_mui_mailUIBundleColorNamed:", CFSTR("mailSnippetHighlightColor"));
}

+ (id)mailCellSelectionStateColorForInterfaceLevel:()MailUI
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)mailMessageListHighImpactColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

- (BOOL)mf_isTranslucent
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = -1;
  v3 = -1;
  v4 = -1;
  v2 = NAN;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return v2 != 1.0;
}

+ (uint64_t)mailTodayFilterColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)mailAttachmentsFilterColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)mailUpcomingReminderFilterColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)mailVIPFilterColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)mf_colorFromColor:()MailUI toColor:progress:
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v7 = a5;
  v22 = NAN;
  v20 = NAN;
  v21 = NAN;
  v18 = -1;
  v19 = NAN;
  v16 = -1;
  v17 = -1;
  v15 = NAN;
  v8 = objc_retainAutorelease(a4);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v8, "CGColor")) == 2)
  {
    objc_msgSend(v8, "getWhite:alpha:", &v22, &v19);

    v20 = v22;
    v21 = v22;
  }
  else
  {
    objc_msgSend(v8, "getRed:green:blue:alpha:", &v22, &v20, &v21, &v19);

  }
  v9 = objc_retainAutorelease(v7);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v9, "CGColor")) == 2)
  {
    objc_msgSend(v9, "getWhite:alpha:", &v18, &v15);
    v10 = *(double *)&v18;
    v16 = v18;
    v17 = v18;
    v11 = *(double *)&v18;
    v12 = *(double *)&v18;
  }
  else
  {
    objc_msgSend(v9, "getRed:green:blue:alpha:", &v18, &v16, &v17, &v15);
    v10 = *(double *)&v17;
    v12 = *(double *)&v18;
    v11 = *(double *)&v16;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v22 + a1 * (v12 - v22), v20 + a1 * (v11 - v20), v21 + a1 * (v10 - v21), v19 + a1 * (v15 - v19), *(_QWORD *)&v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)mf_colorFromFlagColor:()MailUI
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorRed", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorOrange", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorYellow", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorGreen", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorTeal", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorIndigo", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "mailFlaggedColorGray", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (uint64_t)tableCellSelectedColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
}

+ (uint64_t)tableCellEligibleColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)tableCellIneligibleColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

@end
