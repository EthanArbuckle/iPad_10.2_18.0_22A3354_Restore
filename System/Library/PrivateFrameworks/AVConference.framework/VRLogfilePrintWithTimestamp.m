@implementation VRLogfilePrintWithTimestamp

uint64_t __VRLogfilePrintWithTimestamp_block_invoke(uint64_t a1)
{
  return fprintf(**(FILE ***)(a1 + 32), "%s%c%s", (const char *)(a1 + 40), *(char *)(*(_QWORD *)(a1 + 32) + 16), (const char *)(a1 + 60));
}

@end
