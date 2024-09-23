@implementation TabDocumentManager

+ (TabDocumentManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_57);
  return (TabDocumentManager *)(id)sharedManager_sharedInstance;
}

void __35__TabDocumentManager_sharedManager__block_invoke()
{
  TabDocumentManager *v0;
  void *v1;

  v0 = objc_alloc_init(TabDocumentManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

- (TabDocumentManager)init
{
  TabDocumentManager *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSHashTable *tabs;
  TabDocumentManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TabDocumentManager;
  v2 = -[TabDocumentManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsUnlimitedTabs");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      tabs = v2->_tabs;
      v2->_tabs = (NSHashTable *)v5;

    }
    v7 = v2;
  }

  return v2;
}

- (void)beginSuppressingTabRecycling
{
  ++self->_suppressTabRecycling;
}

- (void)endSuppressingTabRecycling
{
  --self->_suppressTabRecycling;
}

- (void)addTab:(id)a3
{
  -[NSHashTable addObject:](self->_tabs, "addObject:", a3);
}

- (void)removeTab:(id)a3
{
  -[NSHashTable removeObject:](self->_tabs, "removeObject:", a3);
}

- (void)reclaimTabsIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsUnlimitedTabs");

  if (v4 && !self->_suppressTabRecycling)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_doubleForKey:defaultValue:", CFSTR("DebugTabDocumentCapacity"), 1000.0);
    v7 = (uint64_t)v6;

    v8 = v7 >= 1 ? v7 : 0x7FFFFFFFLL;
    v9 = -[NSHashTable count](self->_tabs, "count") - v8;
    if (v9 >= 1)
    {
      -[NSHashTable allObjects](self->_tabs, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "safari_prefixWithMaxLength:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            -[NSHashTable removeObject:](self->_tabs, "removeObject:", v19, (_QWORD)v22);
            objc_msgSend(v19, "browserController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "tabController");
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            -[TabController _hibernateTab:](v21, v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
  }
}

uint64_t __41__TabDocumentManager_reclaimTabsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "lastViewedTime");
  if (v3 == -1.0)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "canHibernate");

  return v4;
}

uint64_t __41__TabDocumentManager_reclaimTabsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "lastViewedTime");
  v7 = v6;
  objc_msgSend(v5, "lastViewedTime");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "lastViewedTime");
    v11 = v10;
    objc_msgSend(v5, "lastViewedTime");
    v9 = v11 != v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabs, 0);
}

@end
