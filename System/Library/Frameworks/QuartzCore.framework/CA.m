@implementation CA

_QWORD *__CA_CGPathIsRectShape_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  int v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  BOOL v9;
  double *v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  BOOL v15;
  double *v16;
  double *v17;
  char v18;
  double *v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;

  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  switch(v4)
  {
    case 0:
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)a2 == 0;
      *(_OWORD *)*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_OWORD *)*(_QWORD *)(a2 + 8);
      break;
    case 1:
      if (*(_DWORD *)a2 == 1)
      {
        v16 = *(double **)(*(_QWORD *)(result[6] + 8) + 24);
        v17 = *(double **)(a2 + 8);
        v18 = (*v16 == *v17) ^ (v16[1] == v17[1]);
      }
      else
      {
        v18 = 0;
        v17 = *(double **)(a2 + 8);
      }
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v18;
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) + 16) = *(_OWORD *)v17;
      break;
    case 2:
      if (*(_DWORD *)a2 == 1)
      {
        v5 = *(double **)(*(_QWORD *)(result[6] + 8) + 24);
        v6 = *(double **)(a2 + 8);
        v7 = v6[1];
        if ((v5[2] == *v6) == (v5[3] == v7))
        {
          v9 = 0;
        }
        else
        {
          v8 = v5[1];
          v9 = *v6 != *v5;
          if (v7 != v8)
            v9 = 1;
        }
      }
      else
      {
        v9 = 0;
        v6 = *(double **)(a2 + 8);
      }
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v9;
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) + 32) = *(_OWORD *)v6;
      break;
    case 3:
      if (*(_DWORD *)a2 == 1)
      {
        v19 = *(double **)(*(_QWORD *)(result[6] + 8) + 24);
        v20 = *(double **)(a2 + 8);
        v22 = *v20;
        v21 = v20[1];
        if ((v19[4] == *v20) == (v19[5] == v21) || (*v19 == v22) == (v19[1] == v21))
        {
          v24 = 0;
        }
        else
        {
          v23 = v19[3];
          v24 = v22 != v19[2];
          if (v21 != v23)
            v24 = 1;
        }
      }
      else
      {
        v24 = 0;
        v20 = *(double **)(a2 + 8);
      }
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v24;
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) + 48) = *(_OWORD *)v20;
      break;
    case 4:
      if (*(_DWORD *)a2 == 4)
      {
        v15 = 1;
      }
      else if (*(_DWORD *)a2 == 1)
      {
        v10 = *(double **)(a2 + 8);
        v11 = *v10;
        v12 = v10[1];
        v13 = *(double **)(*(_QWORD *)(result[6] + 8) + 24);
        v14 = v13[1];
        v15 = v11 == *v13;
        if (v12 != v14)
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_28;
    case 5:
      v15 = *(_DWORD *)a2 == 4;
LABEL_28:
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v15;
      break;
    default:
      break;
  }
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    *a3 = 1;
  return result;
}

@end
