@implementation GetConnectionToAuthDaemon

void __GetConnectionToAuthDaemon_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  size_t length;

  v3 = MEMORY[0x22E2E9674](a2);
  v4 = MEMORY[0x24BDACFB8];
  if (v3 == MEMORY[0x24BDACFB8])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    syslog(4, "Got unexpected error: %s");
  }
  else if (MEMORY[0x22E2E9674](a2) == v4)
  {
    syslog(4, "%s:%s-%d xpc error\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_xpc_auth_handle_message", 107);
    if ((a2 == (void *)MEMORY[0x24BDACF38] || a2 == (void *)MEMORY[0x24BDACF30]) && __iapauthd_connection != 0)
    {
      xpc_connection_cancel((xpc_connection_t)__iapauthd_connection);
      xpc_release((xpc_object_t)__iapauthd_connection);
      __iapauthd_connection = 0;
    }
  }
  else if (a2)
  {
    syslog(4, "%s:%s-%d getting data from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_xpc_auth_handle_message", 124);
    length = 0;
    if (xpc_dictionary_get_data(a2, "certData", &length) && length)
      syslog(4, "%s:%s-%d got data from authd, len=%d\n");
    else
      syslog(4, "len is 0!\n");
  }
}

@end
