@implementation BTAccessoryManagerSendAdaptiveVolumeMessage

uint64_t __BTAccessoryManagerSendAdaptiveVolumeMessage_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
