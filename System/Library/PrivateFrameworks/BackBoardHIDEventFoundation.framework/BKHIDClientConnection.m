@implementation BKHIDClientConnection

- (__IOHIDEventSystemConnection)connection
{
  return self->_connection;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (unsigned)task
{
  return self->_task;
}

+ (id)connectionWithConnection:(__IOHIDEventSystemConnection *)a3
{
  return -[BKHIDClientConnection initWithConnection:]([BKHIDClientConnection alloc], "initWithConnection:", a3);
}

- (BKHIDClientConnection)initWithConnection:(__IOHIDEventSystemConnection *)a3
{
  BKHIDClientConnection *v4;
  BKHIDClientConnection *v5;
  uint64_t v6;
  NSString *bundleID;
  NSObject *v8;
  int pid;
  NSString *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  int v17;
  NSObject *v18;
  void *v19;
  NSString *v20;
  int v21;
  int v22;
  int v23;
  objc_super v24;
  _BYTE v25[32];
  uint8_t buf[40];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)BKHIDClientConnection;
  v4 = -[BKHIDClientConnection init](&v24, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (!a3)
  {
    BKLogHID();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C8914000, v15, OS_LOG_TYPE_ERROR, "trying to create a BKHIDClientConnection with a nil connection", buf, 2u);
    }

    goto LABEL_13;
  }
  v4->_lock._os_unfair_lock_opaque = 0;
  IOHIDEventSystemConnectionGetAttribute();
  v6 = objc_claimAutoreleasedReturnValue();
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_task = IOHIDEventSystemConnectionGetTaskNamePort();
  v5->_pid = objc_msgSend((id)IOHIDEventSystemConnectionGetAttribute(), "intValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSString length](v5->_bundleID, "length"))
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = a3;
    v11 = "ignoring connection; bundleID is missing (or invalid) from the attributes: %{public}@";
LABEL_22:
    v12 = buf;
    v13 = v8;
    v14 = 12;
    goto LABEL_23;
  }
  if (v5->_task + 1 <= 1)
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      pid = v5->_pid;
      v10 = v5->_bundleID;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = pid;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v10;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = a3;
      v11 = "ignoring connection; pid:%d bundleID:%{public}@ doesn't have a valid task port: %{public}@";
      v12 = buf;
      v13 = v8;
      v14 = 28;
LABEL_23:
      _os_log_error_impl(&dword_1C8914000, v13, OS_LOG_TYPE_ERROR, v11, v12, v14);
    }
LABEL_9:

LABEL_13:
    return 0;
  }
  if (v5->_pid <= 0)
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = a3;
    v11 = "ignoring connection; pid is missing from the attributes: %{public}@";
    goto LABEL_22;
  }
  memset(buf, 0, 32);
  if ((BSAuditTokenForTask() & 1) == 0)
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v21 = v5->_pid;
    *(_DWORD *)v25 = 67109378;
    *(_DWORD *)&v25[4] = v21;
    *(_WORD *)&v25[8] = 2114;
    *(_QWORD *)&v25[10] = a3;
    v11 = "ignoring connection; BSAuditTokenForTask returned NO (expected pid:%d) connection:%{public}@";
    v12 = v25;
    v13 = v8;
    v14 = 18;
    goto LABEL_23;
  }
  *(_OWORD *)v25 = *(_OWORD *)buf;
  *(_OWORD *)&v25[16] = *(_OWORD *)&buf[16];
  v5->_versionedPID = BSVersionedPIDForAuditToken();
  v17 = BSPIDForAuditToken();
  if (v5->_pid != v17)
  {
    v22 = v17;
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v23 = v5->_pid;
    *(_DWORD *)v25 = 67109634;
    *(_DWORD *)&v25[4] = v22;
    *(_WORD *)&v25[8] = 1024;
    *(_DWORD *)&v25[10] = v23;
    *(_WORD *)&v25[14] = 2114;
    *(_QWORD *)&v25[16] = a3;
    v11 = "ignoring connection; audit pid (%d) doesn't match attribute pid (%d): %{public}@";
    v12 = v25;
    v13 = v8;
    v14 = 24;
    goto LABEL_23;
  }
  CFRetain(a3);
  v5->_connection = a3;
  BKLogHID();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromBSVersionedPID();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5->_bundleID;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = a3;
    _os_log_impl(&dword_1C8914000, v18, OS_LOG_TYPE_INFO, "HID connection vpid:%{public}@ bundleID:%{public}@ successfully initialized: %{public}@", buf, 0x20u);

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_connection, CFSTR("IOHIDEventSystemConnectionRef"));
  NSStringFromBSVersionedPID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("vpid"));

  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:format:", self->_task, CFSTR("taskPort"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)invalidate
{
  atomic_flag *p_invalid;
  unsigned __int8 v4;
  __IOHIDEventSystemConnection *connection;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BSCompoundAssertion *observerAssertion;
  BSProcessDeathWatcher *processDeathWatcher;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_invalid = &self->_invalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v4 & 1) == 0)
  {
    connection = self->_connection;
    if (connection)
    {
      CFRelease(connection);
      self->_connection = 0;
    }
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[BSCompoundAssertion context](self->_observerAssertion, "context", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[BSCompoundAssertion invalidate](self->_observerAssertion, "invalidate");
    observerAssertion = self->_observerAssertion;
    self->_observerAssertion = 0;

    -[BSProcessDeathWatcher invalidate](self->_processDeathWatcher, "invalidate");
    processDeathWatcher = self->_processDeathWatcher;
    self->_processDeathWatcher = 0;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BKHIDClientConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKHIDClientConnection;
  -[BKHIDClientConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDeathWatcher, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __IOHIDEventSystemConnection *connection;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 && (connection = self->_connection, v9 = objc_msgSend(v6, "connection"), (connection != 0) == (v9 != 0)))
  {
    if ((unint64_t)connection | v9)
      v10 = CFEqual(connection, (CFTypeRef)v9) != 0;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->_connection;
  if (result)
    return CFHash((CFTypeRef)result);
  return result;
}

- (id)addDisconnectionObserverBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BSCompoundAssertion *observerAssertion;
  void *v7;
  void *v8;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    v7 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p disconnectionObservers"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertionWithIdentifier:", v8);
    v9 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v10 = self->_observerAssertion;
    self->_observerAssertion = v9;

    observerAssertion = self->_observerAssertion;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_opt_class();
  v13 = (void *)MEMORY[0x1CAA37E74](v5);
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p>"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v5, "copy");

  -[BSCompoundAssertion acquireForReason:withContext:](observerAssertion, "acquireForReason:withContext:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BSProcessDeathWatcher)processDeathWatcher
{
  return self->_processDeathWatcher;
}

- (void)setProcessDeathWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_processDeathWatcher, a3);
}

@end
