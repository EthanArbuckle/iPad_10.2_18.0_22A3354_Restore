@implementation MLRExtensionPrincipalClass

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MLRExtensionPrincipalClass beginRequestWithExtensionContext:].cold.1((uint64_t)v3, v4);

  }
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_error_impl(&dword_2112F5000, a2, OS_LOG_TYPE_ERROR, "Failed to get correct context with context class=%@", (uint8_t *)&v3, 0xCu);
}

@end
