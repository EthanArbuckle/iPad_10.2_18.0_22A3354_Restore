@implementation NSURL(ICTesting)

- (void)ic_updateFlagToExcludeFromBackupNow:()ICTesting
{
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.notes", "Application");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  v7 = *MEMORY[0x1E0C9AC90];
  if (v6)
  {
    *(_DWORD *)buf = 138412802;
    v17 = v7;
    v18 = 1024;
    v19 = a3;
    v20 = 2112;
    v21 = a1;
    _os_log_debug_impl(&dword_1DDAA5000, v5, OS_LOG_TYPE_DEBUG, "Updating backup exclusion flag %@ to %d for %@", buf, 0x1Cu);
  }

  v8 = *MEMORY[0x1E0C999D8];
  v24[1] = v7;
  v25[0] = MEMORY[0x1E0C9AAA0];
  v24[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v11 = objc_msgSend(a1, "setResourceValues:error:", v10, &v15);
  v12 = v15;
  v13 = v12;
  if ((v11 & 1) == 0 && objc_msgSend(v12, "code") != 4)
  {
    v14 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v17 = v7;
      v18 = 1024;
      v19 = a3;
      v20 = 2112;
      v21 = a1;
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_1DDAA5000, v14, OS_LOG_TYPE_ERROR, "Error marking %@=%d for %@: %@", buf, 0x26u);
    }

  }
}

@end
