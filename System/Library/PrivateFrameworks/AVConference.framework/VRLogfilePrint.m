@implementation VRLogfilePrint

uint64_t __VRLogfilePrint_block_invoke(uint64_t a1)
{
  return fputs((const char *)(a1 + 40), **(FILE ***)(a1 + 32));
}

@end
