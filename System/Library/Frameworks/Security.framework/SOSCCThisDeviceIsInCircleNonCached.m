@implementation SOSCCThisDeviceIsInCircleNonCached

uint64_t __SOSCCThisDeviceIsInCircleNonCached_block_invoke(uint64_t a1)
{
  uint64_t (*v2)(_QWORD);
  xpc_object_t message;
  void *v5;
  void *v6;
  void *v7;
  int64_t int64;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (gSecurityd)
  {
    v2 = *(uint64_t (**)(_QWORD))(gSecurityd + 232);
    if (v2)
      return v2(*(_QWORD *)(a1 + 32));
  }
  message = securityd_create_message(0x31u, *(CFTypeRef **)(a1 + 32));
  v5 = message;
  if (message)
  {
    v6 = (void *)securityd_message_with_reply_sync(message, *(_QWORD *)(a1 + 32));
    v7 = v6;
    if (v6)
    {
      if (!xpc_dictionary_entry_is_type(v6))
      {
        int64 = 0xFFFFFFFFLL;
        goto LABEL_12;
      }
      int64 = xpc_dictionary_get_int64(v7, "status");
      if ((int64 & 0x80000000) != 0)
      {
LABEL_12:
        if (securityd_message_no_error((uint64_t)v7, *(CFErrorRef **)(a1 + 32)))
        {
          v9 = (void *)MEMORY[0x18D771774](v7);
          SecCFCreateErrorWithFormat(0, (const __CFString *)sSecXPCErrorDomain, 0, *(CFTypeRef **)(a1 + 32), v10, CFSTR("Remote error occurred/no info: %s"), v11, v12, (char)v9);
          free(v9);
        }
      }
    }
    else
    {
      int64 = 0xFFFFFFFFLL;
    }

    goto LABEL_15;
  }
  int64 = 0xFFFFFFFFLL;
LABEL_15:
  secLogObjForScope("circleOps");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = int64;
    _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "Retrieved non-cached circle value %d", buf, 8u);
  }

  return int64;
}

@end
