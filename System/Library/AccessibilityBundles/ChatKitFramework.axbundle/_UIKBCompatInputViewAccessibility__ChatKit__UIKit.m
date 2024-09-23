@implementation _UIKBCompatInputViewAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKBCompatInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuWindow"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("sharedInstance"), "@", 0);

}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  void *v3;

  objc_opt_class();
  -[objc_class sharedInstance](NSClassFromString(CFSTR("CKActionMenuWindow")), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "isHidden") ^ 1;
  return (char)v2;
}

@end
