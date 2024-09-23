@implementation PKEnterCurrencyAmountViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKEnterCurrencyAmountView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnterCurrencyAmountView"), CFSTR("amountTextField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnterCurrencyAmountView"), CFSTR("textField:shouldChangeCharactersInRange:replacementString:"), "B", "@", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnterCurrencyAmountView"), CFSTR("amountLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnterCurrencyAmountView"), CFSTR("amountString"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[PKEnterCurrencyAmountViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKEnterCurrencyAmountViewAccessibility;
    -[PKEnterCurrencyAmountViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("currency.amount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  return (id)-[PKEnterCurrencyAmountViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("amountLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  -[PKEnterCurrencyAmountViewAccessibility accessibilityValue](self, "accessibilityValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  v4 = v3;
  v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  objc_super v30;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  -[PKEnterCurrencyAmountViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("amountTextField"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityElementsHidden:", 1);

  -[PKEnterCurrencyAmountViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("amountString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v30.receiver = self;
  v30.super_class = (Class)PKEnterCurrencyAmountViewAccessibility;
  v14 = -[PKEnterCurrencyAmountViewAccessibility textField:shouldChangeCharactersInRange:replacementString:](&v30, sel_textField_shouldChangeCharactersInRange_replacementString_, v10, location, length, v9);

  -[PKEnterCurrencyAmountViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("amountString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  if (v16 && (objc_msgSend(v16, "isEqualToString:", v13) & 1) == 0)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "groupingSeparator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("0")) && objc_msgSend(v13, "length") == 1)
    {
      v19 = v13;
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("0")) && objc_msgSend(v16, "length") == 1)
      {
        v20 = v16;
        v21 = 0;
        goto LABEL_18;
      }
      v22 = objc_msgSend(v16, "length");
      v23 = objc_msgSend(v13, "length");
      v24 = objc_msgSend(v16, "length");
      if (v22 >= v23)
      {
        if (v24 <= objc_msgSend(v13, "length"))
          goto LABEL_23;
        objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v13, "length"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        if (!v20)
          goto LABEL_23;
        goto LABEL_18;
      }
      objc_msgSend(v13, "substringFromIndex:", v24);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    v21 = 1;
    if (!v19)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:
    if (v18)
    {
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", v18, &stru_2502E3F40);
      v25 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v25;
    }
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = (_QWORD *)MEMORY[0x24BDFECC0];
    if (!v21)
      v28 = (_QWORD *)MEMORY[0x24BDFECC8];
    objc_msgSend(v26, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *v28);
    objc_msgSend(v27, "setAttribute:forKey:", &unk_2502F2BD8, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v27);

    goto LABEL_23;
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("0"))
    && objc_msgSend(v13, "isEqualToString:", CFSTR("0")))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  }
LABEL_24:

  return v14;
}

@end
