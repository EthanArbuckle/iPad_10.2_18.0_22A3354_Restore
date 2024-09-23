@implementation UIColorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIColor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCachedColorDescriptions
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIColor___accessibilityCachedColorDescriptions);
  else
    return 0;
}

- (void)_accessibilitySetCachedColorDescriptions:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityColorDescription
{
  return -[UIColorAccessibility _accessibilityColorDescriptionWithOptions:](self, "_accessibilityColorDescriptionWithOptions:", 0);
}

- (id)_accessibilityColorDescriptionWithOptions:(unint64_t)a3
{
  id v3;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  SEL v12;
  UIColorAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = -[UIColorAccessibility _accessibilityCachedColorDescriptions](self);
  v7 = v3 != 0;

  if (!v7)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[UIColorAccessibility _accessibilitySetCachedColorDescriptions:]((uint64_t)v13, v6);

  }
  v10 = -[UIColorAccessibility _accessibilityCachedColorDescriptions](v13);
  v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v8 = (id)objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  if (!v8)
  {
    v8 = (id)AXColorStringForColor();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v9);
  }
  v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  return v5;
}

@end
