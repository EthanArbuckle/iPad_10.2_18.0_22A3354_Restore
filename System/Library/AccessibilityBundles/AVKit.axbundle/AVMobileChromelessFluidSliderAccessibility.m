@implementation AVMobileChromelessFluidSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessFluidSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVMobileChromelessFluidSlider"), CFSTR("UISlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessFluidSlider"), CFSTR("_sliderFluidInteractionWillContinue:withLocation:"), "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessTimelineView"), CFSTR("leadingTimeText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessTimelineView"), CFSTR("trailingTimeText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessFluidSlider"), CFSTR("_sliderFluidInteractionWillEnd:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessFluidSlider"), CFSTR("usesVolumeStyle"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVMediaTimelineControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMediaTimelineControl"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVMediaTimelineControlDelegate"), CFSTR("mediaTimelineControl:didChangeValue:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVMediaTimelineControlDelegate"), CFSTR("mediaTimelineControlWillBeginChanging:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVMediaTimelineControlDelegate"), CFSTR("mediaTimelineControlDidEndChanging:"));

}

- (BOOL)isAccessibilityElement
{
  return -[AVMobileChromelessFluidSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("usesVolumeStyle")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  return *MEMORY[0x24BDF73A0] | -[AVMobileChromelessFluidSliderAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("time.position.scrubber"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  float v13;
  double v14;
  float v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *v36;
  void *v38;
  const __CFString *v39;
  objc_super v40;
  char v41;

  -[AVMobileChromelessFluidSliderAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("AVMobileChromelessTimelineView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("leadingTimeText"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("trailingTimeText"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!(v4 | v5))
  {
    v41 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maximumValue");
    v14 = v13;
    objc_msgSend(v12, "value");
    MEMORY[0x2349048D0](1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349048D0](1, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("track.position.value"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v16, v17);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!v4)
  {
    v11 = &stru_2501438C8;
    if (!v5)
      goto LABEL_10;
LABEL_7:
    if (objc_msgSend(v6, "containsString:", CFSTR("−"), v38, v39))
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("−"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AXLocalizeDurationTime();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("media.time.remaining"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v25;
      v39 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v26 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v26;
    }
    else
    {
      AXLocalizeDurationTime();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("media.time.total"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v29, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v30;
      v39 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v31 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v31;
    }
    goto LABEL_10;
  }
  AXLocalizeDurationTime();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("media.time.elapsed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v10;
  v39 = CFSTR("__AXStringForVariablesSentinel");
  __UIAXStringForVariables();
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet", v38, v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v11, "stringByTrimmingCharactersInSet:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    v35 = v11;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
    -[AVMobileChromelessFluidSliderAccessibility accessibilityValue](&v40, sel_accessibilityValue);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v35;

  return v36;
}

- (void)accessibilityIncrement
{
  -[AVMobileChromelessFluidSliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 1);
}

- (void)accessibilityDecrement
{
  -[AVMobileChromelessFluidSliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 0);
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  NSClassFromString(CFSTR("UISlider"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumValue");
    objc_msgSend(v4, "maximumValue");
    objc_msgSend(v4, "value");
    -[AVMobileChromelessFluidSliderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    v11 = v5;
    v7 = v5;
    v8 = v6;
    v9 = v4;
    AXPerformSafeBlock();

  }
}

uint64_t __70__AVMobileChromelessFluidSliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("AVMediaTimelineControl"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__AVMobileChromelessFluidSliderAccessibility__accessibilityBumpValue___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;

  v2 = *(double *)(a1 + 64);
  *(float *)&v2 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v2);
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "mediaTimelineControlWillBeginChanging:", *(_QWORD *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(double *)(a1 + 64);
    *(float *)&v3 = v3;
    objc_msgSend(*(id *)(a1 + 40), "mediaTimelineControl:didChangeValue:", *(_QWORD *)(a1 + 56), v3);
  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "mediaTimelineControlDidEndChanging:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_accessibilityAnnounceNewValue
{
  UIAccessibilityNotifications v2;
  id v3;

  v2 = *MEMORY[0x24BDF71E8];
  -[AVMobileChromelessFluidSliderAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  -[AVMobileChromelessFluidSliderAccessibility _sliderFluidInteractionWillContinue:withLocation:](&v4, sel__sliderFluidInteractionWillContinue_withLocation_, a3, a4.x, a4.y);
  AXPerformSafeBlock();
}

uint64_t __95__AVMobileChromelessFluidSliderAccessibility__sliderFluidInteractionWillContinue_withLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceNewValue");
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  -[AVMobileChromelessFluidSliderAccessibility _sliderFluidInteractionWillEnd:](&v3, sel__sliderFluidInteractionWillEnd_, a3);
  AXPerformSafeBlock();
}

uint64_t __77__AVMobileChromelessFluidSliderAccessibility__sliderFluidInteractionWillEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceNewValue");
}

@end
