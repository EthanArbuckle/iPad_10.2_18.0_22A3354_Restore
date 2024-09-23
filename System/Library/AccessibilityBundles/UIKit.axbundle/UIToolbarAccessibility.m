@implementation UIToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbar");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIToolbar"), CFSTR("items"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 24;
}

- (id)accessibilityIdentifier
{
  objc_super v3;
  id location[3];
  id v5;

  location[2] = self;
  location[1] = (id)a2;
  v3.receiver = self;
  v3.super_class = (Class)UIToolbarAccessibility;
  location[0] = -[UIToolbarAccessibility accessibilityIdentifier](&v3, sel_accessibilityIdentifier);
  if (location[0])
    v5 = location[0];
  else
    v5 = AXNoLoc_0(CFSTR("Toolbar"));
  objc_storeStrong(location, 0);
  return v5;
}

- (id)accessibilityLabel
{
  id location[3];
  id v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIToolbarAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (location[0])
    v4 = location[0];
  else
    v4 = accessibilityLocalizedString(CFSTR("toolbar.label"));
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UIToolbarAccessibility _accessibleSubviews:](self, "_accessibleSubviews:", 1, a2, self);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIToolbarAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UIToolbarAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  objc_super v11;
  SEL v12;
  UIToolbarAccessibility *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)UIToolbarAccessibility;
  -[UIToolbarAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  memset(__b, 0, sizeof(__b));
  obj = (id)-[UIToolbarAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("items"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "_accessibilityLoadAccessibilityInformation", v6);
      ++v5;
      v6 = v2;
      if (v3 + 1 >= v2)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v6)
          break;
      }
    }
  }

}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  char v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = objc_msgSend(location[0], "isEqual:", *MEMORY[0x24BDF76A0]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
