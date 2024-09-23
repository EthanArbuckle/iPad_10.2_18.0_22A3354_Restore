@implementation HDSummarySharingEntryManager

- (HDSummarySharingEntryManager)initWithProfile:(id)a3
{
  id v4;
  HDSummarySharingEntryManager *v5;
  HDSummarySharingEntryManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKObserverSet *observerSet;
  id WeakRetained;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSummarySharingEntryManager;
  v5 = -[HDSummarySharingEntryManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogSharing();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("sharing-entry-observers"), v8);
    observerSet = v6->_observerSet;
    v6->_observerSet = (HKObserverSet *)v9;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_hasCompletedContactResolution = 0;
    v6->_authorizationStatusWhenContactsResolved = 0;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)HDSummarySharingEntryManager;
  -[HDSummarySharingEntryManager dealloc](&v7, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "profileType") == 1)
  {
    objc_msgSend(v7, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "analyticsSubmissionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:queue:", self, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__contactStoreDidChange, *MEMORY[0x1E0C96870], 0);

  }
}

- (void)addObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_observerSet, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observerSet, "unregisterObserver:", a3);
}

- (BOOL)insertOrReplaceCodableEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 error:(id *)a5
{
  return -[HDSummarySharingEntryManager insertOrReplaceCodableEntries:ignoreIfExists:shouldResolveCNContact:syncProvenance:error:](self, "insertOrReplaceCodableEntries:ignoreIfExists:shouldResolveCNContact:syncProvenance:error:", a3, 0, a4, 0, a5);
}

- (BOOL)insertOrReplaceCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 shouldResolveCNContact:(BOOL)a5 syncProvenance:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  HDInsertCodableSummarySharingEntryOperation *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  HKObserverSet *observerSet;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  HDSummarySharingEntryManager *v24;
  uint64_t v25;

  v9 = a5;
  v10 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = -[HDInsertCodableSummarySharingEntryOperation initWithCodableEntries:ignoreIfExists:provenance:shouldResolveCNContact:]([HDInsertCodableSummarySharingEntryOperation alloc], "initWithCodableEntries:ignoreIfExists:provenance:shouldResolveCNContact:", v12, v10, a6, v9);
  -[HDSummarySharingEntryManager profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDJournalableOperation performOrJournalWithProfile:error:](v13, "performOrJournalWithProfile:error:", v14, a7);

  if (v15)
  {
    if (-[HDJournalableOperation didJournal](v13, "didJournal"))
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Successfully journaled sharing entries.", buf, 0xCu);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "hk_map:", &__block_literal_global_74);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "sharingEntryManager:didJournalEntries:", self, v18);

    }
    else
    {
      observerSet = self->_observerSet;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_2;
      v21[3] = &unk_1E6CF4AB0;
      v22 = v12;
      -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v21);
      WeakRetained = v22;
    }

  }
  return v15;
}

uint64_t __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingEntry");
}

void __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hk_map:", &__block_literal_global_192_0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v4);

}

uint64_t __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingEntry");
}

- (BOOL)updateEntryWithInvitationUUID:(id)a3 newStatus:(int64_t)a4 dateAccepted:(id)a5 ownerParticipant:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  HDUpdateCodableSummarySharingEntryOperation *v15;
  void *v16;
  HDUpdateCodableSummarySharingEntryOperation *v17;
  void *v18;
  BOOL v19;
  void *v20;
  HKObserverSet *observerSet;
  _QWORD v23[4];
  HDUpdateCodableSummarySharingEntryOperation *v24;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = [HDUpdateCodableSummarySharingEntryOperation alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDUpdateCodableSummarySharingEntryOperation initWithInvitationUUID:status:dateModified:dateAccepted:ownerParticipant:](v15, "initWithInvitationUUID:status:dateModified:dateAccepted:ownerParticipant:", v14, a4, v16, v13, v12);

  -[HDSummarySharingEntryManager profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDJournalableOperation performOrJournalWithProfile:error:](v17, "performOrJournalWithProfile:error:", v18, a7);

  if (!-[HDJournalableOperation didJournal](v17, "didJournal"))
  {
    -[HDUpdateCodableSummarySharingEntryOperation sharingEntry](v17, "sharingEntry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      observerSet = self->_observerSet;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __108__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newStatus_dateAccepted_ownerParticipant_error___block_invoke;
      v23[3] = &unk_1E6CF4AB0;
      v24 = v17;
      -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v23);

    }
  }

  return v19;
}

void __108__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newStatus_dateAccepted_ownerParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sharingEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v5);

}

