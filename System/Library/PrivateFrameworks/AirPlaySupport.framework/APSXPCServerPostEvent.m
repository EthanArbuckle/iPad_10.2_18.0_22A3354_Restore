@implementation APSXPCServerPostEvent

uint64_t __APSXPCServerPostEvent_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigXPCRetain();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
