@implementation CGPDFTaggedNodeGetTextRange

uint64_t __CGPDFTaggedNodeGetTextRange_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t TextRange;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 176);
  v5 = *(_QWORD *)(v3 + 184);
  TextRange = CGPDFTaggedNodeGetTextRange(a2);
  if (v5 >= 1)
  {
    if (v7 < 1)
    {
      v7 = v5;
LABEL_8:
      TextRange = v4;
      goto LABEL_11;
    }
    if (v4 < TextRange)
    {
      if (v5 <= v7 - v4 + TextRange)
        v7 = v7 - v4 + TextRange;
      else
        v7 = v5;
      goto LABEL_8;
    }
    if (v7 <= v5 + v4 - TextRange)
      v7 = v5 + v4 - TextRange;
  }
LABEL_11:
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v8 + 176) = TextRange;
  *(_QWORD *)(v8 + 184) = v7;
  return 1;
}

@end
