@implementation UIKeyboardDockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardDockView");
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
  v3 = CFSTR("UIKeyboardDockView");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("rightDockItem"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardDockItem"), CFSTR("view"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB178];
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[2];
  UIKeyboardDockViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = v7[0];
  v5 = (id)-[UIKeyboardDockViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("leftDockItem"));
  v4 = (id)objc_msgSend(v5, "safeUIViewForKey:", CFSTR("view"));
  objc_msgSend(v3, "axSafelyAddObject:");

  objc_msgSend(v7[0], "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_22);
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

uint64_t __73__UIKeyboardDockViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "isAccessibilityElement") ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[2];
  UIKeyboardDockViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = v7[0];
  v5 = (id)-[UIKeyboardDockViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("rightDockItem"));
  v4 = (id)objc_msgSend(v5, "safeUIViewForKey:", CFSTR("view"));
  objc_msgSend(v3, "axSafelyAddObject:");

  objc_msgSend(v7[0], "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_191);
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

uint64_t __73__UIKeyboardDockViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "isAccessibilityElement") ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end
