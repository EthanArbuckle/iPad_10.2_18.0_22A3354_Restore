@implementation OSLogTracepointBuffer

uint64_t __80___OSLogTracepointBuffer_finishedInsertingTracepointsWithNextMajorTime_options___block_invoke(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int *v17;

  v3 = *((_QWORD *)a2 + 1);
  v4 = *(_QWORD *)(a3 + 8);
  v5 = v3 >= v4;
  if (v3 != v4)
    goto LABEL_11;
  v6 = *a2;
  v5 = *a2 >= *(_DWORD *)a3;
  if (*a2 != *(_DWORD *)a3)
    goto LABEL_11;
  if (v6 == 2)
  {
    if (*((unsigned __int8 *)a2 + 1072) >= *(unsigned __int8 *)(a3 + 1072))
      v15 = (unsigned int *)(a1 + 32);
    else
      v15 = (unsigned int *)(a1 + 36);
    return *v15;
  }
  if (v6 == 3)
  {
    v7 = *((_QWORD *)a2 + 138);
    if (!v7
      || (v8 = *(_QWORD *)(a3 + 1104)) == 0
      || (v9 = *(_QWORD *)(v7 + 8), v10 = *(_QWORD *)(v8 + 8), v5 = v9 >= v10, v9 == v10))
    {
      v11 = *((_QWORD *)a2 + 139);
      v12 = *(_QWORD *)(a3 + 1112);
      if (v11)
      {
        v13 = *(_QWORD *)(v11 + 8);
        if (v12)
        {
LABEL_10:
          v14 = *(_QWORD *)(v12 + 8);
LABEL_21:
          if (v11 >= v12)
            v15 = (unsigned int *)(a1 + 36);
          else
            v15 = (unsigned int *)(a1 + 32);
          if (v13 >= v14)
            v17 = (unsigned int *)(a1 + 36);
          else
            v17 = (unsigned int *)(a1 + 32);
          if (v13 != v14)
            v15 = v17;
          return *v15;
        }
      }
      else
      {
        v13 = 0;
        if (v12)
          goto LABEL_10;
      }
      v14 = 0;
      goto LABEL_21;
    }
LABEL_11:
    v15 = (unsigned int *)(a1 + 32);
    if (v5)
      v15 = (unsigned int *)(a1 + 36);
    return *v15;
  }
  return 0;
}

uint64_t __76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  if (*((_QWORD *)a2 + 1) >= *(_QWORD *)(a1 + 40))
  {
    _oltb_allocate_row(*(void **)(a1 + 32));
    v5 = 1120 * v4;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1120 * v4;
    v7 = *((_QWORD *)a2 + 1);
    v9 = *a2;
    v10 = a2[1];
    *(_QWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = v7;
    bzero((void *)(v6 + 16), 0x400uLL);
    *(int64x2_t *)(v6 + 1040) = vdupq_n_s64(0xDEADBEEFuLL);
    *(_OWORD *)(v6 + 1088) = v10;
    *(_OWORD *)(v6 + 1072) = v9;
    *(_OWORD *)(v6 + 1056) = 0u;
    *(_OWORD *)(v6 + 1104) = 0u;
    snprintf((char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + v5 + 16), 0x1AuLL, "%016llx.timesync", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + v5 + 1056) = *(_OWORD *)*(_QWORD *)(a1 + 56);
  }
  return 1;
}

@end
