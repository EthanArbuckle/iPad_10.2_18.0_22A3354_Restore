@implementation CNContactStoreDataSource

- (void)_reloadWithSchedulingMethod:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  CNScheduler *v7;
  void *v8;
  void *v9;
  CNScheduler *v10;
  CNScheduler *v11;
  _QWORD v12[5];
  CNScheduler *v13;
  uint8_t buf[16];

  CNUILogContactStoreDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Will reload snapshot (asynchronously)", buf, 2u);
    }

    v7 = self->_backgroundSnapshotScheduler;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Will reload snapshot (inline)", buf, 2u);
    }

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultSchedulerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "immediateScheduler");
    v7 = (CNScheduler *)objc_claimAutoreleasedReturnValue();

  }
  v10 = self->_mainThreadScheduler;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke;
  v12[3] = &unk_1E2050400;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[CNScheduler performBlock:](v7, "performBlock:", v12);

}

- (NSArray)contacts
{
  void *v2;
  void *v3;

  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)sections
{
  void *v2;
  void *v3;

  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CNContactStoreSnapshot)currentSnapshot
{
  CNContactStoreSnapshot *currentSnapshot;

  currentSnapshot = self->_currentSnapshot;
  if (!currentSnapshot)
  {
    if (self->_loadingSnapshot)
    {
      currentSnapshot = 0;
    }
    else
    {
      -[CNContactStoreDataSource reload](self, "reload");
      currentSnapshot = self->_currentSnapshot;
    }
  }
  return currentSnapshot;
}

- (NSArray)indexSections
{
  void *v2;
  void *v3;

  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CNContactStore)store
{
  return self->_store;
}

- (int64_t)sortOrder
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder");

  return v3;
}

- (void)reload
{
  -[CNContactStoreDataSource _reloadWithSchedulingMethod:](self, "_reloadWithSchedulingMethod:", 0);
}

- (BOOL)isLoading
{
  return self->_loadingSnapshot;
}

- (NSDictionary)contactMatchInfos
{
  void *v2;
  void *v3;

  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactMatchInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)fetchUnified
{
  return self->_fetchUnified;
}

- (NSArray)indexSectionsArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CNContactSection *v13;
  void *v14;
  void *v15;
  CNContactSection *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "indexSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "indexSections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = objc_alloc_init(CNContactSection);
        objc_msgSend(v12, "localizedName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSection setTitle:](v13, "setTitle:", v14);

        objc_msgSend(v12, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSection setIdentifier:](v13, "setIdentifier:", v15);

        objc_msgSend(v6, "addObject:", v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = objc_alloc_init(CNContactSection);
  -[CNContactSection setTitle:](v16, "setTitle:", CFSTR("#"));
  objc_msgSend(v6, "addObject:", v16);

  return (NSArray *)v6;
}

- (NSDictionary)localizedSectionHeaders
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v3;
  objc_msgSend(v3, "headerLanguages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v9, "sections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v15, "localizedName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v15, "key");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v16, v17);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)sectionHeadersDictionary
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v3;
  objc_msgSend(v3, "headerLanguages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v9, "sections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v15, "ICUSortKey");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v15, "key");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v17, v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v4;
}

