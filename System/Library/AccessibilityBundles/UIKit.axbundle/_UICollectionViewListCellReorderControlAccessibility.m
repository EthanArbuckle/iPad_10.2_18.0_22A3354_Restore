@implementation _UICollectionViewListCellReorderControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICollectionViewListCellReorderControl");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UICollectionViewListCellReorderControl"), CFSTR("UIView"));
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  id location;
  _QWORD v23[2];
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31[3];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v31[2] = self;
  v31[1] = (id)a2;
  v31[0] = (id)-[_UICollectionViewListCellReorderControlAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (id)objc_msgSend(v31[0], "_accessibilityBriefLabel");
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
        location = (id)objc_msgSend(v29, "attributesAtIndex:effectiveRange:", 0, v23);
        memset(__b, 0, sizeof(__b));
        obj = location;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
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
            v11 = (id)objc_msgSend(location, "objectForKey:", v21);
            objc_msgSend(v10, "setAttribute:forKey:withRange:");

            ++v14;
            if (v12 + 1 >= v15)
            {
              v14 = 0;
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
              if (!v15)
                break;
            }
          }
        }

        objc_storeStrong(&location, 0);
      }
      v8 = (id)objc_msgSend(v31[0], "accessibilityLanguage");
      v9 = 0;
      if (v8)
        v9 = v25 != 0x7FFFFFFFFFFFFFFFLL;

      if (v9)
      {
        v6 = v24;
        v7 = (id)objc_msgSend(v31[0], "accessibilityLanguage");
        objc_msgSend(v6, "setAttribute:forKey:withRange:");

      }
      v32 = v24;
      v30 = 1;
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    else
    {
      v32 = accessibilityLocalizedString(CFSTR("table.view.reorder.control"));
      v30 = 1;
    }
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v32 = 0;
    v30 = 1;
  }
  objc_storeStrong(v31, 0);
  return v32;
}

- (id)accessibilityPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;

  v7 = (void *)MEMORY[0x24BDF6870];
  -[_UICollectionViewListCellReorderControlAccessibility accessibilityFrame](self, "accessibilityFrame");
  return (id)objc_msgSend(v7, "bezierPathWithRect:", v2, v3, v4, v5);
}

@end
