@implementation UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSpeakItemReorderEvents
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UICollectionViewAccessibility___axSpeakItemReorderEvents);
  else
    return 0;
}

- (void)_axSetSpeakItemReorderEvents:(uint64_t)a1
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

- (uint64_t)_axIsReorderingItems
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetIsReorderingItems:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const char *v11;
  const __CFString *v12;
  const char *v13;
  const char *v14;
  const __CFString *v15;
  const char *v16;
  id v17;
  id *v18;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v18 = location;
  v17 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UICollectionViewListSwipeActionsView"));
  objc_msgSend(location[0], "validateClass:", CFSTR("UIIndexBarAccessoryView"));
  v14 = "@";
  v12 = CFSTR("UICollectionView");
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@", 0);
  v4 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_ensureViewsAreLoadedInRect:"), v7, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  v3 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_dequeueReusableViewOfKind: withIdentifier: forIndexPath: viewCategory:"), v14, v14, v14, "Q", 0);
  v16 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_createPreparedCellForItemAtIndexPath: withLayoutAttributes: applyAttributes:"), v14, v14, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_updateVisibleCellsNow:"), v3, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_visibleBounds"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_reuseCell:notifyDidEndDisplaying:"), v14, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_reuseSupplementaryView:"), v16, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_moveItemAtIndexPath:toIndexPath:"), v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v12, CFSTR("_subviewManager"), "_UICollectionViewSubviewManager");
  v13 = "NSMutableDictionary";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UICollectionViewSubviewManager"), CFSTR("_reuseQueues"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("reloadItemsAtIndexPaths:"), v7, v14, 0);
  v15 = CFSTR("UICollectionReusableView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("collectionViewLayout"), v14, 0);
  v5 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewFlowLayout"), CFSTR("scrollDirection"), 0);
  v8 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  objc_msgSend(location[0], "validateClass:", CFSTR("UISwipeActionPullView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("isFocused"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_isFocusedOrAncestorOfFocusedView"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("preferredFocusedView"), v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("canBecomeFocused"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("beginInteractiveMovementForItemAtIndexPath:"), v16, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_fulfillPromisedFocusRegionForCell:"), v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("endInteractiveMovement"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("cancelInteractiveMovement"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_globalIndexPathForItemAtIndexPath:"), v5, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_indexPathForGlobalIndex:"), v14, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_indexPathBeforeShadowUpdatesForIndexPath:"), v14, 0);
  v6 = CFSTR("UIResponder");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("canResignFirstResponder"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("becomeFirstResponder"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("pressesBegan:withEvent:"), v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("pressesEnded:withEvent:"), v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("pressesCancelled:withEvent:"), v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("_shouldSelectionFollowFocusForIndexPath:initiatedBySelection:"), v14, v16, 0);
  v10 = CFSTR("UIScrollView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  v9 = CFSTR("UILayoutContainerView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISplitViewControllerPanelImplView"), v9);
  v11 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v10, CFSTR("_verticalScrollIndicator"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v10, CFSTR("_horizontalScrollIndicator"), v11);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v12, CFSTR("_supplementaryViewClassDict"), v13);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_isStyledAsHeaderOrFooterFromLayoutAttributes:"), v16, v14, 0);
  objc_storeStrong(v18, v17);
}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = -[UICollectionViewAccessibility _axSpeakItemReorderEvents](self);
  v5 = v2 != 0;

  if (!v5)
    return -[UICollectionViewAccessibility _axIsReorderingItems]((uint64_t)self) & 1;
  v4 = -[UICollectionViewAccessibility _axSpeakItemReorderEvents](self);
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (void)setAccessibilityShouldSpeakItemReorderEvents:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[UICollectionViewAccessibility _axSetSpeakItemReorderEvents:]((uint64_t)self, v4);

}

- (unint64_t)_accessibilityAutomationType
{
  return 32;
}

- (id)accessibilityComparatorForSorting
{
  return (id)-[UICollectionViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityComparatorForSorting"), a2, self);
}

- (void)setAccessibilityComparatorForSorting:(id)a3
{
  UICollectionViewAccessibility *v3;
  id v4;
  id location[2];
  UICollectionViewAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = (id)MEMORY[0x2348C3D88](location[0]);
  -[UICollectionViewAccessibility _accessibilitySetRetainedValue:forKey:](v3, "_accessibilitySetRetainedValue:forKey:");

  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UICollectionViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("shouldBypassCollectionViewAX"));
  if (location[0])
    v4 = objc_msgSend(location[0], "BOOLValue") & 1;
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)setAccessibilityShouldBypassCollectionViewAccessibility:(BOOL)a3
{
  -[UICollectionViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("shouldBypassCollectionViewAX"));
}

- (BOOL)_accessibilityShouldUseCollectionViewCellAccessibilityElements
{
  int v3;

  if ((-[UICollectionViewAccessibility _accessibilityFauxCollectionViewCellsDisabled](self, "_accessibilityFauxCollectionViewCellsDisabled") & 1) != 0)return 0;
  if (AXDoesRequestingClientDeserveAutomation()
    && !_AXSAutomationFauxCollectionViewCellsEnabled())
  {
    return 0;
  }
  if ((UIAccessibilityIsAppExtension() & 1) != 0)
    return 0;
  LOBYTE(v3) = 0;
  if (AXDoesRequestingClientDeserveAutomation())
    v3 = !-[UICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](self, "accessibilityCollectionViewBehavesLikeUIViewAccessibility");
  return v3 & 1;
}

- (unint64_t)accessibilitySemanticGroupChildrentCount
{
  unint64_t i;
  unint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  char v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  v5 = objc_msgSend(v6, "numberOfSections");
  v4 = 0;
  for (i = 0; i < v5; ++i)
    v4 += objc_msgSend(v9[0], "numberOfItemsInSection:", i);
  objc_storeStrong(v9, 0);
  return v4;
}

- (id)axData
{
  id v3;
  id v4[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UICollectionViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCollectionViewData"));
  if (!v4[0])
  {
    v4[0] = objc_alloc_init(AXCollectionViewData);

    -[UICollectionViewAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:", v4[0], CFSTR("AXCollectionViewData"));
    -[UICollectionViewAccessibility _accessibilityInitializeInternalData:](v5, v4[0]);
  }
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (void)_accessibilityInitializeInternalData:(void *)a1
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  id v5;
  int v6;
  id location;
  id v8;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    v5 = v8;
    v4 = objc_msgSend(v5, "numberOfSections");
    v3 = 0;
    for (i = 0; i < v4; ++i)
      v3 += objc_msgSend(v5, "numberOfItemsInSection:", i);
    -[AXCollectionViewData setChildCount:]((uint64_t)location, v3);
    objc_storeStrong(&v5, 0);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_axResetData
{
  if (a1)
  {
    objc_msgSend(a1, "_accessibilityRemoveValueForKey:", CFSTR("AXCollectionViewData"));
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)reloadData
{
  objc_super v2;
  SEL v3;
  UICollectionViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility reloadData](&v2, sel_reloadData);
  -[UICollectionViewAccessibility _axResetData](v4);
}

- (void)insertSections:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility insertSections:](&v3, sel_insertSections_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)deleteSections:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility deleteSections:](&v3, sel_deleteSections_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)reloadSections:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility reloadSections:](&v3, sel_reloadSections_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  objc_super v4;
  int64_t v5;
  int64_t v6;
  SEL v7;
  UICollectionViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility moveSection:toSection:](&v4, sel_moveSection_toSection_, a3, a4);
  -[UICollectionViewAccessibility _axResetData](v8);
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility insertItemsAtIndexPaths:](&v3, sel_insertItemsAtIndexPaths_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility reloadItemsAtIndexPaths:](&v3, sel_reloadItemsAtIndexPaths_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility deleteItemsAtIndexPaths:](&v3, sel_deleteItemsAtIndexPaths_, location[0]);
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  objc_super v4;
  id v5;
  SEL v6;
  UICollectionViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v4.receiver = v7;
  v4.super_class = (Class)UICollectionViewAccessibility;
  return -[UICollectionViewAccessibility beginInteractiveMovementForItemAtIndexPath:](&v4, sel_beginInteractiveMovementForItemAtIndexPath_, v5);
}

- (void)endInteractiveMovement
{
  objc_super v2;
  SEL v3;
  UICollectionViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility endInteractiveMovement](&v2, sel_endInteractiveMovement);
}

- (void)cancelInteractiveMovement
{
  objc_super v2;
  SEL v3;
  UICollectionViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility cancelInteractiveMovement](&v2, sel_cancelInteractiveMovement);
}

- (void)_accessibilityPostReorderingAnnouncementForCurrentIndexPath:(id)a3 targetIndexPath:(id)a4 previousIndexPath:(id)a5
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id location[2];
  UICollectionViewAccessibility *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v12 = objc_msgSend(v22, "item");
  v20 = v12 < objc_msgSend(v21, "item");
  v13 = objc_msgSend(v22, "section");
  if (v13 > objc_msgSend(v21, "section"))
  {
    v19 = v24;
    v9 = objc_msgSend(v19, "numberOfItemsInSection:", objc_msgSend(v22, "section"));
    v20 = v9 != objc_msgSend(v22, "item");
    objc_storeStrong(&v19, 0);
  }
  v18 = (id)-[UICollectionViewAccessibility cellForItemAtIndexPath:](v24, "cellForItemAtIndexPath:", location[0]);
  v8 = (id)objc_msgSend(v18, "_accessibilityBriefLabel");
  v15 = 0;
  if (v8)
  {
    v5 = v8;
  }
  else
  {
    v16 = (id)objc_msgSend(v18, "accessibilityLabel");
    v15 = 1;
    v5 = v16;
  }
  v17 = v5;
  if ((v15 & 1) != 0)

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE28]);
  if (v18 && v17)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (id)accessibilityUIKitLocalizedString();
    v14 = (id)objc_msgSend(v6, "stringWithFormat:", v17);

    UIAccessibilitySpeak();
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_axHandleReusedView:(void *)a1
{
  id *v2;
  id v3;
  int v4;
  id location;
  id v6;

  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    v3 = (id)objc_msgSend(v6, "_accessibilityOpaqueElementParent");
    if (!v3 && (objc_msgSend(v6, "isAccessibilityOpaqueElementProvider") & 1) != 0)
      objc_storeStrong(&v3, v6);
    objc_msgSend(v3, "_accessibilityDidReuseOpaqueElementView:", location, &v3);
    objc_storeStrong(v2, 0);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_reuseCell:(id)a3 notifyDidEndDisplaying:(BOOL)a4
{
  char v6;
  objc_super v7;
  char v8;
  BOOL v9;
  id location[2];
  UICollectionViewAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UICollectionViewAccessibility;
  v8 = -[UICollectionViewAccessibility _reuseCell:notifyDidEndDisplaying:](&v7, sel__reuseCell_notifyDidEndDisplaying_, location[0], a4);
  -[UICollectionViewAccessibility _axHandleReusedView:](v11, location[0]);
  v6 = v8;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)_reuseSupplementaryView:(id)a3
{
  char v4;
  objc_super v5;
  char v6;
  id location[2];
  UICollectionViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewAccessibility;
  v6 = -[UICollectionViewAccessibility _reuseSupplementaryView:](&v5, sel__reuseSupplementaryView_, location[0]);
  -[UICollectionViewAccessibility _axHandleReusedView:](v8, location[0]);
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleCells
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id location;
  _QWORD __b[8];
  uint64_t v12;
  id v13;
  id v14[2];
  UICollectionViewAccessibility *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathsForVisibleItems"));
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = v14[0];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v6);
      location = -[UICollectionViewAccessibility accessibilityCollectionCellElementForIndexPath:](v15, "accessibilityCollectionCellElementForIndexPath:", v12);
      if (location)
        objc_msgSend(v13, "addObject:", location);
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v3;
}

