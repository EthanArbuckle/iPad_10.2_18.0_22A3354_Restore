@implementation BTLocalDeviceGetPairedDevices

void __BTLocalDeviceGetPairedDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  size_t count;
  size_t i;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  size_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
    count = xpc_array_get_count(value);
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        if (i >= *(_QWORD *)(a1 + 40))
          break;
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        v7 = MBFLogComponent;
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        {
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * i);
          *(_DWORD *)buf = 134218240;
          v10 = i;
          v11 = 2048;
          v12 = v8;
          _os_log_debug_impl(&dword_1B6BF1000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
        }
      }
    }
    **(_QWORD **)(a1 + 56) = count;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceGetPairedDevices_block_invoke_cold_1();
}

void __BTLocalDeviceGetPairedDevices_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v1, "kCBMsgIdLocalDeviceGetPairedDevicesMsg reply result:%llx count:%lx", v2, v3);
  OUTLINED_FUNCTION_4();
}

@end
