@implementation UINavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const char *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UINavigationBar");
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = CFSTR("UINavigationItem");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_wantsBackButtonIndicator"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("layoutSubviews"), v8, 0);
  v3 = CFSTR("_UINavigationBarVisualProviderLegacyIOS");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_backIndicatorView"), "UIImageView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3, CFSTR("_UINavigationBarVisualProvider"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_backgroundView"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v5, CFSTR("backAction"), v7);
  v6 = CFSTR("_UINavigationBarTitleControl");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("titleLabel"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("titleView"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchBar"), CFSTR("_cancelButtonPressed"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (NSArray)_accessibilityNavBarElements
{
  return (NSArray *)objc_getAssociatedObject(self, &__UINavigationBarAccessibility___accessibilityNavBarElements);
}

- (void)_accessibilitySetNavBarElements:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityFauxBackButton
{
  return objc_getAssociatedObject(self, &__UINavigationBarAccessibility___accessibilityFauxBackButton);
}

- (void)_accessibilitySetFauxBackButton:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double v4;
  double v5;
  char v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  objc_super v13;
  char v14;
  id location[2];
  UINavigationBarAccessibility *v16;
  CGPoint v17;

  v17 = a3;
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)UINavigationBarAccessibility;
  v14 = -[UINavigationBarAccessibility _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](&v13, sel__accessibilityAllowOutOfBoundsHitTestAtPoint_withEvent_, location[0], v17.x, v17.y);
  if (!v14 && (AXDeviceHasHomeButton() & 1) == 0 && (AXDeviceIsPhone() & 1) != 0)
  {
    v11 = 0;
    objc_opt_class();
    v8 = (id)-[UINavigationBarAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_backgroundView"));
    v10 = (id)__UIAccessibilityCastAsClass();

    v9 = v10;
    objc_storeStrong(&v10, 0);
    v12 = v9;
    -[UINavigationBarAccessibility convertPoint:toView:](v16, "convertPoint:toView:", v9, v17.x, v17.y);
    if (v17.y < 0.0 && (objc_msgSend(v12, "pointInside:withEvent:", location[0], v4, v5) & 1) != 0)
      v14 = 1;
    objc_storeStrong(&v12, 0);
  }
  v7 = v14;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v6;

  v6 = 1;
  v2 = (id)-[UINavigationBarAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
  v5 = v2 == 0;

  if (!v5)
  {
    v4 = (id)-[UINavigationBarAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
    v6 = objc_msgSend(v4, "BOOLValue") & 1;

  }
  return v6;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  id v3;
  BOOL v4;
  objc_super v5;
  SEL v6;
  UINavigationBarAccessibility *v7;

  v7 = self;
  v6 = a2;
  v3 = -[UINavigationBarAccessibility accessibilityElements](self, "accessibilityElements");
  v4 = (unint64_t)objc_msgSend(v3, "count") > 2;

  if (!v4)
    return 0;
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationBarAccessibility;
  return -[UINavigationBarAccessibility _accessibilityIsGroupedParent](&v5, sel__accessibilityIsGroupedParent);
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return (id)accessibilityUIKitLocalizedString();
}

- (id)accessibilityIdentifier
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  NSArray *v14;
  NSString *v15;
  id v16;
  id v17;
  BOOL v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  os_log_t v24;
  id v25;
  os_log_type_t v26;
  os_log_t v27;
  id obj;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  os_log_type_t v32;
  os_log_t v33;
  id v34;
  id v35;
  os_log_type_t v36;
  os_log_t v37;
  os_log_type_t v38;
  os_log_t oslog;
  os_log_type_t v40;
  id v41;
  os_log_type_t v42;
  id v43;
  id v44;
  int v45;
  os_log_type_t type;
  id location;
  objc_super v48;
  id v49[2];
  UINavigationBarAccessibility *v50;
  id v51;
  uint8_t v52[32];
  uint8_t v53[32];
  uint8_t v54[32];
  uint8_t v55[32];
  uint8_t v56[32];
  uint8_t v57[32];
  uint8_t v58[32];
  uint8_t v59[32];
  uint8_t v60[24];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v50 = self;
  v49[1] = (id)a2;
  v48.receiver = self;
  v48.super_class = (Class)UINavigationBarAccessibility;
  v49[0] = -[UINavigationBarAccessibility accessibilityIdentifier](&v48, sel_accessibilityIdentifier);
  location = (id)AXLogUIA();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v49[0], (uint64_t)v50);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, type, "NavBar: set identifier %@ %@", v60, 0x16u);
  }
  objc_storeStrong(&location, 0);
  if (v49[0])
  {
    v51 = v49[0];
    v45 = 1;
  }
  else
  {
    objc_opt_class();
    v23 = (id)-[UINavigationBarAccessibility topItem](v50, "topItem");
    v44 = (id)__UIAccessibilityCastAsClass();

    v43 = (id)AXLogUIA();
    v42 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v59, (uint64_t)v44, (uint64_t)v50);
      _os_log_debug_impl(&dword_230C4A000, (os_log_t)v43, v42, "NavBar: top most item %@ %@", v59, 0x16u);
    }
    objc_storeStrong(&v43, 0);
    v2 = (id)objc_msgSend(v44, "accessibilityIdentifier");
    v3 = v49[0];
    v49[0] = v2;

    if (objc_msgSend(v49[0], "length"))
    {
      v41 = (id)AXLogUIA();
      v40 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, (uint64_t)v49[0], (uint64_t)v50);
        _os_log_debug_impl(&dword_230C4A000, (os_log_t)v41, v40, "NavBar: top most nav item identifier %@ %@", v58, 0x16u);
      }
      objc_storeStrong(&v41, 0);
      v51 = v49[0];
      v45 = 1;
    }
    else
    {
      v4 = (id)objc_msgSend(v44, "title");
      v5 = v49[0];
      v49[0] = v4;

      if (objc_msgSend(v49[0], "length"))
      {
        oslog = (os_log_t)(id)AXLogUIA();
        v38 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v49[0], (uint64_t)v50);
          _os_log_debug_impl(&dword_230C4A000, oslog, v38, "NavBar: top most nav item title %@ %@", v57, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v51 = v49[0];
        v45 = 1;
      }
      else
      {
        v22 = (id)objc_msgSend(v44, "titleView");
        v6 = (id)objc_msgSend(v22, "accessibilityLabel");
        v7 = v49[0];
        v49[0] = v6;

        if (objc_msgSend(v49[0], "length"))
        {
          v37 = (os_log_t)(id)AXLogUIA();
          v36 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v56, (uint64_t)v49[0], (uint64_t)v50);
            _os_log_debug_impl(&dword_230C4A000, v37, v36, "NavBar: top most titleView %@ %@", v56, 0x16u);
          }
          objc_storeStrong((id *)&v37, 0);
          v51 = v49[0];
          v45 = 1;
        }
        else
        {
          objc_opt_class();
          v21 = (id)-[UINavigationBarAccessibility delegate](v50, "delegate");
          v35 = (id)__UIAccessibilityCastAsClass();

          if (!v35)
            goto LABEL_42;
          v34 = (id)objc_msgSend(v35, "delegate");
          v19 = (id)objc_msgSend(v34, "accessibilityIdentifier");
          v20 = objc_msgSend(v19, "length") == 0;

          if (v20)
          {
            v31 = (id)objc_msgSend(v35, "navigationItem");
            v17 = (id)objc_msgSend(v44, "accessibilityIdentifier");
            v18 = objc_msgSend(v17, "length") == 0;

            if (v18)
            {
              obj = (id)objc_msgSend(v31, "title");
              if (obj)
              {
                v27 = (os_log_t)(id)AXLogUIA();
                v26 = OS_LOG_TYPE_DEBUG;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v53, (uint64_t)v31, (uint64_t)obj);
                  _os_log_debug_impl(&dword_230C4A000, v27, v26, "NavBar: using title from navController:item %@ %@", v53, 0x16u);
                }
                objc_storeStrong((id *)&v27, 0);
                objc_storeStrong(v49, obj);
              }
              else
              {
                v25 = (id)objc_msgSend(v35, "visibleViewController");
                if (!v25)
                {
                  v25 = (id)objc_msgSend(v35, "topViewController");

                }
                v8 = (id)objc_msgSend(v44, "accessibilityIdentifier");
                v9 = v49[0];
                v49[0] = v8;

                if (!objc_msgSend(v49[0], "length"))
                {
                  v10 = (objc_class *)objc_opt_class();
                  v15 = NSStringFromClass(v10);
                  v14 = -[NSString componentsSeparatedByString:](v15, "componentsSeparatedByString:", CFSTR("Controller"));
                  v11 = -[NSArray firstObject](v14, "firstObject");
                  v12 = v49[0];
                  v49[0] = v11;

                }
                v24 = (os_log_t)(id)AXLogUIA();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v52, (uint64_t)v25, (uint64_t)v49[0]);
                  _os_log_debug_impl(&dword_230C4A000, v24, OS_LOG_TYPE_DEBUG, "NavBar: viewController %@ %@", v52, 0x16u);
                }
                objc_storeStrong((id *)&v24, 0);
                objc_storeStrong(&v25, 0);
              }
              objc_storeStrong(&obj, 0);
              v45 = 0;
            }
            else
            {
              v30 = (os_log_t)(id)AXLogUIA();
              v29 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v16 = (id)objc_msgSend(v44, "accessibilityIdentifier");
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, (uint64_t)v31, (uint64_t)v16);
                _os_log_debug_impl(&dword_230C4A000, v30, v29, "NavBar: using identifier from navController:item %@ %@", v54, 0x16u);

              }
              objc_storeStrong((id *)&v30, 0);
              v51 = (id)objc_msgSend(v44, "accessibilityIdentifier");
              v45 = 1;
            }
            objc_storeStrong(&v31, 0);
          }
          else
          {
            v33 = (os_log_t)(id)AXLogUIA();
            v32 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v55, (uint64_t)v34, (uint64_t)v50);
              _os_log_debug_impl(&dword_230C4A000, v33, v32, "NavBar: navDelegate %@ %@", v55, 0x16u);
            }
            objc_storeStrong((id *)&v33, 0);
            v51 = (id)objc_msgSend(v34, "accessibilityIdentifier");
            v45 = 1;
          }
          objc_storeStrong(&v34, 0);
          if (!v45)
          {
LABEL_42:
            v51 = v49[0];
            v45 = 1;
          }
          objc_storeStrong(&v35, 0);
        }
      }
    }
    objc_storeStrong(&v44, 0);
  }
  objc_storeStrong(v49, 0);
  return v51;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  int v24;
  id v25;
  char v26;
  id v27;
  objc_super v28;
  _QWORD v29[8];
  id v30;
  id v31;
  _QWORD __b[8];
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47[2];
  id v48;
  char v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v48 = self;
  v47[1] = (id)a2;
  v47[0] = self;
  v46 = (id)objc_msgSend(v47[0], "_accessibility_contentsOfNavigationBar");
  v27 = (id)objc_msgSend(v46, "topItem");
  v45 = (id)objc_msgSend(v27, "searchController");

  if ((objc_msgSend(v45, "isActive") & 1) != 0)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = -1073741824;
    v41 = 0;
    v42 = __58__UINavigationBarAccessibility_accessibilityPerformEscape__block_invoke;
    v43 = &unk_24FF3DA40;
    v44 = v45;
    AXPerformSafeBlock();
    v49 = 1;
    v38 = 1;
    objc_storeStrong(&v44, 0);
  }
  else
  {
    v25 = (id)objc_msgSend(v46, "viewsRepresentingBackButton");
    v36 = 0;
    v34 = 0;
    v26 = 1;
    if (!objc_msgSend(v25, "count"))
    {
      v37 = (id)objc_msgSend(v46, "backBarButtonItem");
      v36 = 1;
      LOBYTE(v24) = 0;
      if (v37)
      {
        v35 = (id)objc_msgSend(v46, "backBarButtonItem");
        v34 = 1;
        v24 = objc_msgSend(v35, "isHidden") ^ 1;
      }
      v26 = v24;
    }
    if ((v34 & 1) != 0)

    if ((v36 & 1) != 0)
    if ((v26 & 1) != 0)
    {
      objc_msgSend(v47[0], "_accessibility_triggerBackButton");
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
      v49 = 1;
      v38 = 1;
    }
    else
    {
      v22 = (id)objc_msgSend(v46, "cancelBarButtonItems");
      v23 = objc_msgSend(v22, "count") == 0;

      if (v23)
      {
        memset(__b, 0, sizeof(__b));
        v17 = (id)objc_msgSend(v46, "topItem");
        obj = (id)objc_msgSend(v17, "leftBarButtonItems");

        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
        if (v19)
        {
          v14 = *(_QWORD *)__b[2];
          v15 = 0;
          v16 = v19;
          while (1)
          {
            v13 = v15;
            if (*(_QWORD *)__b[2] != v14)
              objc_enumerationMutation(obj);
            v33 = *(id *)(__b[1] + 8 * v15);
            v10 = (id)objc_msgSend(v33, "view");
            v12 = objc_msgSend(v10, "accessibilityTraits");
            v11 = *MEMORY[0x24BEBB100];

            if ((v12 & v11) != 0)
              break;
            ++v15;
            if (v13 + 1 >= v16)
            {
              v15 = 0;
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
              if (!v16)
                goto LABEL_23;
            }
          }
          objc_msgSend(v47[0], "_accessibility_triggerBarButtonItem:", v33);
          v49 = 1;
          v38 = 1;
        }
        else
        {
LABEL_23:
          v38 = 0;
        }

        if (!v38)
        {
          v31 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)v48, v46);
          v2 = objc_msgSend(v31, "accessibilityTraits");
          if ((v2 & *MEMORY[0x24BEBB100]) != 0)
          {
            objc_msgSend(v47[0], "_accessibility_triggerBarButtonItem:", v31);
            v49 = 1;
            v38 = 1;
          }
          else
          {
            memset(v29, 0, sizeof(v29));
            v8 = (id)objc_msgSend(v47[0], "items");
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v29, v50, 16);
            if (v9)
            {
              v5 = *(_QWORD *)v29[2];
              v6 = 0;
              v7 = v9;
              while (1)
              {
                v4 = v6;
                if (*(_QWORD *)v29[2] != v5)
                  objc_enumerationMutation(v8);
                v30 = *(id *)(v29[1] + 8 * v6);
                if ((objc_msgSend(v30, "accessibilityPerformEscape") & 1) != 0)
                  break;
                ++v6;
                if (v4 + 1 >= v7)
                {
                  v6 = 0;
                  v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v29, v50, 16);
                  if (!v7)
                    goto LABEL_35;
                }
              }
              v49 = 1;
              v38 = 1;
            }
            else
            {
LABEL_35:
              v38 = 0;
            }

            if (!v38)
            {
              v28.receiver = v48;
              v28.super_class = (Class)UINavigationBarAccessibility;
              v49 = -[UINavigationBarAccessibility accessibilityPerformEscape](&v28, sel_accessibilityPerformEscape);
              v38 = 1;
            }
          }
          objc_storeStrong(&v31, 0);
        }
      }
      else
      {
        v21 = (id)objc_msgSend(v46, "cancelBarButtonItems");
        v20 = (id)objc_msgSend(v21, "firstObject");
        objc_msgSend(v47[0], "_accessibility_triggerBarButtonItem:");

        v49 = 1;
        v38 = 1;
      }
    }
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
  return v49 & 1;
}