- (BOOL)updateEntryWithInvitationUUID:(id)a3 newNotificationStatus:(int64_t)a4 error:(id *)a5
{
  id v8;
  HDSummarySharingEntryUpdateNotificationStatusOperation *v9;
  void *v10;
  HDSummarySharingEntryUpdateNotificationStatusOperation *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HKObserverSet *observerSet;
  _QWORD v17[4];
  HDSummarySharingEntryUpdateNotificationStatusOperation *v18;

  v8 = a3;
  v9 = [HDSummarySharingEntryUpdateNotificationStatusOperation alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDSummarySharingEntryUpdateNotificationStatusOperation initWithInvitationUUID:notificationStatus:dateModified:](v9, "initWithInvitationUUID:notificationStatus:dateModified:", v8, a4, v10);

  -[HDSummarySharingEntryManager profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDJournalableOperation performOrJournalWithProfile:error:](v11, "performOrJournalWithProfile:error:", v12, a5);

  if (!-[HDJournalableOperation didJournal](v11, "didJournal"))
  {
    -[HDSummarySharingEntryUpdateNotificationStatusOperation sharingEntry](v11, "sharingEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      observerSet = self->_observerSet;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __90__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newNotificationStatus_error___block_invoke;
      v17[3] = &unk_1E6CF4AB0;
      v18 = v11;
      -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v17);

    }
  }

  return v13;
}

void __90__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newNotificationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sharingEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v5);

}

- (BOOL)updateEntryWithUUID:(id)a3 authorizationsToAdd:(id)a4 authorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _BOOL4 v21;
  HKObserverSet *observerSet;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  HDSummarySharingEntryManager *v27;
  id v28;
  id v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__70;
  v32[4] = __Block_byref_object_dispose__70;
  v33 = 0;
  -[HDSummarySharingEntryManager profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke;
  v25[3] = &unk_1E6CF4AD8;
  v18 = v12;
  v26 = v18;
  v27 = self;
  v19 = v13;
  v28 = v19;
  v31 = a6;
  v20 = v14;
  v29 = v20;
  v30 = v32;
  v21 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v16, a7, v25);

  if (v21)
  {
    observerSet = self->_observerSet;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke_2;
    v24[3] = &unk_1E6CF4B00;
    v24[4] = v32;
    -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v24);
  }

  _Block_object_dispose(v32, 8);
  return v21;
}

BOOL __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL8 v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  _QWORD *v34;
  id v35;
  id v36;
  id v37;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6BB8]), "initForInvitationUUID:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(WeakRetained, "sharingAuthorizationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 72))
    v10 = MEMORY[0x1E0C9AA60];
  else
    v10 = *(_QWORD *)(a1 + 56);
  v37 = 0;
  v11 = objc_msgSend(v7, "updateAuthorizationsForRecipientIdentifier:sharingAuthorizationsToAdd:sharingAuthorizationsToRemove:error:", v5, v9, v10, &v37);
  v12 = v37;

  if ((v11 & 1) == 0)
  {
    v27 = v12;
    v21 = v27;
    if (v27)
    {
      if (a3)
      {
        v21 = objc_retainAutorelease(v27);
        v28 = 0;
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
        v28 = 0;
      }
    }
    else
    {
      v28 = 1;
    }
    goto LABEL_28;
  }
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_8;
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v13, "sharingAuthorizationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 56);
  v36 = 0;
  v16 = objc_msgSend(v14, "markSharingAuthorizationsForDeletion:recipientIdentifier:error:", v15, v5, &v36);
  v17 = v36;

  if (v16)
  {

LABEL_8:
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v35 = 0;
    objc_msgSend(v18, "codableEntryWithUUID:errorOut:", v19, &v35);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v35;
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v20;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v34 = a3;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDateModified:");
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "hasDateAccepted"))
      {
        v25 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "dateAccepted");
        objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      HDSummarySharingEntryPredicateForUUID(*(_QWORD *)(a1 + 32));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "status");
      v32 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
      v28 = +[HDSummarySharingEntryEntity updateStatus:dateModified:dateAccepted:predicate:profile:error:](HDSummarySharingEntryEntity, "updateStatus:dateModified:dateAccepted:predicate:profile:error:", v31, v24, v26, v30, v32, v34);

    }
    else
    {
      v29 = v21;
      v24 = v29;
      if (v29)
      {
        if (a3)
        {
          v24 = objc_retainAutorelease(v29);
          v28 = 0;
          *a3 = v24;
        }
        else
        {
          _HKLogDroppedError();
          v28 = 0;
        }
      }
      else
      {
        v28 = 1;
      }
    }

    goto LABEL_28;
  }
  v21 = v17;
  v28 = v21 == 0;
  if (v21)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