- (void)_accessibilityCollectionViewUpdateVisibleCells
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(id *);
  void *v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __79__UICollectionViewAccessibility__accessibilityCollectionViewUpdateVisibleCells__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __79__UICollectionViewAccessibility__accessibilityCollectionViewUpdateVisibleCells__block_invoke(id *a1)
{
  id v1[3];

  v1[2] = a1;
  v1[1] = a1;
  v1[0] = a1[4];
  objc_msgSend(v1[0], "_updateVisibleCellsNow:", 1);
  objc_storeStrong(v1, 0);
}

- (id)accessibilityCreatePrepareCellForIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7[3];
  uint64_t v8;
  uint64_t *v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  id v15;
  int v16;
  id v17;
  os_log_type_t v18;
  id v19[4];
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25[2];
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  id location[2];
  UICollectionViewAccessibility *v35;
  id v36;
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = v35;
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  v32 = 0;
  v19[3] = (id)MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke;
  v23 = &unk_24FF3DAB0;
  v25[1] = &v26;
  v24 = v33;
  v25[0] = location[0];
  AXPerformSafeBlock();
  if (v27[5])
  {
    v8 = 0;
    v9 = &v8;
    v10 = 838860800;
    v11 = 48;
    v12 = __Block_byref_object_copy__6;
    v13 = __Block_byref_object_dispose__6;
    v14 = 0;
    v7[1] = &v8;
    v6 = v33;
    v7[0] = location[0];
    v7[2] = &v26;
    AXPerformSafeBlock();
    v5 = (id)v9[5];
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
    _Block_object_dispose(&v8, 8);
    objc_storeStrong(&v14, 0);
    v15 = v5;
    -[UICollectionViewAccessibility _accessibilityCollectionViewUpdateVisibleCells](v35, "_accessibilityCollectionViewUpdateVisibleCells");
    v36 = v15;
    v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v19[0] = (id)AXLogUIA();
    v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_ERROR))
    {
      v4 = (id)objc_msgSend(v33, "safeValueForKey:", CFSTR("_layout"));
      v17 = v4;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v17, (uint64_t)location[0]);
      _os_log_error_impl(&dword_230C4A000, (os_log_t)v19[0], v18, "No layout attributes for %@ at %@", v37, 0x16u);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(v19, 0);
    v36 = 0;
    v16 = 1;
  }
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_layout"));
  v1 = (id)objc_msgSend(v5, "initialLayoutAttributesForAppearingItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke_360(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_createPreparedCellForItemAtIndexPath:withLayoutAttributes:applyAttributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  double v2;
  double v3;
  id location[2];
  UICollectionViewAccessibility *v6;
  char v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UICollectionViewAccessibility accessibilityUserDefinedOpaqueElementScrollsContentIntoView](self, "accessibilityUserDefinedOpaqueElementScrollsContentIntoView");
  if (location[0])
  {
    v7 = objc_msgSend(location[0], "BOOLValue") & 1;
  }
  else
  {
    -[UICollectionViewAccessibility _accessibilityContentSize](v6, "_accessibilityContentSize");
    if (AX_CGSizeIsProbablyEmpty(v2, v3))
    {
      v7 = 0;
    }
    else
    {
      -[UICollectionViewAccessibility bounds](v6, "bounds");
      v7 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (uint64_t)_accessibilityShouldDisableCellReuse
{
  char v2;

  if (a1)
    v2 = objc_msgSend(a1, "_accessibilityShouldUseCollectionViewCellAccessibilityElements") & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (id)_dequeueReusableViewOfKind:(id)a3 withIdentifier:(id)a4 forIndexPath:(id)a5 viewCategory:(unint64_t)a6
{
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  objc_super v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  id v30;
  id v31;
  id location[2];
  UICollectionViewAccessibility *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = a6;
  if ((-[UICollectionViewAccessibility _accessibilityShouldDisableCellReuse](v33) & 1) != 0)
  {
    v17 = (id)-[UICollectionViewAccessibility safeValueForKey:](v33, "safeValueForKey:", CFSTR("_subviewManager"));
    v28 = (id)objc_msgSend(v17, "safeDictionaryForKey:", CFSTR("_reuseQueues"));

    v27 = (id)objc_msgSend(v28, "objectForKeyedSubscript:", location[0]);
    v26 = 0;
    if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("UICollectionElementKindCell")) & 1) != 0)
    {
      objc_storeStrong(&v26, v31);
    }
    else
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), location[0], v31);
      v7 = v26;
      v26 = v6;

    }
    v25 = (id)objc_msgSend(v27, "objectForKey:", v26);
    memset(__b, 0, sizeof(__b));
    v15 = v25;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
    if (v16)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v16;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(v15);
        v24 = *(id *)(__b[1] + 8 * v13);
        objc_msgSend(v24, "removeFromSuperview");
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
          if (!v14)
            break;
        }
      }
    }

    objc_msgSend(v27, "removeAllObjects");
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  v21.receiver = v33;
  v21.super_class = (Class)UICollectionViewAccessibility;
  v22 = -[UICollectionViewAccessibility _dequeueReusableViewOfKind:withIdentifier:forIndexPath:viewCategory:](&v21, sel__dequeueReusableViewOfKind_withIdentifier_forIndexPath_viewCategory_, location[0], v31, v30, v29);
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BDF7630]) & 1) != 0)
  {
    v8 = objc_msgSend(v22, "accessibilityTraits");
    objc_msgSend(v22, "setAccessibilityTraits:", v8 | *MEMORY[0x24BDF73C0]);
  }
  v10 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)accessibilityCellForRowAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  int v8;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  id location[2];
  UICollectionViewAccessibility *v14;
  id v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = v14;
  v11 = objc_msgSend(v12, "numberOfSections");
  v9 = 0;
  v6 = 1;
  if (location[0])
  {
    v6 = 1;
    if (objc_msgSend(location[0], "section") < v11)
    {
      v5 = objc_msgSend(location[0], "item");
      v6 = 1;
      if (v5 < objc_msgSend(v12, "numberOfItemsInSection:", objc_msgSend(location[0], "section")))
      {
        v4 = objc_msgSend(location[0], "item");
        v10 = (id)objc_msgSend(v12, "dataSource");
        v9 = 1;
        v6 = v4 >= objc_msgSend(v10, "collectionView:numberOfItemsInSection:", v12, objc_msgSend(location[0], "section"));
      }
    }
  }
  if ((v9 & 1) != 0)

  if (v6)
  {
    v15 = 0;
    v8 = 1;
  }
  else
  {
    v7 = (id)objc_msgSend(v12, "cellForItemAtIndexPath:", location[0]);
    if (!v7)
    {
      v7 = -[UICollectionViewAccessibility accessibilityCreatePrepareCellForIndexPath:](v14, "accessibilityCreatePrepareCellForIndexPath:", location[0]);

      objc_msgSend(v7, "layoutSubviews");
      objc_msgSend(v7, "removeFromSuperview");
    }
    v15 = v7;
    v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (id)accessibilityCollectionCellElementForIndexPath:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location[2];
  UICollectionViewAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = -[UICollectionViewAccessibility axData](v11, "axData");
  v7 = (id)-[AXCollectionViewData children]((uint64_t)v9);
  v8 = (id)objc_msgSend(v7, "objectForKey:", location[0]);

  if (!v8)
  {
    v3 = objc_allocWithZone((Class)UICollectionViewCellAccessibilityElement);
    v8 = (id)objc_msgSend(v3, "initWithAccessibilityContainer:", v11);

    objc_msgSend(v8, "setIndexPath:", location[0]);
    v6 = (id)-[AXCollectionViewData children]((uint64_t)v9);
    objc_msgSend(v6, "setObject:forKey:", v8, location[0]);

  }
  v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (uint64_t)_axGlobalRowForIndexPath:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id location;
  id v19;
  uint64_t v20;

  v19 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    v16 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x20000000;
    v14 = 32;
    v15 = 0;
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __58__UICollectionViewAccessibility__axGlobalRowForIndexPath___block_invoke;
    v8 = &unk_24FF3DAB0;
    v10[1] = &v11;
    v9 = v19;
    v10[0] = location;
    AXPerformSafeBlock();
    v3 = v12[3];
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    _Block_object_dispose(&v11, 8);
    v16 = v3;
    v20 = v3;
  }
  else
  {
    v20 = 0;
  }
  v17 = 1;
  objc_storeStrong(&location, 0);
  return v20;
}

uint64_t __58__UICollectionViewAccessibility__axGlobalRowForIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_globalIndexPathForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_axIndexPathForGlobalRow:(void *)a1
{
  id v3;
  id v4[3];
  uint64_t v5;
  uint64_t *v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v14 = a1;
  v13 = a2;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 838860800;
    v8 = 48;
    v9 = __Block_byref_object_copy__6;
    v10 = __Block_byref_object_dispose__6;
    v11 = 0;
    v4[1] = &v5;
    v4[0] = v14;
    v4[2] = v13;
    AXPerformSafeBlock();
    v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    v12 = v3;
    v15 = v3;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void __58__UICollectionViewAccessibility__axIndexPathForGlobalRow___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_indexPathForGlobalIndex:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityFuzzyHitTest:(CGPoint *)a3 withEvent:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *p_x;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  CGRect rect;
  id v23[3];
  double v24;
  id v25;
  uint64_t v26;
  _QWORD __b[8];
  void *v28;
  id v29[3];
  double v30;
  id v31;
  int v32;
  objc_super v33;
  id location;
  CGPoint *v35;
  SEL v36;
  UICollectionViewAccessibility *v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;

  v40 = *MEMORY[0x24BDAC8D0];
  v37 = self;
  v36 = a2;
  v35 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (-[UICollectionViewAccessibility _accessibilityShouldUseCollectionViewCellAccessibilityElements](v37, "_accessibilityShouldUseCollectionViewCellAccessibilityElements"))
  {
    v31 = 0;
    v30 = 1.79769313e308;
    UIAccessibilityPointForPoint();
    v29[1] = v4;
    v29[2] = v5;
    v29[0] = (id)-[UICollectionViewAccessibility safeValueForKey:](v37, "safeValueForKey:", CFSTR("indexPathsForVisibleItems"));
    memset(__b, 0, sizeof(__b));
    obj = v29[0];
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
    if (v20)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v20;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v28 = *(void **)(__b[1] + 8 * v17);
        v26 = 0;
        v26 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v37, v28);
        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = -[UICollectionViewAccessibility accessibilityCollectionCellElementForIndexPath:](v37, "accessibilityCollectionCellElementForIndexPath:", v28);
          objc_msgSend(v25, "accessibilityActivationPoint");
          v23[1] = v6;
          v23[2] = v7;
          AX_CGPointGetDistanceToPoint();
          v24 = v8;
          if (v8 < v30)
          {
            v30 = v24;
            objc_storeStrong(&v31, v25);
          }
          objc_storeStrong(&v25, 0);
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
          if (!v18)
            break;
        }
      }
    }

    if (v31)
    {
      v23[0] = (id)objc_msgSend(v31, "cell");
      objc_msgSend(v23[0], "bounds");
      rect = v41;
      CGRectGetMidX(v41);
      CGRectGetMidY(rect);
      CGPointMake_3();
      p_x = (_OWORD *)&v35->x;
      -[UICollectionViewAccessibility convertPoint:fromView:](v37, "convertPoint:fromView:", v23[0], v9, v10);
      *(_QWORD *)&v21 = v11;
      *((_QWORD *)&v21 + 1) = v12;
      *p_x = v21;
      v38 = v31;
      v32 = 1;
      objc_storeStrong(v23, 0);
    }
    else
    {
      v38 = 0;
      v32 = 1;
    }
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v33.receiver = v37;
    v33.super_class = (Class)UICollectionViewAccessibility;
    v38 = -[UICollectionViewAccessibility _accessibilityFuzzyHitTest:withEvent:](&v33, sel__accessibilityFuzzyHitTest_withEvent_, v35, location);
    v32 = 1;
  }
  objc_storeStrong(&location, 0);
  return v38;
}

