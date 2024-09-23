@implementation ETColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETColorWheelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETColorWheelView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorWheelView"), CFSTR("doneButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETColorWheelView"), CFSTR("_doneButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorWheelView"), CFSTR("crownInputSequencer"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PUICCrownInputSequencer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICCrownInputSequencer"), CFSTR("offset"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICCrownInputSequencer"), CFSTR("setOffset:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("ETColorWheelView"), CFSTR("PUICCrownInputSequencerDelegate"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("PUICCrownInputSequencerDelegate"), CFSTR("crownInputSequencerOffsetDidChange:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETColorWheelView"), CFSTR("pickerViewHighlightedColor"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("color.wheel.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0] | *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("color.wheel.label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[ETColorWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pickerViewHighlightedColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axColorStringForSpeaking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accessibilityActivate
{
  void *v3;

  -[ETColorWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_doneButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETColorWheelViewAccessibility doneButtonTapped:](self, "doneButtonTapped:", v3);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

- (void)accessibilityIncrement
{
  -[ETColorWheelViewAccessibility _accessibilityChangeCrownOffset:](self, "_accessibilityChangeCrownOffset:", 0.1);
}

- (void)accessibilityDecrement
{
  -[ETColorWheelViewAccessibility _accessibilityChangeCrownOffset:](self, "_accessibilityChangeCrownOffset:", -0.1);
}

- (void)_accessibilityChangeCrownOffset:(double)a3
{
  void *v3;
  id v4;

  -[ETColorWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("crownInputSequencer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeDoubleForKey:", CFSTR("offset"));
  v4 = v3;
  AXPerformSafeBlock();

}

uint64_t __65__ETColorWheelViewAccessibility__accessibilityChangeCrownOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOffset:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "crownInputSequencerOffsetDidChange:", *(_QWORD *)(a1 + 32));
}

@end
