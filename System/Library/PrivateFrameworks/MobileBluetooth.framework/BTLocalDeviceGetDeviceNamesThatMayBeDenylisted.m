@implementation BTLocalDeviceGetDeviceNamesThatMayBeDenylisted

void __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  uint64_t v5;
  size_t v6;
  char *v7;
  const char *string;
  unint64_t v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_array_get_count(value);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (*(_QWORD *)(a1 + 48) <= v6)
        break;
      v7 = (char *)(*(_QWORD *)(a1 + 56) + v5);
      string = xpc_array_get_string(value, v6);
      strlcpy(v7, string, 0xF8uLL);
      ++v6;
      v5 += 248;
    }
    while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > v6);
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke_cold_1();
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= *(_QWORD *)(a1 + 48))
    v9 = *(_QWORD *)(a1 + 48);
  **(_QWORD **)(a1 + 64) = v9;
}

void __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdLocalDeviceGetDeviceNamesThatMayBeDenylistedMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
