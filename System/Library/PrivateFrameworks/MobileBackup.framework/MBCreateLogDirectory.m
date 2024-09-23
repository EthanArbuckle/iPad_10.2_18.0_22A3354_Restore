@implementation MBCreateLogDirectory

void __MBCreateLogDirectory_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  MBGetLogDir();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  getpid();
  v4 = objc_retainAutorelease(v1);
  objc_msgSend(v4, "fileSystemRepresentation");
  MBCreateLogDirectory_sCanCreateLogDirectory = sandbox_check() == 0;
  os_log_set_hook();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MBCreateLogDirectory_previousLogHook;
  MBCreateLogDirectory_previousLogHook = v2;

}

void __MBCreateLogDirectory_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (MBCreateLogDirectory_previousLogHook)
    (*(void (**)(void))(MBCreateLogDirectory_previousLogHook + 16))();
  v4 = *(const char **)(a3 + 136);
  if (v4 && !strcmp(v4, "MBSwift"))
  {
    v5 = os_log_copy_message_string();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", os_log_type_get_name());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLogHelper(v7, v8);

      free(v6);
    }
  }
}

@end
