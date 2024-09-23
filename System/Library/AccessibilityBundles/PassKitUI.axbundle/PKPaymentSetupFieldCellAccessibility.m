@implementation PKPaymentSetupFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentSetupFieldCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaymentSetupFieldCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentSetupFieldCell"), CFSTR("_paymentSetupField"), "PKPaymentSetupField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupFieldCell"), CFSTR("editableTextField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupField"), CFSTR("isFieldTypeDate"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupField"), CFSTR("isFieldTypeText"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupField"), CFSTR("isFieldTypePicker"), "B", 0);

}

- (BOOL)_axIsPickerType
{
  void *v3;
  char v4;
  void *v5;

  -[PKPaymentSetupFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_paymentSetupField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isFieldTypeDate")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PKPaymentSetupFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_paymentSetupField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isFieldTypePicker"));

  }
  return v4;
}

- (BOOL)_axIsTextFieldType
{
  void *v2;
  char v3;

  -[PKPaymentSetupFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_paymentSetupField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isFieldTypeText"));

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  -[PKPaymentSetupFieldCellAccessibility layoutSubviews](&v9, sel_layoutSubviews);
  objc_initWeak(&location, self);
  if (-[PKPaymentSetupFieldCellAccessibility _axIsPickerType](self, "_axIsPickerType"))
  {
    -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editableTextField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

    -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editableTextField"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySetTextViewIgnoresValueChanges:", 1);

  }
  else if (-[PKPaymentSetupFieldCellAccessibility _axIsTextFieldType](self, "_axIsTextFieldType"))
  {
    -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editableTextField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__PKPaymentSetupFieldCellAccessibility_layoutSubviews__block_invoke;
    v6[3] = &unk_2502E3938;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v6);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

id __54__PKPaymentSetupFieldCellAccessibility_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[PKPaymentSetupFieldCellAccessibility _axIsPickerType](self, "_axIsPickerType"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  return -[PKPaymentSetupFieldCellAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editableTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    -[PKPaymentSetupFieldCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[PKPaymentSetupFieldCellAccessibility _axIsPickerType](self, "_axIsPickerType"))
    return *MEMORY[0x24BDF73B0];
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
  return -[PKPaymentSetupFieldCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[PKPaymentSetupFieldCellAccessibility _axIsPickerType](self, "_axIsPickerType"))
  {
    -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editableTextField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    -[PKPaymentSetupFieldCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[PKPaymentSetupFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldCellAccessibility;
    -[PKPaymentSetupFieldCellAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end
