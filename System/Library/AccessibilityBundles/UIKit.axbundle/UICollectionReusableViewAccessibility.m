@implementation UICollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionReusableView");
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
  objc_msgSend(location[0], "validateClass:", CFSTR("_UICollectionViewOrthogonalScrollView"));
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, _BYTE *);
  void *v8;
  uint64_t *v9;
  Class v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  Class v20;
  objc_super v21;
  id location[2];
  UICollectionReusableViewAccessibility *v23;

  v23 = self;
  location[1] = (id)a2;
  v21.receiver = self;
  v21.super_class = (Class)UICollectionReusableViewAccessibility;
  location[0] = -[UICollectionReusableViewAccessibility _accessibilityScrollParentForComparingByXAxis](&v21, sel__accessibilityScrollParentForComparingByXAxis);
  v20 = NSClassFromString(CFSTR("_UICollectionViewOrthogonalScrollView"));
  v19 = objc_opt_class();
  if (v20)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 838860800;
    v15 = 48;
    v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    v18 = 0;
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __86__UICollectionReusableViewAccessibility__accessibilityScrollParentForComparingByXAxis__block_invoke;
    v8 = &unk_24FF3E028;
    v10 = v20;
    v9 = &v12;
    v11 = v19;
    -[UICollectionReusableViewAccessibility accessibilityEnumerateAncestorsUsingBlock:](v23, "accessibilityEnumerateAncestorsUsingBlock:", &v4);
    if ((objc_msgSend((id)v13[5], "_accessibilityOnlyComparesByXAxis") & 1) != 0)
      objc_storeStrong(location, (id)v13[5]);
    _Block_object_dispose(&v12, 8);
    objc_storeStrong(&v18, 0);
  }
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

void __86__UICollectionReusableViewAccessibility__accessibilityScrollParentForComparingByXAxis__block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), location[0]);
    *a3 = 1;
  }
  else if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a3 = 1;
  }
  objc_storeStrong(location, 0);
}

@end
