@implementation PREditingAmbientContentStylePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingAmbientContentStylePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditingAmbientContentStylePickerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingAmbientContentStylePickerViewController"), CFSTR("selectedItemView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingAmbientContentStylePickerViewController"), CFSTR("didTapContentStyleItemView:"), "v", "@", 0);

}

- (void)didTapContentStyleItemView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PREditingAmbientContentStylePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedItemView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x24BDF73B0];
  if (v5)
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v9.receiver = self;
  v9.super_class = (Class)PREditingAmbientContentStylePickerViewControllerAccessibility;
  -[PREditingAmbientContentStylePickerViewControllerAccessibility didTapContentStyleItemView:](&v9, sel_didTapContentStyleItemView_, v4);
  -[PREditingAmbientContentStylePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedItemView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF7400] | *v7);

}

@end