LABEL_28:
  return v28;
}

void __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v2, "sharingEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v5);

}

- (BOOL)pauseActiveEntriesWithError:(id *)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  HKObserverSet *observerSet;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke;
  v14[3] = &unk_1E6CF4B28;
  v8 = v5;
  v15 = v8;
  v9 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:profile:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:profile:error:handler:", 0, WeakRetained, a3, v14);

  if (v9 && objc_msgSend(v8, "count"))
  {
    observerSet = self->_observerSet;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke_2;
    v12[3] = &unk_1E6CF4AB0;
    v13 = v8;
    -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v12);

  }
  return v9;
}

uint64_t __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "sharingEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "direction") && (!objc_msgSend(v3, "status") || objc_msgSend(v3, "status") == 1))
  {
    objc_msgSend(v3, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:shouldPause:](HDSummarySharingEntryEntity, "updatePauseStateForEntryWithUUID:shouldPause:", v4, 1);

    objc_msgSend(v3, "_setIsPaused:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

  return 1;
}

uint64_t __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingEntriesDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (BOOL)updateEntryWithUUID:(id)a3 pauseStatus:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  HKObserverSet *observerSet;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a4;
  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__70;
  v28 = __Block_byref_object_dispose__70;
  v29 = 0;
  HDSummarySharingEntryPredicateForUUID((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke;
  v23[3] = &unk_1E6CF4B50;
  v23[4] = &v24;
  v12 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:profile:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:profile:error:handler:", v9, WeakRetained, a5, v23);

  if (v12)
  {
    v13 = (void *)v25[5];
    if (v13)
    {
      if (!objc_msgSend(v13, "direction")
        && (!objc_msgSend((id)v25[5], "status") || objc_msgSend((id)v25[5], "status") == 1))
      {
        objc_msgSend((id)v25[5], "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:shouldPause:](HDSummarySharingEntryEntity, "updatePauseStateForEntryWithUUID:shouldPause:", v19, v6);

        objc_msgSend((id)v25[5], "_setIsPaused:", v6);
        observerSet = self->_observerSet;
        v22[0] = v11;
        v22[1] = 3221225472;
        v22[2] = __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke_2;
        v22[3] = &unk_1E6CF4B00;
        v22[4] = &v24;
        -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", v22);
        v17 = 1;
        goto LABEL_17;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_error:format:", 118, CFSTR("Invitation with UUID %@ is not active outgoing"), v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (!a5)
          goto LABEL_15;
LABEL_10:
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a5 = v16;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_error:format:", 118, CFSTR("Cannot find invitation with UUID %@"), v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (!a5)
        {
LABEL_15:
          _HKLogDroppedError();
          v17 = 0;
          goto LABEL_16;
        }
        goto LABEL_10;
      }
    }
    v17 = 1;
    goto LABEL_16;
  }
  v17 = 0;
LABEL_17:
  _Block_object_dispose(&v24, 8);

  return v17;
}

uint64_t __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "sharingEntry");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

void __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v4, v5, v6);

}

- (void)pauseStatusesForUUIDS:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    v14 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v16);
        HDSummarySharingEntryPredicateForUUID(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSummarySharingEntryManager profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__HDSummarySharingEntryManager_pauseStatusesForUUIDS_completion___block_invoke;
  v25[3] = &unk_1E6CF4B28;
  v20 = v9;
  v26 = v20;
  v21 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:profile:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:profile:error:handler:", v18, v19, &v27, v25);
  v22 = v27;

  if (v21)
  {
    v23 = v20;
    v24 = 0;
  }
  else
  {
    v23 = 0;
    v24 = v22;
  }
  v7[2](v7, v23, v24);

}

uint64_t __65__HDSummarySharingEntryManager_pauseStatusesForUUIDS_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "codableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);

  LODWORD(v6) = objc_msgSend(v4, "isPaused");
  if ((_DWORD)v6)
    v9 = MEMORY[0x1E0C9AAB0];
  else
    v9 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

  return 1;
}

- (BOOL)pauseStatusForEntryWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  HDSummarySharingEntryPredicateForUUID((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HDSummarySharingEntryManager_pauseStatusForEntryWithUUID_error___block_invoke;
  v10[3] = &unk_1E6CF4B50;
  v10[4] = &v11;
  +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:profile:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:profile:error:handler:", v7, WeakRetained, a4, v10);

  LOBYTE(a4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)a4;
}

uint64_t __66__HDSummarySharingEntryManager_pauseStatusForEntryWithUUID_error___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "isPaused");
  return 1;
}

