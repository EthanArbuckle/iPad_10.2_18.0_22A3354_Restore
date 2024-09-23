@implementation CNPropertyPhoneNumberEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyPhoneNumberEditingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberEditingCellAccessibility;
  -[CNPropertyPhoneNumberEditingCellAccessibility accessibilityValue](&v5, sel_accessibilityValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC08]);

  return v3;
}

@end
