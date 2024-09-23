@implementation WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("MFSignatureTextView"));
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v3;
  objc_super v5;

  -[WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491514C](CFSTR("MFSignatureTextView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore;
  return -[WebAccessibilityObjectWrapperAccessibility__MobileMail__WebCore accessibilityRespondsToUserInteraction](&v5, sel_accessibilityRespondsToUserInteraction);
}

@end
