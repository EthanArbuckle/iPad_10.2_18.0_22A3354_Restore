@implementation ATXAppDirectoryHierarchyNode

- (ATXAppDirectoryHierarchyNode)initWithCategoryID:(unint64_t)a3
{
  ATXAppDirectoryHierarchyNode *v4;
  ATXAppDirectoryHierarchyNode *v5;
  uint64_t v6;
  NSMutableArray *children;
  uint64_t v8;
  NSMutableArray *appBundleIDs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXAppDirectoryHierarchyNode;
  v4 = -[ATXAppDirectoryHierarchyNode init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_parent, 0);
    v6 = objc_opt_new();
    children = v5->_children;
    v5->_children = (NSMutableArray *)v6;

    v5->_size = 0;
    v5->_enabled = 0;
    v8 = objc_opt_new();
    appBundleIDs = v5->_appBundleIDs;
    v5->_appBundleIDs = (NSMutableArray *)v8;

    v5->_categoryID = a3;
  }
  return v5;
}

- (void)_computeSize
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_size = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_children;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "_computeSize", (_QWORD)v9);
        if ((objc_msgSend(v8, "enabled") & 1) == 0)
          self->_size += objc_msgSend(v8, "size");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->_size += -[NSMutableArray count](self->_appBundleIDs, "count");
}

- (BOOL)_isRoot
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v3 = WeakRetained == 0;

  return v3;
}

- (void)_addAppBundleID:(id)a3
{
  -[NSMutableArray addObject:](self->_appBundleIDs, "addObject:", a3);
}

- (void)_addChild:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setParent:", self);
  -[NSMutableArray addObject:](self->_children, "addObject:", v4);

}

- (void)_displayTree
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "------------------------------------", buf, 2u);
  }

  -[ATXAppDirectoryHierarchyNode _displayTreeWithCurrString:](self, "_displayTreeWithCurrString:", &stru_1E82FDC98);
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "------------------------------------", v5, 2u);
  }

}

- (void)_displayTreeWithCurrString:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_enabled)
      v6 = CFSTR("xx");
    else
      v6 = CFSTR("--");
    objc_msgSend(MEMORY[0x1E0CF8C98], "localizedStringForCategoryID:", self->_categoryID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_appBundleIDs, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_size);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v23 = v6;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@%@%@:%@:%@", buf, 0x34u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_children;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@--"), v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_displayTreeWithCurrString:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)_preorderTraverseWithBlock:(id)a3
{
  void (**v4)(id, ATXAppDirectoryHierarchyNode *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, ATXAppDirectoryHierarchyNode *))a3;
  v4[2](v4, self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ATXAppDirectoryHierarchyNode children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_preorderTraverseWithBlock:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_allNodes
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__62;
  v10 = __Block_byref_object_dispose__62;
  v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ATXAppDirectoryHierarchyNode__allNodes__block_invoke;
  v5[3] = &unk_1E82E5778;
  v5[4] = &v6;
  -[ATXAppDirectoryHierarchyNode _preorderTraverseWithBlock:](self, "_preorderTraverseWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __41__ATXAppDirectoryHierarchyNode__allNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (unint64_t)_enabledNodeCount
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__ATXAppDirectoryHierarchyNode__enabledNodeCount__block_invoke;
  v4[3] = &unk_1E82E5778;
  v4[4] = &v5;
  -[ATXAppDirectoryHierarchyNode _preorderTraverseWithBlock:](self, "_preorderTraverseWithBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__ATXAppDirectoryHierarchyNode__enabledNodeCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "enabled");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)_allAppBundleIDs
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray mutableCopy](self->_appBundleIDs, "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_children;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "enabled", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v9, "_allAppBundleIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_categoryDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__62;
  v13 = __Block_byref_object_dispose__62;
  v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXAppDirectoryHierarchyNode__categoryDictionary__block_invoke;
  v8[3] = &unk_1E82E5778;
  v8[4] = &v9;
  -[ATXAppDirectoryHierarchyNode _preorderTraverseWithBlock:](self, "_preorderTraverseWithBlock:", v8);
  objc_msgSend((id)v10[5], "objectForKeyedSubscript:", &unk_1E83CD378);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)v10[5], "objectForKeyedSubscript:", &unk_1E83CD390);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)v10[5], "objectForKeyedSubscript:", &unk_1E83CD378);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10[5], "setObject:forKeyedSubscript:", v5, &unk_1E83CD3A8);

      objc_msgSend((id)v10[5], "removeObjectForKey:", &unk_1E83CD378);
    }
  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXAppDirectoryHierarchyNode__categoryDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "enabled"))
  {
    objc_msgSend(v6, "_allAppBundleIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

+ (id)lazyGetNodeForCategoryID:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  ATXAppDirectoryHierarchyNode *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[ATXAppDirectoryHierarchyNode initWithCategoryID:]([ATXAppDirectoryHierarchyNode alloc], "initWithCategoryID:", objc_msgSend(v5, "unsignedIntegerValue"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v5);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)effectiveCategoryIDForBundleID:(id)a3 withScreenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!v9
      || (objc_msgSend(MEMORY[0x1E0CF8C98], "isCategory:descendantOfCategory:", objc_msgSend(v9, "integerValue"), objc_msgSend(v10, "integerValue")) & 1) == 0)
    {
      v11 = v10;
LABEL_9:
      v19 = objc_msgSend(v11, "unsignedIntegerValue");
      goto LABEL_10;
    }
LABEL_8:
    v11 = v9;
    goto LABEL_9;
  }
  __atxlog_handle_app_library();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:].cold.2((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

  if (v9)
    goto LABEL_8;
  __atxlog_handle_app_library();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:].cold.1((uint64_t)v7, v21, v22, v23, v24, v25, v26, v27);

  v19 = 1008;
LABEL_10:

  return v19;
}

