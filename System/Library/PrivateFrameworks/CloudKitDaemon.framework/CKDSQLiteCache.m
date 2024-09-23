@implementation CKDSQLiteCache

- (id)initOrExitWithPath:(id)a3 isSharedCache:(BOOL)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  os_log_t *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  char v28;
  const char *v30;
  int v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  _QWORD v35[4];
  BOOL v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = (void *)objc_msgSend_initWithCacheDir_(self, v7, (uint64_t)v6);
  v38 = 0;
  LOBYTE(self) = objc_msgSend_openWithError_(v8, v9, (uint64_t)&v38);
  v10 = v38;
  v12 = v10;
  if ((self & 1) != 0)
  {
    v13 = v10;
  }
  else
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = (os_log_t *)MEMORY[0x1E0C952B0];
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v15;
      v41 = 2112;
      v42 = v18;
      v43 = 2112;
      v44 = v12;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "%@ failed to open at path %@: %@", buf, 0x20u);
    }
    objc_msgSend_remove(v8, v22, v23);
    v24 = objc_alloc((Class)objc_opt_class());
    v26 = (void *)objc_msgSend_initWithCacheDir_(v24, v25, (uint64_t)v6);

    v37 = v12;
    v28 = objc_msgSend_openWithError_(v26, v27, (uint64_t)&v37);
    v13 = v37;

    if ((v28 & 1) == 0)
    {
      pthread_mutex_unlock(&stru_1ED700828);
      v31 = objc_msgSend_CKIsDiskFullError_(MEMORY[0x1E0CB35C8], v30, (uint64_t)v13);
      v32 = (void *)*MEMORY[0x1E0C952F8];
      if (v31)
      {
        if (*v19 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v32);
        v33 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v40 = v15;
          v41 = 2114;
          v42 = v18;
          v43 = 2114;
          v44 = v13;
          _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Exiting due to disk full error creating shared database for %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (*v19 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v32);
        v34 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          v40 = v15;
          v41 = 2114;
          v42 = v18;
          v43 = 2114;
          v44 = v13;
          _os_log_fault_impl(&dword_1BE990000, v34, OS_LOG_TYPE_FAULT, "Exiting due to error creating shared database for %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
        }
      }
      exit(1);
    }

    v8 = v26;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1BEAC50D4;
  v35[3] = &unk_1E7832CB0;
  v36 = a4;
  objc_msgSend_setInvalidationHandler_(v8, v11, (uint64_t)v35);

  return v8;
}

+ (id)sharedCache
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *isSharedCache;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  const char *v24;

  pthread_mutex_lock(&stru_1ED700828);
  objc_msgSend_objectForKey_((void *)qword_1ED702CF8, v3, (uint64_t)a1);
  isSharedCache = (void *)objc_claimAutoreleasedReturnValue();
  if (!isSharedCache)
  {
    if (!qword_1ED702CF8)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = (void *)qword_1ED702CF8;
      qword_1ED702CF8 = (uint64_t)v7;

    }
    objc_msgSend_cacheDirectory(a1, v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dbFileName(a1, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v9, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_currentProcess(CKDDaemonProcess, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend_isSystemInstalledBinary(v17, v18, v19);

    if ((v12 & 1) == 0)
    {
      objc_msgSend_stringByAppendingString_(v14, v20, (uint64_t)CFSTR("_debug"));
      v21 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v21;
    }
    v22 = objc_alloc((Class)a1);
    isSharedCache = (void *)objc_msgSend_initOrExitWithPath_isSharedCache_(v22, v23, (uint64_t)v14, 1);
    objc_msgSend_setObject_forKey_((void *)qword_1ED702CF8, v24, (uint64_t)isSharedCache, a1);

  }
  pthread_mutex_unlock(&stru_1ED700828);
  return isSharedCache;
}

- (CKDSQLiteCache)initWithDeviceContext:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char isSystemInstalledBinary;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CKDSQLiteCache *isSharedCache;
  const char *v26;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_dbFileName(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v11, v12, v13);

  if ((isSystemInstalledBinary & 1) == 0)
  {
    objc_msgSend_stringByAppendingString_(v8, v15, (uint64_t)CFSTR("_debug"));
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }
  objc_msgSend_cacheDirectory(v4, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v18, v19, (uint64_t)v8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_path(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isSharedCache = (CKDSQLiteCache *)objc_msgSend_initOrExitWithPath_isSharedCache_(self, v24, (uint64_t)v23, 0);

  objc_msgSend_setDeviceContext_(isSharedCache, v26, (uint64_t)v4);
  return isSharedCache;
}

- (CKDSQLiteCache)initWithCacheDir:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  CKDSQLiteCache *v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_cacheDatabaseSchema(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CKDSQLiteCache;
  v9 = -[CKSQLite initWithPath:schema:](&v11, sel_initWithPath_schema_, v4, v8);

  return v9;
}

- (CKDLogicalDeviceContext)deviceContext
{
  return (CKDLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (void)setDeviceContext:(id)a3
{
  objc_storeWeak((id *)&self->_deviceContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
}

@end
