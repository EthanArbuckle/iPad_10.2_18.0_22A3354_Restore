@implementation BRCompareImages

uint64_t __BRCompareImages_block_invoke(uint64_t result)
{
  unint64_t v1;
  unint64_t i;
  unint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;

  v1 = *(unsigned int *)(result + 104);
  if (*(int *)(result + 108) + v1 > v1)
  {
    for (i = *(unsigned int *)(result + 104); i < *(int *)(result + 108) + v1; ++i)
    {
      v3 = *(_QWORD *)(result + 56);
      v4 = (unsigned __int8 *)(*(_QWORD *)(result + 40) + *(_QWORD *)(result + 48) + v3 * i);
      v5 = *(_QWORD *)(result + 64) + *(_QWORD *)(result + 72) + v3 * i;
      v6 = *(_QWORD *)(result + 80) + *(_QWORD *)(result + 88) + *(_QWORD *)(result + 96) * i;
      if (v3 == 4)
      {
        if ((*(_BYTE *)(result + 112) & 3) != 0)
          v7 = 3;
        else
          v7 = 0;
        LOBYTE(v8) = v4[v7];
        if (!(*(_BYTE *)(v5 + v7) | v8))
          goto LABEL_24;
      }
      else if (!v3)
      {
        LOBYTE(v8) = -1;
        goto LABEL_24;
      }
      v9 = 0;
      v10 = 1;
      LOBYTE(v11) = 1;
      do
      {
        v11 = v11 & (v4[v9] == *(unsigned __int8 *)(v5 + v9));
        v9 = v10;
      }
      while (v3 > v10++);
      if (v3 == 4)
      {
        if ((*(_BYTE *)(result + 112) & 3) != 0)
          v13 = 3;
        else
          v13 = 0;
        v8 = v4[v13];
        if ((v11 & 1) == 0)
        {
LABEL_19:
          v14 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40);
          do
            v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
          *(_BYTE *)v6 = (*v4 >> 1) | 0x80;
          *(_WORD *)(v6 + 1) = 0;
          if (!v8)
            LOBYTE(v8) = -1;
          goto LABEL_25;
        }
      }
      else
      {
        v8 = 255;
        if (!v11)
          goto LABEL_19;
      }
LABEL_24:
      v16 = (((77 * *v4 + 150 * v4[1] + 28 * v4[2]) >> 8) + 256) >> 1;
      *(_BYTE *)v6 = v16;
      *(_BYTE *)(v6 + 1) = v16;
      *(_BYTE *)(v6 + 2) = v16;
LABEL_25:
      *(_BYTE *)(v6 + 3) = v8;
    }
  }
  return result;
}

@end
