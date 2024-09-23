@implementation CNMutableContact(UIAdditions)

- (uint64_t)hasNonPersistedData
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EE066D98;
  if ((objc_msgSendSuper2(&v3, sel_hasNonPersistedData) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hasChanges");
}

- (id)addAllPropertiesFromContact:()UIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView allCardProperties](CNContactView, "allCardProperties", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  +[CNContactView allImageProperties](CNContactView, "allImageProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_flatten");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addProperties:excludingProperties:fromContact:", v9, MEMORY[0x1E0C9AA60], v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addProperties:()UIAdditions excludingProperties:fromContact:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  int v20;
  char v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id obj;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v8;
  v11 = (void *)objc_msgSend(v8, "mutableCopy");
  v41 = v9;
  objc_msgSend(v11, "removeObjectsInArray:", v9);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v61;
    v15 = *MEMORY[0x1E0D13848];
    v43 = *MEMORY[0x1E0D13848];
    v44 = *(_QWORD *)v61;
    do
    {
      v16 = 0;
      v46 = v13;
      do
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(obj);
        v50 = v16;
        v17 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v16);
        objc_msgSend(a1, "valueForKey:", v17);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "valueForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v18);
          if (!v18)
            goto LABEL_39;
        }
        else
        {
          v19 = 0;
          if (!v18)
            goto LABEL_39;
        }
        if ((v19 & 1) != 0)
          goto LABEL_39;
        v49 = v18;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v51);
        else
          v20 = 0;
        v21 = objc_opt_respondsToSelector();
        if (!v51 || v20)
        {
          v18 = v49;
          v32 = v49;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContactNoCopy:propertyKey:identifier:", a1, v17, 0);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v24);
LABEL_37:

            v13 = v46;
LABEL_38:
            objc_msgSend(a1, "setValue:forKey:", v32, v17);

            goto LABEL_39;
          }
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v24 = v32;
          v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (!v33)
            goto LABEL_37;
          v34 = v33;
          v35 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v57 != v35)
                objc_enumerationMutation(v24);
              v37 = (void *)MEMORY[0x1E0C97280];
              objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "contactPropertyWithContactNoCopy:propertyKey:identifier:", a1, v17, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "addObject:", v39);
            }
            v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          }
          while (v34);
          v32 = v24;
        }
        else
        {
          v18 = v49;
          if ((v21 & 1) == 0)
            goto LABEL_39;
          v22 = objc_msgSend(v51, "mutableCopy");
          v23 = (void *)objc_msgSend(v49, "mutableCopy");
          v45 = (void *)v22;
          objc_msgSend(v23, "removeObjectsInArray:", v22);
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v53 != v27)
                  objc_enumerationMutation(v24);
                v29 = (void *)MEMORY[0x1E0C97280];
                objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "identifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "contactPropertyWithContactNoCopy:propertyKey:identifier:", a1, v17, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "addObject:", v31);
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            }
            while (v26);
          }

          v32 = v45;
          objc_msgSend(v45, "addObjectsFromArray:", v24);
        }

        v15 = v43;
        v14 = v44;
        v13 = v46;
        v18 = v49;
        if (v32)
          goto LABEL_38;
