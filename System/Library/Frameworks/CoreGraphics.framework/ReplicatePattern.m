@implementation ReplicatePattern

uint64_t __ripc_ReplicatePattern_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 96);
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= v2 == *(_QWORD *)(result + 40);
  return result;
}

@end
