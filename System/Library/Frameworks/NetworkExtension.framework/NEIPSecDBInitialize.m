@implementation NEIPSecDBInitialize

uint64_t ____NEIPSecDBInitialize_block_invoke()
{
  uint64_t result;

  g_IPSecDBSessions = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  result = _CFRuntimeRegisterClass();
  __kNEIPSecDBTypeID = result;
  return result;
}

@end
