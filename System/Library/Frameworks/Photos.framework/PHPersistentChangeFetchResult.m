@implementation PHPersistentChangeFetchResult

- (PHPersistentChangeFetchResult)initWithTransactions:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHPersistentChangeFetchResult *v11;
  PHPersistentChangeFetchResult *v12;
  void *v13;
  void *v14;
  PHPersistentChangeFetchResult *v15;
  PHPersistentChangeFetchResult *v16;
  _QWORD v18[4];
  PHPersistentChangeFetchResult *v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PHPersistentChangeFetchResult;
  v11 = -[PHPersistentChangeFetchResult init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_library, a5);
    objc_storeStrong((id *)&v12->_options, a4);
    -[PHPhotoLibrary changeHandlingPhotoLibrary](v12->_library, "changeHandlingPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__PHPersistentChangeFetchResult_initWithTransactions_options_photoLibrary___block_invoke;
    v18[3] = &unk_1E35DF9E8;
    v15 = v12;
    v19 = v15;
    v20 = v8;
    objc_msgSend(v14, "performBlockAndWait:", v18);

    v16 = v15;
  }

  return v12;
}

- (id)_managedObjectContext
{
  void *v2;
  void *v3;

  -[PHPhotoLibrary changeHandlingPhotoLibrary](self->_library, "changeHandlingPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateChangesWithBlock:(void *)block
{
  void *v4;
  id v5;
  NSArray *transactions;
  void *v7;
  void *v8;
  PHPersistentChangeEnumerationContext *v9;
  id v10;
  PHPersistentChangeEnumerationContext *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PHPersistentChangeFetchResult *v15;
  PHPersistentChangeEnumerationContext *v16;
  id v17;

  v4 = block;
  v5 = objc_alloc(MEMORY[0x1E0D71930]);
  transactions = self->_transactions;
  -[PHPersistentChangeFetchResult _managedObjectContext](self, "_managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTransactions:managedObjectObjectContext:", transactions, v7);

  v9 = objc_alloc_init(PHPersistentChangeEnumerationContext);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke;
  v13[3] = &unk_1E35D7BD8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = v4;
  v10 = v4;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v12, "enumerateRemainingTransactionsWithBlock:", v13);

}

- (id)iteratorForPersistentChangeEnumeration
{
  id v3;
  NSArray *transactions;
  void *v5;
  void *v6;
  PHPersistentChangeEnumerationContext *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D71930]);
  transactions = self->_transactions;
  -[PHPersistentChangeFetchResult _managedObjectContext](self, "_managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTransactions:managedObjectObjectContext:", transactions, v5);

  v7 = objc_alloc_init(PHPersistentChangeEnumerationContext);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, CFSTR("PHPersistentChangeEnumerationContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v8);

  return v6;
}

- (id)nextPersistentChangeWithIterator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PHPersistentChangeFetchResult *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10022;
  v17 = __Block_byref_object_dispose__10023;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke;
  v9[3] = &unk_1E35D7C00;
  v5 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v5;
  if (objc_msgSend(v5, "enumerateOneTransactionWithBlock:", v9))
  {
    v6 = (void *)v14[5];
    v14[5] = 0;

  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)enumeratePHChangesWithBlock:(id)a3
{
  id v4;
  id v5;
  NSArray *transactions;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PHPersistentChangeFetchResult *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D71930]);
  transactions = self->_transactions;
  -[PHPersistentChangeFetchResult _managedObjectContext](self, "_managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTransactions:managedObjectObjectContext:", transactions, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke;
  v11[3] = &unk_1E35D7C28;
  v12 = v8;
  v13 = self;
  v14 = v4;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v10, "enumerateRemainingTransactionsWithBlock:", v11);

}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

void __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__10022;
  v10[4] = __Block_byref_object_dispose__10023;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke_2;
  v7[3] = &unk_1E35DEE50;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v10;
  v7[4] = v5;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(v10, 8);

}

void __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PHChangeBuilder changeWithManagedObjectContext:library:options:transaction:](PHChangeBuilder, "changeWithManagedObjectContext:library:options:transaction:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke_2;
  v9[3] = &unk_1E35DEB38;
  v5 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v7;
  v12 = v3;
  v13 = v6;
  v8 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v9);

}

void __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PHPersistentChangeEnumerationContext"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHChangeBuilder persistentChangeWithManagedObjectContext:library:options:transaction:enumerationContext:](PHChangeBuilder, "persistentChangeWithManagedObjectContext:library:options:transaction:enumerationContext:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(a1 + 48), v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10022;
  v19 = __Block_byref_object_dispose__10023;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke_27;
  v11[3] = &unk_1E35DEB38;
  v7 = *(_QWORD *)(a1 + 40);
  v14 = &v15;
  v11[4] = v7;
  v8 = v5;
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v6, "performBlockAndWait:", v11);

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v16[5], a3, v9, v10);
  _Block_object_dispose(&v15, 8);

}

void __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PHChangeBuilder persistentChangeWithManagedObjectContext:library:options:transaction:enumerationContext:](PHChangeBuilder, "persistentChangeWithManagedObjectContext:library:options:transaction:enumerationContext:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __75__PHPersistentChangeFetchResult_initWithTransactions_options_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

+ (PHPersistentChangeFetchResult)fetchResultWithToken:(id)a3 options:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t v28[16];
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(a3, "persistentHistoryToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71928], "markerWithToken:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeHandlingPhotoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2938];
    v31 = CFSTR("Failed to access library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3109, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22;
LABEL_15:
    if (a6)
    {
      v23 = objc_retainAutorelease(v23);
      v18 = 0;
      *a6 = v23;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_18;
  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0D71938], "fetchTransactionsSinceMarker:withFetchRequest:batchSize:context:error:", v13, 0, 100, v15, &v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  if (v16)
  {
    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransactions:options:photoLibrary:", v16, v10, v11);
    v19 = 0;
  }
  else
  {
    if ((PLIsErrorEqualToCode() & 1) != 0)
    {
      v24 = 0;
      v25 = 3105;
    }
    else
    {
      if (v17)
      {
        v32 = *MEMORY[0x1E0CB3388];
        v33[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PLPhotoKitGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_FAULT, "Missing fetch error in return from +[PLPersistentHistoryUtilities fetchTransactionsSinceMarker:withFetchRequest:batchSize:context:error:]", v28, 2u);
        }

        v24 = 0;
      }
      v25 = -1;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v25, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
  }

  v23 = v19;
  if (!v18)
    goto LABEL_15;
LABEL_18:

  return (PHPersistentChangeFetchResult *)v18;
}

@end
