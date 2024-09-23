@implementation VMPlayerTimelineSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VMPlayerTimelineSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_axUpdateSliderValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeTimeIntervalForKey:", CFSTR("maximumTime"));
  objc_msgSend(v4, "safeFloatForKey:", CFSTR("value"));
  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsProtocol();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v4;
  v7 = v4;
  v8 = v6;
  AXPerformSafeBlock();

}

uint64_t __59__VMPlayerTimelineSliderAccessibility__axUpdateSliderValue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playerTimelineSlider:didChangeElapsedTime:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VMPlayerTimelineSlider"), CFSTR("_slider"), "VMDetailSlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMDetailSlider"), CFSTR("maximumTime"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMDetailSlider"), CFSTR("elapsedTime"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMPlayerTimelineSlider"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("VMPlayerTimelineSliderDelegate"), CFSTR("playerTimelineSlider:didChangeElapsedTime:"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  accessibilityLocalizedString(CFSTR("voicemail.playback.slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMPlayerTimelineSliderAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("GreetingSlider"));

  if (v5)
  {
    accessibilityLocalizedString(CFSTR("greeting.playback.slider"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeTimeIntervalForKey:", CFSTR("maximumTime"));
  MEMORY[0x234915228](1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("elapsedTimeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXDurationForDurationString();
  v10 = v9;

  MEMORY[0x234915228](1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("voicemail.progress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v11, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;
  char v9;

  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)VMPlayerTimelineSliderAccessibility;
  v5 = -[VMPlayerTimelineSliderAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  v6 = objc_msgSend(v4, "accessibilityTraits") | v5;

  return v6;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;

  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityIncrement");
  -[VMPlayerTimelineSliderAccessibility _axUpdateSliderValue](self, "_axUpdateSliderValue");

}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  -[VMPlayerTimelineSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityDecrement");
  -[VMPlayerTimelineSliderAccessibility _axUpdateSliderValue](self, "_axUpdateSliderValue");

}

@end
