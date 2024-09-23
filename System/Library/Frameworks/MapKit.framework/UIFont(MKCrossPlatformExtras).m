@implementation UIFont(MKCrossPlatformExtras)

- (id)_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)_mapkit_fontByAddingFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:", 0);
}

- (id)_mapkit_fontByAddingFeaturesForTabularFigures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontDescriptorByAddingFeaturesForTabularFigures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mapkit_fontWithWeight:()MKCrossPlatformExtras
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0CEB510];
  v10 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_mapkit_fontWithSymbolicTraits:()MKCrossPlatformExtras
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_mapkit_scaledValueForValue:()MKCrossPlatformExtras
{
  return objc_msgSend(a1, "_mapkit_scaledValueForValue:scalingForMacIdiom:respectingTraitEnvironment:", 1, 0);
}

- (double)_mapkit_scaledValueForValue:()MKCrossPlatformExtras scalingForMacIdiom:respectingTraitEnvironment:
{
  void *v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(a1, "traitCollectionFromTraitEnvironment:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInterfaceIdiom");
  objc_msgSend(v7, "displayScale");
  if (!v7)
  {
    if (_MergedGlobals_137 != -1)
      dispatch_once(&_MergedGlobals_137, &__block_literal_global_29);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");

  }
  objc_msgSend(a1, "_scaledValueForValue:", a2);
  UICeilToScale();
  v10 = v9;

  return v10;
}

- (id)traitCollectionFromTraitEnvironment:()MKCrossPlatformExtras
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
