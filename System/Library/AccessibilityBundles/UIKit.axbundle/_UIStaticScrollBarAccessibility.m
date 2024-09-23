@implementation _UIStaticScrollBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStaticScrollBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStaticScrollBar");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  v4 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_upButton"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_downButton"), v4);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  _UIStaticScrollBarAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIStaticScrollBarAccessibility;
  -[_UIStaticScrollBarAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[_UIStaticScrollBarAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_upButton"));
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("ScrollUp"));

  v3 = (id)-[_UIStaticScrollBarAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_downButton"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ScrollDown"));

}

- (void)willMoveToWindow:(id)a3
{
  objc_super v3;
  id location[2];
  _UIStaticScrollBarAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIStaticScrollBarAccessibility;
  -[_UIStaticScrollBarAccessibility willMoveToWindow:](&v3, sel_willMoveToWindow_, location[0]);
  -[_UIStaticScrollBarAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

@end
