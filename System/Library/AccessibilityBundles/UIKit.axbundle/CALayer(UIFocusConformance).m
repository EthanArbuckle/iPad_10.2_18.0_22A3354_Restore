@implementation CALayer(UIFocusConformance)

- (uint64_t)_axAreChildrenFocused
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (uint64_t)_axSetAreChildrenFocused:()UIFocusConformance
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)areChildrenFocused
{
  return objc_msgSend(a1, "_axAreChildrenFocused", a2, a1) & 1;
}

- (uint64_t)setAreChildrenFocused:()UIFocusConformance
{
  return objc_msgSend(a1, "_axSetAreChildrenFocused:", a3 & 1);
}

- (id)preferredFocusEnvironments
{
  return MEMORY[0x24BDBD1A8];
}

- (uint64_t)parentFocusEnvironment
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 0, a2, a1);
}

- (id)focusGroupIdentifier
{
  BOOL v3;
  char v4;
  id v5;
  char v6;
  id v7;
  objc_super v8;
  id location[2];
  id v10;
  id v11;

  v10 = a1;
  location[1] = a2;
  v8.receiver = a1;
  v8.super_class = (Class)CALayer_0;
  location[0] = objc_msgSendSuper2(&v8, sel_focusGroupIdentifier);
  v6 = 0;
  v4 = 0;
  v3 = 0;
  if (!location[0])
  {
    v7 = (id)objc_msgSend(v10, "_accessibilityParentView");
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_containingScrollView"));
    v4 = 1;
    v3 = v5 == 0;
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if (v3)
    v11 = (id)objc_msgSend(v10, "_accessibilityDefaultFocusGroupIdentifier");
  else
    v11 = location[0];
  objc_storeStrong(location, 0);
  return v11;
}

- (void)setNeedsFocusUpdate
{
  id v2[2];
  id v3;

  v3 = a1;
  v2[1] = a2;
  v2[0] = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", a1);
  objc_msgSend(v2[0], "requestFocusUpdateToEnvironment:", v3);
  objc_msgSend(v3, "_updateFocusLayerFrame");
  objc_storeStrong(v2, 0);
}

- (void)updateFocusIfNeeded
{
  id v2[2];
  id v3;

  v3 = a1;
  v2[1] = a2;
  v2[0] = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", a1);
  objc_msgSend(v2[0], "updateFocusIfNeeded");
  objc_msgSend(v3, "_updateFocusLayerFrame");
  objc_storeStrong(v2, 0);
}

- (uint64_t)shouldUpdateFocusInContext:()UIFocusConformance
{
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)didUpdateFocusInContext:()UIFocusConformance withAnimationCoordinator:
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = v13;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __80__CALayer_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = location[0];
  v12 = v15;
  objc_msgSend(v5, "addCoordinatedAnimations:completion:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)_destroyFocusLayer
{
  return objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", a1, a2, a1);
}

- (uint64_t)_updateFocusLayerFrame
{
  return objc_msgSend(MEMORY[0x24BDF6A60], "updateRingForFocusItem:", a1, a2, a1);
}

- (uint64_t)canBecomeFocused
{
  char v2;

  v2 = 0;
  if ((objc_msgSend(a1, "isAccessibilityElement") & 1) != 0)
    v2 = objc_msgSend(a1, "accessibilityRespondsToUserInteraction");
  return v2 & 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v2;
  id v3;
  id v4;

  v3 = (id)objc_msgSend(a1, "_accessibilityParentView");
  v2 = (id)objc_msgSend(v3, "_screen");
  v4 = (id)objc_msgSend(v2, "coordinateSpace");

  return v4;
}

- (id)focusItemsInRect:()UIFocusConformance
{
  id v6;
  id v7;
  id v8;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unint64_t i;
  id obj;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(id *, void *, void *);
  void *v22;
  id v23;
  id v24;
  id v25[2];
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v26 = a1;
  v25[1] = a2;
  v25[0] = 0;
  v24 = (id)objc_msgSend(a1, "accessibilityElements");
  if (v24)
  {
    v13 = v24;
    v12 = (void *)MEMORY[0x24BDD1758];
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __48__CALayer_UIFocusConformance__focusItemsInRect___block_invoke;
    v22 = &unk_24FF3E078;
    v23 = v26;
    v14 = (id)objc_msgSend(v12, "predicateWithBlock:", &v18);
    v6 = (id)objc_msgSend(v13, "filteredArrayUsingPredicate:");
    v7 = v25[0];
    v25[0] = v6;

    objc_storeStrong(&v23, 0);
  }
  else if (objc_msgSend(v26, "accessibilityElementCount") != 0x7FFFFFFFFFFFFFFFLL)
  {
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v26, "accessibilityElementCount"));
    for (i = 0; ; ++i)
    {
      v11 = i;
      if (v11 >= objc_msgSend(v26, "accessibilityElementCount"))
        break;
      v15 = (id)objc_msgSend(v26, "accessibilityElementAtIndex:", i);
      if ((objc_msgSend(v15, "conformsToProtocol:", &unk_255EAA8A0) & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v26, "_accessibilityFKAShouldIncludeViewsAsElements") & 1) != 0)
        {
          objc_msgSend(obj, "axSafelyAddObject:", v15);
        }
      }
      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(v25, obj);
    objc_storeStrong(&obj, 0);
  }
  if (v25[0])
    v8 = v25[0];
  else
    v8 = MEMORY[0x24BDBD1A8];
  v10 = v8;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  return v10;
}

- (uint64_t)_prefersFocusContainment
{
  char v2;

  v2 = 1;
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_255EC4610) & 1) == 0)
  {
    v2 = 1;
    if ((objc_msgSend(a1, "_accessibilityIsTouchContainer") & 1) == 0)
      v2 = objc_msgSend(a1, "shouldGroupAccessibilityChildren");
  }
  return v2 & 1;
}

- (uint64_t)coordinateSpace
{
  return objc_msgSend(a1, "_accessibilityParentView", a2, a1);
}

- (uint64_t)conformsToProtocol:()UIFocusConformance
{
  objc_super v4;
  int v5;
  id location[2];
  void *v7;
  char v8;

  v7 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  if (location[0] == &unk_255EAA8A0
    || location[0] == &unk_255EAA568
    || location[0] == &unk_255EAA9D8
    || location[0] == &unk_255EAAEC8)
  {
    v8 = 1;
    v5 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)CALayer_0;
    v8 = objc_msgSendSuper2(&v4, sel_conformsToProtocol_, location[0]) & 1;
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

@end