- (void)setCurrentSnapshot:(id)a3
{
  CNContactStoreSnapshot *v5;
  void *v6;
  CNContactStoreSnapshot *v7;

  v5 = (CNContactStoreSnapshot *)a3;
  if (self->_currentSnapshot != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    -[CNContactStoreDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDataSourceDidChange:", self);

    v5 = v7;
  }

}

- (CNContactDataSourceDelegate)delegate
{
  return (CNContactDataSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->contactFormatter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void)reset
{
  self->_loadingSnapshot = 1;
  -[CNContactStoreDataSource setCurrentSnapshot:](self, "setCurrentSnapshot:", 0);
}

- (id)withReloadLock_prepareNewSnapshot
{
  CNContactStoreSnapshot *v3;

  v3 = objc_alloc_init(CNContactStoreSnapshot);
  -[CNContactStoreSnapshot setDataSource:](v3, "setDataSource:", self);
  -[CNContactStoreSnapshot setFilter:](v3, "setFilter:", self->_filter);
  -[CNContactStoreSnapshot setManagedConfiguration:](v3, "setManagedConfiguration:", self->_managedConfiguration);
  -[CNContactStoreSnapshot prepareEnoughContacts](v3, "prepareEnoughContacts");
  return v3;
}

void __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  CNUILogContactStoreDataSource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEBUG, "Will calculate snapshot", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_167;
  v23 = &unk_1E204E838;
  v24 = v7;
  CNResultWithLock();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v13 - v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNUILogContactStoreDataSource();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v14;
    _os_log_debug_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEBUG, "Did calculate snapshot %{public}@", buf, 0xCu);
  }

  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_170;
  v18[3] = &unk_1E2050400;
  v16 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v9;
  v17 = v9;
  objc_msgSend(v16, "performBlock:", v18);

}

- (void)setShouldRevalidateFilterOnStoreChange:(BOOL)a3
{
  self->_shouldRevalidateFilterOnStoreChange = a3;
}

