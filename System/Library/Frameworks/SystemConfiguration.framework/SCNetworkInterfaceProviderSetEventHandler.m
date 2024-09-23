@implementation SCNetworkInterfaceProviderSetEventHandler

void __SCNetworkInterfaceProviderSetEventHandler_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v1 + 72))
  {
    v2 = __log_SCNetworkConfiguration();
    v3 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v2, (os_log_type_t)v3))
      return;
LABEL_6:
    v4 = (char *)v6 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v5 + 4) = "SCNetworkInterfaceProviderSetEventHandler_block_invoke";
    __SC_log_send(5, (uint64_t)v2, v3, v4);
    return;
  }
  if (*(_QWORD *)(v1 + 48))
  {
    v2 = __log_SCNetworkConfiguration();
    v3 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v2, (os_log_type_t)v3))
      return;
    goto LABEL_6;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = _Block_copy(*(const void **)(a1 + 32));
}

@end
