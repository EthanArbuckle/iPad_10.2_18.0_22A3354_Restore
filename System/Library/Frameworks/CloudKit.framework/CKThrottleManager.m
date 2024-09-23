@implementation CKThrottleManager

- (id)enforcedThrottleForCriteria:(id)a3 willSendRequest:(BOOL)a4 outThrottleError:(id *)a5
{
  _BOOL4 v6;
  id v8;
  _opaque_pthread_mutex_t *p_throttleLock;
  NSArray *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const __CFString *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  __CFString *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _opaque_pthread_mutex_t *v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  id *v90;
  _BOOL4 v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _QWORD v102[4];
  _QWORD v103[4];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  id v109;
  _BYTE v110[128];
  uint64_t v111;

  v6 = a4;
  v111 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v10 = self->_throttleList;
  v15 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v97, (uint64_t)v110, 16);
  if (!v15)
  {

    v17 = 0;
    v16 = 0;
    if (!v6)
      goto LABEL_46;
    goto LABEL_36;
  }
  v91 = v6;
  v90 = a5;
  v92 = 0;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v98;
  v19 = 0.0;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v98 != v18)
        objc_enumerationMutation(v10);
      v21 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend_isExpired(v21, v12, v13, v14))
      {
        if (!v17)
        {
          v24 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v28 = objc_msgSend_count(self->_throttleList, v25, v26, v27);
          v17 = (void *)objc_msgSend_initWithCapacity_(v24, v29, v28, v30);
        }
        objc_msgSend_addObject_(v17, v22, (uint64_t)v21, v23);
      }
      else if (objc_msgSend_appliesToCriteria_(v21, v22, (uint64_t)v8, v23))
      {
        if (!v16)
        {
          v31 = objc_msgSend_count(self->_throttleList, v12, v13, v14);
          v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v16 = (void *)objc_msgSend_initWithCapacity_(v32, v33, v31, v34);
        }
        objc_msgSend_addObject_(v16, v12, (uint64_t)v21, v14);
        objc_msgSend_delayUntilNextOperationAllowed(v21, v35, v36, v37);
        if (v38 > v19)
        {
          v39 = v38;
          v40 = v21;

          v92 = v40;
          v19 = v39;
        }
      }
    }
    v15 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v97, (uint64_t)v110, 16);
  }
  while (v15);

  if (v19 <= 0.0)
  {
    p_throttleLock = &self->_throttleLock;
    v15 = v92;
    if (!v91)
      goto LABEL_46;
LABEL_36:
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v58 = v16;
    v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v76, (uint64_t)&v93, (uint64_t)v101, 16);
    if (v77)
    {
      v81 = v77;
      v82 = p_throttleLock;
      v83 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v81; ++j)
        {
          if (*(_QWORD *)v94 != v83)
            objc_enumerationMutation(v58);
          v85 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          objc_msgSend_incrementSentRequestCount(v85, v78, v79, v80);
          objc_msgSend_noteDataChangeForThrottle_(self, v86, (uint64_t)v85, v87);
        }
        v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v78, (uint64_t)&v93, (uint64_t)v101, 16);
      }
      while (v81);
      v16 = v58;
      p_throttleLock = v82;
    }
    else
    {
      v16 = v58;
    }
    goto LABEL_45;
  }
  p_throttleLock = &self->_throttleLock;
  v15 = v92;
  if (v91)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v44 = (void *)ck_log_facility_op;
    if (os_log_type_enabled((os_log_t)ck_log_facility_op, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      objc_msgSend_throttleID(v92, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v105 = v49;
      v106 = 2048;
      v107 = (uint64_t)v19;
      v108 = 2112;
      v109 = v8;
      _os_log_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_DEFAULT, "Throttle %{public}@ triggered, allowed in %lds: %@", buf, 0x20u);

    }
  }
  if (v90)
  {
    if (!v16)
      __assert_rtn("-[CKThrottleManager enforcedThrottleForCriteria:willSendRequest:outThrottleError:]", "CKThrottleManager.m", 248, "applicableThrottles");
    objc_msgSend_errorCode(v92, v41, v42, v43);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_integerValue(v50, v51, v52, v53);

    v57 = CFSTR("Operation throttled by server. Retry after %.1f seconds. (Other operations may be allowed.)");
    if (v54 == 2061)
      v57 = CFSTR("Operation throttled by previous server http 503 reply. Retry after %.1f seconds. (Other operations may be allowed.)");
    if (v54 == 2062)
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("Operation throttled by previous server http 429 reply. Retry after %.1f seconds. (Other operations may be allowed.)"), v56, *(_QWORD *)&v19);
    else
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)v57, v56, *(_QWORD *)&v19);
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_label(v92, v59, v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    v64 = CFSTR("<nil label>");
    if (v62)
      v64 = (__CFString *)v62;
    v65 = v64;

    v103[0] = v65;
    v102[0] = CFSTR("ThrottleLabel");
    v102[1] = CFSTR("CKRetryAfter");
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v66, v67, v68, v19);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v69;
    v103[2] = v58;
    v70 = *MEMORY[0x1E0CB2D50];
    v102[2] = CFSTR("CKErrorDescription");
    v102[3] = v70;
    v103[3] = v58;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)v103, (uint64_t)v102, 4);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v92;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v73, (uint64_t)CFSTR("CKInternalErrorDomain"), v54, v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = objc_retainAutorelease(v74);
    *v90 = v75;

LABEL_45:
  }
LABEL_46:
  pthread_mutex_unlock(p_throttleLock);
  if (self && v17)
  {
    v88 = v17;
    pthread_mutex_lock(p_throttleLock);
    sub_18A784590((void **)&self->super.isa, v88);

    pthread_mutex_unlock(p_throttleLock);
  }

  return v15;
}

