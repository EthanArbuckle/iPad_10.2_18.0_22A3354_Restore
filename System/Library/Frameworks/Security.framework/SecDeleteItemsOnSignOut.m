@implementation SecDeleteItemsOnSignOut

uint64_t __SecDeleteItemsOnSignOut_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
