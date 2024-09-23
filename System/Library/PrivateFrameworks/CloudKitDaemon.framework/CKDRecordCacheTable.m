@implementation CKDRecordCacheTable

+ (id)dbProperties
{
  return &unk_1E78AF550;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDRecordCacheTable)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  CKDRecordCacheTable *v17;
  objc_super v19;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_recordCacheEntryCountLimit(v4, v5, v6);
  v10 = objc_msgSend_recordCacheSizeLimit(v4, v8, v9);
  v13 = (double)(int)objc_msgSend_cachedRecordExpiryTime(v4, v11, v12);
  objc_msgSend_recordCacheExpireDelay(v4, v14, v15);
  v19.receiver = self;
  v19.super_class = (Class)CKDRecordCacheTable;
  v17 = -[CKSQLiteCacheTable initWithLogicalTableName:entryCountLimit:dataSizeLimit:expirationTime:expireDelay:](&v19, sel_initWithLogicalTableName_entryCountLimit_dataSizeLimit_expirationTime_expireDelay_, CFSTR("RecordCache"), v7, v10, v13, v16);

  return v17;
}

- (id)_dsidForAccount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend_accountType(v3, v4, v5) == 1)
  {
    v8 = CFSTR("Anonymous");
  }
  else
  {
    objc_msgSend_dsid(v3, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = (__CFString *)v9;
    else
      v8 = CFSTR("Unknown");
  }

  return v8;
}

- (BOOL)_cachedRecordKnownUserKeyData:(id)a3 satisfiesRequiredKeys:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char v17;
  char isSubsetOfSet;
  char isKindOfClass;
  const char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = a4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        if ((CKIsIndexedArrayKey() & 1) != 0)
        {

          isSubsetOfSet = 0;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend_null(MEMORY[0x1E0C99E38], v13, v14, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_containsObject_(v5, v16, (uint64_t)v15);

  if ((v17 & 1) != 0)
  {
    isSubsetOfSet = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    isSubsetOfSet = 0;
    if (v6 && (isKindOfClass & 1) != 0)
      isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v6, v21, (uint64_t)v5);
  }
LABEL_12:

  return isSubsetOfSet;
}

- (BOOL)_cachedRecordHasValidAssets:(id)a3 forRequiredKeys:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1BE9BAEE8;
  v39 = sub_1BE9BAD28;
  v40 = 0;
  objc_msgSend_valueStore(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v46, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEA0B2DC;
  v31[3] = &unk_1E782E5E8;
  v12 = v6;
  v32 = v12;
  v33 = &v35;
  v34 = &v41;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v9, v13, (uint64_t)v11, v31);

  if (*((_BYTE *)v42 + 24) && objc_msgSend_count((void *)v36[5], v14, v15))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = (id)v36[5];
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v27, v45, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend_paddedFileSize(v23, v18, v19, (_QWORD)v27))
          {
            *((_BYTE *)v42 + 24) = 0;
            goto LABEL_13;
          }
          objc_msgSend_setWasCached_(v23, v24, 1);
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v27, v45, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_13:

  }
  v25 = *((_BYTE *)v42 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

- (id)fetchCacheEntryRecordData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_primaryKeyProperties(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v8, (uint64_t)&unk_1E78AF180, v4, v7, off_1E782E608);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
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
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  const char *v38;
  id v39;
  id v40;
  void *v42;
  const char *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  int64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[4];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v44 = a5;
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v44);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 192, CFSTR("Can't fetch a record if we don't have a recordID"));

  }
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1BE9BAEE8;
  v57 = sub_1BE9BAD28;
  v58 = 0;
  objc_msgSend_account(v12, v13, v14, v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dsidForAccount_(self, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v59[0] = CFSTR("RECORDID");
  objc_msgSend_sqliteRepresentation(v11, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v20;
  v59[1] = CFSTR("ENVIRONMENT");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_containerID(v12, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_environment(v24, v25, v26);
  objc_msgSend_numberWithInteger_(v21, v28, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v29;
  v59[2] = CFSTR("SCOPE");
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v30, a6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = CFSTR("DSID");
  v60[2] = v31;
  v60[3] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v60, v59, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1BEA0B728;
  v46[3] = &unk_1E782E680;
  v46[4] = self;
  v34 = v33;
  v47 = v34;
  v35 = v45;
  v48 = v35;
  v36 = v12;
  v49 = v36;
  v51 = &v53;
  v52 = a6;
  v37 = v11;
  v50 = v37;
  v39 = (id)objc_msgSend_performInTransaction_(self, v38, (uint64_t)v46);
  v40 = (id)v54[5];

  _Block_object_dispose(&v53, 8);
  return v40;
}

- (id)_trimRecord:(id)a3 toRequiredKeys:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend_setTrackChanges_(v5, v6, 0);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend_valuesByKey(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v43, v48, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v13);
          v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v7, v16, v20) & 1) == 0)
            objc_msgSend_setObject_forKeyedSubscript_(v5, v16, 0, v20);
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v43, v48, 16);
      }
      while (v17);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend_encryptedValues(v5, v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, v47, 16);
    if (v28)
    {
      v30 = v28;
      v31 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(v26);
          v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          if ((objc_msgSend_containsObject_(v7, v29, v33) & 1) == 0)
          {
            objc_msgSend_encryptedValues(v5, v29, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v35, v36, 0, v33);

          }
        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, v47, 16);
      }
      while (v30);
    }

    objc_msgSend_setTrackChanges_(v5, v37, 1);
  }

  return v5;
}

