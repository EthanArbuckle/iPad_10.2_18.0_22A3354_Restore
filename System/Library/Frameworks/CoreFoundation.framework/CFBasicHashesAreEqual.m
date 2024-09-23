@implementation CFBasicHashesAreEqual

uint64_t __CFBasicHashesAreEqual_block_invoke(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, _QWORD);
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  result = a1[5];
  if (!*(_BYTE *)(result + 26))
  {
    v10 = xmmword_182DC7A10;
    v11 = unk_182DC7A20;
    goto LABEL_16;
  }
  v5 = a2[1];
  v6 = *(_WORD *)(result + 18) & 3;
  if ((*(_WORD *)(result + 18) & 0x8000) != 0)
  {
    switch(v6)
    {
      case 3:
        ___CFBasicHashFindBucket_Exponential_Indirect(result, v5, (uint64_t *)&v10);
        goto LABEL_16;
      case 2:
        ___CFBasicHashFindBucket_Double_Indirect(result, v5, (uint64_t *)&v10);
        goto LABEL_16;
      case 1:
        ___CFBasicHashFindBucket_Linear_Indirect(result, v5, (uint64_t *)&v10);
        goto LABEL_16;
    }
LABEL_24:
    __break(1u);
    return result;
  }
  if (v6 == 3)
  {
    ___CFBasicHashFindBucket_Exponential(result, v5, (uint64_t *)&v10);
    goto LABEL_16;
  }
  if (v6 == 2)
  {
    ___CFBasicHashFindBucket_Double(result, v5, (uint64_t *)&v10);
    goto LABEL_16;
  }
  if (v6 != 1)
    goto LABEL_24;
  ___CFBasicHashFindBucket_Linear(result, v5, (uint64_t *)&v10);
LABEL_16:
  if (a2[3] == *((_QWORD *)&v11 + 1))
  {
    v7 = a1[6];
    if ((*(_WORD *)(v7 + 18) & 4) == 0)
      return 1;
    v8 = a2[2];
    if (v8 == (_QWORD)v11)
      return 1;
    v9 = *(unsigned int (**)(uint64_t, _QWORD))(CFBasicHashCallBackPtrs[((*(_QWORD *)(v7 + 32) >> 34) >> 5) & 0x1F]
                                                        + 8 * ((*(_QWORD *)(v7 + 32) >> 34) & 0x1FLL));
    if (v9)
    {
      if (v9(v8, v11))
        return 1;
    }
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  return result;
}

@end
