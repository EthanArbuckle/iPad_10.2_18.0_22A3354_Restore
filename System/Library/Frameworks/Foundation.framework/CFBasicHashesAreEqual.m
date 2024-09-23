@implementation CFBasicHashesAreEqual

uint64_t __CFBasicHashesAreEqual_block_invoke(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[56];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(v10, 0, sizeof(v10));
  result = a1[5];
  v5 = *(_QWORD *)(result + 16);
  if ((v5 & 0x3F0000) != 0)
  {
    v6 = a2[1];
    v7 = v5 & 3;
    switch(v7)
    {
      case 3:
        ___CFBasicHashFindBucket3(result, v6, 0, (unint64_t *)v10);
        break;
      case 2:
        ___CFBasicHashFindBucket2(result, v6, 0, (unint64_t *)v10);
        break;
      case 1:
        ___CFBasicHashFindBucket1(result, v6, 0, (unint64_t *)v10);
        break;
      default:
        __break(1u);
        return result;
    }
  }
  else
  {
    memset(&v10[24], 0, 32);
  }
  if (a2[5] == *(_QWORD *)&v10[40])
  {
    v8 = a1[6];
    if ((*(_BYTE *)(v8 + 16) & 0x18) == 0)
      return 1;
    v9 = a2[3];
    if (v9 == *(_QWORD *)&v10[24]
      || (**(unsigned __int8 (***)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v8, 18, v9))
    {
      return 1;
    }
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  return result;
}

@end
