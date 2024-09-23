@implementation CKSyncEngineFetchChangesScope

- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(NSSet *)zoneIDs
{
  NSSet *v4;
  void *v5;
  const char *v6;
  CKSyncEngineFetchChangesScope *v7;

  v4 = zoneIDs;
  v5 = (void *)objc_opt_new();
  v7 = (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, v6, (uint64_t)v4, (uint64_t)v5);

  return v7;
}

- (CKSyncEngineFetchChangesScope)initWithZoneIDs:(id)a3 excludedZoneIDs:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKSyncEngineFetchChangesScope *v11;
  uint64_t v12;
  NSSet *zoneIDs;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *excludedZoneIDs;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKSyncEngineFetchChangesScope;
  v11 = -[CKSyncEngineFetchChangesScope init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    zoneIDs = v11->_zoneIDs;
    v11->_zoneIDs = (NSSet *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    excludedZoneIDs = v11->_excludedZoneIDs;
    v11->_excludedZoneIDs = (NSSet *)v17;

  }
  return v11;
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
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  __CFString *v35;

  objc_msgSend_zoneIDs(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v5)
  {
    objc_msgSend_allObjects(v5, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v14, v15, (uint64_t)&unk_1E1F58578, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v17, v19, (uint64_t)CFSTR(", "), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v22, (uint64_t)CFSTR("zoneIDs(%@)"), v23, v21);
  }
  else
  {
    if (!objc_msgSend_count(v9, v10, v11, v12))
    {
      v35 = CFSTR("all");
      goto LABEL_6;
    }
    objc_msgSend_allObjects(v13, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v27, v28, (uint64_t)&unk_1E1F62EA8, v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v17, v31, (uint64_t)CFSTR(", "), v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v30, v33, (uint64_t)CFSTR("allExcluding(%@)"), v34, v21);
  }
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v35;
}

- (NSSet)excludedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedZoneIDs, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

- (BOOL)containsZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;

  v4 = a3;
  objc_msgSend_zoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(self, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !objc_msgSend_containsObject_(v8, v12, (uint64_t)v4, v13))
    LOBYTE(v15) = 0;
  else
    v15 = objc_msgSend_containsObject_(v14, v12, (uint64_t)v4, v13) ^ 1;

  return v15;
}

- (CKSyncEngineFetchChangesScope)init
{
  void *v3;
  const char *v4;
  CKSyncEngineFetchChangesScope *v5;

  v3 = (void *)objc_opt_new();
  v5 = (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, v4, 0, (uint64_t)v3);

  return v5;
}

- (CKSyncEngineFetchChangesScope)initWithExcludedZoneIDs:(NSSet *)zoneIDs
{
  return (CKSyncEngineFetchChangesScope *)objc_msgSend_initWithZoneIDs_excludedZoneIDs_(self, a2, 0, (uint64_t)zoneIDs);
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
  char v22;

  v4 = a3;
  objc_msgSend_zoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneIDs(v4, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_excludedZoneIDs(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_scopeWithZoneIDs_recordIDs_excludedZoneIDs_containsScopeWithZoneIDs_recordIDs_excludedZoneIDs_(CKSyncEngineFetchChangesScope, v21, (uint64_t)v8, 0, v12, v16, 0, v20);
  return v22;
}

+ (CKSyncEngineFetchChangesScope)scopeWithZoneIDs:(id)a3 recordIDs:(id)a4 excludedZoneIDs:(id)a5 containsScopeWithZoneIDs:(id)a6 recordIDs:(id)a7 excludedZoneIDs:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  char v65;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v22 = v18;
  if (v13)
  {
    if (v16)
    {
      if ((objc_msgSend_isSubsetOfSet_(v16, v19, (uint64_t)v13, v21) & 1) == 0)
        goto LABEL_44;
    }
    else
    {
      if (!v17)
      {
        if (!objc_msgSend_count(v18, v19, v20, v21)
          || (objc_msgSend_intersectsSet_(v22, v41, (uint64_t)v13, v42) & 1) != 0)
        {
          goto LABEL_44;
        }
        if (!objc_msgSend_count(v15, v43, v44, v45))
        {
          if (v14)
          {
LABEL_44:
            v40 = 0;
            goto LABEL_45;
          }
          goto LABEL_41;
        }
        goto LABEL_22;
      }
      v67 = v18;
      v68 = v14;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v23 = v17;
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v73, (uint64_t)v78, 16);
      if (v25)
      {
        v29 = v25;
        v30 = *(_QWORD *)v74;
LABEL_8:
        v31 = 0;
        while (1)
        {
          if (*(_QWORD *)v74 != v30)
            objc_enumerationMutation(v23);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v73 + 1) + 8 * v31), v26, v27, v28, v67, v68);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_containsObject_(v13, v33, (uint64_t)v32, v34);

          if (!v35)
            goto LABEL_42;
          if (v29 == ++v31)
          {
            v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v73, (uint64_t)v78, 16);
            if (v29)
              goto LABEL_8;
            break;
          }
        }
      }

      v22 = v67;
      v14 = v68;
    }
  }
  if (objc_msgSend_count(v15, v19, v20, v21, v67, v68))
  {
    if (v16)
    {
      v39 = 0;
      v40 = 0;
      if ((objc_msgSend_intersectsSet_(v15, v36, (uint64_t)v16, v38) & 1) != 0)
        goto LABEL_45;
      goto LABEL_23;
    }
LABEL_22:
    v39 = 1;
LABEL_23:
    if (objc_msgSend_count(v22, v36, v37, v38)
      && !objc_msgSend_isSubsetOfSet_(v15, v46, (uint64_t)v22, v48))
    {
      goto LABEL_44;
    }
    v49 = objc_msgSend_count(v22, v46, v47, v48);
    v53 = v39 ^ 1;
    if (v49)
      v53 = 1;
    if ((v53 & 1) == 0 && !objc_msgSend_count(v17, v50, v51, v52))
      goto LABEL_44;
    v67 = v22;
    v68 = v14;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v23 = v17;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v54, (uint64_t)&v69, (uint64_t)v77, 16);
    if (v55)
    {
      v59 = v55;
      v60 = *(_QWORD *)v70;
LABEL_31:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v60)
          objc_enumerationMutation(v23);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v69 + 1) + 8 * v61), v56, v57, v58, v67, v68, (_QWORD)v69);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend_containsObject_(v15, v63, (uint64_t)v62, v64);

        if ((v65 & 1) != 0)
          break;
        if (v59 == ++v61)
        {
          v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v56, (uint64_t)&v69, (uint64_t)v77, 16);
          if (v59)
            goto LABEL_31;
          goto LABEL_37;
        }
      }
LABEL_42:

      v40 = 0;
      v22 = v67;
      v14 = v68;
      goto LABEL_45;
    }
LABEL_37:

    v22 = v67;
    v14 = v68;
  }
  if (v14 && (!v17 || !objc_msgSend_isSubsetOfSet_(v17, v36, (uint64_t)v14, v38)))
    goto LABEL_44;
LABEL_41:
  v40 = 1;
LABEL_45:

  return (CKSyncEngineFetchChangesScope *)v40;
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
  char v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_zoneIDs(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneIDs(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CKObjectsAreBothNilOrEqual(v9, v13);

    if (v14)
    {
      objc_msgSend_excludedZoneIDs(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_excludedZoneIDs(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
