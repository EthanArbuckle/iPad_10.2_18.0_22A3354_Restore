@implementation LBFStateDetector

- (LBFStateDetector)init
{
  LBFStateDetector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LBFStateDetector;
  result = -[LBFStateDetector init](&v3, sel_init);
  if (result)
    result->_currentState = 0;
  return result;
}

- (LBFStateDetector)initWithState:(int64_t)a3
{
  LBFStateDetector *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LBFStateDetector;
  result = -[LBFStateDetector init](&v5, sel_init);
  if (result)
    result->_currentState = a3;
  return result;
}

- (id)processEventsStartingFromState:(int64_t)a3 bucketStartTime:(id)a4 events:(id)a5
{
  id v9;
  id v10;
  uint64_t *p_currentTime;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[16];
  _QWORD v123[2];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  self->_currentState = a3;
  p_currentTime = (uint64_t *)&self->_currentTime;
  objc_storeStrong((id *)&self->_currentTime, a4);
  if (!objc_msgSend_count(v10, v12, v13, v14, v15))
    sub_240314488();
  objc_msgSend_firstObject(v10, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v116 = v20;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_timestamp(v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compare_(v25, v26, *p_currentTime, v27, v28) == -1)
    {
      objc_storeStrong((id *)&self->_currentTime, v25);
      v29 = LBFLogContextStateDetector;
      if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR))
        sub_2403144B0(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_timestamp(v20, v37, v38, v39, v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compare_(v25, v41, *p_currentTime, v42, v43) == -1)
    {
      objc_storeStrong((id *)&self->_currentTime, v25);
      v44 = LBFLogContextStateDetector;
      if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR))
        sub_2403144E0(v44, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_timestamp(v20, v52, v53, v54, v55);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compare_(v25, v56, *p_currentTime, v57, v58) != -1)
      goto LABEL_19;
    objc_storeStrong((id *)&self->_currentTime, v25);
    v59 = LBFLogContextStateDetector;
    if (!os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v60 = "found earlier triald event";
LABEL_18:
    _os_log_impl(&dword_2402DE000, v59, OS_LOG_TYPE_INFO, v60, buf, 2u);
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_timestamp(v20, v61, v62, v63, v64);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compare_(v25, v65, *p_currentTime, v66, v67) != -1)
      goto LABEL_19;
    objc_storeStrong((id *)&self->_currentTime, v25);
    v59 = LBFLogContextStateDetector;
    if (!os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v60 = "found earlier dprivacyd event";
    goto LABEL_18;
  }
  objc_storeStrong((id *)&self->_currentTime, a4);
  v108 = LBFLogContextStateDetector;
  if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR))
    sub_240314510(v108, v109, v110, v111, v112, v113, v114, v115);
LABEL_20:
  v117 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v68 = v10;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v118, (uint64_t)v124, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v119 != v72)
          objc_enumerationMutation(v68);
        v74 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_processMLRuntimedEvent_(self, v75, v74, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v78 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_processLighthouseEvent_(self, v79, v74, v80, v81);
          v82 = objc_claimAutoreleasedReturnValue();

          v78 = (void *)v82;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_processTrialdEvent_(self, v83, v74, v84, v85);
          v86 = objc_claimAutoreleasedReturnValue();

          v78 = (void *)v86;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend_validateTransition_(self, v87, (uint64_t)v78, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v117, v91, (uint64_t)v90, v92, v93);

        }
      }
      v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v94, (uint64_t)&v118, (uint64_t)v124, 16);
    }
    while (v71);
  }

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v95, self->_currentState, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v98;
  v103 = (void *)objc_msgSend_copy(v117, v99, v100, v101, v102);
  v123[1] = v103;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v104, (uint64_t)v123, 2, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  return v106;
}

- (id)processMLRuntimedEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  int64_t currentState;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int64_t v56;
  NSDate *v57;
  NSDate *currentTime;
  LBFBitacoraStateTransition *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;

  v4 = a3;
  objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  v14 = v13;

  currentState = self->_currentState;
  objc_msgSend_taskFetched(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_taskFetched(v4, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_succeeded(v25, v26, v27, v28, v29);

    v35 = v30 == 0;
    v36 = 12;
    v37 = 4;
  }
  else
  {
    objc_msgSend_taskScheduled(v4, v21, v22, v23, v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_taskScheduled(v4, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_succeeded(v43, v44, v45, v46, v47);

      v35 = v48 == 0;
      v36 = 13;
      v37 = 5;
    }
    else
    {
      objc_msgSend_taskCompleted(v4, v39, v40, v41, v42);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        v56 = 8;
        goto LABEL_10;
      }
      objc_msgSend_taskCompleted(v4, v31, v32, v33, v34);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_succeeded(v50, v51, v52, v53, v54);

      v35 = v55 == 0;
      v36 = 14;
      v37 = 6;
    }
  }
  if (v35)
    v56 = v36;
  else
    v56 = v37;
LABEL_10:
  objc_msgSend_timestamp(v4, v31, v32, v33, v34);
  v57 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v57;

  self->_currentState = v56;
  v59 = [LBFBitacoraStateTransition alloc];
  objc_msgSend_timestamp(v4, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v59, v65, v56, currentState, (uint64_t)v64, v14);

  return v66;
}

