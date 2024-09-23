@implementation CNUIGroupsAndContainersSaveManager

- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3
{
  id v4;
  CNContactViewCache *v5;
  CNUIGroupsAndContainersSaveManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNContactViewCache);
  v6 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:contactViewCache:](self, "initWithContactStore:contactViewCache:", v4, v5);

  return v6;
}

- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3 contactViewCache:(id)a4
{
  id v7;
  id v8;
  CNUIGroupsAndContainersSaveManager *v9;
  CNUIGroupsAndContainersSaveManager *v10;
  CNUIGroupsAndContainersSaveManager *v11;
  id v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNUIGroupsAndContainersSaveManager;
  v9 = -[CNUIGroupsAndContainersSaveManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("parameter ‘contactStore’ must be nonnull"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contactViewCache, a4);
    v11 = v10;
  }

  return v10;
}

- (id)addContact:(id)a3 toGroupIdentifier:(id)a4 inContainerIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (a4)
  {
    -[CNUIGroupsAndContainersSaveManager groupForGroupIdentifier:](self, "groupForGroupIdentifier:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager addContact:toGroup:inContainer:moveWasAuthorized:](self, "addContact:toGroup:inContainer:moveWasAuthorized:", v10, a4, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)addContact:(id)a3 toGroupWithIdentifier:(id)a4 moveWasAuthorized:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[CNUIGroupsAndContainersSaveManager groupForGroupIdentifier:](self, "groupForGroupIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager addContact:toGroup:moveWasAuthorized:](self, "addContact:toGroup:moveWasAuthorized:", v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addContact:(id)a3 toGroup:(id)a4 moveWasAuthorized:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNUIGroupsAndContainersContactsSaveResult *v13;
  NSObject *v14;
  CNUIGroupsAndContainersContactsSaveResult *v15;
  int v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupsAndContainersSaveManager containerForGroupIdentifier:](self, "containerForGroupIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIGroupsAndContainersSaveManager addContact:toGroup:inContainer:moveWasAuthorized:](self, "addContact:toGroup:inContainer:moveWasAuthorized:", v8, v10, v12, v5);
    v13 = (CNUIGroupsAndContainersContactsSaveResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_error_impl(&dword_18AC56000, v14, OS_LOG_TYPE_ERROR, "failed to add contact to group, group is nil, full contact:%@", (uint8_t *)&v17, 0xCu);
    }

    v15 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    v13 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v15, "initWithSuccess:error:addedContacts:", 0, 0, MEMORY[0x1E0C9AA60]);
  }

  return v13;
}

- (id)addContact:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CNUIGroupsAndContainersContactsSaveResult *v15;
  NSObject *v16;
  __CFString *v17;
  CNUIGroupsAndContainersContactsSaveResult *v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group, contact is nil", buf, 2u);
    }
    goto LABEL_11;
  }
  if (!v12)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    if (v11)
    {
      objc_msgSend(v11, "identifier");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E20507A8;
    }
    *(_DWORD *)buf = 138412546;
    v23 = v17;
    v24 = 2112;
    v25 = v10;
    _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group %@, container is nil, full contact:%@", buf, 0x16u);
    if (!v11)
      goto LABEL_11;
LABEL_20:

LABEL_11:
    v18 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    v15 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v18, "initWithSuccess:error:addedContacts:", 0, 0, MEMORY[0x1E0C9AA60]);
    goto LABEL_12;
  }
  if (!a6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    if (v11)
    {
      objc_msgSend(v11, "identifier");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E20507A8;
    }
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v17;
    v24 = 2112;
    v25 = v20;
    v26 = 2112;
    v27 = v10;
    _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group %@ and new container %@, move was not authorized, full contact:%@", buf, 0x20u);

    if (!v11)
      goto LABEL_11;
    goto LABEL_20;
  }
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager addContacts:toGroup:inContainer:moveWasAuthorized:](self, "addContacts:toGroup:inContainer:moveWasAuthorized:", v14, v11, v13, 1);
  v15 = (CNUIGroupsAndContainersContactsSaveResult *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v15;
}

- (id)addContacts:(id)a3 toGroupWithIdentifier:(id)a4 inContainerWithIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  CNUIGroupsAndContainersContactsSaveResult *v24;
  CNUIGroupsAndContainersContactsSaveResult *v25;
  CNUIGroupsAndContainersContactsSaveResult *v26;
  const __CFString *v28;
  const __CFString *v29;
  int v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = &stru_1E20507A8;
      if (v11)
        v14 = v11;
      v30 = 138412546;
      v31 = v14;
      v32 = 2112;
      v33 = v12;
      v15 = "Failed to add contacts to new group with identifier %@ in container with identifier: %@, contacts is nil";
      v16 = v13;
      v17 = 22;
