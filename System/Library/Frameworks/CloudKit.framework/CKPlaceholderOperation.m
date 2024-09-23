@implementation CKPlaceholderOperation

- (BOOL)isExecuting
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD97100);
  LOBYTE(self) = self->_executionState == 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD97100);
  return (char)self;
}

- (BOOL)isFinished
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD97100);
  LOBYTE(self) = self->_executionState == 2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD97100);
  return (char)self;
}

- (void)start
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isFinished;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  CKPlaceholderOperation *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A767450(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v18;
    v25 = 2048;
    v26 = self;
    v27 = 2114;
    v28 = v22;
    _os_log_debug_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_DEBUG, "Placeholder op <%{public}@: %p; %{public}@> starting",
      buf,
      0x20u);

  }
  if ((objc_msgSend_isExecuting(self, v4, v5, v6) & 1) != 0
    || (isFinished = objc_msgSend_isFinished(self, v7, v8, v9), (_DWORD)isFinished))
  {
    v11 = *MEMORY[0x1E0C99778];
    if (self)
      isFinished = objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v7, v11, (uint64_t)CFSTR("You can't restart an executing or finished CKPlaceholderOperation: %@"), self->_operationID);
    else
      isFinished = objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v7, v11, (uint64_t)CFSTR("You can't restart an executing or finished CKPlaceholderOperation: %@"), 0);
  }
  if (self)
    isFinished = CKOperationExecutionStateTransitionToExecuting(self, &self->_executionState);
  v12 = (void *)MEMORY[0x18D76DE4C](isFinished);
  objc_msgSend_main(self, v13, v14, v15);
  objc_autoreleasePoolPop(v12);
}

- (void)main
{
  id daemonInvokeBlock;
  NSObject *group;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  (*((void (**)(void))self->_daemonInvokeBlock + 2))();
  daemonInvokeBlock = self->_daemonInvokeBlock;
  self->_daemonInvokeBlock = 0;

  group = self->_group;
  v8 = objc_msgSend_qualityOfService(self, v5, v6, v7);
  CKGetGlobalQueue(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A5F3328;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_group_notify(group, v9, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_daemonInvokeBlock, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;

  v5 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  v10 = (void *)objc_msgSend_initWithCapacity_(v7, v8, 3, v9);
  v12 = v10;
  if (v5)
  {
    if (self)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v11, (uint64_t)CFSTR("operationID"), (uint64_t)self->_operationID);
    else
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v11, (uint64_t)CFSTR("operationID"), 0);
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (self)
      objc_msgSend_timeIntervalSinceNow(self->_startDate, v13, v14, v15);
    else
      objc_msgSend_timeIntervalSinceNow(0, v13, v14, v15);
    objc_msgSend_numberWithDouble_(v16, v17, v18, v19, -v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v21, v22, 3, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v25, (uint64_t)CFSTR("runningFor"), (uint64_t)v24);

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v26, 2, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isExecuting(self, v29, v30, v31))
      objc_msgSend_addObject_(v28, v32, (uint64_t)CFSTR("executing"), v34);
    if (objc_msgSend_isFinished(self, v32, v33, v34))
      objc_msgSend_addObject_(v28, v35, (uint64_t)CFSTR("finished"), v37);
    if (objc_msgSend_count(v28, v35, v36, v37))
    {
      objc_msgSend_componentsJoinedByString_(v28, v38, (uint64_t)CFSTR("|"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v41, (uint64_t)CFSTR("stateFlags"), (uint64_t)v40);

    }
  }
  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKPlaceholderOperation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end
