@implementation ML3SetValuesForPropertiesOperation

- (unint64_t)type
{
  return 1;
}

- (BOOL)_execute:(id *)a3
{
  void *v4;
  int v5;
  NSString *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  Class v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation attributes](self, "attributes");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributeApplyDifferentValuesToPIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributeEntityClassKey"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v42 = NSClassFromString(v6);

  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributeValuesKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v54 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    v51 = 0uLL;
    obj = v34;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v40)
    {
      v7 = 0;
      v8 = 0;
      v37 = *(_QWORD *)v52;
      while (2)
      {
        v9 = 0;
        v38 = (id)v7;
        v10 = v8;
        do
        {
          if (*(_QWORD *)v52 != v37)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v9);
          v12 = objc_msgSend(v11, "longLongValue");
          objc_msgSend(v43, "objectAtIndexedSubscript:", (char *)v38 + v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributePropertiesKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3DatabaseOperation transaction](self, "transaction");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v15, "connection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v10;
          LOBYTE(v15) = -[ML3SetValuesForPropertiesOperation _setValues:forProperties:withEntityClass:usingPersistentID:connection:error:](self, "_setValues:forProperties:withEntityClass:usingPersistentID:connection:error:", v13, v14, v42, v12, v16, &v50);
          v8 = v50;

          if ((v15 & 1) == 0)
          {
            v29 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v11, "longLongValue");
              *(_DWORD *)buf = 134217984;
              v57 = v30;
              _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_DEFAULT, "[ML3SetValuesForPropertiesOperation] Failed to set values for persistent ID %lld", buf, 0xCu);
            }

            v17 = 0;
            goto LABEL_31;
          }

          ++v9;
          v17 = 1;
          v10 = v8;
        }
        while (v40 != v9);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        v7 = (_DWORD)v38 + v9;
        if (v40)
          continue;
        break;
      }
    }
    else
    {
      v8 = 0;
      v17 = 0;
    }
LABEL_31:

    v18 = v17 != 0;
  }
  else
  {
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    v39 = v34;
    v8 = 0;
    v18 = 0;
    v19 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v19)
    {
      v41 = *(_QWORD *)v47;
      while (2)
      {
        v20 = 0;
        v21 = v8;
        do
        {
          if (*(_QWORD *)v47 != v41)
            objc_enumerationMutation(v39);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
          v23 = objc_msgSend(v22, "longLongValue");
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLDatabaseOperationAttributePropertiesKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3DatabaseOperation transaction](self, "transaction");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v25, "connection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = v21;
          LOBYTE(v25) = -[ML3SetValuesForPropertiesOperation _setValues:forProperties:withEntityClass:usingPersistentID:connection:error:](self, "_setValues:forProperties:withEntityClass:usingPersistentID:connection:error:", v43, v24, v42, v23, v26, &v45);
          v8 = v45;

          if ((v25 & 1) == 0)
          {
            v27 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = objc_msgSend(v22, "longLongValue");
              *(_DWORD *)buf = 134217984;
              v57 = v28;
              _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "[ML3SetValuesForPropertiesOperation] Failed to set values for persistent ID %lld", buf, 0xCu);
            }

            v18 = 0;
            goto LABEL_26;
          }

          ++v20;
          v18 = 1;
          v21 = v8;
        }
        while (v19 != v20);
        v19 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_26:

  }
  v31 = objc_retainAutorelease(v8);
  *a3 = v31;

  return v18;
}

