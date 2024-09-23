@implementation _UICollectionViewOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICollectionViewOutlineCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNAccountsAndGroupsViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsViewController"), CFSTR("diffableDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNAccountsAndGroupsItem"));
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("CNAccountsAndGroupsItem"), CFSTR("selected"), CFSTR("isSelected"), 0, "B");

}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _UICollectionViewOutlineCellAccessibility *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  objc_super v28;

  -[_UICollectionViewOutlineCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490B8B0](CFSTR("CNAccountsAndGroupsViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("diffableDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke_198;
    v18 = &unk_2501D80C8;
    v21 = &v22;
    v8 = v7;
    v19 = v8;
    v20 = self;
    AXPerformSafeBlock();
    v9 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("selected"));
    v14.receiver = self;
    v14.super_class = (Class)_UICollectionViewOutlineCellAccessibility;
    v11 = -[_UICollectionViewOutlineCellAccessibility accessibilityTraits](&v14, sel_accessibilityTraits);

    if (v10)
      v12 = *MEMORY[0x24BDF7400] | v11;
    else
      v12 = v11 & ~*MEMORY[0x24BDF7400];

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)_UICollectionViewOutlineCellAccessibility;
    v12 = -[_UICollectionViewOutlineCellAccessibility accessibilityTraits](&v28, sel_accessibilityTraits);
  }

  return v12;
}

@end