- (BOOL)_accessibilityOverridesContainerProtocol
{
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  BOOL v10;
  Method v11;
  Method v12;
  Method v13;
  Method InstanceMethod;

  if (a1)
  {
    if (!_accessibilityOverridesContainerProtocol_baseCount)
    {
      v1 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseCount = (uint64_t)class_getInstanceMethod(v1, sel_accessibilityElementCount);
      v2 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseElemAtIndex = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityElementAtIndex_);
      v3 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseIndexOfElem = (uint64_t)class_getInstanceMethod(v3, sel_indexOfAccessibilityElement_);
      v4 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseElems = (uint64_t)class_getInstanceMethod(v4, sel_accessibilityElements);
    }
    v5 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v5, sel_accessibilityElementCount);
    v6 = (objc_class *)objc_opt_class();
    v13 = class_getInstanceMethod(v6, sel_accessibilityElementAtIndex_);
    v7 = (objc_class *)objc_opt_class();
    v12 = class_getInstanceMethod(v7, sel_indexOfAccessibilityElement_);
    v8 = (objc_class *)objc_opt_class();
    v11 = class_getInstanceMethod(v8, sel_accessibilityElements);
    v10 = 0;
    if ((Method)_accessibilityOverridesContainerProtocol_baseCount != InstanceMethod)
    {
      v10 = 0;
      if ((Method)_accessibilityOverridesContainerProtocol_baseElemAtIndex != v13)
      {
        v10 = 0;
        if ((Method)_accessibilityOverridesContainerProtocol_baseIndexOfElem != v12)
          return _accessibilityOverridesContainerProtocol_baseElems != (_QWORD)v11;
      }
    }
    return v10;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_accessibilityShouldAvoidScrollingCollectionViewCells
{
  return (-[UICollectionViewAccessibility isScrollEnabled](self, "isScrollEnabled") & 1) == 0;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  objc_super v3;
  char v4;
  SEL v5;
  UICollectionViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 1;
  if (-[UICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](self, "accessibilityCollectionViewBehavesLikeUIViewAccessibility"))
  {
    v3.receiver = v6;
    v3.super_class = (Class)UICollectionViewAccessibility;
    v4 = -[UICollectionViewAccessibility isAccessibilityOpaqueElementProvider](&v3, sel_isAccessibilityOpaqueElementProvider);
  }
  if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) == 0)
    v4 = 0;
  if (-[UICollectionViewAccessibility accessibilityElementCount](v6, "accessibilityElementCount") != 0x7FFFFFFFFFFFFFFFLL
    && -[UICollectionViewAccessibility _accessibilityOverridesContainerProtocol]((uint64_t)v6))
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  uint64_t v19;
  id v20;
  BOOL v21;
  BOOL v22;
  UICollectionViewAccessibility *v23;
  id v24;
  UICollectionViewAccessibility *v25;
  id v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  char v32;
  _QWORD __b[9];
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  id v39;
  id v40;
  char v41;
  id v42;
  id v43[3];
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  BOOL v55;
  objc_super v56;
  int v57;
  id v58;
  id *v59;
  char v60;
  uint64_t v61;
  int v62;
  int v63;
  BOOL (*v64)(uint64_t);
  void *v65;
  UICollectionViewAccessibility *v66;
  char v67;
  id location[2];
  UICollectionViewAccessibility *v69;
  CGPoint v70;
  UICollectionViewAccessibility *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v70 = a3;
  v69 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v67 = -[UICollectionViewAccessibility _accessibilityBoolValueForKey:](v69, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v60 = 0;
  v27 = 0;
  if (!v67)
  {
    v61 = MEMORY[0x24BDAC760];
    v62 = -1073741824;
    v63 = 0;
    v64 = __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v65 = &unk_24FF3E0C0;
    v66 = v69;
    v60 = 1;
    v59 = (id *)&v66;
    v27 = v64((uint64_t)&v61);
  }
  if (v27)
  {
    -[UICollectionViewAccessibility _accessibilitySetBoolValue:forKey:](v69, "_accessibilitySetBoolValue:forKey:", 1);
    v58 = (id)-[UICollectionViewAccessibility accessibilityHitTest:withEvent:](v69, "accessibilityHitTest:withEvent:", location[0], v70.x, v70.y);
    -[UICollectionViewAccessibility _accessibilitySetBoolValue:forKey:](v69, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v71 = (UICollectionViewAccessibility *)v58;
    v57 = 1;
    objc_storeStrong(&v58, 0);
  }
  else
  {
    v57 = 0;
  }
  if ((v60 & 1) != 0)
    objc_storeStrong(v59, 0);
  if (!v57)
  {
    if (-[UICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](v69, "accessibilityCollectionViewBehavesLikeUIViewAccessibility"))
    {
      v56.receiver = v69;
      v56.super_class = (Class)UICollectionViewAccessibility;
      v71 = (UICollectionViewAccessibility *)-[UICollectionViewAccessibility _accessibilityHitTest:withEvent:](&v56, sel__accessibilityHitTest_withEvent_, location[0], v70.x, v70.y);
      v57 = 1;
      goto LABEL_92;
    }
    v55 = (unsigned __int16)objc_msgSend(location[0], "_accessibilityHitTestType") == 3;
    if (v55
      || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0
      && -[UICollectionViewAccessibility isAccessibilityOpaqueElementProvider](v69, "isAccessibilityOpaqueElementProvider"))
    {
      v71 = (UICollectionViewAccessibility *)(id)-[UICollectionViewAccessibility __accessibilityHitTest:withEvent:](v69, "__accessibilityHitTest:withEvent:", location[0], v70.x, v70.y);
      v57 = 1;
      goto LABEL_92;
    }
    if (!-[UICollectionViewAccessibility _accessibilityShouldUseCollectionViewCellAccessibilityElements](v69, "_accessibilityShouldUseCollectionViewCellAccessibilityElements"))
    {
      v54.receiver = v69;
      v54.super_class = (Class)UICollectionViewAccessibility;
      v71 = (UICollectionViewAccessibility *)-[UICollectionViewAccessibility _accessibilityHitTest:withEvent:](&v54, sel__accessibilityHitTest_withEvent_, location[0], v70.x, v70.y);
      v57 = 1;
      goto LABEL_92;
    }
    v53 = v69;
    if ((-[UICollectionViewAccessibility pointInside:withEvent:](v69, "pointInside:withEvent:", location[0], v70.x, v70.y) & 1) == 0)
    {
      v71 = 0;
      v57 = 1;
LABEL_91:
      objc_storeStrong(&v53, 0);
      goto LABEL_92;
    }
    v25 = v69;
    v26 = -[UICollectionViewAccessibility _accessibilitySupplementaryHeaderViews](v69, "_accessibilitySupplementaryHeaderViews");
    v52 = (id)-[UICollectionViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v25, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v70.x, v70.y);

    if (v52
      || (v23 = v69,
          v24 = -[UICollectionViewAccessibility _accessibilitySupplementaryFooterViews](v69, "_accessibilitySupplementaryFooterViews"), v52 = (id)-[UICollectionViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v23, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v70.x, v70.y), 0, v24, v52))
    {
      v71 = (UICollectionViewAccessibility *)v52;
      v57 = 1;
LABEL_90:
      objc_storeStrong(&v52, 0);
      goto LABEL_91;
    }
    v51 = (id)objc_msgSend(v53, "__accessibilityHitTest:withEvent:", location[0], v70.x, v70.y);
    v49 = 0;
    v47 = 0;
    v45 = 0;
    v22 = 0;
    if (v51)
    {
      v22 = 0;
      if (v51 != v69)
      {
        objc_opt_class();
        v22 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v50 = (id)objc_msgSend(v51, "_accessibilityAncestorIsKindOf:", objc_opt_class());
          v49 = 1;
          v22 = 0;
          if (!v50)
          {
            v48 = (id)objc_msgSend(v51, "_accessibilityAncestorIsKindOf:", objc_opt_class());
            v47 = 1;
            v22 = 0;
            if (!v48)
            {
              v46 = (id)objc_msgSend(v51, "accessibilityContainer");
              v45 = 1;
              v22 = v46 != 0;
            }
          }
        }
      }
    }
    if ((v45 & 1) != 0)

    if ((v47 & 1) != 0)
    if ((v49 & 1) != 0)

    if (v22)
    {
      if ((objc_msgSend(v51, "isAccessibilityElement") & 1) != 0)
      {
        v71 = (UICollectionViewAccessibility *)v51;
        v57 = 1;
LABEL_89:
        objc_storeStrong(&v51, 0);
        goto LABEL_90;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v51, "convertPoint:fromView:", v69, v70.x, v70.y);
        v43[1] = v4;
        v43[2] = v5;
        v44 = (id)objc_msgSend(v51, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v4, *(double *)&v5);
        if ((objc_msgSend(v44, "isAccessibilityElement") & 1) != 0)
        {
          v71 = (UICollectionViewAccessibility *)v44;
          v57 = 1;
        }
        else
        {
          v57 = 0;
        }
        objc_storeStrong(&v44, 0);
        if (v57)
          goto LABEL_89;
      }
    }
    if (!-[UICollectionViewAccessibility accessibilityElementCount](v69, "accessibilityElementCount"))
    {
      v71 = v69;
      v57 = 1;
      goto LABEL_89;
    }
    v43[0] = (id)objc_msgSend(v53, "indexPathForItemAtPoint:", v70.x, v70.y);
    v41 = 0;
    v21 = 1;
    if (v43[0])
    {
      v42 = (id)objc_msgSend(v53, "cellForItemAtIndexPath:", v43[0]);
      v41 = 1;
      v21 = v42 == 0;
    }
    if ((v41 & 1) != 0)

    if (!v21)
      goto LABEL_73;
    if ((-[UICollectionViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v69, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0)
    {
      v6 = -[UICollectionViewAccessibility _accessibilityFuzzyHitTest:withEvent:](v69, "_accessibilityFuzzyHitTest:withEvent:", &v70, location[0]);
      v7 = v52;
      v52 = v6;

    }
    if (!v52 && v51)
    {
      v40 = (id)objc_msgSend(v51, "_accessibilityAncestorIsKindOf:", objc_opt_class());
      v38 = 0;
      objc_opt_class();
      v20 = (id)objc_msgSend(v40, "safeValueForKey:", CFSTR("_layoutAttributes"));
      v37 = (id)__UIAccessibilityCastAsClass();

      v36 = v37;
      objc_storeStrong(&v37, 0);
      v39 = v36;
      v35 = (id)objc_msgSend(v36, "representedElementKind");
      if (!objc_msgSend(v35, "length"))
        goto LABEL_69;
      v34 = (id)-[UICollectionViewAccessibility safeDictionaryForKey:](v69, "safeDictionaryForKey:", CFSTR("_supplementaryViewClassDict"));
      memset(__b, 0, 0x40uLL);
      obj = (id)objc_msgSend(v34, "allKeys");
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v72, 16);
      if (v19)
      {
        v15 = *(_QWORD *)__b[2];
        v16 = 0;
        v17 = v19;
        while (1)
        {
          v14 = v16;
          if (*(_QWORD *)__b[2] != v15)
            objc_enumerationMutation(obj);
          __b[8] = *(_QWORD *)(__b[1] + 8 * v16);
          v32 = 0;
          objc_opt_class();
          v31 = (id)__UIAccessibilityCastAsClass();
          if ((v32 & 1) != 0)
            abort();
          v30 = v31;
          objc_storeStrong(&v31, 0);
          v13 = objc_msgSend(v30, "hasPrefix:", v35);

          if ((v13 & 1) != 0)
            break;
          ++v16;
          if (v14 + 1 >= v17)
          {
            v16 = 0;
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v72, 16);
            if (!v17)
              goto LABEL_65;
          }
        }
        v71 = (UICollectionViewAccessibility *)v51;
        v57 = 1;
      }
      else
      {
LABEL_65:
        v57 = 0;
      }

      if (!v57)
        v57 = 0;
      objc_storeStrong(&v34, 0);
      if (!v57)
LABEL_69:
        v57 = 0;
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      if (v57)
        goto LABEL_88;
    }
    if (v52)
    {
LABEL_73:
      v29 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v69, v43[0]);
      if (v29 != 0x7FFFFFFFFFFFFFFFLL && !v52)
      {
        v8 = -[UICollectionViewAccessibility accessibilityCollectionCellElementForIndexPath:](v69, "accessibilityCollectionCellElementForIndexPath:", v43[0]);
        v9 = v52;
        v52 = v8;

      }
      if (v52)
      {
        v28 = (id)objc_msgSend(v52, "_accessibilityHitTest:withEvent:", location[0], v70.x, v70.y);
        if (!v28
          && (-[UICollectionViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v69, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0)
        {
          v10 = (id)objc_msgSend(v52, "accessibilityElementAtIndex:", 0);
          v11 = v28;
          v28 = v10;

        }
        objc_storeStrong(&v52, v28);
        objc_storeStrong(&v28, 0);
      }
      if (v52 && (objc_msgSend(v52, "isAccessibilityElement") & 1) != 0
        || v52 && (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) != 0)
      {
        v71 = (UICollectionViewAccessibility *)v52;
        v57 = 1;
      }
      else
      {
        v71 = v69;
        v57 = 1;
      }
    }
    else
    {
      v71 = v69;
      v57 = 1;
    }
LABEL_88:
    objc_storeStrong(v43, 0);
    goto LABEL_89;
  }
LABEL_92:
  objc_storeStrong(location, 0);
  return v71;
}

