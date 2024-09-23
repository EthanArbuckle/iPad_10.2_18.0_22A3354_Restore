@implementation CNUIUserActivityRestorer

- (BOOL)restoreUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_INFO, "did receive activity of type %@", (uint8_t *)&v27, 0xCu);

  }
  objc_msgSend(v4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CNUIActivityTypeViewingContact);

  if (v8)
  {
    v9 = -[CNUIUserActivityRestorer restoreViewingContact:](self, "restoreViewingContact:", v4);
  }
  else
  {
    objc_msgSend(v4, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CNUIActivityTypeEditingContact);

    if (v11)
    {
      v9 = -[CNUIUserActivityRestorer restoreEditingContact:](self, "restoreEditingContact:", v4);
    }
    else
    {
      objc_msgSend(v4, "activityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CNUIActivityTypeViewingList);

      if (v13)
      {
        v9 = -[CNUIUserActivityRestorer restoreViewingList:](self, "restoreViewingList:", v4);
      }
      else
      {
        objc_msgSend(v4, "activityType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CNUIActivityTypeViewingGroups);

        if (v15)
        {
          v9 = -[CNUIUserActivityRestorer restoreViewingGroups:](self, "restoreViewingGroups:", v4);
        }
        else
        {
          objc_msgSend(v4, "activityType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNUIUserActivityRestorer activityTypeSpotlightQueryContinuation](self, "activityTypeSpotlightQueryContinuation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            v9 = -[CNUIUserActivityRestorer restoreSpotlightQueryContinuation:](self, "restoreSpotlightQueryContinuation:", v4);
          }
          else
          {
            objc_msgSend(v4, "activityType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUIUserActivityRestorer activityTypeSpotlightSearchableItem](self, "activityTypeSpotlightSearchableItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if (v21)
            {
              v9 = -[CNUIUserActivityRestorer restoreSpotlightSearchableItem:](self, "restoreSpotlightSearchableItem:", v4);
            }
            else
            {
              objc_msgSend(v4, "activityType");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNUIUserActivityRestorer activityTypeCreateContactIntent](self, "activityTypeCreateContactIntent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v22, "isEqualToString:", v23);

              if (!v24)
              {
                v25 = 0;
                goto LABEL_18;
              }
              v9 = -[CNUIUserActivityRestorer restoreCreateContactIntent:](self, "restoreCreateContactIntent:", v4);
            }
          }
        }
      }
    }
  }
  v25 = v9;
LABEL_18:

  return v25;
}

- (BOOL)restoreViewingContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userActivityRestorer:keysToFetchWhenRestoringViewContactActivity:", self, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  -[CNUIUserActivityRestorer contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactWithUserActivityUserInfo:keysToFetch:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1DD140000, v13, OS_LOG_TYPE_INFO, "activity continuity - continuing with viewing contact %@ (%@)", (uint8_t *)&v18, 0x16u);

  }
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userActivityRestorer:restoreViewContact:activity:", self, v12, v4);

  return v16;
}

