@implementation CFPrefsDirectMode

void ___CFPrefsDirectMode_block_invoke()
{
  int v0;
  NSObject *v1;

  forceDirect = getenv("__CFPREFERENCES_AVOID_DAEMON") != 0;
  if (xpc_user_sessions_enabled())
    xpc_user_sessions_get_session_uid();
  getpid();
  v0 = sandbox_check();
  if (v0)
  {
    v1 = _CFPrefsClientLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      ___CFPrefsDirectMode_block_invoke_cold_1(v1);
  }
  forceDirect = (v0 | forceDirect) != 0;
}

void ___CFPrefsDirectMode_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182A8C000, log, OS_LOG_TYPE_FAULT, "forcing direct access mode on for this process. It's slower, uses more memory, and doesn't respond to changes immediately. Update your sandbox profile to allow cfprefsd access!", v1, 2u);
  OUTLINED_FUNCTION_2_16();
}

@end
