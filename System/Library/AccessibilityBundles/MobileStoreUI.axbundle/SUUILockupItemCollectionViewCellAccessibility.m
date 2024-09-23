@implementation SUUILockupItemCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUILockupItemCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SUUILockupItemCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[SUUILockupItemCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SUUILockupItemCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[SUUILockupItemCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[SUUILockupItemCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupItemCollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v5, "setAccessibilityDelegate:", self);
    objc_msgSend(v4, "addObject:", v5);

  }
  v11.receiver = self;
  v11.super_class = (Class)SUUILockupItemCollectionViewCellAccessibility;
  -[SUUILockupItemCollectionViewCellAccessibility accessibilityElements](&v11, sel_accessibilityElements);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v7;
  v9 = v7;
  if (v6)
  {
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
