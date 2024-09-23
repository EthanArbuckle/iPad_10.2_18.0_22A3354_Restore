@implementation _TVListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVListViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = (_QWORD *)MEMORY[0x24BE00448];
  v4 = *MEMORY[0x24BE00448];
  v5 = a3;
  objc_msgSend(v5, "client:validateClass:", v4, CFSTR("_TVListViewController"));
  objc_msgSend(v5, "client:validateClass:hasInstanceVariable:withType:", *v3, CFSTR("_TVListViewController"), CFSTR("_collectionElement"), "IKCollectionElement");
  objc_msgSend(v5, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListViewCell"), CFSTR("setSelected:animated:"), "v", "B", "B", 0);
  objc_msgSend(v5, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListViewCell"), CFSTR("floatingView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[_TVListViewCellAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = (id)objc_msgSend(v3, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  MEMORY[0x234921D50](v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_TVListViewCellAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v9, "isAccessibilityElement", (_QWORD)v11))
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_TVListViewCellAccessibility;
  -[_TVListViewCellAccessibility setSelected:animated:](&v7, sel_setSelected_animated_, a3, a4);
  v6 = (_QWORD *)MEMORY[0x24BDF7400];
  if (!v4)
    v6 = (_QWORD *)MEMORY[0x24BDF73E0];
  -[_TVListViewCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *v6);
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  -[_TVListViewCellAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return *MEMORY[0x24BEBB178];
  v5 = *MEMORY[0x24BDF73E0];
  -[_TVListViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 0;
  else
    v7 = *MEMORY[0x24BDF73B0];
  v9.receiver = self;
  v9.super_class = (Class)_TVListViewCellAccessibility;
  return v7 | v5 | -[_TVListViewCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
}

- (id)_accessibilityFrameDelegate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[_TVListViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("floatingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVListViewCellAccessibility;
    -[_TVListViewCellAccessibility _accessibilityFrameDelegate](&v8, sel__accessibilityFrameDelegate);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
