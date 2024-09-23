@implementation _UIFloatingTabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFloatingTabBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
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
  v5 = CFSTR("_UIFloatingTabBarItemView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIFloatingTabBarItemView"), CFSTR("_item"), "UITab");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFloatingTabBar"), CFSTR("tabModel"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITabModel"), CFSTR("tabItems"), v4, 0);
  v3 = CFSTR("_UITab");
  v6 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_badgeValue"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("titleLabel"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("isCustomizableItem"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("isEditing"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("isHighlighted"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  objc_super v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23[2];
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;
  char v32;
  id v33;
  id v34;
  int v35;
  objc_super v36;
  id v37;
  id v38;
  char v39;
  id v40[2];
  _UIFloatingTabBarItemViewAccessibility *v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _NSRange result;

  v41 = self;
  v40[1] = (id)a2;
  v39 = 0;
  objc_opt_class();
  v12 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](v41, "safeValueForKey:", CFSTR("_item"));
  v38 = (id)__UIAccessibilityCastAsClass();

  v37 = v38;
  objc_storeStrong(&v38, 0);
  v40[0] = v37;
  if (v37)
  {
    v34 = (id)-[_UIFloatingTabBarItemViewAccessibility _accessibilityViewAncestorIsKindOf:](v41, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_UIFloatingTabBar")));
    v32 = 0;
    objc_opt_class();
    v24 = 0;
    v25 = &v24;
    v26 = 838860800;
    v27 = 48;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __63___UIFloatingTabBarItemViewAccessibility_accessibilityRowRange__block_invoke;
    v21 = &unk_24FF3DAB0;
    v23[1] = &v24;
    v22 = v34;
    v23[0] = v40[0];
    AXPerformSafeBlock();
    v16 = (id)v25[5];
    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    v31 = (id)__UIAccessibilityCastAsClass();

    if ((v32 & 1) != 0)
      abort();
    v15 = v31;
    objc_storeStrong(&v31, 0);
    v33 = v15;
    if (!v15 || objc_msgSend(v33, "row") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v33, "row") == 0x8000000000000000)
    {
      v14.receiver = v41;
      v14.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
      v42 = (NSUInteger)-[_UIFloatingTabBarItemViewAccessibility accessibilityRowRange](&v14, sel_accessibilityRowRange);
      v43 = v3;
      v35 = 1;
    }
    else
    {
      v7 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("lastSnapshot"));
      v6 = (id)objc_msgSend(v7, "safeArrayForKey:", CFSTR("itemIdentifiers"));
      v8 = objc_msgSend(v6, "count");

      v10 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("pinnedItemsView"));
      v9 = (id)objc_msgSend(v10, "safeDictionaryForKey:", CFSTR("itemViews"));
      v11 = objc_msgSend(v9, "count");

      v13 = objc_msgSend(v40[0], "preferredPlacement");
      if (v13 == 4 || objc_msgSend(v33, "section") != (v13 != 5))
      {
        v45 = v8 + objc_msgSend(v33, "row");
        v44 = v8 + v11;
        v46 = v45;
        v47 = v8 + v11;
        v42 = v45;
        v43 = v8 + v11;
        v35 = 1;
      }
      else
      {
        v49 = objc_msgSend(v33, "row");
        v48 = v8 + v11;
        v50 = v49;
        v51 = v8 + v11;
        v42 = v49;
        v43 = v8 + v11;
        v35 = 1;
      }
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    v36.receiver = v41;
    v36.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    v42 = (NSUInteger)-[_UIFloatingTabBarItemViewAccessibility accessibilityRowRange](&v36, sel_accessibilityRowRange);
    v43 = v2;
    v35 = 1;
  }
  objc_storeStrong(v40, 0);
  v4 = v42;
  v5 = v43;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  int v10;
  id v11[2];
  _UIFloatingTabBarItemViewAccessibility *v12;
  id v13;

  v12 = self;
  v11[1] = (id)a2;
  v5 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v11[0] = (id)objc_msgSend(v5, "accessibilityLabel");

  if (objc_msgSend(v11[0], "length"))
  {
    v13 = v11[0];
    v10 = 1;
  }
  else
  {
    v4 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("titleLabel"));
    v9 = (id)objc_msgSend(v4, "accessibilityLabel");

    if (objc_msgSend(v9, "length"))
    {
      v13 = v9;
    }
    else
    {
      v8 = 0;
      objc_opt_class();
      v7 = (id)__UIAccessibilityCastAsClass();
      v6 = v7;
      objc_storeStrong(&v7, 0);
      v3 = (id)objc_msgSend(v6, "_accessibleSubviews");
      v13 = (id)MEMORY[0x2348C3584]();

    }
    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  return v13;
}

