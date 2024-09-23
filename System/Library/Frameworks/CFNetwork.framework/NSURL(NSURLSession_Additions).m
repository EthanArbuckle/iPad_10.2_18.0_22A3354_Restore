@implementation NSURL(NSURLSession_Additions)

- (BOOL)_isSafeFileForBackgroundUploadForMe
{
  pid_t v2;
  int v3;
  _BOOL8 result;

  v2 = getpid();
  v3 = objc_msgSend(a1, "isFileURL");
  result = 0;
  if (v3)
  {
    if ((v2 & 0x80000000) == 0)
    {
      objc_msgSend(a1, "fileSystemRepresentation");
      return sandbox_check() == 0;
    }
  }
  return result;
}

- (BOOL)_isSafeDirectoryForDownloads:()NSURLSession_Additions withToken:
{
  int v5;
  _BOOL8 v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "isFileURL");
  v6 = 0;
  if ((a3 & 0x80000000) == 0 && v5)
  {
    objc_msgSend(a1, "fileSystemRepresentation");
    v7 = sandbox_check_by_audit_token();
    v6 = v7 == 0;
    if (v7)
    {
      v8 = v7;
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v9 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        v14 = *__error();
        *(_DWORD *)buf = 67109632;
        v17 = v8;
        v18 = 1024;
        v19 = a3;
        v20 = 1024;
        v21 = v14;
        _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, "sandbox_check_by_audit_token() returned %d for operation file-read-data for pid %d, errno %d", buf, 0x14u);
      }
    }
    v10 = sandbox_check_by_audit_token();
    if (v10)
    {
      v11 = v10;
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v12 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        v15 = *__error();
        *(_DWORD *)buf = 67109632;
        v17 = v11;
        v18 = 1024;
        v19 = a3;
        v20 = 1024;
        v21 = v15;
        _os_log_error_impl(&dword_183ECA000, v12, OS_LOG_TYPE_ERROR, "sandbox_check_by_audit_token() returned %d for operation file-write-data for pid %d, errno %d", buf, 0x14u);
      }
      return 0;
    }
  }
  return v6;
}

@end
