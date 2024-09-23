@implementation CKDPCSCacheShareFetchOperation

- (id)itemTypeName
{
  return CFSTR("share");
}

- (BOOL)hasAllPCSData
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_sharePCSData(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_pcs(v3, v4, v5) != 0;

  return v6;
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  id v6;
  __CFString *v7;
  CKDPCSCacheShareFetchOperation *v8;
  _QWORD *v9;
  id *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  __CFString *v37;
  _BYTE v38[22];
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (id *)MEMORY[0x1E0C952B0];
  v11 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID(v8, v12, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsKeyID(v6, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR(" and error ");
    *(_DWORD *)v38 = 138544130;
    v27 = &stru_1E7838F48;
    *(_QWORD *)&v38[4] = v21;
    *(_WORD *)&v38[12] = 2114;
    if (v7)
      v27 = v7;
    else
      v26 = &stru_1E7838F48;
    *(_QWORD *)&v38[14] = v24;
    v39 = 2114;
    v40 = v26;
    v41 = 2112;
    v42 = v27;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Share PCS fetch operation %{public}@ received PCS data (%{public}@)%{public}@%@", v38, 0x2Au);

  }
  if ((objc_msgSend_didFetchData(v8, v14, v15) & 1) != 0)
  {
    if (*v9 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(v8, v18, v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharePCSData(v8, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsKeyID(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsKeyID(v6, v35, v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138544130;
      *(_QWORD *)&v38[4] = v28;
      *(_WORD *)&v38[12] = 2112;
      *(_QWORD *)&v38[14] = v34;
      v39 = 2112;
      v40 = v37;
      v41 = 2112;
      v42 = v7;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Share PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v38, 0x2Au);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setSharePCSData_(v8, v16, (uint64_t)v6);
      objc_msgSend_setDidFetchData_(v8, v20, 1);
    }
    objc_msgSend_setFetchError_(v8, v16, (uint64_t)v7, *(_OWORD *)v38);
  }
  objc_sync_exit(v8);

}

- (BOOL)_fetchPCSDataFromDatabase
{
  uint64_t v2;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v5;
    objc_msgSend_shareID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for share %@ from the database", buf, 0xCu);

  }
  objc_msgSend_cache(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEBFE8EC;
  v15[3] = &unk_1E782EE48;
  v15[4] = self;
  objc_msgSend_getSQLCache_(v8, v9, (uint64_t)v15);

  return 1;
}

- (BOOL)_fetchPCSDataFromServer
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  _QWORD v19[5];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAggregator(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentOperation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEBFF020;
  v19[3] = &unk_1E78377A0;
  v19[4] = self;
  objc_msgSend_requestFetchOfShareWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_decryptPCS
{
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  objc_initWeak(&location, self);
  if ((objc_msgSend_wasFetchedFromCache(self, v3, v4) & 1) != 0)
  {
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v7);

    objc_msgSend_cache(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1BEBFF3D4;
    v34[3] = &unk_1E78309E8;
    v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithSharePCSData_forShareWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v22);

    objc_msgSend_cache(self, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(self, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareID(self, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEBFF390;
    v36[3] = &unk_1E78309E8;
    v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

@end
