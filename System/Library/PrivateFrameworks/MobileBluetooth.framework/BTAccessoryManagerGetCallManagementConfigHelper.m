@implementation BTAccessoryManagerGetCallManagementConfigHelper

uint64_t __BTAccessoryManagerGetCallManagementConfigHelper_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCallManagementMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
