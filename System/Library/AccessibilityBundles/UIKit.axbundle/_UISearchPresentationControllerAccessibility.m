@implementation _UISearchPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchPresentationController");
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
  v3 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISearchPresentationController"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPresentationController"), CFSTR("_accessibilityPresentationControllerModalizes"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityPresentationControllerModalizes
{
  objc_super v3;
  SEL v4;
  _UISearchPresentationControllerAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationControllerAccessibility;
  return -[_UISearchPresentationControllerAccessibility _accessibilityPresentationControllerModalizes](&v3, sel__accessibilityPresentationControllerModalizes);
}

@end
