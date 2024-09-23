@implementation HDSharingAuthorizationManager

- (HDSharingAuthorizationManager)initWithProfile:(id)a3
{
  id v4;
  HDSharingAuthorizationManager *v5;
  HDSharingAuthorizationManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKSynchronousObserverSet *observers;
  NSMutableDictionary *v11;
  NSMutableDictionary *addedAuthorizationsByRecipient;
  NSMutableDictionary *v13;
  NSMutableDictionary *removedAuthorizationsByRecipient;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDSharingAuthorizationManager;
  v5 = -[HDSharingAuthorizationManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    HKLogSharing();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("sharing-authorization-manager-observers"), v8);
    observers = v6->_observers;
    v6->_observers = (HKSynchronousObserverSet *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedAuthorizationsByRecipient = v6->_addedAuthorizationsByRecipient;
    v6->_addedAuthorizationsByRecipient = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    removedAuthorizationsByRecipient = v6->_removedAuthorizationsByRecipient;
    v6->_removedAuthorizationsByRecipient = v13;

  }
  return v6;
}

- (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__162;
  v20 = __Block_byref_object_dispose__162;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HDSharingAuthorizationManager_sharingAuthorizationsForRecipientIdentifier_error___block_invoke;
  v13[3] = &unk_1E6CEF700;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __83__HDSharingAuthorizationManager_sharingAuthorizationsForRecipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__162;
  v20 = __Block_byref_object_dispose__162;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__HDSharingAuthorizationManager_sharingAuthorizationsMarkedForDeletionForRecipientIdentifier_error___block_invoke;
  v13[3] = &unk_1E6CEF700;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __100__HDSharingAuthorizationManager_sharingAuthorizationsMarkedForDeletionForRecipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDSharingAuthorizationsEntity sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:databaseTransaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)recipientIdentifiersForSharingAuthorizations:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__HDSharingAuthorizationManager_recipientIdentifiersForSharingAuthorizations_error___block_invoke;
  v15[3] = &unk_1E6CE7950;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, a4, v15);

  if ((_DWORD)a4)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

uint64_t __84__HDSharingAuthorizationManager_recipientIdentifiersForSharingAuthorizations_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  _QWORD *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v18 = a3;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      a3 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)a3);
        v19 = 0;
        +[HDSharingAuthorizationsEntity recipientIdentifiersForSharingAuthorization:databaseTransaction:error:](HDSharingAuthorizationsEntity, "recipientIdentifiersForSharingAuthorization:databaseTransaction:error:", v10, v5, &v19, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v19;
        v13 = v12;
        if (!v11)
        {
          v15 = v12;
          v16 = v15;
          LODWORD(a3) = v15 == 0;
          if (v15)
          {
            if (v18)
              *v18 = objc_retainAutorelease(v15);
            else
              _HKLogDroppedError();
          }

          v14 = 0;
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);

        a3 = (_QWORD *)((char *)a3 + 1);
      }
      while ((_QWORD *)v8 != a3);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_15:

  return (a3 | v14) & 1;
}

- (BOOL)addSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__HDSharingAuthorizationManager_addSharingAuthorizations_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

BOOL __84__HDSharingAuthorizationManager_addSharingAuthorizations_recipientIdentifier_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  return -[HDSharingAuthorizationManager _addSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a3);
}

- (BOOL)_addSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  _BOOL8 v18;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_7;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke;
  v22[3] = &unk_1E6CE7FB8;
  v22[4] = a1;
  v12 = v9;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v11, "onCommit:orRollback:", v22, 0);
  if (objc_msgSend(v13, "type") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v21 = 0;
    +[HDSharingRelationshipEntity insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:](HDSharingRelationshipEntity, "insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:", v13, v14, 0, objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID"), v11, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;

    if (!v16)
    {
      v20 = v17;
      v18 = v20 == 0;
      if (v20)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

      goto LABEL_6;
    }

  }
  v18 = +[HDSharingAuthorizationsEntity addSharingAuthorizations:forRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "addSharingAuthorizations:forRecipientIdentifier:databaseTransaction:error:", v12, v13, v11, a5);
LABEL_6:

LABEL_7:
  return v18;
}

void __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2;
  v5[3] = &unk_1E6D044E0;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "notifyObservers:", v5);

}

