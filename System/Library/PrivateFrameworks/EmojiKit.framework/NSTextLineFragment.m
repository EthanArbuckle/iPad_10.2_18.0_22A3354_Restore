@implementation NSTextLineFragment

uint64_t __58__NSTextLineFragment_Helper___emk_enumerateRunsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

CFIndex __53__NSTextLineFragment_Helper__animatingGlyphCount_emk__block_invoke(uint64_t a1, uint64_t a2, const __CTRun *a3)
{
  CFIndex result;

  result = _EMKShouldDrawCTRun(a3);
  if ((_DWORD)result)
  {
    result = CTRunGetGlyphCount(a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  }
  return result;
}

@end
