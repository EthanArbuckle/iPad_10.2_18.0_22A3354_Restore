@implementation _CNAtomFieldEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CNAtomFieldEditor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNAtomTextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomTextView"), CFSTR("placeholderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_CNAtomFieldEditor"), CFSTR("UIView"));
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHomeScreenWindow"), CFSTR("UIWindow"));

}

- (id)_axAtomTextViewAncestor
{
  void *v2;
  void *v3;

  -[_CNAtomFieldEditorAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CNAtomTextView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAtomFieldEditorAccessibility;
  -[_CNAtomFieldEditorAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v3 = _AXTraitsRemoveTrait();
  -[_CNAtomFieldEditorAccessibility _axAtomTextViewAncestor](self, "_axAtomTextViewAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits") | v3;

  return v5;
}

- (id)accessibilityPlaceholderValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_CNAtomFieldEditorAccessibility _axAtomTextViewAncestor](self, "_axAtomTextViewAncestor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityCanBeFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  char v8;

  if (_accessibilityCanBeFirstResponder_onceToken != -1)
    dispatch_once(&_accessibilityCanBeFirstResponder_onceToken, &__block_literal_global_0);
  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_CNAtomFieldEditorAccessibility;
    v5 = -[_CNAtomFieldEditorAccessibility _accessibilityCanBeFirstResponder](&v7, sel__accessibilityCanBeFirstResponder);
  }

  return v5;
}

@end