- (id)codableEntryWithIdentifier:(id)a3 type:(int64_t)a4 direction:(unint64_t)a5 errorOut:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  HDSummarySharingEntryPredicateForIdentifierTypeAndDirection((uint64_t)a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSummarySharingEntryManager profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharingEntryManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyCodableEntryWithPredicate:errorOut:", v8, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)codableEntryWithUUID:(id)a3 errorOut:(id *)a4
{
  void *v6;
  void *v7;

  HDSummarySharingEntryPredicateForUUID((uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSummarySharingEntryManager anyCodableEntryWithPredicate:errorOut:](self, "anyCodableEntryWithPredicate:errorOut:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)anyCodableEntryWithPredicate:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  HDSummarySharingEntryManager *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__70;
  v21 = __Block_byref_object_dispose__70;
  v22 = 0;
  -[HDSummarySharingEntryManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingEntryManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__HDSummarySharingEntryManager_anyCodableEntryWithPredicate_errorOut___block_invoke;
  v16[3] = &unk_1E6CF4B50;
  v16[4] = &v17;
  v9 = objc_msgSend(v8, "enumerateCodableEntriesWithPredicate:error:handler:", v6, a4, v16);

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v6;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error retrieving entry with predicate %{public}@.", buf, 0x16u);
    }

    goto LABEL_12;
  }
  v10 = (void *)v18[5];
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("We found no entries in the database."));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  v11 = v10;
LABEL_13:
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __70__HDSummarySharingEntryManager_anyCodableEntryWithPredicate_errorOut___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "codableEntry");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)deleteEntryWithUUID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  HDSummarySharingEntryPredicateForUUID((uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSummarySharingEntryManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDSummarySharingEntryEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v6, v8, a4);

  return (char)a4;
}

- (id)fetchAllCodableSharingEntriesWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HDSummarySharingEntryManager_fetchAllCodableSharingEntriesWithError___block_invoke;
  v10[3] = &unk_1E6CF4B28;
  v11 = v5;
  v6 = v5;
  if (-[HDSummarySharingEntryManager enumerateCodableEntriesWithPredicate:error:handler:](self, "enumerateCodableEntriesWithPredicate:error:handler:", 0, a3, v10))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

uint64_t __71__HDSummarySharingEntryManager_fetchAllCodableSharingEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "codableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  -[HDSummarySharingEntryManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke;
  v15[3] = &unk_1E6CEE458;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a4, v15);

  return (char)a4;
}

BOOL __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke_2;
  v10[3] = &unk_1E6CF4B78;
  v11 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:transaction:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:transaction:error:handler:", v6, v7, a3, v10);

  return v8;
}

uint64_t __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  objc_msgSend(v5, "codableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingRecipientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", v7, *(_QWORD *)(a1 + 32), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    HDCodableSharingAuthorizationsFromSharingAuthorizations(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codableEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSharingAuthorizations:", v9);

    objc_msgSend(v5, "codableEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharingAuthorizations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codableEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAuthorizationCategories:", v13);

    v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)disableAllSharingEntriesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  HDSummarySharingEntryPredicateForTypeAndStatus(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D29840];
  v21[0] = v5;
  v21[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAnyPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKLogSharing();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = (id)objc_opt_class();
    v11 = v20;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Disabling all sharing entries", buf, 0xCu);

  }
  -[HDSummarySharingEntryManager profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke;
  v17[3] = &unk_1E6CE7950;
  v17[4] = self;
  v18 = v9;
  v14 = v9;
  v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSummarySharingEntryEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a3, v17);

  return v15;
}

uint64_t __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke_2;
  v7[3] = &unk_1E6CF4B28;
  v7[4] = v5;
  return objc_msgSend(v5, "enumerateCodableEntriesWithPredicate:error:handler:", v4, a3, v7);
}

