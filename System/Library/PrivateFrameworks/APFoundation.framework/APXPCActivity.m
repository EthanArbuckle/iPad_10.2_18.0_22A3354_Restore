@implementation APXPCActivity

+ (OS_dispatch_queue)activityQueue
{
  if (qword_1ED2BC628 != -1)
    dispatch_once(&qword_1ED2BC628, &unk_1E8C48090);
  return (OS_dispatch_queue *)(id)qword_1ED2BC728;
}

+ (id)_translateCriteria:(id)a3
{
  uint64_t v3;
  id v4;

  if (a3)
  {
    objc_msgSend_translateCriteria(a3, a2, (uint64_t)a3, v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (id)*MEMORY[0x1E0C80748];
  }
  return v4;
}

- (APXPCActivity)initWithDelegate:(id)a3
{
  id v5;
  APXPCActivity *v6;
  APXPCActivity *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *taskID;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APXPCActivity;
  v6 = -[APXPCActivity init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    objc_msgSend_taskID(v5, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    taskID = v7->_taskID;
    v7->_taskID = (NSString *)v11;

  }
  return v7;
}

- (BOOL)_continueActivity
{
  APXPCActivity *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_activity(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend_setActivityState_(v2, v7, 4, v8) & 1) != 0)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      APLogForCategory(0x32uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (id)objc_opt_class();
        objc_msgSend_taskID(v2, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138478083;
        v25 = v10;
        v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to continue task %{public}@ - terminating.", (uint8_t *)&v24, 0x16u);

      }
      objc_msgSend_finished(v2, v15, v16, v17);
      objc_msgSend_delegate(v2, v18, v19, v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_terminateActivity_(v6, v21, (uint64_t)v2, v22);

      LOBYTE(v6) = 0;
    }
  }
  objc_sync_exit(v2);

  return (char)v6;
}

- (void)checkin
{
  uint64_t v2;

  objc_msgSend__registerActivityWithCriteria_(self, a2, *MEMORY[0x1E0C80748], v2);
}

- (void)schedule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  objc_msgSend_delegate(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_criteria(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__translateCriteria_(APXPCActivity, v10, (uint64_t)v9, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__registerActivityWithCriteria_(self, v12, (uint64_t)v14, v13);
}

- (void)scheduleWithDelay:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  xpc_object_t xdict;

  objc_msgSend_delegate(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_criteria(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__translateCriteria_(APXPCActivity, v11, (uint64_t)v10, v12);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], a3);
  objc_msgSend__registerActivityWithCriteria_(self, v13, (uint64_t)xdict, v14);

}

- (void)_registerActivityWithCriteria:(id)a3
{
  id v4;
  APXPCActivity *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  APLogForCategory(0x32uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_opt_class();
    objc_msgSend_taskID(v5, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v24 = v7;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v4;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Scheduling XPC activity %{public}@ with criteria %{public}@", buf, 0x20u);

  }
  objc_msgSend_taskID(v5, v12, v13, v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1CF282928;
  v21[3] = &unk_1E8C488D8;
  v21[4] = v5;
  v20 = v4;
  v22 = v20;
  xpc_activity_register(v19, v20, v21);

  objc_sync_exit(v5);
}

- (BOOL)finished
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend__endDeferralCheck(self, a2, v2, v3);
  v10 = objc_msgSend_setActivityState_(self, v5, 5, v6);
  if (v10)
  {
    objc_msgSend_delegate(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend_delegate(self, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_activityHasFinished_(v16, v17, (uint64_t)self, v18);

    }
  }
  return v10;
}

- (BOOL)setActivityState:(int64_t)a3
{
  APXPCActivity *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _xpc_activity_s *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_activity(v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_activity(v4, v9, v10, v11);
    v12 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = xpc_activity_set_state(v12, a3);

    if ((v8 & 1) != 0)
    {
      APLogForCategory(0x32uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (id)objc_opt_class();
        objc_msgSend_taskID(v4, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v19, a3, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138478339;
        v32 = v14;
        v33 = 2114;
        v34 = v18;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_INFO, "[%{private}@]: Setting activity %{public}@ to the %{public}@ state.", (uint8_t *)&v31, 0x20u);

      }
    }
    else
    {
      APLogForCategory(0x32uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v22 = (id)objc_opt_class();
        objc_msgSend_taskID(v4, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v27, a3, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138478339;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        v35 = 2114;
        v36 = v29;
        _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to set activity %{public}@ to state %{public}@.", (uint8_t *)&v31, 0x20u);

      }
    }

  }
  objc_sync_exit(v4);

  return v8;
}

- (BOOL)shouldDefer
{
  APXPCActivity *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _xpc_activity_s *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_activity(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_activity(v2, v7, v8, v9);
    v10 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = xpc_activity_should_defer(v10);

    APLogForCategory(0x32uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (id)objc_opt_class();
      objc_msgSend_taskID(v2, v13, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("is not");
      v20 = 138478339;
      v21 = v12;
      v22 = 2114;
      if ((_DWORD)v6)
        v18 = CFSTR("will be");
      v23 = v16;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Activity %{public}@ %{public}@ deferred.", (uint8_t *)&v20, 0x20u);

    }
  }
  objc_sync_exit(v2);

  return (char)v6;
}

- (BOOL)deferActivity
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend_setActivityState_(self, a2, 3, v2);
  if ((v7 & 1) != 0)
  {
    objc_msgSend__endDeferralCheck(self, v4, v5, v6);
  }
  else
  {
    APLogForCategory(0x32uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend_taskID(self, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138478083;
      v26 = v9;
      v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_1CF251000, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to defer activity %{public}@ - terminating.", (uint8_t *)&v25, 0x16u);

    }
    objc_msgSend_finished(self, v15, v16, v17);
    objc_msgSend_delegate(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_terminateActivity_(v21, v22, (uint64_t)self, v23);

  }
  return v7;
}

- (void)cancel
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _xpc_activity_s *v9;
  unint64_t state;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_activity(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_activity(self, v6, v7, v8);
    v9 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    state = xpc_activity_get_state(v9);

    if (state <= 4 && ((1 << state) & 0x1A) != 0)
    {
      objc_msgSend_taskID(self, v11, v12, v13);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend_UTF8String(v23, v14, v15, v16);
      xpc_activity_unregister(v17);

    }
    else
    {
      APLogForCategory(0x32uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_taskID(self, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v22;
        v26 = 2048;
        v27 = state;
        _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "Cannot cancel activity %{public}@ with state %ld", buf, 0x16u);

      }
    }
  }
}

- (void)_backgroundDeferralCheck
{
  APXPCActivity *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  dispatch_time_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v6 = objc_msgSend_deferralCheckActive(v2, v3, v4, v5);
  objc_sync_exit(v2);

  if (v6)
  {
    v7 = dispatch_time(0, 2000000000);
    objc_msgSend_activityQueue(APXPCActivity, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF283578;
    block[3] = &unk_1E8C48590;
    block[4] = v2;
    dispatch_after(v7, v11, block);

  }
}

- (void)_startDeferralCheck
{
  APXPCActivity *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_setDeferralCheckActive_(v2, v3, 1, v4);
  objc_sync_exit(v2);

  MEMORY[0x1E0DE7D20](v2, sel__backgroundDeferralCheck, v5, v6);
}

- (void)_endDeferralCheck
{
  const char *v2;
  uint64_t v3;
  APXPCActivity *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setDeferralCheckActive_(obj, v2, 0, v3);
  objc_sync_exit(obj);

}

- (APXPCActivityDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)deferralCheckActive
{
  return self->_deferralCheckActive;
}

- (void)setDeferralCheckActive:(BOOL)a3
{
  self->_deferralCheckActive = a3;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_taskID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
