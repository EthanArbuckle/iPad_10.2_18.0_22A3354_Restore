@implementation CKEnumerateRangesOfEmphasisInFormatString

double ___CKEnumerateRangesOfEmphasisInFormatString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", CFSTR("#"), 0, a2, a3);
  *a4 = v6;
  a4[1] = v7;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(_QWORD *)(v9 + 32);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v9 + 32) = v6;
    else
      *(_QWORD *)(v9 + 40) = v6 - v10 + v7;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += 2;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      result = NAN;
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = xmmword_18E7C9230;
    }
  }
  return result;
}

@end