- (id)indexPathForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersToIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isUnified"))
    goto LABEL_6;
  objc_msgSend(v4, "mainStoreLinkedContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
    objc_msgSend(v7, "firstObject");
  else
    objc_msgSend(v7, "_cn_firstObjectPassingTest:", &__block_literal_global_157_52411);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_6:
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
  }
  else
  {
    objc_msgSend(v5, "prepareAllContacts");
    objc_msgSend(v5, "identifiersToIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
  }

  return v11;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[CNContactStoreDataSource filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactStoreDataSource filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SEARCH_NAV_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactStoreDataSource filter](self, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullTextString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {

      CNContactsUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALL_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactStoreDataSource filter](self, "filter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

        goto LABEL_6;
      }
      -[CNContactStoreDataSource filter](self, "filter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "groupIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_6:

        -[CNContactStoreDataSource filteredGroup](self, "filteredGroup");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = *MEMORY[0x1E0D13850];
          objc_msgSend(v16, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (((*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v19) & 1) != 0)
          {
            objc_msgSend(v17, "name");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            CNContactsUIBundle();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
            v4 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_16;
        }
        -[CNContactStoreDataSource filteredContainer](self, "filteredContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactStoreDataSource titleForContainer:](self, "titleForContainer:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v20;
        if (v19)
        {
LABEL_16:

          return (NSString *)v4;
        }

        -[CNContactStoreDataSource filter](self, "filter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "containerIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "anyObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[CNContactStoreDataSource accountForContainerIdentifier:](self, "accountForContainerIdentifier:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_cnui_displayName");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[CNContactStoreDataSource canUseTitleForAccount:](self, "canUseTitleForAccount:", v24))
          {
LABEL_14:

            v19 = 0;
            goto LABEL_16;
          }

        }
        CNContactsUIBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
  }
  return (NSString *)v4;
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CNContactStoreDataSource store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStore:", v5);

  -[CNContactStoreDataSource contactFormatter](self, "contactFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactFormatter:", v7);

  -[CNContactStoreDataSource keysToFetch](self, "keysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeysToFetch:", v8);

  -[CNContactStoreDataSource filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v6, "setFilter:", v10);

  objc_msgSend(v6, "setFetchUnified:", -[CNContactStoreDataSource fetchUnified](self, "fetchUnified"));
  return v6;
}

- (CNContactStoreDataSource)initWithStore:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  CNContactStoreDataSource *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNScheduler *mainThreadScheduler;
  uint64_t v12;
  CNScheduler *databaseChangePreprocessor;
  CNContactStoreFilter *v14;
  CNContactStoreFilter *filter;
  uint64_t v16;
  CNScheduler *backgroundSnapshotScheduler;
  NSLocking *v18;
  NSLocking *reloadLock;
  objc_super v21;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  if ((objc_msgSend(v4, "isMainThread") & 1) == 0)
  {
    CNUILogContactStoreDataSource();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Don't call +[CNContactStoreDataSource initWithStore:] from non main thread, this will throw in the near future", buf, 2u);
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)CNContactStoreDataSource;
  v7 = -[CNContactStoreDataSource init](&v21, sel_init);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mainThreadScheduler");
  v10 = objc_claimAutoreleasedReturnValue();
  mainThreadScheduler = v7->_mainThreadScheduler;
  v7->_mainThreadScheduler = (CNScheduler *)v10;

  v12 = objc_msgSend(v9, "newSerialSchedulerWithName:", CFSTR("ContactStoreDidChange preprocessor"));
  databaseChangePreprocessor = v7->_databaseChangePreprocessor;
  v7->_databaseChangePreprocessor = (CNScheduler *)v12;

  -[CNContactStoreDataSource setStore:](v7, "setStore:", v5);
  -[CNContactStoreDataSource registerForRelevantChangeNotifications](v7, "registerForRelevantChangeNotifications");
  v14 = objc_alloc_init(CNContactStoreFilter);
  filter = v7->_filter;
  v7->_filter = v14;

  v16 = objc_msgSend(v9, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ui.store-snapshotting"));
  backgroundSnapshotScheduler = v7->_backgroundSnapshotScheduler;
  v7->_backgroundSnapshotScheduler = (CNScheduler *)v16;

  v18 = (NSLocking *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
  reloadLock = v7->_reloadLock;
  v7->_reloadLock = v18;

  v7->_meContactNeedsUpdate = 1;
  return v7;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void)registerForRelevantChangeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contactStoreMeContactDidChange_, *MEMORY[0x1E0C96878], 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contactStoreMeContactDidChange_, *MEMORY[0x1E0D136D0], 0);

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("sortOrder"), 0, 0);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D139C8]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66__CNContactStoreDataSource_registerForRelevantChangeNotifications__block_invoke;
  v14 = &unk_1E204F880;
  objc_copyWeak(&v15, &location);
  v10 = (void *)objc_msgSend(v9, "initWithDelay:options:block:schedulerProvider:downstreamScheduler:", 1, &v11, v8, self->_databaseChangePreprocessor, 2.0);
  -[CNContactStoreDataSource setContactStoreDidChangeCoalescer:](self, "setContactStoreDidChangeCoalescer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)setContactStoreDidChangeCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeCoalescer, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->contactFormatter;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_keysToFetch, a3);
}

- (void)setFilter:(id)a3
{
  id v4;
  CNContactStoreFilter *v5;
  CNContactStoreFilter *filter;
  CNContactStoreFilter *v7;
  CNContactStoreFilter *v8;
  void *v9;
  char v10;
  CNScheduler *mainThreadScheduler;
  void *v12;
  char v13;
  CNScheduler *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_filter) & 1) == 0)
  {
    v5 = (CNContactStoreFilter *)objc_msgSend(v4, "copy");
    filter = self->_filter;
    self->_filter = v5;

    if (!self->_filter)
    {
      v7 = objc_alloc_init(CNContactStoreFilter);
      v8 = self->_filter;
      self->_filter = v7;

    }
    -[CNContactStoreDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      mainThreadScheduler = self->_mainThreadScheduler;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __38__CNContactStoreDataSource_setFilter___block_invoke;
      v16[3] = &unk_1E204F648;
      v16[4] = self;
      -[CNScheduler performBlock:](mainThreadScheduler, "performBlock:", v16);
    }
    -[CNContactStoreDataSource delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = self->_mainThreadScheduler;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __38__CNContactStoreDataSource_setFilter___block_invoke_2;
      v15[3] = &unk_1E204F648;
      v15[4] = self;
      -[CNScheduler performBlock:](v14, "performBlock:", v15);
    }
  }

}

