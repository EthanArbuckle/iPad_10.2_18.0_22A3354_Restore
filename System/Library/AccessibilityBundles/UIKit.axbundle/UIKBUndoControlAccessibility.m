@implementation UIKBUndoControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKBUndoControl");
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
  v3 = CFSTR("UIKBUndoControl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("type"), "q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3;

  v3 = -[UIKBUndoControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("type"));
  if (v3 <= 5)
    __asm { BR              X8 }
  return (id)-[UIKBUndoControlAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("label.text"));
}

@end
