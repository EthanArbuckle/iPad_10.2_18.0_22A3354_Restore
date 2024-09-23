@implementation CNAccountsAndGroupsDataSource

- (CNAccountsAndGroupsDataSource)initWithStore:(id)a3
{
  CNContactStore *v4;
  CNAccountsAndGroupsDataSource *v5;
  CNContactStore *store;
  CNContactStore *v7;
  CNAccountsAndGroupsItem *v8;
  CNAccountsAndGroupsItem *rootItem;
  CNUIGroupsAndContainersSaveManager *v10;
  CNUIGroupsAndContainersSaveManager *groupsAndContainersSaveManager;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  CNManagedConfiguration *managedConfiguration;
  objc_super v19;

  v4 = (CNContactStore *)a3;
  v19.receiver = self;
  v19.super_class = (Class)CNAccountsAndGroupsDataSource;
  v5 = -[CNAccountsAndGroupsDataSource init](&v19, sel_init);
  store = v5->_store;
  v5->_store = v4;
  v7 = v4;

  v8 = -[CNAccountsAndGroupsItem initWithType:nameProvider:]([CNAccountsAndGroupsItem alloc], "initWithType:nameProvider:", 0, 0);
  rootItem = v5->_rootItem;
  v5->_rootItem = v8;

  v10 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:]([CNUIGroupsAndContainersSaveManager alloc], "initWithContactStore:", v7);
  groupsAndContainersSaveManager = v5->_groupsAndContainersSaveManager;
  v5->_groupsAndContainersSaveManager = v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D13AA8]);
  objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithBundleIdentifier:managedProfileConnection:", v13, v15);
  managedConfiguration = v5->_managedConfiguration;
  v5->_managedConfiguration = (CNManagedConfiguration *)v16;

  return v5;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void)setFilter:(id)a3
{
  CNContactStoreFilter *serverFilter;
  CNContactStoreFilter *v5;
  CNContactStoreFilter *v6;
  CNContactStoreFilter *filter;
  CNContactStoreFilter *v8;

  v8 = (CNContactStoreFilter *)a3;
  serverFilter = self->_serverFilter;
  self->_serverFilter = 0;

  v5 = v8;
  if (self->_filter != v8)
  {
    v6 = (CNContactStoreFilter *)-[CNContactStoreFilter copy](v8, "copy");
    filter = self->_filter;
    self->_filter = v6;

    v5 = v8;
  }

}

- (void)reload
{
  -[CNAccountsAndGroupsDataSource setSections:](self, "setSections:", 0);
}

