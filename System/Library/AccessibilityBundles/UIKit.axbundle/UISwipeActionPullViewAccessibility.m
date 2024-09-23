@implementation UISwipeActionPullViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISwipeActionPullView");
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
  v3 = CFSTR("UISwipeActionPullView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_buttons"), "NSMutableArray");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_actions"), "NSArray");
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, unint64_t, void *);
  void *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  objc_super v19;
  SEL v20;
  UISwipeActionPullViewAccessibility *v21;

  v21 = self;
  v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)UISwipeActionPullViewAccessibility;
  -[UISwipeActionPullViewAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  v17 = 0;
  objc_opt_class();
  v4 = (id)-[UISwipeActionPullViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_buttons"));
  v16 = (id)__UIAccessibilityCastAsClass();

  v15 = v16;
  objc_storeStrong(&v16, 0);
  v18 = v15;
  v13 = 0;
  objc_opt_class();
  v3 = (id)-[UISwipeActionPullViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_actions"));
  v12 = (id)__UIAccessibilityCastAsClass();

  v11 = v12;
  objc_storeStrong(&v12, 0);
  v14 = v11;
  v2 = v18;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __80__UISwipeActionPullViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_24FF3E490;
  v10 = v11;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
}

void __80__UISwipeActionPullViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1, void *a2, unint64_t a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v11;
  id v12;
  id v13[3];
  unint64_t v14;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = a3;
  v13[2] = a4;
  v13[1] = a1;
  if (objc_msgSend(a1[4], "count") > a3)
  {
    v13[0] = (id)objc_msgSend(a1[4], "objectAtIndexedSubscript:", v14);
    v6 = location[0];
    v7 = (id)objc_msgSend(v13[0], "accessibilityLabel");
    v11 = 0;
    if (objc_msgSend(v7, "length"))
    {
      v12 = (id)objc_msgSend(v13[0], "accessibilityLabel");
      v11 = 1;
      objc_msgSend(v6, "setAccessibilityLabel:", v12);
    }
    else
    {
      objc_msgSend(v6, "setAccessibilityLabel:", 0);
    }
    if ((v11 & 1) != 0)

    v4 = location[0];
    v5 = (id)objc_msgSend(v13[0], "accessibilityIdentifier");
    objc_msgSend(v4, "setAccessibilityIdentifier:");

    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  objc_super v2;
  SEL v3;
  UISwipeActionPullViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISwipeActionPullViewAccessibility;
  -[UISwipeActionPullViewAccessibility layoutSubviews](&v2, sel_layoutSubviews);
  -[UISwipeActionPullViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

@end