+ (id)initializeHierarchyForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v17 = objc_msgSend(a1, "effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:", v16, v9, v10);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "lazyGetNodeForCategoryID:inDictionary:", v18, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "_addAppBundleID:", v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

  objc_msgSend(v11, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  while (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeLastObject");
    if (objc_msgSend(v22, "unsignedIntegerValue") != 1008)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v25 = objc_msgSend(MEMORY[0x1E0CF8C98], "parentCategoryForCategory:", objc_msgSend(v22, "integerValue"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "lazyGetNodeForCategoryID:inDictionary:", v26, v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_addChild:", v28);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v29);

      }
    }

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E83CD3C0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)dynamicCategoriesForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  char v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  id obj;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "initializeHierarchyForAppBundleIDs:screenTimeMappings:iTunesMappings:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "setEnabled:", 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v8);
  }

  v11 = objc_msgSend(v5, "_enabledNodeCount");
  v12 = objc_msgSend(v5, "size");
  if ((unint64_t)(((__PAIR128__(v11, v12) - 1) >> 64) + 2) >= 0xE)
    v13 = 14;
  else
    v13 = ((__PAIR128__(v11, v12) - 1) >> 64) + 2;
  objc_msgSend(v5, "_computeSize");
  objc_msgSend(v5, "_displayTree");
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke;
  v61[3] = &unk_1E82E57A0;
  v14 = v5;
  v62 = v14;
  objc_msgSend(v14, "_preorderTraverseWithBlock:", v61);
  objc_msgSend(v14, "_computeSize");
  objc_msgSend(v14, "setEnabled:", objc_msgSend(v14, "size") != 0);
  objc_msgSend(v14, "_displayTree");
  v43 = v14;
  v44 = v13;
  while (objc_msgSend(v14, "_enabledNodeCount") < v13)
  {
    objc_msgSend(v14, "_allNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_135);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (!v17)
    {

      break;
    }
    v18 = v17;
    v19 = *(_QWORD *)v58;
    v42 = 1;
    v45 = *(_QWORD *)v58;
LABEL_15:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v19)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v20);
      if (objc_msgSend(v14, "_enabledNodeCount") > v13)
        break;
      if (objc_msgSend(v21, "enabled"))
      {
        if ((unint64_t)objc_msgSend(v21, "size") > 0xB)
          goto LABEL_29;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v21, "children");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v54 != v26)
                objc_enumerationMutation(v22);
              v28 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "size");
              v25 |= v28 == objc_msgSend(v21, "size");
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
          }
          while (v24);

          v14 = v43;
          v13 = v44;
          v19 = v45;
          if ((v25 & 1) == 0)
            goto LABEL_49;