void __58__UINavigationBarAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "searchBar");
  objc_msgSend(v1, "_cancelButtonPressed");

}

- (id)_accessibilityStaticBarButtonItemWithContents:(uint64_t)a1
{
  id v3;
  int v4;
  id location;
  uint64_t v6;
  id v7;

  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    v3 = (id)objc_msgSend(location, "staticBarButtonItem");
    if ((objc_msgSend(v3, "isHidden") & 1) != 0)
      objc_storeStrong(&v3, 0);
    v7 = v3;
    v4 = 1;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    v7 = 0;
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)accessibilityElements
{
  id v2;
  id v3;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = -[UINavigationBarAccessibility _accessibilityFetchCachedNavBarElements](self);
  v2 = (id)objc_msgSend(v6[0], "axFilterObjectsUsingBlock:", &__block_literal_global_26);
  v3 = v6[0];
  v6[0] = v2;

  v5 = (id)objc_msgSend(v6[0], "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)_accessibilityFetchCachedNavBarElements
{
  id v1;
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
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  UIAccessibilityBackButtonElement *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  char v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[8];
  id v91;
  id v92;
  _QWORD v93[8];
  uint64_t v94;
  char v95;
  id v96;
  char v97;
  id v98;
  id v99;
  id v100;
  _QWORD v101[8];
  void *v102;
  _QWORD v103[8];
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[8];
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  int v117;
  int v118;
  CGFloat (*v119)(uint64_t);
  void *v120;
  id v121;
  id from;
  char v123;
  id v124;
  id v125;
  char v126;
  id v127;
  char v128;
  id v129;
  char v130;
  id v131;
  char v132;
  id v133;
  char v134;
  id v135;
  _QWORD __b[8];
  id v137;
  char v138;
  id v139;
  char v140;
  id v141;
  char v142;
  id v143;
  char v144;
  id v145;
  char v146;
  id v147;
  char v148;
  id v149;
  char v150;
  id v151;
  char v152;
  id v153;
  char v154;
  id v155;
  id v156;
  id v157;
  id v158;
  char v159;
  id v160;
  char v162;
  id v163;
  char v164;
  id v165;
  char v166;
  BOOL v167;
  id v168;
  id v169;
  id v170;
  id v171;
  os_log_type_t type;
  os_log_t oslog;
  int v174;
  objc_super v175;
  id v176;
  id val;
  id v178;
  _BYTE v179[128];
  _BYTE v180[128];
  id v181;
  id v182;
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint8_t v187[24];
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  val = a1;
  if (a1)
  {
    v175.receiver = val;
    v175.super_class = (Class)UINavigationBarAccessibility;
    v176 = objc_msgSendSuper2(&v175, sel_accessibilityElements);
    if (v176)
    {
      v178 = v176;
      v174 = 1;
    }
    else
    {
      if (-[UINavigationBarAccessibility _accessibilityHasLeftRightButtonCountChanged](val)
        || (-[UINavigationBarAccessibility _accessibilityHasTitleViewChanged](val) & 1) != 0
        || -[UINavigationBarAccessibility _accessibilityHasStaticNavBarButtonChanged](val))
      {
        oslog = (os_log_t)(id)AXLogUIA();
        type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v187, (uint64_t)val);
          _os_log_impl(&dword_230C4A000, oslog, type, "Left/Right button count change for %@, resetting", v187, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_msgSend(val, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
      }
      v171 = (id)objc_msgSend(val, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
      if (objc_msgSend(v171, "count")
        && objc_msgSend(v171, "indexOfObjectPassingTest:", &__block_literal_global_286) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v178 = v171;
        v174 = 1;
      }
      else
      {
        objc_msgSend(val, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
        v1 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = v171;
        v171 = v1;

        v170 = val;
        v169 = (id)objc_msgSend(v170, "_accessibility_contentsOfNavigationBar");
        v168 = (id)objc_msgSend(v169, "viewsRepresentingBackButton");
        v167 = (objc_msgSend(val, "_accessibilityViewIsVisible") & 1) != 0;
        v166 = 0;
        v87 = (id)objc_msgSend(v169, "topItem");
        v86 = (id)objc_msgSend(v87, "searchController");
        v164 = 0;
        v162 = 0;
        v85 = 0;
        if ((objc_msgSend(v86, "isActive") & 1) != 0)
        {
          v165 = (id)objc_msgSend(v169, "topItem");
          v164 = 1;
          v163 = (id)objc_msgSend(v165, "searchController");
          v162 = 1;
          v85 = objc_msgSend(v163, "hidesNavigationBarDuringPresentation");
        }
        v166 = v85 & 1;
        if ((v162 & 1) != 0)

        if ((v164 & 1) != 0)
        if ((v166 & 1) == 0)
        {
          if (objc_msgSend(v168, "indexOfObjectPassingTest:", &__block_literal_global_288) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v159 = 0;
            objc_opt_class();
            v84 = (id)objc_msgSend(v169, "topItem");
            v83 = (id)objc_msgSend(v84, "safeValueForKey:", CFSTR("backAction"));
            v158 = (id)__UIAccessibilityCastAsClass();

            v157 = v158;
            objc_storeStrong(&v158, 0);
            v160 = v157;
            v82 = (id)objc_msgSend(v169, "backBarButtonItem");
            v81 = (id)objc_msgSend(v82, "_accessibilityAXAttributedLabel");
            v156 = trimWhitespaceToNil(v81);

            v154 = 0;
            v152 = 0;
            v150 = 0;
            if (v156)
            {
              objc_storeStrong(&v156, v156);
            }
            else
            {
              v155 = (id)objc_msgSend(v169, "backItem");
              v154 = 1;
              v153 = (id)objc_msgSend(v155, "backButtonTitle");
              v152 = 1;
              v151 = trimWhitespaceToNil(v153);
              v150 = 1;
              objc_storeStrong(&v156, v151);
            }
            if ((v150 & 1) != 0)

            if ((v152 & 1) != 0)
            if ((v154 & 1) != 0)

            v148 = 0;
            v146 = 0;
            v144 = 0;
            if (v156)
            {
              objc_storeStrong(&v156, v156);
            }
            else
            {
              v149 = (id)objc_msgSend(v169, "backItem");
              v148 = 1;
              v147 = (id)objc_msgSend(v149, "_accessibilityAXAttributedLabel");
              v146 = 1;
              v145 = trimWhitespaceToNil(v147);
              v144 = 1;
              objc_storeStrong(&v156, v145);
            }
            if ((v144 & 1) != 0)

            if ((v146 & 1) != 0)
            if ((v148 & 1) != 0)

            v142 = 0;
            v140 = 0;
            v138 = 0;
            if (v156)
            {
              objc_storeStrong(&v156, v156);
            }
            else
            {
              v143 = (id)objc_msgSend(v169, "backItem");
              v142 = 1;
              v141 = (id)objc_msgSend(v143, "title");
              v140 = 1;
              v139 = trimWhitespaceToNil(v141);
              v138 = 1;
              objc_storeStrong(&v156, v139);
            }
            if ((v138 & 1) != 0)

            if ((v140 & 1) != 0)
            if ((v142 & 1) != 0)

            memset(__b, 0, sizeof(__b));
            v80 = (id)objc_msgSend(v170, "_accessibility_contentsOfNavigationBar");
            v79 = (id)objc_msgSend(v80, "viewsRepresentingBackButton");

            v78 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", __b, v186, 16);
            if (v78)
            {
              v75 = *(_QWORD *)__b[2];
              v76 = 0;
              v77 = v78;
              while (1)
              {
                v74 = v76;
                if (*(_QWORD *)__b[2] != v75)
                  objc_enumerationMutation(v79);
                v137 = *(id *)(__b[1] + 8 * v76);
                v134 = 0;
                v132 = 0;
                if (v156)
                {
                  objc_storeStrong(&v156, v156);
                }
                else
                {
                  v135 = (id)objc_msgSend(v137, "_accessibilityAXAttributedLabel");
                  v134 = 1;
                  v133 = trimWhitespaceToNil(v135);
                  v132 = 1;
                  objc_storeStrong(&v156, v133);
                }
                if ((v132 & 1) != 0)

                if ((v134 & 1) != 0)
                ++v76;
                if (v74 + 1 >= v77)
                {
                  v76 = 0;
                  v77 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", __b, v186, 16);
                  if (!v77)
                    break;
                }
              }
            }

            v130 = 0;
            v128 = 0;
            if (v156)
            {
              objc_storeStrong(&v156, v156);
            }
            else
            {
              v131 = (id)objc_msgSend(v160, "accessibilityLabel");
              v130 = 1;
              v129 = trimWhitespaceToNil(v131);
              v128 = 1;
              objc_storeStrong(&v156, v129);
            }
            if ((v128 & 1) != 0)

            if ((v130 & 1) != 0)
            v126 = 0;
            if (v156)
            {
              objc_storeStrong(&v156, v156);
            }
            else
            {
              v127 = accessibilityLocalizedString(CFSTR("uibutton.navbar.back.button.title"));
              v126 = 1;
              objc_storeStrong(&v156, v127);
            }
            if ((v126 & 1) != 0)

            v73 = (id)objc_msgSend(val, "_accessibilityFauxBackButton");
            v123 = 0;
            if (v73)
            {
              v3 = v73;
            }
            else
            {
              v72 = [UIAccessibilityBackButtonElement alloc];
              v124 = -[UIAccessibilityBackButtonElement initWithAccessibilityContainer:](v72, "initWithAccessibilityContainer:", v170);
              v123 = 1;
              v3 = v124;
            }
            v125 = v3;
            if ((v123 & 1) != 0)

            objc_msgSend(v125, "setAccessibilityContainer:", val);
            -[UINavigationBarAccessibility _accessibilitySetFauxBackButton:]((uint64_t)val, v125);
            objc_msgSend(v125, "setAssociatedViews:", v168);
            objc_initWeak(&from, val);
            v71 = v125;
            v116 = MEMORY[0x24BDAC760];
            v117 = -1073741824;
            v118 = 0;
            v119 = __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_3;
            v120 = &unk_24FF3DD28;
            objc_copyWeak(&v121, &from);
            objc_msgSend(v71, "_setAccessibilityFrameBlock:", &v116);
            objc_msgSend(v125, "_accessibilitySetSortPriority:", 1);
            objc_msgSend(v125, "setAccessibilityLabel:", v156);
            v70 = (id)objc_msgSend(v160, "accessibilityIdentifier");
            objc_msgSend(v125, "setAccessibilityIdentifier:");

            v69 = (id)objc_msgSend(v169, "backBarButtonItem");
            v68 = (id)objc_msgSend(v69, "accessibilityUserInputLabels");
            objc_msgSend(v125, "setAccessibilityUserInputLabels:");

            objc_msgSend(v125, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB100]);
            v67 = (id)objc_msgSend(v169, "backItem");
            v66 = (id)objc_msgSend(v67, "accessibilityLanguage");
            objc_msgSend(v125, "setAccessibilityLanguage:");

            objc_msgSend(v171, "addObject:", v125);
            objc_destroyWeak(&v121);
            objc_destroyWeak(&from);
            objc_storeStrong(&v125, 0);
            objc_storeStrong(&v156, 0);
            objc_storeStrong(&v160, 0);
          }
          v115 = -[UINavigationBarAccessibility _accessibilityRightButtonElements](val);
          v114 = -[UINavigationBarAccessibility _accessibilityLeftButtonElements](val);
          memset(v112, 0, sizeof(v112));
          v65 = (void *)MEMORY[0x24BDBCE30];
          v64 = (id)objc_msgSend(v169, "largeTitleView");
          v63 = (id)objc_msgSend(v169, "titleView");
          v62 = (id)objc_msgSend(v65, "axArrayByIgnoringNilElementsWithCount:", 2, v64, v63);

          v61 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", v112, v185, 16);
          if (v61)
          {
            v58 = *(_QWORD *)v112[2];
            v59 = 0;
            v60 = v61;
            while (1)
            {
              v57 = v59;
              if (*(_QWORD *)v112[2] != v58)
                objc_enumerationMutation(v62);
              v113 = *(id *)(v112[1] + 8 * v59);
              v111 = v113;
              NSClassFromString(CFSTR("_UINavigationBarTitleControl"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v4 = (id)objc_msgSend(v113, "safeValueForKey:", CFSTR("titleLabel"));
                v56 = v4 == 0;

                if (v56)
                {
                  v5 = (id)objc_msgSend(v113, "safeValueForKey:", CFSTR("titleView"));
                }
                else
                {
                  objc_msgSend(v113, "_accessibilityLoadAccessibilityInformation");
                  v5 = (id)objc_msgSend(v113, "safeValueForKey:", CFSTR("titleLabel"));
                }
                v6 = v111;
                v111 = v5;

              }
              if ((objc_msgSend(v111, "_accessibilityViewIsVisible") & 1) != 0)
              {
                v110 = (id)objc_opt_new();
                -[_UIAccessibilityNavigationViewInfo setNavigationBar:]((id *)v110, val);
                v55 = (id)objc_msgSend(v169, "topItem");
                -[_UIAccessibilityNavigationViewInfo setNavigationItem:]((id *)v110, v55);

                objc_opt_class();
                v54 = (id)__UIAccessibilityCastAsSafeCategory();
                objc_msgSend(v54, "_accessibilitySetNavigationViewInfo:", v110);

                objc_msgSend(v171, "addObject:", v111);
                objc_msgSend(val, "_accessibilitySetRetainedValue:forKey:", v111, CFSTR("AXTitleView"));
                objc_storeStrong(&v110, 0);
                v174 = 0;
              }
              else
              {
                v174 = 5;
              }
              objc_storeStrong(&v111, 0);
              ++v59;
              if (v57 + 1 >= v60)
              {
                v59 = 0;
                v60 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", v112, v185, 16);
                if (!v60)
                  break;
              }
            }
          }

          v53 = val;
          v52 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v114, "count"));
          objc_msgSend(v53, "_accessibilitySetRetainedValue:forKey:");

          v51 = val;
          v50 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v115, "count"));
          objc_msgSend(v51, "_accessibilitySetRetainedValue:forKey:");

          v109 = (id)objc_msgSend(v169, "cancelBarButtonItems");
          v108 = (id)objc_msgSend(v169, "otherBarButtonItems");
          v107 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)val, v169);
          v106 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v107);
          v105 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          memset(v103, 0, sizeof(v103));
          v48 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 5, v115, v114, v109, v108, v106);
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v103, v184, 16);
          if (v49)
          {
            v45 = *(_QWORD *)v103[2];
            v46 = 0;
            v47 = v49;
            while (1)
            {
              v44 = v46;
              if (*(_QWORD *)v103[2] != v45)
                objc_enumerationMutation(v48);
              v104 = *(id *)(v103[1] + 8 * v46);
              memset(v101, 0, sizeof(v101));
              v42 = v104;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v101, v183, 16);
              if (v43)
              {
                v39 = *(_QWORD *)v101[2];
                v40 = 0;
                v41 = v43;
                while (1)
                {
                  v38 = v40;
                  if (*(_QWORD *)v101[2] != v39)
                    objc_enumerationMutation(v42);
                  v102 = *(void **)(v101[1] + 8 * v40);
                  v100 = (id)objc_msgSend(v102, "view");
                  v37 = objc_msgSend(v100, "isAccessibilityElement");
                  v97 = 0;
                  v95 = 0;
                  if ((v37 & 1) != 0 || (objc_msgSend(v100, "_accessibilityHasOrderedChildren") & 1) != 0)
                  {
                    v182 = v100;
                    v98 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v182, 1);
                    v97 = 1;
                    v7 = v98;
                  }
                  else
                  {
                    v96 = (id)objc_msgSend(v100, "_accessibleSubviews:", 1);
                    v95 = 1;
                    v7 = v96;
                  }
                  v99 = v7;
                  if ((v95 & 1) != 0)

                  if ((v97 & 1) != 0)
                  if (v100 && !objc_msgSend(v99, "count") && AXDoesRequestingClientDeserveAutomation())
                  {
                    v181 = v100;
                    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v181, 1);
                    v9 = v99;
                    v99 = v8;

                  }
                  if (!objc_msgSend(v99, "count") && (objc_msgSend(v105, "containsObject:", v102) & 1) == 0)
                  {
                    if ((objc_msgSend(v115, "containsObject:", v102) & 1) != 0)
                    {
                      v36 = val;
                      v35 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(val, "_accessibilityIntegerValueForKey:", CFSTR("AXRightCount"))- 1);
                      objc_msgSend(v36, "_accessibilitySetRetainedValue:forKey:");

                    }
                    else if ((objc_msgSend(v114, "containsObject:", v102) & 1) != 0)
                    {
                      v34 = val;
                      v33 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(val, "_accessibilityIntegerValueForKey:", CFSTR("AXLeftCount"))- 1);
                      objc_msgSend(v34, "_accessibilitySetRetainedValue:forKey:");

                    }
                    objc_msgSend(v105, "addObject:", v102);
                  }
                  memset(v93, 0, sizeof(v93));
                  v31 = v99;
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", v93, v180, 16);
                  if (v32)
                  {
                    v28 = *(_QWORD *)v93[2];
                    v29 = 0;
                    v30 = v32;
                    while (1)
                    {
                      v27 = v29;
                      if (*(_QWORD *)v93[2] != v28)
                        objc_enumerationMutation(v31);
                      v94 = *(_QWORD *)(v93[1] + 8 * v29);
                      if ((objc_msgSend(v171, "containsObject:", v94) & 1) == 0)
                      {
                        v10 = (id)objc_msgSend(v102, "customView");
                        v26 = v10 != 0;

                        if (!v26)
                        {
                          v92 = (id)objc_opt_new();
                          -[_UIAccessibilityNavigationViewInfo setBarButtonItem:]((id *)v92, v102);
                          v25 = (id)objc_msgSend(v169, "topItem");
                          -[_UIAccessibilityNavigationViewInfo setNavigationItem:]((id *)v92, v25);

                          -[_UIAccessibilityNavigationViewInfo setIsCancelItem:]((uint64_t)v92, v104 == v109);
                          -[_UIAccessibilityNavigationViewInfo setNavigationBar:]((id *)v92, val);
                          v24 = objc_msgSend(v115, "containsObject:", v102);
                          -[_UIAccessibilityNavigationViewInfo setIsRightItem:]((uint64_t)v92, v24 & 1);
                          objc_opt_class();
                          v23 = (id)__UIAccessibilityCastAsSafeCategory();
                          objc_msgSend(v23, "_accessibilitySetNavigationViewInfo:", v92);

                          objc_storeStrong(&v92, 0);
                        }
                        objc_msgSend(v171, "addObject:", v94);
                      }
                      ++v29;
                      if (v27 + 1 >= v30)
                      {
                        v29 = 0;
                        v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", v93, v180, 16);
                        if (!v30)
                          break;
                      }
                    }
                  }

                  objc_storeStrong(&v99, 0);
                  objc_storeStrong(&v100, 0);
                  ++v40;
                  if (v38 + 1 >= v41)
                  {
                    v40 = 0;
                    v41 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v101, v183, 16);
                    if (!v41)
                      break;
                  }
                }
              }

              ++v46;
              if (v44 + 1 >= v47)
              {
                v46 = 0;
                v47 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v103, v184, 16);
                if (!v47)
                  break;
              }
            }
          }

          v22 = val;
          v21 = (id)objc_msgSend(v107, "view");
          -[UINavigationBarAccessibility _axSetCachedStaticNavBarButton:]((uint64_t)v22, v21);

          objc_storeStrong(&v105, 0);
          objc_storeStrong(&v106, 0);
          objc_storeStrong(&v107, 0);
          objc_storeStrong(&v108, 0);
          objc_storeStrong(&v109, 0);
          objc_storeStrong(&v114, 0);
          objc_storeStrong(&v115, 0);
        }
        memset(v90, 0, sizeof(v90));
        v19 = (id)objc_msgSend(val, "_accessibleSubviews:", 1);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v90, v179, 16);
        if (v20)
        {
          v16 = *(_QWORD *)v90[2];
          v17 = 0;
          v18 = v20;
          while (1)
          {
            v15 = v17;
            if (*(_QWORD *)v90[2] != v16)
              objc_enumerationMutation(v19);
            v91 = *(id *)(v90[1] + 8 * v17);
            v89 = 0;
            v88 = v91;
            while (1)
            {
              v14 = 0;
              if (v88 != val)
                v14 = v88 != 0;
              if (!v14)
                break;
              if ((objc_msgSend(v171, "containsObject:", v88) & 1) != 0
                || (objc_msgSend(v168, "containsObject:", v88) & 1) != 0)
              {
                objc_storeStrong(&v89, v88);
                break;
              }
              v11 = (id)objc_msgSend(v88, "accessibilityContainer");
              v12 = v88;
              v88 = v11;

            }
            if (!v89)
              objc_msgSend(v171, "addObject:", v91);
            objc_storeStrong(&v88, 0);
            objc_storeStrong(&v89, 0);
            ++v17;
            if (v15 + 1 >= v18)
            {
              v17 = 0;
              v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v90, v179, 16);
              if (!v18)
                break;
            }
          }
        }

        objc_msgSend(val, "_accessibilitySortElementsUsingGeometry:", v171);
        if (v167)
        {
          objc_msgSend(val, "_accessibilitySetNavBarElements:", v171);
          objc_msgSend(val, "_accessibilitySetRetainedValue:forKey:", v171, *MEMORY[0x24BEBB308]);
        }
        v178 = v171;
        v174 = 1;
        objc_storeStrong(&v168, 0);
        objc_storeStrong(&v169, 0);
        objc_storeStrong(&v170, 0);
      }
      objc_storeStrong(&v171, 0);
    }
    objc_storeStrong(&v176, 0);
  }
  else
  {
    v178 = 0;
  }
  return v178;
}