BOOL __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_13);
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
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_BaseImplementation;
}

void __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    UICollectionElementKindCell_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
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

- (BOOL)_accessibilityHasOrderedChildren
{
  objc_super v3;
  SEL v4;
  UICollectionViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (-[UICollectionViewAccessibility isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider"))
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  return -[UICollectionViewAccessibility _accessibilityHasOrderedChildren](&v3, sel__accessibilityHasOrderedChildren);
}

- (int64_t)accessibilityElementCount
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6[2];
  UICollectionViewAccessibility *v7;
  int64_t v8;

  v7 = self;
  v6[1] = (id)a2;
  if (!-[UICollectionViewAccessibility _accessibilityShouldUseCollectionViewCellAccessibilityElements](self, "_accessibilityShouldUseCollectionViewCellAccessibilityElements"))return 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = -[UICollectionViewAccessibility axData](v7, "axData");
  v5 = -[AXCollectionViewData childCount]((uint64_t)v6[0]);
  v3 = -[UICollectionViewAccessibility _accessibilityOtherCollectionViewItems](v7, "_accessibilityOtherCollectionViewItems");
  v4 = objc_msgSend(v3, "count");

  v8 = v5 + v4;
  objc_storeStrong(v6, 0);
  return v8;
}

- (id)_accessibilityOtherCollectionViewItems
{
  id v2;
  id v4;
  BOOL v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  id v14;
  int v15;
  id v16;
  id v17;
  char v18;
  id v19;
  char v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26[2];
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  char v31;
  char v32;
  _QWORD __b[8];
  id v34;
  id v35;
  id v36;
  char v37;
  id v38;
  id v39;
  id v40[2];
  UICollectionViewAccessibility *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40[1] = (id)a2;
  v40[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = -[UICollectionViewAccessibility axData](v41, "axData");
  v39 = (id)-[AXCollectionViewData children]((uint64_t)v14);

  v37 = 0;
  objc_opt_class();
  v36 = (id)__UIAccessibilityCastAsClass();
  v35 = v36;
  objc_storeStrong(&v36, 0);
  v38 = v35;
  memset(__b, 0, sizeof(__b));
  obj = (id)-[UICollectionViewAccessibility subviews](v41, "subviews");
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
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
      v34 = *(id *)(__b[1] + 8 * v10);
      v32 = 0;
      objc_opt_class();
      v7 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x20000000;
        v30 = 32;
        v31 = 0;
        v21 = MEMORY[0x24BDAC760];
        v22 = -1073741824;
        v23 = 0;
        v24 = __71__UICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke;
        v25 = &unk_24FF3DE88;
        v26[1] = &v27;
        v26[0] = v34;
        AXPerformSafeBlock();
        v20 = v28[3] & 1;
        objc_storeStrong(v26, 0);
        _Block_object_dispose(&v27, 8);
        v7 = v20;
      }
      v32 = v7 & 1;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if (((objc_opt_isKindOfClass() & 1) == 0 || (v32 & 1) != 0)
          && (objc_msgSend(v34, "_accessibilityViewIsVisible") & 1) != 0)
        {
          if ((v32 & 1) == 0)
            goto LABEL_18;
          v6 = v38;
          v18 = 0;
          objc_opt_class();
          v17 = (id)__UIAccessibilityCastAsClass();
          if ((v18 & 1) != 0)
            abort();
          v16 = v17;
          objc_storeStrong(&v17, 0);
          v19 = (id)objc_msgSend(v6, "indexPathForCell:");

          v2 = (id)objc_msgSend(v39, "objectForKey:", v19);
          v5 = v2 == 0;

          v15 = v5 ? 0 : 3;
          objc_storeStrong(&v19, 0);
          if (!v15)
LABEL_18:
            objc_msgSend(v40[0], "addObject:", v34);
        }
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
        if (!v11)
          break;
      }
    }
  }

  v4 = v40[0];
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v40, 0);
  return v4;
}

void __71__UICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(v1, "safeValueForKey:", CFSTR("_layoutAttributes"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v1, "_isStyledAsHeaderOrFooterFromLayoutAttributes:") & 1;

}

- (id)_accessibilityIndexPathToOtherCollectionViewItems
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id location;
  _QWORD __b[8];
  uint64_t v12;
  id v13[2];
  UICollectionViewAccessibility *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  memset(__b, 0, sizeof(__b));
  obj = -[UICollectionViewAccessibility _accessibilityOtherCollectionViewItems](v14, "_accessibilityOtherCollectionViewItems");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v6);
      location = (id)-[UICollectionViewAccessibility indexPathForSupplementaryView:](v14, "indexPathForSupplementaryView:", v12);
      if (location)
        objc_msgSend(v13[0], "setObject:forKey:", v12, location);
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v13[0];
  objc_storeStrong(v13, 0);
  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4;
  int v5;
  char *v6;
  id location;
  id v8;
  char *v9;
  SEL v10;
  UICollectionViewAccessibility *v11;
  id v12;

  v11 = self;
  v10 = a2;
  v9 = (char *)a3;
  v8 = -[UICollectionViewAccessibility axData](self, "axData");
  if ((uint64_t)v9 < -[AXCollectionViewData childCount]((uint64_t)v8))
  {
    if (-[AXCollectionViewData childCount]((uint64_t)v8))
    {
      v4 = -[UICollectionViewAccessibility _axIndexPathForGlobalRow:](v11, v9);
      if (v4)
        v12 = -[UICollectionViewAccessibility accessibilityCollectionCellElementForIndexPath:](v11, "accessibilityCollectionCellElementForIndexPath:", v4);
      else
        v12 = 0;
      v5 = 1;
      objc_storeStrong(&v4, 0);
    }
    else
    {
      v12 = 0;
      v5 = 1;
    }
  }
  else
  {
    location = -[UICollectionViewAccessibility _accessibilityOtherCollectionViewItems](v11, "_accessibilityOtherCollectionViewItems");
    v6 = &v9[--[AXCollectionViewData childCount]((uint64_t)v8)];
    if ((uint64_t)v6 < 0 || (unint64_t)v6 >= objc_msgSend(location, "count"))
    {
      v12 = 0;
      v5 = 1;
    }
    else
    {
      v12 = (id)objc_msgSend(location, "objectAtIndex:", v6);
      v5 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v8, 0);
  return v12;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  UICollectionViewAccessibility *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id location[2];
  UICollectionViewAccessibility *v10;
  int64_t v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    v5 = (id)objc_msgSend(location[0], "indexPath");
    v11 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v4, v5);

  }
  else
  {
    v8 = -[UICollectionViewAccessibility _accessibilityOtherCollectionViewItems](v10, "_accessibilityOtherCollectionViewItems");
    v7 = objc_msgSend(v8, "indexOfObject:", location[0]);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = -[UICollectionViewAccessibility axData](v10, "axData");
      v11 = -[AXCollectionViewData childCount]((uint64_t)v6) + v7;

    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("group.role"));
}