LABEL_39:

        v16 = v50 + 1;
      }
      while (v50 + 1 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)updateContactTypeWithPolicy:()UIAdditions
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  int v30;
  id v31;

  v31 = a3;
  objc_msgSend(a1, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "familyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "familyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "middleName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "middleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6 && v7 == v9 && v10 == v12 && v13 == v15)
    goto LABEL_23;
  objc_msgSend(a1, "snapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(a1, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "contactType");

  }
  else
  {
    v18 = objc_msgSend(a1, "contactType");
  }

  v19 = *MEMORY[0x1E0D13848];
  objc_msgSend(a1, "givenName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v19 + 16))(v19, v20))
  {
    objc_msgSend(a1, "familyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v19 + 16))(v19, v21))
    {
      objc_msgSend(a1, "middleName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v22) ^ 1;

    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
    v23 = 1;
  }

  objc_msgSend(a1, "organizationName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v24);

  if (v18 == 1)
  {
    v26 = v23 & v25;
  }
  else
  {
    if (v18)
    {
      v27 = 0;
      goto LABEL_20;
    }
    v26 = v23 | v25;
  }
  v27 = v26 ^ 1;
LABEL_20:
  v28 = v27;
  if (!v31
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = objc_msgSend(v31, "shouldSetValue:property:contact:replacementValue:", v29, *MEMORY[0x1E0C96898], a1, 0),
        v29,
        v30))
  {
    objc_msgSend(a1, "setContactType:", v28);
  }
LABEL_23:

}

- (uint64_t)addContactToGroups:()UIAdditions inStore:request:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+UIAdditions.m"), 545, CFSTR("A store is needed here"));

    }
    CNUILogContactCard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v30 = a1;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_18AC56000, v13, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Adding contact %{public}p to groups %@", buf, 0x16u);
    }

    if (!v11)
      v11 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v11, "addMember:toGroup:", a1, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v16);
    }

    v24 = 0;
    v12 = objc_msgSend(v10, "executeSaveRequest:error:", v11, &v24);
    v19 = v24;
    if ((v12 & 1) == 0)
    {
      CNUILogContactCard();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v30 = v22;
        v31 = 2112;
        v32 = v14;
        v33 = 2114;
        v34 = v19;
        v35 = 2114;
        v36 = v10;
        v37 = 2112;
        v38 = a1;
        _os_log_error_impl(&dword_18AC56000, v20, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not add contact with identifer %{public}@ to groups %@, error %{public}@, store %{public}@, full contact %@", buf, 0x34u);

      }
    }

  }
  return v12;
}

- (uint64_t)removeContactFromGroups:()UIAdditions inStore:request:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+UIAdditions.m"), 569, CFSTR("A store is needed here"));

    }
    CNUILogContactCard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v30 = a1;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Removing contact %{public}p from groups %@", buf, 0x16u);
    }

    if (!v11)
      v11 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v11, "removeMember:fromGroup:", a1, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v15);
    }

    v24 = 0;
    v18 = objc_msgSend(v10, "executeSaveRequest:error:", v11, &v24);
    v19 = v24;
    if ((v18 & 1) == 0)
    {
      CNUILogContactCard();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v30 = v22;
        v31 = 2112;
        v32 = v13;
        v33 = 2114;
        v34 = v19;
        v35 = 2114;
        v36 = v10;
        v37 = 2112;
        v38 = a1;
        _os_log_error_impl(&dword_18AC56000, v20, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not remove contact with identifer %{public}@ from groups %@, error %{public}@, store %{public}@, full contact %@", buf, 0x34u);

      }
    }

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (uint64_t)saveContactInStore:()UIAdditions group:container:
{
  return objc_msgSend(a1, "saveContactInStore:group:container:request:", a3, a4, a5, 0);
}

- (uint64_t)saveContactInStore:()UIAdditions group:container:request:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v17 = a4;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = a4;
    objc_msgSend(v13, "arrayWithObjects:count:", &v17, 1);
    a4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_msgSend(a1, "saveContactInStore:groups:container:request:", v10, a4, v11, v12, v17, v18);

  return v15;
}

