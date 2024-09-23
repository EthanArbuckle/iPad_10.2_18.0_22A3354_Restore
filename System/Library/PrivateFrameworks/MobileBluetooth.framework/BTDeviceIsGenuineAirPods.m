@implementation BTDeviceIsGenuineAirPods

void __BTDeviceIsGenuineAirPods_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgGenuine");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTDeviceIsGenuineAirPods_block_invoke_cold_1();
}

void __BTDeviceIsGenuineAirPods_block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(&dword_1B6BF1000, v0, OS_LOG_TYPE_DEBUG, "kCBMsgIdDeviceIsGenuineAirPodsMsg reply result:%llx genuine:%u", v1, 0x12u);
  OUTLINED_FUNCTION_4();
}

@end
