@implementation RegisterNewServer

void __figXPC_RegisterNewServer_block_invoke(uint64_t a1)
{
  CFArrayAppendValue((CFMutableArrayRef)gServerRegistry_1, *(const void **)(a1 + 32));
}

@end
