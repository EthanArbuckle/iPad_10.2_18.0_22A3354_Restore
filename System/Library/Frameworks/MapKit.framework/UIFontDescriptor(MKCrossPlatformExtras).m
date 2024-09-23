@implementation UIFontDescriptor(MKCrossPlatformExtras)

+ (id)_mapkit_fontFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "_mapkit_fontRoundedColonFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(a1, "_mapkit_fontMonospaceFeature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)_mapkit_fontFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontFeaturesForTimeDisplayUseMonospace:", 0);
}

+ (id)_mapkit_fontMonospaceFeature
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB520];
  v2[0] = *MEMORY[0x1E0CEB518];
  v2[1] = v0;
  v3[0] = &unk_1E2158860;
  v3[1] = &unk_1E2158878;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_mapkit_fontRoundedColonFeature
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB518];
  v2[0] = *MEMORY[0x1E0CEB520];
  v2[1] = v0;
  v3[0] = &unk_1E2158890;
  v3[1] = &unk_1E21588A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_mapkit_fontFeaturesForTabularFigures
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_mapkit_fontMonospaceFeature");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 0);
}

- (id)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_mapkit_fontFeaturesForTimeDisplayUseMonospace:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CEB4D0];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fontDescriptorByAddingAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_mapkit_fontDescriptorByAddingFeaturesForTabularFigures
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_mapkit_fontFeaturesForTabularFigures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEB4D0];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fontDescriptorByAddingAttributes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
