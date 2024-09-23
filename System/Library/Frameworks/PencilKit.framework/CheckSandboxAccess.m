@implementation CheckSandboxAccess

void __CheckSandboxAccess_block_invoke()
{
  int v0;
  NSObject *v1;
  void *v2;
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getpid();
  v0 = sandbox_check();
  _MergedGlobals_113 = v0 == 0;
  if (v0)
  {
    v1 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", "com.apple.PencilKit");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bundleIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_1BE213000, v1, OS_LOG_TYPE_ERROR, "Sandbox disabled Scribble for :%@", buf, 0xCu);

    }
  }
}

@end
