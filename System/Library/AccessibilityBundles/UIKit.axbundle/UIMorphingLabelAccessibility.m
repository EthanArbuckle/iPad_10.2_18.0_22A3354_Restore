@implementation UIMorphingLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIMorphingLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIMorphingLabel"), CFSTR("text"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UIMorphingLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"), a2, self);
}

@end
