@implementation HUQuickControlColorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlColorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlColorView"), CFSTR("mode"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlColorView"), CFSTR("colorLinearPaletteView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlColorView"), CFSTR("colorPickerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlColorView"), CFSTR("_updateColorPicker"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUColorPickerView"), CFSTR("colorWheelView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUColorSwatchView"), CFSTR("selectionState"), "Q", 0);

}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[HUQuickControlColorViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("mode"));
  -[HUQuickControlColorViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("colorPickerModeSegmentedControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  if (v3)
  {
    -[HUQuickControlColorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorPickerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isHidden"))
      v7 = 0;
    else
      v7 = v4;
    -[HUQuickControlColorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorLinearPaletteView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 3, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUQuickControlColorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorLinearPaletteView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isHidden"))
      v10 = 0;
    else
      v10 = v4;
    objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v6, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_updateColorPicker
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUQuickControlColorViewAccessibility;
  -[HUQuickControlColorViewAccessibility _updateColorPicker](&v2, sel__updateColorPicker);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilityFirstQuickControlElementForFocus
{
  void *v2;
  void *v3;

  -[HUQuickControlColorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorPickerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("colorWheelView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
