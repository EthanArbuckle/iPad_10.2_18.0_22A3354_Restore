@implementation BaseCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.BaseCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHeaderElements
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)BaseCollectionViewAccessibility;
  -[BaseCollectionViewAccessibility accessibilityHeaderElements](&v22, sel_accessibilityHeaderElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    v5 = MEMORY[0x2349244BC](CFSTR("VideosUI.CollectionHeaderView"));
    -[BaseCollectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("subviews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __62__BaseCollectionViewAccessibility_accessibilityHeaderElements__block_invoke;
    v21[3] = &__block_descriptor_40_e23_B32__0__UIView_8Q16_B24lu32l8;
    v21[4] = v5;
    objc_msgSend(v7, "ax_filteredArrayUsingBlock:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "_accessibilityLeafDescendantsWithOptions:", v9, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v12);
    }

  }
  return v4;
}

uint64_t __62__BaseCollectionViewAccessibility_accessibilityHeaderElements__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
