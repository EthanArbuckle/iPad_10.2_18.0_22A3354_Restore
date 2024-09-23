@implementation MXInitialization

+ (void)waitUntilMXIsFullyInitialized
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)sIsMXFullyInitializedCondition, "lock");
  if ((sIsMXFullyInitialized & 1) == 0)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now", v4, v6);
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend((id)sIsMXFullyInitializedCondition, "wait", v5, v7);
      if (dword_1EE2B3F38)
      {
        v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    while (sIsMXFullyInitialized != 1);
  }
  objc_msgSend((id)sIsMXFullyInitializedCondition, "unlock", v4, v6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sIsMXFullyInitialized = 0;
    sIsMXFullyInitializedCondition = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3530]);
  }
}

+ (void)notifyMXIsFullyInitialized
{
  if (notifyMXIsFullyInitialized_onceToken != -1)
    dispatch_once(&notifyMXIsFullyInitialized_onceToken, &__block_literal_global_32);
}

uint64_t __46__MXInitialization_notifyMXIsFullyInitialized__block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)sIsMXFullyInitializedCondition, "lock");
  sIsMXFullyInitialized = 1;
  objc_msgSend((id)sIsMXFullyInitializedCondition, "broadcast");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)sIsMXFullyInitializedCondition, "unlock", v2, v3);
}

@end
