@implementation MOSettingsGroupsWithXPCEvent

uint64_t __MOSettingsGroupsWithXPCEvent_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(xstring));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return 1;
}

@end