- (id)recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  id v25;
  void *v27;
  const char *v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if ((v19 & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 269, CFSTR("Expected a recordID"));

    }
    objc_msgSend__recordWithID_container_requiredKeys_scope_(self, v20, (uint64_t)v11, v12, v13, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend__cachedRecordHasValidAssets_forRequiredKeys_(self, v23, (uint64_t)v22, v13) & 1) == 0)
    {

      v22 = 0;
    }
    v25 = (id)objc_msgSend__trimRecord_toRequiredKeys_(self, v24, (uint64_t)v22, v13);
  }

  return v22;
}

- (id)recordsWithIDs:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  CKDRecordCacheTable *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  CKDRecordCacheTable *v63;
  const char *v64;
  id v65;
  void *v66;
  void *v68;
  const char *v69;
  int64_t v70;
  void *v71;
  id v72;
  void *v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  int64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[3];
  _QWORD v87[3];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if ((v19 & 1) != 0)
  {
    v22 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v73 = v13;
    if (!objc_msgSend_count(v11, v20, v21))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v68, v69, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 285, CFSTR("Expected recordIDs"));

    }
    v71 = (void *)objc_opt_new();
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v28 = objc_msgSend_count(v11, v26, v27);
    v30 = (void *)objc_msgSend_initWithCapacity_(v25, v29, v28);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v31 = v11;
    v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v82, v88, 16);
    if (v33)
    {
      v36 = v33;
      v37 = *(_QWORD *)v83;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v83 != v37)
            objc_enumerationMutation(v31);
          objc_msgSend_sqliteRepresentation(*(void **)(*((_QWORD *)&v82 + 1) + 8 * v38), v34, v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v30, v40, (uint64_t)v39);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v82, v88, 16);
      }
      while (v36);
    }

    v86[0] = CFSTR("ENVIRONMENT");
    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_containerID(v12, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_environment(v44, v45, v46);
    objc_msgSend_numberWithInteger_(v41, v48, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v49;
    v86[1] = CFSTR("SCOPE");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v50, a6);
    v70 = a6;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v51;
    v86[2] = CFSTR("DSID");
    objc_msgSend_account(v12, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__dsidForAccount_(self, v55, (uint64_t)v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v56;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)v87, v86, 3);
    v72 = v11;
    v58 = self;
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = sub_1BEA0C200;
    v74[3] = &unk_1E782E6D0;
    v74[4] = v58;
    v75 = v59;
    v76 = v30;
    v13 = v73;
    v77 = v73;
    v78 = v12;
    v81 = v70;
    v79 = v31;
    v60 = v71;
    v80 = v60;
    v61 = v30;
    v62 = v59;
    v63 = v58;
    v11 = v72;
    v65 = (id)objc_msgSend_performInTransaction_(v63, v64, (uint64_t)v74);
    v66 = v80;
    v22 = v60;

  }
  return v22;
}

