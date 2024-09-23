@implementation BCCloudSyncVersions

- (NSPersistentHistoryToken)historyToken
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  objc_msgSend_rawHistoryToken(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = objc_opt_class();
    v20 = 0;
    objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v8, v7, (uint64_t)v5, (uint64_t)&v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
    }
    else
    {
      BDSCloudKitLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_227E5A8A0((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return (NSPersistentHistoryToken *)v11;
}

- (void)setHistoryToken:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v7 = a3;
  if (!v7)
  {
    v9 = 0;
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v14 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v4, (uint64_t)v7, 1, (uint64_t)&v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_227E5A830((uint64_t)v9, (uint64_t)v4, v10, v5, v6, v11, v12, v13);
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend_setRawHistoryToken_(self, v4, (uint64_t)v8, v5, v6);

}

- (id)mutableCopy
{
  BCMutableCloudSyncVersions *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableCloudSyncVersions alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithCloudSyncVersions_, self, v4, v5);
}

- (void)configureFromSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a3;
  v9 = objc_msgSend_cloudVersion(v4, v5, v6, v7, v8);
  objc_msgSend_setCloudVersion_(self, v10, v9, v11, v12);
  v17 = objc_msgSend_localVersion(v4, v13, v14, v15, v16);
  objc_msgSend_setLocalVersion_(self, v18, v17, v19, v20);
  v25 = objc_msgSend_syncVersion(v4, v21, v22, v23, v24);
  objc_msgSend_setSyncVersion_(self, v26, v25, v27, v28);
  objc_msgSend_historyToken(v4, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHistoryToken_(self, v34, (uint64_t)v33, v35, v36);

  v41 = objc_msgSend_historyTokenOffset(v4, v37, v38, v39, v40);
  objc_msgSend_setHistoryTokenOffset_(self, v42, v41, v43, v44);
}

@end
