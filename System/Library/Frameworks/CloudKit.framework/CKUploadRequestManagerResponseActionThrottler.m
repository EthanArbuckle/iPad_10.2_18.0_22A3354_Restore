@implementation CKUploadRequestManagerResponseActionThrottler

+ (void)sleep:(double)a3
{
  usleep((a3 * 1000000.0));
}

+ (double)currentTime
{
  return sub_18A6FDF64(0);
}

- (CKUploadRequestManagerResponseActionThrottler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKUploadRequestManagerResponseActionThrottler;
  v5 = -[CKUploadRequestManagerResponseActionThrottler init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v6;

    *((_QWORD *)v5 + 1) = 0x4014000000000000;
    *((_QWORD *)v5 + 2) = 15;
    *(_OWORD *)(v5 + 24) = xmmword_18A83D1C0;
    *((_QWORD *)v5 + 5) = 0x4014000000000000;
  }
  return (CKUploadRequestManagerResponseActionThrottler *)v5;
}

- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v7 = (void *)objc_opt_class();
  objc_msgSend_currentTime(v7, v8, v9, v10);
  MEMORY[0x1E0DE7D20](self, sel_gateResponseAction_isRetry_currentTime_, a3, v4);
}

- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4 currentTime:(double)a5
{
  _BOOL8 v6;
  CKUploadRequestManagerResponseActionThrottler *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  _BOOL4 v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  double v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  CKUploadRequestManagerResponseActionThrottler *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  int v82;
  void *v83;
  __int16 v84;
  double v85;
  uint64_t v86;

  v6 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_responseActionToMetadata(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (!v18 || (objc_msgSend_lastRunTime(v18, v19, v20, v21), v22 == -1.0))
  {
    v25 = 0;
  }
  else
  {
    v23 = a5 - v22;
    objc_msgSend_throttlePeriod(v8, v19, v20, v21);
    v25 = v23 < v24;
  }
  objc_msgSend_actionsToThrottle(v8, v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v27, a3, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v25 & objc_msgSend_containsObject_(v26, v30, (uint64_t)v29, v31);

  v33 = v32 | v6;
  if (v18)
    v34 = v18;
  else
    v34 = (id)objc_opt_new();
  v38 = v34;
  if (v33)
  {
    v39 = objc_msgSend_repeatCount(v18, v35, v36, v37);
    objc_msgSend_throttleTimeForCount_isRetry_(v8, v40, v39, v6);
    if (v41 > 0.0)
    {
      v42 = v41;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v43 = (void *)ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
      {
        v78 = v43;
        objc_msgSend_nameFromResponseAction_(CKUploadRequestManagerStateMachine, v79, a3, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 138543618;
        v83 = v81;
        v84 = 2048;
        v85 = v42;
        _os_log_error_impl(&dword_18A5C5000, v78, OS_LOG_TYPE_ERROR, "Action %{public}@ is repeating too much, throttling for %.1f seconds", (uint8_t *)&v82, 0x16u);

      }
      v47 = objc_msgSend_totalThrottleCount(v38, v44, v45, v46);
      objc_msgSend_setTotalThrottleCount_(v38, v48, v47 + 1, v49);
      v50 = (void *)objc_opt_class();
      objc_msgSend_sleep_(v50, v51, v52, v53, v42);
    }
  }
  v54 = (void *)objc_opt_class();
  objc_msgSend_currentTime(v54, v55, v56, v57);
  v62 = v61;
  if (v33)
  {
    v63 = objc_msgSend_repeatCount(v38, v58, v59, v60) + 1;
    objc_msgSend_setRepeatCount_(v38, v64, v63, v65);
  }
  else
  {
    objc_msgSend_setRepeatCount_(v38, v58, 0, v60);
  }
  objc_msgSend_setLastRunTime_(v38, v66, v67, v68, v62);
  v69 = v8;
  objc_sync_enter(v69);
  objc_msgSend_responseActionToMetadata(v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v74, a3, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v73, v77, (uint64_t)v38, (uint64_t)v76);

  objc_sync_exit(v69);
}

- (double)throttleTimeForCount:(int64_t)a3 isRetry:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double result;

  v4 = a4;
  v9 = a3 - objc_msgSend_minimumThrottleCount(self, a2, a3, a4);
  if (v9 < 0)
  {
    v19 = 0.0;
  }
  else
  {
    objc_msgSend_minimumThrottleTime(self, v6, v7, v8);
    v11 = v10;
    objc_msgSend_maximumThrottleTime(self, v12, v13, v14);
    v16 = v15;
    v17 = vcvtpd_s64_f64(log2(v15 / v11));
    if (v9 < v17)
      v17 = v9;
    v18 = v11 * exp2((double)v17);
    if (v18 >= v16)
      v19 = v16;
    else
      v19 = v18;
  }
  result = v19;
  if (v4)
    objc_msgSend_minimumRetryTime(self, v6, v7, v8, v19);
  if (v19 >= result)
    return v19;
  return result;
}

- (unint64_t)totalThrottleCountForAction:(int64_t)a3
{
  CKUploadRequestManagerResponseActionThrottler *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_responseActionToMetadata(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_totalThrottleCount(v14, v15, v16, v17);

  objc_sync_exit(v4);
  return v18;
}

- (double)throttlePeriod
{
  return self->_throttlePeriod;
}

- (void)setThrottlePeriod:(double)a3
{
  self->_throttlePeriod = a3;
}

- (int64_t)minimumThrottleCount
{
  return self->_minimumThrottleCount;
}

- (void)setMinimumThrottleCount:(int64_t)a3
{
  self->_minimumThrottleCount = a3;
}

- (double)minimumThrottleTime
{
  return self->_minimumThrottleTime;
}

- (void)setMinimumThrottleTime:(double)a3
{
  self->_minimumThrottleTime = a3;
}

- (double)maximumThrottleTime
{
  return self->_maximumThrottleTime;
}

- (void)setMaximumThrottleTime:(double)a3
{
  self->_maximumThrottleTime = a3;
}

- (double)minimumRetryTime
{
  return self->_minimumRetryTime;
}

- (void)setMinimumRetryTime:(double)a3
{
  self->_minimumRetryTime = a3;
}

- (NSSet)actionsToThrottle
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActionsToThrottle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSMutableDictionary)responseActionToMetadata
{
  return self->_responseActionToMetadata;
}

- (void)setResponseActionToMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_responseActionToMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseActionToMetadata, 0);
  objc_storeStrong((id *)&self->_actionsToThrottle, 0);
}

@end
