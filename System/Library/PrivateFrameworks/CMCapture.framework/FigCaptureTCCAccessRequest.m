@implementation FigCaptureTCCAccessRequest

uint64_t __FigCaptureTCCAccessRequest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t authorization_right;
  uint64_t (*v5)(void);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a2 && !a3)
  {
    authorization_right = tcc_authorization_record_get_authorization_right();
    if (authorization_right < 2 || authorization_right == 3)
    {
      v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      return v5();
    }
    if (authorization_right == 2)
    {
      v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      return v5();
    }
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

@end
