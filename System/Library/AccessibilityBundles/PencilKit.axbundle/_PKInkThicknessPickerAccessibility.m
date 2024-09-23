@implementation _PKInkThicknessPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PKInkThicknessPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKInkThicknessPicker"), CFSTR("thicknessButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKInkThicknessPicker"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PKInkThicknessPickerAccessibility;
  -[_PKInkThicknessPickerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[_PKInkThicknessPickerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("thicknessButtons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 5)
    _AXAssert();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      if (v4 > 4)
      {
        v5 = 0;
      }
      else
      {
        accessibilityPencilKitLocalizedString(*(&off_2502F5E40 + v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v3, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessibilityValue:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PKInkThicknessPickerAccessibility;
  -[_PKInkThicknessPickerAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_PKInkThicknessPickerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
