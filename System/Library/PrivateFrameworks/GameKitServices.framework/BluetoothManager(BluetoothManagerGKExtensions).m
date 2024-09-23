@implementation BluetoothManager(BluetoothManagerGKExtensions)

- (uint64_t)localDeviceSupportsService:()BluetoothManagerGKExtensions
{
  if (!*(_QWORD *)(a1 + (int)*MEMORY[0x24BE0F9E8]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:].cold.1();
    }
    return -1;
  }
  if (BTLocalDeviceSupportsService())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:].cold.2();
    }
    return -1;
  }
  return 0;
}

- (void)localDeviceSupportsService:()BluetoothManagerGKExtensions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d no local BT device in the BT manager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)localDeviceSupportsService:()BluetoothManagerGKExtensions .cold.2()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  v4 = v0;
  v5 = "-[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:]";
  v6 = 1024;
  v7 = 41;
  v8 = 1024;
  v9 = v1;
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v2, (uint64_t)v2, " [%s] %s:%d Could not check bluetooth to see if service supported. %d", v3);
  OUTLINED_FUNCTION_12();
}

@end
