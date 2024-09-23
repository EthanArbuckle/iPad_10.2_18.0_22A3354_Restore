@implementation CNPickerItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPickerItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPickerItemCell"), CFSTR("textField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPickerItemCell"), CFSTR("beginEditing"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPickerItemCell"), CFSTR("endEditing"), "v", 0);

}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  -[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    -[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityTraits");

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPickerItemCellAccessibility;
    return -[CNPickerItemCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    -[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
}

- (void)beginEditing
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCellAccessibility;
  -[CNPickerItemCellAccessibility beginEditing](&v4, sel_beginEditing);
  v3 = (id)-[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
}

- (void)endEditing
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCellAccessibility;
  -[CNPickerItemCellAccessibility endEditing](&v4, sel_endEditing);
  v3 = (id)-[CNPickerItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
}

@end
