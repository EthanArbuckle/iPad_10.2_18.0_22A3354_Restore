@implementation ATXActionPredictionsProcessor

+ (id)removeMissingOrBlockedRecipientPredictions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__81;
  v15[4] = __Block_byref_object_dispose__81;
  v16 = 0;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke;
  v11[3] = &unk_1E82E7578;
  v14 = a1;
  v6 = v5;
  v12 = v6;
  v13 = v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v4, "count"))
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  _Block_object_dispose(v15, 8);
  return v9;
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id obj;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v5, "scoredAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v7, "predictedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_contactIdentifiersReferencedByAction:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v12 = objc_opt_new();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v19 = *MEMORY[0x1E0C966A8];
      v79[0] = *MEMORY[0x1E0C967C0];
      v79[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0;
      objc_msgSend(v18, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v20, &v75);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v75;

      if (v21)
      {
        v22 = objc_msgSend(v21, "count");
        if (v22 >= objc_msgSend(v16, "count"))
        {
          v54 = v17;
          v55 = a1;
          v56 = v16;
          v57 = v8;
          v52 = a3;
          v58 = v6;
          v59 = v5;
          v32 = v21;
          v33 = (void *)objc_opt_new();
          v34 = (void *)objc_opt_new();
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v53 = v32;
          obj = v32;
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
          if (v35)
          {
            v36 = v35;
            v62 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v72 != v62)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                v67 = 0u;
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                objc_msgSend(v38, "phoneNumbers");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = *(_QWORD *)v68;
                  do
                  {
                    for (j = 0; j != v41; ++j)
                    {
                      if (*(_QWORD *)v68 != v42)
                        objc_enumerationMutation(v39);
                      objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "value");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "addObject:", v44);

                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
                  }
                  while (v41);
                }

                v65 = 0u;
                v66 = 0u;
                v63 = 0u;
                v64 = 0u;
                objc_msgSend(v38, "emailAddresses");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
                if (v46)
                {
                  v47 = v46;
                  v48 = *(_QWORD *)v64;
                  do
                  {
                    for (k = 0; k != v47; ++k)
                    {
                      if (*(_QWORD *)v64 != v48)
                        objc_enumerationMutation(v45);
                      objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "value");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "addObject:", v50);

                    }
                    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
                  }
                  while (v47);
                }

              }
              v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
            }
            while (v36);
          }

          v5 = v59;
          v24 = v60;
          if ((objc_msgSend(*(id *)(v55 + 48), "isBlockedPhoneNumberContainedInNumbers:", v33) & 1) != 0
            || objc_msgSend(*(id *)(v55 + 48), "isBlockedEmailAddressContainedInAddresses:", v34))
          {
            __atxlog_handle_action_prediction();
            v51 = objc_claimAutoreleasedReturnValue();
            v8 = v57;
            v6 = v58;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_3(v59);

          }
          else
          {
            objc_msgSend(*(id *)(v55 + 32), "addIndex:", v52);
            v8 = v57;
            v6 = v58;
          }

          v16 = v56;
          v21 = v53;
          v17 = v54;
        }
        else
        {
          __atxlog_handle_action_prediction();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v60;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_2(v5);

        }
      }
      else
      {
        __atxlog_handle_action_prediction();
        v25 = objc_claimAutoreleasedReturnValue();
        v24 = v60;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_1((uint64_t)v60, v25, v26, v27, v28, v29, v30, v31);

        objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
      v16 = v11;
    }

  }
  objc_autoreleasePoolPop(v6);

}

+ (id)_contactIdentifiersReferencedByAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "recipients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v7 = 0;
              goto LABEL_11;
            }
            v8 = v5;
            objc_msgSend(v8, "payee");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "contactIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_msgSend(v8, "payee");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "contactIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14[0] = v13;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v7 = 0;
            }

