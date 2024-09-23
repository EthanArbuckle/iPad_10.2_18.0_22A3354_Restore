@implementation PKPaymentPassTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentPassTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaymentPassTableCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("specifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentPassTableCell"), CFSTR("_subTextLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentPassTableCell"), CFSTR("_pass"), "PKPaymentPass");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSecureElementPass"), CFSTR("primaryAccountNumberSuffix"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentPassTableCell"), CFSTR("initWithStyle: reuseIdentifier: specifier:"), "@", "q", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
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
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  char v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassTableCellAccessibility;
  -[PKPaymentPassTableCellAccessibility _accessibilityLoadAccessibilityInformation](&v28, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PKPaymentPassTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PKPaymentPassTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_opt_class();
  -[PKPaymentPassTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v8 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "isStoredValuePass");

  PKSanitizedPrimaryAccountRepresentationForPass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v4, "text");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "length") || !v6)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v11);

    if (v15)
    {
      objc_msgSend(v4, "accessibilityLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invertedSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", &stru_2502E3F40);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDFEA60];
      v21 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("ends.with"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "axAttributedStringWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC78]);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __81__PKPaymentPassTableCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v25[3] = &unk_2502E3D48;
      v26 = v24;
      v13 = v24;
      objc_msgSend(v4, "_setAccessibilityLabelBlock:", v25);

      goto LABEL_7;
    }
  }
LABEL_9:

}

id __81__PKPaymentPassTableCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  objc_super v5;
  objc_super v6;

  -[PKPaymentPassTableCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentPassTableCellAccessibility;
    return -[PKPaymentPassTableCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits) & (*MEMORY[0x24BDF73E8] == 0);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentPassTableCellAccessibility;
    return -[PKPaymentPassTableCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  }
}

- (PKPaymentPassTableCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PKPaymentPassTableCellAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassTableCellAccessibility;
  v5 = -[PKPaymentPassTableCellAccessibility initWithStyle:reuseIdentifier:specifier:](&v7, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  -[PKPaymentPassTableCellAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

@end
