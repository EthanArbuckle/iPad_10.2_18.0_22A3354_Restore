@implementation HDSummarySharingEntryEntity

+ (id)databaseTable
{
  return CFSTR("summary_sharing_entry");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_40;
}

+ (id)indices
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSummarySharingEntryEntity, "disambiguatedSQLForProperty:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ IN (%ld, %ld)"), v3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D29860]);
  v6 = objc_opt_class();
  v11[0] = CFSTR("cloudkit_identifier");
  v11[1] = CFSTR("type");
  v11[2] = CFSTR("direction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithEntity:name:columns:unique:predicateString:", v6, CFSTR("active"), v7, 1, v4);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_propertiesForEntity
{
  _QWORD v3[20];

  v3[19] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("invitation_uuid");
  v3[2] = CFSTR("CNContact_identifier");
  v3[3] = CFSTR("cloudkit_identifier");
  v3[4] = CFSTR("primary_contact_identifier");
  v3[5] = CFSTR("all_contact_identifiers");
  v3[6] = CFSTR("first_name");
  v3[7] = CFSTR("last_name");
  v3[8] = CFSTR("user_wheelchair_mode");
  v3[9] = CFSTR("type");
  v3[10] = CFSTR("status");
  v3[11] = CFSTR("date_modified");
  v3[12] = CFSTR("date_invited");
  v3[13] = CFSTR("date_accepted");
  v3[14] = CFSTR("setup_metadata");
  v3[15] = CFSTR("owner_participant");
  v3[16] = CFSTR("direction");
  v3[17] = CFSTR("notification_status");
  v3[18] = CFSTR("sync_provenance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 19);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (BOOL)insertOrReplaceCodableEntry:(id)a3 CNContactIdentifier:(id)a4 shouldPause:(BOOL)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id *v36;
  id v37;
  _BOOL4 v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  int64_t v46;
  id v47;

  v39 = a5;
  v11 = a3;
  v41 = a4;
  v12 = a7;
  v13 = (void *)objc_opt_self();
  objc_msgSend(v12, "protectedDatabase");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v16 = v11;
  objc_msgSend(v11, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithUUIDString:", v17);

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v40 = (void *)v14;
  objc_msgSend(v13, "propertyValueForAnyInDatabase:property:predicate:error:", v14, CFSTR("date_modified"), v19, &v47);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v47;
  v22 = v21;
  if (v20)
    v23 = 1;
  else
    v23 = v21 == 0;
  if (!v23)
  {
    if (a8)
    {
      v29 = 0;
      *a8 = objc_retainAutorelease(v21);
    }
    else
    {
      _HKLogDroppedError();
      v29 = 0;
    }
    v24 = v16;
    goto LABEL_18;
  }
  v36 = a8;
  v37 = v12;
  v24 = v16;
  if (v20)
  {
    v25 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "dateModified");
    objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToDate:", v28) & 1) == 0 && (objc_msgSend(v26, "hk_isAfterDate:", v28) & 1) != 0)
    {

      v29 = 1;
LABEL_18:
      v34 = v41;
      goto LABEL_19;
    }

  }
  objc_msgSend(v12, "protectedDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_propertiesForEntity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __125__HDSummarySharingEntryEntity__insertOrReplaceCodableEntry_CNContactIdentifier_shouldPause_syncProvenance_transaction_error___block_invoke;
  v42[3] = &unk_1E6CF5C90;
  v32 = v18;
  v43 = v32;
  v44 = v24;
  v45 = v41;
  v46 = a6;
  objc_msgSend(v13, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v30, v31, v36, v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    objc_msgSend(v13, "updatePauseStateForEntryWithUUID:shouldPause:", v32, 1);
  v29 = v33 != 0;

  v34 = v41;
  v12 = v37;
LABEL_19:

  return v29;
}

void __125__HDSummarySharingEntryEntity__insertOrReplaceCodableEntry_CNContactIdentifier_shouldPause_syncProvenance_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 v13;
  void *v14;
  void *v15;

  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "invitationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(*(id *)(a1 + 40), "invitationUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
    MEMORY[0x1BCCAB168](a2, CFSTR("invitation_uuid"), v7);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("invitation_uuid"));
  }
  if (*(_QWORD *)(a1 + 48))
    MEMORY[0x1BCCAB144](a2, CFSTR("CNContact_identifier"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("CNContact_identifier"));
  objc_msgSend(*(id *)(a1 + 40), "cloudKitIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("cloudkit_identifier"), v8);

  objc_msgSend(*(id *)(a1 + 40), "primaryContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("primary_contact_identifier"), v9);

  objc_msgSend(*(id *)(a1 + 40), "allContactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 40), "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("first_name"), v11);

  objc_msgSend(*(id *)(a1 + 40), "lastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("last_name"), v12);

  MEMORY[0x1BCCAB114](a2, CFSTR("user_wheelchair_mode"), (int)objc_msgSend(*(id *)(a1 + 40), "userWheelchairMode"));
  MEMORY[0x1BCCAB114](a2, CFSTR("type"), (int)objc_msgSend(*(id *)(a1 + 40), "type"));
  MEMORY[0x1BCCAB114](a2, CFSTR("status"), (int)objc_msgSend(*(id *)(a1 + 40), "status"));
  objc_msgSend(*(id *)(a1 + 40), "dateModified");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("date_modified"));
  if (objc_msgSend(*(id *)(a1 + 40), "hasDateInvited"))
    objc_msgSend(*(id *)(a1 + 40), "dateInvited");
  else
    v13.n128_f64[0] = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1BCCAB0F0](a2, CFSTR("date_invited"), v13);
  if (objc_msgSend(*(id *)(a1 + 40), "hasDateAccepted"))
  {
    objc_msgSend(*(id *)(a1 + 40), "dateAccepted");
    MEMORY[0x1BCCAB0F0](a2, CFSTR("date_accepted"));
  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("date_accepted"));
  }
  objc_msgSend(*(id *)(a1 + 40), "sharingSetupMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 40), "shareOwnerParticipant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1BCCAB114](a2, CFSTR("direction"), (int)objc_msgSend(*(id *)(a1 + 40), "direction"));
  MEMORY[0x1BCCAB114](a2, CFSTR("notification_status"), (int)objc_msgSend(*(id *)(a1 + 40), "notificationStatus"));
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)updateStatus:(int64_t)a3 dateModified:(id)a4 dateAccepted:(id)a5 predicate:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(a7, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke;
  v22[3] = &unk_1E6CE9208;
  v23 = v16;
  v24 = v14;
  v25 = v15;
  v26 = a1;
  v27 = a3;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  LOBYTE(a8) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v17, a8, v22);

  return (char)a8;
}

