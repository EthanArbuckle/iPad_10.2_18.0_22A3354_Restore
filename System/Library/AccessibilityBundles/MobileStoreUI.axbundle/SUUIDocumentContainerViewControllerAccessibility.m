@implementation SUUIDocumentContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIDocumentContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationController"), CFSTR("navigationBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationBar"), CFSTR("currentRightView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("isEnabled"), "B", 0);

}

- (id)_accessibilityRightBarButtonItem
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIDocumentContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MusicAccountNavigationController"));
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("navigationBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SUUIScrollingTabNavigationBar"));
    v3 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("currentRightView"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (id)_rightBarButtonAccessibilityLabel
{
  void *v2;
  void *v3;

  -[SUUIDocumentContainerViewControllerAccessibility _accessibilityRightBarButtonItem](self, "_accessibilityRightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_rightBarButtonIsEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIDocumentContainerViewControllerAccessibility _accessibilityRightBarButtonItem](self, "_accessibilityRightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  objc_super v20;

  v4 = a3;
  -[SUUIDocumentContainerViewControllerAccessibility _rightBarButtonAccessibilityLabel](self, "_rightBarButtonAccessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIDocumentContainerViewControllerAccessibility _rightBarButtonIsEnabled](self, "_rightBarButtonIsEnabled");
  v20.receiver = self;
  v20.super_class = (Class)SUUIDocumentContainerViewControllerAccessibility;
  -[SUUIDocumentContainerViewControllerAccessibility documentDidUpdate:](&v20, sel_documentDidUpdate_, v4);

  -[SUUIDocumentContainerViewControllerAccessibility _rightBarButtonAccessibilityLabel](self, "_rightBarButtonAccessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIDocumentContainerViewControllerAccessibility _rightBarButtonIsEnabled](self, "_rightBarButtonIsEnabled");
  if (objc_msgSend(v5, "isEqualToString:", v7) && v6 != v8)
  {
    v9 = (void *)MEMORY[0x24BDFEA60];
    v10 = (void *)MEMORY[0x24BDD17C8];
    if (v8)
    {
      accessibilityLocalizedString(CFSTR("button.enabled"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "axAttributedStringWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __70__SUUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke;
      v19[3] = &unk_2502A6990;
      v19[4] = v13;
      v14 = v19;
    }
    else
    {
      accessibilityLocalizedString(CFSTR("button.disabled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "axAttributedStringWithString:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __70__SUUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke_2;
      v18[3] = &unk_2502A6990;
      v18[4] = v13;
      v14 = v18;
    }
    v17 = v13;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __70__SUUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

void __70__SUUIDocumentContainerViewControllerAccessibility_documentDidUpdate___block_invoke_2(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

@end
