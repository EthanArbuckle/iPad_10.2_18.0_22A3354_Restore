@implementation CNAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAtomTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomTextView"), CFSTR("clearButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNAtomTextView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomTextView"), CFSTR("placeholder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomTextView"), CFSTR("placeholderLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAtomTextViewAccessibility;
  -[CNAtomTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CNAtomTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CNAtomTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityPlaceholderValue
{
  return (id)-[CNAtomTextViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("placeholder"));
}

- (CNAtomTextViewAccessibility)initWithFrame:(CGRect)a3
{
  CNAtomTextViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAtomTextViewAccessibility;
  v3 = -[CNAtomTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CNAtomTextViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

void __60___CNAtomTextViewAccessibility_accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = (_QWORD *)MEMORY[0x24BDFEAE0];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDFEAE0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v8)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", *v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByAppendingString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + a3, a4, v12);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v12, "length") - a4;
    }

    v9 = v13;
  }

}

@end
