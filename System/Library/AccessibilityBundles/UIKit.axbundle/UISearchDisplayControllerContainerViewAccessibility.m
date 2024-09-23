@implementation UISearchDisplayControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchDisplayControllerContainerView");
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
  objc_storeStrong(location, 0);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[9];
  id location;
  _QWORD __b[8];
  id v24;
  id v25;
  id v26[3];
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26[2] = self;
  v26[1] = (id)a2;
  v18 = (id)-[UISearchDisplayControllerContainerViewAccessibility superview](self, "superview");
  v26[0] = (id)objc_msgSend(v18, "subviews");

  v25 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v26[0];
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v20)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v20;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v25)
        {
          v2 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v24);
          v3 = v25;
          v25 = v2;

        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          location = (id)objc_msgSend(v24, "subviews");
          memset(v21, 0, 0x40uLL);
          v12 = location;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v21, v27, 16);
          if (v13)
          {
            v9 = *(_QWORD *)v21[2];
            v10 = 0;
            v11 = v13;
            while (1)
            {
              v8 = v10;
              if (*(_QWORD *)v21[2] != v9)
                objc_enumerationMutation(v12);
              v21[8] = *(_QWORD *)(v21[1] + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && !v25)
              {
                v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v24);
                v5 = v25;
                v25 = v4;

              }
              ++v10;
              if (v8 + 1 >= v11)
              {
                v10 = 0;
                v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v21, v27, 16);
                if (!v11)
                  break;
              }
            }
          }

          objc_storeStrong(&location, 0);
        }
      }
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (!v17)
          break;
      }
    }
  }

  v7 = v25;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  return v7;
}

- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3
{
  id v4;
  objc_super v5;
  int v6;
  id location[2];
  UISearchDisplayControllerContainerViewAccessibility *v8;
  char v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "_accessibilityAncestorIsKindOf:", objc_opt_class());

  if (v4)
  {
    v9 = 1;
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)UISearchDisplayControllerContainerViewAccessibility;
    v9 = -[UISearchDisplayControllerContainerViewAccessibility _accessibilityObscuredScreenAllowsView:](&v5, sel__accessibilityObscuredScreenAllowsView_, location[0]);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

@end