- (void)setFetchUnified:(BOOL)a3
{
  self->_fetchUnified = a3;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void (**v14)(void *, _BOOL8);
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  CNContactStoreDataSource *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  uint64_t v46;

  v6 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "isUnknown") && (objc_msgSend(v8, "isSuggestedMe") & 1) == 0)
    {
      v17 = v8;
    }
    else
    {
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreDataSource preferredForNameMeContactIdentifier](self, "preferredForNameMeContactIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__52190;
      v42 = __Block_byref_object_dispose__52191;
      v43 = 0;
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__52190;
      v36 = __Block_byref_object_dispose__52191;
      v37 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke;
      aBlock[3] = &unk_1E204E790;
      v21 = v9;
      v27 = v12;
      v13 = v10;
      v22 = v13;
      v23 = self;
      v24 = &v28;
      v25 = &v32;
      v26 = &v38;
      v14 = (void (**)(void *, _BOOL8))_Block_copy(aBlock);
      v14[2](v14, v6);
      if (!*((_BYTE *)v29 + 24))
      {
        CNUILogContactStoreDataSource();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v19 = v33[5];
          *(_DWORD *)buf = 138412290;
          v45 = v19;
          _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, "Error completing contact: %@", buf, 0xCu);
        }

        if (objc_msgSend((id)objc_opt_class(), "isErrorPossiblyRelatedToExtraStores:", v33[5]))
        {
          CNUILogContactStoreDataSource();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Will re-fetch from main store", buf, 2u);
          }

          v14[2](v14, 1);
        }
      }
      v17 = (id)v39[5];

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);

      _Block_object_dispose(&v38, 8);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)preferredForNameMeContactIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreDataSource preferredForNameMeContactWithKeysToFetch:](self, "preferredForNameMeContactWithKeysToFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  id obj;
  uint8_t buf[4];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", *(_QWORD *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0C97200];
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForMeContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v6);

  }
  else
  {
    v19[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContactsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v8);

  }
  objc_msgSend(v4, "setUnifyResults:", 1);
  objc_msgSend(v4, "setOnlyMainStore:", a2);
  objc_msgSend(*(id *)(a1 + 48), "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  v15[4] = *(_QWORD *)(a1 + 72);
  obj = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2;
  v15[3] = &unk_1E204FB18;
  v15[1] = 3221225472;
  v12 = objc_msgSend(v9, "enumerateContactsWithFetchRequest:error:usingBlock:", v4, &obj, v15);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    CNUILogContactStoreDataSource();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Error completing contact: %@", buf, 0xCu);
    }

  }
}

- (id)preferredForNameMeContactWithKeysToFetch:(id)a3
{
  id v4;
  CNContactStoreDataSource *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[CNContactStoreDataSource meContactNeedsUpdate](v5, "meContactNeedsUpdate")
    || (-[CNContactStoreDataSource meContact](v5, "meContact"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[CNContactStoreDataSource meContact](v5, "meContact"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "areKeysAvailable:", v4),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
      objc_msgSend(v9, "addObjectsFromArray:", v4);
    -[CNContactStoreDataSource meContact](v5, "meContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNContactStoreDataSource meContact](v5, "meContact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "availableKeyDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v10);
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForMeContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "setUnifyResults:", 0);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__52190;
    v28 = __Block_byref_object_dispose__52191;
    v29 = 0;
    -[CNContactStoreDataSource store](v5, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = &v24;
    v23 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__CNContactStoreDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke;
    v22[3] = &unk_1E204FB18;
    v17 = objc_msgSend(v16, "enumerateNonUnifiedContactsWithFetchRequest:error:usingBlock:", v14, &v23, v22);
    v18 = v23;

    if ((v17 & 1) != 0)
    {
      -[CNContactStoreDataSource setMeContactNeedsUpdate:](v5, "setMeContactNeedsUpdate:", 0);
      -[CNContactStoreDataSource setMeContact:](v5, "setMeContact:", v25[5]);
    }
    else
    {
      CNUILogContactStoreDataSource();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_error_impl(&dword_18AC56000, v19, OS_LOG_TYPE_ERROR, "Error fetching the me card: %@", buf, 0xCu);
      }

    }
    _Block_object_dispose(&v24, 8);

  }
  -[CNContactStoreDataSource meContact](v5, "meContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v20;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (BOOL)meContactNeedsUpdate
{
  return self->_meContactNeedsUpdate;
}

- (void)setMeContactNeedsUpdate:(BOOL)a3
{
  self->_meContactNeedsUpdate = a3;
}

- (void)setMeContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

void __69__CNContactStoreDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (v9)
  {
    CNUILogContactStoreDataSource();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Error: got more than one contact instead of a unified one", v13, 2u);
    }

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v8, a2);
  }

}

