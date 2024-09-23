@implementation UISegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISegment"), CFSTR("_objectValue"), "@");
  objc_storeStrong(location, 0);
}

- (id)accessibilityLanguage
{
  id v2;
  id v3;
  id v5;
  id location;
  int v7;
  objc_super v8;
  id v9[2];
  UISegmentAccessibility *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v8.receiver = self;
  v8.super_class = (Class)UISegmentAccessibility;
  v9[0] = -[UISegmentAccessibility accessibilityLanguage](&v8, sel_accessibilityLanguage);
  if (v9[0])
  {
    v11 = v9[0];
    v7 = 1;
  }
  else
  {
    location = (id)-[UISegmentAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("info"));
    v2 = (id)objc_msgSend(location, "accessibilityLanguage");
    v3 = v9[0];
    v9[0] = v2;

    if (v9[0])
    {
      v11 = v9[0];
    }
    else
    {
      v5 = (id)-[UISegmentAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("superview"));
      v11 = (id)objc_msgSend(v5, "accessibilityLanguage");

    }
    v7 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v9, 0);
  return v11;
}

- (BOOL)isAccessibilityElement
{
  id location;
  int v4;
  id v5[2];
  UISegmentAccessibility *v6;
  char v7;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UISegmentAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  if (v5[0])
  {
    v7 = objc_msgSend(v5[0], "BOOLValue") & 1;
    v4 = 1;
  }
  else
  {
    location = (id)-[UISegmentAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("info"));
    v5[0] = (id)objc_msgSend(location, "isAccessibilityUserDefinedElement");

    if (v5[0])
      v7 = objc_msgSend(v5[0], "BOOLValue") & 1;
    else
      v7 = 1;
    v4 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v5, 0);
  return v7 & 1;
}

- (id)_axLabelFromInfoObject:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v22;
  id v23;
  id v24;
  BOOL v25;
  id v26;
  id v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  int v32;
  id location;
  id v34;
  id v35;

  v34 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v34)
  {
    v31 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (id)objc_msgSend(location, "text");
      v2 = (id)objc_msgSend(v27, "_accessibilityAXAttributedLabel");
      v28 = v2 == 0;

      if (v28)
      {
        v24 = (id)objc_msgSend(location, "attributedText");
        v5 = (id)objc_msgSend(v24, "_accessibilityAXAttributedLabel");
        v25 = v5 == 0;

        if (v25)
        {
          v8 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
          v9 = v31;
          v31 = v8;

        }
        else
        {
          v23 = (id)objc_msgSend(location, "attributedText");
          v6 = (id)objc_msgSend(v23, "_accessibilityAXAttributedLabel");
          v7 = v31;
          v31 = v6;

        }
      }
      else
      {
        v26 = (id)objc_msgSend(location, "text");
        v3 = (id)objc_msgSend(v26, "_accessibilityAXAttributedLabel");
        v4 = v31;
        v31 = v3;

      }
    }
    if (!objc_msgSend(v31, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
        v22 = v10 == 0;

        if (v22)
        {
          objc_storeStrong(&v31, location);
        }
        else
        {
          v11 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
          v12 = v31;
          v31 = v11;

        }
      }
    }
    if (!objc_msgSend(v31, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        v13 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
        v14 = v31;
        v31 = v13;

      }
    }
    if (!objc_msgSend(v31, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (id)objc_msgSend(location, "accessibilityLabel");
        if (objc_msgSend(v30, "length"))
        {
          objc_storeStrong(&v31, v30);
        }
        else
        {
          v29 = (id)objc_msgSend(location, "accessibilityIdentification");
          if (!objc_msgSend(v29, "length"))
          {
            v15 = (id)objc_msgSend(location, "accessibilityIdentifier");
            v16 = v29;
            v29 = v15;

          }
          if (objc_msgSend(v29, "length"))
          {
            v17 = (id)objc_msgSend(v34, "_accessibilityRetrieveImagePathLabel:", v29);
            v18 = v31;
            v31 = v17;

          }
          objc_storeStrong(&v29, 0);
        }
        objc_storeStrong(&v30, 0);
      }
    }
    if (!objc_msgSend(v31, "length"))
    {
      v19 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
      v20 = v31;
      v31 = v19;

    }
    v35 = v31;
    v32 = 1;
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v35 = 0;
    v32 = 1;
  }
  objc_storeStrong(&location, 0);
  return v35;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  int v7;
  id v8[2];
  UISegmentAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[UISegmentAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v8[0])
  {
    v10 = v8[0];
    v7 = 1;
  }
  else
  {
    v5 = (id)-[UISegmentAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_objectValue"));
    v8[0] = -[UISegmentAccessibility _axLabelFromInfoObject:](v9, v5);

    if (!objc_msgSend(v8[0], "length"))
    {
      v6 = (id)-[UISegmentAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("info"));
      v2 = -[UISegmentAccessibility _axLabelFromInfoObject:](v9, v6);
      v3 = v8[0];
      v8[0] = v2;

      objc_storeStrong(&v6, 0);
    }
    v10 = v8[0];
    v7 = 1;
  }
  objc_storeStrong(v8, 0);
  return v10;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;
  id v14[2];
  UISegmentAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UISegmentAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (!v14[0])
  {
    v13.receiver = v15;
    v13.super_class = (Class)UISegmentAccessibility;
    v2 = -[UISegmentAccessibility accessibilityValue](&v13, sel_accessibilityValue);
    v3 = v14[0];
    v14[0] = v2;

  }
  v10 = (id)-[UISegmentAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("_badgeView"));
  v12 = (id)objc_msgSend(v10, "accessibilityLabel");

  v11 = 0;
  if (objc_msgSend(v12, "length") && (int)objc_msgSend(v12, "intValue") >= 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = accessibilityLocalizedString(CFSTR("badge.count"));
    v4 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v9, objc_msgSend(v12, "integerValue"));
    v5 = v11;
    v11 = v4;

  }
  v7 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v14, 0);
  return v7;
}

