@implementation CRPluginsController

- (BOOL)isApplicationInstalledWithMaxRetries:(int)a3 bundleName:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v9 = v5;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    v10 = 0;
    if (a3 <= 1)
      v11 = 1;
    else
      v11 = a3;
    while (1)
    {
      handleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v23 = v10;
        _os_log_impl(&dword_1D1401000, v12, OS_LOG_TYPE_DEFAULT, "application is not installed Sleeping retry:%d", buf, 8u);
      }

      sleep(0xAu);
      objc_msgSend_defaultWorkspace(MEMORY[0x1E0CA5878], v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_applicationIsInstalled_(v16, v17, (uint64_t)v9, v18) & 1) != 0)
        break;
      ++v10;

      if (v11 == v10)
      {
        v10 = v11;
LABEL_16:
        handleForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1D140D440(v10, v20);
        v19 = 0;
        goto LABEL_19;
      }
    }

    if (v10 >= a3)
      goto LABEL_16;
    handleForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1401000, v20, OS_LOG_TYPE_DEFAULT, "Application found", buf, 2u);
    }
    v19 = 1;
LABEL_19:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)rebuildApplicationDataBase
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];

  objc_msgSend_defaultWorkspace(MEMORY[0x1E0CA5878], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_(v4, v5, 1, 0, 0);

  handleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1401000, v8, OS_LOG_TYPE_DEFAULT, "Re building DB successful", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1D140D4B4(v8);
  }

  return v6;
}

@end
