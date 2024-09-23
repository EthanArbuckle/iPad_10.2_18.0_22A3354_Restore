@implementation HDCloudSyncSharedSummaryParticipantRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("SharedSummaryParticipantRecordType");
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "integerValue") > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("SharedSummaryParticipantRecord"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v6);
  return v9;
}

+ (BOOL)isParticipantRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSummaryParticipantRecordType"));

  return v4;
}

- (id)initInZone:(id)a3 codableEntry:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDCloudSyncSharedSummaryParticipantRecord *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:UUID:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("SharedSummaryParticipantRecordType"), v12);
  v14 = -[HDCloudSyncSharedSummaryParticipantRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v13, 1);
  if (v14)
  {
    objc_msgSend(v11, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUuid:](v14->_underlyingSummaryParticipantRecord, "setUuid:", v16);

    objc_msgSend(v6, "invitationUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](v14->_underlyingSummaryParticipantRecord, "setInvitationUUID:", v17);

    objc_msgSend(v6, "primaryContactIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setContactIdentifier:](v14->_underlyingSummaryParticipantRecord, "setContactIdentifier:", v18);

    objc_msgSend(v6, "cloudKitIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](v14->_underlyingSummaryParticipantRecord, "setCloudKitIdentifier:", v19);

    objc_msgSend(v6, "firstName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setFirstName:](v14->_underlyingSummaryParticipantRecord, "setFirstName:", v20);

    objc_msgSend(v6, "lastName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setLastName:](v14->_underlyingSummaryParticipantRecord, "setLastName:", v21);

    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUserWheelchairMode:](v14->_underlyingSummaryParticipantRecord, "setUserWheelchairMode:", (int)objc_msgSend(v6, "userWheelchairMode"));
    objc_msgSend(v6, "allContactIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setAllContactIdentifiers:](v14->_underlyingSummaryParticipantRecord, "setAllContactIdentifiers:", v22);

    -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](v14->_underlyingSummaryParticipantRecord, "setType:", (int)objc_msgSend(v6, "type"));
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](v14->_underlyingSummaryParticipantRecord, "setDirection:", (int)objc_msgSend(v6, "direction"));
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](v14->_underlyingSummaryParticipantRecord, "setStatus:", (int)objc_msgSend(v6, "status"));
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](v14->_underlyingSummaryParticipantRecord, "setNotificationStatus:", (int)objc_msgSend(v6, "notificationStatus"));
    if (objc_msgSend(v6, "hasDateModified"))
    {
      objc_msgSend(v6, "dateModified");
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](v14->_underlyingSummaryParticipantRecord, "setEntryModificationDate:");
    }
    if (objc_msgSend(v6, "hasDateInvited"))
    {
      objc_msgSend(v6, "dateInvited");
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](v14->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
    }
    if (objc_msgSend(v6, "hasDateAccepted"))
    {
      objc_msgSend(v6, "dateAccepted");
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](v14->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
    }
    if (objc_msgSend(v6, "hasSharingSetupMetadata"))
    {
      objc_msgSend(v6, "sharingSetupMetadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setSetupMetadata:](v14->_underlyingSummaryParticipantRecord, "setSetupMetadata:", v24);

    }
    if (objc_msgSend(v6, "hasOwnerParticipant"))
    {
      objc_msgSend(v6, "ownerParticipant");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](v14->_underlyingSummaryParticipantRecord, "setOwnerParticipant:", v25);

    }
    if (objc_msgSend(v6, "hasCloudKitIdentifier"))
    {
      objc_msgSend(v6, "cloudKitIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](v14->_underlyingSummaryParticipantRecord, "setCloudKitIdentifier:", v26);

    }
  }

  return v14;
}

- (HDCloudSyncSharedSummaryParticipantRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncSharedSummaryParticipantRecord *v4;
  HDCloudSyncSharedSummaryParticipantRecord *v5;
  void *v6;
  HDCloudSyncCodableSharedSummaryParticipantRecord *v7;
  HDCloudSyncCodableSharedSummaryParticipantRecord *v8;
  NSObject *v9;
  HDCloudSyncSharedSummaryParticipantRecord *v10;
  HDCloudSyncCodableSharedSummaryParticipantRecord *v11;
  HDCloudSyncCodableSharedSummaryParticipantRecord *underlyingSummaryParticipantRecord;
  objc_super v14;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryParticipantRecord *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryParticipantRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v14, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryParticipantRecord);
    underlyingSummaryParticipantRecord = v5->_underlyingSummaryParticipantRecord;
    v5->_underlyingSummaryParticipantRecord = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableSharedSummaryParticipantRecord initWithData:]([HDCloudSyncCodableSharedSummaryParticipantRecord alloc], "initWithData:", v6);
  v8 = v5->_underlyingSummaryParticipantRecord;
  v5->_underlyingSummaryParticipantRecord = v7;

  if (v5->_underlyingSummaryParticipantRecord)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)updateWithLocalEntry:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  HDCloudSyncCodableSharedSummaryParticipantRecord *underlyingSummaryParticipantRecord;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  BOOL v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;

  v7 = a3;
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryParticipantRecord uuid](self->_underlyingSummaryParticipantRecord, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = objc_opt_class();
    v18 = CFSTR("Cannot update with mismatched UUID.");
    goto LABEL_7;
  }
  if (!objc_msgSend(v7, "hasInvitationUUID"))
  {
LABEL_9:
    v20 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasStatus](self->_underlyingSummaryParticipantRecord, "hasStatus");
    v21 = objc_msgSend(v7, "status");
    if (v20)
    {
      switch(v21)
      {
        case 1:
          if (!-[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status"))
          {
            v22 = 1;
            goto LABEL_14;
          }
          break;
        case 2:
          if (!-[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status")|| -[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status") == 1)
          {
            v22 = 2;
            goto LABEL_14;
          }
          break;
        case 3:
          if (!-[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status"))
          {
            v22 = 3;
            goto LABEL_14;
          }
          break;
        case 4:
          if (!-[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status")|| -[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status") == 1)
          {
            v22 = 4;
            goto LABEL_14;
          }
          break;
        default:
          break;
      }
    }
    else
    {
      v22 = v21;
LABEL_14:
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](self->_underlyingSummaryParticipantRecord, "setStatus:", v22);
    }
    v23 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasNotificationStatus](self->_underlyingSummaryParticipantRecord, "hasNotificationStatus");
    v24 = objc_msgSend(v7, "notificationStatus");
    if (v23)
    {
      if (v24 == 2)
      {
        v25 = 2;
      }
      else
      {
        if (v24 != 1
          || -[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](self->_underlyingSummaryParticipantRecord, "notificationStatus"))
        {
LABEL_23:
          if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasType](self->_underlyingSummaryParticipantRecord, "hasType"))
          {
            v26 = -[HDCloudSyncCodableSharedSummaryParticipantRecord type](self->_underlyingSummaryParticipantRecord, "type");
            if (v26 != (int)objc_msgSend(v7, "type"))
            {
              v16 = (void *)MEMORY[0x1E0CB35C8];
              v17 = objc_opt_class();
              v18 = CFSTR("Invitation types do not match.");
              goto LABEL_7;
            }
          }
          else
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](self->_underlyingSummaryParticipantRecord, "setType:", (int)objc_msgSend(v7, "type"));
          }
          if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasDirection](self->_underlyingSummaryParticipantRecord, "hasDirection"))
          {
            v27 = -[HDCloudSyncCodableSharedSummaryParticipantRecord direction](self->_underlyingSummaryParticipantRecord, "direction");
            if (v27 != (int)objc_msgSend(v7, "direction"))
            {
              v16 = (void *)MEMORY[0x1E0CB35C8];
              v17 = objc_opt_class();
              v18 = CFSTR("Invitation directions do not match.");
              goto LABEL_7;
            }
          }
          else
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](self->_underlyingSummaryParticipantRecord, "setDirection:", (int)objc_msgSend(v7, "direction"));
          }
          v19 = 1;
          goto LABEL_32;
        }
        v25 = 1;
      }
    }
    else
    {
      v25 = v24;
    }
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](self->_underlyingSummaryParticipantRecord, "setNotificationStatus:", v25);
    goto LABEL_23;
  }
  v11 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasInvitationUUID](self->_underlyingSummaryParticipantRecord, "hasInvitationUUID");
  objc_msgSend(v7, "invitationUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
  if (!v11)
  {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](underlyingSummaryParticipantRecord, "setInvitationUUID:", v12);

    goto LABEL_9;
  }
  -[HDCloudSyncCodableSharedSummaryParticipantRecord invitationUUID](underlyingSummaryParticipantRecord, "invitationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
    goto LABEL_9;
  v16 = (void *)MEMORY[0x1E0CB35C8];
  v17 = objc_opt_class();
  v18 = CFSTR("Invitation UUIDs do not match.");
LABEL_7:
  objc_msgSend(v16, "hk_assignError:invalidArgument:class:selector:", a4, v18, v17, a2);
  v19 = 0;
LABEL_32:

  return v19;
}