- (id)initInternal
{
  CKThrottleManager *v2;
  CKThrottleManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKThrottleManager;
  v2 = -[CKThrottleManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_throttleLock, 0);
  return v3;
}

- (id)allThrottles
{
  _opaque_pthread_mutex_t *p_throttleLock;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  v4 = self->_throttleList;
  pthread_mutex_unlock(p_throttleLock);
  if (v4)
    v5 = v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A784050;
  block[3] = &unk_1E1F5F680;
  block[4] = a1;
  if (qword_1ECD96CA0 != -1)
    dispatch_once(&qword_1ECD96CA0, block);
  return (id)qword_1ECD96C98;
}

- (void)setThrottleObserver:(id)a3
{
  _opaque_pthread_mutex_t *p_throttleLock;
  id v5;

  p_throttleLock = &self->_throttleLock;
  v5 = a3;
  pthread_mutex_lock(p_throttleLock);
  objc_storeWeak((id *)&self->_observer, v5);

  pthread_mutex_unlock(p_throttleLock);
}

- (void)resetThrottles
{
  _opaque_pthread_mutex_t *p_throttleLock;
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *throttleList;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_throttleList;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend_throttleWillBeRemoved_(self, v7, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11++), v8, (_QWORD)v20);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v9);
  }

  throttleList = self->_throttleList;
  self->_throttleList = 0;

  objc_msgSend_throttleListBecameEmpty(self, v13, v14, v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  pthread_mutex_unlock(p_throttleLock);
  objc_msgSend_throttlesWereReset(WeakRetained, v17, v18, v19);

}

- (BOOL)addThrottle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isExpired;
  _opaque_pthread_mutex_t *p_throttleLock;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  char isEqualToString;
  void *v33;
  const char *v34;
  uint64_t v35;
  char isEqual;
  BOOL v37;
  NSArray *throttleList;
  NSArray *v39;
  NSArray *v40;
  id WeakRetained;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  char v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  const __CFString *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  const __CFString *v69;
  id v70;
  __CFString *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  isExpired = objc_msgSend_isExpired(v4, v5, v6, v7);
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  objc_msgSend_label(v4, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleID(v4, v14, v15, v16);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!(v13 | v19))
  {
    v25 = 0;
    v37 = 0;
    if ((isExpired & 1) != 0)
      goto LABEL_26;
    goto LABEL_22;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v20 = self->_throttleList;
  v25 = (__CFString *)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v58, (uint64_t)v72, 16);
  if (v25)
  {
    v56 = isExpired;
    v57 = v4;
    v26 = *(_QWORD *)v59;
LABEL_4:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v26)
        objc_enumerationMutation(v20);
      v28 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v27);
      if (v13)
      {
        objc_msgSend_label(*(void **)(*((_QWORD *)&v58 + 1) + 8 * v27), v22, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v29, v30, v13, v31);

        if ((isEqualToString & 1) != 0)
          break;
      }
      objc_msgSend_throttleID(v28, v22, v23, v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v33, v34, v19, v35);

      if ((isEqual & 1) != 0)
        break;
      if (v25 == (__CFString *)++v27)
      {
        v25 = (__CFString *)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v58, (uint64_t)v72, 16);
        if (v25)
          goto LABEL_4;
        v37 = 0;
        goto LABEL_17;
      }
    }
    v25 = v28;

    if (v25)
    {
      v71 = v25;
      v37 = 1;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)&v71, 1);
      v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sub_18A784590((void **)&self->super.isa, v20);
LABEL_17:
      p_throttleLock = &self->_throttleLock;
      v4 = v57;
      isExpired = v56;
      goto LABEL_19;
    }
    v37 = 0;
    p_throttleLock = &self->_throttleLock;
    v4 = v57;
    if ((v56 & 1) == 0)
      goto LABEL_22;
  }
  else
  {
    v37 = 0;
LABEL_19:

    if ((isExpired & 1) == 0)
    {
LABEL_22:
      throttleList = self->_throttleList;
      if (throttleList)
      {
        objc_msgSend_arrayByAddingObject_(throttleList, v17, (uint64_t)v4, v18);
      }
      else
      {
        v70 = v4;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)&v70, 1);
      }
      v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v40 = self->_throttleList;
      self->_throttleList = v39;

    }
  }
LABEL_26:
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend_throttleWasAdded_(self, v42, (uint64_t)v4, v43);
  objc_msgSend_throttleID(v4, v44, v45, v46);
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_throttleLock);
  objc_msgSend_throttleWasAdded(WeakRetained, v48, v49, v50);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v52 = CFSTR("<throttleID unset>");
    if (v47)
      v52 = v47;
    v53 = CFSTR("\nreplaces: ");
    *(_DWORD *)buf = 138544130;
    v63 = v52;
    v54 = &stru_1E1F66ED0;
    v64 = 2114;
    v65 = v4;
    if (!v25)
      v53 = &stru_1E1F66ED0;
    v66 = 2114;
    if (v25)
      v54 = v25;
    v67 = v53;
    v68 = 2114;
    v69 = v54;
    _os_log_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_INFO, "new throttle: %{public}@ = %{public}@%{public}@%{public}@", buf, 0x2Au);
  }

  return v37;
}

- (id)CKStatusReportArray
{
  _opaque_pthread_mutex_t *p_throttleLock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  objc_msgSend_CKMap_(self->_throttleList, v4, (uint64_t)&unk_1E1F587D8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_throttleLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_throttleList, 0);
}

@end
