@implementation UITableViewCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UITableViewCellContentView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_didRemoveSubview:"), "v", "@", 0);
  objc_storeStrong(v5, obj);
}

- (void)_accessibilityClearTableCellChildren
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(id *, void *);
  void *v15;
  id v16;
  _QWORD __b[8];
  void *v18;
  BOOL v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  if (a1)
  {
    v22 = 0;
    objc_opt_class();
    v9 = (id)objc_msgSend(v24, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v21 = (id)__UIAccessibilityCastAsSafeCategory();

    v20 = v21;
    objc_storeStrong(&v21, 0);
    v23 = v20;
    v19 = 0;
    memset(__b, 0, sizeof(__b));
    obj = (id)_UIAccessibilityFocusedElements();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
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
        v18 = *(void **)(__b[1] + 8 * v5);
        v2 = v18;
        v11 = MEMORY[0x24BDAC760];
        v12 = -1073741824;
        v13 = 0;
        v14 = __79__UITableViewCellContentViewAccessibility__accessibilityClearTableCellChildren__block_invoke;
        v15 = &unk_24FF3E2D0;
        v16 = v23;
        v1 = (id)objc_msgSend(v2, "_accessibilityFindAncestor:startWithSelf:", &v11, 0);
        v19 = v1 != 0;

        if (v19)
          v10 = 2;
        else
          v10 = 0;
        objc_storeStrong(&v16, 0);
        if (v10)
          break;
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
          if (!v6)
            break;
        }
      }
    }

    if (!v19)
      objc_msgSend(v23, "_accessibilityClearChildren");
    objc_storeStrong(&v23, 0);
  }
}

BOOL __79__UITableViewCellContentViewAccessibility__accessibilityClearTableCellChildren__block_invoke(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)_didRemoveSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellContentViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellContentViewAccessibility;
  -[UITableViewCellContentViewAccessibility _didRemoveSubview:](&v3, sel__didRemoveSubview_, location[0]);
  -[UITableViewCellContentViewAccessibility _accessibilityClearTableCellChildren](v5);
  objc_storeStrong(location, 0);
}

- (void)didAddSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellContentViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellContentViewAccessibility;
  -[UITableViewCellContentViewAccessibility didAddSubview:](&v3, sel_didAddSubview_, location[0]);
  -[UITableViewCellContentViewAccessibility _accessibilityClearTableCellChildren](v5);
  objc_storeStrong(location, 0);
}

@end
