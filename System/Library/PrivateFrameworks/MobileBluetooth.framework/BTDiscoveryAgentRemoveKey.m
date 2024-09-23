@implementation BTDiscoveryAgentRemoveKey

void __BTDiscoveryAgentRemoveKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    __BTDiscoveryAgentAddKey_block_invoke_cold_1();
}

@end
