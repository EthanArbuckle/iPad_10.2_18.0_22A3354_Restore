@implementation MusicCrossFadeDurationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCrossFadeDurationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCrossFadeDurationCell"), CFSTR("slider"), "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityMusicSettingsLocalizedString(CFSTR("CROSS_FADE"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  float v5;
  unint64_t v6;
  void *v7;

  accessibilityMusicSettingsLocalizedString(CFSTR("CROSS_FADE_DURATION_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MusicCrossFadeDurationCellAccessibility _axSlider](self, "_axSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (unint64_t)v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  -[MusicCrossFadeDurationCellAccessibility _axIncrementSlider:](self, "_axIncrementSlider:", 1);
}

- (void)accessibilityDecrement
{
  -[MusicCrossFadeDurationCellAccessibility _axIncrementSlider:](self, "_axIncrementSlider:", 0);
}

- (id)accessibilityPath
{
  return 0;
}

- (void)_axIncrementSlider:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  float v7;
  int v8;
  int v9;
  id v10;
  float v11;
  float v12;
  id v13;
  float v14;
  float v15;
  float v16;
  int v17;
  id v18;
  id v19;
  int v20;
  id from;
  id location;

  v3 = a3;
  -[MusicCrossFadeDurationCellAccessibility _axSlider](self, "_axSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  v6 = objc_loadWeakRetained(&location);
  objc_msgSend(v6, "value");
  v8 = (int)v7;

  if (v3)
    v9 = v8 + 1;
  else
    v9 = v8 - 1;
  v10 = objc_loadWeakRetained(&location);
  objc_msgSend(v10, "maximumValue");
  v12 = v11;

  v13 = objc_loadWeakRetained(&location);
  objc_msgSend(v13, "minimumValue");
  v15 = v14;

  v16 = (float)v9;
  if (v15 > (float)v9)
    v16 = v15;
  if (v12 < v16)
    v16 = v12;
  v17 = (int)v16;
  objc_initWeak(&from, self);
  objc_copyWeak(&v18, &location);
  v20 = v17;
  objc_copyWeak(&v19, &from);
  AXPerformSafeBlock();
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __62__MusicCrossFadeDurationCellAccessibility__axIncrementSlider___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = (float)*(int *)(a1 + 48);
  objc_msgSend(WeakRetained, "setValue:", v4);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "sliderValueChanged:", v5);

}

- (id)_axSlider
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MusicCrossFadeDurationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
