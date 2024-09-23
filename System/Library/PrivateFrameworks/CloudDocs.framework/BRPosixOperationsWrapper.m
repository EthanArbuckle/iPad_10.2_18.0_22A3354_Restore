@implementation BRPosixOperationsWrapper

+ (void)exitProcess:(int)a3
{
  exit(a3);
}

+ (int)open:(id)a3 flags:(int)a4
{
  return open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), a4);
}

+ (int)closeFD:(int)a3
{
  return close(a3);
}

+ (unint64_t)getFileIDOfURL:(id)a3 withError:(id *)a4
{
  int v5;
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;

  v5 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 2129924);
  if (v5 < 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return *__error();
  }
  else
  {
    v9 = 0;
    v8 = xmmword_19CC7DA4C;
    memset(v7, 0, 12);
    if (fgetattrlist(v5, &v8, v7, 0xCuLL, 0x20u) >= 0)
      return *(_QWORD *)((char *)v7 + 4);
    else
      return 0;
  }
}

+ (int64_t)consumeSandboxExtension:(id)a3 error:(id *)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v5 = sandbox_extension_consume();
  if (v5 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      brc_bread_crumbs((uint64_t)"+[BRPosixOperationsWrapper consumeSandboxExtension:error:]", 69);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        v10 = "(passed to caller)";
        v11 = 136315906;
        v12 = "+[BRPosixOperationsWrapper consumeSandboxExtension:error:]";
        v13 = 2080;
        if (!a4)
          v10 = "(ignored by caller)";
        v14 = v10;
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v11, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v6);

  }
  return v5;
}

+ (void)releaseSandboxExtensionHandle:(int64_t)a3
{
  sandbox_extension_release();
}

@end
