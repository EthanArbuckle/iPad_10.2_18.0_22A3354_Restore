@implementation SetProperty

void __endpoint_SetProperty_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __endpoint_SetProperty_block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __endpoint_SetProperty_block_invoke_48(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __endpoint_SetProperty_block_invoke_48_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __endpoint_SetProperty_block_invoke_50(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __endpoint_SetProperty_block_invoke_50_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __endpoint_SetProperty_block_invoke_51(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __endpoint_SetProperty_block_invoke_51_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __endpoint_SetProperty_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error setting listening mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __endpoint_SetProperty_block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error setting conversationDetect mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __endpoint_SetProperty_block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error setting setSpatialAudioAllowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __endpoint_SetProperty_block_invoke_51_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error setting setSpatialAudioMode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
