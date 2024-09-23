@implementation APBackoffTimer

- (NSArray)schedule
{
  return self->_schedule;
}

- (double)nextBackoffDate
{
  return self->_nextBackoffDate;
}

- (void)_timerFired
{
  NSObject *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x1EuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    objc_msgSend_name(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138478083;
    v20 = v4;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1CF251000, v3, OS_LOG_TYPE_DEBUG, "[%{private}@]: Firing backoff %{public}@ timer.", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend_setHasFiredOnThisLevel_(self, v10, 1, v11);
  objc_msgSend_delegate(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backoffTimerFired(v15, v16, v17, v18);

}

- (APBackoffTimer)initWithSchedule:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  APUnfairLock *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_init(self, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (v6)
      v13 = v6;
    else
      v13 = &unk_1E8C5BD60;
    objc_storeStrong((id *)(v11 + 40), v13);
    objc_storeStrong((id *)(v12 + 48), a4);
    *(_QWORD *)(v12 + 32) = 0;
    v14 = [APUnfairLock alloc];
    v17 = objc_msgSend_initWithOptions_(v14, v15, 1, v16);
    v18 = *(void **)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v17;

  }
  return (APBackoffTimer *)v12;
}

- (id)_secondsToNextEvent
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  objc_msgSend_currentLevel(self, v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_schedule(self, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_unsignedIntegerValue(v15, v17, v18, v19);
    objc_msgSend_objectAtIndexedSubscript_(v16, v21, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend_unlock(v5, v12, v13, v14);

  return v23;
}

- (id)_getNextLevelTimeInterval
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  int v102;
  void *v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  if (objc_msgSend_scheduled(self, v9, v10, v11))
  {
    objc_msgSend_unlock(v5, v12, v13, v14);
    APLogForCategory(0x1EuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      objc_msgSend_name(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 138478083;
      v103 = v16;
      v104 = 2114;
      v105 = v21;
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "[%{private}@]: Trying to schedule backoff %{public}@ timer twice on the same level.", (uint8_t *)&v102, 0x16u);

    }
    v22 = 0;
  }
  else
  {
    objc_msgSend_currentLevel(self, v12, v13, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend_currentLevel(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_unsignedIntegerValue(v27, v28, v29, v30);
      objc_msgSend_schedule(self, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_count(v35, v36, v37, v38) - 1;

      v43 = (void *)MEMORY[0x1E0CB37E8];
      if (v31 >= v39)
      {
        objc_msgSend_schedule(self, v40, v41, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_count(v44, v53, v54, v55) - 1;
      }
      else
      {
        objc_msgSend_currentLevel(self, v40, v41, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47) + 1;
      }
      objc_msgSend_numberWithUnsignedInteger_(v43, v48, v49, v50);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCurrentLevel_(self, v57, (uint64_t)v56, v58);

    }
    else
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v24, 0, v26);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCurrentLevel_(self, v51, (uint64_t)v44, v52);
    }

    objc_msgSend_nextBackoffDate(self, v59, v60, v61);
    if (v65 == 0.0)
    {
      objc_msgSend_now(MEMORY[0x1E0C99D68], v62, v63, v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSince1970(v66, v67, v68, v69);
      objc_msgSend_setNextBackoffDate_(self, v70, v71, v72);

    }
    objc_msgSend_schedule(self, v62, v63, v64);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentLevel(self, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend_unsignedIntegerValue(v77, v78, v79, v80);
    objc_msgSend_objectAtIndexedSubscript_(v73, v82, v81, v83);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_doubleValue(v22, v84, v85, v86);
    v88 = v87;
    objc_msgSend_nextBackoffDate(self, v89, v90, v91);
    objc_msgSend_setNextBackoffDate_(self, v93, v94, v95, v88 + v92);
    objc_msgSend_setHasFiredOnThisLevel_(self, v96, 0, v97);
    objc_msgSend_unlock(v5, v98, v99, v100);
  }

  return v22;
}

- (BOOL)scheduled
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  objc_msgSend_nextBackoffDate(self, a2, v2, v3);
  if (v8 <= 0.0)
    return 0;
  else
    return objc_msgSend_hasFiredOnThisLevel(self, v5, v6, v7) ^ 1;
}

- (void)reset
{
  NSObject *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x1EuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    objc_msgSend_name(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138478083;
    v28 = v4;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1CF251000, v3, OS_LOG_TYPE_DEBUG, "[%{private}@]: Reset backoff %{public}@ timer.", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend_lock(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v13, v14, v15, v16);
  objc_msgSend_setCurrentLevel_(self, v17, 0, v18);
  objc_msgSend_setNextBackoffDate_(self, v19, v20, v21, 0.0);
  objc_msgSend_setHasFiredOnThisLevel_(self, v22, 0, v23);
  objc_msgSend_unlock(v13, v24, v25, v26);

}

- (BOOL)scheduleNextLevelWithQueue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  dispatch_time_t v33;
  _QWORD block[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__getNextLevelTimeInterval(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v4;
    if (!v9)
      v9 = dispatch_queue_create("com.apple.ap.backoff_timer.retry_queue", 0);
    APLogForCategory(0x1EuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend_name(self, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_nextBackoffDate(self, v18, v19, v20);
      objc_msgSend_dateWithTimeIntervalSince1970_(v17, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v8, v25, v26, v27);
      *(_DWORD *)buf = 138478595;
      v38 = v11;
      v39 = 2114;
      v40 = v16;
      v41 = 2114;
      v42 = v24;
      v43 = 2048;
      v44 = v28;
      _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_DEBUG, "[%{private}@]: Scheduling backoff %{public}@ timer to %{public}@, adding %f seconds.", buf, 0x2Au);

    }
    objc_initWeak((id *)buf, self);
    objc_msgSend_doubleValue(v8, v29, v30, v31);
    v33 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF27BC60;
    block[3] = &unk_1E8C48630;
    objc_copyWeak(&v36, (id *)buf);
    dispatch_after(v33, v9, block);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);

  }
  return v8 != 0;
}

- (BOOL)scheduleTerminated
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  objc_msgSend_currentLevel(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (v12)
  {
    v17 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);
    objc_msgSend_schedule(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17 >= objc_msgSend_count(v21, v22, v23, v24) - 1;

    objc_msgSend_unlock(v5, v26, v27, v28);
  }
  else
  {
    objc_msgSend_lock(v5, v13, v14, v15);
    v25 = 0;
  }

  return v25;
}

- (APBackoffTimerDelegate)delegate
{
  return (APBackoffTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)currentLevel
{
  return self->_currentLevel;
}

- (void)setCurrentLevel:(id)a3
{
  self->_currentLevel = (NSNumber *)a3;
}

- (void)setNextBackoffDate:(double)a3
{
  self->_nextBackoffDate = a3;
}

- (BOOL)hasFiredOnThisLevel
{
  return self->_hasFiredOnThisLevel;
}

- (void)setHasFiredOnThisLevel:(BOOL)a3
{
  self->_hasFiredOnThisLevel = a3;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
