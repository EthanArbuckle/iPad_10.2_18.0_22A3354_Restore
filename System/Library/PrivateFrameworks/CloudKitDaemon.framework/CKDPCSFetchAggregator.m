@implementation CKDPCSFetchAggregator

- (CKDPCSFetchAggregator)init
{
  objc_class *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C94D90]);
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], CFSTR("You must call -[%@ initWithContainer:]"), v3);
  objc_exception_throw(v6);
}

- (CKDPCSFetchAggregator)initWithContainer:(id)a3
{
  id v4;
  CKDPCSFetchAggregator *v5;
  CKDPCSFetchAggregator *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *opQueue;
  NSOperationQueue *v10;
  NSOperationQueue *queue;
  uint64_t v12;
  NSMutableArray *queuedFetches;
  uint64_t v14;
  NSMutableArray *runningFetches;
  id v16;
  const char *v17;
  uint64_t v18;
  CKCoalescer *fetchCoalescer;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDPCSFetchAggregator;
  v5 = -[CKDPCSFetchAggregator init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.cloudkit.pcs.fetchAggregator", v7);
    opQueue = v6->_opQueue;
    v6->_opQueue = (OS_dispatch_queue *)v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v6->_queue;
    v6->_queue = v10;

    v12 = objc_opt_new();
    queuedFetches = v6->_queuedFetches;
    v6->_queuedFetches = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    runningFetches = v6->_runningFetches;
    v6->_runningFetches = (NSMutableArray *)v14;

    objc_initWeak(&location, v6);
    v16 = objc_alloc(MEMORY[0x1E0C94C08]);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1BEC6FA8C;
    v21[3] = &unk_1E7833190;
    objc_copyWeak(&v22, &location);
    v18 = objc_msgSend_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_(v16, v17, 10000000, 100000000, 0, 0, v21);
    fetchCoalescer = v6->_fetchCoalescer;
    v6->_fetchCoalescer = (CKCoalescer *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  NSObject *timerSource;
  objc_super v4;

  timerSource = self->_timerSource;
  if (timerSource)
    dispatch_source_cancel(timerSource);
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSFetchAggregator;
  -[CKDPCSFetchAggregator dealloc](&v4, sel_dealloc);
}

- (void)_lockedFetchesAreReady
{
  uint64_t v2;
  NSObject *v4;
  dispatch_once_t *v5;
  os_log_t *v6;
  void *v7;
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
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  os_log_t *v40;
  dispatch_once_t *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  os_log_t v71;
  NSObject *v72;
  const char *v73;
  os_log_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  const __CFString *v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  __CFString *v109;
  const char *v110;
  uint64_t v111;
  __CFString *v112;
  __int128 v113;
  void *v114;
  id obj;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  const __CFString *v144;
  __int16 v145;
  __CFString *v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  objc_msgSend_opQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (os_log_t *)MEMORY[0x1E0C952B0];
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v106 = v7;
    objc_msgSend_runningFetches(self, v107, v108);
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queuedFetches(self, v110, v111);
    v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v144 = v109;
    v145 = 2112;
    v146 = v112;
    _os_log_debug_impl(&dword_1BE990000, v106, OS_LOG_TYPE_DEBUG, "Cleaning up finished fetches and starting pending fetches. Running fetches are %@ and pending fetches are %@", buf, 0x16u);

  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  objc_msgSend_runningFetches(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v10, v11, v12);

  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v134, v142, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v135;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v135 != v19)
          objc_enumerationMutation(v13);
        v21 = *(__CFString **)(*((_QWORD *)&v134 + 1) + 8 * v20);
        if (objc_msgSend_isFinished(v21, v16, v17))
        {
          if (*v5 != -1)
            dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v22 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v144 = v21;
            _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "Fetch %@ is finished. Removing it now.", buf, 0xCu);
          }
          objc_msgSend_runningFetches(self, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v25, v26, (uint64_t)v21);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v134, v142, 16);
    }
    while (v18);
  }

  v114 = (void *)objc_opt_new();
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  objc_msgSend_queuedFetches(self, v27, v28);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v130, v141, 16);
  if (v117)
  {
    v116 = *(_QWORD *)v131;
    *(_QWORD *)&v32 = 138412290;
    v113 = v32;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v131 != v116)
          objc_enumerationMutation(obj);
        v34 = *(__CFString **)(*((_QWORD *)&v130 + 1) + 8 * v33);
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v129 = 0u;
        objc_msgSend_runningFetches(self, v30, v31, v113);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v126, v140, 16);
        if (v37)
        {
          v39 = v37;
          v40 = v6;
          v41 = v5;
          v42 = *(_QWORD *)v127;
LABEL_25:
          v43 = 0;
          while (1)
          {
            if (*(_QWORD *)v127 != v42)
              objc_enumerationMutation(v35);
            v44 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v43);
            if (objc_msgSend_canBeUsedForPendingFetch_(v44, v38, (uint64_t)v34))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
            }
            if (v39 == ++v43)
            {
              v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v126, v140, 16);
              if (v39)
                goto LABEL_25;
              v45 = 1;
              v5 = v41;
              v6 = v40;
              goto LABEL_57;
            }
          }
          v5 = v41;
          if (*v41 != -1)
            dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v6 = v40;
          v46 = *v40;
          if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v113;
            v144 = v34;
            _os_log_debug_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEBUG, "Holding queued fetch %@ because an equivalent fetch is already running", buf, 0xCu);
          }
          objc_msgSend_setEquivalentRunningFetch_(v34, v47, (uint64_t)v44);

          if ((objc_msgSend_skipQueuedFetchCycleDetection(self, v48, v49) & 1) == 0)
          {
            v124 = 0u;
            v125 = 0u;
            v122 = 0u;
            v123 = 0u;
            objc_msgSend_runningFetches(self, v50, v51);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v52, (uint64_t)&v122, v139, 16);
            if (v53)
            {
              v55 = v53;
              v56 = *(_QWORD *)v123;
LABEL_40:
              v57 = 0;
              while (1)
              {
                if (*(_QWORD *)v123 != v56)
                  objc_enumerationMutation(v35);
                if (objc_msgSend_dependentOperationListContainsRunningFetch_(v34, v54, *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v57)))break;
                if (v55 == ++v57)
                {
                  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v54, (uint64_t)&v122, v139, 16);
                  v6 = v40;
                  if (v55)
                    goto LABEL_40;
                  goto LABEL_46;
                }
              }
              v5 = v41;
              if (*v41 != -1)
                dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v6 = v40;
              v74 = *v40;
              if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v113;
                v144 = v34;
                v72 = v74;
                v73 = "Firing queued fetch %@ immediately since a running fetch is waiting on it";
                goto LABEL_69;
              }
              goto LABEL_56;
            }