- (CNContainer)filteredContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContainer *v12;
  CNContainer *v13;
  CNContainer *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNContainer *v22;
  CNContainer *v23;
  CNContainer *filteredContainer;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[CNContactStoreDataSource filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {

    goto LABEL_8;
  }
  -[CNContactStoreDataSource filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
LABEL_8:
    filteredContainer = self->_filteredContainer;
    self->_filteredContainer = 0;

    v13 = 0;
    return v13;
  }
  -[CNContactStoreDataSource filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self->_filteredContainer;
  if (v11)
  {
    v13 = v12;
    v14 = self->_filteredContainer;
    if (!v14
      || (-[CNContainer identifier](v14, "identifier"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", v11),
          v15,
          (v16 & 1) == 0))
    {

      v17 = (void *)MEMORY[0x1E0C972C0];
      v26[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "predicateForContainersWithIdentifiers:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactStoreDataSource store](self, "store");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "containersMatchingPredicate:error:", v19, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "firstObject");
      v22 = (CNContainer *)objc_claimAutoreleasedReturnValue();
      v23 = self->_filteredContainer;
      self->_filteredContainer = v22;

      v13 = self->_filteredContainer;
    }
  }
  else
  {
    self->_filteredContainer = 0;

    v13 = 0;
  }

  return v13;
}

- (BOOL)filterShowsSingleGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CNContactStoreDataSource filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[CNContactStoreDataSource filter](self, "filter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)filterShowsSingleExchangeFolder
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNContactStoreDataSource filteredContainer](self, "filteredContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type") == 2;
  else
    v4 = 0;

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("sortOrder"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CNContactStoreDataSource;
  -[CNContactStoreDataSource dealloc](&v6, sel_dealloc);
}

- (id)titleForContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D13850];
  if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v5) & 1) == 0)
  {
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactStoreDataSource accountForContainerIdentifier:](self, "accountForContainerIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(v10, "identifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v11),
        v11,
        (v12 & 1) != 0))
  {
    objc_msgSend(v10, "_cnui_displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C972C0];
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateForContainersInAccountWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactStoreDataSource store](self, "store");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containersMatchingPredicate:error:", v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count") != 1
      || (v19 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v13), v20 = v13, (v19 & 1) == 0))
    {
      v20 = v5;
    }
    v21 = v20;

  }
  else
  {
    v21 = v5;
  }

  return v21;
}

- (BOOL)canUseTitleForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_cnui_displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
      v7 = -[CNContactStoreDataSource doesFilterShowAllContainersForAccount:](self, "doesFilterShowAllContainersForAccount:", v5);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)doesFilterShowAllContainersForAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContainersInAccountWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactStoreDataSource store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containersMatchingPredicate:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_cn_map:", &__block_literal_global_52419);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreDataSource filter](self, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToSet:", v12);

  return v13;
}

