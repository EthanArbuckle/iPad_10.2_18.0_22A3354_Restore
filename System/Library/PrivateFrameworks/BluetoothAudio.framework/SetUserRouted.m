@implementation SetUserRouted

void __endpoint_SetUserRouted_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      __endpoint_SetUserRouted_block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __endpoint_SetUserRouted_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = 138412802;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_21B151000, log, OS_LOG_TYPE_ERROR, "Set UserRouted failed: device %@, value %d, error %@", (uint8_t *)&v5, 0x1Cu);
}

@end