LABEL_25:
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v30, v17);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v18 = *MEMORY[0x1E0D13850];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v12) & 1) != 0)
  {
    -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if ((*(unsigned int (**)(uint64_t, __CFString *))(v18 + 16))(v18, v11))
      {
        -[CNUIGroupsAndContainersSaveManager groupForGroupIdentifier:](self, "groupForGroupIdentifier:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = &stru_1E20507A8;
            if (v11)
              v22 = v11;
            v30 = 138412546;
            v31 = v22;
            v32 = 2112;
            v33 = v12;
            v23 = "Failed to add contacts to new group with identifier %@ in container with identifier: %@, new group is nil";
LABEL_29:
            _os_log_error_impl(&dword_18AC56000, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v30, 0x16u);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
      }
      else
      {
        v20 = 0;
      }
      -[CNUIGroupsAndContainersSaveManager addContacts:toGroup:inContainer:moveWasAuthorized:](self, "addContacts:toGroup:inContainer:moveWasAuthorized:", v10, v20, v19, v6);
      v25 = (CNUIGroupsAndContainersContactsSaveResult *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v29 = &stru_1E20507A8;
      if (v11)
        v29 = v11;
      v30 = 138412546;
      v31 = v29;
      v32 = 2112;
      v33 = v12;
      v23 = "Failed to add contacts to new group with identifier %@, container for identifier: %@ is nil";
      goto LABEL_29;
    }
LABEL_17:

    v26 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    v25 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v26, "initWithSuccess:error:addedContacts:", 0, 0, MEMORY[0x1E0C9AA60]);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v28 = &stru_1E20507A8;
    if (v11)
      v28 = v11;
    v30 = 138412290;
    v31 = v28;
    v15 = "Failed to add contacts to new group with identifier %@, container identifier is empty";
    v16 = v13;
    v17 = 12;
    goto LABEL_25;
  }
LABEL_15:

  v24 = [CNUIGroupsAndContainersContactsSaveResult alloc];
  v25 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v24, "initWithSuccess:error:addedContacts:", 0, 0, MEMORY[0x1E0C9AA60]);
LABEL_21:

  return v25;
}

- (id)addContacts:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  CNUIGroupsAndContainersContactsSaveResult *v15;
  CNUIGroupsAndContainersContactsSaveResult *v16;
  void *v17;
  CNUIGroupContext *v18;
  id v20;
  void *v21;
  _QWORD v22[2];

  v6 = a6;
  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))();
  if (!v12 || v13)
  {
    v15 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    v16 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v15, "initWithSuccess:error:addedContacts:", 0, 0, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    if (v11)
    {
      v22[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }
    v20 = v12;
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CNUIGroupContext initWithAddedGroupsByContainerDict:removedGroups:]([CNUIGroupContext alloc], "initWithAddedGroupsByContainerDict:removedGroups:", v17, 0);
    -[CNUIGroupsAndContainersSaveManager updateContacts:forGroupContext:ignoresGuardianRestrictions:issuedRequestIdentifiers:](self, "updateContacts:forGroupContext:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v10, v18, v6, 0);
    v16 = (CNUIGroupsAndContainersContactsSaveResult *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)updateContacts:(id)a3 forGroupContext:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  CNUIGroupsAndContainersContactsSaveResult *v39;
  CNUIGroupsAndContainersContactsSaveResult *v40;
  id v42;
  id v43;
  _BOOL4 v44;
  id v45;
  id obj;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v7 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v47 = a4;
  v45 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  v44 = v7;
  objc_msgSend(v11, "setIgnoresGuardianRestrictions:", v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "mutableCopy");
        -[CNUIGroupsAndContainersSaveManager _updateSaveRequest:addContact:toGroupContext:contactsToLink:](self, "_updateSaveRequest:addContact:toGroupContext:contactsToLink:", v11, v19, v47, v18);
        v20 = v11;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "setObject:forKeyedSubscript:", v18, v21);
        objc_msgSend(v12, "addObject:", v21);

        v11 = v20;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v14);
  }

  -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v23 = objc_msgSend(v22, "executeSaveRequest:error:", v11, &v53);
  v24 = v53;

  v25 = v45;
  if (v45)
  {
    objc_msgSend(v11, "saveRequestIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v26);

  }
  if ((v23 & 1) != 0)
  {
    v42 = v24;
    v43 = v11;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v27 = v48;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      LOBYTE(v31) = 1;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((v31 & 1) != 0
            && (objc_msgSend(v27, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j)),
                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                v35 = -[CNUIGroupsAndContainersSaveManager addLinkedContacts:toOriginalContact:ignoresGuardianRestrictions:issuedRequestIdentifiers:](self, "addLinkedContacts:toOriginalContact:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v34, v33, v44, 0), v34, v35))
          {
            v31 = 1;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v27, "objectForKeyedSubscript:", v33);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v60 = v37;
              v61 = 2112;
              v62 = v33;
              _os_log_error_impl(&dword_18AC56000, v36, OS_LOG_TYPE_ERROR, "Failed to link contacts:%@ to contact:%@", buf, 0x16u);

            }
            v31 = 0;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v29);
    }
    else
    {
      v31 = 1;
    }

    v40 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:]([CNUIGroupsAndContainersContactsSaveResult alloc], "initWithSuccess:error:addedContacts:", v31, 0, v12);
    v25 = v45;
    v24 = v42;
    v11 = v43;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v60 = obj;
      v61 = 2112;
      v62 = v47;
      v63 = 2112;
      v64 = v24;
      _os_log_error_impl(&dword_18AC56000, v38, OS_LOG_TYPE_ERROR, "Failed to update contacts:%@, for groupContext:%@, error: %@", buf, 0x20u);
    }

    v39 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    v40 = -[CNUIGroupsAndContainersContactsSaveResult initWithSuccess:error:addedContacts:](v39, "initWithSuccess:error:addedContacts:", 0, v24, MEMORY[0x1E0C9AA60]);
  }

  return v40;
}