- (BOOL)hasChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  void *v37;
  void *v38;
  id obj;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsDataSource sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsDataSource showAllSectionItem](self, "showAllSectionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contactCount");

  -[CNAccountsAndGroupsDataSource reload](self, "reload");
  -[CNAccountsAndGroupsDataSource sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsDataSource showAllSectionItem](self, "showAllSectionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contactCount");

  if (v5 == v8 && (v9 = objc_msgSend(v3, "count"), v9 == objc_msgSend(v6, "count")))
  {
    v38 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v53 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v13);
    }

    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke;
    v50[3] = &unk_1E204E200;
    v18 = v10;
    v51 = v18;
    v6 = v38;
    if ((objc_msgSend(v38, "_cn_any:", v50) & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      v36 = v18;
      v37 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v11;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v47 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v25, "items");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v43;
              do
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v43 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
                  objc_msgSend(v31, "identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    objc_msgSend(v31, "identifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, v33);

                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
              }
              while (v28);
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        }
        while (v22);
      }

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_2;
      v40[3] = &unk_1E204E200;
      v41 = v20;
      v34 = v20;
      v6 = v38;
      v19 = objc_msgSend(v38, "_cn_any:", v40);

      v18 = v36;
      v3 = v37;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void)_reloadSections
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void (**v9)(void *, void *, void *, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  CNAccountsAndGroupsSection *v40;
  char v41;
  id obj;
  id v43;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD aBlock[7];
  id v57;
  id v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  void *v65;
  uint8_t v66[128];
  uint8_t v67[4];
  uint64_t v68;
  __int16 v69;
  id v70;
  uint8_t v71[128];
  __int128 v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  CNUILogAccountsAndGroupsList();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Reloading sections", buf, 2u);
  }

  -[CNAccountsAndGroupsDataSource setCurrentlyEditingGroupItem:](self, "setCurrentlyEditingGroupItem:", 0);
  *(_QWORD *)buf = 0;
  v60 = buf;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__49706;
  v63 = __Block_byref_object_dispose__49707;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsItem setContactCount:](self->_rootItem, "setContactCount:", -[CNAccountsAndGroupsDataSource contactCountForItem:](self, "contactCountForItem:", self->_rootItem));
  v40 = objc_alloc_init(CNAccountsAndGroupsSection);
  -[CNAccountsAndGroupsSection setIsAllContactsGlobalSection:](v40, "setIsAllContactsGlobalSection:", 1);
  v77[0] = self->_rootItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsSection setItems:](v40, "setItems:", v3);

  -[CNAccountsAndGroupsSection setIdentifier:](v40, "setIdentifier:", CFSTR("CNAccountsAndGroupsSectionGlobal"));
  -[CNAccountsAndGroupsDataSource store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v4, "accountsMatchingPredicate:error:", 0, &v58);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v58;

  if (!v39)
  {
    CNUILogAccountsAndGroupsList();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v72) = 138412290;
      *(_QWORD *)((char *)&v72 + 4) = v5;
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting accounts: %@", (uint8_t *)&v72, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersWithType:", 1003);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsDataSource store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v7, "containersMatchingPredicate:error:", v38, &v57);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v36 = v57;

  if (!v43)
  {
    CNUILogAccountsAndGroupsList();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v72) = 138412290;
      *(_QWORD *)((char *)&v72 + 4) = v36;
      _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting provider containers: %@", (uint8_t *)&v72, 0xCu);
    }

  }
  if (objc_msgSend(v39, "count", v36) || objc_msgSend(v43, "count"))
  {
    *(_QWORD *)&v72 = 0;
    *((_QWORD *)&v72 + 1) = &v72;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__49706;
    v75 = __Block_byref_object_dispose__49707;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke;
    aBlock[3] = &unk_1E204E2C8;
    aBlock[4] = self;
    aBlock[5] = &v72;
    aBlock[6] = buf;
    v9 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v39;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    if (v10)
    {
      v41 = 0;
      v11 = *(_QWORD *)v53;
      v12 = *MEMORY[0x1E0D137F8];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (-[CNAccountsAndGroupsDataSource shouldShowAccount:](self, "shouldShowAccount:", v14))
          {
            v15 = (void *)MEMORY[0x1E0C972C0];
            objc_msgSend(v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "predicateForContainersInAccountWithIdentifier:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            -[CNAccountsAndGroupsDataSource store](self, "store");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 0;
            objc_msgSend(v18, "containersMatchingPredicate:error:", v17, &v51);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v51;

            if ((*(unsigned int (**)(uint64_t, void *))(v12 + 16))(v12, v19))
            {
              CNUILogAccountsAndGroupsList();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v67 = 138412546;
                v68 = (uint64_t)v14;
                v69 = 2112;
                v70 = v20;
                _os_log_impl(&dword_18AC56000, v21, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] 0 containers fetched for account: %@ with error: %@", v67, 0x16u);
              }

            }
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_74;
            v50[3] = &unk_1E204E2F0;
            v50[4] = v14;
            v22 = _Block_copy(v50);
            objc_msgSend(v14, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, v23, v22, v19);

          }
          else
          {
            v41 = 1;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
      }
      while (v10);
    }
    else
    {
      v41 = 0;
    }

    objc_msgSend(v43, "_cn_safeSortedArrayUsingComparator:", &__block_literal_global_49713);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = v24;
    v25 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(v43);
          v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("ProviderContainer:"), "stringByAppendingString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3_77;
          v45[3] = &unk_1E204E2F0;
          v45[4] = v28;
          v31 = _Block_copy(v45);
          v65 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v30, v31, v32);

        }
        v25 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
      }
      while (v25);
    }

    -[CNAccountsAndGroupsItem setChildItems:](self->_rootItem, "setChildItems:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 40));
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 40), "count") != 1) | v41 & 1
      && !-[CNAccountsAndGroupsDataSource onlyShowsGroupsInSections](self, "onlyShowsGroupsInSections"))
    {
      objc_msgSend(*((id *)v60 + 5), "insertObject:atIndex:", v40, 0);
    }
    CNUILogAccountsAndGroupsList();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(*((id *)v60 + 5), "count");
      objc_msgSend(*((id *)v60 + 5), "description");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v67 = 134218242;
      v68 = v34;
      v69 = 2112;
      v70 = v35;
      _os_log_impl(&dword_18AC56000, v33, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] finished fetching %lu sections: %@", v67, 0x16u);

    }
    -[CNAccountsAndGroupsDataSource setSections:](self, "setSections:", *((_QWORD *)v60 + 5));

    _Block_object_dispose(&v72, 8);
  }
  else if (!-[CNAccountsAndGroupsDataSource onlyShowsGroupsInSections](self, "onlyShowsGroupsInSections"))
  {
    objc_msgSend(*((id *)v60 + 5), "addObject:", v40);
    -[CNAccountsAndGroupsDataSource setSections:](self, "setSections:", *((_QWORD *)v60 + 5));
  }

  _Block_object_dispose(buf, 8);
}

