@implementation _UIFontPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFontPickerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_existingSystemAccessoryView:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFontPickerTableViewCellAccessibility;
  -[_UIFontPickerTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIFontPickerTableViewCellAccessibility _existingSystemAccessoryView:](self, "_existingSystemAccessoryView:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v3);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __85___UIFontPickerTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v4[3] = &unk_2502125A8;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontPickerTableViewCellAccessibility;
  -[_UIFontPickerTableViewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIFontPickerTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
