@implementation EKUIAutocompleteSearchResultBaseCell

- (EKUIAutocompleteSearchResultBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIAutocompleteSearchResultBaseCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIAutocompleteSearchResultBaseCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__updateContentForSizeCategoryChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (id)createPrimaryLabel
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteSearchResultBaseCell _createLabelWithColor:](self, "_createLabelWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createSecondaryLabel
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "secondaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteSearchResultBaseCell _createLabelWithColor:](self, "_createLabelWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)secondaryTextLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)secondaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (double)verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:(id)a3
{
  double v3;
  double result;

  objc_msgSend(a3, "_scaledValueForValue:useLanguageAwareScaling:", 1, 20.0);
  CalRoundToScreenScale(v3);
  return result;
}

- (double)verticalSpacingTopToBaselineForTopLabel
{
  void *v2;
  double v3;
  double v4;

  -[EKUITableViewCellWithPrimaryAndSecondaryFonts primaryTextLabelFont](self, "primaryTextLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:", v2);
  v4 = v3;

  return v4;
}

+ (double)verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:(id)a3
{
  double v3;
  double result;

  objc_msgSend(a3, "_scaledValueForValue:useLanguageAwareScaling:", 1, 20.0);
  CalRoundToScreenScale(v3);
  return result;
}

- (double)verticalSpacingTopToBaselineForBottomLabel
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "secondaryTextLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:", v2);
  v4 = v3;

  return v4;
}

+ (double)verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:(id)a3
{
  double v3;
  double result;

  objc_msgSend(a3, "_scaledValueForValue:useLanguageAwareScaling:", 1, 8.0);
  CalRoundToScreenScale(v3);
  return result;
}

- (double)_verticalSpacingBottomToBaselineForBottomLabel
{
  void *v2;
  double v3;
  double v4;

  -[EKUITableViewCellWithPrimaryAndSecondaryFonts primaryTextLabelFont](self, "primaryTextLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:", v2);
  v4 = v3;

  return v4;
}

- (double)verticalSpacingTopToColorDot
{
  void *v2;
  double v3;
  double v4;

  -[EKUITableViewCellWithPrimaryAndSecondaryFonts primaryTextLabelFont](self, "primaryTextLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:useLanguageAwareScaling:", 1, 9.0);
  v4 = v3;

  return v4;
}

- (id)_createLabelWithColor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTextColor:", v3);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  -[EKUIAutocompleteSearchResultBaseCell setLabelFonts](self, "setLabelFonts", a3);
  -[EKUIAutocompleteSearchResultBaseCell setupConstraints](self, "setupConstraints");
  -[EKUIAutocompleteSearchResultBaseCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateWithResult:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  NSRequestConcreteImplementation();
  return 0.0;
}

- (void)setLabelFonts
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

- (void)setupConstraints
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

@end
