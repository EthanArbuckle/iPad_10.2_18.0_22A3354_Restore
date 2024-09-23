@implementation _UIContinuousSelectionGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContinuousSelectionGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIGestureRecognizer");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIContinuousSelectionGestureRecognizer"));
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIGestureRecognizer"), CFSTR("_supportsTouchContinuation"), "B", 0);
  objc_storeStrong(v5, obj);
}

+ (BOOL)_supportsTouchContinuation
{
  objc_super v3;
  SEL v4;
  id v5;

  v5 = a1;
  v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_METACLASS____UIContinuousSelectionGestureRecognizerAccessibility;
  return objc_msgSendSuper2(&v3, sel__supportsTouchContinuation) & 1;
}

@end
