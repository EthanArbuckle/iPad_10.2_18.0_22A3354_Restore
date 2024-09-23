@implementation UIImageSymbolConfiguration(SafariServicesExtras)

+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0DC3E88];
  v7 = *MEMORY[0x1E0DC4918];
  v8 = a3;
  objc_msgSend(v6, "traitCollectionWithPreferredContentSizeCategory:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:compatibleWithTraitCollection:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = MEMORY[0x18D77F0D8](v12);
  objc_msgSend(v7, "pointSize");
  objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
