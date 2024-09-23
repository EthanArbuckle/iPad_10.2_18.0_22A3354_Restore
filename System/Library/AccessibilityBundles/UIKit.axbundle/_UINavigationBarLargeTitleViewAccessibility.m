@implementation _UINavigationBarLargeTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UINavigationBarLargeTitleView");
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
  v3 = CFSTR("_UINavigationBarLargeTitleView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UINavigationBarLargeTitleView"), CFSTR("initWithFrame:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_layout"), "_UINavigationBarLargeTitleViewLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UINavigationBarLargeTitleViewLayout"), CFSTR("titleLabel"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  _UINavigationBarLargeTitleViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  -[_UINavigationBarLargeTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[_UINavigationBarLargeTitleViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_layout"));
  v2 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("titleLabel"));
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (_UINavigationBarLargeTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  _UINavigationBarLargeTitleViewAccessibility *v4;
  objc_super v5;
  id v6[2];
  _UINavigationBarLargeTitleViewAccessibility *v7;
  CGRect v8;

  v8 = a3;
  v6[1] = (id)a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  v7 = -[_UINavigationBarLargeTitleViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  -[_UINavigationBarLargeTitleViewAccessibility _accessibilityLoadAccessibilityInformation](v7, "_accessibilityLoadAccessibilityInformation");
  v4 = (_UINavigationBarLargeTitleViewAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  SEL v4;
  _UINavigationBarLargeTitleViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  -[_UINavigationBarLargeTitleViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  v2 = (id)-[_UINavigationBarLargeTitleViewAccessibility _accessibilityFindAncestor:startWithSelf:](v5, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_54, 0);
  objc_msgSend(v2, "_accessibility_navigationBarContentsDidChange");
  objc_storeStrong(&v2, 0);
}

@end
