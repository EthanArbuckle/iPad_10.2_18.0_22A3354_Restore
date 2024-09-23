@implementation APFlexibleHTTPSessionManager

- (id)sessionForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t v29[16];

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_lock(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v11, v12, v13, v14);
    objc_msgSend_now(MEMORY[0x1E0C99D68], v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v18, v19, v20, v21);
    objc_msgSend__sessionForService_now_temporarySession_(self, v22, (uint64_t)v4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_unlock(v11, v24, v25, v26);
  }
  else
  {
    APLogForCategory(0x1EuLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1CF251000, v27, OS_LOG_TYPE_ERROR, "Service name is nil or empty.", v29, 2u);
    }

    v23 = 0;
  }

  return v23;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (id)_sessionForService:(id)a3 now:(double)a4 temporarySession:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  APServiceItem *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  NSObject *v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v5 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_weakSessions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, (uint64_t)v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !v15)
  {
    objc_msgSend_sessions(self, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = sub_1CF25FB78;
    v67[3] = &unk_1E8C48608;
    v21 = v8;
    v68 = v21;
    v24 = objc_msgSend_indexOfObjectPassingTest_(v20, v22, (uint64_t)v67, v23);

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 && v5)
      {
        v28 = v15;
        if (v5)
          goto LABEL_22;
      }
      else
      {
        objc_msgSend__createNewSessionForService_temp_(self, v25, (uint64_t)v21, v5);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          APLogForCategory(0x1EuLL);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v70 = v21;
            _os_log_impl(&dword_1CF251000, v66, OS_LOG_TYPE_ERROR, "Unable to create a session for %{public}@", buf, 0xCu);
          }

          v19 = 0;
          goto LABEL_23;
        }
        objc_msgSend_weakSessions(self, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v28, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v36, v41, (uint64_t)v28, (uint64_t)v40);

        if (v5)
        {
LABEL_22:
          v19 = v28;
LABEL_23:

          goto LABEL_24;
        }
      }
      v42 = objc_alloc_init(APServiceItem);
      v32 = (uint64_t)v42;
      if (v42)
      {
        v42->_counter = 1;
        v42->_createdAt = a4;
        v42->_lastAccessedAt = a4;
      }
      sub_1CF27A8E8((uint64_t)v42, v28);
      objc_msgSend_sessions(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v46, v47, v32, v48);

    }
    else
    {
      objc_msgSend_sessions(self, v25, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v29, v30, v24, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v28 = *(id *)(v32 + 8);

        if (!v5)
        {
          ++*(_QWORD *)(v32 + 16);
          *(double *)(v32 + 32) = a4;
        }
      }
      else
      {

        v28 = 0;
      }
    }

    objc_msgSend_sessions(self, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_count(v52, v53, v54, v55);

    if (v56 < 2)
    {
      objc_msgSend_sessions(self, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v60, v61, v62, v63);
      v64 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v64)
        v64[2] = 1;

    }
    else
    {
      objc_msgSend__startTimer(self, v57, v58, v59);
    }
    goto LABEL_22;
  }
  v19 = v15;
LABEL_24:

  return v19;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (NSMapTable)weakSessions
{
  return self->_weakSessions;
}

- (id)temporarySessionForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t v29[16];

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_lock(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v11, v12, v13, v14);
    objc_msgSend_now(MEMORY[0x1E0C99D68], v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v18, v19, v20, v21);
    objc_msgSend__sessionForService_now_temporarySession_(self, v22, (uint64_t)v4, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_unlock(v11, v24, v25, v26);
  }
  else
  {
    APLogForCategory(0x1EuLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1CF251000, v27, OS_LOG_TYPE_ERROR, "Service name (temp) is nil or empty.", v29, 2u);
    }

    v23 = 0;
  }

  return v23;
}

- (int64_t)httpMaximumConnectionsPerHostTempSession
{
  return self->_httpMaximumConnectionsPerHostTempSession;
}

- (id)createSessionBlock
{
  return self->createSessionBlock;
}

- (id)_createNewSessionForService:(id)a3 temp:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;

  v4 = a4;
  v9 = a3;
  if (v4)
    v10 = objc_msgSend_httpMaximumConnectionsPerHostTempSession(self, v6, v7, v8);
  else
    v10 = objc_msgSend_httpMaximumConnectionsPerHost(self, v6, v7, v8);
  v14 = v10;
  objc_msgSend_createSessionBlock(self, v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_createSessionBlock(self, v15, v16, v17);
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v19)[2](v19, v9, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (APFlexibleHTTPSessionManager)initWithLookBackWindow:(double)a3 httpMaximumConnectionsPerHost:(int64_t)a4 httpMaximumConnectionsPerHostTempSession:(int64_t)a5
{
  APFlexibleHTTPSessionManager *v8;
  APUnfairLock *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  APUnfairLock *lock;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *sessions;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMapTable *weakSessions;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)APFlexibleHTTPSessionManager;
  v8 = -[APFlexibleHTTPSessionManager init](&v24, sel_init);
  if (v8)
  {
    v9 = [APUnfairLock alloc];
    v12 = objc_msgSend_initWithOptions_(v9, v10, 1, v11);
    lock = v8->_lock;
    v8->_lock = (APUnfairLock *)v12;

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v14, 3, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    sessions = v8->_sessions;
    v8->_sessions = (NSMutableArray *)v16;

    objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x1E0CB3748], v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    weakSessions = v8->_weakSessions;
    v8->_weakSessions = (NSMapTable *)v21;

    v8->_lookBackWindow = a3;
    v8->_httpMaximumConnectionsPerHost = a4;
    v8->_httpMaximumConnectionsPerHostTempSession = a5;
  }
  return v8;
}

