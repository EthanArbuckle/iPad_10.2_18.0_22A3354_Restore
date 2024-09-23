@implementation PKTextInputHandwritingShotAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKTextInputHandwritingShot");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTextInputHandwritingShot"), CFSTR("_shouldTargetFirstResponderElement:strokeIdentifiers:"), "B", "@", "@", 0);
}

- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKTextInputHandwritingShotAccessibility;
    v8 = -[PKTextInputHandwritingShotAccessibility _shouldTargetFirstResponderElement:strokeIdentifiers:](&v10, sel__shouldTargetFirstResponderElement_strokeIdentifiers_, v6, v7);
  }

  return v8;
}

@end
