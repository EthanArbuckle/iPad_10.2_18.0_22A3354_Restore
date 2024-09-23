@implementation _UINavigationBarPaletteAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UINavigationBarPalette");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("PUPickerNavigationBarPalette");
  objc_msgSend(location[0], "validateClass:");
  v4 = CFSTR("_UINavigationBarPalette");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("PUPickerNavigationBarPalette"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UINavigationBarPalette"), CFSTR("setMinimumHeight:"), "v", "d", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  _UINavigationBarPaletteAccessibility *v2;
  objc_super v3;
  SEL v4;
  _UINavigationBarPaletteAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarPaletteAccessibility;
  -[_UINavigationBarPaletteAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  NSClassFromString(CFSTR("PUPickerNavigationBarPalette"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = v5;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v2, 0);
  }
}

- (void)setMinimumHeight:(double)a3
{
  double v3;
  double v4;
  objc_super v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SEL v10;
  _UINavigationBarPaletteAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    NSClassFromString(CFSTR("PUPickerNavigationBarPalette"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[_UINavigationBarPaletteAccessibility preferredHeight](v11, "preferredHeight");
      v8 = v3;
      v7 = v9;
      if (v3 >= v9)
        v4 = v8;
      else
        v4 = v7;
      v6 = v4;
      v9 = v4;
    }
  }
  v5.receiver = v11;
  v5.super_class = (Class)_UINavigationBarPaletteAccessibility;
  -[_UINavigationBarPaletteAccessibility setMinimumHeight:](&v5, sel_setMinimumHeight_, v9, *(_QWORD *)&v4);
}

@end
