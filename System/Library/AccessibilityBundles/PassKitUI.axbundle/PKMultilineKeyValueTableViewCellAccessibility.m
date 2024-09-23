@implementation PKMultilineKeyValueTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKMultilineKeyValueTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKMultilineKeyValueTableViewCell"), CFSTR("_keyLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKMultilineKeyValueTableViewCell"), CFSTR("_valueLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PKMultilineKeyValueTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_keyLabel"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKMultilineKeyValueTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_valueLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKPANMask();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "hasPrefix:", v5);

  if ((_DWORD)v3)
  {
    v6 = (void *)MEMORY[0x24BDFEA60];
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("ends.with"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axAttributedStringWithString:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC78]);
  }
  else
  {
    v10 = v4;
  }

  return v10;
}

@end
