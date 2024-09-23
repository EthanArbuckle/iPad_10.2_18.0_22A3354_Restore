@implementation IXFrameworkBundle

void __IXFrameworkBundle_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  +[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "frameworkURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)IXFrameworkBundle_sharedFrameworkBundle;
  IXFrameworkBundle_sharedFrameworkBundle = v2;

  if (!IXFrameworkBundle_sharedFrameworkBundle)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __IXFrameworkBundle_block_invoke_cold_1();

  }
}

void __IXFrameworkBundle_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to load bundle for our framework at %@", v2, v3, v4, v5, 2u);
}

@end
