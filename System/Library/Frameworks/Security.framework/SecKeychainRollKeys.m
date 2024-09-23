@implementation SecKeychainRollKeys

uint64_t ___SecKeychainRollKeys_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "force", *(_BYTE *)(a1 + 32));
  return 1;
}

uint64_t ___SecKeychainRollKeys_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
