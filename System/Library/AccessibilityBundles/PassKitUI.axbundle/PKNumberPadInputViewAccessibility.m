@implementation PKNumberPadInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKNumberPadInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKBorderedButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKNumberPadInputView"), CFSTR("_createBorderedButtonForButtonValue:withBorder:primaryAction:"), "Q", "Q", "@", 0);

}

- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKNumberPadInputViewAccessibility;
  -[PKNumberPadInputViewAccessibility _createBorderedButtonForButtonValue:withBorder:primaryAction:](&v15, sel__createBorderedButtonForButtonValue_withBorder_primaryAction_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a3 == 11)
  {
    objc_msgSend(v10, "setAccessibilityTextualContext:", *MEMORY[0x24BDFF750]);
  }
  else if (a3 == 10)
  {
    accessibilityLocalizedString(CFSTR("keypad.delete"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityValue:", v12);

    v13 = objc_msgSend(v11, "accessibilityTraits");
    objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BEBB108] | v13);
  }

  return v9;
}

@end
