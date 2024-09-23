@implementation SCDynamicStoreCheckRetryAndHandleError

uint64_t ____SCDynamicStoreCheckRetryAndHandleError_block_invoke(uint64_t result)
{
  mach_port_name_t v1;
  uint64_t v2;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
  {
    v2 = result;
    result = mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
    *(_DWORD *)(*(_QWORD *)(v2 + 32) + 40) = 0;
  }
  return result;
}

@end
