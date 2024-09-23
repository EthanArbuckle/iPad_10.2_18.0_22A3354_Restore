@implementation MKFontManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MKFontManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2D9E8 != -1)
    dispatch_once(&qword_1ECE2D9E8, block);
  return (id)qword_1ECE2D9E0;
}

void __30__MKFontManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECE2D9E0;
  qword_1ECE2D9E0 = (uint64_t)v1;

}

+ (void)setUseSmallFont:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseSmallFont:", v3);

}

- (UIFont)largeTitleFontStatic
{
  if (self->_useSmallFont)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 17.0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 22.0, *MEMORY[0x1E0CEB5D0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)largeTitleFont
{
  _QWORD *v2;

  if (self->_useSmallFont)
    v2 = (_QWORD *)MEMORY[0x1E0CEB538];
  else
    v2 = (_QWORD *)MEMORY[0x1E0CEB5B8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *v2, 2);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)brandTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B0]);
}

- (UIFont)subtitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
}

- (UIFont)bodyFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
}

- (UIFont)boldBodyFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)mediumTitleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v2, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (UIFont)mediumBodyFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", *MEMORY[0x1E0CEB5E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)sectionHeaderFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
}

- (UIFont)sectionHeaderButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
}

- (UIFont)attributionFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
}

- (UIFont)smallAttributionFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
}

- (UIFont)rowButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0CEB5E8]);
}

- (UIFont)rowGlyphButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 26.0, *MEMORY[0x1E0CEB5F0]);
}

- (UIFont)ratingOverallFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB580]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)ratingOverallPercentageFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)recommendSubtitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionGlyphFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionHeaderLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)boldSectionHeaderFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
}

- (UIFont)textBlurbFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)semiboldButtonCellFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)largeTitleHeaderFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB580]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)lookAroundButtonFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)lookAroundLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)lookAroundSecondaryLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)lookAroundTertiaryLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)lookAroundAttributionButtonFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (id)iconFontToMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (qword_1ECE2D9F8 != -1)
    dispatch_once(&qword_1ECE2D9F8, &__block_literal_global_9_0);
  v4 = (void *)qword_1ECE2D9F0;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "pointSize");
    objc_msgSend(v8, "fontWithName:size:", CFSTR("pcf"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(v3, "pointSize");
      objc_msgSend(v9, "systemFontOfSize:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)qword_1ECE2D9F0;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "pointSize");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v12);

  }
  return v7;
}

void __33__MKFontManager_iconFontToMatch___block_invoke()
{
  void *v0;
  const __CFURL *v1;
  uint64_t v2;
  void *v3;
  CFStringRef v4;
  CFErrorRef error;

  objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkitBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("pcf"), CFSTR("otf"));
  v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECE2D9F0;
  qword_1ECE2D9F0 = v2;

  error = 0;
  if (!CTFontManagerRegisterFontsForURL(v1, kCTFontManagerScopeProcess, &error))
  {
    v4 = CFErrorCopyDescription(error);
    NSLog(CFSTR("Failed to load font: %@"), v4);
    CFRelease(v4);
  }

}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

@end