- (BOOL)addLinkedContacts:(id)a3 toOriginalContact:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  CNUIContactSaveConfiguration *v19;
  void *v20;
  void *v21;
  CNUIContactSaveConfiguration *v22;
  CNUIContactStoreLinkedContactSaveExecutor *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  BOOL v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    if (objc_msgSend(v11, "hasBeenPersisted"))
    {
      v14 = v11;
      v15 = v10;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v10, "count") < 2)
      {
        v16 = 0;
        v14 = 0;
        v13 = 1;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", 0);
    }
    v13 = 1;
    if (v10 && v14)
    {
      v29 = a5;
      v16 = v10;
      if (objc_msgSend(v14, "isUnified"))
      {
        objc_msgSend(v14, "mainStoreLinkedContacts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v17);

      }
      else
      {
        objc_msgSend(v16, "addObject:", v14);
      }
      -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "containerForContact:", v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = [CNUIContactSaveConfiguration alloc];
      v20 = (void *)objc_msgSend(v14, "mutableCopy");
      -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v27) = v29;
      v22 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v19, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v14, v20, 0, v16, v21, 0, v28, 0, 0, v27);

      v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
      -[CNUIContactStoreLinkedContactSaveExecutor executeSaveWithConfiguration:saveDelegate:](v23, "executeSaveWithConfiguration:saveDelegate:", v22, self);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifiersOfIssuedSaveRequests");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v25);

      v13 = objc_msgSend(v24, "success");
    }
    else
    {
      v16 = v10;
    }
    goto LABEL_15;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroupContext:(id)a5 contactsToLink:(id)a6
{
  id v10;
  id v11;
  id v12;
  CNUIGroupsAndContainersSaveManager *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id obj;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v10 = a4;
  v11 = a5;
  v32 = a6;
  v12 = v10;
  v13 = self;
  -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerForContact:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v11, "addedGroupsByContainerDict");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v16 = v12;
  v17 = v12;
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v35;
    v17 = v12;
    do
    {
      v20 = 0;
      v21 = v17;
      do
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v20);
        objc_msgSend(v11, "addedGroupsByContainerDict");
        v23 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v23;
        -[CNUIGroupsAndContainersSaveManager _updateSaveRequest:addContact:toGroups:inContainer:contactParentContainer:contactsToLink:](v13, "_updateSaveRequest:addContact:toGroups:inContainer:contactParentContainer:contactsToLink:", v33, v16, v25, v22, v31, v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ++v20;
        v21 = v17;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v18);
  }

  v26 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v11, "removedGroups");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = (*(uint64_t (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  if ((v26 & 1) == 0)
  {
    objc_msgSend(v11, "removedGroups");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupsAndContainersSaveManager _updateSaveRequest:removeContact:fromGroups:](v13, "_updateSaveRequest:removeContact:fromGroups:", v33, v16, v28);

  }
  return v17;
}

- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroups:(id)a5 inContainer:(id)a6 contactParentContainer:(id)a7 contactsToLink:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  NSObject *v54;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v59 = a5;
  v16 = a6;
  v17 = a7;
  v60 = a8;
  objc_msgSend(v16, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!objc_msgSend(v15, "hasBeenPersisted"))
    goto LABEL_17;
  if (v20)
  {
    v21 = v15;
    if (!v21)
    {
LABEL_17:
      v58 = v17;
      if (objc_msgSend(v16, "type") == 2 && objc_msgSend(v15, "hasBeenPersisted"))
      {
        -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v16;
        objc_msgSend(v31, "accountForContainer:", v16);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNUIGroupsAndContainersSaveManager exchangeContactsToDeleteInAccountIdentifier:originalContact:](self, "exchangeContactsToDeleteInAccountIdentifier:originalContact:", v34, v15);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v67 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(v14, "deleteContact:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
          }
          while (v38);
        }

        v16 = v32;
      }
      v41 = objc_alloc_init(MEMORY[0x1E0C973A0]);
      objc_msgSend(v16, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setContainerIdentifier:", v42);

      objc_msgSend(v41, "setIgnoresGuardianRestrictions:", objc_msgSend(v14, "ignoresGuardianRestrictions"));
      -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      objc_msgSend(v43, "policyWithDescription:error:", v41, &v65);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v65;

      if (v44)
      {
        +[CNUIContactPolicyValidator contactFromContact:conformingToPolicy:options:](CNUIContactPolicyValidator, "contactFromContact:conformingToPolicy:options:", v15, v44, 5);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addContact:toContainerWithIdentifier:", v30, v45);

        objc_msgSend(v15, "availableKeyDescriptor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v30, "copyWithPropertyKeys:", v47);
        objc_msgSend(v60, "addObject:", v48);

        v24 = v59;
        if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
        {
          v57 = v16;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v49 = v59;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v62 != v52)
                  objc_enumerationMutation(v49);
                objc_msgSend(v14, "addMember:toGroup:", v30, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j), v57);
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
            }
            while (v51);
          }

          v24 = v59;
          v16 = v57;
        }
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v77 = v56;
          v78 = 2112;
          v79 = v15;
          v80 = 2114;
          v81 = v21;
          _os_log_error_impl(&dword_18AC56000, v54, OS_LOG_TYPE_ERROR, "Failed to get policy for container:%{public}@ to add contact:%@, error:%{public}@", buf, 0x20u);

        }
        v30 = v15;
        v24 = v59;
      }

      v17 = v58;
      goto LABEL_41;
    }
  }
  else
  {
    if (!objc_msgSend(v15, "isUnified"))
      goto LABEL_17;
    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupsAndContainersSaveManager linkedContactForContact:inContainer:inContactStore:](self, "linkedContactForContact:inContainer:inContactStore:", v15, v16, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (id)objc_msgSend(v23, "mutableCopy");
    if (!v21)
      goto LABEL_17;
  }
  v24 = v59;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v25 = v59;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v71 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v14, "addMember:toGroup:", v21, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v27);
    }

    v24 = v59;
  }
  v30 = v15;
