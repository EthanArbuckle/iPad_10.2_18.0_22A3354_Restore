@implementation PlayerTimeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.PlayerTimeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityTotalDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityElapsedDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityUpdateWithElapsedDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityKnobView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityIsLiveContent"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.PlayerTimeControl"), CFSTR("accessibilityLiveLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  BOOL result;

  result = 1;
  if (-[PlayerTimeControlAccessibility _axIsLiveContent](self, "_axIsLiveContent"))
  {
    -[PlayerTimeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLiveLabel"));
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
    -[PlayerTimeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLiveLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXAttributedStringForBetterPronuciation();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("track.position.label"));
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
      accessibilityLocalizedString(CFSTR("track.position.value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    accessibilityLocalizedString(CFSTR("no.track.position"));
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

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  v6 = v5;
  v7 = v5 > 1800.0;
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  v8 = dbl_2328E0600[v7];
  v10 = v9 / v6;
  if (!v3)
    v8 = -v8;
  return v10 + v8;
}

- (void)accessibilityIncrement
{
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  -[PlayerTimeControlAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 1);
  AXPerformSafeBlock();
}

uint64_t __56__PlayerTimeControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityUpdateWithElapsedDuration:", *(double *)(a1 + 40));
}

- (void)accessibilityDecrement
{
  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  -[PlayerTimeControlAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 0);
  AXPerformSafeBlock();
}

uint64_t __56__PlayerTimeControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityUpdateWithElapsedDuration:", *(double *)(a1 + 40));
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PlayerTimeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityKnobView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (double)_accessibilityNumberValue
{
  double result;

  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  return result;
}

- (double)_accessibilityMaxValue
{
  double result;

  -[PlayerTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  return result;
}

@end