- (CNUIUserActivityRestorerDelegate)delegate
{
  return (CNUIUserActivityRestorerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (OS_os_log)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_17);
  return (OS_os_log *)(id)log_cn_once_object_1;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSSet)restorableActivityTypes
{
  return self->_restorableActivityTypes;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __31__CNUIUserActivityRestorer_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("contactsui", "activity");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

- (CNUIUserActivityRestorer)initWithContactStore:(id)a3
{
  id v5;
  CNUIUserActivityRestorer *v6;
  CNUIUserActivityRestorer *v7;
  objc_class *v8;
  uint64_t v9;
  NSString *activityTypeCreateContactIntent;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *restorableActivityTypes;
  CNUIUserActivityRestorer *v22;
  objc_super v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[8];

  v29[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNUIUserActivityRestorer;
  v6 = -[CNUIUserActivityRestorer init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    activityTypeCreateContactIntent = v7->_activityTypeCreateContactIntent;
    v7->_activityTypeCreateContactIntent = (NSString *)v9;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v11 = (id *)getCSQueryContinuationActionTypeSymbolLoc_ptr;
    v28 = getCSQueryContinuationActionTypeSymbolLoc_ptr;
    if (!getCSQueryContinuationActionTypeSymbolLoc_ptr)
    {
      v12 = (void *)CoreSpotlightLibrary();
      v11 = (id *)dlsym(v12, "CSQueryContinuationActionType");
      v26[3] = (uint64_t)v11;
      getCSQueryContinuationActionTypeSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v25, 8);
    if (!v11)
      goto LABEL_10;
    objc_storeStrong((id *)&v7->_activityTypeSpotlightQueryContinuation, *v11);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v13 = (id *)getCSSearchableItemActionTypeSymbolLoc_ptr;
    v28 = getCSSearchableItemActionTypeSymbolLoc_ptr;
    if (!getCSSearchableItemActionTypeSymbolLoc_ptr)
    {
      v14 = (void *)CoreSpotlightLibrary();
      v13 = (id *)dlsym(v14, "CSSearchableItemActionType");
      v26[3] = (uint64_t)v13;
      getCSSearchableItemActionTypeSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v25, 8);
    if (!v13)
    {
LABEL_10:
      -[CNUIUserActivityRestorer initWithContactStore:].cold.1();
      __break(1u);
    }
    objc_storeStrong((id *)&v7->_activityTypeSpotlightSearchableItem, *v13);
    v15 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = CNUIActivityTypeViewingContact;
    v29[1] = CNUIActivityTypeEditingContact;
    v29[2] = CNUIActivityTypeViewingList;
    v29[3] = CNUIActivityTypeViewingGroups;
    -[CNUIUserActivityRestorer activityTypeSpotlightQueryContinuation](v7, "activityTypeSpotlightQueryContinuation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v16;
    -[CNUIUserActivityRestorer activityTypeSpotlightSearchableItem](v7, "activityTypeSpotlightSearchableItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v17;
    -[CNUIUserActivityRestorer activityTypeCreateContactIntent](v7, "activityTypeCreateContactIntent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[6] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    restorableActivityTypes = v7->_restorableActivityTypes;
    v7->_restorableActivityTypes = (NSSet *)v20;

    v22 = v7;
  }

  return v7;
}

- (NSString)activityTypeSpotlightSearchableItem
{
  return self->_activityTypeSpotlightSearchableItem;
}

- (NSString)activityTypeSpotlightQueryContinuation
{
  return self->_activityTypeSpotlightQueryContinuation;
}

- (NSString)activityTypeCreateContactIntent
{
  return self->_activityTypeCreateContactIntent;
}

- (BOOL)shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:(id)a3
{
  id v4;
  char v5;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CNUIActivityTypeViewingContact) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CNUIActivityTypeEditingContact) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CNUIActivityTypeViewingList) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CNUIActivityTypeViewingGroups) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CNUIUserActivityRestorer activityTypeSpotlightSearchableItem](self, "activityTypeSpotlightSearchableItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v7);

  }
  return v5;
}

- (BOOL)restoreEditingContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userActivityRestorer:keysToFetchWhenRestoringEditContactContactActivity:", self, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  -[CNUIUserActivityRestorer contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactWithUserActivityUserInfo:keysToFetch:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1DD140000, v13, OS_LOG_TYPE_INFO, "activity continuity - continuing with editing contact %@ (%@)", (uint8_t *)&v18, 0x16u);

  }
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userActivityRestorer:restoreEditContact:activity:", self, v12, v4);

  return v16;
}

- (BOOL)restoreViewingList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CNUIActivityUserInformationListTopContactKey);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CNUIActivityUserInformationDisplayedContactKey);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CNUIActivityUserInformationSearchStringKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CNUIActivityUserInformationIsShowingGroupsKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v40[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userActivityRestorer:keysToFetchWhenRestoringViewContactActivity:", self, v4);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  -[CNUIUserActivityRestorer contactStore](self, "contactStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  objc_msgSend(v18, "contactWithUserActivityUserInfo:keysToFetch:", v6, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIUserActivityRestorer contactStore](self, "contactStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contactWithUserActivityUserInfo:keysToFetch:", v29, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v19, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    v32 = 2112;
    v33 = v23;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v24;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1DD140000, v22, OS_LOG_TYPE_INFO, "activity continuity - continuing with top of list contact %@ (%@) viewing contact %@ (%@) with search String %@", buf, 0x34u);

  }
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userActivityRestorer:restoreViewListAtContact:displayedContact:searchString:isShowingGroups:activity:", self, v19, v21, v9, v12, v4);

  return v26;
}