uint64_t __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationManager:didAddSharingAuthorizations:recipientIdentifier:", a1[4], a1[5], a1[6]);
}

- (BOOL)removeSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HDSharingAuthorizationManager_removeSharingAuthorizations_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

BOOL __87__HDSharingAuthorizationManager_removeSharingAuthorizations_recipientIdentifier_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  return -[HDSharingAuthorizationManager _removeSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a3);
}

- (BOOL)_removeSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _BOOL8 v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_21;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke;
  v25[3] = &unk_1E6CE7FB8;
  v25[4] = a1;
  v12 = v9;
  v26 = v12;
  v13 = v10;
  v27 = v13;
  objc_msgSend(v11, "onCommit:orRollback:", v25, 0);
  if (objc_msgSend(v13, "type") == 1)
  {
    v24 = 0;
    +[HDSharingRelationshipEntity entityWithRecipientIdentifier:databaseTransaction:error:](HDSharingRelationshipEntity, "entityWithRecipientIdentifier:databaseTransaction:error:", v13, v11, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (v15)
    {
      v16 = v15;
      if (a5)
      {
        v16 = objc_retainAutorelease(v15);
        v17 = 0;
        *a5 = v16;
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
LABEL_19:

      goto LABEL_20;
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v19 = objc_msgSend(v14, "setDateModified:databaseTransaction:error:", v18, v11, &v23);
      v20 = v23;

      if ((v19 & 1) == 0)
      {
        v16 = v20;
        v17 = v16 == 0;
        if (v16)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v16);
          else
            _HKLogDroppedError();
        }

        goto LABEL_19;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogSharing();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = a1;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Removing authorizations from non-existent relationship with recipient %@", buf, 0x16u);
      }

      v20 = 0;
    }

  }
  v17 = +[HDSharingAuthorizationsEntity deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:", v12, v13, v11, a5);
LABEL_20:

LABEL_21:
  return v17;
}

void __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2;
  v5[3] = &unk_1E6D044E0;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "notifyObservers:", v5);

}

uint64_t __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationManager:didRemoveSharingAuthorizations:recipientIdentifier:", a1[4], a1[5], a1[6]);
}

- (BOOL)updateAuthorizationsForRecipientIdentifier:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToRemove:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __139__HDSharingAuthorizationManager_updateAuthorizationsForRecipientIdentifier_sharingAuthorizationsToAdd_sharingAuthorizationsToRemove_error___block_invoke;
  v19[3] = &unk_1E6CF26F8;
  v19[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, a6, v19);

  return (char)a6;
}

uint64_t __139__HDSharingAuthorizationManager_updateAuthorizationsForRecipientIdentifier_sharingAuthorizationsToAdd_sharingAuthorizationsToRemove_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = a2;
  LODWORD(v5) = -[HDSharingAuthorizationManager _addSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](v5, v6, v7, v8, a3);
  LODWORD(a3) = -[HDSharingAuthorizationManager _removeSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 48), v8, a3);

  return v5 & a3;
}

- (BOOL)revokeRecipientWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E6CE7950;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v11);

  return (char)a4;
}

BOOL __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  id v9;
  _BOOL8 v10;
  id v11;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a2;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E6CE8080;
  v6 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v6;
  objc_msgSend(v5, "onCommit:orRollback:", v14, 0);
  if (objc_msgSend(*(id *)(a1 + 40), "type") != 1)
    goto LABEL_4;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v8 = +[HDSharingRelationshipEntity deleteEntityWithRecipientIdentifier:databaseTransaction:error:](HDSharingRelationshipEntity, "deleteEntityWithRecipientIdentifier:databaseTransaction:error:", v7, v5, &v13);
  v9 = v13;
  if (v8)
  {

LABEL_4:
    v10 = +[HDSharingAuthorizationsEntity deleteAllSharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "deleteAllSharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", *(_QWORD *)(a1 + 40), v5, a3);
    goto LABEL_10;
  }
  v11 = v9;
  v10 = v11 == 0;
  if (v11)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();
  }

LABEL_10:
  return v10;
}

void __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_3;
  v4[3] = &unk_1E6D04508;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "notifyObservers:", v4);

}

