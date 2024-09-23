@implementation IDSCurrentServerTime

+ (id)sharedInstance
{
  void *v3;
  _IDSCurrentServerTimeProvider *v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)qword_1ECDD4838;
  if (!qword_1ECDD4838)
  {
    v4 = objc_alloc_init(_IDSCurrentServerTimeProvider);
    v5 = objc_alloc((Class)a1);
    v8 = objc_msgSend_initWithServerTimeProvider_(v5, v6, (uint64_t)v4, v7);
    v9 = (void *)qword_1ECDD4838;
    qword_1ECDD4838 = v8;

    v3 = (void *)qword_1ECDD4838;
  }
  return v3;
}

- (IDSCurrentServerTime)initWithServerTimeProvider:(id)a3
{
  id v5;
  IDSCurrentServerTime *v6;
  IDSCurrentServerTime *v7;
  id v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  CUTDeferredTaskQueue *refreshServerTimeTask;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSCurrentServerTime;
  v6 = -[IDSCurrentServerTime init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverTimeProvider, a3);
    v8 = objc_alloc(MEMORY[0x1E0D13200]);
    im_primary_queue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_initWithCapacity_queue_block_(v8, v10, 1, v11, v9, &unk_1E3C1BA50);
    refreshServerTimeTask = v7->_refreshServerTimeTask;
    v7->_refreshServerTimeTask = (CUTDeferredTaskQueue *)v12;

  }
  return v7;
}

- (double)currentServerTimeInterval
{
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  __uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  __uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  mach_timebase_info info;

  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v6, v7, v8, v9);
    v11 = v10;
  }
  else
  {
    objc_msgSend__storeInitialServerTimeIfNeeded(self, v3, v4, v5);
    objc_msgSend_timePair(self, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    v19 = v15 - objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v6, v16, v17, v18);
    v11 = (double)(v19 + objc_msgSend_initialServerTimeInNanoSeconds(v6, v20, v21, v22)) / 1000000000.0;
  }

  return v11;
}

- (id)currentServerTimeDate
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;

  objc_msgSend_currentServerTimeInterval(self, a2, v2, v3);
  return (id)objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v4, v5, v6);
}

- (double)_refreshTimeInterval
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("server-time-refreshInterval"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v6)
  {
    objc_msgSend_doubleValue(v6, v7, v8, v9);
    v12 = v11;
    objc_msgSend_utilities(IDSFoundationLog, v13, v14, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v16, v17, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "Server refresh interval to use {refreshInterval: %@}", (uint8_t *)&v20, 0xCu);

    }
  }
  else
  {
    v12 = 3600.0;
  }

  return v12;
}

- (void)_storeInitialServerTimeIfNeeded
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  char v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  int isAccurate;
  const __CFString *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  int v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  const __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend_timePair(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v9 = (void *)v5,
        objc_msgSend_timePair(self, v6, v7, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend_isAccurate(v10, v11, v12, v13),
        v10,
        v9,
        (v14 & 1) == 0))
  {
    objc_msgSend__storeCurrentTime(self, v6, v7, v8);
    objc_msgSend_utilities(IDSFoundationLog, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_timePair(self, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_initialServerTimeInNanoSeconds(v23, v24, v25, v26);
      objc_msgSend_numberWithUnsignedLongLong_(v22, v28, v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_timePair(self, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v35, v36, v37, v38);
      objc_msgSend_numberWithUnsignedLongLong_(v31, v40, v39, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timePair(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      isAccurate = objc_msgSend_isAccurate(v46, v47, v48, v49);
      v51 = CFSTR("NO");
      v60 = 138412802;
      v61 = v30;
      v62 = 2112;
      if (isAccurate)
        v51 = CFSTR("YES");
      v63 = v42;
      v64 = 2112;
      v65 = v51;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "Setting up timePair {initialServerTimeInNanoSeconds: %@, initialProcessMachTime: %@, isAccurate: %@}", (uint8_t *)&v60, 0x20u);

    }
    objc_msgSend__refreshTimeInterval(self, v52, v53, v54);
    v56 = v55;
    objc_msgSend_cancelPendingExecutions(self->_refreshServerTimeTask, v57, v58, v55);
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_refreshServerTimeTask, v59, (uint64_t)self, v56);
  }
}

- (void)_refreshServerTime
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  int isAccurate;
  const __CFString *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  double v51;
  int v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  im_primary_queue();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend_cancelPendingExecutions(self->_refreshServerTimeTask, v4, v5, v6);
  objc_msgSend__storeCurrentTime(self, v7, v8, v9);
  objc_msgSend_utilities(IDSFoundationLog, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_timePair(self, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_initialServerTimeInNanoSeconds(v18, v19, v20, v21);
    objc_msgSend_numberWithUnsignedLongLong_(v17, v23, v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_timePair(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v30, v31, v32, v33);
    objc_msgSend_numberWithUnsignedLongLong_(v26, v35, v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timePair(self, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    isAccurate = objc_msgSend_isAccurate(v41, v42, v43, v44);
    v46 = CFSTR("NO");
    v52 = 138412802;
    v53 = v25;
    v54 = 2112;
    if (isAccurate)
      v46 = CFSTR("YES");
    v55 = v37;
    v56 = 2112;
    v57 = v46;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Refreshed timePair {initialServerTimeInNanoSeconds: %@, initialProcessMachTime: %@, isAccurate: %@}", (uint8_t *)&v52, 0x20u);

  }
  objc_msgSend__refreshTimeInterval(self, v47, v48, v49);
  objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_refreshServerTimeTask, v50, (uint64_t)self, v51);
}

- (void)_storeCurrentTime
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __uint64_t v10;
  IDSCurrentServerTimePair *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t isAccurate;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;

  objc_msgSend_serverTimeProvider(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_serverTimeInNanoSeconds(v5, v6, v7, v8);

  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  v11 = [IDSCurrentServerTimePair alloc];
  objc_msgSend_serverTimeProvider(self, v12, v13, v14);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  isAccurate = objc_msgSend_isAccurate(v24, v15, v16, v17);
  v21 = (void *)objc_msgSend_initWithInitialProcessMonotonicTimeInNanoSeconds_initialServerTimeInNanoSeconds_isAccurate_(v11, v19, v10, v20, v9, isAccurate);
  objc_msgSend_setTimePair_(self, v22, (uint64_t)v21, v23);

}

- (IDSCurrentServerTimePair)timePair
{
  return (IDSCurrentServerTimePair *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimePair:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (IDSCurrentServerTimeProvider)serverTimeProvider
{
  return self->_serverTimeProvider;
}

- (void)setServerTimeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serverTimeProvider, a3);
}

- (CUTDeferredTaskQueue)refreshServerTimeTask
{
  return self->_refreshServerTimeTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshServerTimeTask, 0);
  objc_storeStrong((id *)&self->_serverTimeProvider, 0);
  objc_storeStrong((id *)&self->_timePair, 0);
}

@end
