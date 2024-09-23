@implementation UIFont(MessageUI)

- (double)mf_originPointFromBaselinePoint:()MessageUI
{
  objc_msgSend(a1, "pointSize");
  return a2;
}

- (double)mf_baselinePointFromOriginPoint:()MessageUI
{
  objc_msgSend(a1, "pointSize");
  return a2;
}

+ (double)mf_defaultComposeFontPixelSize
{
  return 17.0;
}

+ (id)mf_messageHeaderSenderLabelFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)mf_messageHeaderSummaryLabelFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

+ (uint64_t)mf_messageHeaderTimestampLabelFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

+ (id)mf_messageHeaderSenderLabelFontForMailActionHeader
{
  void *v0;
  NSString *v1;
  NSString *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  v2 = (NSString *)(id)*MEMORY[0x1E0DC48D0];
  if (UIContentSizeCategoryCompareToCategory(v1, v2) == NSOrderedAscending)
    v3 = v1;
  else
    v3 = v2;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 32770);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)mf_messageHeaderSummaryLabelFontForMailActionHeader
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48D0]);
}

+ (uint64_t)mf_messageBodyFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

@end
