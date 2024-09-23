@implementation AXIPCServerSetServerPort

void __AXIPCServerSetServerPort_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)ServerPortMapping;
  ServerPortMapping = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v3 = (void *)ServerPortLock;
  ServerPortLock = (uint64_t)v2;

}

@end
