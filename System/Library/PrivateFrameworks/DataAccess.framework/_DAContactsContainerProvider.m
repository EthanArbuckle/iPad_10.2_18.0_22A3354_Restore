@implementation _DAContactsContainerProvider

- (_DAContactsContainerProvider)initWithContactStore:(id)a3
{
  id v5;
  _DAContactsContainerProvider *v6;
  _DAContactsContainerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DAContactsContainerProvider;
  v6 = -[_DAContactsContainerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  DAContactsContainer *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountWithExternalIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DAContactsContainerProvider contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "accountsMatchingPredicate:error:", v7, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForContainersInAccountWithIdentifier:includingDisabledContainers:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DAContactsContainerProvider contactStore](self, "contactStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v15, "containersMatchingPredicate:error:", v14, &v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v16;
  v19 = (DAContactsContainer *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v19)
  {
    v27 = v17;
    v28 = v10;
    v29 = v7;
    v20 = *(_QWORD *)v31;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v20)
        objc_enumerationMutation(v18);
      v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v21);
      objc_msgSend(v22, "externalIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v6);

      if ((v24 & 1) != 0)
        break;
      if (v19 == (DAContactsContainer *)++v21)
      {
        v19 = (DAContactsContainer *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v19)
          goto LABEL_3;
        v25 = v18;
        goto LABEL_12;
      }
    }
    v25 = v22;

    if (v25)
    {
      v19 = -[DAContactsContainer initWithCNContainer:]([DAContactsContainer alloc], "initWithCNContainer:", v25);
LABEL_12:
      v10 = v28;
      v7 = v29;
      v17 = v27;
      goto LABEL_14;
    }
    v19 = 0;
    v10 = v28;
    v7 = v29;
    v17 = v27;
  }
  else
  {
    v25 = v18;
LABEL_14:

  }
  return v19;
}

- (id)allContainers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DAContactsContainer *v14;
  DAContactsContainer *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersIncludingDisabled:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DAContactsContainerProvider contactStore](self, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "containersMatchingPredicate:error:", v3, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = [DAContactsContainer alloc];
        v15 = -[DAContactsContainer initWithCNContainer:](v14, "initWithCNContainer:", v13, (_QWORD)v17);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  DAContactsContainer *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountWithExternalIdentifier:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[_DAContactsContainerProvider contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v23 = (void *)v4;
  objc_msgSend(v5, "accountsMatchingPredicate:error:", v4, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v29;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForContainersInAccountWithIdentifier:includingDisabledContainers:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DAContactsContainerProvider contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v11, "containersMatchingPredicate:error:", v10, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = -[DAContactsContainer initWithCNContainer:]([DAContactsContainer alloc], "initWithCNContainer:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19));
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v17);
  }

  return v14;
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  _BOOL8 v10;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  DAContactsContainer *v24;

  v10 = a8;
  v16 = (objc_class *)MEMORY[0x1E0C97368];
  v17 = a10;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(v16);
  objc_msgSend(v22, "setType:", a3);
  objc_msgSend(v22, "setName:", v21);

  objc_msgSend(v22, "setExternalIdentifier:", v20);
  objc_msgSend(v22, "setConstraintsPath:", v19);

  objc_msgSend(v22, "setExternalSyncData:", v18);
  objc_msgSend(v17, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setAccountIdentifier:", v23);
  v24 = -[DAContactsContainer initWithCNContainer:]([DAContactsContainer alloc], "initWithCNContainer:", v22);
  -[DAContactsContainer setContentReadonly:](v24, "setContentReadonly:", v10);
  -[DAContactsContainer setArePropertiesReadonly:](v24, "setArePropertiesReadonly:", a9);

  return v24;
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v7[16];

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Setting default container is not implemented yet. <rdar://problem/40239535>", v7, 2u);
  }

}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  uint8_t v7[16];

  v3 = a3;
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B51E4000, v4, v5, "Setting last sync date on container is not implemented yet.", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("setLastSyncDateForContainer"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
