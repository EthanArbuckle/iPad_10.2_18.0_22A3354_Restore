@implementation NSString(GSExtensions)

+ (id)gs_stringWithFileSystemRepresentation:()GSExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", a3, strlen(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)validateGSName:()GSExtensions
{
  return objc_msgSend(a1, "validateGSNameAllowingDot:error:", 0, a3);
}

- (uint64_t)validateGSNameAllowingDot:()GSExtensions error:
{
  void *v7;
  NSObject *v8;
  id v10;

  if ((unint64_t)objc_msgSend(a1, "length") <= 0xFE && objc_msgSend(a1, "length"))
  {
    if ((a3 & 1) != 0 || objc_msgSend(a1, "characterAtIndex:", 0) != 46)
    {
      v10 = objc_retainAutorelease(a1);
      if (!strchr((char *)objc_msgSend(v10, "fileSystemRepresentation"), 47))
        return 1;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Name [%@]"), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
LABEL_8:
      GSAdditionCreationInfoValidate_cold_2();
  }

  if (a4)
  {
    _GSErrorForStatus(105, v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)gs_issueExtension:()GSExtensions error:
{
  id v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;

  v6 = objc_retainAutorelease(a1);
  objc_msgSend(v6, "fileSystemRepresentation");
  v7 = sandbox_extension_issue_file();
  if (v7)
  {
    v8 = (const char *)v7;
    gs_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NSString(GSExtensions) gs_issueExtension:error:].cold.2(a3, (uint64_t)v6, v9);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v8, strlen(v8) + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*__error() != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to issue [%s] extension for <%@>"), a3, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[NSString(GSExtensions) gs_issueExtension:error:].cold.1((uint64_t)v11, v12, v13);

      if (a4)
      {
        _GSErrorForErrno(v12, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    v10 = 0;
  }
  return v10;
}

- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions
{
  id v1;
  void *v2;
  uint64_t v4;

  v1 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v1, "fileSystemRepresentation");
  if (sandbox_check_by_audit_token())
  {
    objc_msgSend(v1, "gs_issueExtension:error:", "com.apple.revisiond.revision", 0, v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)gs_stringByUpdatingPathExtensionWithPathOrURL:()GSExtensions
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a1, "pathExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E9772CD0;
  v8 = v7;

  objc_msgSend(v4, "pathExtension");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E9772CD0;
  v11 = v10;

  if (-[__CFString caseInsensitiveCompare:](v11, "caseInsensitiveCompare:", v8))
  {
    objc_msgSend(a1, "stringByDeletingPathExtension");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v11, "length"))
    {
      objc_msgSend(v12, "stringByAppendingPathExtension:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
  }
  else
  {
    v12 = a1;
  }

  return v12;
}

- (void)gs_issueExtension:()GSExtensions error:.cold.1(uint64_t a1, int __errnum, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 138412802;
  v5 = a1;
  v6 = 1024;
  v7 = __errnum;
  v8 = 2080;
  v9 = strerror(__errnum);
  _os_log_debug_impl(&dword_1D414C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; error %d (%s)", (uint8_t *)&v4, 0x1Cu);
}

- (void)gs_issueExtension:()GSExtensions error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D414C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Issued [%s] extension to <%@>", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