LABEL_41:

  return v30;
}

- (id)linkedContactForContact:(id)a3 inContainer:(id)a4 inContactStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "linkedContacts", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[CNUIGroupsAndContainersSaveManager container:containsNonUnifiedContact:inContactStore:](self, "container:containsNonUnifiedContact:inContactStore:", v8, v15, v9))
        {
          v16 = v15;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)container:(id)a3 containsNonUnifiedContact:(id)a4 inContactStore:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C972C0];
  v9 = a5;
  objc_msgSend(a4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForContainerOfContactWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containersMatchingPredicate:error:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__CNUIGroupsAndContainersSaveManager_container_containsNonUnifiedContact_inContactStore___block_invoke;
  v15[3] = &unk_1E2048D98;
  v16 = v7;
  v13 = v7;
  LOBYTE(v10) = objc_msgSend(v12, "indexOfObjectPassingTest:", v15) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v10;
}

- (id)exchangeContactsToDeleteInAccountIdentifier:(id)a3 originalContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountForContact:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v6);

  if (v11)
    objc_msgSend(v25, "addObject:", v7);
  if (objc_msgSend(v7, "isUnified"))
  {
    v23 = v9;
    v24 = v7;
    objc_msgSend(v7, "linkedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16);
          -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accountForContact:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v6);

          if (v21)
            objc_msgSend(v25, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v9 = v23;
    v7 = v24;
  }

  return v25;
}

