@implementation BTLocalDeviceGetDefault

void __BTLocalDeviceGetDefault_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgLocalDeviceID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTLocalDeviceGetDefault_block_invoke_cold_1();
}

void __BTLocalDeviceGetDefault_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  *(_DWORD *)v3 = 134218240;
  *(_QWORD *)&v3[4] = v1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 8) + 24);
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v2, "kCBMsgIdLocalDeviceGetDefaultMsg reply deviceID:%llx result:%llx", *(_QWORD *)v3, *(_QWORD *)&v3[8]);
  OUTLINED_FUNCTION_4();
}

@end