BOOL __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL8 v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a2;
  objc_msgSend(v5, "codableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "codableEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "invitationUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithUUIDString:", v10);

  if (objc_msgSend(v7, "direction") || objc_msgSend(v7, "status") != 1)
  {
    if (objc_msgSend(v7, "direction") || objc_msgSend(v7, "status"))
    {
      if (objc_msgSend(v7, "direction") == 1 && !objc_msgSend(v7, "status"))
      {
        v17 = *(void **)(a1 + 32);
        v23 = 0;
        v13 = objc_msgSend(v17, "updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:", v11, 2, 0, 0, &v23);
        v14 = v23;
      }
      else
      {
        if (objc_msgSend(v7, "direction") != 1 || objc_msgSend(v7, "status") != 1)
        {
          v16 = 0;
LABEL_15:
          v20 = 1;
          goto LABEL_21;
        }
        v15 = *(void **)(a1 + 32);
        v22 = 0;
        v13 = objc_msgSend(v15, "updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:", v11, 2, 0, 0, &v22);
        v14 = v22;
      }
    }
    else
    {
      v18 = *(void **)(a1 + 32);
      v24 = 0;
      v13 = objc_msgSend(v18, "updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:", v11, 3, 0, 0, &v24);
      v14 = v24;
    }
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v25 = 0;
    v13 = objc_msgSend(v12, "updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:", v11, 4, 0, 0, &v25);
    v14 = v25;
  }
  v19 = v14;
  v16 = v19;
  if ((v13 & 1) != 0)
    goto LABEL_15;
  v16 = v19;
  v20 = v16 == 0;
  if (v16)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

LABEL_21:
  return v20;
}

- (BOOL)lookupEntryWithPredicate:(id)a3 wasFound:(BOOL *)a4 error:(id *)a5
{
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v8 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HDSummarySharingEntryManager_lookupEntryWithPredicate_wasFound_error___block_invoke;
  v10[3] = &unk_1E6CF4B50;
  v10[4] = &v11;
  LOBYTE(a5) = -[HDSummarySharingEntryManager enumerateCodableEntriesWithPredicate:error:handler:](self, "enumerateCodableEntriesWithPredicate:error:handler:", v8, a5, v10);
  *a4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)a5;
}

uint64_t __72__HDSummarySharingEntryManager_lookupEntryWithPredicate_wasFound_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

- (id)authorizationIdentifiersForEntriesNotPresentInSet:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HDSummarySharingEntryManager *v15;
  id v16;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__HDSummarySharingEntryManager_authorizationIdentifiersForEntriesNotPresentInSet_error___block_invoke;
  v13[3] = &unk_1E6CF4BA0;
  v14 = v6;
  v15 = self;
  v8 = v7;
  v16 = v8;
  v9 = v6;
  v10 = -[HDSummarySharingEntryManager enumerateCodableEntriesWithPredicate:error:handler:](self, "enumerateCodableEntriesWithPredicate:error:handler:", 0, a4, v13);
  if (!a4 || (v11 = 0, v10))
    v11 = v8;

  return v11;
}

uint64_t __88__HDSummarySharingEntryManager_authorizationIdentifiersForEntriesNotPresentInSet_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a2;
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "codableEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithUUIDString:", v8);

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB6BB8]);
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "codableEntry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithUUIDString:", v13);
    v15 = (void *)objc_msgSend(v10, "initForInvitationUUID:", v14);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(WeakRetained, "sharingAuthorizationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sharingAuthorizationsForRecipientIdentifier:error:", v15, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    HKAuthorizationIdentifiersFromSharingAuthorizations();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 48);
    objc_msgSend(v5, "codableEntry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

  }
  return 1;
}

- (id)authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  HDSummarySharingEntryPredicateForTypeStatusAndDirection(0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSummarySharingEntryPredicateForTypeStatusAndDirection(0, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v25[0] = v8;
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAnyPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSummarySharingEntryManager profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke;
  v21[3] = &unk_1E6CF26F8;
  v21[4] = self;
  v22 = v12;
  v23 = v6;
  v15 = v7;
  v24 = v15;
  v16 = v6;
  v17 = v12;
  v18 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharingAuthorizationsEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a4, v21);

  if (!a4 || (v19 = 0, v18))
    v19 = v15;

  return v19;
}

uint64_t __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke_2;
  v11[3] = &unk_1E6CF4BA0;
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v14 = *(id *)(a1 + 56);
  v8 = v5;
  v9 = objc_msgSend(v6, "enumerateCodableEntriesWithPredicate:error:handler:", v7, a3, v11);

  return v9;
}

