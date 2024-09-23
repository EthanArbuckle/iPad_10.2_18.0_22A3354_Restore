@implementation _UIContextMenuContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuContainerView");
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
  const char *v6;
  const __CFString *v7;
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
  v3 = CFSTR("_UIContextMenuContainerView");
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = CFSTR("_UIContextMenuPanController");
  objc_msgSend(location[0], "validateClass:");
  v7 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  v4 = CFSTR("UIGestureRecognizer");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIPanGestureRecognizer"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_targets"), "NSMutableArray");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("detents"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_currentDetentIndex"), "Q");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_updateViewPositionsWithTranslation:location:ended:withVelocity:"), v8, "{CAPoint3D=ddd}", "{CAPoint3D=ddd}", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("didUpdateFocusInContext: withAnimationCoordinator:"), v8, v6, v6, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)_axPanController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  int v14;
  id v15;
  _QWORD v16[8];
  id v17;
  id v18;
  _QWORD __b[8];
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25[2];
  id v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25[1] = a1;
  if (a1)
  {
    v25[0] = 0;
    v23 = 0;
    objc_opt_class();
    v22 = (id)__UIAccessibilityCastAsClass();
    v21 = v22;
    objc_storeStrong(&v22, 0);
    v24 = v21;
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v21, "gestureRecognizers");
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
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
        v20 = *(id *)(__b[1] + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = (id)objc_msgSend(v20, "safeArrayForKey:", CFSTR("_targets"));
          memset(v16, 0, sizeof(v16));
          v6 = v18;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v16, v27, 16);
          if (v7)
          {
            v3 = *(_QWORD *)v16[2];
            v4 = 0;
            v5 = v7;
            while (1)
            {
              v2 = v4;
              if (*(_QWORD *)v16[2] != v3)
                objc_enumerationMutation(v6);
              v17 = *(id *)(v16[1] + 8 * v4);
              v15 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("_target"));
              NSClassFromString(CFSTR("_UIContextMenuPanController"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_storeStrong(v25, v15);
                v14 = 4;
              }
              else
              {
                v14 = 0;
              }
              objc_storeStrong(&v15, 0);
              if (v14)
                break;
              ++v4;
              if (v2 + 1 >= v5)
              {
                v4 = 0;
                v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v16, v27, 16);
                if (!v5)
                  break;
              }
            }
          }

          objc_storeStrong(&v18, 0);
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v11)
            break;
        }
      }
    }

    v26 = v25[0];
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (id)_axDetentsForPanController:(uint64_t)a1
{
  id location;
  uint64_t v4;
  id v5;

  v4 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v4)
    v5 = (id)objc_msgSend(location, "safeArrayForKey:", CFSTR("detents"));
  else
    v5 = 0;
  objc_storeStrong(&location, 0);
  return v5;
}

- (uint64_t)_axCurrentDetentIndexForPanController:(uint64_t)a1
{
  id location;
  uint64_t v4;
  uint64_t v5;

  v4 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v4)
    v5 = objc_msgSend(location, "safeUnsignedIntegerForKey:", CFSTR("_currentDetentIndex"));
  else
    v5 = 0;
  objc_storeStrong(&location, 0);
  return v5;
}

- (double)_axTranslationForDetentIndex:(void *)a3 currentDetentIndex:(id)obj detents:
{
  double v4;
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  char v10;
  int v11;
  id location[2];
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;

  v14 = a1;
  v13 = a2;
  location[1] = a3;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v15 = 0.0;
  v16 = 0;
  if (v14)
  {
    v10 = 0;
    objc_opt_class();
    v7 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", v13);
    v9 = (id)__UIAccessibilityCastAsClass();

    v8 = v9;
    objc_storeStrong(&v9, 0);
    objc_msgSend(v8, "CGPointValue");
    v15 = v4;
    v16 = v5;

  }
  v11 = 1;
  objc_storeStrong(location, 0);
  return v15;
}

