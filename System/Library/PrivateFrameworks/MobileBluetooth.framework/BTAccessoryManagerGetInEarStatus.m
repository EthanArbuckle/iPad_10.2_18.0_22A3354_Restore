@implementation BTAccessoryManagerGetInEarStatus

void __BTAccessoryManagerGetInEarStatus_block_invoke(_QWORD *a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;

  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  v5 = a1[4];
  a1 += 4;
  *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24) = uint64;
  *(_QWORD *)(*(_QWORD *)(a1[1] + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgInEarStatusPrimary");
  *(_QWORD *)(*(_QWORD *)(a1[2] + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgInEarStatusSecondary");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTAccessoryManagerGetInEarStatus_block_invoke_cold_1();
}

void __BTAccessoryManagerGetInEarStatus_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdAccessoryGetInEarStatusMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
