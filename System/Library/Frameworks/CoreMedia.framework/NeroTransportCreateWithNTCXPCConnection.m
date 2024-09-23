@implementation NeroTransportCreateWithNTCXPCConnection

void __NeroTransportCreateWithNTCXPCConnection_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  uint64_t v4;
  unsigned int v5;
  char *v6;
  os_log_type_t type;
  int v8;
  CFTypeRef cf;
  int v10;
  const char *v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  cf = 0;
  NeroTransportCreateWithNTCXPCConnection_err = FigTransportConnectionXPCClientCreate(*(_QWORD *)(a1 + 32), &cf);
  if (!NeroTransportCreateWithNTCXPCConnection_err)
  {
    NeroTransportCreateWithNTCXPCConnection_err = NeroTransportCreate(*(_QWORD *)(a1 + 32), cf, &NeroTransportCreateWithNTCXPCConnection_transport);
    if (!NeroTransportCreateWithNTCXPCConnection_err)
    {
      *(_BYTE *)(NeroTransportCreateWithNTCXPCConnection_transport + 72) = 1;
      v8 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v8, &type);
      v3 = v8;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v5 = v3;
      else
        v5 = v3 & 0xFFFFFFFE;
      if (v5)
      {
        v10 = 136315138;
        v11 = "NeroTransportCreateWithNTCXPCConnection_block_invoke";
        v6 = (char *)_os_log_send_and_compose_impl();
        LOBYTE(v3) = v8;
      }
      else
      {
        v6 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v6, v6 != &v12, v3, 0, v4);
    }
  }
  if (cf)
    CFRelease(cf);
}

@end