uint64_t __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a2;
  v7 = [v5 alloc];
  v21[0] = CFSTR("date_modified");
  v21[1] = CFSTR("date_accepted");
  v21[2] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v10 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke_2;
  v17[3] = &unk_1E6CE8268;
  v18 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  v19 = v13;
  v20 = v14;
  v15 = objc_msgSend(v10, "updateProperties:predicate:database:error:bindingHandler:", v9, v11, v12, a3, v17);

  return v15;
}

void __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("date_modified"));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    MEMORY[0x1BCCAB0F0](a2, CFSTR("date_accepted"));
  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("date_accepted"));
  }
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)updateOwnerParticipant:(id)a3 cloudKitIdentifier:(id)a4 predicate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(a6, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke;
  v20[3] = &unk_1E6CE7C58;
  v21 = v14;
  v22 = v12;
  v23 = v13;
  v24 = a1;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  LOBYTE(a7) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v15, a7, v20);

  return (char)a7;
}

uint64_t __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 56);
  v16[0] = CFSTR("owner_participant");
  v16[1] = CFSTR("cloudkit_identifier");
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a2;
  objc_msgSend(v6, "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke_2;
  v13[3] = &unk_1E6CE89A8;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v11 = objc_msgSend(v5, "updateProperties:predicate:database:error:bindingHandler:", v8, v9, v10, a3, v13);

  return v11;
}