- (_NSRange)accessibilityRowRange
{
  uint64_t v2;
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  id v6;
  id v7[2];
  UISegmentAccessibility *v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _NSRange result;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = -[UISegmentAccessibility _accessibilitySegmentedControlParent](self, "_accessibilitySegmentedControlParent");
  if (v7[0])
  {
    v6 = (id)objc_msgSend(v7[0], "safeValueForKey:", CFSTR("_segments"));
    v5 = objc_msgSend(v6, "indexOfObject:", v8);
    v2 = objc_msgSend(v6, "count");
    v16 = v5;
    v15 = v2;
    v17 = v5;
    v18 = v2;
    v9 = v5;
    v10 = v2;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0;
  }
  objc_storeStrong(v7, 0);
  v3 = v9;
  v4 = v10;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)accessibilityIdentifier
{
  id v3;
  BOOL v4;
  objc_super v5;
  int v6;
  id location[2];
  UISegmentAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UISegmentAccessibility accessibilityUserDefinedIdentifier](self, "accessibilityUserDefinedIdentifier");
  if (location[0])
  {
    v9 = location[0];
    v6 = 1;
  }
  else
  {
    v3 = -[UISegmentAccessibility accessibilityLabel](v8, "accessibilityLabel");
    v4 = objc_msgSend(v3, "length") == 0;

    if (v4)
    {
      v5.receiver = v8;
      v5.super_class = (Class)UISegmentAccessibility;
      v9 = -[UISegmentAccessibility accessibilityIdentifier](&v5, sel_accessibilityIdentifier);
    }
    else
    {
      v9 = 0;
    }
    v6 = 1;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)accessibilityHint
{
  objc_super v3;
  int v4;
  id location;
  id v6[2];
  UISegmentAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UISegmentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("info"));
  location = (id)objc_msgSend(v6[0], "_accessibilityAXAttributedHint");
  if (location)
  {
    v8 = location;
  }
  else
  {
    v3.receiver = v7;
    v3.super_class = (Class)UISegmentAccessibility;
    v8 = -[UISegmentAccessibility accessibilityHint](&v3, sel_accessibilityHint);
  }
  v4 = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v8;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  char v4;
  BOOL v5;
  char v6;
  UISegmentAccessibility *v7;
  id location;
  uint64_t v9;
  id v10;
  unint64_t v11;
  int v12;
  id v13;
  id v14[2];
  UISegmentAccessibility *v15;
  unint64_t v16;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UISegmentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("info"));
  v13 = (id)objc_msgSend(v14[0], "accessibilityUserDefinedTraits");
  if (v13
    || (v13 = (id)-[UISegmentAccessibility accessibilityUserDefinedTraits](v15, "accessibilityUserDefinedTraits"), 0, v13))
  {
    v16 = objc_msgSend(v13, "unsignedLongLongValue");
    v12 = 1;
  }
  else
  {
    v11 = 0;
    v11 = *MEMORY[0x24BDF73B0];
    v10 = -[UISegmentAccessibility _accessibilitySegmentedControlParent](v15, "_accessibilitySegmentedControlParent");
    if (v10)
    {
      v9 = objc_msgSend(v10, "selectedSegmentIndex");
      location = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("segments"));
      v6 = 0;
      v5 = 0;
      if (v9 >= 0)
      {
        v5 = 0;
        if (v9 < (unint64_t)objc_msgSend(location, "count"))
        {
          v7 = (UISegmentAccessibility *)(id)objc_msgSend(location, "objectAtIndex:", v9);
          v6 = 1;
          v5 = v15 == v7;
        }
      }
      if ((v6 & 1) != 0)

      if (v5)
      {
        v11 |= *MEMORY[0x24BDF7400];
      }
      else if ((objc_msgSend(v10, "isEnabled") & 1) == 0)
      {
        v11 |= *MEMORY[0x24BDF73E8];
      }
      v3 = (id)-[UISegmentAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("isEnabled"));
      v4 = objc_msgSend(v3, "BOOLValue");

      if ((v4 & 1) == 0)
        v11 |= *MEMORY[0x24BDF73E8];
      v16 = v11;
      v12 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      v16 = v11;
      v12 = 1;
    }
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v16;
}