- (int64_t)accessibilityContainerType
{
  id v2;
  id v4;
  BOOL v5;
  int64_t v7;

  v2 = (id)-[UICollectionViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
  v5 = v2 == 0;

  if (v5)
  {
    if (-[UICollectionViewAccessibility numberOfSections](self, "numberOfSections") <= 0
      || (-[UICollectionViewAccessibility isAccessibilityElement](self, "isAccessibilityElement") & 1) != 0)
    {
      return 0;
    }
    else
    {
      return 4;
    }
  }
  else
  {
    v4 = (id)-[UICollectionViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
    v7 = objc_msgSend(v4, "integerValue");

  }
  return v7;
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  id v4;
  id location[2];
  UICollectionViewAccessibility *v6;
  BOOL v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[UICollectionViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("delegate"));
  v7 = !v4 || v4 == v6 || (objc_msgSend(v4, "_accessibilityDescendantElementAtIndexPathIsValid:", location[0]) & 1) != 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityScannerGroupElements
{
  id v2;
  id v3;
  id v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD __b[8];
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32[2];
  UICollectionViewAccessibility *v33;
  id v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  if ((-[UICollectionViewAccessibility _accessibilityTreatCollectionViewRowsAsScannerGroups](self, "_accessibilityTreatCollectionViewRowsAsScannerGroups") & 1) != 0)
  {
    v34 = -[UICollectionViewAccessibility _accessibilityScannerGroupElementsGroupedByRow](v33);
  }
  else
  {
    v32[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
    v31 = (id)-[UICollectionViewAccessibility _accessibilityViewChildrenWithOptions:](v33, "_accessibilityViewChildrenWithOptions:");

    v30 = 0x7FFFFFFFFFFFFFFFLL;
    v29 = 0;
    v28 = 64;
    if (-[UICollectionViewAccessibility numberOfSections](v33, "numberOfSections") > 1)
      v28 |= 0x10uLL;
    memset(__b, 0, sizeof(__b));
    obj = v31;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
    if (v19)
    {
      v15 = *(_QWORD *)__b[2];
      v16 = 0;
      v17 = v19;
      while (1)
      {
        v14 = v16;
        if (*(_QWORD *)__b[2] != v15)
          objc_enumerationMutation(obj);
        v27 = *(id *)(__b[1] + 8 * v16);
        v25 = 0x7FFFFFFFFFFFFFFFLL;
        v24 = -[UICollectionViewAccessibility _accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:](v33, "_accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:", v27, 0);
        if (v24)
          v25 = objc_msgSend(v24, "section");
        if (v25 != v30)
        {
          if (objc_msgSend(v29, "count"))
          {
            v37[0] = CFSTR("GroupElements");
            v38[0] = v29;
            v37[1] = CFSTR("GroupTraits");
            v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v28);
            v38[1] = v13;
            v37[2] = CFSTR("GroupScanBehaviorTraits");
            v38[2] = &unk_24FF85A30;
            v37[3] = CFSTR("GroupIdentifier");
            v10 = (void *)MEMORY[0x24BDD17C8];
            v12 = -[UICollectionViewAccessibility _accessibilityGroupIdentifier](v33, "_accessibilityGroupIdentifier");
            v11 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%lu"), v12, v30);
            v38[3] = v11;
            v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);

            objc_msgSend(v32[0], "addObject:", v23);
            objc_storeStrong(&v23, 0);
          }
          v30 = v25;
          objc_storeStrong(&v29, 0);
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v3 = v29;
            v29 = v2;

          }
        }
        if (v29)
          v4 = v29;
        else
          v4 = v32[0];
        v22 = v4;
        objc_msgSend(v27, "_accessibilityProcessScannerGroupElementPieces:", v4);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v24, 0);
        ++v16;
        if (v14 + 1 >= v17)
        {
          v16 = 0;
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
          if (!v17)
            break;
        }
      }
    }

    if (objc_msgSend(v29, "count"))
    {
      v35[0] = CFSTR("GroupElements");
      v36[0] = v29;
      v35[1] = CFSTR("GroupTraits");
      v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v28);
      v36[1] = v9;
      v35[2] = CFSTR("GroupScanBehaviorTraits");
      v36[2] = &unk_24FF85A30;
      v35[3] = CFSTR("GroupIdentifier");
      v6 = (void *)MEMORY[0x24BDD17C8];
      v8 = -[UICollectionViewAccessibility _accessibilityGroupIdentifier](v33, "_accessibilityGroupIdentifier");
      v7 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%lu"), v8, v30);
      v36[3] = v7;
      v21 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);

      objc_msgSend(v32[0], "addObject:", v21);
      objc_storeStrong(&v21, 0);
    }
    v34 = v32[0];
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(v32, 0);
  }
  return v34;
}

- (id)_accessibilityScannerGroupElementsGroupedByRow
{
  id v1;
  id v2;
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id obj;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  int v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v36 = a1;
  if (a1)
  {
    v35 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
    v34 = (id)objc_msgSend(v36, "_accessibilityViewChildrenWithOptions:");

    v33 = 80;
    v32 = objc_msgSend(v36, "_accessibilityCollectionViewItemsPerRow");
    v31 = 0;
    v30 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = v34;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v22)
    {
      v17 = *(_QWORD *)__b[2];
      v18 = 0;
      v19 = v22;
      while (1)
      {
        v16 = v18;
        if (*(_QWORD *)__b[2] != v17)
          objc_enumerationMutation(obj);
        v29 = *(id *)(__b[1] + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v35, "addObject:", v29);
        }
        else
        {
          v27 = (id)objc_msgSend(v29, "_accessibilityIndexPath");
          if (v27
            || (v15 = (id)objc_msgSend(v29, "_accessibilityAncestorIsKindOf:", objc_opt_class()), v1 = (id)objc_msgSend(v15, "_accessibilityIndexPath"), v2 = v27, v27 = v1, v2, v15, v27))
          {
            v25 = 0;
            v3 = objc_msgSend(v27, "item");
            v25 = v3 / v32;
            if (v3 / v32 == v31)
            {
              objc_msgSend(v30, "addObject:", v29);
            }
            else
            {
              if (objc_msgSend(v30, "count"))
              {
                v40[0] = CFSTR("GroupElements");
                v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v30);
                v41[0] = v14;
                v40[1] = CFSTR("GroupTraits");
                v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v33);
                v41[1] = v13;
                v40[2] = CFSTR("GroupScanBehaviorTraits");
                v41[2] = &unk_24FF85A30;
                v40[3] = CFSTR("GroupIdentifier");
                v10 = (void *)MEMORY[0x24BDD17C8];
                v12 = (id)objc_msgSend(v36, "_accessibilityGroupIdentifier");
                v11 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%lu"), v12, v31);
                v41[3] = v11;
                v24 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);

                objc_msgSend(v35, "addObject:", v24);
                objc_msgSend(v30, "removeAllObjects");
                objc_storeStrong(&v24, 0);
              }
              v31 = v25;
              objc_msgSend(v30, "addObject:", v29);
            }
            v26 = 0;
          }
          else
          {
            v26 = 3;
          }
          objc_storeStrong(&v27, 0);
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          v18 = 0;
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
          if (!v19)
            break;
        }
      }
    }

    if (objc_msgSend(v30, "count"))
    {
      v38[0] = CFSTR("GroupElements");
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v30);
      v39[0] = v9;
      v38[1] = CFSTR("GroupTraits");
      v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v33);
      v39[1] = v8;
      v38[2] = CFSTR("GroupScanBehaviorTraits");
      v39[2] = &unk_24FF85A30;
      v38[3] = CFSTR("GroupIdentifier");
      v5 = (void *)MEMORY[0x24BDD17C8];
      v7 = (id)objc_msgSend(v36, "_accessibilityGroupIdentifier");
      v6 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%lu"), v7, v31);
      v39[3] = v6;
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);

      objc_msgSend(v35, "addObject:", v23);
      objc_msgSend(v30, "removeAllObjects");
      objc_storeStrong(&v23, 0);
    }
    v37 = v35;
    v26 = 1;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v37 = 0;
  }
  return v37;
}

- (id)_accessibilityGroupIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
}

- (id)_accessibilitySortedElementsWithin
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  UICollectionViewAccessibility *v9;
  id location[2];
  UICollectionViewAccessibility *v11;
  id v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9 = v11;
  if (v7((uint64_t)&v4))
  {
    v12 = -[UICollectionViewAccessibility _accessibilitySortedViewChildrenWithOptions:](v11, location[0]);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)&v9, 0);
  if (!v3)
    v12 = -[UICollectionViewAccessibility _accessibilitySortedElementsWithinWithOptions:](v11, "_accessibilitySortedElementsWithinWithOptions:", location[0]);
  objc_storeStrong(location, 0);
  return v12;
}

BOOL __67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_413);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
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
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_2_BaseImplementation;
}

void __67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
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
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
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

- (id)_accessibilitySortedViewChildrenWithOptions:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(id *, void *, void *, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t (*v29)(id *, void *, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  int v38;
  id location;
  void *v40;
  id v41;

  v40 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v40)
  {
    objc_msgSend(v40, "_accessibilityEnsureViewsAroundAreLoaded");
    v37 = (id)objc_msgSend(v40, "_accessibilityViewChildrenWithOptions:", location);
    v36 = 0;
    v14 = (id)objc_msgSend(v40, "collectionViewLayout");
    objc_opt_class();
    v34 = 0;
    v15 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = (id)objc_msgSend(v40, "collectionViewLayout");
      v34 = 1;
      v15 = objc_msgSend(v35, "_accessibilitySortCollectionViewLogically");
    }
    if ((v34 & 1) != 0)

    v36 = v15 & 1;
    v2 = (id)objc_msgSend(v40, "accessibilityComparatorForSorting");
    v13 = v2 == 0;

    if (v13)
    {
      if ((objc_msgSend(v40, "_accessibilityOnlyComparesByXAxis") & 1) != 0)
      {
        v5 = (id)objc_msgSend(v40, "_accessibilityGeometrySortedElements:", v37);
        v6 = v37;
        v37 = v5;

      }
      else if ((v36 & 1) != 0)
      {
        v33 = (id)objc_msgSend(v40, "collectionViewLayout");
        v11 = v37;
        v26 = MEMORY[0x24BDAC760];
        v27 = -1073741824;
        v28 = 0;
        v29 = __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke;
        v30 = &unk_24FF3E7E0;
        v31 = v40;
        v32 = v33;
        v7 = (id)objc_msgSend(v11, "sortedArrayUsingComparator:", &v26);
        v8 = v37;
        v37 = v7;

        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v33, 0);
      }
    }
    else
    {
      v12 = (id)objc_msgSend(v40, "accessibilityComparatorForSorting");
      v3 = (id)objc_msgSend(v37, "sortedArrayUsingComparator:");
      v4 = v37;
      v37 = v3;

    }
    v10 = v37;
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke_2;
    v23 = &unk_24FF3E640;
    v24 = v40;
    v25 = (id)objc_msgSend(v10, "indexesOfObjectsPassingTest:", &v19);
    if (objc_msgSend(v25, "count"))
    {
      v18 = (id)objc_msgSend(v37, "mutableCopy");
      objc_msgSend(v18, "removeObjectsAtIndexes:", v25);
      objc_storeStrong(&v37, v18);
      objc_storeStrong(&v18, 0);
    }
    v17 = -[UICollectionViewAccessibility _axIndexBar](v40);
    if (v17)
    {
      v16 = (id)objc_msgSend(v37, "mutableCopy");
      objc_msgSend(v16, "removeObject:", v17);
      objc_msgSend(v16, "insertObject:atIndex:", v17, 0);
      objc_storeStrong(&v37, v16);
      objc_storeStrong(&v16, 0);
    }
    v41 = v37;
    v38 = 1;
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v37, 0);
  }
  else
  {
    v41 = 0;
    v38 = 1;
  }
  objc_storeStrong(&location, 0);
  return v41;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL (*v8)(uint64_t);
  void *v9;
  UICollectionViewAccessibility *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  UICollectionViewAccessibility *v17;
  BOOL v18;
  id location[2];
  UICollectionViewAccessibility *v20;
  id v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v4 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  v16 = &unk_24FF3E0C0;
  v17 = v20;
  v18 = v15((uint64_t)&v12);
  v11 = 0;
  v5 = v4;
  v6 = -1073741824;
  v7 = 0;
  v8 = __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_418;
  v9 = &unk_24FF3E0C0;
  v10 = v20;
  v11 = v8((uint64_t)&v5);
  if (!v18 || v11)
    v21 = -[UICollectionViewAccessibility _accessibilitySortedViewChildrenWithOptions:](v20, location[0]);
  else
    v21 = -[UICollectionViewAccessibility _accessibilitySortedElementsWithin](v20, "_accessibilitySortedElementsWithin");
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_3_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_417);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
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
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_3_BaseImplementation;
}

void __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
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
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_3_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
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

BOOL __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_418(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_4_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_420);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
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
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
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
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_4_BaseImplementation;
}

void __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_419(uint64_t a1)
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
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_4_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
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

