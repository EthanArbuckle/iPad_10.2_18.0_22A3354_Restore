@implementation MXAlarmEvents

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_47);
  return (id)sharedInstance_sSharedInstance_5;
}

void __31__MXAlarmEvents_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance_5 = objc_alloc_init(MXAlarmEvents);
  objc_msgSend((id)sharedInstance_sSharedInstance_5, "resetAlarmEvent:", CFSTR("com.apple.mediaexperience.silentmode.timer"));
  xpc_set_event_stream_handler("com.apple.alarm", *(dispatch_queue_t *)(sharedInstance_sSharedInstance_5 + 8), &__block_literal_global_4_2);
}

uint64_t __31__MXAlarmEvents_sharedInstance__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)sharedInstance_sSharedInstance_5, "handleAlarmEventNotification:", a2);
}

- (MXAlarmEvents)init
{
  MXAlarmEvents *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MXAlarmEvents;
  v2 = -[MXAlarmEvents init](&v6, sel_init);
  if (v2)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MXAlarmEvents", v4);
  }
  return v2;
}

- (void)handleAlarmEventNotification:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  FigXPCMessageCopyCFString();
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (void)setAlarmEvent:(double)a3 eventName:(id)a4
{
  NSObject *mAccessQueue;
  _QWORD v5[6];

  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MXAlarmEvents_setAlarmEvent_eventName___block_invoke;
  v5[3] = &unk_1E309DAB0;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  MXDispatchAsync((uint64_t)"-[MXAlarmEvents setAlarmEvent:eventName:]", (uint64_t)"MXAlarmEvents.m", 92, 0, 0, mAccessQueue, (uint64_t)v5);
}

void __41__MXAlarmEvents_setAlarmEvent_eventName___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  __uint64_t v3;
  unint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend(*(id *)(a1 + 32), "UTF8String");
  xpc_set_event();
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v4 = (unint64_t)(*(double *)(a1 + 40) * 1000000000.0);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  xpc_dictionary_set_uint64(v2, "Date", v3 + v4);
  xpc_dictionary_set_string(v2, "Type", "Monotonic");
  objc_msgSend(*(id *)(a1 + 32), "UTF8String");
  xpc_set_event();
  xpc_release(v2);
}

- (void)resetAlarmEvent:(id)a3
{
  NSObject *mAccessQueue;
  _QWORD v4[5];

  mAccessQueue = self->mAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__MXAlarmEvents_resetAlarmEvent___block_invoke;
  v4[3] = &unk_1E3099900;
  v4[4] = a3;
  MXDispatchAsync((uint64_t)"-[MXAlarmEvents resetAlarmEvent:]", (uint64_t)"MXAlarmEvents.m", 111, 0, 0, mAccessQueue, (uint64_t)v4);
}

uint64_t __33__MXAlarmEvents_resetAlarmEvent___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "UTF8String", v4, v5);
  return xpc_set_event();
}

@end