- (uint64_t)saveContactInStore:()UIAdditions groups:container:request:
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+UIAdditions.m"), 602, CFSTR("A store is needed here"));

  }
  CNUILogContactCard();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v40 = a1;
    v41 = 1024;
    LODWORD(v42) = v14 != 0;
    _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p with request? %d", buf, 0x12u);
  }

  if (!v14)
    v14 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  if (!objc_msgSend(a1, "hasBeenPersisted") || (objc_msgSend(a1, "isSuggestedMe") & 1) != 0)
  {
    CNUILogContactCard();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "type");
      *(_DWORD *)buf = 134349570;
      v40 = a1;
      v41 = 2114;
      v42 = v17;
      v43 = 2048;
      v44 = v18;
      _os_log_impl(&dword_18AC56000, v16, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p by adding, to container with identifier %{public}@ type %ld", buf, 0x20u);

    }
    objc_msgSend(v13, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addContact:toContainerWithIdentifier:", a1, v19);

    if (!v12)
      goto LABEL_24;
LABEL_16:
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v14, "addMember:toGroup:", a1, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v23);
    }

    goto LABEL_24;
  }
  CNUILogContactCard();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v40 = a1;
    _os_log_impl(&dword_18AC56000, v20, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p by updating", buf, 0xCu);
  }

  objc_msgSend(v14, "updateContact:", a1);
  if (v12)
    goto LABEL_16;
LABEL_24:
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "authorizationContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v28 = objc_msgSend(v11, "executeSaveRequest:response:authorizationContext:error:", v14, 0, v27, &v34);
  v29 = v34;
  if ((v28 & 1) == 0)
  {
    CNUILogContactCard();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v32;
      v41 = 2114;
      v42 = v29;
      v43 = 2114;
      v44 = (uint64_t)v11;
      v45 = 2112;
      v46 = a1;
      _os_log_error_impl(&dword_18AC56000, v30, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not save contact with identifer %{public}@, error %{public}@, store %{public}@, full contact %@", buf, 0x2Au);

    }
  }

  return v28;
}

- (uint64_t)deleteContactFromStore:()UIAdditions request:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+UIAdditions.m"), 636, CFSTR("A store is needed here"));

  }
  CNUILogContactCard();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v18 = a1;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Deleting contact %{public}p from store %{public}@", buf, 0x16u);
  }

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v8, "deleteContact:", a1);
  v16 = 0;
  v10 = objc_msgSend(v7, "executeSaveRequest:error:", v8, &v16);
  v11 = v16;
  if ((v10 & 1) == 0)
  {
    CNUILogContactCard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not delete contact with identifer %{public}@, error %{public}@, store %{public}@, full contact %@", buf, 0x2Au);

    }
  }

  return v10;
}

- (void)setBirthdays:()UIAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  objc_msgSend(a3, "_cn_filter:", &__block_literal_global_116_29565);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v9)
      v12 = (void *)v11;
    else
      v12 = v6;
    if (v9)
      v13 = v6;
    else
      v13 = (void *)v11;
LABEL_15:
    v21 = v13;

    v18 = v21;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "calendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "calendarIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    if (v17)
      v12 = 0;
    else
      v12 = v14;
    if (v17)
      v13 = v14;
    else
      v13 = 0;
    goto LABEL_15;
  }
  v12 = 0;
  v18 = 0;
LABEL_17:
  v22 = v18;
  if (objc_msgSend(v18, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else if (objc_msgSend(v22, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v19 = v22;
  }
  objc_msgSend(a1, "setBirthday:", v19);
  if (objc_msgSend(v12, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = 0;
  }
  else if (objc_msgSend(v12, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = 0;
  }
  else
  {
    v20 = v12;
  }
  objc_msgSend(a1, "setNonGregorianBirthday:", v20);

}

- (uint64_t)removePhoto
{
  objc_msgSend(a1, "setImageData:", 0);
  objc_msgSend(a1, "setThumbnailImageData:", 0);
  objc_msgSend(a1, "setFullscreenImageData:", 0);
  objc_msgSend(a1, "setImageType:", 0);
  objc_msgSend(a1, "setImageHash:", 0);
  objc_msgSend(a1, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(a1, "setMemojiMetadata:", 0);
  return objc_msgSend(a1, "setImageBackgroundColorsData:", 0);
}

- (void)updateImageInfoWithType:()UIAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C97200], "stringIdentifierForImageType:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setImageType:", v2);

}

@end
