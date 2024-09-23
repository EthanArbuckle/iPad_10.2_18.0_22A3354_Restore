@implementation HDSharedSummaryTransactionBuilderServer

- (HDSharedSummaryTransactionBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSharedSummaryTransactionBuilderServer *v11;
  uint64_t v12;
  HKSharedSummaryTransactionBuilderTaskConfiguration *configuration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSharedSummaryTransactionBuilderServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (HKSharedSummaryTransactionBuilderTaskConfiguration *)v12;

  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5EB8];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v6;

  objc_msgSend(a3, "transactionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Missing transaction UUID"));
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B78], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B78], "clientInterface");
}

- (void)remote_getCommitStatusWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  _QWORD v17[6];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  id v23;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_committed)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    v23 = 0;
    v6 = -[HDSharedSummaryTransactionBuilderServer _retrieveTransactionIfNeededWithError:](self, &v23);
    v7 = v23;
    v8 = v7;
    if (v6)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      -[HDStandardTaskServer profile](self, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__HDSharedSummaryTransactionBuilderServer_remote_getCommitStatusWithCompletion___block_invoke;
      v17[3] = &unk_1E6CEF700;
      v17[4] = self;
      v17[5] = &v19;
      v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharedSummaryTransactionEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, &v18, v17);
      v12 = v18;

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v20 + 24));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v13, 0);

      }
      else
      {
        ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v12);
      }
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      if (objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 126))
      {
        v14 = MEMORY[0x1E0C9AAB0];
        v15 = v5;
        v16 = 0;
      }
      else
      {
        v15 = v5;
        v14 = 0;
        v16 = v8;
      }
      ((void (**)(_QWORD, uint64_t, void *))v5)[2](v15, v14, v16);
      v12 = v8;
    }

  }
}

- (BOOL)_retrieveTransactionIfNeededWithError:(_QWORD *)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1[6];
    if (!v3)
    {
      objc_msgSend(a1, "profile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharedSummaryManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 40), "transactionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(v2 + 40), "allowCommitted");
      v18 = 0;
      objc_msgSend(v6, "transactionWithUUID:requireUncommitted:error:", v7, v8 ^ 1u, &v18);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (uint64_t)v18;
      v11 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = v9;

      v12 = *(_QWORD *)(v2 + 48);
      if (!(v12 | v10))
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend((id)v2, "taskUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hk_error:format:", 118, CFSTR("Transaction with UUID %@ not found"), v15);
        v10 = objc_claimAutoreleasedReturnValue();

        v12 = *(_QWORD *)(v2 + 48);
      }
      if (v12)
      {
        v2 = -[HDSharedSummaryTransactionBuilderServer _checkCommitStatusIfNeededWithError:](v2, (uint64_t)a2);

        return v2;
      }
      v17 = (id)v10;
      if (v17)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

      v3 = *(_QWORD *)(v2 + 48);
    }
    return v3 != 0;
  }
  return v2;
}

BOOL __80__HDSharedSummaryTransactionBuilderServer_remote_getCommitStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  char v6;
  id v7;
  id v8;
  id v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10 = 0;
  v6 = objc_msgSend(v5, "committedInDatabaseTransaction:error:", a2, &v10);
  v7 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  v8 = v7;
  if (v8)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError();
  }

  return v8 == 0;
}

- (void)remote_addSummaries:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  v16 = 0;
  v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  v8 = v16;
  if (!v9)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharedSummaryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v15 = v8;
  v13 = objc_msgSend(v11, "addSharedSummaries:transactionEntity:error:", v6, transactionEntity, &v15);
  v14 = v15;

  v7[2](v7, v13, v14);
  v8 = v14;
LABEL_6:

}

