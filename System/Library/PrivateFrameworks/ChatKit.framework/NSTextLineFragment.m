@implementation NSTextLineFragment

CFIndex __62__NSTextLineFragment_Mentions__ck_animatingMentionsGlyphCount__block_invoke(uint64_t a1, uint64_t a2, const __CTRun *a3)
{
  CFIndex result;

  result = _CKShouldDrawMentionsCTRun(a3);
  if ((_DWORD)result)
  {
    result = CTRunGetGlyphCount(a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  }
  return result;
}

@end
