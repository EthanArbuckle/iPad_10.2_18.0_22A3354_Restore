@implementation AKPasswordResetAppearance

+ (id)serviceNameFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, *MEMORY[0x1E0CEB5F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFontForFont:maximumPointSize:", v2, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)screenTitleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 36.0, *MEMORY[0x1E0CEB5D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFontForFont:maximumPointSize:", v2, 40.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)screenSummaryFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForStyle:weight:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB5F0]);
}

+ (id)actionButtonFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0CEB5F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFontForFont:maximumPointSize:", v2, 24.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)closeButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "tintedButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  objc_msgSend(v2, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfigurationForImage:", v4);

  objc_msgSend(v2, "setContentInsets:", 7.0, 8.0, 7.0, 8.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseForegroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseBackgroundColor:", v6);

  return v2;
}

@end
