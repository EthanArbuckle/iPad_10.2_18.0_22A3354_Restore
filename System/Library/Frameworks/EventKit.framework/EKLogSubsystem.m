@implementation EKLogSubsystem

+ (OS_os_log)junk
{
  if (junk_onceToken != -1)
    dispatch_once(&junk_onceToken, &__block_literal_global_9);
  return (OS_os_log *)(id)junk_logHandle;
}

void __22__EKLogSubsystem_junk__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "Junk");
  v1 = (void *)junk_logHandle;
  junk_logHandle = (uint64_t)v0;

}

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1)
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_37);
  return (OS_os_log *)(id)defaultCategory_logHandle;
}

void __33__EKLogSubsystem_defaultCategory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "Default");
  v1 = (void *)defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;

}

+ (OS_os_log)autocomplete
{
  if (autocomplete_onceToken != -1)
    dispatch_once(&autocomplete_onceToken, &__block_literal_global_3_1);
  return (OS_os_log *)(id)autocomplete_logHandle;
}

void __30__EKLogSubsystem_autocomplete__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "Autocomplete");
  v1 = (void *)autocomplete_logHandle;
  autocomplete_logHandle = (uint64_t)v0;

}

+ (OS_os_log)availabilitySearch
{
  if (availabilitySearch_onceToken != -1)
    dispatch_once(&availabilitySearch_onceToken, &__block_literal_global_5_0);
  return (OS_os_log *)(id)availabilitySearch_logHandle;
}

void __36__EKLogSubsystem_availabilitySearch__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "AvailabilitySearch");
  v1 = (void *)availabilitySearch_logHandle;
  availabilitySearch_logHandle = (uint64_t)v0;

}

+ (OS_os_log)exchangeSync
{
  if (exchangeSync_onceToken != -1)
    dispatch_once(&exchangeSync_onceToken, &__block_literal_global_7_1);
  return (OS_os_log *)(id)exchangeSync_logHandle;
}

void __30__EKLogSubsystem_exchangeSync__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "ExchangeSync");
  v1 = (void *)exchangeSync_logHandle;
  exchangeSync_logHandle = (uint64_t)v0;

}

+ (OS_os_log)savingSignposts
{
  if (savingSignposts_onceToken != -1)
    dispatch_once(&savingSignposts_onceToken, &__block_literal_global_11_0);
  return (OS_os_log *)(id)savingSignposts_logHandle;
}

void __33__EKLogSubsystem_savingSignposts__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.ek", "SavingSignposts");
  v1 = (void *)savingSignposts_logHandle;
  savingSignposts_logHandle = (uint64_t)v0;

}

@end
