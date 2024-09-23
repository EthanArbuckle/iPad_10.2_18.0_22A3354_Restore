@implementation CSSymbolicatorForeachRegionWithNameAtTime

uint64_t __CSSymbolicatorForeachRegionWithNameAtTime_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const char *v4;
  const char *Name;
  uint64_t result;

  v4 = (const char *)a1[6];
  Name = CSRegionGetName(a2, a3);
  result = strcmp(v4, Name);
  if (!(_DWORD)result)
  {
    result = (*(uint64_t (**)(void))(a1[4] + 16))();
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  return result;
}

@end