- (id)accountForContainerIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountForContainerWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreDataSource store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsMatchingPredicate:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNGroup)filteredGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNGroup *filteredGroup;
  CNGroup *v8;
  CNGroup *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNGroup *v17;
  CNGroup *v18;
  CNGroup *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactStoreDataSource filterShowsSingleGroup](self, "filterShowsSingleGroup"))
  {
    -[CNContactStoreDataSource filter](self, "filter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    filteredGroup = self->_filteredGroup;
    if (v6)
    {
      v8 = filteredGroup;
      v9 = self->_filteredGroup;
      if (!v9
        || (-[CNGroup identifier](v9, "identifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqualToString:", v6),
            v10,
            (v11 & 1) == 0))
      {

        v12 = (void *)MEMORY[0x1E0C97318];
        v21[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateForGroupsWithIdentifiers:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactStoreDataSource store](self, "store");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "groupsMatchingPredicate:error:", v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "firstObject");
        v17 = (CNGroup *)objc_claimAutoreleasedReturnValue();
        v18 = self->_filteredGroup;
        self->_filteredGroup = v17;

        v8 = self->_filteredGroup;
      }
    }
    else
    {
      self->_filteredGroup = 0;

      v8 = 0;
    }

    return v8;
  }
  else
  {
    v19 = self->_filteredGroup;
    self->_filteredGroup = 0;

    return (CNGroup *)0;
  }
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6;
  CNContactStoreDataSource *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[CNContactStoreDataSource setMeContact:](v7, "setMeContact:", 0);
  objc_sync_exit(v7);

  -[CNContactStoreDataSource store](v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "setMeContact:error:", v6, a4);

  return (char)a4;
}

- (void)validateFilter
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CNContactStoreDataSource filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = *MEMORY[0x1E0D13840];
  objc_msgSend(v4, "containerIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    -[CNContactStoreDataSource store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v8, "containersMatchingPredicate:error:", 0, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;

    if (!v9)
    {
      CNUILogContactStoreDataSource();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v10;
        _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Error fetching containers for filter validation: %@", buf, 0xCu);
      }

      goto LABEL_20;
    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "_cn_map:", &__block_literal_global_159);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "containerIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "intersectSet:", v13);
    if (objc_msgSend(v16, "count"))
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v4, "setContainerIdentifiers:", v17);

    }
    else
    {
      objc_msgSend(v4, "setContainerIdentifiers:", 0);
    }

  }
  objc_msgSend(v4, "groupIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v19);

  if ((v20 & 1) != 0)
  {
LABEL_19:
    -[CNContactStoreDataSource setFilter:](self, "setFilter:", v4);
    goto LABEL_20;
  }
  -[CNContactStoreDataSource store](self, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v21, "groupsMatchingPredicate:error:", 0, &v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v32;

  if (v22)
  {
    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v22, "_cn_map:", &__block_literal_global_162);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "groupIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithSet:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "intersectSet:", v26);
    if (objc_msgSend(v29, "count"))
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v4, "setGroupIdentifiers:", v30);

    }
    else
    {
      objc_msgSend(v4, "setGroupIdentifiers:", 0);
    }

    goto LABEL_19;
  }
  CNUILogContactStoreDataSource();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v23;
    _os_log_error_impl(&dword_18AC56000, v31, OS_LOG_TYPE_ERROR, "Error fetching groups for filter validation: %@", buf, 0xCu);
  }

LABEL_20:
}

- (void)contactStoreDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  CNUILogContactStoreDataSource();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Received contacts change notification", v6, 2u);
  }

  -[CNContactStoreDataSource contactStoreDidChangeCoalescer](self, "contactStoreDidChangeCoalescer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleEvent");

}

- (void)contactStoreDidChangeHandler
{
  NSObject *v3;
  CNGroup *filteredGroup;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  CNUILogContactStoreDataSource();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEFAULT, "Will handle contacts change notification", buf, 2u);
  }

  filteredGroup = self->_filteredGroup;
  self->_filteredGroup = 0;

  if (-[CNContactStoreDataSource shouldRevalidateFilterOnStoreChange](self, "shouldRevalidateFilterOnStoreChange"))
  {
    -[CNContactStoreDataSource validateFilter](self, "validateFilter");
    -[CNContactStoreDataSource setShouldRevalidateFilterOnStoreChange:](self, "setShouldRevalidateFilterOnStoreChange:", 0);
  }
  -[CNContactStoreDataSource reloadAsynchronously](self, "reloadAsynchronously");
  CNUILogContactStoreDataSource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEFAULT, "Did handle contacts change notification (async work continues)", v6, 2u);
  }

}