- (BOOL)restoreViewingGroups:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_INFO, "activity continuity - continuing viewing groups", v9, 2u);
  }

  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userActivityRestorer:restoreViewGroupsWithActivity:", self, v4);

  return v7;
}

- (BOOL)restoreSpotlightQueryContinuation:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v14 = 0;
  *((_QWORD *)&v14 + 1) = &v14;
  v15 = 0x2020000000;
  v6 = (id *)getCSSearchQueryStringSymbolLoc_ptr;
  v16 = getCSSearchQueryStringSymbolLoc_ptr;
  if (!getCSSearchQueryStringSymbolLoc_ptr)
  {
    v7 = (void *)CoreSpotlightLibrary();
    v6 = (id *)dlsym(v7, "CSSearchQueryString");
    *(_QWORD *)(*((_QWORD *)&v14 + 1) + 24) = v6;
    getCSSearchQueryStringSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v14, 8);
  if (!v6)
  {
    -[CNUIUserActivityRestorer initWithContactStore:].cold.1();
    __break(1u);
  }
  v8 = *v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", v8, (_QWORD)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v14) = 138412290;
    *(_QWORD *)((char *)&v14 + 4) = v9;
    _os_log_impl(&dword_1DD140000, v10, OS_LOG_TYPE_INFO, "activity continuity - continuing with spotlight query: %@", (uint8_t *)&v14, 0xCu);
  }

  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userActivityRestorer:restoreSearch:activity:", self, v9, v4);

  return v12;
}

- (BOOL)restoreSpotlightSearchableItem:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  id v22;
  uint64_t v23;
  _BYTE buf[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = (id *)getCSSearchableItemActivityIdentifierSymbolLoc_ptr;
  v25 = getCSSearchableItemActivityIdentifierSymbolLoc_ptr;
  if (!getCSSearchableItemActivityIdentifierSymbolLoc_ptr)
  {
    v7 = (void *)CoreSpotlightLibrary();
    v6 = (id *)dlsym(v7, "CSSearchableItemActivityIdentifier");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    getCSSearchableItemActivityIdentifierSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    -[CNUIUserActivityRestorer initWithContactStore:].cold.1();
    __break(1u);
  }
  v8 = *v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActivityRestorer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userActivityRestorer:keysToFetchWhenRestoringViewContactActivity:", self, v4);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  -[CNUIUserActivityRestorer contactStore](self, "contactStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v15, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v10, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;

  objc_msgSend((id)objc_opt_class(), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CNUIUserActivityRestorer restoreSpotlightSearchableItem:].cold.2((uint64_t)v9, (uint64_t)v17, v19);
    v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1DD140000, v19, OS_LOG_TYPE_INFO, "activity continuity - continuing with spotlight searchable contact %@ (%@)", buf, 0x16u);
    }

    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = -[NSObject userActivityRestorer:restoreViewContact:activity:](v19, "userActivityRestorer:restoreViewContact:activity:", self, v16, v4);
  }

  return v20;
}

- (BOOL)restoreCreateContactIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint8_t v12[16];

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DD140000, v8, OS_LOG_TYPE_INFO, "activity continuity - continuing with create contact", v12, 2u);
    }

    -[CNUIUserActivityRestorer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userActivityRestorer:restoreCreateContact:activity:", self, 0, v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeSpotlightSearchableItem, 0);
  objc_storeStrong((id *)&self->_activityTypeSpotlightQueryContinuation, 0);
  objc_storeStrong((id *)&self->_activityTypeCreateContactIntent, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_restorableActivityTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)initWithContactStore:.cold.1()
{
  int v0;
  int v1;
  os_log_t v2;

  dlerror();
  v0 = abort_report_np();
  return -[CNUIUserActivityRestorer restoreSpotlightSearchableItem:].cold.2(v0, v1, v2);
}

- (void)restoreSpotlightSearchableItem:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DD140000, log, OS_LOG_TYPE_ERROR, "activity continuity - failed to continue with spotlight searchable contact (%@), error: %@", (uint8_t *)&v3, 0x16u);
}

@end
