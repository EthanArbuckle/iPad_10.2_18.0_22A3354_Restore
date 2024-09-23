@implementation UITableViewCellAccessibility__Memories__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("UICollectionViewControllerWrapperView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("subviews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewControllerWrapperView"), CFSTR("_collectionViewController"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[UITableViewCellAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroTitleCollectionCell"));

  if (v4)
  {
    v23 = 0;
    objc_opt_class();
    -[UITableViewCellAccessibility__Memories__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          MEMORY[0x2348C07D8](CFSTR("UICollectionViewControllerWrapperView"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = 0;
            objc_opt_class();
            objc_msgSend(v12, "safeValueForKey:", CFSTR("_collectionViewController"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              abort();
            objc_msgSend(v15, "collectionView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v16;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            return v17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCellAccessibility__Memories__UIKit;
  -[UITableViewCellAccessibility__Memories__UIKit accessibilityElements](&v18, sel_accessibilityElements);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