- (void)_axApplyTranslation:(id)obj forDetentIndex:(double)a4 panController:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD *v22;
  int v23;
  id location;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;

  *(double *)&v27 = a4;
  *((double *)&v27 + 1) = a5;
  v26 = a1;
  v25 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v26)
  {
    v22 = (_QWORD *)objc_msgSend(location, "safeIvarForKey:", CFSTR("_currentDetentIndex"));
    if (v22)
      *v22 = v25;
    v21 = 0uLL;
    v16 = 0;
    objc_opt_class();
    v15 = (id)__UIAccessibilityCastAsClass();
    v14 = v15;
    objc_storeStrong(&v15, 0);
    objc_msgSend(v14, "bounds");
    v17 = v5;
    v18 = v6;
    v19 = v7;
    v20 = v8;
    AX_CGRectGetCenter();
    *(_QWORD *)&v21 = v9;
    *((_QWORD *)&v21 + 1) = v10;

    v11 = location;
    v12 = v27;
    v13 = v21;
    AXPerformSafeBlock();
    objc_storeStrong(&v11, 0);
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  char v9;
  double v10;
  double v11;
  unint64_t i;
  void *v13;
  id v14;
  id v15;
  CGRect v16;
  CGRect v17;
  char v18;
  id location[2];
  _UIContextMenuContainerViewAccessibility *v20;
  CGRect v21;
  CGRect v22;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_msgSend(location[0], "accessibilityFrame");
  v17.origin.x = v3;
  v17.origin.y = v4;
  v17.size.width = v5;
  v17.size.height = v6;
  -[_UIContextMenuContainerViewAccessibility accessibilityFrame](v20, "accessibilityFrame");
  v16 = v21;
  if (!CGRectContainsRect(v21, v17))
  {
    v15 = -[_UIContextMenuContainerViewAccessibility _axPanController](v20);
    v14 = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v20, v15);
    v13 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v20, v15);
    for (i = (unint64_t)v13; i < objc_msgSend(v14, "count"); ++i)
    {
      v10 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v20, i, v13, v14);
      v11 = v7;
      v22.origin.x = v17.origin.x + v10;
      v22.origin.y = v17.origin.y + v7;
      v22.size = v17.size;
      if (CGRectContainsRect(v16, v22))
      {
        -[_UIContextMenuContainerViewAccessibility _axApplyTranslation:forDetentIndex:panController:]((uint64_t)v20, i, v15, v10, v11);
        v18 = 1;
      }
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  v9 = v18;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  unint64_t v3;
  BOOL v4;
  id v5;
  id v6[2];
  _UIContextMenuContainerViewAccessibility *v7;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  v5 = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v7, v6[0]);
  v3 = -[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v7, v6[0]);
  v4 = v3 < objc_msgSend(v5, "count") - 1;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

- (BOOL)accessibilityScrollUpPage
{
  double v2;
  char v4;
  UIAccessibilityNotifications notification;
  id v6;
  double v7;
  void *v8;
  id location;
  id v10;
  char v11;
  SEL v12;
  _UIContextMenuContainerViewAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10 = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v13, v10);
  v8 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v13, v10);
  if ((unint64_t)v8 < objc_msgSend(location, "count") - 1)
  {
    v7 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v13, (uint64_t)v8 + 1, v8, location);
    -[_UIContextMenuContainerViewAccessibility _axApplyTranslation:forDetentIndex:panController:]((uint64_t)v13, (uint64_t)v8 + 1, v10, v7, v2);
    notification = *MEMORY[0x24BDF72E0];
    v6 = accessibilityLocalizedString(CFSTR("context.menu.scrolled.up"));
    UIAccessibilityPostNotification(notification, v6);

    v11 = 1;
  }
  v4 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v4 & 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  BOOL v3;
  unint64_t v4;
  id location;
  id v6[2];
  _UIContextMenuContainerViewAccessibility *v7;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v7, v6[0]);
  v4 = -[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v7, v6[0]);
  v3 = 0;
  if (v4)
    v3 = v4 < objc_msgSend(location, "count");
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (BOOL)accessibilityScrollDownPage
{
  double v2;
  char v4;
  UIAccessibilityNotifications notification;
  id v6;
  double v7;
  void *v8;
  id location;
  id v10;
  char v11;
  SEL v12;
  _UIContextMenuContainerViewAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10 = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v13, v10);
  v8 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v13, v10);
  if (v8 && (unint64_t)v8 < objc_msgSend(location, "count"))
  {
    v7 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v13, (uint64_t)v8 - 1, v8, location);
    -[_UIContextMenuContainerViewAccessibility _axApplyTranslation:forDetentIndex:panController:]((uint64_t)v13, (uint64_t)v8 - 1, v10, v7, v2);
    notification = *MEMORY[0x24BDF72E0];
    v6 = accessibilityLocalizedString(CFSTR("context.menu.scrolled.down"));
    UIAccessibilityPostNotification(notification, v6);

    v11 = 1;
  }
  v4 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v4 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v4;
  id v5;
  BOOL v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  _UIContextMenuContainerViewAccessibility *v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  char v21;
  objc_super v22;
  id v23;
  id location[2];
  _UIContextMenuContainerViewAccessibility *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22.receiver = v25;
  v22.super_class = (Class)_UIContextMenuContainerViewAccessibility;
  -[_UIContextMenuContainerViewAccessibility didUpdateFocusInContext:withAnimationCoordinator:](&v22, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v23);
  v17 = 0;
  v15 = 0;
  v7 = 0;
  if ((-[_UIContextMenuContainerViewAccessibility _accessibilityIsFKARunningForFocusItem](v25, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v21 = 0;
    objc_opt_class();
    v5 = (id)objc_msgSend(location[0], "nextFocusedItem");
    v20 = (id)__UIAccessibilityCastAsClass();

    v19 = v20;
    objc_storeStrong(&v20, 0);
    v18 = v19;
    v17 = 1;
    v16 = (id)objc_msgSend(v19, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v15 = 1;
    v7 = v16 != 0;
  }
  if ((v15 & 1) != 0)

  if ((v17 & 1) != 0)
  if (v7)
  {
    v4 = v23;
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __93___UIContextMenuContainerViewAccessibility_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v12 = &unk_24FF40100;
    v13 = v25;
    v14 = location[0];
    objc_msgSend(v4, "addCoordinatedFocusingAnimations:completion:", &v8);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end