- (BOOL)removeContact:(id)a3 fromGroup:(id)a4 ignoresGuardianRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    v13 = a4;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = a4;
    objc_msgSend(v9, "arrayWithObjects:count:", &v13, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[CNUIGroupsAndContainersSaveManager removeContact:fromGroups:ignoresGuardianRestrictions:](self, "removeContact:fromGroups:ignoresGuardianRestrictions:", v8, a4, v5, v13, v14);

  return v11;
}

- (BOOL)removeContact:(id)a3 fromGroups:(id)a4 ignoresGuardianRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Failed to remove contact from groups, contact is nil";
      goto LABEL_14;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_12;
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Failed to remove contact from groups, no groups provided";
LABEL_14:
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  -[NSObject setIgnoresGuardianRestrictions:](v10, "setIgnoresGuardianRestrictions:", v5);
  v13 = (void *)objc_msgSend(v8, "mutableCopy");
  -[CNUIGroupsAndContainersSaveManager _updateSaveRequest:removeContact:fromGroups:](self, "_updateSaveRequest:removeContact:fromGroups:", v10, v13, v9);

  -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = objc_msgSend(v14, "executeSaveRequest:error:", v10, &v18);
  v15 = v18;

  if ((v12 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v15;
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Failed to remove contact from groups, contact: %@, groups: %@ with error: %@", buf, 0x20u);
    }

  }
LABEL_12:

  return v12;
}

- (void)_updateSaveRequest:(id)a3 removeContact:(id)a4 fromGroups:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  obj = a5;
  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        v21 = v10;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
          if (objc_msgSend(v8, "isUnified", v21))
          {
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            objc_msgSend(v8, "linkedContacts");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v24;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v24 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
                  if ((objc_msgSend(v19, "isSuggested") & 1) == 0)
                  {
                    v20 = (void *)objc_msgSend(v19, "mutableCopy");
                    objc_msgSend(v7, "removeMember:fromGroup:", v20, v13);

                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              }
              while (v16);
            }

            v10 = v21;
          }
          else
          {
            objc_msgSend(v7, "removeMember:fromGroup:", v8, v13);
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }
  }

}

- (BOOL)deleteGroupWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C973D0];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v14, "setIgnoresGuardianRestrictions:", v6);
  objc_msgSend(v14, "saveRequestIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  -[CNUIGroupsAndContainersSaveManager groupForGroupIdentifier:](self, "groupForGroupIdentifier:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  LOBYTE(self) = objc_msgSend(v17, "deleteGroupInStore:saveRequest:", v12, v14);

  return (char)self;
}

- (BOOL)deleteContainerWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C973D0];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v14, "setIgnoresGuardianRestrictions:", v6);
  objc_msgSend(v14, "saveRequestIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  LOBYTE(self) = objc_msgSend(v17, "deleteContainerInStore:saveRequest:", v12, v14);

  return (char)self;
}

- (BOOL)updateGroupWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C973D0];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  objc_msgSend(v17, "setIgnoresGuardianRestrictions:", v7);
  objc_msgSend(v17, "saveRequestIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v18);

  -[CNUIGroupsAndContainersSaveManager groupForGroupIdentifier:](self, "groupForGroupIdentifier:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v20, "setName:", v14);

  LOBYTE(v14) = objc_msgSend(v20, "updateGroupInStore:saveRequest:", v15, v17);
  return (char)v14;
}

- (BOOL)updateContainerWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C973D0];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  objc_msgSend(v17, "setIgnoresGuardianRestrictions:", v7);
  objc_msgSend(v17, "saveRequestIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v18);

  -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v20, "setName:", v14);

  LOBYTE(v14) = objc_msgSend(v20, "updateContainerInStore:saveRequest:", v15, v17);
  return (char)v14;
}

- (BOOL)isAuthorizedToAddContact:(id)a3 toContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
    goto LABEL_5;
  if (v9)
    goto LABEL_4;
  -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultContainerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
LABEL_4:
    v13 = -[CNUIGroupsAndContainersSaveManager isAuthorizedToEditContact:withTargetContainer:ignoresParentalRestrictions:](self, "isAuthorizedToEditContact:withTargetContainer:ignoresParentalRestrictions:", v8, v10, v5);
  else
