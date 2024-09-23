@implementation ServerRegistryOneTimeInitialization

CFMutableArrayRef __figXPC_ServerRegistryOneTimeInitialization_block_invoke()
{
  CFMutableArrayRef result;

  gServerRegistry_0 = (uint64_t)dispatch_queue_create("FigXPCServerRegistryQueue", 0);
  result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  gServerRegistry_1 = (uint64_t)result;
  return result;
}

@end
