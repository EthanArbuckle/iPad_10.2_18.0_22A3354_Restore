@implementation HDUpdateCodableSummarySharingEntryOperation

- (HDUpdateCodableSummarySharingEntryOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDUpdateCodableSummarySharingEntryOperation)initWithInvitationUUID:(id)a3 status:(int64_t)a4 dateModified:(id)a5 dateAccepted:(id)a6 ownerParticipant:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDUpdateCodableSummarySharingEntryOperation *v16;
  uint64_t v17;
  NSUUID *invitationUUID;
  uint64_t v19;
  NSDate *dateModified;
  uint64_t v21;
  NSDate *dateAccepted;
  uint64_t v23;
  CKShareParticipant *ownerParticipant;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDUpdateCodableSummarySharingEntryOperation;
  v16 = -[HDUpdateCodableSummarySharingEntryOperation init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    invitationUUID = v16->_invitationUUID;
    v16->_invitationUUID = (NSUUID *)v17;

    v16->_status = a4;
    v19 = objc_msgSend(v13, "copy");
    dateModified = v16->_dateModified;
    v16->_dateModified = (NSDate *)v19;

    v21 = objc_msgSend(v14, "copy");
    dateAccepted = v16->_dateAccepted;
    v16->_dateAccepted = (NSDate *)v21;

    v23 = objc_msgSend(v15, "copy");
    ownerParticipant = v16->_ownerParticipant;
    v16->_ownerParticipant = (CKShareParticipant *)v23;

  }
  return v16;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t status;
  void *v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  _QWORD v22[5];
  id v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  HDSummarySharingEntryPredicateForInvitationUUID((uint64_t)self->_invitationUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharingEntryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyCodableEntryWithPredicate:errorOut:", v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v12, "status");
    status = self->_status;
    if (HDMergedSharingStatus(status, v13) != status)
    {
      _HKInitializeLogging();
      HKLogSharing();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HKStringForSharingStatus();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HKStringForSharingStatus();
        v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        v27 = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Entry not updated because current status %{public}@ takes precedence over new status %{public}@", buf, 0x20u);

      }
      goto LABEL_11;
    }
    if (+[HDSummarySharingEntryEntity updateStatus:dateModified:dateAccepted:predicate:profile:error:](HDSummarySharingEntryEntity, "updateStatus:dateModified:dateAccepted:predicate:profile:error:", status, self->_dateModified, self->_dateAccepted, v10, v8, a5))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v27 = __Block_byref_object_copy__48;
      v28 = __Block_byref_object_dispose__48;
      v29 = 0;
      objc_msgSend(v8, "sharingEntryManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __84__HDUpdateCodableSummarySharingEntryOperation_performWithProfile_transaction_error___block_invoke;
      v22[3] = &unk_1E6CF12E0;
      v25 = buf;
      v22[4] = self;
      v23 = v10;
      v24 = v8;
      v16 = objc_msgSend(v15, "enumerateCodableEntriesWithPredicate:error:handler:", v23, a5, v22);

      if (v16)
        objc_storeStrong((id *)&self->_sharingEntry, *(id *)(*(_QWORD *)&buf[8] + 40));

      _Block_object_dispose(buf, 8);
LABEL_11:
      v17 = 1;
      goto LABEL_12;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

uint64_t __84__HDUpdateCodableSummarySharingEntryOperation_performWithProfile_transaction_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;

  v5 = a2;
  objc_msgSend(v5, "sharingEntry");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "codableEntry");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "shareOwnerParticipant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    v12 = *(_QWORD *)(a1[4] + 56);

    if (!v12)
      goto LABEL_4;
    v13 = *(void **)(a1[4] + 56);
    objc_msgSend(v13, "userIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userRecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[5];
    v18 = a1[6];
    v21 = 0;
    LODWORD(v13) = +[HDSummarySharingEntryEntity updateOwnerParticipant:cloudKitIdentifier:predicate:profile:error:](HDSummarySharingEntryEntity, "updateOwnerParticipant:cloudKitIdentifier:predicate:profile:error:", v13, v16, v17, v18, &v21);
    v9 = v21;

    if (!(_DWORD)v13)
    {
      v19 = v9;
      v11 = v19 == 0;
      if (v19)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      goto LABEL_15;
    }
  }

LABEL_4:
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "direction") && *(_QWORD *)(a1[4] + 32) >= 2uLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "UUID");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:shouldPause:](HDSummarySharingEntryEntity, "updatePauseStateForEntryWithUUID:shouldPause:", v19, 0);
    v11 = 1;
LABEL_15:

    return v11;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDUpdateCodableSummarySharingEntryOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HDUpdateCodableSummarySharingEntryOperation *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InvitationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateModified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateAccepted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OwnerParticipant"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HDUpdateCodableSummarySharingEntryOperation initWithInvitationUUID:status:dateModified:dateAccepted:ownerParticipant:](self, "initWithInvitationUUID:status:dateModified:dateAccepted:ownerParticipant:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *invitationUUID;
  id v5;

  invitationUUID = self->_invitationUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", invitationUUID, CFSTR("InvitationUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateModified, CFSTR("DateModified"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateAccepted, CFSTR("DateAccepted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerParticipant, CFSTR("OwnerParticipant"));

}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (HKSummarySharingEntry)sharingEntry
{
  return self->_sharingEntry;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSDate)dateAccepted
{
  return self->_dateAccepted;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_dateAccepted, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_sharingEntry, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end
