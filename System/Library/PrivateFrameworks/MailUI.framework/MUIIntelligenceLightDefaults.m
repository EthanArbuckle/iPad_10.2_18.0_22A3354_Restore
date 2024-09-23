@implementation MUIIntelligenceLightDefaults

+ (id)_defaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

+ (int64_t)preferredMessageListLightEffect
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListLightEffect"));

  return v3;
}

+ (double)preferredMessageListEdgeLightRadius
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEdgeLightEffectRadius"));
  v4 = v3;

  return v4;
}

+ (unint64_t)preferredMessageListEdgeLightRegion
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEdgeLightEffectRegion"));

  return v3;
}

+ (int64_t)preferredMessageListBeginningAnimationCurve
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListBeginningAnimationCurve"));

  return v3;
}

+ (int64_t)preferredMessageListEndingAnimationCurve
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationCurve"));

  return v3;
}

+ (double)preferredMessageListAnimationDelay
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListAnimationDelay"));
  v4 = v3;

  return v4;
}

+ (double)preferredMessageListEndingAnimationDelayFactor
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationDelayFactor"));
  v4 = v3;

  return v4;
}

+ (double)preferredMessageListAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListAnimationDuration"));
  v4 = v3;

  return v4;
}

+ (double)preferredMessageListBackgroundCornerRadius
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListBackgroundCornerRadius"));
  v4 = v3;

  return v4;
}

+ (void)setInitialSettingsIfNecessary
{
  void *v3;
  char v4;
  id v5;

  objc_msgSend(a1, "_defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MUIIntelligenceLightDefaultsKeyHasSetupMessageListIntelligenceLightInitialSettingsKey"));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(a1, "restoreDefaultValues");
    objc_msgSend(a1, "_defaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("MUIIntelligenceLightDefaultsKeyHasSetupMessageListIntelligenceLightInitialSettingsKey"));

  }
}

+ (void)restoreDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "_defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", 1, CFSTR("MUIIntelligenceLightDefaultsKeyMessageListLightEffect"));

  objc_msgSend(a1, "_defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEdgeLightEffectRadius"), 12.0);

  objc_msgSend(a1, "_defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", 0, CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEdgeLightEffectRegion"));

  objc_msgSend(a1, "_defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", 1, CFSTR("MUIIntelligenceLightDefaultsKeyMessageListBeginningAnimationCurve"));

  objc_msgSend(a1, "_defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", 2, CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationCurve"));

  objc_msgSend(a1, "_defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDouble:forKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListAnimationDelay"), 0.1);

  objc_msgSend(a1, "_defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDouble:forKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationDelayFactor"), 0.75);

  objc_msgSend(a1, "_defaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDouble:forKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListAnimationDuration"), 4.0);

  objc_msgSend(a1, "_defaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDouble:forKey:", CFSTR("MUIIntelligenceLightDefaultsKeyMessageListBackgroundCornerRadius"), 24.0);

}

@end
