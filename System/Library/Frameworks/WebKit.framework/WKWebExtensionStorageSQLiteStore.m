@implementation WKWebExtensionStorageSQLiteStore

void __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v24, (id *)(a1 + 56));
  v2 = v24;
  if (v24)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(void **)(a1 + 40);
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v23 = 0;
      v6 = (id *)&v23;
      objc_msgSend(v4, "_getValuesForKeys:outErrorMessage:", v5, &v23);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v6 = (id *)&v22;
      objc_msgSend(v4, "_getValuesForAllKeysReturningErrorMessage:", &v22);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v7;
    v12 = *v6;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke_1;
    block[3] = &unk_1E34AAE90;
    v13 = *(id *)(a1 + 48);
    v20 = v12;
    v21 = v13;
    v19 = v11;
    v14 = v12;
    v15 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    CFRelease(v2);
  }
  else
  {
    v8 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_DWORD *)buf = 138478083;
      v26 = v16;
      v27 = 2113;
      v28 = v17;
      _os_log_error_impl(&dword_196BCC000, v8, OS_LOG_TYPE_ERROR, "Failed to retrieve keys: %{private}@ for extension %{private}@.", buf, 0x16u);
    }
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve keys %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke_1(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  __CFString *v16;
  _WKWebExtensionSQLiteStatement *v17;
  _WKWebExtensionSQLiteStatement *v18;
  sqlite3_stmt *v19;
  id v20;
  uint64_t v21;
  sqlite3_int64 v22;
  char v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  sqlite3_int64 v34;
  char v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  const void *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v46, (id *)(a1 + 56));
  v2 = v46;
  if (v46)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(void **)(a1 + 40);
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v45 = 0;
      objc_msgSend(v4, "_getValuesForKeys:outErrorMessage:", v5, &v45);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v45;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_5;
      block[3] = &unk_1E34AAE90;
      v44 = *(id *)(a1 + 48);
      v42 = v6;
      v8 = v7;
      v43 = v8;
      v9 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_18:
      CFRelease(v2);
      return;
    }
    v40 = 0;
    v13 = objc_msgSend(v4, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", &v40, 0);
    v8 = v40;
    if ((v13 & 1) == 0)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_2;
      v37[3] = &unk_1E34AAE68;
      v39 = *(id *)(a1 + 48);
      v8 = v8;
      v38 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v37);

      v9 = v39;
      goto LABEL_18;
    }
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v36 = 0;
    v15 = v14;
    v16 = CFSTR("SELECT SUM(LENGTH(key) + LENGTH(value)) FROM extension_storage");
    v17 = -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:]([_WKWebExtensionSQLiteStatement alloc], "initWithDatabase:query:error:", v15, CFSTR("SELECT SUM(LENGTH(key) + LENGTH(value)) FROM extension_storage"), &v36);
    v18 = v17;
    if (!v17)
    {
      v22 = 0;
      v23 = 0;
LABEL_17:

      v24 = v36;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_3;
      v29[3] = &unk_1E34AB228;
      v35 = v23;
      v33 = *(id *)(a1 + 48);
      v34 = v22;
      v25 = *(id *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      v30 = v25;
      v31 = v26;
      v32 = v24;
      v9 = v24;
      dispatch_async(MEMORY[0x1E0C80D38], v29);

      goto LABEL_18;
    }
    v19 = -[_WKWebExtensionSQLiteStatement handle](v17, "handle");
    v20 = v15;
    v21 = sqlite3_step(v19);
    if ((_DWORD)v21 == 100)
    {
      v22 = sqlite3_column_int64(v19, 0);
      v21 = sqlite3_step(v19);
      if ((_DWORD)v21 == 101)
      {
        v23 = 1;
LABEL_16:

        -[_WKWebExtensionSQLiteStatement invalidate](v18, "invalidate");
        goto LABEL_17;
      }
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v20, "reportErrorWithCode:statement:error:", v21, v19, &v36);
    v23 = 0;
    goto LABEL_16;
  }
  v10 = qword_1ECE710C8;
  if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
  {
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_DWORD *)buf = 138478083;
    v48 = v27;
    v49 = 2113;
    v50 = v28;
    _os_log_error_impl(&dword_196BCC000, v10, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for keys: %{private}@ for extension %{private}@.", buf, 0x16u);
  }
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to caluclate storage size for keys: %@"), *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

}

uint64_t __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = WebKit::storageSizeOf(*(void **)(a1 + 32));
  return (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));
}

