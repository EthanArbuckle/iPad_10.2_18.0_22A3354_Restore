@implementation GetConnectionToAuthDaemon

void __GetConnectionToAuthDaemon_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int16 data;
  size_t length;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x212BF57E0](a2);
  v4 = MEMORY[0x24BDACFB8];
  if (v3 == MEMORY[0x24BDACFB8])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __GetConnectionToAuthDaemon_block_invoke_cold_1(a2);
  }
  else if (MEMORY[0x212BF57E0](a2) == v4)
  {
    if ((a2 == (void *)MEMORY[0x24BDACF38] || a2 == (void *)MEMORY[0x24BDACF30]) && gAuthdXPCConnection != 0)
    {
      xpc_connection_cancel((xpc_connection_t)gAuthdXPCConnection);
      xpc_release((xpc_object_t)gAuthdXPCConnection);
      gAuthdXPCConnection = 0;
    }
  }
  else if (a2)
  {
    length = 0;
    data = (unsigned __int16)xpc_dictionary_get_data(a2, "certData", &length);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v10 = data;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "data from authd pData:%04lX", buf, 0xCu);
    }
  }
}

void __GetConnectionToAuthDaemon_block_invoke_cold_1(void *a1)
{
  const char *string;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v2 = 136315138;
  v3 = string;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Got unexpected error: %s", (uint8_t *)&v2, 0xCu);
}

@end
