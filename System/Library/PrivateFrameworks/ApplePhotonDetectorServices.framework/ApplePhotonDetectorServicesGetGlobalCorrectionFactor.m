@implementation ApplePhotonDetectorServicesGetGlobalCorrectionFactor

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B7F94D4](a2) == MEMORY[0x24BDACFB8])
  {
    if (a2 == MEMORY[0x24BDACF38])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_236A3A000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      if (a2 != MEMORY[0x24BDACF30])
      {
        if (a2 != MEMORY[0x24BDACF48] || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        v4 = MEMORY[0x24BDACB70];
        v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }
LABEL_12:
    disconnect((xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2(uint64_t a1)
{
  disconnect((xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

@end
