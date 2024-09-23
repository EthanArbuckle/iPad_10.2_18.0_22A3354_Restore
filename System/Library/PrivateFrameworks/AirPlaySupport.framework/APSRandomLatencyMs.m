@implementation APSRandomLatencyMs

uint64_t __APSRandomLatencyMs_block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = result;
    CFGetInt64Ranged();
    result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
      return APSLogErrorAt(result);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) += CFGetInt64Ranged();
    result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24);
    if ((_DWORD)result)
      return APSLogErrorAt(result);
  }
  return result;
}

uint64_t __APSRandomLatencyMs_block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) <= *(_DWORD *)(result + 48))
  {
    v1 = result;
    result = CFGetInt64Ranged();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) += result;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) > *(_DWORD *)(v1 + 48))
    {
      result = CFGetInt64Ranged();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

@end
