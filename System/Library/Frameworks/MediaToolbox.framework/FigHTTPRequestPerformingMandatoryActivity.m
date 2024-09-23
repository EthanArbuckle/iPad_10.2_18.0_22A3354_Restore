@implementation FigHTTPRequestPerformingMandatoryActivity

uint64_t __FigHTTPRequestPerformingMandatoryActivity_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gActiveMandatoryConnectionCount > 0;
  return result;
}

@end
