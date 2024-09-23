@implementation AVTInitializeShaderCache

void __AVTInitializeShaderCache_block_invoke()
{
  void *v0;
  id *v1;
  void *v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");
  +[AVTResourceLocator sharedResourceLocator]();
  v1 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v1, (uint64_t)CFSTR("default.metallib"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    MEMORY[0x1DF0D6BC4](v2);
  }
  else
  {
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __AVTInitializeShaderCache_block_invoke_cold_1(v3);

  }
}

void __AVTInitializeShaderCache_block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, v3, "Error: Can't find Metal library at path %@", v4);

  OUTLINED_FUNCTION_5();
}

@end
