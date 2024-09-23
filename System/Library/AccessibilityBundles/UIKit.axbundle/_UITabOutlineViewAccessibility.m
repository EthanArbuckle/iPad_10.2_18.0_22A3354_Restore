@implementation _UITabOutlineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITabOutlineView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStartingCellLabel
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityStartingCellLabel);
}

- (void)_accessibilitySetStartingCellLabel:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastIndexPath
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityLastIndexPath);
}

- (void)_accessibilitySetLastIndexPath:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastMessage
{
  return objc_getAssociatedObject(self, &___UITabOutlineViewAccessibility___accessibilityLastMessage);
}

- (void)_accessibilitySetLastMessage:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITabContainerView"), CFSTR("sidebar"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITabBarControllerSidebar"), CFSTR("_isVisible"), "B", 0);
  v3 = CFSTR("_UITabOutlineView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3, CFSTR("UICollectionViewDelegate"));
  objc_storeStrong(v5, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UITabOutlineViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UITabOutlineViewAccessibility;
  -[_UITabOutlineViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UITabOutlineViewAccessibility _accessibilitySetupTabButton](v4);
}

- (void)_accessibilitySetupTabButton
{
  id v1;
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  id (*v6)(id *);
  void *v7;
  id v8[3];
  id from;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;

  v14 = a1;
  if (a1)
  {
    v12 = 0;
    objc_opt_class();
    v2 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("_navigationItem"));
    v11 = (id)__UIAccessibilityCastAsClass();

    v10 = v11;
    objc_storeStrong(&v11, 0);
    v13 = v10;
    objc_initWeak(&from, v14);
    v1 = (id)objc_msgSend(v13, "leftBarButtonItem");
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __62___UITabOutlineViewAccessibility__accessibilitySetupTabButton__block_invoke;
    v7 = &unk_24FF3DC00;
    objc_copyWeak(v8, &from);
    objc_msgSend(v1, "_setAccessibilityLabelBlock:", &v3);

    objc_destroyWeak(v8);
    objc_destroyWeak(&from);
    objc_storeStrong(&v13, 0);
  }
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  _UITabOutlineViewAccessibility *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  _UITabOutlineViewAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v12.receiver = v17;
  v12.super_class = (Class)_UITabOutlineViewAccessibility;
  v13 = -[_UITabOutlineViewAccessibility collectionView:itemsForBeginningDragSession:atIndexPath:](&v12, sel_collectionView_itemsForBeginningDragSession_atIndexPath_, location[0], v15, v14);
  v11 = (id)objc_msgSend(location[0], "cellForItemAtIndexPath:", v14);
  v8 = v17;
  v9 = (id)objc_msgSend(v11, "accessibilityLabel");
  -[_UITabOutlineViewAccessibility _accessibilitySetStartingCellLabel:](v8, "_accessibilitySetStartingCellLabel:");

  -[_UITabOutlineViewAccessibility _accessibilitySetLastIndexPath:](v17, "_accessibilitySetLastIndexPath:", v14);
  v10 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v24;
  int v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  char v32;
  id v33;
  id v34;
  objc_super v35;
  id v36;
  id v37;
  id v38;
  id location[2];
  _UITabOutlineViewAccessibility *v40;

  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v35.receiver = v40;
  v35.super_class = (Class)_UITabOutlineViewAccessibility;
  v36 = -[_UITabOutlineViewAccessibility collectionView:dropSessionDidUpdate:withDestinationIndexPath:](&v35, sel_collectionView_dropSessionDidUpdate_withDestinationIndexPath_, location[0], v38, v37);
  v34 = (id)objc_msgSend(location[0], "cellForItemAtIndexPath:", v37);
  v24 = (id)objc_msgSend(v34, "accessibilityLabel");
  v32 = 0;
  v30 = 0;
  LOBYTE(v25) = 0;
  if (v24)
  {
    v33 = (id)objc_msgSend(v34, "accessibilityLabel");
    v32 = 1;
    v31 = -[_UITabOutlineViewAccessibility _accessibilityStartingCellLabel](v40, "_accessibilityStartingCellLabel");
    v30 = 1;
    v25 = objc_msgSend(v33, "isEqualToString:") ^ 1;
  }
  if ((v30 & 1) != 0)

  if ((v32 & 1) != 0)
  if ((v25 & 1) != 0)
  {
    v17 = -[_UITabOutlineViewAccessibility _accessibilityLastIndexPath](v40, "_accessibilityLastIndexPath");
    v18 = objc_msgSend(v17, "row");

    v29 = v18;
    v28 = objc_msgSend(v37, "row");
    v27 = -[_UITabOutlineViewAccessibility _accessibilityLastMessage](v40, "_accessibilityLastMessage");
    v19 = (void *)MEMORY[0x24BDD17C8];
    v21 = accessibilityLocalizedString(CFSTR("row.reorder.above"));
    v20 = (id)objc_msgSend(v34, "accessibilityLabel");
    v26 = (id)objc_msgSend(v19, "stringWithFormat:", v21, v20);

    if (v18 >= v28)
    {
      if (v29 == v28 && (objc_msgSend(v27, "isEqualToString:", v26) & 1) != 0)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        v13 = accessibilityLocalizedString(CFSTR("row.reorder.below"));
        v12 = (id)objc_msgSend(v34, "accessibilityLabel");
        v7 = (id)objc_msgSend(v11, "stringWithFormat:", v13, v12);
        v8 = v26;
        v26 = v7;

      }
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v16 = accessibilityLocalizedString(CFSTR("row.reorder.below"));
      v15 = (id)objc_msgSend(v34, "accessibilityLabel");
      v5 = (id)objc_msgSend(v14, "stringWithFormat:", v16, v15);
      v6 = v26;
      v26 = v5;

    }
    -[_UITabOutlineViewAccessibility _accessibilitySetLastIndexPath:](v40, "_accessibilitySetLastIndexPath:", v37);
    -[_UITabOutlineViewAccessibility _accessibilitySetLastMessage:](v40, "_accessibilitySetLastMessage:", v26);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v26);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  v10 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  return v10;
}

@end
