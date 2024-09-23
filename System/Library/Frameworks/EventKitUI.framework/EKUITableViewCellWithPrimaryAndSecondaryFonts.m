@implementation EKUITableViewCellWithPrimaryAndSecondaryFonts

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKUITableViewCellWithPrimaryAndSecondaryFonts_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, block);
}

void __59__EKUITableViewCellWithPrimaryAndSecondaryFonts_initialize__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__clearFontCaches, *MEMORY[0x1E0DC48E8], 0);

}

- (id)timeLabelsFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "timeLabelsFont");
}

+ (id)timeLabelsFont
{
  void *v2;
  void *v3;
  void *v4;

  +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48C0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "monospacedDigitSystemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryTextLabelFont
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[EKUITableViewCellWithPrimaryAndSecondaryFonts contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "primaryTextLabelFontForWidth:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)primaryTextLabelFontForWidth:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AD0], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)secondaryTextLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)secondaryTextLabelFont
{
  return +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48C0], 0);
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[EKUITableViewCellWithPrimaryAndSecondaryFonts bounds](self, "bounds");
  v3 = EKUILayoutMarginsForFullscreenLayoutRectWithSize(0, v2);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end
