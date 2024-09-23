@implementation CSVibrancyUtility

+ (BOOL)supportsVibrancy
{
  return SBUIGraphicsQuality() == 100 && !UIAccessibilityIsReduceTransparencyEnabled();
}

+ (void)updateVibrantView:(id)a3 backgroundView:(id)a4 colorProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "legibilitySettings");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageColorForCurrentWallpaper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);
  objc_msgSend(v9, "setBackgroundView:", v8);

  objc_msgSend(v7, "contrastForCurrentWallpaper");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0DA9FD0], "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", v10, v14, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVibrantSettings:", v13);

}

@end
