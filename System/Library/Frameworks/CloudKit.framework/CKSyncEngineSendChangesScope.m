@implementation CKSyncEngineSendChangesScope

- (CKSyncEngineSendChangesScope)initWithZoneIDs:(NSSet *)zoneIDs
{
  NSSet *v4;
  void *v5;
  const char *v6;
  CKSyncEngineSendChangesScope *v7;

  v4 = zoneIDs;
  v5 = (void *)objc_opt_new();
  v7 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v6, (uint64_t)v4, (uint64_t)v5, 0);

  return v7;
}

- (CKSyncEngineSendChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKSyncEngineSendChangesScope *v14;
  uint64_t v15;
  NSSet *zoneIDs;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *excludedZoneIDs;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSet *recordIDs;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKSyncEngineSendChangesScope;
  v14 = -[CKSyncEngineSendChangesScope init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    zoneIDs = v14->_zoneIDs;
    v14->_zoneIDs = (NSSet *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    excludedZoneIDs = v14->_excludedZoneIDs;
    v14->_excludedZoneIDs = (NSSet *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    recordIDs = v14->_recordIDs;
    v14->_recordIDs = (NSSet *)v25;

  }
  return v14;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  __CFString *v46;

  objc_msgSend_zoneIDs(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDs(self, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_allObjects(v5, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v17, v18, (uint64_t)&unk_1E1F62EC8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v20, v22, (uint64_t)CFSTR(", "), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v21, v25, (uint64_t)CFSTR("zoneIDs(%@)"), v26, v24);
  }
  else if (objc_msgSend_count(v9, v13, v14, v15))
  {
    objc_msgSend_allObjects(v9, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v30, v31, (uint64_t)&unk_1E1F55A88, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v20, v34, (uint64_t)CFSTR(", "), v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v33, v36, (uint64_t)CFSTR("allExcluding(%@)"), v37, v24);
  }
  else
  {
    if (!v16)
    {
      v46 = CFSTR("all");
      goto LABEL_8;
    }
    objc_msgSend_allObjects(v16, v27, v28, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v38, v39, (uint64_t)&unk_1E1F58F18, v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v20, v42, (uint64_t)CFSTR(", "), v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v41, v44, (uint64_t)CFSTR("recordIDs(%@)"), v45, v24);
  }
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v46;
}

- (NSSet)excludedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)recordIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_excludedZoneIDs, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

- (CKSyncEngineSendChangesScope)init
{
  void *v3;
  const char *v4;
  CKSyncEngineSendChangesScope *v5;

  v3 = (void *)objc_opt_new();
  v5 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v4, 0, (uint64_t)v3, 0);

  return v5;
}

- (CKSyncEngineSendChangesScope)initWithExcludedZoneIDs:(NSSet *)excludedZoneIDs
{
  return (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, a2, 0, (uint64_t)excludedZoneIDs, 0);
}

- (CKSyncEngineSendChangesScope)initWithRecordIDs:(NSSet *)recordIDs
{
  NSSet *v4;
  void *v5;
  const char *v6;
  CKSyncEngineSendChangesScope *v7;

  v4 = recordIDs;
  v5 = (void *)objc_opt_new();
  v7 = (CKSyncEngineSendChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_recordIDs_(self, v6, 0, (uint64_t)v5, v4);

  return v7;
}

- (BOOL)containsScope:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char v30;

  v4 = a3;
  objc_msgSend_zoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDs(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneIDs(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDs(v4, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(v4, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend_scopeWithZoneIDs_recordIDs_excludedZoneIDs_containsScopeWithZoneIDs_recordIDs_excludedZoneIDs_(CKSyncEngineFetchChangesScope, v29, (uint64_t)v8, (uint64_t)v12, v16, v20, v24, v28);
  return v30;
}

- (BOOL)containsRecordID:(CKRecordID *)recordID
{
  CKRecordID *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  char v28;
  char v29;

  v4 = recordID;
  objc_msgSend_zoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDs(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (v12 && !objc_msgSend_containsObject_(v12, v13, (uint64_t)v4, v15)
    || v8
    && (objc_msgSend_zoneID(v4, v13, v14, v15),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend_containsObject_(v8, v18, (uint64_t)v17, v19),
        v17,
        !v20))
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend_excludedZoneIDs(self, v13, v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v4, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_containsObject_(v21, v26, (uint64_t)v25, v27);

    v29 = v28 ^ 1;
  }

  return v29;
}

- (BOOL)containsPendingRecordZoneChange:(CKSyncEnginePendingRecordZoneChange *)pendingRecordZoneChange
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_recordID(pendingRecordZoneChange, a2, (uint64_t)pendingRecordZoneChange, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsRecordID_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (BOOL)containsZoneOrRecordWithZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  const char *v33;
  uint64_t v34;
  char isEqual;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_excludedZoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  if ((v11 & 1) != 0)
  {
    LOBYTE(v15) = 0;
  }
  else
  {
    objc_msgSend_zoneIDs(self, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (v16)
    {
      LOBYTE(v15) = objc_msgSend_containsObject_(v16, v17, (uint64_t)v4, v19);
    }
    else
    {
      objc_msgSend_recordIDs(self, v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v21, v22, v23, v24))
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v25 = v21;
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v37, (uint64_t)v41, 16);
        if (v15)
        {
          v30 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v38 != v30)
                objc_enumerationMutation(v25);
              objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v37 + 1) + 8 * i), v27, v28, v29, (_QWORD)v37);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34);

              if ((isEqual & 1) != 0)
              {
                LOBYTE(v15) = 1;
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v37, (uint64_t)v41, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_16:

      }
      else
      {
        LOBYTE(v15) = 1;
      }

    }
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_recordIDs(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDs(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CKObjectsAreBothNilOrEqual(v9, v13);

    if (v14
      && (objc_msgSend_zoneIDs(self, v15, v16, v17),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_zoneIDs(v5, v19, v20, v21),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = CKObjectsAreBothNilOrEqual(v18, v22),
          v22,
          v18,
          v23))
    {
      objc_msgSend_excludedZoneIDs(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_excludedZoneIDs(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