- (BOOL)_accessibilityHasNativeFocus
{
  BOOL v3;
  objc_super v4;
  int v5;
  char v6;
  UISegmentAccessibility *v7;
  id location;
  uint64_t v9;
  id v10[2];
  UISegmentAccessibility *v11;
  char v12;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = -[UISegmentAccessibility _accessibilitySegmentedControlParent](self, "_accessibilitySegmentedControlParent");
  if ((objc_msgSend(v10[0], "_accessibilityUIKitHasNativeFocus") & 1) == 0)
    goto LABEL_11;
  v9 = objc_msgSend(v10[0], "selectedSegmentIndex");
  location = (id)objc_msgSend(v10[0], "safeValueForKey:", CFSTR("segments"));
  v6 = 0;
  v3 = 0;
  if (v9 >= 0)
  {
    v3 = 0;
    if (v9 < (unint64_t)objc_msgSend(location, "count"))
    {
      v7 = (UISegmentAccessibility *)(id)objc_msgSend(location, "objectAtIndex:", v9);
      v6 = 1;
      v3 = v11 == v7;
    }
  }
  if ((v6 & 1) != 0)

  if (v3)
  {
    v12 = 1;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v5)
  {
LABEL_11:
    v4.receiver = v11;
    v4.super_class = (Class)UISegmentAccessibility;
    v12 = -[UISegmentAccessibility _accessibilityHasNativeFocus](&v4, sel__accessibilityHasNativeFocus);
    v5 = 1;
  }
  objc_storeStrong(v10, 0);
  return v12 & 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  unint64_t v2;

  v2 = -[UISegmentAccessibility accessibilityTraits](self, "accessibilityTraits", a2, self);
  return (v2 & *MEMORY[0x24BDF7400]) != 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (id)_accessibilitySegmentedControlParent
{
  return (id)-[UISegmentAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

@end
