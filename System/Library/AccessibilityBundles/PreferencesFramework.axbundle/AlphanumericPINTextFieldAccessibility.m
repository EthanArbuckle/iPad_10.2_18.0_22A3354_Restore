@implementation AlphanumericPINTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AlphanumericPINTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AlphanumericPINTextField"), CFSTR("UITextField"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PINView"), CFSTR("notifyDelegatePINChanged"), "v", 0);

}

- (void)_accessibilityInsertText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AlphanumericPINTextFieldAccessibility;
  -[AlphanumericPINTextFieldAccessibility _accessibilityInsertText:](&v3, sel__accessibilityInsertText_, a3);
  AXPerformSafeBlock();
}

void __66__AlphanumericPINTextFieldAccessibility__accessibilityInsertText___block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegatePINChanged");

}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlphanumericPINTextFieldAccessibility;
  -[AlphanumericPINTextFieldAccessibility _accessibilityReplaceCharactersAtCursor:withString:](&v4, sel__accessibilityReplaceCharactersAtCursor_withString_, a3, a4);
  AXPerformSafeBlock();
}

void __92__AlphanumericPINTextFieldAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegatePINChanged");

}

@end
