@implementation UIToolbarTextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarTextButton");
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
  v3 = CFSTR("UINavigationButton");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIToolbarTextButton"), CFSTR("_title"), "NSString");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationButton"), CFSTR("title"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("image"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  BOOL v14;
  _QWORD __b[8];
  id v16;
  id location;
  objc_super v18;
  id v19[2];
  UIToolbarTextButtonAccessibility *v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19[1] = (id)a2;
  v2 = (id)-[UIToolbarTextButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v14 = v2 == 0;

  if (v14)
  {
    v19[0] = (id)-[UIToolbarTextButtonAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("_title"));
    if (!v19[0])
    {
      v18.receiver = v20;
      v18.super_class = (Class)UIToolbarTextButtonAccessibility;
      v3 = -[UIToolbarTextButtonAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
      v4 = v19[0];
      v19[0] = v3;

    }
    if (!v19[0])
    {
      location = (id)-[UIToolbarTextButtonAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("subviews"));
      memset(__b, 0, sizeof(__b));
      obj = location;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
      if (v13)
      {
        v9 = *(_QWORD *)__b[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(obj);
          v16 = *(id *)(__b[1] + 8 * v10);
          if ((objc_msgSend(v16, "isAccessibilityElement") & 1) != 0)
          {
            v5 = (id)objc_msgSend(v16, "accessibilityLabel");
            v6 = v19[0];
            v19[0] = v5;

          }
          if (objc_msgSend(v19[0], "length"))
            break;
          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
            if (!v11)
              break;
          }
        }
      }

      objc_storeStrong(&location, 0);
    }
    v21 = v19[0];
    objc_storeStrong(v19, 0);
  }
  else
  {
    v21 = (id)-[UIToolbarTextButtonAccessibility accessibilityUserDefinedLabel](v20, "accessibilityUserDefinedLabel");
  }
  return v21;
}

- (BOOL)accessibilityElementsHidden
{
  BOOL v3;
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  id v14;
  char v15;
  id v16;
  int v17;
  char v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  _QWORD __b[8];
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30[2];
  UIToolbarTextButtonAccessibility *v31;
  BOOL v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  v30[1] = (id)a2;
  v29 = 0;
  objc_opt_class();
  v28 = (id)__UIAccessibilityCastAsClass();
  v27 = v28;
  objc_storeStrong(&v28, 0);
  v30[0] = v27;
  v26 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("subviews"));
  memset(__b, 0, sizeof(__b));
  obj = v26;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v25 = *(id *)(__b[1] + 8 * v9);
      if ((objc_msgSend(v25, "isAccessibilityElement") & 1) != 0)
      {
        NSClassFromString(CFSTR("UINavigationButton"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = 0;
          v17 = 1;
          goto LABEL_23;
        }
        v22 = 0;
        objc_opt_class();
        v6 = (id)-[UIToolbarTextButtonAccessibility safeValueForKey:](v31, "safeValueForKey:", CFSTR("title"));
        v21 = (id)__UIAccessibilityCastAsClass();

        if ((v22 & 1) != 0)
          abort();
        v20 = v21;
        objc_storeStrong(&v21, 0);
        v23 = v20;
        v18 = 0;
        if (!v20 || (v5 = 1, !objc_msgSend(v23, "length")))
        {
          v19 = (id)objc_msgSend(v25, "safeValueForKey:", CFSTR("image"));
          v18 = 1;
          v5 = v19 != 0;
        }
        if ((v18 & 1) != 0)

        if (v5)
        {
          v32 = 0;
          v17 = 1;
        }
        else
        {
          v17 = 0;
        }
        objc_storeStrong(&v23, 0);
        if (v17)
          goto LABEL_23;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (!v10)
          break;
      }
    }
  }
  v17 = 0;
LABEL_23:

  if (!v17)
  {
    v15 = 0;
    objc_opt_class();
    v4 = (id)-[UIToolbarTextButtonAccessibility safeValueForKey:](v31, "safeValueForKey:", CFSTR("_title"));
    v14 = (id)__UIAccessibilityCastAsClass();

    v13 = v14;
    objc_storeStrong(&v14, 0);
    v16 = v13;
    v3 = 1;
    if (v13)
      v3 = objc_msgSend(v16, "length") == 0;
    v32 = v3;
    v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v30, 0);
  return v32;
}

@end
