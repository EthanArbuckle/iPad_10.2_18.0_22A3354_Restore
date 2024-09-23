@implementation _UICircleProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICircleProgressIndicator");
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
  v3 = CFSTR("_UICircleProgressIndicator");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("isIndeterminate"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("circle.inprogress.indicator"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  char v5;

  v4 = (id)-[_UICircleProgressIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indeterminate"));
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    return accessibilityLocalizedString(CFSTR("circle.inprogress.indeterminate"));
  v3 = (id)-[_UICircleProgressIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progress"));
  objc_msgSend(v3, "floatValue");

  return (id)AXFormatFloatWithPercentage();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
