@implementation HUGridFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (HUGridFlowLayout)init
{
  return (HUGridFlowLayout *)-[HUGridFlowLayout initForRTL:](self, "initForRTL:", 0);
}

- (id)initForRTL:(BOOL)a3
{
  HUGridFlowLayout *v3;
  uint64_t v4;
  NSMutableDictionary *indexPathsByItems;
  uint64_t v6;
  NSMutableDictionary *overrideAttributesByIndexPath;
  uint64_t v8;
  NSHashTable *childGridLayouts;
  objc_super v11;

  self->_shouldFlipForRTL = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUGridFlowLayout;
  v3 = -[UICollectionViewFlowLayout init](&v11, sel_init);
  if (v3)
  {
    v4 = objc_opt_new();
    indexPathsByItems = v3->_indexPathsByItems;
    v3->_indexPathsByItems = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    overrideAttributesByIndexPath = v3->_overrideAttributesByIndexPath;
    v3->_overrideAttributesByIndexPath = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    childGridLayouts = v3->_childGridLayouts;
    v3->_childGridLayouts = (NSHashTable *)v8;

  }
  return v3;
}

- (void)setLayoutOptions:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[HUGridLayoutOptions isEqual:](self->_layoutOptions, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[UICollectionViewFlowLayout setScrollDirection:](self, "setScrollDirection:", objc_msgSend(v5, "scrollDirection"));
    objc_msgSend(v5, "rowSpacing");
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:");
    objc_msgSend(v5, "columnSpacing");
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self, "setMinimumInteritemSpacing:");
    objc_msgSend(v5, "sectionLeadingMargin");
    v7 = v6;
    objc_msgSend(v5, "sectionTrailingMargin");
    -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 0.0, v7, 0.0, v8);
    v9 = v5;
    if (objc_msgSend(v9, "columnStyle"))
      v10 = 0;
    else
      v10 = 3;
    v13 = *MEMORY[0x1E0CEB4C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewFlowLayout _setRowAlignmentsOptions:](self, "_setRowAlignmentsOptions:", v12);
    -[HUGridFlowLayout invalidateLayout](self, "invalidateLayout");
  }

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridFlowLayout;
  -[HUGridFlowLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v6, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.8);
  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUGridFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v12, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HUGridFlowLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &unk_1E6F57308;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __54__HUGridFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_modifiedLayoutAttributesForAttributes:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v7, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridFlowLayout _modifiedLayoutAttributesForAttributes:](self, "_modifiedLayoutAttributesForAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidateLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HUGridFlowLayout;
  -[HUGridFlowLayout invalidateLayout](&v12, sel_invalidateLayout);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[HUGridFlowLayout childGridLayouts](self, "childGridLayouts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateLayout");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v3, sel_prepareLayout);
  -[HUGridFlowLayout _updateContainingGridLayout](self, "_updateContainingGridLayout");
}

- (void)applyOverrideAttributes:(id)a3 toItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2544A8))
  {
    objc_msgSend(v8, "homeKitObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v9;
    v16 = v12;
  }
  else
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF254560))
    {
      v14 = v8;
      -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
    }
    else
    {
      -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "latestResults");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
    }
    v15 = v9;
    v16 = v14;
  }
  objc_msgSend(v13, "setObject:forKey:", v15, v16);

  -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, v9);

  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136316162;
    v22 = "-[HUGridFlowLayout applyOverrideAttributes:toItem:atIndexPath:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%s. applied attributes to item %@ at indexPath %@. indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v21, 0x34u);

  }
  -[HUGridFlowLayout invalidateLayout](self, "invalidateLayout");

}

- (void)clearOverrideAttributesForItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136316162;
    v21 = "-[HUGridFlowLayout clearOverrideAttributesForItem:atIndexPath:]";
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s. clearing attributes to item %@ at indexPath %@. Before clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v20, 0x34u);

  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2544A8))
  {
    objc_msgSend(v6, "homeKitObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v12;
  }
  else
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF254560))
    {
      v14 = v6;
      -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
    }
    else
    {
      -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latestResults");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
    }
    v15 = v14;
  }
  objc_msgSend(v13, "removeObjectForKey:", v15);

  -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v7);

  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136316162;
    v21 = "-[HUGridFlowLayout clearOverrideAttributesForItem:atIndexPath:]";
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%s. clearing attributes to item %@ at indexPath %@. After clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v20, 0x34u);

  }
  -[HUGridFlowLayout invalidateLayout](self, "invalidateLayout");

}

- (void)clearAllOverrideAttributesForItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      v52 = 2112;
      v53 = v4;
      v54 = 2112;
      v55 = v8;
      v56 = 2112;
      v57 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s. clearing all attributes for items %@. Before clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", buf, 0x2Au);

    }
    v10 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v39 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF2544A8))
          {
            v17 = v16;
            objc_msgSend(v17, "homeKitObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "uniqueIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v19);
          }
          else if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF254560))
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(v16, "latestResults");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v13);
    }

    v21 = (void *)MEMORY[0x1E0C99E60];
    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "intersectSet:", v24);
    HFLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%s. keyItems = %@", buf, 0x16u);
    }

    v26 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v10, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
          -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKey:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
            objc_msgSend(v26, "addObject:", v34);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v29);
    }

    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    v4 = v39;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      v52 = 2112;
      v53 = v26;
      _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%s. clearing all attributes for items. indexPathsToInvalidate = %@", buf, 0x16u);
    }

    -[HUGridFlowLayout indexPathsByItems](self, "indexPathsByItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeAllObjects");

    -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeAllObjects");

    v38 = objc_alloc_init(MEMORY[0x1E0CEA458]);
    objc_msgSend(v38, "invalidateItemsAtIndexPaths:", v26);
    -[UICollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v38);

  }
}

- (void)_updateContainingGridLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  -[HUGridFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  while (v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_opt_class();
      objc_msgSend(v7, "collectionViewLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        -[HUGridFlowLayout parentGridLayout](self, "parentGridLayout");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
        {
          -[HUGridFlowLayout parentGridLayout](self, "parentGridLayout");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "unregisterChildGridLayout:", self);

          objc_msgSend(v10, "registerChildGridLayout:", self);
        }
      }

    }
    objc_msgSend(v5, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
}

- (void)registerChildGridLayout:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HUGridFlowLayout childGridLayouts](self, "childGridLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v5, "setParentGridLayout:", self);
}

- (void)unregisterChildGridLayout:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HUGridFlowLayout childGridLayouts](self, "childGridLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  objc_msgSend(v5, "setParentGridLayout:", 0);
}

- (id)_modifiedLayoutAttributesForAttributes:(id)a3
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  _OWORD v41[3];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[7];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Layout attributes are of the wrong class: %@"), v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v4, "representedElementCategory"))
  {
    objc_msgSend(v4, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copy");
    -[HUGridFlowLayout overrideAttributesByIndexPath](self, "overrideAttributesByIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "transform");
      v45[0] = *(_OWORD *)((char *)&v45[3] + 8);
      v45[1] = *(_OWORD *)((char *)&v45[4] + 8);
      v45[2] = *(_OWORD *)((char *)&v45[5] + 8);
      objc_msgSend(v5, "setTransform:", v45);
      objc_msgSend(v9, "alpha");
      objc_msgSend(v5, "setAlpha:");
      objc_msgSend(v5, "setZIndex:", objc_msgSend(v9, "zIndex"));
    }
    -[HUGridFlowLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HUGridFlowLayout collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "collectionView:gridLayout:wantsScrollingAdjustmentsForItemAtIndexPath:", v12, self, v7);

      if (v13)
      {
        objc_msgSend(v5, "setZIndex:", -1000);
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "contentOffset");
        v15 = v14;
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contentInset");
        v18 = v15 + v17;
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentOffset");
        v21 = v20;
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "contentInset");
        v24 = v21 + v23;
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_systemContentInset");
        v27 = v24 + v26;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HUGridFlowLayout collectionView](self, "collectionView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "collectionView:gridLayout:alphaForItemAtIndexPath:scrollDistance:", v28, self, v7, v18, v27);
          objc_msgSend(v5, "setAlpha:");

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HUGridFlowLayout collectionView](self, "collectionView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "collectionView:gridLayout:positionOffsetForItemAtIndexPath:scrollDistance:", v29, self, v7, v18, v27);
          v31 = v30;
          v33 = v32;

          objc_msgSend(v5, "center");
          objc_msgSend(v5, "setCenter:", v31 + v34, v33 + v35);
        }
        -[HUGridFlowLayout collectionView](self, "collectionView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_opt_respondsToSelector();

        if ((v38 & 1) != 0)
        {
          -[HUGridFlowLayout collectionView](self, "collectionView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "frame");
          if (v11)
          {
            objc_msgSend(v11, "collectionView:gridLayout:transformForItemAtIndexPath:cellFrame:scrollDistance:offset:", v39, self, v7);
          }
          else
          {
            v43 = 0u;
            v44 = 0u;
            v42 = 0u;
          }
          v41[0] = v42;
          v41[1] = v43;
          v41[2] = v44;
          objc_msgSend(v5, "setTransform:", v41);

        }
      }
    }

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSMutableDictionary)indexPathsByItems
{
  return self->_indexPathsByItems;
}

- (NSMutableDictionary)overrideAttributesByIndexPath
{
  return self->_overrideAttributesByIndexPath;
}

- (NSHashTable)childGridLayouts
{
  return self->_childGridLayouts;
}

- (void)setChildGridLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_childGridLayouts, a3);
}

- (HUGridFlowLayout)parentGridLayout
{
  return (HUGridFlowLayout *)objc_loadWeakRetained((id *)&self->_parentGridLayout);
}

- (void)setParentGridLayout:(id)a3
{
  objc_storeWeak((id *)&self->_parentGridLayout, a3);
}

- (BOOL)shouldFlipForRTL
{
  return self->_shouldFlipForRTL;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentGridLayout);
  objc_storeStrong((id *)&self->_childGridLayouts, 0);
  objc_storeStrong((id *)&self->_overrideAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPathsByItems, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
