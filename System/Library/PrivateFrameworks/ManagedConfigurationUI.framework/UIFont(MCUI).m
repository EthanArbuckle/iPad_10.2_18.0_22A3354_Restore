@implementation UIFont(MCUI)

+ (id)MCUIBoldTitleFontWithSize:()MCUI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
