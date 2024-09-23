@implementation LaunchAppStore

void ___LaunchAppStore_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "_LaunchAppStore_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open App Store : %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

@end
