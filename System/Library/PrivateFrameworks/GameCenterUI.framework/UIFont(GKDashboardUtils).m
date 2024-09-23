@implementation UIFont(GKDashboardUtils)

+ (id)_gkPreferredFontForTextStyle:()GKDashboardUtils symbolicTraits:
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_gkPreferredFontForTextStyle:()GKDashboardUtils design:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC1358];
  v6 = a4;
  objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithDesign:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
