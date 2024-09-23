@implementation CNPropertyPhoneNumberCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyPhoneNumberCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertyPhoneNumberCell"), CFSTR("emergencyImageView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  -[CNPropertyPhoneNumberCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CNPropertyPhoneNumberCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("emergencyImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("contact.cell.emergency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  -[CNPropertyPhoneNumberCellAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyPhoneNumberCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("emergencyImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  -[CNPropertyPhoneNumberCellAccessibility accessibilityValue](&v5, sel_accessibilityValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC08]);

  return v3;
}

@end
