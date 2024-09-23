@implementation CKBalloonTextView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBalloonTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBalloonTextView"), CFSTR("UITextView"));

}

- (id)_accessibilityQuickSpeakContent
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
