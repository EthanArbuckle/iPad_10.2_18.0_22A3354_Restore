@implementation APFixedHTTPSessionManager

- (APFixedHTTPSessionManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APFixedHTTPSessionManager *v5;
  uint64_t v6;
  NSMutableDictionary *sessions;
  APUnfairLock *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  APUnfairLock *lock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APFixedHTTPSessionManager;
  v5 = -[APFixedHTTPSessionManager init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sessions = v5->_sessions;
    v5->_sessions = (NSMutableDictionary *)v6;

    v8 = [APUnfairLock alloc];
    v11 = objc_msgSend_initWithOptions_(v8, v9, 1, v10);
    lock = v5->_lock;
    v5->_lock = (APUnfairLock *)v11;

  }
  return v5;
}

- (id)sessionForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  const char *v24;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11);
  objc_msgSend_sessions(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_createSessionBlock(self, v19, v20, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_createSessionBlock(self, v19, v20, v21);
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, uint64_t))v22)[2](v22, v4, -1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend_sessions(self, v19, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v23, v24, (uint64_t)v18, (uint64_t)v4);

      }
    }
  }
  objc_msgSend_unlock(v8, v19, v20, v21);

  return v18;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  BOOL v27;

  objc_msgSend_lock(self, a2, a3, v3);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v25, v6, v7, v8);
  objc_msgSend_sessions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1CF2737C8;
  v26[3] = &unk_1E8C482D0;
  v27 = a3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v13, (uint64_t)v26, v14);

  objc_msgSend_sessions(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v18, v19, v20, v21);

  objc_msgSend_unlock(v25, v22, v23, v24);
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
  objc_msgSend_sessions(self, v15, v16, v17);
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
  id v6;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  id v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_lock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);
  objc_msgSend_sessions(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v17, v18, (uint64_t)v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_invalidateSessionAndCancelTasks_(v20, v21, v4, v22);
    objc_msgSend_sessions(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v26, v27, (uint64_t)v6, v28);

    APLogForCategory(0x1EuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v37 = 138543362;
      v38 = v6;
      v30 = "Service %{public}@ is invalidated.";
      v31 = v29;
      v32 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1CF251000, v31, v32, v30, (uint8_t *)&v37, 0xCu);
    }
  }
  else
  {
    APLogForCategory(0x1EuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v37 = 138543362;
      v38 = v6;
      v30 = "Service %{public}@ is not found.";
      v31 = v29;
      v32 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  objc_msgSend_unlock(v10, v33, v34, v35);
  return v20 != 0;
}

- (id)createSessionBlock
{
  return self->createSessionBlock;
}

- (void)setCreateSessionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->createSessionBlock, 0);
}

@end