- (void)contactStoreMeContactDidChange:(id)a3
{
  NSObject *v4;
  CNScheduler *v5;
  CNScheduler *databaseChangePreprocessor;
  CNScheduler *v7;
  _QWORD v8[5];
  CNScheduler *v9;
  uint8_t buf[16];

  CNUILogContactStoreDataSource();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Received me contact change notification", buf, 2u);
  }

  v5 = self->_mainThreadScheduler;
  databaseChangePreprocessor = self->_databaseChangePreprocessor;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[CNScheduler performBlock:](databaseChangePreprocessor, "performBlock:", v8);

}

- (BOOL)canReload
{
  return 1;
}

- (void)reloadAsynchronously
{
  -[CNContactStoreDataSource _reloadWithSchedulingMethod:](self, "_reloadWithSchedulingMethod:", 1);
}

- (void)invalidate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("sortOrder"));

}

- (CNContactFilter)effectiveFilter
{
  void *v2;
  void *v3;

  -[CNContactStoreDataSource currentSnapshot](self, "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactFilter *)v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("sortOrder")))
  {
    -[CNContactStoreDataSource reloadAsynchronously](self, "reloadAsynchronously");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNContactStoreDataSource;
    -[CNContactStoreDataSource observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)shouldRevalidateFilterOnStoreChange
{
  return self->_shouldRevalidateFilterOnStoreChange;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setFilteredGroup:(id)a3
{
  objc_storeStrong((id *)&self->_filteredGroup, a3);
}

- (void)setFilteredContainer:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContainer, a3);
}

- (NSDictionary)localizedSectionIndices
{
  return self->_localizedSectionIndices;
}

- (CNCoalescingTimer)contactStoreDidChangeCoalescer
{
  return self->_contactStoreDidChangeCoalescer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_localizedSectionIndices, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_filteredContainer, 0);
  objc_storeStrong((id *)&self->_filteredGroup, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->contactFormatter, 0);
  objc_storeStrong((id *)&self->_databaseChangePreprocessor, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_reloadLock, 0);
  objc_storeStrong((id *)&self->_backgroundSnapshotScheduler, 0);
  objc_storeStrong((id *)&self->_sectionHeadersDictionary, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
}

void __38__CNContactStoreDataSource_setFilter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactDataSourceDisplayNameDidChange:", *(_QWORD *)(a1 + 32));

}

void __38__CNContactStoreDataSource_setFilter___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactDataSourceDidChangeDisplayName:", *(_QWORD *)(a1 + 32));

}

uint64_t __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "withReloadLock_prepareNewSnapshot");
}

void __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_170(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "setCurrentSnapshot:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  CNUILogContactStoreDataSource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEFAULT, "Did reload snapshot", v3, 2u);
  }

}

void __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  CNUILogContactStoreDataSource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEFAULT, "Will handle me contact change notification", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "setMeContactNeedsUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setMeContact:", 0);
  objc_sync_exit(v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke_165;
    v8[3] = &unk_1E204F648;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "performBlock:", v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "reloadAsynchronously");
  CNUILogContactStoreDataSource();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "Did handle me contact change notification (async work continues)", buf, 2u);
  }

}

void __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke_165(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactDataSourceMeContactDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __42__CNContactStoreDataSource_validateFilter__block_invoke_160(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __42__CNContactStoreDataSource_validateFilter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __48__CNContactStoreDataSource_indexPathForContact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPreferredForName");
}

uint64_t __66__CNContactStoreDataSource_doesFilterShowAllContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __66__CNContactStoreDataSource_registerForRelevantChangeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contactStoreDidChangeHandler");

}

+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = a3;
  v4 = *MEMORY[0x1E0CB28A8];
  if ((objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, *MEMORY[0x1E0CB28A8], 4099) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, v4, 4097) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v3, v4, 4101);
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingEffectiveFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("currentSnapshot"));
}

@end
