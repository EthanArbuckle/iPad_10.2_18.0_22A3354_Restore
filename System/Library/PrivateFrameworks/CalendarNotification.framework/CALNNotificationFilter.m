@implementation CALNNotificationFilter

+ (BOOL)shouldIgnoreNotificationForEvent:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = objc_msgSend(a3, "junkStatus");
  if (v3 == 1)
  {
    +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CALNNotificationFilter shouldIgnoreNotificationForEvent:].cold.1(v4);

  }
  return v3 == 1;
}

+ (void)shouldIgnoreNotificationForEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215D9B000, log, OS_LOG_TYPE_DEBUG, "Ignoring junk event", v1, 2u);
}

@end
