@implementation GDDaemonEventHandlers

+ (void)registerForLaunchEvents
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  GDDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C0771000, v2, OS_LOG_TYPE_DEFAULT, "GDDaemonEventHandlers: registerLaunchEventHandlers called", v4, 2u);
  }

  v3 = MEMORY[0x1E0C80D38];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], &unk_1E7A496D0);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v3, &unk_1E7A496F0);

  xpc_set_event_stream_handler("com.apple.locationd-events", v3, &unk_1E7A49710);
}

@end
