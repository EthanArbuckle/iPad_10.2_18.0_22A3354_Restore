@implementation HUColorPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUColorPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUColorPickerView"), CFSTR("setSelectedColor:"), "v", "{?=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUColorPickerView"), CFSTR("magnifierView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlMagnifierView"), CFSTR("selectedColor"), "@", 0);

}

- (void)setSelectedColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUColorPickerViewAccessibility;
  -[HUColorPickerViewAccessibility setSelectedColor:](&v8, sel_setSelectedColor_, a3.var0, a3.var1, a3.var2, a3.var3);
  if (CFAbsoluteTimeGetCurrent() - *(double *)&setSelectedColor__LastTime > 1.0)
  {
    objc_opt_class();
    -[HUColorPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("magnifierView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("selectedColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AXColorStringForColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
    setSelectedColor__LastTime = CFAbsoluteTimeGetCurrent();

  }
}

@end