- (int64_t)mergeWithLocalEntry:(id)a3 error:(id *)a4
{
  HDCloudSyncCodableSharedSummaryParticipantRecord *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  HDCloudSyncCodableSharedSummaryParticipantRecord *underlyingSummaryParticipantRecord;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  int64_t v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  HDCloudSyncCodableSharedSummaryParticipantRecord *v43;
  uint64_t v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  HDCloudSyncCodableSharedSummaryParticipantRecord *v52;
  _BOOL4 v53;
  int v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  _BOOL4 v69;
  int v70;
  int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  _BOOL4 v77;
  _BOOL4 v78;
  void *v79;
  _BOOL4 v80;
  _BOOL4 v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v104;
  int64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v7 = (HDCloudSyncCodableSharedSummaryParticipantRecord *)a3;
  -[HDCloudSyncCodableSharedSummaryParticipantRecord uuid](v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryParticipantRecord uuid](self->_underlyingSummaryParticipantRecord, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = objc_opt_class();
    v20 = CFSTR("Cannot update with mismatched UUID.");
    goto LABEL_7;
  }
  v11 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasInvitationUUID](v7, "hasInvitationUUID");
  v12 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasInvitationUUID](self->_underlyingSummaryParticipantRecord, "hasInvitationUUID");
  v13 = v12;
  if (!v11)
  {
    if (!v12)
      goto LABEL_11;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord invitationUUID](self->_underlyingSummaryParticipantRecord, "invitationUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    underlyingSummaryParticipantRecord = v7;
LABEL_10:
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](underlyingSummaryParticipantRecord, "setInvitationUUID:", v14);
    v22 = v11 ^ 1;

    goto LABEL_12;
  }
  -[HDCloudSyncCodableSharedSummaryParticipantRecord invitationUUID](v7, "invitationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
  if (!v13)
    goto LABEL_10;
  -[HDCloudSyncCodableSharedSummaryParticipantRecord invitationUUID](underlyingSummaryParticipantRecord, "invitationUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
  {
LABEL_11:
    v22 = 0;
    v11 = 0;
LABEL_12:
    v23 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasType](self->_underlyingSummaryParticipantRecord, "hasType");
    v24 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasType](v7, "hasType");
    v25 = v24;
    if (!v23)
    {
      if (v24)
      {
        -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](self->_underlyingSummaryParticipantRecord, "setType:", HDSharingTypeFromCodableType(-[HDCloudSyncCodableSharedSummaryParticipantRecord type](v7, "type")));
        v11 = 1;
      }
      goto LABEL_25;
    }
    v26 = -[HDCloudSyncCodableSharedSummaryParticipantRecord type](self->_underlyingSummaryParticipantRecord, "type");
    v27 = v26;
    if (v25)
    {
      if (v26 != HDSharingTypeFromCodableType(-[HDCloudSyncCodableSharedSummaryParticipantRecord type](v7, "type")))
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = objc_opt_class();
        v20 = CFSTR("Invitation types do not match.");
        goto LABEL_7;
      }
LABEL_25:
      v30 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasDirection](self->_underlyingSummaryParticipantRecord, "hasDirection");
      v31 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasDirection](v7, "hasDirection");
      v32 = v31;
      if (!v30)
      {
        if (v31)
        {
          -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](self->_underlyingSummaryParticipantRecord, "setDirection:", HDSharingMessageDirectionFromCodableDirection(-[HDCloudSyncCodableSharedSummaryParticipantRecord direction](v7, "direction")));
          v11 = 1;
        }
        goto LABEL_38;
      }
      v33 = -[HDCloudSyncCodableSharedSummaryParticipantRecord direction](self->_underlyingSummaryParticipantRecord, "direction");
      v34 = v33;
      if (v32)
      {
        if (v33 != HDSharingMessageDirectionFromCodableDirection(-[HDCloudSyncCodableSharedSummaryParticipantRecord direction](v7, "direction")))
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v19 = objc_opt_class();
          v20 = CFSTR("Invitation directions do not match.");
          goto LABEL_7;
        }
