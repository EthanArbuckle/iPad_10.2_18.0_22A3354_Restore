@implementation CKDIdentityCacheTable

+ (id)dbProperties
{
  return &unk_1E78AF5C8;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)valuesDictionaryForLookupInfo:(id)a3 container:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend_containerID(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_directoryContext(v5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataSeparationHash(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = CFSTR("LOOKUPINFO");
  v22[1] = CFSTR("ID");
  v23[0] = v6;
  v23[1] = v12;
  v22[2] = CFSTR("HASH");
  v23[2] = v18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v23, v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)predicateForMatchingLookupInfoInContainer
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("lookupInfo = $LOOKUPINFO AND containerIdentifier = $ID AND dataSeparationHash = $HASH"));
}

- (void)deleteUserIdentityForLookupInfo:(id)a3 container:(id)a4
{
  const char *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend_valuesDictionaryForLookupInfo_container_(self, a2, (uint64_t)a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEA3F0D0;
  v7[3] = &unk_1E78304C0;
  v7[4] = self;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v5, (uint64_t)v6, off_1E78304A0, 0, v7);

}

- (id)insertUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKDIdentityCacheTableEntry *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  void *v39;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CKDIdentityCacheTableEntry);
  objc_msgSend_setLookupInfo_(v11, v12, (uint64_t)v9);

  objc_msgSend_containerID(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainerIdentifier_(v11, v19, (uint64_t)v18);

  objc_msgSend_directoryContext(v8, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataSeparationHash(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataSeparationHash_(v11, v26, (uint64_t)v25);

  v27 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicIdentitiesExpirationTimeout(v30, v31, v32);
  objc_msgSend_dateWithTimeIntervalSinceNow_(v27, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(v11, v36, (uint64_t)v35);

  objc_msgSend_setIdentity_(v11, v37, (uint64_t)v10);
  objc_msgSend_insertObject_(self, v38, (uint64_t)v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD v13[5];

  objc_msgSend_valuesDictionaryForLookupInfo_container_(self, a2, (uint64_t)a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEA3F2C8;
  v13[3] = &unk_1E782E6A8;
  v13[4] = self;
  objc_msgSend_entryWithValues_label_error_setupBlock_(self, v6, (uint64_t)v5, off_1E78304E0, 0, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identity(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsCached_(v10, v11, 1);

  return v10;
}

@end
