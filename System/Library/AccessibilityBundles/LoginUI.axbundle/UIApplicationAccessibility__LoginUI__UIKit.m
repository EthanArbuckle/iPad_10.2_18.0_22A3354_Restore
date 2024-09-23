@implementation UIApplicationAccessibility__LoginUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LUIUserLoginPasswordViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LUIPasscodeView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIPasscodeView"), CFSTR("passCodeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewWithKeypad"), CFSTR("_numberPad"), "@", 0);

}

- (id)_accessibilitySoftwareMimicKeyboard
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  char v28;
  char v29;

  if (_accessibilitySoftwareMimicKeyboard_onceToken != -1)
    dispatch_once(&_accessibilitySoftwareMimicKeyboard_onceToken, &__block_literal_global_0);
  if (_accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController)
    v3 = _accessibilitySoftwareMimicKeyboard_LUIPasscodeView == 0;
  else
    v3 = 1;
  if (v3)
  {
    v25 = _accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController;
    v26 = _accessibilitySoftwareMimicKeyboard_LUIPasscodeView;
    v24 = CFSTR("Could not find classes: LUIUserLoginPasswordViewController=%@, LUIPasscodeView=%@");
    v23 = 1;
    _AXLogWithFacility();
LABEL_16:
    v27.receiver = self;
    v27.super_class = (Class)UIApplicationAccessibility__LoginUI__UIKit;
    -[UIApplicationAccessibility__LoginUI__UIKit _accessibilitySoftwareMimicKeyboard](&v27, sel__accessibilitySoftwareMimicKeyboard, v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    return v21;
  }
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMainWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_199);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_15:

    goto LABEL_16;
  }
  v8 = v7;
  v29 = 0;
  objc_opt_class();
  objc_msgSend(v6, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", &__block_literal_global_202);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v10, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v28 = 0;
  objc_msgSend(v16, "safeValueForKey:", CFSTR("passCodeView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAccessibilityCastAsClass();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_opt_class();
  objc_msgSend(v19, "safeValueForKey:", CFSTR("_numberPad"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v21, "_accessibilityViewIsVisible") & 1) == 0)
  {

    goto LABEL_14;
  }

  return v21;
}

- (id)_accessibilityActiveKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "window"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMainWindow"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    v7 = v4;
    v8 = v7;
    while (1)
    {
      MEMORY[0x2349129A8](CFSTR("LUIPasscodeView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
          break;
      }
      objc_msgSend(v8, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
      if (!v9)
        goto LABEL_7;
    }
    v10 = v7;

  }
  else
  {
LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)UIApplicationAccessibility__LoginUI__UIKit;
    -[UIApplicationAccessibility__LoginUI__UIKit _accessibilityActiveKeyboard](&v12, sel__accessibilityActiveKeyboard);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
