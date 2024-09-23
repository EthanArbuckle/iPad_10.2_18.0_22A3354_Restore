@implementation NSBPlistMappedString

uint64_t __46___NSBPlistMappedString__fastCStringContents___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v5 = dyld_program_sdk_at_least();
  v6 = a1[6];
  v7 = a1[7];
  if (v7 + v6 >= a3)
    v8 = a3;
  else
    v8 = v7 + v6;
  if (v7 + v6)
    v9 = v6 == 0;
  else
    v9 = 0;
  if (v9)
    v10 = v8;
  else
    v10 = 0;
  v11 = v8 - v6;
  if (v6 < a3)
    v12 = a1[6];
  else
    v12 = 0;
  if (v6 < a3)
    v10 = v11;
  if ((v5 & 1) != 0)
    v13 = a1[7];
  else
    v13 = v10;
  if ((v5 & 1) == 0)
    v6 = v12;
  if (v6 + v13 <= a3)
  {
    __CFStrConvertBytesToUnicode();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke_2(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  char v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _WORD *v15;
  unsigned __int16 *v16;
  unsigned int v17;

  v6 = dyld_program_sdk_at_least();
  v8 = a1[6];
  v7 = a1[7];
  if (v7 + v8 >= a3)
    v9 = a3;
  else
    v9 = v7 + v8;
  if (v7 + v8)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  v12 = v9 - v8;
  if (v8 < a3)
    v13 = a1[6];
  else
    v13 = 0;
  if (v8 < a3)
    v11 = v12;
  if ((v6 & 1) != 0)
  {
    v14 = a1[6];
  }
  else
  {
    v7 = v11;
    v14 = v13;
  }
  if (v14 + v7 <= a3)
  {
    if (v7)
    {
      v15 = (_WORD *)a1[8];
      v16 = (unsigned __int16 *)(a2 + 2 * v14);
      do
      {
        v17 = *v16++;
        *v15++ = bswap32(v17) >> 16;
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  return 1;
}

@end
