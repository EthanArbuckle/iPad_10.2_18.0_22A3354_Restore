@implementation CalFoundationLogSubsystem

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1)
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global);
  return (OS_os_log *)(id)defaultCategory_logHandle;
}

void __44__CalFoundationLogSubsystem_defaultCategory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Default");
  v1 = (void *)defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;

}

+ (OS_os_log)accounts
{
  if (accounts_onceToken != -1)
    dispatch_once(&accounts_onceToken, &__block_literal_global_3);
  return (OS_os_log *)(id)accounts_logHandle;
}

void __37__CalFoundationLogSubsystem_accounts__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Accounts");
  v1 = (void *)accounts_logHandle;
  accounts_logHandle = (uint64_t)v0;

}

+ (OS_os_log)contacts
{
  if (contacts_onceToken != -1)
    dispatch_once(&contacts_onceToken, &__block_literal_global_5);
  return (OS_os_log *)(id)contacts_logHandle;
}

void __37__CalFoundationLogSubsystem_contacts__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Contacts");
  v1 = (void *)contacts_logHandle;
  contacts_logHandle = (uint64_t)v0;

}

+ (OS_os_log)eventTimer
{
  if (eventTimer_onceToken != -1)
    dispatch_once(&eventTimer_onceToken, &__block_literal_global_7);
  return (OS_os_log *)(id)eventTimer_logHandle;
}

void __39__CalFoundationLogSubsystem_eventTimer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "EventTimer");
  v1 = (void *)eventTimer_logHandle;
  eventTimer_logHandle = (uint64_t)v0;

}

+ (OS_os_log)junk
{
  if (junk_onceToken != -1)
    dispatch_once(&junk_onceToken, &__block_literal_global_9);
  return (OS_os_log *)(id)junk_logHandle;
}

void __33__CalFoundationLogSubsystem_junk__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Junk");
  v1 = (void *)junk_logHandle;
  junk_logHandle = (uint64_t)v0;

}

+ (OS_os_log)locations
{
  if (locations_onceToken != -1)
    dispatch_once(&locations_onceToken, &__block_literal_global_11);
  return (OS_os_log *)(id)locations_logHandle;
}

void __38__CalFoundationLogSubsystem_locations__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Locations");
  v1 = (void *)locations_logHandle;
  locations_logHandle = (uint64_t)v0;

}

+ (OS_os_log)memory
{
  if (memory_onceToken != -1)
    dispatch_once(&memory_onceToken, &__block_literal_global_13);
  return (OS_os_log *)(id)memory_logHandle;
}

void __35__CalFoundationLogSubsystem_memory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Memory");
  v1 = (void *)memory_logHandle;
  memory_logHandle = (uint64_t)v0;

}

+ (OS_os_log)messageTrace
{
  if (messageTrace_onceToken != -1)
    dispatch_once(&messageTrace_onceToken, &__block_literal_global_15);
  return (OS_os_log *)(id)messageTrace_logHandle;
}

void __41__CalFoundationLogSubsystem_messageTrace__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "MessageTrace");
  v1 = (void *)messageTrace_logHandle;
  messageTrace_logHandle = (uint64_t)v0;

}

+ (OS_os_log)suggestions
{
  if (suggestions_onceToken != -1)
    dispatch_once(&suggestions_onceToken, &__block_literal_global_17);
  return (OS_os_log *)(id)suggestions_logHandle;
}

void __40__CalFoundationLogSubsystem_suggestions__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.foundation", "Suggestions");
  v1 = (void *)suggestions_logHandle;
  suggestions_logHandle = (uint64_t)v0;

}

@end