- (BOOL)_setValues:(id)a3 forProperties:(id)a4 withEntityClass:(Class)a5 usingPersistentID:(int64_t)a6 connection:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  _QWORD *v40;
  Class v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  uint64_t *v52;
  Class v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[3];
  int v61;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  if ((-[ML3SetValuesForPropertiesOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v14, "count"))
  {
    v17 = objc_msgSend(v14, "count");
    if (v17 == objc_msgSend(v15, "count"))
    {
      -[ML3DatabaseOperation library](self, "library");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)-[objc_class newWithPersistentID:inLibrary:](a5, "newWithPersistentID:inLibrary:", a6);
      -[objc_class databaseTable](a5, "databaseTable");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class unsettableProperties](a5, "unsettableProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if ((-[ML3SetValuesForPropertiesOperation isCancelled](self, "isCancelled") & 1) != 0)
      {
        v21 = 0;
LABEL_22:

        goto LABEL_11;
      }
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      v61 = 3;
      v54 = 0;
      v55 = &v54;
      v56 = 0x3032000000;
      v57 = __Block_byref_object_copy__12046;
      v58 = __Block_byref_object_dispose__12047;
      v59 = 0;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke;
      v46[3] = &unk_1E5B634D0;
      v29 = v19;
      v53 = a5;
      v47 = v19;
      v51 = v60;
      v25 = v18;
      v48 = v25;
      v52 = &v54;
      v26 = v20;
      v49 = v26;
      v50 = v14;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v46);
      v27 = (void *)v55[5];
      if (v27)
      {
        if (a8)
        {
          v21 = 0;
          *a8 = objc_retainAutorelease(v27);
LABEL_21:

          _Block_object_dispose(&v54, 8);
          _Block_object_dispose(v60, 8);
          v19 = v29;
          goto LABEL_22;
        }
      }
      else if ((-[ML3SetValuesForPropertiesOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        v42 = 0;
        v43 = &v42;
        v44 = 0x2020000000;
        v45 = 0;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_2;
        v32[3] = &unk_1E5B63520;
        v33 = v26;
        v41 = a5;
        v34 = v25;
        v38 = &v54;
        v35 = v16;
        v36 = v31;
        v39 = &v42;
        v40 = v60;
        v37 = v30;
        objc_msgSend(v35, "performTransactionWithBlock:", v32);
        if (a8)
        {
          v28 = (void *)v55[5];
          if (v28)
            *a8 = objc_retainAutorelease(v28);
        }
        v21 = *((_BYTE *)v43 + 24) != 0;

        _Block_object_dispose(&v42, 8);
        goto LABEL_21;
      }
      v21 = 0;
      goto LABEL_21;
    }
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("Values and properties arrays are not equal length."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a8)
      *a8 = objc_retainAutorelease(v22);

    goto LABEL_10;
  }
  v21 = 1;
LABEL_11:

  return v21;
}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && (objc_msgSend(v24, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 80), "libraryContentsChangeForProperty:", v24);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v7)
    {
      *(_DWORD *)(v8 + 24) = 0;
    }
    else
    {
      v9 = v24;
      if (*(_DWORD *)(v8 + 24) < 2u)
        goto LABEL_9;
      v10 = objc_msgSend(*(id *)(a1 + 80), "libraryDynamicChangeForProperty:", v24);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      if (!v10)
      {
        v9 = v24;
        if (*(_DWORD *)(v11 + 24) >= 3u)
          *(_DWORD *)(v11 + 24) = 2;
LABEL_9:
        objc_msgSend(*(id *)(a1 + 80), "joinClausesForProperty:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 80), "foreignDatabaseTableForProperty:", v24);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 80), "foreignColumnForProperty:", v24);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = *(id *)(a1 + 40);
          v15 = v24;
        }
        v16 = v15;
        if (v14)
        {
          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v14);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v17, v14);
            }
            objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v16);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v16);

            }
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no column for %@ / %@"), *(_QWORD *)(a1 + 80), v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no table for %@ / %@"), *(_QWORD *)(a1 + 80), v24);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        *a4 = 1;
LABEL_23:

        goto LABEL_24;
      }
      *(_DWORD *)(v11 + 24) = 1;
    }
    v9 = v24;
    goto LABEL_9;
  }
LABEL_24:

}

uint64_t __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, _BYTE *);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_3;
  v13 = &unk_1E5B634F8;
  v19 = *(_QWORD *)(a1 + 96);
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v14 = v3;
  v17 = v4;
  v15 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 80);
  v16 = v5;
  v18 = v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v7 = *(_QWORD *)(a1 + 80);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    && *(_BYTE *)(*(_QWORD *)(v7 + 8) + 24)
    && *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) <= 1u)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 96), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "persistentID", v10, v11, v12, v13, v14, v15), 0, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)+ 8)+ 24), *(_QWORD *)(a1 + 48));
    v7 = *(_QWORD *)(a1 + 80);
  }
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v7 + 8) + 24);

  return v8;
}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BYTE *v31;
  id obj;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 72), "persistentIDColumnForTable:", v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7))
  {
    v31 = a4;
    v10 = CFSTR("ROWID");

    v9 = CFSTR("ROWID");
LABEL_6:
    v16 = objc_msgSend(v8, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_4;
    v33[3] = &unk_1E5B654D8;
    v34 = v17;
    v35 = v18;
    v19 = v18;
    v20 = v17;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ WHERE %@ = ?;"), v7, v21, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v23);

    v24 = *(void **)(a1 + 40);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v25 + 40);
    v26 = objc_msgSend(v24, "executeUpdate:withParameters:error:", v22, v19, &obj);
    objc_storeStrong((id *)(v25 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v26;

    a4 = v31;
    goto LABEL_7;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no pidColumn for %@ / %@"), *(_QWORD *)(a1 + 72), v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    v9 = 0;
LABEL_10:
    *a4 = 1;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;"), v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:withParameters:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(v15, "hasAtLeastOneRow");
  if ((_DWORD)v13)
  {
    v31 = a4;
    goto LABEL_6;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "insertValues:intoTable:persistentID:connection:", v8, v7, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(_QWORD *)(a1 + 40));
LABEL_7:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_10;
LABEL_11:

}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ = ?"), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

@end