BOOL __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke_2(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v20;

  v5 = a2;
  v6 = (void *)a1[4];
  objc_msgSend(v5, "codableEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v8);

  if ((_DWORD)v6)
  {
    objc_msgSend(v5, "codableEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharingRecipientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    v20 = 0;
    +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:databaseTransaction:includeMarkedForDeletion:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:includeMarkedForDeletion:error:", v10, v11, 1, &v20);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v20;

    if (v12)
    {
      HKAuthorizationIdentifiersFromSharingAuthorizations();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)a1[6];
      objc_msgSend(v5, "codableEntry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "primaryContactIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v17);

      v18 = 1;
    }
    else
    {
      v12 = v13;
      v18 = v12 == 0;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }
    }

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)resolveContactsIfNeededWithError:(id *)a3
{
  uint64_t v5;
  int64_t authorizationStatusWhenContactsResolved;

  if (!self)
    return 1;
  v5 = objc_msgSend(MEMORY[0x1E0C97298], "hd_authorizationStatusForHealthApp");
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasCompletedContactResolution)
  {
    authorizationStatusWhenContactsResolved = self->_authorizationStatusWhenContactsResolved;
    os_unfair_lock_unlock(&self->_lock);
    if (authorizationStatusWhenContactsResolved == v5)
      return 1;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  return -[HDSummarySharingEntryManager _resolveContactsWithError:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_resolveContactsWithError:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = a1;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Attempting to resolve contacts.", buf, 0xCu);
  }

  HDSummarySharingEntryPredicateForTypeAndStatus(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D29840];
  v32[0] = v5;
  v32[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAnyPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C97298], "hd_contactStoreWithHealthAppIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __58__HDSummarySharingEntryManager__resolveContactsWithError___block_invoke;
  v25 = &unk_1E6CF4BC8;
  v12 = v11;
  v26 = v12;
  v13 = v10;
  v27 = v13;
  if (!objc_msgSend((id)a1, "enumerateCodableEntriesWithPredicate:error:handler:", v9, a2, &v22))
    goto LABEL_11;
  if (objc_msgSend(v13, "count", v22, v23, v24, v25, v26))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543618;
      v29 = a1;
      v30 = 2048;
      v31 = v15;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating %lu entries.", buf, 0x16u);
    }

    if (objc_msgSend((id)a1, "insertOrReplaceCodableEntries:shouldResolveCNContact:error:", v13, 1, a2))
    {
      objc_msgSend((id)a1, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "daemon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "profileManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dispatchProfileListDidChange");

      goto LABEL_10;
    }
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
LABEL_10:
  v19 = objc_msgSend(MEMORY[0x1E0C97298], "hd_authorizationStatusForHealthApp");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v20 = 1;
  *(_BYTE *)(a1 + 20) = 1;
  *(_QWORD *)(a1 + 24) = v19;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_12:

  return v20;
}

uint64_t __58__HDSummarySharingEntryManager__resolveContactsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "codableEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDCNContactForCodableEntry(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "codableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v3, "CNContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (!v8)
      goto LABEL_4;
    objc_msgSend(v3, "codableEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualFirstName:lastName:", v11, v12);

    if ((v13 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(v5, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFirstName:", v14);

      objc_msgSend(v5, "familyName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastName:", v15);

LABEL_7:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
  }
  else
  {

    if (v9)
    {
      objc_msgSend(v7, "setFirstName:", 0);
      objc_msgSend(v7, "setLastName:", 0);
      goto LABEL_7;
    }
  }

  return 1;
}

- (void)_contactStoreDidChange
{
  NSObject *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  HDSummarySharingEntryManager *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Contacts changed notification received.", buf, 0xCu);
  }

  v7 = 0;
  v4 = -[HDSummarySharingEntryManager _resolveContactsWithError:]((uint64_t)self, (uint64_t)&v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error resolving contacts %{public}@.", buf, 0x16u);
    }

  }
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HDSummarySharingEntryManager *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  id v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  id v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  HDSummarySharingEntryManager *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  HDSummarySharingAnalytics *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  __CFString *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id *location;
  id v63;
  _BOOL4 v64;
  id v65;
  id v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  HDSummarySharingEntryManager *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint8_t buf[4];
  HDSummarySharingEntryManager *v122;
  __int16 v123;
  id v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v66 = a4;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x2020000000;
  v112 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = -1;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v74 = self;
  location = (id *)&self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
  v83[3] = &unk_1E6CF4C18;
  v85 = &v117;
  v86 = &v113;
  v83[4] = v74;
  v87 = &v109;
  v65 = v6;
  v84 = v65;
  v88 = &v105;
  v89 = &v101;
  v90 = &v97;
  v91 = &v93;
  v64 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, &v92, v83);
  v63 = v92;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[HDSummarySharingEntryManager profile](v74, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allProfileIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v125, 16);
  v13 = v74;
  if (v12)
  {
    v67 = 0;
    v70 = 0;
    v71 = 0;
    v69 = 0;
    v73 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v80 != v73)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (objc_msgSend(v15, "type") == 2)
        {
          -[HDSummarySharingEntryManager profile](v13, "profile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "daemon");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "profileManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "profileForIdentifier:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v78 = 0;
            v20 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, CFSTR("alerts"), v15, v72, &v78);
            v21 = v78;
            v22 = v21 == 0;
            v23 = v22 & v20;
            if ((v22 & v20) != 0)
              v24 = 0;
            else
              v24 = v21;
            v77 = v24;
            v25 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, CFSTR("significantChanges"), v15, v72, &v77);
            v26 = v77;

            v27 = v26 == 0;
            v28 = v27 & v25;
            if ((v27 & v25) != 0)
              v29 = 0;
            else
              v29 = v26;
            v76 = v29;
            v30 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, CFSTR("updates"), v15, v72, &v76);
            v31 = v76;

            v32 = v31 == 0;
            v33 = v32 & v30;
            if ((v32 & v30) != 0)
              v34 = 0;
            else
              v34 = v31;
            objc_msgSend(v19, "sharedSummaryManager");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = 0;
            objc_msgSend(v35, "mostRecentTransactionCreationDateWithError:", &v75);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v75;

            if (v36)
            {
              if (v67)
              {
                if (objc_msgSend(v36, "hk_isAfterDate:"))
                {
                  v38 = v36;

                  v67 = v38;
                }
              }
              else
              {
                v67 = v36;
              }
            }
            else if (v37)
            {
              _HKInitializeLogging();
              HKLogAnalytics();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v122 = v74;
                v123 = 2114;
                v124 = v37;
                _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve most recent transaction creation date for analytics: %{public}@", buf, 0x16u);
              }

            }
            v69 += v23;
            v70 += v28;
            v71 += v33;
          }

          v13 = v74;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v125, 16);
    }
    while (v12);
  }
  else
  {
    v67 = 0;
    v70 = 0;
    v71 = 0;
    v69 = 0;
  }

  v40 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v41 = (void *)objc_msgSend(v40, "initWithSuiteName:", *MEMORY[0x1E0CB7608]);
  v42 = v74;
  v43 = objc_msgSend(v41, "integerForKey:", *MEMORY[0x1E0CB76B0]);
  v44 = objc_msgSend(v41, "integerForKey:", *MEMORY[0x1E0CB76A8]);
  v45 = objc_msgSend(v41, "integerForKey:", *MEMORY[0x1E0CB76A0]);
  if (v64)
  {
    v46 = v45;
    v47 = objc_alloc_init(HDSummarySharingAnalytics);
    -[HDSummarySharingAnalytics setNumberAuthorizationsSharingOut:](v47, "setNumberAuthorizationsSharingOut:", objc_msgSend(v65, "count"));
    v48 = v114[3];
    if (v48)
      -[HDSummarySharingAnalytics setAverageNumberAuthorizationsSharedOutPerPerson:](v47, "setAverageNumberAuthorizationsSharedOutPerPerson:", (double)(v110[3] / v48));
    -[HDSummarySharingAnalytics setMaxAuthorizationsSharedOutPerPerson:](v47, "setMaxAuthorizationsSharedOutPerPerson:", v106[3]);
    -[HDSummarySharingAnalytics setMinAuthorizationsSharedOutPerPerson:](v47, "setMinAuthorizationsSharedOutPerPerson:", v102[3]);
    -[HDSummarySharingAnalytics setNumberPeopleSharingOut:](v47, "setNumberPeopleSharingOut:", v114[3]);
    -[HDSummarySharingAnalytics setNumberPeopleSharingIn:](v47, "setNumberPeopleSharingIn:", v118[3]);
    if (v118[3])
      -[HDSummarySharingAnalytics setMostRecentIncomingTransactionDate:](v47, "setMostRecentIncomingTransactionDate:", v67);
    -[HDSummarySharingAnalytics setNumberOfAlertNotificationsEnabled:](v47, "setNumberOfAlertNotificationsEnabled:", v69);
    -[HDSummarySharingAnalytics setNumberOfTrendNotificationsEnabled:](v47, "setNumberOfTrendNotificationsEnabled:", v70);
    -[HDSummarySharingAnalytics setNumberOfUpdateNotificationsEnabled:](v47, "setNumberOfUpdateNotificationsEnabled:", v71);
    if (v43 >= 1)
    {
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v43);
      -[HDSummarySharingAnalytics setAskSomeoneToShareLastSelectedDate:](v47, "setAskSomeoneToShareLastSelectedDate:", v49);

      v42 = v74;
    }
    if (v44 >= 1)
    {
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v44);
      -[HDSummarySharingAnalytics setAnySharingWithYouLastViewedDate:](v47, "setAnySharingWithYouLastViewedDate:", v50);

      v42 = v74;
    }
    if (v46 >= 1)
    {
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v46);
      -[HDSummarySharingAnalytics setSharingContactOptionLastSelectedDate:](v47, "setSharingContactOptionLastSelectedDate:", v51);

      v42 = v74;
    }
    if (!v42)
    {
      v56 = 0;
      goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "getActivePairedDevice");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v53, "valueForProperty:", *MEMORY[0x1E0D51738]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v55 = v54;
        v56 = (__CFString *)v55;
