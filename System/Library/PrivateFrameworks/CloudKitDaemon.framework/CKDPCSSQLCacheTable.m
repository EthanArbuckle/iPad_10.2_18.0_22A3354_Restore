@implementation CKDPCSSQLCacheTable

+ (id)dbProperties
{
  return &unk_1E78AFEB0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (double)cacheValidTime
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSCacheValidTime(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (CKDPCSSQLCacheTable)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (void *)objc_opt_class();
  objc_msgSend_cacheValidTime(v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CKDPCSSQLCacheTable;
  return -[CKSQLiteCacheTable initWithLogicalTableName:entryCountLimit:dataSizeLimit:expirationTime:expireDelay:](&v7, sel_initWithLogicalTableName_entryCountLimit_dataSizeLimit_expirationTime_expireDelay_, CFSTR("PCSCache"), 1000, 0x100000);
}

- (id)deletePCSDataForZone:(id)a3 account:(id)a4 serviceName:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v12 = a5;
  v19[0] = CFSTR("ZONE");
  v19[1] = CFSTR("ACCOUNT");
  v20[0] = v8;
  v20[1] = v9;
  v19[2] = CFSTR("SERVICE");
  v13 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  v18 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v14, (uint64_t)v15, off_1E7837F18, &v18, &unk_1E7837F30);
  v16 = v18;

  return v16;
}

- (id)deletePCSDataForShare:(id)a3 account:(id)a4 serviceName:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v12 = a5;
  v19[0] = CFSTR("SHARE");
  v19[1] = CFSTR("ACCOUNT");
  v20[0] = v8;
  v20[1] = v9;
  v19[2] = CFSTR("SERVICE");
  v13 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  v18 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v14, (uint64_t)v15, off_1E7837F50, &v18, &unk_1E7837F68);
  v16 = v18;

  return v16;
}

- (id)deletePCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  id v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v28[0] = v12;
  v27[0] = CFSTR("IDENTIFIER");
  v27[1] = CFSTR("SCOPE");
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  v27[2] = CFSTR("TYPE");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v17, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v28[3] = v13;
  v27[3] = CFSTR("ACCOUNT");
  v27[4] = CFSTR("SERVICE");
  v21 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v28, v27, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)

  v26 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v23, (uint64_t)v22, off_1E7837F88, &v26, &unk_1E7837FA0);
  v24 = v26;

  return v24;
}

- (id)PCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7
{
  id v12;
  id v13;
  id v14;
  CKDPCSSQLCacheEntry *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  id v31;
  void *v32;
  uint8_t v34[16];

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(CKDPCSSQLCacheEntry);
  objc_msgSend_setIdentifier_(v15, v16, (uint64_t)v12);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDatabaseScope_(v15, v19, (uint64_t)v18);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setItemType_(v15, v22, (uint64_t)v21);

  objc_msgSend_setAccountID_(v15, v23, (uint64_t)v13);
  objc_msgSend_setServiceName_(v15, v24, (uint64_t)v14);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v25, (uint64_t)&unk_1E78AF4B0, v15, &unk_1E78AF4C8, off_1E7837FC0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (objc_msgSend_CKIsNoUniqueRowError_(MEMORY[0x1E0CB35C8], v26, (uint64_t)v28))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_fault_impl(&dword_1BE990000, v29, OS_LOG_TYPE_FAULT, "Found multiple matching PCS cache database entries. Removing them.", v34, 2u);
      }
      v31 = (id)objc_msgSend_deletePCSDataForID_databaseScope_itemType_accountID_serviceName_(self, v30, (uint64_t)v12, a4, a5, v13, v14);
    }
    v32 = 0;
  }
  else
  {
    objc_msgSend_CKDPCSData(v15, v26, v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v32;
}

@end
