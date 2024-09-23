@implementation HeadphoneAccessoryLabeledSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_"), CFSTR("selectedIndex"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_"), CFSTR("setValue:animated:objectChange:"), "v", "d", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_"), CFSTR("ticks"));

}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v8;
  char v9;

  objc_opt_class();
  -[HeadphoneAccessoryLabeledSliderAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("ticks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_opt_class();
  -[HeadphoneAccessoryLabeledSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (!objc_msgSend(v4, "count") || (v7 & 0x8000000000000000) != 0 || v7 >= objc_msgSend(v4, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
    -[HeadphoneAccessoryLabeledSliderAccessibility accessibilityIncrement](&v8, sel_accessibilityIncrement);
  }
  else
  {
    objc_msgSend(v4, "count");
    AXPerformSafeBlock();
  }

}

uint64_t __70__HeadphoneAccessoryLabeledSliderAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(a1 + 40));
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[HeadphoneAccessoryLabeledSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "integerValue");
  AXPerformSafeBlock();

}

uint64_t __70__HeadphoneAccessoryLabeledSliderAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(a1 + 40));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  char v13;

  objc_opt_class();
  -[HeadphoneAccessoryLabeledSliderAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("ticks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_opt_class();
  -[HeadphoneAccessoryLabeledSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  v8 = objc_msgSend(v4, "count");
  if ((v7 & 0x8000000000000000) != 0 || v7 >= v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
    -[HeadphoneAccessoryLabeledSliderAccessibility accessibilityValue](&v12, sel_accessibilityValue);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)setValue:(double)a3 animated:(BOOL)a4 objectChange:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL4 IsVoiceOverRunning;
  objc_super v10;

  v5 = a5;
  v6 = a4;
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v10.receiver = self;
  v10.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
  -[HeadphoneAccessoryLabeledSliderAccessibility setValue:animated:objectChange:](&v10, sel_setValue_animated_objectChange_, v6, IsVoiceOverRunning | v5, a3);
}

@end
