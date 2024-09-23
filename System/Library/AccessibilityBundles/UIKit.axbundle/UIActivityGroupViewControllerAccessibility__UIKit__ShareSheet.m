@implementation UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIActivityGroupViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UICollectionViewController");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v6 = CFSTR("UIViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = CFSTR("UIActivityGroupViewController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v5, v6);
  objc_storeStrong(v8, v7);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet;
  -[UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet viewDidLoad](&v2, sel_viewDidLoad);
  -[UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet;
  -[UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v4 = (id)-[UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet safeValueForKey:](v7, "safeValueForKey:", CFSTR("collectionView"));
  objc_msgSend(v4, "setAccessibilityShouldSpeakItemReorderEvents:", 1);
  v2 = v4;
  v3 = (id)-[UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet safeValueForKey:](v7, "safeValueForKey:", CFSTR("title"));
  objc_msgSend(v2, "setAccessibilityIdentifier:");

  objc_storeStrong(&v4, 0);
}

@end
