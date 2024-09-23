@implementation PKPinCodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPinCodeField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPinCodeField"), CFSTR("_pinCode"), "NSMutableString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPinCodeField"), CFSTR("_pinCodeLength"), "Q");

}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[PKPinCodeFieldAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_pinCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = -[PKPinCodeFieldAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_pinCodeLength"));

  v6 = v4;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
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
  void *v7;
  void *v9;

  accessibilityLocalizedString(CFSTR("pin.code.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("pin.code.values"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPinCodeFieldAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_pinCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, objc_msgSend(v6, "length"), -[PKPinCodeFieldAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_pinCodeLength")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDFEA60];
  -[PKPinCodeFieldAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_pinCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axAttributedStringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDF7378]);
  return v4;
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB128] | *MEMORY[0x24BEBB198];
}

@end
