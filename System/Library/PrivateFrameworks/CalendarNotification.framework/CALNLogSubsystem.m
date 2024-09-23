@implementation CALNLogSubsystem

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1)
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_14);
  return (OS_os_log *)(id)defaultCategory_logHandle;
}

void __35__CALNLogSubsystem_defaultCategory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.notification", "Default");
  v1 = (void *)defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;

}

+ (OS_os_log)calendar
{
  if (calendar_onceToken != -1)
    dispatch_once(&calendar_onceToken, &__block_literal_global_2_0);
  return (OS_os_log *)(id)calendar_logHandle;
}

void __28__CALNLogSubsystem_calendar__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.notification", "Calendar");
  v1 = (void *)calendar_logHandle;
  calendar_logHandle = (uint64_t)v0;

}

+ (OS_os_log)alarmEngine
{
  if (alarmEngine_onceToken != -1)
    dispatch_once(&alarmEngine_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)alarmEngine_logHandle;
}

void __31__CALNLogSubsystem_alarmEngine__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.notification", "AlarmEngine");
  v1 = (void *)alarmEngine_logHandle;
  alarmEngine_logHandle = (uint64_t)v0;

}

@end
