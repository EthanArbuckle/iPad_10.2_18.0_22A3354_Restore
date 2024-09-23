@implementation UITableViewCellEditControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellEditControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
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
  v4 = CFSTR("UITableViewCellEditControl");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellEditControl"), CFSTR("isRotated"), "B", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_currentImage"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_multiSelectNotSelectedImage"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_multiSelectSelectedImage"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_imageView"), "UIImageView");
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityElementsHidden
{
  id v2;
  BOOL v4;

  v2 = (id)-[UITableViewCellEditControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentImage"));
  v4 = v2 != 0;

  return !v4;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  char v4;
  char v5;
  id v6;
  int v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  id location[2];
  UITableViewCellEditControlAccessibility *v12;
  char v13;

  v12 = self;
  location[1] = (id)a2;
  v2 = (id)-[UITableViewCellEditControlAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v9 = v2 == 0;

  if (v9)
  {
    location[0] = (id)-[UITableViewCellEditControlAccessibility _accessibilityViewAncestorIsKindOf:](v12, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v6 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("editingStyle"));
    v7 = objc_msgSend(v6, "intValue");

    v10 = AXRequestingClient();
    if (v10 == 3 || v10 == 4)
    {
      v13 = (v7 - 1) > 2;
    }
    else
    {
      v5 = 1;
      if (v7 != 3)
      {
        v4 = 0;
        if (v7 == 2)
          v4 = objc_msgSend(location[0], "_accessibilityBoolValueForKey:", CFSTR("accessibilityShouldNotBeAnElementIfInsertEditStyle"));
        v5 = v4;
      }
      v13 = (v5 ^ 1) & 1;
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v8 = (id)-[UITableViewCellEditControlAccessibility isAccessibilityUserDefinedElement](v12, "isAccessibilityUserDefinedElement");
    v13 = objc_msgSend(v8, "BOOLValue") & 1;

  }
  return v13 & 1;
}

- (id)accessibilityValue
{
  __CFString *v2;
  id v4;
  char v5;
  id v6;
  int v7;
  objc_super v8;
  int v9;
  char v10;
  id v11;
  int v12;
  id location[2];
  UITableViewCellEditControlAccessibility *v14;
  __CFString *v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewCellEditControlAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v6 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("editingStyle"));
  v7 = objc_msgSend(v6, "intValue");

  v12 = v7;
  if (v7 == 3)
  {
    v4 = (id)-[UITableViewCellEditControlAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("isHighlighted"));
    v10 = 0;
    v5 = 1;
    if ((objc_msgSend(v4, "BOOLValue") & 1) == 0)
    {
      v11 = (id)-[UITableViewCellEditControlAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("isSelected"));
      v10 = 1;
      v5 = objc_msgSend(v11, "BOOLValue");
    }
    if ((v5 & 1) != 0)
      v2 = CFSTR("1");
    else
      v2 = CFSTR("0");
    v15 = v2;
    if ((v10 & 1) != 0)

    v9 = 1;
  }
  else
  {
    v8.receiver = v14;
    v8.super_class = (Class)UITableViewCellEditControlAccessibility;
    v15 = (__CFString *)-[UITableViewCellEditControlAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v15;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  char v4;
  id v5;
  unsigned int v6;
  char v7;
  id v8;
  id location;
  objc_super v10;
  unint64_t v11;
  SEL v12;
  UITableViewCellEditControlAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellEditControlAccessibility;
  v11 = -[UITableViewCellEditControlAccessibility accessibilityTraits](&v10, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
  location = (id)-[UITableViewCellEditControlAccessibility _accessibilityViewAncestorIsKindOf:](v13, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v5 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("editingStyle"));
  v6 = objc_msgSend(v5, "intValue");

  if (v6 <= 3uLL)
    __asm { BR              X8 }
  v7 = 0;
  if (v6 == 3 || (v4 = 0, !v6))
  {
    v8 = (id)-[UITableViewCellEditControlAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("isEnabled"));
    v7 = 1;
    v4 = objc_msgSend(v8, "BOOLValue");
  }
  if ((v7 & 1) != 0)

  if ((v4 & 1) != 0)
    v11 &= ~*MEMORY[0x24BDF73E8];
  v3 = v11;
  objc_storeStrong(&location, 0);
  return v3;
}

- (id)accessibilityLabel
{
  id v2;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  id v14;
  id location;
  uint64_t v16;
  int v17;
  id v18[2];
  UITableViewCellEditControlAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v2 = (id)-[UITableViewCellEditControlAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v12 = v2 == 0;

  if (v12)
  {
    v18[0] = (id)-[UITableViewCellEditControlAccessibility _accessibilityViewAncestorIsKindOf:](v19, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (id)objc_msgSend(v18[0], "safeValueForKey:", CFSTR("editingStyle"));
      v11 = objc_msgSend(v10, "integerValue");

      v16 = v11;
      if (v11 == 1)
      {
        location = (id)objc_msgSend(v18[0], "safeValueForKey:", CFSTR("_accessibilityTextElementText"));
        if (objc_msgSend(location, "length"))
        {
          v8 = (void *)MEMORY[0x24BDD17C8];
          v9 = accessibilityLocalizedString(CFSTR("remove.control.text.with.label"));
          v20 = (id)objc_msgSend(v8, "stringWithFormat:", location);

        }
        else
        {
          v20 = accessibilityLocalizedString(CFSTR("remove.control.text"));
        }
        v17 = 1;
        objc_storeStrong(&location, 0);
      }
      else if (v16 == 2)
      {
        v14 = (id)objc_msgSend(v18[0], "safeValueForKey:", CFSTR("_accessibilityTextElementText"));
        if (objc_msgSend(v14, "length"))
        {
          v6 = (void *)MEMORY[0x24BDD17C8];
          v7 = accessibilityLocalizedString(CFSTR("insert.control.text.with.label"));
          v20 = (id)objc_msgSend(v6, "stringWithFormat:", v14);

        }
        else
        {
          v20 = accessibilityLocalizedString(CFSTR("insert.control.text"));
        }
        v17 = 1;
        objc_storeStrong(&v14, 0);
      }
      else if (v16 == 3)
      {
        v13 = (id)objc_msgSend(v18[0], "safeValueForKey:", CFSTR("_accessibilityTextElementText"));
        if (objc_msgSend(v13, "length"))
        {
          v4 = (void *)MEMORY[0x24BDD17C8];
          v5 = accessibilityLocalizedString(CFSTR("select.control.text.with.label"));
          v20 = (id)objc_msgSend(v4, "stringWithFormat:", v13);

        }
        else
        {
          v20 = accessibilityLocalizedString(CFSTR("select.control.text"));
        }
        v17 = 1;
        objc_storeStrong(&v13, 0);
      }
      else
      {
        v20 = 0;
        v17 = 1;
      }
    }
    else
    {
      v20 = 0;
      v17 = 1;
    }
    objc_storeStrong(v18, 0);
  }
  else
  {
    v20 = (id)-[UITableViewCellEditControlAccessibility accessibilityUserDefinedLabel](v19, "accessibilityUserDefinedLabel");
  }
  return v20;
}

- (id)accessibilityHint
{
  id v3;
  uint64_t v4;
  id location[3];
  id v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewCellEditControlAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("editingStyle"));
    v4 = objc_msgSend(v3, "integerValue");

    if (v4 == 1)
      v6 = accessibilityLocalizedString(CFSTR("remove.control.hint"));
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  objc_super v4;
  char v5;
  id v6;
  SEL v7;
  UITableViewCellEditControlAccessibility *v8;

  v8 = self;
  v7 = a2;
  v5 = 0;
  v3 = 0;
  if ((-[UITableViewCellEditControlAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v6 = (id)-[UITableViewCellEditControlAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_currentImage"));
    v5 = 1;
    v3 = v6 == 0;
  }
  if ((v5 & 1) != 0)

  if (v3)
    return 0;
  v4.receiver = v8;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  return -[UITableViewCellEditControlAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

- (id)_multiSelectNotSelectedImage
{
  id v3;
  objc_super v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  v5[0] = -[UITableViewCellEditControlAccessibility _multiSelectNotSelectedImage](&v4, sel__multiSelectNotSelectedImage);
  objc_msgSend(v5[0], "setAccessibilityIdentifier:", CFSTR("circle"));
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (id)_multiSelectSelectedImage
{
  id v3;
  objc_super v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  v5[0] = -[UITableViewCellEditControlAccessibility _multiSelectSelectedImage](&v4, sel__multiSelectSelectedImage);
  objc_msgSend(v5[0], "setAccessibilityIdentifier:", CFSTR("selected"));
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

@end
