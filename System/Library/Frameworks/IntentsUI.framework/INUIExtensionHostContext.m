@implementation INUIExtensionHostContext

void __64___INUIExtensionHostContext__errorHandlingExtensionContextProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[_INUIExtensionHostContext _errorHandlingExtensionContextProxy]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve extension context: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

@end