LABEL_10:
LABEL_11:

            goto LABEL_12;
          }
        }
      }
      objc_msgSend(v5, "contacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    contactIdentifiersFromINPersons(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (BOOL)isBlockedEmailAddressContainedInAddresses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v8 = getCMFItemCreateWithEmailAddressSymbolLoc_ptr;
        v21 = getCMFItemCreateWithEmailAddressSymbolLoc_ptr;
        if (!getCMFItemCreateWithEmailAddressSymbolLoc_ptr)
        {
          v9 = (void *)CommunicationsFilterLibrary();
          v8 = dlsym(v9, "CMFItemCreateWithEmailAddress");
          v19[3] = (uint64_t)v8;
          getCMFItemCreateWithEmailAddressSymbolLoc_ptr = v8;
        }
        _Block_object_dispose(&v18, 8);
        if (!v8)
          +[ATXActionPredictionsProcessor isBlockedEmailAddressContainedInAddresses:].cold.1();
        v10 = ((uint64_t (*)(uint64_t))v8)(v7);
        v11 = (const void *)v10;
        if (v10)
        {
          v12 = atx_CMFBlockListIsItemBlocked(v10) == 0;
          CFRelease(v11);
          if (!v12)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)isBlockedPhoneNumberContainedInNumbers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  _BOOL4 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0D13B00];
        objc_msgSend(v7, "stringValue", (_QWORD)v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "countryCodeForNumber:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (const void *)CFPhoneNumberCreate();

        if (v12)
        {
          v23 = 0;
          v24 = &v23;
          v25 = 0x2020000000;
          v13 = getCMFItemCreateWithPhoneNumberSymbolLoc_ptr;
          v26 = getCMFItemCreateWithPhoneNumberSymbolLoc_ptr;
          if (!getCMFItemCreateWithPhoneNumberSymbolLoc_ptr)
          {
            v14 = (void *)CommunicationsFilterLibrary();
            v13 = dlsym(v14, "CMFItemCreateWithPhoneNumber");
            v24[3] = (uint64_t)v13;
            getCMFItemCreateWithPhoneNumberSymbolLoc_ptr = v13;
          }
          _Block_object_dispose(&v23, 8);
          if (!v13)
            +[ATXActionPredictionsProcessor isBlockedPhoneNumberContainedInNumbers:].cold.1();
          v15 = ((uint64_t (*)(const void *))v13)(v12);
          v16 = (const void *)v15;
          if (v15)
          {
            v17 = atx_CMFBlockListIsItemBlocked(v15) != 0;
            CFRelease(v16);
          }
          else
          {
            v17 = 0;
          }
          CFRelease(v12);

          if (v17)
          {
            LOBYTE(v4) = 1;
            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_19:

  return v4;
}

+ (id)removeDuplicateTVActionPredictions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *context;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.tv"), CFSTR("INPlayMediaIntent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "actionKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          objc_msgSend(v11, "scoredAction");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "predictedItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "intent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "proxiedBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v5, "addObject:", v17);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v18 = v6;
  v19 = v18;
  if (objc_msgSend(v5, "count"))
  {
    v20 = (void *)MEMORY[0x1E0CB3880];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __68__ATXActionPredictionsProcessor_removeDuplicateTVActionPredictions___block_invoke;
    v24[3] = &unk_1E82E75A0;
    v25 = v5;
    v26 = v4;
    objc_msgSend(v20, "predicateWithBlock:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(context);

  return v19;
}

uint64_t __68__ATXActionPredictionsProcessor_removeDuplicateTVActionPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "scoredAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v7))
  {
    objc_msgSend(v3, "actionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)removeDuplicateActionPredictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_178);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "indicesOfNonDuplicateScoredActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __66__ATXActionPredictionsProcessor_removeDuplicateActionPredictions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scoredAction");
}

+ (id)indicesOfNonDuplicateScoredActions:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_18;
  v6 = 0;
  do
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsIndex:", v6) & 1) == 0)
    {
      v9 = v6 + 1;
      goto LABEL_15;
    }
    v8 = (void *)objc_opt_new();
    v9 = v6 + 1;
    if (v6 + 1 >= objc_msgSend(v4, "count"))
      goto LABEL_11;
    v10 = v6 + 1;
    while (1)
    {
      v11 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "containsIndex:", v10)
        || !objc_msgSend(a1, "scoredActionsAreDuplicatesWithScoredAction1:scoredAction2:", v7, v12))
      {
        goto LABEL_10;
      }
      objc_msgSend(v7, "score");
      v14 = v13;
      objc_msgSend(v12, "score");
      if (v14 < v15)
        break;
      objc_msgSend(v8, "addIndex:", v10);
LABEL_10:

      objc_autoreleasePoolPop(v11);
      if (++v10 >= objc_msgSend(v4, "count"))
        goto LABEL_11;
    }
    objc_msgSend(v5, "removeIndex:", v6);

    objc_autoreleasePoolPop(v11);
LABEL_11:
    if (objc_msgSend(v5, "containsIndex:", v6))
      objc_msgSend(v5, "removeIndexes:", v8);

LABEL_15:
    v6 = v9;
  }
  while (v9 < objc_msgSend(v4, "count"));
LABEL_18:

  return v5;
}