- (unint64_t)numberOfRecordsWithID:(id)a3 container:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  unint64_t v29;
  void *v31;
  const char *v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v10 = a4;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 364, CFSTR("Only suitable for testing"));

  }
  v33[0] = CFSTR("RECORDID");
  objc_msgSend_sqliteRepresentation(v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  v33[1] = CFSTR("ENVIRONMENT");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_containerID(v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_environment(v15, v16, v17);
  objc_msgSend_numberWithInteger_(v12, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v20;
  v33[2] = CFSTR("DSID");
  objc_msgSend_account(v10, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dsidForAccount_(self, v24, (uint64_t)v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v25;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)v34, v33, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend_countOfEntriesMatching_label_error_predicate_(self, v28, (uint64_t)v27, off_1E782E6F0, 0, &unk_1E782E728);
  return v29;
}

- (void)addRecord:(id)a3 container:(id)a4 knownUserKeys:(id)a5 scope:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  char v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  CKDProtocolTranslator *v59;
  const char *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  CKDRecordCacheEntry *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  const char *v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  id v124;
  void *v125;
  CKDRecordCacheEntry *v126;
  id v127;
  const char *v128;
  id v129;
  const char *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  void *v144;
  const char *v145;
  unsigned int v146;
  void *v147;
  unsigned int v148;
  void *v149;
  _QWORD v150[5];
  CKDRecordCacheEntry *v151;
  id v152;
  _QWORD v153[5];
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  char v157;
  uint8_t buf[4];
  void *v159;
  __int16 v160;
  void *v161;
  _QWORD v162[5];

  v162[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if ((v19 & 1) == 0)
  {
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v136, v137, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 381, CFSTR("Null record"));

    }
    objc_msgSend_recordID(v11, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v138, v139, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 382, CFSTR("Null recordID"));

    }
    objc_msgSend_recordID(v11, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v29, v30);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v140, v141, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 383, CFSTR("Null recordName"));

    }
    objc_msgSend_recordID(v11, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v35, v36);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v142, v143, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 384, CFSTR("Null zoneID"));

    }
    objc_msgSend_etag(v11, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v38, v39);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v144, v145, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 385, CFSTR("Null etag"));

    }
    v154 = 0;
    v155 = &v154;
    v156 = 0x2020000000;
    v157 = 0;
    objc_msgSend_valueStore(v11, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v162[0] = objc_opt_class();
    v162[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v162, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_containsValueOfClasses_passingTest_(v40, v43, (uint64_t)v42, &unk_1E782E768);

    v157 = v44;
    v153[0] = MEMORY[0x1E0C809B0];
    v153[1] = 3221225472;
    v153[2] = sub_1BEA0D138;
    v153[3] = &unk_1E782E790;
    v153[4] = &v154;
    objc_msgSend_enumerateObjectsUsingBlock_(v13, v45, (uint64_t)v153);
    if (!*((_BYTE *)v155 + 24))
    {
      v148 = objc_msgSend_serializeProtectionData(v11, v46, v47);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v146 = objc_msgSend_serializePersonalInfo(v11, v48, v49);
        objc_msgSend_setSerializePersonalInfo_(v11, v50, 1);
      }
      else
      {
        v146 = 0;
      }
      objc_msgSend_setSerializeProtectionData_(v11, v48, 1);
      if (!v13)
      {
        v53 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend_null(MEMORY[0x1E0C99E38], v51, v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithObject_(v53, v55, (uint64_t)v54);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v56 = (id)*MEMORY[0x1E0C952E8];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(v11, v57, v58);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_etag(v11, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v159 = v132;
        v160 = 2114;
        v161 = v135;
        _os_log_debug_impl(&dword_1BE990000, v56, OS_LOG_TYPE_DEBUG, "Adding recordID %@ with etag %{public}@ to cache", buf, 0x16u);

      }
      v59 = [CKDProtocolTranslator alloc];
      v147 = (void *)objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v59, v60, (uint64_t)v12, a6, 0);
      objc_msgSend_pRecordFromRecord_forCache_(v147, v61, (uint64_t)v11, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataRepresentation(v62, v63, v64);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = objc_alloc_init(CKDRecordCacheEntry);
      objc_msgSend_recordID(v11, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sqliteRepresentation(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRecordID_(v65, v72, (uint64_t)v71);

      objc_msgSend_zoneID(v68, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sqliteRepresentation(v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneIdentifier_(v65, v79, (uint64_t)v78);

      v80 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_containerID(v12, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_environment(v83, v84, v85);
      objc_msgSend_numberWithInteger_(v80, v87, v86);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEnvironment_(v65, v89, (uint64_t)v88);

      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v90, a6);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDatabaseScope_(v65, v92, (uint64_t)v91);

      objc_msgSend_etag(v11, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEtag_(v65, v96, (uint64_t)v95);

      v97 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend_cacheExpirationTime(self, v98, v99);
      v102 = (void *)objc_msgSend_initWithTimeIntervalSinceNow_(v97, v100, v101);
      objc_msgSend_setExpirationDate_(v65, v103, (uint64_t)v102);

      objc_msgSend_setRecordData_(v65, v104, (uint64_t)v149);
      objc_msgSend_setKnownUserKeys_(v65, v105, (uint64_t)v13);
      objc_msgSend_account(v12, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__dsidForAccount_(self, v109, (uint64_t)v108);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDsid_(v65, v111, (uint64_t)v110);

      v114 = objc_msgSend_length(v149, v112, v113);
      objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v115, v114);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSize_(v65, v117, (uint64_t)v116);

      objc_msgSend_modificationDate(v11, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v120;
      if (v120)
      {
        v124 = v120;
      }
      else
      {
        objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v121, v122);
        v124 = (id)objc_claimAutoreleasedReturnValue();
      }
      v125 = v124;

      v150[0] = MEMORY[0x1E0C809B0];
      v150[1] = 3221225472;
      v150[2] = sub_1BEA0D178;
      v150[3] = &unk_1E782E7D0;
      v150[4] = self;
      v126 = v65;
      v151 = v126;
      v127 = v125;
      v152 = v127;
      v129 = (id)objc_msgSend_performTransaction_(self, v128, (uint64_t)v150);
      objc_msgSend_setSerializeProtectionData_(v11, v130, v148);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setSerializePersonalInfo_(v11, v131, v146);

    }
    _Block_object_dispose(&v154, 8);
  }

}

- (id)etagForRecordID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  id v47;
  const char *v48;
  id v49;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[4];
  _QWORD v69[6];

  v69[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v57 = a5;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_disableCaching(v15, v16, v17);

  if ((v18 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 472, CFSTR("Expected a recordID"));

    }
    objc_msgSend_recordName(v11, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 473, CFSTR("Expected a recordName"));

    }
    objc_msgSend_zoneID(v11, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 474, CFSTR("Expected a zoneID"));

    }
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_1BE9BAEE8;
    v66 = sub_1BE9BAD28;
    v67 = 0;
    v68[0] = CFSTR("RECORDID");
    objc_msgSend_sqliteRepresentation(v11, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v28;
    v68[1] = CFSTR("ENVIRONMENT");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_containerID(v12, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_environment(v32, v33, v34);
    objc_msgSend_numberWithInteger_(v29, v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v37;
    v68[2] = CFSTR("SCOPE");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v38, a6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v39;
    v68[3] = CFSTR("DSID");
    objc_msgSend_account(v12, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__dsidForAccount_(self, v43, (uint64_t)v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)v69, v68, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_1BEA0D5E0;
    v58[3] = &unk_1E782E830;
    v58[4] = self;
    v47 = v46;
    v59 = v47;
    v60 = v57;
    v61 = &v62;
    v49 = (id)objc_msgSend_performInTransaction_(self, v48, (uint64_t)v58);
    v21 = (id)v63[5];

    _Block_object_dispose(&v62, 8);
  }

  return v21;
}

- (void)deleteRecordWithID:(id)a3 scope:(int64_t)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_disableCaching(v10, v11, v12);

  if ((v13 & 1) == 0)
  {
    if (!v7)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 508, CFSTR("Expected a objectID"));

    }
    objc_msgSend_recordName(v7, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 509, CFSTR("Expected a recordName"));

    }
    objc_msgSend_zoneID(v7, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 510, CFSTR("Expected a zoneID"));

    }
    v34[0] = CFSTR("RECORDID");
    objc_msgSend_sqliteRepresentation(v7, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("SCOPE");
    v35[0] = v22;
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v23, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v35, v34, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v27, (uint64_t)v26, off_1E782E850, 0, &unk_1E782E868);
  }

}

- (void)clearAllRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  const char *v8;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_disableCaching(v4, v5, v6);

  if ((v7 & 1) == 0)
    objc_msgSend_deleteAllEntries_(self, v8, 0);
}

- (void)clearAllRecordsInScope:(int64_t)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  char v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_disableCaching(v6, v7, v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend_db(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDRecordCache.m"), 531, CFSTR("Expected non-nil db for %@"), self);

    }
    v21 = CFSTR("SCOPE");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v18, (uint64_t)v17, off_1E782E888, 0, &unk_1E782E8A0);
  }
}

- (void)clearAllRecordsForZoneWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_disableCaching(v7, v8, v9);

  if (v4 && (v10 & 1) == 0)
  {
    v17 = CFSTR("ZONEID");
    objc_msgSend_sqliteRepresentation(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v16, (uint64_t)v15, off_1E782E8C0, 0, &unk_1E782E8D8);
  }

}

- (void)clearAssetAuthTokensForRecordWithID:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v8;
  const char *v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  if (v8)
  {
    v26[0] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordsWithIDs_container_requiredKeys_scope_(self, v12, (uint64_t)v11, v10, 0, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v13;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v25, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v14);
          objc_msgSend_clearAssetAuthTokensForRecord_container_scope_(self, v17, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v10, a5, (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v21, v25, 16);
      }
      while (v18);
    }

  }
}

- (void)clearAssetAuthTokensForRecord:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  char isKindOfClass;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  id v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend_allKeys(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v53, v58, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v54;
    v47 = *(_QWORD *)v54;
    v48 = v9;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v6, v12, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_setAuthToken_(v17, v18, 0);
          objc_msgSend_setObject_forKeyedSubscript_(v6, v19, (uint64_t)v17, v16);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend_count(v17, v20, v21))
            {
              objc_msgSend_objectAtIndex_(v17, v22, 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                v27 = (void *)objc_msgSend_mutableCopy(v17, v25, v26);
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v28 = v17;
                v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v49, v57, 16);
                if (v30)
                {
                  v32 = v30;
                  v33 = *(_QWORD *)v50;
                  do
                  {
                    for (j = 0; j != v32; ++j)
                    {
                      if (*(_QWORD *)v50 != v33)
                        objc_enumerationMutation(v28);
                      v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                      objc_msgSend_setAuthToken_(v35, v31, 0);
                      objc_msgSend_addObject_(v27, v36, (uint64_t)v35);
                    }
                    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v49, v57, 16);
                  }
                  while (v32);
                }

                v14 = v47;
                v9 = v48;
              }
            }
          }
        }

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v53, v58, 16);
    }
    while (v13);
  }

  if (v6)
  {
    v39 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_allKeys(v6, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v39, v41, (uint64_t)v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addRecord_container_knownUserKeys_scope_(self, v43, (uint64_t)v6, v46, v42, a5);

  }
}

@end
