@implementation UIViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsCheckingWhetherOverridesInvisibility
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsCheckingWhetherOverridesInvisibility:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("UIDimmingView"));
}

- (BOOL)_accessibilityOverridesInvisibility
{
  void *v2;
  BOOL v4;
  int v5;
  objc_super v7;
  objc_super v8;

  if (!-[UIViewAccessibility__MessageUI__UIKit _axIsCheckingWhetherOverridesInvisibility](self, "_axIsCheckingWhetherOverridesInvisibility"))
  {
    -[UIViewAccessibility__MessageUI__UIKit _axSetIsCheckingWhetherOverridesInvisibility:](self, "_axSetIsCheckingWhetherOverridesInvisibility:", 1);
    v5 = _AXSAutomationEnabled();
    if (v5
      && (-[UIViewAccessibility__MessageUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "isEqualToString:", CFSTR("RecipientAtomContainerView")) & 1) != 0))
    {
      v4 = 1;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)UIViewAccessibility__MessageUI__UIKit;
      v4 = -[UIViewAccessibility__MessageUI__UIKit _accessibilityOverridesInvisibility](&v7, sel__accessibilityOverridesInvisibility);
      if (!v5)
      {
LABEL_8:
        -[UIViewAccessibility__MessageUI__UIKit _axSetIsCheckingWhetherOverridesInvisibility:](self, "_axSetIsCheckingWhetherOverridesInvisibility:", 0);
        return v4;
      }
    }

    goto LABEL_8;
  }
  v8.receiver = self;
  v8.super_class = (Class)UIViewAccessibility__MessageUI__UIKit;
  return -[UIViewAccessibility__MessageUI__UIKit _accessibilityOverridesInvisibility](&v8, sel__accessibilityOverridesInvisibility);
}

@end
