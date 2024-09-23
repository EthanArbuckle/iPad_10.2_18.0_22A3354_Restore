@implementation TextViewWithPlaceHolderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.TextViewWithPlaceHolder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TextViewWithPlaceHolder"), CFSTR("_axPlaceholderTextView"), "@", 0);
}

- (id)accessibilityPlaceholderValue
{
  return accessibilityLocalizedString(CFSTR("enter.text.placeholder"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TextViewWithPlaceHolderAccessibility;
  -[TextViewWithPlaceHolderAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[TextViewWithPlaceHolderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axPlaceholderTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

}

@end
