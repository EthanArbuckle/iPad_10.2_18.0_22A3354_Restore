@implementation HUHomeHubSharedUserWarningItemManager

- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeHubSharedUserWarningItemManager.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeHubSharedUserWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 homesToUsersMap:(id)a4
{
  id v6;
  HUHomeHubSharedUserWarningItemManager *v7;
  HUHomeHubSharedUserWarningItemManager *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUHomeHubSharedUserWarningItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v10, sel_initWithDelegate_sourceItem_, a3, 0);
  v8 = v7;
  if (v7)
    -[HUHomeHubSharedUserWarningItemManager setHomesToUsersMap:](v7, "setHomesToUsersMap:", v6);

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HUHomeHubSharedUserWarningItemManager *v16;
  id v17;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUHomeHubSharedUserWarningItemManager homesToUsersMap](self, "homesToUsersMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke;
  v14[3] = &unk_1E6F58808;
  v15 = v5;
  v16 = self;
  v8 = v4;
  v17 = v8;
  v9 = v5;
  objc_msgSend(v7, "na_each:", v14);

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_162);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningItemManager setHomes:](self, "setHomes:", v10);

  v11 = v17;
  v12 = v8;

  return v12;
}

void __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "addObject:", v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(a1[5], "homesToUsersMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_2;
  v10[3] = &unk_1E6F587E0;
  v11 = v3;
  v12 = v4;
  v7 = v4;
  v9 = v3;
  objc_msgSend(v6, "na_each:", v10);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v7);
  objc_msgSend(a1[6], "addObject:", v8);

}

void __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D31988];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithHome:user:nameStyle:", *(_QWORD *)(a1 + 32), v4, 0);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

uint64_t __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uniqueIdentifier");
  }
  else
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  id obj;
  uint64_t v28;
  HUHomeHubSharedUserWarningItemManager *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[HUHomeHubSharedUserWarningItemManager homes](self, "homes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v32)
    {
      v28 = *(_QWORD *)v40;
      v29 = self;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(obj);
          v34 = v4;
          v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
          v6 = (void *)objc_opt_new();
          v7 = objc_alloc(MEMORY[0x1E0D31570]);
          objc_msgSend(v5, "uniqueIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUIDString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v7, "initWithIdentifier:", v9);

          -[HUHomeHubSharedUserWarningItemManager homes](self, "homes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12 >= 2)
          {
            objc_msgSend(v5, "hf_displayName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setHeaderTitle:", v13);

          }
          v33 = v10;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v14 = v31;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v36;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v36 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
                objc_opt_class();
                v20 = v19;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = v20;
                else
                  v21 = 0;
                v22 = v21;

                objc_msgSend(v22, "home");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqual:", v5);

                if (v24)
                  objc_msgSend(v6, "addObject:", v22);

                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v16);
          }

          objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_14_3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setItems:", v25);
          objc_msgSend(v30, "addObject:", v33);

          v4 = v34 + 1;
          self = v29;
        }
        while (v34 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v32);
    }

  }
  else
  {
    v30 = (id)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

uint64_t __74__HUHomeHubSharedUserWarningItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);

  return v9;
}

- (NSMapTable)homesToUsersMap
{
  return self->_homesToUsersMap;
}

- (void)setHomesToUsersMap:(id)a3
{
  objc_storeStrong((id *)&self->_homesToUsersMap, a3);
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_homesToUsersMap, 0);
}

@end