LABEL_38:
        v37 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasStatus](self->_underlyingSummaryParticipantRecord, "hasStatus");
        v38 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasStatus](v7, "hasStatus");
        if (v37)
        {
          if (v38)
          {
            v39 = HDSharingStatusFromCodableStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord status](v7, "status"));
            v40 = -[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status");
            v41 = HDMergedSharingStatus(v39, v40);
            v42 = v41;
            if (v41 != v39)
            {
              -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](v7, "setStatus:", HDCodableSharingStatusFromStatus(v41));
              v22 = 1;
            }
            if (v42 != v40)
            {
              v43 = self->_underlyingSummaryParticipantRecord;
              v44 = v42;
LABEL_46:
              -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](v43, "setStatus:", v44);
              v11 = 1;
            }
          }
          else
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](v7, "setStatus:", HDCodableSharingStatusFromStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status")));
            v22 = 1;
          }
LABEL_48:
          v45 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasNotificationStatus](self->_underlyingSummaryParticipantRecord, "hasNotificationStatus");
          v46 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasNotificationStatus](v7, "hasNotificationStatus");
          if (!v45)
          {
            if (!v46)
              goto LABEL_66;
            v51 = HDSharingNotificationStatusFromCodableStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](v7, "notificationStatus"));
            v52 = self->_underlyingSummaryParticipantRecord;
            goto LABEL_65;
          }
          if (!v46)
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](v7, "setNotificationStatus:", HDCodableSharingNotificationStatusFromStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](self->_underlyingSummaryParticipantRecord, "notificationStatus")));
            v22 = 1;
            goto LABEL_66;
          }
          v47 = HDSharingNotificationStatusFromCodableStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](v7, "notificationStatus"));
          v48 = -[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](self->_underlyingSummaryParticipantRecord, "notificationStatus");
          v49 = v48;
          if (v47)
          {
            if (v47 != 2)
            {
              if (v47 == 1)
              {
                if (v48 < 3)
                {
                  v50 = qword_1B7F3B390[v48];
                  goto LABEL_60;
                }
                v47 = 1;
              }
LABEL_63:
              if (v47 == v49)
                goto LABEL_66;
              v52 = self->_underlyingSummaryParticipantRecord;
              v51 = v47;
LABEL_65:
              -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](v52, "setNotificationStatus:", v51);
              v11 = 1;
LABEL_66:
              v53 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryModificationDate](self->_underlyingSummaryParticipantRecord, "hasEntryModificationDate");
              v54 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasDateModified](v7, "hasDateModified");
              v55 = v54;
              if (v53)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryModificationDate](self->_underlyingSummaryParticipantRecord, "entryModificationDate");
                v57 = v56;
                if (!v55)
                  goto LABEL_73;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateModified](v7, "dateModified");
                if (v57 < v58)
                  v57 = v58;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryModificationDate](self->_underlyingSummaryParticipantRecord, "entryModificationDate");
                if (v57 != v59)
                {
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](self->_underlyingSummaryParticipantRecord, "setEntryModificationDate:", v57);
                  v11 = 1;
                }
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateModified](v7, "dateModified");
                if (v57 != v60)
                {
LABEL_73:
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setDateModified:](v7, "setDateModified:", v57);
                  v22 = 1;
                }
              }
              else if (v54)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateModified](v7, "dateModified");
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](self->_underlyingSummaryParticipantRecord, "setEntryModificationDate:");
                v11 = 1;
              }
              v61 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryInvitationDate](self->_underlyingSummaryParticipantRecord, "hasEntryInvitationDate");
              v62 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasDateInvited](v7, "hasDateInvited");
              v63 = v62;
              if (v61)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryInvitationDate](self->_underlyingSummaryParticipantRecord, "entryInvitationDate");
                v65 = v64;
                if (!v63)
                  goto LABEL_83;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateInvited](v7, "dateInvited");
                if (v65 >= v66)
                  v65 = v66;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryInvitationDate](self->_underlyingSummaryParticipantRecord, "entryInvitationDate");
                if (v65 != v67)
                {
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](self->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:", v65);
                  v11 = 1;
                }
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateInvited](v7, "dateInvited");
                if (v65 != v68)
                {
LABEL_83:
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setDateInvited:](v7, "setDateInvited:", v65);
                  v22 = 1;
                }
              }
              else if (v62)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateInvited](v7, "dateInvited");
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](self->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
                v11 = 1;
              }
              v69 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryAcceptanceDate](self->_underlyingSummaryParticipantRecord, "hasEntryAcceptanceDate");
              v70 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasDateAccepted](v7, "hasDateAccepted");
              v71 = v70;
              if (v69)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryAcceptanceDate](self->_underlyingSummaryParticipantRecord, "entryAcceptanceDate");
                v73 = v72;
                if (!v71)
                  goto LABEL_93;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateAccepted](v7, "dateAccepted");
                if (v73 >= v74)
                  v73 = v74;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord entryAcceptanceDate](self->_underlyingSummaryParticipantRecord, "entryAcceptanceDate");
                if (v73 != v75)
                {
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](self->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:", v73);
                  v11 = 1;
                }
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateAccepted](v7, "dateAccepted");
                if (v73 != v76)
                {
LABEL_93:
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord setDateAccepted:](v7, "setDateAccepted:", v73);
                  v22 = 1;
                }
              }
              else if (v70)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord dateAccepted](v7, "dateAccepted");
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](self->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
                v11 = 1;
              }
              v77 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasOwnerParticipant](self->_underlyingSummaryParticipantRecord, "hasOwnerParticipant");
              v78 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasOwnerParticipant](v7, "hasOwnerParticipant");
              if (v77)
              {
                if (v78)
                  goto LABEL_102;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](self->_underlyingSummaryParticipantRecord, "ownerParticipant");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](v7, "setOwnerParticipant:", v79);
                v22 = 1;
              }
              else
              {
                if (!v78)
                  goto LABEL_102;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](v7, "ownerParticipant");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](self->_underlyingSummaryParticipantRecord, "setOwnerParticipant:", v79);
                v11 = 1;
              }

