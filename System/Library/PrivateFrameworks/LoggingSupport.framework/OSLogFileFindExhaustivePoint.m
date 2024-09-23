@implementation OSLogFileFindExhaustivePoint

uint64_t ___OSLogFileFindExhaustivePoint_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  int v5;

  if (*(_DWORD *)a2 == 24587)
  {
    if (*(_DWORD *)(a2 + 4) > 0x10u)
    {
      result = 0;
      **(_QWORD **)(a1 + 48) = *(_QWORD *)(a2 + 32);
      return result;
    }
    result = 0;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 2;
LABEL_9:
    *(_DWORD *)(v4 + 24) = v5;
    return result;
  }
  if (*(_DWORD *)a2 != 4096)
    return 1;
  if (*(_QWORD *)(a2 + 8) <= 0xA7uLL)
  {
    result = 0;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 22;
    goto LABEL_9;
  }
  *(_OWORD *)*(_QWORD *)(a1 + 40) = *(_OWORD *)(a2 + 144);
  if ((*(_BYTE *)(a2 + 52) & 2) == 0)
    return 1;
  result = 0;
  **(_QWORD **)(a1 + 48) = 0;
  return result;
}

@end
