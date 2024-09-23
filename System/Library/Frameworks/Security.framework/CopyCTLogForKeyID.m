@implementation CopyCTLogForKeyID

uint64_t __CopyCTLogForKeyID_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_data(xdict, "data", *(const void **)(a1 + 32), 0x20uLL);
  return 1;
}

BOOL __CopyCTLogForKeyID_block_invoke_2(uint64_t a1, xpc_object_t xdict, __CFString **a3)
{
  if (!xdict || !xpc_dictionary_get_value(xdict, "status") || MEMORY[0x18D7718B8]() != MEMORY[0x1E0C812F8])
    return SecError(-26276, a3, CFSTR("Unable to match CT log"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _CFXPCCreateCFObjectFromXPCObject();
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
}

@end
