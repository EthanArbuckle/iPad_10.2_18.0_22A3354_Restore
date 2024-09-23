@implementation BTLocalDeviceGetSharingAddresses

void __BTLocalDeviceGetSharingAddresses_block_invoke(_QWORD *a1, xpc_object_t xdict)
{
  xpc_object_t value;
  uint64_t v5;
  size_t v6;
  void *v7;
  const void *data;
  size_t v9;
  size_t length;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_array_get_count(value);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (a1[6] <= v6)
        break;
      length = 0;
      v7 = (void *)(a1[7] + v5);
      data = xpc_array_get_data(value, v6, &length);
      v9 = length >= 6 ? 6 : length;
      memcpy(v7, data, v9);
      ++v6;
      v5 += 6;
    }
    while (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > v6);
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceGetSharingAddresses_block_invoke_cold_1();
}

void __BTLocalDeviceGetSharingAddresses_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdLocalDeviceGetSharingAddressesMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
