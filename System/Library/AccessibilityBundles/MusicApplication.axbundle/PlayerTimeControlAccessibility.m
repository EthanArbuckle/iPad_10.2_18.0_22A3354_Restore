@implementation PlayerTimeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.PlayerTimeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PlayerTimeControl"), CFSTR("accessibilityTotalDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PlayerTimeControl"), CFSTR("accessibilityElapsedDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PlayerTimeControl"), CFSTR("accessibilityUpdateWithElapsedDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PlayerTimeControl"), CFSTR("accessibilityIsLiveContent"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PlayerTimeControl"), CFSTR("liveLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  BOOL result;

  result = 1;
  if (-[PlayerTimeControlAccessibility _axIsLiveContent](self, "_axIsLiveContent"))
  {
    -[PlayerTimeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("liveLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

    if (!v4)
      return 0;
  }
  return result;
}

- (BOOL)_axIsLiveContent
{
  return -[PlayerTimeControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsLiveContent"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PlayerTimeControlAccessibility _axIsLiveContent](self, "_axIsLiveContent"))
  {
    -[PlayerTimeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("liveLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXAttributedStringForBetterPronuciation();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityMusicLocalizedString(CFSTR("track.position.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  if (_AXSAutomationEnabled())
  {
    AXPositionalStyleDurationStringForDuration();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXPositionalStyleDurationStringForDuration();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ of %@"), v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXDurationStringForDuration();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXDurationStringForDuration();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PlayerTimeControlAccessibility _axIsLiveContent](self, "_axIsLiveContent"))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityMusicLocalizedString(CFSTR("track.position.value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    accessibilityMusicLocalizedString(CFSTR("no.track.position"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PlayerTimeControlAccessibility;
  v3 = -[PlayerTimeControlAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[PlayerTimeControlAccessibility _axIsLiveContent](self, "_axIsLiveContent"))
    return *MEMORY[0x24BDF73E0] | _AXTraitsRemoveTrait();
  else
    return *MEMORY[0x24BDF73A0] | v3;
}

- (void)_accessibilityIncreaseAmount:(BOOL)a3
{
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  AXPerformSafeBlock();
}

uint64_t __63__PlayerTimeControlAccessibility__accessibilityIncreaseAmount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityUpdateWithElapsedDuration:", *(double *)(a1 + 40));
}

- (void)accessibilityIncrement
{
  -[PlayerTimeControlAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 1);
}

- (void)accessibilityDecrement
{
  -[PlayerTimeControlAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 0);
}

- (id)_accessibilityAbsoluteValue
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  v4 = v3;
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  v6 = v5 / v4;
  *(float *)&v6 = v6;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
}

@end
