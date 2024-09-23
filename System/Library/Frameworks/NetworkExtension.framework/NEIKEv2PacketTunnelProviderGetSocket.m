@implementation NEIKEv2PacketTunnelProviderGetSocket

void __NEIKEv2PacketTunnelProviderGetSocket_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  void *v11;
  const char *v12;
  NSObject *Property;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v6 = "IKE";
    else
      v6 = "PFKEY";
    v14 = 136315650;
    v15 = "NEIKEv2PacketTunnelProviderGetSocket_block_invoke";
    v16 = 2112;
    v17 = v5;
    v18 = 2080;
    v19 = v6;
    _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "%s: %@: completion handler invoked for %s socket request", (uint8_t *)&v14, 0x20u);
  }

  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dup(objc_msgSend(v3, "fileDescriptor"));
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v14 = 136315650;
      v15 = "NEIKEv2PacketTunnelProviderGetSocket_block_invoke";
      v16 = 2112;
      v17 = v9;
      v18 = 1024;
      LODWORD(v19) = v10;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%s: %@: Got socket %d", (uint8_t *)&v14, 0x1Cu);
    }

    close(objc_msgSend(v3, "fileDescriptor"));
  }
  v11 = *(void **)(a1 + 32);
  if (v11 && objc_getProperty(v11, v7, 160, 1))
  {
    Property = *(NSObject **)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v12, 160, 1);
    dispatch_semaphore_signal(Property);
  }

}

@end
