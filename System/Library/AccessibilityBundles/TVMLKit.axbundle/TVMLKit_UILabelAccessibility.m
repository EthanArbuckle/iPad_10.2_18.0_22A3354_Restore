@implementation TVMLKit_UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("UIIndexBarView"));
}

- (BOOL)_isAccessibilityExplorerElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[TVMLKit_UILabelAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIIndexBarView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TVMLKit_UILabelAccessibility;
    v4 = -[TVMLKit_UILabelAccessibility _isAccessibilityExplorerElement](&v6, sel__isAccessibilityExplorerElement);
  }

  return v4;
}

@end
