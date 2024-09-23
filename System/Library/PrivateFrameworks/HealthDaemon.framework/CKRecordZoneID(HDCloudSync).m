@implementation CKRecordZoneID(HDCloudSync)

+ (id)hd_masterZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("Master"));
}

- (uint64_t)hd_isMasterZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("Master"));
}

+ (id)hd_unifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("UnifiedSync"));
}

- (uint64_t)hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("UnifiedSync"));
}

+ (id)hd_privateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("PrivateMetadata"));
}

- (uint64_t)hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("PrivateMetadata"));
}

+ (id)hd_individualSyncZoneIDWithSyncCircleIdentifier:()HDCloudSync storeIdentifier:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKRecordZoneID+HDCloudSync.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]"));

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@%@"), v8, CFSTR(":"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C95098]);
  v13 = (void *)objc_msgSend(v12, "initWithZoneName:ownerName:", v11, *MEMORY[0x1E0C94730]);

  return v13;
}

- (uint64_t)hd_isIndividualSyncZoneIDForStoreIdentifier:()HDCloudSync syncCircleIdentifier:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 2
    && (v8 = objc_alloc(MEMORY[0x1E0CB3A28]),
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        *a3 = (id)objc_msgSend(v8, "initWithUUIDString:", v9),
        v9,
        *a3))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)hd_sharedSummaryZoneIDWithSyncCircleIdentifier:()HDCloudSync userIdentifier:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKRecordZoneID+HDCloudSync.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]"));

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@%@%@%@"), v8, CFSTR(":"), CFSTR("SummarySharing"), CFSTR(":"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C95098]);
  v13 = (void *)objc_msgSend(v12, "initWithZoneName:ownerName:", v11, *MEMORY[0x1E0C94730]);

  return v13;
}

+ (id)hd_attachmentZoneIDWithSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("Attachment"));
}

- (uint64_t)hd_isAttachmentZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("Attachment"));
}

+ (id)hd_contextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("ContextSync"));
}

- (uint64_t)hd_isContextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, CFSTR("ContextSync"));
}

- (BOOL)hd_isSharedSummaryZoneIDForUserIdentifier:()HDCloudSync syncCircleIdentifier:
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _BOOL8 v12;

  objc_msgSend(a1, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 3
    && (objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SummarySharing")),
        v8,
        v9))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v10, "initWithUUIDString:", v11);

    v12 = *a3 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)hd_stateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKRecordZoneID+HDCloudSync.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), v7, CFSTR(":"), CFSTR("StateSync"), CFSTR(":"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C95098]);
  v11 = (void *)objc_msgSend(v10, "initWithZoneName:ownerName:", v9, *MEMORY[0x1E0C94730]);

  return v11;
}

- (uint64_t)hd_isStateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  objc_msgSend(a1, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 3
    && (objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("StateSync")),
        v8,
        v9))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)hd_syncCircleIdentifier
{
  int v2;
  id v3;
  id v4;
  int v5;
  id v6;
  int v7;
  id v8;
  int v9;
  id v10;
  id v11;
  int v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id v18;
  int v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v34 = 0;
  v2 = objc_msgSend(a1, "hd_isMasterZoneIDForSyncCircleIdentifier:", &v34);
  v3 = v34;
  v4 = v3;
  if (v2)
    goto LABEL_4;
  v33 = v3;
  v5 = objc_msgSend(a1, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v33);
  v6 = v33;

  if (v5)
  {
LABEL_6:
    v8 = v6;
    goto LABEL_7;
  }
  v32 = v6;
  v7 = objc_msgSend(a1, "hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:", &v32);
  v4 = v32;

  if (!v7)
  {
    v31 = v4;
    v9 = objc_msgSend(a1, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v31);
    v6 = v31;

    if (v9)
      goto LABEL_6;
    v29 = 0;
    v30 = v6;
    v13 = objc_msgSend(a1, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v30, &v29);
    v14 = v30;

    v15 = v29;
    if (v13)
    {
      v16 = v14;
    }
    else
    {
      v28 = v14;
      v17 = objc_msgSend(a1, "hd_isContextSyncZoneIDForSyncCircleIdentifier:", &v28);
      v18 = v28;

      if (!v17)
      {
        v26 = v18;
        v27 = 0;
        v19 = objc_msgSend(a1, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v27, &v26);
        v20 = v27;
        v21 = v26;

        if (v19)
        {
          v10 = v21;
          v11 = v10;
        }
        else
        {
          v24 = v21;
          v25 = 0;
          v22 = objc_msgSend(a1, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v25, &v24);
          v23 = v25;
          v11 = v24;

          v10 = 0;
          if (v22)
            v10 = v11;

        }
        goto LABEL_20;
      }
      v16 = v18;
    }
    v10 = v16;
    v11 = v16;
LABEL_20:

    goto LABEL_8;
  }
LABEL_4:
  v8 = v4;
LABEL_7:
  v10 = v8;
  v11 = v8;
LABEL_8:

  return v10;
}

- (id)hd_storeIdentifier
{
  int v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  v1 = objc_msgSend(a1, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v7, &v6);
  v2 = v7;
  v3 = v6;
  v4 = 0;
  if (v1)
    v4 = v2;

  return v4;
}

- (id)hd_withOwnerName:()HDCloudSync
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v7, v5);

  return v8;
}

@end
