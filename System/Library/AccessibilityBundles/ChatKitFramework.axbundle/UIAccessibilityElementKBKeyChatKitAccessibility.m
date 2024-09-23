@implementation UIAccessibilityElementKBKeyChatKitAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAccessibilityElementKBKey");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIAccessibilityElementKBKey"), CFSTR("_key"), "UIKBTree");
  objc_msgSend(v3, "validateClass:", CFSTR("UIKBTree"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBTree"), CFSTR("name"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[UIAccessibilityElementKBKeyChatKitAccessibility _axKeyName](self, "_axKeyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AXDeviceIsPad() & 1) != 0 || !objc_msgSend(v3, "isEqualToString:", CFSTR("Dismiss-Key")))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
    -[UIAccessibilityElementKBKeyChatKitAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("handwriting.key.name"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementKBKeyChatKitAccessibility _axKeyName](self, "_axKeyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AXDeviceIsPad() & 1) != 0 || (objc_msgSend(v3, "isEqualToString:", CFSTR("Dismiss-Key")) & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
    -[UIAccessibilityElementKBKeyChatKitAccessibility accessibilityHint](&v6, sel_accessibilityHint);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
  -[UIAccessibilityElementKBKeyChatKitAccessibility accessibilityCustomRotors](&v5, sel_accessibilityCustomRotors);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  addFirstResponderRotorsToRotorArray(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axKeyName
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[UIAccessibilityElementKBKeyChatKitAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