LABEL_102:
              v80 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasCloudKitIdentifier](self->_underlyingSummaryParticipantRecord, "hasCloudKitIdentifier");
              v81 = -[HDCloudSyncCodableSharedSummaryParticipantRecord hasCloudKitIdentifier](v7, "hasCloudKitIdentifier");
              if (v80)
              {
                if (v81)
                  goto LABEL_108;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord cloudKitIdentifier](self->_underlyingSummaryParticipantRecord, "cloudKitIdentifier");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](v7, "setCloudKitIdentifier:", v82);
                v22 = 1;
              }
              else
              {
                if (!v81)
                  goto LABEL_108;
                -[HDCloudSyncCodableSharedSummaryParticipantRecord cloudKitIdentifier](v7, "cloudKitIdentifier");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](self->_underlyingSummaryParticipantRecord, "setCloudKitIdentifier:", v82);
                v11 = 1;
              }

LABEL_108:
              v83 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](self->_underlyingSummaryParticipantRecord, "allContactIdentifiers");
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if (v84)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](self->_underlyingSummaryParticipantRecord, "allContactIdentifiers");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "addObjectsFromArray:", v85);

              }
              -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](v7, "allContactIdentifiers");
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              if (v86)
              {
                -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](v7, "allContactIdentifiers");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "addObjectsFromArray:", v87);

              }
              objc_msgSend(v83, "allObjects");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "sortedArrayUsingSelector:", sel_compare_);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](self->_underlyingSummaryParticipantRecord, "allContactIdentifiers");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              if (v90 == v89)
              {
                v94 = v89;
              }
              else
              {
                v91 = v90;
                if (v89)
                {
                  -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](self->_underlyingSummaryParticipantRecord, "allContactIdentifiers");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend(v92, "isEqual:", v89);

                  if ((v93 & 1) != 0)
                  {
LABEL_120:
                    -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](v7, "allContactIdentifiers");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v95 == v89)
                    {
                      v99 = v89;
                    }
                    else
                    {
                      v96 = v95;
                      if (v89)
                      {
                        -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](v7, "allContactIdentifiers");
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        v98 = objc_msgSend(v97, "isEqual:", v89);

                        if ((v98 & 1) != 0)
                        {
LABEL_128:
                          -[HDCloudSyncRecord record](self, "record");
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("RelationshipRecord"));
                          v101 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v101)
                          {
                            -[HDCloudSyncRecord record](self, "record");
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v102, "setObject:forKeyedSubscript:", 0, CFSTR("RelationshipRecord"));

                          }
                          else if (!v11)
                          {
                            if (v22)
                              v21 = 2;
                            else
                              v21 = 4;
                            goto LABEL_134;
                          }
                          if (v22)
                            v21 = 3;
                          else
                            v21 = 1;
