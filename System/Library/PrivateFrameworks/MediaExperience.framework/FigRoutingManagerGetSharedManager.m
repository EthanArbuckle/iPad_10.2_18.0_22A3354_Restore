@implementation FigRoutingManagerGetSharedManager

uint64_t __FigRoutingManagerGetSharedManager_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v1;
  NSObject *v2;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1EE2B3E28 < 0x100)
  {
    if (dword_1EE2B3E28)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    dword_1EE2B3E28 = 0;
  }
  v1 = MXGetSerialQueue();
  qword_1EE2B2880 = v1;
  if (v1)
  {
    FigRoutingManagerContextUtilities_Create((uint64_t)routingManager_pickingTimeoutCallback, v1);
    unk_1EE2B28B0 = FigSimpleMutexCreate();
    byte_1EE2B28A1 = 0;
    unk_1EE2B28C0 = 0;
    unk_1EE2B28B8 = 0;
  }
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1EE2B2888 = (uint64_t)dispatch_queue_create("com.apple.coremedia.routingManager.notificationQueue", v2);
  return FigRoutingManagerCreateEndpointManagers();
}

@end
