@implementation IKJSTabBar

- (id)asPrivateIKJSTabBar
{
  IKJSTabBar *v3;

  if (-[IKJSTabBar conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01FC410))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSTabBar)initWithAppContext:(id)a3 appTabBar:(id)a4
{
  id v6;
  IKJSTabBar *v7;
  IKJSTabBar *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKJSTabBar;
  v7 = -[IKJSObject initWithAppContext:](&v11, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_appTabBar, v6);
    objc_msgSend(v6, "setJsTabBar:", v8);

  }
  return v8;
}

- (void)setTabs:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  IKJSTabBarItem *v28;
  void *v29;
  IKJSTabBarItem *v30;
  id v31;
  id v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  const __CFString *v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v53 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = CFSTR("identifier");
          objc_msgSend(v8, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v5);
  }

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__29;
  v50 = __Block_byref_object_dispose__29;
  v51 = 0;
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __22__IKJSTabBar_setTabs___block_invoke;
  v43[3] = &unk_1E9F4CF20;
  v45 = &v46;
  v43[4] = self;
  v31 = v4;
  v44 = v31;
  objc_msgSend(v11, "evaluateDelegateBlockSync:", v43);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_tabItems, "count"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = self->_tabItems;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v17, v18);

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    }
    while (v14);
  }

  v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v20 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend((id)v47[5], "count"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = (id)v47[5];
  v21 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v56, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v32);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v12, "objectForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);
        }
        else
        {
          v28 = [IKJSTabBarItem alloc];
          -[IKJSObject appContext](self, "appContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("navigationController"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[IKJSTabBarItem initWithAppContext:identifier:navigationController:owner:](v28, "initWithAppContext:identifier:navigationController:owner:", v27, v25, v29, self);
          objc_msgSend(v20, "addObject:", v30);

        }
      }
      v21 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v56, 16);
    }
    while (v21);
  }

  objc_storeStrong((id *)&self->_tabItems, v20);
  -[IKJSTabBar _onSelectSync](self, "_onSelectSync");

  _Block_object_dispose(&v46, 8);
}

void __22__IKJSTabBar_setTabs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBar:setTabItems:", v3, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSArray)tabs
{
  void *v2;
  void *v3;

  -[IKJSTabBar tabItems](self, "tabItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (IKJSTabBarItem)selectedTab
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  v24 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __25__IKJSTabBar_selectedTab__block_invoke;
  v18[3] = &unk_1E9F4B778;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v18);

  if (v20[5])
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IKJSTabBar tabItems](self, "tabItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v20[5]);

          if (v11)
          {
            v12 = v9;

            v5 = v12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      }
      while (v6);
    }

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return (IKJSTabBarItem *)v5;
}

void __25__IKJSTabBar_selectedTab__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTabItemForTabBar:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setSelectedTab:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  IKJSTabBar *v11;
  id v12;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __29__IKJSTabBar_setSelectedTab___block_invoke;
  v10 = &unk_1E9F4BA30;
  v11 = self;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", &v7);

  -[IKJSTabBar _onSelectSync](self, "_onSelectSync", v7, v8, v9, v10, v11);
}

void __29__IKJSTabBar_setSelectedTab___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBar:setSelectedTabItem:", v3, *(_QWORD *)(a1 + 40));

}

- (id)transientTab
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  v24 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __26__IKJSTabBar_transientTab__block_invoke;
  v18[3] = &unk_1E9F4B778;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v18);

  if (v20[5])
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IKJSTabBar tabItems](self, "tabItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v20[5]);

          if (v11)
          {
            v12 = v9;

            v5 = v12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      }
      while (v6);
    }

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v5;
}

void __26__IKJSTabBar_transientTab__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientTabItemForTabBar:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)onSelect
{
  void *v3;
  _QWORD v4[5];

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__IKJSTabBar_onSelect__block_invoke;
  v4[3] = &unk_1E9F4C1C0;
  v4[4] = self;
  objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

}

id __22__IKJSTabBar_onSelect__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setSelectedTabNavigationDocumentOnJSContext:", a2);
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", CFSTR("onSelect"), 0);
}

- (void)_onSelectSync
{
  void *v3;
  void *v4;
  id v5;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSTabBar _setSelectedTabNavigationDocumentOnJSContext:](self, "_setSelectedTabNavigationDocumentOnJSContext:", v4);

  v5 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onSelect"), 0);
}

- (void)_setSelectedTabNavigationDocumentOnJSContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", CFSTR("selectedTab"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isObject")
    && objc_msgSend(v4, "hasProperty:", CFSTR("navigationDocument")))
  {
    objc_msgSend(v4, "valueForProperty:", CFSTR("navigationDocument"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("navigationDocument"));
  }
  else
  {
    objc_msgSend(v6, "globalObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteProperty:", CFSTR("navigationDocument"));
  }

}

- (IKAppTabBar)appTabBar
{
  return (IKAppTabBar *)objc_loadWeakRetained((id *)&self->_appTabBar);
}

- (NSArray)tabItems
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTabItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabItems, 0);
  objc_destroyWeak((id *)&self->_appTabBar);
}

@end
