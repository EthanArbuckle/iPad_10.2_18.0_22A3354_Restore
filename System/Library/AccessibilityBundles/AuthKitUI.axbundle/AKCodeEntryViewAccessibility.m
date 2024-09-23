@implementation AKCodeEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKCodeEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKCodeEntryView"), CFSTR("_stringValue"), "NSMutableString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKCodeEntryViewAccessibility;
  return *MEMORY[0x24BEBB198] | -[AKCodeEntryViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB128];
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[AKCodeEntryViewAccessibility _axVerificationCodeString](self, "_axVerificationCodeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  accessibilityLocalizedString(CFSTR("verification.code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("verificarion.code.values.entered"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v3, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityAttributedValue
{
  void *v2;
  void *v3;

  -[AKCodeEntryViewAccessibility _axVerificationCodeString](self, "_axVerificationCodeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC78]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_axVerificationCodeString
{
  return (id)-[AKCodeEntryViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_stringValue"));
}

@end
