@implementation BNSuspensionController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BOOL)isSuspended
{
  BNSuspensionController *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableSet count](v2->_suspensionReasons, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)activeSuspensionReasons
{
  BNSuspensionController *v2;
  NSMutableSet *suspensionReasons;
  NSMutableSet *v4;
  NSMutableSet *v5;

  v2 = self;
  objc_sync_enter(v2);
  suspensionReasons = v2->_suspensionReasons;
  if (suspensionReasons)
    v4 = suspensionReasons;
  else
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  v5 = v4;
  objc_sync_exit(v2);

  return (NSSet *)v5;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *v7;
  BNSuspensionController *v8;
  BOOL v9;
  NSMutableSet *suspensionReasons;
  NSMutableSet *v11;
  NSMutableSet *v12;
  NSObject *v13;
  NSString *identifier;
  NSObject *v15;
  NSString *v16;
  _BOOL4 v17;
  uint64_t v18;
  _BOOL4 v19;
  NSString *v20;
  NSMutableSet *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSString *v25;
  BOOL v26;
  BOOL v27;
  void *v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  NSMutableSet *v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = (NSMutableSet *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNSuspensionController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v27 = 0;
    goto LABEL_17;
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[BNSuspensionController isSuspended](v8, "isSuspended");
  if (v4)
  {
    suspensionReasons = v8->_suspensionReasons;
    if (!suspensionReasons)
    {
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v12 = v8->_suspensionReasons;
      v8->_suspensionReasons = v11;

      suspensionReasons = v8->_suspensionReasons;
    }
    -[NSMutableSet addObject:](suspensionReasons, "addObject:", v7);
    v13 = BNLogSuspending;
    if (os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT))
    {
      identifier = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = identifier;
      v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suspension requested with reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v15 = BNLogSuspending;
    if (os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_1B9628000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) Resumption requested with reason: %{public}@", buf, 0x16u);
    }
    -[NSMutableSet removeObject:](v8->_suspensionReasons, "removeObject:", v7);
  }
  v17 = -[BNSuspensionController isSuspended](v8, "isSuspended");
  v18 = BNLogSuspending;
  v19 = os_log_type_enabled((os_log_t)BNLogSuspending, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v21 = v8->_suspensionReasons;
      v20 = v8->_identifier;
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2114;
      v33 = v21;
      v22 = "(%{public}@) Suspended: %{public}@";
      v23 = v18;
      v24 = 22;
LABEL_15:
      _os_log_impl(&dword_1B9628000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
  }
  else if (v19)
  {
    v25 = v8->_identifier;
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    v22 = "(%{public}@) Resumed";
    v23 = v18;
    v24 = 12;
    goto LABEL_15;
  }
  v26 = -[BNSuspensionController isSuspended](v8, "isSuspended");
  objc_sync_exit(v8);

  v27 = v9 ^ v26;
LABEL_17:

  return v27;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_suspensionReasons, 0);
}

@end