LABEL_134:

                          goto LABEL_135;
                        }
                      }
                      else
                      {

                      }
                      v99 = (void *)objc_msgSend(v89, "mutableCopy");
                      -[HDCloudSyncCodableSharedSummaryParticipantRecord setAllContactIdentifiers:](v7, "setAllContactIdentifiers:", v99);
                      v22 = 1;
                    }

                    goto LABEL_128;
                  }
                }
                else
                {

                }
                v94 = (void *)objc_msgSend(v89, "mutableCopy");
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setAllContactIdentifiers:](self->_underlyingSummaryParticipantRecord, "setAllContactIdentifiers:", v94);
                v11 = 1;
              }

              goto LABEL_120;
            }
            v50 = 2;
          }
          else
          {
            v50 = v48;
          }
LABEL_60:
          if (v50 != v47)
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](v7, "setNotificationStatus:", HDCodableSharingNotificationStatusFromStatus(v50));
            v22 = 1;
            v47 = v50;
          }
          goto LABEL_63;
        }
        if (!v38)
          goto LABEL_48;
        v44 = HDSharingStatusFromCodableStatus(-[HDCloudSyncCodableSharedSummaryParticipantRecord status](v7, "status"));
        v43 = self->_underlyingSummaryParticipantRecord;
        goto LABEL_46;
      }
      if (v33 != 1)
      {
        if (!v33)
        {
          v35 = 0;
LABEL_37:
          -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](v7, "setDirection:", v35);
          v22 = 1;
          goto LABEL_38;
        }
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          v104 = 134217984;
          v105 = v34;
          _os_log_fault_impl(&dword_1B7802000, v36, OS_LOG_TYPE_FAULT, "Unexpected direction %ld", (uint8_t *)&v104, 0xCu);
        }
      }
      v35 = 1;
      goto LABEL_37;
    }
    if (v26)
    {
      if (v26 == 1)
      {
        v28 = 1;
LABEL_24:
        -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](v7, "setType:", v28);
        v22 = 1;
        goto LABEL_25;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v104 = 134217984;
        v105 = v27;
        _os_log_fault_impl(&dword_1B7802000, v29, OS_LOG_TYPE_FAULT, "Unexpected type %ld", (uint8_t *)&v104, 0xCu);
      }
    }
    v28 = 0;
    goto LABEL_24;
  }
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = objc_opt_class();
  v20 = CFSTR("Invitation UUIDs do not match.");
LABEL_7:
  objc_msgSend(v18, "hk_assignError:invalidArgument:class:selector:", a4, v20, v19, a2);
  v21 = 5;
LABEL_135:

  return v21;
}

- (NSUUID)UUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncCodableSharedSummaryParticipantRecord uuid](self->_underlyingSummaryParticipantRecord, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (NSString)contactIdentifier
{
  return -[HDCloudSyncCodableSharedSummaryParticipantRecord contactIdentifier](self->_underlyingSummaryParticipantRecord, "contactIdentifier");
}

- (void)setAuthorizationRecord:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setAuthorizationRecordIdentifier:](self->_underlyingSummaryParticipantRecord, "setAuthorizationRecordIdentifier:", v5);

}

- (NSUUID)authorizationRecordIdentifier
{
  id v3;
  void *v4;
  void *v5;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasAuthorizationRecordIdentifier](self->_underlyingSummaryParticipantRecord, "hasAuthorizationRecordIdentifier"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord authorizationRecordIdentifier](self->_underlyingSummaryParticipantRecord, "authorizationRecordIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }
  return (NSUUID *)v5;
}

- (NSUUID)invitationUUID
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryParticipantRecord invitationUUID](self->_underlyingSummaryParticipantRecord, "invitationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return (NSUUID *)v3;
}

- (void)setInvitationUUID:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](self->_underlyingSummaryParticipantRecord, "setInvitationUUID:", v4);

}

- (NSString)cloudKitIdentifier
{
  return -[HDCloudSyncCodableSharedSummaryParticipantRecord cloudKitIdentifier](self->_underlyingSummaryParticipantRecord, "cloudKitIdentifier");
}

- (void)setCloudKitIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](self->_underlyingSummaryParticipantRecord, "setCloudKitIdentifier:", v4);

}

- (NSString)firstName
{
  return -[HDCloudSyncCodableSharedSummaryParticipantRecord firstName](self->_underlyingSummaryParticipantRecord, "firstName");
}

- (void)setFirstName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setFirstName:](self->_underlyingSummaryParticipantRecord, "setFirstName:", v4);

}

- (NSString)lastName
{
  return -[HDCloudSyncCodableSharedSummaryParticipantRecord lastName](self->_underlyingSummaryParticipantRecord, "lastName");
}

- (void)setLastName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setLastName:](self->_underlyingSummaryParticipantRecord, "setLastName:", v4);

}

