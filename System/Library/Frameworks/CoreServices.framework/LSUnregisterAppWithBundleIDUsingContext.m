@implementation LSUnregisterAppWithBundleIDUsingContext

void ___LSUnregisterAppWithBundleIDUsingContext_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _LSInstallLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Failed to remove";
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136446978;
    if (a2)
      v7 = "Removed";
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s all handler prefs for bundle ID %@: %{BOOL}i %@", (uint8_t *)&v9, 0x26u);
  }

}

@end
