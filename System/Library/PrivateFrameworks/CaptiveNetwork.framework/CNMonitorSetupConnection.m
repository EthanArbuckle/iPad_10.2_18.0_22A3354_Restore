@implementation CNMonitorSetupConnection

void __CNMonitorSetupConnection_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v4;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  NSObject *logger;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t buf[4];
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  TypeID = CFArrayGetTypeID();
  if (a3)
  {
    if (CFGetTypeID(a3) == TypeID && (Count = CFArrayGetCount(a3)) != 0)
    {
      v7 = Count;
      if (Count >= 1)
      {
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a3, 0);
          v9 = CFDictionaryGetTypeID();
          if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v9)
          {
            (*(void (**)(uint64_t, const void *))(v4 + 40))(v4, ValueAtIndex);
          }
          else
          {
            logger = mysyslog_get_logger();
            v11 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v11))
            {
              *(_DWORD *)buf = 138412290;
              v15 = ValueAtIndex;
              _os_log_impl(&dword_2064D4000, logger, v11, "command is not a dictionary %@", buf, 0xCu);
            }
          }
          --v7;
        }
        while (v7);
      }
    }
    else
    {
      v12 = mysyslog_get_logger();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2064D4000, v12, v13, "given invalid command list", buf, 2u);
      }
    }
  }
}

void __CNMonitorSetupConnection_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t *v4;
  NSObject *logger;
  os_log_type_t v6;
  uint8_t v7[16];

  if (a3)
  {
    v4 = *(uint64_t **)(a1 + 32);
    if (!*v4)
    {
      *v4 = a2;
      ServerConnectionResume(a2);
      v4 = *(uint64_t **)(a1 + 32);
    }
    CNMonitorSyncState((uint64_t)v4);
  }
  else
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2064D4000, logger, v6, "Reconnect failed", v7, 2u);
    }
  }
}

void __CNMonitorSetupConnection_block_invoke_8(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v2;
  uint8_t v3[16];

  if (!ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", *(_DWORD *)(*(_QWORD *)(a1 + 48) + 36), 0, *(const void **)(a1 + 32), *(const void **)(a1 + 40)))
  {
    logger = mysyslog_get_logger();
    v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2064D4000, logger, v2, "ServerConnectionCreate failed", v3, 2u);
    }
  }
}

@end
