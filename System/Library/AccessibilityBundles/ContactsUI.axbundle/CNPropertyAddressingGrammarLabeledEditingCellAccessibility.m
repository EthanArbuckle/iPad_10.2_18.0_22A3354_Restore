@implementation CNPropertyAddressingGrammarLabeledEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyAddressingGrammarLabeledEditingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPropertyAddressingGrammarLabeledEditingCell"), CFSTR("CNPropertySimpleEditingCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("textField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("labelButton"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[CNPropertyAddressingGrammarLabeledEditingCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("textField.placeholder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyAddressingGrammarLabeledEditingCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("textField.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CNPropertyAddressingGrammarLabeledEditingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[CNPropertyAddressingGrammarLabeledEditingCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __100__CNPropertyAddressingGrammarLabeledEditingCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490B8B0](CFSTR("UITableViewCellReorderControl"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPropertyAddressingGrammarLabeledEditingCellAccessibility;
  return *MEMORY[0x24BDF73B0] & -[CNPropertyAddressingGrammarLabeledEditingCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
