@implementation _UIMorphingPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIMorphingPlatterView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIMorphingPlatterView"), CFSTR("expandedTransformView"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  char v5;
  objc_super v6;
  SEL v7;
  _UIMorphingPlatterViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIMorphingPlatterViewAccessibility;
  -[_UIMorphingPlatterViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v5 = 0;
  objc_opt_class();
  v2 = (id)-[_UIMorphingPlatterViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("expandedTransformView"));
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  v3 = v4;
  objc_storeStrong(&v4, 0);
  -[_UIPlatterTransformViewAccessibility _accessibilitySetIsExpandedTransformView:]((uint64_t)v3);

}

@end
