@implementation MUPlaceMoreActionsViewModel

- (id)symbolName
{
  return CFSTR("ellipsis");
}

- (id)titleText
{
  return _MULocalizedStringFromThisBundle(CFSTR("More [Place card]"));
}

- (MUPlaceMoreActionsViewModel)initWithGroupedExternalActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5 menuActionProvider:(id)a6 amsResultProvider:(id)a7 iconCache:(id)a8 externalActionHandler:(id)a9 analyticsHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MUPlaceMoreActionsViewModel *v22;
  MUPlaceMoreActionsViewModel *v23;
  uint64_t v24;
  NSArray *promotedSystemActionTypes;
  uint64_t v26;
  NSArray *excludedSystemActionTypes;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  MUGroupedExternalActionController *v37;
  MUPlaceExternalActionMenuHelper *v38;
  uint64_t v39;
  NSArray *externalActionMenuHelpers;
  MUPlaceMoreActionsViewModel *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v47 = a7;
  v46 = a8;
  v20 = a9;
  v21 = a10;
  v52.receiver = self;
  v52.super_class = (Class)MUPlaceMoreActionsViewModel;
  v22 = -[MUActionRowItemViewModel init](&v52, sel_init);
  v23 = v22;
  if (v22)
  {
    v43 = v19;
    objc_storeWeak((id *)&v22->_menuProvider, v19);
    v44 = v17;
    v24 = objc_msgSend(v17, "copy");
    promotedSystemActionTypes = v23->_promotedSystemActionTypes;
    v23->_promotedSystemActionTypes = (NSArray *)v24;

    v26 = objc_msgSend(v18, "copy");
    excludedSystemActionTypes = v23->_excludedSystemActionTypes;
    v42 = v23;
    v23->_excludedSystemActionTypes = (NSArray *)v26;

    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = v16;
    v30 = v28;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v45 = v29;
    v31 = v29;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v49 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v36, "possiblyHasSupportedIntegrations", v42))
          {
            v37 = -[MUGroupedExternalActionController initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:]([MUGroupedExternalActionController alloc], "initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:", v36, v47, 1, v20, v21);
            -[MUGroupedExternalActionController setMultipleVendorAnalyticsTarget:](v37, "setMultipleVendorAnalyticsTarget:", 56);
            -[MUGroupedExternalActionController setSingleVendorAnalyticsTarget:](v37, "setSingleVendorAnalyticsTarget:", 30);
            -[MUGroupedExternalActionController setAnalyticsModuleType:](v37, "setAnalyticsModuleType:", 4);
            -[MUGroupedExternalActionController setSource:](v37, "setSource:", 10);
            v38 = -[MUPlaceExternalActionMenuHelper initWithExternalActionController:iconCache:]([MUPlaceExternalActionMenuHelper alloc], "initWithExternalActionController:iconCache:", v37, v46);
            -[MUPlaceExternalActionMenuHelper setIsQuickAction:](v38, "setIsQuickAction:", 1);
            objc_msgSend(v30, "addObject:", v38);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v33);
    }

    v39 = objc_msgSend(v30, "copy");
    v23 = v42;
    externalActionMenuHelpers = v42->_externalActionMenuHelpers;
    v42->_externalActionMenuHelpers = (NSArray *)v39;

    v17 = v44;
    v16 = v45;
    v19 = v43;
  }

  return v23;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  MUPlaceMoreActionsViewModel *v26;
  NSArray *obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = self;
  obj = self->_externalActionMenuHelpers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "actionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "externalAction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "actionProviders");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 == 1)
        {
          objc_msgSend(v9, "buildMenuElementsWithPresentationOptions:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObjectsFromArray:", v14);
        }
        else
        {
          objc_msgSend(v9, "symbolName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:shape:fill:", v14, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v16 = (void *)MEMORY[0x1E0DC39D0];
          objc_msgSend(v9, "actionName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "actionName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "buildMenuElementsWithPresentationOptions:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", v17, v15, v18, 0, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "addObject:", v20);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)&v26->_menuProvider);
  objc_msgSend(WeakRetained, "createHeaderButtonsMenuWithPromotedSystemActionTypes:excludedSystemActionTypes:presentationOptions:", v26->_promotedSystemActionTypes, v26->_excludedSystemActionTypes, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "children");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v23);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E2E05448, 0, CFSTR("Parent"), 1, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("More"));
}

- (id)analyticsButtonValues
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceMoreActionsViewModel _allExternalActionMenuRevealButtons](self, "_allExternalActionMenuRevealButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v4);
  MUMap(self->_promotedSystemActionTypes, &__block_literal_global_22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "setIsGroup:", 1, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v6, "copy");
  return v11;
}

uint64_t __52__MUPlaceMoreActionsViewModel_analyticsButtonValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0D27458], "moduleButtonForType:", MURevealedButtonModuleTypeForActionType(objc_msgSend(a2, "integerValue")));
}

- (id)_allExternalActionMenuRevealButtons
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_externalActionMenuHelpers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "actionController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "externalAction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MUExternalActionRevealedAnalyticsModuleButtonsForAction(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v11, "count") >= 2)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16++), "setIsGroup:", 1);
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v14);
          }

        }
        objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v11);

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedSystemActionTypes, 0);
  objc_storeStrong((id *)&self->_promotedSystemActionTypes, 0);
  objc_storeStrong((id *)&self->_menuElement, 0);
  objc_storeStrong((id *)&self->_externalActionMenuHelpers, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
}

@end