+ (BOOL)scoredActionsAreDuplicatesWithScoredAction1:(id)a3 scoredAction2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "predictedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_ATXActionUtils isTitleEquivalenceBetweenAction:other:](_ATXActionUtils, "isTitleEquivalenceBetweenAction:other:", v7, v8))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "predictedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v10, v11))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "predictedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predictedItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[_ATXActionUtils isCallIntentEquivalenceBetweenAction:other:](_ATXActionUtils, "isCallIntentEquivalenceBetweenAction:other:", v12, v13);

    }
  }

  return v9;
}

+ (BOOL)actionPredictionsContainsAlarmAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.mobiletimer"), CFSTR("MTToggleAlarmIntent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.mobiletimer"), CFSTR("MTCreateAlarmIntent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "scoredAction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predictedItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "actionKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "isEqualToString:", v4) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", v5))
        {
          __atxlog_handle_action_prediction();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Found alarm action in alarm prediction candidates.", v17, 2u);
          }

          v14 = 1;
          goto LABEL_15;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v14 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[ATXActionPredictionsProcessor actionPredictionsContainsAlarmAction:](ATXActionPredictionsProcessor, "actionPredictionsContainsAlarmAction:", v4))
  {
    objc_msgSend(a1, "userAlarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
          v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "setHour:", objc_msgSend(v13, "hour", (_QWORD)v23));
          objc_msgSend(v14, "setMinute:", objc_msgSend(v13, "minute"));
          if (objc_msgSend(v13, "isEnabled"))
            v15 = v6;
          else
            v15 = v7;
          objc_msgSend(v15, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v10);
    }

    __atxlog_handle_action_prediction();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "count");
      v18 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218240;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu enabled alarms and %lu disabled alarms.", buf, 0x16u);
    }

    __atxlog_handle_action_prediction();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (uint64_t)v6;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "Enabled alarms: %@", buf, 0xCu);
    }

    v20 = (void *)objc_opt_new();
    +[ATXActionPredictionsProcessor removeAlarmActionsInconsistentWithAlarmAppState:enabledAlarms:disabledAlarms:currentDate:](ATXActionPredictionsProcessor, "removeAlarmActionsInconsistentWithAlarmAppState:enabledAlarms:disabledAlarms:currentDate:", v4, v6, v7, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v4;
  }

  return v21;
}

+ (id)userAlarms
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v2 = dispatch_semaphore_create(0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__81;
  v36 = __Block_byref_object_dispose__81;
  v37 = 0;
  v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = __Block_byref_object_copy__81;
  v30[3] = __Block_byref_object_dispose__81;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CF4F50], "sharedAlarmManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmsIncludingSleepAlarm:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __43__ATXActionPredictionsProcessor_userAlarms__block_invoke;
  v25[3] = &unk_1E82E5670;
  v27 = &v32;
  v28 = &v29;
  v5 = v2;
  v26 = v5;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v25);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v5, 0, &__block_literal_global_38_2, 5.0);
  if (*(_QWORD *)(v30[0] + 40))
  {
    __atxlog_handle_action_prediction();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXActionPredictionsProcessor userAlarms].cold.2((uint64_t)v30, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = (void *)v33[5];
  if (!v14)
  {
    __atxlog_handle_action_prediction();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ATXActionPredictionsProcessor userAlarms].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v14 = (void *)v33[5];
  }
  v23 = v14;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_action_prediction();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3 enabledAlarms:(id)a4 disabledAlarms:(id)a5 currentDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.mobiletimer"), CFSTR("MTToggleAlarmIntent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.mobiletimer"), CFSTR("MTCreateAlarmIntent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __122__ATXActionPredictionsProcessor_removeAlarmActionsInconsistentWithAlarmAppState_enabledAlarms_disabledAlarms_currentDate___block_invoke;
  v29 = &unk_1E82E7628;
  v30 = v14;
  v16 = v13;
  v31 = v16;
  v32 = v12;
  v33 = v11;
  v34 = v10;
  v35 = v15;
  v17 = v15;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v26);
  v22 = objc_msgSend(v16, "count", v26, v27, v28, v29);
  if (v22 == objc_msgSend(v9, "count"))
  {
    v23 = v9;
  }
  else
  {
    objc_msgSend(v9, "objectsAtIndexes:", v16);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  return v24;
}