uint64_t __53__UINavigationBarAccessibility_accessibilityElements__block_invoke(void *a1, void *a2)
{
  id location[2];
  char v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1;
  else
    v4 = 1;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 20.0;
}

- (BOOL)_accessibilityHasLeftRightButtonCountChanged
{
  BOOL v2;
  id v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id obj;
  uint64_t v13;
  char v14;
  id v15;
  _QWORD __b[8];
  id v17;
  uint64_t v18;
  uint64_t v19;
  id location;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  if (a1)
  {
    v23 = objc_msgSend(v24, "_accessibilityIntegerValueForKey:", CFSTR("AXLeftCount"));
    v22 = objc_msgSend(v24, "_accessibilityIntegerValueForKey:", CFSTR("AXRightCount"));
    v21 = -[UINavigationBarAccessibility _accessibilityLeftButtonElements](v24);
    location = -[UINavigationBarAccessibility _accessibilityRightButtonElements](v24);
    v19 = objc_msgSend(v21, "count");
    v18 = objc_msgSend(location, "count");
    memset(__b, 0, sizeof(__b));
    v9 = (void *)MEMORY[0x24BDBCE30];
    v11 = (id)objc_msgSend(v21, "allObjects");
    v10 = (id)objc_msgSend(location, "allObjects");
    obj = (id)objc_msgSend(v9, "axArrayWithPossiblyNilArrays:", 2, v11, v10);

    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
    if (v13)
    {
      v6 = *(_QWORD *)__b[2];
      v7 = 0;
      v8 = v13;
      while (1)
      {
        v5 = v7;
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(obj);
        v17 = *(id *)(__b[1] + 8 * v7);
        v3 = (id)objc_msgSend(v17, "view");
        v14 = 0;
        v4 = 0;
        if (!v3)
        {
          v15 = (id)objc_msgSend(v17, "customView");
          v14 = 1;
          v4 = v15 == 0;
        }
        if ((v14 & 1) != 0)

        if (v4)
        {
          if ((objc_msgSend(location, "containsObject:", v17) & 1) != 0)
          {
            --v18;
          }
          else if ((objc_msgSend(v21, "containsObject:", v17) & 1) != 0)
          {
            --v19;
          }
        }
        ++v7;
        if (v5 + 1 >= v8)
        {
          v7 = 0;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v8)
            break;
        }
      }
    }

    v2 = 1;
    if (v23 == v19)
      v2 = v22 != v18;
    v25 = v2;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    return 0;
  }
  return v25;
}

