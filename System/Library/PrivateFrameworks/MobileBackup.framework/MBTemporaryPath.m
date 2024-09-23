@implementation MBTemporaryPath

char *__MBTemporaryPath_block_invoke()
{
  char *v0;
  char *result;
  MBException *v2;
  const __CFString *v3;
  char v4[1032];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  strcpy(v4, "/var/tmp/backupd-XXXXXXXXXXXXXXX");
  v0 = mkdtemp(v4);
  sTemporaryPathDir = (uint64_t)v0;
  if (!v0)
  {
    v2 = [MBException alloc];
    v3 = CFSTR("Unable to create /var/tmp/backupd-XXXXXXXXXX directory (mkdtemp)");
    goto LABEL_6;
  }
  result = strdup(v0);
  sTemporaryPathDir = (uint64_t)result;
  if (!result)
  {
    v2 = [MBException alloc];
    v3 = CFSTR("Unable to create /var/tmp/backupd-XXXXXXXXXX directory (strdup)");
LABEL_6:
    objc_exception_throw(-[MBException initWithCode:format:](v2, "initWithCode:format:", 1, v3));
  }
  return result;
}

void __MBTemporaryPath_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  char __str[1025];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!sTemporaryPathDir)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 1, CFSTR("Unable to create /var/tmp/backupd-XXXXXXXXXX directory")));
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", (const char *)sTemporaryPathDir);
  if (mktemp(__str))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(NSObject **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;
  }
  else
  {
    MBGetDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *__error();
      *(_DWORD *)buf = 67109120;
      v14 = v5;
      _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_ERROR, "mktemp failed: %{errno}d", buf, 8u);
      v6 = __error();
      _MBLog(CFSTR("ERROR"), (uint64_t)"mktemp failed: %{errno}d", v7, v8, v9, v10, v11, v12, *v6);
    }
  }

}

@end