LABEL_46:

            v5 = v41;
          }
          objc_msgSend_date(MEMORY[0x1E0C99D68], v50, v51);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_queuedDate(v34, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceDate_(v35, v61, (uint64_t)v60);
          v63 = v62;
          objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_maximumQueuedFetchWaitTime(v66, v67, v68);
          v70 = v69;

          if (v63 <= v70)
          {
            v45 = 0;
            goto LABEL_57;
          }
          if (*v5 != -1)
            dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v71 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v113;
            v144 = v34;
            v72 = v71;
            v73 = "Firing queued fetch %@ immediately since its been waiting too long";
LABEL_69:
            _os_log_debug_impl(&dword_1BE990000, v72, OS_LOG_TYPE_DEBUG, v73, buf, 0xCu);
          }
        }
LABEL_56:
        v45 = 1;
LABEL_57:

        if (*v5 != -1)
          dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v75 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v79 = CFSTR("not ");
          if (v45)
            v79 = &stru_1E7838F48;
          v144 = v79;
          v145 = 2112;
          v146 = v34;
          _os_log_debug_impl(&dword_1BE990000, v75, OS_LOG_TYPE_DEBUG, "Fetch is %{public}@ready to fire: %@", buf, 0x16u);
          if (v45)
          {
LABEL_61:
            objc_msgSend_setEquivalentRunningFetch_(v34, v76, 0);
            objc_msgSend_addObject_(v114, v78, (uint64_t)v34);
            goto LABEL_66;
          }
        }
        else if (v45)
        {
          goto LABEL_61;
        }
        objc_msgSend__lockedRescheduleFetchTimer(self, v76, v77);
LABEL_66:
        ++v33;
      }
      while (v33 != v117);
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v130, v141, 16);
      v117 = v80;
    }
    while (v80);
  }

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v81 = v114;
  v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v118, v138, 16);
  if (v83)
  {
    v86 = v83;
    v87 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v119 != v87)
          objc_enumerationMutation(v81);
        v89 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_msgSend_runningFetches(self, v84, v85);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v90, v91, (uint64_t)v89);

        objc_msgSend_queuedFetches(self, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v94, v95, (uint64_t)v89);

        objc_msgSend_start(v89, v96, v97);
      }
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v84, (uint64_t)&v118, v138, 16);
    }
    while (v86);
  }

  objc_msgSend_queuedFetches(self, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend_count(v100, v101, v102);

  if (!v103)
    objc_msgSend__lockedTearDownFetchTimer(self, v104, v105);

}

- (void)_lockedTearDownFetchTimer
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;

  objc_msgSend_timerSource(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_timerSource(self, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    objc_msgSend_setTimerSource_(self, v8, 0);
  }
}

