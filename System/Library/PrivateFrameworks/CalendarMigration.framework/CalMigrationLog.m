@implementation CalMigrationLog

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1)
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_1);
  return (OS_os_log *)(id)defaultCategory_logHandle;
}

void __34__CalMigrationLog_defaultCategory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.migration", "Default");
  v1 = (void *)defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;

}

+ (OS_os_log)calendar
{
  if (calendar_onceToken != -1)
    dispatch_once(&calendar_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)calendar_logHandle;
}

void __27__CalMigrationLog_calendar__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.migration", "Calendar");
  v1 = (void *)calendar_logHandle;
  calendar_logHandle = (uint64_t)v0;

}

+ (OS_os_log)reminders
{
  if (reminders_onceToken != -1)
    dispatch_once(&reminders_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)reminders_logHandle;
}

void __28__CalMigrationLog_reminders__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.migration", "Reminders");
  v1 = (void *)reminders_logHandle;
  reminders_logHandle = (uint64_t)v0;

}

@end
