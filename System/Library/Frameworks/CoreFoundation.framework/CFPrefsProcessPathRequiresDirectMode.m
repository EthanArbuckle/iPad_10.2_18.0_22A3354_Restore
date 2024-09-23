@implementation CFPrefsProcessPathRequiresDirectMode

void ___CFPrefsProcessPathRequiresDirectMode_block_invoke()
{
  const char *v0;
  int v1;
  const char *v2;
  unint64_t v3;
  size_t v4;
  int v5;
  NSObject *v6;

  v0 = _CFProcessPath();
  v1 = _CFPrefsProcessPathRequiresDirectMode_onBlacklist;
  if (!v0)
    goto LABEL_7;
  if (!_CFPrefsProcessPathRequiresDirectMode_onBlacklist)
  {
    v2 = v0;
    v3 = 0;
    do
    {
      v4 = strlen(off_1E1336C20[v3]);
      v5 = strncmp(off_1E1336C20[v3], v2, v4);
      if (v3 > 8)
        break;
      ++v3;
    }
    while (v5);
    v1 = v5 == 0;
    _CFPrefsProcessPathRequiresDirectMode_onBlacklist = v5 == 0;
LABEL_7:
    if (!v1)
      return;
  }
  v6 = _CFPrefsClientLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    ___CFPrefsProcessPathRequiresDirectMode_block_invoke_cold_1(v6);
}

void ___CFPrefsProcessPathRequiresDirectMode_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182A8C000, log, OS_LOG_TYPE_DEBUG, "NSUserDefaults/CFPreferences is doing direct file access for this process", v1, 2u);
  OUTLINED_FUNCTION_2_16();
}

@end
