@implementation NLStringTokenizerGetDerivedTokens

void ___NLStringTokenizerGetDerivedTokens_block_invoke(uint64_t a1, uint64_t a2, CFStringRef theString, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Length;
  _QWORD *v12;
  _QWORD *v13;

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    *(_OWORD *)(v8 + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *(_OWORD *)a2;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    *(_QWORD *)(v9 + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 64))
  {
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
      *(_QWORD *)(v10 + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = a4;
    if (theString)
    {
      Length = CFStringGetLength(theString);
      v12 = (_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      *v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v12[1] = Length;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += Length;
      CFStringAppend(*(CFMutableStringRef *)(a1 + 64), theString);
    }
    else
    {
      v13 = (_QWORD *)(*(_QWORD *)(a1 + 80) + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      *v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v13[1] = 0;
    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == *(_QWORD *)(a1 + 88))
    *a5 = 1;
}

@end
