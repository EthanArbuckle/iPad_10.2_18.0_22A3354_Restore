@implementation HDConceptIndexResetOperation

- (HDConceptIndexResetOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDConceptIndexResetOperation;
  return -[HDConceptIndexResetOperation init](&v3, sel_init);
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__HDConceptIndexResetOperation_performWithProfile_transaction_error___block_invoke;
  v10[3] = &unk_1E6CEBC00;
  v11 = v6;
  v8 = v6;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDConceptIndexEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, a5, v10);

  return (char)a5;
}

BOOL __69__HDConceptIndexResetOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v14;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  +[HDConceptIndexer stateWithProfile:transaction:error:](HDConceptIndexer, "stateWithProfile:transaction:error:", v6, v5, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v8)
  {
    if (+[HDConceptIndexEntity removeAllConceptIndexEntriesWithProfile:error:](HDConceptIndexEntity, "removeAllConceptIndexEntriesWithProfile:error:", *(_QWORD *)(a1 + 32), a3))
    {
      objc_msgSend(v5, "protectedDatabase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[HDSQLiteEntity deleteEntitiesInDatabase:predicate:error:](HDAdHocConceptEntity, "deleteEntitiesInDatabase:predicate:error:", v10, 0, a3);

      if (v11)
      {
        +[HDConceptIndexState stateWithGeneration:](HDConceptIndexState, "stateWithGeneration:", objc_msgSend(v7, "generation") + 1);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = +[HDConceptIndexer storeState:profile:transaction:error:](HDConceptIndexer, "storeState:profile:transaction:error:", v12, *(_QWORD *)(a1 + 32), v5, a3);
        v7 = (void *)v12;
        goto LABEL_9;
      }
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_8;
  }
  v9 = 0;
  *a3 = objc_retainAutorelease(v8);
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDConceptIndexResetOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDConceptIndexResetOperation;
  return -[HDConceptIndexResetOperation init](&v4, sel_init, a3);
}

@end