uint64_t __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationManager:didRevokeRecipientWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__HDSharingAuthorizationManager_markSharingAuthorizationsForDeletion_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E6CE7950;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

BOOL __96__HDSharingAuthorizationManager_markSharingAuthorizationsForDeletion_recipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSharingAuthorizationsEntity markSharingAuthorizationsForDeletion:recipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "markSharingAuthorizationsForDeletion:recipientIdentifier:databaseTransaction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)deleteMarkedSharingAuthorizations
{
  id WeakRetained;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  HDSharingAuthorizationManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v4, &v8, &__block_literal_global_197);
  v6 = v8;

  if (!v5)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error removing marked sharing authorizations %{public}@", buf, 0x16u);
    }

  }
}

BOOL __66__HDSharingAuthorizationManager_deleteMarkedSharingAuthorizations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSharingAuthorizationsEntity deleteAllMarkedSharingAuthorizationsWithTransaction:error:](HDSharingAuthorizationsEntity, "deleteAllMarkedSharingAuthorizationsWithTransaction:error:", a2, a3);
}

- (BOOL)insertOrUpdateCodableRelationships:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke;
  v13[3] = &unk_1E6CE9280;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v11 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v13);

  return (char)a5;
}

uint64_t __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id obj;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint8_t buf[4];
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke_2;
  v45[3] = &unk_1E6CE80E8;
  v45[4] = *(_QWORD *)(a1 + 32);
  v37 = v4;
  objc_msgSend(v4, "onCommit:orRollback:", v45, 0);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    v34 = *(_QWORD *)v42;
    v35 = a1;
