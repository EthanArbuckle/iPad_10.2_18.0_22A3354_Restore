@implementation _UITabSidebarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITabSidebarCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("_UITabBarItemBridgedElement");
  v4 = CFSTR("_UITab");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UITabSidebarCell"), CFSTR("_sidebarItem"), "UITabSidebarItem");
  v3 = CFSTR("UITabSidebarItem");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabSidebarItem"), CFSTR("_contentConfiguration"), "<UIContentConfiguration>");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITabSidebarItem"), CFSTR("_tab"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITab"), CFSTR("_isGroup"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_badgeValue"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("tabBarItem"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySidebarItem
{
  if (a1)
    return (id)objc_msgSend(a1, "safeValueForKeyPath:", CFSTR("_sidebarItem._tab"));
  else
    return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  int v12;
  id v13;
  objc_super v14;
  int v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;
  id v23[2];
  _UITabSidebarCellAccessibility *v24;
  id v25;

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location = 0;
  NSClassFromString(CFSTR("_UITabBarItemBridgedElement"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (id)objc_msgSend(v23[0], "safeValueForKey:", CFSTR("tabBarItem"));
    v21 = (id)objc_msgSend(v13, "accessibilityUserDefinedLabel");

    if (objc_msgSend(v21, "length")
      || (v2 = (id)objc_msgSend(v23[0], "accessibilityUserDefinedLabel"),
          v3 = v21,
          v21 = v2,
          v3,
          objc_msgSend(v21, "length")))
    {
      objc_storeStrong(&location, v21);
    }
    else
    {
      v20 = (id)-[_UITabSidebarCellAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("_sidebarItem"));
      v19 = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("_contentConfiguration"));
      v17 = 0;
      LOBYTE(v12) = 0;
      if (v19)
      {
        v18 = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("_defaultContentConfiguration"));
        v17 = 1;
        v12 = objc_msgSend(v18, "isEqual:", v19) ^ 1;
      }
      if ((v17 & 1) != 0)

      if ((v12 & 1) != 0)
      {
        v4 = (id)objc_msgSend(v19, "accessibilityLabel");
        v5 = location;
        location = v4;

      }
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v21, 0);
  }
  if (!objc_msgSend(location, "length"))
  {
    v6 = (id)objc_msgSend(v23[0], "accessibilityLabel");
    v7 = location;
    location = v6;

  }
  if (!objc_msgSend(location, "length"))
  {
    v11 = (id)-[_UITabSidebarCellAccessibility safeValueForKeyPath:](v24, "safeValueForKeyPath:", CFSTR("_sidebarItem._contentConfiguration"));
    v8 = (id)objc_msgSend(v11, "accessibilityLabel");
    v9 = location;
    location = v8;

  }
  if (objc_msgSend(location, "length"))
  {
    v16 = (id)objc_msgSend(v23[0], "safeStringForKey:", CFSTR("_badgeValue"));
    v25 = (id)__UIAXStringForVariables();
    v15 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v14.receiver = v24;
    v14.super_class = (Class)_UITabSidebarCellAccessibility;
    v25 = -[_UITabSidebarCellAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
    v15 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v23, 0);
  return v25;
}

- (id)accessibilityAttributedLabel
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  objc_super v12;
  id obj;
  id v14;
  int v15;
  id location;
  id v17;
  id v18[2];
  _UITabSidebarCellAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  v17 = (id)objc_msgSend(v18[0], "accessibilityAttributedLabel");
  if (objc_msgSend(v17, "length")
    || ((location = -[_UITabSidebarCellAccessibility accessibilityLabel](v19, "accessibilityLabel"),
         (objc_msgSend(location, "isAXAttributedString") & 1) == 0)
      ? (!location
       ? (v15 = 0)
       : (v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", location), v15 = 1))
      : (v20 = (id)objc_msgSend(location, "cfAttributedString"), v15 = 1),
        objc_storeStrong(&location, 0),
        !v15))
  {
    v14 = (id)objc_msgSend(v18[0], "safeStringForKey:", CFSTR("_badgeValue"));
    if (objc_msgSend(v17, "length") && objc_msgSend(v14, "length"))
    {
      obj = (id)objc_msgSend(v17, "mutableCopy");
      v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", %@"), v14);
      v3 = v14;
      v14 = v2;

      v10 = obj;
      v4 = objc_alloc(MEMORY[0x24BDD1458]);
      v11 = (id)objc_msgSend(v4, "initWithString:", v14);
      objc_msgSend(v10, "appendAttributedString:");

      objc_storeStrong(&v17, obj);
      objc_storeStrong(&obj, 0);
    }
    else if (objc_msgSend(v14, "length"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v14);
      v6 = v17;
      v17 = v5;

    }
    else
    {
      v12.receiver = v19;
      v12.super_class = (Class)_UITabSidebarCellAccessibility;
      v7 = -[_UITabSidebarCellAccessibility accessibilityAttributedLabel](&v12, sel_accessibilityAttributedLabel);
      v8 = v17;
      v17 = v7;

    }
    v20 = v17;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  return v20;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  char v4;
  char v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  objc_super v12;
  unint64_t v13;
  SEL v14;
  _UITabSidebarCellAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)_UITabSidebarCellAccessibility;
  v6 = -[_UITabSidebarCellAccessibility accessibilityTraits](&v12, sel_accessibilityTraits);
  v7 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](v15);
  v8 = v6 | objc_msgSend(v7, "accessibilityTraits");

  v13 = v8;
  v11 = 0;
  objc_opt_class();
  v10 = (id)__UIAccessibilityCastAsClass();
  v9 = v10;
  objc_storeStrong(&v10, 0);
  v5 = objc_msgSend(v9, "isSelected");

  if ((v5 & 1) != 0)
    v13 |= *MEMORY[0x24BDF7400];
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](v15);
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_isGroup"));

  if ((v4 & 1) != 0)
    v13 |= *MEMORY[0x24BDF73C0];
  return v13;
}

- (id)accessibilityValue
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityValue");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityValue](&v4, sel_accessibilityValue);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityAttributedValue
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityAttributedValue");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityAttributedValue](&v4, sel_accessibilityAttributedValue);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityHint
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityHint");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityHint](&v4, sel_accessibilityHint);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityAttributedHint
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityAttributedHint");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityAttributedHint](&v4, sel_accessibilityAttributedHint);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityIdentifier
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityIdentifier");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityIdentifier](&v4, sel_accessibilityIdentifier);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityUserInputLabels");

  if (objc_msgSend(location[0], "count"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityUserInputLabels](&v4, sel_accessibilityUserInputLabels);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityCustomActions
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UITabSidebarCellAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)objc_msgSend(v3, "accessibilityCustomActions");

  if (objc_msgSend(location[0], "count"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UITabSidebarCellAccessibility;
    v8 = -[_UITabSidebarCellAccessibility accessibilityCustomActions](&v4, sel_accessibilityCustomActions);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

@end
