@implementation BTLocalDeviceLinkQualityGetData

void __BTLocalDeviceLinkQualityGetData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t array;
  unsigned int v5;
  uint64_t v6;
  size_t v7;
  xpc_object_t value;
  char *v9;
  const char *string;
  unint64_t v11;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  array = xpc_dictionary_get_array(xdict, "kCBMsgArgBTLinkQualityData");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_array_get_count(array);
  v5 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5 >= 2)
    v5 = 2;
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      value = xpc_array_get_value(array, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 28) = xpc_dictionary_get_uint64(value, "kCBMsgArgRetX");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 29) = xpc_dictionary_get_uint64(value, "kCBMsgArgRssi");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 30) = xpc_dictionary_get_uint64(value, "kCBMsgArgNoise");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 31) = xpc_dictionary_get_uint64(value, "kCBMsgArgSnr");
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 32) = xpc_dictionary_get_uint64(value, "kCBMsgArgDataRate");
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 34) = xpc_dictionary_get_uint64(value, "kCBMsgArgJitterBuffer");
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 36) = xpc_dictionary_get_uint64(value, "kCBMsgArgCodecType");
      v9 = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v6 + 38);
      string = xpc_dictionary_get_string(value, "kCBMsgArgName");
      strlcpy(v9, string, 0x100uLL);
      ++v7;
      if (*(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 2u)
        v11 = 2;
      else
        v11 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 += 268;
    }
    while (v7 < v11);
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceLinkQualityGetData_block_invoke_cold_1();
}

void __BTLocalDeviceLinkQualityGetData_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdDeviceLinkQualityGetDataMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
