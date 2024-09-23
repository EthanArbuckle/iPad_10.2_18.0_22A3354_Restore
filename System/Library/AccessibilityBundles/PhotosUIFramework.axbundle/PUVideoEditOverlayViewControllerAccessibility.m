@implementation PUVideoEditOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUVideoEditOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axSubjectIndicatorWasFocused
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_setAXSubjectIndicatorWasFocused:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoEditOverlayViewController"), CFSTR("_setState:forView:animated:"), "v", "q", "@", "B", 0);
}

- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  _BOOL4 v10;
  objc_super v11;

  v5 = a5;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUVideoEditOverlayViewControllerAccessibility;
  -[PUVideoEditOverlayViewControllerAccessibility _setState:forView:animated:](&v11, sel__setState_forView_animated_, a3, v8, v5);
  if ((unint64_t)(a3 - 1) <= 4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "accessibilityElementIsFocused") & 1) != 0)
    {

    }
    else
    {
      v10 = -[PUVideoEditOverlayViewControllerAccessibility _axSubjectIndicatorWasFocused](self, "_axSubjectIndicatorWasFocused");

      if (v10)
        UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v8);
    }
  }

}

@end
