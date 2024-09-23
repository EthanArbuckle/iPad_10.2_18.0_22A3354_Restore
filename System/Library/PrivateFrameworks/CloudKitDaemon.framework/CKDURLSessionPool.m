@implementation CKDURLSessionPool

- (int)backgroundSessionConnectionPoolLimit
{
  CKDURLSessionPool *v2;
  int backgroundSessionConnectionPoolLimit;

  v2 = self;
  objc_sync_enter(v2);
  backgroundSessionConnectionPoolLimit = v2->_backgroundSessionConnectionPoolLimit;
  objc_sync_exit(v2);

  return backgroundSessionConnectionPoolLimit;
}

+ (id)sharedURLSessionPool
{
  if (qword_1ED702C20 != -1)
    dispatch_once(&qword_1ED702C20, &unk_1E7837CE8);
  return (id)qword_1ED702C18;
}

+ (id)backgroundSessionConnectionPoolName
{
  return CFSTR("com.apple.cloudkit.BackgroundConnectionPool");
}

- (id)initInternal
{
  CKDURLSessionPool *v2;
  const char *v3;
  uint64_t v4;
  CKDURLSessionPool *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDURLSessionPool;
  v2 = -[CKDURLSessionPool init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend__updateBackgroundSessionConnectionPoolLimit(v2, v3, v4);
  return v5;
}

- (void)_updateBackgroundSessionConnectionPoolLimit
{
  uint64_t v2;
  void *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKDURLSessionPool *v13;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_backgroundSessionConnectionPoolLimitWithDefaultValue_(v4, v5, 6);

  if (v6)
  {
    objc_msgSend_scheduler(MEMORY[0x1E0D1D928], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupWithName_maxConcurrent_(MEMORY[0x1E0D1D908], v10, (uint64_t)CFSTR("com.apple.cloudkit.BackgroundConnectionPool"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createActivityGroup_(v9, v12, (uint64_t)v11);

  }
  v13 = self;
  objc_sync_enter(v13);
  v13->_backgroundSessionConnectionPoolLimit = v6;
  objc_sync_exit(v13);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = v6;
    v16 = 2114;
    v17 = CFSTR("com.apple.cloudkit.BackgroundConnectionPool");
    _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Updated the connection pool limit (%d) for \"%{public}@\", (uint8_t *)v15, 0x12u);
  }
}

@end
