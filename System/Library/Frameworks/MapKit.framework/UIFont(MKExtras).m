@implementation UIFont(MKExtras)

+ (NSString)_contentSizeCategoryInTableViewCellWithContentSizeCategory:()MKExtras
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0CEB440])
    && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0CEB420]) != NSOrderedAscending)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_preferredContentSizeCategory:", 2);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, 0, 0.0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras addingSymbolicTraits:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, a4, 0.0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, 0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:grade:contentSizeCategory:symbolicTraits:", a3, a4, 0, 0);
}

+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a4;
  objc_msgSend(a1, "_contentSizeCategoryInTableViewCellWithContentSizeCategory:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapkit_preferredFontForTextStyle:weight:grade:contentSizeCategory:symbolicTraits:", v12, a5, v13, a7, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:contentSizeCategory:symbolicTraits:
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a1, "_contentSizeCategoryInTableViewCellWithContentSizeCategory:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapkit_preferredFontForTextStyle:weight:grade:contentSizeCategory:symbolicTraits:", v10, 0, v11, a6, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_mapkit_preferredFontForTextStyle:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%f_%lu_%d"), v12, v11, *(_QWORD *)&a1, a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)fontCache;
  if (!fontCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)fontCache;
    fontCache = v15;

    v14 = (void *)fontCache;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1 != 0.0 || a5 || (_DWORD)a7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a1 != 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CEB608]);

      }
      if ((_DWORD)a7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CEB528]);

      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CEB530]);

      }
      v28 = *MEMORY[0x1E0CEB510];
      v24 = (void *)objc_msgSend(v20, "copy");
      v29[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v26;
    }
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v19, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)fontCache, "setObject:forKeyedSubscript:", v17, v13);

  }
  return v17;
}

+ (uint64_t)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:addingSymbolicTraits:useMonospace:", a3, a4, 0);
}

+ (id)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:useMonospace:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)_mapkit_ax3TextEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ECE2D8F0 != -1)
    dispatch_once(&qword_1ECE2D8F0, &__block_literal_global_21);
  v2 = objc_msgSend((id)_MergedGlobals_133, "containsObject:", v1);

  return v2;
}

+ (uint64_t)_mapkit_accessibilityTextEnabled
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ECE2D900 != -1)
    dispatch_once(&qword_1ECE2D900, &__block_literal_global_10);
  v2 = objc_msgSend((id)qword_1ECE2D8F8, "containsObject:", v1);

  return v2;
}

@end
