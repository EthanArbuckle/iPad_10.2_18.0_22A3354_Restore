@implementation UITabBarCustomizeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBarCustomizeView");
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
  v3 = CFSTR("UITabBarCustomizeView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBarCustomizeView"), CFSTR("_draggingItem"), "UITabBarItem");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBar"), CFSTR("_items"), "NSArray");
  v5 = CFSTR("view");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITabBarItem"), 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("tabBarTouchesBegan: withEvent:"), v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("tabBarTouchesMoved: withEvent:"), v4, v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("tabBarTouchesEnded: withEvent:"), v4, v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITabBarItemProxy"), v5, v6, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tabBar"));
  v5[0] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  objc_super v11;
  id v12;
  id v13;
  id location[2];
  UITabBarCustomizeViewAccessibility *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v15, "safeValueForKey:");
  v11.receiver = v15;
  v11.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, location[0], v13);
  v10 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("_draggingProxy"));
  if (!v12 && v10)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v7 = accessibilityLocalizedString(CFSTR("started.moving.tabbar.icon"));
    v6 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("view"));
    v5 = (id)objc_msgSend(v6, "accessibilityLabel");
    v9 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  UIAccessibilityNotifications *v12;
  id v14[2];
  id v15;
  id v16;
  objc_super v17;
  id v18;
  id v19;
  id location[2];
  UITabBarCustomizeViewAccessibility *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v21, "safeValueForKey:");
  v17.receiver = v21;
  v17.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility touchesMoved:withEvent:](&v17, sel_touchesMoved_withEvent_, location[0], v19);
  v16 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_replaceItem"));
  if (v16 && (objc_msgSend(v18, "isEqual:", v16) & 1) == 0)
  {
    v15 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("view"));
    v12 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE28]);
    v5 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_tabBar"));
    v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_items"));
    v6 = (char *)objc_msgSend(v4, "indexOfObject:", v16);

    v14[1] = v6;
    v7 = (void *)MEMORY[0x24BDD17C8];
    v11 = accessibilityLocalizedString(CFSTR("replacing.tabbar.icon"));
    v10 = (id)objc_msgSend(v15, "accessibilityLabel");
    v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 + 1);
    v8 = (id)AXFormatNumber();
    v14[0] = (id)objc_msgSend(v7, "stringWithFormat:", v11, v10, v8);

    UIAccessibilityPostNotification(*v12, v14[0]);
    objc_storeStrong(v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id v7;
  id location[2];
  UITabBarCustomizeViewAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_draggingProxy"));
  v5.receiver = v9;
  v5.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, location[0], v7);
  if (v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  objc_super v11;
  id v12;
  id location[2];
  UITabBarCustomizeViewAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility tabBarTouchesBegan:withEvent:](&v11, sel_tabBarTouchesBegan_withEvent_, location[0], v12);
  v10 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_draggingItem"));
  if (v10)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v7 = accessibilityLocalizedString(CFSTR("started.moving.tabbar.icon"));
    v6 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("view"));
    v5 = (id)objc_msgSend(v6, "accessibilityLabel");
    v9 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  UIAccessibilityNotifications *v12;
  id argument[2];
  id v15;
  id v16;
  objc_super v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  UITabBarCustomizeViewAccessibility *v24;
  id v25;
  id v26[2];
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id v34;
  id v35;
  id location[2];
  UITabBarCustomizeViewAccessibility *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v27 = 0;
  v28 = &v27;
  v29 = 838860800;
  v30 = 48;
  v31 = __Block_byref_object_copy__19;
  v32 = __Block_byref_object_dispose__19;
  v33 = 0;
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __67__UITabBarCustomizeViewAccessibility_tabBarTouchesMoved_withEvent___block_invoke;
  v23 = &unk_24FF3E8F0;
  v26[1] = &v27;
  v24 = v37;
  v25 = location[0];
  v26[0] = v35;
  AXPerformSafeBlock();
  v18 = (id)v28[5];
  objc_storeStrong(v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  _Block_object_dispose(&v27, 8);
  objc_storeStrong(&v33, 0);
  v34 = v18;
  v17.receiver = v37;
  v17.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility tabBarTouchesMoved:withEvent:](&v17, sel_tabBarTouchesMoved_withEvent_, location[0], v35);
  v16 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v37, "safeValueForKey:", CFSTR("_draggingItem"));
  if (v16 && v34 && (objc_msgSend(v34, "isEqual:", v16) & 1) == 0)
  {
    v12 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE28]);
    v15 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("view"));
    v5 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v37, "safeValueForKey:", CFSTR("_tabBar"));
    v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_items"));
    v6 = (char *)objc_msgSend(v4, "indexOfObject:", v16);

    argument[1] = v6;
    v7 = (void *)MEMORY[0x24BDD17C8];
    v11 = accessibilityLocalizedString(CFSTR("replacing.tabbar.icon"));
    v10 = (id)objc_msgSend(v15, "accessibilityLabel");
    v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 + 1);
    v8 = (id)AXFormatNumber();
    argument[0] = (id)objc_msgSend(v7, "stringWithFormat:", v11, v10, v8);

    UIAccessibilityPostNotification(*v12, argument[0]);
    objc_storeStrong(argument, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __67__UITabBarCustomizeViewAccessibility_tabBarTouchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "itemInTabBarWithTouches:withEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id v7;
  id location[2];
  UITabBarCustomizeViewAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_draggingItem"));
  v5.receiver = v9;
  v5.super_class = (Class)UITabBarCustomizeViewAccessibility;
  -[UITabBarCustomizeViewAccessibility tabBarTouchesEnded:withEvent:](&v5, sel_tabBarTouchesEnded_withEvent_, location[0], v7);
  if (v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  unint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  id v11;
  double v13;
  double v14;
  double v15;
  double v16;
  UITabBarCustomizeViewAccessibility *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  id v30;
  char v31;
  BOOL v32;
  id v33;
  char v34;
  id v35;
  id v36;
  int v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect r2;
  CGRect v47;
  id v48;
  id v49;
  char v50;
  id v51;
  _QWORD __b[8];
  id v53;
  CGRect r1;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  id v63;
  id v64;
  char v65;
  objc_super v66;
  id v67;
  int v68;
  id v69;
  id *v70;
  char v71;
  uint64_t v72;
  int v73;
  int v74;
  BOOL (*v75)(uint64_t);
  void *v76;
  UITabBarCustomizeViewAccessibility *v77;
  char v78;
  id location[2];
  UITabBarCustomizeViewAccessibility *v80;
  CGPoint v81;
  id v82;
  float v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v81 = a3;
  v80 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v78 = -[UITabBarCustomizeViewAccessibility _accessibilityBoolValueForKey:](v80, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v71 = 0;
  v32 = 0;
  if (!v78)
  {
    v72 = MEMORY[0x24BDAC760];
    v73 = -1073741824;
    v74 = 0;
    v75 = __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v76 = &unk_24FF3E0C0;
    v77 = v80;
    v71 = 1;
    v70 = (id *)&v77;
    v32 = v75((uint64_t)&v72);
  }
  if (v32)
  {
    -[UITabBarCustomizeViewAccessibility _accessibilitySetBoolValue:forKey:](v80, "_accessibilitySetBoolValue:forKey:", 1);
    v69 = (id)-[UITabBarCustomizeViewAccessibility accessibilityHitTest:withEvent:](v80, "accessibilityHitTest:withEvent:", location[0], v81.x, v81.y);
    -[UITabBarCustomizeViewAccessibility _accessibilitySetBoolValue:forKey:](v80, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v82 = v69;
    v68 = 1;
    objc_storeStrong(&v69, 0);
  }
  else
  {
    v68 = 0;
  }
  if ((v71 & 1) != 0)
    objc_storeStrong(v70, 0);
  if (!v68)
  {
    v66.receiver = v80;
    v66.super_class = (Class)UITabBarCustomizeViewAccessibility;
    v67 = -[UITabBarCustomizeViewAccessibility _accessibilityHitTest:withEvent:](&v66, sel__accessibilityHitTest_withEvent_, location[0], v81.x, v81.y);
    v61 = 0;
    if (!v67 || (v31 = 0, v67 == v80))
    {
      v65 = 0;
      objc_opt_class();
      v64 = (id)__UIAccessibilityCastAsClass();
      v63 = v64;
      objc_storeStrong(&v64, 0);
      v62 = v63;
      v61 = 1;
      v31 = objc_msgSend(v63, "pointInside:withEvent:", location[0], v81.x, v81.y);
    }
    if ((v61 & 1) != 0)

    if ((v31 & 1) != 0)
    {
      v59 = 0;
      objc_opt_class();
      v30 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v80, "safeValueForKey:", CFSTR("_proxies"));
      v58 = (id)__UIAccessibilityCastAsClass();

      v57 = v58;
      objc_storeStrong(&v58, 0);
      v60 = v57;
      v56 = 0;
      v26 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v80, "safeValueForKey:", CFSTR("_itemsInRowCount"));
      v27 = objc_msgSend(v26, "integerValue");

      v56 = v27;
      v55 = 0;
      v4 = objc_msgSend(v60, "count");
      v83 = (float)v4 / (float)v56;
      v55 = vcvtps_s32_f32(v83);
      memset(&r1, 0, sizeof(r1));
      r1 = *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF070];
      memset(__b, 0, sizeof(__b));
      obj = v60;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v84, 16);
      if (v29)
      {
        v23 = *(_QWORD *)__b[2];
        v24 = 0;
        v25 = v29;
        while (1)
        {
          v22 = v24;
          if (*(_QWORD *)__b[2] != v23)
            objc_enumerationMutation(obj);
          v53 = *(id *)(__b[1] + 8 * v24);
          v50 = 0;
          objc_opt_class();
          v21 = (id)objc_msgSend(v53, "safeValueForKey:", CFSTR("view"));
          v49 = (id)__UIAccessibilityCastAsClass();

          if ((v50 & 1) != 0)
            abort();
          v48 = v49;
          objc_storeStrong(&v49, 0);
          v51 = v48;
          objc_msgSend(v48, "frame");
          r2.origin.x = v5;
          r2.origin.y = v6;
          r2.size.width = v7;
          r2.size.height = v8;
          v47 = CGRectUnion(r1, r2);
          r1 = v47;
          objc_storeStrong(&v51, 0);
          ++v24;
          if (v22 + 1 >= v25)
          {
            v24 = 0;
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v84, 16);
            if (!v25)
              break;
          }
        }
      }

      v17 = v80;
      v20 = (id)objc_msgSend(v60, "firstObject");
      v19 = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("view"));
      v18 = (id)objc_msgSend(v19, "superview");
      -[UITabBarCustomizeViewAccessibility convertPoint:toView:](v17, "convertPoint:toView:", v81.x, v81.y);
      v44 = v9;
      v45 = v10;

      v45 = v45 - r1.origin.y;
      v43 = v44 - r1.origin.x;
      v42 = r1.size.width - 1.0;
      if (v44 - r1.origin.x >= r1.size.width - 1.0)
        v16 = v42;
      else
        v16 = v43;
      v41 = v16;
      v44 = v16;
      v40 = v16;
      v39 = 0;
      if (v16 >= (double)0)
        v15 = v40;
      else
        v15 = (double)v39;
      v38 = v15;
      v44 = v15;
      r1.size.width = r1.size.width / (double)v56;
      r1.size.height = r1.size.height / (double)v55;
      v14 = (double)v56;
      v13 = CGFloor(v45 / r1.size.height);
      v37 = (int)(CGFloor(v15 / r1.size.width) + v14 * v13);
      v34 = 0;
      if (v37 < 0 || v37 >= (int)objc_msgSend(v60, "count"))
      {
        v11 = 0;
      }
      else
      {
        v35 = (id)objc_msgSend(v60, "objectAtIndex:", v37);
        v34 = 1;
        v11 = v35;
      }
      v36 = v11;
      if ((v34 & 1) != 0)

      v33 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("view"));
      if (v33)
        objc_storeStrong(&v67, v33);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v60, 0);
    }
    v82 = v67;
    v68 = 1;
    objc_storeStrong(&v67, 0);
  }
  objc_storeStrong(location, 0);
  return v82;
}

BOOL __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_2;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_37);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_2;
}

void __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_2 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

@end