- (id)accessibilityAttributedLabel
{
  id v3;
  id v4;
  objc_super v5;
  id location;
  id v7;
  int v8;
  id v9[2];
  _UIFloatingTabBarItemViewAccessibility *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v4 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v9[0] = (id)objc_msgSend(v4, "accessibilityAttributedLabel");

  if (objc_msgSend(v9[0], "length"))
  {
    v11 = v9[0];
    v8 = 1;
  }
  else
  {
    v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("titleLabel"));
    v7 = (id)objc_msgSend(v3, "accessibilityAttributedLabel");

    if (objc_msgSend(v7, "length"))
    {
      v11 = v7;
      v8 = 1;
    }
    else
    {
      location = -[_UIFloatingTabBarItemViewAccessibility accessibilityLabel](v10, "accessibilityLabel");
      if ((objc_msgSend(location, "isAXAttributedString") & 1) != 0)
      {
        v11 = (id)objc_msgSend(location, "cfAttributedString");
        v8 = 1;
      }
      else
      {
        if (location)
        {
          v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", location);
        }
        else
        {
          v5.receiver = v10;
          v5.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
          v11 = -[_UIFloatingTabBarItemViewAccessibility accessibilityAttributedLabel](&v5, sel_accessibilityAttributedLabel);
        }
        v8 = 1;
      }
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  return v11;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v2 = objc_msgSend(v4, "accessibilityTraits");
  v5 = v2 | *MEMORY[0x24BEBB188];

  v6 = v5;
  if ((-[_UIFloatingTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing")) & 1) != 0
    && (-[_UIFloatingTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCustomizableItem")) & 1) == 0)
  {
    return v5 | *MEMORY[0x24BDF73E8];
  }
  if ((-[_UIFloatingTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHighlighted")) & 1) != 0)
    return v5 | *MEMORY[0x24BDF7400];
  return v6;
}

- (id)accessibilityValue
{
  id v3;
  id v4;

  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (id)objc_msgSend(v3, "accessibilityValue");

  return v4;
}

- (id)accessibilityAttributedValue
{
  id v3;
  id v4;

  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (id)objc_msgSend(v3, "accessibilityAttributedValue");

  return v4;
}

- (id)accessibilityHint
{
  id v3;
  id v4;

  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (id)objc_msgSend(v3, "accessibilityHint");

  return v4;
}

- (id)accessibilityAttributedHint
{
  id v3;
  id v4;

  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (id)objc_msgSend(v3, "accessibilityAttributedHint");

  return v4;
}

- (id)accessibilityIdentifier
{
  id v3;
  id v4;

  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (id)objc_msgSend(v3, "accessibilityIdentifier");

  return v4;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UIFloatingTabBarItemViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  location[0] = (id)objc_msgSend(v3, "accessibilityUserInputLabels");

  if (objc_msgSend(location[0], "count"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    v8 = -[_UIFloatingTabBarItemViewAccessibility accessibilityUserInputLabels](&v4, sel_accessibilityUserInputLabels);
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
  _UIFloatingTabBarItemViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = (id)-[_UIFloatingTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  location[0] = (id)objc_msgSend(v3, "accessibilityCustomActions");

  if (objc_msgSend(location[0], "count"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    v8 = -[_UIFloatingTabBarItemViewAccessibility accessibilityCustomActions](&v4, sel_accessibilityCustomActions);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

@end
