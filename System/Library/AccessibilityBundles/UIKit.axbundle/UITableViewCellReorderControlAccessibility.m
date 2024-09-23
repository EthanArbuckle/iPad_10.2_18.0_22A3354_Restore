@implementation UITableViewCellReorderControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellReorderControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  float v2;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  char v11;
  SEL v12;
  UITableViewCellReorderControlAccessibility *v13;
  BOOL v14;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10 = 0;
  objc_opt_class();
  v6 = (id)-[UITableViewCellReorderControlAccessibility _accessibilityAncestorIsKindOf:](v13, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v9 = (id)__UIAccessibilityCastAsSafeCategory();

  v8 = v9;
  objc_storeStrong(&v9, 0);
  v5 = -[UITableViewCellAccessibility _accessibilityClientIgnoresReorderControl]() ^ 1;

  v11 = v5 & 1;
  if ((v5 & 1) != 0)
  {
    v7 = (id)-[UITableViewCellReorderControlAccessibility _accessibilityViewAncestorIsKindOf:](v13, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "showingDeleteConfirmation") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v4 = (id)-[UITableViewCellReorderControlAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("alpha"));
      objc_msgSend(v4, "floatValue");
      v14 = v2 > 0.0;

    }
    objc_storeStrong(&v7, 0);
  }
  else
  {
    return 0;
  }
  return v14;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB110];
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  id v22;
  _QWORD v23[2];
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id v33;
  int v34;
  id v35[3];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35[2] = self;
  v35[1] = (id)a2;
  v35[0] = (id)-[UITableViewCellReorderControlAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0;
    objc_opt_class();
    v31 = (id)__UIAccessibilityCastAsSafeCategory();
    v30 = v31;
    objc_storeStrong(&v31, 0);
    v33 = v30;
    v29 = (id)objc_msgSend(v30, "_accessibilityRetrieveTableViewCellTextForReorderControl");
    if (objc_msgSend(v29, "length"))
    {
      v28 = v29;
      if ((objc_msgSend(v29, "isAXAttributedString") & 1) != 0)
      {
        v2 = (id)objc_msgSend(v29, "string");
        v3 = v28;
        v28 = v2;

      }
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = accessibilityLocalizedString(CFSTR("table.view.reorder.control.label"));
      v27 = (id)objc_msgSend(v18, "stringWithFormat:", v28);

      v25 = objc_msgSend(v27, "rangeOfString:", v28);
      v26 = v4;
      v24 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v27);
      if ((objc_msgSend(v29, "isAXAttributedString") & 1) != 0)
      {
        v23[0] = 0;
        v23[1] = 0;
        v22 = (id)objc_msgSend(v29, "attributesAtIndex:effectiveRange:", 0, v23);
        memset(__b, 0, sizeof(__b));
        obj = v22;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
        if (v17)
        {
          v13 = *(_QWORD *)__b[2];
          v14 = 0;
          v15 = v17;
          while (1)
          {
            v12 = v14;
            if (*(_QWORD *)__b[2] != v13)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(__b[1] + 8 * v14);
            v10 = v24;
            v11 = (id)objc_msgSend(v22, "objectForKey:", v21);
            objc_msgSend(v10, "setAttribute:forKey:withRange:");

            ++v14;
            if (v12 + 1 >= v15)
            {
              v14 = 0;
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
              if (!v15)
                break;
            }
          }
        }

        objc_storeStrong(&v22, 0);
      }
      v8 = (id)objc_msgSend(v35[0], "accessibilityLanguage");
      v9 = 0;
      if (v8)
        v9 = v25 != 0x7FFFFFFFFFFFFFFFLL;

      if (v9)
      {
        v6 = v24;
        v7 = (id)objc_msgSend(v35[0], "accessibilityLanguage");
        objc_msgSend(v6, "setAttribute:forKey:withRange:");

      }
      v36 = v24;
      v34 = 1;
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    else
    {
      v36 = accessibilityLocalizedString(CFSTR("table.view.reorder.control"));
      v34 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v36 = 0;
    v34 = 1;
  }
  objc_storeStrong(v35, 0);
  return v36;
}

@end
