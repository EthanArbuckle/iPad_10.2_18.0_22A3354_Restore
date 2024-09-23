@implementation HUCollectionViewController

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v22 = v7;
        v23 = v6;
        v13 = 0;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell", v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 == v8)
            {
              -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "removeObjectForKey:", v16);

              objc_msgSend(v16, "setViewController:", 0);
              v13 = 1;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v12);

        v7 = v22;
        v6 = v23;
        if ((v13 & 1) != 0)
        {
          objc_msgSend(v22, "addToParentViewController:", self);
          -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v8, v22);

          goto LABEL_16;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v7, "addToParentViewController:", self);
      -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v8, v7);

      objc_msgSend(v8, "endAppearanceTransition");
      objc_msgSend(v8, "setEditing:animated:", -[HUCollectionViewController isEditing](self, "isEditing"), 0);
    }
LABEL_16:

  }
}

- (HUCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  HUCollectionViewController *v3;
  uint64_t v4;
  NSMapTable *installedChildViewControllersKeyedByCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCollectionViewController;
  v3 = -[HUCollectionViewController initWithCollectionViewLayout:](&v7, sel_initWithCollectionViewLayout_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    installedChildViewControllersKeyedByCell = v3->_installedChildViewControllersKeyedByCell;
    v3->_installedChildViewControllersKeyedByCell = (NSMapTable *)v4;

  }
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HUCollectionViewController;
  -[HUCollectionViewController setEditing:animated:](&v17, sel_setEditing_animated_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setEditing:animated:", v5, v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUCollectionViewController;
  -[HUCollectionViewController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v23, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "viewController");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v4)
        {
          if (objc_msgSend(v11, "allowSelfSizing"))
          {
            -[HUCollectionViewController collectionView](self, "collectionView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "indexPathForCell:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            -[HUCollectionViewController collectionViewLayout](self, "collectionViewLayout");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));

            v24 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "invalidateItemsAtIndexPaths:", v17);

            -[HUCollectionViewController collectionViewLayout](self, "collectionViewLayout");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "invalidateLayoutWithContext:", v16);

          }
          goto LABEL_13;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  HUCollectionViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentViewController");
    v10 = (HUCollectionViewController *)objc_claimAutoreleasedReturnValue();
    if (v10 == self)
    {
      -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v9)
      {
        objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
        objc_msgSend(v8, "removeFromParentViewController");
        -[HUCollectionViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v8);

        objc_msgSend(v9, "endAppearanceTransition");
      }
    }
    else
    {

    }
    v7 = v14;
  }

}

- (void)didUpdateRequiredHeightForCell:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[HUCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__HUCollectionViewController_didUpdateRequiredHeightForCell___block_invoke;
  v5[3] = &unk_1E6F4D988;
  v5[4] = self;
  objc_msgSend(v4, "performBatchUpdates:completion:", v5, 0);

}

void __61__HUCollectionViewController_didUpdateRequiredHeightForCell___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

- (NSMapTable)installedChildViewControllersKeyedByCell
{
  return self->_installedChildViewControllersKeyedByCell;
}

- (void)setInstalledChildViewControllersKeyedByCell:(id)a3
{
  objc_storeStrong((id *)&self->_installedChildViewControllersKeyedByCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedChildViewControllersKeyedByCell, 0);
}

@end