void __122__ATXActionPredictionsProcessor_removeAlarmActionsInconsistentWithAlarmAppState_enabledAlarms_disabledAlarms_currentDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v14, "scoredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "actionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "atx_nonNilParametersByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v10, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    +[ATXActionPredictionsProcessor addEligibleToggleAlarmIndexesToAcceptedIndexes:currentDate:disabledAlarms:enabledAlarms:idx:params:parameterCombinations:](ATXActionPredictionsProcessor, "addEligibleToggleAlarmIndexesToAcceptedIndexes:currentDate:disabledAlarms:enabledAlarms:idx:params:parameterCombinations:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a3, v13, v10);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 72)))
  {
    +[ATXActionPredictionsProcessor addEligibleCreateAlarmIndexesToAcceptedIndexes:currentDate:enabledAlarms:idx:params:parameterCombinations:](ATXActionPredictionsProcessor, "addEligibleCreateAlarmIndexesToAcceptedIndexes:currentDate:enabledAlarms:idx:params:parameterCombinations:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), a3, v13, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

  objc_autoreleasePoolPop(v5);
}

+ (void)addEligibleToggleAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 disabledAlarms:(id)a5 enabledAlarms:(id)a6 idx:(unint64_t)a7 params:(id)a8 parameterCombinations:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t v28[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (objc_msgSend(v18, "containsObject:", CFSTR("state")))
  {
    if (objc_msgSend(v18, "containsObject:", CFSTR("alarm")))
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("alarm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKey:", CFSTR("dateComponents"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("state"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("alarm"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "valueForKey:", CFSTR("dateComponents"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        +[ATXActionPredictionsProcessor hourAndMinuteComponentsFromDateComponents:](ATXActionPredictionsProcessor, "hourAndMinuteComponentsFromDateComponents:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 == 1
          && (objc_msgSend(v17, "containsObject:", v26) & 1) == 0
          && objc_msgSend(v16, "containsObject:", v26)
          && +[ATXActionPredictionsProcessor validTimeToSuggestAlarmForAlarmComponents:currentDate:](ATXActionPredictionsProcessor, "validTimeToSuggestAlarmForAlarmComponents:currentDate:", v26, v15))
        {
          objc_msgSend(v14, "addIndex:", a7);
        }
        else
        {
          __atxlog_handle_action_prediction();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "Suppressing MTToggleAlarmIntent because it is not toggling on an alarm that is disabled or the alarm time is over 12 hours away.", v28, 2u);
          }

        }
      }
    }
  }

}

+ (void)addEligibleCreateAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 enabledAlarms:(id)a5 idx:(unint64_t)a6 params:(id)a7 parameterCombinations:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (objc_msgSend(a7, "containsObject:", CFSTR("dateComponents")))
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dateComponents"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXActionPredictionsProcessor hourAndMinuteComponentsFromDateComponents:](ATXActionPredictionsProcessor, "hourAndMinuteComponentsFromDateComponents:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsObject:", v18) & 1) != 0
      || !+[ATXActionPredictionsProcessor validTimeToSuggestAlarmForAlarmComponents:currentDate:](ATXActionPredictionsProcessor, "validTimeToSuggestAlarmForAlarmComponents:currentDate:", v18, v14))
    {
      __atxlog_handle_action_prediction();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "Suppressing MTCreateAlarmIntent because there already exists an enabled alarm for the same time or the alarm time is over 12 hours away.", v20, 2u);
      }

    }
    else
    {
      objc_msgSend(v13, "addIndex:", a6);
    }

  }
}

+ (id)hourAndMinuteComponentsFromDateComponents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
  v5 = objc_msgSend(v3, "minute");

  objc_msgSend(v4, "setMinute:", v5);
  return v4;
}

+ (BOOL)validTimeToSuggestAlarmForAlarmComponents:(id)a3 currentDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 96, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  if (v12 <= 0.0)
    v12 = v12 + 86400.0;
  v13 = v12 <= 43200.0;

  return v13;
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Failed to load contacts matching identifier predicate: %@", a5, a6, a7, a8, 2u);
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "scoredAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predictedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v3, v4, "Suppressing predicted action %@ due to missing contact referenced by intent.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "scoredAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predictedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v3, v4, "Suppressing predicted action %@ due to blocked contact referenced by intent.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)isBlockedEmailAddressContainedInAddresses:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CMFItemRef atx_CMFItemCreateWithEmailAddress(CFStringRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("ATXActionPredictionsProcessor.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_4_8());

  __break(1u);
}

+ (void)isBlockedPhoneNumberContainedInNumbers:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CMFItemRef atx_CMFItemCreateWithPhoneNumber(CFPhoneNumberRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("ATXActionPredictionsProcessor.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_4_8());

  __break(1u);
}

+ (void)userAlarms
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Failed to retrieve alarms with error: %@", a5, a6, a7, a8, 2u);
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "XPC call to retrieve alarms timed out.", a5, a6, a7, a8, 0);
}

@end
