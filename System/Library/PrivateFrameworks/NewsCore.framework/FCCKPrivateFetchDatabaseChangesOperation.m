@implementation FCCKPrivateFetchDatabaseChangesOperation

- (BOOL)validateOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKPrivateFetchDatabaseChangesOperation;
  return -[FCCKPrivateDatabaseOperation validateOperation](&v3, sel_validateOperation);
}

- (void)performOperation
{
  FCThreadSafeMutableArray *v3;
  dispatch_group_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  FCThreadSafeMutableArray *v8;
  NSObject *v9;
  NSObject *v10;
  FCThreadSafeMutableArray *v11;
  _QWORD block[4];
  FCThreadSafeMutableArray *v13;
  FCCKPrivateFetchDatabaseChangesOperation *v14;
  _QWORD v15[4];
  dispatch_group_t v16;
  FCCKPrivateFetchDatabaseChangesOperation *v17;
  FCThreadSafeMutableArray *v18;

  v3 = objc_alloc_init(FCThreadSafeMutableArray);
  v4 = dispatch_group_create();
  v5 = -[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight");
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke;
  v15[3] = &unk_1E4647140;
  v16 = v4;
  v17 = self;
  v8 = v3;
  v18 = v8;
  v9 = v4;
  -[FCCKPrivateDatabase enumerateActiveDestinationsWithOptions:handler:]((uint64_t)v6, v5, v15);

  FCDispatchQueueForQualityOfService(-[FCCKPrivateFetchDatabaseChangesOperation qualityOfService](self, "qualityOfService"));
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_5;
  block[3] = &unk_1E463AD10;
  v13 = v8;
  v14 = self;
  v11 = v8;
  dispatch_group_notify(v9, v10, block);

}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = objc_alloc_init(MEMORY[0x1E0C94DB0]);
  objc_msgSend(*(id *)(a1 + 40), "previousServerChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeTokenForDestination:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreviousServerChangeToken:", v6);

  objc_msgSend(v4, "setFetchAllChanges:", 1);
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_2;
  v21[3] = &unk_1E46470F0;
  v9 = v7;
  v22 = v9;
  objc_msgSend(v4, "setRecordZoneWithIDChangedBlock:", v21);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_3;
  v19[3] = &unk_1E46470F0;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(v4, "setRecordZoneWithIDWasDeletedBlock:", v19);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_4;
  v13[3] = &unk_1E4647118;
  v18 = a2;
  v14 = v9;
  v15 = v10;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 32);
  v11 = v10;
  v12 = v9;
  objc_msgSend(v4, "setFetchDatabaseChangesCompletionBlock:", v13);
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, a2);

}

uint64_t __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  FCCKPrivateFetchDatabaseChangesSingleDestinationResult *v9;

  v7 = a4;
  v8 = a2;
  v9 = objc_alloc_init(FCCKPrivateFetchDatabaseChangesSingleDestinationResult);
  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setDestination:](v9, "setDestination:", *(_QWORD *)(a1 + 64));
  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setChangedZoneIDs:](v9, "setChangedZoneIDs:", *(_QWORD *)(a1 + 32));
  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setDeletedZoneIDs:](v9, "setDeletedZoneIDs:", *(_QWORD *)(a1 + 40));
  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setServerChangeToken:](v9, "setServerChangeToken:", v8);

  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setMoreComing:](v9, "setMoreComing:", a3);
  -[FCCKPrivateFetchDatabaseChangesSingleDestinationResult setError:](v9, "setError:", v7);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  FCCKPrivateDatabaseServerChangeToken *v17;
  uint64_t v18;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = a1;
  objc_msgSend(*(id *)(a1 + 32), "readOnlyArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    LOBYTE(v7) = 0;
    v8 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "changedZoneIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v11);

        objc_msgSend(v10, "deletedZoneIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        objc_msgSend(v10, "serverChangeToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v10, "serverChangeToken");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "destination"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v15);

        }
        if ((v7 & 1) != 0)
        {
          v7 = 1;
          if (v6)
            goto LABEL_12;
        }
        else
        {
          v7 = objc_msgSend(v10, "moreComing");
          if (v6)
          {
LABEL_12:
            if (!objc_msgSend(v6, "fc_isCKErrorWithCode:", 21))
              continue;
          }
        }
        objc_msgSend(v10, "error");
        v16 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v16;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v5)
        goto LABEL_18;
    }
  }
  v6 = 0;
  v7 = 0;
LABEL_18:

  objc_msgSend(*(id *)(v18 + 40), "setResultChangedZoneIDs:", v2);
  objc_msgSend(*(id *)(v18 + 40), "setResultDeletedZoneIDs:", v3);
  v17 = -[FCCKPrivateDatabaseServerChangeToken initWithChangeTokensByDestination:]([FCCKPrivateDatabaseServerChangeToken alloc], "initWithChangeTokensByDestination:", v20);
  objc_msgSend(*(id *)(v18 + 40), "setResultServerChangeToken:", v17);

  objc_msgSend(*(id *)(v18 + 40), "setResultMoreComing:", v7);
  objc_msgSend(*(id *)(v18 + 40), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[FCCKPrivateFetchDatabaseChangesOperation resultServerChangeToken](self, "resultServerChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCKPrivateFetchDatabaseChangesOperation resultMoreComing](self, "resultMoreComing");
  if (v10)
  {
    if (!v4)
    {
      -[FCCKPrivateFetchDatabaseChangesOperation previousServerChangeToken](self, "previousServerChangeToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = 1;
  }
  -[FCCKPrivateFetchDatabaseChangesOperation fetchDatabaseChangesCompletionBlock](self, "fetchDatabaseChangesCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FCCKPrivateFetchDatabaseChangesOperation fetchDatabaseChangesCompletionBlock](self, "fetchDatabaseChangesCompletionBlock");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchDatabaseChangesOperation resultChangedZoneIDs](self, "resultChangedZoneIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchDatabaseChangesOperation resultDeletedZoneIDs](self, "resultDeletedZoneIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, _BOOL8, id))v7)[2](v7, v8, v9, v4, v5, v10);

  }
}

- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)fetchDatabaseChangesCompletionBlock
{
  return self->_fetchDatabaseChangesCompletionBlock;
}

- (void)setFetchDatabaseChangesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)resultChangedZoneIDs
{
  return self->_resultChangedZoneIDs;
}

- (void)setResultChangedZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultChangedZoneIDs, a3);
}

- (NSArray)resultDeletedZoneIDs
{
  return self->_resultDeletedZoneIDs;
}

- (void)setResultDeletedZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultDeletedZoneIDs, a3);
}

- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, a3);
}

- (BOOL)resultMoreComing
{
  return self->_resultMoreComing;
}

- (void)setResultMoreComing:(BOOL)a3
{
  self->_resultMoreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_resultDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_resultChangedZoneIDs, 0);
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
