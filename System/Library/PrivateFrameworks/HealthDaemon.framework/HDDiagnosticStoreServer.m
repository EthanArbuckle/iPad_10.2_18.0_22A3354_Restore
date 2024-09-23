@implementation HDDiagnosticStoreServer

- (void)remote_fetchDiagnosticsWithKeys:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D29830];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedDiagnosticManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "diagnosticsForKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, _QWORD))a4 + 2))(v7, v9, 0);
}

- (void)remote_fetchURLForAnalyticsFileWithName:(id)a3 completion:(id)a4
{
  objc_class *v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D297F8];
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "initWithProfile:", v10);

  objc_msgSend(v12, "URLForAnalyticsFileWithName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v11, 0);
}

- (void)remote_fetchSQLPragma:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id obj;
  _QWORD aBlock[4];
  __CFString *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = (void (**)(id, _QWORD, void *))a4;
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Unsupported PRAGMA"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v13);

  }
  else
  {
    v7 = off_1E6CFD0E0[a3];
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__120;
    v29 = __Block_byref_object_dispose__120;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__120;
    v23 = __Block_byref_object_dispose__120;
    v24 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke;
    aBlock[3] = &unk_1E6CFD0C0;
    v16 = v7;
    v17 = &v19;
    v18 = &v25;
    v8 = _Block_copy(aBlock);
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id *)(v20 + 5);
    obj = (id)v20[5];
    objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &obj, v8, 0);
    objc_storeStrong(v12, obj);

    v6[2](v6, v26[5], (void *)v20[5]);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }

}

uint64_t __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  id obj;

  objc_msgSend(a2, "protectedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v5 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke_3;
  v8[3] = &unk_1E6CE8540;
  v8[4] = a1[6];
  v6 = objc_msgSend(v3, "executeSQL:error:bindingHandler:enumerationHandler:", v4, &obj, &__block_literal_global_142, v8);
  objc_storeStrong((id *)(v5 + 40), obj);

  return v6;
}

uint64_t __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6608], "taskIdentifier");
}

@end