- (id)_accessibilityLeftButtonElements
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

  v11 = a1;
  if (a1)
  {
    v10 = v11;
    v9 = (id)objc_msgSend(v10, "_accessibility_contentsOfNavigationBar");
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = v8;
    v4 = (id)objc_msgSend(v9, "topItem");
    v3 = (id)objc_msgSend(v4, "leftBarButtonItem");
    objc_msgSend(v2, "axSafelyAddObject:");

    v5 = v8;
    v7 = (id)objc_msgSend(v9, "topItem");
    v6 = (id)objc_msgSend(v7, "leftBarButtonItems");
    objc_msgSend(v5, "axSafelyAddObjectsFromArray:");

    v12 = v8;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_accessibilityRightButtonElements
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

  v11 = a1;
  if (a1)
  {
    v10 = v11;
    v9 = (id)objc_msgSend(v10, "_accessibility_contentsOfNavigationBar");
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = v8;
    v4 = (id)objc_msgSend(v9, "topItem");
    v3 = (id)objc_msgSend(v4, "rightBarButtonItem");
    objc_msgSend(v2, "axSafelyAddObject:");

    v5 = v8;
    v7 = (id)objc_msgSend(v9, "topItem");
    v6 = (id)objc_msgSend(v7, "rightBarButtonItems");
    objc_msgSend(v5, "axSafelyAddObjectsFromArray:");

    v12 = v8;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (uint64_t)_accessibilityHasTitleViewChanged
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD __b[8];
  id v12;
  int v13;
  id location;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = a1;
  if (a1)
  {
    v18 = 0;
    v17 = v19;
    v16 = (id)objc_msgSend(v17, "_accessibility_contentsOfNavigationBar");
    v15 = (id)objc_msgSend(v19, "_accessibilityValueForKey:", CFSTR("AXTitleView"));
    v8 = (void *)MEMORY[0x24BDBCE30];
    v10 = (id)objc_msgSend(v16, "largeTitleView");
    v9 = (id)objc_msgSend(v16, "titleView");
    location = (id)objc_msgSend(v8, "axArrayByIgnoringNilElementsWithCount:", 2, v10, v9);

    if (!v15 || objc_msgSend(location, "count"))
    {
      memset(__b, 0, sizeof(__b));
      obj = location;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
      if (v7)
      {
        v3 = *(_QWORD *)__b[2];
        v4 = 0;
        v5 = v7;
        while (1)
        {
          v2 = v4;
          if (*(_QWORD *)__b[2] != v3)
            objc_enumerationMutation(obj);
          v12 = *(id *)(__b[1] + 8 * v4);
          if ((objc_msgSend(v12, "_accessibilityViewIsVisible") & 1) != 0)
            v18 = v12 != v15;
          ++v4;
          if (v2 + 1 >= v5)
          {
            v4 = 0;
            v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
            if (!v5)
              break;
          }
        }
      }

      v20 = v18;
      v13 = 1;
    }
    else
    {
      v20 = 1;
      v13 = 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v20 = 0;
  }
  return v20 & 1;
}

- (id)_axGetCachedStaticNavBarButton
{
  if (a1)
    return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  else
    return 0;
}

- (void)_axSetCachedStaticNavBarButton:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedNonRetainedObject();
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityHasStaticNavBarButtonChanged
{
  id v1;
  id v3;
  id v4;
  BOOL v6;

  if (a1)
  {
    v4 = -[UINavigationBarAccessibility _axGetCachedStaticNavBarButton]((uint64_t)a1);
    v3 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItem](a1);
    v1 = (id)objc_msgSend(v3, "view");
    v6 = v4 != v1;

  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)_accessibilityStaticBarButtonItem
{
  id v2;
  id v3;
  id v4;
  id v5;

  v4 = a1;
  if (a1)
  {
    v3 = v4;
    v2 = (id)objc_msgSend(v3, "_accessibility_contentsOfNavigationBar");
    v5 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)v4, v2);
    objc_storeStrong(&v2, 0);
    objc_storeStrong(&v3, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)_accessibilityAutomationType
{
  return 21;
}

uint64_t __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  BOOL v7;
  id location[2];
  char v9;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "_accessibilityWindow");
  v7 = v4 != 0;

  if (v7)
  {
    v9 = 0;
  }
  else
  {
    *a4 = 1;
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

uint64_t __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityViewIsVisible");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

CGFloat __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  UIView *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v18;
  id WeakRetained;
  id obj;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect r2;
  _QWORD __b[8];
  id v28;
  uint64_t v29;
  uint64_t v30;
  CGRect v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30 = a1;
  v29 = a1;
  memset(&v31, 0, sizeof(v31));
  v31 = *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF070];
  memset(__b, 0, sizeof(__b));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v18 = (id)objc_msgSend(WeakRetained, "_accessibility_contentsOfNavigationBar");
  obj = (id)objc_msgSend(v18, "viewsRepresentingBackButton");

  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
  if (v21)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v21;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(obj);
      v28 = *(id *)(__b[1] + 8 * v15);
      v11 = v28;
      objc_msgSend(v28, "bounds");
      v22 = v1;
      v23 = v2;
      v24 = v3;
      v25 = v4;
      v12 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v11, "convertRect:toView:", v22, v23, v24, v25);
      r2.origin.x = v5;
      r2.origin.y = v6;
      r2.size.width = v7;
      r2.size.height = v8;

      v31 = CGRectUnion(v31, r2);
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
        if (!v16)
          break;
      }
    }
  }

  v10 = (UIView *)objc_loadWeakRetained((id *)(a1 + 32));
  v31 = UIAccessibilityConvertFrameToScreenCoordinates(v31, v10);

  return v31.origin.x;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  objc_super v13;
  SEL v14;
  UINavigationBarAccessibility *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v15, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  v8 = (id)-[UINavigationBarAccessibility _accessibility_contentsOfNavigationBar](v15, "_accessibility_contentsOfNavigationBar");
  v7 = (id)objc_msgSend(v8, "promptView");
  v6 = (id)-[UINavigationBarAccessibility accessibilityLanguage](v15, "accessibilityLanguage");
  objc_msgSend(v7, "setAccessibilityLanguage:");

  memset(__b, 0, sizeof(__b));
  obj = (id)-[UINavigationBarAccessibility items](v15, "items");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v10)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v10;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      v12 = *(id *)(__b[1] + 8 * v4);
      objc_msgSend(v12, "_accessibilityLoadAccessibilityInformation");
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v5)
          break;
      }
    }
  }

}