- (BOOL)shouldShowAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  -[CNAccountsAndGroupsDataSource managedConfiguration](self, "managedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceHasManagementRestrictions");

  if (!v6)
    goto LABEL_7;
  v7 = *MEMORY[0x1E0D13840];
  -[CNAccountsAndGroupsDataSource targetAccountExternalIdentifiers](self, "targetAccountExternalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v9 & 1) == 0)
  {
    -[CNAccountsAndGroupsDataSource targetAccountExternalIdentifiers](self, "targetAccountExternalIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke;
    v20[3] = &unk_1E204E358;
    v20[4] = self;
    v21 = v4;
    v11 = objc_msgSend(v10, "_cn_any:", v20);

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  -[CNAccountsAndGroupsDataSource sourceAccountExternalIdentifiers](self, "sourceAccountExternalIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v12);

  if ((v13 & 1) != 0)
    goto LABEL_7;
  -[CNAccountsAndGroupsDataSource sourceAccountExternalIdentifiers](self, "sourceAccountExternalIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke_2;
  v18[3] = &unk_1E204E358;
  v18[4] = self;
  v19 = v4;
  v15 = objc_msgSend(v14, "_cn_any:", v18);

  if ((v15 & 1) != 0)
LABEL_6:
    v16 = 0;
  else
LABEL_7:
    v16 = 1;

  return v16;
}

- (CNAccountsAndGroupsItem)showAllSectionItem
{
  return self->_rootItem;
}

- (void)_applyFilter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNContactStoreFilter groupIdentifiers](self->_filter, "groupIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    -[CNAccountsAndGroupsItem arrayForDisplay:](self->_rootItem, "arrayForDisplay:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v6)
      goto LABEL_17;
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type");
        if (v11 == 4)
        {
          -[CNContactStoreFilter groupIdentifiers](self->_filter, "groupIdentifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSelected:affectingChildren:", objc_msgSend(v17, "containsObject:", v18), 0);

          goto LABEL_14;
        }
        if (v11 == 2)
        {
          -[CNContactStoreFilter containerIdentifiers](self->_filter, "containerIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          objc_msgSend(v10, "setSelected:affectingChildren:", v14, 0);
          objc_msgSend(v10, "parentItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "type");

          if (v16 == 1)
          {
            objc_msgSend(v10, "parentItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSelected:affectingChildren:", v14, 0);
LABEL_14:

            continue;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v7)
      {
LABEL_17:

        return;
      }
    }
  }
  -[CNContactStoreFilter containerIdentifiers](self->_filter, "containerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
  -[CNAccountsAndGroupsItem setSelected:affectingChildren:](self->_rootItem, "setSelected:affectingChildren:", 1, 1);
}

- (void)setFilterForItem:(id)a3
{
  CNContactStoreFilter *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init(CNContactStoreFilter);
  switch(objc_msgSend(v13, "type"))
  {
    case 1:
      v5 = *MEMORY[0x1E0D137F8];
      objc_msgSend(v13, "childItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      if ((v5 & 1) != 0)
        break;
      v7 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "childItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setContainerIdentifiers:](v4, "setContainerIdentifiers:", v10);

      goto LABEL_7;
    case 2:
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setContainerIdentifiers:](v4, "setContainerIdentifiers:", v9);
      goto LABEL_7;
    case 3:
      -[CNAccountsAndGroupsDataSource setServerFilterForItem:](self, "setServerFilterForItem:", v13);
      goto LABEL_9;
    case 4:
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setGroupIdentifiers:](v4, "setGroupIdentifiers:", v9);
LABEL_7:

      break;
    default:
      break;
  }
  -[CNAccountsAndGroupsDataSource setFilter:](self, "setFilter:", v4);
LABEL_9:

}

- (void)removeServerFilter
{
  CNContactStoreFilter *serverFilter;

  serverFilter = self->_serverFilter;
  self->_serverFilter = 0;

}

- (id)multiSelectFilter
{
  void *v3;
  id v4;
  void (**v5)(void *, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  if (!-[CNAccountsAndGroupsItem isSelected](self->_rootItem, "isSelected"))
  {
    -[CNAccountsAndGroupsItem arrayForDisplay:](self->_rootItem, "arrayForDisplay:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke;
    aBlock[3] = &unk_1E204E3C0;
    v4 = v3;
    v13 = v4;
    v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v5[2](v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreFilter setContainerIdentifiers:](self->_filter, "setContainerIdentifiers:", v6);

    v5[2](v5, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreFilter setGroupIdentifiers:](self->_filter, "setGroupIdentifiers:", v7);

    -[CNContactStoreFilter containerIdentifiers](self->_filter, "containerIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CNContactStoreFilter groupIdentifiers](self->_filter, "groupIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setGroupIdentifiers:](self->_filter, "setGroupIdentifiers:", v11);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setContainerIdentifiers:](self->_filter, "setContainerIdentifiers:", v8);
    }

LABEL_6:
    return self->_filter;
  }
  -[CNContactStoreFilter setContainerIdentifiers:](self->_filter, "setContainerIdentifiers:", 0);
  -[CNContactStoreFilter setGroupIdentifiers:](self->_filter, "setGroupIdentifiers:", 0);
  return self->_filter;
}

- (void)setServerFilterForItem:(id)a3
{
  void *v4;
  CNContactStoreFilter *serverFilter;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  CNContactStoreFilter *v10;
  CNContactStoreFilter *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    serverFilter = self->_serverFilter;
    v13 = v4;
    if (!serverFilter)
      goto LABEL_4;
    -[CNContactStoreFilter containerIdentifiers](serverFilter, "containerIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v13);

    v4 = v13;
    if ((v9 & 1) == 0)
    {
LABEL_4:
      v10 = objc_alloc_init(CNContactStoreFilter);
      v11 = self->_serverFilter;
      self->_serverFilter = v10;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreFilter setContainerIdentifiers:](self->_serverFilter, "setContainerIdentifiers:", v12);

      -[CNContactStoreFilter setGroupIdentifiers:](self->_serverFilter, "setGroupIdentifiers:", 0);
      -[CNContactStoreFilter setIsServerFilter:](self->_serverFilter, "setIsServerFilter:", 1);
      v4 = v13;
    }
  }

}

- (CNContactStoreFilter)serverFilter
{
  return self->_serverFilter;
}

- (NSArray)sections
{
  NSArray *sections;

  sections = self->_sections;
  if (!sections)
  {
    -[CNAccountsAndGroupsDataSource _reloadSections](self, "_reloadSections");
    sections = self->_sections;
  }
  return sections;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  if (self->_hidesSearchableSources != a3)
  {
    self->_hidesSearchableSources = a3;
    -[CNAccountsAndGroupsDataSource reload](self, "reload");
  }
}

- (BOOL)isTrivial
{
  void *v2;
  char v3;

  -[CNAccountsAndGroupsDataSource store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMultipleGroupsOrAccounts") ^ 1;

  return v3;
}

- (void)updateRootItemSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNAccountsAndGroupsItem childItems](self->_rootItem, "childItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isSelected"))
        {
          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  if ((_DWORD)v8 != -[CNAccountsAndGroupsItem isSelected](self->_rootItem, "isSelected"))
    -[CNAccountsAndGroupsItem setSelected:affectingChildren:](self->_rootItem, "setSelected:affectingChildren:", v8, 0);
}

- (id)groupIdentifierForGroupItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 4)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)containerIdentifierForItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 4 || objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "containerIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "type") != 2)
    {
      v5 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v3, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_5:

  return v5;
}

