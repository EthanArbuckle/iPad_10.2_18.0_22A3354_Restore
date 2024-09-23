@implementation _TVSwipeUpMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVSwipeUpMessageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVSwipeUpMessageView"), CFSTR("messageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVSwipeUpMessageView"), CFSTR("isEnabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("fullscreen.button"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilityAllowsActivationWithoutBeingNativeFocused
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

@end
