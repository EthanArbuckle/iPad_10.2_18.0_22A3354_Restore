@implementation SetupTERMSignalHandler

void __feServer_SetupTERMSignalHandler_block_invoke()
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  signal(15, (void (__cdecl *)(int))1);
  feServer_SetupTERMSignalHandler_serverDispatchSource = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)feServer_SetupTERMSignalHandler_serverDispatchSource, &__block_literal_global_42);
  dispatch_resume((dispatch_object_t)feServer_SetupTERMSignalHandler_serverDispatchSource);
}

void __feServer_SetupTERMSignalHandler_block_invoke_2()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v1;
  uint64_t v2;
  unsigned int v3;
  char *v4;
  char v5;
  os_log_type_t v6;
  int v7;

  v7 = 0;
  v6 = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 0, &v7, &v6);
  v1 = v7;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v6))
    v3 = v1;
  else
    v3 = v1 & 0xFFFFFFFE;
  if (v3)
  {
    v4 = (char *)_os_log_send_and_compose_impl();
    LOBYTE(v1) = v7;
  }
  else
  {
    v4 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 0, 1, v4, v4 != &v5, v1, 0, v2);
  exit(0);
}

@end
