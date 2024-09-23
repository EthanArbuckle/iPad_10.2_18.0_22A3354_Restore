@implementation NSIndexSet

uint64_t __61__NSIndexSet_CoreDuetConvencience___cd_commaSeparatedIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8) + 24))
    return objc_msgSend(v3, "appendFormat:", CFSTR(",%lu"), a2);
  result = objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

@end
