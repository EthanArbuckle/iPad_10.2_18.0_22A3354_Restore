@implementation UIColor(MessageUI)

+ (uint64_t)mailInteractiveColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)datePickerHeaderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)mf_colorNamed:()MessageUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.messageui"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)mailStyleSheetBackground
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)mailComposeFormatButtonSelectedBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mf_colorNamed:", CFSTR("mailComposeFormatButtonSelectedBackgroundColor"));
}

+ (uint64_t)mailComposeTextViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

+ (uint64_t)mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mf_colorNamed:", CFSTR("mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay"));
}

+ (uint64_t)mailModernLabelledAtomDefaultTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailModernLabelledAddressAtomDefaultTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailSubtitleGrayColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "mf_colorNamed:", CFSTR("mailSubtitleGrayColor"));
}

+ (uint64_t)mailSenderAddressPickerColorNormalTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailSenderAddressPickerColorHighlightedTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)mailSenderAddressPickerUnsafeDomainColorTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (uint64_t)mailComposeSuggestionsListTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (uint64_t)mailSecureMIMERegularTextColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)mailSecureMIMEWarningColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (uint64_t)mailGeneralBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)mailQuickComposeBackgroundColor
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("mailQuickComposeBackgroundColor"));
}

+ (uint64_t)mailComposeHeaderBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)mailQuoteColorLevelOneCorona
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorPurpleCorona"));
}

+ (uint64_t)mailQuoteColorLevelTwoCorona
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorTealCorona"));
}

+ (uint64_t)mailQuoteColorLevelThreeCorona
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorGreenCorona"));
}

+ (uint64_t)mailQuoteColorLevelOne
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorPurple"));
}

+ (uint64_t)mailQuoteColorLevelTwo
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorTeal"));
}

+ (uint64_t)mailQuoteColorLevelThree
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("QuoteColorGreen"));
}

+ (id)quoteColorsForSupportedInterfaceStyle
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1E5A9F430;
  objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorsForInterfaceStyle:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = &unk_1E5A9F448;
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorsForInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)mailQuoteColorsForInterfaceStyle:()MessageUI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (a3 >= 2)
  {
    if (a3 != 2)
      return 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelOneCorona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelTwoCorona");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelThreeCorona");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelOne");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelTwo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelThree");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

+ (uint64_t)mailMessageContentViewBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
}

+ (uint64_t)mailPopoverBackgroundCellColor
{
  return objc_msgSend((id)objc_opt_class(), "mf_colorNamed:", CFSTR("mailPopoverBackgroundCellColor"));
}

- (double)mf_luminance
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "red");
  if (v2 >= 0.03928)
    v3 = pow((v2 + 0.055) / 1.055, 2.4);
  else
    v3 = v2 / 12.92;
  objc_msgSend(v1, "green");
  if (v4 >= 0.03928)
    v5 = pow((v4 + 0.055) / 1.055, 2.4);
  else
    v5 = v4 / 12.92;
  objc_msgSend(v1, "blue");
  if (v6 >= 0.03928)
    v7 = pow((v6 + 0.055) / 1.055, 2.4);
  else
    v7 = v6 / 12.92;
  v8 = v5 * 0.7152 + v3 * 0.2126 + v7 * 0.0722;

  return v8;
}

- (double)mf_contrastRatioTo:()MessageUI
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(a1, "mf_luminance");
  v6 = v5;
  objc_msgSend(v4, "mf_luminance");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v6 >= v7)
    v7 = v6;
  v9 = (v7 + 0.05) / (v8 + 0.05);

  return v9;
}

@end
