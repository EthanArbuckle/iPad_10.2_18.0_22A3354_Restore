@implementation HDSummarySharingEntryUpdateNotificationStatusOperation

- (HDSummarySharingEntryUpdateNotificationStatusOperation)init
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

- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithInvitationUUID:(id)a3 notificationStatus:(int64_t)a4 dateModified:(id)a5
{
  id v8;
  id v9;
  HDSummarySharingEntryUpdateNotificationStatusOperation *v10;
  uint64_t v11;
  NSUUID *invitationUUID;
  uint64_t v13;
  NSDate *dateModified;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDSummarySharingEntryUpdateNotificationStatusOperation;
  v10 = -[HDSummarySharingEntryUpdateNotificationStatusOperation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    invitationUUID = v10->_invitationUUID;
    v10->_invitationUUID = (NSUUID *)v11;

    v10->_notificationStatus = a4;
    v13 = objc_msgSend(v9, "copy");
    dateModified = v10->_dateModified;
    v10->_dateModified = (NSDate *)v13;

  }
  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = +[HDSummarySharingEntryEntity updateNotificationStatusForInvitiationWithUUID:newNotificationStatus:dateModified:profile:error:](HDSummarySharingEntryEntity, "updateNotificationStatusForInvitiationWithUUID:newNotificationStatus:dateModified:profile:error:", self->_invitationUUID, self->_notificationStatus, self->_dateModified, v8, a5);
  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__209;
    v20 = __Block_byref_object_dispose__209;
    v21 = 0;
    HDSummarySharingEntryPredicateForInvitationUUID((uint64_t)self->_invitationUUID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingEntryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__HDSummarySharingEntryUpdateNotificationStatusOperation_performWithProfile_transaction_error___block_invoke;
    v15[3] = &unk_1E6CF4B50;
    v15[4] = &v16;
    v13 = objc_msgSend(v12, "enumerateCodableEntriesWithPredicate:error:handler:", v11, a5, v15);

    if (v13)
      objc_storeStrong((id *)&self->_sharingEntry, (id)v17[5]);

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

uint64_t __95__HDSummarySharingEntryUpdateNotificationStatusOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, void *a2)
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HDSummarySharingEntryUpdateNotificationStatusOperation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InvitationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationStatus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateModified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HDSummarySharingEntryUpdateNotificationStatusOperation initWithInvitationUUID:notificationStatus:dateModified:](self, "initWithInvitationUUID:notificationStatus:dateModified:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *invitationUUID;
  id v5;

  invitationUUID = self->_invitationUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", invitationUUID, CFSTR("InvitationUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationStatus, CFSTR("NotificationStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateModified, CFSTR("DateModified"));

}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (HKSummarySharingEntry)sharingEntry
{
  return self->_sharingEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingEntry, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end
