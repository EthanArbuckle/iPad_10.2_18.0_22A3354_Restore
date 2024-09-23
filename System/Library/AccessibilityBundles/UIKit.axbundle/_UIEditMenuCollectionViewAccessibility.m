@implementation _UIEditMenuCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIEditMenuCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIEditMenuCollectionView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIEditMenuCollectionView"), CFSTR("currentPage"), "d", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("incrementTargetPage"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("decrementTargetPage"), v3, 0);
  v5 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setTargetPage:"), v3, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("pages"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("targetPage"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)incrementTargetPage
{
  float v2;
  id v3;
  id argument;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v8;
  double v9;
  SEL v10;
  _UIEditMenuCollectionViewAccessibility *v11;

  v11 = self;
  v10 = a2;
  -[_UIEditMenuCollectionViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("currentPage"));
  v9 = v2;
  -[_UIEditMenuCollectionViewAccessibility setTargetPage:](v11, "setTargetPage:", (uint64_t)v2);
  v8.receiver = v11;
  v8.super_class = (Class)_UIEditMenuCollectionViewAccessibility;
  -[_UIEditMenuCollectionViewAccessibility incrementTargetPage](&v8, sel_incrementTargetPage);
  v7 = (id)-[_UIEditMenuCollectionViewAccessibility safeArrayForKey:](v11, "safeArrayForKey:", CFSTR("pages"));
  v6 = -[_UIEditMenuCollectionViewAccessibility safeIntegerForKey:](v11, "safeIntegerForKey:", CFSTR("targetPage"));
  if (v6 == objc_msgSend(v7, "count") - 1)
  {
    objc_opt_class();
    v5 = (id)__UIAccessibilityCastAsClass();
    v3 = (id)objc_msgSend(v5, "visibleCells");
    argument = (id)objc_msgSend(v3, "lastObject");

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v7, 0);
}

- (void)decrementTargetPage
{
  float v2;
  objc_super v3;
  double v4;
  SEL v5;
  _UIEditMenuCollectionViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  -[_UIEditMenuCollectionViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("currentPage"));
  v4 = v2;
  -[_UIEditMenuCollectionViewAccessibility setTargetPage:](v6, "setTargetPage:", (uint64_t)v2);
  v3.receiver = v6;
  v3.super_class = (Class)_UIEditMenuCollectionViewAccessibility;
  -[_UIEditMenuCollectionViewAccessibility decrementTargetPage](&v3, sel_decrementTargetPage);
  if (!-[_UIEditMenuCollectionViewAccessibility safeIntegerForKey:](v6, "safeIntegerForKey:", CFSTR("targetPage")))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
}

@end