- (void)addSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UINavigationBarAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility addSubview:](&v3, sel_addSubview_, location[0]);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v5, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UINavigationBarAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility willRemoveSubview:](&v3, sel_willRemoveSubview_, location[0]);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v5, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UINavigationBarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility insertSubview:belowSubview:](&v5, sel_insertSubview_belowSubview_, location[0], v6);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v8, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UINavigationBarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility insertSubview:aboveSubview:](&v5, sel_insertSubview_aboveSubview_, location[0], v6);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v8, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UINavigationBarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility insertSubview:atIndex:](&v5, sel_insertSubview_atIndex_, location[0], a4);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v8, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (void)_accessibility_navigationBarContentsDidChange
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  id v9;
  NSArray *obj;
  uint64_t v11;
  _QWORD __b[9];
  objc_super v13;
  SEL v14;
  UINavigationBarAccessibility *v15;
  id location;
  dispatch_once_t *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAccessibility;
  -[UINavigationBarAccessibility _accessibility_navigationBarContentsDidChange](&v13, sel__accessibility_navigationBarContentsDidChange);
  v9 = (id)-[UINavigationBarAccessibility _accessibility_contentsOfNavigationBar](v15, "_accessibility_contentsOfNavigationBar");
  v8 = (id)objc_msgSend(v9, "promptView");
  v7 = (id)-[UINavigationBarAccessibility accessibilityLanguage](v15, "accessibilityLanguage");
  objc_msgSend(v8, "setAccessibilityLanguage:");

  memset(__b, 0, 0x40uLL);
  obj = -[UINavigationBarAccessibility _accessibilityNavBarElements](v15, "_accessibilityNavBarElements");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v11)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v11;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      __b[8] = *(_QWORD *)(__b[1] + 8 * v5);
      objc_opt_class();
      v2 = (id)__UIAccessibilityCastAsSafeCategory();
      objc_msgSend(v2, "_accessibilitySetNavigationViewInfo:", 0);

      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v6)
          break;
      }
    }
  }

  -[UINavigationBarAccessibility _accessibilitySetNavBarElements:](v15, "_accessibilitySetNavBarElements:", 0);
  -[UINavigationBarAccessibility _accessibilityRemoveValueForKey:](v15, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  v17 = (dispatch_once_t *)&_accessibility_navigationBarContentsDidChange_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_311);
  if (*v17 != -1)
    dispatch_once(v17, location);
  objc_storeStrong(&location, 0);
  objc_msgSend((id)_accessibility_navigationBarContentsDidChange_coalescer, "performCoalescedAsynchronously");
}

void __77__UINavigationBarAccessibility__accessibility_navigationBarContentsDidChange__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = (id)objc_msgSend(MEMORY[0x24BE00588], "mainQueueCoalescerWithBlock:", &__block_literal_global_313, a1, a1);
  v2 = (void *)_accessibility_navigationBarContentsDidChange_coalescer;
  _accessibility_navigationBarContentsDidChange_coalescer = (uint64_t)v1;

}

void __77__UINavigationBarAccessibility__accessibility_navigationBarContentsDidChange__block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessibilityNavigationViewInfo, 0);
}

Method __98__UINavigationBarAccessibility_UIViewAccessibilityAdditions___accessibilitySupportsActivateAction__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel_accessibilityActivate);
  __accessibilitySupportsActivateAction_categoryMethod = (uint64_t)result;
  return result;
}

@end