uint64_t __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    v2 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138478339;
      v9 = v5;
      v10 = 2113;
      v11 = v6;
      v12 = 2113;
      v13 = v7;
      _os_log_error_impl(&dword_196BCC000, v2, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for keys: %{private}@ for extension %{private}@. %{private}@", (uint8_t *)&v8, 0x20u);

    }
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10[2];
  id location;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    v6 = *((_QWORD *)a1[4] + 4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3321888768;
    v7[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E34AB278;
    objc_copyWeak(v10, &location);
    v7[4] = a1[4];
    v9 = a1[6];
    v8 = a1[5];
    v10[1] = a2;
    dispatch_async(v6, v7);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

void __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  const void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  const void *v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v31, (id *)(a1 + 56));
  v2 = v31;
  if (v31)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v3, "_getValuesForKeys:outErrorMessage:", v4, &v30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v30;

    v7 = WebKit::storageSizeOf(v5);
    v8 = WebKit::storageSizeOf(*(void **)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 64);
    v10 = (void *)MEMORY[0x1E0C99E20];
    v11 = *(void **)(a1 + 32);
    v29 = v6;
    objc_msgSend(v11, "_getAllKeysReturningErrorMessage:", &v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;

    objc_msgSend(v10, "setWithSet:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v17);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_12;
    v23[3] = &unk_1E34AB250;
    v27 = *(id *)(a1 + 48);
    v28 = v8 - v7 + v9;
    v24 = v14;
    v25 = v5;
    v26 = v13;
    v18 = v13;
    v19 = v5;
    v20 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

    CFRelease(v2);
  }
  else
  {
    v21 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138477827;
      v33 = v22;
      _os_log_error_impl(&dword_196BCC000, v21, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for extension %{private}@.", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "count"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  CFTypeRef cf;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&cf, (id *)(a1 + 56));
  if (cf)
  {
    v2 = *(void **)(a1 + 40);
    v29 = 0;
    v3 = objc_msgSend(v2, "_openDatabaseIfNecessaryReturningErrorMessage:", &v29);
    v4 = v29;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = *(id *)(a1 + 32);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v23;
LABEL_5:
        v9 = 0;
        v10 = v4;
        while (1)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
          v12 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_insertOrUpdateValue:forKey:inDatabase:", v13, v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
          v4 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v4, "length"))
            break;
          objc_msgSend(v5, "addObject:", v11);
          ++v9;
          v10 = v4;
          if (v7 == v9)
          {
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
            if (v7)
              goto LABEL_5;
            break;
          }
        }
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_3;
      block[3] = &unk_1E34AAE90;
      v21 = *(id *)(a1 + 48);
      v19 = v5;
      v14 = v4;
      v20 = v14;
      v15 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_2;
      v26[3] = &unk_1E34AAE68;
      v28 = *(id *)(a1 + 48);
      v14 = v4;
      v27 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], v26);

      v15 = v28;
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 48);
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Failed to set keys %@"), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v15);
  }

  if (cf)
    CFRelease(cf);
}

uint64_t __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke(void **a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(void *, id);
  void *v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CFTypeRef v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v25, a1 + 7);
  if (v25)
  {
    v2 = a1[5];
    v24 = 0;
    v3 = objc_msgSend(v2, "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", &v24, 0);
    v4 = v24;
    if ((v3 & 1) != 0)
    {
      v5 = (void *)*((_QWORD *)a1[5] + 3);
      v6 = (void *)MEMORY[0x1E0CB3940];
      rowFilterStringFromRowKeys(a1[4]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM extension_storage WHERE key in (%@)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v5, 0, v8);

      if ((_DWORD)v5 != 101)
      {
        v9 = qword_1ECE710C8;
        if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
        {
          v15 = a1[4];
          v16 = *((_QWORD *)a1[5] + 1);
          *(_DWORD *)buf = 138478083;
          v27 = v15;
          v28 = 2113;
          v29 = v16;
          _os_log_error_impl(&dword_196BCC000, v9, OS_LOG_TYPE_ERROR, "Failed to delete keys %{private}@ for extension %{private}@.", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to delete keys %@"), a1[4]);
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v10;
      }
      objc_msgSend(a1[5], "_deleteDatabaseIfEmpty");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_21;
      block[3] = &unk_1E34AAE90;
      v20 = a1[6];
      v12 = v4;
      v18 = v12;
      v19 = v11;
      v13 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_2;
      v21[3] = &unk_1E34AAE68;
      v23 = a1[6];
      v12 = v4;
      v22 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v21);

      v13 = v23;
    }

  }
  else
  {
    v14 = (void (**)(void *, id))a1[6];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to delete keys %@"), a1[4]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v12);
  }

  if (v25)
    CFRelease(v25);
}

uint64_t __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  v4 = 32;
  if (!v3)
    v4 = 40;
  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + v4));
}

@end