- (id)processLighthouseEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  int64_t currentState;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  NSDate *v42;
  NSDate *currentTime;
  LBFBitacoraStateTransition *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;

  v4 = a3;
  objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  v14 = v13;

  currentState = self->_currentState;
  objc_msgSend_performTaskStatus(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_performTaskStatus(v4, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend_performTrialTaskStatus(v4, v21, v22, v23, v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_performTrialTaskStatus(v4, v31, v32, v33, v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v35 = v25;
    v36 = objc_msgSend_succeeded(v25, v26, v27, v28, v29);

    if (v36)
      v41 = 7;
    else
      v41 = 15;
    goto LABEL_8;
  }
  objc_msgSend_stop(v4, v31, v32, v33, v34);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend_stop(v4, v37, v38, v39, v40);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_succeeded(v54, v55, v56, v57, v58);

    if (v59)
      v41 = 16;
    else
      v41 = 17;
  }
  else
  {
    v41 = 8;
  }
LABEL_8:
  objc_msgSend_timestamp(v4, v37, v38, v39, v40);
  v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v42;

  self->_currentState = v41;
  v44 = [LBFBitacoraStateTransition alloc];
  objc_msgSend_timestamp(v4, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v44, v50, v41, currentState, (uint64_t)v49, v14);

  return v51;
}

- (id)processTrialdEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  int64_t currentState;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSDate *v40;
  NSDate *currentTime;
  LBFBitacoraStateTransition *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;

  v4 = a3;
  objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  v14 = v13;

  currentState = self->_currentState;
  if (objc_msgSend_eventType(v4, v16, v17, v18, v19) == 1)
  {
    if (objc_msgSend_eventSucceeded(v4, v20, v21, v22, v23))
      v28 = 1;
    else
      v28 = 9;
  }
  else
  {
    if (objc_msgSend_eventType(v4, v20, v21, v22, v23) == 2)
    {
      v33 = objc_msgSend_eventSucceeded(v4, v29, v30, v31, v32) == 0;
      v34 = 10;
      v35 = 2;
    }
    else
    {
      if (objc_msgSend_eventType(v4, v29, v30, v31, v32) != 3)
      {
        v28 = 8 * (objc_msgSend_eventType(v4, v36, v37, v38, v39) != 0);
        goto LABEL_13;
      }
      v33 = objc_msgSend_eventSucceeded(v4, v36, v37, v38, v39) == 0;
      v34 = 11;
      v35 = 3;
    }
    if (v33)
      v28 = v34;
    else
      v28 = v35;
  }
LABEL_13:
  objc_msgSend_timestamp(v4, v24, v25, v26, v27);
  v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v40;

  self->_currentState = v28;
  v42 = [LBFBitacoraStateTransition alloc];
  objc_msgSend_timestamp(v4, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v42, v48, v28, currentState, (uint64_t)v47, v14);

  return v49;
}

- (id)processDprivacydEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  int64_t currentState;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  NSDate *v64;
  NSDate *currentTime;
  LBFBitacoraStateTransition *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;

  v4 = a3;
  objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  v14 = v13;

  currentState = self->_currentState;
  objc_msgSend_event(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_phase(v20, v21, v22, v23, v24);

  switch(v25)
  {
    case 1:
      objc_msgSend_event(v4, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_succeeded(v30, v31, v32, v33, v34);

      v36 = v35 == 0;
      v37 = 26;
      v38 = 21;
      goto LABEL_8;
    case 2:
      objc_msgSend_event(v4, v26, v27, v28, v29);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_succeeded(v40, v41, v42, v43, v44);

      v36 = v45 == 0;
      v37 = 27;
      v38 = 22;
      goto LABEL_8;
    case 3:
      objc_msgSend_event(v4, v26, v27, v28, v29);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_succeeded(v46, v47, v48, v49, v50);

      v36 = v51 == 0;
      v37 = 28;
      v38 = 23;
      goto LABEL_8;
    case 4:
      objc_msgSend_event(v4, v26, v27, v28, v29);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend_succeeded(v52, v53, v54, v55, v56);

      v36 = v57 == 0;
      v37 = 29;
      v38 = 24;
      goto LABEL_8;
    case 5:
      objc_msgSend_event(v4, v26, v27, v28, v29);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend_succeeded(v58, v59, v60, v61, v62);

      v36 = v63 == 0;
      v37 = 30;
      v38 = 25;
LABEL_8:
      if (v36)
        v39 = v37;
      else
        v39 = v38;
      break;
    default:
      v39 = 8;
      break;
  }
  objc_msgSend_timestamp(v4, v26, v27, v28, v29);
  v64 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v64;

  self->_currentState = v39;
  v66 = [LBFBitacoraStateTransition alloc];
  objc_msgSend_timestamp(v4, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v66, v72, v39, currentState, (uint64_t)v71, v14);

  return v73;
}

- (id)validateTransition:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  LBFBitacoraStateTransition *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v3 = a3;
  v12 = objc_msgSend_state(v3, v4, v5, v6, v7) - 2;
  if (v12 <= 0xE && ((0x403Du >> v12) & 1) != 0)
  {
    v13 = *(&off_2510950D0 + v12);
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = objc_msgSend_previousState(v3, v8, v9, v10, v11);
    objc_msgSend_numberWithInteger_(v14, v16, v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend_containsObject_(v13, v20, (uint64_t)v19, v21, v22);

    if ((v13 & 1) == 0)
    {
      v23 = [LBFBitacoraStateTransition alloc];
      v28 = objc_msgSend_previousState(v3, v24, v25, v26, v27);
      objc_msgSend_timestamp(v3, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timedelta(v3, v34, v35, v36, v37);
      v39 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v23, v38, 8, v28, (uint64_t)v33);

      v3 = (id)v39;
    }
  }
  return v3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
