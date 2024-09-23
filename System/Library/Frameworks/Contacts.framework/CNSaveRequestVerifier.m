@implementation CNSaveRequestVerifier

+ (id)os_log
{
  if (os_log_cn_once_token_0_11 != -1)
    dispatch_once(&os_log_cn_once_token_0_11, &__block_literal_global_69);
  return (id)os_log_cn_once_object_0_11;
}

void __31__CNSaveRequestVerifier_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNSaveRequestVerifier");
  v1 = (void *)os_log_cn_once_object_0_11;
  os_log_cn_once_object_0_11 = (uint64_t)v0;

}

+ (id)insertedAndUpdatedContactsForSaveRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "updatedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "addedContactsByContainerIdentifier", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v6;
}

+ (BOOL)isValidSaveRequest:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *i;
  uint64_t v12;
  BOOL v13;
  id v14;
  BOOL v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "insertedAndUpdatedContactsForSaveRequest:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {

    goto LABEL_13;
  }
  v9 = *(_QWORD *)v20;
  v10 = 1;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      v18 = 0;
      v13 = +[CNContactVerifier isValidContact:error:](CNContactVerifier, "isValidContact:error:", v12, &v18);
      v14 = v18;
      if (!v13)
      {
        objc_msgSend(v6, "_cn_addNonNilObject:", v14);
        v10 = 0;
      }

    }
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v8);

  if ((v10 & 1) != 0)
  {
    v8 = 0;
LABEL_13:
    v15 = 1;
    goto LABEL_17;
  }
  +[CNErrorFactory validationErrorByAggregatingValidationErrors:](CNErrorFactory, "validationErrorByAggregatingValidationErrors:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (a4)
  {
    v8 = objc_retainAutorelease(v16);
    v15 = 0;
    *a4 = v8;
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

+ (BOOL)isSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v10 = objc_msgSend(a1, "_areDirectPropertiesOfSaveRequest:authorizedForSavingWithContext:error:", v8, v9, &v21);
  v11 = v21;
  if (v10)
  {
    objc_msgSend(a1, "insertedAndUpdatedContactsForSaveRequest:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    v13 = objc_msgSend(a1, "_arePropertiesOfContacts:inSaveRequest:authorizedForSavingWithContext:error:", v12, v8, v9, &v20);
    v14 = v20;

    if (v13)
    {
      objc_msgSend(v8, "deletedContacts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v14;
      v17 = objc_msgSend(a1, "_isEditingOfContacts:inSaveRequest:authorizedForSavingWithContext:error:", v16, v8, v9, &v19);
      v11 = v19;

      if (!a5)
        goto LABEL_10;
    }
    else
    {
      v17 = 0;
      v11 = v14;
      if (!a5)
        goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
    v17 = 0;
    if (!a5)
      goto LABEL_10;
  }
  if ((v17 & 1) == 0)
    *a5 = objc_retainAutorelease(v11);
LABEL_10:

  return v17;
}

+ (BOOL)_areDirectPropertiesOfSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a4;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "isClientFirstOrSecondParty");

  if ((v9 & 1) == 0)
  {
    if (objc_msgSend(v8, "ignoresGuardianRestrictions"))
      objc_msgSend(v11, "addObject:", CFSTR("ignoresGuardianRestrictions"));
    objc_msgSend(v8, "meCardIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v11, "addObject:", CFSTR("meCardIdentifier"));
    objc_msgSend(v8, "deletedContainers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
      objc_msgSend(v11, "addObject:", CFSTR("deletedContainers"));
    objc_msgSend(v8, "addedContainersByParentContainerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
      objc_msgSend(v11, "addObject:", CFSTR("addedContainersByParentContainerIdentifier"));
    objc_msgSend(v8, "addedAccountContainersByParentContainerIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
      objc_msgSend(v11, "addObject:", CFSTR("addedAccountContainersByParentContainerIdentifier"));
  }
  v19 = objc_msgSend(v11, "count");
  if (v19)
  {
    objc_msgSend(a1, "os_log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[CNSaveRequestVerifier _areDirectPropertiesOfSaveRequest:authorizedForSavingWithContext:error:].cold.1((uint64_t)v11, v20);

    v29[0] = v11;
    v28[0] = CFSTR("CNKeyPaths");
    v28[1] = CFSTR("CNInvalidRecords");
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 102, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
    v25 = v24;
    if (a5)
    {
      v25 = objc_retainAutorelease(v24);
      *a5 = v25;
    }
  }
  else
  {
    v25 = 0;
  }

  return v19 == 0;
}

+ (BOOL)_arePropertiesOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  void *i;
  uint64_t v18;
  BOOL v19;
  id v20;
  id v21;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(a5, "isClientFirstOrSecondParty") & 1) != 0
    || (objc_msgSend(v10, "ignoresContactProviderRestrictions") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v9;
    v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v23 = v10;
      v24 = v9;
      v15 = *(_QWORD *)v27;
      v16 = 1;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (a6)
          {
            v25 = 0;
            v19 = +[CNContactVerifier arePropertiesOfContactAuthorized:error:](CNContactVerifier, "arePropertiesOfContactAuthorized:error:", v18, &v25);
            v20 = v25;
            if (!v19)
            {
              objc_msgSend(v12, "addObject:", v20);
              v16 = 0;
            }

          }
          else if (!+[CNContactVerifier arePropertiesOfContactAuthorized:error:](CNContactVerifier, "arePropertiesOfContactAuthorized:error:", v18, 0))
          {

            goto LABEL_19;
          }
        }
        v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v14)
          continue;
        break;
      }

      if ((v16 & 1) != 0)
      {
        v14 = 0;
        v11 = 1;
        v10 = v23;
        v9 = v24;
        goto LABEL_24;
      }
LABEL_19:
      +[CNErrorFactory validationErrorByAggregatingValidationErrors:](CNErrorFactory, "validationErrorByAggregatingValidationErrors:", v12);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      v10 = v23;
      if (a6)
      {
        v14 = objc_retainAutorelease(v21);
        v11 = 0;
        *a6 = v14;
      }
      else
      {
        v11 = 0;
      }
      v9 = v24;
    }
    else
    {

      v11 = 1;
    }
LABEL_24:

  }
  return v11;
}

+ (BOOL)_isEditingOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  id v31;
  char v32;
  id *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v34 = a5;
  if (objc_msgSend(v34, "isClientFirstOrSecondParty")
    && (objc_msgSend(v10, "ignoresGuardianRestrictions") & 1) != 0)
  {
    v11 = 0;
LABEL_33:
    v26 = 0;
    v24 = 1;
    goto LABEL_39;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v9;
  v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (!v11)
  {

    goto LABEL_33;
  }
  v33 = a6;
  v30 = v10;
  v31 = v9;
  v35 = 0;
  v13 = *(_QWORD *)v37;
  v32 = 1;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(v12);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      v44 = CFSTR("downtimeWhitelist");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1, v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "areKeysAvailable:", v16);

      if (v17)
      {
        objc_msgSend(v15, "snapshot");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[CNDowntimeWhitelist isWhitelistedContact:](CNDowntimeWhitelist, "isWhitelistedContact:", v15))
        {
          goto LABEL_13;
        }
        v43 = CFSTR("downtimeWhitelist");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "areKeysAvailable:", v19) & 1) == 0)
        {

          goto LABEL_24;
        }
        v20 = +[CNDowntimeWhitelist isWhitelistedContact:](CNDowntimeWhitelist, "isWhitelistedContact:", v18);

        if (v20)
        {
LABEL_13:
          if (!objc_msgSend(v34, "isClientFirstOrSecondParty"))
            goto LABEL_20;
          if (v18)
          {
            v42 = CFSTR("downtimeWhitelist");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "areKeysAvailable:", v21) & 1) != 0)
            {
              v22 = +[CNDowntimeWhitelist isWhitelistedContact:](CNDowntimeWhitelist, "isWhitelistedContact:", v18);

              if (!v22)
                goto LABEL_24;
            }
            else
            {

            }
LABEL_20:
            if (!v33)
            {

              v10 = v30;
              v9 = v31;
              goto LABEL_30;
            }
            v23 = v35;
            if (!v35)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v35 = v23;
            objc_msgSend(v23, "addObject:", v15);
            v32 = 0;
          }
        }
LABEL_24:

        continue;
      }
    }
    v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v11)
      continue;
    break;
  }

  v10 = v30;
  if ((v32 & 1) != 0)
  {
    v11 = 0;
    v24 = 1;
    v9 = v31;
    goto LABEL_38;
  }
  v9 = v31;
LABEL_30:
  if (objc_msgSend(v35, "count"))
  {
    v40 = CFSTR("CNInvalidRecords");
    v41 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 206, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v27;
  v11 = v28;
  if (v33)
  {
    v11 = objc_retainAutorelease(v28);
    v24 = 0;
    *v33 = v11;
  }
  else
  {
    v24 = 0;
  }
LABEL_38:
  v26 = v35;
LABEL_39:

  return v24;
}

+ (void)_areDirectPropertiesOfSaveRequest:(uint64_t)a1 authorizedForSavingWithContext:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "CNErrorCodeUnauthorizedKeys:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