- (NSArray)allContactIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiers](self->_underlyingSummaryParticipantRecord, "allContactIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)setAllContactIdentifiers:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setAllContactIdentifiers:](self->_underlyingSummaryParticipantRecord, "setAllContactIdentifiers:", v4);

}

- (NSNumber)userWheelchairMode
{
  void *v3;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasUserWheelchairMode](self->_underlyingSummaryParticipantRecord, "hasUserWheelchairMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord userWheelchairMode](self->_underlyingSummaryParticipantRecord, "userWheelchairMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)setUserWheelchairMode:(id)a3
{
  if (a3)
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUserWheelchairMode:](self->_underlyingSummaryParticipantRecord, "setUserWheelchairMode:", objc_msgSend(a3, "longLongValue"));
  else
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasUserWheelchairMode:](self->_underlyingSummaryParticipantRecord, "setHasUserWheelchairMode:");
}

- (NSNumber)relationshipType
{
  void *v3;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasType](self->_underlyingSummaryParticipantRecord, "hasType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord type](self->_underlyingSummaryParticipantRecord, "type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)setRelationshipType:(id)a3
{
  if (a3)
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](self->_underlyingSummaryParticipantRecord, "setType:", objc_msgSend(a3, "longLongValue"));
  else
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasType:](self->_underlyingSummaryParticipantRecord, "setHasType:");
}

- (NSNumber)relationshipDirection
{
  void *v3;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasDirection](self->_underlyingSummaryParticipantRecord, "hasDirection"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord direction](self->_underlyingSummaryParticipantRecord, "direction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)setRelationshipDirection:(id)a3
{
  if (a3)
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](self->_underlyingSummaryParticipantRecord, "setDirection:", objc_msgSend(a3, "longLongValue"));
  else
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasDirection:](self->_underlyingSummaryParticipantRecord, "setHasDirection:");
}

- (NSNumber)relationshipStatus
{
  void *v3;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasStatus](self->_underlyingSummaryParticipantRecord, "hasStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)setRelationshipStatus:(id)a3
{
  if (a3)
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](self->_underlyingSummaryParticipantRecord, "setStatus:", objc_msgSend(a3, "longLongValue"));
  else
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasStatus:](self->_underlyingSummaryParticipantRecord, "setHasStatus:");
}

- (NSNumber)notificationStatus
{
  void *v3;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasNotificationStatus](self->_underlyingSummaryParticipantRecord, "hasNotificationStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](self->_underlyingSummaryParticipantRecord, "notificationStatus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)setNotificationStatus:(id)a3
{
  if (a3)
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](self->_underlyingSummaryParticipantRecord, "setNotificationStatus:", objc_msgSend(a3, "longLongValue"));
  else
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasNotificationStatus:](self->_underlyingSummaryParticipantRecord, "setHasNotificationStatus:");
}

- (NSDate)entryModificationDate
{
  id v3;
  void *v4;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryModificationDate](self->_underlyingSummaryParticipantRecord, "hasEntryModificationDate"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord entryModificationDate](self->_underlyingSummaryParticipantRecord, "entryModificationDate");
    v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setEntryModificationDate:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](self->_underlyingSummaryParticipantRecord, "setEntryModificationDate:");
  }
  else
  {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryModificationDate:](self->_underlyingSummaryParticipantRecord, "setHasEntryModificationDate:");
  }
}

- (NSDate)entryInvitationDate
{
  id v3;
  void *v4;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryInvitationDate](self->_underlyingSummaryParticipantRecord, "hasEntryInvitationDate"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord entryInvitationDate](self->_underlyingSummaryParticipantRecord, "entryInvitationDate");
    v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setEntryInvitationDate:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](self->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
  }
  else
  {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryInvitationDate:](self->_underlyingSummaryParticipantRecord, "setHasEntryInvitationDate:");
  }
}

- (NSDate)entryAcceptanceDate
{
  id v3;
  void *v4;

  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord hasEntryAcceptanceDate](self->_underlyingSummaryParticipantRecord, "hasEntryAcceptanceDate"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord entryAcceptanceDate](self->_underlyingSummaryParticipantRecord, "entryAcceptanceDate");
    v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setEntryAcceptanceDate:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](self->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
  }
  else
  {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryAcceptanceDate:](self->_underlyingSummaryParticipantRecord, "setHasEntryAcceptanceDate:");
  }
}

