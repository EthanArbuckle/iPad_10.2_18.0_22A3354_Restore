@implementation APDatabaseFileUtilities

+ (void)removeDatabaseAtPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_databaseDirectory(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(v11, v12, (uint64_t)v7, v13))
  {
    v30 = 0;
    v15 = objc_msgSend_removeItemAtPath_error_(v11, v14, (uint64_t)v7, (uint64_t)&v30);
    v16 = v30;
    if ((v15 & 1) == 0)
    {
      APLogForCategory(0xBuLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_opt_class();
        v19 = v18;
        objc_msgSend_localizedFailureReason(v16, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v16, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v32 = v18;
        v33 = 2114;
        v34 = v23;
        v35 = 2114;
        v36 = v27;
        _os_log_impl(&dword_1CF251000, v17, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to Remove Database: %{public}@ %{public}@", buf, 0x20u);

      }
      objc_msgSend__moveCorruptedFileAtPath_(APDatabaseFileUtilities, v28, (uint64_t)v3, v29);
    }

  }
}

+ (void)_moveCorruptedFileAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = dispatch_queue_create("com.apple.ap.database.corruptedfile.queue", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CF2840F0;
  v7[3] = &unk_1E8C48960;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

@end