- (BOOL)_createOrRetrieveTransactionIfNeededWithError:(_QWORD *)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;
  id v21;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1[6];
    if (!v3)
    {
      objc_msgSend(a1, "profile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharedSummaryManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 40), "transactionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(v2 + 40), "allowCommitted");
      v21 = 0;
      objc_msgSend(v6, "transactionWithUUID:requireUncommitted:error:", v7, v8 ^ 1u, &v21);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (unint64_t)v21;
      v11 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = v9;

      v12 = *(_QWORD *)(v2 + 48);
      if (!(v12 | v10))
      {
        objc_msgSend((id)v2, "profile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sharedSummaryManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 40), "transactionUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        objc_msgSend(v14, "createNewTransactionWithUUID:error:", v15, &v20);
        v16 = objc_claimAutoreleasedReturnValue();
        v10 = (unint64_t)v20;
        v17 = *(void **)(v2 + 48);
        *(_QWORD *)(v2 + 48) = v16;

        v12 = *(_QWORD *)(v2 + 48);
      }
      if (v12)
      {
        v2 = -[HDSharedSummaryTransactionBuilderServer _checkCommitStatusIfNeededWithError:](v2, (uint64_t)a2);

        return v2;
      }
      v19 = (id)v10;
      if (v19)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      v3 = *(_QWORD *)(v2 + 48);
    }
    return v3 != 0;
  }
  return v2;
}

- (void)remote_reuseSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  v16 = 0;
  v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  v8 = v16;
  if (!v9)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharedSummaryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v15 = v8;
  v13 = objc_msgSend(v11, "reuseSharedSummariesWithUUIDs:transactionEntity:error:", v6, transactionEntity, &v15);
  v14 = v15;

  v7[2](v7, v13, v14);
  v8 = v14;
LABEL_6:

}

- (void)remote_reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10[2](v10, 0, v11);
    goto LABEL_6;
  }
  v19 = 0;
  v12 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v19);
  v11 = v19;
  if (!v12)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sharedSummaryManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v18 = v11;
  v16 = objc_msgSend(v14, "reuseSharedSummariesWithPackage:names:transactionEntity:error:", v8, v9, transactionEntity, &v18);
  v17 = v18;

  v10[2](v10, v16, v17);
  v11 = v17;
LABEL_6:

}

- (void)remote_reuseAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  v16 = 0;
  v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  v8 = v16;
  if (!v9)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharedSummaryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v15 = v8;
  v13 = objc_msgSend(v11, "reuseSharedSummariesWithPackage:names:transactionEntity:error:", v6, 0, transactionEntity, &v15);
  v14 = v15;

  v7[2](v7, v13, v14);
  v8 = v14;
LABEL_6:

}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7[2](v7, 0, v8);
    goto LABEL_6;
  }
  v16 = 0;
  v9 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v16);
  v8 = v16;
  if (!v9)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharedSummaryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v15 = v8;
  v13 = objc_msgSend(v11, "addMetadata:transactionEntity:error:", v6, transactionEntity, &v15);
  v14 = v15;

  v7[2](v7, v13, v14);
  v8 = v14;
LABEL_6:

}

- (void)remote_removeSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v14;
  id v15;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_transactionEntity)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sharedSummaryManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      transactionEntity = self->_transactionEntity;
      v15 = 0;
      v14 = objc_msgSend(v12, "removeSummariesWithUUIDs:transactionEntity:error:", v7, transactionEntity, &v15);
      v10 = v15;

      v8[2](v8, v14, v10);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Transaction not found"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v9;
  v8[2](v8, 0, (id)v9);
LABEL_6:

}

- (void)remote_removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, id);
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, id))a5;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_transactionEntity)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sharedSummaryManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      transactionEntity = self->_transactionEntity;
      v18 = 0;
      v17 = objc_msgSend(v15, "removeSummariesWithPackage:names:transactionEntity:error:", v9, v10, transactionEntity, &v18);
      v13 = v18;

      v11[2](v11, v17, v13);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Transaction not found"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v12;
  v11[2](v11, 0, (id)v12);
LABEL_6:

}

- (void)remote_removeAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v14;
  id v15;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_transactionEntity)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sharedSummaryManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      transactionEntity = self->_transactionEntity;
      v15 = 0;
      v14 = objc_msgSend(v12, "removeSummariesWithPackage:names:transactionEntity:error:", v7, 0, transactionEntity, &v15);
      v10 = v15;

      v8[2](v8, v14, v10);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Transaction not found"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v9;
  v8[2](v8, 0, (id)v9);
LABEL_6:

}