uint64_t __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v28;
  double v29;
  double MaxX;
  double v31;
  double MinX;
  double v33;
  CGRect rect;
  _BYTE v35[32];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  id *v47;
  id v48;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v48 = 0;
  objc_storeStrong(&v48, a3);
  v47 = a1;
  v46 = 0;
  v45 = 0;
  v44 = 0;
  v3 = a1[4];
  v42 = 0;
  v26 = (id)objc_msgSend(v3, "_accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:", location[0], &v42);
  objc_storeStrong(&v45, v42);
  v43 = v26;
  v4 = a1[4];
  v40 = v44;
  v28 = (id)objc_msgSend(v4, "_accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:", v48, &v40);
  objc_storeStrong(&v44, v40);
  v41 = v28;
  if (v43 && v41)
  {
    v39 = objc_msgSend(v43, "section");
    v38 = objc_msgSend(v41, "section");
    if (v39 == v38)
    {
      v24 = 0;
    }
    else
    {
      v5 = 1;
      if (v39 < v38)
        v5 = -1;
      v24 = v5;
    }
    v46 = v24;
    if (!v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v45, "isEqualToString:", v44) & 1) != 0)
      {
        if ((objc_msgSend(v45, "isEqualToString:", CFSTR("UICollectionElementKindCell")) & 1) != 0
          && (objc_msgSend(v44, "isEqualToString:", CFSTR("UICollectionElementKindCell")) & 1) != 0)
        {
          v37 = objc_msgSend(v43, "item");
          v36 = objc_msgSend(v41, "item");
          if (v37 == v36)
          {
            v23 = 0;
          }
          else
          {
            v6 = 1;
            if (v37 < v36)
              v6 = -1;
            v23 = v6;
          }
          v46 = v23;
        }
      }
      else if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BDF7630]) & 1) != 0)
      {
        v46 = -1;
      }
      else if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BDF7630]) & 1) != 0)
      {
        v46 = 1;
      }
      else if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BDF7628]) & 1) != 0)
      {
        v46 = 1;
      }
      else if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BDF7628]) & 1) != 0)
      {
        v46 = -1;
      }
    }
    if ((objc_msgSend(a1[4], "_accessibilityIsRTL") & 1) != 0 && v46)
    {
      objc_msgSend(location[0], "accessibilityFrame");
      *(_QWORD *)v35 = v7;
      *(_QWORD *)&v35[8] = v8;
      *(_QWORD *)&v35[16] = v9;
      *(_QWORD *)&v35[24] = v10;
      objc_msgSend(v48, "accessibilityFrame");
      rect.origin.x = v11;
      rect.origin.y = v12;
      rect.size.width = v13;
      rect.size.height = v14;
      objc_msgSend(a1[4], "_accessibilityAllowedGeometryOverlap");
      v33 = v15;
      v22 = 0;
      if (CGFAbs(*(double *)&v35[8] - rect.origin.y) < v15)
        v22 = CGFAbs(*(double *)&v35[24] - rect.size.height) < v33;
      if (v22)
      {
        MinX = CGRectGetMinX(*(CGRect *)v35);
        v31 = CGRectGetMinX(rect);
        MaxX = CGRectGetMaxX(*(CGRect *)v35);
        v29 = CGRectGetMaxX(rect);
        if (v31 > MinX || MinX >= MaxX || (v21 = 1, MaxX > v29))
        {
          v20 = 0;
          if (MinX <= v31)
          {
            v20 = 0;
            if (v31 < v29)
              v20 = v29 <= MaxX;
          }
          v21 = v20;
        }
        if (*(double *)v35 < rect.origin.x && v46 == -1
          || (v19 = 0, *(double *)v35 > rect.origin.x) && (v19 = 0, v46 == 1))
        {
          v19 = v21 ^ 1;
        }
        if ((v19 & 1) != 0)
        {
          v16 = 1;
          if (v46 == 1)
            v16 = -1;
          v46 = v16;
        }
      }
    }
  }
  if (!v46)
    v46 = objc_msgSend(location[0], "accessibilityCompareGeometry:", v48);
  v18 = v46;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v18;
}

uint64_t __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  int v8;
  id v9[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  v9[0] = (id)objc_msgSend(a1[4], "_accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:", location[0], 0);
  v8 = objc_msgSend(a1[4], "_accessibilityDescendantElementAtIndexPathIsValid:", v9[0]) ^ 1;
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_axIndexBar
{
  id obj;
  id v3;
  id location;
  id v5;
  id v6;

  v5 = a1;
  if (a1)
  {
    location = 0;
    v3 = v5;
    obj = (id)objc_msgSend(v3, "accessoryViewAtEdge:", 1);
    NSClassFromString(CFSTR("UIIndexBarAccessoryView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong(&location, obj);
    v6 = location;
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CGRect)_visibleBounds
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double x;
  double y;
  double width;
  double height;
  CGRect r2;
  objc_super v15;
  SEL v16;
  UICollectionViewAccessibility *v17;
  CGRect v18;
  CGRect result;

  v17 = self;
  v16 = a2;
  memset(&v18, 0, sizeof(v18));
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewAccessibility;
  -[UICollectionViewAccessibility _visibleBounds](&v15, sel__visibleBounds);
  v18.origin.x = v2;
  v18.origin.y = v3;
  v18.size.width = v4;
  v18.size.height = v5;
  if (UIAccessibilityIsVoiceOverRunning()
    && -[UICollectionViewAccessibility isAccessibilityOpaqueElementProvider](v17, "isAccessibilityOpaqueElementProvider"))
  {
    -[UICollectionViewAccessibility _accessibilityBoundsOfCellsToLoad](v17, "_accessibilityBoundsOfCellsToLoad");
    r2.origin.x = v6;
    r2.origin.y = v7;
    r2.size.width = v8;
    r2.size.height = v9;
    v18 = CGRectUnion(v18, r2);
  }
  y = v18.origin.y;
  x = v18.origin.x;
  height = v18.size.height;
  width = v18.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_accessibilityEnsureViewsAroundAreLoaded
{
  ;
}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  CGRect v2;

  -[UICollectionViewAccessibility bounds](self, "bounds");
  return CGRectInset(v2, -1.0 * v2.size.width, -1.0 * v2.size.height);
}

- (id)_accessibilityIndexPathOfDirectSubviewForDescendantElement:(id)a3 withElementKind:(id *)a4
{
  __CFString *v4;
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v15;
  id v16;
  id v17[2];
  uint64_t v18;
  uint64_t *v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  id v32;
  id v33;
  id *v34;
  id location[2];
  UICollectionViewAccessibility *v36;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = a4;
  v33 = v36;
  v32 = (id)objc_msgSend(location[0], "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_429, 1);
  v31 = 0;
  do
  {
    v30 = (id)objc_msgSend(v32, "superview");
    v13 = 1;
    if (v30 != v33)
      v13 = v30 == 0;
    v31 = v13;
    if (!v13)
      objc_storeStrong(&v32, v30);
    objc_storeStrong(&v30, 0);
  }
  while (!v31);
  v29 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v34)
    {
      v4 = objc_retainAutorelease(CFSTR("UICollectionElementKindCell"));
      *v34 = v4;
    }
    v5 = (id)objc_msgSend(v33, "indexPathForCell:", v32);
    v6 = v29;
    v29 = v5;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v34)
      {
        v27 = 0;
        objc_opt_class();
        v12 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("_layoutAttributes"));
        v26 = (id)__UIAccessibilityCastAsClass();

        v25 = v26;
        objc_storeStrong(&v26, 0);
        v28 = v25;
        v11 = (id)objc_msgSend(v25, "representedElementKind");
        if (v11)
          v7 = (__CFString *)objc_retainAutorelease(v11);
        else
          v7 = objc_retainAutorelease(CFSTR("UICollectionElementKindCell"));
        *v34 = v7;

        objc_storeStrong(&v28, 0);
      }
      v18 = 0;
      v19 = &v18;
      v20 = 838860800;
      v21 = 48;
      v22 = __Block_byref_object_copy__6;
      v23 = __Block_byref_object_dispose__6;
      v24 = 0;
      v17[1] = &v18;
      v16 = v33;
      v17[0] = v32;
      AXPerformSafeBlock();
      v15 = (id)v19[5];
      objc_storeStrong(v17, 0);
      objc_storeStrong(&v16, 0);
      _Block_object_dispose(&v18, 8);
      objc_storeStrong(&v24, 0);
      v8 = v29;
      v29 = v15;

    }
  }
  v10 = v29;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __108__UICollectionViewAccessibility__accessibilityIndexPathOfDirectSubviewForDescendantElement_withElementKind___block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __108__UICollectionViewAccessibility__accessibilityIndexPathOfDirectSubviewForDescendantElement_withElementKind___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "indexPathForSupplementaryView:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (id)_accessibilityReusableViewForOpaqueElement:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = location[0];
  while (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v3 = (id)objc_msgSend(v7, "accessibilityContainer");
    v4 = v7;
    v7 = v3;

  }
  v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  id v21[2];
  UICollectionViewAccessibility *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = self;
  v21[1] = (id)a2;
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewAccessibility;
  v21[0] = -[UICollectionViewAccessibility _accessibilitySupplementaryHeaderViews](&v20, sel__accessibilitySupplementaryHeaderViews);
  if (!v21[0])
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v3 = v21[0];
    v21[0] = v2;

  }
  v19 = -[UICollectionViewAccessibility _axIndexBar](v22);
  if (v19)
  {
    if (objc_msgSend(v21[0], "count"))
    {
      v18 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v19);
      objc_msgSend(v18, "addObjectsFromArray:", v21[0]);
      objc_storeStrong(v21, v18);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      v23[0] = v19;
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v5 = v21[0];
      v21[0] = v4;

    }
  }
  v17 = -[UICollectionViewAccessibility _accessibilityCollectionViewSupplementaryViews](v22, "_accessibilityCollectionViewSupplementaryViews");
  v6 = (id)objc_msgSend(v17, "ax_filteredArrayUsingBlock:", &__block_literal_global_432);
  v7 = v17;
  v17 = v6;

  v13 = (id)-[UICollectionViewAccessibility safeArrayForKey:](v22, "safeArrayForKey:");
  v12 = (id)objc_msgSend(v13, "ax_filteredArrayUsingBlock:", &__block_literal_global_436);
  v16 = (id)objc_msgSend(v12, "firstObject");

  v14 = (id)objc_msgSend(v16, "safeArrayForKey:", CFSTR("subviews"));
  v15 = (id)objc_msgSend(v14, "ax_filteredArrayUsingBlock:", &__block_literal_global_437);

  if (objc_msgSend(v15, "count"))
  {
    v8 = (id)objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v15);
    v9 = v17;
    v17 = v8;

  }
  v11 = (id)objc_msgSend(v21[0], "arrayByAddingObjectsFromArray:", v17);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v21, 0);
  return v11;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UISwipeActionPullView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_UICollectionViewListSwipeActionsView"));
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(location[0], "_accessibilityViewIsVisible");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_3(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UISwipeActionPullView"));
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(location[0], "_accessibilityViewIsVisible");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)accessibilityLabel
{
  id v2;
  BOOL v4;
  objc_super v5;
  SEL v6;
  UICollectionViewAccessibility *v7;
  id v8;

  v7 = self;
  v6 = a2;
  v2 = (id)-[UICollectionViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = v2 == 0;

  if (v4)
  {
    if (!UIAccessibilityIsVoiceOverRunning()
      || (-[UICollectionViewAccessibility isAccessibilityElement](v7, "isAccessibilityElement") & 1) != 0)
    {
      v5.receiver = v7;
      v5.super_class = (Class)UICollectionViewAccessibility;
      v8 = -[UICollectionViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = (id)-[UICollectionViewAccessibility accessibilityUserDefinedLabel](v7, "accessibilityUserDefinedLabel");
  }
  return v8;
}

- (id)_accessibilityCollectionViewSupplementaryViews
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  id v11;
  id location;
  id v13[2];
  UICollectionViewAccessibility *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (_AXSAutomationEnabled())
  {
    location = (id)-[UICollectionViewAccessibility visibleCells](v14, "visibleCells");
    memset(__b, 0, sizeof(__b));
    obj = (id)-[UICollectionViewAccessibility subviews](v14, "subviews");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v11 = *(id *)(__b[1] + 8 * v6);
        if ((objc_msgSend(location, "containsObject:", v11) & 1) == 0
          && (objc_msgSend(v11, "_accessibilityViewIsVisible") & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v13[0], "addObject:", v11);
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
          if (!v7)
            break;
        }
      }
    }

    objc_storeStrong(&location, 0);
  }
  v3 = v13[0];
  objc_storeStrong(v13, 0);
  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v2;
  id v3;
  objc_super v5;
  int v6;
  id location[2];
  UICollectionViewAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = -[UICollectionViewAccessibility _accessibilityCollectionViewSupplementaryViews](self, "_accessibilityCollectionViewSupplementaryViews");
  v2 = (id)objc_msgSend(location[0], "ax_filteredArrayUsingBlock:", &__block_literal_global_445);
  v3 = location[0];
  location[0] = v2;

  if (objc_msgSend(location[0], "count"))
  {
    v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)UICollectionViewAccessibility;
    v9 = -[UICollectionViewAccessibility _accessibilitySupplementaryFooterViews](&v5, sel__accessibilitySupplementaryFooterViews);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v9;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UISwipeActionPullView"));
  v3 = objc_opt_isKindOfClass() ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id obj;
  uint64_t v11;
  id location;
  uint64_t v13;
  uint64_t v14;
  _QWORD __b[8];
  id v16;
  id v17;
  objc_super v18;
  id v19[2];
  UICollectionViewAccessibility *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19[1] = (id)a2;
  v18.receiver = self;
  v18.super_class = (Class)UICollectionViewAccessibility;
  v9 = -[UICollectionViewAccessibility _accessibilitySupplementaryViewSectionHeaderIdentifiers](&v18, sel__accessibilitySupplementaryViewSectionHeaderIdentifiers);
  v19[0] = (id)AXGuaranteedMutableArray();

  v17 = (id)-[UICollectionViewAccessibility safeDictionaryForKey:](v20, "safeDictionaryForKey:", CFSTR("_supplementaryViewClassDict"));
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v17, "allKeys");
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v11)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v11;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v16 = *(id *)(__b[1] + 8 * v7);
      if ((objc_msgSend(v16, "localizedCaseInsensitiveContainsString:", CFSTR("header")) & 1) != 0)
      {
        v13 = 0;
        v14 = 0;
        v13 = objc_msgSend(v16, "rangeOfString:", CFSTR("/"));
        v14 = v2;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v19[0], "addObject:", v16);
        }
        else
        {
          location = (id)objc_msgSend(v16, "substringToIndex:", v13);
          if (objc_msgSend(location, "length"))
            objc_msgSend(v19[0], "addObject:", location);
          objc_storeStrong(&location, 0);
        }
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
        if (!v8)
          break;
      }
    }
  }

  v4 = v19[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v19, 0);
  return v4;
}

