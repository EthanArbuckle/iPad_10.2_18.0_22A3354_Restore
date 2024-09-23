@implementation CCUIToggleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIToggleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIToggleViewController"), CFSTR("module"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIToggleViewController"), CFSTR("CCUIButtonModuleViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewControllerAccessibility"), CFSTR("_accessibilityControlCenterButtonLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewControllerAccessibility"), CFSTR("_accessibilityControlCenterButtonIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewControllerAccessibility"), CFSTR("_accessibilityControlCenterButtonHint"), "@", 0);

}

- (id)_accessibilityControlCenterButtonLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD block[5];

  -[CCUIToggleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_accessibilityControlCenterButtonLabel");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonLabel__block_invoke;
    block[3] = &unk_2501E3258;
    block[4] = self;
    if (_accessibilityControlCenterButtonLabel_onceToken != -1)
      dispatch_once(&_accessibilityControlCenterButtonLabel_onceToken, block);
    if (!_accessibilityControlCenterButtonLabel_superclassMethodAvailable)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    -[CCUIToggleViewControllerAccessibility _accessibilityControlCenterButtonLabel](&v7, sel__accessibilityControlCenterButtonLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

Method __79__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonLabel__block_invoke()
{
  objc_class *v0;
  objc_class *Superclass;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonLabel);
  _accessibilityControlCenterButtonLabel_superclassMethodAvailable = result != 0;
  if (!result)
    return (Method)_AXAssert();
  return result;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD block[5];

  -[CCUIToggleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_accessibilityControlCenterButtonIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonIdentifier__block_invoke;
    block[3] = &unk_2501E3258;
    block[4] = self;
    if (_accessibilityControlCenterButtonIdentifier_onceToken != -1)
      dispatch_once(&_accessibilityControlCenterButtonIdentifier_onceToken, block);
    if (!_accessibilityControlCenterButtonIdentifier_superclassMethodAvailable)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    -[CCUIToggleViewControllerAccessibility _accessibilityControlCenterButtonIdentifier](&v7, sel__accessibilityControlCenterButtonIdentifier);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

Method __84__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonIdentifier__block_invoke()
{
  objc_class *v0;
  objc_class *Superclass;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonIdentifier);
  _accessibilityControlCenterButtonIdentifier_superclassMethodAvailable = result != 0;
  if (!result)
    return (Method)_AXAssert();
  return result;
}

- (id)_accessibilityControlCenterButtonHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD block[5];

  -[CCUIToggleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_accessibilityControlCenterButtonHint");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonHint__block_invoke;
    block[3] = &unk_2501E3258;
    block[4] = self;
    if (_accessibilityControlCenterButtonHint_onceToken != -1)
      dispatch_once(&_accessibilityControlCenterButtonHint_onceToken, block);
    if (!_accessibilityControlCenterButtonHint_superclassMethodAvailable)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v7.receiver = self;
    v7.super_class = (Class)CCUIToggleViewControllerAccessibility;
    -[CCUIToggleViewControllerAccessibility _accessibilityControlCenterButtonHint](&v7, sel__accessibilityControlCenterButtonHint);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

Method __78__CCUIToggleViewControllerAccessibility__accessibilityControlCenterButtonHint__block_invoke()
{
  objc_class *v0;
  objc_class *Superclass;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  Superclass = class_getSuperclass(v0);
  result = class_getInstanceMethod(Superclass, sel__accessibilityControlCenterButtonHint);
  _accessibilityControlCenterButtonHint_superclassMethodAvailable = result != 0;
  if (!result)
    return (Method)_AXAssert();
  return result;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  void *v2;
  char v3;

  -[CCUIToggleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityControlCenterButtonIsToggle");
  else
    v3 = 1;

  return v3;
}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  return 0;
}

@end
