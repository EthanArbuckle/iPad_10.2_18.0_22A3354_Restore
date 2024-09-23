@implementation FigRoutingManagerRetryAddingEndpointToAggregate

void __FigRoutingManagerRetryAddingEndpointToAggregate_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  if (dword_1EE2B3E28)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRoutingManagerAddEndpointToAggregate(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(const void **)(a1 + 64), *(const void **)(a1 + 72), *(const void **)(a1 + 80), *(_QWORD *)(a1 + 88));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 64);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 72);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 80);
  if (v8)
    CFRelease(v8);
}

@end
