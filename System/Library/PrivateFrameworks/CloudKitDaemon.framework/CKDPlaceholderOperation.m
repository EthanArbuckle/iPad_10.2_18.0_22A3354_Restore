@implementation CKDPlaceholderOperation

- (void)main
{
  uint64_t v2;
  int isCancelled;
  const char *v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;
  os_log_t *v9;
  os_log_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *group;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int isSuspended;
  os_log_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  os_log_t v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  _QWORD block[5];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  isCancelled = objc_msgSend_isCancelled(self, a2, v2);
  v7 = isCancelled;
  v8 = (_QWORD *)MEMORY[0x1E0C95300];
  v9 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (isCancelled)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v65 = v10;
      objc_msgSend_ckShortDescription(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v68;
      _os_log_debug_impl(&dword_1BE990000, v65, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ was cancelled - finishing the real operation", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0C94FF8];
    v14 = *MEMORY[0x1E0C94B20];
    objc_msgSend_realOperation(self, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v13, v19, v14, 1, CFSTR("Operation %@ was cancelled"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_realOperation(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(v23, v24, (uint64_t)v20);

  }
  group = self->_group;
  objc_msgSend_qualityOfService(self, v5, v6);
  CKGetGlobalQueue();
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C5710;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_group_notify(group, v26, block);

  if ((v7 & 1) == 0)
  {
    objc_msgSend_targetOperationQueue(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    isSuspended = objc_msgSend_isSuspended(v29, v30, v31);

    if (isSuspended)
    {
      if (*v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v33 = *v9;
      if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v34 = v33;
      objc_msgSend_ckShortDescription(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetOperationQueue(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v37;
      v72 = 2112;
      v73 = (uint64_t)v40;
      _os_log_impl(&dword_1BE990000, v34, OS_LOG_TYPE_INFO, "System is unavailable. Scheduling operation %{public}@ on suspended operation queue %@", buf, 0x16u);

    }
    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_15:
    v41 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v44 = v41;
      objc_msgSend_operationID(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetOperationQueue(self, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_operationCount(v50, v51, v52);
      objc_msgSend_targetOperationQueue(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_maxConcurrentOperationCount(v56, v57, v58);
      *(_DWORD *)buf = 138543874;
      v71 = v47;
      v72 = 2048;
      v73 = v53;
      v74 = 2048;
      v75 = v59;
      _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "Adding operation %{public}@ to target queue (%lu/%ld in queue)", buf, 0x20u);

    }
    objc_msgSend_targetOperationQueue(self, v42, v43);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_realOperation(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v60, v64, (uint64_t)v63);

  }
}

- (NSOperationQueue)targetOperationQueue
{
  return self->_targetOperationQueue;
}

- (BOOL)isExecuting
{
  return CKOperationExecutionStateIsExecuting();
}

- (BOOL)isFinished
{
  return CKOperationExecutionStateIsFinished();
}

- (void)transitionToFinished
{
  CKOperationExecutionStateTransitionToFinished();
}

- (void)transitionToExecuting
{
  CKOperationExecutionStateTransitionToExecuting();
}

- (void)start
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    objc_msgSend_ckShortDescription(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v19;
    _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ starting", buf, 0xCu);

  }
  if ((objc_msgSend_isExecuting(self, v4, v5) & 1) != 0 || objc_msgSend_isFinished(self, v6, v7))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_msgSend_operationID(self, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v11, v9, CFSTR("You can't restart an executing or finished CKDPlaceholderOperation: %@"), v10);

  }
  v12 = objc_msgSend_transitionToExecuting(self, v6, v7);
  v13 = (void *)MEMORY[0x1C3B83E24](v12);
  objc_msgSend_main(self, v14, v15);
  objc_autoreleasePoolPop(v13);
}

- (CKDOperation)realOperation
{
  return self->_realOperation;
}

- (NSString)operationID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_realOperation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CKDPlaceholderOperation)initWithOperation:(id)a3 targetOperationQueue:(id)a4
{
  id v7;
  id v8;
  CKDPlaceholderOperation *v9;
  NSDate *v10;
  NSDate *startDate;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKDPlaceholderOperation;
  v9 = -[CKDPlaceholderOperation init](&v23, sel_init);
  if (v9)
  {
    v10 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    startDate = v9->_startDate;
    v9->_startDate = v10;

    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    objc_storeStrong((id *)&v9->_group, v12);
    objc_msgSend_completionBlock(v7, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1BE9C2968;
    v20[3] = &unk_1E782EC68;
    v21 = v12;
    v22 = v15;
    v16 = v12;
    v17 = v15;
    objc_msgSend_setCompletionBlock_(v7, v18, (uint64_t)v20);
    objc_storeStrong((id *)&v9->_realOperation, a3);
    objc_storeStrong((id *)&v9->_targetOperationQueue, a4);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetOperationQueue, 0);
  objc_storeStrong((id *)&self->_realOperation, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (CKDContainer)container
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_realOperation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDContainer *)v6;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v3;
    objc_msgSend_ckShortDescription(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ canceling", buf, 0xCu);

  }
  v13.receiver = self;
  v13.super_class = (Class)CKDPlaceholderOperation;
  -[CKDPlaceholderOperation cancel](&v13, sel_cancel);
  objc_msgSend_realOperation(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v6, v7, v8);

}

- (id)ckShortDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_operationID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@ %p:%@>"), v4, self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = (void *)objc_msgSend_initWithCapacity_(v9, v10, 3);
  if (v7)
  {
    objc_msgSend_realOperation(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v14, v15, 1, v6, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v17, (uint64_t)CFSTR("realOperation"), v16);

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_startDate(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v21, v22, v23);
    objc_msgSend_numberWithDouble_(v18, v25, v26, -v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v27, v28, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v30, (uint64_t)CFSTR("runningFor"), v29);

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v31, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isExecuting(self, v33, v34))
      objc_msgSend_addObject_(v32, v35, (uint64_t)CFSTR("executing"));
    if (objc_msgSend_isFinished(self, v35, v36))
      objc_msgSend_addObject_(v32, v37, (uint64_t)CFSTR("finished"));
    if (objc_msgSend_isCancelled(self, v37, v38))
      objc_msgSend_addObject_(v32, v39, (uint64_t)CFSTR("cancelled"));
    if (objc_msgSend_count(v32, v39, v40))
    {
      objc_msgSend_componentsJoinedByString_(v32, v41, (uint64_t)CFSTR("|"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v43, (uint64_t)CFSTR("stateFlags"), v42);

    }
  }
  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPlaceholderOperation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)_startDateString
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  __CFString *v10;

  if (qword_1ED700A70 != -1)
    dispatch_once(&qword_1ED700A70, &unk_1E7836028);
  objc_msgSend_startDate(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)qword_1ED700A68;
    objc_msgSend_startDate(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v7, v9, (uint64_t)v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(unknown)");
  }
  return v10;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const __CFString *v20;
  int isCancelled;
  const char *v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = CKTabIndentAtDepth();
  objc_msgSend_realOperation(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("%s<%@(Placeholder) %@ "), v5, v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isExecuting(self, v16, v17))
    v20 = CFSTR("R");
  else
    v20 = &stru_1E7838F48;
  isCancelled = objc_msgSend_isCancelled(self, v18, v19);
  v23 = CFSTR("X");
  if (!isCancelled)
    v23 = &stru_1E7838F48;
  objc_msgSend_appendFormat_(v15, v22, (uint64_t)CFSTR("(%@%@) "), v20, v23);
  objc_msgSend_startDate(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v26, v27, v28);

  CKDescriptionForTimeInterval();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__startDateString(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v15, v33, (uint64_t)CFSTR(" running for %@ (started %@) "), v29, v32);

  objc_msgSend_appendString_(v15, v34, (uint64_t)CFSTR(">\n"));
  return v15;
}

- (NSDate)startDate
{
  return self->_startDate;
}

@end
