@implementation CDSystemTimeCallbackScheduler

void __48___CDSystemTimeCallbackScheduler_sharedInstance__block_invoke()
{
  _CDSystemTimeCallbackScheduler *v0;
  void *v1;
  id v2;
  id v3;
  _QWORD handler[4];
  id v5;

  v0 = -[_CDSystemTimeCallbackScheduler initWithEventNameRoot:]([_CDSystemTimeCallbackScheduler alloc], "initWithEventNameRoot:", CFSTR("com.apple.ContextStore"));
  v1 = (void *)sharedInstance_scheduler;
  sharedInstance_scheduler = (uint64_t)v0;

  v2 = (id)sharedInstance_scheduler;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __48___CDSystemTimeCallbackScheduler_sharedInstance__block_invoke_cold_1();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler_block_invoke;
  handler[3] = &unk_1E26D5960;
  v5 = v2;
  v3 = v2;
  xpc_set_event_stream_handler("com.apple.alarm", 0, handler);

}

void __48___CDSystemTimeCallbackScheduler_sharedInstance__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Registering xpc_set_event_stream_handler(\"com.apple.alarm\", v0, 2u);
}

@end
