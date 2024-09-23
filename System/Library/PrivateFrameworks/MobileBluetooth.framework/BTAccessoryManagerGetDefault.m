@implementation BTAccessoryManagerGetDefault

void __BTAccessoryManagerGetDefault_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryManagerID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTAccessoryManagerGetDefault_block_invoke_cold_1();
}

void __BTAccessoryManagerGetDefault_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 8) + 24);
  v4 = 134218240;
  v5 = v2;
  v6 = 2048;
  v7 = v1;
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v3, (uint64_t)v3, "kCBMsgIdAccessoryGetDefaultMsg reply accessoryManagerID:%llx result:%llx", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

@end