- (id)sectionIdentifierForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNAccountsAndGroupsDataSource containerIdentifierForItem:](self, "containerIdentifierForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNAccountsAndGroupsDataSource groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountForContainerIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNAccountsAndGroupsDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CNAccountsAndGroupsDataSource_sectionForIdentifier___block_invoke;
  v9[3] = &unk_1E204E200;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allContactsForMainItem:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 1)
  {
    v8 = (void *)MEMORY[0x1E0C972C0];
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContainersInAccountWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsDataSource store](self, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v11, "containersMatchingPredicate:error:", v10, &v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v37;

    if (v12)
    {
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v12;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v15)
      {
        v16 = v15;
        v27 = v12;
        v28 = v13;
        v29 = v10;
        v30 = v6;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)MEMORY[0x1E0C97200];
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "predicateForContactsInContainerWithIdentifier:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[CNAccountsAndGroupsDataSource store](self, "store");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0;
            objc_msgSend(v22, "unifiedContactsMatchingPredicate:keysToFetch:error:", v21, v7, &v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v32;

            if (v23)
            {
              objc_msgSend(v31, "addObjectsFromArray:", v23);
            }
            else
            {
              CNUILogAccountsAndGroupsList();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v30;
                v41 = 2112;
                v42 = v24;
                _os_log_impl(&dword_18AC56000, v25, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
              }

            }
          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v16);
        v6 = v30;
        v13 = v28;
        v10 = v29;
        v12 = v27;
      }
    }
    else
    {
      CNUILogAccountsAndGroupsList();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v6;
        v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting containers for item: %@ with error: %@", buf, 0x16u);
      }
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)allContactsForItem:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v6, "type") == 1)
    {
      -[CNAccountsAndGroupsDataSource allContactsForMainItem:keysToFetch:](self, "allContactsForMainItem:keysToFetch:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "type") == 2)
    {
      v10 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateForContactsInContainerWithIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "type") != 4)
        goto LABEL_13;
      v13 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateForContactsInGroupWithIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v12;

    if (v9)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForAllContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_11:
      -[CNAccountsAndGroupsDataSource store](self, "store");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v14, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v7, &v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;

      if (v8)
      {
        v16 = v8;
      }
      else
      {
        CNUILogAccountsAndGroupsList();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v22 = v6;
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_18AC56000, v18, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
        }

      }
      goto LABEL_20;
    }
  }
