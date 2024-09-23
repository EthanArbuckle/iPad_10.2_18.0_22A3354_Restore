@implementation CKAvatarNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarNavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKAvatarNavigationBar"), CFSTR("UINavigationBar"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKNavigationBarCanvasView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationBarCanvasView"), CFSTR("leftItemView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKCanvasBackButtonView"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;
  char v9;

  -[CKAvatarNavigationBarAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("topItem._canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKNavigationBarCanvasView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("leftItemView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKCanvasBackButtonView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)CKAvatarNavigationBarAccessibility;
    v6 = -[CKAvatarNavigationBarAccessibility accessibilityPerformEscape](&v8, sel_accessibilityPerformEscape);
    goto LABEL_6;
  }
  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActionsForControlEvents:", 64);

  v6 = 1;
LABEL_6:

  return v6;
}

- (id)accessibilityElements
{
  return 0;
}

@end
