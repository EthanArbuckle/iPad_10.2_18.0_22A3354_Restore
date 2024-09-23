@implementation NLStringTokenizerGetCurrentSubTokens

void __NLStringTokenizerGetCurrentSubTokens_block_invoke(_QWORD *a1, _OWORD *a2, const __CFString *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  __CFArray *v9;
  const __CFString *v10;

  v7 = a1[5];
  if (v7)
  {
    *(_OWORD *)(v7 + 16 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)) = *a2;
    v8 = 16 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    *(_QWORD *)(a1[5] + v8) += *(_QWORD *)(a1[6] + 24) + **(_QWORD **)(a1[6] + 88);
  }
  v9 = (__CFArray *)a1[7];
  if (v9)
  {
    if (a3)
      v10 = a3;
    else
      v10 = &stru_1E2DF6418;
    CFArrayAppendValue(v9, v10);
  }
  if (++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == a1[8])
    *a5 = 1;
}

void __NLStringTokenizerGetCurrentSubTokens_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFStringRef v8;
  CFRange v9;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    *(_OWORD *)(v5 + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *(_OWORD *)a2;
    v6 = 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + v6) += *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24)
                                            + **(_QWORD **)(*(_QWORD *)(a1 + 48) + 88);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v9.length = *(_QWORD *)(a2 + 8);
    v7 = *(_QWORD *)(a1 + 48);
    v9.location = **(_QWORD **)(v7 + 88) + *(_QWORD *)a2;
    v8 = CFStringCreateWithSubstring(0, *(CFStringRef *)(v7 + 16), v9);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), v8);
    CFRelease(v8);
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == *(_QWORD *)(a1 + 64))
    *a3 = 1;
}

@end