LABEL_29:
          objc_msgSend(v21, "children");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sortedArrayUsingComparator:", &__block_literal_global_18_2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v22 = v30;
          v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v50;
            while (2)
            {
              for (k = 0; k != v32; ++k)
              {
                if (*(_QWORD *)v50 != v33)
                  objc_enumerationMutation(v22);
                v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
                if ((objc_msgSend(v35, "enabled") & 1) == 0)
                {
                  if (!objc_msgSend(MEMORY[0x1E0CF8C98], "shouldCategoryAlwaysMergeWithParent:", objc_msgSend(v35, "categoryID"))|| (v36 = objc_msgSend(v35, "size"), v36 == objc_msgSend(v21, "size")))
                  {
                    if ((unint64_t)objc_msgSend(v35, "size") >= 6
                      && (v37 = objc_msgSend(v21, "size"), (unint64_t)(v37 - objc_msgSend(v35, "size")) > 5)
                      || (v38 = objc_msgSend(v35, "size"), v38 == objc_msgSend(v21, "size")))
                    {
                      objc_msgSend(v35, "setEnabled:", 1);
                      objc_msgSend(v21, "_computeSize");
                      if (!objc_msgSend(v21, "size"))
                        objc_msgSend(v21, "setEnabled:", 0);
                      v42 = 0;
                      goto LABEL_46;
                    }
                  }
                }
              }
              v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
              if (v32)
                continue;
              break;
            }
LABEL_46:
            v14 = v43;
            v13 = v44;
            v19 = v45;
          }

        }
      }
LABEL_49:
      if (++v20 == v18)
      {
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v18)
          goto LABEL_15;
        break;
      }
    }

    if ((v42 & 1) != 0)
      break;
  }
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_4;
  v47[3] = &unk_1E82E57A0;
  v48 = v14;
  v39 = v14;
  objc_msgSend(v39, "_preorderTraverseWithBlock:", v47);
  objc_msgSend(v39, "_computeSize");
  objc_msgSend(v39, "_displayTree");
  objc_msgSend(v39, "_categoryDictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

void __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  char v6;
  unint64_t v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "enabled");
    v4 = v8;
    if (v5)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CF8C98], "shouldCategoryNeverMergeWithParent:", objc_msgSend(v8, "categoryID"));
      v4 = v8;
      if ((v6 & 1) == 0)
      {
        v7 = objc_msgSend(v8, "size");
        v4 = v8;
        if (v7 <= 3)
        {
          objc_msgSend(v8, "setEnabled:", 0);
          v4 = v8;
        }
      }
    }
  }

}

uint64_t __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "size");
  if (v6 > objc_msgSend(v5, "size"))
  {
LABEL_5:
    v8 = -1;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "size");
  if (v7 >= objc_msgSend(v5, "size"))
  {
    v9 = objc_msgSend(v4, "categoryID");
    if (v9 >= objc_msgSend(v5, "categoryID"))
    {
      v11 = objc_msgSend(v4, "categoryID");
      v8 = v11 > objc_msgSend(v5, "categoryID");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

uint64_t __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "size");
  if (v6 > objc_msgSend(v5, "size"))
  {
LABEL_5:
    v8 = -1;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "size");
  if (v7 >= objc_msgSend(v5, "size"))
  {
    v9 = objc_msgSend(v4, "categoryID");
    if (v9 >= objc_msgSend(v5, "categoryID"))
    {
      v11 = objc_msgSend(v4, "categoryID");
      v8 = v11 > objc_msgSend(v5, "categoryID");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

void __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3 && objc_msgSend(v3, "enabled"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "children", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v10, "enabled") & 1) == 0)
          {
            v11 = objc_msgSend(v10, "size");
            if (v11 == objc_msgSend(v4, "size"))
            {
              objc_msgSend(v4, "setEnabled:", 0);
              objc_msgSend(v10, "setEnabled:", 1);
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (ATXAppDirectoryHierarchyNode)parent
{
  return (ATXAppDirectoryHierarchyNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (unint64_t)categoryID
{
  return self->_categoryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

+ (void)effectiveCategoryIDForBundleID:(uint64_t)a3 withScreenTimeMappings:(uint64_t)a4 iTunesMappings:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "iTunes category missing as well for %@, defaulting to Other", a5, a6, a7, a8, 2u);
}

+ (void)effectiveCategoryIDForBundleID:(uint64_t)a3 withScreenTimeMappings:(uint64_t)a4 iTunesMappings:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Screentime category missing for %@, solely relying on iTunes category", a5, a6, a7, a8, 2u);
}

@end
