@implementation NLStringTokenizerGetSubTokensOfCompound

_QWORD *___NLStringTokenizerGetSubTokensOfCompound_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result[5];
  if (v3)
    *(_OWORD *)(v3 + 16 * *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24)) = *(_OWORD *)a2;
  v4 = result[6];
  if (v4)
    *(_QWORD *)(v4 + 8 * *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24)) = *(_QWORD *)(a2 + 16);
  if (++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) == result[7])
    *a3 = 1;
  return result;
}

@end
