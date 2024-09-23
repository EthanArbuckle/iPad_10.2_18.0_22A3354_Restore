@implementation UITabBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UITabBarButton");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBarButton"), CFSTR("_imageView"), "UITabBarSwappableImageView");
  v3 = CFSTR("UIImageView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UITabBarSwappableImageView"), v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_currentItemState"), "q", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UITabBarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UITabBarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)_accessibilityElementHasImage
{
  id v2;
  BOOL v4;

  v2 = (id)-[UITabBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v4 = v2 != 0;

  return v4;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v12;
  int v13;
  uint64_t v14;
  id location;
  id v16;
  id v17[2];
  UITabBarButtonAccessibility *v18;
  id v19;

  v18 = self;
  v17[1] = (id)a2;
  v2 = (id)-[UITabBarButtonAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v11 = v2 == 0;

  if (v11)
  {
    v10 = (id)-[UITabBarButtonAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("_badge"));
    v9 = (id)objc_msgSend(v10, "accessibilityLabel");
    v8 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v17[0] = (id)objc_msgSend(v9, "stringByTrimmingCharactersInSet:");

    if (objc_msgSend(v17[0], "length"))
    {
      v16 = (id)objc_opt_new();
      objc_msgSend(v16, "setUsesGroupingSeparator:", 1);
      if ((objc_msgSend(v17[0], "isAXAttributedString") & 1) != 0)
      {
        v3 = (id)objc_msgSend(v17[0], "string");
        v4 = v17[0];
        v17[0] = v3;

      }
      location = (id)objc_msgSend(v16, "numberFromString:", v17[0]);
      if (location)
      {
        v14 = (int)objc_msgSend(location, "intValue");
        v6 = (void *)MEMORY[0x24BDD17C8];
        v7 = accessibilityLocalizedString(CFSTR("badge.count"));
        v19 = (id)objc_msgSend(v6, "localizedStringWithFormat:", v14);

      }
      else
      {
        v19 = v17[0];
      }
      v13 = 1;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v12.receiver = v18;
      v12.super_class = (Class)UITabBarButtonAccessibility;
      v19 = -[UITabBarButtonAccessibility accessibilityValue](&v12, sel_accessibilityValue);
      v13 = 1;
    }
    objc_storeStrong(v17, 0);
  }
  else
  {
    v19 = (id)-[UITabBarButtonAccessibility accessibilityUserDefinedValue](v18, "accessibilityUserDefinedValue");
  }
  return v19;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  id location;
  int v16;
  objc_super v17;
  id v18[2];
  UITabBarButtonAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarButtonAccessibility;
  v18[0] = -[UITabBarButtonAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
  if (objc_msgSend(v18[0], "length"))
  {
    v20 = v18[0];
    v16 = 1;
  }
  else
  {
    v13 = (id)-[UITabBarButtonAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("_label"));
    v2 = (id)objc_msgSend(v13, "accessibilityLabel");
    v3 = v18[0];
    v18[0] = v2;

    if (!objc_msgSend(v18[0], "length"))
    {
      location = (id)-[UITabBarButtonAccessibility accessibilityIdentification](v19, "accessibilityIdentification");
      if (location)
      {
        v12 = objc_msgSend(location, "integerValue");
        if (v12 <= 0xB)
          __asm { BR              X8 }
      }
      objc_storeStrong(&location, 0);
    }
    if (!objc_msgSend(v18[0], "length"))
    {
      v11 = (id)-[UITabBarButtonAccessibility _accessibilityAncestorIsKindOf:](v19, "_accessibilityAncestorIsKindOf:", objc_opt_class());
      v14 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("delegate"));

      v4 = (id)objc_msgSend(v14, "_accessibililtyLabelForTabBarButton:", v19);
      v5 = v18[0];
      v18[0] = v4;

      objc_storeStrong(&v14, 0);
    }
    if (!objc_msgSend(v18[0], "length"))
    {
      v10 = (id)-[UITabBarButtonAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("_imageView"));
      v9 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("image"));
      v6 = (id)objc_msgSend(v9, "accessibilityLabel");
      v7 = v18[0];
      v18[0] = v6;

    }
    v20 = v18[0];
    v16 = 1;
  }
  objc_storeStrong(v18, 0);
  return v20;
}

- (id)accessibilityHint
{
  int v3;
  objc_super v4;
  char v5;
  id v6;
  id location;
  int v8;
  objc_super v9;
  id v10[2];
  UITabBarButtonAccessibility *v11;
  id v12;

  v11 = self;
  v10[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)UITabBarButtonAccessibility;
  v10[0] = -[UITabBarButtonAccessibility accessibilityHint](&v9, sel_accessibilityHint);
  if (objc_msgSend(v10[0], "length"))
  {
    v12 = v10[0];
    v8 = 1;
  }
  else
  {
    location = (id)-[UITabBarButtonAccessibility _accessibilityAncestorIsKindOf:](v11, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v5 = 0;
    LOBYTE(v3) = 0;
    if ((objc_msgSend(location, "isCustomizing") & 1) != 0)
    {
      v6 = (id)-[UITabBarButtonAccessibility superview](v11, "superview");
      v5 = 1;
      NSClassFromString(CFSTR("UITabBarCustomizeView"));
      v3 = objc_opt_isKindOfClass() ^ 1;
    }
    if ((v5 & 1) != 0)

    if ((v3 & 1) != 0)
    {
      v12 = accessibilityLocalizedString(CFSTR("non.editing.tab.bar.item.hint"));
    }
    else
    {
      v4.receiver = v11;
      v4.super_class = (Class)UITabBarButtonAccessibility;
      v12 = -[UITabBarButtonAccessibility accessibilityHint](&v4, sel_accessibilityHint);
    }
    v8 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v10, 0);
  return v12;
}

- (BOOL)_axIsSelected:(void *)a1
{
  id v2;
  id v4;
  id location;
  id v6;
  BOOL v7;

  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    v4 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("selectedItem"));
    v2 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_view"));
    v7 = v2 == v6;

  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(&location, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  id v4;
  id location;
  unint64_t v6;
  SEL v7;
  UITabBarButtonAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v6 = *MEMORY[0x24BDF73B0];
  v4 = (id)-[UITabBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  location = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[UITabBarButtonAccessibility _axIsSelected:](v8, location))
    {
      v6 |= *MEMORY[0x24BDF7400];
    }
    else if ((objc_msgSend(location, "isCustomizing") & 1) != 0)
    {
      v6 |= *MEMORY[0x24BEBB110];
    }
  }
  else
  {
    NSClassFromString(CFSTR("UITabBarCustomizeView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 |= *MEMORY[0x24BEBB110];
  }
  v6 |= *MEMORY[0x24BEBB188];
  v3 = v6;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  id v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13[4];
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(void *, void *);
  void *v18;
  UITabBarButtonAccessibility *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28[2];
  UITabBarButtonAccessibility *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _NSRange result;

  v29 = self;
  v28[1] = (id)a2;
  v28[0] = (id)-[UITabBarButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v21 = 0;
  v22 = &v21;
  v23 = 0x10000000;
  v24 = 48;
  v25 = &unk_230DEFD8E;
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  v31 = 0;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = 0;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v27 = 0;
  v7 = v28[0];
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke;
  v18 = &unk_24FF3F448;
  v19 = v29;
  v20 = (id)objc_msgSend(v7, "_accessibilityFindSubviewDescendantsPassingTest:", &v14);
  v2 = (id)-[UITabBarButtonAccessibility _accessibilityGeometrySortedElements:](v29, "_accessibilityGeometrySortedElements:", v20);
  v3 = v20;
  v20 = v2;

  v6 = v20;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke_2;
  v12 = &unk_24FF3EE68;
  v13[0] = v29;
  v13[1] = &v21;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);
  v30 = *((_OWORD *)v22 + 2);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(v28, 0);
  v5 = *((_QWORD *)&v30 + 1);
  v4 = v30;
  result.length = v5;
  result.location = v4;
  return result;
}

uint64_t __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
  NSClassFromString(CFSTR("UITabBarButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_storeStrong(location, 0);
}

- (int64_t)_currentItemState
{
  objc_super v3;
  id v4;
  SEL v5;
  UITabBarButtonAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITabBarButtonAccessibility;
  v4 = -[UITabBarButtonAccessibility _currentItemState](&v3, sel__currentItemState);
  if ((-[UITabBarButtonAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0&& v4 == (id)4&& (-[UITabBarButtonAccessibility safeBoolForKey:](v6, "safeBoolForKey:", CFSTR("_isSelected")) & 1) != 0)
  {
    return 2;
  }
  return (int64_t)v4;
}

@end
