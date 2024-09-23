@implementation PSPasscodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSPasscodeField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSPasscodeField"), CFSTR("numberOfEntryFields"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSPasscodeField"), CFSTR("stringValue"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSPasscodeFieldAccessibility;
  return *MEMORY[0x24BEBB168] | -[PSPasscodeFieldAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB198];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("passcode.display"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[PSPasscodeFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfEntryFields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PSPasscodeFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("passcode.values.entered"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
