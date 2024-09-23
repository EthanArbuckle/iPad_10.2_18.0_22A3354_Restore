@implementation SGContactsInterface

+ (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a5, "unifiedContactWithIdentifier:keysToFetch:error:", a3, a4, a6);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:", &__block_literal_global_9636);
    v3 = (void *)_cache;
    _cache = v2;

  }
}

+ (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v11);

  objc_msgSend(v14, "setPredicate:", v12);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__SGContactsInterface_unifiedContactsMatchingPredicate_keysToFetch_usingContactStore_error___block_invoke;
  v18[3] = &unk_1E7DB4A90;
  v15 = v13;
  v19 = v15;
  objc_msgSend(a1, "enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:", v14, v10, a6, v18);

  if (*a6)
    v16 = 0;
  else
    v16 = v15;

  return v16;
}

+ (id)unifiedMeContactWithKeysToFetch:(id)a3 usingContactStore:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", a3, a5);
}

+ (id)identifiersPredicateFromCacheForPredicate:(id)a3 isCached:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__9607;
  v23 = __Block_byref_object_dispose__9608;
  v24 = 0;
  objc_msgSend((id)_cache, "resultIfAvailable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__SGContactsInterface_identifiersPredicateFromCacheForPredicate_isCached___block_invoke;
    v16[3] = &unk_1E7DB1180;
    v18 = &v19;
    v17 = v5;
    objc_msgSend(v6, "runWithLockAcquired:", v16);
    v7 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "trackScalarForMessage:count:", v9, 0);

    v25 = CFSTR("ContactsInterfaceCacheHit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20[5] != 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    AnalyticsSendEvent();
  }

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setCacheHit:", v20[5] != 0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trackScalarForMessage:", v11);

  v13 = v20;
  if (v20[5])
  {
    *a4 = 1;
    if (objc_msgSend((id)v13[5], "count"))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v20[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    *a4 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v14;
}

+ (BOOL)enumerateContactsWithFetchRequest:(id)a3 usingContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _BYTE v44[9];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v44[0] = 0;
  objc_msgSend(v10, "predicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifiersPredicateFromCacheForPredicate:isCached:", v13, v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "setPredicate:", v14);
  }
  else if (v44[0])
  {
    v17 = 1;
    goto LABEL_13;
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9607;
  v38 = __Block_byref_object_dispose__9608;
  v39 = 0;
  v15 = (void *)objc_opt_new();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke;
  v28[3] = &unk_1E7DAB738;
  v29 = v11;
  v16 = v15;
  v30 = v16;
  v31 = v12;
  v32 = &v40;
  v33 = &v34;
  v17 = objc_msgSend(v29, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, a5, v28);
  v18 = (void *)v35[5];
  if (v18)
    objc_msgSend(v18, "raise");
  if (!*((_BYTE *)v41 + 24))
  {
    objc_msgSend(v16, "proxyArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v19, "count") > 2
      || (objc_msgSend(v10, "predicate"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v19),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "isEqual:", v21),
          v21,
          v20,
          (v22 & 1) == 0))
    {
      objc_msgSend((id)_cache, "result");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke_25;
      v25[3] = &unk_1E7DB1D20;
      v26 = v10;
      v27 = v19;
      objc_msgSend(v23, "runWithLockAcquired:", v25);

    }
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
LABEL_13:

  return v17;
}

+ (BOOL)enumerateContactsMatchingName:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = (objc_class *)MEMORY[0x1E0C97210];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend([v12 alloc], "initWithKeysToFetch:", v15);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v18);
  LOBYTE(a6) = objc_msgSend(a1, "enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:", v17, v14, a6, v13);

  return (char)a6;
}

+ (BOOL)enumerateContactsMatchingEmailAddress:(id)a3 withKeysToFetch:(id)a4 usingContactStore:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = (objc_class *)MEMORY[0x1E0C97210];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend([v12 alloc], "initWithKeysToFetch:", v15);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v18);
  LOBYTE(a6) = objc_msgSend(a1, "enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:", v17, v14, a6, v13);

  return (char)a6;
}

+ (void)clearCache
{
  id v2;

  objc_msgSend((id)_cache, "resultIfAvailable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithLockAcquired:", &__block_literal_global_26_9614);

}

+ (BOOL)handleExistsInContactStoreForHandle:(id)a3 withHandleType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  NSObject *v29;
  __int128 *p_buf;
  uint8_t v31[4];
  id v32;
  _QWORD v33[2];
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C967C0];
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "Unsupported handleType: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v6);
  if (!v9)
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGContactsInterface: CNPhoneNumber initWithStringValue returned nil", (uint8_t *)&buf, 2u);
    }
    goto LABEL_18;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__9607;
  v37 = __Block_byref_object_dispose__9608;
  v38 = 0;
  objc_msgSend((id)_cache, "resultIfAvailable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke;
  v28[3] = &unk_1E7DB1180;
  p_buf = &buf;
  v14 = v11;
  v29 = v14;
  objc_msgSend(v12, "runWithLockAcquired:", v28);

  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
    v15 = 1;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v33[0] = *MEMORY[0x1E0C966A8];
    v33[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v16);
    objc_msgSend(v17, "setPredicate:", v14);
    +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke_2;
    v22[3] = &unk_1E7DAB780;
    v22[4] = &v24;
    v23 = 0;
    objc_msgSend(a1, "enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:", v17, v18, &v23, v22);
    v19 = v23;

    if (v19)
    {
      sgLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v31 = 138412290;
        v32 = v19;
        _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "Error enumerating contacts: %@", v31, 0xCu);
      }

    }
    v15 = *((_BYTE *)v25 + 24) != 0;

    _Block_object_dispose(&v24, 8);
  }

  _Block_object_dispose(&buf, 8);
LABEL_19:

  return v15;
}

void __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __74__SGContactsInterface_handleExistsInContactStoreForHandle_withHandleType___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t __33__SGContactsInterface_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

void __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)a1[5];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addCNContactIdentifier:", v7);

    (*(void (**)(void))(a1[6] + 16))();
    if (*a3)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected object returned from Contact Store: %@ Retrieved From %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __92__SGContactsInterface_enumerateContactsWithFetchRequest_usingContactStore_error_usingBlock___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") >= 0x64)
    objc_msgSend(v5, "removeAllObjects");
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v4);

}

void __74__SGContactsInterface_identifiersPredicateFromCacheForPredicate_isCached___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D80F28];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "trackScalarForMessage:count:", v6, objc_msgSend(v4, "count"));

  AnalyticsSendEvent();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __92__SGContactsInterface_unifiedContactsMatchingPredicate_keysToFetch_usingContactStore_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id __33__SGContactsInterface_initialize__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  +[SGCuratedChangeNotifications addAddressBookObserver:forObjectLifetime:](SGCuratedChangeNotifications, "addAddressBookObserver:forObjectLifetime:", &__block_literal_global_7_9640, v2);
  return v2;
}

uint64_t __33__SGContactsInterface_initialize__block_invoke_2()
{
  return +[SGContactsInterface clearCache](SGContactsInterface, "clearCache");
}

@end
