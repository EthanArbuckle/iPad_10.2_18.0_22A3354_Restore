@implementation CKDPCSCacheFetchOperation

- (CKDPCSCacheFetchOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  dispatch_group_t v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDPCSCacheFetchOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v21, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_itemID(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v9 + 60);
    *((_QWORD *)v9 + 60) = v10;

    objc_msgSend_cache(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v9 + 59);
    *((_QWORD *)v9 + 59) = v14;

    *((_QWORD *)v9 + 61) = objc_msgSend_options(v6, v16, v17);
    v18 = dispatch_group_create();
    v19 = (void *)*((_QWORD *)v9 + 58);
    *((_QWORD *)v9 + 58) = v18;

    dispatch_group_enter(*((dispatch_group_t *)v9 + 58));
  }

  return (CKDPCSCacheFetchOperation *)v9;
}

- (BOOL)canBeUsedForOperation:(id)a3 withOptions:(unint64_t)a4
{
  int v4;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  char Options;
  const char *v24;
  uint64_t v25;
  char v26;
  const char *v27;
  uint64_t v28;

  v4 = a4;
  v6 = a3;
  if (!objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(self, v7, (uint64_t)v6))
    goto LABEL_4;
  v10 = objc_msgSend_databaseScope(v6, v8, v9);
  if (v10 != objc_msgSend_databaseScope(self, v11, v12))
    goto LABEL_4;
  objc_msgSend_container(v6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v18 || (v4 & 4) != 0 && (objc_msgSend_fetchOptions(self, v19, v20) & 4) == 0)
    goto LABEL_4;
  if (((v4 & 8) == 0 || (objc_msgSend_fetchOptions(self, v19, v20) & 8) != 0)
    && ((Options = objc_msgSend_fetchOptions(self, v19, v20), (v4 & 2) != 0) || (Options & 2) == 0)
    && ((v26 = objc_msgSend_fetchOptions(self, v24, v25), (v4 & 0x10) != 0) || (v26 & 0x10) == 0))
  {
    v21 = ((objc_msgSend_fetchOptions(self, v27, v28) ^ v4) & 0x1C00) == 0;
  }
  else
  {
LABEL_4:
    v21 = 0;
  }

  return v21;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  CKDPCSCacheFetchOperation *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  int v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_hasAllPCSData(self, a2, v2))
  {
LABEL_4:
    switch(objc_msgSend_state(self, v4, v5))
    {
      case 1:
        goto LABEL_5;
      case 2:
        objc_msgSend_pcsData(self, v7, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = self;
        if (v14)
          goto LABEL_31;
        if ((objc_msgSend_fetchOptions(self, v15, v16) & 2) == 0)
        {
          objc_msgSend_setState_(self, v18, 3);
          LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__fetchPCSDataFromServer, v107);
          return v106;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v68 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          v95 = v68;
          objc_msgSend_itemTypeName(self, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_itemID(self, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v112 = v98;
          v113 = 2112;
          v114 = v101;
          _os_log_debug_impl(&dword_1BE990000, v95, OS_LOG_TYPE_DEBUG, "Not fetching PCS data for %{public}@ %@ from the network because a local only fetch was requested", buf, 0x16u);

        }
        objc_msgSend_fetchError(self, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_domain(v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = *MEMORY[0x1E0C94B20];
        if ((objc_msgSend_isEqualToString_(v74, v76, *MEMORY[0x1E0C94B20]) & 1) != 0)
        {
          objc_msgSend_fetchError(self, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend_code(v79, v80, v81);

          if (v82 == 5010)
            goto LABEL_47;
        }
        else
        {

        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v83, v75, 5007, CFSTR("PCS fetch requested local cache only"));
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFetchError_(self, v94, (uint64_t)v34);
        goto LABEL_46;
      case 3:
        objc_msgSend_fetchError(self, v7, v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = self;
        if (v19)
        {
          objc_msgSend_fetchError(self, v15, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v24 = (void *)MEMORY[0x1E0C94FF8];
            v25 = *MEMORY[0x1E0C94B20];
            objc_msgSend_itemTypeName(self, v22, v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_itemID(self, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v24, v30, v25, 2003, CFSTR("Couldn't get PCS data from the server for %@ %@"), v26, v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFetchError_(self, v32, (uint64_t)v31);

          }
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v33 = (void *)*MEMORY[0x1E0C952D8];
          v106 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG);
          if (v106)
          {
            v34 = v33;
            objc_msgSend_itemTypeName(self, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_itemID(self, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fetchError(self, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v112 = v37;
            v113 = 2112;
            v114 = v40;
            v115 = 2112;
            v116 = v43;
            _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Failed to fetch PCS data from the server for %{public}@ %@: %@", buf, 0x20u);

LABEL_46:
LABEL_47:
            LOBYTE(v106) = 0;
          }
        }
        else
        {
LABEL_31:
          objc_msgSend_setState_(v17, v15, 4);
          LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__createAdditionalPCS, v102);
        }
        return v106;
      case 4:
        objc_msgSend_setState_(self, v7, 5);
        LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__fetchDependentPCS, v104);
        return v106;
      case 5:
        objc_msgSend_setState_(self, v7, 6);
        LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__decryptPCS, v103);
        return v106;
      case 6:
        objc_msgSend_fetchError(self, v7, v8);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          objc_msgSend_setState_(self, v45, 7);
          LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__saveUpdatedPCSToServer, v109);
          return v106;
        }
        if (objc_msgSend_shouldRetry(self, v45, v46))
        {
          v49 = objc_msgSend_numRetries(self, v47, v48);
          objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend_PCSRetryCount(v52, v53, v54);

          if (v49 < v55)
          {
            objc_msgSend__willRetryFetch(self, v47, v48);
LABEL_5:
            objc_msgSend_setState_(self, v7, 2);
            LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__fetchPCSDataFromDatabase, v105);
            return v106;
          }
        }
        objc_msgSend_fetchError(self, v47, v48);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(self, v57, (uint64_t)v56);

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v58 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          v12 = v58;
          objc_msgSend_itemTypeName(self, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationID(self, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_error(self, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v112 = v61;
          v113 = 2114;
          v114 = v64;
          v115 = 2112;
          v116 = v67;
          _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ PCS fetch operation %{public}@ has failed too many times. Giving up with error %@", buf, 0x20u);

          goto LABEL_11;
        }
        break;
      case 7:
        objc_msgSend_setState_(self, v7, 8);
        LOBYTE(v106) = MEMORY[0x1E0DE7D20](self, sel__savePCSDataToCache, v108);
        return v106;
      case 8:
        goto LABEL_10;
      default:
        goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend_state(self, v4, v5) <= 7)
  {
    objc_msgSend_setState_(self, v6, 7);
    goto LABEL_4;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v84 = v9;
    objc_msgSend_operationID(self, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemTypeName(self, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemID(self, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v112 = v87;
    v113 = 2114;
    v114 = v90;
    v115 = 2112;
    v116 = v93;
    _os_log_debug_impl(&dword_1BE990000, v84, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has a decrypted PCS blob for %{public}@ %@.", buf, 0x20u);

  }
LABEL_10:
  objc_msgSend_setState_(self, v7, 0xFFFFFFFFLL);
  objc_msgSend_error(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v13, (uint64_t)v12);
LABEL_11:

LABEL_12:
  LOBYTE(v106) = 1;
  return v106;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 7)
    return off_1E7837090[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDPCSCacheFetchOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)itemTypeName
{
  return (NSString *)CFSTR("item");
}

- (BOOL)hasAllPCSData
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_pcsData(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_pcs(v3, v4, v5) != 0;

  return v6;
}

- (BOOL)needsAdditionalPCSCreation
{
  return 0;
}

- (BOOL)_fetchPCSDataFromDatabase
{
  return 1;
}

- (BOOL)_fetchPCSDataFromServer
{
  return 1;
}

- (BOOL)_createAdditionalPCS
{
  return 1;
}

- (BOOL)_fetchDependentPCS
{
  return 1;
}

- (BOOL)_decryptPCS
{
  return 1;
}

- (BOOL)_saveUpdatedPCSToServer
{
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  return 1;
}

- (void)_willRetryFetch
{
  uint64_t v2;
  int v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_numRetries(self, a2, v2);
  objc_msgSend_setNumRetries_(self, v5, (v4 + 1));
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v13 = v6;
    objc_msgSend_operationID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_numRetries(self, v17, v18);
    objc_msgSend_fetchError(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dependentPCSFetchError(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544130;
    v27 = v16;
    v28 = 1024;
    v29 = v19;
    v30 = 2112;
    v31 = v22;
    v32 = 2112;
    v33 = v25;
    _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Retrying PCS fetch operation %{public}@ after failure %d with error %@, dependent PCS fetch error %@", (uint8_t *)&v26, 0x26u);

  }
  objc_msgSend_setFetchError_(self, v7, 0);
  objc_msgSend_setDependentPCSFetchError_(self, v8, 0);
  objc_msgSend_setPcsData_(self, v9, 0);
  objc_msgSend_setDidFetchData_(self, v10, 0);
  objc_msgSend_setWasFetchedFromCache_(self, v11, 0);
  objc_msgSend_setShouldRetry_(self, v12, 0);
}

- (void)main
{
  uint64_t v2;
  const char *v4;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_error(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_fetchError(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v13, (uint64_t)v12);

  }
  objc_msgSend_error(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend_setPcsData_(self, v15, 0);
  v19.receiver = self;
  v19.super_class = (Class)CKDPCSCacheFetchOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v19, sel__finishOnCallbackQueueWithError_, v4);
  objc_msgSend_fetchGroup(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v18);

}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (CKDPCSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (CKSQLiteItem)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (unint64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)setFetchOptions:(unint64_t)a3
{
  self->_fetchOptions = a3;
}

- (CKDPCSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
  objc_storeStrong((id *)&self->_pcsData, a3);
}

- (BOOL)didFetchData
{
  return self->_didFetchData;
}

- (void)setDidFetchData:(BOOL)a3
{
  self->_didFetchData = a3;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (NSError)dependentPCSFetchError
{
  return self->_dependentPCSFetchError;
}

- (void)setDependentPCSFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_dependentPCSFetchError, a3);
}

- (BOOL)wasFetchedFromCache
{
  return self->_wasFetchedFromCache;
}

- (void)setWasFetchedFromCache:(BOOL)a3
{
  self->_wasFetchedFromCache = a3;
}

- (int)numRetries
{
  return self->_numRetries;
}

- (void)setNumRetries:(int)a3
{
  self->_numRetries = a3;
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (CKDRecordPCSData)parentPCSData
{
  return self->_parentPCSData;
}

- (void)setParentPCSData:(id)a3
{
  objc_storeStrong((id *)&self->_parentPCSData, a3);
}

- (BOOL)isPCSDataInvalidated
{
  return self->_pcsDataInvalidated;
}

- (void)setPcsDataInvalidated:(BOOL)a3
{
  self->_pcsDataInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPCSData, 0);
  objc_storeStrong((id *)&self->_dependentPCSFetchError, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_pcsData, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
}

@end