LABEL_13:
  CNUILogAccountsAndGroupsList();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@, unknown item type", buf, 0xCu);
  }

  v8 = 0;
LABEL_20:

  return v8;
}

- (int64_t)contactCountForItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "type"))
    goto LABEL_9;
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = -[CNAccountsAndGroupsDataSource contactCountForMainItem:](self, "contactCountForMainItem:", v4);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "type") != 2)
  {
    if (objc_msgSend(v4, "type") == 4)
    {
      v9 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateForContactsInGroupWithIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForContactsInContainerWithIdentifier:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v8;

LABEL_10:
  v11 = objc_alloc(MEMORY[0x1E0C97210]);
  v12 = (void *)objc_msgSend(v11, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v12, "setPredicate:", v10);
  -[CNAccountsAndGroupsDataSource store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v13, "contactCountForFetchRequest:error:", v12, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  if (v14)
  {
    v5 = objc_msgSend(v14, "integerValue");
  }
  else
  {
    CNUILogAccountsAndGroupsList();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_18AC56000, v16, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
    }

    v5 = 0;
  }

LABEL_16:
  return v5;
}

- (int64_t)contactCountForMainItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = (void *)MEMORY[0x1E0C972C0];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainersInAccountWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsDataSource store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v8, "containersMatchingPredicate:error:", v7, &v37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v37;

    if (v9)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v9;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
      {
        v13 = v12;
        v28 = v9;
        v29 = v10;
        v30 = v7;
        v31 = v4;
        v14 = 0;
        v15 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v18 = objc_alloc(MEMORY[0x1E0C97210]);
            v19 = (void *)objc_msgSend(v18, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
            v20 = (void *)MEMORY[0x1E0C97200];
            objc_msgSend(v17, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "predicateForContactsInContainerWithIdentifier:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setPredicate:", v22);

            -[CNAccountsAndGroupsDataSource store](self, "store");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0;
            objc_msgSend(v23, "contactCountForFetchRequest:error:", v19, &v32);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v32;

            if (v24)
            {
              v14 += objc_msgSend(v24, "integerValue");
            }
            else
            {
              CNUILogAccountsAndGroupsList();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v31;
                v41 = 2112;
                v42 = v25;
                _os_log_impl(&dword_18AC56000, v26, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
              }

            }
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v13);
        v4 = v31;
        v10 = v29;
        v7 = v30;
        v9 = v28;
        goto LABEL_20;
      }
    }
    else
    {
      CNUILogAccountsAndGroupsList();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v4;
        v41 = 2112;
        v42 = v10;
        _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting containers for item: %@ with error: %@", buf, 0x16u);
      }
    }
    v14 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

