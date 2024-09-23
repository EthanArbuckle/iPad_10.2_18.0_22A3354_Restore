@implementation BWMetadataTimeMachineRequest

- (BWMetadataTimeMachineRequest)init
{
  BWMetadataTimeMachineRequest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWMetadataTimeMachineRequest;
  v2 = -[BWMetadataTimeMachineRequest init](&v4, sel_init);
  if (v2)
    v2->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataTimeMachineRequest;
  -[BWMetadataTimeMachineRequest dealloc](&v3, sel_dealloc);
}

- (void)waitForCompletionWithTimeout:(float)a3
{
  NSObject *semaphore;
  dispatch_time_t v4;
  BOOL v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  semaphore = self->_semaphore;
  v4 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  if (dispatch_semaphore_wait(semaphore, v4))
    v5 = dword_1EE6BE758 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)complete
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE6BE758)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

@end