- (HDCodableSharingSetupMetadata)shareSetupMetadata
{
  void *v3;
  HDCodableSharingSetupMetadata *v4;
  void *v5;
  HDCodableSharingSetupMetadata *v6;

  -[HDCloudSyncCodableSharedSummaryParticipantRecord setupMetadata](self->_underlyingSummaryParticipantRecord, "setupMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HDCodableSharingSetupMetadata alloc];
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setupMetadata](self->_underlyingSummaryParticipantRecord, "setupMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HDCodableSharingSetupMetadata initWithData:](v4, "initWithData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setShareSetupMetadata:(id)a3
{
  id v4;

  objc_msgSend(a3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryParticipantRecord setSetupMetadata:](self->_underlyingSummaryParticipantRecord, "setSetupMetadata:", v4);

}

- (CKShareParticipant)ownerParticipant
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  HDCloudSyncCodableSharedSummaryParticipantRecord *underlyingSummaryParticipantRecord;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](self->_underlyingSummaryParticipantRecord, "ownerParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](self->_underlyingSummaryParticipantRecord, "ownerParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    if (!v3)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
        v11 = v8;
        -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](underlyingSummaryParticipantRecord, "ownerParticipant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v7;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive share participant %{public}@: %{public}@", buf, 0x16u);

      }
    }

  }
  return (CKShareParticipant *)v3;
}

- (void)setOwnerParticipant:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryParticipantRecord *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](self->_underlyingSummaryParticipantRecord, "setOwnerParticipant:", v5);

    -[HDCloudSyncCodableSharedSummaryParticipantRecord ownerParticipant](self->_underlyingSummaryParticipantRecord, "ownerParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v11 = self;
        v12 = 2114;
        v13 = v4;
        v14 = 2114;
        v15 = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive owner participant %{public}@: %{public}@", buf, 0x20u);
      }
    }

  }
  else
  {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](self->_underlyingSummaryParticipantRecord, "setOwnerParticipant:", 0);
  }

}

+ (id)codableRecordFromRecord:(id)a3
{
  return (id)objc_msgSend(*((id *)a3 + 3), "copy");
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableSharedSummaryParticipantRecord data](self->_underlyingSummaryParticipantRecord, "data");
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    objc_msgSend(v7, "recordType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, CFSTR("record has type (%@), but expected (%@)"), v11, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    goto LABEL_11;
  }
  objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(a1, "requiresUnderlyingMessage")
    || (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), a4), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v11, "integerValue"));
  }
LABEL_12:

  return v12;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

+ (id)fieldsForUnprotectedSerialization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSharedSummaryParticipantRecord;
  objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("RelationshipRecord"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncRecord record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord printDescription](self, "printDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (Version %@) Last Modified: %@\n%@"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)printDescription
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncSharedSummaryParticipantRecord contactIdentifier](self, "contactIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord UUID](self, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord invitationUUID](self, "invitationUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord relationshipStatus](self, "relationshipStatus");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HDCloudSyncSharedSummaryParticipantRecord relationshipStatus](self, "relationshipStatus");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "longLongValue");
    HKStringForSharingStatus();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("<unknown>");
  }
  -[HDCloudSyncSharedSummaryParticipantRecord relationshipDirection](self, "relationshipDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HDCloudSyncSharedSummaryParticipantRecord relationshipDirection](self, "relationshipDirection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "longLongValue");
    HKStringForMessageDirection();
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("<unknown>");
  }
  v19 = (void *)v4;
  -[HDCloudSyncSharedSummaryParticipantRecord relationshipType](self, "relationshipType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HDCloudSyncSharedSummaryParticipantRecord relationshipType](self, "relationshipType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "longLongValue");
    HKStringForSharingType();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<unknown>");
  }
  -[HDCloudSyncSharedSummaryParticipantRecord notificationStatus](self, "notificationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HDCloudSyncSharedSummaryParticipantRecord notificationStatus](self, "notificationStatus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "longLongValue");
    HKStringForNotificationStatus();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("<unknown>");
  }
  -[HDCloudSyncSharedSummaryParticipantRecord lastName](self, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord firstName](self, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryParticipantRecord cloudKitIdentifier](self, "cloudKitIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("+ %@ - %@ [IDS: %@]\n| %@ %@ %@ %@ for \"%@, %@\" <%@>\n+------------------------------------------------------------------------"), v24, v23, v22, v21, v20, v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  if (v6)
  {

  }
  if (v5)
  {

  }
  if (v19)
  {

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSummaryParticipantRecord, 0);
}

@end
