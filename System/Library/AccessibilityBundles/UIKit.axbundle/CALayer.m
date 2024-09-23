@implementation CALayer

uint64_t __53__CALayer_UIFocusConformance__parentFocusEnvironment__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "conformsToProtocol:", &unk_255EAA568);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __80__CALayer_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id v3;
  char v4;
  char v5;
  id v6;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "nextFocusedItem");
  v5 = 0;
  v4 = 0;
  if (v3 == *(id *)(a1 + 40))
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "_accessibilityParentView");
    v5 = 1;
    v4 = objc_msgSend(v6, "_accessibilityIsFKARunningForFocusItem");
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
    return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__CALayer_UIFocusConformance__focusItemsInRect___block_invoke(id *a1, void *a2, void *a3)
{
  char v4;
  char v7;
  id v8;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v7 = 0;
  if ((objc_msgSend(location[0], "conformsToProtocol:", &unk_255EAA8A0) & 1) != 0)
  {
    objc_opt_class();
    v4 = 1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(a1[4], "_accessibilityFKAShouldIncludeViewsAsElements");
    v7 = v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

@end