LABEL_3:
    v8 = 0;
    v36 = v6;
    while (1)
    {
      if (*(_QWORD *)v42 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
      if (objc_msgSend(v9, "recipientType") != 1)
        goto LABEL_20;
      v10 = objc_alloc(MEMORY[0x1E0CB6BB8]);
      objc_msgSend(v9, "recipientIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initForClinicalAccountIdentifier:", v11);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(WeakRetained, "syncIdentityManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "legacySyncIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v9, "hasSyncIdentity"))
        goto LABEL_11;
      objc_msgSend(v9, "syncIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v16, &v40);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v40;

      if (v17)
      {
        v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(v35 + 32) + 8));
        objc_msgSend(v19, "syncIdentityManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v18;
        objc_msgSend(v20, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v17, 1, v37, &v39);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v39;

        if (v21)
        {

          v15 = (void *)v21;
          a1 = v35;
LABEL_11:
          v23 = *(void **)(a1 + 32);
          objc_msgSend(v9, "sharingAuthorizations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          HDSharingAuthorizationsFromCodableSharingAuthorizations(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v9, "dateModified");
          objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v15, "entity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v23) = objc_msgSend(v23, "insertOrUpdateRecipientIdentifier:sharingAuthorizations:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:", v12, v25, v27, v28, objc_msgSend(v29, "persistentID"), v37, a3);

          if (!(_DWORD)v23)
          {

            v31 = 0;
            goto LABEL_24;
          }
          v7 = v34;
          v6 = v36;
          goto LABEL_19;
        }
        _HKInitializeLogging();
        HKLogSharing();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v22;
          _os_log_fault_impl(&dword_1B7802000, v30, OS_LOG_TYPE_FAULT, "HDSharingRelationshipEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
        v15 = 0;
        v18 = v22;
        v7 = v34;
        a1 = v35;
        v6 = v36;
      }
      else
      {
        _HKInitializeLogging();
        HKLogSharing();
        v30 = objc_claimAutoreleasedReturnValue();
        a1 = v35;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v18;
          _os_log_fault_impl(&dword_1B7802000, v30, OS_LOG_TYPE_FAULT, "HDSharingRelationshipEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }

LABEL_19:
LABEL_20:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  v31 = 1;
LABEL_24:

  return v31;
}

uint64_t __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v2 = *(id *)(v1 + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v9 = *(void **)(v1 + 16);
          v22[0] = v4;
          v22[1] = 3221225472;
          v22[2] = __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke;
          v22[3] = &unk_1E6D04508;
          v22[4] = v1;
          v22[5] = v8;
          objc_msgSend(v9, "notifyObservers:", v22);
        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(v1 + 24), "removeAllObjects");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = *(id *)(v1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
          v16 = *(void **)(v1 + 16);
          v17[0] = v4;
          v17[1] = 3221225472;
          v17[2] = __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke_2;
          v17[3] = &unk_1E6D04508;
          v17[4] = v1;
          v17[5] = v15;
          objc_msgSend(v16, "notifyObservers:", v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v12);
    }

    return objc_msgSend(*(id *)(v1 + 32), "removeAllObjects");
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (BOOL)insertOrUpdateRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 dateModified:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 databaseTransaction:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v36;
  void *v37;
  HDSharingAuthorizationManager *v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (objc_msgSend(v15, "type") == 1)
  {
    v38 = self;
    v19 = a9;
    v42 = 0;
    +[HDSharingRelationshipEntity entityWithRecipientIdentifier:databaseTransaction:error:](HDSharingRelationshipEntity, "entityWithRecipientIdentifier:databaseTransaction:error:", v15, v18, &v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v42;
    v22 = v21;
    if (!v20 && v21)
    {
      if (a9)
      {
        v22 = objc_retainAutorelease(v21);
        v23 = 0;
        *a9 = v22;
      }
      else
      {
        _HKLogDroppedError();
        v23 = 0;
      }
      goto LABEL_33;
    }
    if (v20)
    {
      v36 = v16;
      v41 = v21;
      objc_msgSend(v20, "dateModifiedInDatabaseTransaction:error:", v18, &v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v41;

      if (!v24)
      {
        v27 = v25;
        v22 = v27;
        v23 = v27 == 0;
        v16 = v36;
        if (v27)
        {
          if (a9)
            *a9 = objc_retainAutorelease(v27);
          else
            _HKLogDroppedError();
        }

        goto LABEL_33;
      }
      v26 = objc_msgSend(v24, "hk_isAfterOrEqualToDate:", v17);

      if ((v26 & 1) != 0)
      {
        v23 = 1;
        v22 = v25;
        v16 = v36;
LABEL_33:

        goto LABEL_34;
      }
      v22 = v25;
      v16 = v36;
      v19 = a9;
    }
    v40 = v22;
    +[HDSharingRelationshipEntity insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:](HDSharingRelationshipEntity, "insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:", v15, v17, a6, a7, v18, &v40);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v40;

    v37 = (void *)v28;
    if (v28)
    {
      v39 = v29;
      +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", v15, v18, &v39);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v39;

      if (v30)
      {
        objc_msgSend(v16, "arrayByExcludingObjectsInArray:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v38->_addedAuthorizationsByRecipient, "setObject:forKeyedSubscript:", v31, v15);

        objc_msgSend(v30, "arrayByExcludingObjectsInArray:", v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v38->_removedAuthorizationsByRecipient, "setObject:forKeyedSubscript:", v32, v15);

        v23 = +[HDSharingAuthorizationsEntity insertOrReplaceWithRecipientIdentifier:sharingAuthorizations:databaseTransaction:error:](HDSharingAuthorizationsEntity, "insertOrReplaceWithRecipientIdentifier:sharingAuthorizations:databaseTransaction:error:", v15, v16, v18, a9);
      }
      else
      {
        v34 = v22;
        v22 = v34;
        v23 = v34 == 0;
        if (v34)
        {
          if (a9)
            *a9 = objc_retainAutorelease(v34);
          else
            _HKLogDroppedError();
        }

        v30 = 0;
      }
    }
    else
    {
      v33 = v29;
      v30 = v33;
      if (v33)
      {
        if (v19)
        {
          v30 = objc_retainAutorelease(v33);
          v23 = 0;
          *v19 = v30;
        }
        else
        {
          _HKLogDroppedError();
          v23 = 0;
        }
        v22 = v30;
      }
      else
      {
        v22 = 0;
        v23 = 1;
      }
    }

    goto LABEL_33;
  }
  v23 = 1;
LABEL_34:

  return v23;
}

void __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingAuthorizationManager:didAddSharingAuthorizations:recipientIdentifier:", v3, v7, *(_QWORD *)(a1 + 40));

}

void __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingAuthorizationManager:didRemoveSharingAuthorizations:recipientIdentifier:", v3, v7, *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAuthorizationsByRecipient, 0);
  objc_storeStrong((id *)&self->_addedAuthorizationsByRecipient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
