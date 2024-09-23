@implementation BTAccessoryManagerGetPrimaryBudSide

void __BTAccessoryManagerGetPrimaryBudSide_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPrimarySide");
    if (uint64)
      **(_DWORD **)(a1 + 40) = uint64;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTAccessoryManagerGetPrimaryBudSide_block_invoke_cold_1();
}

void __BTAccessoryManagerGetPrimaryBudSide_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "%s reply result:%llx", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

@end