- (void)remote_commitAsUrgent:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD, id);
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  HDSharedSummaryTransactionEntity *transactionEntity;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }
  else
  {
    v19 = 0;
    v8 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v19);
    v9 = v19;
    if (v8)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharedSummaryManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      transactionEntity = self->_transactionEntity;
      v18 = v9;
      objc_msgSend(v11, "commitTransactionEntity:error:", transactionEntity, &v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v18;

      self->_committed = v13 != 0;
      if (v13)
      {
        -[HDStandardTaskServer profile](self, "profile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cloudSyncManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sharedSummaryManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v4)
          objc_msgSend(v16, "scheduleUrgentPush");
        else
          objc_msgSend(v16, "scheduleBackgroundPush");

      }
      ((void (**)(id, void *, id))v6)[2](v6, v13, v7);

    }
    else
    {
      v6[2](v6, 0, v9);
      v7 = v9;
    }
  }

}

- (void)remote_discardWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  HDSharedSummaryTransactionEntity *transactionEntity;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 126, CFSTR("Transaction already committed"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4[2](v4, 0, v5);
    goto LABEL_6;
  }
  v13 = 0;
  v6 = -[HDSharedSummaryTransactionBuilderServer _retrieveTransactionIfNeededWithError:](self, &v13);
  v5 = v13;
  if (!v6)
    goto LABEL_5;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedSummaryManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  transactionEntity = self->_transactionEntity;
  v12 = v5;
  v10 = objc_msgSend(v8, "discardTransactionEntity:error:", transactionEntity, &v12);
  v11 = v12;

  v4[2](v4, v10, v11);
  v5 = v11;
LABEL_6:

}

- (void)remote_addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t, id);
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HDSharedSummaryTransactionEntity *transactionEntity;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t, id))a5;
  if (self)
  {
    v26 = 0;
    v11 = -[HDSharedSummaryTransactionBuilderServer _createOrRetrieveTransactionIfNeededWithError:](self, &v26);
    v12 = v26;
    if (!v11)
    {
      v10[2](v10, 0, 1, v12);
LABEL_15:

      goto LABEL_16;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDStandardTaskServer profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sharedSummaryManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    transactionEntity = self->_transactionEntity;
    v25 = v12;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91__HDSharedSummaryTransactionBuilderServer__addedSummariesWithPackage_names_resultsHandler___block_invoke;
    v23[3] = &unk_1E6D03E78;
    v17 = v13;
    v24 = v17;
    LODWORD(transactionEntity) = objc_msgSend(v15, "enumerateSummariesInTransactionEntity:package:names:error:handler:", transactionEntity, v8, v9, &v25, v23);
    v18 = v25;

    if ((_DWORD)transactionEntity)
    {
      v19 = objc_msgSend(v17, "count");
      if (v9)
      {
        if (v19 < objc_msgSend(v9, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Some names not found for package %@ in %@"), v8, v9);
LABEL_10:
          v20 = objc_claimAutoreleasedReturnValue();

          v18 = (id)v20;
        }
      }
      else if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Cannot find summaries for package %@"), v8, v22);
        goto LABEL_10;
      }
    }
    if (objc_msgSend(v17, "count"))
      v21 = v17;
    else
      v21 = 0;
    ((void (**)(id, id, uint64_t, id))v10)[2](v10, v21, 1, v18);

    v12 = v18;
    goto LABEL_15;
  }
LABEL_16:

}

- (uint64_t)_checkCommitStatusIfNeededWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[5];

  if (!objc_msgSend(*(id *)(a1 + 40), "allowCommitted") || !*(_QWORD *)(a1 + 48))
    return 1;
  objc_msgSend((id)a1, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__HDSharedSummaryTransactionBuilderServer__checkCommitStatusIfNeededWithError___block_invoke;
  v8[3] = &unk_1E6CEBC00;
  v8[4] = a1;
  v6 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharedSummaryTransactionEntity, "performReadTransactionWithHealthDatabase:error:block:", v5, a2, v8);

  return v6;
}

uint64_t __79__HDSharedSummaryTransactionBuilderServer__checkCommitStatusIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v12 = 0;
  v6 = objc_msgSend(v5, "committedInDatabaseTransaction:error:", a2, &v12);
  v7 = v12;
  v8 = v7;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
    v9 = 1;
  else
    v9 = v7 == 0;
  v10 = v9;
  if (!v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v10;
}

uint64_t __91__HDSharedSummaryTransactionBuilderServer__addedSummariesWithPackage_names_resultsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionEntity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
