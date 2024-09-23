@implementation NTKCFaceDetailSportsFooterCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)_attributedFooterText
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  NTKCCustomizationLocalizedString(CFSTR("SPORTS_OPEN_TITLE"), (uint64_t)CFSTR("Open TV app"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3778]);
  v17 = *MEMORY[0x1E0DC1160];
  v18[0] = CFSTR("com.apple.tv://sportsfavorites");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:attributes:", v3, v5);

  NTKCCustomizationLocalizedString(CFSTR("SPORTS_HELPER_TEXT"), (uint64_t)CFSTR("You can select your favorite teams in the TV app."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  v15 = *MEMORY[0x1E0DC1140];
  BPSDetailTextColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v12, "appendAttributedString:", v13);

  objc_msgSend(v12, "appendAttributedString:", v6);
  return v12;
}

- (NTKCFaceDetailSportsFooterCell)init
{
  NTKCFaceDetailSportsFooterCell *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailSportsFooterCell;
  v2 = -[NTKCFaceDetailDescriptionCell init](&v5, sel_init);
  if (v2)
  {
    +[NTKCFaceDetailSportsFooterCell _attributedFooterText](NTKCFaceDetailSportsFooterCell, "_attributedFooterText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailDescriptionCell setAttributedText:](v2, "setAttributedText:", v3);

  }
  return v2;
}

- (id)_fontDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

@end
