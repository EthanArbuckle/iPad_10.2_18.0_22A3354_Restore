@implementation NeroValeriaListenerCreate

void __NeroValeriaListenerCreate_block_invoke(uint64_t a1, int a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  char *v7;
  os_log_type_t type;
  int v9[2];
  const char *v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 == 1684628836)
  {
    v9[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v9, &type);
    v4 = v9[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      v9[1] = 136315138;
      v10 = "NeroValeriaListenerCreate_block_invoke";
      v7 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v9[0];
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v7, v7 != &v11, v4, 0, v5);
  }
  else if (a2 == 1651470958)
  {
    NeroTransportStopAcceptingConnections(**(_QWORD **)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
