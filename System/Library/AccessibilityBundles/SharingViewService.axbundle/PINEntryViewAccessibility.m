@implementation PINEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PINEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PINEntryView"), CFSTR("_text"), "NSMutableString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PINEntryView"), CFSTR("_digits"), "NSArray");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  v6 = 0;
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_digits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = v7 - objc_msgSend(v4, "length");

  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("pin.values"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("pin.code"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_250355630);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB128] | *MEMORY[0x24BEBB198];
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PINEntryViewAccessibility;
  -[PINEntryViewAccessibility _updateLabels](&v7, sel__updateLabels);
  -[PINEntryViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXLastSentValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], 0);
    -[PINEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINEntryViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXLastSentValue"));

  }
}

@end