LABEL_5:
    v13 = 0;

  return v13;
}

- (BOOL)isMDMAuthorizedToAddContact:(id)a3 toAccount:(id)a4 withManagedConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "deviceHasManagementRestrictions"))
  {
    -[CNUIGroupsAndContainersSaveManager parentAccountExternalIdentifiersForContact:](self, "parentAccountExternalIdentifiersForContact:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__CNUIGroupsAndContainersSaveManager_isMDMAuthorizedToAddContact_toAccount_withManagedConfiguration___block_invoke;
    v14[3] = &unk_1E204E358;
    v15 = v10;
    v16 = v9;
    v12 = objc_msgSend(v11, "_cn_any:", v14) ^ 1;

  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetGroupWithIdentifier:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  BOOL v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = 0;
  if (v8 && a4)
  {
    -[CNUIGroupsAndContainersSaveManager containerForGroupIdentifier:](self, "containerForGroupIdentifier:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = -[CNUIGroupsAndContainersSaveManager isAuthorizedToEditContact:withTargetContainer:ignoresParentalRestrictions:](self, "isAuthorizedToEditContact:withTargetContainer:ignoresParentalRestrictions:", v8, v10, v5);
    else
      v9 = 0;

  }
  return v9;
}

- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerForContact:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (!-[CNUIGroupsAndContainersSaveManager editRequiresAuthorizationForContact:parentContainer:ignoresParentalRestrictions:](self, "editRequiresAuthorizationForContact:parentContainer:ignoresParentalRestrictions:", v8, v11, v5))
  {
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0
      || !-[CNUIGroupsAndContainersSaveManager editRequiresAuthorizationForContact:parentContainer:ignoresParentalRestrictions:](self, "editRequiresAuthorizationForContact:parentContainer:ignoresParentalRestrictions:", v8, v9, v5))
    {
      v15 = 1;
    }
  }

  return v15;
}

- (BOOL)editRequiresAuthorizationForContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D13CB8];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithContact:parentContainer:ignoresParentalRestrictions:linkedParentContainerProvider:", v10, v9, v5, v12);

  LOBYTE(v10) = objc_msgSend(v13, "shouldPromptForPasscodeAuthorization");
  return (char)v10;
}

- (BOOL)isAuthorizedToEditContainerWithIdentifier:(id)a3
{
  CNUIGroupsAndContainersSaveManager *v3;
  void *v4;

  if (!a3)
    return 0;
  v3 = self;
  -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CNUIGroupsAndContainersSaveManager isAuthorizedToEditContainer:](v3, "isAuthorizedToEditContainer:", v4);

  return (char)v3;
}

- (BOOL)isAuthorizedToEditContainer:(id)a3
{
  char v3;

  if (!a3)
    return 0;
  v3 = objc_msgSend(a3, "isGuardianRestricted");
  return v3 & objc_msgSend(MEMORY[0x1E0D13CB8], "isAuthorizationPasscodeEnabledOnDevice") ^ 1;
}

- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  CNUIEditAuthorizationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a5;
  v18 = a3;
  v10 = a4;
  -[CNUIGroupsAndContainersSaveManager setAuthorizationResultBlock:](self, "setAuthorizationResultBlock:", a6);
  -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(CNUIEditAuthorizationController);
    -[CNUIGroupsAndContainersSaveManager setAuthorizationController:](self, "setAuthorizationController:", v12);

    -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSender:", v10);

    -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnimated:", v7);

    -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGuardedViewController:", v18);

  }
  -[CNUIGroupsAndContainersSaveManager authorizationController](self, "authorizationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAuthorizationUI");

}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  -[CNUIGroupsAndContainersSaveManager setAuthorizationController:](self, "setAuthorizationController:", 0);
  -[CNUIGroupsAndContainersSaveManager authorizationResultBlock](self, "authorizationResultBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNUIGroupsAndContainersSaveManager authorizationResultBlock](self, "authorizationResultBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, a4);

    -[CNUIGroupsAndContainersSaveManager setAuthorizationResultBlock:](self, "setAuthorizationResultBlock:", 0);
  }
}

- (id)groupsByContainerDictForContainers:(id)a3 groups:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      v13 = MEMORY[0x1E0C9AA60];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v11);
    }

  }
  if (v7)
  {
    v27 = v7;
    v28 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v20, "identifier", v27, v28, (_QWORD)v29);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNUIGroupsAndContainersSaveManager containerForGroupIdentifier:](self, "containerForGroupIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v22);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v17);
    }

    v7 = v27;
    v6 = v28;
  }

  return v8;
}