LABEL_53:

LABEL_54:
        NSStringFromHKBiologicalSex(v94[3]);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_loadWeakRetained(location);
        objc_msgSend(v59, "daemon");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "analyticsSubmissionCoordinator");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "summarySharing_reportDailyAnalytics:activeWatchProductType:age:sex:", v47, v56, v98[3], v58);

        goto LABEL_55;
      }
      _HKInitializeLogging();
      HKLogSharing();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v122 = v74;
        _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: No watch product type retrieved, returning unavailable", buf, 0xCu);
      }

      v55 = 0;
    }
    else
    {
      _HKInitializeLogging();
      HKLogSharing();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v122 = v74;
        _os_log_impl(&dword_1B7802000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: No active paired device, returning unavailable", buf, 0xCu);
      }
    }
    v56 = CFSTR("unavailable");
    goto LABEL_53;
  }
LABEL_55:
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v66 + 2))(v66, 0, 0, 0);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);

}

BOOL __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = a2;
  HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
  v11[3] = &unk_1E6CF4BF0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v7 = (id)v10;
  v12 = v10;
  v14 = *(_OWORD *)(a1 + 72);
  v8 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:transaction:error:handler:](HDSummarySharingEntryEntity, "enumerateCodableEntriesWithPredicate:transaction:error:handler:", v6, v5, a3, v11);

  return v8;
}

