@implementation PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUICListBodyPlatterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICListPlatterCell"), CFSTR("bodyLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICListPlatterCell"), CFSTR("trailingAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUICListBodyPlatterCell"), CFSTR("PUICPlatterCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore safeValueForKey:](self, "safeValueForKey:", CFSTR("bodyLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore;
  v3 = -[PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore accessibilityTraits](&v12, sel_accessibilityTraits);
  objc_opt_class();
  -[PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingAccessoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x234922E4C]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("checkmark"));
      v10 = *MEMORY[0x24BDF7400];
      if (!v9)
        v10 = 0;
      v3 |= v10;

    }
  }

  return v3;
}

- (id)accessibilityValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore;
  -[PUICListBodyPlatterCellAccessibility__ToneKit__PepperUICore accessibilityValue](&v3, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