- (id)containerForContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C972C0];
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForContainersWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v9, "containersMatchingPredicate:error:", v8, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v10)
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Error fetching container for container identifier:%@, error: %@", buf, 0x16u);
      }

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)groupForGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C97318];
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForGroupsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v9, "groupsMatchingPredicate:error:", v8, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v10)
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Error fetching group for group identifier:%@, error: %@", buf, 0x16u);
      }

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)acAccountForGroupIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[CNUIGroupsAndContainersSaveManager containerForGroupIdentifier:](self, "containerForGroupIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CNUIGroupsAndContainersSaveManager acAccountForContainer:](self, "acAccountForContainer:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)accountForContainerIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountForContainerWithIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountsMatchingPredicate:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)acAccountForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountForContainer:shouldUseTopLevelAccount:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)containerForGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainerOfGroupWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v6, "containersMatchingPredicate:error:", v5, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    if (v7)
    {
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v8;
        _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Error fetching parent container for group identifier:%@, error: %@", buf, 0x16u);
      }

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)parentGroupsForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97318], "predicateForGroupsWithMemberContact:includeAllParentGroups:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "groupsMatchingPredicate:error:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Error fetching parent groups for contact:%@, error: %@", buf, 0x16u);
    }

  }
  return v7;
}

- (id)parentAccountExternalIdentifiersForContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v4, "isUnified"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "linkedContacts", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
          -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "containerForContact:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accountForContainer:shouldUseTopLevelAccount:", v13, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_cn_addNonNilObject:", v16);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containerForContact:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIGroupsAndContainersSaveManager contactViewCache](self, "contactViewCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountForContainer:shouldUseTopLevelAccount:", v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_addNonNilObject:", v21);

  }
  return v5;
}

- (id)mdmUnauthorizedContactIdentifiersForTargetGroup:(id)a3 withManagedConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  id obj;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  CNUIGroupsAndContainersSaveManager *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "deviceHasManagementRestrictions"))
    goto LABEL_46;
  -[CNUIGroupsAndContainersSaveManager allMDMUnauthorizedAccountsForTargetGroup:withManagedConfiguration:](self, "allMDMUnauthorizedAccountsForTargetGroup:withManagedConfiguration:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    goto LABEL_45;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (!v10)
    goto LABEL_44;
  v11 = v10;
  v66 = self;
  v52 = v9;
  v53 = v7;
  v54 = v6;
  v12 = 0;
  v58 = *(_QWORD *)v85;
  v13 = *MEMORY[0x1E0C96768];
  v14 = 0x1E0C97000uLL;
  v61 = *MEMORY[0x1E0C96768];
  do
  {
    v15 = 0;
    v55 = v11;
    do
    {
      if (*(_QWORD *)v85 != v58)
        objc_enumerationMutation(obj);
      v60 = v15;
      v16 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v15);
      v17 = *(void **)(v14 + 704);
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "predicateForContainersInAccountWithIdentifier:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      -[CNUIGroupsAndContainersSaveManager contactStore](v66, "contactStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v12;
      v59 = (void *)v19;
      objc_msgSend(v20, "containersMatchingPredicate:error:", v19, &v83);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v83;

      if (v21)
      {
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v62 = v21;
        v67 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        if (!v67)
          goto LABEL_38;
        v57 = v21;
        v65 = *(_QWORD *)v80;
        v23 = 0x1E0C97000uLL;
        v24 = 0x1E0C99000uLL;
        v25 = v22;
        do
        {
          v26 = 0;
          do
          {
            v27 = v25;
            if (*(_QWORD *)v80 != v65)
              objc_enumerationMutation(v62);
            v69 = v26;
            v28 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v26);
            v29 = *(void **)(v23 + 512);
            objc_msgSend(v28, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "predicateForContactsInContainerWithIdentifier:", v30);
            v31 = objc_claimAutoreleasedReturnValue();

            -[CNUIGroupsAndContainersSaveManager contactStore](v66, "contactStore");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v13;
            objc_msgSend(*(id *)(v24 + 3360), "arrayWithObjects:count:", &v90, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v27;
            v68 = (void *)v31;
            objc_msgSend(v32, "unifiedContactsMatchingPredicate:keysToFetch:error:", v31, v33, &v78);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v78;

            if (v34)
            {
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v35 = v34;
              v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
              if (v36)
              {
                v37 = v36;
                v63 = v34;
                v64 = v25;
                v38 = *(_QWORD *)v75;
                do
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v75 != v38)
                      objc_enumerationMutation(v35);
                    v40 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                    objc_msgSend(v40, "identifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "addObject:", v41);

                    if (objc_msgSend(v40, "isUnified"))
                    {
                      v72 = 0u;
                      v73 = 0u;
                      v70 = 0u;
                      v71 = 0u;
                      objc_msgSend(v40, "linkedContacts");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
                      if (v43)
                      {
                        v44 = v43;
                        v45 = *(_QWORD *)v71;
                        do
                        {
                          for (j = 0; j != v44; ++j)
                          {
                            if (*(_QWORD *)v71 != v45)
                              objc_enumerationMutation(v42);
                            objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "identifier");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v8, "addObject:", v47);

                          }
                          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
                        }
                        while (v44);
                      }

                    }
                  }
                  v37 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
                }
                while (v37);
                v13 = v61;
                v23 = 0x1E0C97000;
                v24 = 0x1E0C99000;
                v34 = v63;
                v25 = v64;
              }
            }
            else
            {
              CNUILogContactList();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v25, "localizedDescription");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v93 = v28;
                v94 = 2112;
                v95 = v48;
                _os_log_error_impl(&dword_18AC56000, v35, OS_LOG_TYPE_ERROR, "Error fetching contacts for container: %@ with error: %@", buf, 0x16u);

              }
            }

            v26 = v69 + 1;
          }
          while (v69 + 1 != v67);
          v67 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        }
        while (v67);
        v12 = v25;
        v11 = v55;
        v14 = 0x1E0C97000;
        v21 = v57;
      }
      else
      {
        CNUILogContactList();
        v62 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
LABEL_38:
          v12 = v22;
          goto LABEL_39;
        }
        v12 = v22;
        objc_msgSend(v22, "localizedDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v93 = v16;
        v94 = 2112;
        v95 = v49;
        _os_log_error_impl(&dword_18AC56000, v62, OS_LOG_TYPE_ERROR, "Error fetching containers for account: %@ with error: %@", buf, 0x16u);

      }
