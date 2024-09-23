@implementation AAUISignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AAUISignInViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AAUISignInViewController"), CFSTR("_usernameCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AAUISignInViewController"), CFSTR("_passwordCell"), "@", 0);

}

- (id)_usernameCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)AAUISignInViewControllerAccessibility;
  -[AAUISignInViewControllerAccessibility _usernameCell](&v9, sel__usernameCell);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    abort();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  objc_msgSend(v4, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

  return v4;
}

- (id)_passwordCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)AAUISignInViewControllerAccessibility;
  -[AAUISignInViewControllerAccessibility _passwordCell](&v10, sel__passwordCell);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    abort();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

  objc_msgSend(v4, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v8);

  return v4;
}

@end