- (void)_startTimer
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend_timerSet(self, a2, v2, v3) & 1) == 0)
  {
    objc_msgSend_setTimerSet_(self, v5, 1, v6);
    MEMORY[0x1E0DE7D20](self, sel__setTimer, v7, v8);
  }
}

- (void)_setTimer
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_lookBackWindow(self, v3, v4, v5);
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CF27AAF4;
  v9[3] = &unk_1E8C48630;
  objc_copyWeak(&v10, &location);
  dispatch_after(v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_onTimer:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  _QWORD *v71;
  uint64_t *v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[5];
  id v80;

  objc_msgSend_lock(self, a2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10);
  objc_msgSend_sessions(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v14, v15, v16, v17);

  if (v18 > 1)
  {
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v19, v20, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x3032000000;
    v79[3] = sub_1CF27ADC0;
    v79[4] = sub_1CF27ADD0;
    v80 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend_lookBackWindow(self, v31, v32, v33);
    v35 = v34;
    objc_msgSend_sessions(self, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = sub_1CF27ADD8;
    v69[3] = &unk_1E8C48658;
    v73 = a3;
    v74 = v35;
    v71 = v79;
    v72 = &v75;
    v40 = v30;
    v70 = v40;
    objc_msgSend_enumerateObjectsUsingBlock_(v39, v41, (uint64_t)v69, v42);

    v45 = v76[3];
    if (v45 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend_removeIndex_(v40, v43, v45, v44);
    objc_msgSend_sessions(self, v43, v45, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsAtIndexes_(v46, v47, (uint64_t)v40, v48);

    objc_msgSend_sessions(self, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumerateObjectsUsingBlock_(v52, v53, (uint64_t)&unk_1E8C48010, v54);

    objc_msgSend_sessions(self, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_count(v58, v59, v60, v61);

    objc_msgSend_unlock(v7, v63, v64, v65);
    if (v62 >= 2)
      objc_msgSend__startTimer(self, v66, v67, v68);

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(v79, 8);

  }
  else
  {
    objc_msgSend_sessions(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v22, v23, v24, v25);
    v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v26[2] = 0;

    objc_msgSend_unlock(v7, v27, v28, v29);
  }

}

- (void)invalidateAllServicesAndCancelTasks:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  BOOL v38;

  objc_msgSend_lock(self, a2, a3, v3);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v36, v6, v7, v8);
  objc_msgSend_weakSessions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1CF27AF64;
  v37[3] = &unk_1E8C482D0;
  v38 = a3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v16, v17, (uint64_t)v37, v18);

  objc_msgSend_sessions(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v22, v23, v24, v25);

  objc_msgSend_weakSessions(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v29, v30, v31, v32);

  objc_msgSend_unlock(v36, v33, v34, v35);
}

- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  objc_msgSend_weakSessions(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)v6, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_cancelTaskWithCompletionHandler_(v21, v22, (uint64_t)v7, v23);
    APLogForCategory(0x1EuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v30 = 138543362;
      v31 = v6;
      _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_INFO, "All pending tasks of %{public}@ are canceled.", (uint8_t *)&v30, 0xCu);
    }

  }
  else
  {
    APLogForCategory(0x1EuLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543362;
      v31 = v6;
      _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_ERROR, "Service %{public}@ is not found.", (uint8_t *)&v30, 0xCu);
    }

    v7[2](v7);
  }
  objc_msgSend_unlock(v11, v25, v26, v27);

  return v21 != 0;
}

- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[4];
  NSObject *v41;
  uint8_t buf[4];
  NSObject *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_lock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);
  objc_msgSend_weakSessions(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v17, v18, (uint64_t)v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_invalidateSessionAndCancelTasks_(v20, v21, v4, v22);
    v23 = (void *)MEMORY[0x1E0CB3880];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = sub_1CF27B3F0;
    v40[3] = &unk_1E8C486A0;
    v24 = v6;
    v41 = v24;
    objc_msgSend_predicateWithBlock_(v23, v25, (uint64_t)v40, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessions(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filterUsingPredicate_(v31, v32, (uint64_t)v27, v33);

    APLogForCategory(0x1EuLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v24;
      _os_log_impl(&dword_1CF251000, v34, OS_LOG_TYPE_INFO, "Service %{public}@ is invalidated.", buf, 0xCu);
    }

    v35 = v41;
  }
  else
  {
    APLogForCategory(0x1EuLL);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v6;
      _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_ERROR, "Service %{public}@ is not found.", buf, 0xCu);
    }
  }

  objc_msgSend_unlock(v10, v36, v37, v38);
  return v20 != 0;
}

- (void)setCreateSessionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)timerSet
{
  return self->_timerSet;
}

- (void)setTimerSet:(BOOL)a3
{
  self->_timerSet = a3;
}

- (double)lookBackWindow
{
  return self->_lookBackWindow;
}

- (void)setLookBackWindow:(double)a3
{
  self->_lookBackWindow = a3;
}

- (int64_t)httpMaximumConnectionsPerHost
{
  return self->_httpMaximumConnectionsPerHost;
}

- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHost = a3;
}

- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHostTempSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->createSessionBlock, 0);
}

@end
