@implementation _UIContextMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
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
  v3 = CFSTR("_UIContextMenuView");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("currentListView"), v4, 0);
  v8 = "Q";
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("displayMenu:updateType:alongsideAnimations:"), v4, "Q", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIContextMenuUIController"), CFSTR("platterPanController"), v4, 0);
  v7 = CFSTR("_UIContextMenuPanController");
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("moveToDetentPosition:updateScrubPath:"), v6, "q", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v7, CFSTR("_currentDetentIndex"), v8);
  objc_storeStrong(v10, v9);
}

- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5
{
  _UIContextMenuViewAccessibility *v7;
  id v8;
  unint64_t v9;
  objc_super v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  id location[2];
  _UIContextMenuViewAccessibility *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&v18, v22);
  v7 = v22;
  v8 = location[0];
  v9 = v20;
  v11 = MEMORY[0x24BDAC760];
  v12 = -1073741824;
  v13 = 0;
  v14 = __78___UIContextMenuViewAccessibility_displayMenu_updateType_alongsideAnimations___block_invoke;
  v15 = &unk_24FF3DCD8;
  v16 = v19;
  objc_copyWeak(&v17, &v18);
  v10.receiver = v7;
  v10.super_class = (Class)_UIContextMenuViewAccessibility;
  -[_UIContextMenuViewAccessibility displayMenu:updateType:alongsideAnimations:](&v10, sel_displayMenu_updateType_alongsideAnimations_, v8, v9, &v11);
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityElements
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = (id)-[_UIContextMenuViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentListView"));
  v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (BOOL)accessibilityScrollToVisible
{
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8[3];
  BOOL v9;

  v8[2] = self;
  v8[1] = (id)a2;
  v4 = (id)-[_UIContextMenuViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v8[0] = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("platterPanController"));

  if ((objc_msgSend(v8[0], "safeBoolForKey:", CFSTR("enabled")) & 1) != 0)
  {
    v6 = objc_msgSend(v8[0], "safeIntegerForKey:");
    v5 = v8[0];
    AXPerformSafeBlock();
    v2 = objc_msgSend(v8[0], "safeIntegerForKey:", CFSTR("_currentDetentIndex"));
    v9 = v2 != v6;
    v7 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v9 = 0;
    v7 = 1;
  }
  objc_storeStrong(v8, 0);
  return v9;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  CGPoint point;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  objc_super v13;
  BOOL v14;
  id location[2];
  _UIContextMenuViewAccessibility *v16;
  CGPoint v17;
  BOOL v18;
  CGRect v19;

  v17 = a3;
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)_UIContextMenuViewAccessibility;
  v14 = -[_UIContextMenuViewAccessibility _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](&v13, sel__accessibilityAllowOutOfBoundsHitTestAtPoint_withEvent_, location[0], v17);
  if (v14)
  {
    v18 = v14;
  }
  else
  {
    v12 = (id)-[_UIContextMenuViewAccessibility safeUIViewForKey:](v16, "safeUIViewForKey:", CFSTR("currentListView"));
    v10 = 0;
    objc_opt_class();
    v9 = (id)__UIAccessibilityCastAsClass();
    v8 = v9;
    objc_storeStrong(&v9, 0);
    v11 = v8;
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;
    objc_msgSend(v12, "accessibilityFrame");
    v18 = CGRectContainsPoint(v19, point);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
  return v18;
}

@end
