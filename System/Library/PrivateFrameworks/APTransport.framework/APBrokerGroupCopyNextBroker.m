@implementation APBrokerGroupCopyNextBroker

uint64_t ___APBrokerGroupCopyNextBroker_block_invoke(uint64_t result, const void *a2)
{
  uint64_t v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    result = CFSetContainsValue(*(CFSetRef *)(result + 40), a2);
    if (!(_DWORD)result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = a2;
  }
  return result;
}

@end
