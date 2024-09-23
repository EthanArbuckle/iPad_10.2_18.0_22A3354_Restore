@implementation BTDeviceAddressFromString

void __BTDeviceAddressFromString_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const void *data;
  unint64_t v5;
  size_t v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgAddressBytes", (size_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (data)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v5)
    {
      if (v5 >= 6)
        v6 = 6;
      else
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      memcpy(*(void **)(a1 + 48), data, v6);
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        __BTDeviceAddressFromString_block_invoke_cold_1();
    }
  }
}

void __BTDeviceAddressFromString_block_invoke_cold_1()
{
  __int16 v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  os_log_t v6;
  uint8_t v7[18];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0();
  v8 = v0;
  v9 = v1;
  v10 = v0;
  v11 = v2;
  v12 = v0;
  v13 = v3;
  v14 = v0;
  v15 = v4;
  v16 = v0;
  v17 = v5;
  _os_log_debug_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEBUG, "kCBMsgIdDeviceAddressFromStringMsg reply result:%llx address:%x%x%x%x%x%x", v7, 0x30u);
}

@end
