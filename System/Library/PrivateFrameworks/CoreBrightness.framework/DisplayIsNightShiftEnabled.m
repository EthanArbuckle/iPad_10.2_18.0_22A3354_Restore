@implementation DisplayIsNightShiftEnabled

uint64_t __DisplayIsNightShiftEnabled_block_invoke(uint64_t result)
{
  char v1;
  char v2;

  if (v1 | ((*(_BYTE *)(*(_QWORD *)(result + 40) + 12513) & 1) == 0))
    v2 = 0;
  else
    v2 = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2 & 1;
  return result;
}

@end