- (void)_lockedRescheduleFetchTimer
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  float v11;
  NSObject *v12;
  dispatch_source_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  float v21;
  dispatch_time_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD handler[4];
  id v27;
  int location;
  double location_4;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend__lockedTearDownFetchTimer(self, a2, v2);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maximumQueuedFetchWaitTime(v6, v7, v8);
  v10 = v9;

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = v10;
  v12 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    location = 134217984;
    location_4 = v11;
    _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Rescheduling queued fetch timer to fire after %.2f seconds", (uint8_t *)&location, 0xCu);
  }
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_opQueue);
  objc_msgSend_setTimerSource_(self, v14, (uint64_t)v13);

  objc_initWeak((id *)&location, self);
  objc_msgSend_timerSource(self, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1BEC706C4;
  handler[3] = &unk_1E782EF38;
  objc_copyWeak(&v27, (id *)&location);
  dispatch_source_set_event_handler(v17, handler);

  objc_msgSend_timerSource(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v11 * 1000000000.0;
  v22 = dispatch_time(0, (uint64_t)v21);
  dispatch_source_set_timer(v20, v22, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v21);

  objc_msgSend_timerSource(self, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)&location);
}

- (id)_lockedGetQueuedFetchForOperation:(id)a3 ofClass:(Class)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  CKDPCSFetchAggregator *val;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE location[12];
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  val = self;
  objc_msgSend_opQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("ForceNoQueuedFetchCycleDetection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend_setSkipQueuedFetchCycleDetection_(self, v10, 1);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend_queuedFetches(self, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v54, v61, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v55;
LABEL_6:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
      if (objc_msgSend_canBeUsedForOperation_(v21, v17, (uint64_t)v6))
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!*MEMORY[0x1E0C95280])
            break;
          objc_msgSend_unitTestOverrides(v6, v17, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)CFSTR("ForceNoQueuedFetchReuse"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            break;
        }
      }
      if (v18 == ++v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v54, v61, 16);
        if (v18)
          goto LABEL_6;
        goto LABEL_15;
      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v47 = v26;
      objc_msgSend_operationID(v6, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v21;
      v59 = 2114;
      v60 = v50;
      _os_log_debug_impl(&dword_1BE990000, v47, OS_LOG_TYPE_DEBUG, "Re-using fetch request %@ for operation %{public}@", location, 0x16u);

    }
    v27 = v21;

    if (v27)
      goto LABEL_26;
  }
  else
  {
LABEL_15:

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v28 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v43 = v28;
    objc_msgSend_operationID(v6, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543362;
    *(_QWORD *)&location[4] = v46;
    _os_log_debug_impl(&dword_1BE990000, v43, OS_LOG_TYPE_DEBUG, "Creating a new fetch request for operation %{public}@", location, 0xCu);

  }
  v29 = [a4 alloc];
  objc_msgSend_container(val, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queue(val, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend_initWithOperation_container_operationQueue_(v29, v36, (uint64_t)v6, v32, v35);

  objc_initWeak((id *)location, val);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = sub_1BEC70B48;
  v52[3] = &unk_1E782EF38;
  objc_copyWeak(&v53, (id *)location);
  objc_msgSend_setCompletionHandler_(v27, v37, (uint64_t)v52);
  objc_msgSend_queuedFetches(val, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v40, v41, (uint64_t)v27);

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)location);
LABEL_26:

  return v27;
}

- (BOOL)fetchRequestForExistingOperation:(id)a3 isDependentOnOperation:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend_opQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1BE9BB230;
  v23[4] = sub_1BE9BAEC0;
  v12 = v8;
  v24 = v12;
  objc_msgSend_opQueue(self, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC70D08;
  block[3] = &unk_1E7838868;
  block[4] = self;
  v19 = v7;
  v20 = v23;
  v21 = &v25;
  v22 = a2;
  v16 = v7;
  dispatch_sync(v15, block);

  LOBYTE(v7) = *((_BYTE *)v26 + 24);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return (char)v7;
}

- (void)requestFetchOfRecordWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDPCSFetchAggregator *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_opQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEC71028;
  v17[3] = &unk_1E78303B0;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)requestFetchOfShareWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDPCSFetchAggregator *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_opQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEC715A8;
  v17[3] = &unk_1E78303B0;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)requestFetchOfZoneWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDPCSFetchAggregator *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_opQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEC71A20;
  v17[3] = &unk_1E78303B0;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)cancelAllOperations
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_opQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC71DA4;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v4, block);

}

- (CKDContainer)container
{
  return (CKDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (OS_dispatch_queue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
  objc_storeStrong((id *)&self->_opQueue, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)queuedFetches
{
  return self->_queuedFetches;
}

- (void)setQueuedFetches:(id)a3
{
  objc_storeStrong((id *)&self->_queuedFetches, a3);
}

- (NSMutableArray)runningFetches
{
  return self->_runningFetches;
}

- (void)setRunningFetches:(id)a3
{
  objc_storeStrong((id *)&self->_runningFetches, a3);
}

- (CKCoalescer)fetchCoalescer
{
  return self->_fetchCoalescer;
}

- (void)setFetchCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_fetchCoalescer, a3);
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (BOOL)skipQueuedFetchCycleDetection
{
  return self->_skipQueuedFetchCycleDetection;
}

- (void)setSkipQueuedFetchCycleDetection:(BOOL)a3
{
  self->_skipQueuedFetchCycleDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_fetchCoalescer, 0);
  objc_storeStrong((id *)&self->_runningFetches, 0);
  objc_storeStrong((id *)&self->_queuedFetches, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
