@implementation AVTUIFontRepository

+ (id)appropriateContentSizeCategoryForCategory:(id)a3 minCategory:(id)a4 maxCategory:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSComparisonResult v15;
  NSString *v16;
  NSComparisonResult v17;
  NSString *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  v10 = (NSString *)v7;
  if (UIContentSizeCategoryCompareToCategory(v8, v9) == NSOrderedDescending)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("minCategory");
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, CFSTR("Min content size category must be less than or equal to max content size category"), v13);

  }
  v15 = UIContentSizeCategoryCompareToCategory(v8, v10);
  v16 = v8;
  if (v15 == NSOrderedDescending
    || (v17 = UIContentSizeCategoryCompareToCategory(v10, v9), v16 = v9, v18 = v10, v17 == NSOrderedDescending))
  {
    v18 = v16;

  }
  return v18;
}

+ (id)splashTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "largeTitleTextStyle");
  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)splashSubTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)splashContinueButtonFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB420], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attributeTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attributeTitleButtonFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)templateTitleLabelFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CEA5F0];
  objc_msgSend(a1, "largeTitleTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)templateInstructionLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
}

+ (id)avatarActionButtonTitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5C0], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v13 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CEB510]);

  v7 = (void *)MEMORY[0x1E0CEA5E8];
  v8 = (void *)MEMORY[0x1E0CEA5F0];
  v9 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v8, "fontDescriptorWithFontAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)userInfoLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB420], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  v14 = *MEMORY[0x1E0CEB510];
  v12 = *MEMORY[0x1E0CEB528];
  v13 = &unk_1EA5717B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)groupDialLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)groupListLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
}

+ (id)multicolorPickerLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attributeViewLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB550]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)funCamItemTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appropriateContentSizeCategoryForCategory:minCategory:maxCategory:", v4, *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB408]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  v14 = *MEMORY[0x1E0CEB510];
  v12 = *MEMORY[0x1E0CEB528];
  v13 = &unk_1EA5717B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)keyboardRecentsSplashTitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  v10 = *MEMORY[0x1E0CEB510];
  v8 = *MEMORY[0x1E0CEB528];
  v9 = &unk_1EA5717B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyboardRecentsSplashSubtitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  v10 = *MEMORY[0x1E0CEB510];
  v8 = *MEMORY[0x1E0CEB528];
  v9 = &unk_1EA5717D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyboardRecentsSplashContinueButtonFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  v10 = *MEMORY[0x1E0CEB510];
  v8 = *MEMORY[0x1E0CEB528];
  v9 = &unk_1EA5717B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)largeTitleTextStyle
{
  return (id)*MEMORY[0x1E0CEB580];
}

@end
