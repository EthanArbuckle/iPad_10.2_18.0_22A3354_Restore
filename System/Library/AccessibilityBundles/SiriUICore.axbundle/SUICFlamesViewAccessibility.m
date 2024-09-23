@implementation SUICFlamesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUICFlamesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUICFlamesView"), CFSTR("_flamesDelegate"), "<SUICFlamesViewDelegate>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUICFlamesView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_accessibilityViewIsVisible"))
    v3 = objc_msgSend(v2, "_accessibilityWindowVisible");
  else
    v3 = 0;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("waveform.label"));
}

@end
