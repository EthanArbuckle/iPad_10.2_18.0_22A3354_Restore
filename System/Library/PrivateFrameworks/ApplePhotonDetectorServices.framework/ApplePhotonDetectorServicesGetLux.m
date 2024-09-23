@implementation ApplePhotonDetectorServicesGetLux

void __ApplePhotonDetectorServicesGetLux_block_invoke_2(uint64_t a1)
{
  disconnect((xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

unsigned __int8 *__ApplePhotonDetectorServicesGetLux_block_invoke_8(unsigned __int8 *result)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = result;
  v2 = result[76];
  if (result[76])
  {
    v3 = *((_QWORD *)result + 4);
    if (*(_QWORD *)v3)
    {
      memcpy(*(void **)v3, *((const void **)result + 5), 4 * v2);
      v3 = *((_QWORD *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    v4 = *(void **)(v3 + 8);
    if (v4)
    {
      memcpy(v4, *((const void **)v1 + 6), 4 * v2);
      v3 = *((_QWORD *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    v5 = *(void **)(v3 + 16);
    if (v5)
    {
      memcpy(v5, *((const void **)v1 + 7), 8 * v2);
      v3 = *((_QWORD *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    result = *(unsigned __int8 **)(v3 + 24);
    if (result)
    {
      result = (unsigned __int8 *)memcpy(result, *((const void **)v1 + 8), v2);
      LOBYTE(v2) = v1[76];
    }
  }
  v6 = *((_QWORD *)v1 + 4);
  *(_BYTE *)(v6 + 36) = v2;
  *(_DWORD *)(v6 + 32) = *((_DWORD *)v1 + 18);
  return result;
}

void __ApplePhotonDetectorServicesGetLux_block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B7F94D4](a2) == MEMORY[0x24BDACFB8])
  {
    if (a2 == MEMORY[0x24BDACF38])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_236A3A000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }
    else
    {
      if (a2 != MEMORY[0x24BDACF30])
      {
        if (a2 != MEMORY[0x24BDACF48] || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }
LABEL_12:
    disconnect((xpc_connection_t *)(*(_QWORD *)(a1[4] + 8) + 40));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_5;
    block[3] = &__block_descriptor_tmp_6;
    v6 = a1[5];
    block[4] = a1[6];
    dispatch_sync(v6, block);
  }
}

uint64_t __ApplePhotonDetectorServicesGetLux_block_invoke_5(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 32) = -536870165;
  return result;
}

@end
