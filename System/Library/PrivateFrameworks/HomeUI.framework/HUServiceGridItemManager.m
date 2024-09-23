@implementation HUServiceGridItemManager

- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_shouldGroupByRoom_shouldShowSectionHeaders_itemProvidersCreator_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceGridItemManager.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceGridItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  return -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:](self, "initWithDelegate:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:", a3, a4, 1, a5);
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 shouldShowSectionHeaders:(BOOL)a5 itemProvidersCreator:(id)a6
{
  return -[HUServiceGridItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:](self, "initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:", a3, 0, a4, a5, a6);
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7
{
  id v12;
  HUServiceGridItemManager *v13;
  HUServiceGridItemManager *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceGridItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v16, sel_initWithDelegate_sourceItem_, a3, a4);
  v14 = v13;
  if (v13)
  {
    -[HUServiceGridItemManager setItemProvidersCreator:](v13, "setItemProvidersCreator:", v12);
    v14->_shouldGroupByRoom = a5;
    v14->_shouldShowSectionHeaders = a6;
  }

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[HUServiceGridItemManager itemProvidersCreator](self, "itemProvidersCreator");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id obj;
  id obja;
  id v48;
  NSMapTable *table;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = (id)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  table = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(id *)v55;
    v11 = 0x1E0D31000uLL;
    obj = *(id *)v55;
    do
    {
      v12 = 0;
      do
      {
        if (*(id *)v55 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v5;
LABEL_13:
          objc_msgSend(v14, "addObject:", v13);
          goto LABEL_14;
        }
        if (!-[HUServiceGridItemManager shouldGroupByRoom](self, "shouldGroupByRoom"))
        {
          v14 = v6;
          goto LABEL_13;
        }
        v15 = v11;
        v16 = v6;
        v17 = v7;
        v18 = v5;
        -[HUServiceGridItemManager _roomForItem:](self, "_roomForItem:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](table, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v20 = (void *)objc_opt_new();
          -[NSMapTable setObject:forKey:](table, "setObject:forKey:", v20, v19);
        }
        objc_msgSend(v20, "addObject:", v13);

        v5 = v18;
        v7 = v17;
        v6 = v16;
        v11 = v15;
        v10 = obj;
LABEL_14:
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUServiceGridActionSetsSectionIdentifier"));
    if (-[HUServiceGridItemManager shouldShowSectionHeaders](self, "shouldShowSectionHeaders"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUGridScenesSectionTitle"), CFSTR("HUGridScenesSectionTitle"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHeaderTitle:", v22);

    }
    else
    {
      objc_msgSend(v21, "setHeaderTitle:", 0);
    }
    objc_msgSend(v21, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _sortedItems:forSectionIdentifier:](self, "_sortedItems:forSectionIdentifier:", v5, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItems:", v24);

    objc_msgSend(v48, "addObject:", v21);
    -[HUServiceGridItemManager setActionSetSectionIndex:](self, "setActionSetSectionIndex:", objc_msgSend(v48, "count") - 1);

  }
  if (-[HUServiceGridItemManager shouldGroupByRoom](self, "shouldGroupByRoom"))
  {
    NSAllMapTableKeys(table);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v45 = v5;
      -[HUServiceGridItemManager _roomComparator](self, "_roomComparator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v25;
      objc_msgSend(v25, "sortedArrayUsingComparator:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      obja = v27;
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v51;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v51 != v30)
              objc_enumerationMutation(obja);
            v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v31);
            v33 = objc_alloc(MEMORY[0x1E0D31570]);
            objc_msgSend(v32, "uniqueIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "UUIDString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v33, "initWithIdentifier:", v35);

            if (-[HUServiceGridItemManager shouldShowSectionHeaders](self, "shouldShowSectionHeaders"))
            {
              objc_msgSend(v32, "name");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setHeaderTitle:", v37);

            }
            else
            {
              objc_msgSend(v36, "setHeaderTitle:", 0);
            }
            -[NSMapTable objectForKey:](table, "objectForKey:", v32);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFItemManager _sortedItems:forSectionIdentifier:](self, "_sortedItems:forSectionIdentifier:", v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setItems:", v40);

            objc_msgSend(v48, "addObject:", v36);
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v29);
      }

      v25 = v44;
      v5 = v45;
    }
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUServiceGridAllServicesSectionIdentifier"));
    objc_msgSend(v25, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _sortedItems:forSectionIdentifier:](self, "_sortedItems:forSectionIdentifier:", v6, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setItems:", v42);

    objc_msgSend(v48, "addObject:", v25);
LABEL_36:

  }
  return v48;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HUServiceGridItemManager;
  -[HFItemManager _itemsToHideInSet:](&v22, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HFItemManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          -[HFItemManager delegate](self, "delegate", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "serviceGridItemManager:shouldHideItem:", self, v14);

          if (v16)
            objc_msgSend(v6, "addObject:", v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  return v6;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return &__block_literal_global_101;
}

uint64_t __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6 || !v7)
    goto LABEL_7;
  objc_msgSend(v6, "matterEndpointID");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matterEndpointID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9 || !v10)
  {

LABEL_7:
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v4, v5);
    goto LABEL_8;
  }
  v12 = objc_msgSend(v9, "compare:", v10);

LABEL_8:
  return v12;
}

id __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EF2AC378))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_roomComparator
{
  void *v2;
  void *v3;

  -[HFItemManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_dashboardSectionReorderableHomeKitObjectComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_roomForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[HFItemManager home](self, "home"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "hf_roomWithIdentifier:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    -[HFItemManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "roomForEntireHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)shouldGroupByRoom
{
  return self->_shouldGroupByRoom;
}

- (void)setShouldGroupByRoom:(BOOL)a3
{
  self->_shouldGroupByRoom = a3;
}

- (BOOL)shouldShowSectionHeaders
{
  return self->_shouldShowSectionHeaders;
}

- (void)setShouldShowSectionHeaders:(BOOL)a3
{
  self->_shouldShowSectionHeaders = a3;
}

- (int64_t)actionSetSectionIndex
{
  return self->_actionSetSectionIndex;
}

- (void)setActionSetSectionIndex:(int64_t)a3
{
  self->_actionSetSectionIndex = a3;
}

- (id)itemProvidersCreator
{
  return self->_itemProvidersCreator;
}

- (void)setItemProvidersCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvidersCreator, 0);
}

@end
