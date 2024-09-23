@implementation CNPropertyNameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyNameCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPropertyNameCell"), CFSTR("CNContactCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactCell"), CFSTR("cardGroupItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyGroupItem"), CFSTR("displayLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyNameCell"), CFSTR("textField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyNameCell"), CFSTR("setCardGroupItem:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyNameCell"), CFSTR("textFieldChanged:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPropertyNameCellAccessibility;
  -[CNPropertyNameCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CNPropertyNameCellAccessibility _updateTextFieldAccessibilityLabel](self, "_updateTextFieldAccessibilityLabel");
}

- (void)_updateTextFieldAccessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNPropertyNameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyNameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cardGroupItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("displayLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "length");
  -[CNPropertyNameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v7;
  else
    v11 = 0;
  objc_msgSend(v9, "setAccessibilityLabel:", v11);

  -[CNPropertyNameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v7);

}

- (void)setCardGroupItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNameCellAccessibility;
  -[CNPropertyNameCellAccessibility setCardGroupItem:](&v4, sel_setCardGroupItem_, a3);
  -[CNPropertyNameCellAccessibility _updateTextFieldAccessibilityLabel](self, "_updateTextFieldAccessibilityLabel");
}

- (void)textFieldChanged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNameCellAccessibility;
  -[CNPropertyNameCellAccessibility textFieldChanged:](&v4, sel_textFieldChanged_, a3);
  -[CNPropertyNameCellAccessibility _updateTextFieldAccessibilityLabel](self, "_updateTextFieldAccessibilityLabel");
}

@end
