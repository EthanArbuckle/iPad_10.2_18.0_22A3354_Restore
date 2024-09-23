@implementation NSString

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= *(_QWORD *)(a1 + 48);
}

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 19;
}

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_3(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  CFRange v18;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  do
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 < 0 || (v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v10 = *(_QWORD *)(v9 + 192), v10 <= v8))
    {
      v12 = 0;
    }
    else
    {
      v11 = *(_QWORD *)(v9 + 168);
      if (v11)
      {
        v12 = *(_WORD *)(v11 + 2 * (*(_QWORD *)(v9 + 184) + v8));
      }
      else
      {
        v13 = *(_QWORD *)(v9 + 176);
        if (v13)
        {
          v12 = *(char *)(v13 + *(_QWORD *)(v9 + 184) + v8);
        }
        else
        {
          if (*(_QWORD *)(v9 + 208) <= v8 || (v14 = *(_QWORD *)(v9 + 200), v15 = *(_QWORD *)(v7 + 24), v14 > v8))
          {
            v16 = v8 - 4;
            if ((unint64_t)v8 < 4)
              v16 = 0;
            if (v16 + 64 < v10)
              v10 = v16 + 64;
            *(_QWORD *)(v9 + 200) = v16;
            *(_QWORD *)(v9 + 208) = v10;
            v18.location = *(_QWORD *)(v9 + 184) + v16;
            v18.length = v10 - v16;
            CFStringGetCharacters(*(CFStringRef *)(v9 + 160), v18, (UniChar *)(v9 + 32));
            v14 = *(_QWORD *)(v9 + 200);
            v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v15 = *(_QWORD *)(v7 + 24);
          }
          v12 = *(_WORD *)(v9 + 32 + 2 * (v8 - v14));
          v8 = v15;
        }
      }
    }
    *(_QWORD *)(v7 + 24) = v8 + 1;
  }
  while (a2 != v12 && !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + ~v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a2 == v12;
}

@end
