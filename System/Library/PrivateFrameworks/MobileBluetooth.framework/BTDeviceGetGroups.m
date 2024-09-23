@implementation BTDeviceGetGroups

void __BTDeviceGetGroups_block_invoke(_QWORD *a1, xpc_object_t xdict)
{
  xpc_object_t array;
  size_t v5;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  array = xpc_dictionary_get_array(xdict, "kCBMsgArgGrouIdArray");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_array_get_count(array);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v5 = 0;
    do
    {
      *(_DWORD *)(a1[6] + 4 * v5) = xpc_array_get_uint64(array, v5);
      ++v5;
    }
    while (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > v5);
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTDeviceGetGroups_block_invoke_cold_1();
}

void __BTDeviceGetGroups_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "kCBMsgIdDeviceGetGroupsMsg reply result:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