- (id)_accessibilitySupplementaryHeaderViewAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  int v10;
  id v11;
  UICollectionViewAccessibility *v12;
  id v13;
  id v14[2];
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id location[2];
  UICollectionViewAccessibility *v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = -[UICollectionViewAccessibility _accessibilitySupplementaryViewSectionHeaderIdentifiers](v26, "_accessibilitySupplementaryViewSectionHeaderIdentifiers");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v6);
      v15 = 0;
      v16 = &v15;
      v17 = 838860800;
      v18 = 48;
      v19 = __Block_byref_object_copy__6;
      v20 = __Block_byref_object_dispose__6;
      v21 = 0;
      v14[1] = &v15;
      v12 = v26;
      v13 = v24;
      v14[0] = location[0];
      AXPerformSafeBlock();
      v11 = (id)v16[5];
      objc_storeStrong(v14, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong((id *)&v12, 0);
      _Block_object_dispose(&v15, 8);
      objc_storeStrong(&v21, 0);
      v22 = v11;
      if (v11)
      {
        v27 = v22;
        v10 = 1;
      }
      else
      {
        v10 = 0;
      }
      objc_storeStrong(&v22, 0);
      if (v10)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (!v7)
          goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  if (!v10)
    v27 = 0;
  objc_storeStrong(location, 0);
  return v27;
}

void __82__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViewAtIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "supplementaryViewForElementKind:atIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  int v10;
  id v11;
  UICollectionViewAccessibility *v12;
  id v13;
  id v14[2];
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id location[2];
  UICollectionViewAccessibility *v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = -[UICollectionViewAccessibility _accessibilitySupplementaryViewSectionHeaderIdentifiers](v26, "_accessibilitySupplementaryViewSectionHeaderIdentifiers");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v6);
      v15 = 0;
      v16 = &v15;
      v17 = 838860800;
      v18 = 48;
      v19 = __Block_byref_object_copy__6;
      v20 = __Block_byref_object_dispose__6;
      v21 = 0;
      v14[1] = &v15;
      v12 = v26;
      v13 = v24;
      v14[0] = location[0];
      AXPerformSafeBlock();
      v11 = (id)v16[5];
      objc_storeStrong(v14, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong((id *)&v12, 0);
      _Block_object_dispose(&v15, 8);
      objc_storeStrong(&v21, 0);
      v22 = v11;
      if (v11)
      {
        v27 = v22;
        v10 = 1;
      }
      else
      {
        v10 = 0;
      }
      objc_storeStrong(&v22, 0);
      if (v10)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (!v7)
          goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  if (!v10)
    v27 = 0;
  objc_storeStrong(location, 0);
  return v27;
}