LABEL_39:

      v15 = v60 + 1;
    }
    while (v60 + 1 != v11);
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    v11 = v50;
  }
  while (v50);

  v7 = v53;
  v6 = v54;
  v9 = v52;
LABEL_44:

LABEL_45:
LABEL_46:

  return v8;
}

- (id)allMDMUnauthorizedAccountsForTargetGroup:(id)a3 withManagedConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "deviceHasManagementRestrictions"))
  {
    -[CNUIGroupsAndContainersSaveManager contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v8, "accountsMatchingPredicate:error:", 0, &v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v32;

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    {
      CNUILogContactList();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v12;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIGroupsAndContainersSaveManager acAccountForGroupIdentifier:](self, "acAccountForGroupIdentifier:", v13);
      v11 = objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v24 = v10;
        v26 = v6;
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v25 = v9;
        v14 = v9;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
              -[NSObject identifier](v11, "identifier", v24);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "externalIdentifierString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v7, "canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:", v20, v21);

              if ((v22 & 1) == 0)
                objc_msgSend(v27, "addObject:", v19);
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v16);
        }

        v9 = v25;
        v6 = v26;
        v10 = v24;
        goto LABEL_18;
      }
    }
    v27 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v27 = 0;
LABEL_19:

  return v27;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewCache, a3);
}

- (CNUIEditAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationController, a3);
}

- (id)authorizationResultBlock
{
  return self->_authorizationResultBlock;
}

- (void)setAuthorizationResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationResultBlock, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __101__CNUIGroupsAndContainersSaveManager_isMDMAuthorizedToAddContact_toAccount_withManagedConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "canWriteToAccountWithIdentifier:fromSourceAccountIdentifier:", v5, v4);

  return v2 ^ 1;
}

uint64_t __89__CNUIGroupsAndContainersSaveManager_container_containsNonUnifiedContact_inContactStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (id)log
{
  if (log_cn_once_token_1_9285 != -1)
    dispatch_once(&log_cn_once_token_1_9285, &__block_literal_global_9286);
  return (id)log_cn_once_object_1_9287;
}

void __41__CNUIGroupsAndContainersSaveManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIGroupsAndContainersSaveManager");
  v1 = (void *)log_cn_once_object_1_9287;
  log_cn_once_object_1_9287 = (uint64_t)v0;

}

@end
