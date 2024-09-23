@implementation CCUIButtonModuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIButtonModuleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIButtonModuleView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIButtonModuleView"), CFSTR("_highlightedBackgroundView"), "UIView");

}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  UIBezierPath *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDF6870];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CCUIButtonModuleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_highlightedBackgroundView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_continuousCornerRadius");
  objc_msgSend(v3, "_bezierPathWithPillRect:cornerRadius:", v6, v8, v10, v12, v14);
  v15 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v15, (UIView *)self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CCUIButtonModuleViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUIButtonModuleViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(v4, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "_accessibilityViewIsVisible");

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_accesibilityRawTraits
{
  void *v2;
  void *v3;
  unint64_t v4;
  int v5;
  uint64_t v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *MEMORY[0x24BDF73B0];
  if (v2)
  {
    v5 = objc_msgSend(v2, "isEnabled");
    v6 = *MEMORY[0x24BDF73E8];
    if (v5)
      v6 = 0;
    v4 |= v6;
    if (objc_msgSend(v3, "isSelected"))
      v4 |= *MEMORY[0x24BDF7400];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[CCUIButtonModuleViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  else
    v5 = -[CCUIButtonModuleViewAccessibility _accesibilityRawTraits](self, "_accesibilityRawTraits");
  v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIButtonModuleViewAccessibility;
  -[CCUIButtonModuleViewAccessibility accessibilityCustomActions](&v5, sel_accessibilityCustomActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  return v3;
}

@end