void __101__UICollectionViewAccessibility__accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  unint64_t v3;
  uint64_t v4;
  id location;
  _BOOL8 v6;
  SEL v7;
  UICollectionViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  location = (id)-[UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewLayout"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(location, "safeIntegerForKey:", CFSTR("scrollDirection"));
    if (v4)
      v6 = v4 == 1;
    else
      v6 = 1;
  }
  v3 = v6 | 0xC;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  objc_super v4;
  char v5;
  id v6;
  SEL v7;
  UICollectionViewAccessibility *v8;
  BOOL v9;

  v8 = self;
  v7 = a2;
  if ((-[UICollectionViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v5 = 0;
    v3 = 0;
    if ((-[UICollectionViewAccessibility safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("_isFocusedOrAncestorOfFocusedView")) & 1) == 0)
    {
      v6 = (id)-[UICollectionViewAccessibility _axGetLastFocusedChild](v8, "_axGetLastFocusedChild");
      v5 = 1;
      v3 = v6 != 0;
    }
    v9 = v3;
    if ((v5 & 1) != 0)

  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UICollectionViewAccessibility;
    return -[UICollectionViewAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
  }
  return v9;
}

- (id)preferredFocusedView
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  char v8;
  char v9;
  char v10;
  BOOL v11;
  id v12;
  id v13;
  char v14;
  BOOL v15;
  char v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  char v22;
  id v23;
  id v24;
  objc_super v25;
  id v26[2];
  UICollectionViewAccessibility *v27;

  v27 = self;
  v26[1] = (id)a2;
  v25.receiver = self;
  v25.super_class = (Class)UICollectionViewAccessibility;
  v26[0] = -[UICollectionViewAccessibility preferredFocusedView](&v25, sel_preferredFocusedView);
  if ((-[UICollectionViewAccessibility _accessibilityIsFKARunningForFocusItem](v27, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v24 = (id)-[UICollectionViewAccessibility _axGetLastFocusedChild](v27, "_axGetLastFocusedChild");
    v23 = (id)objc_msgSend(v24, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_458, 1);
    v22 = 0;
    v21 = 0;
    objc_opt_class();
    v20 = (id)__UIAccessibilityCastAsClass();
    v19 = v20;
    objc_storeStrong(&v20, 0);
    v10 = objc_msgSend(v19, "_accessibilityViewIsVisible");

    v22 = v10 & 1;
    v18 = 0;
    v16 = 0;
    v11 = 0;
    if ((objc_msgSend(v23, "_isEligibleForFocusInteraction") & 1) != 0)
    {
      v11 = 0;
      if ((objc_msgSend(v23, "isUserInteractionEnabled") & 1) != 0)
      {
        v17 = (id)objc_msgSend(v23, "_accessibilityIndexPath");
        v16 = 1;
        v11 = v17 != 0;
      }
    }
    if ((v16 & 1) != 0)

    v18 = v11;
    v15 = 0;
    v9 = 0;
    if (v24)
    {
      v9 = 0;
      if ((v22 & 1) != 0)
      {
        v8 = 1;
        if (v23)
          v8 = v18;
        v9 = v8;
      }
    }
    v15 = v9;
    if ((v9 & 1) == 0)
    {
      v14 = 0;
      objc_opt_class();
      v13 = (id)__UIAccessibilityCastAsSafeCategory();
      v12 = v13;
      objc_storeStrong(&v13, 0);
      v6 = v23;
      v7 = (id)-[UICollectionViewAccessibility visibleCells](v27, "visibleCells");
      v2 = -[UIViewAccessibility _accessibilityViewMatchingFKAView:inArray:]((uint64_t)v12, v6, v7);
      v3 = v24;
      v24 = v2;

      -[UICollectionViewAccessibility _axSetLastFocusedChild:](v27, "_axSetLastFocusedChild:", v24);
      v15 = v24 != 0;
    }
    if (v15)
      objc_storeStrong(v26, v24);
    else
      -[UICollectionViewAccessibility _axSetLastFocusedChild:](v27, "_axSetLastFocusedChild:", 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  v5 = v26[0];
  objc_storeStrong(v26, 0);
  return v5;
}

uint64_t __53__UICollectionViewAccessibility_preferredFocusedView__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (uint64_t)_axGetShouldIgnorePromiseRegions
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetShouldIgnorePromiseRegions:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (id)_fulfillPromisedFocusRegionForCell:(id)a3
{
  objc_super v4;
  int v5;
  id location[2];
  UICollectionViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[UICollectionViewAccessibility _accessibilityIsFKARunningForFocusItem](v7, "_accessibilityIsFKARunningForFocusItem") & 1) != 0&& (-[UICollectionViewAccessibility _axGetShouldIgnorePromiseRegions]((uint64_t)v7) & 1) != 0)
  {
    v8 = 0;
    v5 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UICollectionViewAccessibility;
    v8 = -[UICollectionViewAccessibility _fulfillPromisedFocusRegionForCell:](&v4, sel__fulfillPromisedFocusRegionForCell_, location[0]);
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4
{
  char v5;
  objc_super v7;
  char v8;
  BOOL v9;
  id location[2];
  UICollectionViewAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UICollectionViewAccessibility;
  v8 = -[UICollectionViewAccessibility _shouldSelectionFollowFocusForIndexPath:initiatedBySelection:](&v7, sel__shouldSelectionFollowFocusForIndexPath_initiatedBySelection_, location[0], a4);
  if ((-[UICollectionViewAccessibility _accessibilityIsFKARunningForFocusItem](v11, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v8 = 0;
  v5 = v8;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  id v5;
  int v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  SEL v10;
  UICollectionViewAccessibility *v11;
  id v12;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = (id)-[UICollectionViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 52);
  if (v7)
  {
    v12 = objc_retainAutoreleasedReturnValue((id)(*((uint64_t (**)(id, unint64_t, unint64_t))v7
                                                  + 2))(v7, v9, v8));
    v6 = 1;
  }
  else
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v9, v8);
    v12 = -[UICollectionViewAccessibility accessibilityCellForRowAtIndexPath:](v11, "accessibilityCellForRowAtIndexPath:", v5);
    v6 = 1;
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v7, 0);
  return v12;
}

- (id)_accessibilitySelectedChildren
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id (*v8)(id *, void *);
  void *v9;
  UICollectionViewAccessibility *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  id (*v15)(id *, void *);
  void *v16;
  UICollectionViewAccessibility *v17;
  id v18[2];
  UICollectionViewAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = (id)-[UICollectionViewAccessibility indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
  if (-[UICollectionViewAccessibility _accessibilityShouldUseCollectionViewCellAccessibilityElements](v19, "_accessibilityShouldUseCollectionViewCellAccessibilityElements"))
  {
    v4 = v18[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke;
    v16 = &unk_24FF3E938;
    v17 = v19;
    v20 = (id)objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &v12);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v3 = v18[0];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke_2;
    v9 = &unk_24FF3E938;
    v10 = v19;
    v20 = (id)objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &v5);
    objc_storeStrong((id *)&v10, 0);
  }
  v11 = 1;
  objc_storeStrong(v18, 0);
  return v20;
}

id __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "accessibilityCollectionCellElementForIndexPath:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

id __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke_2(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "accessibilityCellForRowAtIndexPath:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  os_log_t v18;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v21;
  char v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  int64_t v36;
  SEL v37;
  UICollectionViewAccessibility *v38;
  uint8_t v39[32];
  uint8_t v40[24];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v38 = self;
  v37 = a2;
  v36 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v34 = 0;
  v33 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
  if (location)
  {
    v32 = -[UICollectionViewAccessibility _accessibilitySortedElementsWithin](v38, "_accessibilitySortedElementsWithin");
    v31 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = 0;
    memset(__b, 0, sizeof(__b));
    obj = v32;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
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
        v29 = *(id *)(__b[1] + 8 * v14);
        v27 = (id)objc_msgSend(v29, "_accessibilityLeafDescendantsWithOptions:", v33);
        objc_msgSend(v31, "addObjectsFromArray:", v27);
        if (v29 == location)
          objc_storeStrong(&v30, v27);
        objc_storeStrong(&v27, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
          if (!v15)
            break;
        }
      }
    }

    v26 = 0;
    if (v30)
    {
      v24 = 0;
      v22 = 0;
      if (v36 == 1)
      {
        v25 = (id)objc_msgSend(v30, "lastObject");
        v24 = 1;
        objc_storeStrong(&v26, v25);
      }
      else
      {
        v23 = (id)objc_msgSend(v30, "firstObject");
        v22 = 1;
        objc_storeStrong(&v26, v23);
      }
      if ((v22 & 1) != 0)

      if ((v24 & 1) != 0)
    }
    else
    {
      objc_storeStrong(&v26, location);
    }
    v21 = objc_msgSend(v31, "indexOfObject:", v26);
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _AXAssert();
      v18 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v39, (uint64_t)location, (uint64_t)v31);
        _os_log_debug_impl(&dword_230C4A000, v18, OS_LOG_TYPE_DEBUG, "Could not find child element %@ in collection view elements %@. Falling through to existing search code.", v39, 0x16u);
      }
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      v6 = -[UICollectionViewAccessibility _axOpaqueHeaderElementInDirection:withinElements:startIndex:](v38, "_axOpaqueHeaderElementInDirection:withinElements:startIndex:", v36, v31, v21);
      v7 = v34;
      v34 = v6;

      oslog = (os_log_t)(id)AXLogOpaqueElements();
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v34);
        _os_log_debug_impl(&dword_230C4A000, oslog, type, "Header from existing sorted elements within: %@", v40, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (!v34)
      {
        v8 = -[UICollectionViewAccessibility _axOffScreenOpaqueHeaderElementInDirection:options:childElement:](v38, "_axOffScreenOpaqueHeaderElementInDirection:options:childElement:", v36, v33, location);
        v9 = v34;
        v34 = v8;

      }
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    v4 = -[UICollectionViewAccessibility _axFirstLastOpaqueHeaderElementInDirection:options:](v38, "_axFirstLastOpaqueHeaderElementInDirection:options:", v36, v33);
    v5 = v34;
    v34 = v4;

  }
  v11 = v34;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

- (id)_axOffScreenOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4 childElement:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  NSObject *log;
  os_log_type_t type;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v22;
  id v23;
  os_log_t oslog;
  uint8_t v25[15];
  char v26;
  id v27;
  uint64_t j;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  id v37;
  id v38;
  id v39;
  id location;
  int64_t v41;
  SEL v42;
  UICollectionViewAccessibility *v43;
  uint8_t v44[16];
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v43 = self;
  v42 = a2;
  v41 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v39 = 0;
  objc_storeStrong(&v39, a5);
  v38 = 0;
  v37 = v43;
  objc_msgSend(v37, "contentOffset");
  *(_QWORD *)&v36 = v5;
  *((_QWORD *)&v36 + 1) = v6;
  v35 = (id)objc_msgSend(v37, "indexPathsForVisibleItems");
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("section"), 1);
  v45[0] = v34;
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
  v22 = (id)objc_msgSend(v35, "sortedArrayUsingDescriptors:");
  v33 = (id)objc_msgSend(v22, "mutableCopy");

  if (objc_msgSend(v35, "count"))
  {
    if (v41 == 1)
    {
      v19 = (id)objc_msgSend(v33, "lastObject");
      v20 = objc_msgSend(v19, "section") + 1;

      v32 = v20;
      v31 = objc_msgSend(v37, "numberOfSections");
      for (i = v20; i < v31; ++i)
      {
        v7 = -[UICollectionViewAccessibility _axFirstLastOpaqueHeaderElementFromSection:options:direction:](v43, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", i, location, v41);
        v8 = v38;
        v38 = v7;

        if (v38)
          break;
      }
    }
    else
    {
      v17 = (id)objc_msgSend(v33, "firstObject");
      v18 = objc_msgSend(v17, "section");

      v29 = v18;
      for (j = v18; j >= 0; --j)
      {
        v9 = -[UICollectionViewAccessibility _axFirstLastOpaqueHeaderElementFromSection:options:direction:](v43, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", j, location, v41);
        v10 = v38;
        v38 = v9;

        if ((objc_msgSend(v38, "_accessibilityIsDescendantOfElement:", v39) & 1) != 0)
          objc_storeStrong(&v38, 0);
        if (v38)
          break;
      }
    }
  }
  else
  {
    v27 = (id)AXLogOpaqueElements();
    v26 = 2;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      log = v27;
      type = v26;
      __os_log_helper_16_0_0(v25);
      _os_log_debug_impl(&dword_230C4A000, log, type, "Got a collection view with no visible index paths! Falling back to usual opaque element search logic.", v25, 2u);
    }
    objc_storeStrong(&v27, 0);
  }
  if (!v38)
  {
    oslog = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v39);
      _os_log_debug_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_DEBUG, "No headers found after %@.", v44, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(v37, "setContentOffset:", v36);
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = v38;
    v38 = v11;

  }
  v14 = v38;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5
{
  id v5;
  uint64_t v6;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v16;
  uint64_t *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  int64_t v32;
  id location;
  int64_t v34;
  SEL v35;
  UICollectionViewAccessibility *v36;
  CGRect v37;

  v36 = self;
  v35 = a2;
  v34 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v32 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 838860800;
  v28 = 48;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  v24 = v36;
  v23 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v34);
  v22 = -[UICollectionViewAccessibility _accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:](v36, "_accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:", v23);
  objc_msgSend(v22, "frame");
  *(CGFloat *)&v9 = v37.origin.x;
  *((_QWORD *)&v9 + 1) = *(_QWORD *)&v37.origin.y;
  *(CGFloat *)&v10 = v37.size.width;
  *((_QWORD *)&v10 + 1) = *(_QWORD *)&v37.size.height;
  v20 = v9;
  v21 = v10;
  if (!CGRectIsEmpty(v37))
  {
    if (objc_msgSend(v24, "numberOfItemsInSection:", v34) > 0)
      objc_msgSend(v24, "scrollToItemAtIndexPath:atScrollPosition:animated:", v23, 0, 0);
    objc_msgSend(v24, "layoutIfNeeded");
    v19 = -[UICollectionViewAccessibility _accessibilitySupplementaryHeaderViewAtIndexPath:](v36, "_accessibilitySupplementaryHeaderViewAtIndexPath:", v23);
    v5 = (id)objc_msgSend(v19, "_accessibilityLeafDescendantsWithOptions:", location);
    v18 = v5;
    if (v32 == 2)
      v6 = 2;
    else
      v6 = 0;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __94__UICollectionViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke;
    v16 = &unk_24FF3E960;
    v17 = &v25;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", v6, &v12);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  v8 = (id)v26[5];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

void __94__UICollectionViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = objc_msgSend(location[0], "accessibilityTraits");
  if ((v4 & *MEMORY[0x24BDF73C0]) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_axOpaqueHeaderElementInDirection:(int64_t)a3 withinElements:(id)a4 startIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v10;
  uint64_t j;
  int v12;
  id obj;
  unint64_t i;
  unint64_t v15;
  id v16;
  unint64_t v17;
  id location;
  int64_t v19;
  SEL v20;
  UICollectionViewAccessibility *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v17 = a5;
  v16 = 0;
  if (v19 == 1)
  {
    v15 = objc_msgSend(location, "count");
    for (i = v17 + 1; i < v15; ++i)
    {
      obj = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
      v5 = objc_msgSend(obj, "accessibilityTraits");
      if ((v5 & *MEMORY[0x24BDF73C0]) != 0)
      {
        objc_storeStrong(&v16, obj);
        v12 = 2;
      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong(&obj, 0);
      if (v12)
        break;
    }
  }
  else
  {
    for (j = v17 - 1; j >= 0; --j)
    {
      v10 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
      v6 = objc_msgSend(v10, "accessibilityTraits");
      if ((v6 & *MEMORY[0x24BDF73C0]) != 0)
      {
        objc_storeStrong(&v16, v10);
        v12 = 5;
      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong(&v10, 0);
      if (v12)
        break;
    }
  }
  v8 = v16;
  v12 = 1;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (id)_axFirstLastOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  os_log_t oslog;
  uint64_t j;
  uint64_t i;
  __int128 v17;
  uint64_t v18;
  id v19;
  id v20;
  id location;
  int64_t v22;
  SEL v23;
  UICollectionViewAccessibility *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23 = a2;
  v22 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v20 = 0;
  v19 = v24;
  v18 = objc_msgSend(v19, "numberOfSections");
  objc_msgSend(v19, "contentOffset");
  *(_QWORD *)&v17 = v4;
  *((_QWORD *)&v17 + 1) = v5;
  if (v22 == 1)
  {
    for (i = 0; i < v18; ++i)
    {
      v6 = -[UICollectionViewAccessibility _axFirstLastOpaqueHeaderElementFromSection:options:direction:](v24, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", i, location, v22);
      v7 = v20;
      v20 = v6;

      if (v20)
        break;
    }
  }
  else
  {
    for (j = v18 - 1; j >= 0; --j)
    {
      v8 = -[UICollectionViewAccessibility _axFirstLastOpaqueHeaderElementFromSection:options:direction:](v24, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", j, location, v22);
      v9 = v20;
      v20 = v8;

      if (v20)
        break;
    }
  }
  if (!v20)
  {
    oslog = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v24);
      _os_log_debug_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_DEBUG, "No headers found in %@.", v25, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(v19, "setContentOffset:", v17);
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = v20;
    v20 = v10;

  }
  v13 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
  return v13;
}

@end