- (BOOL)isFilterShowingItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  CNContactStoreFilter *filter;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      -[CNContactStoreFilter containerIdentifiers](self->_filter, "containerIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_3;
      -[CNContactStoreFilter groupIdentifiers](self->_filter, "groupIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v19 == 0;

      goto LABEL_19;
    case 1:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "childItems", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v7)
        goto LABEL_12;
      v8 = v7;
      v9 = *(_QWORD *)v21;
      break;
    case 2:
      filter = self->_filter;
      goto LABEL_15;
    case 3:
      filter = self->_serverFilter;
      if (!filter)
        goto LABEL_16;
LABEL_15:
      -[CNContactStoreFilter containerIdentifiers](filter, "containerIdentifiers");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v5 = (void *)v16;
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v17);

      goto LABEL_19;
    case 4:
      -[CNContactStoreFilter groupIdentifiers](self->_filter, "groupIdentifiers");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    default:
LABEL_16:
      v6 = 0;
      goto LABEL_20;
  }
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      -[CNContactStoreFilter containerIdentifiers](self->_filter, "containerIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

      if (!v14)
      {
LABEL_3:
        v6 = 0;
        goto LABEL_19;
      }
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v8);
LABEL_12:
  v6 = 1;
LABEL_19:

LABEL_20:
  return v6;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (BOOL)hidesSearchableSources
{
  return self->_hidesSearchableSources;
}

- (BOOL)onlyShowsGroupsInSections
{
  return self->_onlyShowsGroupsInSections;
}

- (void)setOnlyShowsGroupsInSections:(BOOL)a3
{
  self->_onlyShowsGroupsInSections = a3;
}

- (NSSet)targetAccountExternalIdentifiers
{
  return self->_targetAccountExternalIdentifiers;
}

- (void)setTargetAccountExternalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_targetAccountExternalIdentifiers, a3);
}

- (NSSet)sourceAccountExternalIdentifiers
{
  return self->_sourceAccountExternalIdentifiers;
}

- (void)setSourceAccountExternalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, a3);
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (CNAccountsAndGroupsItem)currentlyEditingGroupItem
{
  return self->_currentlyEditingGroupItem;
}

- (void)setCurrentlyEditingGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyEditingGroupItem, a3);
}

- (CNAccountsAndGroupsItem)rootItem
{
  return self->_rootItem;
}

- (void)setRootItem:(id)a3
{
  objc_storeStrong((id *)&self->_rootItem, a3);
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSString)currentlyEditingGroupIdentifier
{
  return self->_currentlyEditingGroupIdentifier;
}

- (void)setCurrentlyEditingGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyEditingGroupIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyEditingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_currentlyEditingGroupItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_serverFilter, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

uint64_t __54__CNAccountsAndGroupsDataSource_sectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke_2;
  v10[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24l;
  v10[4] = a2;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "isSelected");
  else
    v4 = 0;

  return v4;
}

uint64_t __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalIdentifierString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:", v4, v6);

  return v7 ^ 1u;
}

uint64_t __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalIdentifierString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:", v6, v4);

  return v7 ^ 1u;
}

