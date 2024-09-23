@implementation CalDatabaseGetLastSequenceNumberWithAllChangesConsumed

uint64_t ___CalDatabaseGetLastSequenceNumberWithAllChangesConsumed_block_invoke(uint64_t a1, int a2, int a3, int a4, int a5, CFArrayRef theArray)
{
  uint64_t result;
  uint64_t v9;
  CFIndex i;
  uint64_t v11;

  result = CFArrayGetCount(theArray);
  if (result >= 1)
  {
    v9 = result;
    for (i = 0; i != v9; ++i)
    {
      result = (uint64_t)CFArrayGetValueAtIndex(theArray, i);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (*(_DWORD *)(v11 + 24) > (int)result)
        *(_DWORD *)(v11 + 24) = result;
    }
  }
  return result;
}

@end
