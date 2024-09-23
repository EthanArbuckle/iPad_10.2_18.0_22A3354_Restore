@implementation _UIAlertControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIAlertControllerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  const char *v9;
  id v10;
  id *v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIAlertControllerActionView");
  v4 = CFSTR("action");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIAlertControllerView"), CFSTR("alertController"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, v4, v7, 0);
  v8 = CFSTR("UIAlertController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIAlertAction"), CFSTR("_checked"), "BOOL");
  v6 = CFSTR("_UIAlertControllerPhoneTVMacView");
  v5 = "UILabel";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_messageLabel"), v5);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_detailMessageLabel"), v5);
  v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_prepareTitleLabel"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_prepareMesssageLabel"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_prepareDetailMessageLabel"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_dismissAnimated: triggeringAction:"), v9, "B", v7, 0);
  objc_storeStrong(v11, v10);
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  unint64_t v2;
  objc_super v4;
  SEL v5;
  _UIAlertControllerViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v2 = -[_UIAlertControllerViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB0F0]) == *MEMORY[0x24BEBB0F0])
    return 6;
  v4.receiver = v6;
  v4.super_class = (Class)_UIAlertControllerViewAccessibility;
  return -[_UIAlertControllerViewAccessibility _accessibilityAutomationType](&v4, sel__accessibilityAutomationType);
}

- (unint64_t)accessibilityTraits
{
  id v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  _UIAlertControllerViewAccessibility *v8;
  unint64_t v9;

  v8 = self;
  v7[1] = (id)a2;
  v6 = 0;
  objc_opt_class();
  v3 = (id)-[_UIAlertControllerViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("alertController"));
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if (objc_msgSend(v4, "preferredStyle") == 1)
    v9 = *MEMORY[0x24BEBB0F0];
  else
    v9 = *MEMORY[0x24BDF73E0];
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8[2];
  _UIAlertControllerViewAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[_UIAlertControllerViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("alertController"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  v3 = (id)objc_msgSend(v5, "title");
  objc_storeStrong(v8, 0);
  return v3;
}

- (int64_t)accessibilityContainerType
{
  return 10;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIAlertControllerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  -[_UIAlertControllerViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)_prepareTitleLabel
{
  objc_super v2;
  SEL v3;
  _UIAlertControllerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  -[_UIAlertControllerViewAccessibility _prepareTitleLabel](&v2, sel__prepareTitleLabel);
  -[_UIAlertControllerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (void)_prepareMesssageLabel
{
  objc_super v2;
  SEL v3;
  _UIAlertControllerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  -[_UIAlertControllerViewAccessibility _prepareMesssageLabel](&v2, sel__prepareMesssageLabel);
  -[_UIAlertControllerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (void)_prepareDetailMessageLabel
{
  objc_super v2;
  SEL v3;
  _UIAlertControllerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  -[_UIAlertControllerViewAccessibility _prepareDetailMessageLabel](&v2, sel__prepareDetailMessageLabel);
  -[_UIAlertControllerViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14[2];
  _UIAlertControllerViewAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v13 = 0;
  objc_opt_class();
  v4 = (id)-[_UIAlertControllerViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("cancelAction"));
  v12 = (id)__UIAccessibilityCastAsClass();

  v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  v9 = 0;
  objc_opt_class();
  v3 = (id)-[_UIAlertControllerViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("alertController"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10 = v7;
  if (v14[0])
  {
    v5 = v10;
    v6 = v14[0];
    AXPerformSafeBlock();
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v14, 0);
  return 1;
}

- (id)accessibilityHeaderElements
{
  objc_super v3;
  SEL v4;
  _UIAlertControllerViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerViewAccessibility;
  return -[_UIAlertControllerViewAccessibility accessibilityHeaderElements](&v3, sel_accessibilityHeaderElements);
}

@end