void __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  CNAccountsAndGroupsItem *v12;
  CNAccountsAndGroupsItem *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  CNAccountsAndGroupsItem *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD);
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  CNAccountsAndGroupsSection *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  CNAccountsAndGroupsItem *v61;
  id v62;
  CNAccountsAndGroupsItem *v63;
  void *v64;
  id v65;
  void (**v66)(_QWORD);
  CNAccountsAndGroupsItem *v67;
  id v68;
  id obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  CNAccountsAndGroupsItem *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD aBlock[5];
  id v104;
  CNAccountsAndGroupsItem *v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  char v125;
  _QWORD v126[4];
  id v127;
  id location;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  CNAccountsAndGroupsSection *v134;
  _BYTE v135[128];
  uint8_t v136[128];
  uint8_t buf[4];
  id v138;
  __int16 v139;
  id v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__49706;
  v133 = __Block_byref_object_dispose__49707;
  v134 = objc_alloc_init(CNAccountsAndGroupsSection);
  objc_msgSend((id)v130[5], "setIdentifier:", v7);
  v10 = (void *)v130[5];
  v11 = objc_initWeak(&location, v10);
  objc_msgSend(v10, "setTitleProvider:", v8);

  v12 = [CNAccountsAndGroupsItem alloc];
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2;
  v126[3] = &unk_1E204E250;
  v65 = v8;
  v127 = v65;
  v13 = -[CNAccountsAndGroupsItem initWithType:nameProvider:](v12, "initWithType:nameProvider:", 1, v126);
  -[CNAccountsAndGroupsItem setIdentifier:](v13, "setIdentifier:", v7);
  -[CNAccountsAndGroupsItem setShouldHide:](v13, "setShouldHide:", objc_msgSend(*(id *)(a1 + 32), "onlyShowsGroupsInSections"));
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 1;
  v118 = 0;
  v119 = &v118;
  v120 = 0x2020000000;
  v121 = 0;
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__49706;
  v116 = __Block_byref_object_dispose__49707;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v117 = (id)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x1E0D137F8];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsItem setContainerIdentifier:](v13, "setContainerIdentifier:", v15);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3;
  aBlock[3] = &unk_1E204E278;
  v16 = *(_QWORD *)(a1 + 32);
  v106 = &v112;
  aBlock[4] = v16;
  v107 = &v118;
  v108 = &v122;
  v17 = v7;
  v18 = *(_QWORD *)(a1 + 40);
  v68 = v17;
  v104 = v17;
  v109 = v18;
  v67 = v13;
  v105 = v67;
  v110 = &v129;
  v111 = *(_QWORD *)(a1 + 48);
  v66 = (void (**)(_QWORD))_Block_copy(aBlock);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v9;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v141, 16);
  if (v19)
  {
    v75 = 0;
    v71 = *(_QWORD *)v100;
    v70 = *MEMORY[0x1E0D13848];
    do
    {
      v79 = 0;
      v73 = v19;
      do
      {
        if (*(_QWORD *)v100 != v71)
          objc_enumerationMutation(obj);
        v84 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v79);
        v82 = -[CNAccountsAndGroupsItem initWithType:nameProvider:]([CNAccountsAndGroupsItem alloc], "initWithType:nameProvider:", 2, 0);
        -[CNAccountsAndGroupsItem setContainerType:](v82, "setContainerType:", objc_msgSend(v84, "type"));
        -[CNAccountsAndGroupsItem setBypassIfUnique:](v82, "setBypassIfUnique:", 1);
        -[CNAccountsAndGroupsItem setShouldHide:](v82, "setShouldHide:", objc_msgSend(*(id *)(a1 + 32), "onlyShowsGroupsInSections"));
        objc_msgSend(v84, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentlyEditingGroupIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (v22)
          objc_msgSend(*(id *)(a1 + 32), "setCurrentlyEditingGroupItem:", v82);
        objc_msgSend(v84, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(uint64_t, void *))(v70 + 16))(v70, v23))
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          CNContactsUIBundle();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", v26);
          v27 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v27;
        }
        else
        {
          v28 = v23;
        }
        v74 = v28;
        -[CNAccountsAndGroupsItem setName:](v82, "setName:");
        objc_msgSend(v84, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsItem setIdentifier:](v82, "setIdentifier:", v29);

        v78 = objc_msgSend(*(id *)(a1 + 32), "contactCountForItem:", v82);
        -[CNAccountsAndGroupsItem setContactCount:](v82, "setContactCount:", v78);
        AddAtSortedIndex_block_invoke((void *)v113[5], v82);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0C97318];
        objc_msgSend(v84, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "predicateForGroupsInContainerWithIdentifier:", v32);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "store");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = 0;
        objc_msgSend(v33, "groupsMatchingPredicate:error:", v77, &v98);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v98;

        if (!v80)
        {
          CNUILogAccountsAndGroupsList();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v138 = v84;
            v139 = 2112;
            v140 = v76;
            _os_log_impl(&dword_18AC56000, v34, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting groups for container:%@ with error: %@", buf, 0x16u);
          }

        }
        if (((*(uint64_t (**)(void))(v72 + 16))() & 1) == 0)
        {
          *((_BYTE *)v119 + 24) = 1;
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v35 = v80;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v136, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v95;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v95 != v37)
                  objc_enumerationMutation(v35);
                v39 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
                v40 = -[CNAccountsAndGroupsItem initWithType:nameProvider:]([CNAccountsAndGroupsItem alloc], "initWithType:nameProvider:", 4, 0);
                objc_msgSend(v39, "name");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNAccountsAndGroupsItem setName:](v40, "setName:", v41);

                objc_msgSend(v39, "identifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNAccountsAndGroupsItem setIdentifier:](v40, "setIdentifier:", v42);

                objc_msgSend(v84, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[CNAccountsAndGroupsItem setContainerIdentifier:](v40, "setContainerIdentifier:", v43);

                -[CNAccountsAndGroupsItem setGroup:](v40, "setGroup:", v39);
                -[CNAccountsAndGroupsItem setContactCount:](v40, "setContactCount:", objc_msgSend(*(id *)(a1 + 32), "contactCountForItem:", v40));
                objc_msgSend(v39, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "currentlyEditingGroupIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v43) = objc_msgSend(v44, "isEqualToString:", v45);

                if ((_DWORD)v43)
                  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyEditingGroupItem:", v40);
                AddAtSortedIndex_block_invoke(v30, v40);

              }
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v136, 16);
            }
            while (v36);
          }

          -[CNAccountsAndGroupsItem setChildItems:](v82, "setChildItems:", v30);
        }

        v75 += v78;
        ++v79;
      }
      while (v79 != v73);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v141, 16);
    }
    while (v19);
  }
  else
  {
    v75 = 0;
  }

  -[CNAccountsAndGroupsItem setContactCount:](v67, "setContactCount:", v75);
  v46 = v66;
  if ((objc_msgSend(v68, "_cn_hasPrefix:", CFSTR("ProviderContainer:")) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "hidesSearchableSources") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "onlyShowsGroupsInSections") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersInAccountWithIdentifier:", v68);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "store");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v47, "serverSearchContainersMatchingPredicate:error:", v83, &v93);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v93;

    if (!v85)
    {
      CNUILogAccountsAndGroupsList();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v138 = v81;
        _os_log_impl(&dword_18AC56000, v48, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting server search containers: %@", buf, 0xCu);
      }

    }
    if (((*(uint64_t (**)(void))(v72 + 16))() & 1) == 0)
    {
      if (objc_msgSend(obj, "count"))
      {
        v66[2](v66);
        *((_BYTE *)v123 + 24) = 0;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v113[5];
        v113[5] = v49;

        v51 = objc_alloc_init(CNAccountsAndGroupsSection);
        v52 = (void *)v130[5];
        v130[5] = (uint64_t)v51;

        objc_msgSend(v85, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v130[5], "setIdentifier:", v54);

      }
      else
      {
        *((_BYTE *)v123 + 24) = 0;
      }
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v55 = v85;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v89, v135, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v56; ++j)
          {
            if (*(_QWORD *)v90 != v57)
              objc_enumerationMutation(v55);
            v59 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
            objc_msgSend(v59, "name");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = [CNAccountsAndGroupsItem alloc];
            v86[0] = MEMORY[0x1E0C809B0];
            v86[1] = 3221225472;
            v86[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_70;
            v86[3] = &unk_1E204E2A0;
            v62 = v60;
            v87 = v62;
            objc_copyWeak(&v88, &location);
            v63 = -[CNAccountsAndGroupsItem initWithType:nameProvider:](v61, "initWithType:nameProvider:", 3, v86);
            -[CNAccountsAndGroupsItem setContainerType:](v63, "setContainerType:", objc_msgSend(v59, "type"));
            -[CNAccountsAndGroupsItem setSoloSelect:](v63, "setSoloSelect:", 1);
            objc_msgSend(v59, "identifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsItem setIdentifier:](v63, "setIdentifier:", v64);

            AddAtSortedIndex_block_invoke((void *)v113[5], v63);
            objc_destroyWeak(&v88);

          }
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v89, v135, 16);
        }
        while (v56);
      }

    }
    v46 = v66;
  }
  v46[2](v46);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v129, 8);

}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cnui_displayName");
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2_75(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

id __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALL_CONTACTS_FOR_ACCOUNT-%@"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "onlyShowsGroupsInSections");
    if (!(_DWORD)result || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        CNUILogAccountsAndGroupsList();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = *(_QWORD *)(a1 + 40);
          v8 = 138412290;
          v9 = v4;
          _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] including root item for account identifier: %@", (uint8_t *)&v8, 0xCu);
        }

        AddAtSortedIndex_block_invoke(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(void **)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 48), "setChildItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        objc_msgSend(*(id *)(a1 + 48), "arrayForDisplay:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setItems:", v5);

      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      CNUILogAccountsAndGroupsList();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] adding accountSection: %@", (uint8_t *)&v8, 0xCu);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    }
  }
  return result;
}

id __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_70(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SERVER_SEARCH_TITLE_FORMAT-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = *(id *)(a1 + 32);
  }
  return v7;
}

BOOL __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      objc_msgSend(v3, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8 != objc_msgSend(v9, "count");

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_3;
  v6[3] = &unk_1E204E228;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "_cn_any:", v6);

  return v4;
}

BOOL __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _BOOL8 v11;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (objc_msgSend(v5, "name"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "name"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          v7,
          v9))
    {
      v10 = objc_msgSend(v6, "contactCount");
      v11 = v10 != objc_msgSend(v3, "contactCount");
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