void __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32))
    HDSQLiteBindSecureCodingObjectToProperty();
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("owner_participant"));
  if (*(_QWORD *)(a1 + 40))
    JUMPOUT(0x1BCCAB144);
  JUMPOUT(0x1BCCAB120);
}

+ (BOOL)updateNotificationStatusForInvitiationWithUUID:(id)a3 newNotificationStatus:(int64_t)a4 dateModified:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v12 = a3;
  v13 = a5;
  objc_msgSend(a6, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke;
  v18[3] = &unk_1E6CEA620;
  v21 = a1;
  v22 = a4;
  v19 = v12;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  LOBYTE(a7) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v14, a7, v18);

  return (char)a7;
}

uint64_t __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = a2;
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("invitation_uuid"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  v17[0] = CFSTR("notification_status");
  v17[1] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke_2;
  v14[3] = &unk_1E6CECA50;
  v16 = *(_QWORD *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v9, "updateProperties:predicate:database:error:bindingHandler:", v10, v8, v11, a3, v14);

  return v12;
}

void __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("notification_status"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  JUMPOUT(0x1BCCAB0F0);
}

+ (void)updatePauseStateForEntryWithUUID:(id)a3 shouldPause:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  objc_msgSend(a3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSummarySharingEntryEntity _pauseKeyForEntryUUIDString:]((uint64_t)a1, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", v10);
  }

}

+ (id)_pauseKeyForEntryUUIDString:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PausedSharing-%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)_readPauseStateForEntryWithUUIDString:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  v3 = objc_opt_self();
  +[HDSummarySharingEntryEntity _pauseKeyForEntryUUIDString:](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a4, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_transaction_error_handler___block_invoke;
  v17[3] = &unk_1E6CEED78;
  v18 = v10;
  v19 = a1;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a5, v17);

  return (char)a5;
}

uint64_t __94__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HDSummarySharingEntry *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v18;

  objc_msgSend(*(id *)(a1 + 40), "codableWithRow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[HDSummarySharingEntryEntity _readPauseStateForEntryWithUUIDString:](v8, v9);

  v11 = -[HDSummarySharingEntry initWithCodableEntry:CNContactIdentifier:isPaused:]([HDSummarySharingEntry alloc], "initWithCodableEntry:CNContactIdentifier:isPaused:", v6, v7, v10);
  v12 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v13 = (*(uint64_t (**)(void))(v12 + 16))();
  v14 = v18;
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    v16 = v14;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

  }
  return v13;
}

+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke;
  v16[3] = &unk_1E6CF2DE0;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v16);

  return (char)a5;
}

uint64_t __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;

  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryWithDatabase:predicate:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_propertiesForEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke_2;
  v13[3] = &unk_1E6CEED78;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v14 = v12;
  v10 = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v8, a3, v13);

  return v10;
}

uint64_t __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HDSummarySharingEntry *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v18;

  objc_msgSend(*(id *)(a1 + 40), "codableWithRow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[HDSummarySharingEntryEntity _readPauseStateForEntryWithUUIDString:](v8, v9);

  v11 = -[HDSummarySharingEntry initWithCodableEntry:CNContactIdentifier:isPaused:]([HDSummarySharingEntry alloc], "initWithCodableEntry:CNContactIdentifier:isPaused:", v6, v7, v10);
  v12 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v13 = (*(uint64_t (**)(void))(v12 + 16))();
  v14 = v18;
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    v16 = v14;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

  }
  return v13;
}

+ (id)codableWithRow:(HDSQLiteRow *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HDCodableSummarySharingEntry *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  HDSQLiteColumnWithNameAsUUID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsArrayOfClass();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HDSQLiteColumnWithNameAsInt64();
  v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = HDSQLiteColumnWithNameAsInt64();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:]([HDCodableSummarySharingEntry alloc], "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v15, v14, v21, v20, v19, v18, v3, 0, v16, v4, v6, v5, v7, v8, v9,
          v10,
          v13,
          v12);

  return v17;
}

+ (id)anyWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