uint64_t __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;

  v5 = a2;
  objc_msgSend(v5, "codableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "direction");

  if (v7 == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_14:
    LOBYTE(v13) = 1;
    goto LABEL_15;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "codableEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithUUIDString:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6BB8]), "initForInvitationUUID:", v11);
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "sharingAuthorizationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v14, "sharingAuthorizationsForRecipientIdentifier:error:", v12, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;

  if (v15)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v15, "count");
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v15);
    if ((unint64_t)objc_msgSend(v15, "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v15, "count");
    if ((unint64_t)objc_msgSend(v15, "count") < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v15, "count");
  }
  else
  {
    v17 = v16;
    LOBYTE(v13) = v17 == 0;
    if (v17)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

  }
  if (v15)
    goto LABEL_14;
LABEL_15:

  return v13 & 1;
}

- (uint64_t)_areNotificationsEnabledForFeature:(void *)a3 profileIdentifier:(void *)a4 coordinator:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD *v30;
  void *v31;
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v13 = (void *)objc_msgSend(v12, "initWithSuiteName:", *MEMORY[0x1E0CB7608]);
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("HealthSharingPreferences_%@_Notifications_%@"), v16, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v30 = a5;
      objc_msgSend(v11, "_createHealthStoreForProfileIdentifier:", v10);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0CB67F0]);
      v31 = (void *)v21;
      v23 = (void *)objc_msgSend(v22, "initWithCategory:domainName:healthStore:", 1, *MEMORY[0x1E0CB7690], v21);
      v32 = 0;
      objc_msgSend(v23, "numberForKey:error:", v9, &v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;
      v26 = v25;
      if (v24)
      {
        v20 = objc_msgSend(v24, "BOOLValue");
      }
      else
      {
        v27 = v25;
        v28 = v27;
        if (v27)
        {
          if (v30)
            *v30 = objc_retainAutorelease(v27);
          else
            _HKLogDroppedError();
        }

        v20 = 0;
      }

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (HDSummarySharingEntryManagerDelegate)delegate
{
  return (HDSummarySharingEntryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observerSet, 0);
}

- (id)fetchSharingEntriesWithError:(id *)a3
{
  id v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  HDSummarySharingEntryManager *v14;
  id v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70__HDSummarySharingEntryManager_Support__fetchSharingEntriesWithError___block_invoke;
  v13 = &unk_1E6CF4BC8;
  v14 = self;
  v6 = v5;
  v15 = v6;
  v7 = -[HDSummarySharingEntryManager enumerateCodableEntriesWithPredicate:error:handler:](self, "enumerateCodableEntriesWithPredicate:error:handler:", 0, a3, &v10);
  v8 = 0;
  if (v7)
    v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __70__HDSummarySharingEntryManager_Support__fetchSharingEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "sharingEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileIdentifierForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "type") == 2)
    objc_msgSend(v3, "_setProfileIdentifier:", v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 1;
}

@end
