@implementation CTStringIsSuitableForVerticalLayout

uint64_t __CTStringIsSuitableForVerticalLayout_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = objc_msgSend((id)CTStringIsSuitableForVerticalLayout::nonCJKRegex, "enumerateMatchesInString:options:range:usingBlock:", MEMORY[0x1E0C809B0], 3221225472, __CTStringIsSuitableForVerticalLayout_block_invoke_2, &unk_1E15E7DB0, a1[4], a7);
  if (*a7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  else
  {
    v10 = a1[7];
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(_QWORD *)(v11 + 24);
    if (v10 && v12 == v10)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
      *a7 = 1;
    }
    else
    {
      *(_QWORD *)(v11 + 24) = v12 + 1;
    }
  }
  return result;
}

void __CTStringIsSuitableForVerticalLayout_block_invoke_2(uint64_t a1, double a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  double Helper_x8__CEMStringIsSingleEmoji;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;

  Helper_x8__CEMStringIsSingleEmoji = gotLoadHelper_x8__CEMStringIsSingleEmoji(a2);
  if (!*(_QWORD *)(v9 + 3536)
    || (v10 = *(void **)(a1 + 32),
        v11 = objc_msgSend(v7, "range", Helper_x8__CEMStringIsSingleEmoji),
        objc_msgSend(v10, "substringWithRange:", v11, v12),
        !CEMStringIsSingleEmoji_delayInitStub(v13)))
  {
    *a5 = 1;
    **(_BYTE **)(a1 + 40) = 1;
  }
}

@end
