void functionLeftRotate(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionLeftRotate_block_invoke;
  v2[3] = &__block_descriptor_40_e161_v24__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_16l;
  v2[4] = a2;
  evaluateBinary(a1, a2, v2);
}

unint64_t __functionLeftRotate_block_invoke(unint64_t result, int *a2, int *a3)
{
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  int v23;

  v3 = result;
  if (a2[19])
    goto LABEL_7;
  v5 = -1;
  v6 = 21;
  while (v5 != 14)
  {
    v7 = a2[v6];
    ++v5;
    v6 += 2;
    if (v7)
    {
      if (v5 < 0xF)
        goto LABEL_7;
      break;
    }
  }
  if (a3[19])
  {
LABEL_7:
    v8 = g_GeneratingConvertTerm;
LABEL_8:
    v9 = *(_QWORD *)(result + 32);
    if (v8)
      v10 = 10;
    else
      v10 = 9;
    *(_DWORD *)(v9 + 204) = v10;
    *(_QWORD *)(v9 + 48) = 0;
    *(_QWORD *)(v9 + 56) = 0x7C00000000000000;
    return result;
  }
  v11 = -1;
  v12 = 21;
  while (v11 != 14)
  {
    v13 = a3[v12];
    ++v11;
    v12 += 2;
    if (v13)
      goto LABEL_18;
  }
  v11 = 15;
LABEL_18:
  v8 = g_GeneratingConvertTerm;
  if (v11 < 0xF || (g_GeneratingConvertTerm & 1) != 0)
    goto LABEL_8;
  g_isTrivial = 0;
  v14 = *a2;
  if (*a2 == 1)
  {
    v15 = (uint64_t)rint(*((double *)a2 + 4));
  }
  else if (v14 == 2)
  {
    v16 = *((_QWORD *)a2 + 6);
    v17 = *((_QWORD *)a2 + 7);
    v22 = 0;
    v15 = __bid128_to_uint64_int(v16, v17, &v22);
  }
  else if (v14 == 4)
  {
    v15 = *((_QWORD *)a2 + 8);
  }
  else
  {
    v15 = 0;
  }
  v18 = *a3;
  if (*a3 == 1)
  {
    result = (uint64_t)rint(*((double *)a3 + 4));
  }
  else if (v18 == 2)
  {
    v19 = *((_QWORD *)a3 + 6);
    v20 = *((_QWORD *)a3 + 7);
    v23 = 0;
    result = __bid128_to_uint64_int(v19, v20, &v23);
  }
  else if (v18 == 4)
  {
    result = *((_QWORD *)a3 + 8);
  }
  else
  {
    result = 0;
  }
  v21 = *(_QWORD *)(v3 + 32);
  *(_DWORD *)v21 = 4;
  *(_QWORD *)(v21 + 64) = __ROR8__(v15, -(char)result);
  return result;
}

void functionRightRotate(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionRightRotate_block_invoke;
  v2[3] = &__block_descriptor_40_e161_v24__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_16l;
  v2[4] = a2;
  evaluateBinary(a1, a2, v2);
}

unint64_t __functionRightRotate_block_invoke(unint64_t result, int *a2, int *a3)
{
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  int v23;

  v3 = result;
  if (a2[19])
    goto LABEL_7;
  v5 = -1;
  v6 = 21;
  while (v5 != 14)
  {
    v7 = a2[v6];
    ++v5;
    v6 += 2;
    if (v7)
    {
      if (v5 < 0xF)
        goto LABEL_7;
      break;
    }
  }
  if (a3[19])
  {
LABEL_7:
    v8 = g_GeneratingConvertTerm;
LABEL_8:
    v9 = *(_QWORD *)(result + 32);
    if (v8)
      v10 = 10;
    else
      v10 = 9;
    *(_DWORD *)(v9 + 204) = v10;
    *(_QWORD *)(v9 + 48) = 0;
    *(_QWORD *)(v9 + 56) = 0x7C00000000000000;
    return result;
  }
  v11 = -1;
  v12 = 21;
  while (v11 != 14)
  {
    v13 = a3[v12];
    ++v11;
    v12 += 2;
    if (v13)
      goto LABEL_18;
  }
  v11 = 15;
LABEL_18:
  v8 = g_GeneratingConvertTerm;
  if (v11 < 0xF || (g_GeneratingConvertTerm & 1) != 0)
    goto LABEL_8;
  g_isTrivial = 0;
  v14 = *a2;
  if (*a2 == 1)
  {
    v15 = (uint64_t)rint(*((double *)a2 + 4));
  }
  else if (v14 == 2)
  {
    v16 = *((_QWORD *)a2 + 6);
    v17 = *((_QWORD *)a2 + 7);
    v22 = 0;
    v15 = __bid128_to_uint64_int(v16, v17, &v22);
  }
  else if (v14 == 4)
  {
    v15 = *((_QWORD *)a2 + 8);
  }
  else
  {
    v15 = 0;
  }
  v18 = *a3;
  if (*a3 == 1)
  {
    result = (uint64_t)rint(*((double *)a3 + 4));
  }
  else if (v18 == 2)
  {
    v19 = *((_QWORD *)a3 + 6);
    v20 = *((_QWORD *)a3 + 7);
    v23 = 0;
    result = __bid128_to_uint64_int(v19, v20, &v23);
  }
  else if (v18 == 4)
  {
    result = *((_QWORD *)a3 + 8);
  }
  else
  {
    result = 0;
  }
  v21 = *(_QWORD *)(v3 + 32);
  *(_DWORD *)v21 = 4;
  *(_QWORD *)(v21 + 64) = __ROR8__(v15, result);
  return result;
}

void functionNOT(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionNOT_block_invoke;
  v2[3] = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
  v2[4] = a2;
  evaluateUnary(a1, a2, v2);
}

__n128 __functionNOT_block_invoke(uint64_t a1, int *a2)
{
  int v3;
  int *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 result;
  __int128 v18;
  __int128 v19;
  int v20;

  if (a2[19])
  {
    if ((g_GeneratingConvertTerm & 1) != 0)
    {
LABEL_3:
      v3 = 10;
LABEL_17:
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(v10 + 204) = v3;
      *(_QWORD *)(v10 + 48) = 0;
      *(_QWORD *)(v10 + 56) = 0x7C00000000000000;
      return result;
    }
LABEL_16:
    v3 = 9;
    goto LABEL_17;
  }
  v4 = a2 + 18;
  v5 = -1;
  v6 = 21;
  while (v5 != 14)
  {
    v7 = a2[v6];
    ++v5;
    v6 += 2;
    if (v7)
      goto LABEL_9;
  }
  v5 = 15;
LABEL_9:
  if (v5 < 0xF || g_GeneratingConvertTerm)
  {
    if ((g_GeneratingConvertTerm & 1) != 0)
      goto LABEL_3;
    goto LABEL_16;
  }
  g_isTrivial = 0;
  v8 = *a2;
  if (*a2 == 1)
  {
    v9 = (uint64_t)rint(*((double *)a2 + 4));
  }
  else if (v8 == 2)
  {
    v11 = *((_QWORD *)a2 + 6);
    v12 = *((_QWORD *)a2 + 7);
    v20 = 0;
    v9 = __bid128_to_uint64_int(v11, v12, &v20);
  }
  else if (v8 == 4)
  {
    v9 = *((_QWORD *)a2 + 8);
  }
  else
  {
    v9 = 0;
  }
  v13 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v13 = 4;
  *(_QWORD *)(v13 + 64) = ~v9;
  v14 = *((_OWORD *)v4 + 6);
  v15 = *((_OWORD *)v4 + 7);
  v16 = *((_OWORD *)v4 + 5);
  *(_OWORD *)(v13 + 136) = *((_OWORD *)v4 + 4);
  *(_OWORD *)(v13 + 184) = v15;
  *(_OWORD *)(v13 + 168) = v14;
  *(_OWORD *)(v13 + 152) = v16;
  result = *(__n128 *)v4;
  v18 = *((_OWORD *)v4 + 1);
  v19 = *((_OWORD *)v4 + 2);
  *(_OWORD *)(v13 + 120) = *((_OWORD *)v4 + 3);
  *(_OWORD *)(v13 + 104) = v19;
  *(_OWORD *)(v13 + 88) = v18;
  *(__n128 *)(v13 + 72) = result;
  return result;
}

void functionNEG(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionNEG_block_invoke;
  v2[3] = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
  v2[4] = a2;
  evaluateUnary(a1, a2, v2);
}

__n128 __functionNEG_block_invoke(uint64_t a1, int *a2)
{
  int v3;
  int *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __n128 result;
  __int128 v18;
  __int128 v19;
  int v20;

  if (a2[19])
  {
    if ((g_GeneratingConvertTerm & 1) != 0)
    {
LABEL_3:
      v3 = 10;
LABEL_17:
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(v10 + 204) = v3;
      *(_QWORD *)(v10 + 48) = 0;
      *(_QWORD *)(v10 + 56) = 0x7C00000000000000;
      return result;
    }
LABEL_16:
    v3 = 9;
    goto LABEL_17;
  }
  v4 = a2 + 18;
  v5 = -1;
  v6 = 21;
  while (v5 != 14)
  {
    v7 = a2[v6];
    ++v5;
    v6 += 2;
    if (v7)
      goto LABEL_9;
  }
  v5 = 15;
LABEL_9:
  if (v5 < 0xF || g_GeneratingConvertTerm)
  {
    if ((g_GeneratingConvertTerm & 1) != 0)
      goto LABEL_3;
    goto LABEL_16;
  }
  g_isTrivial = 0;
  v8 = *a2;
  if (*a2 == 1)
  {
    v9 = (uint64_t)rint(*((double *)a2 + 4));
  }
  else if (v8 == 2)
  {
    v11 = *((_QWORD *)a2 + 6);
    v12 = *((_QWORD *)a2 + 7);
    v20 = 0;
    v9 = __bid128_to_uint64_int(v11, v12, &v20);
  }
  else if (v8 == 4)
  {
    v9 = *((_QWORD *)a2 + 8);
  }
  else
  {
    v9 = 0;
  }
  v13 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v13 = 4;
  *(_QWORD *)(v13 + 64) = -(uint64_t)v9;
  v14 = *((_OWORD *)v4 + 6);
  v15 = *((_OWORD *)v4 + 7);
  v16 = *((_OWORD *)v4 + 5);
  *(_OWORD *)(v13 + 136) = *((_OWORD *)v4 + 4);
  *(_OWORD *)(v13 + 184) = v15;
  *(_OWORD *)(v13 + 168) = v14;
  *(_OWORD *)(v13 + 152) = v16;
  result = *(__n128 *)v4;
  v18 = *((_OWORD *)v4 + 1);
  v19 = *((_OWORD *)v4 + 2);
  *(_OWORD *)(v13 + 120) = *((_OWORD *)v4 + 3);
  *(_OWORD *)(v13 + 104) = v19;
  *(_OWORD *)(v13 + 88) = v18;
  *(__n128 *)(v13 + 72) = result;
  return result;
}

void functionFlip(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionFlip_block_invoke;
  v2[3] = &__block_descriptor_40_e161_v24__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_16l;
  v2[4] = a2;
  evaluateBinary(a1, a2, v2);
}

__n128 __functionFlip_block_invoke(uint64_t a1, int *a2, int *a3)
{
  int *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unint64_t v16;
  __n128 result;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int v34;
  int v35;

  if (a3[19])
    goto LABEL_7;
  v5 = a3 + 18;
  v6 = -1;
  v7 = 21;
  while (v6 != 14)
  {
    v8 = a3[v7];
    ++v6;
    v7 += 2;
    if (v8)
    {
      if (v6 < 0xF)
        goto LABEL_7;
      break;
    }
  }
  if (a2[19])
  {
LABEL_7:
    v9 = g_GeneratingConvertTerm;
LABEL_8:
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
      v11 = 10;
    else
      v11 = 9;
    *(_DWORD *)(v10 + 204) = v11;
    goto LABEL_12;
  }
  v12 = -1;
  v13 = 21;
  while (v12 != 14)
  {
    v14 = a2[v13];
    ++v12;
    v13 += 2;
    if (v14)
      goto LABEL_19;
  }
  v12 = 15;
LABEL_19:
  v9 = g_GeneratingConvertTerm;
  if (v12 < 0xF || (g_GeneratingConvertTerm & 1) != 0)
    goto LABEL_8;
  g_isTrivial = 0;
  v15 = *a2;
  if (*a2 == 1)
  {
    result.n128_f64[0] = rint(*((double *)a2 + 4));
    v16 = (uint64_t)result.n128_f64[0];
  }
  else if (v15 == 2)
  {
    v18 = *((_QWORD *)a2 + 6);
    v19 = *((_QWORD *)a2 + 7);
    v34 = 0;
    v16 = __bid128_to_uint64_int(v18, v19, &v34);
  }
  else if (v15 == 4)
  {
    v16 = *((_QWORD *)a2 + 8);
  }
  else
  {
    v16 = 0;
  }
  v20 = *a3;
  if (*a3 == 1)
  {
    result.n128_f64[0] = rint(*((double *)a3 + 4));
    v21 = (uint64_t)result.n128_f64[0];
  }
  else if (v20 == 2)
  {
    v22 = *((_QWORD *)a3 + 6);
    v23 = *((_QWORD *)a3 + 7);
    v35 = 0;
    v21 = __bid128_to_uint64_int(v22, v23, &v35);
  }
  else if (v20 == 4)
  {
    v21 = *((_QWORD *)a3 + 8);
  }
  else
  {
    v21 = 0;
  }
  if (v16 == 8)
  {
    if (v21)
    {
      v27 = 0;
      do
      {
        v25 = v21 | (v27 << 8);
        v27 = v25;
        v26 = v21 >= 0x100;
        v21 >>= 8;
      }
      while (v26);
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  if (v16 == 16)
  {
    if (v21)
    {
      v24 = 0;
      do
      {
        v25 = (unsigned __int16)v21 | (v24 << 16);
        v24 = v25;
        v26 = v21 >= 0x10000;
        v21 >>= 16;
      }
      while (v26);
      goto LABEL_47;
    }
LABEL_46:
    v25 = 0;
LABEL_47:
    v28 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v28 = 4;
    *(_QWORD *)(v28 + 64) = v25;
    v29 = *((_OWORD *)v5 + 6);
    v30 = *((_OWORD *)v5 + 7);
    v31 = *((_OWORD *)v5 + 5);
    *(_OWORD *)(v28 + 136) = *((_OWORD *)v5 + 4);
    *(_OWORD *)(v28 + 184) = v30;
    *(_OWORD *)(v28 + 168) = v29;
    *(_OWORD *)(v28 + 152) = v31;
    result = *(__n128 *)v5;
    v32 = *((_OWORD *)v5 + 1);
    v33 = *((_OWORD *)v5 + 2);
    *(_OWORD *)(v28 + 120) = *((_OWORD *)v5 + 3);
    *(_OWORD *)(v28 + 104) = v33;
    *(_OWORD *)(v28 + 88) = v32;
    *(__n128 *)(v28 + 72) = result;
    return result;
  }
  v10 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v10 = 2;
LABEL_12:
  *(_QWORD *)(v10 + 48) = 0;
  *(_QWORD *)(v10 + 56) = 0x7C00000000000000;
  return result;
}

void functionCompose(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionCompose_block_invoke;
  v2[3] = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
  v2[4] = a2;
  evaluateUnary(a1, a2, v2);
}

void __functionCompose_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v4 = *a2;
  v16 = 0;
  v5 = *a2;
  if (*a2 == 1)
  {
    if (my_rnd_mode)
      v7 = 4;
    else
      v7 = 0;
    v6 = __binary64_to_bid128(v7, &my_fpsf, *((double *)a2 + 4));
  }
  else if (v5 == 2)
  {
    v6 = *((_QWORD *)a2 + 6);
    v8 = *((_QWORD *)a2 + 7);
  }
  else
  {
    if (v5 == 4)
      v6 = *((_QWORD *)a2 + 8);
    else
      v6 = 0;
    v8 = 0x3040000000000000;
  }
  v9 = UnitCountCompose(v6, v8, (uint64_t)(a2 + 18), (_OWORD *)(v4 + 72), &v16);
  v11 = v10;
  v17 = 0;
  v12 = __bid128_to_uint64_int(v9, v10, &v17);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v13 + 64) = v12;
  if (my_rnd_mode)
    v14 = 4;
  else
    v14 = 0;
  *(double *)(v13 + 32) = __bid128_to_binary64(v9, v11, v14, &my_fpsf);
  *(_QWORD *)(v13 + 48) = v9;
  *(_QWORD *)(v13 + 56) = v11;
  if (v16)
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v15 + 204) = v16;
    *(_QWORD *)(v15 + 48) = 0;
    *(_QWORD *)(v15 + 56) = 0x7C00000000000000;
  }
}

void _functionConvert(int *a1, int *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  int *v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int v59;
  int v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *v68;
  void *v69;
  int v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92[8];
  _OWORD v93[8];
  __int128 v94;
  void (*v95)(uint64_t, int *);
  void *v96;
  void *v97;
  double v98[6];
  __int128 v99;
  _QWORD v100[18];
  double v101[4];
  __int128 v102;
  __int128 v103;
  _QWORD v104[16];
  __int128 v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v105 = 0u;
  v103 = 0u;
  memset(v104, 0, sizeof(v104));
  v102 = 0u;
  memset(v101, 0, sizeof(v101));
  v99 = 0u;
  memset(v100, 0, sizeof(v100));
  memset(v98, 0, sizeof(v98));
  evaluateTree(*((_QWORD *)a1 + 2), (uint64_t)v101);
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = 1;
  g_GeneratingConvertTerm = 1;
  g_PowNestingLevel = 0;
  v8 = g_unitSuggestions;
  v9 = g_unitSuggestionsSet;
  v68 = (void *)v6;
  v69 = (void *)v5;
  g_unitSuggestions = v6;
  g_unitSuggestionsSet = v5;
  v10 = a2;
  evaluateTree(*((_QWORD *)a1 + 3), (uint64_t)v98);
  g_unitSuggestions = v8;
  g_unitSuggestionsSet = v9;
  g_GeneratingConvertTerm = 0;
  *((_QWORD *)a2 + 1) = functionNoOp;
  *a2 = *a1;
  my_rnd_mode = 1;
  my_fpsf = 0;
  v11 = HIDWORD(v105);
  if (HIDWORD(v105))
    goto LABEL_3;
  v11 = HIDWORD(v100[17]);
  if (HIDWORD(v100[17]))
    goto LABEL_3;
  if ((~*((_QWORD *)&v103 + 1) & 0x7C00000000000000) != 0 && (~*((_QWORD *)&v99 + 1) & 0x7C00000000000000) != 0)
  {
    v70 = 0;
    v75 = *(_OWORD *)&v100[9];
    v76 = *(_OWORD *)&v100[11];
    v77 = *(_OWORD *)&v100[13];
    v78 = *(_OWORD *)&v100[15];
    v71 = *(_OWORD *)&v100[1];
    v72 = *(_OWORD *)&v100[3];
    v73 = *(_OWORD *)&v100[5];
    v74 = *(_OWORD *)&v100[7];
    v13 = UnitCountDecompose(1, 0x3040000000000000, (uint64_t)&v100[1], &v94, &v70);
    v66 = v14;
    if (LODWORD(v101[0]) == 1)
    {
      if (my_rnd_mode)
        v18 = 4;
      else
        v18 = 0;
      v15 = __binary64_to_bid128(v18, &my_fpsf, *(double *)&v102);
    }
    else if (LODWORD(v101[0]) == 2)
    {
      v17 = *((_QWORD *)&v103 + 1);
      v15 = v103;
    }
    else
    {
      if (LODWORD(v101[0]) == 4)
        v15 = v104[0];
      else
        v15 = 0;
      v17 = 0x3040000000000000;
    }
    v19 = UnitCountDecompose(v15, v17, (uint64_t)&v104[1], v93, &v70);
    if (a3)
      v21 = 0;
    else
      v21 = &v70;
    v22 = UnitCountConvert(v19, v20, (uint64_t)v93, (uint64_t)&v94, v92, v21);
    if ((~v23 & 0x7C00000000000000) != 0)
      v24 = 0;
    else
      v24 = a3;
    if (v24 == 1)
    {
      v25 = treeDecimalValue(v98);
      v27 = UnitCountMultiply((uint64_t)&v104[1], v25, v26, (uint64_t)&v100[1], (uint64_t)(a2 + 18), &v70);
      v29 = v28;
      v30 = treeDecimalValue(v101);
      if (my_rnd_mode)
        v32 = 4;
      else
        v32 = 0;
      v33 = __bid128_mul(v30, v31, v27, v29, v32, &my_fpsf);
      v34 = *(_OWORD *)(v10 + 38);
      v88 = *(_OWORD *)(v10 + 34);
      v89 = v34;
      v35 = *(_OWORD *)(v10 + 46);
      v90 = *(_OWORD *)(v10 + 42);
      v91 = v35;
      v36 = *(_OWORD *)(v10 + 22);
      v84 = *(_OWORD *)(v10 + 18);
      v85 = v36;
      v37 = *(_OWORD *)(v10 + 30);
      v86 = *(_OWORD *)(v10 + 26);
      v87 = v37;
      v39 = UnitCountCompose(v33, v38, (uint64_t)&v84, v10 + 18, &v70);
    }
    else
    {
      if (my_rnd_mode)
        v41 = 4;
      else
        v41 = 0;
      v64 = __bid128_div(v22, v23, v13, v66, v41, &my_fpsf);
      v65 = v42;
      v43 = g_unitSuggestions;
      v63 = v13;
      v44 = g_unitSuggestionsSet;
      g_unitSuggestions = (uint64_t)v68;
      g_unitSuggestionsSet = (uint64_t)v69;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v62 = UnitCountCompose(1, 0x3040000000000000uLL, (uint64_t)&v94, &v84, &v70);
      v46 = v45;
      g_unitSuggestions = v43;
      g_unitSuggestionsSet = v44;
      if (my_rnd_mode)
        v47 = 4;
      else
        v47 = 0;
      v48 = __bid128_div(1uLL, 0x3040000000000000uLL, v63, v66, v47, &my_fpsf);
      v50 = __bid128_sub(v48, v49, v62, v46, v47, &my_fpsf);
      v52 = v51 & 0x7FFFFFFFFFFFFFFFLL;
      v53 = __bid128_div(1uLL, 0x3040000000000000uLL, 0x28uLL, 0x3040000000000000uLL, v47, &my_fpsf);
      if (__bid128_quiet_less(v50, v52, v53, v54, &my_fpsf))
      {
        v75 = v88;
        v76 = v89;
        v77 = v90;
        v78 = v91;
        v71 = v84;
        v72 = v85;
        v73 = v86;
        v74 = v87;
      }
      v55 = v76;
      *(_OWORD *)(v10 + 34) = v75;
      *(_OWORD *)(v10 + 38) = v55;
      v56 = v78;
      *(_OWORD *)(v10 + 42) = v77;
      *(_OWORD *)(v10 + 46) = v56;
      v57 = v72;
      *(_OWORD *)(v10 + 18) = v71;
      *(_OWORD *)(v10 + 22) = v57;
      v58 = v74;
      *(_OWORD *)(v10 + 26) = v73;
      *(_OWORD *)(v10 + 30) = v58;
      v39 = v64;
      v40 = v65;
    }
    v16 = v10[51];
    if (!v16)
    {
      v59 = v70;
      if (v70)
      {
        v10[51] = v70;
        v16 = v59;
      }
    }
    v60 = *v10;
    if (*v10 == 1)
    {
      if (my_rnd_mode)
        v61 = 4;
      else
        v61 = 0;
      *((double *)v10 + 4) = __bid128_to_binary64(v39, v40, v61, &my_fpsf);
      v16 = v10[51];
    }
    else if (v60 == 2)
    {
      *((_QWORD *)v10 + 6) = v39;
      *((_QWORD *)v10 + 7) = v40;
    }
    else if (v60 == 4)
    {
      LODWORD(v84) = 0;
      *((_QWORD *)v10 + 8) = __bid128_to_uint64_int(v39, v40, &v84);
    }
    v7 = v24 ^ 1;
    if (!v16)
    {
      if ((my_fpsf & 4) != 0)
      {
        v16 = 1;
      }
      else if ((my_fpsf & 8) != 0)
      {
        v16 = 3;
      }
      else if ((my_fpsf & 0x10) != 0)
      {
        v16 = 2;
      }
      else
      {
        v16 = 4 * (my_fpsf & 1);
      }
      v10[51] = v16;
    }
  }
  else
  {
    *((_QWORD *)a2 + 4) = 0x7FF8000000000000;
    *((_QWORD *)a2 + 6) = 0;
    *((_QWORD *)a2 + 7) = 0x7C00000000000000;
    v16 = a2[51];
  }
  if (!v16 && (~*((_QWORD *)v10 + 7) & 0x7C00000000000000) == 0)
  {
    v11 = 4;
LABEL_3:
    v10[51] = v11;
  }
  if (g_usingNewAPI == 1)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v79 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    *((_QWORD *)&v72 + 1) = 0;
    *(_QWORD *)&v72 = v101;
    v12 = malloc_type_calloc(1uLL, 0xD0uLL, 0x10A00405A5B035DuLL);
    *(_QWORD *)&v94 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v94 + 1) = 3221225472;
    v95 = __functionCompose_block_invoke;
    v96 = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
    v97 = v12;
    evaluateUnary((uint64_t)&v71, (uint64_t)v12, &v94);
    if (v7)
    {
      g_beforeConvertTree = (uint64_t)v12;
      g_isTrivial = 0;
    }
  }

}

void functionConvert(int *a1, int *a2)
{
  _functionConvert(a1, a2, 0);
}

void functionImplicitConvert(int *a1, int *a2)
{
  _functionConvert(a1, a2, 1);
}

void functionFail(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionFail_block_invoke;
  v2[3] = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
  v2[4] = a2;
  evaluateUnary(a1, a2, v2);
}

uint64_t __functionFail_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = 0x7C00000000000000;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 204) = 7;
  return result;
}

void functionUnsupportedMath(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __functionUnsupportedMath_block_invoke;
  v2[3] = &__block_descriptor_40_e83_v16__0__TreeObject_i____TreeObject___TreeObject_d____2Q__Q_16_UnitCount_ii__BBBBi_8l;
  v2[4] = a2;
  evaluateUnary(a1, a2, v2);
}

uint64_t __functionUnsupportedMath_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  *(_DWORD *)(v1 + 204) = 14;
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = 0x7C00000000000000;
  return result;
}

void sub_1B88D4244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t resultTree(void *a1, const char *a2)
{
  return objc_msgSend(a1, "performSelector:", sel_resultTree);
}

id CalculateDefaultNumberFormatter(uint64_t a1)
{
  return +[CalculateResult defaultNumberFormatter:](CalculateResult, "defaultNumberFormatter:", a1);
}

id CalculateEvaluateError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[Calculate evaluate:options:error:needsUpdate:](Calculate, "evaluate:options:error:needsUpdate:", a1, a2, a3, a4);
}

id CalculateTermDecimalString(void *a1)
{
  unint64_t v1;
  uint64_t v2;
  _BYTE v4[42];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "decimalValue");
  if ((~v2 & 0x7C00000000000000) == 0)
    return 0;
  __bid128_to_string((uint64_t)v4, v1, v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CalculateTermFormatDecimalString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v25;

  v5 = a2;
  v6 = a3;
  v25 = 0;
  v7 = a1;
  v8 = (void *)objc_opt_new();
  v9 = objc_retainAutorelease(v7);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "UTF8String");

  v11 = __bid128_from_string(v10, 4, &v25);
  if (v25)
  {
    v13 = 0;
  }
  else
  {
    v14 = v11;
    v15 = v12;
    objc_msgSend(v8, "setDecimalValue:", v11, v12);
    +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:", v16);

    +[CalculateKeys keysWithOptions:]((uint64_t)CalculateKeys, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalculateKeys numberFormatter]((uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[CalculateKeys locales]((uint64_t)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19 || !objc_msgSend(v19, "count"))
      {
        +[Localize systemLocales](Localize, "systemLocales");
        v21 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v21;
      }
      objc_msgSend(v20, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CalculateResult defaultNumberFormatter:](CalculateResult, "defaultNumberFormatter:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setNumberFormatter:", v18);
    objc_msgSend(v23, "setAutoScientificNotation:", -[CalculateKeys autoScientificNotation]((uint64_t)v17));
    objc_msgSend(v23, "setScientificNotationFormat:", -[CalculateKeys scientificNotationFormat]((uint64_t)v17));
    objc_msgSend(v8, "setResult:", v23);
    objc_msgSend(v8, "setForceScientificNotation:", v6);
    objc_msgSend(v8, "formattedValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void sub_1B88DCE38(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0xD88], 8);
  _Block_object_dispose(&STACK[0x748], 8);
  _Block_object_dispose(&STACK[0x7B8], 8);
  _Block_object_dispose(&STACK[0x800], 8);
  _Block_object_dispose(&STACK[0x920], 8);
  _Unwind_Resume(a1);
}

void sub_1B88DDB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B88E0808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__392(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__393(uint64_t a1)
{

}

BOOL CalculatePerformExpression(char *a1, int a2, char a3, uint64_t a4)
{
  return CalculateExpressionError(a1, a2, a3, a4, 1024, 0);
}

BOOL CalculateExpressionError(char *a1, int a2, char a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  size_t v12;
  char *v13;
  char *v14;
  int v15;
  char *i;
  uint64_t v17;
  char *v18;
  BOOL v19;
  unsigned int v20;
  NSObject *v21;
  void *v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  if (!a1 || !a4)
  {
    CalculateLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B885B000, v21, OS_LOG_TYPE_INFO, "Calculate: CalculateExpressionError no expression or result", buf, 2u);
    }

    return 0;
  }
  if (strchr(a1, 35))
    return 0;
  v12 = strlen(a1);
  v13 = (char *)malloc_type_calloc(v12 + 1, 1uLL, 0x100004077774924uLL);
  v14 = v13;
  LOBYTE(v15) = *a1;
  i = v13;
  if (*a1)
  {
    v17 = 0;
    do
    {
      v13[v17] = v15;
      v15 = a1[++v17];
    }
    while (v15);
    v18 = &v13[v17];
    v19 = v18 > v13;
    *v18 = 0;
    for (i = v18 - 1; v19; *i-- = 0)
    {
      v20 = *i - 32;
      if (v20 > 0x3E)
        break;
      if (((1 << v20) & 0x101) == 0)
      {
        if (((1 << v20) & 0x400000000000EC00) == 0)
          break;
        goto LABEL_18;
      }
      v19 = i > v13;
    }
  }
  else
  {
LABEL_18:
    *i = 0;
  }
  v23 = (void *)MEMORY[0x1BCCB4868]();
  +[Calculate _lock](Calculate, "_lock");
  g_allowUnits = 0;
  g_allowPartialExpressions = 1;
  g_allowCurrencyConversions = 1;
  g_usingNewAPI = 0;
  if ((a3 & 7) == 2)
    v24 = 4;
  else
    v24 = 2;
  if ((a3 & 7) == 4)
    v25 = 1;
  else
    v25 = v24;
  v26 = calc_parser_read_buffer((uint64_t)v14, v12, v25, a2, a4, a5, &v29);
  CalculateLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v31 = v26;
    _os_log_impl(&dword_1B885B000, v27, OS_LOG_TYPE_INFO, "Calculate: CalculateExpressionError ret = %d", buf, 8u);
  }

  +[Calculate _unlock](Calculate, "_unlock");
  if (a6)
  {
    *a6 = v29;
    CalculateLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v29;
      _os_log_error_impl(&dword_1B885B000, v28, OS_LOG_TYPE_ERROR, "Calculate: CalculateExpressionError error = %d", buf, 8u);
    }

  }
  objc_autoreleasePoolPop(v23);
  free(v14);
  return (v26 | v29) == 0;
}

BOOL CalculateExpression(char *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  return CalculateExpressionError(a1, a2, a3, a4, a5, 0);
}

BOOL CalculateInternationalExpression(void *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  size_t v10;
  __int16 *v11;
  __int16 *v12;
  size_t v13;
  UChar32 v14;
  __int16 v15;
  id v16;
  _BOOL8 v17;

  v9 = (void *)objc_msgSend(a1, "copy");
  v10 = objc_msgSend(v9, "length");
  v11 = (__int16 *)malloc_type_calloc(v10, 2uLL, 0x1000040BDFB0063uLL);
  objc_msgSend(v9, "getCharacters:", v11);
  if (v10)
  {
    v12 = v11;
    v13 = v10;
    while (1)
    {
      v14 = (unsigned __int16)*v12;
      if (u_isdigit(v14))
        break;
      if (v14 == 1643)
      {
        v15 = 46;
        goto LABEL_7;
      }
LABEL_8:
      ++v12;
      if (!--v13)
        goto LABEL_9;
    }
    v15 = u_charDigitValue(v14) + 48;
LABEL_7:
    *v12 = v15;
    goto LABEL_8;
  }
LABEL_9:
  v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v11, v10, 1));
  v17 = CalculateExpressionError((char *)objc_msgSend(v16, "UTF8String"), a2, a3, a4, a5, 0);

  return v17;
}

void sub_1B88E93DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  uint64_t v61;

  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v61 - 176), 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 256), 8);
  _Block_object_dispose((const void *)(v61 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__615(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__616(uint64_t a1)
{

}

uint64_t calculateScanRequestLock_block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "tokenType") == 2 || objc_msgSend(v1, "tokenType") == 53)
  {
    objc_msgSend(v1, "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length") == 1)
    {
      v3 = (void *)scan_options_stop__apostropheSet;
      objc_msgSend(v1, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1B88EBF4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x398], 8);
  _Block_object_dispose(&STACK[0x3B8], 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__778(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__779(uint64_t a1)
{

}

uint64_t characterTypeForCharacter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "rangeOfCharacterFromSet:", digitSet) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v1, "rangeOfCharacterFromSet:", symbolSet) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v1, "rangeOfCharacterFromSet:", hebrewSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v1, "rangeOfCharacterFromSet:", punctuationSet) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v1, "rangeOfCharacterFromSet:", devanagariDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v1, "rangeOfCharacterFromSet:", eastArabicDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v1, "rangeOfCharacterFromSet:", wideDigitSet) == 0x7FFFFFFFFFFFFFFFLL)
              v2 = 1;
            else
              v2 = 5;
          }
          else
          {
            v2 = 4;
          }
        }
        else
        {
          v2 = 3;
        }
      }
      else
      {
        v2 = 7;
      }
    }
    else
    {
      v2 = 6;
    }
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

void sub_1B88ED550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t calc_yyparse(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  unint64_t v3;
  __int16 *v4;
  _BYTE *v5;
  __int16 *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int16 *v12;
  _BYTE *v13;
  __int16 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *buffer;
  char *v26;
  int previous_state;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  unsigned __int8 *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  int v46;
  char v47;
  int v48;
  int v49;
  int v50;
  unsigned int v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  size_t v57;
  unint64_t v58;
  int v59;
  BOOL v60;
  size_t v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  size_t v68;
  void *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  int v84;
  uint64_t v85;
  size_t v86;
  size_t v87;
  uint64_t *v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  unsigned int v96;
  char *v97;
  uint64_t v98;
  void **v99;
  double *v100;
  double *v101;
  void *v102;
  __int16 *v103;
  __int16 *v104;
  _BYTE *v105;
  __int16 v106;
  __int16 i;
  uint64_t v108;
  int v109;
  int v110;
  uint64_t v111;
  double *v112;
  double **v113;
  uint64_t v114;
  void (*v115)(uint64_t, uint64_t);
  int *v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  uint64_t v120;
  _QWORD *v121;
  int SmallestID;
  _QWORD *v123;
  _QWORD *v124;
  _BOOL4 ShouldImplicitlyAdd;
  double *v126;
  double *v127;
  char *v128;
  void (*v129)(uint64_t, uint64_t);
  uint64_t v130;
  double **v131;
  double **v132;
  double **v133;
  int v134;
  void (*v135)(uint64_t, uint64_t);
  char *v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  void (*v147)(uint64_t, uint64_t);
  uint64_t v148;
  void (*v149)(uint64_t, uint64_t);
  uint64_t v150;
  void (*v151)(uint64_t, uint64_t);
  uint64_t v152;
  void (*v153)(uint64_t, uint64_t);
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  BOOL v159;
  int v160;
  unsigned int v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  size_t v167;
  uint64_t v168;
  int v169;
  uint64_t v170;
  char *v171;
  void *__src;
  unint64_t v173;
  int v174;
  _BYTE __dst[1016];
  _BYTE v176[204800];
  _QWORD v177[53];

  MEMORY[0x1E0C80A78](a1);
  LODWORD(v171) = 0;
  v169 = 0;
  v1 = 0;
  v177[50] = *MEMORY[0x1E0C80C00];
  v2 = v176;
  v3 = 200;
  v4 = (__int16 *)&yypact;
  v5 = &yydefact;
  v6 = (__int16 *)&yycheck;
  memset(__dst, 0, 504);
  yynerrs = 0;
  yychar = -2;
  __src = v176;
  v7 = (char *)v177;
  v8 = (char *)v177;
  while (1)
  {
    *(_WORD *)v7 = v1;
    if (&v8[2 * v3 - 2] <= v7)
    {
      if (v3 >> 4 > 0x270
        || (2 * v3 >= 0x2710 ? (v9 = 10000) : (v9 = 2 * v3),
            (v10 = (char *)malloc_type_malloc(1026 * v9 + 1023, 0xDFB92F49uLL)) == 0))
      {
        v158 = 2;
        goto LABEL_540;
      }
      v11 = v10;
      v170 = v1;
      v12 = v6;
      v13 = v5;
      v14 = v4;
      v15 = (v7 - v8) >> 1;
      v16 = v9;
      v17 = v15 + 1;
      memcpy(v10, v8, 2 * (v15 + 1));
      v18 = v16;
      v19 = (2 * v16 + 1023) & 0xFFFFFFFFFFFFFC00;
      v20 = v8;
      v21 = &v11[v19];
      memcpy(&v11[v19], __src, (v15 + 1) << 10);
      if (v20 != (char *)v177)
        free(v20);
      v7 = &v11[2 * v15];
      v2 = &v21[1024 * v17 - 1024];
      if (v18 <= v17)
      {
        v158 = 1;
        v8 = v11;
        goto LABEL_540;
      }
      v3 = v18;
      __src = v21;
      v8 = v11;
      v4 = v14;
      v5 = v13;
      v6 = v12;
      v1 = v170;
    }
    v22 = v4[(int)v1];
    v173 = v3;
    if ((_DWORD)v22 == -114)
      goto LABEL_262;
    v23 = yychar;
    if (yychar == -2)
    {
      if ((yy_init & 1) == 0)
      {
        yy_init = 1;
        if ((yy_start & 1) == 0)
          yy_start = 1;
        if (!calc_yyin)
          calc_yyin = *MEMORY[0x1E0C80C18];
        v24 = v22;
        if (!calc_yyout)
          calc_yyout = *MEMORY[0x1E0C80C20];
        if (!yy_buffer_stack || (buffer = *(uint64_t **)yy_buffer_stack) == 0)
        {
          calc_yyensure_buffer_stack();
          buffer = (uint64_t *)calc_yy_create_buffer(calc_yyin);
          *(_QWORD *)yy_buffer_stack = buffer;
        }
        yy_n_chars = buffer[4];
        yy_c_buf_p = buffer[2];
        calc_yytext = yy_c_buf_p;
        calc_yyin = *buffer;
        yy_hold_char = *(_BYTE *)yy_c_buf_p;
        v22 = v24;
      }
LABEL_25:
      v26 = (char *)yy_c_buf_p;
      *(_BYTE *)yy_c_buf_p = yy_hold_char;
      previous_state = yy_start;
      v28 = v26;
      while (1)
      {
LABEL_26:
        v29 = &qword_1EF1B6000;
        do
        {
          v30 = yy_ec[*v26];
          if (yy_accept[previous_state])
          {
            yy_last_accepting_state = previous_state;
            yy_last_accepting_cpos = (uint64_t)v26;
          }
          v31 = previous_state;
          v32 = yy_base[previous_state] + v30;
          if (previous_state != (__int16)yy_chk[v32])
          {
            do
            {
              v31 = yy_def[v31];
              if (v31 >= 532)
                v30 = *((unsigned __int8 *)&yy_meta + v30);
              v32 = yy_base[v31] + v30;
            }
            while (yy_chk[v32] != (unsigned __int16)v31);
          }
          previous_state = yy_nxt[v32];
          ++v26;
        }
        while (previous_state != 531);
        v33 = (char *)yy_last_accepting_cpos;
        v34 = yy_last_accepting_state;
LABEL_35:
        v35 = (__int16)yy_accept[v34];
        calc_yytext = (uint64_t)v28;
        calc_yyleng = v33 - v28;
        yy_hold_char = *v33;
        *v33 = 0;
        v171 = v33;
        yy_c_buf_p = (uint64_t)v33;
        if (v34 != 3)
        {
          if (yy_rule_can_match_eol[v35])
          {
            v36 = calc_yyleng;
            if (calc_yyleng)
            {
              v37 = *((_DWORD *)v29 + 318);
              v38 = (unsigned __int8 *)calc_yytext;
              do
              {
                v39 = *v38++;
                if (v39 == 10)
                  *((_DWORD *)v29 + 318) = ++v37;
                --v36;
              }
              while (v36);
            }
          }
        }
        while (2)
        {
          switch(v35)
          {
            case 0:
              *v171 = yy_hold_char;
              goto LABEL_114;
            case 1:
              v84 = v22;
              v85 = calc_yytext;
              v86 = strlen((const char *)calc_yytext);
              v87 = 0;
              if (v86)
              {
                v88 = &yylval;
                LODWORD(v22) = v84;
                do
                {
                  if (*(_BYTE *)(v85 + v87) == 44)
                    ++v87;
                  if (v87 < v86)
                    *(_BYTE *)v88 = *(_BYTE *)(v85 + v87);
                  ++v87;
                  v88 = (uint64_t *)((char *)v88 + 1);
                }
                while (v87 < v86);
              }
              else
              {
                LODWORD(v22) = v84;
              }
              *((_BYTE *)&yylval + v87) = 0;
              v23 = 0x103u;
              goto LABEL_247;
            case 2:
              v23 = 0x102u;
              goto LABEL_247;
            case 3:
              v23 = 0x10Bu;
              goto LABEL_247;
            case 4:
              v23 = 0x10Cu;
              goto LABEL_247;
            case 5:
              v23 = 0x10Du;
              goto LABEL_247;
            case 6:
              v23 = 0x10Eu;
              goto LABEL_247;
            case 7:
              v23 = 0x10Fu;
              goto LABEL_247;
            case 8:
              v23 = 0x110u;
              goto LABEL_247;
            case 9:
              v23 = 0x111u;
              goto LABEL_247;
            case 10:
              v23 = 0x112u;
              goto LABEL_247;
            case 11:
              v23 = 0x113u;
              goto LABEL_247;
            case 12:
              v23 = 0x114u;
              goto LABEL_247;
            case 13:
              v23 = 0x115u;
              goto LABEL_247;
            case 14:
              v23 = 0x116u;
              goto LABEL_247;
            case 15:
              v23 = 0x117u;
              goto LABEL_247;
            case 16:
              v23 = 0x11Bu;
              goto LABEL_247;
            case 17:
              v23 = 0x11Cu;
              goto LABEL_247;
            case 18:
              v23 = 0x11Du;
              goto LABEL_247;
            case 19:
              v23 = 0x121u;
              goto LABEL_247;
            case 20:
              v23 = 0x122u;
              goto LABEL_247;
            case 21:
              v23 = 0x123u;
              goto LABEL_247;
            case 22:
              v23 = 0x118u;
              goto LABEL_247;
            case 23:
              v23 = 0x119u;
              goto LABEL_247;
            case 24:
              v23 = 0x11Au;
              goto LABEL_247;
            case 25:
              v23 = 0x11Eu;
              goto LABEL_247;
            case 26:
              v23 = 0x11Fu;
              goto LABEL_247;
            case 27:
              v23 = 0x120u;
              goto LABEL_247;
            case 28:
              v23 = 0x124u;
              goto LABEL_247;
            case 29:
              v23 = 0x125u;
              goto LABEL_247;
            case 30:
              v23 = 0x126u;
              goto LABEL_247;
            case 31:
              v23 = 0x127u;
              goto LABEL_247;
            case 32:
              v23 = 0x12Au;
              goto LABEL_247;
            case 33:
              v23 = 0x12Du;
              goto LABEL_247;
            case 34:
              v23 = 0x12Eu;
              goto LABEL_247;
            case 35:
              v23 = 0x12Fu;
              goto LABEL_247;
            case 36:
              v23 = 0x130u;
              goto LABEL_247;
            case 37:
              v23 = 0x131u;
              goto LABEL_247;
            case 38:
              v23 = 0x132u;
              goto LABEL_247;
            case 39:
              v23 = 0x133u;
              goto LABEL_247;
            case 40:
              v23 = 0x134u;
              goto LABEL_247;
            case 41:
              v23 = 0x135u;
              goto LABEL_247;
            case 42:
              v23 = 0x136u;
              goto LABEL_247;
            case 43:
              v23 = 0x137u;
              goto LABEL_247;
            case 44:
              v23 = 0x128u;
              goto LABEL_247;
            case 45:
              v23 = 0x129u;
              goto LABEL_247;
            case 46:
              v23 = 0x12Bu;
              goto LABEL_247;
            case 47:
              v23 = 0x12Cu;
              goto LABEL_247;
            case 48:
              v23 = 0x138u;
              goto LABEL_247;
            case 49:
              v23 = 0x139u;
              goto LABEL_247;
            case 50:
              v23 = 0x13Au;
              goto LABEL_247;
            case 51:
              v23 = 0x13Bu;
              goto LABEL_247;
            case 52:
              v23 = 0x13Cu;
              goto LABEL_247;
            case 53:
              v23 = 0x13Du;
              goto LABEL_247;
            case 54:
              v23 = 0x13Eu;
              goto LABEL_247;
            case 55:
              v23 = 0x13Fu;
              goto LABEL_247;
            case 56:
              v23 = 0x140u;
              goto LABEL_247;
            case 57:
              v23 = 0x141u;
              goto LABEL_247;
            case 58:
              v23 = 0x142u;
              goto LABEL_247;
            case 59:
              v23 = 0x143u;
              goto LABEL_247;
            case 60:
              v23 = 0x144u;
              goto LABEL_247;
            case 61:
              v23 = 0x145u;
              goto LABEL_247;
            case 62:
              v23 = 0x146u;
              goto LABEL_247;
            case 63:
              v23 = 0x147u;
              goto LABEL_247;
            case 64:
              v23 = 0x148u;
              goto LABEL_247;
            case 65:
              v23 = 0x149u;
              goto LABEL_247;
            case 66:
              v23 = 0x14Au;
              goto LABEL_247;
            case 67:
            case 68:
              v23 = 0x14Bu;
              goto LABEL_247;
            case 69:
              v23 = 0x14Cu;
              goto LABEL_247;
            case 70:
              v23 = 0x14Du;
              goto LABEL_247;
            case 71:
              v23 = 0x14Eu;
              goto LABEL_247;
            case 72:
              v23 = 0x14Fu;
              goto LABEL_247;
            case 73:
              v89 = v22;
              cleanUnit();
              LODWORD(v22) = v89;
              v23 = 0x104u;
              goto LABEL_247;
            case 74:
              v90 = v22;
              cleanCurrency();
              LODWORD(v22) = v90;
              v23 = 0x106u;
              goto LABEL_247;
            case 75:
              v91 = v22;
              cleanCurrency();
              LODWORD(v22) = v91;
              v23 = 0x105u;
              goto LABEL_247;
            case 76:
              v23 = 0x107u;
              goto LABEL_247;
            case 77:
              v23 = 0x108u;
              goto LABEL_247;
            case 78:
              v23 = 0x109u;
              goto LABEL_247;
            case 79:
              v23 = 0x10Au;
              goto LABEL_247;
            case 80:
              goto LABEL_25;
            case 81:
              v23 = 1u;
              goto LABEL_247;
            case 82:
              v23 = *(char *)calc_yytext;
              goto LABEL_247;
            case 83:
              v83 = g_allowLaTeX == 0;
              v23 = 336;
              goto LABEL_245;
            case 84:
              v83 = g_allowLaTeX == 0;
              v23 = 337;
              goto LABEL_245;
            case 85:
              v83 = g_allowLaTeX == 0;
              v23 = 332;
              goto LABEL_245;
            case 86:
            case 87:
            case 88:
            case 89:
              v83 = g_allowLaTeX == 0;
              v23 = 331;
              goto LABEL_245;
            case 90:
              v83 = g_allowLaTeX == 0;
              v23 = 267;
              goto LABEL_245;
            case 91:
            case 93:
              v83 = g_allowLaTeX == 0;
              v23 = 338;
              goto LABEL_245;
            case 92:
            case 94:
              v83 = g_allowLaTeX == 0;
              v23 = 339;
              goto LABEL_245;
            case 95:
            case 97:
              v83 = g_allowLaTeX == 0;
              v23 = 340;
              goto LABEL_245;
            case 96:
            case 98:
              v83 = g_allowLaTeX == 0;
              v23 = 341;
              goto LABEL_245;
            case 99:
              v83 = g_allowLaTeX == 0;
              v23 = 342;
              goto LABEL_245;
            case 100:
              v83 = g_allowLaTeX == 0;
              v23 = 343;
              goto LABEL_245;
            case 101:
              v83 = g_allowLaTeX == 0;
              v23 = 344;
              goto LABEL_245;
            case 102:
              v83 = g_allowLaTeX == 0;
              v23 = 345;
              goto LABEL_245;
            case 103:
              v83 = g_allowLaTeX == 0;
              v23 = 346;
              goto LABEL_245;
            case 104:
              v83 = g_allowLaTeX == 0;
              v23 = 348;
              goto LABEL_245;
            case 105:
              v83 = g_allowLaTeX == 0;
              v23 = 347;
              goto LABEL_245;
            case 106:
              v83 = g_allowLaTeX == 0;
              v23 = 349;
              goto LABEL_245;
            case 107:
              v83 = g_allowLaTeX == 0;
              v23 = 351;
              goto LABEL_245;
            case 108:
              v83 = g_allowLaTeX == 0;
              v23 = 350;
              goto LABEL_245;
            case 109:
              v83 = g_allowLaTeX == 0;
              v23 = 352;
              goto LABEL_245;
            case 110:
              v83 = g_allowLaTeX == 0;
              v23 = 354;
              goto LABEL_245;
            case 111:
              v83 = g_allowLaTeX == 0;
              v23 = 353;
              goto LABEL_245;
            case 112:
              v83 = g_allowLaTeX == 0;
              v23 = 355;
              goto LABEL_245;
            case 113:
              v83 = g_allowLaTeX == 0;
              v23 = 356;
              goto LABEL_245;
            case 114:
              v83 = g_allowLaTeX == 0;
              v23 = 357;
              goto LABEL_245;
            case 115:
              v83 = g_allowLaTeX == 0;
              v23 = 358;
              goto LABEL_245;
            case 116:
              v83 = g_allowLaTeX == 0;
              v23 = 359;
              goto LABEL_245;
            case 117:
              v83 = g_allowLaTeX == 0;
              v23 = 360;
              goto LABEL_245;
            case 118:
              v83 = g_allowLaTeX == 0;
              v23 = 361;
              goto LABEL_245;
            case 119:
              v83 = g_allowLaTeX == 0;
              v23 = 317;
              goto LABEL_245;
            case 120:
              v83 = g_allowLaTeX == 0;
              v23 = 318;
              goto LABEL_245;
            case 121:
              v83 = g_allowLaTeX == 0;
              v23 = 362;
              goto LABEL_245;
            case 122:
              v83 = g_allowLaTeX == 0;
              v23 = 333;
              goto LABEL_245;
            case 123:
              v83 = g_allowLaTeX == 0;
              v23 = 280;
              goto LABEL_245;
            case 124:
              v83 = g_allowLaTeX == 0;
              v23 = 281;
              goto LABEL_245;
            case 125:
              v83 = g_allowLaTeX == 0;
              v23 = 282;
              goto LABEL_245;
            case 126:
              v83 = g_allowLaTeX == 0;
              v23 = 292;
              goto LABEL_245;
            case 127:
              v83 = g_allowLaTeX == 0;
              v23 = 293;
              goto LABEL_245;
            case 128:
              v83 = g_allowLaTeX == 0;
              v23 = 294;
LABEL_245:
              if (v83)
                v23 = 258;
              goto LABEL_247;
            case 129:
              v82 = v22;
              fwrite((const void *)calc_yytext, calc_yyleng, 1uLL, (FILE *)calc_yyout);
              v22 = v82;
              goto LABEL_25;
            case 130:
              v166 = v8;
              v164 = calc_yytext;
              *v171 = yy_hold_char;
              v40 = yy_buffer_stack;
              v41 = *(_QWORD *)yy_buffer_stack;
              if (*(_DWORD *)(*(_QWORD *)yy_buffer_stack + 64))
              {
                v42 = yy_n_chars;
              }
              else
              {
                v42 = *(_QWORD *)(v41 + 32);
                yy_n_chars = v42;
                *(_QWORD *)v41 = calc_yyin;
                v41 = *(_QWORD *)v40;
                *(_DWORD *)(*(_QWORD *)v40 + 64) = 1;
              }
              LODWORD(v43) = yy_c_buf_p;
              v44 = *(_BYTE **)(v41 + 8);
              if (yy_c_buf_p > (unint64_t)&v44[v42])
              {
                v165 = v28;
                if (yy_c_buf_p > (unint64_t)&v44[v42 + 1])
                  yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
                v28 = (char *)calc_yytext;
                if (!*(_DWORD *)(v41 + 60))
                {
                  v8 = v166;
                  v4 = (__int16 *)&yypact;
                  if (yy_c_buf_p - calc_yytext == 1)
                    goto LABEL_100;
                  goto LABEL_106;
                }
                v45 = ~calc_yytext + yy_c_buf_p;
                if ((int)v45 >= 1)
                {
                  v46 = ~(_DWORD)calc_yytext + yy_c_buf_p;
                  do
                  {
                    v47 = *v28++;
                    *v44++ = v47;
                    --v46;
                  }
                  while (v46);
                  v41 = *(_QWORD *)v40;
                }
                v48 = *(_DWORD *)(v41 + 64);
                v168 = (int)v45;
                v170 = v1;
                if (v48 == 2)
                {
                  yy_n_chars = 0;
                  goto LABEL_55;
                }
                v49 = ~(_DWORD)v45;
                v50 = *(_DWORD *)(v41 + 24);
                v51 = v50 + ~(_DWORD)v45;
                v163 = v45;
                if (!v51)
                {
                  do
                  {
                    if (!*(_DWORD *)(v41 + 40))
                    {
                      *(_QWORD *)(v41 + 8) = 0;
LABEL_562:
                      yy_fatal_error("fatal error - scanner input buffer overflow");
                    }
                    v52 = v22;
                    v53 = *(void **)(v41 + 8);
                    v54 = 2 * v50;
                    *(_DWORD *)(v41 + 24) = v54;
                    v55 = malloc_type_realloc(v53, v54 + 2, 0xFA553FE1uLL);
                    *(_QWORD *)(v41 + 8) = v55;
                    if (!v55)
                      goto LABEL_562;
                    v43 = (uint64_t)v55 + (int)v43 - (int)v53;
                    yy_c_buf_p = v43;
                    v41 = *(_QWORD *)yy_buffer_stack;
                    v50 = *(_DWORD *)(*(_QWORD *)yy_buffer_stack + 24);
                    v51 = v50 + v49;
                    v22 = v52;
                  }
                  while (!(v50 + v49));
                  v5 = &yydefact;
                }
                v56 = v22;
                if (v51 >= 0x2000)
                  v57 = 0x2000;
                else
                  v57 = v51;
                v167 = v57;
                if (*(_DWORD *)(v41 + 44))
                {
                  v58 = 0;
                  do
                  {
                    v59 = getc((FILE *)calc_yyin);
                    v60 = v59 == -1 || v59 == 10;
                    if (v60)
                      goto LABEL_74;
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)yy_buffer_stack + 8) + v168 + v58++) = v59;
                  }
                  while (v167 != v58);
                  v58 = v167;
LABEL_74:
                  if (v59 == -1)
                  {
                    v62 = ferror((FILE *)calc_yyin);
                    v22 = v56;
                    if (v62)
LABEL_563:
                      yy_fatal_error("input in flex scanner failed");
                  }
                  else
                  {
                    if (v59 == 10)
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)yy_buffer_stack + 8) + v168 + v58++) = 10;
                    v22 = v56;
                  }
                  yy_n_chars = v58;
                  goto LABEL_86;
                }
                *__error() = 0;
                while (1)
                {
                  v61 = fread((void *)(*(_QWORD *)(*(_QWORD *)yy_buffer_stack + 8) + v168), 1uLL, v167, (FILE *)calc_yyin);
                  v58 = (int)v61;
                  yy_n_chars = (int)v61;
                  if (v61 << 32)
                  {
                    v22 = v56;
LABEL_86:
                    v40 = yy_buffer_stack;
                    v41 = *(_QWORD *)yy_buffer_stack;
                    *(_QWORD *)(*(_QWORD *)yy_buffer_stack + 32) = v58;
                    v45 = v163;
                    if (!v58)
                      goto LABEL_88;
                    v63 = 0;
                    goto LABEL_94;
                  }
                  if (!ferror((FILE *)calc_yyin))
                    break;
                  if (*__error() != 4)
                    goto LABEL_563;
                  *__error() = 0;
                  clearerr((FILE *)calc_yyin);
                }
                v40 = yy_buffer_stack;
                v41 = *(_QWORD *)yy_buffer_stack;
                v22 = v56;
                v45 = v163;
LABEL_55:
                *(_QWORD *)(v41 + 32) = 0;
LABEL_88:
                if ((_DWORD)v45)
                {
                  v58 = 0;
                  v63 = 2;
                  *(_DWORD *)(v41 + 64) = 2;
                }
                else
                {
                  v163 = v45;
                  v162 = v22;
                  v64 = calc_yyin;
                  if (!yy_buffer_stack || (v65 = *(_QWORD *)yy_buffer_stack) == 0)
                  {
                    calc_yyensure_buffer_stack();
                    v65 = calc_yy_create_buffer(calc_yyin);
                    *(_QWORD *)yy_buffer_stack = v65;
                  }
                  calc_yy_init_buffer(v65, v64);
                  v40 = yy_buffer_stack;
                  v41 = *(_QWORD *)yy_buffer_stack;
                  v58 = *(_QWORD *)(*(_QWORD *)yy_buffer_stack + 32);
                  yy_n_chars = v58;
                  yy_c_buf_p = *(_QWORD *)(v41 + 16);
                  calc_yytext = yy_c_buf_p;
                  calc_yyin = *(_QWORD *)v41;
                  yy_hold_char = *(_BYTE *)yy_c_buf_p;
                  v63 = 1;
                  v22 = v162;
                  LODWORD(v45) = v163;
                }
LABEL_94:
                v66 = (char *)(v58 + (int)v45);
                v1 = v170;
                if ((unint64_t)v66 <= *(int *)(v41 + 24))
                {
                  v70 = *(_QWORD *)(v41 + 8);
                  v8 = v166;
                }
                else
                {
                  v67 = v22;
                  v68 = (size_t)&v66[v58 >> 1];
                  v69 = malloc_type_realloc(*(void **)(v41 + 8), v68, 0xFA553FE1uLL);
                  v40 = yy_buffer_stack;
                  *(_QWORD *)(*(_QWORD *)yy_buffer_stack + 8) = v69;
                  v70 = *(_QWORD *)(*(_QWORD *)v40 + 8);
                  if (!v70)
                    yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
                  *(_DWORD *)(*(_QWORD *)v40 + 24) = v68 - 2;
                  v66 = (char *)(yy_n_chars + v168);
                  v8 = v166;
                  v22 = v67;
                }
                yy_n_chars = (uint64_t)v66;
                v66[v70] = 0;
                v66[*(_QWORD *)(*(_QWORD *)v40 + 8) + 1] = 0;
                v28 = *(char **)(*(_QWORD *)v40 + 8);
                calc_yytext = (uint64_t)v28;
                if (v63 == 1)
                {
                  v4 = (__int16 *)&yypact;
LABEL_100:
                  yy_c_buf_p = (uint64_t)v28;
                  v35 = 131;
                  v28 = v165;
                  continue;
                }
                if (!v63)
                {
                  v26 = &v28[~(_DWORD)v164 + (int)v171];
                  yy_c_buf_p = (uint64_t)v26;
                  v80 = v5;
                  v81 = v22;
                  previous_state = yy_get_previous_state();
                  v22 = v81;
                  v5 = v80;
                  v4 = (__int16 *)&yypact;
                  goto LABEL_26;
                }
                v60 = v63 == 2;
                v4 = (__int16 *)&yypact;
                if (!v60)
                  goto LABEL_25;
                v44 = *(_BYTE **)(*(_QWORD *)yy_buffer_stack + 8);
                v42 = yy_n_chars;
LABEL_106:
                v162 = v22;
                v71 = &v44[v42];
                yy_c_buf_p = (uint64_t)&v44[v42];
                v34 = yy_get_previous_state();
                v33 = v71;
                v22 = v162;
                v5 = &yydefact;
LABEL_115:
                v29 = &qword_1EF1B6000;
                goto LABEL_35;
              }
              v72 = v22;
              v28 = (char *)calc_yytext;
              v73 = calc_yytext + ~(_DWORD)v164 + (int)v171;
              yy_c_buf_p = v73;
              v74 = yy_get_previous_state();
              if (yy_accept[v74])
              {
                yy_last_accepting_state = v74;
                yy_last_accepting_cpos = v73;
              }
              v75 = v73;
              v76 = v74;
              v77 = yy_base[v74] + 1;
              v8 = v166;
              v4 = (__int16 *)&yypact;
              v22 = v72;
              v5 = &yydefact;
              if (v74 != (__int16)yy_chk[v77])
              {
                do
                {
                  v78 = (unsigned __int16)yy_def[v76];
                  v76 = (__int16)v78;
                  v77 = yy_base[(__int16)v78] + 1;
                }
                while (v78 != yy_chk[v77]);
              }
              v79 = (unsigned __int16)yy_nxt[v77];
              if (!yy_nxt[v77] || v79 == 531)
              {
LABEL_114:
                v33 = (char *)yy_last_accepting_cpos;
                v34 = yy_last_accepting_state;
                goto LABEL_115;
              }
              previous_state = (__int16)v79;
              v26 = (char *)(v75 + 1);
              yy_c_buf_p = v75 + 1;
              break;
            case 131:
              v23 = 0u;
LABEL_247:
              yychar = v23;
              goto LABEL_248;
            default:
              yy_fatal_error("fatal flex scanner internal error--no action found");
          }
          break;
        }
      }
    }
LABEL_248:
    if (v23 <= 0)
    {
      v92 = 0;
      yychar = 0;
    }
    else
    {
      v92 = v23 > 0x16A ? 2 : yytranslate[v23];
    }
    v93 = (v92 + v22);
    LODWORD(v171) = v92;
    if (v93 > 0x8F4 || v92 != v6[v93])
    {
LABEL_262:
      v96 = v5[(int)v1];
      if (!v5[(int)v1])
        break;
      goto LABEL_263;
    }
    v94 = (__int16)yytable[v93];
    if ((int)v94 > 0)
    {
      if ((_DWORD)v94 == 144)
        goto LABEL_559;
      v95 = v169 - 1;
      if (!v169)
        v95 = 0;
      v169 = v95;
      if (v23 >= 1)
        yychar = -2;
      v2 += 1024;
      memcpy(v2, &yylval, 0x400uLL);
      goto LABEL_484;
    }
    if (!yytable[v93] || yytable[v93] == 65525)
      break;
    v96 = -(int)v94;
LABEL_263:
    v97 = v8;
    v170 = v96;
    v98 = yyr2[v96];
    v99 = (void **)&v2[1024 * (1 - v98)];
    v100 = (double *)*v99;
    memcpy(__dst, v99 + 1, sizeof(__dst));
    switch(v96)
    {
      case 2u:
        v116 = (int *)newConstantNode("0.0");
        v168 = *(_QWORD *)v2;
        evaluateTree(v168, (uint64_t)v116);
        g_ErrorCode = v116[51];
        if (g_ErrorCode && !g_forceResult)
        {
          if (g_ResultBuffer)
            snprintf((char *)g_ResultBuffer, g_BufferLen, "");
          goto LABEL_510;
        }
        if (g_usingNewAPI != 1)
        {
          displayNode(v116);
LABEL_510:
          freeTree((_QWORD *)v168);
          freeTree(v116);
          goto LABEL_480;
        }
        g_parseTree = v168;
        v168 = (uint64_t)v116;
        g_resultTree = (uint64_t)v116;
        v139 = g_isTrivial;
        g_wasTrivial = g_isTrivial;
        if (g_containsCurrencyConversion == 1)
        {
          v139 = 0;
          g_isTrivial = 0;
        }
        if ((g_foundFirstCoefficient & 1) == 0)
        {
          g_firstCoefficient_0 = 1;
          qword_1ED563A58 = 0x3040000000000000;
        }
        if (g_negationCount == 1)
          qword_1ED563A58 ^= 0x8000000000000000;
        if (v139)
        {
          v174 = 0;
          v140 = __bid128_div(1uLL, 0x3040000000000000uLL, 0x1EuLL, 0x3040000000000000uLL, 4, &v174);
          v165 = (char *)qword_1ED563A58;
          v166 = (char *)v140;
          v141 = g_firstCoefficient_0;
          v167 = v142;
          LODWORD(v164) = __bid128_quiet_less(g_firstCoefficient_0, qword_1ED563A58 & 0x7FFFFFFFFFFFFFFFLL, v140, v142, &v174);
          v143 = treeDecimalValue((double *)v168);
          if ((_DWORD)v164)
          {
            v145 = __bid128_sub(v143, v144, v141, (uint64_t)v165, 4, &v174);
          }
          else
          {
            v154 = __bid128_div(v143, v144, v141, (unint64_t)v165, 4, &v174);
            v145 = __bid128_add(v154, v155, 1uLL, 0xB040000000000000, 4, &v174);
          }
          if (!__bid128_quiet_less(v145, v146 & 0x7FFFFFFFFFFFFFFFLL, (unint64_t)v166, v167, &v174))g_isTrivial = 0;
        }
LABEL_480:
        v136 = &v2[-1024 * v98];
        v7 -= 2 * v98;
        v2 = v136 + 1024;
        *((_QWORD *)v136 + 128) = v100;
        memcpy(v136 + 1032, __dst, 0x3F8uLL);
        v137 = yyr1[v170] - 119;
        v138 = (*(__int16 *)v7 + yypgoto[v137]);
        if (v138 <= 0x8F4 && v6[v138] == *(_WORD *)v7)
        {
          v94 = (__int16)yytable[v138];
          v8 = v97;
        }
        else
        {
          v94 = yydefgoto[v137];
          v8 = v97;
        }
        break;
      case 4u:
        v101 = *(double **)v2;
        v102 = functionCompose;
        goto LABEL_477;
      case 5u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        goto LABEL_322;
      case 6u:
        v101 = *(double **)v2;
        v112 = (double *)*((_QWORD *)v2 - 256);
LABEL_322:
        v102 = functionConvert;
        goto LABEL_478;
      case 7u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        goto LABEL_325;
      case 8u:
        v101 = *(double **)v2;
        v112 = (double *)*((_QWORD *)v2 - 256);
LABEL_325:
        v102 = functionImplicitConvert;
        goto LABEL_478;
      case 0xCu:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionOR;
        goto LABEL_478;
      case 0xDu:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionNOR;
        goto LABEL_478;
      case 0xFu:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionXOR;
        goto LABEL_478;
      case 0x11u:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionLeftShift;
        goto LABEL_478;
      case 0x12u:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionRightShift;
        goto LABEL_478;
      case 0x13u:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionLeftRotate;
        goto LABEL_478;
      case 0x14u:
        if (g_allowLaTeX)
          goto LABEL_347;
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionRightRotate;
        goto LABEL_478;
      case 0x16u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        if (*((void (**)(uint64_t, uint64_t))v101 + 1) != functionPercent
          && *((void (**)(uint64_t, uint64_t))v112 + 1) == functionPercent
          && (v148 = *((_QWORD *)v112 + 2)) != 0
          && ((v149 = *(void (**)(uint64_t, uint64_t))(v148 + 8), v149 == functionConstant)
           || *(_BYTE *)(v148 + 200)
           || (v149 == functionPow || v149 == functionFactorial)
           && (v156 = *(_QWORD *)(v148 + 16)) != 0
           && (*(void (**)(uint64_t, uint64_t))(v156 + 8) == functionConstant || *(_BYTE *)(v156 + 200))))
        {
          v102 = functionPercentIncrease;
        }
        else
        {
          v102 = functionAdd;
        }
        goto LABEL_478;
      case 0x17u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        if (*((void (**)(uint64_t, uint64_t))v101 + 1) != functionPercent
          && *((void (**)(uint64_t, uint64_t))v112 + 1) == functionPercent
          && (v150 = *((_QWORD *)v112 + 2)) != 0
          && ((v151 = *(void (**)(uint64_t, uint64_t))(v150 + 8), v151 == functionConstant)
           || *(_BYTE *)(v150 + 200)
           || (v151 == functionPow || v151 == functionFactorial)
           && (v157 = *(_QWORD *)(v150 + 16)) != 0
           && (*(void (**)(uint64_t, uint64_t))(v157 + 8) == functionConstant || *(_BYTE *)(v157 + 200))))
        {
          v102 = functionPercentDecrease;
        }
        else
        {
          v102 = functionSubtract;
        }
        goto LABEL_478;
      case 0x19u:
        if (g_allowLaTeX)
        {
LABEL_347:
          v101 = *(double **)v2;
          goto LABEL_409;
        }
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionAND;
        goto LABEL_478;
      case 0x1Bu:
        v168 = (uint64_t)(v2 - 1024);
        v117 = __calc_yyparse_block_invoke(*((_QWORD **)v2 - 128));
        v118 = __calc_yyparse_block_invoke(*(_QWORD **)v2);
        v119 = v118;
        if (v117)
        {
          if (v118)
          {
            if ((void (*)(uint64_t, uint64_t))v118[1] == functionConstant
              && (void (*)(uint64_t, uint64_t))v117[1] == functionUnit)
            {
              v120 = (uint64_t)(v117 + 9);
              v167 = (size_t)v117;
              v121 = v119;
              SmallestID = UnitCountNextSmallestID(v120);
              v119 = v121;
              v117 = (_QWORD *)v167;
              if (SmallestID)
              {
                v123 = newUnitIDNode(SmallestID);
                v124 = newTreeObject((uint64_t)functionCoefficientUnit, *(_QWORD *)v2, (uint64_t)v123);
                v119 = v123;
                v117 = (_QWORD *)v167;
                *(_QWORD *)v2 = v124;
              }
            }
          }
        }
        if (v117 && v119)
        {
          ShouldImplicitlyAdd = UnitCountShouldImplicitlyAdd((uint64_t)(v117 + 9), (uint64_t)(v119 + 9));
          v101 = *(double **)v168;
          v112 = *(double **)v2;
          if (ShouldImplicitlyAdd)
          {
            v102 = functionImplicitAdd;
            goto LABEL_478;
          }
        }
        else
        {
          v101 = *(double **)v168;
          v112 = *(double **)v2;
        }
        if (*((_BYTE *)v101 + 200)
          || *((_BYTE *)v112 + 200)
          || !g_ignoreProbableSearches
          || (v147 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v112 + 1), v147 == functionPow)
          || v147 == functionSqrRootInline
          || v147 == functionCubeRootInline
          || *((_BYTE *)v112 + 203))
        {
LABEL_288:
          v102 = functionMultiply;
          goto LABEL_478;
        }
LABEL_295:
        v102 = functionFail;
        v101 = v100;
        goto LABEL_477;
      case 0x1Cu:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        if (*((void (**)(uint64_t, uint64_t))v101 + 1) == functionConstant
          && *((void (**)(uint64_t, uint64_t))v112 + 1) == functionUnit)
        {
          goto LABEL_377;
        }
        goto LABEL_288;
      case 0x1Du:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v100 = *(double **)v2;
        if (*((_BYTE *)v101 + 201)
          || *((void (**)(uint64_t, uint64_t))v100 + 1) != functionCoefficientUnit
          || *((_BYTE *)v100 + 200))
        {
          v102 = functionDivide;
          goto LABEL_373;
        }
        v152 = *((_QWORD *)v100 + 2);
        v153 = functionDivide;
        goto LABEL_523;
      case 0x1Eu:
      case 0x1Fu:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        v102 = functionFMod;
        goto LABEL_478;
      case 0x20u:
      case 0x23u:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionPercent;
        goto LABEL_477;
      case 0x21u:
        v126 = (double *)*((_QWORD *)v2 - 128);
        v112 = newConstantNode("0.0174532925199432957692369076848861271344287188854172");
        v102 = functionMultiply;
        v101 = v126;
        goto LABEL_478;
      case 0x25u:
      case 0x37u:
      case 0x46u:
      case 0x48u:
        v101 = *(double **)v2;
        v102 = functionNegate;
        goto LABEL_477;
      case 0x27u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v100 = *(double **)v2;
        goto LABEL_369;
      case 0x28u:
        if (!g_allowLaTeX)
          goto LABEL_474;
        v101 = (double *)*((_QWORD *)v2 - 512);
        v100 = (double *)*((_QWORD *)v2 - 128);
LABEL_369:
        if (*((_BYTE *)v101 + 201)
          || *((void (**)(uint64_t, uint64_t))v100 + 1) != functionCoefficientUnit
          || *((_BYTE *)v100 + 200))
        {
          v102 = functionPow;
LABEL_373:
          v112 = v100;
          goto LABEL_478;
        }
        v152 = *((_QWORD *)v100 + 2);
        v153 = functionPow;
LABEL_523:
        *((_QWORD *)v100 + 2) = newTreeObject((uint64_t)v153, (uint64_t)v101, v152);
        goto LABEL_480;
      case 0x2Au:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionFactorial;
        goto LABEL_477;
      case 0x2Cu:
        v101 = (double *)newTreeObject((uint64_t)functionSameCurrency, *((_QWORD *)v2 - 256), *(_QWORD *)v2);
        *((_QWORD *)v2 - 256) = v101;
        v112 = (double *)*((_QWORD *)v2 - 128);
        goto LABEL_288;
      case 0x2Du:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v112 = *(double **)v2;
LABEL_377:
        v102 = functionCoefficientUnit;
        goto LABEL_478;
      case 0x2Eu:
      case 0x32u:
      case 0x49u:
      case 0x4Au:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v112 = *(double **)v2;
        goto LABEL_288;
      case 0x34u:
        v101 = (double *)*((_QWORD *)v2 - 256);
        v112 = *(double **)v2;
        goto LABEL_426;
      case 0x35u:
        if (!g_allowLaTeX)
        {
LABEL_474:
          v113 = (double **)(v2 - 1024);
          goto LABEL_475;
        }
        v101 = (double *)*((_QWORD *)v2 - 512);
LABEL_413:
        v133 = (double **)(v2 - 1024);
        goto LABEL_425;
      case 0x3Du:
      case 0x3Fu:
        v100 = (double *)newUnitNode(v2);
        if (!g_allowUnits)
          goto LABEL_295;
        goto LABEL_480;
      case 0x40u:
        v127 = newConstantNode((unsigned __int8 *)v2);
        goto LABEL_479;
      case 0x41u:
        v128 = "3.14159265358979323846264338327950288";
        goto LABEL_385;
      case 0x42u:
        v128 = "1.61803398874989484820458683436563811";
        goto LABEL_385;
      case 0x43u:
        v128 = "2.71828182845904523536028747135266249";
LABEL_385:
        v100 = newConstantNode((unsigned __int8 *)v128);
        *((_BYTE *)v100 + 203) = 1;
        goto LABEL_480;
      case 0x44u:
        v127 = (double *)newVariableNode(v2);
        goto LABEL_479;
      case 0x4Bu:
        v102 = (void *)*((_QWORD *)v2 - 128);
        v101 = *(double **)v2;
        goto LABEL_477;
      case 0x4Cu:
        v115 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v2 - 384);
        v114 = *(_QWORD *)v2;
        goto LABEL_412;
      case 0x4Du:
        if (!g_allowLaTeX)
          goto LABEL_427;
        v129 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v2 - 640);
        v130 = *(_QWORD *)v2;
        goto LABEL_424;
      case 0x4Eu:
        if (g_allowLaTeX)
        {
          v131 = (double **)(v2 - 3072);
          goto LABEL_408;
        }
        v102 = (void *)*((_QWORD *)v2 - 640);
        v101 = (double *)*((_QWORD *)v2 - 384);
        v112 = (double *)*((_QWORD *)v2 - 128);
        goto LABEL_478;
      case 0x4Fu:
        v101 = (double *)*((_QWORD *)v2 - 384);
        if (!g_allowLaTeX)
          goto LABEL_476;
        goto LABEL_409;
      case 0x50u:
      case 0x65u:
        v101 = *(double **)v2;
        v102 = functionLog;
        goto LABEL_477;
      case 0x51u:
      case 0x66u:
        v114 = *(_QWORD *)v2;
        v115 = functionLog;
        goto LABEL_412;
      case 0x52u:
        v101 = (double *)*((_QWORD *)v2 - 384);
        if (g_allowLaTeX)
          goto LABEL_409;
        v112 = (double *)*((_QWORD *)v2 - 128);
        goto LABEL_421;
      case 0x53u:
      case 0x5Bu:
      case 0x5Eu:
        if (g_allowLaTeX)
          goto LABEL_407;
        v113 = (double **)(v2 - 3072);
        goto LABEL_475;
      case 0x54u:
        v132 = (double **)(v2 - 1024);
        goto LABEL_420;
      case 0x55u:
      case 0x68u:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionCeil;
        goto LABEL_477;
      case 0x56u:
      case 0x69u:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionFloor;
        goto LABEL_477;
      case 0x57u:
        v101 = *(double **)v2;
        if (g_allowLaTeX)
          goto LABEL_409;
        v102 = functionRound;
        goto LABEL_477;
      case 0x58u:
        v114 = *(_QWORD *)v2;
        v115 = functionRound;
        goto LABEL_412;
      case 0x59u:
        if (!g_allowLaTeX)
          goto LABEL_427;
        v130 = *(_QWORD *)v2;
        v129 = functionRound;
        goto LABEL_424;
      case 0x5Au:
        if (g_allowLaTeX)
          goto LABEL_407;
        v101 = (double *)*((_QWORD *)v2 - 384);
        v112 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionRoundNearest;
        goto LABEL_478;
      case 0x5Cu:
        v101 = (double *)*((_QWORD *)v2 - 384);
        v112 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionFlip;
        goto LABEL_478;
      case 0x5Du:
        if (!g_allowLaTeX)
        {
          v101 = (double *)*((_QWORD *)v2 - 384);
          v112 = (double *)*((_QWORD *)v2 - 128);
LABEL_508:
          v102 = functionRoot;
          goto LABEL_478;
        }
LABEL_407:
        v131 = (double **)(v2 - 1024);
LABEL_408:
        v101 = *v131;
LABEL_409:
        v102 = functionUnsupportedMath;
        goto LABEL_477;
      case 0x5Fu:
        v101 = *(double **)v2;
        goto LABEL_417;
      case 0x60u:
        v114 = *(_QWORD *)v2;
        v115 = functionSqrRoot;
LABEL_412:
        v101 = (double *)newTreeObject((uint64_t)v115, v114, 0);
        goto LABEL_413;
      case 0x61u:
        if (!g_allowLaTeX)
          goto LABEL_427;
        v130 = *(_QWORD *)v2;
        v129 = functionSqrRoot;
        goto LABEL_424;
      case 0x62u:
        v101 = (double *)*((_QWORD *)v2 - 128);
LABEL_417:
        v102 = functionSqrRoot;
        goto LABEL_477;
      case 0x63u:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v112 = (double *)*((_QWORD *)v2 - 512);
        goto LABEL_508;
      case 0x64u:
        v132 = (double **)(v2 - 2048);
LABEL_420:
        v101 = *v132;
        v112 = *(double **)v2;
LABEL_421:
        v102 = functionLogBase;
        goto LABEL_478;
      case 0x67u:
        if (!g_allowLaTeX)
        {
LABEL_427:
          v113 = (double **)(v2 - 2048);
LABEL_475:
          v101 = *v113;
          goto LABEL_476;
        }
        v130 = *(_QWORD *)v2;
        v129 = functionLog;
LABEL_424:
        v101 = (double *)newTreeObject((uint64_t)v129, v130, 0);
        v133 = (double **)(v2 - 2048);
LABEL_425:
        v112 = *v133;
LABEL_426:
        v102 = functionPow;
        goto LABEL_478;
      case 0x6Au:
        v101 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionFabs;
        goto LABEL_477;
      case 0x6Bu:
        v101 = (double *)*((_QWORD *)v2 - 512);
        v112 = (double *)*((_QWORD *)v2 - 128);
        v102 = functionDivide;
        goto LABEL_478;
      case 0x6Cu:
        v100 = (double *)functionSqrRootInline;
        goto LABEL_480;
      case 0x6Du:
        v100 = (double *)functionCubeRootInline;
        goto LABEL_480;
      case 0x6Eu:
        v134 = g_allowLaTeX;
        v135 = functionSqrRoot;
        goto LABEL_448;
      case 0x6Fu:
        v134 = g_allowLaTeX;
        v135 = functionCubeRoot;
        goto LABEL_448;
      case 0x70u:
        v134 = g_allowLaTeX;
        v135 = functionExp;
        goto LABEL_448;
      case 0x71u:
      case 0x92u:
        v100 = (double *)functionLn;
        goto LABEL_480;
      case 0x72u:
      case 0x93u:
        v100 = (double *)functionSine;
        goto LABEL_480;
      case 0x73u:
      case 0x94u:
        v100 = (double *)functionCos;
        goto LABEL_480;
      case 0x74u:
      case 0x95u:
        v100 = (double *)functionTan;
        goto LABEL_480;
      case 0x75u:
        v100 = (double *)functionSinD;
        goto LABEL_480;
      case 0x76u:
        v100 = (double *)functionCosD;
        goto LABEL_480;
      case 0x77u:
        v100 = (double *)functionTanD;
        goto LABEL_480;
      case 0x78u:
      case 0x96u:
        v100 = (double *)functionASin;
        goto LABEL_480;
      case 0x79u:
      case 0x97u:
        v100 = (double *)functionACos;
        goto LABEL_480;
      case 0x7Au:
      case 0x98u:
        v100 = (double *)functionATan;
        goto LABEL_480;
      case 0x7Bu:
        v100 = (double *)functionASinD;
        goto LABEL_480;
      case 0x7Cu:
        v100 = (double *)functionACosD;
        goto LABEL_480;
      case 0x7Du:
        v100 = (double *)functionATanD;
        goto LABEL_480;
      case 0x7Eu:
      case 0x99u:
        v100 = (double *)functionSinH;
        goto LABEL_480;
      case 0x7Fu:
      case 0x9Au:
        v100 = (double *)functionCosH;
        goto LABEL_480;
      case 0x80u:
      case 0x9Bu:
        v100 = (double *)functionTanH;
        goto LABEL_480;
      case 0x81u:
        v100 = (double *)functionASinH;
        goto LABEL_480;
      case 0x82u:
        v100 = (double *)functionACosH;
        goto LABEL_480;
      case 0x83u:
        v100 = (double *)functionATanH;
        goto LABEL_480;
      case 0x84u:
        v134 = g_allowLaTeX;
        v135 = functionCeil;
        goto LABEL_448;
      case 0x85u:
        v134 = g_allowLaTeX;
        v135 = functionFloor;
        goto LABEL_448;
      case 0x86u:
        v100 = (double *)functionRInt;
        goto LABEL_480;
      case 0x87u:
        v134 = g_allowLaTeX;
        v135 = functionFabs;
LABEL_448:
        if (v134)
          v100 = (double *)functionUnsupportedMath;
        else
          v100 = (double *)v135;
        goto LABEL_480;
      case 0x88u:
        v100 = (double *)functionJ0;
        goto LABEL_480;
      case 0x89u:
        v100 = (double *)functionJ1;
        goto LABEL_480;
      case 0x8Au:
        v100 = (double *)functionY0;
        goto LABEL_480;
      case 0x8Bu:
        v100 = (double *)functionY1;
        goto LABEL_480;
      case 0x8Cu:
        v100 = (double *)functionLGamma;
        goto LABEL_480;
      case 0x8Du:
        v100 = (double *)functionERF;
        goto LABEL_480;
      case 0x8Eu:
        v100 = (double *)functionERFC;
        goto LABEL_480;
      case 0x8Fu:
        v100 = (double *)functionFactorial;
        goto LABEL_480;
      case 0x90u:
        v100 = (double *)functionNOT;
        goto LABEL_480;
      case 0x91u:
        v100 = (double *)functionNEG;
        goto LABEL_480;
      case 0x9Cu:
        v100 = (double *)functionSec;
        goto LABEL_480;
      case 0x9Du:
        v100 = (double *)functionCsc;
        goto LABEL_480;
      case 0x9Eu:
        v100 = (double *)functionCot;
        goto LABEL_480;
      case 0x9Fu:
        v100 = (double *)functionSecH;
        goto LABEL_480;
      case 0xA0u:
        v100 = (double *)functionCscH;
        goto LABEL_480;
      case 0xA1u:
        v100 = (double *)functionCotH;
        goto LABEL_480;
      case 0xA2u:
        v100 = (double *)functionPow;
        goto LABEL_480;
      case 0xA3u:
        v100 = (double *)functionFMod;
        goto LABEL_480;
      case 0xA4u:
        v100 = (double *)functionHypot;
        goto LABEL_480;
      case 0xA5u:
        v100 = (double *)functionRem;
        goto LABEL_480;
      case 0xA6u:
        v100 = (double *)functionMin;
        goto LABEL_480;
      case 0xA7u:
        v100 = (double *)functionMax;
        goto LABEL_480;
      case 0xA8u:
      case 0xA9u:
        *(_BYTE *)(*((_QWORD *)v2 - 128) + 200) = 1;
        v100 = (double *)*((_QWORD *)v2 - 128);
        goto LABEL_480;
      case 0xAAu:
      case 0xABu:
        if (g_allowPartialExpressions)
        {
          g_isPartialExpression = 1;
          *(_BYTE *)(*(_QWORD *)v2 + 200) = 1;
          v100 = *(double **)v2;
        }
        else
        {
          v101 = *(double **)v2;
LABEL_476:
          v102 = functionFail;
LABEL_477:
          v112 = 0;
LABEL_478:
          v127 = (double *)newTreeObject((uint64_t)v102, (uint64_t)v101, (uint64_t)v112);
LABEL_479:
          v100 = v127;
        }
        goto LABEL_480;
      default:
        goto LABEL_480;
    }
LABEL_484:
    v7 += 2;
    v1 = v94;
    v3 = v173;
  }
  if (v169 == 3)
  {
    if (yychar <= 0)
    {
      if (!yychar)
      {
        v158 = 1;
        goto LABEL_546;
      }
    }
    else
    {
      if (((_DWORD)v171 - 121) < 0x1B || ((_DWORD)v171 - 150) <= 1)
      {
        v103 = v4;
        v104 = v6;
        v105 = v5;
        v106 = v22;
        freeTree((_QWORD *)yylval);
        LOWORD(v22) = v106;
        v5 = v105;
        v6 = v104;
        v4 = v103;
      }
      yychar = -2;
    }
  }
  else if (!v169)
  {
    ++yynerrs;
  }
  for (i = v22; ; i = v4[v111])
  {
    if (i >= -1)
    {
      v108 = i + 1;
      if (v6[v108] == 1)
      {
        v109 = (__int16)yytable[v108];
        if (v109 > 0)
        {
          v94 = (unsigned __int16)v109;
          if ((unsigned __int16)v109 == 144)
          {
LABEL_559:
            v158 = 0;
            goto LABEL_540;
          }
          v2 += 1024;
          memcpy(v2, &yylval, 0x400uLL);
          v169 = 3;
          goto LABEL_484;
        }
      }
    }
    if (v7 == v8)
      break;
    v110 = yystos[(int)v1];
    if ((v110 - 121) < 0x1B || (v110 - 150) <= 1)
      freeTree(*(_QWORD **)v2);
    v2 -= 1024;
    v111 = *((__int16 *)v7 - 1);
    v7 -= 2;
    LODWORD(v1) = v111;
  }
  v158 = 1;
  v7 = v8;
LABEL_540:
  v159 = yychar == -2 || yychar == 0;
  if (!v159 && (((_DWORD)v171 - 121) < 0x1B || ((_DWORD)v171 - 150) <= 1))
    freeTree((_QWORD *)yylval);
LABEL_546:
  while (v7 != v8)
  {
    v160 = yystos[*(__int16 *)v7];
    if ((v160 - 121) < 0x1B || (v160 - 150) <= 1)
      freeTree(*(_QWORD **)v2);
    v2 -= 1024;
    v7 -= 2;
  }
  if (v8 != (char *)v177)
    free(v8);
  return v158;
}

_QWORD *__calc_yyparse_block_invoke(_QWORD *result)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  for (; result; result = (_QWORD *)result[3])
  {
    v1 = (void (*)(uint64_t, uint64_t))result[1];
    if (v1 == functionConstant)
      break;
    if (v1 == functionCoefficientUnit)
    {
      v2 = result[2];
      if (!v2 || *(void (**)(uint64_t, uint64_t))(v2 + 8) != functionConstant || *(_BYTE *)(v2 + 200))
        return 0;
      return (_QWORD *)result[3];
    }
    if (v1 != functionImplicitAdd)
      return 0;
  }
  return result;
}

uint64_t calc_parser_read_buffer(uint64_t a1, unint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int *a7)
{
  __objc2_class_ro **p_info;
  int v9;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;

  if (a2 >= 0x401)
  {
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS____TtCC9Calculate19CalculateExpression22CustomOperandOperation + 32);
    v9 = 13;
LABEL_9:
    *((_DWORD *)p_info + 298) = v9;
    if (a7)
      *a7 = v9;
    return 0xFFFFFFFFLL;
  }
  v14 = calc_yy_scan_bytes(a1, a2);
  if (!v14)
  {
    p_info = &OBJC_METACLASS____TtCC9Calculate19CalculateExpression22CustomOperandOperation.info;
    v9 = 7;
    goto LABEL_9;
  }
  v15 = v14;
  g_PreferredType = a3;
  g_Precision = a4;
  g_ResultBuffer = a5;
  g_BufferLen = a6;
  g_ErrorCode = 0;
  v16 = calc_yyparse((uint64_t)v14);
  if (a7)
    *a7 = g_ErrorCode;
  if (yy_buffer_stack)
    v17 = *(char **)yy_buffer_stack;
  else
    v17 = 0;
  if (v17 == v15)
    *(_QWORD *)yy_buffer_stack = 0;
  if (*((_DWORD *)v15 + 10))
    free(*((void **)v15 + 1));
  free(v15);
  return v16;
}

size_t cleanUnit()
{
  uint64_t v0;
  size_t result;
  uint64_t v2;

  v0 = calc_yytext;
  result = strlen((const char *)calc_yytext);
  if (result - 1 < 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0;
    do
    {
      *((_BYTE *)&yylval + v2) = *(_BYTE *)(v0 + 1 + v2);
      ++v2;
    }
    while (result - 2 != v2);
  }
  *((_BYTE *)&yylval + v2) = 0;
  return result;
}

size_t cleanCurrency()
{
  size_t result;
  size_t v1;
  char *v2;
  uint64_t *v3;
  size_t v4;
  char v5;

  result = strlen((const char *)calc_yytext);
  if (result - 1 < 3)
  {
    v1 = 0;
  }
  else
  {
    v1 = result - 3;
    v2 = (char *)(calc_yytext + 2);
    v3 = &yylval;
    v4 = result - 3;
    do
    {
      v5 = *v2++;
      *(_BYTE *)v3 = v5;
      v3 = (uint64_t *)((char *)v3 + 1);
      --v4;
    }
    while (v4);
  }
  *((_BYTE *)&yylval + v1) = 0;
  return result;
}

_QWORD *calc_yyensure_buffer_stack()
{
  _QWORD *result;
  _OWORD *v1;
  uint64_t v2;

  result = (_QWORD *)yy_buffer_stack;
  if (!yy_buffer_stack)
  {
    result = malloc_type_malloc(8uLL, 0xFE8DD733uLL);
    yy_buffer_stack = (uint64_t)result;
    if (result)
    {
      *result = 0;
      v2 = 1;
      goto LABEL_7;
    }
LABEL_9:
    yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
  }
  if (yy_buffer_stack_max != 1)
    return result;
  result = malloc_type_realloc((void *)yy_buffer_stack, 0x48uLL, 0xFA553FE1uLL);
  yy_buffer_stack = (uint64_t)result;
  if (!result)
    goto LABEL_9;
  v1 = &result[yy_buffer_stack_max];
  *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v2 = 9;
LABEL_7:
  yy_buffer_stack_max = v2;
  return result;
}

uint64_t calc_yy_create_buffer(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = malloc_type_malloc(0x48uLL, 0xFE8DD733uLL);
  if (!v2
    || (v3 = (uint64_t)v2,
        v2[6] = 0x4000,
        v4 = malloc_type_malloc(0x4002uLL, 0xFE8DD733uLL),
        (*(_QWORD *)(v3 + 8) = v4) == 0))
  {
    yy_fatal_error("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v3 + 40) = 1;
  calc_yy_init_buffer(v3, a1);
  return v3;
}

uint64_t yy_get_previous_state()
{
  uint64_t result;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = yy_start;
  v1 = (_BYTE *)calc_yytext;
  if (calc_yytext < (unint64_t)yy_c_buf_p)
  {
    do
    {
      if (*v1)
        v2 = yy_ec[*v1];
      else
        v2 = 1u;
      if (yy_accept[(int)result])
      {
        yy_last_accepting_state = result;
        yy_last_accepting_cpos = (uint64_t)v1;
      }
      v3 = (int)result;
      v4 = yy_base[(int)result] + v2;
      if ((_DWORD)result != (__int16)yy_chk[v4])
      {
        do
        {
          v3 = yy_def[v3];
          if (v3 >= 532)
            v2 = *((unsigned __int8 *)&yy_meta + v2);
          v4 = yy_base[v3] + v2;
        }
        while (yy_chk[v4] != (unsigned __int16)v3);
      }
      result = yy_nxt[v4];
      ++v1;
    }
    while (v1 != (_BYTE *)yy_c_buf_p);
  }
  return result;
}

void yy_fatal_error(const char *a1)
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s\n", a1);
  exit(2);
}

int *calc_yy_init_buffer(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  int *result;

  v4 = *__error();
  *(_QWORD *)(a1 + 32) = 0;
  **(_BYTE **)(a1 + 8) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 1) = 0;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 64) = 0;
  v5 = (uint64_t *)yy_buffer_stack;
  if (!yy_buffer_stack)
  {
    if (a1)
    {
      v6 = 0;
      *(_QWORD *)a1 = a2;
      *(_DWORD *)(a1 + 60) = 1;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (*(_QWORD *)yy_buffer_stack == a1)
  {
LABEL_6:
    v7 = *(uint64_t **)yy_buffer_stack;
    yy_n_chars = *(_QWORD *)(*(_QWORD *)yy_buffer_stack + 32);
    yy_c_buf_p = v7[2];
    calc_yytext = yy_c_buf_p;
    calc_yyin = *v7;
    yy_hold_char = *(_BYTE *)yy_c_buf_p;
  }
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  v6 = *v5;
LABEL_8:
  if (v6 != a1)
    *(_QWORD *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 44) = 0;
  result = __error();
  *result = v4;
  return result;
}

char *calc_yy_scan_bytes(uint64_t a1, unint64_t a2)
{
  _WORD *v4;
  _WORD *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = malloc_type_malloc(a2 + 2, 0xFE8DD733uLL);
  if (!v4)
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  v5 = v4;
  if (a2)
  {
    v6 = 0;
    do
    {
      *((_BYTE *)v4 + v6) = *(_BYTE *)(a1 + v6);
      ++v6;
    }
    while (a2 != v6);
    *(_WORD *)((char *)v4 + a2) = 0;
    if (a2 > 0xFFFFFFFFFFFFFFFDLL)
LABEL_16:
      yy_fatal_error("bad buffer in yy_scan_bytes()");
  }
  else
  {
    *v4 = 0;
  }
  if (*((_BYTE *)v4 + a2 + 1))
    goto LABEL_16;
  v7 = (char *)malloc_type_malloc(0x48uLL, 0xFE8DD733uLL);
  if (!v7)
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  v8 = v7;
  *((_DWORD *)v7 + 6) = a2;
  *((_QWORD *)v7 + 1) = v5;
  *((_QWORD *)v7 + 2) = v5;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 4) = (int)a2;
  *((_QWORD *)v7 + 5) = 0;
  *((_DWORD *)v7 + 12) = 1;
  *(_QWORD *)(v7 + 60) = 0;
  calc_yyensure_buffer_stack();
  v9 = yy_buffer_stack;
  if (!yy_buffer_stack)
    goto LABEL_14;
  if (*(char **)yy_buffer_stack != v8)
  {
    if (*(_QWORD *)yy_buffer_stack)
    {
      v10 = yy_c_buf_p;
      *(_BYTE *)yy_c_buf_p = yy_hold_char;
      *(_QWORD *)(*(_QWORD *)v9 + 16) = v10;
      *(_QWORD *)(*(_QWORD *)v9 + 32) = yy_n_chars;
    }
LABEL_14:
    *(_QWORD *)v9 = v8;
    yy_n_chars = *((_QWORD *)v8 + 4);
    yy_c_buf_p = *((_QWORD *)v8 + 2);
    calc_yytext = yy_c_buf_p;
    calc_yyin = *(_QWORD *)v8;
    yy_hold_char = *(_BYTE *)yy_c_buf_p;
  }
  *((_DWORD *)v8 + 10) = 1;
  return v8;
}

unint64_t __dpml_bid_exception(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;
  char *v4;
  int v5;
  int v6;

  v1 = *a1;
  v2 = *a1 >> 27;
  *((_BYTE *)a1 + 48) = v2;
  *a1 = v1 & 0xFFFFFFFF07FFFFFFLL;
  a1[3] = 0;
  if ((v1 & 0x8000000000000000) != 0)
    return 0;
  v4 = (char *)&__dpml_response_table + 8 * (v1 & 0xFFFFFFFF07FFFFFFLL);
  v5 = v4[6];
  *((_BYTE *)a1 + 49) = v4[6];
  a1[4] = (unint64_t)&__dpml_bid_globals_table + 32 * v4[7] + 8 * (char)v2;
  if (v5)
  {
    if (v5 < 3)
      v6 = 33;
    else
      v6 = 34;
    *__error() = v6;
    if (((a1[3] >> *((_BYTE *)a1 + 49)) & 1) != 0)
      raise(8);
  }
  return a1[4];
}

double bid_f128_mul(__n128 *a1, uint64_t *a2, uint64_t *a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];
  _QWORD v8[3];
  int8x8_t v9[3];
  int8x8_t v10[3];

  memset(v10, 0, sizeof(v10));
  memset(v9, 0, sizeof(v9));
  memset(v7, 0, sizeof(v7));
  if ((__dpml_bid_unpack2__(a2, a3, (uint64_t)v10, (uint64_t)v9, qword_1B891D7A0, (uint64_t)a1, (uint64_t *)v7) & 0x8000000000000000) == 0)
  {
    memset(v8, 0, sizeof(v8));
    __dpml_bid_multiply__(v10, v9, v8);
    if (LODWORD(v8[0]))
      v5 = 173;
    else
      v5 = 172;
    if (LODWORD(v8[0]))
      v6 = 175;
    else
      v6 = 174;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v8, a1, v5, v6).n128_u64[0];
  }
  return result;
}

double bid_f128_div(__n128 *a1, uint64_t *a2, uint64_t *a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];

  memset(v10, 0, sizeof(v10));
  memset(v9, 0, sizeof(v9));
  memset(v7, 0, sizeof(v7));
  if ((__dpml_bid_unpack2__(a2, a3, (uint64_t)v10, (uint64_t)v9, qword_1B891D7D8, (uint64_t)a1, (uint64_t *)v7) & 0x8000000000000000) == 0)
  {
    memset(v8, 0, sizeof(v8));
    __dpml_bid_divide__((uint64_t)v10, v9, 0, (uint64_t)v8);
    if (LODWORD(v8[0]))
      v5 = 173;
    else
      v5 = 172;
    if (LODWORD(v8[0]))
      v6 = 175;
    else
      v6 = 174;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v8, a1, v5, v6).n128_u64[0];
  }
  return result;
}

double bid_f128_add(__n128 *a1, uint64_t *a2, uint64_t *a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];

  memset(v10, 0, sizeof(v10));
  memset(v9, 0, sizeof(v9));
  memset(v7, 0, sizeof(v7));
  if ((__dpml_bid_unpack2__(a2, a3, (uint64_t)v10, (uint64_t)v9, qword_1B891D830, (uint64_t)a1, (uint64_t *)v7) & 0x8000000000000000) == 0)
  {
    memset(v8, 0, sizeof(v8));
    __dpml_bid_addsub__((uint64_t)v10, v9, 0, (uint64_t)v8);
    if (LODWORD(v8[0]))
      v5 = 173;
    else
      v5 = 172;
    if (LODWORD(v8[0]))
      v6 = 175;
    else
      v6 = 174;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v8, a1, v5, v6).n128_u64[0];
  }
  return result;
}

double bid_f128_sub(__n128 *a1, uint64_t *a2, uint64_t *a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];

  memset(v10, 0, sizeof(v10));
  memset(v9, 0, sizeof(v9));
  memset(v7, 0, sizeof(v7));
  if ((__dpml_bid_unpack2__(a2, a3, (uint64_t)v10, (uint64_t)v9, qword_1B891D868, (uint64_t)a1, (uint64_t *)v7) & 0x8000000000000000) == 0)
  {
    memset(v8, 0, sizeof(v8));
    __dpml_bid_addsub__((uint64_t)v10, v9, 1, (uint64_t)v8);
    if (LODWORD(v8[0]))
      v5 = 173;
    else
      v5 = 172;
    if (LODWORD(v8[0]))
      v6 = 175;
    else
      v6 = 174;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v8, a1, v5, v6).n128_u64[0];
  }
  return result;
}

double bid_f128_itof(__n128 *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  double result;
  unsigned int v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 >= 0)
    v4 = a2;
  else
    v4 = -a2;
  v5 = v4 << 32;
  v6 = 0xFFFF000000000000;
  v7 = 32;
  v8 = 16;
  do
  {
    v9 = v8;
    v10 = (v6 & v5) == 0;
    if ((v6 & v5) != 0)
      v9 = 0;
    v5 <<= v9;
    if (v10)
      v11 = v8;
    else
      v11 = 0;
    v7 -= v11;
    v6 <<= v8 >> 1;
    v12 = v8 > 1;
    v8 >>= 1;
  }
  while (v12);
  v17 = v2;
  v18 = v3;
  v14[0] = 0;
  v14[1] = v7;
  v15 = v5;
  v16 = 0;
  *(_QWORD *)&result = __dpml_bid_pack__(v14, a1, 0, 0).n128_u64[0];
  return result;
}

uint64_t bid_f128_cmp(uint64_t *a1, uint64_t *a2, unsigned int a3)
{
  unsigned __int8 v4;
  uint64_t v6;
  _OWORD v7[2];
  _QWORD v8[3];
  _QWORD v9[3];

  memset(v9, 0, sizeof(v9));
  memset(v8, 0, sizeof(v8));
  memset(v7, 0, sizeof(v7));
  v4 = __dpml_bid_unpack2__(a1, a2, (uint64_t)v9, (uint64_t)v8, qword_1B891D7A0, (uint64_t)&v6, (uint64_t *)v7);
  return (a3 >> __dpml_bid_ux_cmp__(v4 >> 4, v9, v4 & 0xF, (uint64_t)v8)) & 1;
}

uint64_t __dpml_bid_ux_cmp__(uint64_t a1, _DWORD *a2, char a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  char v7;

  result = (cmpTable[a1] >> (3 * a3)) & 7;
  if ((_DWORD)result == 4)
  {
    v5 = (int)a2[1] - (uint64_t)*(int *)(a4 + 4);
    if (!v5)
    {
      result = 0;
      LOBYTE(v5) = 1;
      while (1)
      {
        v7 = v5;
        v5 = *(_QWORD *)&a2[2 * result + 2] - *(_QWORD *)(a4 + 8 * result + 8);
        if (v5)
          break;
        result = 1;
        if ((v7 & 1) == 0)
          return result;
      }
    }
    if (v5 < 0)
      v6 = 2 * (*a2 != 0);
    else
      v6 = 1;
    if (v5 >= 1)
      return 2 * (*a2 == 0);
    else
      return v6;
  }
  return result;
}

double bid_f128_nextafter(__n128 *a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  double result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;
  __int128 v11;
  _QWORD v12[3];

  memset(v12, 0, sizeof(v12));
  v10 = 0;
  v11 = 0uLL;
  memset(v9, 0, sizeof(v9));
  v4 = __dpml_bid_unpack2__(a2, a3, (uint64_t)v12, (uint64_t)&v10, qword_1B891D788, (uint64_t)a1, (uint64_t *)v9);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = __dpml_bid_ux_cmp__(v4 >> 4, v12, v4 & 0xF, (uint64_t)&v10);
    HIDWORD(v10) = HIDWORD(v12[0]);
    if (v6 != 1)
    {
      LODWORD(v10) = (v6 != 0) << 31;
      v11 = xmmword_1B8917CA0;
      __dpml_bid_addsub__((uint64_t)v12, &v10, 0, (uint64_t)v12);
    }
    if (LODWORD(v12[0]))
      v7 = 173;
    else
      v7 = 172;
    if (LODWORD(v12[0]))
      v8 = 175;
    else
      v8 = 174;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v12, a1, v7, v8).n128_u64[0];
  }
  return result;
}

double __dpml_bid_C_ux_erf__(uint64_t *a1, unint64_t a2, __n128 *a3, _QWORD *a4)
{
  uint64_t *v7;
  double result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int32 v12;
  int8x8_t *v13;
  int8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int8x8_t v17;
  __int128 v18;
  int8x8_t v19[3];
  int8x8_t v20[4];

  v20[3] = *(int8x8_t *)MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = 0;
  v16 = 0;
  if ((a2 & 1) != 0)
    v7 = (uint64_t *)&__dpml_bid_erf_x_table;
  else
    v7 = (uint64_t *)&unk_1B891D9A0;
  if ((__dpml_bid_unpack_x_or_y__(a1, 0, (uint64_t)&v14, v7, (uint64_t)a3, a4) & 0x8000000000000000) == 0)
  {
    if (v14.i32[1] > 3)
    {
      if (v14.i32[1] == 4)
      {
        v10 = v15 >> 58 >= 0x23;
        v9 = 1;
      }
      else
      {
        v10 = v14.i32[1] >= 8u;
        v9 = 2;
      }
      if (v10)
        ++v9;
    }
    else
    {
      v9 = v14.i32[1] > 0;
    }
    v11 = v9 | (4 * (v14.i32[0] != 0));
    v14.i32[0] = 0;
    v12 = a2 & 0x80000000;
    switch(v11)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v12 ^= 0x80000000;
        goto LABEL_14;
      case 2:
        if ((a2 & 1) != 0)
          goto LABEL_20;
        __dpml_bid_divide__(0, &v14, 2, (uint64_t)v20);
        __dpml_bid_evaluate_rational__(v20, (uint64_t)&unk_1B891DB48, 10, 0xC00000000000046uLL, (uint64_t)&v17);
        v12 = 0;
        goto LABEL_15;
      case 3:
        if ((a2 & 1) != 0)
          goto LABEL_20;
        v17.i32[1] = -32768;
        v18 = xmmword_1B8917CB0;
        v13 = &v17;
        break;
      case 4:
        v12 ^= 0x80000000;
LABEL_22:
        v13 = &v17;
        __dpml_bid_evaluate_rational__(&v14, (uint64_t)&unk_1B891D9D8, 10, 0x46uLL, (uint64_t)&v17);
        break;
      case 5:
LABEL_14:
        __dpml_bid_evaluate_packed_poly__(&v14, 16, qword_1B891DCB8, 6, v19);
        __dpml_bid_evaluate_packed_poly__(&v14, 17, &qword_1B891DCB8[34], 5, v20);
        __dpml_bid_divide__((uint64_t)v19, v20, 2, (uint64_t)&v17);
LABEL_15:
        v13 = &v17;
        __dpml_bid_extended_multiply__((uint64_t)&v14, (uint64_t)&v14, (uint64_t)v19, (uint64_t)v20);
        v19[0].i32[0] = 0x80000000;
        __dpml_bid_ux_exp_common__((uint64_t)v19, (uint64_t)v19);
        __dpml_bid_multiply__(v20, v19, v20);
        __dpml_bid_addsub__((uint64_t)v19, v20, 9, (uint64_t)v19);
        __dpml_bid_multiply__(v19, &v17, &v17);
        break;
      default:
LABEL_20:
        v13 = (int8x8_t *)&unk_1B891D9C0;
        break;
    }
    v17.i32[0] = v12;
    v19[1] = (int8x8_t)(((a2 >> (2 * v11)) & 3) - 1);
    __dpml_bid_ffs_and_shift__((uint64_t)v19, 1);
    __dpml_bid_addsub__((uint64_t)v13, v19, 8, (uint64_t)&v17);
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)&v17, a3, 140, 0).n128_u64[0];
  }
  return result;
}

uint64_t __dpml_bid_ux_exp_common__(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t result;
  int8x8_t v5[3];

  memset(v5, 0, sizeof(v5));
  v3 = __dpml_bid_ux_exp_reduce__(a1, (uint64_t)v5);
  result = __dpml_bid_evaluate_rational__(v5, (uint64_t)&unk_1B891DF68, 22, 1uLL, a2);
  *(_DWORD *)(a2 + 4) += v3;
  return result;
}

uint64_t __dpml_bid_ux_exp_reduce__(uint64_t a1, uint64_t a2)
{
  int v3;
  __int32 v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int64_t v9;
  int64_t v10;
  int v11;
  char v12;
  int64_t v13;
  __int128 v14;
  _DWORD v16[2];
  int64_t v17;
  unint64_t v18;
  int8x8_t v19[3];

  v4 = *(_DWORD *)a1;
  v3 = *(_DWORD *)(a1 + 4);
  if ((v3 - 18) > 0xFFFFFFEC)
  {
    v7 = *(_QWORD *)(a1 + 8);
    v8 = 61 - v3;
    v9 = ((1 << (60 - v3))
        + 1549082004 * (v7 >> 33)
        + ((1549082004 * (unint64_t)(v7 >> 1)) >> 32)
        + ((((2920020062u * (unint64_t)(v7 >> 1)) >> 32)
          + 2920020062u * (v7 >> 33)
          + ((1549082004 * (v7 >> 1)) & 0xFFFFFFFCLL)) >> 32)) & (-1 << (61 - v3));
    if (v9 >= 1)
    {
      do
      {
        v9 *= 2;
        ++v8;
      }
      while (v9 > 0);
    }
    v10 = ((2977044471u * (unint64_t)v9) >> 32)
        + 2977044471 * HIDWORD(v9)
        + ((((3520035244u * (unint64_t)v9) >> 32)
          + 3520035244 * HIDWORD(v9)
          + (-1317922825 * v9)) >> 32);
    v11 = 63 - v8;
    v12 = v10 > 0;
    *((_QWORD *)&v14 + 1) = v10;
    *(_QWORD *)&v14 = 0xB17217F7D1CF79ACLL * v9;
    v13 = v14 >> 63;
    if (v10 <= 0)
      v11 = 64 - v8;
    v16[0] = *(_DWORD *)a1;
    v16[1] = v11;
    if (v10 > 0)
      v10 = v13;
    v17 = v10;
    v18 = (0xB17217F7D1CF79ACLL * v9) << v12;
    __dpml_bid_addsub__(a1, v16, 1, (uint64_t)v16);
    v19[0].i32[0] = v4;
    v19[0].i32[1] = 64 - v8;
    v19[1] = (int8x8_t)v9;
    v19[2] = 0;
    __dpml_bid_multiply__(v19, qword_1B891DF48, (_QWORD *)a2);
    __dpml_bid_addsub__((uint64_t)v16, (_DWORD *)a2, 9, a2);
    v6 = (unint64_t)v9 >> v8;
    v5 = v4 == 0;
  }
  else
  {
    *(_DWORD *)a2 = v4;
    *(_DWORD *)(a2 + 4) = v3;
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
    if (v3 < 1)
      return 0;
    *(_DWORD *)(a2 + 4) = -128;
    v5 = v4 == 0;
    v6 = 0x8000;
  }
  if (v5)
    return v6;
  else
    return -v6;
}

double bid_f128_exp(__n128 *a1, uint64_t *a2)
{
  double result;
  _QWORD v4[4];
  _QWORD v5[3];
  _QWORD v6[3];

  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if ((__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)v6, (uint64_t *)&__dpml_bid_exp_x_table, (uint64_t)a1, v4) & 0x8000000000000000) == 0)
  {
    __dpml_bid_ux_exp_common__((uint64_t)v6, (uint64_t)v5);
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v5, a1, 34, 33).n128_u64[0];
  }
  return result;
}

void __dpml_bid_C_ux_hyperbolic__(__n128 *a1, uint64_t *a2, uint64_t *a3, unint64_t a4, uint64_t a5, _QWORD *a6)
{
  unsigned int v11;
  int v12;
  unint64_t v13;
  unsigned int v14;
  _QWORD v15[3];
  int8x8_t v16[3];
  unsigned int v17[6];
  _QWORD v18[3];
  _BYTE v19[4];
  int v20;
  int v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, sizeof(v15));
  if ((__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)v15, a3, (uint64_t)a1, a6) & 0x8000000000000000) != 0)
  {
    if ((a4 & 0x8000) != 0)
      __dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)v15, &qword_1B891DF08, (uint64_t)&a1[1], a6);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v11 = v15[0];
    LODWORD(v15[0]) = 0;
    v12 = __dpml_bid_ux_exp_reduce__((uint64_t)v15, (uint64_t)v16);
    if (v12)
      v13 = 326;
    else
      v13 = a4 & 0x7FF;
    __dpml_bid_evaluate_rational__(v16, (uint64_t)&unk_1B891E2A8, 11, v13, (uint64_t)v17);
    if (v12)
    {
      __dpml_bid_addsub__((uint64_t)v18, v17, 10, (uint64_t)v19);
      v20 = v12 + v20 - 1;
      v22 += ~v12;
      __dpml_bid_addsub__((uint64_t)v19, &v21, (a4 >> 11) & 3 | 0xC, (uint64_t)v17);
      if ((a4 & 0x10000) != 0)
        __dpml_bid_divide__((uint64_t)v17, v18, 2, (uint64_t)v17);
    }
    if ((a4 & 0x4000) != 0)
      v14 = 0;
    else
      v14 = v11;
    v17[0] = v14;
    __dpml_bid_pack__(v17, a1, 0, a5);
    if ((a4 & 0x8000) != 0)
      __dpml_bid_pack__((unsigned int *)v18, a1 + 1, 0, 19);
  }
}

double bid_f128_asinh(__n128 *a1, uint64_t *a2)
{
  double result;
  __int32 v4;
  _QWORD v5[4];
  int8x8_t v6[3];
  int8x8_t v7[3];
  int8x8_t v8;
  unint64_t v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  memset(v7, 0, sizeof(v7));
  memset(v6, 0, sizeof(v6));
  if ((uint64_t)__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)&v8, &__dpml_bid_inv_hyper_x_table, (uint64_t)a1, v5) >= 1)
  {
    v4 = v8.i32[0];
    v8.i32[0] = 0;
    __dpml_bid_multiply__(&v8, &v8, v6);
    __dpml_bid_addsub__((uint64_t)v6, dword_1B891E480, 0, (uint64_t)v6);
    __dpml_bid_ffs_and_shift__((uint64_t)v6, 0);
    __dpml_bid_ux_sqrt_evaluation__(v6, v6);
    if (v8.i32[1] < -1 || v8.i32[1] == -1 && v9 <= 0xB504F333F9DE6484)
    {
      __dpml_bid_addsub__((uint64_t)v6, dword_1B891E480, 0, (uint64_t)v6);
      __dpml_bid_divide__((uint64_t)&v8, v6, 2, (uint64_t)v6);
      __dpml_bid_evaluate_rational__(v6, (uint64_t)&unk_1B891EE08, 17, 6uLL, (uint64_t)v7);
      __dpml_bid_multiply__(v7, qword_1B891EF60, v7);
    }
    else
    {
      __dpml_bid_addsub__((uint64_t)v6, &v8, 0, (uint64_t)v6);
      __dpml_bid_ffs_and_shift__((uint64_t)v6, 0);
      __dpml_bid_ux_log__((uint64_t)v6, qword_1B891E498, v7);
    }
    v7[0].i32[0] = v4;
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v7, a1, 0, 0).n128_u64[0];
  }
  return result;
}

double __dpml_bid_ux_asin_acos__(uint64_t *a1, unint64_t a2, uint64_t *a3, __n128 *a4, _QWORD *a5)
{
  double result;
  char v8;
  int v9;
  unint64_t v10;
  int8x8_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((__dpml_bid_unpack_x_or_y__(a1, 0, (uint64_t)&v11, a3, (uint64_t)a4, a5) & 0x8000000000000000) == 0)
  {
    if (v11.i32[0])
      v8 = 12;
    else
      v8 = 0;
    v11.i32[0] = 0;
    if ((v11.i32[1] & 0x80000000) == 0)
    {
      v8 += 6;
      if (v11.i32[1] == 1)
      {
        if (v12 == 0x8000000000000000 && !v13)
        {
          v9 = 0;
          v11.i32[1] = -131072;
          v12 = 0;
          v13 = 0;
          goto LABEL_13;
        }
      }
      else if (!v11.i32[1])
      {
        __dpml_bid_addsub__((uint64_t)&unk_1B891E668, &v11, 5, (uint64_t)&v11);
        --v11.i32[1];
        __dpml_bid_ux_sqrt_evaluation__(&v11, &v11);
        v9 = 1;
LABEL_13:
        __dpml_bid_evaluate_rational__(&v11, (uint64_t)&unk_1B891E840, 11, 0x4000000000000CEuLL, (uint64_t)&v14);
        v10 = a2 >> v8;
        LODWORD(v14) = ((_DWORD)v10 << 28) & 0x80000000;
        HIDWORD(v14) += v9;
        __dpml_bid_addsub__((uint64_t)&__dpml_bid_inv_trig_x_table + (v10 & 0xF0) + 320, &v14, 8, (uint64_t)&v14);
        LODWORD(v14) = ((_DWORD)v10 << 29) & 0x80000000;
LABEL_15:
        *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)&v14, a4, 0, 3).n128_u64[0];
        return result;
      }
      v14 = 0x800000000000;
      v15 = xmmword_1B8917CB0;
      goto LABEL_15;
    }
    v9 = 0;
    goto LABEL_13;
  }
  return result;
}

double bid_f128_lgamma(__n128 *a1, uint64_t *a2)
{
  double result;
  int v4;
  __int32 v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int8x8_t *v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  int8x8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int32 v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int8x8_t *v35;
  _BOOL8 v36;
  unint64_t v37;
  BOOL v38;
  _OWORD v39[2];
  int8x8_t v40;
  unint64_t v41;
  uint64_t v42;
  int8x8_t v43;
  uint64_t v44;
  unint64_t v45;
  int8x8_t v46[3];
  int8x8_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  __int128 v51;
  int8x8_t v52[3];
  int8x8_t v53[4];

  v53[3] = *(int8x8_t *)MEMORY[0x1E0C80C00];
  memset(v39, 0, sizeof(v39));
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  if ((__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)&v43, __dpml_bid_lgamma_x_table, (uint64_t)a1, v39) & 0x8000000000000000) == 0)
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    memset(v46, 0, sizeof(v46));
    v4 = v43.i32[1];
    v5 = v43.i32[1] + 1;
    v43.i32[1] = v5;
    v51 = 0uLL;
    v6 = 127 - v4;
    v7 = v45;
    if (v5 <= 64)
    {
      v13 = 0;
      v8 = 0;
      v14 = 1;
      while (1)
      {
        v12 = (uint64_t *)((char *)&v44 + v13 * 8);
        v15 = (int8x8_t *)((char *)&v50 + v13 * 8);
        v52[v13 - 1] = 0;
        v8 = v7 | (v8 != 0);
        v6 -= 64;
        if ((v14 & 1) == 0)
          break;
        v14 = 0;
        v7 = *v12;
        --v13;
        if (v6 + 64 < 128)
        {
          v12 = (uint64_t *)((char *)&v44 + v13 * 8);
          v9 = &v52[v13 - 1];
          v10 = 1;
          v11 = 1;
          goto LABEL_11;
        }
      }
      v10 = 0;
      v11 = 0;
      v7 = 0;
      v9 = v15 + 1;
      if (v6)
        v8 = v8 != 0;
      v6 = 0;
    }
    else
    {
      v8 = 0;
      v9 = (int8x8_t *)&v51 + 1;
      v10 = 1;
      v11 = 2;
      v12 = &v44;
    }
LABEL_11:
    v16 = v6 & ~(v6 >> 63);
    v17 = 2 * v7;
    if (1 << v16 == 1)
    {
      v18 = v17 & 2 | (v8 >> 63);
      v19 = 2 * v8;
      v21 = v7;
    }
    else
    {
      v18 = (v7 >> (v16 - 1)) & 3;
      v19 = v17 & ((1 << v16) - 1) | v8;
      if (v5 < 65)
        v20 = 0;
      else
        v20 = *v12;
      v21 = (v20 << -(char)v16) | (v7 >> v16);
    }
    v22 = v43.i32[0];
    v23 = (0x2A8A8uLL >> ((v18 | (4 * (v19 != 0))) | ((unsigned __int32)v43.i32[0] >> 28) & 8)) & 1;
    if (v10)
    {
      if (v23)
        v24 = 1 << v16;
      else
        v24 = 0;
      v25 = v7 & -(1 << v16);
      v26 = v11 + 1;
      do
      {
        v27 = v24;
        v28 = v24 + v25;
        v24 = __CFADD__(v24, v25);
        *v9-- = (int8x8_t)v28;
        v29 = *v12--;
        v25 = v29;
        --v26;
      }
      while (v26 > 1);
      if (v28 >= v27)
      {
LABEL_30:
        v50 = __PAIR64__(v5, v22);
        __dpml_bid_addsub__((uint64_t)&v43, &v50, 1, (uint64_t)&v47);
        v30 = v23 + v21;
        v43.i32[1] = v4;
        if (v22)
          v31 = -v30;
        else
          v31 = v30;
        if (!v22 || v30 & 1 | v48)
        {
          if (v4 > 4)
          {
            v43.i32[0] = 0;
            __dpml_bid_ux_log__((uint64_t)&v43, qword_1B891EA38, &v40);
            if (v22)
              v35 = &qword_1B891EA38[9];
            else
              v35 = &qword_1B891EA38[6];
            __dpml_bid_addsub__((uint64_t)&v43, dword_1B891EA08, v22 == 0, (uint64_t)&v50);
            __dpml_bid_multiply__(&v40, (int8x8_t *)&v50, &v40);
            __dpml_bid_addsub__((uint64_t)&v40, &v43, 1, (uint64_t)&v40);
            __dpml_bid_addsub__((uint64_t)&v40, v35, 0, (uint64_t)&v40);
            __dpml_bid_divide__(0, &v43, 2, (uint64_t)&v50);
            __dpml_bid_evaluate_rational__((int8x8_t *)&v50, (uint64_t)&unk_1B891EC88, 7, 0xC00000000000046uLL, (uint64_t)v52);
            __dpml_bid_addsub__((uint64_t)&v40, v52, 0, (uint64_t)&v40);
            if (!v22)
              goto LABEL_56;
            v40.i32[0] ^= v22;
            __dpml_bid_multiply__(&v47, &qword_1B891EA38[3], &v50);
            __dpml_bid_ux_sincos((uint64_t)&v50, 2 * v30, 1, &v50);
            __dpml_bid_ffs_and_shift__((uint64_t)&v50, 0);
            __dpml_bid_ux_log__((uint64_t)&v50, qword_1B891EA38, (int8x8_t *)&v50);
            v36 = 1;
          }
          else
          {
            v32 = v31 + (v47.i32[0] >> 31);
            v50 = 0x100000000;
            v51 = xmmword_1B8917CB0;
            if (v32 > 1)
            {
              if ((unint64_t)v32 < 4)
              {
                v33 = v31 + (v47.i32[0] >> 31);
              }
              else
              {
                v37 = v31 + (v47.i32[0] >> 31);
                do
                {
                  __dpml_bid_addsub__((uint64_t)&v43, dword_1B891E9F0, 1, (uint64_t)&v43);
                  __dpml_bid_multiply__((int8x8_t *)&v50, &v43, &v50);
                  v33 = v37 - 2;
                  v38 = v37 > 5;
                  v37 -= 2;
                }
                while (v38);
              }
            }
            else
            {
              v33 = v31 + (v47.i32[0] >> 31);
              do
              {
                v34 = v33;
                __dpml_bid_multiply__((int8x8_t *)&v50, &v43, &v50);
                __dpml_bid_addsub__((uint64_t)&v43, dword_1B891E9F0, 0, (uint64_t)&v43);
                v33 += 2;
              }
              while (v34 < 0);
            }
            ++v43.i32[1];
            __dpml_bid_addsub__((uint64_t)&v43, &dword_1B891EA08[6], 1, (uint64_t)v46);
            __dpml_bid_addsub__((uint64_t)v46, dword_1B891E9F0, 2, (uint64_t)v52);
            __dpml_bid_multiply__(v52, v53, &v40);
            if (v41)
            {
              __dpml_bid_evaluate_rational__(v46, (uint64_t)&unk_1B891EA98, 14, 0x11uLL, (uint64_t)v52);
              __dpml_bid_multiply__(&v40, v52, &v40);
            }
            if (v32 == v33)
              goto LABEL_56;
            LODWORD(v50) = 0;
            __dpml_bid_ffs_and_shift__((uint64_t)&v50, 0);
            __dpml_bid_ux_log__((uint64_t)&v50, qword_1B891EA38, (int8x8_t *)&v50);
            v36 = v32 < v33;
          }
          __dpml_bid_addsub__((uint64_t)&v40, &v50, v36, (uint64_t)&v40);
        }
        else
        {
          v40.i32[1] = -32768;
          v41 = 0x8000000000000000;
        }
LABEL_56:
        *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)&v40, a1, 138, 135).n128_u64[0];
        return result;
      }
    }
    else if (!v23)
    {
      goto LABEL_30;
    }
    v5 = (v5 & ~(v5 >> 31)) + 1;
    v9[1] = (int8x8_t)0x8000000000000000;
    goto LABEL_30;
  }
  return result;
}

uint64_t __dpml_bid_ux_log__(uint64_t a1, int8x8_t *a2, int8x8_t *a3)
{
  int8x8_t v6;
  uint64_t result;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v6 = (int8x8_t)((__PAIR128__(*(int *)(a1 + 4), *(_QWORD *)(a1 + 8)) - 0xB504F333F9DE6485) >> 64);
  *(_DWORD *)(a1 + 4) = *(_QWORD *)(a1 + 8) < 0xB504F333F9DE6485;
  __dpml_bid_addsub__(a1, dword_1B891EF30, 6, (uint64_t)v8);
  *(_DWORD *)(a1 + 4) += v6.i32[0];
  __dpml_bid_divide__((uint64_t)v9, v8, 2, (uint64_t)a3);
  __dpml_bid_evaluate_rational__(a3, (uint64_t)&unk_1B891EE08, 17, 6uLL, (uint64_t)v8);
  a3[1] = v6;
  __dpml_bid_ffs_and_shift__((uint64_t)a3, 1);
  result = __dpml_bid_addsub__((uint64_t)a3, v8, 8, (uint64_t)a3);
  if (a2)
    return __dpml_bid_multiply__(a3, a2, a3);
  return result;
}

double bid_f128_log(__n128 *a1, uint64_t *a2)
{
  double result;
  _QWORD v4[4];
  int8x8_t v5[3];
  _QWORD v6[3];

  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if ((__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)v6, __dpml_bid_log_x_table, (uint64_t)a1, v4) & 0x8000000000000000) == 0)
  {
    __dpml_bid_ux_log__((uint64_t)v6, qword_1B891EF60, v5);
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v5, a1, 0, 0).n128_u64[0];
  }
  return result;
}

uint64_t __dpml_bid_ffs_and_shift__(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *(_QWORD *)(a1 + 8);
  if (a2)
  {
    if (v2 >= 0)
      v3 = *(_QWORD *)(a1 + 8);
    else
      v3 = -v2;
    *(_QWORD *)(a1 + 8) = v3;
    *(_QWORD *)(a1 + 16) = 0;
    *(_DWORD *)a1 = HIDWORD(v2) & 0x80000000;
    if (v2)
    {
      v4 = 0;
      v5 = 64;
      goto LABEL_7;
    }
LABEL_22:
    *(_QWORD *)a1 = 0xFFFE000000000000;
    return 128;
  }
  if (v2 < 0)
    return 0;
  v5 = *(_DWORD *)(a1 + 4);
  v3 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v4 = 0;
    goto LABEL_12;
  }
  if (!v3)
    goto LABEL_22;
  v4 = 64;
LABEL_7:
  v6 = 0;
  v2 = v3;
  v3 = 0;
  if ((v2 & 0x8000000000000000) == 0)
  {
LABEL_12:
    v7 = ((unint64_t)v2 >> 58) & 0x1E;
    if (v7)
    {
      v8 = ((0x55ACu >> v7) & 3) + 1;
    }
    else
    {
      v9 = v2 & 0xFFFFFFFFFFFFFF00;
      if ((v2 & 0xFFFFFFFFFFFFFF00) == 0)
        v9 = v2;
      v8 = 1086 - (COERCE__INT64((double)v9) >> 52);
    }
    v2 = (v3 >> -(char)v8) | (v2 << v8);
    v6 = v3 << v8;
    v4 += v8;
  }
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v6;
  *(_DWORD *)(a1 + 4) = v5 - v4;
  return v4;
}

uint64_t __dpml_bid_addsub__(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _DWORD *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _DWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  BOOL v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  unsigned int v45;
  int v46;
  unint64_t v47;
  int v48;
  int v49;

  v4 = a4;
  v5 = (_DWORD *)result;
  v6 = *(_DWORD *)result;
  v7 = *(_DWORD *)(result + 4);
  v8 = a2[1];
  v9 = (*a2 ^ *(_DWORD *)result);
  if ((a3 & 4) != 0)
  {
    v6 = 0;
    v9 = 0;
  }
  v10 = v9 ^ (a3 << 31);
  v11 = v7 - v8;
  if (v7 - v8 < 0)
  {
    v11 = -v11;
    v6 ^= v10 & 0x80000000;
    v12 = 0x80000000;
    v13 = (_DWORD *)result;
    v5 = a2;
    v7 = a2[1];
  }
  else
  {
    v12 = 0;
    v13 = a2;
  }
  v14 = *((_QWORD *)v13 + 1);
  if (v11 >= 64)
  {
    v16 = 127;
    if (v11 < 127)
      v16 = v11;
    v17 = v11 - v16 + 63;
    v18 = v11 - (v17 & 0xC0) - 64;
    v19 = v11 + 64;
    while (v17 < 0x40)
    {
      v15 = v14;
      v14 = 0;
      v19 -= 64;
      if (v19 < 128)
      {
        LOBYTE(v11) = v18;
        goto LABEL_14;
      }
    }
    v48 = v5[1];
    *(_QWORD *)(a4 + 8) = *((_QWORD *)v5 + 1);
    *(_QWORD *)(a4 + 16) = *((_QWORD *)v5 + 2);
    *(_DWORD *)a4 = v6;
    *(_DWORD *)(a4 + 4) = v48;
    if ((a3 & 2) != 0)
    {
      v49 = v5[1];
      *(_QWORD *)(a4 + 32) = *((_QWORD *)v5 + 1);
      *(_QWORD *)(a4 + 40) = *((_QWORD *)v5 + 2);
      *(_DWORD *)(a4 + 24) = v6 ^ v12;
      *(_DWORD *)(a4 + 28) = v49;
    }
  }
  else
  {
    v15 = *((_QWORD *)v13 + 2);
LABEL_14:
    v20 = (v10 >> 31) & 1;
    v21 = v14 >> v11;
    v22 = ((2 * v14) << ~(_BYTE)v11) | (v15 >> v11);
    while (1)
    {
      v24 = *((_QWORD *)v5 + 1);
      v23 = *((_QWORD *)v5 + 2);
      v25 = a3 - 8;
      v26 = v23 - v22;
      if (v23 >= v22)
        v27 = v21;
      else
        v27 = v21 + 1;
      v28 = v24 - v27;
      if (v23 == v22)
        v29 = 0;
      else
        v29 = -1;
      v30 = v29 - v28;
      v31 = __PAIR128__(v27, v23) >= v22 && v24 >= v27;
      if (v31)
        v32 = v12;
      else
        v32 = 0x80000000;
      if (v31)
        v33 = v6;
      else
        v33 = v6 ^ 0x80000000;
      if (!v31)
      {
        v28 = v30;
        v26 = v22 - v23;
      }
      v34 = a3 & 0xF;
      v35 = __CFADD__(v23, v22);
      v36 = v23 + v22;
      v37 = v35;
      if (v35)
        v38 = v21 + 1;
      else
        v38 = v21;
      v39 = v21 + v35 + v24;
      v31 = v38 >= v37;
      *((_QWORD *)&v40 + 1) = v39;
      *(_QWORD *)&v40 = v36;
      result = v40 >> 1;
      v41 = v31 && v39 >= v24;
      v42 = (v39 >> 1) | 0x8000000000000000;
      if (v41)
        v43 = v7;
      else
        v43 = v7 + 1;
      if (v41)
        v42 = v39;
      else
        v36 = result;
      if (v20)
        v44 = v25;
      else
        v44 = v34;
      if (v20)
      {
        v12 = v32;
        v45 = v33;
      }
      else
      {
        v45 = v6;
      }
      if (v20)
        v46 = v7;
      else
        v46 = v43;
      if (v20)
        v47 = v28;
      else
        v47 = v42;
      if (v20)
        v36 = v26;
      *(_QWORD *)(v4 + 8) = v47;
      *(_QWORD *)(v4 + 16) = v36;
      *(_DWORD *)v4 = v45;
      *(_DWORD *)(v4 + 4) = v46;
      if ((v44 & 0x10) != 0)
        result = __dpml_bid_ffs_and_shift__(v4, 0);
      if ((v44 & 2) == 0)
        break;
      v20 = 1 - v20;
      a3 = v44 ^ 2;
      v4 += 24;
      v6 = v45 ^ v12;
      v7 = v5[1];
    }
  }
  return result;
}

unint64_t __dpml_bid_unpack_x_or_y__(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t a5, _QWORD *a6)
{
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v11 = a2 != 0;
  if (a2)
    v12 = a2;
  else
    v12 = a1;
  a6[(a2 != 0) + 2] = v12;
  v13 = v12[1];
  v14 = HIWORD(v13) & 0x7FFF;
  *(_DWORD *)a3 = HIDWORD(v13) & 0x80000000;
  *(_DWORD *)(a3 + 4) = v14 - 16382;
  v15 = *v12;
  *((_QWORD *)&v17 + 1) = v13;
  *(_QWORD *)&v17 = *v12;
  v16 = v17 >> 49;
  *(_QWORD *)(a3 + 8) = v16 | 0x8000000000000000;
  *(_QWORD *)(a3 + 16) = v15 << 15;
  v18 = v13 >> 63;
  if ((((v13 + 0x1000000000000) ^ (v13 - 0x1000000000000)) & 0x8000000000000000) != 0)
  {
    v20 = v15 | (v13 << 16);
    if ((((v13 - 0x1000000000000) ^ v13) & 0x8000000000000000) != 0)
    {
      if (v20)
      {
        *(_QWORD *)(a3 + 8) = v16 & 0x7FFFFFFFFFFFFFFFLL;
        *(_DWORD *)(a3 + 4) = v14 - 16381;
        __dpml_bid_ffs_and_shift__(a3, 0);
        v19 = 6;
      }
      else
      {
        v19 = 8;
      }
    }
    else
    {
      v21 = (v13 >> 47) & 1;
      if (v20)
      {
        v18 = v21;
        v19 = 0;
      }
      else
      {
        v19 = 2;
      }
    }
  }
  else
  {
    v19 = 4;
  }
  v22 = v19 | v18;
  *a6 = (1 << v22);
  v23 = ((unint64_t)(*a4 >> (6 * v22)) >> 3) & 7;
  if (v23)
  {
    v24 = (*a4 >> (6 * v22)) & 7;
    if (v24 <= v11)
    {
      if (v24)
        v26 = a2;
      else
        v26 = a1;
    }
    else
    {
      v25 = a4[((unint64_t)*a4 >> 60) - 1 + v24];
      v26 = (uint64_t *)((char *)&__dpml_bid_x_constants__ + 16 * v25);
      v24 = v25 & 0xFFFFFFFF87FFFFFFLL;
    }
    if (v23 == 7)
    {
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
      v29 = v24 | 0x10000000;
      *(_OWORD *)a5 = *(_OWORD *)__dpml_bid_exception((unint64_t *)&v29);
    }
    else
    {
      v27 = v26[1];
      switch(v23)
      {
        case 1uLL:
          v27 |= 0x800000000000uLL;
          break;
        case 3uLL:
          v27 ^= 0x8000000000000000;
          break;
        case 4uLL:
          v27 &= ~0x8000000000000000;
          break;
        case 5uLL:
          v27 = a1[1] & 0x8000000000000000 | v27 & 0x7FFFFFFFFFFFFFFFLL;
          break;
        default:
          break;
      }
      *(_QWORD *)(a5 + 8) = v27;
      *(_QWORD *)a5 = *v26;
    }
    return v22 | 0x8000000000000000;
  }
  return v22;
}

uint64_t __dpml_bid_unpack2__(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v13 = __dpml_bid_unpack_x_or_y__(a1, 0, a3, a5, a6, a7);
  v14 = v13;
  if (a2 && (v13 & 0x8000000000000000) == 0)
  {
    v15 = *a7;
    v16 = __dpml_bid_unpack_x_or_y__(a1, a2, a4, (uint64_t *)((char *)a5 + ((a5[1] >> (4 * v13 - 3)) & 0x78)), a6, a7);
    *a7 |= v15;
    return v16 | (16 * v14);
  }
  return v14;
}

__n128 __dpml_bid_pack__(unsigned int *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BOOL8 v14;
  BOOL v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __n128 *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _DWORD v28[2];
  __int128 v29;

  __dpml_bid_ffs_and_shift__((uint64_t)a1, 0);
  v9 = a1[1];
  if (v9 == -131072)
  {
    v10 = (unint64_t)*a1 << 32;
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = v10;
  }
  else
  {
    v27 = 0;
    result.n128_u64[0] = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    if (v9 <= -16382)
    {
      v29 = xmmword_1B8917CB0;
      v28[0] = *a1;
      v28[1] = -16381;
      __dpml_bid_addsub__((uint64_t)v28, a1, 0, (uint64_t)a1);
      if (v9 < 0xFFFFBF92)
        v9 = -16383;
      else
        v9 = -16382;
    }
    v12 = *((_QWORD *)a1 + 1);
    v11 = *((_QWORD *)a1 + 2);
    v13 = v11 + 0x4000;
    v14 = v11 > 0xFFFFFFFFFFFFBFFFLL;
    v15 = __CFADD__(v12, v14);
    *((_QWORD *)&v16 + 1) = v12 + v14;
    *(_QWORD *)&v16 = v13;
    a2->n128_u64[0] = v16 >> 15;
    v17 = (unint64_t)(v12 + v14) >> 15;
    if (v15)
      v18 = v9 + 1;
    else
      v18 = v9;
    if (v15)
      v17 = 0x1000000000000;
    a2->n128_u64[1] = (v17 + ((unint64_t)(v15 + v9 + 16381) << 48)) | ((unint64_t)*a1 << 32);
    if (v15 + v9 + 16382 >= 0x7FFF)
    {
      if (v18 >= 0)
        v19 = a4;
      else
        v19 = a3;
      v21 = v19 & 0xFFFFFFFF87FFFFFFLL | 0x10000000;
      v20 = (__n128 *)__dpml_bid_exception(&v21);
      result = *v20;
      *a2 = *v20;
    }
  }
  return result;
}

uint64_t __dpml_bid_evaluate_packed_poly__(int8x8_t *a1, uint64_t a2, uint64_t *a3, int a4, int8x8_t *a5)
{
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t result;
  _QWORD v14[3];

  v14[0] = 0;
  a5[1] = (int8x8_t)a3[1];
  v8 = *a3;
  a5[2] = (int8x8_t)(*a3 & 0xFFFFFFFFFFFFFFF8);
  a5->i32[0] = (_DWORD)v8 << 31;
  a5->i32[1] = ((v8 >> 1) & 7) - a4;
  v9 = a2 + 1;
  v10 = a3 + 3;
  do
  {
    __dpml_bid_multiply__(a1, a5, a5);
    __dpml_bid_ffs_and_shift__((uint64_t)a5, 0);
    v11 = *(v10 - 1);
    v14[1] = *v10;
    v14[2] = v11 & 0xFFFFFFFFFFFFFFF8;
    v12 = ((v11 >> 1) & 7) - a4;
    result = __dpml_bid_addsub__((uint64_t)a5, v14, v11 & 1, (uint64_t)a5);
    a5->i32[1] += v12;
    --v9;
    v10 += 2;
  }
  while (v9 > 1);
  return result;
}

uint64_t __dpml_bid_multiply__(int8x8_t *a1, int8x8_t *a2, _QWORD *a3)
{
  int8x8_t v3;
  int8x8_t v4;
  int8x8_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a2[1];
  v6 = a2[2];
  v7 = ((v4.u32[1] * (unint64_t)v5.u32[0]) >> 32)
     + v4.u32[1] * (unint64_t)v5.u32[1]
     + ((((v4.u32[0] * (unint64_t)v5.u32[0]) >> 32)
       + v4.u32[0] * (unint64_t)v5.u32[1]
       + (v4.i32[1] * v5.i32[0])) >> 32);
  LODWORD(v8) = veor_s8(*a2, *a1).u32[0];
  HIDWORD(v8) = vadd_s32(*(int32x2_t *)a2, *(int32x2_t *)a1).i32[1];
  *a3 = v8;
  result = HIDWORD(*(_QWORD *)&v3);
  v10 = ((v6.u32[0] * (unint64_t)v3.u32[1]) >> 32)
      + v6.u32[1] * (unint64_t)v3.u32[1]
      + ((((v6.u32[0] * (unint64_t)v3.u32[0]) >> 32)
        + v6.u32[1] * (unint64_t)v3.u32[0]
        + (v6.i32[0] * v3.i32[1])) >> 32);
  v11 = __CFADD__(v7, *(_QWORD *)&v5 * *(_QWORD *)&v3);
  v12 = v7 + *(_QWORD *)&v5 * *(_QWORD *)&v3;
  v13 = v11;
  a3[1] = (__PAIR128__(((v5.u32[0] * (unint64_t)v3.u32[1]) >> 32)+ v5.u32[1] * (unint64_t)v3.u32[1]+ ((((v5.u32[0] * (unint64_t)v3.u32[0]) >> 32)+ v5.u32[1] * (unint64_t)v3.u32[0]+ (v5.i32[0] * v3.i32[1])) >> 32), v12)+ __PAIR128__(v13, v10)) >> 64;
  a3[2] = v12 + v10;
  return result;
}

unint64_t __dpml_bid_extended_multiply__(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int128 v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t result;
  unint64_t v19;
  unint64_t v20;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_DWORD *)a2 ^ *(_DWORD *)a1;
  v9 = *(_DWORD *)(a2 + 4) + *(_DWORD *)(a1 + 4);
  *(_DWORD *)a3 = v8;
  *(_DWORD *)(a3 + 4) = v9;
  *(_DWORD *)a4 = v8;
  *(_DWORD *)(a4 + 4) = v9 - 128;
  v10 = v4 * v7
      + HIDWORD(v7) * (unint64_t)HIDWORD(v5)
      + ((v7 * (unint64_t)HIDWORD(v5)) >> 32)
      + ((((v7 * (unint64_t)v5) >> 32)
        + HIDWORD(v7) * (unint64_t)v5
        + (v7 * HIDWORD(v5))) >> 32);
  v11 = v6 * v4;
  v12 = v6 * v5;
  *(_QWORD *)(a4 + 8) = v10 + v6 * v5;
  *(_QWORD *)(a4 + 16) = v7 * v5;
  v13 = ((v6 * (unint64_t)HIDWORD(v5)) >> 32)
      + HIDWORD(v6) * (unint64_t)HIDWORD(v5)
      + ((((v6 * (unint64_t)v5) >> 32)
        + HIDWORD(v6) * (unint64_t)v5
        + (v6 * HIDWORD(v5))) >> 32);
  v14 = __PAIR128__(v6 * v4, v10) + __PAIR128__(v10 < v4 * v7, v12);
  v15 = __CFADD__((__PAIR128__(v6 * v4, v10) + __PAIR128__(v10 < v4 * v7, v12)) >> 64, v13);
  v16 = ((__PAIR128__(v6 * v4, v10) + __PAIR128__(v10 < v4 * v7, v12)) >> 64) + v13;
  v17 = v15;
  result = HIDWORD(v4);
  v19 = ((HIDWORD(v4) * (unint64_t)v7) >> 32)
      + HIDWORD(v4) * (unint64_t)HIDWORD(v7)
      + ((((v4 * (unint64_t)v7) >> 32)
        + v4 * (unint64_t)HIDWORD(v7)
        + (HIDWORD(v4) * v7)) >> 32);
  v20 = ((v6 * (unint64_t)HIDWORD(v4)) >> 32)
      + HIDWORD(v6) * (unint64_t)HIDWORD(v4)
      + ((((v6 * (unint64_t)v4) >> 32)
        + HIDWORD(v6) * (unint64_t)v4
        + (v6 * HIDWORD(v4))) >> 32);
  if (*((_QWORD *)&v14 + 1) < v11)
    ++v20;
  *(_QWORD *)(a3 + 8) = (__PAIR128__(v20, v16) + __PAIR128__(v17, v19)) >> 64;
  *(_QWORD *)(a3 + 16) = v16 + v19;
  return result;
}

uint64_t __dpml_bid_divide__(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BOOL8 v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;

  if (a2)
    v5 = a2;
  else
    v5 = &__ux_one__;
  if (result)
    v6 = (_QWORD *)result;
  else
    v6 = &__ux_one__;
  if (v5 == (_QWORD *)&__ux_one__)
  {
    *(_QWORD *)a4 = *v6;
    *(_QWORD *)(a4 + 8) = v6[1];
    *(_QWORD *)(a4 + 16) = v6[2];
  }
  else
  {
    v8 = v5[1];
    if ((v8 & 0x8000000000000000) == 0)
    {
      result = __dpml_bid_ffs_and_shift__((uint64_t)v5, 0);
      v8 = v5[1];
    }
    v9 = v5[2];
    v10 = 2.12676479e37 / (double)(v8 >> 1);
    v11 = v6[1];
    v12 = v6[2];
    v13 = *((_DWORD *)v6 + 1);
    v14 = *((_DWORD *)v5 + 1);
    *(_DWORD *)a4 = *(_DWORD *)v5 ^ *(_DWORD *)v6;
    v15 = v13 - v14;
    v16 = ((uint64_t)v10 - 1280) & 0xFFFFFFF000000000;
    v17 = v10
        * 4.07831529e-56
        * (2.12676479e37
         - (double)((v8 >> 1) & 0x7FFFFFE000000000) * (double)v16
         + (double)((v9 >> 49) & 0xFFE0000000007FFFLL | ((v8 & 0x3FFFFFFFFFLL) << 15)) * -0.0000152587891 * (double)v16);
    v18 = (double)v16 * 8.67361738e-19;
    v19 = v17 * (double)((v11 >> 1) & 0x7FFFFFFFFFFFFC00)
        + (double)((v12 >> 49) & 0xFFE0000000007FFFLL | ((v11 & 0x3FFFFFFFFFLL) << 15)) * 0.0000152587891 * v18;
    v20 = (uint64_t)(v18 * (double)((v11 >> 1) & 0x7FFFFFE000000000) * 0.25);
    v21 = (uint64_t)v19 + 4 * v20;
    if (__CFADD__((uint64_t)v19, 4 * v20))
      v22 = (v20 >> 62) + 1;
    else
      v22 = v20 >> 62;
    if (a3 == 1)
    {
      v23 = 0;
    }
    else
    {
      v24 = ((v21 * (unint64_t)HIDWORD(v9)) >> 32)
          + HIDWORD(v21) * (unint64_t)HIDWORD(v9)
          + ((((v21 * (unint64_t)v9) >> 32)
            + HIDWORD(v21) * (unint64_t)v9
            + (v21 * HIDWORD(v9))) >> 32);
      v25 = ((v21 * (unint64_t)HIDWORD(v8)) >> 32)
          + HIDWORD(v21) * (unint64_t)HIDWORD(v8)
          + ((((v21 * (unint64_t)v8) >> 32)
            + HIDWORD(v21) * (unint64_t)v8
            + (v21 * HIDWORD(v8))) >> 32);
      v26 = v9 & -v22;
      v27 = v8 & -v22;
      v28 = v24 + v26 + v21 * v8;
      v29 = __CFADD__(v24 + v26, v21 * v8);
      v30 = __CFADD__(v25, v27);
      v31 = v25 + v27;
      v32 = v30;
      v30 = __CFADD__(v24, v26);
      v33 = vcvtd_n_s64_f64(v17, 0x3EuLL) + 4 * v16;
      v34 = v29 + v30 + v31;
      if (__CFADD__(v30, v31) | __CFADD__(v29, v30 + v31))
        v35 = 1;
      else
        v35 = 0;
      v36 = v32 << 63 >> 63;
      if (!v33)
        v33 = -1;
      v37 = v36 - v35;
      v38 = v12 < v28;
      v30 = v11 >= v34;
      v39 = v11 - v34;
      v40 = !v30;
      v41 = v37 - v40;
      v42 = v39 == v38;
      v43 = v39 < v38;
      v44 = !v42;
      v45 = v41 - v43;
      v46 = v45 | v44;
      if (!(v45 | v44))
        v45 = v8;
      v47 = v12 - v28 - (v45 ^ v8);
      result = v47;
      v48 = ((HIDWORD(v47) * (unint64_t)v33) >> 32)
          + HIDWORD(v47) * (unint64_t)HIDWORD(v33)
          + ((((v47 * (unint64_t)v33) >> 32)
            + v47 * (unint64_t)HIDWORD(v33)
            + (HIDWORD(v47) * v33)) >> 32);
      v23 = ((v12 | v11) != 0) | (2 * v48);
      v22 = ((uint64_t)(v46 + (v48 >> 63)) + __PAIR128__(v22, v21)) >> 64;
      v21 += v46 + (v48 >> 63);
    }
    *(_QWORD *)(a4 + 8) = (v21 >> v22) | (v22 << 63);
    *(_QWORD *)(a4 + 16) = (v23 >> v22) | ((unint64_t)(v21 & v22) << 63);
    *(_DWORD *)(a4 + 4) = v15 + v22;
  }
  return result;
}

uint64_t __dpml_bid_evaluate_rational__(int8x8_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v6;
  int8x8_t *v10;
  char v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int8x8_t *v17;
  uint64_t (*v18)(int8x8_t *);
  _BOOL4 v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD v25[3];

  v6 = a4;
  memset(v25, 0, sizeof(v25));
  a1->i32[1] += a4 >> 58;
  if ((a4 & 0x44) != 0)
  {
    v10 = (int8x8_t *)v25;
    __dpml_bid_multiply__(a1, a1, v25);
    v11 = v6;
  }
  else
  {
    v12 = -120;
    if (!a1->i32[0])
      v12 = 0;
    v11 = v12 ^ a4;
    v10 = a1;
  }
  result = __dpml_bid_ffs_and_shift__((uint64_t)v10, 0);
  v14 = -(v10->i32[1] * a3);
  v15 = 16 * a3 + 24;
  if ((v6 & 0x600) == 0x200)
    v16 = -1;
  else
    v16 = 0;
  if ((v6 & 0xF) == 0)
  {
    v21 = v6 << 53;
    v22 = v6 & 0xF0;
    LOWORD(v6) = v6 | 0x100;
    v20 = (unint64_t *)(a2 + (v15 & (v21 >> 63)));
    v17 = (int8x8_t *)a5;
    if (!v22)
      return result;
    goto LABEL_21;
  }
  v17 = (int8x8_t *)(a5 + 24 + 24 * v16);
  v23 = -(v10->i32[1] * a3);
  v24 = v11;
  if ((v11 & 8) != 0)
    v18 = (uint64_t (*)(int8x8_t *))__eval_neg_poly;
  else
    v18 = (uint64_t (*)(int8x8_t *))__eval_pos_poly;
  v19 = (v6 & 0x600) == 0x200 && (v6 & 0xF0) != 0;
  result = v18(v10);
  if ((v6 & 2) != 0)
    result = __dpml_bid_multiply__(a1, (int8x8_t *)(a5 + 24 * v19), (_QWORD *)(a5 + 24 * v19));
  v15 = 16 * a3 + 24;
  v20 = (unint64_t *)(a2 + v15);
  *(_DWORD *)(a5 + 24 * v19 + 4) += *(_DWORD *)(a2 + v15 - 8);
  v14 = v23;
  v11 = v24;
  if ((v6 & 0xF0) != 0)
  {
LABEL_21:
    if (v11 < 0)
      result = __eval_neg_poly((unint64_t)v10, v14, v20, a3, v17);
    else
      result = __eval_pos_poly((uint64_t)v10, v14, v20, a3, (uint64_t)v17);
    if ((v6 & 0x20) != 0)
      result = __dpml_bid_multiply__(a1, v17, v17);
    v17->i32[1] += *(_DWORD *)((char *)v20 + v15 - 8);
    if ((v6 & 0x500) == 0)
      return __dpml_bid_divide__(a5, (_QWORD *)(a5 + 24), 2, a5);
  }
  return result;
}

uint64_t __eval_pos_poly(uint64_t result, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  unint64_t v40;
  __int128 v41;
  unint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL8 v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  __int128 v57;

  v5 = *(_QWORD *)(result + 8);
  v6 = *(int *)(result + 4);
  if (a2 >= 128)
  {
    do
    {
      a2 += v6;
      a3 += 2;
      --a4;
    }
    while (a2 > 127);
  }
  v7 = *(_QWORD *)(result + 16);
  if (a2 >= 64)
  {
    v10 = a3 + 2;
    do
    {
      a3 = v10;
      v8 = *(v10 - 1) >> a2;
      v11 = a2 + v6;
      if (a2 + v6 < 64)
      {
        v9 = 0;
        --a4;
        a2 += v6;
        goto LABEL_11;
      }
      v10 += 2;
      --a4;
      a2 += v6;
    }
    while (!v8);
    do
    {
      v12 = ((v8 * (unint64_t)HIDWORD(v5)) >> 32)
          + HIDWORD(v8) * (unint64_t)HIDWORD(v5)
          + ((((v8 * (unint64_t)v5) >> 32)
            + HIDWORD(v8) * (unint64_t)v5
            + (v8 * HIDWORD(v5))) >> 32);
      v13 = a3[1] >> v11;
      v11 += v6;
      a3 += 2;
      --a4;
      v8 = v12 + v13;
    }
    while (v11 > 63);
    v9 = v8 < v12;
    a2 = v11;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
LABEL_11:
  if (!a2)
  {
LABEL_20:
    v18 = 0;
    goto LABEL_40;
  }
  if (!v9)
  {
    while (1)
    {
      v14 = ((v8 * (unint64_t)HIDWORD(v5)) >> 32)
          + HIDWORD(v8) * (unint64_t)HIDWORD(v5)
          + ((((v8 * (unint64_t)v5) >> 32)
            + HIDWORD(v8) * (unint64_t)v5
            + (v8 * HIDWORD(v5))) >> 32);
      v16 = *a3;
      v15 = a3[1];
      a3 += 2;
      v17 = (v16 >> a2) | (v15 << -(char)a2);
      v9 = v15 >> a2;
      --a4;
      v39 = __CFADD__(v17, v14);
      v8 = v17 + v14;
      if (v39)
        ++v9;
      a2 += v6;
      if (!a2)
        goto LABEL_20;
      if (v9)
        goto LABEL_18;
    }
  }
  v9 = 1;
LABEL_18:
  if (a4 < 0)
    goto LABEL_20;
  v18 = 0;
  v19 = *(_QWORD *)(result + 16);
  v20 = *(_QWORD *)(result + 8);
  do
  {
    do
    {
      v21 = v9 * v5;
      v23 = *a3;
      v22 = a3[1];
      a3 += 2;
      v24 = (v23 >> a2) | (v22 << -(char)a2);
      v25 = v22 >> a2;
      v26 = v9;
      v27 = HIDWORD(v9);
      v28 = ((v26 * (unint64_t)HIDWORD(v7)) >> 32)
          + v27 * (unint64_t)HIDWORD(v7)
          + ((((v26 * (unint64_t)v19) >> 32) + v27 * (unint64_t)v19 + v26 * HIDWORD(v7)) >> 32);
      v39 = __CFADD__(v24, v21);
      v29 = v24 + v21;
      v30 = v39;
      v31 = ((v8 * (unint64_t)HIDWORD(v5)) >> 32)
          + HIDWORD(v8) * (unint64_t)HIDWORD(v5)
          + ((((v8 * (unint64_t)v20) >> 32)
            + HIDWORD(v8) * (unint64_t)v20
            + (v8 * HIDWORD(v5))) >> 32);
      v39 = __CFADD__(v29, v28);
      v32 = v29 + v28;
      v33 = v39;
      a2 += v6;
      v34 = ((v26 * (unint64_t)HIDWORD(v5)) >> 32)
          + v27 * (unint64_t)HIDWORD(v5)
          + ((((v26 * (unint64_t)v20) >> 32) + v27 * (unint64_t)v20 + v26 * HIDWORD(v5)) >> 32);
      v36 = v32 + v31;
      v35 = (__PAIR128__(v33, v32) + __PAIR128__(v30, v31)) >> 64;
      v8 = v36;
      v37 = v35 + v25;
      v38 = v37 + v34;
      v39 = v37 >= v35 && v38 >= v34;
      *((_QWORD *)&v41 + 1) = v37 + v34;
      *(_QWORD *)&v41 = v36;
      v40 = v41 >> 1;
      if (v39)
      {
        v9 = v38;
      }
      else
      {
        ++v18;
        v8 = v40;
        v9 = (v38 >> 1) | 0x8000000000000000;
      }
      if (!v39)
        ++a2;
      v39 = a4-- != 0;
      result = v39;
    }
    while (a2 && (result & 1) != 0);
LABEL_40:
    if (a4 < 0)
      break;
    v19 = v7;
    v20 = v5;
    a3 += 2;
    result = a4;
    while (1)
    {
      v42 = v9 * v5;
      v43 = *(a3 - 2);
      v44 = v9;
      v45 = HIDWORD(v9);
      v46 = ((v44 * (unint64_t)HIDWORD(v7)) >> 32)
          + v45 * (unint64_t)HIDWORD(v7)
          + ((((v44 * (unint64_t)v7) >> 32)
            + v45 * (unint64_t)v7
            + v44 * HIDWORD(v7)) >> 32);
      v39 = __CFADD__(v43, v42);
      v47 = v43 + v42;
      v48 = v39;
      a4 = result - 1;
      v49 = ((v8 * (unint64_t)HIDWORD(v5)) >> 32)
          + HIDWORD(v8) * (unint64_t)HIDWORD(v5)
          + ((((v8 * (unint64_t)v5) >> 32)
            + HIDWORD(v8) * (unint64_t)v5
            + (v8 * HIDWORD(v5))) >> 32);
      v39 = __CFADD__(v47, v46);
      v50 = v47 + v46;
      v51 = v39;
      v52 = ((v44 * (unint64_t)HIDWORD(v5)) >> 32)
          + v45 * (unint64_t)HIDWORD(v5)
          + ((((v44 * (unint64_t)v5) >> 32)
            + v45 * (unint64_t)v5
            + v44 * HIDWORD(v5)) >> 32);
      v54 = v50 + v49;
      v53 = (__PAIR128__(v51, v50) + __PAIR128__(v48, v49)) >> 64;
      v8 = v54;
      v55 = v53 + *(a3 - 1);
      v9 = v55 + v52;
      if (v55 < v53 || v9 < v52)
        break;
      a3 += 2;
      --result;
      if (a4 == -1)
        goto LABEL_54;
    }
    *((_QWORD *)&v57 + 1) = v55 + v52;
    *(_QWORD *)&v57 = v54;
    v8 = v57 >> 1;
    ++v18;
    a2 = 1;
    v9 = (v9 >> 1) | 0x8000000000000000;
  }
  while (result);
LABEL_54:
  *(_QWORD *)(a5 + 8) = v9;
  *(_QWORD *)(a5 + 16) = v8;
  *(_DWORD *)a5 = 0;
  *(_DWORD *)(a5 + 4) = v18;
  return result;
}

unint64_t __eval_neg_poly(unint64_t result, uint64_t a2, unint64_t *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  _BOOL8 v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unint64_t v40;
  unint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;

  v5 = *(int *)(result + 4);
  if (a2 >= 128)
  {
    do
    {
      a2 += v5;
      a3 += 2;
      --a4;
    }
    while (a2 > 127);
  }
  v6 = *(_QWORD *)(result + 8);
  if (a2 >= 64)
  {
    v8 = a3 + 2;
    do
    {
      a3 = v8;
      v7 = *(v8 - 1) >> a2;
      v9 = a2 + v5;
      if (a2 + v5 < 64)
      {
        --a4;
        a2 += v5;
        goto LABEL_12;
      }
      v8 += 2;
      --a4;
      a2 += v5;
    }
    while (!v7);
    a2 = v9;
    do
    {
      v10 = a3[1] >> a2;
      a2 += v5;
      a3 += 2;
      --a4;
      v7 = v10
         - (((v7 * (unint64_t)HIDWORD(v6)) >> 32)
          + HIDWORD(v7) * (unint64_t)HIDWORD(v6)
          + ((((v7 * (unint64_t)*(_QWORD *)(result + 8)) >> 32)
            + HIDWORD(v7) * (unint64_t)*(_QWORD *)(result + 8)
            + (v7 * HIDWORD(v6))) >> 32));
    }
    while (a2 > 63);
  }
  else
  {
    v7 = 0;
  }
LABEL_12:
  v11 = *(_QWORD *)(result + 16);
  if (!a2)
  {
    v20 = 0;
    if (a4 < 0)
      goto LABEL_44;
    goto LABEL_33;
  }
  v12 = *(_QWORD *)(result + 8);
  while (1)
  {
    v13 = ((v7 * (unint64_t)HIDWORD(v6)) >> 32)
        + HIDWORD(v7) * (unint64_t)HIDWORD(v6)
        + ((((v7 * (unint64_t)v12) >> 32)
          + HIDWORD(v7) * (unint64_t)v12
          + (v7 * HIDWORD(v6))) >> 32);
    v15 = *a3;
    v14 = a3[1];
    a3 += 2;
    v16 = (v15 >> a2) | (v14 << -(char)a2);
    v17 = v14 >> a2;
    --a4;
    v18 = v16 >= v13;
    v7 = v16 - v13;
    v19 = !v18;
    v20 = v17 - v19;
    a2 += v5;
    if (!a2)
      break;
    if (v20)
    {
      v21 = *(_QWORD *)(result + 16);
      do
      {
        v22 = v20 * v6;
        v24 = *a3;
        v23 = a3[1];
        a3 += 2;
        v25 = (v24 >> a2) | (v23 << -(char)a2);
        result = v23 >> a2;
        v26 = v20;
        v27 = HIDWORD(v20);
        v28 = ((v26 * (unint64_t)HIDWORD(v11)) >> 32)
            + v27 * (unint64_t)HIDWORD(v11)
            + ((((v26 * (unint64_t)v21) >> 32) + v27 * (unint64_t)v21 + v26 * HIDWORD(v11)) >> 32);
        v18 = v25 >= v22;
        v29 = v25 - v22;
        v30 = !v18;
        --a4;
        v31 = ((v7 * (unint64_t)HIDWORD(v6)) >> 32)
            + HIDWORD(v7) * (unint64_t)HIDWORD(v6)
            + ((((v7 * (unint64_t)v12) >> 32)
              + HIDWORD(v7) * (unint64_t)v12
              + (v7 * HIDWORD(v6))) >> 32);
        v18 = v29 >= v28;
        v32 = v29 - v28;
        v33 = !v18;
        v34 = v26 * (unint64_t)v12;
        v35 = v26 * (unint64_t)HIDWORD(v6);
        v36 = HIDWORD(v34) + v27 * (unint64_t)v12 + v35;
        v37 = HIDWORD(v35);
        v18 = v32 >= v31;
        v7 = v32 - v31;
        v38 = !v18;
        v20 = result - (v37 + v27 * (unint64_t)HIDWORD(v6) + HIDWORD(v36)) - v30 - v33 - v38;
        a2 += v5;
      }
      while (a2);
      break;
    }
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
LABEL_33:
    v39 = v11;
    v40 = HIDWORD(v11);
    v41 = a3 + 1;
    v42 = a4 + 1;
    do
    {
      v43 = v20 * v6;
      v44 = *(v41 - 1);
      result = *v41;
      v45 = v20;
      v46 = HIDWORD(v20);
      v47 = ((v45 * (unint64_t)v40) >> 32)
          + v46 * (unint64_t)v40
          + ((((v45 * (unint64_t)v39) >> 32) + v46 * (unint64_t)v39 + v45
                                                                                                * v40) >> 32);
      v18 = v44 >= v43;
      v48 = v44 - v43;
      v49 = !v18;
      v50 = ((v7 * (unint64_t)HIDWORD(v6)) >> 32)
          + HIDWORD(v7) * (unint64_t)HIDWORD(v6)
          + ((((v7 * (unint64_t)v6) >> 32)
            + HIDWORD(v7) * (unint64_t)v6
            + (v7 * HIDWORD(v6))) >> 32);
      v18 = v48 >= v47;
      v51 = v48 - v47;
      v52 = !v18;
      v53 = v45 * (unint64_t)v6;
      v54 = v45 * (unint64_t)HIDWORD(v6);
      v55 = HIDWORD(v53) + v46 * (unint64_t)v6 + v54;
      v56 = HIDWORD(v54);
      v18 = v51 >= v50;
      v7 = v51 - v50;
      v57 = !v18;
      v20 = result - (v56 + v46 * (unint64_t)HIDWORD(v6) + HIDWORD(v55)) - v49 - v52 - v57;
      v41 += 2;
      --v42;
    }
    while (v42);
  }
LABEL_44:
  a5[1] = v20;
  a5[2] = v7;
  *a5 = 0;
  return result;
}

uint64_t __dpml_bid_ux_sqrt_evaluation__(int8x8_t *a1, int8x8_t *a2)
{
  int8x8_t v3;
  double v4;
  char v5;
  int v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  float v11;
  double v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int8x8_t v16;
  uint64_t result;
  int8x8_t v18[3];
  int8x8_t v19[3];

  memset(v18, 0, sizeof(v18));
  v3 = a1[1];
  *(_QWORD *)&v4 = (*(_QWORD *)&v3 >> 11) + 0x3FD0000000000000;
  v5 = a1->i32[1] & 1 | 0x28;
  v6 = (a1->i32[1] & 1) + a1->i32[1];
  v7 = (double)(unint64_t)(*(_QWORD *)&v3 >> v5) * 0.0000000596046448;
  v8 = (double)(((unint64_t)((2 * *(_QWORD *)&v3) << (~v5 & 0x3F)) | (*(_QWORD *)&a1[2] >> v5)) >> 11)
     * 6.6174449e-24;
  v9 = (double *)((char *)&__dpml_bid_sqrt_t_table + 16 * (((a1->i32[1] & 1u) << 7) ^ HIBYTE(*(_QWORD *)&v3)));
  v10 = (v9[1] + *((float *)v9 + 1) * v4 + *(float *)v9 * (v4 * v4)) * 1.41421356;
  v11 = v10 * (v7 + v8);
  *(float *)&v10 = v10;
  v12 = *(float *)&v10;
  v13 = (uint64_t)(((v7 + v8) * -0.375 * (v12 * v12) + 0.875)
                * v12
                * (1.0 - v11 * v12 - (v8 * v12 - (v11 - v7 * v12)) * v12)
                * 3.77789319e22);
  v14 = (v13 >> 12) + (vcvtd_n_u64_f64(v12, 0x18uLL) << 39) + (((unint64_t)v13 >> 11) & 1);
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v14 & 0x4000000000000000) == 0)
    v15 = -1;
  v19[0].i32[0] = 0;
  v19[0].i32[1] = 1 - (v6 >> 1);
  if (v14 >= 0)
    v16 = (int8x8_t)v15;
  else
    v16 = (int8x8_t)v14;
  v19[1] = v16;
  v19[2] = 0;
  __dpml_bid_multiply__(v19, a1, v18);
  __dpml_bid_multiply__(v19, v18, a2);
  __dpml_bid_addsub__((uint64_t)&unk_1B891F0E0, a2, 9, (uint64_t)a2);
  result = __dpml_bid_multiply__(a2, v18, a2);
  --a2->i32[1];
  return result;
}

double bid_f128_sqrt(__n128 *a1, uint64_t *a2)
{
  double result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[4];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  int8x8_t v11[2];
  unint64_t v12;
  int8x8_t v13[3];

  memset(v13, 0, sizeof(v13));
  if ((__dpml_bid_unpack_x_or_y__(a2, 0, (uint64_t)v13, __dpml_bid_sqrt_x_table, (uint64_t)a1, v7) & 0x8000000000000000) == 0)
  {
    v11[0] = 0;
    v11[1] = 0;
    v12 = 0;
    __dpml_bid_ux_sqrt_evaluation__(v13, v11);
    __dpml_bid_ffs_and_shift__((uint64_t)v11, 0);
    if ((((_WORD)v12 + 8) & 0x3FF0) == 0)
    {
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      memset(v8, 0, sizeof(v8));
      v4 = v12 & 0xFFFFFFFFFFFF8000;
      v5 = v12 & 0xFFFFFFFFFFFF8000 | 0x4000;
      v12 = v5;
      __dpml_bid_extended_multiply__((uint64_t)v11, (uint64_t)v11, (uint64_t)v9, (uint64_t)v8);
      __dpml_bid_addsub__((uint64_t)v13, v9, 1, (uint64_t)v10);
      __dpml_bid_addsub__((uint64_t)v10, v8, 1, (uint64_t)v10);
      if (LODWORD(v10[0]))
        v6 = v4;
      else
        v6 = v5;
      v12 = v6;
    }
    *(_QWORD *)&result = __dpml_bid_pack__((unsigned int *)v11, a1, 0, 0).n128_u64[0];
  }
  return result;
}

uint64_t __dpml_bid_ux_sincos(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t (*v6)(uint64_t, uint64_t, int8x8_t *);
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int8x8_t v13[3];

  memset(v13, 0, sizeof(v13));
  v6 = (uint64_t (*)(uint64_t, uint64_t, int8x8_t *))__dpml_bid_ux_degree_reduce__;
  if ((a3 & 0x10) == 0)
    v6 = __dpml_bid_ux_radian_reduce__;
  v7 = v6(a1, a2, v13);
  v8 = v7;
  v9 = a3 & 0xFFFFFFFFFFFFFFEFLL;
  v10 = 1216;
  if ((v7 & 1) == 0)
    v10 = 1038;
  if (v9 == 3)
    v11 = ((unint64_t)(v7 & 1) << 9) | 0x1CE;
  else
    v11 = v10;
  __dpml_bid_evaluate_rational__(v13, (uint64_t)&unk_1B891FA40, 13, v11, (uint64_t)a4);
  if ((v8 & 2) != 0)
    *a4 ^= 0x80000000;
  if (v9 == 3 && ((v8 + 1) & 2) != 0)
    a4[6] ^= 0x80000000;
  return 0;
}

uint64_t __dpml_bid_ux_radian_reduce__(uint64_t a1, uint64_t a2, int8x8_t *a3)
{
  int8x8_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  unsigned int v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int8x8_t v100;
  unint64_t v101;
  unint64_t v102;
  __int32 v103;

  v4 = *(int8x8_t *)(a1 + 8);
  v5 = *(_DWORD *)a1;
  v6 = *(unsigned int *)(a1 + 4);
  if ((v6 & 0x80000000) != 0)
  {
    v66 = ((a2 + (v5 >> 31)) & 1) + a2 + (v5 >> 31);
    v67 = v66 >> 1;
    if (v66 == a2)
    {
      a3->i32[0] = v5;
      a3->i32[1] = v6;
      a3[1] = v4;
      a3[2] = *(int8x8_t *)(a1 + 16);
    }
    else
    {
      __dpml_bid_addsub__(a1, qword_1B891FD20, v66 > a2, (uint64_t)a3);
    }
  }
  else
  {
    v7 = v6 + 8;
    v8 = v7 >> 6;
    v9 = (_QWORD *)((char *)&__four_over_pi + 8 * (v7 >> 6));
    v10 = v9[1];
    v11 = v7 & 0x3F;
    v12 = ~(_BYTE)v11;
    v13 = v10 >> 1 >> ~(_BYTE)v11;
    v14 = v9[2];
    v15 = v9[3];
    v16 = v10 << v11;
    v17 = *(_QWORD *)(a1 + 16);
    v18 = v9[4];
    if (v11)
      LOBYTE(v8) = 64 - v11;
    v19 = (*v9 << v11) | v13;
    v20 = v16 | (v14 >> 1 >> ~(_BYTE)v11);
    v21 = (v14 << v11) | (v15 >> 1 >> v12);
    v22 = (v15 << v11) | (v18 >> 1 >> v12);
    v23 = ((_DWORD)v15 << v11) | (v18 >> 1 >> v12);
    v24 = HIDWORD(v17);
    v25 = v17;
    v26 = v23 * (unint64_t)HIDWORD(v17);
    v27 = HIDWORD(v22) * (unint64_t)v17;
    v28 = ((v22 * (unint64_t)v17) >> 32) + v26 + v27;
    v29 = (v22 * v17) | ((unint64_t)v28 << 32);
    v30 = HIDWORD(v27) + HIDWORD(v22) * (unint64_t)HIDWORD(v17) + HIDWORD(v26) + HIDWORD(v28);
    v31 = v22 * (unint64_t)v4.u32[0];
    v32 = v23 * (unint64_t)v4.u32[1];
    v33 = HIDWORD(v22) * (unint64_t)v4.u32[0];
    v34 = v30 + (unint64_t)v31;
    v35 = HIDWORD(v31) + v32 + v33 + HIDWORD(v30) + HIDWORD(v34);
    v36 = v34;
    v37 = HIDWORD(v33) + HIDWORD(v22) * (unint64_t)v4.u32[1] + HIDWORD(v32) + HIDWORD(v35);
    LODWORD(v34) = v21;
    v38 = v21 * (unint64_t)v17;
    v39 = v21 * (unint64_t)HIDWORD(v17);
    v40 = HIDWORD(v21);
    v41 = HIDWORD(v21) * (unint64_t)v17;
    v42 = HIDWORD(v21) * (unint64_t)HIDWORD(v17);
    v43 = v36 + v38;
    v44 = HIDWORD(v38) + v39 + v41 + v35 + HIDWORD(v43);
    v45 = HIDWORD(v39) + HIDWORD(v41) + v42 + v37 + HIDWORD(v44);
    v46 = HIDWORD(v37) + HIDWORD(v42) + HIDWORD(v45);
    v47 = v21 * (unint64_t)v4.u32[0];
    v48 = v34 * (unint64_t)v4.u32[1];
    v49 = v40 * (unint64_t)v4.u32[0];
    v50 = v45 + (unint64_t)v47;
    v51 = HIDWORD(v47) + v48 + v49 + v46 + HIDWORD(v50);
    v52 = v20 * (unint64_t)v17;
    v53 = v20 * (unint64_t)HIDWORD(v17);
    v54 = v19 * v17;
    if (v5)
      a2 = -(int)a2;
    v55 = v54 + (a2 << 61);
    v56 = HIDWORD(v20) * (unint64_t)v25;
    v57 = v50 + (unint64_t)v52;
    v58 = HIDWORD(v52) + v53 + v56 + HIDWORD(v57) + v51;
    v59 = v55
        + v20 * *(_QWORD *)&v4
        + HIDWORD(v20) * (unint64_t)v24
        + HIDWORD(v56)
        + HIDWORD(v53)
        + v40 * (unint64_t)v4.u32[1]
        + HIDWORD(v49)
        + HIDWORD(v48)
        + HIDWORD(v46)
        + HIDWORD(v51)
        + HIDWORD(v58);
    v60 = v43 | ((unint64_t)v44 << 32);
    v61 = v57 | ((unint64_t)v58 << 32);
    if (((v59 + 0x40000000000000) & 0x3F80000000000000) != 0)
    {
      v62 = 0;
      v63 = v61;
      v64 = v60;
      v65 = v29;
    }
    else
    {
      v62 = 0;
      v68 = v9 + 5;
      while (1)
      {
        v69 = *v68;
        if (v11)
          v18 = (*v68 >> v8) | (v18 << v11);
        v70 = v18;
        v71 = v18 * (unint64_t)v25;
        v72 = v18 * (unint64_t)v24;
        v73 = HIDWORD(v18);
        v74 = HIDWORD(v18) * (unint64_t)v25;
        v75 = HIDWORD(v18) * (unint64_t)v24;
        v76 = HIDWORD(v71) + v72 + v74;
        v77 = HIDWORD(v74) + v29 + HIDWORD(v72) + v75 + HIDWORD(v76);
        v78 = HIDWORD(v75) + HIDWORD(v29) + HIDWORD(v77);
        v79 = v70 * (unint64_t)v4.u32[0];
        v80 = v70 * (unint64_t)v4.u32[1];
        v81 = v73 * (unint64_t)v4.u32[0];
        v82 = v73 * (unint64_t)v4.u32[1];
        v83 = v61;
        v84 = v77 + (unint64_t)v79 + HIDWORD(v78);
        v85 = HIDWORD(v79) + v80 + v81 + v78 + HIDWORD(v84);
        v86 = HIDWORD(v81) + v60 + HIDWORD(v80) + v82 + HIDWORD(v85);
        v87 = HIDWORD(v82) + HIDWORD(v60) + HIDWORD(v86);
        v88 = v83 == -1 && (unint64_t)(HIDWORD(v87) != 0);
        v89 = v84 | ((unint64_t)v85 << 32);
        v60 = v89;
        v61 = v86 | ((unint64_t)v87 << 32);
        v59 += v88;
        v63 = HIDWORD(v87) ? v83 + 1 : v83;
        *((_QWORD *)&v90 + 1) = v59;
        *(_QWORD *)&v90 = v63;
        if ((unint64_t)(v90 >> 55) != (uint64_t)(v90 >> 55) >> 63)
          break;
        v65 = v71 | ((unint64_t)v76 << 32);
        ++v68;
        v59 = v59 & 0xE000000000000000 | v63 & 0x1FFFFFFFFFFFFFFFLL;
        v62 += 64;
        v29 = v65;
        v18 = v69;
        v63 = v61;
        v64 = v89;
        if (((v59 + 0x40000000000000) & 0x3F80000000000000) != 0)
          goto LABEL_24;
      }
      v64 = v61;
      v65 = v89;
    }
LABEL_24:
    v91 = 4 * v59;
    v92 = (uint64_t)(4 * v59) >> 2;
    v93 = v92 == (uint64_t)(4 * v59) >> 63;
    if (v92 == (uint64_t)(4 * v59) >> 63)
    {
      v92 = v63;
      v94 = v64;
    }
    else
    {
      v94 = v63;
    }
    if (v93)
      v95 = v65;
    else
      v95 = v64;
    if (v93)
      v96 = v62 + 64;
    else
      v96 = v62;
    v97 = -v94;
    if (v95)
      v97 = ~v94;
    v98 = -v92;
    if (v97)
      v98 = ~v92;
    if (v91 < 0)
      v99 = v98;
    else
      v99 = v92;
    if (v91 < 0)
      v100 = (int8x8_t)v97;
    else
      v100 = (int8x8_t)v94;
    if (v91 >= 0)
      v101 = v95;
    else
      v101 = -(uint64_t)v95;
    a3->i32[0] = HIDWORD(v91) & 0x80000000 ^ v5;
    a3->i32[1] = 3;
    if (v5)
      v102 = ((uint64_t)(4 * v59) >> 2) - v59;
    else
      v102 = v59 - ((uint64_t)(4 * v59) >> 2);
    a3[1] = (int8x8_t)v99;
    a3[2] = v100;
    __dpml_bid_ffs_and_shift__((uint64_t)a3, 0);
    v103 = a3->i32[1];
    if (v103 != 3)
      *(_QWORD *)&a3[2] |= v101 >> (v103 + 61);
    a3->i32[1] = v103 - v96;
    __dpml_bid_multiply__(a3, qword_1B891FD20, a3);
    return v102 >> 62;
  }
  return v67;
}

unint64_t __dpml_bid_ux_degree_reduce__(int8x8_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  int8x8_t v9;
  __int32 v10;
  int8x8_t v11;
  int8x8_t v12;
  int8x8_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int8x8_t *v17;
  uint64_t v18;
  unint64_t *v19;
  int8x8_t v20;
  unint64_t v21;
  int8x8_t v22;
  uint64_t v23;
  int8x8_t v24;
  BOOL v25;
  unint64_t v26;
  int8x8_t v27;
  uint64_t v28;
  unint64_t v29;
  int8x8_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unsigned int v36;
  int8x8_t v37;
  int8x8_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v6 = a1->u32[1];
  if ((int)v6 >= 143)
  {
    LODWORD(v6) = v6
                - 12
                * (((((unint64_t)(1431655766 * (v6 + 32641)) >> 32) + (357913941 * (v6 + 32641))) >> 32)
                 + ((unint64_t)(357913941 * (v6 + 32641)) >> 32))
                + 32772;
    a1->i32[1] = v6;
  }
  v7 = a1->i32[0];
  if ((int)v6 >= 16)
  {
    v8 = (unint64_t)(v6 - 15) >> 6;
    v9 = (int8x8_t)(((_BYTE)v6 - 15) & 0x3F);
    v10 = v6 - v9.i32[0];
    if ((((_BYTE)v6 - 15) & 0x3F) != 0)
    {
      v12 = a1[1];
      v11 = a1[2];
      v13 = (int8x8_t)(*(_QWORD *)&v11 << v9.i8[0]);
      v14 = *(_QWORD *)&v12 << v9.i8[0];
      v15 = -*(_QWORD *)&v9;
      a1[1] = (int8x8_t)(v14 | (*(_QWORD *)&v11 >> v15));
      a1[2] = v13;
      v9 = (int8x8_t)(*(_QWORD *)&v12 >> v15);
    }
    v16 = 0;
    *a1 = v9;
    v17 = &a1[v8];
    v18 = v8;
    v20 = v17[1];
    v19 = (unint64_t *)&v17[1];
    v21 = *(_QWORD *)&v20 >> 52;
    do
    {
      v22 = a1[v18];
      a1[v18] = 0;
      v23 = v16 - 12;
      v24 = (int8x8_t)(*(_QWORD *)&v22 >> (12 - v16));
      v25 = v16 == 0;
      if (v16)
        v26 = ((*(_QWORD *)&v22 << v16) & 0xFFFLL) + v21;
      else
        v26 = v21;
      if (v25)
        v27 = v22;
      else
        v27 = v24;
      if (v25)
        v28 = 0;
      else
        v28 = v23;
      v21 = (*(_QWORD *)&v27 & 0xFFFFFFFFFFFFFFFLL) + v26 + (*(_QWORD *)&v27 >> 60);
      v16 = v28 + 4;
      --v18;
    }
    while (v18 != -1);
    v29 = (v21 & 0xFFFFFF) + HIWORD(v21) + ((v21 >> 24) & 0xFFFFFF);
    if (v29 >= 0x1000)
    {
      do
        v29 = (v29 & 0xFFF) + (v29 >> 12);
      while (v29 > 0xFFF);
    }
    *v19 = *v19 & 0xFFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v29 << 52);
    a1->i32[1] = v10;
    LODWORD(v6) = v10 - __dpml_bid_ffs_and_shift__((uint64_t)a1, 0);
  }
  a1->i32[0] = 0;
  v30 = a1[1];
  if ((int)v6 < 6)
  {
    v31 = 0;
    v32 = 63;
  }
  else
  {
    v31 = ((1527099483 * (unint64_t)v30.u32[0]) >> 32)
        + 1527099483 * v30.u32[1]
        + ((((95443718 * (unint64_t)v30.u32[0]) >> 32)
          + 95443718 * v30.u32[1]
          + (1527099483 * v30.i32[0])) >> 32);
    v32 = 69 - v6;
  }
  v33 = ((((a2 & 1) + 1) << (v32 - 1)) + v31) & (-1 << v32);
  v34 = -3019898880 * HIDWORD(v33) + (*(_QWORD *)&v30 >> 2);
  v35 = *(_QWORD *)&a1[1] & 3 | (4 * (v34 - ((3019898880u * (unint64_t)v33) >> 32)));
  if ((uint64_t)(v34 - ((3019898880u * (unint64_t)v33) >> 32)) < 0)
  {
    v36 = v7 ^ 0x80000000;
    v37 = a1[2];
    v38 = (int8x8_t)-*(_QWORD *)&v37;
    if (v37)
      v39 = -1;
    else
      v39 = 0;
    a1[2] = v38;
    v35 = v39 - v35;
  }
  else
  {
    v36 = v7;
  }
  v40 = v33 >> v32;
  if (v7)
    v40 = -(uint64_t)v40;
  v41 = v40 + (a2 >> 1);
  a1[1] = (int8x8_t)v35;
  __dpml_bid_ffs_and_shift__((uint64_t)a1, 0);
  __dpml_bid_multiply__(a1, qword_1B891FA08, a3);
  *(_DWORD *)a3 ^= v36;
  return v41;
}

void __dpml_bid_C_ux_trig__(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, __n128 *a5, _QWORD *a6)
{
  unint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t, unsigned int *);
  uint64_t v11;
  __n128 *v12;
  _QWORD v13[3];
  unsigned int v14[6];
  unsigned int v15[12];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  v9 = __dpml_bid_unpack_x_or_y__(a1, 0, (uint64_t)v13, a4, (uint64_t)a5, a6);
  if ((v9 & 0x8000000000000000) != 0)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFEFLL) == 3)
    {
      v12 = (__n128 *)&unk_1B891FA20;
      if ((v9 & 0x1FFFFFFFCLL) == 0)
        v12 = a5;
      a5[1].n128_u64[1] = v12->n128_u64[1];
      a5[1].n128_u64[0] = v12->n128_u64[0];
    }
  }
  else
  {
    v10 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, unsigned int *))__dpml_bid_ux_sincos;
    if ((a3 & 3) == 0)
      v10 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, unsigned int *))__dpml_bid_ux_tancot__;
    v11 = v10(v13, a2, a3, v14);
    __dpml_bid_pack__(v14, a5, 0, v11);
    if ((a3 & 0xFFFFFFFFFFFFFFEFLL) == 3)
      __dpml_bid_pack__(v15, a5 + 1, 0, 0);
  }
}

uint64_t __dpml_bid_ux_tancot__(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t (*v6)(uint64_t, uint64_t, int8x8_t *);
  char v7;
  char v8;
  int v9;
  int8x8_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v6 = (uint64_t (*)(uint64_t, uint64_t, int8x8_t *))__dpml_bid_ux_degree_reduce__;
  if ((a3 & 0x10) == 0)
    v6 = __dpml_bid_ux_radian_reduce__;
  v7 = v6(a1, a2, &v11);
  v8 = v7;
  if (v12)
  {
    __dpml_bid_evaluate_rational__(&v11, (uint64_t)&unk_1B891FC10, 7, ((unint64_t)((v7 + (a3 >> 3)) & 1) << 9) | 0xCE, a4);
    v9 = *(_DWORD *)a4;
    if ((v8 & 1) != 0)
    {
      v9 ^= 0x80000000;
      *(_DWORD *)a4 = v9;
    }
    if (v9)
      return 28;
    else
      return 27;
  }
  else
  {
    *(_QWORD *)a4 = 0xFFFE000000000000;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
    if (((v7 + (a3 >> 3)) & 1) != 0)
    {
      *(_DWORD *)(a4 + 4) = 0x1FFFF;
      *(_QWORD *)(a4 + 8) = 0x8000000000000000;
    }
    if ((a3 & 4) != 0)
      return 110;
    else
      return 32;
  }
}

unint64_t __bid128_acos(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12[2];
  __n128 v13;
  uint64_t v14[2];
  uint64_t v15[2];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20[8];

  v4 = a1;
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    v13 = 0uLL;
    v12[0] = 0;
    v12[1] = 0;
    v15[0] = __bid128_to_binary128(a1, a2, a3, &my_fpsf);
    v15[1] = v6;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    __dpml_bid_unpack_x_or_y__(v15, 0, (uint64_t)&v17, &qword_1B891D780, (uint64_t)v12, v20);
    if (bid_f128_cmp(v12, (uint64_t *)&c_1em40, 1u))
      return __bid128_add(0xDD5F2AB27379CFC7, 0x2FFE4D723CABCB53, 0x492B4138A162883uLL, 0x2FBAD9F8AFB501D4, a3, &my_fpsf);
    if (bid_f128_cmp(v12, (uint64_t *)&c_7_10ths, 3u))
    {
      __dpml_bid_ux_asin_acos__(v15, 0x1A30038uLL, &qword_1B891E4C0, &v13, v20);
    }
    else
    {
      if (bid_f128_cmp(v12, (uint64_t *)&c_one, 4u))
      {
        v4 = 0;
        my_fpsf |= 1u;
        return v4;
      }
      if (bid_f128_cmp(v12, (uint64_t *)&c_one, 6u))
        return 0;
      v9 = bid128_ext_fma(v20, (int *)&v17, (int *)v14, &v16, v4, a2, v4, a2, 1uLL, 0xB040000000000000, a3, &my_fpsf);
      v14[0] = __bid128_to_binary128(v9, v10, a3, &my_fpsf);
      v14[1] = v11;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      __dpml_bid_unpack_x_or_y__(v14, 0, (uint64_t)&v17, &__dpml_bid_bid_x_table, (uint64_t)&v13, v20);
      bid_f128_sqrt(&v13, (uint64_t *)&v13);
      __dpml_bid_ux_asin_acos__((uint64_t *)&v13, 0xF04E00uLL, (uint64_t *)&__dpml_bid_inv_trig_x_table, &v13, v20);
      if (bid_f128_cmp(v15, (uint64_t *)&c_zero, 1u))
        bid_f128_sub(&v13, (uint64_t *)&c_pi, (uint64_t *)&v13);
    }
    return __binary128_to_bid128(v13.n128_u64[0], v13.n128_u64[1], a3, &my_fpsf);
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v4;
}

unint64_t __bid128_add(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, int *a6)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  char *v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  unsigned int v58;
  unint64_t v59;
  unint64_t v60;
  unsigned int v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  int v71;
  unsigned int v72;
  unint64_t v73;
  unint64_t v74;
  unsigned int v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int v80;
  unsigned int v81;
  unint64_t v82;
  unint64_t v83;
  unsigned int v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unsigned int v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unsigned int v98;
  int v99;
  _QWORD *v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unsigned int v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  int v121;
  int v122;
  _BOOL4 v123;
  _BOOL4 v124;
  int v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unsigned __int128 v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unsigned __int128 v155;
  unint64_t v156;
  uint64_t v157;
  unsigned int v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  int v163;
  BOOL v164;
  unint64_t v165;
  int v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  BOOL v170;
  unint64_t v171;
  BOOL v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  _BOOL4 v179;
  unint64_t v180;
  unsigned int v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  uint64_t *v188;
  int v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  unint64_t v203;
  unint64_t *v204;
  unint64_t v205;
  unint64_t v206;
  BOOL v207;
  BOOL v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t v226;
  unint64_t v227;
  int v228;
  uint64_t v229;
  unint64_t v230;
  unint64_t v231;
  uint64_t v232;
  unint64_t v233;
  unint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unsigned __int128 v237;
  unint64_t v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unsigned __int128 v247;
  unint64_t v248;
  uint64_t v249;
  unsigned int v250;
  uint64_t v251;
  uint64_t v252;
  unint64_t v253;
  unsigned int v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  unint64_t v267;
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  unint64_t *v271;
  unint64_t v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  unint64_t v278;
  unint64_t v279;
  unint64_t v280;
  unint64_t v281;
  unsigned int v282;
  unint64_t v283;
  unint64_t v284;
  uint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  unsigned __int128 v291;
  unint64_t v292;
  uint64_t v293;
  unint64_t v294;
  unint64_t v295;
  unint64_t v296;
  unint64_t v297;
  unint64_t v298;
  unint64_t v299;
  unint64_t v300;
  unsigned __int128 v301;
  uint64_t v302;
  unint64_t v303;
  unsigned int v304;
  uint64_t v305;
  int v306;
  int v307;
  uint64_t v308;
  signed __int128 v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  unint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unint64_t v319;
  unint64_t v320;
  unint64_t v321;
  unsigned __int128 v322;
  unint64_t v323;
  unint64_t v324;
  unint64_t v325;
  uint64_t v326;
  uint64_t v327;
  unint64_t v328;
  unint64_t v329;
  unint64_t v330;
  uint64_t v331;
  unint64_t v332;
  unint64_t v333;
  unint64_t v334;
  unint64_t v335;
  unint64_t v336;
  unint64_t v337;
  unint64_t v338;
  unint64_t v339;
  unint64_t v340;
  unint64_t v341;
  unint64_t v342;
  unint64_t v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t v346;
  unint64_t v347;
  unint64_t v348;
  unint64_t v349;
  unint64_t v350;
  uint64_t v351;
  unint64_t v352;
  unint64_t v353;
  uint64_t v354;
  unint64_t v355;
  unint64_t v356;
  unint64_t v357;
  unint64_t v358;
  unint64_t v359;
  unint64_t v360;
  uint64_t v361;
  unint64_t v362;
  unsigned __int128 v363;
  _BOOL4 v364;
  uint64_t v365;
  int v366;
  int v367;
  unsigned __int128 v368;
  unint64_t v369;
  int v370;
  uint64_t v371;
  int v372;
  int v373;
  _BOOL4 v375;
  _BOOL4 v376;
  BOOL v377;
  uint64_t v378;
  unint64_t v379;
  uint64_t v381;
  int v382;
  int v383;
  unint64_t v384;
  unint64_t v385;
  unint64_t v386;
  unint64_t v387;
  unint64_t v388;
  unint64_t v389;
  unint64_t v390;
  unint64_t v391;
  unint64_t v392;
  unint64_t v393;
  unint64_t v394;
  unint64_t v395;
  uint64_t v396;
  uint64_t v397;
  unint64_t v398;
  unint64_t v399;
  int v400;
  int v401;
  int v402;
  char v403;
  unint64_t v404;
  unint64_t v405;
  unint64_t v406;
  unint64_t v407;
  unint64_t v408;
  unint64_t v409;
  unint64_t v410;
  unint64_t v411;
  unint64_t v412;
  unint64_t v413;
  unint64_t v414;
  unint64_t v415;
  unint64_t v416;
  unint64_t v417;
  unsigned __int128 v418;
  unint64_t v419;
  unint64_t v420;
  unint64_t v421;
  unint64_t v422;
  unint64_t v423;
  unint64_t v424;
  unint64_t v425;
  unint64_t v426;
  unint64_t v427;
  unint64_t v428;
  unint64_t v429;
  unint64_t v430;
  unsigned __int128 v431;
  unint64_t v432;
  uint64_t v433;
  unsigned int v434;
  uint64_t v435;
  unint64_t v436;
  unint64_t v437;
  unint64_t *v438;
  unint64_t v439;
  unint64_t v440;
  uint64_t v441;
  int v442;
  unint64_t v443;
  int v444;
  unint64_t v445;
  int v446;
  int v447;
  unint64_t v449;
  unint64_t v450;
  unint64_t v451;
  unint64_t v452;
  unint64_t v453;
  unint64_t v454;
  unint64_t v455;
  unint64_t v456;
  unint64_t v457;
  BOOL v459;
  BOOL v460;
  BOOL v461;
  BOOL v462;
  BOOL v463;
  unint64_t v464;
  unint64_t v465;
  unint64_t v466;
  unint64_t v467;
  unint64_t v468;
  unint64_t v469;
  int v470;
  uint64_t v472;
  unint64_t v473;
  unint64_t *v474;
  unint64_t v475;
  unint64_t v476;
  unint64_t v477;
  int v478;
  BOOL v479;
  BOOL v480;
  uint64_t v481;
  int v482;
  unint64_t v483;
  unint64_t v484;
  unint64_t v485;
  _BOOL4 v486;
  BOOL v487;
  BOOL v488;
  BOOL v489;
  BOOL v490;
  BOOL v491;
  unint64_t v492;
  unint64_t v493;
  unint64_t v494;
  unint64_t v495;
  unint64_t v496;
  unint64_t v497;
  unint64_t v498;
  unint64_t v499;
  unint64_t v500;
  _BOOL4 v501;
  _BOOL4 v502;
  BOOL v503;
  BOOL v504;
  BOOL v505;
  BOOL v506;
  BOOL v507;
  _BOOL4 v508;
  unint64_t v509;
  int v510;
  unint64_t v511;
  unint64_t v512;
  unint64_t v513;
  uint64_t v514;
  unint64_t v515;
  unint64_t v516;
  uint64_t v517;
  uint64_t v518;
  char v522;
  BOOL v523;
  BOOL v524;
  char v525;
  BOOL v526;
  int v527;
  uint64_t v528;
  uint64_t v529;
  int *v530;
  unint64_t v531;
  _BOOL4 v532;
  _BOOL4 v533;

  v6 = a2 & 0x8000000000000000;
  v7 = a4 & 0x8000000000000000;
  if ((~a2 & 0x7800000000000000) == 0 || (a4 & 0x7800000000000000) == 0x7800000000000000)
  {
    if ((a2 & 0x7C00000000000000) == 0x7C00000000000000)
    {
      if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
        || result > 0x38C15B09FFFFFFFFLL && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
      {
        result = 0;
        a2 &= 0xFFFFC00000000000;
      }
      if ((~a2 & 0x7E00000000000000) == 0 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
        *a6 |= 1u;
      return result;
    }
    if ((a4 & 0x7C00000000000000) != 0x7C00000000000000)
    {
      if ((a2 & 0x7C00000000000000) != 0x7800000000000000)
        return 0;
      if ((a4 & 0x7C00000000000000) != 0x7800000000000000 || v6 == v7)
        return 0;
      result = 0;
      *a6 |= 1u;
      return result;
    }
    if ((a4 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || (a4 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a3 > 0x38C15B09FFFFFFFFLL)
    {
      a3 = 0;
      a4 &= 0xFFFFC00000000000;
    }
    if ((~a4 & 0x7E00000000000000) == 0)
      *a6 |= 1u;
    return a3;
  }
  if ((~a2 & 0x6000000000000000) == 0)
  {
    v9 = 0;
    v10 = 0;
    v11 = 4 * a2;
    goto LABEL_19;
  }
  v10 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFuLL) <= 0x1ED09BEAD87C0)
  {
    if (result <= 0x378D8E63FFFFFFFFLL)
    {
      v9 = result;
      goto LABEL_18;
    }
    v9 = result;
    v11 = a2;
    if (v10 != 0x1ED09BEAD87C0)
      goto LABEL_19;
  }
  v9 = 0;
  v10 = 0;
LABEL_18:
  v11 = a2;
LABEL_19:
  if ((~a4 & 0x6000000000000000) == 0)
  {
    v12 = 0;
    v13 = 0;
    v14 = 4 * a4;
    goto LABEL_35;
  }
  v13 = a4 & 0x1FFFFFFFFFFFFLL;
  if ((a4 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
  {
LABEL_33:
    v12 = 0;
    v13 = 0;
    goto LABEL_34;
  }
  if ((a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0)
  {
    v12 = a3;
    v14 = a4;
    if (a3 <= 0x378D8E63FFFFFFFFLL)
      goto LABEL_35;
    goto LABEL_33;
  }
  v12 = a3;
LABEL_34:
  v14 = a4;
LABEL_35:
  v15 = v11 & 0x7FFE000000000000;
  v16 = v14 & 0x7FFE000000000000;
  if (!(v10 | v9))
  {
    if (!(v13 | v12))
    {
      if (v6 && v7)
        return 0;
      else
        return 0;
    }
    v207 = v16 >= v15;
    v49 = v16 - v15;
    if (v49 == 0 || !v207)
      return a3;
    if (v12 >> 53)
      v50 = HIDWORD(v12);
    else
      v50 = v12;
    v51 = -1023;
    if (v12 >> 53)
      v51 = -991;
    if (v13)
    {
      v50 = v13;
      v51 = -959;
    }
    v52 = ((COERCE_UNSIGNED_INT64((double)v50) >> 52) & 0x7FF) + v51;
    v53 = *((_DWORD *)&__bid_nr_digits + 8 * v52);
    if (!v53)
    {
      v54 = (char *)&__bid_nr_digits + 32 * v52;
      v53 = *((_DWORD *)v54 + 6);
      v55 = *((_QWORD *)v54 + 1);
      if (v13 > v55 || v13 == v55 && v12 >= *((_QWORD *)&__bid_nr_digits + 4 * v52 + 2))
        ++v53;
    }
    v56 = v49 >> 49;
    if (34 - v53 < (int)v56)
      LODWORD(v56) = 34 - v53;
    if ((_DWORD)v56)
    {
      if (v53 > 19)
      {
        return (__bid_ten2k64[(int)v56] * v12) | ((unint64_t)(__bid_ten2k64[(int)v56] * HIDWORD(v12) + HIDWORD(__bid_ten2k64[(int)v56]) * v12 + ((__bid_ten2k64[(int)v56] * (unint64_t)v12) >> 32)) << 32);
      }
      else if ((int)v56 > 19)
      {
        v226 = __bid_ten2k128[2 * (v56 - 20)];
        return (v226 * v12) | ((unint64_t)(HIDWORD(v226) * v12
                                                                            + v226 * HIDWORD(v12)
                                                                            + ((v226
                                                                              * (unint64_t)v12) >> 32)) << 32);
      }
      else
      {
        return (__bid_ten2k64[(int)v56] * v12) | ((unint64_t)(HIDWORD(__bid_ten2k64[(int)v56]) * v12 + __bid_ten2k64[(int)v56] * HIDWORD(v12) + ((__bid_ten2k64[(int)v56] * (unint64_t)v12) >> 32)) << 32);
      }
    }
    return a3;
  }
  if (!(v13 | v12))
  {
    v207 = v15 >= v16;
    v17 = v15 - v16;
    if (v17 != 0 && v207)
    {
      if (v9 >> 53)
        v18 = HIDWORD(v9);
      else
        v18 = v9;
      v19 = -1023;
      if (v9 >> 53)
        v19 = -991;
      if (v10)
      {
        v18 = v10;
        v19 = -959;
      }
      v20 = ((COERCE_UNSIGNED_INT64((double)v18) >> 52) & 0x7FF) + v19;
      v21 = *((_DWORD *)&__bid_nr_digits + 8 * v20);
      if (!v21)
      {
        v22 = (char *)&__bid_nr_digits + 32 * v20;
        v21 = *((_DWORD *)v22 + 6);
        v23 = *((_QWORD *)v22 + 1);
        if (v10 > v23 || v10 == v23 && v9 >= *((_QWORD *)&__bid_nr_digits + 4 * v20 + 2))
          ++v21;
      }
      v24 = v17 >> 49;
      if (34 - v21 < (int)v24)
        LODWORD(v24) = 34 - v21;
      if ((_DWORD)v24)
      {
        if (v21 > 19)
        {
          return (__bid_ten2k64[(int)v24] * v9) | ((unint64_t)(__bid_ten2k64[(int)v24] * HIDWORD(v9) + HIDWORD(__bid_ten2k64[(int)v24]) * v9 + ((__bid_ten2k64[(int)v24] * (unint64_t)v9) >> 32)) << 32);
        }
        else if ((int)v24 > 19)
        {
          v97 = __bid_ten2k128[2 * (v24 - 20)];
          return (v97 * v9) | ((unint64_t)(HIDWORD(v97) * v9
                                                                            + v97 * HIDWORD(v9)
                                                                            + ((v97
                                                                              * (unint64_t)v9) >> 32)) << 32);
        }
        else
        {
          return (__bid_ten2k64[(int)v24] * v9) | ((unint64_t)(HIDWORD(__bid_ten2k64[(int)v24]) * v9 + __bid_ten2k64[(int)v24] * HIDWORD(v9) + ((__bid_ten2k64[(int)v24] * (unint64_t)v9) >> 32)) << 32);
        }
      }
    }
    return result;
  }
  if (v15 < v16)
    v25 = v9;
  else
    v25 = v12;
  if (v15 < v16)
    v26 = v12;
  else
    v26 = v9;
  if (v15 < v16)
    v27 = v10;
  else
    v27 = v13;
  if (v15 < v16)
    v28 = v13;
  else
    v28 = v10;
  if (v15 < v16)
    v29 = v15;
  else
    v29 = v16;
  if (v15 < v16)
    v30 = v16;
  else
    v30 = v15;
  if (v15 < v16)
    v31 = v6;
  else
    v31 = a4 & 0x8000000000000000;
  if (v15 < v16)
    v32 = a4 & 0x8000000000000000;
  else
    v32 = v6;
  v33 = HIDWORD(v26);
  if (v26 >> 53)
    v34 = HIDWORD(v26);
  else
    v34 = v26;
  v35 = -1023;
  if (v26 >> 53)
    v36 = -991;
  else
    v36 = -1023;
  if (v28)
  {
    v34 = v28;
    v36 = -959;
  }
  v37 = ((COERCE_UNSIGNED_INT64((double)v34) >> 52) & 0x7FF) + v36;
  v38 = *((_DWORD *)&__bid_nr_digits + 8 * v37);
  if (!v38)
  {
    v39 = (char *)&__bid_nr_digits + 32 * v37;
    v38 = *((_DWORD *)v39 + 6);
    v40 = *((_QWORD *)v39 + 1);
    if (v28 > v40 || v28 == v40 && v26 >= *((_QWORD *)&__bid_nr_digits + 4 * v37 + 2))
      ++v38;
  }
  v41 = HIDWORD(v25);
  if (v25 >> 53)
    v35 = -991;
  else
    v41 = v25;
  if (v27)
    v42 = v27;
  else
    v42 = v41;
  if (v27)
    v35 = -959;
  v43 = ((COERCE_UNSIGNED_INT64((double)v42) >> 52) & 0x7FF) + v35;
  v44 = *((_DWORD *)&__bid_nr_digits + 8 * v43);
  if (!v44)
  {
    v45 = (char *)&__bid_nr_digits + 32 * v43;
    v44 = *((_DWORD *)v45 + 6);
    v46 = *((_QWORD *)v45 + 1);
    if (v27 > v46 || v27 == v46 && v25 >= *((_QWORD *)&__bid_nr_digits + 4 * v43 + 2))
      ++v44;
  }
  v47 = v38 + (v30 >> 49) - (v44 + (v29 >> 49));
  if (v47 >= 34)
  {
    if (v47 == 34)
    {
      if (v32 == v31)
        goto LABEL_273;
      if (v38 > 20)
      {
        v188 = &__bid_ten2k128[2 * (v38 - 21)];
        if (v28 != v188[1])
          goto LABEL_273;
        v48 = *v188;
      }
      else
      {
        if (v28)
          goto LABEL_273;
        v48 = __bid_ten2k64[v38 - 1];
      }
      if (v26 == v48)
      {
        v189 = 35 - v38;
        if (35 - v38 < 20)
        {
          if (v38 > 19)
          {
            v390 = __bid_ten2k64[v189];
            v391 = v390 * v28;
            v392 = HIDWORD(v390);
            v393 = HIDWORD(v390) * (unint64_t)v26;
            v394 = v390 * (unint64_t)v26;
            v395 = v390 * (unint64_t)HIDWORD(v26) + v393 + HIDWORD(v394);
            v195 = v394 | ((unint64_t)v395 << 32);
            v196 = v391 + v392 * (unint64_t)HIDWORD(v26) + HIDWORD(v393) + HIDWORD(v395);
          }
          else
          {
            v331 = __bid_ten2k64[v189];
            v332 = v331 * (unint64_t)HIDWORD(v26);
            v333 = v331 * (unint64_t)v26;
            v334 = HIDWORD(v332) + HIDWORD(v331) * (unint64_t)HIDWORD(v26);
            v335 = HIDWORD(v331) * (unint64_t)v26 + v332 + HIDWORD(v333);
            v196 = v334 + HIDWORD(v335);
            v195 = v333 | ((unint64_t)v335 << 32);
          }
        }
        else
        {
          v190 = __bid_ten2k128[2 * (15 - v38)];
          v191 = HIDWORD(v190);
          v192 = v190 * (unint64_t)HIDWORD(v26);
          v193 = v190 * (unint64_t)v26;
          v194 = HIDWORD(v190) * (unint64_t)v26 + v192 + HIDWORD(v193);
          v195 = v193 | ((unint64_t)v194 << 32);
          v196 = __bid_ten2k128[2 * (15 - v38) + 1] * v26
               + v191 * (unint64_t)HIDWORD(v26)
               + HIDWORD(v192)
               + HIDWORD(v194);
        }
        v396 = (v44 - 2);
        if (v44 < 2)
        {
          v400 = 0;
          v401 = 0;
          goto LABEL_548;
        }
        if (v44 > 0x14)
        {
          v399 = (__bid_midpoint128[v44 - 21] + __PAIR128__(v27, v25)) >> 64;
          v398 = *(_QWORD *)&__bid_midpoint128[v44 - 21] + v25;
        }
        else
        {
          v397 = __bid_midpoint64[v396];
          v398 = v397 + v25;
          if (__CFADD__(v397, v25))
            v399 = v27 + 1;
          else
            v399 = v27;
        }
        v404 = HIDWORD(v398);
        v406 = __bid_ten2mk128[2 * v396];
        v405 = __bid_ten2mk128[2 * v396 + 1];
        v407 = HIDWORD(v405);
        v408 = v405 * (unint64_t)HIDWORD(v398);
        v409 = HIDWORD(v408) + HIDWORD(v405) * (unint64_t)HIDWORD(v398);
        v410 = HIDWORD(v405) * (unint64_t)v398
             + v408
             + ((v405 * (unint64_t)v398) >> 32);
        v411 = HIDWORD(v410);
        v412 = (v405 * v398) | ((unint64_t)v410 << 32);
        v413 = HIDWORD(v406);
        v414 = v406 * (unint64_t)HIDWORD(v398);
        v415 = v406 * (unint64_t)v398;
        v416 = HIDWORD(v406) * (unint64_t)v398 + v414 + HIDWORD(v415);
        v417 = v415 | ((unint64_t)v416 << 32);
        v418 = __PAIR128__(v409, v412)
             + __PAIR128__(v411, HIDWORD(v414) + HIDWORD(v406) * (unint64_t)v404 + HIDWORD(v416));
        v419 = HIDWORD(v399);
        LODWORD(v412) = v399;
        v420 = v405 * (unint64_t)HIDWORD(v399);
        v421 = v405 * (unint64_t)v399;
        v422 = v407 * (unint64_t)v399;
        v423 = HIDWORD(v420) + v407 * (unint64_t)HIDWORD(v399);
        v424 = v422 + v420 + HIDWORD(v421);
        v425 = HIDWORD(v424);
        v426 = v421 | ((unint64_t)v424 << 32);
        v427 = v406 * (unint64_t)HIDWORD(v399);
        v428 = v406 * (unint64_t)v399;
        v429 = HIDWORD(v406) * (unint64_t)v412 + v427 + HIDWORD(v428);
        v430 = v428 | ((unint64_t)v429 << 32);
        v431 = __PAIR128__(v423, v426)
             + __PAIR128__(v425, HIDWORD(v427) + v413 * (unint64_t)v419 + HIDWORD(v429));
        v432 = v418 + v430;
        v207 = __CFADD__(__CFADD__((_QWORD)v418, v430), (_QWORD)v431);
        v433 = __CFADD__((_QWORD)v418, v430) + (_QWORD)v431;
        v434 = v207;
        v25 = *((_QWORD *)&v418 + 1) + v433;
        if (__CFADD__(*((_QWORD *)&v418 + 1), v433))
          v435 = 1;
        else
          v435 = v434;
        v27 = *((_QWORD *)&v431 + 1) + v435;
        if (v44 < 5)
        {
          if (v432 <= 0x8000000000000000)
          {
            LODWORD(v436) = 0;
            v437 = 0;
            v400 = 1;
            if (!v417 || v432 != 0x8000000000000000)
              goto LABEL_891;
          }
          v438 = (unint64_t *)&__bid_ten2mk128trunc[v396];
          v439 = v438[1];
          if ((v432 ^ 0x8000000000000000) > v439)
          {
            v437 = 0;
LABEL_562:
            v440 = 0;
LABEL_563:
            v400 = 0;
LABEL_564:
            LODWORD(v436) = 1;
LABEL_892:
            v401 = v400;
            *a6 |= 0x20u;
            v400 = v436;
LABEL_893:
            v402 = 0;
            if (!(v432 | v417) || v437 || v440)
            {
              v403 = 0;
              goto LABEL_906;
            }
            if (__PAIR128__(v432, v417) <= __bid_ten2mk128trunc[v396])
            {
              v400 = 0;
              v401 = 0;
              if ((((_DWORD)v25 + (_DWORD)v195) & 1) != 0)
              {
                v402 = 0;
                v172 = v25-- == 0;
                v514 = v172;
                v27 -= v514;
                v403 = 1;
              }
              else
              {
                v403 = 0;
                v402 = 1;
              }
LABEL_906:
              v515 = v196 - v27;
              v207 = v195 >= v25;
              v516 = v195 - v25;
              v517 = !v207;
              v518 = v515 - v517;
              if (v518 < 0)
              {
                v172 = v516 == 0;
                v516 = -(uint64_t)v516;
                if (v172)
                  v518 = -v518;
                else
                  v518 = ~v518;
                v32 = v31;
              }
              if (!a5)
                return v516;
              if (v32)
              {
                if (a5 != 1 || !v401)
                {
                  if (a5 != 4 && a5 != 1)
                    v402 = 0;
                  if (v402 != 1)
                    goto LABEL_941;
                }
              }
              else if (a5 != 2 || !v401)
              {
                if (a5 != 4 && a5 != 2)
                  LOBYTE(v402) = 0;
                if ((v402 & 1) == 0)
                {
LABEL_941:
                  v522 = v403 ^ 1;
                  if (v400)
                    v522 = 0;
                  if ((v522 & 1) == 0 && ((a5 & 0xFFFFFFFE) == 2 && v32 || (a5 & 0xFFFFFFFD) == 1 && !v32))
                  {
                    result = v516 - 1;
                    if ((__PAIR128__(v518, v516) - 1) >> 64 == 0x314DC6448D93 && v516 == 0x38C15B0A00000000)
                      return 0x378D8E63FFFFFFFFLL;
                    return result;
                  }
                  return v516;
                }
              }
              result = v516 + 1;
              if (v516 == -1)
                ++v518;
              if (v516 == 0x378D8E63FFFFFFFFLL && v518 == 0x1ED09BEAD87C0)
                return 0x38C15B0A00000000;
              return result;
            }
LABEL_548:
            v402 = 0;
            v403 = 0;
            goto LABEL_906;
          }
          if ((v432 ^ 0x8000000000000000) == v439)
          {
            v400 = 0;
            v437 = 0;
            if (v417 < *v438)
            {
              v440 = 0;
              goto LABEL_755;
            }
            LODWORD(v436) = 1;
LABEL_891:
            v440 = 0;
            goto LABEL_892;
          }
          v437 = 0;
          goto LABEL_866;
        }
        v441 = __bid_maskhigh128[v396];
        if (v44 >= 0x18)
          v437 = v441 & v27;
        else
          v437 = 0;
        if (v44 >= 0x18)
          v441 = -1;
        v440 = v25 & v441;
        v442 = __bid_shiftright128[v396];
        if (v442 > 63)
        {
          v25 = v27 >> v442;
          v27 = 0;
        }
        else
        {
          v25 = (v27 << -(char)v442) | (v25 >> v442);
          v27 >>= v442;
        }
        if (v44 <= 0x17)
        {
          v473 = __bid_onehalf128[v396];
          if (!v437 && v440 <= v473)
          {
            LODWORD(v436) = 0;
            v400 = 1;
            if (v440 != v473 || (v473 = v440, !(v432 | v417)))
            {
              v437 = 0;
              goto LABEL_892;
            }
          }
          v400 = 0;
          LODWORD(v436) = 1;
          if (v437 != v473 > v440 || v440 != v473)
            goto LABEL_892;
          v474 = (unint64_t *)&__bid_ten2mk128trunc[v396];
          v475 = v474[1];
          if (v432 > v475)
            goto LABEL_563;
          if (v432 != v475)
          {
LABEL_867:
            v400 = 0;
            v401 = 0;
            goto LABEL_893;
          }
          v400 = 0;
          goto LABEL_699;
        }
        v476 = __bid_onehalf128[v396];
        if (v437 <= v476)
        {
          if (v437 == v476)
          {
            v436 = v432 | v417 | v440;
            if (v436)
              goto LABEL_694;
          }
          else
          {
            LODWORD(v436) = 0;
          }
          v400 = 1;
          goto LABEL_892;
        }
LABEL_694:
        v400 = 0;
        LODWORD(v436) = 1;
        if (v437 != v476 || v440)
          goto LABEL_892;
        v474 = (unint64_t *)&__bid_ten2mk128trunc[v396];
        v477 = v474[1];
        if (v432 > v477)
          goto LABEL_562;
        if (v432 != v477)
        {
LABEL_866:
          v440 = 0;
          goto LABEL_867;
        }
        v400 = 0;
        v440 = 0;
LABEL_699:
        if (v417 > *v474)
          goto LABEL_564;
LABEL_755:
        v401 = 0;
        goto LABEL_893;
      }
LABEL_273:
      if (v44 <= 19)
      {
        v197 = __bid_midpoint64[v44 - 1];
        if (v25 >= v197)
        {
          if (v25 == v197)
          {
            v198 = v26 & 1;
            if (v38 < 34 || (v26 & 1) == 0)
            {
              if (v38 <= 33)
              {
                v199 = (34 - v38);
                if (v38 > 19)
                {
                  v449 = __bid_ten2k64[v199];
                  v450 = v449 * v28;
                  v451 = HIDWORD(v449);
                  v452 = HIDWORD(v449) * (unint64_t)v26;
                  v453 = v449 * (unint64_t)v26;
                  v454 = v449 * (unint64_t)v33 + v452 + HIDWORD(v453);
                  v26 = v453 | ((unint64_t)v454 << 32);
                  v28 = v450 + v451 * (unint64_t)v33 + HIDWORD(v452) + HIDWORD(v454);
                }
                else if (v38 < 15)
                {
                  v483 = __bid_ten2k64[15 - v38] * v26;
                  v484 = 2313682944 * v483;
                  v485 = (-1966660860 * v483) + 2313682944 * HIDWORD(v483) + HIDWORD(v484);
                  v28 = ((2328306436u * (unint64_t)v483) >> 32)
                      + 2328306436 * HIDWORD(v483)
                      + HIDWORD(v485);
                  v26 = v484 & 0xFFF80000 | (v485 << 32);
                }
                else
                {
                  v200 = __bid_ten2k64[v199];
                  v201 = HIDWORD(v200) * (unint64_t)v26;
                  v202 = v200 * (unint64_t)v26;
                  v203 = v200 * (unint64_t)v33 + v201 + HIDWORD(v202);
                  v28 = HIDWORD(v201) + HIDWORD(v200) * (unint64_t)v33 + HIDWORD(v203);
                  v26 = v202 | ((unint64_t)v203 << 32);
                }
                v30 -= v199 << 49;
                v198 = v26 & 1;
              }
              v486 = a5 != 0;
              if (v32 != v31)
                v486 = 1;
              if (!v198)
                v486 = 1;
              v487 = v32 == v31 && a5 == 4;
              if (!v487 && v486 && (a5 != 2 || v32 || v31) && (a5 != 1 || !v32 || !v31))
              {
                if (a5 || v32 == v31 || !v198)
                  goto LABEL_785;
LABEL_843:
                if ((__PAIR128__(v28, v26) - 1) >> 64 == 0x314DC6448D93 && v26 == 0x38C15B0A00000000)
                  v26 = 0x378D8E63FFFFFFFFLL;
                else
                  --v26;
LABEL_847:
                *a6 |= 0x20u;
                return v26;
              }
LABEL_420:
              v207 = __CFADD__(v26++, 1);
              if (v207)
                ++v28;
              if (v26 == 0x378D8E6400000000 && v28 == 0x1ED09BEAD87C0)
              {
                if (v30 == 0x5FFE000000000000)
                {
                  v26 = 0;
                  *a6 |= 8u;
                }
                else
                {
                  v26 = 0x38C15B0A00000000;
                }
              }
              goto LABEL_847;
            }
          }
          else if (v38 <= 33)
          {
            v311 = (34 - v38);
            if (v38 > 19)
            {
              v384 = __bid_ten2k64[v311];
              v385 = v384 * v28;
              v386 = HIDWORD(v384);
              v387 = HIDWORD(v384) * (unint64_t)v26;
              v388 = v384 * (unint64_t)v26;
              v389 = v384 * (unint64_t)v33 + v387 + HIDWORD(v388);
              v26 = v388 | ((unint64_t)v389 << 32);
              v28 = v385 + v386 * (unint64_t)v33 + HIDWORD(v387) + HIDWORD(v389);
            }
            else if (v38 < 15)
            {
              v455 = __bid_ten2k64[15 - v38] * v26;
              v456 = 2313682944 * v455;
              v457 = (-1966660860 * v455) + 2313682944 * HIDWORD(v455) + HIDWORD(v456);
              v28 = ((2328306436u * (unint64_t)v455) >> 32)
                  + 2328306436 * HIDWORD(v455)
                  + HIDWORD(v457);
              v26 = v456 & 0xFFF80000 | (v457 << 32);
            }
            else
            {
              v312 = __bid_ten2k64[v311];
              v313 = HIDWORD(v312) * (unint64_t)v26;
              v314 = v312 * (unint64_t)v26;
              v315 = v312 * (unint64_t)v33 + v313 + HIDWORD(v314);
              v28 = HIDWORD(v313) + HIDWORD(v312) * (unint64_t)v33 + HIDWORD(v315);
              v26 = v314 | ((unint64_t)v315 << 32);
            }
            v30 -= v311 << 49;
            if (v28 == 0x1ED09BEAD87C0 && v26 == 0x378D8E6400000000)
            {
              v26 = 0x38C15B0A00000000;
              v28 = 0x314DC6448D93;
              v30 += 0x2000000000000;
            }
          }
          if (!a5 && v32 != v31)
            goto LABEL_843;
          if (a5 == 4 && v32 != v31 && v25 != v197)
            goto LABEL_843;
          if (a5 == 1 && !v32 && v31)
            goto LABEL_843;
          v459 = a5 != 2 || v32 == 0;
          v460 = !v459 && v31 == 0;
          v461 = !v460;
          v462 = v32 != v31 && a5 == 3;
          if (v462 || !v461)
            goto LABEL_843;
          v463 = a5 == 4 || a5 == 0;
          if ((!v463 || v32 != v31) && (a5 != 1 || !v32 || !v31) && (a5 != 2 || v32 || v31))
            goto LABEL_847;
          goto LABEL_420;
        }
LABEL_302:
        if (v38 <= 33)
        {
          v215 = (34 - v38);
          if (v38 > 19)
          {
            v261 = __bid_ten2k64[v215];
            v262 = v261 * v28;
            v263 = HIDWORD(v261);
            v264 = HIDWORD(v261) * (unint64_t)v26;
            v265 = v261 * (unint64_t)v26;
            v266 = v261 * (unint64_t)v33 + v264 + HIDWORD(v265);
            v26 = v265 | ((unint64_t)v266 << 32);
            v28 = v262 + v263 * (unint64_t)v33 + HIDWORD(v264) + HIDWORD(v266);
          }
          else if (v38 < 15)
          {
            v323 = __bid_ten2k64[15 - v38] * v26;
            v324 = 2313682944 * v323;
            v325 = (-1966660860 * v323) + 2313682944 * HIDWORD(v323) + HIDWORD(v324);
            v28 = ((2328306436u * (unint64_t)v323) >> 32)
                + 2328306436 * HIDWORD(v323)
                + HIDWORD(v325);
            v26 = v324 & 0xFFF80000 | (v325 << 32);
          }
          else
          {
            v216 = __bid_ten2k64[v215];
            v217 = HIDWORD(v216) * (unint64_t)v26;
            v218 = v216 * (unint64_t)v26;
            v219 = v216 * (unint64_t)v33 + v217 + HIDWORD(v218);
            v28 = HIDWORD(v217) + HIDWORD(v216) * (unint64_t)v33 + HIDWORD(v219);
            v26 = v218 | ((unint64_t)v219 << 32);
          }
          v30 -= v215 << 49;
        }
        if (!a5)
          goto LABEL_847;
        if ((a5 != 1 || !v32 || !v31) && (a5 != 2 || v32 || v31))
        {
LABEL_785:
          if (a5 != 1 || v32 || !v31)
          {
            v488 = a5 != 2 || v32 == 0;
            v489 = !v488 && v31 == 0;
            v490 = !v489;
            v491 = v32 != v31 && a5 == 3;
            if (!v491 && v490)
              goto LABEL_847;
          }
          goto LABEL_843;
        }
        goto LABEL_420;
      }
      v204 = (unint64_t *)&__bid_midpoint128[v44 - 20];
      v205 = v204[1];
      if (v27 < v205)
        goto LABEL_302;
      v206 = *v204;
      v207 = v27 != v205 || v25 >= v206;
      if (!v207)
        goto LABEL_302;
      v208 = v27 == v205 && v25 == v206;
      v209 = v208;
      if (!v208)
      {
        if (v38 <= 33)
        {
          v326 = (34 - v38);
          if (v38 > 19)
          {
            v464 = __bid_ten2k64[v326];
            v465 = v464 * v28;
            v466 = HIDWORD(v464);
            v467 = HIDWORD(v464) * (unint64_t)v26;
            v468 = v464 * (unint64_t)v26;
            v469 = v464 * (unint64_t)v33 + v467 + HIDWORD(v468);
            v26 = v468 | ((unint64_t)v469 << 32);
            v28 = v465 + v466 * (unint64_t)v33 + HIDWORD(v467) + HIDWORD(v469);
          }
          else if (v38 < 15)
          {
            v498 = __bid_ten2k64[15 - v38] * v26;
            v499 = 2313682944 * v498;
            v500 = (-1966660860 * v498) + 2313682944 * HIDWORD(v498) + HIDWORD(v499);
            v28 = ((2328306436u * (unint64_t)v498) >> 32)
                + 2328306436 * HIDWORD(v498)
                + HIDWORD(v500);
            v26 = v499 & 0xFFF80000 | (v500 << 32);
          }
          else
          {
            v327 = __bid_ten2k64[v326];
            v328 = HIDWORD(v327) * (unint64_t)v26;
            v329 = v327 * (unint64_t)v26;
            v330 = v327 * (unint64_t)v33 + v328 + HIDWORD(v329);
            v28 = HIDWORD(v328) + HIDWORD(v327) * (unint64_t)v33 + HIDWORD(v330);
            v26 = v329 | ((unint64_t)v330 << 32);
          }
          v30 -= v326 << 49;
        }
        goto LABEL_806;
      }
      if (v38 >= 34 && (v26 & 1) != 0)
      {
LABEL_806:
        if (!a5 && v32 != v31)
          goto LABEL_843;
        if (a5 != 4 || v32 == v31)
        {
          v501 = v32 != 0;
          v502 = v31 != 0;
          if (a5 == 1 && !v32 && v31)
            goto LABEL_843;
          v503 = a5 != 2 || v32 == 0;
          v504 = !v503 && v31 == 0;
          v505 = !v504;
          v506 = v32 != v31 && a5 == 3;
          if (v506 || !v505)
            goto LABEL_843;
        }
        else
        {
          if (!v209)
            goto LABEL_843;
          v501 = v32 != 0;
          v502 = v31 != 0;
        }
        v507 = a5 == 4 || a5 == 0;
        if (!v507 || v32 != v31)
        {
          v508 = a5 == 1 && v501;
          if (!v508 || !v502)
          {
            if (a5 != 2)
              v501 = 1;
            if (v501 || v502)
              goto LABEL_847;
          }
        }
        goto LABEL_420;
      }
      if (v38 <= 33)
      {
        v210 = (34 - v38);
        if (v38 > 19)
        {
          v492 = __bid_ten2k64[v210];
          v493 = v492 * v28;
          v494 = HIDWORD(v492);
          v495 = HIDWORD(v492) * (unint64_t)v26;
          v496 = v492 * (unint64_t)v26;
          v497 = v492 * (unint64_t)v33 + v495 + HIDWORD(v496);
          v26 = v496 | ((unint64_t)v497 << 32);
          v28 = v493 + v494 * (unint64_t)v33 + HIDWORD(v495) + HIDWORD(v497);
        }
        else if (v38 < 15)
        {
          v511 = __bid_ten2k64[15 - v38] * v26;
          v512 = 2313682944 * v511;
          v513 = (-1966660860 * v511) + 2313682944 * HIDWORD(v511) + HIDWORD(v512);
          v28 = ((2328306436u * (unint64_t)v511) >> 32)
              + 2328306436 * HIDWORD(v511)
              + HIDWORD(v513);
          v26 = v512 & 0xFFF80000 | (v513 << 32);
        }
        else
        {
          v211 = __bid_ten2k64[v210];
          v212 = HIDWORD(v211) * (unint64_t)v26;
          v213 = v211 * (unint64_t)v26;
          v214 = v211 * (unint64_t)v33 + v212 + HIDWORD(v213);
          v28 = HIDWORD(v212) + HIDWORD(v211) * (unint64_t)v33 + HIDWORD(v214);
          v26 = v213 | ((unint64_t)v214 << 32);
        }
        v30 -= v210 << 49;
      }
      if (a5)
      {
        if (a5 == 4)
        {
          if (v32 != v31)
            goto LABEL_975;
        }
        else if ((a5 != 2 || v32 || v31) && (a5 != 1 || !v32 || !v31))
        {
          if (a5 == 1 && !v32 && v31
            || (a5 == 2 ? (v523 = v32 == 0) : (v523 = 1),
                !v523 ? (v524 = v31 == 0) : (v524 = 0),
                v524 ? (v525 = 0) : (v525 = 1),
                v32 != v31 ? (v526 = a5 == 3) : (v526 = 0),
                v526 || (v525 & 1) == 0))
          {
            if ((__PAIR128__(v28, v26) - 1) >> 64 == 0x314DC6448D93 && v26 == 0x38C15B0A00000000)
              v26 = 0x378D8E63FFFFFFFFLL;
            else
              --v26;
          }
          goto LABEL_975;
        }
        v207 = __CFADD__(v26++, 1);
        if (v207)
          ++v28;
        if (v26 == 0x378D8E6400000000 && v28 == 0x1ED09BEAD87C0)
        {
          if (v30 == 0x5FFE000000000000)
          {
            v26 = 0;
            *a6 |= 8u;
          }
          else
          {
            v26 = 0x38C15B0A00000000;
          }
        }
      }
LABEL_975:
      *a6 |= 0x20u;
      return v26;
    }
    if (v38 <= 33)
    {
      v66 = (34 - v38);
      if (v38 > 19)
      {
        v220 = __bid_ten2k64[v66];
        v221 = v220 * v28;
        v222 = HIDWORD(v220);
        v223 = HIDWORD(v220) * (unint64_t)v26;
        v224 = v220 * (unint64_t)v26;
        v225 = v220 * (unint64_t)v33 + v223 + HIDWORD(v224);
        v26 = v224 | ((unint64_t)v225 << 32);
        v28 = v221 + v222 * (unint64_t)v33 + HIDWORD(v223) + HIDWORD(v225);
      }
      else if (v38 < 15)
      {
        v267 = __bid_ten2k64[15 - v38] * v26;
        v268 = 2313682944 * v267;
        v269 = (-1966660860 * v267) + 2313682944 * HIDWORD(v267) + HIDWORD(v268);
        v28 = ((2328306436u * (unint64_t)v267) >> 32)
            + 2328306436 * HIDWORD(v267)
            + HIDWORD(v269);
        v26 = v268 & 0xFFF80000 | (v269 << 32);
      }
      else
      {
        v67 = __bid_ten2k64[v66];
        v68 = HIDWORD(v67) * (unint64_t)v26;
        v69 = v67 * (unint64_t)v26;
        v70 = v67 * (unint64_t)v33 + v68 + HIDWORD(v69);
        v28 = HIDWORD(v68) + HIDWORD(v67) * (unint64_t)v33 + HIDWORD(v70);
        v26 = v69 | ((unint64_t)v70 << 32);
      }
      v30 -= v66 << 49;
    }
    result = 0x38C15B0A00000000;
    if ((a5 & 0xFFFFFFFB) != 0 || v47 != 35 || v28 != 0x314DC6448D93 || v26 != 0x38C15B0A00000000)
      goto LABEL_347;
    if (v32 == v31)
      goto LABEL_346;
    if (v44 > 19)
    {
      v271 = (unint64_t *)&__bid_midpoint128[v44 - 20];
      v272 = v271[1];
      if (v27 > v272)
      {
LABEL_345:
        v26 = 0x378D8E63FFFFFFFFLL;
        v30 -= 0x2000000000000;
        v28 = 0x1ED09BEAD87C0;
        if (!a5)
          goto LABEL_371;
LABEL_347:
        if (a5 == 1 && v32 && v31 || a5 == 2 && !v32 && !v31)
        {
          v273 = v26 + 1;
          if (v26 == -1)
            ++v28;
          if (v26 == 0x378D8E63FFFFFFFFLL && v28 == 0x1ED09BEAD87C0)
          {
            if (v30 == 0x5FFE000000000000)
            {
              result = 0;
              *a6 |= 8u;
            }
            goto LABEL_373;
          }
          goto LABEL_372;
        }
        if (a5 == 1 && !v32 && v31 || a5 == 2 && v32 && !v31 || a5 == 3 && v32 != v31)
        {
          v273 = v26 - 1;
          if ((__PAIR128__(v28, v26) - 1) >> 64 != 0x314DC6448D93 || v26 != 0x38C15B0A00000000)
          {
LABEL_372:
            result = v273;
            goto LABEL_373;
          }
          result = 0x378D8E63FFFFFFFFLL;
        }
        else
        {
LABEL_371:
          result = v26;
        }
LABEL_373:
        *a6 |= 0x20u;
        return result;
      }
      if (v27 != v272)
      {
LABEL_346:
        v26 = 0x38C15B0A00000000;
        v28 = 0x314DC6448D93;
        goto LABEL_347;
      }
      v270 = *v271;
    }
    else
    {
      v270 = __bid_midpoint64[v44 - 1];
    }
    if (v25 > v270)
      goto LABEL_345;
    goto LABEL_346;
  }
  if (v47 < 0)
  {
    v71 = (v30 >> 49) - (v29 >> 49);
    v72 = v71 - 20;
    if (v71 < 20)
    {
      if (v71 >= 1)
      {
        if (v38 > 19)
        {
          v274 = __bid_ten2k64[v71];
          v275 = v274 * v28;
          v276 = HIDWORD(v274);
          v277 = HIDWORD(v274) * (unint64_t)v26;
          v278 = v274 * (unint64_t)v26;
          v279 = v274 * (unint64_t)v33 + v277 + HIDWORD(v278);
          v26 = v278 | ((unint64_t)v279 << 32);
          v28 = v275 + v276 * (unint64_t)v33 + HIDWORD(v277) + HIDWORD(v279);
        }
        else
        {
          v89 = __bid_ten2k64[v71];
          v90 = v26;
          v91 = HIDWORD(v89);
          v92 = v89 * (unint64_t)HIDWORD(v26);
          v93 = v89 * (unint64_t)v26;
          v94 = HIDWORD(v89) * (unint64_t)v90;
          v95 = HIDWORD(v92) + v91 * (unint64_t)v33;
          v96 = v94 + v92 + HIDWORD(v93);
          v28 = v95 + HIDWORD(v96);
          v26 = v93 | ((unint64_t)v96 << 32);
        }
      }
    }
    else
    {
      v73 = __bid_ten2k128[2 * v72];
      v74 = __bid_ten2k128[2 * v72 + 1] * v26;
      v75 = v26;
      v76 = HIDWORD(v73);
      v77 = v73 * (unint64_t)HIDWORD(v26);
      v78 = v73 * (unint64_t)v26;
      v79 = HIDWORD(v73) * (unint64_t)v75 + v77 + HIDWORD(v78);
      v26 = v78 | ((unint64_t)v79 << 32);
      v28 = v74 + v76 * (unint64_t)v33 + HIDWORD(v77) + HIDWORD(v79);
    }
    if (v32 != v31)
    {
      v309 = __PAIR128__(v27 - v28, v25) - v26;
      v308 = *((_QWORD *)&v309 + 1);
      result = v309;
      if (v309 < 0)
      {
        result = v26 - v25;
        if (v25 == v26)
          v308 = -*((_QWORD *)&v309 + 1);
        else
          v308 = ~*((_QWORD *)&v309 + 1);
      }
      if (v308 | result)
        return result;
      return 0;
    }
    v280 = (__PAIR128__(v28, v26) + __PAIR128__(v27, v25)) >> 64;
    result = v26 + v25;
    if (v280 <= 0x1ED09BEAD87C0 && (result <= 0x378D8E63FFFFFFFFLL || v280 != 0x1ED09BEAD87C0))
      return result;
    if (result <= 0xFFFFFFFFFFFFFFFALL)
      v281 = (__PAIR128__(v28, v26) + __PAIR128__(v27, v25)) >> 64;
    else
      v281 = v280 + 1;
    v282 = result + 5;
    v283 = (result + 5) >> 32;
    v284 = 2576980377 * v283;
    v285 = HIDWORD(v284) + 429496729 * v283;
    v286 = 429496729 * (result + 5)
         + v284
         + ((2576980377u * (unint64_t)(result + 5)) >> 32);
    v287 = (-1717986919 * (result + 5)) | ((unint64_t)v286 << 32);
    v288 = 2576980480 * (result + 5);
    v289 = (-1717986816 * v283) + 2576980377 * v282 + HIDWORD(v288);
    v290 = v288 & 0xFFFFFE00 | (v289 << 32);
    v291 = __PAIR128__(v285, v287)
         + __PAIR128__(HIDWORD(v286), ((2576980480u * (unint64_t)v283) >> 32)+ 2576980377 * v283+ HIDWORD(v289));
    v292 = 2576980377 * HIDWORD(v281);
    v293 = HIDWORD(v292) + 429496729 * HIDWORD(v281);
    v294 = 429496729 * v281
         + v292
         + ((2576980377u * (unint64_t)v281) >> 32);
    v295 = (-1717986919 * v281) | ((unint64_t)v294 << 32);
    v296 = 2576980480 * v281;
    v297 = ((2576980480u * (unint64_t)HIDWORD(v281)) >> 32) + 2576980377 * HIDWORD(v281);
    v298 = (-1717986816 * HIDWORD(v281)) + 2576980377 * v281 + HIDWORD(v296);
    v299 = v297 + HIDWORD(v298);
    v300 = v296 & 0xFFFFFE00 | (v298 << 32);
    v301 = __PAIR128__(v293, v295) + __PAIR128__(HIDWORD(v294), v299);
    v302 = v300 + v291;
    v207 = __CFADD__(__CFADD__(v300, (_QWORD)v291), v295 + v299);
    v303 = __CFADD__(v300, (_QWORD)v291) + v295 + v299;
    v304 = v207;
    result = *((_QWORD *)&v291 + 1) + v303;
    if (__CFADD__(*((_QWORD *)&v291 + 1), v303))
      v305 = 1;
    else
      v305 = v304;
    if (v302 | v290)
    {
      if ((unint64_t)v302 < 0x1999999999999999
        || (v306 = 0, v290 < 0x999999999999999ALL) && v302 == 0x1999999999999999)
      {
        if ((result & 1) != 0)
        {
          v307 = 0;
          --result;
          v306 = 1;
        }
        else
        {
          v306 = 0;
          v307 = 1;
        }
      }
      else
      {
        v307 = 0;
      }
    }
    else
    {
      v306 = 0;
      v307 = 0;
    }
    v369 = v29 + 0x2000000000000;
    if ((a5 & 0xFFFFFFFB) == 0 && v29 == 0x5FFE000000000000)
      goto LABEL_709;
    if ((unint64_t)v302 <= 0x8000000000000000)
    {
      if (v290 && v302 == 0x8000000000000000)
      {
        v370 = 0;
        goto LABEL_470;
      }
    }
    else if ((v302 ^ 0x8000000000000000) <= 0x1999999999999999)
    {
      v370 = 0;
      if (v290 <= 0x9999999999999998 || (v302 ^ 0x8000000000000000) != 0x1999999999999999)
      {
LABEL_470:
        v371 = *((_QWORD *)&v301 + 1) + v305;
        if (((v306 | v301) & 1) != 0)
        {
          v372 = 0;
          v373 = 0;
        }
        else
        {
          if (v302 < 0)
            v373 = v370;
          else
            v373 = 0;
          if (v302 >= 0)
            v372 = v370;
          else
            v372 = 0;
        }
        if (!a5)
          return result;
        if (v31)
        {
          if (a5 != 1 || !v373)
          {
            if (a5 != 4 && a5 != 1)
              v306 = 0;
            if (v306 != 1)
            {
LABEL_572:
              if (((v372 == 0) & ~v307) == 0 && ((a5 & 0xFFFFFFFE) == 2 && v31 || (a5 & 0xFFFFFFFD) == 1 && !v31))
              {
                v381 = result - 1;
                if ((__PAIR128__(v371, result) - 1) >> 64 == 0x314DC6448D93 && result == 0x38C15B0A00000000)
                {
                  v381 = 0x378D8E63FFFFFFFFLL;
                  v369 = v29;
                }
              }
              else
              {
                v381 = result;
              }
LABEL_658:
              result = v381;
              if (v369 == 0x6000000000000000)
              {
                if (v31)
                  v470 = 1;
                else
                  v470 = 2;
                if (v470 == a5)
                  result = 0;
                else
                  result = 0x378D8E63FFFFFFFFLL;
                *a6 |= 0x28u;
              }
              return result;
            }
          }
        }
        else if (a5 != 2 || !v373)
        {
          if (a5 != 4 && a5 != 2)
            LOBYTE(v306) = 0;
          if ((v306 & 1) == 0)
            goto LABEL_572;
        }
        v381 = result + 1;
        if (result == -1)
          ++v371;
        if (result == 0x378D8E63FFFFFFFFLL && v371 == 0x1ED09BEAD87C0)
        {
          v381 = 0x38C15B0A00000000;
          v369 = v29 + 0x4000000000000;
        }
        goto LABEL_658;
      }
    }
    *a6 |= 0x20u;
    v370 = 1;
    goto LABEL_470;
  }
  if (v47 <= 33 - v44)
  {
    v80 = (v30 >> 49) - (v29 >> 49);
    v81 = v80 - 20;
    if (v80 < 20)
    {
      if (v80 >= 1)
      {
        if (v38 > 19)
        {
          v316 = __bid_ten2k64[v80];
          v317 = v316 * v28;
          v318 = HIDWORD(v316);
          v319 = HIDWORD(v316) * (unint64_t)v26;
          v320 = v316 * (unint64_t)v26;
          v321 = v316 * (unint64_t)v33 + v319 + HIDWORD(v320);
          v26 = v320 | ((unint64_t)v321 << 32);
          v28 = v317 + v318 * (unint64_t)v33 + HIDWORD(v319) + HIDWORD(v321);
        }
        else
        {
          v180 = __bid_ten2k64[v80];
          v181 = v26;
          v182 = HIDWORD(v180);
          v183 = v180 * (unint64_t)HIDWORD(v26);
          v184 = v180 * (unint64_t)v26;
          v185 = HIDWORD(v180) * (unint64_t)v181;
          v186 = HIDWORD(v183) + v182 * (unint64_t)v33;
          v187 = v185 + v183 + HIDWORD(v184);
          v28 = v186 + HIDWORD(v187);
          v26 = v184 | ((unint64_t)v187 << 32);
        }
      }
    }
    else
    {
      v82 = __bid_ten2k128[2 * v81];
      v83 = __bid_ten2k128[2 * v81 + 1] * v26;
      v84 = v26;
      v85 = HIDWORD(v82);
      v86 = v82 * (unint64_t)HIDWORD(v26);
      v87 = v82 * (unint64_t)v26;
      v88 = HIDWORD(v82) * (unint64_t)v84 + v86 + HIDWORD(v87);
      v26 = v87 | ((unint64_t)v88 << 32);
      v28 = v83 + v85 * (unint64_t)v33 + HIDWORD(v86) + HIDWORD(v88);
    }
    if (v32 == v31)
      return v26 + v25;
    v322 = __PAIR128__(v28 - v27, v26) - v25;
    result = v322;
    if (v322 != 0)
    {
      if ((*((_QWORD *)&v322 + 1) & 0x8000000000000000) != 0)
        return v25 - v26;
      return result;
    }
    return 0;
  }
  if (v47 == 34 - v44)
  {
    v57 = (v30 >> 49) - (v29 >> 49);
    v58 = v57 - 20;
    if (v57 < 20)
    {
      if (v57 >= 1)
      {
        if (v38 > 19)
        {
          v336 = __bid_ten2k64[v57];
          v337 = v336 * v28;
          v338 = HIDWORD(v336);
          v339 = HIDWORD(v336) * (unint64_t)v26;
          v340 = v336 * (unint64_t)v26;
          v341 = v336 * (unint64_t)v33 + v339 + HIDWORD(v340);
          v26 = v340 | ((unint64_t)v341 << 32);
          v28 = v337 + v338 * (unint64_t)v33 + HIDWORD(v339) + HIDWORD(v341);
        }
        else
        {
          v253 = __bid_ten2k64[v57];
          v254 = v26;
          v255 = HIDWORD(v253);
          v256 = v253 * (unint64_t)HIDWORD(v26);
          v257 = v253 * (unint64_t)v26;
          v258 = HIDWORD(v253) * (unint64_t)v254;
          v259 = HIDWORD(v256) + v255 * (unint64_t)v33;
          v260 = v258 + v256 + HIDWORD(v257);
          v28 = v259 + HIDWORD(v260);
          v26 = v257 | ((unint64_t)v260 << 32);
        }
      }
    }
    else
    {
      v59 = __bid_ten2k128[2 * v58];
      v60 = __bid_ten2k128[2 * v58 + 1] * v26;
      v61 = v26;
      v62 = HIDWORD(v59);
      v63 = v59 * (unint64_t)HIDWORD(v26);
      v64 = v59 * (unint64_t)v26;
      v65 = HIDWORD(v59) * (unint64_t)v61 + v63 + HIDWORD(v64);
      v26 = v64 | ((unint64_t)v65 << 32);
      v28 = v60 + v62 * (unint64_t)v33 + HIDWORD(v63) + HIDWORD(v65);
    }
    if (v32 == v31)
    {
      v343 = v26 + v25;
      v342 = (__PAIR128__(v28, v26) + __PAIR128__(v27, v25)) >> 64;
      result = v26 + v25;
      if (v342 <= 0x1ED09BEAD87C0 && (v343 <= 0x378D8E63FFFFFFFFLL || v342 != 0x1ED09BEAD87C0))
        return result;
      if (v343 > 0xFFFFFFFFFFFFFFFALL)
        ++v342;
      v344 = (v343 + 5) >> 32;
      v345 = 2576980377 * v344;
      v346 = HIDWORD(v345) + 429496729 * v344;
      v347 = 429496729 * (v343 + 5)
           + v345
           + ((2576980377u * (unint64_t)(v343 + 5)) >> 32);
      v348 = (-1717986816 * v344)
           + 2576980377 * (v343 + 5)
           + ((2576980480u * (unint64_t)(v343 + 5)) >> 32);
      v349 = ((2576980480u * (unint64_t)v344) >> 32)
           + 2576980377 * v344
           + HIDWORD(v348);
      v350 = (-1717986816 * (v343 + 5)) | (v348 << 32);
      v352 = ((-1717986919 * (v343 + 5)) | ((unint64_t)v347 << 32)) + v349;
      v351 = (__PAIR128__(HIDWORD(v347), (-1717986919 * (v343 + 5)) | ((unint64_t)v347 << 32))+ __PAIR128__(v346, v349)) >> 64;
      v353 = 2576980377 * HIDWORD(v342);
      v354 = HIDWORD(v353) + 429496729 * HIDWORD(v342);
      v355 = 429496729 * v342
           + v353
           + ((2576980377u * (unint64_t)v342) >> 32);
      v356 = (-1717986919 * v342) | ((unint64_t)v355 << 32);
      v357 = 2576980480 * v342;
      v358 = ((2576980480u * (unint64_t)HIDWORD(v342)) >> 32) + 2576980377 * HIDWORD(v342);
      v359 = (-1717986816 * HIDWORD(v342)) + 2576980377 * v342 + HIDWORD(v357);
      v360 = v357 & 0xFFFFFE00 | (v359 << 32);
      v362 = v356 + v358 + HIDWORD(v359);
      v361 = (__PAIR128__(v354, v356) + __PAIR128__(HIDWORD(v355), v358 + HIDWORD(v359))) >> 64;
      v363 = __PAIR128__(v362, v360) + v352;
      v364 = __CFADD__(__CFADD__(v360, v352), v362);
      result = v351 + *((_QWORD *)&v363 + 1);
      v365 = __CFADD__(v351, *((_QWORD *)&v363 + 1)) || v364;
      if ((unint64_t)v363 | v350)
      {
        if ((unint64_t)v363 < 0x1999999999999999
          || (v366 = 0, v350 < 0x999999999999999ALL) && (_QWORD)v363 == 0x1999999999999999)
        {
          if ((result & 1) != 0)
          {
            v367 = 0;
            --result;
            v366 = 1;
          }
          else
          {
            v366 = 0;
            v367 = 1;
          }
        }
        else
        {
          v367 = 0;
        }
      }
      else
      {
        v366 = 0;
        v367 = 0;
      }
      v443 = v29 + 0x2000000000000;
      if ((a5 & 0xFFFFFFFB) != 0 || v29 != 0x5FFE000000000000)
      {
        if ((unint64_t)v363 <= 0x8000000000000000)
        {
          if (v350 && (_QWORD)v363 == 0x8000000000000000)
          {
            v444 = 0;
            goto LABEL_593;
          }
        }
        else if (((unint64_t)v363 ^ 0x8000000000000000) <= 0x1999999999999999)
        {
          v444 = 0;
          if (v350 <= 0x9999999999999998 || ((unint64_t)v363 ^ 0x8000000000000000) != 0x1999999999999999)
          {
LABEL_593:
            v445 = v361 + v365;
            if (((v366 | v367) & 1) != 0)
            {
              v446 = 0;
              v447 = 0;
            }
            else
            {
              if ((v363 & 0x8000000000000000) != 0)
                v447 = v444;
              else
                v447 = 0;
              if ((v363 & 0x8000000000000000) == 0)
                v446 = v444;
              else
                v446 = 0;
            }
            if (!a5)
              return result;
            if (v31)
            {
              if (a5 != 1 || !v447)
              {
                if (a5 != 4 && a5 != 1)
                  v366 = 0;
                if (v366 != 1)
                {
LABEL_756:
                  if (((v446 == 0) & ~v367) == 0 && ((a5 & 0xFFFFFFFE) == 2 && v31 || (a5 & 0xFFFFFFFD) == 1 && !v31))
                  {
                    v472 = result - 1;
                    if ((__PAIR128__(v445, result) - 1) >> 64 == 0x314DC6448D93 && result == 0x38C15B0A00000000)
                    {
                      v472 = 0x378D8E63FFFFFFFFLL;
                      v443 = v29;
                    }
                  }
                  else
                  {
                    v472 = result;
                  }
LABEL_855:
                  if (v443 != 0x6000000000000000)
                    return v472;
                  if (v31)
                    v510 = 1;
                  else
                    v510 = 2;
                  if (v510 == a5)
                    result = 0;
                  else
                    result = 0x378D8E63FFFFFFFFLL;
                  *a6 |= 0x28u;
                  return result;
                }
              }
            }
            else if (a5 != 2 || !v447)
            {
              if (a5 != 4 && a5 != 2)
                LOBYTE(v366) = 0;
              if ((v366 & 1) == 0)
                goto LABEL_756;
            }
            v472 = result + 1;
            if (result == -1)
              ++v445;
            if (result == 0x378D8E63FFFFFFFFLL && v445 == 0x1ED09BEAD87C0)
            {
              v472 = 0x38C15B0A00000000;
              v443 = v29 + 0x4000000000000;
            }
            goto LABEL_855;
          }
        }
        *a6 |= 0x20u;
        v444 = 1;
        goto LABEL_593;
      }
LABEL_709:
      result = 0;
      v478 = *a6 | 0x28;
      goto LABEL_751;
    }
    v368 = __PAIR128__(v28 - v27, v26) - v25;
    result = v368;
    if (v368 != 0)
    {
      if ((*((_QWORD *)&v368 + 1) & 0x8000000000000000) != 0)
        return v25 - v26;
      return result;
    }
    return 0;
  }
  v530 = a6;
  v528 = 0x38C15B0A00000000;
  v529 = v29;
  v527 = v38 + (v30 >> 49) - (v29 >> 49);
  v533 = v32 == v31;
  v532 = v32 != v31;
  v98 = v527 - 54;
  v99 = 34 - v38;
  v531 = v27;
  while (1)
  {
    if (v99 < 20)
    {
      v104 = v28;
      v103 = v26;
      if (v99 >= 1)
      {
        v105 = __bid_ten2k64[v99];
        v106 = HIDWORD(v105);
        if (v38 > 19)
        {
          v110 = v105 * v28;
          v111 = HIDWORD(v105) * (unint64_t)v26;
          v112 = v105 * (unint64_t)v26;
          v113 = v105 * (unint64_t)HIDWORD(v26) + v111 + HIDWORD(v112);
          v103 = v112 | ((unint64_t)v113 << 32);
          v104 = v110 + v106 * (unint64_t)HIDWORD(v26) + HIDWORD(v111) + HIDWORD(v113);
        }
        else
        {
          v107 = v105 * (unint64_t)HIDWORD(v26);
          v108 = v105 * (unint64_t)v26;
          v109 = HIDWORD(v105) * (unint64_t)v26 + v107 + HIDWORD(v108);
          v104 = HIDWORD(v107) + v106 * (unint64_t)HIDWORD(v26) + HIDWORD(v109);
          v103 = v108 | ((unint64_t)v109 << 32);
        }
      }
    }
    else
    {
      v100 = &__bid_ten2k128[2 * (v99 - 20)];
      v101 = *v100 * (unint64_t)HIDWORD(v26);
      v102 = HIDWORD(*v100) * (unint64_t)v26
           + v101
           + ((*v100 * (unint64_t)v26) >> 32);
      v103 = (*v100 * v26) | ((unint64_t)v102 << 32);
      v104 = v100[1] * v26
           + HIDWORD(*v100) * (unint64_t)HIDWORD(v26)
           + HIDWORD(v101)
           + HIDWORD(v102);
    }
    v114 = v98 + 20;
    v115 = v98 + 19;
    if ((int)(v98 + 20) < 1)
    {
      v121 = 0;
      v122 = 0;
      v123 = 0;
      v124 = 0;
      v125 = 0;
      v126 = v27;
      v127 = v25;
      goto LABEL_241;
    }
    v116 = v32;
    v117 = v31;
    if (v114 > 0x13)
    {
      v120 = (__bid_midpoint128[v98] + __PAIR128__(v27, v25)) >> 64;
      v119 = *(_QWORD *)&__bid_midpoint128[v98] + v25;
    }
    else
    {
      v118 = __bid_midpoint64[v115];
      v119 = v118 + v25;
      if (__CFADD__(v118, v25))
        v120 = v27 + 1;
      else
        v120 = v27;
    }
    v128 = HIDWORD(v119);
    v129 = __bid_ten2mk128[2 * v115];
    v130 = __bid_ten2mk128[2 * v115 + 1];
    v131 = HIDWORD(v130);
    v132 = v130 * (unint64_t)HIDWORD(v119);
    v133 = HIDWORD(v132) + HIDWORD(v130) * (unint64_t)HIDWORD(v119);
    v134 = HIDWORD(v130) * (unint64_t)v119
         + v132
         + ((v130 * (unint64_t)v119) >> 32);
    v135 = HIDWORD(v134);
    v136 = (v130 * v119) | ((unint64_t)v134 << 32);
    v137 = HIDWORD(v129);
    v138 = v129 * (unint64_t)HIDWORD(v119);
    v139 = v129 * (unint64_t)v119;
    v140 = HIDWORD(v129) * (unint64_t)v119 + v138 + HIDWORD(v139);
    v141 = v139 | ((unint64_t)v140 << 32);
    v142 = __PAIR128__(v133, v136)
         + __PAIR128__(v135, HIDWORD(v138) + HIDWORD(v129) * (unint64_t)v128 + HIDWORD(v140));
    v143 = HIDWORD(v120);
    LODWORD(v133) = v120;
    v144 = v130 * (unint64_t)HIDWORD(v120);
    v145 = v130 * (unint64_t)v120;
    v146 = v131 * (unint64_t)v120;
    v147 = HIDWORD(v144) + v131 * (unint64_t)HIDWORD(v120);
    v148 = v146 + v144 + HIDWORD(v145);
    v149 = HIDWORD(v148);
    v150 = v145 | ((unint64_t)v148 << 32);
    v151 = v129 * (unint64_t)HIDWORD(v120);
    v152 = v129 * (unint64_t)v120;
    v153 = HIDWORD(v129) * (unint64_t)v133 + v151 + HIDWORD(v152);
    v154 = v152 | ((unint64_t)v153 << 32);
    v155 = __PAIR128__(v147, v150)
         + __PAIR128__(v149, HIDWORD(v151) + v137 * (unint64_t)v143 + HIDWORD(v153));
    v156 = v142 + v154;
    v207 = __CFADD__(__CFADD__((_QWORD)v142, v154), (_QWORD)v155);
    v157 = __CFADD__((_QWORD)v142, v154) + (_QWORD)v155;
    v158 = v207;
    v127 = *((_QWORD *)&v142 + 1) + v157;
    if (__CFADD__(*((_QWORD *)&v142 + 1), v157))
      v159 = 1;
    else
      v159 = v158;
    v126 = *((_QWORD *)&v155 + 1) + v159;
    if (v114 >= 4)
    {
      v162 = __bid_maskhigh128[v115];
      v160 = v162 & v126;
      if (v114 >= 0x17)
        v162 = -1;
      else
        v160 = 0;
      v161 = v127 & v162;
      v163 = __bid_shiftright128[v115];
      v164 = v163 <= 63;
      v165 = v127 >> v163;
      v166 = -v163;
      v167 = v126 >> v163;
      v168 = v126 >> v163;
      v127 = (v126 << v166) | v165;
      if (v164)
        v126 = v167;
      else
        v126 = 0;
      if (!v164)
        v127 = v168;
      v31 = v117;
      v32 = v116;
      v27 = v531;
      if (v114 > 0x16)
      {
        v171 = __bid_onehalf128[v115];
        if (v160 > v171 || v160 == v171 && v156 | v141 | v161)
        {
          v172 = v160 == v171 && v161 == 0;
          if (v172 && __PAIR128__(v156, v141) <= __bid_ten2mk128trunc[v115])
            goto LABEL_222;
          goto LABEL_219;
        }
        v125 = 1;
      }
      else
      {
        v169 = __bid_onehalf128[v115];
        if (v160)
          v170 = 1;
        else
          v170 = v161 > v169;
        if (v170 || (v125 = 1, v161 == v169) && (v169 = v161, v156 | v141))
        {
          if (v160 == v169 > v161 && v161 == v169 && __PAIR128__(v156, v141) <= __bid_ten2mk128trunc[v115])
            goto LABEL_223;
          goto LABEL_219;
        }
        v160 = 0;
      }
LABEL_227:
      v122 = v532;
      v121 = v533;
      goto LABEL_228;
    }
    v31 = v117;
    v32 = v116;
    v27 = v531;
    if (v156 <= 0x8000000000000000)
    {
      v160 = 0;
      v125 = 1;
      if (!v141 || v156 != 0x8000000000000000)
      {
        v161 = 0;
        goto LABEL_227;
      }
    }
    if (__PAIR128__(v156 ^ 0x8000000000000000, v141) < __bid_ten2mk128trunc[v115])
    {
      v160 = 0;
LABEL_222:
      v161 = 0;
LABEL_223:
      v121 = 0;
      v122 = 0;
      v125 = 0;
      goto LABEL_228;
    }
    v160 = 0;
    v161 = 0;
LABEL_219:
    v125 = 1;
    v121 = v532;
    v122 = v533;
LABEL_228:
    v123 = 0;
    if (!(v156 | v141) || v160 || v161)
    {
      v124 = 0;
    }
    else if (__PAIR128__(v156, v141) <= __bid_ten2mk128trunc[v115])
    {
      v121 = 0;
      v122 = 0;
      if ((((_DWORD)v127 + (_DWORD)v103) & 1) != 0)
      {
        v172 = v127-- == 0;
        v173 = v172;
        v126 -= v173;
        v124 = v532;
        v123 = v533;
      }
      else
      {
        v123 = v532;
        v124 = v533;
      }
    }
    else
    {
      v123 = 0;
      v124 = 0;
    }
LABEL_241:
    if (v32 == v31)
      break;
    v175 = (__PAIR128__(v104 - v126, v103) - v127) >> 64;
    v174 = v103 - v127;
    if (v175 < 0)
    {
      v174 = v127 - v103;
      if (v103 == v127)
        v175 = -v175;
      else
        v175 = ~v175;
      v176 = v31;
    }
    else
    {
      v176 = v32;
    }
    if ((unint64_t)v175 < 0x314DC6448D93 || v175 == 0x314DC6448D93 && v174 < 0x38C15B0A00000000)
    {
      if ((int)v114 < 1)
      {
        v310 = v98 + 19;
LABEL_494:
        v375 = v175 == 0x1ED09BEAD87C0;
        v376 = v174 == 0x378D8E6400000000;
        v377 = !v375 || !v376;
        if (v375 && v376)
          v227 = 0x314DC6448D93;
        else
          v227 = v175;
        if (v377)
          result = v174;
        else
          result = 0x38C15B0A00000000;
        if (v377)
          v378 = v529;
        else
          v378 = v529 + 0x2000000000000;
        v228 = a5;
        a6 = v530;
        if ((int)v310 >= 1)
          v378 += v310 << 49;
        goto LABEL_711;
      }
    }
    else
    {
      v179 = v175 != 0x314DC6448D93 || v174 != 0x38C15B0A00000000 || (v124 | v121) == 0;
      if ((int)v114 < 1 || v179)
      {
        if (v179)
          v310 = v114;
        else
          v310 = v115;
        goto LABEL_494;
      }
    }
    --v98;
    ++v99;
  }
  v227 = (__PAIR128__(v126, v127) + __PAIR128__(v104, v103)) >> 64;
  result = v127 + v103;
  v228 = a5;
  a6 = v530;
  if (v227 > 0x1ED09BEAD87C0)
    goto LABEL_312;
  v229 = (v527 - 34);
  if (result > 0x378D8E63FFFFFFFFLL)
  {
    if (v227 == 0x1ED09BEAD87C0)
    {
LABEL_312:
      if (result > 0xFFFFFFFFFFFFFFFALL)
        ++v227;
      v230 = (result + 5) >> 32;
      v231 = 2576980377 * v230;
      v232 = HIDWORD(v231) + 429496729 * v230;
      v233 = 429496729 * (result + 5)
           + v231
           + ((2576980377u * (unint64_t)(result + 5)) >> 32);
      v234 = (-1717986918 * v230)
           + 2576980377 * (result + 5)
           + ((2576980378u * (unint64_t)(result + 5)) >> 32);
      v235 = ((2576980378u * (unint64_t)v230) >> 32)
           + 2576980377 * v230
           + HIDWORD(v234);
      v236 = (-1717986918 * (result + 5)) | (v234 << 32);
      v237 = __PAIR128__(HIDWORD(v233), (-1717986919 * (result + 5)) | ((unint64_t)v233 << 32))+ __PAIR128__(v232, v235);
      v238 = 2576980377 * HIDWORD(v227);
      v239 = HIDWORD(v238) + 429496729 * HIDWORD(v227);
      v240 = 429496729 * v227
           + v238
           + ((2576980377u * (unint64_t)v227) >> 32);
      v241 = (-1717986919 * v227) | ((unint64_t)v240 << 32);
      v242 = 2576980378 * v227;
      v243 = ((2576980378u * (unint64_t)HIDWORD(v227)) >> 32) + 2576980377 * HIDWORD(v227);
      v244 = (-1717986918 * HIDWORD(v227)) + 2576980377 * v227 + HIDWORD(v242);
      v245 = v243 + HIDWORD(v244);
      v246 = v242 & 0xFFFFFFFE | (v244 << 32);
      v247 = __PAIR128__(v239, v241) + __PAIR128__(HIDWORD(v240), v245);
      v248 = v237 + v246;
      v207 = __CFADD__(__CFADD__((_QWORD)v237, v246), (_QWORD)v247);
      v249 = __CFADD__((_QWORD)v237, v246) + (_QWORD)v247;
      v250 = v207;
      result = *((_QWORD *)&v237 + 1) + v249;
      if (__CFADD__(*((_QWORD *)&v237 + 1), v249))
        v251 = 1;
      else
        v251 = v250;
      v227 = *((_QWORD *)&v247 + 1) + v251;
      if (!(v248 | v236))
        goto LABEL_508;
      if (v248 < 0x1999999999999999)
        goto LABEL_322;
      if (v248 == 0x1999999999999999)
      {
        if (v236 > 0x9999999999999999)
        {
LABEL_507:
          v122 = 0;
          v123 = 0;
          v124 = 0;
          v121 = 1;
          goto LABEL_704;
        }
LABEL_322:
        if ((v122 & 1) != 0)
          goto LABEL_507;
        if (v121)
        {
          v121 = 0;
          v123 = 0;
          v124 = 0;
          v172 = result-- == 0;
          v252 = v172;
          v227 -= v252;
          goto LABEL_703;
        }
        if (v123)
        {
LABEL_702:
          v121 = 0;
          v123 = 0;
          v124 = 0;
LABEL_703:
          v122 = 1;
LABEL_704:
          v382 = 1;
        }
        else
        {
          v121 = 0;
          v122 = 0;
          v123 = (result & 1) != 0;
          v124 = (result & 1) == 0;
          if ((result & 1) != 0)
            v509 = result - 1;
          else
            v509 = result;
          v382 = 1;
          result = v509;
        }
      }
      else
      {
LABEL_508:
        if (v248 <= 0x8000000000000000)
        {
          v382 = 1;
          if (!v236 || v248 != 0x8000000000000000)
          {
            v122 = 0;
            v123 = 0;
            v124 = 0;
            v121 = 1;
            goto LABEL_705;
          }
        }
        else
        {
          v379 = v248 ^ 0x8000000000000000;
          if (v379 > 0x1999999999999999 || v379 == 0x1999999999999999 && v236 > 0x9999999999999999)
            goto LABEL_702;
        }
        if (v125)
        {
          if (v123)
            v383 = 1;
          else
            v383 = v122;
          if (v124)
            v121 = 1;
          else
            v122 = v383;
          if (!v124)
            v123 = 0;
          v124 = 0;
          v382 = 1;
        }
        else
        {
          v382 = 0;
        }
      }
LABEL_705:
      v229 = (v527 - 33);
      v125 = v382;
    }
    else
    {
      v229 = (v527 - 34);
    }
  }
  v378 = v529 + (v229 << 49);
  if (v378 == 0x6000000000000000)
  {
    if ((a5 & 0xFFFFFFFB) == 0)
      goto LABEL_709;
    v378 = 0x6000000000000000;
    goto LABEL_712;
  }
  v176 = v31;
LABEL_711:
  v31 = v176;
  if (!v228)
    goto LABEL_749;
LABEL_712:
  if (v31)
  {
    if (v228 != 1 || !v122)
    {
      v479 = v228 == 1;
      goto LABEL_719;
    }
    goto LABEL_725;
  }
  if (v228 == 2 && v122)
    goto LABEL_725;
  v479 = v228 == 2;
LABEL_719:
  v480 = v479 || v228 == 4;
  if (v480 && v123)
  {
LABEL_725:
    v481 = result + 1;
    if (result == -1)
      ++v227;
    if (result == 0x378D8E63FFFFFFFFLL && v227 == 0x1ED09BEAD87C0)
    {
      v378 += 0x2000000000000;
      goto LABEL_740;
    }
LABEL_738:
    v528 = v481;
  }
  else if (v121 | v124 && ((v228 & 0xFFFFFFFE) == 2 && v31 || (v228 & 0xFFFFFFFD) == 1 && !v31))
  {
    v481 = result - 1;
    if ((__PAIR128__(v227, result) - 1) >> 64 != 0x314DC6448D93 || result != 0x38C15B0A00000000)
      goto LABEL_738;
    v378 -= 0x2000000000000;
    v528 = 0x378D8E63FFFFFFFFLL;
  }
  else
  {
    v528 = result;
  }
LABEL_740:
  if (v378 == 0x6000000000000000)
  {
    if (v31)
      v482 = 1;
    else
      v482 = 2;
    if (v482 == v228)
      result = 0;
    else
      result = 0x378D8E63FFFFFFFFLL;
    *a6 |= 0x28u;
  }
  else
  {
    result = v528;
  }
LABEL_749:
  if (v125)
  {
    v478 = *a6 | 0x20;
LABEL_751:
    *a6 = v478;
  }
  return result;
}

unint64_t __bid128_sub(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, int *a6)
{
  unint64_t v6;

  v6 = a4 | 0x8000000000000000;
  if (a4 < 0)
    v6 = a4 & 0x7FFFFFFFFFFFFFFFLL;
  if ((~a4 & 0x7C00000000000000) != 0)
    a4 = v6;
  return __bid128_add(a1, a2, a3, a4, a5, a6);
}

unint64_t __bid128_asin(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12[2];
  __n128 v13;
  uint64_t v14[2];
  uint64_t v15[2];
  int v16;
  int v17[8];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    v13 = 0uLL;
    v12[0] = 0;
    v12[1] = 0;
    v15[0] = __bid128_to_binary128(a1, a2, a3, &my_fpsf);
    v15[1] = v6;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    __dpml_bid_unpack_x_or_y__(v15, 0, (uint64_t)&v18, &qword_1B891D780, (uint64_t)v12, v17);
    if (bid_f128_cmp(v12, (uint64_t *)&c_1em40_1029, 1u))
      return bid128_ext_fma(v17, (int *)&v18, (int *)v14, &v16, v4, a2, 1uLL, 0x2FF0000000000000, v4, a2, a3, &my_fpsf);
    if (bid_f128_cmp(v12, (uint64_t *)&c_7_10ths_1030, 3u))
    {
      __dpml_bid_ux_asin_acos__(v15, 0xF04E00uLL, (uint64_t *)&__dpml_bid_inv_trig_x_table, &v13, v17);
    }
    else
    {
      if (bid_f128_cmp(v12, (uint64_t *)&c_one_1031, 4u))
      {
        v4 = 0;
        my_fpsf |= 1u;
        return v4;
      }
      v9 = bid128_ext_fma(v17, (int *)&v18, (int *)v14, &v16, v4, a2, v4, a2, 1uLL, 0xB040000000000000, a3, &my_fpsf);
      v14[0] = __bid128_to_binary128(v9, v10, a3, &my_fpsf);
      v14[1] = v11;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      __dpml_bid_unpack_x_or_y__(v14, 0, (uint64_t)&v18, &__dpml_bid_bid_x_table, (uint64_t)&v13, v17);
      bid_f128_sqrt(&v13, (uint64_t *)&v13);
      __dpml_bid_ux_asin_acos__((uint64_t *)&v13, 0x1A30038uLL, &qword_1B891E4C0, &v13, v17);
      if (bid_f128_cmp(v15, (uint64_t *)&c_zero_1032, 1u))
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        __dpml_bid_unpack_x_or_y__((uint64_t *)&v13, 0, (uint64_t)&v18, &__dpml_bid_bid_x_table, (uint64_t)&v13, v17);
      }
    }
    return __binary128_to_bid128(v13.n128_u64[0], v13.n128_u64[1], a3, &my_fpsf);
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v4;
}

unint64_t __bid128_asinh(unint64_t result, unint64_t a2, int a3)
{
  unint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;

  v3 = result;
  if (((a2 >> 61) & 3) == 3)
  {
    if ((a2 & 0x7800000000000000) == 0x7800000000000000)
    {
      if ((a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && result >= 0x38C15B0A00000000)
        v3 = 0;
      if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93)
        v3 = 0;
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        result = 0;
      else
        result = v3;
      if ((a2 & 0x7C00000000000000) != 0x7C00000000000000)
        return 0;
LABEL_27:
      if ((~a2 & 0x7E00000000000000) == 0)
        my_fpsf |= 1u;
      return result;
    }
    result = 0;
LABEL_26:
    if ((~a2 & 0x7C00000000000000) != 0)
      return result;
    goto LABEL_27;
  }
  v7 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
    || (a2 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && result >= 0x378D8E6400000000)
  {
    result = 0;
    v7 = 0;
  }
  if (!(v7 | result))
    goto LABEL_26;
  v8 = (a2 >> 49) & 0x3FFF;
  v14 = 0uLL;
  v12 = 0uLL;
  v11 = 0uLL;
  if (v8 < 0x1843)
  {
    v13.n128_u64[0] = __bid128_to_binary128(v3, a2, a3, &my_fpsf);
    v13.n128_u64[1] = v10;
    bid_f128_asinh(&v14, (uint64_t *)&v13);
    return __binary128_to_bid128(v14.n128_u64[0], v14.n128_u64[1], a3, &my_fpsf);
  }
  else
  {
    v13.n128_u64[0] = __bid128_to_binary128(result, v7 | 0x3040000000000000, a3, &my_fpsf);
    v13.n128_u64[1] = v9;
    bid_f128_add(&v13, (uint64_t *)&v13, (uint64_t *)&v13);
    bid_f128_itof(&v12, v8 - 6176);
    bid_f128_mul(&v14, (uint64_t *)&v12, (uint64_t *)&c_log10_1035);
    bid_f128_log(&v11, (uint64_t *)&v13);
    bid_f128_add(&v14, (uint64_t *)&v14, (uint64_t *)&v11);
    return __binary128_to_bid128(v14.n128_u64[0], v14.n128_u64[1], a3, &my_fpsf);
  }
}

unint64_t __bid128_atan(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  uint64_t v6;
  int v8;
  _QWORD *v9;
  unsigned int v10;
  int *v11;
  uint64_t v12;
  uint64_t v14[2];
  __n128 v15;
  uint64_t v16[3];
  int v17[8];
  _QWORD v18[3];
  __int128 v19;
  unint64_t v20;
  _QWORD v21[6];
  int v22[6];
  _QWORD v23[4];

  v4 = a1;
  v23[3] = *MEMORY[0x1E0C80C00];
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    v15 = 0uLL;
    v14[0] = 0;
    v14[1] = 0;
    v16[0] = __bid128_to_binary128(a1, a2, a3, &my_fpsf);
    v16[1] = v6;
    memset(v21, 0, 24);
    __dpml_bid_unpack_x_or_y__(v16, 0, (uint64_t)v21, &qword_1B891D780, (uint64_t)v14, v22);
    if (bid_f128_cmp(v14, (uint64_t *)&c_1em40_1038, 1u))
    {
      if (__bid128_isZero(v4, a2))
        return __bid128_mul(v4, a2, 1uLL, 0x3040000000000000, a3, &my_fpsf);
      else
        return bid128_ext_fma(v22, (int *)v21, v17, (int *)&v19, v4, a2, 1uLL, 0xAFF0000000000000, v4, a2, a3, &my_fpsf);
    }
    else
    {
      memset(v18, 0, sizeof(v18));
      if ((__dpml_bid_unpack_x_or_y__(v16, 0, (uint64_t)v18, qword_1B891E500, (uint64_t)&v15, v17) & 0x8000000000000000) == 0)
      {
        v20 = 0;
        v19 = 0uLL;
        v8 = v18[0];
        LODWORD(v18[0]) = 0;
        if (SHIDWORD(v18[0]) <= 1)
        {
          if ((v18[0] & 0x8000000000000000) != 0)
          {
            v11 = 0;
            v12 = 0;
            v10 = 0;
            v9 = v18;
          }
          else
          {
            v11 = v22;
            __dpml_bid_addsub__((uint64_t)v18, dword_1B891E668, 14, (uint64_t)v22);
            v9 = v23;
            __dpml_bid_ffs_and_shift__((uint64_t)v23, 0);
            v10 = 0;
            v12 = 4;
          }
        }
        else
        {
          v9 = 0;
          v10 = 0x80000000;
          v11 = (int *)v18;
          v12 = 8;
        }
        __dpml_bid_divide__((uint64_t)v9, v11, 2, (uint64_t)&v19);
        if (DWORD1(v19) - (v19 >= 0) >= 0)
        {
          v12 -= 4;
          v10 ^= 0x80000000;
          v19 = xmmword_1B891E698;
          v20 = 0xAAAAAAAAAAAAAAAALL;
        }
        __dpml_bid_evaluate_rational__((int8x8_t *)&v19, (uint64_t)&unk_1B891E6B0, 11, 0x400000000000046uLL, (uint64_t)v21);
        LODWORD(v21[0]) ^= v10;
        if (v12)
        {
          __dpml_bid_ffs_and_shift__((uint64_t)v21, 0);
          __dpml_bid_addsub__((uint64_t)&__dpml_bid_inv_trig_x_table + ((0x34E3180u >> v12) & 0x78) + 320, v21, 8, (uint64_t)v21);
        }
        LODWORD(v21[0]) = v8;
        __dpml_bid_pack__((unsigned int *)v21, &v15, 0, 0);
      }
      return __binary128_to_bid128(v15.n128_u64[0], v15.n128_u64[1], a3, &my_fpsf);
    }
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v4;
}

unint64_t __bid128_atanh(unint64_t a1, unint64_t a2, int a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  __int32 v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24[2];
  __n128 v25;
  _QWORD v26[4];
  int8x8_t v27[3];
  int8x8_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v3 = a1;
  if (((a2 >> 61) & 3) != 3)
  {
    v9 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
      goto LABEL_24;
    if ((a2 & 0x1FFFFFFFFFFFFLL) != 0x1ED09BEAD87C0)
    {
      v21 = a1;
      goto LABEL_25;
    }
    v21 = a1;
    if (a1 >= 0x378D8E6400000000)
    {
LABEL_24:
      v21 = 0;
      v9 = 0;
    }
LABEL_25:
    if (!(v9 | v21))
    {
LABEL_44:
      if ((~a2 & 0x7C00000000000000) != 0)
        return v21;
      v3 = v21;
      goto LABEL_46;
    }
    if (((a2 >> 50) & 0x1FFF) < 0xBF7)
      return v3;
    v10 = a2 & 0x7FFFFFFFFFFFFFFFLL;
    v11 = __bid128_sub(1uLL, 0x3040000000000000, a1, a2 & 0x7FFFFFFFFFFFFFFFLL, a3, &my_fpsf);
    if ((v12 & 0x8000000000000000) != 0)
    {
LABEL_50:
      v3 = 0;
      my_fpsf |= 1u;
      return v3;
    }
    if (!(v11 | v12 & 0x1FFFFFFFFFFFFLL))
    {
      v3 = 0;
      my_fpsf |= 4u;
      return v3;
    }
    v25 = 0uLL;
    v13 = __bid128_div(v3, v10, v11, v12, a3, &my_fpsf);
    v15 = __bid128_add(v13, v14, v13, v14, a3, &my_fpsf);
    v24[0] = __bid128_to_binary128(v15, v16, a3, &my_fpsf);
    v24[1] = v17;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    memset(v27, 0, sizeof(v27));
    if ((__dpml_bid_unpack_x_or_y__(v24, 0, (uint64_t)&v31, qword_1B891EDE8, (uint64_t)&v25, v26) & 0x8000000000000000) != 0)
    {
LABEL_59:
      bid_f128_mul(&v25, (uint64_t *)&v25, (uint64_t *)&c_half);
      return __binary128_to_bid128(v25.n128_u64[0], v25.n128_u64[1], a3, &my_fpsf);
    }
    if (v31 < 0)
    {
      if (HIDWORD(v31) != -1)
        goto LABEL_57;
      v22 = v32 >> 2;
      if ((_DWORD)v31)
        v22 = -(uint64_t)v22;
      if (v22 - 0x3504F333F9DE6484 >= 0xA57D86660310CDBELL)
      {
LABEL_57:
        __dpml_bid_addsub__((uint64_t)&dword_1B891EF30[6], &v31, 0, (uint64_t)v27);
        __dpml_bid_divide__((uint64_t)&v31, v27, 2, (uint64_t)v27);
        __dpml_bid_evaluate_rational__(v27, (uint64_t)&unk_1B891EE08, 17, 6uLL, (uint64_t)&v28);
        __dpml_bid_multiply__(&v28, qword_1B891EF60, &v28);
        goto LABEL_58;
      }
    }
    else if (HIDWORD(v31) && (_DWORD)v31)
    {
      v29 = 0x8000000000000000;
      if (v33)
        v18 = 0;
      else
        v18 = v32 == 0x8000000000000000;
      if (v18 && HIDWORD(v31) == 1)
        v20 = -32768;
      else
        v20 = 0x8000;
      v28.i32[1] = v20;
      goto LABEL_58;
    }
    __dpml_bid_addsub__((uint64_t)dword_1B891EF30, &v31, 0, (uint64_t)&v28);
    __dpml_bid_ux_log__((uint64_t)&v28, qword_1B891EF60, &v28);
LABEL_58:
    __dpml_bid_pack__((unsigned int *)&v28, &v25, 53, 52);
    goto LABEL_59;
  }
  if ((a2 & 0x7800000000000000) != 0x7800000000000000)
  {
    v21 = 0;
    goto LABEL_44;
  }
  if ((a2 & 0x3FFFFFFFFFFFLL) != 0x314DC6448D93 || a1 < 0x38C15B0A00000000)
    v6 = a1;
  else
    v6 = 0;
  if ((a2 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
    v7 = v6;
  else
    v7 = 0;
  if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
    v3 = 0;
  else
    v3 = v7;
  if ((a2 & 0x7C00000000000000) != 0x7C00000000000000)
    goto LABEL_50;
LABEL_46:
  if ((~a2 & 0x7E00000000000000) == 0)
    my_fpsf |= 1u;
  return v3;
}

BOOL __bid128_quiet_equal(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, _DWORD *a5)
{
  _BOOL8 result;
  uint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  uint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unsigned __int128 v49;
  unint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;

  if ((~a2 & 0x7C00000000000000) == 0 || (a4 & 0x7C00000000000000) == 0x7C00000000000000)
  {
    if ((~a2 & 0x7E00000000000000) == 0 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
    {
      result = 0;
      *a5 |= 1u;
      return result;
    }
    return 0;
  }
  if (a1 == a3 && a2 == a4)
    return 1;
  v7 = a4 & 0x7800000000000000;
  if ((~a2 & 0x7800000000000000) == 0)
    return v7 == 0x7800000000000000 && ((a4 ^ a2) & 0x8000000000000000) == 0;
  if (v7 == 0x7800000000000000)
    return 0;
  v8 = a2 & 0x1FFFFFFFFFFFFLL;
  v9 = (~a2 & 0x6000000000000000) == 0;
  if (a1 > 0x378D8E63FFFFFFFFLL && v8 == 0x1ED09BEAD87C0)
    v9 = 1;
  if (v8 > 0x1ED09BEAD87C0)
    v9 = 1;
  v11 = a4 & 0x1FFFFFFFFFFFFLL;
  if ((a4 & 0x1FFFFFFFFFFFFLL) <= 0x1ED09BEAD87C0)
  {
    if (!(v8 | a1))
      v9 = 1;
    v14 = a3 >= 0x378D8E6400000000 && v11 == 0x1ED09BEAD87C0;
    v13 = !v9;
    if (!v14 && (a4 & 0x6000000000000000) != 0x6000000000000000)
    {
      v12 = (v11 | a3) == 0;
      if (v11 | a3)
        v15 = 1;
      else
        v15 = !v9;
      if ((v15 & 1) == 0)
        return 1;
      goto LABEL_41;
    }
    v12 = 1;
  }
  else
  {
    if (!(v8 | a1))
      LOBYTE(v9) = 1;
    v12 = 1;
    v13 = 1;
  }
  result = 1;
  if (v9)
    return result;
LABEL_41:
  result = 0;
  if (v12 == v13 || ((a4 ^ a2) & 0x8000000000000000) != 0)
    return result;
  v16 = (a4 >> 49) & 0x3FFF;
  if (((a2 >> 49) & 0x3FFF) <= v16)
  {
    v17 = a4 & 0x1FFFFFFFFFFFFLL;
    v18 = a3;
    v11 = a2 & 0x1FFFFFFFFFFFFLL;
    a3 = a1;
    v19 = (a4 >> 49) & 0x3FFF;
    v16 = (a2 >> 49) & 0x3FFF;
  }
  else
  {
    v17 = a2 & 0x1FFFFFFFFFFFFLL;
    v18 = a1;
    v19 = (a2 >> 49) & 0x3FFF;
  }
  v20 = v19 - v16;
  if (v20 > 33)
    return 0;
  result = 0;
  if (v20 < 20)
  {
    v56 = __bid_ten2k64[v20];
    v57 = HIDWORD(v56);
    v58 = HIDWORD(v17);
    v59 = HIDWORD(v56) * (unint64_t)v17;
    v60 = v56 * (unint64_t)v17;
    v61 = HIDWORD(v56) * (unint64_t)v18;
    v62 = v56 * (unint64_t)v18;
    v63 = HIDWORD(v61) + HIDWORD(v56) * (unint64_t)HIDWORD(v18);
    v64 = v56 * (unint64_t)HIDWORD(v18);
    v65 = v56 * (unint64_t)v58 + v59 + HIDWORD(v60);
    v66 = v64 + v61 + HIDWORD(v62);
    v67 = v63 + HIDWORD(v66);
    v68 = (v60 | ((unint64_t)v65 << 32)) + v67;
    if (v68 == v11
      && v68 >= v67
      && HIDWORD(v59) + v57 * (unint64_t)v58 == -(uint64_t)HIDWORD(v65))
    {
      return (v62 | ((unint64_t)v66 << 32)) == a3;
    }
  }
  else
  {
    v22 = &__bid_ten2k128[2 * (v20 - 20)];
    v21 = v22[1];
    v23 = HIDWORD(v21);
    v24 = v21 * (unint64_t)HIDWORD(v18);
    v25 = HIDWORD(v24) + HIDWORD(v21) * (unint64_t)HIDWORD(v18);
    v26 = HIDWORD(*v22);
    v27 = *v22 * (unint64_t)HIDWORD(v18);
    v28 = HIDWORD(v27) + HIDWORD(*v22) * (unint64_t)HIDWORD(v18);
    v29 = HIDWORD(v21) * (unint64_t)v18
        + v24
        + ((v21 * (unint64_t)v18) >> 32);
    v30 = (v21 * v18) | ((unint64_t)v29 << 32);
    v31 = HIDWORD(v29);
    v32 = *v22 * (unint64_t)v18;
    v33 = HIDWORD(*v22) * (unint64_t)v18 + v27 + HIDWORD(v32);
    v34 = v28 + HIDWORD(v33);
    v35 = __CFADD__(v30, v34);
    v36 = v30 + v34;
    v37 = v31 + v35 + v25;
    v38 = HIDWORD(v17);
    v39 = v21 * (unint64_t)HIDWORD(v17);
    v40 = v21 * (unint64_t)v17;
    v41 = HIDWORD(v39) + v23 * (unint64_t)HIDWORD(v17);
    v42 = v23 * (unint64_t)v17 + v39 + HIDWORD(v40);
    v43 = HIDWORD(v42);
    v44 = v40 | ((unint64_t)v42 << 32);
    v45 = *v22 * (unint64_t)HIDWORD(v17);
    v46 = *v22 * (unint64_t)v17;
    v47 = v26 * (unint64_t)v17 + v45 + HIDWORD(v46);
    v48 = v46 | ((unint64_t)v47 << 32);
    v49 = __PAIR128__(v41, v44)
        + __PAIR128__(v43, HIDWORD(v45) + v26 * (unint64_t)v38 + HIDWORD(v47));
    v50 = v36 + v48;
    v35 = __CFADD__(__CFADD__(v36, v48), (_QWORD)v49);
    v51 = __CFADD__(v36, v48) + (_QWORD)v49;
    v52 = v35;
    v53 = v37 + v51;
    if (__CFADD__(v37, v51))
      v54 = 1;
    else
      v54 = v52;
    if (v50 == v11 && !v53 && *((_QWORD *)&v49 + 1) == v54 << 63 >> 63)
      return (v32 | ((unint64_t)v33 << 32)) == a3;
  }
  return result;
}

unint64_t __bid128_quiet_greater(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  unint64_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int128 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unsigned __int128 v46;
  unint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  _BOOL4 v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unsigned __int128 v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unsigned __int128 v82;
  unint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  _BOOL4 v90;
  int v91;
  BOOL v92;
  unint64_t v93;
  unint64_t v94;
  unsigned int v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unsigned __int128 v106;
  BOOL v107;
  _BOOL4 v108;
  int v109;
  unint64_t v110;
  unint64_t v111;
  unsigned int v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unsigned __int128 v123;
  _BOOL4 v124;
  _BOOL4 v125;
  int v126;

  if ((~a2 & 0x7C00000000000000) == 0 || (a4 & 0x7C00000000000000) == 0x7C00000000000000)
  {
    if ((~a2 & 0x7E00000000000000) == 0 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
    {
      v6 = 0;
      *a5 |= 1u;
      return v6;
    }
    return 0;
  }
  if (a1 == a3 && a2 == a4)
    return 0;
  if ((~a2 & 0x7800000000000000) == 0)
  {
    LODWORD(v6) = (~a4 & 0x7800000000000000) != 0 || a4 < 0;
    if (a2 >= 0)
      return v6;
    else
      return 0;
  }
  if ((~a4 & 0x7800000000000000) == 0)
    return (unint64_t)a4 >> 63;
  v7 = a2 & 0x1FFFFFFFFFFFFLL;
  v8 = (~a2 & 0x6000000000000000) == 0;
  v9 = a1 > 0x378D8E63FFFFFFFFLL && v7 == 0x1ED09BEAD87C0;
  if (v9)
    v8 = 1;
  if (v7 > 0x1ED09BEAD87C0)
    v8 = 1;
  v10 = a4 & 0x1FFFFFFFFFFFFLL;
  if ((a4 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
  {
    if (v7 | a1)
      v11 = v8;
    else
      v11 = 1;
    if ((v11 & 1) == 0)
      return a2 >= 0;
    return 0;
  }
  if (v7 | a1)
    v12 = v8;
  else
    v12 = 1;
  v13 = a3 >= 0x378D8E6400000000 && v10 == 0x1ED09BEAD87C0;
  if (v13 || (a4 & 0x6000000000000000) == 0x6000000000000000 || !(v10 | a3))
  {
    if ((v12 & 1) != 0)
      return 0;
    return a2 >= 0;
  }
  if ((v12 & 1) != 0 || (a4 ^ a2) < 0)
    return (unint64_t)a4 >> 63;
  v15 = ((unint64_t)a2 >> 49) & 0x3FFF;
  v16 = ((unint64_t)a4 >> 49) & 0x3FFF;
  v17 = v16 - v15;
  if ((_DWORD)v16 == (_DWORD)v15)
  {
    v18 = v7 == v10;
    if (a1 < a3)
      v18 = 0;
    if (v7 > v10)
      v18 = 1;
    v19 = (unint64_t)a2 >> 63;
    return v18 ^ v19;
  }
  if ((v7 > v10 || v7 == v10 && a1 > a3) && v15 >= v16)
    return a2 >= 0;
  if ((v7 < v10 || v7 == v10 && a1 < a3) && v15 <= v16)
    return (unint64_t)a2 >> 63;
  v20 = v15 - v16;
  if (v20 < 1)
  {
    if (v17 >= 34)
      return (unint64_t)a2 >> 63;
    if (v17 < 20)
    {
      v110 = __bid_ten2k64[v17];
      v111 = HIDWORD(v110);
      v112 = v110;
      v113 = HIDWORD(v10);
      v114 = HIDWORD(v110) * (unint64_t)a4;
      v115 = v110 * (unint64_t)v113;
      v116 = HIDWORD(v114) + HIDWORD(v110) * (unint64_t)v113;
      v117 = v115 + v114 + ((v110 * (unint64_t)a4) >> 32);
      v118 = (v110 * a4) | ((unint64_t)v117 << 32);
      v119 = HIDWORD(v110) * (unint64_t)a3;
      v120 = v110 * (unint64_t)a3;
      v121 = v112 * (unint64_t)HIDWORD(a3) + v119 + HIDWORD(v120);
      v122 = v120 | ((unint64_t)v121 << 32);
      v123 = __PAIR128__(v116, v118)
           + __PAIR128__(HIDWORD(v117), HIDWORD(v119) + v111 * (unint64_t)HIDWORD(a3) + HIDWORD(v121));
      if (v118 + HIDWORD(v119) + v111 * (unint64_t)HIDWORD(a3) + HIDWORD(v121) == v7
        && v122 == a1
        && !*((_QWORD *)&v123 + 1))
      {
        return 0;
      }
      v124 = v122 > a1;
      v9 = (_QWORD)v123 == v7;
      v125 = (unint64_t)v123 > v7;
      if (!v9)
        v124 = 0;
      if (*((_QWORD *)&v123 + 1))
        v125 = 1;
      v91 = v124 || v125;
      v92 = a4 < 0;
    }
    else
    {
      v55 = &__bid_ten2k128[2 * (v17 - 20)];
      v57 = *v55;
      v56 = v55[1];
      v58 = HIDWORD(v56);
      v59 = v56 * (unint64_t)HIDWORD(a3);
      v60 = HIDWORD(v59) + HIDWORD(v56) * (unint64_t)HIDWORD(a3);
      v61 = HIDWORD(v56) * (unint64_t)a3
          + v59
          + ((v56 * (unint64_t)a3) >> 32);
      v62 = HIDWORD(v61);
      v63 = (v56 * a3) | ((unint64_t)v61 << 32);
      v64 = HIDWORD(v57);
      v65 = v57 * (unint64_t)HIDWORD(a3);
      v66 = HIDWORD(v57) * (unint64_t)a3
          + v65
          + ((v57 * (unint64_t)a3) >> 32);
      v67 = (v57 * a3) | ((unint64_t)v66 << 32);
      v68 = __PAIR128__(v60, v63)
          + __PAIR128__(v62, HIDWORD(v65) + HIDWORD(v57) * (unint64_t)HIDWORD(a3) + HIDWORD(v66));
      v69 = HIDWORD(v10);
      v70 = v56 * (unint64_t)v69;
      v71 = v56 * (unint64_t)a4;
      v72 = v58 * (unint64_t)a4;
      v73 = HIDWORD(v70) + v58 * (unint64_t)v69;
      v74 = v72 + v70 + HIDWORD(v71);
      v75 = HIDWORD(v74);
      v76 = v71 | ((unint64_t)v74 << 32);
      v77 = v57 * (unint64_t)v69;
      v78 = v57 * (unint64_t)a4;
      v79 = HIDWORD(v77) + v64 * (unint64_t)v69;
      v80 = v64 * (unint64_t)a4 + v77 + HIDWORD(v78);
      v81 = v78 | ((unint64_t)v80 << 32);
      v82 = __PAIR128__(v73, v76) + __PAIR128__(v75, v79 + HIDWORD(v80));
      v83 = v68 + v81;
      v84 = __CFADD__((_QWORD)v68, v81) + (_QWORD)v82;
      v85 = __CFADD__(__CFADD__((_QWORD)v68, v81), (_QWORD)v82);
      v48 = __CFADD__(*((_QWORD *)&v68 + 1), v84);
      v86 = *((_QWORD *)&v68 + 1) + v84;
      v87 = v48 || v85;
      v88 = (*((_QWORD *)&v82 + 1) + v87) | v86;
      if (v83 == v7 && !v88)
      {
        v6 = 0;
        if (v67 == a1)
          return v6;
      }
      v89 = v67 > a1;
      v9 = v83 == v7;
      v90 = v83 > v7;
      if (!v9)
        v89 = 0;
      if (v88)
        v90 = 1;
      v91 = v90 || v89;
      v92 = a2 < 0;
    }
    v126 = !v92;
    return v126 ^ v91;
  }
  if (v20 >= 0x22)
    return a2 >= 0;
  if (v20 < 0x14)
  {
    v93 = __bid_ten2k64[v20];
    v94 = HIDWORD(v93);
    v95 = v93;
    v96 = HIDWORD(v7);
    v97 = HIDWORD(v93) * (unint64_t)a2;
    v98 = v93 * (unint64_t)v96;
    v99 = HIDWORD(v97) + HIDWORD(v93) * (unint64_t)v96;
    v100 = v98 + v97 + ((v93 * (unint64_t)a2) >> 32);
    v101 = (v93 * a2) | ((unint64_t)v100 << 32);
    v102 = HIDWORD(v93) * (unint64_t)a1;
    v103 = v93 * (unint64_t)a1;
    v104 = v95 * (unint64_t)HIDWORD(a1) + v102 + HIDWORD(v103);
    v105 = v103 | ((unint64_t)v104 << 32);
    v106 = __PAIR128__(v99, v101)
         + __PAIR128__(HIDWORD(v100), HIDWORD(v102) + v94 * (unint64_t)HIDWORD(a1) + HIDWORD(v104));
    if (__PAIR128__(v99, v101)
       + __PAIR128__(HIDWORD(v100), HIDWORD(v102) + v94 * (unint64_t)HIDWORD(a1) + HIDWORD(v104)) == v10
      && v105 == a3)
    {
      return 0;
    }
    v107 = (unint64_t)v106 > v10;
    v108 = (_QWORD)v106 == v10;
    v109 = v107;
    if (*((_QWORD *)&v106 + 1))
      v54 = 1;
    else
      v54 = v109;
    v53 = v105 > a3 && v108;
    goto LABEL_110;
  }
  v22 = &__bid_ten2k128[2 * (v20 - 20)];
  v21 = v22[1];
  v23 = HIDWORD(v21);
  v24 = v21 * (unint64_t)HIDWORD(a1);
  v25 = HIDWORD(v24) + HIDWORD(v21) * (unint64_t)HIDWORD(a1);
  v26 = HIDWORD(v21) * (unint64_t)a1
      + v24
      + ((v21 * (unint64_t)a1) >> 32);
  v27 = HIDWORD(v26);
  v28 = (v21 * a1) | ((unint64_t)v26 << 32);
  v29 = HIDWORD(*v22);
  v30 = *v22 * (unint64_t)HIDWORD(a1);
  v31 = HIDWORD(*v22) * (unint64_t)a1
      + v30
      + ((*v22 * (unint64_t)a1) >> 32);
  v32 = (*v22 * a1) | ((unint64_t)v31 << 32);
  v33 = __PAIR128__(v25, v28)
      + __PAIR128__(v27, HIDWORD(v30) + HIDWORD(*v22) * (unint64_t)HIDWORD(a1) + HIDWORD(v31));
  v34 = HIDWORD(v7);
  v35 = v21 * (unint64_t)v34;
  v36 = v21 * (unint64_t)a2;
  v37 = v23 * (unint64_t)a2;
  v38 = HIDWORD(v35) + v23 * (unint64_t)v34;
  v39 = v37 + v35 + HIDWORD(v36);
  v40 = HIDWORD(v39);
  v41 = v36 | ((unint64_t)v39 << 32);
  v42 = *v22 * (unint64_t)v34;
  v43 = HIDWORD(v42) + v29 * (unint64_t)v34;
  v44 = v29 * (unint64_t)a2
      + v42
      + ((*v22 * (unint64_t)a2) >> 32);
  v45 = (*v22 * a2) | ((unint64_t)v44 << 32);
  v46 = __PAIR128__(v38, v41) + __PAIR128__(v40, v43 + HIDWORD(v44));
  v47 = v33 + v45;
  v48 = __CFADD__(__CFADD__((_QWORD)v33, v45), (_QWORD)v46);
  v49 = __CFADD__((_QWORD)v33, v45) + (_QWORD)v46;
  LODWORD(v50) = v48;
  v48 = __CFADD__(*((_QWORD *)&v33 + 1), v49);
  v51 = *((_QWORD *)&v33 + 1) + v49;
  if (v48)
    v50 = 1;
  else
    v50 = v50;
  v52 = (*((_QWORD *)&v46 + 1) + v50) | v51;
  if (v47 != v10 || v52 || (v6 = 0, v32 != a3))
  {
    v53 = v47 == v10;
    v54 = v47 > v10;
    if (v52)
      v54 = 1;
    if (v32 <= a3)
      v53 = 0;
LABEL_110:
    v18 = v54 || v53;
    v19 = (unint64_t)a4 >> 63;
    return v18 ^ v19;
  }
  return v6;
}

uint64_t __bid128_quiet_greater_equal(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, _DWORD *a5)
{
  uint64_t result;
  _BOOL4 v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v11;
  char v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _BOOL4 v18;
  int v19;
  unint64_t v20;
  int v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unsigned __int128 v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unsigned __int128 v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  _BOOL4 v57;
  int v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unsigned __int128 v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unsigned __int128 v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unsigned __int128 v106;
  _BOOL4 v107;
  int v108;
  int v109;
  _BOOL4 v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  BOOL v124;
  int v125;

  if ((~a2 & 0x7C00000000000000) != 0 && (a4 & 0x7C00000000000000) != 0x7C00000000000000)
  {
    if (a1 == a3 && a2 == a4)
      return 1;
    if ((~a2 & 0x7800000000000000) == 0)
    {
      v7 = (~a4 & 0x7800000000000000) == 0 && (a4 & 0x8000000000000000) != 0;
      return a2 >= 0 || v7;
    }
    if ((~a4 & 0x7800000000000000) == 0)
      return a4 >> 63;
    v8 = a2 & 0x1FFFFFFFFFFFFLL;
    v9 = (~a2 & 0x6000000000000000) == 0;
    if (a1 > 0x378D8E63FFFFFFFFLL && v8 == 0x1ED09BEAD87C0)
      v9 = 1;
    if (v8 > 0x1ED09BEAD87C0)
      v9 = 1;
    v11 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    {
      if (v8 | a1)
        v12 = v9;
      else
        v12 = 1;
      if ((v12 & 1) != 0)
        return 1;
      return a2 >= 0;
    }
    if (v8 | a1)
      v13 = v9;
    else
      v13 = 1;
    v14 = a3 >= 0x378D8E6400000000 && v11 == 0x1ED09BEAD87C0;
    if (v14 || (a4 & 0x6000000000000000) == 0x6000000000000000 || !(v11 | a3))
    {
      if ((v13 & 1) == 0)
        return a2 >= 0;
      return 1;
    }
    if ((v13 & 1) != 0 || ((a4 ^ a2) & 0x8000000000000000) != 0)
      return a4 >> 63;
    v15 = ((unint64_t)a2 >> 49) & 0x3FFF;
    v16 = (a4 >> 49) & 0x3FFF;
    v17 = v16 - v15;
    if ((_DWORD)v16 == (_DWORD)v15)
    {
      v18 = v8 == v11;
      if (a1 < a3)
        v18 = 0;
      v19 = v8 > v11 || v18;
LABEL_55:
      v20 = (unint64_t)a2 >> 63;
      return v19 ^ v20;
    }
    if (v8 >= v11 && a1 >= a3 && v15 > v16)
      return a2 >= 0;
    if (v8 <= v11 && a1 <= a3 && v15 < v16)
      return (unint64_t)a2 >> 63;
    v21 = v15 - v16;
    if (v21 < 1)
    {
      if (v17 >= 34)
        return (unint64_t)a2 >> 63;
      if (v17 >= 20)
      {
        v59 = &__bid_ten2k128[2 * (v17 - 20)];
        v61 = *v59;
        v60 = v59[1];
        v62 = HIDWORD(v60);
        v63 = v60 * (unint64_t)HIDWORD(a3);
        v64 = HIDWORD(v63) + HIDWORD(v60) * (unint64_t)HIDWORD(a3);
        v65 = HIDWORD(v60) * (unint64_t)a3
            + v63
            + ((v60 * (unint64_t)a3) >> 32);
        v66 = HIDWORD(v65);
        v67 = (v60 * a3) | ((unint64_t)v65 << 32);
        v68 = HIDWORD(v61);
        v69 = v61 * (unint64_t)HIDWORD(a3);
        v70 = HIDWORD(v61) * (unint64_t)a3
            + v69
            + ((v61 * (unint64_t)a3) >> 32);
        v71 = (v61 * a3) | ((unint64_t)v70 << 32);
        v72 = __PAIR128__(v64, v67)
            + __PAIR128__(v66, HIDWORD(v69) + HIDWORD(v61) * (unint64_t)HIDWORD(a3) + HIDWORD(v70));
        v73 = HIDWORD(v11);
        v74 = v60 * (unint64_t)v73;
        v75 = v60 * (unint64_t)a4;
        v76 = v62 * (unint64_t)a4;
        v77 = HIDWORD(v74) + v62 * (unint64_t)v73;
        v78 = v76 + v74 + HIDWORD(v75);
        v79 = HIDWORD(v78);
        v80 = v75 | ((unint64_t)v78 << 32);
        v81 = v61 * (unint64_t)v73;
        v82 = v61 * (unint64_t)a4;
        v83 = HIDWORD(v81) + v68 * (unint64_t)v73;
        v84 = v68 * (unint64_t)a4 + v81 + HIDWORD(v82);
        v85 = v82 | ((unint64_t)v84 << 32);
        v86 = __PAIR128__(v77, v80) + __PAIR128__(v79, v83 + HIDWORD(v84));
        v87 = v72 + v85;
        v88 = __CFADD__((_QWORD)v72, v85) + (_QWORD)v86;
        LODWORD(v89) = __CFADD__(__CFADD__((_QWORD)v72, v85), (_QWORD)v86);
        v124 = __CFADD__(*((_QWORD *)&v72 + 1), v88);
        v90 = *((_QWORD *)&v72 + 1) + v88;
        if (v124)
          v89 = 1;
        else
          v89 = v89;
        v91 = v89 << 63 >> 63;
        if (v90)
          v92 = 0;
        else
          v92 = *((_QWORD *)&v86 + 1) == v91;
        v93 = v92;
        if (v87 == v8 && v93 && v71 == a1)
          return 1;
        if (v93)
          v19 = v87 < v8 || v71 < a1 && v87 == v8;
        else
          v19 = 0;
        goto LABEL_55;
      }
      v111 = __bid_ten2k64[v17];
      v112 = HIDWORD(v111);
      v113 = HIDWORD(v11);
      v114 = HIDWORD(v111) * (unint64_t)a4;
      v115 = HIDWORD(v114) + HIDWORD(v111) * (unint64_t)v113;
      v116 = v111 * (unint64_t)v113
           + v114
           + ((v111 * (unint64_t)a4) >> 32);
      v117 = (v111 * a4) | ((unint64_t)v116 << 32);
      v118 = HIDWORD(v111) * (unint64_t)a3;
      v119 = v111 * (unint64_t)a3;
      v120 = v111 * (unint64_t)HIDWORD(a3) + v118 + HIDWORD(v119);
      v121 = HIDWORD(v118) + v112 * (unint64_t)HIDWORD(a3) + HIDWORD(v120);
      v122 = v119 | ((unint64_t)v120 << 32);
      v123 = v117 + v121;
      if (v115 + HIDWORD(v116))
        v124 = 0;
      else
        v124 = v123 >= v121;
      v125 = v124;
      if (v122 == a1 && v123 == v8 && (v125 & 1) != 0)
        return 1;
      if (v125)
        v19 = v123 < v8 || v122 < a1 && v123 == v8;
      else
        v19 = 0;
    }
    else
    {
      if (v21 >= 0x22)
        return a2 >= 0;
      if (v21 < 0x14)
      {
        v94 = __bid_ten2k64[v21];
        v95 = HIDWORD(v94);
        v96 = HIDWORD(v8);
        v97 = HIDWORD(v94) * (unint64_t)a2;
        v98 = HIDWORD(v97) + HIDWORD(v94) * (unint64_t)v96;
        v99 = v94 * (unint64_t)v96
            + v97
            + ((v94 * (unint64_t)a2) >> 32);
        v100 = HIDWORD(v99);
        v101 = (v94 * a2) | ((unint64_t)v99 << 32);
        v102 = HIDWORD(v94) * (unint64_t)a1;
        v103 = v94 * (unint64_t)a1;
        v104 = v94 * (unint64_t)HIDWORD(a1) + v102 + HIDWORD(v103);
        v105 = v103 | ((unint64_t)v104 << 32);
        v106 = __PAIR128__(v98, v101)
             + __PAIR128__(v100, HIDWORD(v102) + v95 * (unint64_t)HIDWORD(a1) + HIDWORD(v104));
        if (__PAIR128__(v98, v101)
           + __PAIR128__(v100, HIDWORD(v102) + v95 * (unint64_t)HIDWORD(a1) + HIDWORD(v104)) == v11
          && v105 == a3)
        {
          return 1;
        }
        v56 = (unint64_t)v106 > v11;
        v107 = (_QWORD)v106 == v11;
        v108 = v56;
        if (*((_QWORD *)&v106 + 1))
          v109 = 1;
        else
          v109 = v108;
        v110 = v105 > a3 && v107;
        v19 = v109 | v110;
      }
      else
      {
        v22 = &__bid_ten2k128[2 * (v21 - 20)];
        v24 = *v22;
        v23 = v22[1];
        v25 = HIDWORD(v23);
        v26 = v23 * (unint64_t)HIDWORD(a1);
        v27 = HIDWORD(v26) + HIDWORD(v23) * (unint64_t)HIDWORD(a1);
        v28 = HIDWORD(v23) * (unint64_t)a1
            + v26
            + ((v23 * (unint64_t)a1) >> 32);
        v29 = HIDWORD(v28);
        v30 = (v23 * a1) | ((unint64_t)v28 << 32);
        v31 = HIDWORD(v24);
        v32 = v24 * (unint64_t)HIDWORD(a1);
        v33 = HIDWORD(v24) * (unint64_t)a1
            + v32
            + ((v24 * (unint64_t)a1) >> 32);
        v34 = (v24 * a1) | ((unint64_t)v33 << 32);
        v35 = __PAIR128__(v27, v30)
            + __PAIR128__(v29, HIDWORD(v32) + HIDWORD(v24) * (unint64_t)HIDWORD(a1) + HIDWORD(v33));
        v36 = HIDWORD(v8);
        v37 = v23 * (unint64_t)v36;
        v38 = v23 * (unint64_t)a2;
        v39 = v25 * (unint64_t)a2;
        v40 = HIDWORD(v37) + v25 * (unint64_t)v36;
        v41 = v39 + v37 + HIDWORD(v38);
        v42 = HIDWORD(v41);
        v43 = v38 | ((unint64_t)v41 << 32);
        v44 = v24 * (unint64_t)v36;
        v45 = v24 * (unint64_t)a2;
        v46 = HIDWORD(v44) + v31 * (unint64_t)v36;
        v47 = v31 * (unint64_t)a2 + v44 + HIDWORD(v45);
        v48 = v45 | ((unint64_t)v47 << 32);
        v49 = __PAIR128__(v40, v43) + __PAIR128__(v42, v46 + HIDWORD(v47));
        v50 = v35 + v48;
        v51 = __CFADD__((_QWORD)v35, v48) + (_QWORD)v49;
        v52 = __CFADD__(__CFADD__((_QWORD)v35, v48), (_QWORD)v49);
        v124 = __CFADD__(*((_QWORD *)&v35 + 1), v51);
        v53 = *((_QWORD *)&v35 + 1) + v51;
        v54 = v124 || v52;
        v55 = (*((_QWORD *)&v49 + 1) + v54) | v53;
        if (v50 == v11 && !v55 && v34 == a3)
          return 1;
        v56 = v50 > v11;
        v57 = v50 == v11;
        v58 = v56;
        if (v55)
          v58 = 1;
        if (v34 <= a3)
          v57 = 0;
        v19 = v58 | v57;
      }
    }
    v20 = a4 >> 63;
    return v19 ^ v20;
  }
  if ((~a2 & 0x7E00000000000000) != 0 && (a4 & 0x7E00000000000000) != 0x7E00000000000000)
    return 0;
  result = 0;
  *a5 |= 1u;
  return result;
}

unint64_t __bid128_quiet_less(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  unint64_t v11;
  char v12;
  char v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unsigned __int128 v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unsigned __int128 v48;
  unint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  _BOOL4 v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unsigned __int128 v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unsigned __int128 v84;
  unint64_t v85;
  uint64_t v86;
  _BOOL4 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  _BOOL4 v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unsigned int v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unsigned __int128 v108;
  BOOL v109;
  _BOOL4 v110;
  int v111;
  unint64_t v112;
  unint64_t v113;
  unsigned int v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unsigned __int128 v125;
  _BOOL4 v126;
  _BOOL4 v127;

  if ((~a2 & 0x7C00000000000000) == 0 || (a4 & 0x7C00000000000000) == 0x7C00000000000000)
  {
    if ((~a2 & 0x7E00000000000000) == 0 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
    {
      v6 = 0;
      *a5 |= 1u;
      return v6;
    }
    return 0;
  }
  if (a1 == a3 && a2 == a4)
    return 0;
  if ((~a2 & 0x7800000000000000) == 0)
  {
    LODWORD(v6) = (~a4 & 0x7800000000000000) != 0 || a4 >= 0;
    if ((a2 & 0x8000000000000000) != 0)
      return v6;
    else
      return 0;
  }
  if ((~a4 & 0x7800000000000000) == 0)
    goto LABEL_20;
  v8 = a2 & 0x1FFFFFFFFFFFFLL;
  v9 = (~a2 & 0x6000000000000000) == 0;
  v10 = a1 > 0x378D8E63FFFFFFFFLL && v8 == 0x1ED09BEAD87C0;
  if (v10)
    v9 = 1;
  if (v8 > 0x1ED09BEAD87C0)
    v9 = 1;
  v11 = a4 & 0x1FFFFFFFFFFFFLL;
  if ((a4 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
  {
    if (v8 | a1)
      v12 = v9;
    else
      v12 = 1;
    if ((v12 & 1) == 0)
      return a2 >> 63;
    return 0;
  }
  if (v8 | a1)
    v13 = v9;
  else
    v13 = 1;
  v14 = a3 >= 0x378D8E6400000000 && v11 == 0x1ED09BEAD87C0;
  if (v14 || (a4 & 0x6000000000000000) == 0x6000000000000000 || !(v11 | a3))
  {
    if ((v13 & 1) == 0)
      return a2 >> 63;
    return 0;
  }
  if ((v13 & 1) != 0 || ((a4 ^ a2) & 0x8000000000000000) != 0)
  {
LABEL_20:
    v7 = (unint64_t)a4 >> 63;
    return v7 ^ 1;
  }
  v16 = (a2 >> 49) & 0x3FFF;
  v17 = ((unint64_t)a4 >> 49) & 0x3FFF;
  v18 = v17 - v16;
  if ((_DWORD)v17 == (_DWORD)v16)
  {
    v19 = v8 == v11;
    if (a1 < a3)
      v19 = 0;
    if (v8 > v11)
      v19 = 1;
    v20 = (a2 & 0x8000000000000000) != 0;
    goto LABEL_56;
  }
  if ((v8 > v11 || v8 == v11 && a1 > a3) && v16 >= v17)
    return a2 >> 63;
  if ((v8 < v11 || v8 == v11 && a1 < a3) && v16 <= v17)
  {
LABEL_69:
    v7 = a2 >> 63;
    return v7 ^ 1;
  }
  v22 = v16 - v17;
  if (v22 < 1)
  {
    if (v18 >= 34)
      goto LABEL_69;
    if (v18 < 20)
    {
      v112 = __bid_ten2k64[v18];
      v113 = HIDWORD(v112);
      v114 = v112;
      v115 = HIDWORD(v11);
      v116 = HIDWORD(v112) * (unint64_t)a4;
      v117 = v112 * (unint64_t)v115;
      v118 = HIDWORD(v116) + HIDWORD(v112) * (unint64_t)v115;
      v119 = v117 + v116 + ((v112 * (unint64_t)a4) >> 32);
      v120 = (v112 * a4) | ((unint64_t)v119 << 32);
      v121 = HIDWORD(v112) * (unint64_t)a3;
      v122 = v112 * (unint64_t)a3;
      v123 = v114 * (unint64_t)HIDWORD(a3) + v121 + HIDWORD(v122);
      v124 = v122 | ((unint64_t)v123 << 32);
      v125 = __PAIR128__(v118, v120)
           + __PAIR128__(HIDWORD(v119), HIDWORD(v121) + v113 * (unint64_t)HIDWORD(a3) + HIDWORD(v123));
      if (v120 + HIDWORD(v121) + v113 * (unint64_t)HIDWORD(a3) + HIDWORD(v123) == v8
        && v124 == a1
        && !*((_QWORD *)&v125 + 1))
      {
        return 0;
      }
      v126 = v124 > a1;
      v10 = (_QWORD)v125 == v8;
      v127 = (unint64_t)v125 > v8;
      if (!v10)
        v126 = 0;
      if (*((_QWORD *)&v125 + 1))
        v127 = 1;
      v93 = v126 || v127;
      v94 = (unint64_t)a4 >> 63;
    }
    else
    {
      v57 = &__bid_ten2k128[2 * (v18 - 20)];
      v59 = *v57;
      v58 = v57[1];
      v60 = HIDWORD(v58);
      v61 = v58 * (unint64_t)HIDWORD(a3);
      v62 = HIDWORD(v61) + HIDWORD(v58) * (unint64_t)HIDWORD(a3);
      v63 = HIDWORD(v58) * (unint64_t)a3
          + v61
          + ((v58 * (unint64_t)a3) >> 32);
      v64 = HIDWORD(v63);
      v65 = (v58 * a3) | ((unint64_t)v63 << 32);
      v66 = HIDWORD(v59);
      v67 = v59 * (unint64_t)HIDWORD(a3);
      v68 = HIDWORD(v59) * (unint64_t)a3
          + v67
          + ((v59 * (unint64_t)a3) >> 32);
      v69 = (v59 * a3) | ((unint64_t)v68 << 32);
      v70 = __PAIR128__(v62, v65)
          + __PAIR128__(v64, HIDWORD(v67) + HIDWORD(v59) * (unint64_t)HIDWORD(a3) + HIDWORD(v68));
      v71 = HIDWORD(v11);
      v72 = v58 * (unint64_t)v71;
      v73 = v58 * (unint64_t)a4;
      v74 = v60 * (unint64_t)a4;
      v75 = HIDWORD(v72) + v60 * (unint64_t)v71;
      v76 = v74 + v72 + HIDWORD(v73);
      v77 = HIDWORD(v76);
      v78 = v73 | ((unint64_t)v76 << 32);
      v79 = v59 * (unint64_t)v71;
      v80 = v59 * (unint64_t)a4;
      v81 = HIDWORD(v79) + v66 * (unint64_t)v71;
      v82 = v66 * (unint64_t)a4 + v79 + HIDWORD(v80);
      v83 = v80 | ((unint64_t)v82 << 32);
      v84 = __PAIR128__(v75, v78) + __PAIR128__(v77, v81 + HIDWORD(v82));
      v85 = v70 + v83;
      v86 = __CFADD__((_QWORD)v70, v83) + (_QWORD)v84;
      v87 = __CFADD__(__CFADD__((_QWORD)v70, v83), (_QWORD)v84);
      v50 = __CFADD__(*((_QWORD *)&v70 + 1), v86);
      v88 = *((_QWORD *)&v70 + 1) + v86;
      v89 = v50 || v87;
      v90 = (*((_QWORD *)&v84 + 1) + v89) | v88;
      if (v85 == v8 && !v90)
      {
        v6 = 0;
        if (v69 == a1)
          return v6;
      }
      v91 = v69 > a1;
      v10 = v85 == v8;
      v92 = v85 > v8;
      if (!v10)
        v91 = 0;
      if (v90)
        v92 = 1;
      v93 = v92 || v91;
      v94 = a2 >> 63;
    }
    return v93 ^ v94;
  }
  if (v22 >= 0x22)
    return a2 >> 63;
  if (v22 < 0x14)
  {
    v95 = __bid_ten2k64[v22];
    v96 = HIDWORD(v95);
    v97 = v95;
    v98 = HIDWORD(v8);
    v99 = HIDWORD(v95) * (unint64_t)a2;
    v100 = v95 * (unint64_t)v98;
    v101 = HIDWORD(v99) + HIDWORD(v95) * (unint64_t)v98;
    v102 = v100 + v99 + ((v95 * (unint64_t)a2) >> 32);
    v103 = (v95 * a2) | ((unint64_t)v102 << 32);
    v104 = HIDWORD(v95) * (unint64_t)a1;
    v105 = v95 * (unint64_t)a1;
    v106 = v97 * (unint64_t)HIDWORD(a1) + v104 + HIDWORD(v105);
    v107 = v105 | ((unint64_t)v106 << 32);
    v108 = __PAIR128__(v101, v103)
         + __PAIR128__(HIDWORD(v102), HIDWORD(v104) + v96 * (unint64_t)HIDWORD(a1) + HIDWORD(v106));
    if (__PAIR128__(v101, v103)
       + __PAIR128__(HIDWORD(v102), HIDWORD(v104) + v96 * (unint64_t)HIDWORD(a1) + HIDWORD(v106)) == v11
      && v107 == a3)
    {
      return 0;
    }
    v109 = (unint64_t)v108 > v11;
    v110 = (_QWORD)v108 == v11;
    v111 = v109;
    if (*((_QWORD *)&v108 + 1))
      v56 = 1;
    else
      v56 = v111;
    v55 = v107 > a3 && v110;
    goto LABEL_114;
  }
  v24 = &__bid_ten2k128[2 * (v22 - 20)];
  v23 = v24[1];
  v25 = HIDWORD(v23);
  v26 = v23 * (unint64_t)HIDWORD(a1);
  v27 = HIDWORD(v26) + HIDWORD(v23) * (unint64_t)HIDWORD(a1);
  v28 = HIDWORD(v23) * (unint64_t)a1
      + v26
      + ((v23 * (unint64_t)a1) >> 32);
  v29 = HIDWORD(v28);
  v30 = (v23 * a1) | ((unint64_t)v28 << 32);
  v31 = HIDWORD(*v24);
  v32 = *v24 * (unint64_t)HIDWORD(a1);
  v33 = HIDWORD(*v24) * (unint64_t)a1
      + v32
      + ((*v24 * (unint64_t)a1) >> 32);
  v34 = (*v24 * a1) | ((unint64_t)v33 << 32);
  v35 = __PAIR128__(v27, v30)
      + __PAIR128__(v29, HIDWORD(v32) + HIDWORD(*v24) * (unint64_t)HIDWORD(a1) + HIDWORD(v33));
  v36 = HIDWORD(v8);
  v37 = v23 * (unint64_t)v36;
  v38 = v23 * (unint64_t)a2;
  v39 = v25 * (unint64_t)a2;
  v40 = HIDWORD(v37) + v25 * (unint64_t)v36;
  v41 = v39 + v37 + HIDWORD(v38);
  v42 = HIDWORD(v41);
  v43 = v38 | ((unint64_t)v41 << 32);
  v44 = *v24 * (unint64_t)v36;
  v45 = HIDWORD(v44) + v31 * (unint64_t)v36;
  v46 = v31 * (unint64_t)a2
      + v44
      + ((*v24 * (unint64_t)a2) >> 32);
  v47 = (*v24 * a2) | ((unint64_t)v46 << 32);
  v48 = __PAIR128__(v40, v43) + __PAIR128__(v42, v45 + HIDWORD(v46));
  v49 = v35 + v47;
  v50 = __CFADD__(__CFADD__((_QWORD)v35, v47), (_QWORD)v48);
  v51 = __CFADD__((_QWORD)v35, v47) + (_QWORD)v48;
  LODWORD(v52) = v50;
  v50 = __CFADD__(*((_QWORD *)&v35 + 1), v51);
  v53 = *((_QWORD *)&v35 + 1) + v51;
  if (v50)
    v52 = 1;
  else
    v52 = v52;
  v54 = (*((_QWORD *)&v48 + 1) + v52) | v53;
  if (v49 != v11 || v54 || (v6 = 0, v34 != a3))
  {
    v55 = v49 == v11;
    v56 = v49 > v11;
    if (v54)
      v56 = 1;
    if (v34 <= a3)
      v55 = 0;
LABEL_114:
    v19 = v56 || v55;
    v20 = a4 < 0;
LABEL_56:
    v21 = !v20;
    return v21 ^ v19;
  }
  return v6;
}

uint64_t __bid128_quiet_less_equal(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t result;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  char v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _BOOL4 v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unsigned __int128 v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unsigned __int128 v51;
  unint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  _BOOL4 v60;
  int v61;
  unint64_t *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unsigned __int128 v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unsigned __int128 v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BOOL4 v95;
  _BOOL4 v96;
  _BOOL4 v97;
  int v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unsigned __int128 v112;
  _BOOL4 v113;
  int v114;
  int v115;
  _BOOL4 v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unsigned __int128 v129;
  _BOOL4 v130;
  _BOOL4 v131;

  if ((~a2 & 0x7C00000000000000) != 0 && (a4 & 0x7C00000000000000) != 0x7C00000000000000)
  {
    if (a1 == a3 && a2 == a4)
      return 1;
    if ((~a2 & 0x7800000000000000) == 0)
    {
      v7 = (~a4 & 0x7800000000000000) == 0 && a4 >= 0;
      return (a2 & 0x8000000000000000) != 0 || v7;
    }
    if ((~a4 & 0x7800000000000000) == 0)
      goto LABEL_21;
    v9 = a2 & 0x1FFFFFFFFFFFFLL;
    v10 = (~a2 & 0x6000000000000000) == 0;
    v11 = a1 > 0x378D8E63FFFFFFFFLL && v9 == 0x1ED09BEAD87C0;
    if (v11)
      v10 = 1;
    if (v9 > 0x1ED09BEAD87C0)
      v10 = 1;
    v12 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
    {
      if (v9 | a1)
        v13 = v10;
      else
        v13 = 1;
      if ((v13 & 1) != 0)
        return 1;
      return a2 >> 63;
    }
    if (v9 | a1)
      v14 = v10;
    else
      v14 = 1;
    v15 = a3 >= 0x378D8E6400000000 && v12 == 0x1ED09BEAD87C0;
    if (v15 || (a4 & 0x6000000000000000) == 0x6000000000000000 || !(v12 | a3))
    {
      if ((v14 & 1) == 0)
        return a2 >> 63;
      return 1;
    }
    if ((v14 & 1) != 0 || ((a4 ^ a2) & 0x8000000000000000) != 0)
    {
LABEL_21:
      v8 = (unint64_t)a4 >> 63;
      return v8 ^ 1;
    }
    v16 = (a2 >> 49) & 0x3FFF;
    v17 = ((unint64_t)a4 >> 49) & 0x3FFF;
    v18 = v17 - v16;
    if ((_DWORD)v17 == (_DWORD)v16)
    {
      v19 = v9 == v12;
      if (a1 < a3)
        v19 = 0;
      v20 = v9 > v12 || v19;
      v21 = (a2 & 0x8000000000000000) != 0;
LABEL_57:
      v22 = !v21;
      return v22 ^ v20;
    }
    if ((v9 > v12 || v9 == v12 && a1 > a3) && v16 >= v17)
      return a2 >> 63;
    if (v9 >= v12 && (v9 != v12 || a1 >= a3) || v16 > v17)
    {
      v23 = v16 - v17;
      if (v23 >= 1)
      {
        if (v23 < 0x22)
        {
          if (v23 < 0x14)
          {
            v100 = __bid_ten2k64[v23];
            v101 = HIDWORD(v100);
            v102 = HIDWORD(v9);
            v103 = HIDWORD(v100) * (unint64_t)a2;
            v104 = HIDWORD(v103) + HIDWORD(v100) * (unint64_t)v102;
            v105 = v100 * (unint64_t)v102
                 + v103
                 + ((v100 * (unint64_t)a2) >> 32);
            v106 = HIDWORD(v105);
            v107 = (v100 * a2) | ((unint64_t)v105 << 32);
            v108 = HIDWORD(v100) * (unint64_t)a1;
            v109 = v100 * (unint64_t)a1;
            v110 = v100 * (unint64_t)HIDWORD(a1) + v108 + HIDWORD(v109);
            v111 = v109 | ((unint64_t)v110 << 32);
            v112 = __PAIR128__(v104, v107)
                 + __PAIR128__(v106, HIDWORD(v108) + v101 * (unint64_t)HIDWORD(a1) + HIDWORD(v110));
            if (__PAIR128__(v104, v107)
               + __PAIR128__(v106, HIDWORD(v108) + v101 * (unint64_t)HIDWORD(a1) + HIDWORD(v110)) == v12
              && v111 == a3)
            {
              return 1;
            }
            v59 = (unint64_t)v112 > v12;
            v113 = (_QWORD)v112 == v12;
            v114 = v59;
            if (*((_QWORD *)&v112 + 1))
              v115 = 1;
            else
              v115 = v114;
            v116 = v111 > a3 && v113;
            v20 = v115 | v116;
          }
          else
          {
            v24 = &__bid_ten2k128[2 * (v23 - 20)];
            v26 = *v24;
            v25 = v24[1];
            v27 = HIDWORD(v25);
            v28 = v25 * (unint64_t)HIDWORD(a1);
            v29 = HIDWORD(v28) + HIDWORD(v25) * (unint64_t)HIDWORD(a1);
            v30 = HIDWORD(v25) * (unint64_t)a1
                + v28
                + ((v25 * (unint64_t)a1) >> 32);
            v31 = HIDWORD(v30);
            v32 = (v25 * a1) | ((unint64_t)v30 << 32);
            v33 = HIDWORD(v26);
            v34 = v26 * (unint64_t)HIDWORD(a1);
            v35 = HIDWORD(v26) * (unint64_t)a1
                + v34
                + ((v26 * (unint64_t)a1) >> 32);
            v36 = (v26 * a1) | ((unint64_t)v35 << 32);
            v37 = __PAIR128__(v29, v32)
                + __PAIR128__(v31, HIDWORD(v34) + HIDWORD(v26) * (unint64_t)HIDWORD(a1) + HIDWORD(v35));
            v38 = HIDWORD(v9);
            v39 = v25 * (unint64_t)v38;
            v40 = v25 * (unint64_t)a2;
            v41 = v27 * (unint64_t)a2;
            v42 = HIDWORD(v39) + v27 * (unint64_t)v38;
            v43 = v41 + v39 + HIDWORD(v40);
            v44 = HIDWORD(v43);
            v45 = v40 | ((unint64_t)v43 << 32);
            v46 = v26 * (unint64_t)v38;
            v47 = v26 * (unint64_t)a2;
            v48 = HIDWORD(v46) + v33 * (unint64_t)v38;
            v49 = v33 * (unint64_t)a2 + v46 + HIDWORD(v47);
            v50 = v47 | ((unint64_t)v49 << 32);
            v51 = __PAIR128__(v42, v45) + __PAIR128__(v44, v48 + HIDWORD(v49));
            v52 = v37 + v50;
            v53 = __CFADD__((_QWORD)v37, v50) + (_QWORD)v51;
            v54 = __CFADD__(__CFADD__((_QWORD)v37, v50), (_QWORD)v51);
            v55 = __CFADD__(*((_QWORD *)&v37 + 1), v53);
            v56 = *((_QWORD *)&v37 + 1) + v53;
            v57 = v55 || v54;
            v58 = (*((_QWORD *)&v51 + 1) + v57) | v56;
            if (v52 == v12 && !v58 && v36 == a3)
              return 1;
            v59 = v52 > v12;
            v60 = v52 == v12;
            v61 = v59;
            if (v58)
              v61 = 1;
            if (v36 <= a3)
              v60 = 0;
            v20 = v61 | v60;
          }
          v21 = a4 < 0;
          goto LABEL_57;
        }
        return a2 >> 63;
      }
      if (v18 < 34)
      {
        if (v18 < 20)
        {
          v117 = __bid_ten2k64[v18];
          v118 = HIDWORD(v117);
          v119 = HIDWORD(v12);
          v120 = HIDWORD(v117) * (unint64_t)a4;
          v121 = HIDWORD(v120) + HIDWORD(v117) * (unint64_t)v119;
          v122 = v117 * (unint64_t)v119
               + v120
               + ((v117 * (unint64_t)a4) >> 32);
          v123 = HIDWORD(v122);
          v124 = (v117 * a4) | ((unint64_t)v122 << 32);
          v125 = HIDWORD(v117) * (unint64_t)a3;
          v126 = v117 * (unint64_t)a3;
          v127 = v117 * (unint64_t)HIDWORD(a3) + v125 + HIDWORD(v126);
          v128 = v126 | ((unint64_t)v127 << 32);
          v129 = __PAIR128__(v121, v124)
               + __PAIR128__(v123, HIDWORD(v125) + v118 * (unint64_t)HIDWORD(a3) + HIDWORD(v127));
          if (v124 + HIDWORD(v125) + v118 * (unint64_t)HIDWORD(a3) + HIDWORD(v127) == v9
            && v128 == a1
            && !*((_QWORD *)&v129 + 1))
          {
            return 1;
          }
          v130 = v128 > a1;
          v11 = (_QWORD)v129 == v9;
          v131 = (unint64_t)v129 > v9;
          if (!v11)
            v130 = 0;
          if (*((_QWORD *)&v129 + 1))
            v131 = 1;
          v98 = v130 || v131;
          v99 = (unint64_t)a4 >> 63;
        }
        else
        {
          v62 = &__bid_ten2k128[2 * (v18 - 20)];
          v64 = *v62;
          v63 = v62[1];
          v65 = HIDWORD(v63);
          v66 = v63 * (unint64_t)HIDWORD(a3);
          v67 = HIDWORD(v66) + HIDWORD(v63) * (unint64_t)HIDWORD(a3);
          v68 = HIDWORD(v63) * (unint64_t)a3
              + v66
              + ((v63 * (unint64_t)a3) >> 32);
          v69 = HIDWORD(v68);
          v70 = (v63 * a3) | ((unint64_t)v68 << 32);
          v71 = HIDWORD(v64);
          v72 = v64 * (unint64_t)HIDWORD(a3);
          v73 = HIDWORD(v64) * (unint64_t)a3
              + v72
              + ((v64 * (unint64_t)a3) >> 32);
          v74 = (v64 * a3) | ((unint64_t)v73 << 32);
          v75 = __PAIR128__(v67, v70)
              + __PAIR128__(v69, HIDWORD(v72) + HIDWORD(v64) * (unint64_t)HIDWORD(a3) + HIDWORD(v73));
          v76 = HIDWORD(v12);
          v77 = v63 * (unint64_t)v76;
          v78 = v63 * (unint64_t)a4;
          v79 = v65 * (unint64_t)a4;
          v80 = HIDWORD(v77) + v65 * (unint64_t)v76;
          v81 = v79 + v77 + HIDWORD(v78);
          v82 = HIDWORD(v81);
          v83 = v78 | ((unint64_t)v81 << 32);
          v84 = v64 * (unint64_t)v76;
          v85 = v64 * (unint64_t)a4;
          v86 = HIDWORD(v84) + v71 * (unint64_t)v76;
          v87 = v71 * (unint64_t)a4 + v84 + HIDWORD(v85);
          v88 = v85 | ((unint64_t)v87 << 32);
          v89 = __PAIR128__(v80, v83) + __PAIR128__(v82, v86 + HIDWORD(v87));
          v90 = v75 + v88;
          v91 = __CFADD__((_QWORD)v75, v88) + (_QWORD)v89;
          LODWORD(v92) = __CFADD__(__CFADD__((_QWORD)v75, v88), (_QWORD)v89);
          v55 = __CFADD__(*((_QWORD *)&v75 + 1), v91);
          v93 = *((_QWORD *)&v75 + 1) + v91;
          if (v55)
            v92 = 1;
          else
            v92 = v92;
          v94 = (*((_QWORD *)&v89 + 1) + v92) | v93;
          if (v90 == v9 && !v94 && v74 == a1)
            return 1;
          v95 = v74 > a1;
          v11 = v90 == v9;
          v96 = v90 > v9;
          v97 = v11 && v95;
          if (v94)
            v96 = 1;
          v98 = v96 || v97;
          v99 = a2 >> 63;
        }
        return v98 ^ v99;
      }
    }
    v8 = a2 >> 63;
    return v8 ^ 1;
  }
  if ((~a2 & 0x7E00000000000000) != 0 && (a4 & 0x7E00000000000000) != 0x7E00000000000000)
    return 0;
  result = 0;
  *a5 |= 1u;
  return result;
}

unint64_t __bid128_cos(unint64_t result, int64_t a2, int a3)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unsigned __int128 v38;
  _BOOL4 v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unsigned __int128 v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  __int128 v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  int v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  int v102;
  int v103;
  unint64_t v104;
  int8x16_t v105;
  int8x16_t v106;
  __int32 v107;
  unint64_t v108;
  __int128 v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  int v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  __n128 v122;
  __n128 v123;
  _QWORD v124[3];
  _QWORD v125[4];

  v122 = 0uLL;
  if ((~a2 & 0x6000000000000000) != 0)
  {
    v4 = (((unint64_t)a2 >> 49) & 0x3FFF) - 6176;
    v5 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0 || result >= 0x378D8E6400000000 && v5 == 0x1ED09BEAD87C0)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v6 = result;
    }
  }
  else
  {
    if ((~a2 & 0x7800000000000000) == 0)
    {
      if ((~a2 & 0x7C00000000000000) != 0)
      {
        result = 0;
        my_fpsf |= 1u;
      }
      else
      {
        if ((~a2 & 0x7E00000000000000) == 0)
          my_fpsf |= 1u;
        if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
          || result >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
        {
          return 0;
        }
      }
      return result;
    }
    v5 = 0;
    v6 = 0;
    v4 = 0;
  }
  if (v6 | v5)
    v7 = v4;
  else
    v7 = -53;
  if (v7 > -36)
  {
    v8 = (uint64_t *)((char *)&bid_decimal128_moduli_1144 + 48 * (v7 + 35));
    v9 = *v8;
    v10 = v8[1];
    v12 = v8[2];
    v11 = v8[3];
    v13 = v8[4];
    v120 = v8[5];
    v14 = HIDWORD(*v8);
    v15 = ((v9 * (unint64_t)HIDWORD(v6)) >> 32)
        + HIDWORD(v9) * (unint64_t)HIDWORD(v6)
        + ((HIDWORD(v9) * (unint64_t)v6
          + (v9 * HIDWORD(v6))
          + ((v9 * (unint64_t)v6) >> 32)) >> 32);
    v16 = HIDWORD(v10);
    v17 = v10 * (unint64_t)HIDWORD(v6);
    v18 = HIDWORD(v17) + HIDWORD(v10) * (unint64_t)HIDWORD(v6);
    v19 = HIDWORD(v10) * (unint64_t)v6
        + v17
        + ((v10 * (unint64_t)v6) >> 32);
    v20 = v18 + HIDWORD(v19);
    v21 = (v10 * v6) | ((unint64_t)v19 << 32);
    v22 = HIDWORD(v12);
    v23 = v12 * (unint64_t)HIDWORD(v6);
    v24 = HIDWORD(v23) + HIDWORD(v12) * (unint64_t)HIDWORD(v6);
    v25 = HIDWORD(v12) * (unint64_t)v6
        + v23
        + ((v12 * (unint64_t)v6) >> 32);
    v26 = v24 + HIDWORD(v25);
    v27 = (v12 * v6) | ((unint64_t)v25 << 32);
    v28 = HIDWORD(v11);
    v29 = v11 * (unint64_t)HIDWORD(v6);
    v121 = a3;
    v30 = HIDWORD(v29) + HIDWORD(v11) * (unint64_t)HIDWORD(v6);
    v31 = HIDWORD(v11) * (unint64_t)v6
        + v29
        + ((v11 * (unint64_t)v6) >> 32);
    v32 = v30 + HIDWORD(v31);
    v33 = (v11 * v6) | ((unint64_t)v31 << 32);
    v34 = HIDWORD(v13);
    v35 = v13 * (unint64_t)HIDWORD(v6);
    v36 = HIDWORD(v13) * (unint64_t)v6
        + v35
        + ((v13 * (unint64_t)v6) >> 32);
    v37 = (v13 * v6) | ((unint64_t)v36 << 32);
    v38 = __PAIR128__(v27, v15) + v21;
    v39 = __CFADD__(__CFADD__(v15, v21), v27);
    v40 = __CFADD__(v20, *((_QWORD *)&v38 + 1));
    v41 = v20 + *((_QWORD *)&v38 + 1);
    v42 = v40 || v39;
    v40 = __CFADD__(v33, v42);
    v43 = v33 + v42;
    v44 = v40;
    v45 = v26 + v43;
    if (__CFADD__(v26, v43))
      v46 = 1;
    else
      v46 = v44;
    v40 = __CFADD__(v37, v46);
    v47 = v37 + v46;
    v48 = v40;
    v49 = v32 + v47;
    if (__CFADD__(v32, v47))
      v50 = 1;
    else
      v50 = v48;
    v51 = HIDWORD(v5);
    v52 = *v8 * (unint64_t)HIDWORD(v5);
    v53 = v9 * (unint64_t)v5;
    v54 = HIDWORD(v52) + v14 * (unint64_t)HIDWORD(v5);
    v55 = v14 * (unint64_t)v5 + v52 + HIDWORD(v53);
    v56 = v54 + HIDWORD(v55);
    v57 = v53 | ((unint64_t)v55 << 32);
    v58 = v10 * (unint64_t)HIDWORD(v5);
    v59 = v10 * (unint64_t)v5;
    v60 = v16 * (unint64_t)v5;
    v61 = HIDWORD(v58) + v16 * (unint64_t)HIDWORD(v5);
    v62 = v60 + v58 + HIDWORD(v59);
    v63 = v61 + HIDWORD(v62);
    v64 = v59 | ((unint64_t)v62 << 32);
    v65 = v12 * (unint64_t)HIDWORD(v5);
    v66 = v12 * (unint64_t)v5;
    v67 = HIDWORD(v65) + v22 * (unint64_t)HIDWORD(v5);
    v68 = v22 * (unint64_t)v5 + v65 + HIDWORD(v66);
    v69 = v67 + HIDWORD(v68);
    v70 = v66 | ((unint64_t)v68 << 32);
    v71 = v11 * (unint64_t)HIDWORD(v5);
    v72 = v11 * (unint64_t)v5;
    v73 = v28 * (unint64_t)v5 + v71 + HIDWORD(v72);
    v74 = v72 | ((unint64_t)v73 << 32);
    v75 = v13 * v5;
    v76 = __PAIR128__(v70, v56) + v64;
    LODWORD(v77) = __CFADD__(__CFADD__(v56, v64), v70);
    v78 = v63 + *((_QWORD *)&v76 + 1);
    if (__CFADD__(v63, *((_QWORD *)&v76 + 1)))
      v77 = 1;
    else
      v77 = v77;
    v40 = __CFADD__(v74, v77);
    v79 = v74 + v77;
    LODWORD(v80) = v40;
    v40 = __CFADD__(v69, v79);
    v81 = v69 + v79;
    if (v40)
      v80 = 1;
    else
      v80 = v80;
    v82 = __CFADD__(v57, (_QWORD)v38) + (_QWORD)v76;
    LODWORD(v83) = __CFADD__(__CFADD__(v57, (_QWORD)v38), (_QWORD)v76);
    v40 = __CFADD__(v41, v82);
    v84 = v41 + v82;
    if (v40)
      v83 = 1;
    else
      v83 = v83;
    v40 = __CFADD__(v78, v83);
    v85 = v78 + v83;
    LODWORD(v86) = v40;
    v40 = __CFADD__(v85, v45);
    v87 = v85 + v45;
    if (v40)
      v86 = 1;
    else
      v86 = v86;
    v40 = __CFADD__(v81, v86);
    v88 = v81 + v86;
    LODWORD(v89) = v40;
    v40 = __CFADD__(v88, v49);
    v90 = v88 + v49;
    if (v40)
      v89 = 1;
    else
      v89 = v89;
    v91 = v75
        + v28 * (unint64_t)v51
        + HIDWORD(v71)
        + v34 * (unint64_t)HIDWORD(v6)
        + v120 * v6
        + HIDWORD(v35)
        + HIDWORD(v73)
        + HIDWORD(v36)
        + v80
        + v50
        + v89;
    v92 = v91 >> 62;
    *((_QWORD *)&v94 + 1) = v91;
    *(_QWORD *)&v94 = v90;
    v93 = v94 >> 62;
    *((_QWORD *)&v94 + 1) = v90;
    *(_QWORD *)&v94 = v87;
    v95 = v94 >> 62;
    *((_QWORD *)&v94 + 1) = v87;
    *(_QWORD *)&v94 = v84;
    v96 = v94 >> 62;
    v97 = 4 * v84;
    v98 = ((v91 >> 62) + 1) & 3;
    if (v93 >= 0)
    {
      v99 = (unint64_t)a2 >> 63;
    }
    else
    {
      LODWORD(v92) = v98;
      v99 = a2 >= 0;
    }
    if (v93 >= 0)
      v100 = v93;
    else
      v100 = ~v93;
    if (v93 >= 0)
    {
      v101 = v97;
    }
    else
    {
      v95 = ~v95;
      v96 = ~v96;
      v101 = ~v97;
    }
    if (a2 >= 0)
      v102 = v92;
    else
      v102 = -(int)v92 & 3;
    if (v100)
      v103 = 16382;
    else
      v103 = 16318;
    if (v100)
      v104 = v100;
    else
      v104 = v95;
    if (v100)
      v101 = v96;
    else
      v95 = v96;
    v105 = (int8x16_t)vdupq_n_s64(v104);
    v106 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v105, (int8x16_t)xmmword_1B8917CC0), (uint64x2_t)vandq_s8(v105, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v105, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v105, (int8x16_t)xmmword_1B8917CF0))));
    *(int8x8_t *)v106.i8 = vorr_s8(*(int8x8_t *)v106.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v106, v106, 8uLL));
    v107 = v106.i32[0] | v106.i32[1] | (2 * ((v104 & 0xCCCCCCCCCCCCCCCCLL) <= (v104 & 0x3333333333333333))) | ((v104 & 0xAAAAAAAAAAAAAAAALL) <= (v104 & 0x5555555555555555));
    v108 = (v101 >> -(char)v107) + (v95 << v107);
    if (v107)
      v104 = (v95 >> -(char)v107) + (v104 << v107);
    else
      v108 = v95;
    *((_QWORD *)&v109 + 1) = v104;
    *(_QWORD *)&v109 = v108;
    v123.n128_u64[0] = v109 >> 15;
    v123.n128_u64[1] = ((unint64_t)(v103 - v107) << 48) | (v99 << 63) | (v104 >> 15) & 0xFFFFFFFFFFFFLL;
    bid_f128_mul(&v123, (uint64_t *)&c_pi_ov_2, (uint64_t *)&v123);
    switch(v102)
    {
      case 0:
        v110 = qword_1B891F938;
        v111 = 2;
        v112 = 2;
        goto LABEL_102;
      case 1:
        v117 = &__dpml_bid_trig_x_table;
        v118 = 0;
        v119 = 1;
        goto LABEL_100;
      case 2:
        v117 = qword_1B891F938;
        v118 = 2;
        v119 = 2;
LABEL_100:
        __dpml_bid_C_ux_trig__((uint64_t *)&v123, v118, v119, v117, &v122, v125);
        memset(v124, 0, sizeof(v124));
        __dpml_bid_unpack_x_or_y__((uint64_t *)&v122, 0, (uint64_t)v124, &__dpml_bid_bid_x_table, (uint64_t)&v122, v125);
        break;
      case 3:
        v110 = &__dpml_bid_trig_x_table;
        v111 = 0;
        v112 = 1;
LABEL_102:
        __dpml_bid_C_ux_trig__((uint64_t *)&v123, v111, v112, v110, &v122, v125);
        break;
      default:
        break;
    }
    v115 = v122.n128_u64[1];
    v114 = v122.n128_u64[0];
    v116 = v121;
  }
  else
  {
    if (v7 <= 0xFFFFFFCB)
      return __bid128_add(1uLL, 0x3040000000000000, 1uLL, 0x2FF0000000000000, a3, &my_fpsf);
    v123.n128_u64[0] = __bid128_to_binary128(result, a2, a3, &my_fpsf);
    v123.n128_u64[1] = v113;
    __dpml_bid_C_ux_trig__((uint64_t *)&v123, 2, 2, qword_1B891F938, &v122, v125);
    v115 = v122.n128_u64[1];
    v114 = v122.n128_u64[0];
    v116 = a3;
  }
  return __binary128_to_bid128(v114, v115, v116, &my_fpsf);
}

uint64_t __bid128_div(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5, int *a6)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  unsigned int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unsigned __int128 v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unsigned __int128 v73;
  unint64_t v74;
  unint64_t v75;
  _BOOL8 v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  double v80;
  double v81;
  unint64_t v82;
  __int128 v83;
  BOOL v84;
  double v85;
  unint64_t v86;
  unsigned int v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  __int128 v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v100;
  unint64_t v101;
  __int128 v102;
  BOOL v103;
  double v104;
  unint64_t v105;
  unsigned int v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  __int128 v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  BOOL v130;
  uint64_t v131;
  unint64_t v132;
  unsigned __int128 v133;
  BOOL v134;
  unint64_t v135;
  int v136;
  int v138;
  __int128 v139;
  unint64_t v140;
  char *v141;
  char *v142;
  int v143;
  int v144;
  int v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unsigned int v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  _BOOL8 v167;
  int v168;
  unsigned __int128 v169;
  BOOL v170;
  unint64_t v171;
  int v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  int v176;
  double v177;
  double v178;
  double v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  __int128 v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unsigned int v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;
  unint64_t v203;
  unsigned int v204;
  unint64_t v205;
  uint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unsigned __int128 v214;
  unint64_t v215;
  unsigned int v216;
  unint64_t v217;
  uint64_t v218;
  __int128 v219;
  unint64_t v220;
  unsigned int v221;
  unint64_t v222;
  unsigned int v223;
  char *v224;
  char *v225;
  unsigned int v226;
  unint64_t v227;
  uint64_t v228;
  unint64_t v229;
  unsigned int v230;
  unsigned int v231;
  unint64_t v232;
  char *v233;
  char *v234;
  unsigned int v235;
  int v236;
  _BOOL4 v237;
  unint64_t v238;
  unint64_t v239;
  unsigned int v240;
  uint64_t v241;
  __int128 v242;
  unint64_t v243;
  unsigned int v244;
  int v245;
  unsigned __int128 v247;
  unint64_t *v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  _BOOL8 v267;
  unint64_t v268;
  unsigned __int128 v269;
  int v270;
  unint64_t v271;
  unint64_t v272;
  unint64_t v273;
  BOOL v274;
  BOOL v275;
  char v276;
  unint64_t v277;
  unint64_t v278;
  __int128 v280;
  double v281;
  unint64_t v282;
  unint64_t v283;
  unint64_t v284;
  unint64_t v285;
  __int128 v286;
  uint64_t v287;
  uint64_t v288;
  __int128 v289;
  signed __int128 v290;
  uint64_t v292;
  _BOOL4 v293;
  unint64_t v294;
  unsigned int v295;
  unsigned int v296;
  unint64_t v297;
  unint64_t v298;
  unint64_t v299;
  unint64_t v300;
  unint64_t v301;
  unint64_t v302;
  unint64_t v303;
  unint64_t v304;
  unint64_t v305;
  unint64_t v306;
  unint64_t v307;
  unint64_t v308;
  unint64_t v309;
  unint64_t v310;
  unint64_t v311;
  unint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  _BOOL8 v316;
  unint64_t v317;
  int v318;
  int v319;
  unint64_t v320;
  uint64_t v321;
  unint64_t v322;
  unint64_t v323;
  unint64_t v324;
  unint64_t v325;
  unint64_t v326;
  uint64_t v327;
  unint64_t v328;
  BOOL v329;
  uint64_t v330;
  unint64_t v331;
  unsigned __int128 v332;
  BOOL v333;
  unsigned int v334;
  int v335;
  unint64_t *v336;
  unint64_t v337;
  unint64_t v338;
  BOOL v339;
  uint64_t *v340;
  uint64_t v341;
  uint64_t v342;
  unint64_t v343;
  unsigned int v344;
  unint64_t v345;
  unint64_t v346;
  unint64_t v347;
  unint64_t v348;
  unint64_t v349;
  unint64_t v350;
  unint64_t v351;
  uint64_t v352;
  unint64_t v353;
  unint64_t v354;
  unint64_t v355;
  unint64_t v356;
  unint64_t v357;
  unint64_t v358;
  unint64_t v359;
  unint64_t v360;
  unint64_t v361;
  unint64_t v362;
  unint64_t v363;
  unint64_t v364;
  uint64_t v365;
  unint64_t v366;
  uint64_t v367;
  _BOOL4 v368;
  uint64_t v369;
  unint64_t v370;
  unint64_t v371;
  unint64_t v374;
  unsigned int v375;
  uint64_t v376;
  unint64_t v377;
  char v378;
  unint64_t v379;
  unint64_t v380;
  unint64_t v381;
  unint64_t v382;
  unint64_t v383;
  BOOL v384;
  _BOOL4 v385;
  int v387;
  unint64_t v388;
  unint64_t v389;

  v387 = a5;
  v7 = a4 & 0x7800000000000000;
  if (((a4 >> 61) & 3) == 3)
  {
    if (v7 == 0x7800000000000000)
    {
      v8 = 0xFE00000000000000;
      if ((a4 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
      {
        v13 = (a4 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a3 >= 0x38C15B0A00000000;
        if (!v13)
        {
          v8 = 0xFE003FFFFFFFFFFFLL;
          v9 = a3;
        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
      LODWORD(v11) = 0;
      v12 = 0;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        a3 = 0;
      else
        a3 = v9;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        v8 = 0xF800000000000000;
      v10 = v8 & a4;
    }
    else
    {
      a3 = 0;
      v10 = 0;
      v12 = 0;
      v11 = (a4 >> 47) & 0x3FFF;
    }
  }
  else
  {
    v10 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
      || (a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a3 >= 0x378D8E6400000000)
    {
      a3 = 0;
      v10 = 0;
    }
    v11 = (a4 >> 49) & 0x3FFF;
    v12 = v10 | a3;
  }
  v388 = 0;
  v389 = 0;
  if (((a2 >> 61) & 3) == 3)
  {
    if ((a2 & 0x7800000000000000) == 0x7800000000000000)
    {
      v15 = 0xFE00000000000000;
      if ((a2 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
      {
        if ((a2 & 0x3FFFFFFFFFFFLL) != 0x314DC6448D93 || a1 < 0x38C15B0A00000000)
        {
          v15 = 0xFE003FFFFFFFFFFFLL;
          v16 = a1;
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        v15 = 0xF800000000000000;
      v17 = v15 & a2;
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        a1 = 0;
      else
        a1 = v16;
      if ((a2 & 0x7C00000000000000) == 0x7C00000000000000)
        goto LABEL_71;
      if ((a4 & 0x7C00000000000000) != 0x7C00000000000000)
      {
        if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        {
LABEL_77:
          *a6 |= 1u;
          v36 = 0x7C00000000000000;
LABEL_211:
          v389 = v36;
          return v388;
        }
LABEL_210:
        v36 = (a4 ^ a2) & 0x8000000000000000 | 0x7800000000000000;
        goto LABEL_211;
      }
      LODWORD(v18) = 0;
      goto LABEL_38;
    }
    v17 = 0;
    a1 = 0;
    v18 = (a2 >> 47) & 0x3FFF;
  }
  else
  {
    v17 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
      || (a2 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a1 >= 0x378D8E6400000000)
    {
      a1 = 0;
      v17 = 0;
    }
    v18 = (a2 >> 49) & 0x3FFF;
    if (v17 | a1)
      goto LABEL_39;
  }
  if ((~a2 & 0x7C00000000000000) == 0)
  {
LABEL_71:
    if ((~a2 & 0x7E00000000000000) == 0 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
      *a6 |= 1u;
    v388 = a1;
    v389 = v17 & 0xFDFFFFFFFFFFFFFFLL;
    return v388;
  }
LABEL_38:
  if (v7 != 0x7800000000000000)
  {
    if (v10 & 0x1FFFFFFFFFFFFLL | a3)
    {
      v33 = v18 - v11;
      v34 = v33 + 6176;
      if (v33 < -6176)
        v34 = 0;
      if (v33 <= 6111)
        v35 = v34;
      else
        v35 = 12287;
      v36 = (a4 ^ a2) & 0x8000000000000000 | (v35 << 49);
      goto LABEL_211;
    }
    goto LABEL_77;
  }
LABEL_39:
  v19 = a4 & 0x8000000000000000;
  v20 = a2 & 0x8000000000000000;
  if (v12)
  {
    v21 = v18 - v11 + 6176;
    if (v10 > v17 || v10 == v17 && a3 > a1)
    {
      v22 = (COERCE_INT((float)a3 + (float)((float)v10 * 1.8447e19))
                         - COERCE_INT((float)a1 + (float)((float)v17 * 1.8447e19))) >> 23;
      v23 = (uint64_t *)((char *)&__bid_power10_index_binexp_128 + 16 * v22);
      v24 = *v23;
      v25 = HIDWORD(*v23);
      if (v17)
      {
        v26 = v24 * v17;
        v27 = v24;
        v28 = v25 * (unint64_t)a1;
        v29 = v24 * (unint64_t)a1;
        v30 = v27 * (unint64_t)HIDWORD(a1) + v28 + HIDWORD(v29);
        v31 = v29 | ((unint64_t)v30 << 32);
        v32 = v26 + v25 * (unint64_t)HIDWORD(a1) + HIDWORD(v28);
      }
      else
      {
        v39 = v24 * (unint64_t)HIDWORD(a1);
        v40 = v24 * (unint64_t)a1;
        v30 = v25 * (unint64_t)a1 + v39 + HIDWORD(v40);
        v31 = v40 | ((unint64_t)v30 << 32);
        v32 = v23[1] * a1 + v25 * (unint64_t)HIDWORD(a1) + HIDWORD(v39);
      }
      v41 = v32 + HIDWORD(v30);
      if (v10 > v41 || (v10 == v41 ? (v42 = a3 > v31) : (v42 = 0), v42))
        v43 = 34;
      else
        v43 = 33;
      v44 = 0;
      v45 = 0;
      v46 = (unint64_t *)((char *)&__bid_power10_table_128 + 16 * v43);
      v47 = *v46;
      v48 = v46[1];
      v49 = HIDWORD(v48);
      v50 = v48 * (unint64_t)HIDWORD(v31);
      v51 = HIDWORD(v50) + HIDWORD(v48) * (unint64_t)HIDWORD(v31);
      v52 = HIDWORD(v47);
      v53 = v47 * (unint64_t)HIDWORD(v31);
      v54 = HIDWORD(v53) + HIDWORD(v47) * (unint64_t)HIDWORD(v31);
      v55 = HIDWORD(v47) * (unint64_t)v31 + v53;
      v56 = HIDWORD(v48) * (unint64_t)v31
          + v50
          + ((v48 * (unint64_t)v31) >> 32);
      v57 = (v48 * v31) | ((unint64_t)v56 << 32);
      v58 = v47 * (unint64_t)v31;
      v59 = v55 + HIDWORD(v58);
      v60 = v58 | ((unint64_t)v59 << 32);
      v61 = __PAIR128__(v51, v57) + __PAIR128__(HIDWORD(v56), v54 + HIDWORD(v59));
      v62 = HIDWORD(v41);
      LODWORD(v51) = v41;
      v63 = v48 * (unint64_t)HIDWORD(v41);
      v64 = v48 * (unint64_t)v41;
      v65 = HIDWORD(v63) + v49 * (unint64_t)HIDWORD(v41);
      v66 = v49 * (unint64_t)v41 + v63 + HIDWORD(v64);
      v67 = HIDWORD(v66);
      v68 = v64 | ((unint64_t)v66 << 32);
      v69 = v47 * (unint64_t)HIDWORD(v41);
      v70 = v47 * (unint64_t)v41;
      v71 = HIDWORD(v47) * (unint64_t)v51 + v69 + HIDWORD(v70);
      v72 = v70 | ((unint64_t)v71 << 32);
      v73 = __PAIR128__(v65, v68)
          + __PAIR128__(v67, HIDWORD(v69) + v52 * (unint64_t)v62 + HIDWORD(v71));
      v13 = __CFADD__((_QWORD)v61, v72);
      v74 = v61 + v72;
      v76 = v13;
      v13 = __CFADD__(v13, v68 + HIDWORD(v69) + v52 * (unint64_t)v62 + HIDWORD(v71));
      v75 = v76 + v68 + HIDWORD(v69) + v52 * (unint64_t)v62 + HIDWORD(v71);
      LODWORD(v77) = v13;
      v13 = __CFADD__(*((_QWORD *)&v61 + 1), v75);
      v78 = *((_QWORD *)&v61 + 1) + v75;
      if (v13)
        v77 = 1;
      else
        v77 = v77;
      v79 = *((_QWORD *)&v73 + 1) + v77;
      LODWORD(v22) = __bid_estimate_decimal_digits[v22] + v43;
      goto LABEL_95;
    }
    v45 = v17 | v10;
    if (!(v17 | v10))
    {
      v228 = 0;
      v135 = a1 / a3;
      v229 = a1 % a3;
LABEL_339:
      if (!(v228 | v229))
      {
LABEL_354:
        v321 = v19 ^ v20;
        v176 = v21;
        goto LABEL_355;
      }
      v334 = (COERCE_INT((float)v135 + (float)((float)v45 * 1.8447e19)) - 1065353216) >> 23;
      v335 = __bid_estimate_decimal_digits[v334];
      v336 = (unint64_t *)((char *)&__bid_power10_index_binexp_128 + 16 * v334);
      v337 = v336[1];
      if (v45 > v337 || ((v338 = *v336, v45 == v337) ? (v339 = v135 >= v338) : (v339 = 0), v339))
        ++v335;
      v22 = 34 - v335;
      v340 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * v22);
      v341 = *v340;
      v342 = v340[1];
      v343 = HIDWORD(v229);
      v344 = v229;
      v345 = v342 * (unint64_t)HIDWORD(v229);
      v346 = HIDWORD(v345) + HIDWORD(v342) * (unint64_t)HIDWORD(v229);
      v347 = HIDWORD(v342) * (unint64_t)v229
           + v345
           + ((v342 * (unint64_t)v229) >> 32);
      v348 = (v342 * v229) | ((unint64_t)v347 << 32);
      v349 = v341 * (unint64_t)HIDWORD(v229);
      v350 = v341 * (unint64_t)v229;
      v351 = HIDWORD(v341) * (unint64_t)v344 + v349 + HIDWORD(v350);
      v60 = v350 | ((unint64_t)v351 << 32);
      v353 = v348 + HIDWORD(v349) + HIDWORD(v341) * (unint64_t)v343 + HIDWORD(v351);
      v352 = (__PAIR128__(v346, v348)
            + __PAIR128__(HIDWORD(v347), HIDWORD(v349) + HIDWORD(v341) * (unint64_t)v343 + HIDWORD(v351))) >> 64;
      v354 = HIDWORD(v228);
      LODWORD(v346) = v228;
      v355 = v342 * (unint64_t)HIDWORD(v228);
      v356 = HIDWORD(v355) + HIDWORD(v342) * (unint64_t)HIDWORD(v228);
      v357 = HIDWORD(v342) * (unint64_t)v228
           + v355
           + ((v342 * (unint64_t)v228) >> 32);
      v358 = HIDWORD(v357);
      v359 = (v342 * v228) | ((unint64_t)v357 << 32);
      v360 = v341 * (unint64_t)HIDWORD(v228);
      v361 = v341 * (unint64_t)v228;
      v362 = HIDWORD(v360) + HIDWORD(v341) * (unint64_t)v354;
      v363 = HIDWORD(v341) * (unint64_t)v346 + v360 + HIDWORD(v361);
      v364 = v361 | ((unint64_t)v363 << 32);
      v366 = v359 + v362 + HIDWORD(v363);
      v365 = (__PAIR128__(v356, v359) + __PAIR128__(v358, v362 + HIDWORD(v363))) >> 64;
      v13 = __CFADD__(v353, v364);
      v367 = (__PAIR128__(v366, v353) + v364) >> 64;
      v74 = v353 + v364;
      v368 = __CFADD__(v13, v366);
      v13 = __CFADD__(v352, v367);
      v78 = v352 + v367;
      v369 = v13 || v368;
      v79 = v365 + v369;
      v370 = v341 * (unint64_t)HIDWORD(v135);
      v371 = HIDWORD(v341) * (unint64_t)v135
           + v370
           + ((v341 * (unint64_t)v135) >> 32);
      v44 = (v341 * v135) | ((unint64_t)v371 << 32);
      v45 = v341 * v45 + v342 * v135 + HIDWORD(v341) * (unint64_t)HIDWORD(v135) + HIDWORD(v370) + HIDWORD(v371);
LABEL_95:
      v80 = (double)a3 + (double)v10 * 1.84467441e19;
      v81 = ((double)v60 + (double)v74 * 1.84467441e19 + (double)v78 * 3.40282367e38 + (double)v79 * 6.27710174e57)
          / v80;
      if (v79 > v10 >> 28
        || v79 == v10 >> 28
        && ((*((_QWORD *)&v83 + 1) = v10, *(_QWORD *)&v83 = a3, v82 = v83 >> 28, v78 > v82)
         || (v78 == v82 ? (v84 = v74 >= a3 << 36) : (v84 = 0), v84)))
      {
        v85 = v81 * 8.67361738e-19;
        v86 = (unint64_t)v85 - 4;
        v87 = (unint64_t)v85 - 4;
        v88 = v87 * (unint64_t)HIDWORD(v10)
            + (HIDWORD(v86) * v10)
            + ((v86 * (unint64_t)v10) >> 32);
        v89 = (v86 * v10) | ((unint64_t)v88 << 32);
        v90 = HIDWORD(v86) * (unint64_t)a3;
        v91 = v86 * (unint64_t)a3;
        v92 = v87 * (unint64_t)HIDWORD(a3) + v90 + HIDWORD(v91);
        v93 = HIDWORD(v90) + HIDWORD(v86) * (unint64_t)HIDWORD(a3) + HIDWORD(v92);
        *((_QWORD *)&v95 + 1) = (HIDWORD(v88) + __CFADD__(v89, v93) + ((v10 * HIDWORD(v86)) >> 32));
        *(_QWORD *)&v95 = v89 + v93;
        v94 = v95 >> 4;
        *((_QWORD *)&v95 + 1) = v95;
        *(_QWORD *)&v95 = v91 & 0xFFFFFFF0 | (v92 << 32);
        v96 = v95 >> 4;
        v13 = v60 >= v91 << 60;
        v60 -= v91 << 60;
        v97 = !v13;
        v98 = v74 - v97;
        v42 = v98 > v74;
        v74 = v98 - v96;
        v100 = v42 || v98 < v96;
        v78 = v78 - v94 - v100;
        v81 = ((double)v60 + (double)v74 * 1.84467441e19 + (double)v78 * 3.40282367e38) / v80;
        v13 = __CFADD__(v44, v86 << 60);
        v44 += v86 << 60;
        v45 += v13 + (v86 >> 4);
      }
      if (v78 > v10 >> 13
        || v78 == v10 >> 13
        && ((*((_QWORD *)&v102 + 1) = v10, *(_QWORD *)&v102 = a3, v101 = v102 >> 13, v74 > v101)
         || (v74 == v101 ? (v103 = v60 > a3 << 51) : (v103 = 0), v103)))
      {
        v104 = v81 * 1.77635684e-15;
        v105 = (unint64_t)v104 - 1;
        v106 = (unint64_t)v104 - 1;
        v107 = HIDWORD(v105) * (unint64_t)a3;
        v108 = v105 * (unint64_t)a3;
        v109 = HIDWORD(v107) + HIDWORD(v105) * (unint64_t)HIDWORD(a3);
        v110 = v106 * (unint64_t)HIDWORD(a3) + v107 + HIDWORD(v108);
        v111 = v109 + HIDWORD(v110);
        v112 = v106 * (unint64_t)HIDWORD(v10)
             + (HIDWORD(v105) * v10)
             + ((v105 * (unint64_t)v10) >> 32);
        v113 = (v105 * v10) | ((unint64_t)v112 << 32);
        *((_QWORD *)&v115 + 1) = (HIDWORD(v112) + __CFADD__(v111, v113) + ((v10 * HIDWORD(v105)) >> 32));
        *(_QWORD *)&v115 = v111 + v113;
        v114 = v115 >> 15;
        *((_QWORD *)&v115 + 1) = v111 + v113;
        *(_QWORD *)&v115 = v108 & 0xFFFF8000 | (v110 << 32);
        v116 = v115 >> 15;
        v13 = v60 >= v108 << 49;
        v60 -= v108 << 49;
        v117 = !v13;
        v118 = v74 - v117;
        v42 = v118 > v74;
        v74 = v118 - v116;
        v120 = v42 || v118 < v116;
        v13 = __CFADD__(v44, v105 << 49);
        v44 += v105 << 49;
        v45 += v13 + (v105 >> 15);
        v81 = ((double)v60 + (double)v74 * 1.84467441e19 + (double)(v78 - v114 - v120) * 3.40282367e38) / v80;
      }
      v121 = (unint64_t)v81;
      v122 = (unint64_t)v81 >> 32;
      v123 = v122 * (unint64_t)a3;
      v124 = (unint64_t)v81 * (unint64_t)HIDWORD(a3)
           + v123
           + (((unint64_t)v81 * (unint64_t)a3) >> 32);
      v125 = ((unint64_t)v81 * a3) | ((unint64_t)v124 << 32);
      v13 = v60 >= v125;
      v126 = v60 - v125;
      v127 = !v13;
      v128 = v74
           - (v10 * (unint64_t)v81
            + v122 * (unint64_t)HIDWORD(a3)
            + HIDWORD(v123)
            + HIDWORD(v124))
           - v127;
      if (v128 < 0)
      {
        v132 = v121 - 1;
        v128 = (__PAIR128__(v128, v126) + __PAIR128__(v10, a3)) >> 64;
        v126 += a3;
        v121 -= 2;
        v133 = __PAIR128__(v128, v126) + __PAIR128__(v10, a3);
        v134 = v128 >= 0;
        if (v128 < 0)
          v128 = (__PAIR128__(v128, v126) + __PAIR128__(v10, a3)) >> 64;
        else
          v121 = v132;
        if (!v134)
          v126 = v133;
      }
      else
      {
        v129 = v128 - v10;
        if (v128 > v10 || (v126 >= a3 ? (v130 = v128 == v10) : (v130 = 0), v130))
        {
          ++v121;
          v13 = v126 >= a3;
          v126 -= a3;
          v131 = !v13;
          v128 = v129 - v131;
        }
      }
      v21 -= v22;
      v135 = v121 + v44;
      if (__CFADD__(v121, v44))
        ++v45;
      if (v126 | v128)
      {
        v136 = *a6;
        *a6 |= 0x20u;
        if (v21 < 0)
        {
          v227 = v19 ^ v20;
          if (v21 > -35)
          {
            *((_QWORD *)&v242 + 1) = v45;
            *(_QWORD *)&v242 = v121 + v44;
            v241 = v242 >> 63;
            *((_QWORD *)&v242 + 1) = v45;
            *(_QWORD *)&v242 = v121 + v44;
            v243 = v241 + (v242 >> 61);
            if (10 * v135 < 8 * v135)
              ++v243;
            v244 = 1 - v21;
            v245 = 3 - v387;
            if ((v387 - 1) >= 2 || v227 == 0)
              v245 = v387;
            v247 = __bid_round_const_table_128[36 * v245 + v244] + __PAIR128__(v243, ((v128 | v126) != 0) | (10 * v135));
            v248 = &__bid_reciprocals10_128[2 * v244];
            v249 = *v248;
            v250 = v248[1];
            v251 = v250 * (unint64_t)DWORD1(v247);
            v252 = HIDWORD(v251);
            v253 = HIDWORD(v250) * (unint64_t)v247
                 + v251
                 + ((v250 * (unint64_t)v247) >> 32);
            v254 = (v250 * v247) | ((unint64_t)v253 << 32);
            v255 = DWORD2(v247) * (unint64_t)HIDWORD(v249);
            v256 = HIDWORD(v247) * (unint64_t)v249
                 + v255
                 + ((DWORD2(v247) * (unint64_t)v249) >> 32);
            v257 = (DWORD2(v247) * v249) | ((unint64_t)v256 << 32);
            v258 = v249 * (unint64_t)DWORD1(v247);
            v259 = HIDWORD(v249) * (unint64_t)v247
                 + v258
                 + ((v249 * (unint64_t)v247) >> 32);
            v260 = HIDWORD(v258) + HIDWORD(v249) * (unint64_t)DWORD1(v247) + HIDWORD(v259);
            v261 = (v249 * v247) | ((unint64_t)v259 << 32);
            v262 = HIDWORD(v247) * (unint64_t)v250;
            v263 = HIDWORD(v262) + HIDWORD(v247) * (unint64_t)HIDWORD(v250);
            v264 = DWORD2(v247) * (unint64_t)HIDWORD(v250)
                 + v262
                 + ((DWORD2(v247) * (unint64_t)v250) >> 32);
            v265 = HIDWORD(v264);
            v266 = (DWORD2(v247) * v250) | ((unint64_t)v264 << 32);
            v267 = __CFADD__(v254, v257);
            v268 = v254 + v257 + v260;
            v269 = __PAIR128__(v263, v266)
                 + __PAIR128__(v265, (__PAIR128__(v252+ HIDWORD(v250) * (unint64_t)DWORD1(v247)+ HIDWORD(v247) * (unint64_t)HIDWORD(v249)+ HIDWORD(v255)+ HIDWORD(v253)+ HIDWORD(v256), v254 + v257)+ __PAIR128__(v267, v260)) >> 64);
            v270 = __bid_recip_scale[v244];
            v271 = (*((_QWORD *)&v269 + 1) << -(char)v270) | ((unint64_t)v269 >> v270);
            v272 = (unint64_t)((__PAIR128__(v263, v266)
                                     + __PAIR128__(v265, (__PAIR128__(v252+ HIDWORD(v250) * (unint64_t)DWORD1(v247)+ HIDWORD(v247) * (unint64_t)HIDWORD(v249)+ HIDWORD(v255)+ HIDWORD(v253)+ HIDWORD(v256), v254 + v257)+ __PAIR128__(v267, v260)) >> 64)) >> 64) >> v270;
            if (v270 >= 64)
            {
              v271 = *((_QWORD *)&v269 + 1) >> v270;
              v272 = 0;
            }
            if (!v387 && (v271 & 1) != 0)
            {
              v273 = (_QWORD)v269 << -(char)v270;
              if (v270 < 65)
              {
                v274 = 0;
              }
              else
              {
                v273 = (*((_QWORD *)&v269 + 1) << -(char)v270) | ((unint64_t)v269 >> v270);
                v274 = (_QWORD)v269 << -(char)v270 != 0;
              }
              if (!v273 && !v274)
              {
                if (v268 < v250 || (v268 == v250 ? (v275 = v261 >= v249) : (v275 = 1), !v275))
                  --v271;
              }
            }
            if ((*a6 & 0x20) != 0)
            {
              v319 = 16;
            }
            else
            {
              v276 = 0x80 - v270;
              if (v270 >= 65)
                v277 = (*((_QWORD *)&v269 + 1) << (0x80 - v270)) | ((unint64_t)v269 >> v270);
              else
                v277 = (_QWORD)v269 << -(char)v270;
              if (v270 >= 65)
                v278 = (_QWORD)v269 << (0x80 - v270);
              else
                v278 = 0;
              switch(v245)
              {
                case 0:
                case 4:
                  if (v277 == 0x8000000000000000 && v278 == 0)
                    goto LABEL_358;
                  goto LABEL_389;
                case 1:
                case 3:
                  if (v277 | v278)
                    goto LABEL_389;
LABEL_358:
                  if (v268 < v250)
                    goto LABEL_391;
                  if (v268 == v250 && v261 < v249)
                    goto LABEL_391;
LABEL_389:
                  v319 = 48;
                  break;
                default:
                  v13 = __CFADD__(__CFADD__(v261, v249), v268);
                  v374 = __CFADD__(v261, v249) + v268;
                  v375 = v13;
                  if (__CFADD__(v374, v250))
                    v376 = 1;
                  else
                    v376 = v375;
                  v377 = v277 >> -(char)v270;
                  v378 = v270 - 64;
                  v379 = v277 >> v276;
                  if (v270 < 65)
                  {
                    v379 = 0;
                  }
                  else
                  {
                    v378 = v270 - 64;
                    v377 = (v278 >> v276) | (v277 << v270);
                  }
                  v380 = 1 << v378;
                  if (v270 < 64)
                    v380 = 0;
                  v13 = __CFADD__(v377, v376);
                  v381 = v377 + v376;
                  if (v13)
                    v382 = v379 + 1;
                  else
                    v382 = v379;
                  if (v382 <= v380)
                  {
                    v383 = v381 >> v270;
                    v384 = v270 < 64 && v383 == 0;
                    v385 = v384;
                    if (v382 != v380 || v385)
                      goto LABEL_389;
                  }
                  goto LABEL_391;
              }
            }
            *a6 |= v319;
LABEL_391:
            v389 = v272 | v227;
          }
          else
          {
            *a6 = v136 | 0x30;
            v389 = v19 ^ v20;
            if (v227)
            {
              if (v387 != 1)
                return v388;
            }
            else if (v387 != 2)
            {
              return v388;
            }
            return 1;
          }
          return v271;
        }
        if (v20 == v19 || (a5 - 1) >= 2)
          v138 = a5;
        else
          v138 = 3 - a5;
        switch(v138)
        {
          case 0:
            *((_QWORD *)&v139 + 1) = v128;
            *(_QWORD *)&v139 = v126;
            v140 = (v135 | (v139 * 2 - __PAIR128__(v10, a3) != 0)) & (unint64_t)((((v139 * 2 - __PAIR128__(v10, a3)) >> 64) & 0x8000000000000000) == 0);
            v13 = __CFADD__(v140, v135);
            v135 += v140;
            if (v13)
              goto LABEL_291;
            break;
          case 1:
          case 3:
            goto LABEL_354;
          case 4:
            *((_QWORD *)&v289 + 1) = v128;
            *(_QWORD *)&v289 = v126;
            v290 = v289 * 2 - __PAIR128__(v10, a3);
            v292 = v290 >= 0 || v290 == 0;
            v13 = __CFADD__(v135, v292);
            v135 += v292;
            if (v13)
              goto LABEL_291;
            break;
          default:
            v13 = __CFADD__(v135++, 1);
            if (v13)
            {
              v135 = 0;
LABEL_291:
              ++v45;
            }
            break;
        }
        goto LABEL_354;
      }
      if (a3 <= 0x400 && !(v17 | v10) && a1 <= 0x400)
      {
        v141 = &__bid_factors[(uint64_t)((a3 << 32) - 0x100000000) >> 31];
        v142 = &__bid_factors[(uint64_t)((a1 << 32) - 0x100000000) >> 31];
        v143 = v22 - *v141 + *v142;
        v144 = v22 - v141[1] + v142[1];
        if (v144 >= v143)
          v145 = v143;
        else
          v145 = v144;
        v146 = __bid_reciprocals10_128[2 * v145];
        v147 = __bid_reciprocals10_128[2 * v145 + 1];
        v148 = HIDWORD(v147);
        v149 = v147 * (unint64_t)HIDWORD(v135);
        v150 = HIDWORD(v149);
        v151 = HIDWORD(v147) * (unint64_t)v135
             + v149
             + ((v147 * (unint64_t)v135) >> 32);
        v152 = (v147 * v135) | ((unint64_t)v151 << 32);
        v153 = HIDWORD(v146);
        v154 = HIDWORD(v45);
        v155 = v45;
        v156 = v45 * (unint64_t)HIDWORD(v146);
        v157 = HIDWORD(v45) * (unint64_t)v146
             + v156
             + ((v45 * (unint64_t)v146) >> 32);
        v158 = (v45 * v146) | ((unint64_t)v157 << 32);
        v159 = ((v146 * (unint64_t)HIDWORD(v135)) >> 32)
             + HIDWORD(v146) * (unint64_t)HIDWORD(v135)
             + ((HIDWORD(v146) * (unint64_t)v135
               + (v146 * HIDWORD(v135))
               + ((v146 * (unint64_t)v135) >> 32)) >> 32);
        v160 = HIDWORD(v45) * (unint64_t)v147;
        v161 = v45 * (unint64_t)v147;
        v162 = HIDWORD(v160) + v154 * (unint64_t)HIDWORD(v147);
        v163 = v155 * (unint64_t)HIDWORD(v147) + v160 + HIDWORD(v161);
        v164 = HIDWORD(v163);
        v165 = v161 | ((unint64_t)v163 << 32);
        v166 = v152 + v158;
        v167 = __CFADD__(v152, v158);
        v168 = __bid_recip_scale[v145];
        v169 = __PAIR128__(v162, v165)
             + __PAIR128__(v164, v167+ __CFADD__(v159, v166)+ v150+ v148 * (unint64_t)HIDWORD(v135)+ v154 * (unint64_t)v153+ HIDWORD(v156)+ HIDWORD(v151)+ HIDWORD(v157));
        v170 = v168 <= 63;
        v171 = (v165
              + v167
              + __CFADD__(v159, v166)
              + v150
              + v148 * (unint64_t)HIDWORD(v135)
              + v154 * (unint64_t)v153
              + HIDWORD(v156)
              + HIDWORD(v151)
              + HIDWORD(v157)) >> v168;
        v172 = -v168;
        v173 = *((_QWORD *)&v169 + 1) >> v168;
        v174 = *((_QWORD *)&v169 + 1) >> v168;
        v175 = (*((_QWORD *)&v169 + 1) << v172) | v171;
        if (v170)
          v174 = v175;
        if (v170)
          v45 = v173;
        else
          v45 = 0;
        v176 = v145 + v21;
        goto LABEL_315;
      }
      v193 = HIDWORD(v135);
      v194 = v121 + v44;
      v195 = 2737007179 * HIDWORD(v135);
      v196 = HIDWORD(v195) + 755578 * HIDWORD(v135);
      v197 = 755578 * v135
           + v195
           + ((2737007179u * (unint64_t)v135) >> 32);
      v198 = HIDWORD(v197);
      v199 = (-1557960117 * v135) | ((unint64_t)v197 << 32);
      v200 = ((3953110345u * (unint64_t)HIDWORD(v135)) >> 32)
           + 1150327791 * HIDWORD(v135)
           + ((1150327791 * v135
             + (-341856951 * HIDWORD(v135))
             + ((3953110345u * (unint64_t)v135) >> 32)) >> 32);
      v201 = v199 + v200;
      v202 = v198 + __CFADD__(v199, v200) + v196;
      v203 = HIDWORD(v45);
      v204 = v45;
      v205 = 2737007179 * HIDWORD(v45);
      v206 = HIDWORD(v205) + 755578 * HIDWORD(v45);
      v207 = 755578 * v45
           + v205
           + ((2737007179u * (unint64_t)v45) >> 32);
      v208 = HIDWORD(v207);
      v209 = (-1557960117 * v45) | ((unint64_t)v207 << 32);
      v210 = 3953110345 * HIDWORD(v45);
      v211 = HIDWORD(v210) + 1150327791 * HIDWORD(v45);
      v212 = 1150327791 * v45
           + v210
           + ((3953110345u * (unint64_t)v45) >> 32);
      v213 = (-341856951 * v45) | ((unint64_t)v212 << 32);
      v214 = __PAIR128__(v206, v209) + __PAIR128__(v208, v211 + HIDWORD(v212));
      v13 = __CFADD__(__CFADD__(v213, v201), v209 + v211 + HIDWORD(v212));
      v215 = __CFADD__(v213, v201) + v209 + v211 + HIDWORD(v212);
      v216 = v13;
      v13 = __CFADD__(v202, v215);
      v217 = v202 + v215;
      if (v13)
        v218 = 1;
      else
        v218 = v216;
      *((_QWORD *)&v219 + 1) = *((_QWORD *)&v214 + 1) + v218;
      *(_QWORD *)&v219 = v217;
      v174 = v219 >> 44;
      v220 = v135 - 100000000000000000 * v174;
      if (v220)
      {
        v221 = v220 & 0x3FFFFFF;
        v222 = v220 >> 26;
        if ((v220 >> 26))
        {
          v223 = 0;
          v224 = (char *)&__bid_convert_table;
          do
          {
            v225 = &v224[8 * (v222 & 0x7F)];
            v221 += *(_DWORD *)v225;
            v223 += *((_DWORD *)v225 + 1);
            if (v221 > 0x5F5E0FF)
            {
              v221 -= 100000000;
              ++v223;
            }
            v224 += 1024;
            v42 = v222 > 0x7F;
            LODWORD(v222) = v222 >> 7;
          }
          while (v42);
          v226 = v223 - 100000000;
          if (v223 - 100000000 > 0x5F5E0FF)
            v226 = v223 - 200000000;
          if (v223 > 0x5F5E0FF)
            v223 = v226;
        }
        else
        {
          v223 = 0;
        }
        if (v221 | v223)
        {
          v293 = v221 == 0;
          if (!v221)
            v221 = v223;
          v294 = (109951163 * (unint64_t)v221) >> 40;
          v295 = v221 - 10000 * v294;
          v296 = (8 * v293) | 4;
          if (v295)
          {
            v296 = 8 * v293;
            v294 = v295;
          }
          else
          {
            v294 = v294;
          }
          if ((v294 & 1) == 0)
            v296 |= (__bid_packed_10000_zeros[v294 >> 3] >> (v294 & 7)) & 3;
          if (!v296)
            goto LABEL_308;
        }
        else
        {
          v296 = 16;
        }
        v297 = __bid_reciprocals10_128[2 * v296];
        v298 = __bid_reciprocals10_128[2 * v296 + 1];
        v299 = HIDWORD(v298);
        v300 = v298 * (unint64_t)HIDWORD(v135);
        v301 = HIDWORD(v300);
        v302 = HIDWORD(v298) * (unint64_t)v135
             + v300
             + ((v298 * (unint64_t)v135) >> 32);
        v303 = (v298 * v135) | ((unint64_t)v302 << 32);
        v304 = HIDWORD(v297);
        v305 = HIDWORD(v297) * (unint64_t)v204;
        v306 = v297 * (unint64_t)v203
             + v305
             + ((v297 * (unint64_t)v204) >> 32);
        v307 = (v297 * v204) | ((unint64_t)v306 << 32);
        v308 = ((v297 * (unint64_t)v193) >> 32)
             + HIDWORD(v297) * (unint64_t)v193
             + ((HIDWORD(v297) * (unint64_t)v194
               + (v297 * v193)
               + ((v297 * (unint64_t)v194) >> 32)) >> 32);
        v309 = v298 * (unint64_t)v203;
        v310 = v298 * (unint64_t)v204;
        v311 = HIDWORD(v309) + v299 * (unint64_t)v203;
        v312 = v299 * (unint64_t)v204 + v309 + HIDWORD(v310);
        v313 = HIDWORD(v312);
        v314 = v310 | ((unint64_t)v312 << 32);
        v315 = v303 + v307;
        v316 = __CFADD__(v303, v307);
        v317 = v316
             + __CFADD__(v308, v315)
             + v301
             + v299 * (unint64_t)v193
             + v304 * (unint64_t)v203
             + HIDWORD(v305)
             + HIDWORD(v302)
             + HIDWORD(v306);
        v318 = __bid_recip_scale[v296];
        v135 = ((__PAIR128__(v311, v314) + __PAIR128__(v313, v317)) >> 64 << -(char)v318) | ((v314 + v317) >> v318);
        v45 = (unint64_t)((__PAIR128__(v311, v314) + __PAIR128__(v313, v317)) >> 64) >> v318;
LABEL_308:
        v176 = v296 + v21;
        v174 = v135;
LABEL_315:
        v321 = v19 ^ v20;
        v135 = v174;
LABEL_355:
        bid_get_BID128(&v388, v321, v176, v135, v45, &v387, a6);
        return v388;
      }
      v230 = v174 & 0x3FFFFFF;
      v231 = 0;
      v232 = v174 >> 26;
      if ((v174 >> 26))
      {
        v233 = (char *)&__bid_convert_table;
        do
        {
          v234 = &v233[8 * (v232 & 0x7F)];
          v230 += *(_DWORD *)v234;
          v231 += *((_DWORD *)v234 + 1);
          if (v230 > 0x5F5E0FF)
          {
            v230 -= 100000000;
            ++v231;
          }
          v233 += 1024;
          v42 = v232 > 0x7F;
          LODWORD(v232) = v232 >> 7;
        }
        while (v42);
        v235 = v231 - 100000000;
        if (v231 - 100000000 > 0x5F5E0FF)
          v235 = v231 - 200000000;
        if (v231 > 0x5F5E0FF)
          v231 = v235;
      }
      v236 = v21 + 17;
      if (v230 | v231)
      {
        v237 = v230 == 0;
        if (!v230)
          v230 = v231;
        v238 = (109951163 * (unint64_t)v230) >> 40;
        LODWORD(v239) = v230 - 10000 * v238;
        v240 = (8 * v237) | 4;
        if ((_DWORD)v239)
        {
          v240 = 8 * v237;
          v239 = v239;
        }
        else
        {
          v239 = v238;
        }
        if ((v239 & 1) == 0)
          v240 |= (__bid_packed_10000_zeros[v239 >> 3] >> (v239 & 7)) & 3;
        if (!v240)
          goto LABEL_314;
      }
      else
      {
        v240 = 16;
      }
      v320 = __bid_reciprocals10_64[v240] * (unint64_t)HIDWORD(v174);
      v174 = (HIDWORD(v320)
            + HIDWORD(__bid_reciprocals10_64[v240]) * (unint64_t)HIDWORD(v174)
            + ((HIDWORD(__bid_reciprocals10_64[v240]) * (unint64_t)v174
              + v320
              + ((__bid_reciprocals10_64[v240] * (unint64_t)v174) >> 32)) >> 32)) >> __bid_short_recip_scale[v240];
LABEL_314:
      v45 = 0;
      v176 = v236 + v240;
      goto LABEL_315;
    }
    v177 = (double)a3 + (double)v10 * 1.84467441e19;
    v178 = ((double)a1 + (double)v17 * 1.84467441e19) / v177;
    if (v10 || a3 >> 28 || a3 << 36 > v17)
    {
      v191 = 0;
      if (v10 >> 13)
      {
        v189 = v17;
        v187 = a1;
        v190 = 0;
LABEL_317:
        v322 = (unint64_t)v178;
        v323 = (unint64_t)v178 >> 32;
        v324 = v323 * (unint64_t)a3;
        v325 = (unint64_t)v178 * (unint64_t)HIDWORD(a3)
             + v324
             + (((unint64_t)v178 * (unint64_t)a3) >> 32);
        v326 = ((unint64_t)v178 * a3) | ((unint64_t)v325 << 32);
        v13 = v187 >= v326;
        v229 = v187 - v326;
        v327 = !v13;
        v228 = v189
             - (v10 * (unint64_t)v178
              + v323 * (unint64_t)HIDWORD(a3)
              + HIDWORD(v324)
              + HIDWORD(v325))
             - v327;
        if (v228 < 0)
        {
          v331 = v322 - 1;
          v228 = (__PAIR128__(v228, v229) + __PAIR128__(v10, a3)) >> 64;
          v229 += a3;
          v322 -= 2;
          v332 = __PAIR128__(v228, v229) + __PAIR128__(v10, a3);
          v333 = v228 >= 0;
          if (v228 < 0)
            v228 = (__PAIR128__(v228, v229) + __PAIR128__(v10, a3)) >> 64;
          else
            v322 = v331;
          if (!v333)
            v229 = v332;
        }
        else
        {
          v328 = v228 - v10;
          if (v228 > v10 || (v228 == v10 ? (v329 = v229 >= a3) : (v329 = 0), v329))
          {
            ++v322;
            v13 = v229 >= a3;
            v229 -= a3;
            v330 = !v13;
            v228 = v328 - v330;
          }
        }
        v135 = v322 + v191;
        if (__CFADD__(v322, v191))
          v45 = v190 + 1;
        else
          v45 = v190;
        goto LABEL_339;
      }
      v190 = 0;
      v187 = a1;
      v189 = v17;
      *((_QWORD *)&v280 + 1) = v10;
      *(_QWORD *)&v280 = a3;
      v192 = v280 >> 13;
    }
    else
    {
      v179 = v178 * 8.67361738e-19;
      v180 = (unint64_t)v179 - 4;
      v181 = HIDWORD(v180) * a3;
      v182 = ((unint64_t)v179 - 4) * a3;
      v183 = HIDWORD(v181);
      v184 = HIDWORD(v182) + v181;
      *((_QWORD *)&v185 + 1) = (v183 + HIDWORD(v184));
      *(_QWORD *)&v185 = v182 & 0xFFFFFFF0 | (v184 << 32);
      v186 = v17 - (v185 >> 4);
      v13 = a1 >= v182 << 60;
      v187 = a1 - (v182 << 60);
      v188 = !v13;
      v189 = v186 - v188;
      v190 = v180 >> 4;
      v178 = ((double)v187 + (double)v189 * 1.84467441e19) / v177;
      v191 = v180 << 60;
      v192 = a3 >> 13;
    }
    if (v189 > v192 || v189 == v192 && v187 > a3 << 51)
    {
      v281 = v178 * 1.77635684e-15;
      v282 = (unint64_t)v281 - 1;
      v283 = HIDWORD(v282) * (unint64_t)a3;
      v284 = v282 * (unint64_t)a3;
      v285 = ((unint64_t)v281 - 1) * (unint64_t)HIDWORD(a3)
           + v283
           + HIDWORD(v284);
      *((_QWORD *)&v286 + 1) = (v282 * v10 + HIDWORD(v282) * HIDWORD(a3) + HIDWORD(v283) + HIDWORD(v285));
      *(_QWORD *)&v286 = v284 & 0xFFFF8000 | (v285 << 32);
      v287 = v189 - (v286 >> 15);
      v13 = v187 >= v284 << 49;
      v187 -= v284 << 49;
      v288 = !v13;
      v189 = v287 - v288;
      v13 = __CFADD__(v191, v282 << 49);
      v191 += v282 << 49;
      v190 += v13 + (v282 >> 15);
      v178 = ((double)v187 + (double)v189 * 1.84467441e19) / v177;
    }
    goto LABEL_317;
  }
  if ((~a4 & 0x7C00000000000000) != 0)
  {
    if (v7 == 0x7800000000000000)
    {
      v36 = v19 ^ v20;
      goto LABEL_211;
    }
    *a6 |= 4u;
    goto LABEL_210;
  }
  if ((~a4 & 0x7E00000000000000) == 0)
    *a6 |= 1u;
  v388 = a3;
  v389 = v10 & 0xFDFFFFFFFFFFFFFFLL;
  return v388;
}

_QWORD *bid_get_BID128(_QWORD *result, uint64_t a2, int a3, unint64_t a4, unint64_t a5, int *a6, _DWORD *a7)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  BOOL v16;
  int v17;
  unsigned __int128 v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _BOOL8 v38;
  unint64_t v39;
  unsigned __int128 v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  char v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  BOOL v56;
  unint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  BOOL v68;
  _BOOL4 v69;

  v7 = 0x378D8E63FFFFFFFFLL;
  if (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0)
    v8 = 0x38C15B0A00000000;
  else
    v8 = a4;
  v9 = (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0) + a3;
  if (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0)
    v10 = 0x314DC6448D93;
  else
    v10 = a5;
  if (v9 < 0x3000)
    goto LABEL_71;
  if ((v9 & 0x80000000) != 0)
  {
    if (v9 > 0xFFFFFFDD)
    {
      v15 = -(int)v9;
      v16 = (*a6 - 1) >= 2 || a2 == 0;
      if (v16)
        v17 = *a6;
      else
        v17 = 3 - *a6;
      v18 = __bid_round_const_table_128[36 * v17 + v15] + __PAIR128__(v10, v8);
      v19 = (unint64_t *)((char *)&__bid_reciprocals10_128 + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      v22 = v21 * (unint64_t)DWORD1(v18);
      v23 = HIDWORD(v22);
      v24 = HIDWORD(v21) * (unint64_t)v18
          + v22
          + ((v21 * (unint64_t)v18) >> 32);
      v25 = (v21 * v18) | ((unint64_t)v24 << 32);
      v26 = DWORD2(v18) * HIDWORD(*v19);
      v27 = HIDWORD(v18) * (unint64_t)v20
          + v26
          + ((DWORD2(v18) * (unint64_t)v20) >> 32);
      v28 = (DWORD2(v18) * *v19) | ((unint64_t)v27 << 32);
      v29 = *v19 * (unint64_t)DWORD1(v18);
      v30 = HIDWORD(v20) * (unint64_t)v18
          + v29
          + ((v20 * (unint64_t)v18) >> 32);
      v31 = HIDWORD(v29) + HIDWORD(*v19) * DWORD1(v18) + HIDWORD(v30);
      v32 = (*v19 * v18) | ((unint64_t)v30 << 32);
      v33 = HIDWORD(v18) * (unint64_t)v21;
      v34 = HIDWORD(v33) + HIDWORD(v18) * (unint64_t)HIDWORD(v21);
      v35 = DWORD2(v18) * (unint64_t)HIDWORD(v21)
          + v33
          + ((DWORD2(v18) * (unint64_t)v21) >> 32);
      v36 = HIDWORD(v35);
      v37 = (DWORD2(v18) * v21) | ((unint64_t)v35 << 32);
      v38 = __CFADD__(v25, v28);
      v39 = v25 + v28 + v31;
      v40 = __PAIR128__(v34, v37)
          + __PAIR128__(v36, (__PAIR128__(v23+ HIDWORD(v21) * (unint64_t)DWORD1(v18)+ HIDWORD(v18) * (unint64_t)HIDWORD(v20)+ HIDWORD(v26)+ HIDWORD(v24)+ HIDWORD(v27), v25 + v28)+ __PAIR128__(v38, v31)) >> 64);
      v41 = __bid_recip_scale[v15];
      v42 = (*((_QWORD *)&v40 + 1) << -(char)v41) | ((unint64_t)v40 >> v41);
      v43 = (unint64_t)((__PAIR128__(v34, v37)
                              + __PAIR128__(v36, (__PAIR128__(v23+ HIDWORD(v21) * (unint64_t)DWORD1(v18)+ HIDWORD(v18) * (unint64_t)HIDWORD(v20)+ HIDWORD(v26)+ HIDWORD(v24)+ HIDWORD(v27), v25 + v28)+ __PAIR128__(v38, v31)) >> 64)) >> 64) >> v41;
      if (v41 >= 64)
      {
        v42 = *((_QWORD *)&v40 + 1) >> v41;
        v43 = 0;
      }
      if (!*a6 && (v42 & 1) != 0)
      {
        v44 = (*((_QWORD *)&v40 + 1) << -(char)v41) | ((unint64_t)v40 >> v41);
        if (v41 >= 65)
        {
          v45 = (_QWORD)v40 << -(char)v41 != 0;
        }
        else
        {
          v44 = (_QWORD)v40 << -(char)v41;
          v45 = 0;
        }
        if (!v44 && !v45 && (v39 < v21 || v39 == v21 && v32 < v20))
          --v42;
      }
      if ((*a7 & 0x20) != 0)
      {
        v55 = 16;
      }
      else
      {
        v46 = 0x80 - v41;
        if (v41 >= 65)
          v47 = (*((_QWORD *)&v40 + 1) << (0x80 - v41)) | ((unint64_t)v40 >> v41);
        else
          v47 = (_QWORD)v40 << -(char)v41;
        if (v41 >= 65)
          v48 = (_QWORD)v40 << (0x80 - v41);
        else
          v48 = 0;
        switch(v17)
        {
          case 0:
          case 4:
            if (v47 == 0x8000000000000000 && v48 == 0)
              goto LABEL_78;
            goto LABEL_110;
          case 1:
          case 3:
            if (v47 | v48)
              goto LABEL_110;
LABEL_78:
            v56 = v39 == v21;
            if (v39 >= v21)
            {
              v55 = 48;
              if (!v56 || v32 >= v20)
                break;
            }
            goto LABEL_112;
          default:
            v12 = __CFADD__(__CFADD__(v32, v20), v39);
            v57 = __CFADD__(v32, v20) + v39;
            v58 = v12;
            if (__CFADD__(v57, v21))
              v59 = 1;
            else
              v59 = v58;
            v60 = v47 >> -(char)v41;
            v61 = (v48 >> v46) | (v47 << v41);
            v62 = v47 >> v46;
            if (v41 >= 65)
              v63 = v62;
            else
              v63 = 0;
            if (v41 < 65)
              v61 = v60;
            v64 = 1 << (v41 - 64);
            if (v41 < 64)
              v64 = 0;
            v65 = v61 + v59;
            if (__CFADD__(v61, v59))
              v66 = v63 + 1;
            else
              v66 = v63;
            if (v66 > v64)
              goto LABEL_112;
            v67 = v65 >> v41;
            v68 = v41 < 64 && v67 == 0;
            v69 = v68;
            if (v66 == v64 && !v69)
              goto LABEL_112;
LABEL_110:
            v55 = 48;
            break;
        }
      }
      *a7 |= v55;
LABEL_112:
      result[1] = v43 | a2;
    }
    else
    {
      *a7 |= 0x30u;
      *result = 0;
      result[1] = a2;
      v14 = *a6;
      if (a2)
      {
        if (v14 != 1)
          return result;
      }
      else if (v14 != 2)
      {
        return result;
      }
      v42 = 1;
    }
    *result = v42;
    return result;
  }
  if (v9 > 0x3021)
    goto LABEL_61;
  while (1)
  {
    if (v10 < 0x314DC6448D93)
    {
      if ((int)v9 < 12288)
        goto LABEL_71;
      goto LABEL_16;
    }
    if (v10 != 0x314DC6448D93)
      goto LABEL_60;
    if (v8 >= 0x38C15B0A00000000 || (int)v9 < 12288)
      break;
LABEL_16:
    v11 = 10 * v8;
    v12 = 10 * v8 >= 8 * v8;
    v13 = (v8 >> 63) + (v8 >> 61) + 10 * v10;
    if (v12)
      v10 = v13;
    else
      v10 = v13 + 1;
    v9 = (v9 - 1);
    v8 = v11;
  }
  v10 = 0x314DC6448D93;
LABEL_60:
  if ((int)v9 < 12288)
  {
LABEL_71:
    *result = v8;
    result[1] = v10 | (v9 << 49) | a2;
    return result;
  }
LABEL_61:
  if (v8 | v10)
  {
    v50 = 0x5FFFED09BEAD87C0;
    *a7 |= 0x28u;
    v51 = *a6;
    if (a2)
      v52 = 2;
    else
      v52 = 1;
    v16 = v51 == v52;
    v53 = 0x7800000000000000;
    if (v16)
    {
      v53 = 0x5FFFED09BEAD87C0;
      v54 = 0x378D8E63FFFFFFFFLL;
    }
    else
    {
      v54 = 0;
    }
    if (v51 != 3)
    {
      v50 = v53;
      v7 = v54;
    }
    *result = v7;
    result[1] = v50 | a2;
  }
  else
  {
    *result = 0;
    result[1] = a2 | 0x5FFE000000000000;
  }
  return result;
}

unint64_t __bid128_exp(unint64_t a1, unint64_t a2, unsigned int a3, int *a4)
{
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __n128 v14;
  __n128 v15;
  uint64_t v16[2];
  __n128 v17;

  if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
    return 0;
  v6 = a1;
  if ((a2 & 0x7C00000000000000) != 0x7C00000000000000)
  {
    if (__bid128_isZero(a1, a2))
      return 1;
    if (__bid128_quiet_greater(v6, a2, 0x3A98uLL, 0x3040000000000000, a4))
    {
      v8 = 0xD43EDE775707FD0ALL;
      v9 = 0x5550558ADA285F8BLL;
    }
    else
    {
      if (__bid128_quiet_less(v6, a2, 0x3A98uLL, 0xB040000000000000, a4))
      {
        v8 = 1;
        v9 = 0x160000000000000;
        v10 = 1;
        v11 = 0x160000000000000;
        return __bid128_mul(v8, v9, v10, v11, a3, a4);
      }
      v17 = 0uLL;
      v16[0] = 0;
      v16[1] = 0;
      v15 = 0uLL;
      v14 = 0uLL;
      bid128_to_binary128_2part(v15.n128_u64, (unint64_t *)v16, v6, a2);
      if (!bid_f128_cmp((uint64_t *)&v15, (uint64_t *)&c_11000_1071, 4u))
      {
        if (!bid_f128_cmp((uint64_t *)&v15, (uint64_t *)&c_neg_11000, 1u))
        {
          bid_f128_exp(&v17, (uint64_t *)&v15);
          bid_f128_mul(&v14, (uint64_t *)&v17, v16);
          bid_f128_add(&v17, (uint64_t *)&v17, (uint64_t *)&v14);
          return __binary128_to_bid128(v17.n128_u64[0], v17.n128_u64[1], a3, a4);
        }
        bid_f128_add(&v15, (uint64_t *)&v15, (uint64_t *)&c_11000_1071);
        bid_f128_exp(&v17, (uint64_t *)&v15);
        bid_f128_mul(&v14, (uint64_t *)&v17, v16);
        bid_f128_add(&v17, (uint64_t *)&v17, (uint64_t *)&v14);
        v8 = __binary128_to_bid128(v17.n128_u64[0], v17.n128_u64[1], a3, a4);
        v10 = 0x995AB6781DD4B6F5;
        v11 = 0xAAB1C2BBC58F8F5;
        return __bid128_mul(v8, v9, v10, v11, a3, a4);
      }
      bid_f128_sub(&v15, (uint64_t *)&v15, (uint64_t *)&c_11000_1071);
      bid_f128_exp(&v17, (uint64_t *)&v15);
      bid_f128_mul(&v14, (uint64_t *)&v17, v16);
      bid_f128_add(&v17, (uint64_t *)&v17, (uint64_t *)&v14);
      v8 = __binary128_to_bid128(v17.n128_u64[0], v17.n128_u64[1], a3, a4);
    }
    v10 = 0xD43EDE775707FD0ALL;
    v11 = 0x5550558ADA285F8BLL;
    return __bid128_mul(v8, v9, v10, v11, a3, a4);
  }
  if ((~a2 & 0x7E00000000000000) == 0)
    *a4 |= 1u;
  if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
    || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
  {
    return 0;
  }
  return v6;
}

uint64_t bid128_ext_fma(int *a1, int *a2, int *a3, int *a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, unint64_t a10, unsigned int a11, int *a12)
{
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _BOOL4 v72;
  _BOOL4 v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unsigned __int128 v93;
  unint64_t v94;
  unsigned int v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unsigned __int128 v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unsigned __int128 v119;
  unint64_t v120;
  unsigned int v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unsigned __int128 v134;
  uint64_t v135;
  unsigned int v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unsigned __int128 v145;
  unint64_t v146;
  unsigned int v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unsigned __int128 v160;
  uint64_t v161;
  unsigned int v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  BOOL v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  char *v190;
  unint64_t v191;
  int v192;
  int v193;
  int v194;
  int v195;
  uint64_t v196;
  unsigned int v197;
  unint64_t v198;
  int v199;
  int v200;
  uint64_t v201;
  unint64_t v202;
  int v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  int v209;
  unsigned __int128 v210;
  int v211;
  BOOL v212;
  BOOL v213;
  BOOL v214;
  BOOL v215;
  BOOL v216;
  char v217;
  BOOL v218;
  BOOL v219;
  _BOOL4 v220;
  int v221;
  unint64_t v222;
  uint64_t v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  int v233;
  int v234;
  uint64_t v235;
  unint64_t v236;
  uint64_t v237;
  unint64_t v238;
  unint64_t v239;
  BOOL v240;
  int v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  unsigned __int128 v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  unint64_t v258;
  int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  unint64_t *v267;
  unint64_t v268;
  int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  int v276;
  unint64_t v277;
  uint64_t v278;
  unint64_t v279;
  unint64_t v280;
  int v281;
  unint64_t v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  uint64_t v293;
  int v294;
  uint64_t v295;
  unint64_t v296;
  unint64_t v297;
  uint64_t v298;
  unint64_t v299;
  unint64_t v300;
  int v301;
  int v302;
  int v303;
  int v304;
  unint64_t v305;
  int v306;
  unint64_t v307;
  int v308;
  unsigned int v309;
  uint64_t v310;
  uint64_t v311;
  unint64_t v312;
  uint64_t v313;
  uint64_t v314;
  int v315;
  uint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unint64_t v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  unint64_t v324;
  unint64_t v325;
  unint64_t v326;
  uint64_t v327;
  unint64_t v328;
  unint64_t v329;
  unint64_t v330;
  unint64_t v331;
  unint64_t v332;
  unint64_t v333;
  unint64_t v334;
  unint64_t v335;
  unint64_t v336;
  uint64_t v337;
  unint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t v346;
  uint64_t v350;
  unint64_t v351;
  unint64_t v352;
  char v353;
  unsigned __int128 v354;
  int v355;
  int v356;
  int v357;
  int v358;
  uint64_t v359;
  int v360;
  int v361;
  int v362;
  unsigned __int128 v363;
  uint64_t v364;
  uint64_t v365;
  unint64_t v366;
  unint64_t v367;
  unint64_t v368;
  uint64_t v369;
  unint64_t v370;
  unint64_t v371;
  unint64_t v372;
  unint64_t v373;
  int v374;
  int v375;
  unint64_t v376;
  uint64_t v377;
  uint64_t v378;
  _BOOL4 v379;
  BOOL v380;
  BOOL v381;
  BOOL v382;
  uint64_t v383;
  unint64_t v384;
  unint64_t v385;
  unint64_t v386;
  unint64_t v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  unint64_t v391;
  int v392;
  uint64_t v393;
  unint64_t v394;
  unint64_t v395;
  uint64_t *v396;
  uint64_t *v397;
  unint64_t v398;
  uint64_t v399;
  unint64_t v400;
  unint64_t v401;
  unint64_t v402;
  unint64_t v403;
  unint64_t *v404;
  unint64_t v405;
  unint64_t v406;
  uint64_t v407;
  unint64_t v408;
  unint64_t v409;
  unint64_t v410;
  unint64_t v411;
  unint64_t v412;
  int v413;
  unint64_t v414;
  _BOOL4 v415;
  int v416;
  _BOOL4 v417;
  unint64_t *v418;
  unint64_t v419;
  unint64_t v420;
  unint64_t v421;
  unint64_t v422;
  uint64_t v423;
  int v424;
  int v425;
  unint64_t v426;
  uint64_t v427;
  unint64_t *v428;
  unint64_t v429;
  unint64_t v430;
  unint64_t v431;
  unint64_t v432;
  unint64_t v433;
  unint64_t v434;
  unint64_t v435;
  unint64_t v436;
  unint64_t v437;
  unint64_t v438;
  unint64_t v439;
  uint64_t v440;
  uint64_t v441;
  unint64_t v442;
  uint64_t v443;
  BOOL v444;
  BOOL v445;
  int v446;
  int v447;
  uint64_t v448;
  char v449;
  __int16 v450;
  int v451;
  int v452;
  uint64_t v453;
  unint64_t v454;
  unint64_t v455;
  unint64_t v456;
  unint64_t v457;
  unint64_t v458;
  unint64_t v459;
  BOOL v460;
  BOOL v461;
  BOOL v462;
  BOOL v463;
  BOOL v464;
  _QWORD *v465;
  unint64_t v466;
  unint64_t v467;
  unint64_t v468;
  uint64_t v469;
  uint64_t v470;
  _QWORD *v471;
  int v472;
  int v473;
  int v474;
  uint64_t v475;
  uint64_t v476;
  int v477;
  int v478;
  _BOOL4 v479;
  int v480;
  int v481;
  int v482;
  int v483;
  int v484;
  int v485;
  uint64_t v486;
  int v487;
  unint64_t v488;
  BOOL v489;
  unint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  unint64_t v494;
  uint64_t v495;
  int v496;
  BOOL v497;
  int v498;
  int v499;
  int v500;
  int v501;
  int v502;
  int v503;
  uint64_t j;
  int v505;
  int v506;
  int v507;
  int v508;
  uint64_t v509;
  uint64_t *v510;
  uint64_t i;
  int v512;
  unint64_t *v513;
  int v514;
  uint64_t v515;
  int v516;
  int v517;
  int v518;
  BOOL v519;
  BOOL v520;
  uint64_t v521;
  BOOL v522;
  int v523;
  int v524;
  int v525;
  int v526;
  int v527;
  BOOL v528;
  uint64_t v529;
  uint64_t v531;
  BOOL v532;
  BOOL v533;
  int v534;
  int v535;
  unint64_t v536;
  int v537;
  _QWORD *v538;
  unint64_t v539;
  unint64_t v540;
  unint64_t v541;
  unint64_t v542;
  _QWORD *v543;
  uint64_t v544;
  uint64_t v545;
  unint64_t v546;
  unint64_t v547;
  int v548;
  int v549;
  int v550;
  _BOOL4 v551;
  int v552;
  unint64_t v553;
  unint64_t v554;
  uint64_t v555;
  unint64_t v556;
  unint64_t v557;
  unint64_t v558;
  uint64_t v559;
  unint64_t v560;
  unsigned int v561;
  uint64_t v562;
  unint64_t v563;
  unint64_t v564;
  uint64_t v565;
  unint64_t v566;
  int v567;
  int v568;
  int v569;
  int v570;
  unint64_t v571;
  uint64_t v572;
  int v573;
  int v574;
  int v575;
  int v576;
  int v577;
  unsigned __int128 v578;
  __int128 v579;
  unsigned __int128 v580;
  __int128 v581;
  __int128 v582;
  unsigned __int128 v583;
  unint64_t v584;
  int v585;
  __int128 v586;
  unsigned __int128 v587;
  unsigned __int128 v588;
  __int128 v589;
  _OWORD v590[2];
  uint64_t v591;

  v16 = a10;
  v591 = *MEMORY[0x1E0C80C00];
  v587 = xmmword_1B8917E00;
  v586 = 0uLL;
  v585 = 0;
  v584 = 0;
  v583 = 0uLL;
  v582 = 0uLL;
  memset(v590, 0, sizeof(v590));
  v17 = a8 & 0x7C00000000000000;
  v580 = 0u;
  v581 = 0u;
  if ((a8 & 0x7C00000000000000) == 0x7C00000000000000)
  {
    if ((a8 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || (a8 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a7 > 0x38C15B09FFFFFFFFLL)
    {
      a7 = 0;
      a8 &= 0xFFFFC00000000000;
    }
    if ((~a8 & 0x7E00000000000000) == 0)
    {
      *a12 |= 1u;
      *(_QWORD *)&v587 = a7;
      *((_QWORD *)&v587 + 1) = a8 & 0xFC003FFFFFFFFFFFLL;
LABEL_69:
      v21 = 0;
      goto LABEL_70;
    }
    *(_QWORD *)&v587 = a7;
    *((_QWORD *)&v587 + 1) = a8 & 0xFC003FFFFFFFFFFFLL;
    if ((~a10 & 0x7E00000000000000) != 0 && (a6 & 0x7E00000000000000) != 0x7E00000000000000)
      goto LABEL_69;
    goto LABEL_68;
  }
  v18 = a9;
  v19 = a10 & 0x7C00000000000000;
  if ((a10 & 0x7C00000000000000) == 0x7C00000000000000)
  {
    if ((a10 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || (a10 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a9 > 0x38C15B09FFFFFFFFLL)
    {
      v18 = 0;
      v16 = a10 & 0xFFFFC00000000000;
    }
    if ((~v16 & 0x7E00000000000000) == 0)
    {
      *a12 |= 1u;
      *(_QWORD *)&v587 = v18;
      *((_QWORD *)&v587 + 1) = v16 & 0xFC003FFFFFFFFFFFLL;
      goto LABEL_69;
    }
    *(_QWORD *)&v587 = v18;
    *((_QWORD *)&v587 + 1) = v16 & 0xFC003FFFFFFFFFFFLL;
    if ((~a6 & 0x7E00000000000000) != 0)
      goto LABEL_69;
LABEL_68:
    *a12 |= 1u;
    goto LABEL_69;
  }
  v20 = a6 & 0x7C00000000000000;
  if ((a6 & 0x7C00000000000000) != 0x7C00000000000000)
  {
    v22 = a6 & 0x1FFFFFFFFFFFFLL;
    if (v20 == 0x7800000000000000)
    {
      v23 = 0;
    }
    else if ((~a6 & 0x6000000000000000) != 0)
    {
      v23 = a6 & 0x7FFE000000000000;
      if (v22 > 0x1ED09BEAD87C0 || v22 == 0x1ED09BEAD87C0 && a5 > 0x378D8E63FFFFFFFFLL)
      {
        v22 = 0;
        a5 = 0;
      }
    }
    else
    {
      v22 = 0;
      a5 = 0;
      v23 = (4 * a6) & 0x7FFE000000000000;
    }
    v24 = a8 & 0x1FFFFFFFFFFFFLL;
    if (v17 == 0x7800000000000000)
    {
      v25 = 0;
    }
    else if ((~a8 & 0x6000000000000000) != 0)
    {
      v25 = a8 & 0x7FFE000000000000;
      if (v24 > 0x1ED09BEAD87C0 || v24 == 0x1ED09BEAD87C0 && a7 > 0x378D8E63FFFFFFFFLL)
      {
        v24 = 0;
        a7 = 0;
      }
    }
    else
    {
      v24 = 0;
      a7 = 0;
      v25 = (4 * a8) & 0x7FFE000000000000;
    }
    v26 = a10 & 0x1FFFFFFFFFFFFLL;
    if (v19 == 0x7800000000000000)
    {
      v27 = 0;
LABEL_46:
      v28 = a9;
      goto LABEL_53;
    }
    if ((~a10 & 0x6000000000000000) != 0)
    {
      v27 = a10 & 0x7FFE000000000000;
      if (v26 <= 0x1ED09BEAD87C0 && (v26 != 0x1ED09BEAD87C0 || a9 <= 0x378D8E63FFFFFFFFLL))
        goto LABEL_46;
      v26 = 0;
      v28 = 0;
    }
    else
    {
      v26 = 0;
      v28 = 0;
      v27 = (4 * a10) & 0x7FFE000000000000;
    }
LABEL_53:
    v29 = a10 & 0x8000000000000000;
    v30 = (a8 ^ a6) & 0x8000000000000000;
    if (v20 == 0x7800000000000000)
    {
      if (v17 != 0x7800000000000000 && !(v24 | a7))
        goto LABEL_67;
      if (v19 == 0x7800000000000000)
      {
        if (v30 != v29)
          goto LABEL_67;
        goto LABEL_63;
      }
      goto LABEL_73;
    }
    if (v17 == 0x7800000000000000)
    {
      if (v19 == 0x7800000000000000)
      {
        if (v30 != v29 || !(v22 | a5))
          goto LABEL_67;
LABEL_63:
        v31 = v29 | 0x7800000000000000;
        goto LABEL_74;
      }
      if (!(v22 | a5))
      {
LABEL_67:
        v587 = xmmword_1B8917D40;
        goto LABEL_68;
      }
LABEL_73:
      v31 = v30 | 0x7800000000000000;
      goto LABEL_74;
    }
    if (v19 == 0x7800000000000000)
    {
      v21 = 0;
      *(_QWORD *)&v587 = 0;
      *((_QWORD *)&v587 + 1) = v29 | 0x7800000000000000;
      goto LABEL_70;
    }
    v33 = (v23 >> 49) - 6176;
    v34 = v33 + (v25 >> 49);
    if ((v34 & 0x80000000) != 0)
      v35 = 0;
    else
      v35 = v34 << 49;
    if (v22 | a5)
    {
      if (v24 || a7 || v26 || v28)
      {
LABEL_90:
        v36 = v22 | a5;
        if (v22 | a5)
        {
          v37 = HIDWORD(a5);
          if (!(a5 >> 53))
            v37 = a5;
          v38 = -1022;
          if (a5 >> 53)
            v38 = -990;
          if (v22)
          {
            v37 = v22;
            v38 = -958;
          }
          v39 = ((COERCE_UNSIGNED_INT64((double)v37) >> 52) & 0x7FF) + v38 - 1;
          v36 = *((_DWORD *)&__bid_nr_digits + 8 * v39);
          if (!v36)
          {
            v40 = (char *)&__bid_nr_digits + 32 * v39;
            v36 = *((_DWORD *)v40 + 6);
            v41 = *((_QWORD *)v40 + 1);
            if (v22 > v41 || v22 == v41 && a5 >= *((_QWORD *)&__bid_nr_digits + 4 * v39 + 2))
              ++v36;
          }
        }
        v42 = v24 | a7;
        if (v24 | a7)
        {
          v43 = HIDWORD(a7);
          if (!(a7 >> 53))
            v43 = a7;
          v44 = -1022;
          if (a7 >> 53)
            v44 = -990;
          if (v24)
          {
            v43 = v24;
            v44 = -958;
          }
          v45 = ((COERCE_UNSIGNED_INT64((double)v43) >> 52) & 0x7FF) + v44 - 1;
          v42 = *((_DWORD *)&__bid_nr_digits + 8 * v45);
          if (!v42)
          {
            v46 = (char *)&__bid_nr_digits + 32 * v45;
            v42 = *((_DWORD *)v46 + 6);
            v47 = *((_QWORD *)v46 + 1);
            if (v24 > v47 || v24 == v47 && a7 >= *((_QWORD *)&__bid_nr_digits + 4 * v45 + 2))
              ++v42;
          }
        }
        if (v26 | v28)
        {
          v48 = HIDWORD(v28);
          if (!(v28 >> 53))
            v48 = v28;
          v49 = -1022;
          if (v28 >> 53)
            v49 = -990;
          if (v26)
          {
            v48 = v26;
            v49 = -958;
          }
          v50 = ((COERCE_UNSIGNED_INT64((double)v48) >> 52) & 0x7FF) + v49 - 1;
          v51 = *((unsigned int *)&__bid_nr_digits + 8 * v50);
          if (!(_DWORD)v51)
          {
            v52 = (char *)&__bid_nr_digits + 32 * v50;
            v51 = *((unsigned int *)v52 + 6);
            v53 = *((_QWORD *)v52 + 1);
            if (v26 > v53 || v26 == v53 && v28 >= *((_QWORD *)&__bid_nr_digits + 4 * v50 + 2))
              v51 = (v51 + 1);
          }
        }
        else
        {
          v51 = 0;
        }
        if (!(v22 | a5) || !(v24 | a7))
        {
          v179 = v27 >= v35;
          v54 = v27 - v35;
          if (v54 != 0 && v179)
          {
            v55 = v54 >> 49;
            if (34 - (int)v51 >= (int)v55)
              v55 = v55;
            else
              v55 = (34 - v51);
            if ((_DWORD)v55)
            {
              if ((int)v51 > 19)
              {
                v74 = __bid_ten2k64[(int)v55];
                v75 = HIDWORD(v74) * (unint64_t)v28;
                v76 = v74 * (unint64_t)HIDWORD(v28)
                    + v75
                    + ((v74 * (unint64_t)v28) >> 32);
                *(_QWORD *)&v587 = (v74 * v28) | ((unint64_t)v76 << 32);
                v16 = HIDWORD(v75) + HIDWORD(v74) * (unint64_t)HIDWORD(v28) + HIDWORD(v76) + v74 * v26;
              }
              else if ((int)v55 > 19)
              {
                v80 = __bid_ten2k128[2 * (v55 - 20)];
                v81 = __bid_ten2k128[2 * (v55 - 20) + 1];
                v82 = HIDWORD(v80);
                v83 = v80 * (unint64_t)HIDWORD(v28);
                v84 = v80 * (unint64_t)v28;
                v85 = v82 * (unint64_t)v28 + v83 + HIDWORD(v84);
                *(_QWORD *)&v587 = v84 | ((unint64_t)v85 << 32);
                v16 = HIDWORD(v83) + v82 * (unint64_t)HIDWORD(v28) + HIDWORD(v85) + v81 * v28;
              }
              else
              {
                v56 = __bid_ten2k64[(int)v55];
                v57 = HIDWORD(v56);
                v58 = v56 * (unint64_t)HIDWORD(v28);
                v59 = v56 * (unint64_t)v28;
                v60 = v57 * (unint64_t)v28 + v58 + HIDWORD(v59);
                v16 = HIDWORD(v58) + v57 * (unint64_t)HIDWORD(v28) + HIDWORD(v60);
                *(_QWORD *)&v587 = v59 | ((unint64_t)v60 << 32);
              }
            }
            else
            {
              *(_QWORD *)&v587 = a9;
            }
            *((_QWORD *)&v587 + 1) = (v27 - (v55 << 49)) & 0x7FFE000000000000 | v16 | v29;
          }
          else
          {
            *(_QWORD *)&v587 = v28;
            *((_QWORD *)&v587 + 1) = v26 | v29 | v27;
          }
          goto LABEL_69;
        }
        v61 = v33 + (v25 >> 49) - 6176;
        v62 = (v42 + v36);
        if ((int)v62 <= 19)
        {
          v63 = v51;
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v67 = a7 * a5;
          v68 = (int)v62 - 1;
          if (a7 * a5 >= __bid_ten2k64[v68])
            v62 = v62;
          else
            v62 = v68;
          goto LABEL_217;
        }
        if ((_DWORD)v62 == 20)
        {
          v63 = v51;
          v64 = 0;
          v65 = 0;
          v69 = a7 * (unint64_t)HIDWORD(a5);
          v70 = HIDWORD(a7) * (unint64_t)a5
              + v69
              + ((a7 * (unint64_t)a5) >> 32);
          v71 = HIDWORD(v69) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v70);
          v67 = (a7 * a5) | ((unint64_t)v70 << 32);
          v72 = v71 == 0;
          v73 = v67 < 0x8AC7230489E80000;
          if (v72 && v73)
            v62 = 19;
          else
            v62 = 20;
          if (v72 && v73)
            v66 = 0;
          else
            v66 = v71;
          goto LABEL_217;
        }
        if (v62 <= 0x26)
        {
          if (v36 > 19)
          {
            v77 = HIDWORD(a7) * (unint64_t)a5;
            v78 = a7 * (unint64_t)HIDWORD(a5)
                + v77
                + ((a7 * (unint64_t)a5) >> 32);
            v67 = (a7 * a5) | ((unint64_t)v78 << 32);
            v79 = a7 * v22 + HIDWORD(a7) * (unint64_t)HIDWORD(a5);
          }
          else
          {
            v77 = a7 * (unint64_t)HIDWORD(a5);
            v78 = HIDWORD(a7) * (unint64_t)a5
                + v77
                + ((a7 * (unint64_t)a5) >> 32);
            v67 = (a7 * a5) | ((unint64_t)v78 << 32);
            v79 = v24 * a5 + HIDWORD(a7) * (unint64_t)HIDWORD(a5);
          }
          v66 = v79 + HIDWORD(v77) + HIDWORD(v78);
          v63 = v51;
          v64 = 0;
          v65 = 0;
          if (__PAIR128__(v66, v67) < *(_OWORD *)&__bid_ten2k128[2 * (v62 - 21)])
            v62 = (v62 - 1);
LABEL_217:
          v192 = (v27 >> 49) - 6176;
          if (!(v26 | v28))
          {
            v193 = *a12;
            *a12 = 0;
            v570 = v193;
            if ((int)v62 < 35)
            {
              if (v61 < 6112 || (int)v62 + v61 > 6145)
              {
                *(_QWORD *)&v587 = v67;
                *((_QWORD *)&v587 + 1) = v66;
              }
              else
              {
                v203 = v61 - 6111;
                if ((int)v62 > 19)
                {
                  v237 = __bid_ten2k64[v203];
                  v238 = HIDWORD(v237) * (unint64_t)v67;
                  v239 = v237 * (unint64_t)HIDWORD(v67)
                       + v238
                       + ((v237 * (unint64_t)v67) >> 32);
                  *(_QWORD *)&v587 = (v237 * v67) | ((unint64_t)v239 << 32);
                  *((_QWORD *)&v587 + 1) = HIDWORD(v238)
                                         + HIDWORD(v237) * (unint64_t)HIDWORD(v67)
                                         + HIDWORD(v239)
                                         + v237 * v66;
                }
                else if (v61 > 0x17F2)
                {
                  v253 = __bid_ten2k128[2 * (v61 - 6131)];
                  v254 = HIDWORD(v253);
                  v255 = v253 * (unint64_t)HIDWORD(v67);
                  v256 = v253 * (unint64_t)v67;
                  v257 = v254 * (unint64_t)v67 + v255 + HIDWORD(v256);
                  v258 = HIDWORD(v255)
                       + v254 * (unint64_t)HIDWORD(v67)
                       + HIDWORD(v257)
                       + __bid_ten2k128[2 * (v61 - 6131) + 1] * v67;
                  *(_QWORD *)&v587 = v256 | ((unint64_t)v257 << 32);
                  *((_QWORD *)&v587 + 1) = v258;
                }
                else
                {
                  v204 = __bid_ten2k64[v203];
                  v205 = HIDWORD(v204);
                  v206 = v204 * (unint64_t)HIDWORD(v67);
                  v207 = v204 * (unint64_t)v67;
                  v208 = v205 * (unint64_t)v67 + v206 + HIDWORD(v207);
                  *(_QWORD *)&v587 = v207 | ((unint64_t)v208 << 32);
                  *((_QWORD *)&v587 + 1) = HIDWORD(v206)
                                         + v205 * (unint64_t)HIDWORD(v67)
                                         + HIDWORD(v208);
                }
                v62 = (v62 + v203);
                v61 = 6111;
              }
            }
            else
            {
              v194 = v62 - 34;
              v195 = v61;
              if (v62 > 0x26)
              {
                *(_QWORD *)&v588 = v67;
                *((_QWORD *)&v588 + 1) = v66;
                if (v62 > 0x39)
                {
                  *(_QWORD *)&v589 = v65;
                  *((_QWORD *)&v589 + 1) = v64;
                  __bid_round256_58_76(v62, (v62 - 34), (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                  v210 = v580;
                }
                else
                {
                  v589 = v65;
                  __bid_round192_39_57(v62, v62 - 34, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                  v210 = v590[0];
                }
                v587 = v210;
              }
              else
              {
                *(_QWORD *)&v583 = v67;
                *((_QWORD *)&v583 + 1) = v66;
                __bid_round128_19_38(v62, v62 - 34, v67, v66, (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
              }
              v61 = v194 + v195;
              if (v585)
              {
                v193 = v570;
                if (v61 == -6177)
                {
                  *a12 |= 0x30u;
                  v62 = 34;
                  v61 = -6176;
                }
                else
                {
                  ++v61;
                  v62 = 34;
                }
              }
              else
              {
                v62 = 34;
                v193 = v570;
              }
            }
            if ((int)v62 + v61 >= 6146)
            {
              if (a11)
              {
                *((_QWORD *)&v587 + 1) |= v30;
                v21 = v586;
                v234 = DWORD1(v586);
                v260 = DWORD2(v586);
                v259 = HIDWORD(v586);
                bid_rounding_correction(a11, SDWORD1(v586), v586, SHIDWORD(v586), SDWORD2(v586), v61, (uint64_t *)&v587, a12);
                v261 = *a12;
              }
              else
              {
                *(_QWORD *)&v587 = 0;
                *((_QWORD *)&v587 + 1) = v30 | 0x7800000000000000;
                v261 = *a12 | 0x28;
                v260 = DWORD2(v586);
                v259 = HIDWORD(v586);
                v21 = v586;
                v234 = DWORD1(v586);
              }
              *a12 = v261 | v193;
              *a1 = v259;
              *a2 = v260;
              goto LABEL_752;
            }
            if ((int)v62 + v61 <= -6143)
            {
              if (v61 <= -6177)
              {
                v262 = -6176 - v61;
                v263 = v586;
                v568 = DWORD1(v586);
                v265 = DWORD2(v586);
                v264 = HIDWORD(v586);
                v586 = 0uLL;
                v266 = v62 - (-6176 - v61);
                if ((int)v62 > -6176 - v61)
                {
                  if ((int)v62 <= 18)
                  {
                    __bid_round64_2_18(v62, v262, v587, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    v267 = &__bid_ten2k64[v266];
                    if (!v585)
                      v267 = &v584;
                    v268 = *v267;
LABEL_462:
                    *(_QWORD *)&v587 = v268;
                    goto LABEL_602;
                  }
                  __bid_round128_19_38(v62, v262, v587, *((unint64_t *)&v587 + 1), (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                  if (v585)
                  {
                    if (v266 > 19)
                    {
                      v587 = *(_OWORD *)&__bid_ten2k128[2 * (v266 - 20)];
                      goto LABEL_602;
                    }
                    v268 = __bid_ten2k64[v266];
                    goto LABEL_462;
                  }
LABEL_602:
                  if (v263 | v264 && HIDWORD(v586))
                  {
                    v443 = v587;
                    *(_QWORD *)&v587 = v587 - 1;
                    if (!v443)
                      --*((_QWORD *)&v587 + 1);
                    HIDWORD(v586) = 0;
                  }
                  else
                  {
                    if (v568 | v265 && DWORD2(v586))
                    {
                      v179 = __CFADD__((_QWORD)v587, 1);
                      *(_QWORD *)&v587 = v587 + 1;
                      if (v179)
                        ++*((_QWORD *)&v587 + 1);
                      DWORD2(v586) = 0;
                      LODWORD(v586) = 1;
                      goto LABEL_626;
                    }
                    if (v586 != 0)
                    {
                      v444 = (v263 | v264) == 0;
                      if (!DWORD2(v586))
                        v444 = 1;
                      if (v444)
                      {
                        v445 = (v568 | v265) == 0;
                        if (!HIDWORD(v586))
                          v445 = 1;
                        if (v445)
                          goto LABEL_626;
                        *(_QWORD *)&v586 = 1;
                      }
                      else
                      {
                        *(_QWORD *)&v586 = 0x100000000;
                      }
                      *((_QWORD *)&v586 + 1) = 0;
LABEL_626:
                      v61 = -6176;
                      goto LABEL_627;
                    }
                    LODWORD(v586) = (v263 | v264) != 0;
                    if (!(v568 | v265))
                      goto LABEL_626;
                  }
                  DWORD1(v586) = 1;
                  goto LABEL_626;
                }
                if ((_DWORD)v62 != v262)
                {
                  v587 = 0uLL;
                  DWORD1(v586) = 1;
                  goto LABEL_602;
                }
                if ((int)v62 > 19)
                {
                  v404 = (unint64_t *)&__bid_midpoint128[(v62 - 20)];
                  v405 = v404[1];
                  if (*((_QWORD *)&v587 + 1) >= v405)
                  {
                    if (*((_QWORD *)&v587 + 1) != v405)
                      goto LABEL_600;
                    v442 = *v404;
                    if ((unint64_t)v587 >= v442)
                    {
                      if ((_QWORD)v587 == v442)
                        goto LABEL_370;
                      goto LABEL_600;
                    }
                  }
                }
                else
                {
                  v292 = __bid_midpoint64[(v62 - 1)];
                  if ((unint64_t)v587 >= v292)
                  {
                    if ((_QWORD)v587 == v292)
                    {
LABEL_370:
                      v293 = 0;
                      DWORD2(v586) = 1;
LABEL_601:
                      v587 = (unint64_t)v293;
                      goto LABEL_602;
                    }
LABEL_600:
                    v293 = 1;
                    LODWORD(v586) = 1;
                    goto LABEL_601;
                  }
                }
                v293 = 0;
                DWORD1(v586) = 1;
                goto LABEL_601;
              }
              v276 = v61 - v192;
              if (v61 <= v192)
              {
LABEL_627:
                v21 = v586;
                v234 = DWORD1(v586);
                v447 = DWORD2(v586);
                v446 = HIDWORD(v586);
                if (v586 != 0)
                  *a12 |= 0x30u;
                *((_QWORD *)&v587 + 1) |= ((unint64_t)(v61 + 6176) << 49) | v30;
                if (a11)
                  bid_rounding_correction(a11, v234, v21, v446, v447, v61, (uint64_t *)&v587, a12);
                *a12 |= v570;
                *a1 = v446;
                *a2 = v447;
                goto LABEL_752;
              }
              if (v276 >= 34 - (int)v62)
                v276 = 34 - v62;
              if (v276)
              {
                if ((int)v62 > 19)
                {
                  v383 = __bid_ten2k64[v276];
                  v384 = v587 * (unint64_t)HIDWORD(v383);
                  v385 = DWORD1(v587) * (unint64_t)v383
                       + v384
                       + ((v587 * (unint64_t)v383) >> 32);
                  v386 = (v587 * v383) | ((unint64_t)v385 << 32);
                  v387 = HIDWORD(v384)
                       + DWORD1(v587) * (unint64_t)HIDWORD(v383)
                       + HIDWORD(v385)
                       + *((_QWORD *)&v587 + 1) * v383;
                  *(_QWORD *)&v587 = v386;
                }
                else
                {
                  if (v276 <= 19)
                  {
                    v277 = DWORD1(v587);
                    v278 = __bid_ten2k64[v276];
                    v279 = v278 * (unint64_t)DWORD1(v587);
                    v280 = HIDWORD(v278) * (unint64_t)v587
                         + v279
                         + ((v278 * (unint64_t)v587) >> 32);
                    *(_QWORD *)&v587 = (v278 * v587) | ((unint64_t)v280 << 32);
                    *((_QWORD *)&v587 + 1) = HIDWORD(v279)
                                           + HIDWORD(v278) * (unint64_t)v277
                                           + HIDWORD(v280);
                    goto LABEL_574;
                  }
                  v430 = __bid_ten2k128[2 * (v276 - 20)];
                  v431 = HIDWORD(v430);
                  v432 = v430 * (unint64_t)DWORD1(v587);
                  v433 = v430 * (unint64_t)v587;
                  v434 = v431 * (unint64_t)v587 + v432 + HIDWORD(v433);
                  v387 = HIDWORD(v432)
                       + v431 * (unint64_t)DWORD1(v587)
                       + HIDWORD(v434)
                       + __bid_ten2k128[2 * (v276 - 20) + 1] * v587;
                  *(_QWORD *)&v587 = v433 | ((unint64_t)v434 << 32);
                }
                *((_QWORD *)&v587 + 1) = v387;
              }
LABEL_574:
              v61 -= v276;
              goto LABEL_627;
            }
            v557 = v30;
            *((_QWORD *)&v587 + 1) |= ((unint64_t)(v61 + 6176) << 49) | v30;
            v21 = v586;
            v269 = DWORD1(v586);
            v271 = DWORD2(v586);
            v270 = HIDWORD(v586);
            if (!a11)
            {
              v275 = 32;
              goto LABEL_355;
            }
            v569 = v62;
            v577 = DWORD1(v586);
            v272 = HIDWORD(v586);
            v273 = DWORD2(v586);
            v274 = v61;
            bid_rounding_correction(a11, SDWORD1(v586), v586, SHIDWORD(v586), SDWORD2(v586), v61, (uint64_t *)&v587, a12);
            if (v274 == -6176)
            {
              LODWORD(v62) = v569;
              v269 = v577;
              v270 = v272;
              v271 = v273;
              if ((*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFuLL) < 0x314DC6448D93)
                goto LABEL_342;
              v275 = 32;
              if ((*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFLL) == 0x314DC6448D93)
              {
                LODWORD(v62) = v569;
                v269 = v577;
                v270 = v272;
                v271 = v273;
                if ((unint64_t)v587 >= 0x38C15B0A00000000)
                {
LABEL_355:
                  if (!(v269 | v21 | v270 | v271))
                    v275 = 0;
                  v281 = *a12 | v275;
                  if ((v281 & 0x20) == 0 && (*((_QWORD *)&v587 + 1) & 0x7FFE000000000000uLL) > v27)
                  {
                    v282 = ((*((_QWORD *)&v587 + 1) & 0x7FFE000000000000) - v27) >> 49;
                    if (34 - (int)v62 < (int)v282)
                      LODWORD(v282) = 34 - v62;
                    if ((_DWORD)v282)
                    {
                      v283 = (int)v282;
                      v284 = *((_QWORD *)&v587 + 1) - ((uint64_t)(int)v282 << 49);
                      if ((int)v62 > 19)
                      {
                        v388 = __bid_ten2k64[v283];
                        v389 = DWORD1(v587);
                        v390 = HIDWORD(v388) * (unint64_t)v587;
                        v391 = v388 * (unint64_t)DWORD1(v587)
                             + v390
                             + ((v388 * (unint64_t)v587) >> 32);
                        *(_QWORD *)&v587 = (v388 * v587) | ((unint64_t)v391 << 32);
                        v290 = HIDWORD(v390)
                             + HIDWORD(v388) * (unint64_t)v389
                             + HIDWORD(v391)
                             + v388 * (*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFLL);
                      }
                      else
                      {
                        if ((int)v283 > 19)
                        {
                          v435 = __bid_ten2k128[2 * (v283 - 20)];
                          v436 = HIDWORD(v435);
                          v437 = v435 * (unint64_t)DWORD1(v587);
                          v438 = v435 * (unint64_t)v587;
                          v439 = v436 * (unint64_t)v587
                               + v437
                               + HIDWORD(v438);
                          v291 = v438 | ((unint64_t)v439 << 32);
                          v290 = HIDWORD(v437)
                               + v436 * (unint64_t)DWORD1(v587)
                               + HIDWORD(v439)
                               + __bid_ten2k128[2 * (v283 - 20) + 1] * v587;
                        }
                        else
                        {
                          v285 = __bid_ten2k64[v283];
                          v286 = HIDWORD(v285);
                          v287 = v285 * (unint64_t)DWORD1(v587);
                          v288 = v285 * (unint64_t)v587;
                          v289 = v286 * (unint64_t)v587
                               + v287
                               + HIDWORD(v288);
                          v290 = HIDWORD(v287) + v286 * (unint64_t)DWORD1(v587) + HIDWORD(v289);
                          v291 = v288 | ((unint64_t)v289 << 32);
                        }
                        *(_QWORD *)&v587 = v291;
                      }
                      *((_QWORD *)&v587 + 1) = v284 & 0x7FFE000000000000 | v290 | v557;
                    }
                  }
                  *a12 = v281 | v570;
                  *a1 = v270;
                  *a2 = v271;
                  *a3 = v269;
                  goto LABEL_72;
                }
LABEL_342:
                v275 = 48;
                goto LABEL_355;
              }
            }
            else
            {
              v275 = 32;
            }
            LODWORD(v62) = v569;
            v269 = v577;
            v270 = v272;
            v271 = v273;
            goto LABEL_355;
          }
          v571 = v28;
          v196 = v63;
          v197 = v192 + v63 - v61 - v62;
          if ((v197 & 0x80000000) == 0)
          {
            v198 = 0;
            v199 = v192 + v63 - v61 - v62;
            v200 = v61;
            v61 = (v27 >> 49) - 6176;
            v201 = v62;
            v62 = v196;
            v553 = v66;
            v566 = v67;
            v66 = v26;
            v67 = v571;
            v202 = v30;
            v30 = a10 & 0x8000000000000000;
LABEL_278:
            *(_QWORD *)&v583 = v198;
            v560 = v66;
            v563 = v67;
            v572 = v201;
            if (v199 > 0x22)
            {
              if ((int)v62 + v61 >= 6146)
              {
                if (a11)
                {
                  v21 = v202 != v30;
                  v234 = v202 == v30;
                  v235 = 34 - (int)v62;
                  if ((_DWORD)v62 == 34)
                  {
                    v236 = v30 | v66;
                    *(_QWORD *)&v587 = v67;
                  }
                  else if ((int)v62 > 19)
                  {
                    v350 = __bid_ten2k64[(int)v235];
                    v351 = HIDWORD(v350) * (unint64_t)v67;
                    v352 = v350 * (unint64_t)HIDWORD(v67)
                         + v351
                         + ((v350 * (unint64_t)v67) >> 32);
                    *(_QWORD *)&v587 = (v350 * v67) | ((unint64_t)v352 << 32);
                    v236 = HIDWORD(v351) + HIDWORD(v350) * (unint64_t)HIDWORD(v67) + HIDWORD(v352) + v350 * v66;
                  }
                  else if ((int)v62 < 15)
                  {
                    v398 = __bid_ten2k128[2 * (14 - v62)];
                    v399 = __bid_ten2k128[2 * (14 - v62) + 1];
                    v400 = HIDWORD(v398);
                    v401 = v398 * (unint64_t)HIDWORD(v67);
                    v402 = v398 * (unint64_t)v67;
                    v403 = v400 * (unint64_t)v67 + v401 + HIDWORD(v402);
                    *(_QWORD *)&v587 = v402 | ((unint64_t)v403 << 32);
                    v236 = HIDWORD(v401)
                         + v400 * (unint64_t)HIDWORD(v67)
                         + HIDWORD(v403)
                         + v399 * v67;
                  }
                  else
                  {
                    v248 = __bid_ten2k64[v235];
                    v249 = HIDWORD(v248);
                    v250 = v248 * (unint64_t)HIDWORD(v67);
                    v251 = v248 * (unint64_t)v67;
                    v252 = v249 * (unint64_t)v67 + v250 + HIDWORD(v251);
                    v236 = HIDWORD(v250) + v249 * (unint64_t)HIDWORD(v67) + HIDWORD(v252);
                    *(_QWORD *)&v587 = v251 | ((unint64_t)v252 << 32);
                  }
                  *((_QWORD *)&v587 + 1) = v236 | v30;
                  bid_rounding_correction(a11, v234, v21, 0, 0, v61 - v235, (uint64_t *)&v587, a12);
                }
                else
                {
                  v21 = 0;
                  v234 = 0;
                  *(_QWORD *)&v587 = 0;
                  *((_QWORD *)&v587 + 1) = v30 | 0x7800000000000000;
                  *a12 |= 0x28u;
                }
                *a1 = 0;
LABEL_751:
                *a2 = 0;
LABEL_752:
                *a3 = v234;
                goto LABEL_72;
              }
LABEL_284:
              if ((int)v62 > 33)
              {
                LODWORD(v226) = 0;
                *(_QWORD *)&v587 = v67;
                *((_QWORD *)&v587 + 1) = v66 | ((unint64_t)(v61 + 6176) << 49) | v30;
              }
              else
              {
                LODWORD(v226) = 34 - v62;
                if (v61 + 6176 >= 34 - (int)v62)
                  v226 = v226;
                else
                  v226 = (v61 + 6176);
                if ((_DWORD)v226)
                {
                  v227 = v202;
                  if ((int)v62 > 19)
                  {
                    v298 = __bid_ten2k64[(int)v226];
                    v299 = HIDWORD(v298) * (unint64_t)v67;
                    v300 = v298 * (unint64_t)HIDWORD(v67)
                         + v299
                         + ((v298 * (unint64_t)v67) >> 32);
                    *(_QWORD *)&v587 = (v298 * v67) | ((unint64_t)v300 << 32);
                    v66 = HIDWORD(v299) + HIDWORD(v298) * (unint64_t)HIDWORD(v67) + HIDWORD(v300) + v298 * v66;
                  }
                  else if ((int)v226 > 19)
                  {
                    v368 = __bid_ten2k128[2 * (v226 - 20)];
                    v369 = __bid_ten2k128[2 * (v226 - 20) + 1];
                    v370 = HIDWORD(v368);
                    v371 = v368 * (unint64_t)HIDWORD(v67);
                    v372 = v368 * (unint64_t)v67;
                    v373 = v370 * (unint64_t)v67 + v371 + HIDWORD(v372);
                    *(_QWORD *)&v587 = v372 | ((unint64_t)v373 << 32);
                    v66 = HIDWORD(v371)
                        + v370 * (unint64_t)HIDWORD(v67)
                        + HIDWORD(v373)
                        + v369 * v67;
                  }
                  else
                  {
                    v228 = __bid_ten2k64[(int)v226];
                    v229 = HIDWORD(v228);
                    v230 = v228 * (unint64_t)HIDWORD(v67);
                    v231 = v228 * (unint64_t)v67;
                    v232 = v229 * (unint64_t)v67 + v230 + HIDWORD(v231);
                    v66 = HIDWORD(v230) + v229 * (unint64_t)HIDWORD(v67) + HIDWORD(v232);
                    *(_QWORD *)&v587 = v231 | ((unint64_t)v232 << 32);
                  }
                  v202 = v227;
                }
                else
                {
                  *(_QWORD *)&v587 = v67;
                }
                v61 -= v226;
                *((_QWORD *)&v587 + 1) = (v27 - (v226 << 49)) & 0x7FFE000000000000 | v66 | v30;
                if ((int)v226 + (int)v62 <= 33)
                  *a12 |= 0x10u;
              }
              v374 = v226 + v62;
              if (v202 == v30)
              {
                v375 = 0;
                v21 = 0;
                v234 = 1;
                goto LABEL_744;
              }
              if (v199 != v374 + 1)
              {
                v375 = 0;
                v234 = 0;
                v21 = 1;
                goto LABEL_744;
              }
              v547 = v202;
              v552 = v61;
              v376 = v64;
              if ((int)v62 > 19)
              {
                if ((_DWORD)v62 == 20)
                {
                  v375 = 0;
                  v21 = 1;
                  if (v560 || v67 != 0x8AC7230489E80000)
                  {
                    v234 = 0;
                    goto LABEL_743;
                  }
                  goto LABEL_494;
                }
                v396 = &__bid_ten2k128[2 * (v62 - 21)];
                if (v560 != v396[1])
                {
LABEL_509:
                  v375 = 0;
                  v234 = 0;
                  v21 = 1;
LABEL_743:
                  v202 = v547;
LABEL_744:
                  v473 = *a12;
                  *a12 |= 0x20u;
                  if (v61 != -6176 || v374 >= 34)
                  {
                    if (v61 != -6176 || v374 != 34)
                      goto LABEL_748;
                    if (v202 == v30 || (*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFLL) != 0x314DC6448D93)
                    {
                      v61 = -6176;
                      goto LABEL_748;
                    }
                    v61 = -6176;
                    if ((_QWORD)v587 != 0x38C15B0A00000000)
                      goto LABEL_748;
                  }
                  v474 = v473 | 0x30;
                  v61 = -6176;
LABEL_747:
                  *a12 = v474;
LABEL_748:
                  if (a11)
                    bid_rounding_correction(a11, v234, v21, v375, 0, v61, (uint64_t *)&v587, a12);
                  *a1 = v375;
                  goto LABEL_751;
                }
                v377 = *v396;
              }
              else
              {
                v377 = __bid_ten2k64[(int)v62 - 1];
              }
              if (v67 != v377)
                goto LABEL_509;
LABEL_494:
              v378 = (v572 - 1);
              if ((_DWORD)v572 == 1)
              {
                v379 = 0;
                v380 = 0;
                v381 = 0;
                v382 = 0;
              }
              else
              {
                if ((int)v572 > 18)
                {
                  if (v572 > 0x26)
                  {
                    *(_QWORD *)&v588 = v566;
                    *((_QWORD *)&v588 + 1) = v553;
                    if (v572 > 0x39)
                    {
                      *(_QWORD *)&v589 = v65;
                      *((_QWORD *)&v589 + 1) = v376;
                      v397 = (uint64_t *)&v580;
                      __bid_round256_58_76(v572, v378, (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    }
                    else
                    {
                      v589 = v65;
                      v397 = (uint64_t *)v590;
                      __bid_round192_39_57(v572, v378, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    }
                  }
                  else
                  {
                    *(_QWORD *)&v583 = v566;
                    *((_QWORD *)&v583 + 1) = v553;
                    v397 = (uint64_t *)&v582;
                    __bid_round128_19_38(v572, v378, v566, v553, (unint64_t *)&v582, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                  }
                }
                else
                {
                  v397 = (uint64_t *)&v584;
                  __bid_round64_2_18(v572, v378, v566, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                }
                v469 = *v397;
                if (v585)
                  v469 = 10;
                v566 = v469;
                v382 = DWORD1(v586) != 0;
                v381 = (_DWORD)v586 != 0;
                v380 = HIDWORD(v586) != 0;
                v379 = DWORD2(v586) != 0;
              }
              if (v566 != 5 || v382 || v381 || v380 || v379)
              {
                v375 = 0;
                if (v566 != 5)
                  v381 = 0;
                v21 = 1;
                if (v552 == -6176 || v566 < 5 || v381)
                {
                  v234 = 0;
                }
                else
                {
                  if (v374 > 19)
                  {
                    v471 = &__bid_ten2k128[2 * (v374 - 20)];
                    v470 = v471[1];
                  }
                  else
                  {
                    v470 = 0;
                    v471 = &__bid_ten2k64[v374];
                  }
                  v375 = 0;
                  v21 = 0;
                  *(_QWORD *)&v587 = *v471 - 1;
                  *((_QWORD *)&v587 + 1) = v470 | ((unint64_t)(v552 + 6175) << 49) | v30;
                  v234 = 1;
                  --v552;
                }
              }
              else
              {
                v21 = 0;
                v234 = 0;
                v375 = 1;
              }
              v472 = *a12;
              if (v552 != -6176)
              {
                v474 = v472 | 0x20;
                v61 = v552;
                goto LABEL_747;
              }
              *a12 = v472 | 0x10;
              v61 = -6176;
              goto LABEL_743;
            }
            if (v199 == 34)
            {
              v223 = 34 - (int)v62;
              if (v61 + 6176 >= (int)v223)
              {
                v224 = v202;
                v225 = v64;
                v556 = v30;
                if ((_DWORD)v62 == 34)
                {
                  *(_QWORD *)&v587 = v67;
                }
                else if ((int)v62 > 19)
                {
                  v365 = __bid_ten2k64[(int)v223];
                  v366 = HIDWORD(v365) * (unint64_t)v67;
                  v367 = v365 * (unint64_t)HIDWORD(v67)
                       + v366
                       + ((v365 * (unint64_t)v67) >> 32);
                  *(_QWORD *)&v587 = (v365 * v67) | ((unint64_t)v367 << 32);
                  v560 = HIDWORD(v366) + HIDWORD(v365) * (unint64_t)HIDWORD(v67) + HIDWORD(v367) + v365 * v560;
                  v563 = v587;
                }
                else if ((int)v62 < 15)
                {
                  v406 = __bid_ten2k128[2 * (14 - v62)];
                  v407 = __bid_ten2k128[2 * (14 - v62) + 1];
                  v408 = HIDWORD(v406);
                  v409 = v406 * (unint64_t)HIDWORD(v67);
                  v410 = v406 * (unint64_t)v67;
                  v411 = v408 * (unint64_t)v67 + v409 + HIDWORD(v410);
                  *(_QWORD *)&v587 = v410 | ((unint64_t)v411 << 32);
                  v560 = HIDWORD(v409)
                       + v408 * (unint64_t)HIDWORD(v67)
                       + HIDWORD(v411)
                       + v407 * v67;
                  v563 = v587;
                }
                else
                {
                  v295 = __bid_ten2k64[v223];
                  v296 = v295 * (unint64_t)HIDWORD(v67);
                  v297 = HIDWORD(v295) * (unint64_t)v67
                       + v296
                       + ((v295 * (unint64_t)v67) >> 32);
                  v560 = HIDWORD(v296) + HIDWORD(v295) * (unint64_t)HIDWORD(v67) + HIDWORD(v297);
                  v563 = (v295 * v67) | ((unint64_t)v297 << 32);
                  *(_QWORD *)&v587 = v563;
                }
                v412 = v27 - (v223 << 49);
                v413 = v61 - v223;
                if ((int)v572 <= 19)
                {
                  v414 = __bid_midpoint64[(int)v572 - 1];
                  if (v566 < v414)
                  {
LABEL_521:
                    v415 = 0;
                    v416 = 0;
                    v417 = 1;
                    v234 = 1;
                    goto LABEL_540;
                  }
                  v417 = v566 == v414;
                  v415 = v566 != v414;
                  v416 = 1;
                  v234 = v415;
LABEL_540:
                  if (v224 == v30)
                  {
                    if ((v416 & 1) == 0)
                    {
                      v424 = 0;
                      v425 = 0;
                      v21 = 0;
                      v427 = v412 & 0x7FFE000000000000 | v560 | v224;
                      *((_QWORD *)&v587 + 1) = v427;
                      v234 = 1;
                      goto LABEL_659;
                    }
                    if ((v234 & 1) != 0)
                    {
                      if (!v417)
                      {
LABEL_544:
                        *(_QWORD *)&v587 = v563 + 1;
                        if (v563 == -1)
                        {
                          ++v560;
                        }
                        else if (v563 == 0x378D8E63FFFFFFFFLL && (v560 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0)
                        {
                          v560 = 0x314DC6448D93;
                          v450 = v413++ + 6177;
                          v412 = (unint64_t)(v450 & 0x3FFF) << 49;
                          *(_QWORD *)&v587 = 0x38C15B0A00000000;
                        }
                        v424 = 0;
                        v427 = v560 | v224 | v412 & 0x7FFE000000000000;
                        *((_QWORD *)&v587 + 1) = v427;
                        v425 = v234 ^ 1;
                        v21 = v234;
                        v234 = 0;
LABEL_659:
                        v451 = *a12;
                        *a12 |= 0x20u;
                        if (!a11 && v413 >= 6112)
                        {
                          *(_QWORD *)&v587 = 0;
                          *((_QWORD *)&v587 + 1) = v224 | 0x7800000000000000;
                          v452 = v451 | 0x28;
                          goto LABEL_662;
                        }
                        if (!a11)
                        {
LABEL_828:
                          *((_QWORD *)&v587 + 1) = v427 | v412 & 0x7FFE000000000000 | v556;
                          goto LABEL_829;
                        }
                        goto LABEL_671;
                      }
                    }
                    else if (((v415 | v563) & 1) != 0)
                    {
                      goto LABEL_544;
                    }
                    v425 = 0;
                    v21 = 0;
                    v234 = 0;
                    v427 = v412 & 0x7FFE000000000000 | v560 | v224;
                    *((_QWORD *)&v587 + 1) = v427;
                    v424 = 1;
                    goto LABEL_659;
                  }
                  if (v560 == 0x314DC6448D93 && v563 == 0x38C15B0A00000000)
                  {
                    v564 = v412 >> 49;
                    if (!(v412 >> 49))
                    {
                      if (v417)
                        v440 = 0x38C15B0A00000000;
                      else
                        v440 = 0x38C15B09FFFFFFFFLL;
                      v427 = v412 & 0x7FFE000000000000 | v30 | 0x314DC6448D93;
                      *(_QWORD *)&v587 = v440;
                      *((_QWORD *)&v587 + 1) = v427;
                      *a12 |= 0x10u;
                      v425 = v234 ^ 1;
                      v21 = v234 & (v416 ^ 1);
                      v234 &= v416;
                      if (!a11)
                      {
                        v424 = 0;
                        goto LABEL_825;
                      }
                      bid_rounding_correction(a11, v234, v21, v425, 0, -6176, (uint64_t *)&v587, a12);
                      v424 = 0;
                      goto LABEL_587;
                    }
                    v423 = (v572 - 1);
                    if ((_DWORD)v572 == 1)
                    {
                      v21 = 0;
                      v234 = 0;
                      v424 = 0;
                      v425 = 0;
                      v426 = 0x378D8E6400000000 - v566;
                      v412 -= 0x2000000000000;
                      v427 = v556 | 0x1ED09BEAD87C0 | v412 & 0x7FFE000000000000;
LABEL_824:
                      *(_QWORD *)&v587 = v426;
                      *((_QWORD *)&v587 + 1) = v427;
LABEL_825:
                      if (v234 | v424 | v21 | v425)
                        *a12 |= 0x20u;
                      else
                        v424 = 0;
                      goto LABEL_828;
                    }
                    if ((int)v572 > 18)
                    {
                      if (v572 > 0x26)
                      {
                        *(_QWORD *)&v588 = v566;
                        *((_QWORD *)&v588 + 1) = v553;
                        if (v572 > 0x39)
                        {
                          *(_QWORD *)&v589 = v65;
                          *((_QWORD *)&v589 + 1) = v225;
                          __bid_round256_58_76(v572, v423, (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                          v459 = v580;
                        }
                        else
                        {
                          v589 = v65;
                          __bid_round192_39_57(v572, v423, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                          v459 = *(_QWORD *)&v590[0];
                        }
                      }
                      else
                      {
                        *(_QWORD *)&v583 = v566;
                        *((_QWORD *)&v583 + 1) = v553;
                        __bid_round128_19_38(v572, v423, v566, v553, (unint64_t *)&v582, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                        v459 = v582;
                      }
                      v584 = v459;
                    }
                    else
                    {
                      __bid_round64_2_18(v572, v423, v566, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    }
                    v424 = DWORD2(v586);
                    v425 = HIDWORD(v586);
                    if (v586 == 0)
                    {
                      v21 = 0;
                      v234 = 0;
                      v424 = 0;
                      v425 = 0;
                      v412 -= 0x2000000000000;
                      v427 = v556 | 0x1ED09BEAD87C0 | v412 & 0x7FFE000000000000;
                      v426 = 0x378D8E6400000000 - v584;
                      goto LABEL_824;
                    }
                    if (v585)
                      v492 = 0x378D8E63FFFFFFF6;
                    else
                      v492 = 0x378D8E6400000000 - v584;
                    *(_QWORD *)&v587 = v492;
                    *((_QWORD *)&v587 + 1) = 0x1ED09BEAD87C0;
                    v413 = v564 - 6177;
                    if (DWORD1(v586))
                    {
                      v234 = 0;
                      v21 = 1;
                    }
                    else
                    {
                      v21 = 0;
                      if ((_DWORD)v586)
                      {
                        v234 = 1;
                      }
                      else
                      {
                        v234 = 0;
                        v424 = HIDWORD(v586) != 0;
                        if (HIDWORD(v586))
                          v425 = 0;
                        else
                          v425 = DWORD2(v586) != 0;
                      }
                    }
                    if (v564 <= 0x3000)
                    {
                      *a12 |= 0x20u;
                      v427 = ((v412 & 0xFFFE000000000000) - 0x12F641527840) | v556;
                      *((_QWORD *)&v587 + 1) = v427;
                      if (!a11)
                        goto LABEL_588;
                      bid_rounding_correction(a11, v234, v21, v425, v424, v413, (uint64_t *)&v587, a12);
LABEL_587:
                      v427 = *((_QWORD *)&v587 + 1);
LABEL_588:
                      v412 = v427 & 0x7FFE000000000000;
                      goto LABEL_825;
                    }
LABEL_668:
                    if (a11)
                    {
                      bid_rounding_correction(a11, v234, v21, v425, v424, v413, (uint64_t *)&v587, a12);
                      goto LABEL_829;
                    }
                    *(_QWORD *)&v587 = 0;
                    *((_QWORD *)&v587 + 1) = v556 | 0x7800000000000000;
                    v452 = *a12 | 0x28;
LABEL_662:
                    *a12 = v452;
LABEL_829:
                    *a1 = v425;
                    *a2 = v424;
                    goto LABEL_752;
                  }
                  if ((v416 & 1) != 0)
                  {
                    if ((v234 & 1) != 0)
                    {
                      if (!v417)
                      {
LABEL_555:
                        v425 = 0;
                        v21 = 0;
                        v427 = v412 & 0x7FFE000000000000 | v556 | ((__PAIR128__(v560, v563) - 1) >> 64);
                        *(_QWORD *)&v587 = v563 - 1;
                        *((_QWORD *)&v587 + 1) = v427;
                        v424 = v234 ^ 1;
                        goto LABEL_667;
                      }
                    }
                    else if (((v415 | v563) & 1) != 0)
                    {
                      goto LABEL_555;
                    }
                    v424 = 0;
                    v21 = 0;
                    v234 = 0;
                    v427 = v30 | v560 | v412 & 0x7FFE000000000000;
                    *((_QWORD *)&v587 + 1) = v427;
                    v425 = 1;
                  }
                  else
                  {
                    v424 = 0;
                    v425 = 0;
                    v234 = 0;
                    v427 = v556 | v560 | v412 & 0x7FFE000000000000;
                    *((_QWORD *)&v587 + 1) = v427;
                    v21 = 1;
                  }
LABEL_667:
                  if (v413 < 6112)
                  {
                    *a12 |= 0x20u;
                    if (!a11)
                    {
LABEL_672:
                      v412 = v427 & 0x7FFE000000000000;
                      goto LABEL_828;
                    }
LABEL_671:
                    bid_rounding_correction(a11, v234, v21, v425, v424, v413, (uint64_t *)&v587, a12);
                    v427 = *((_QWORD *)&v587 + 1);
                    goto LABEL_672;
                  }
                  goto LABEL_668;
                }
                if (v572 > 0x26)
                {
                  if (v572 > 0x3A)
                  {
                    v418 = (unint64_t *)((char *)&__bid_midpoint256 + 32 * (v572 - 59));
                    v421 = v418[3];
                    if (v64 < v421)
                      goto LABEL_521;
                    if (v64 != v421)
                      goto LABEL_538;
                  }
                  else
                  {
                    if (v64)
                      goto LABEL_538;
                    v418 = (unint64_t *)((char *)&__bid_midpoint192 + 32 * (v572 - 39));
                  }
                  v422 = v418[2];
                  if (v65 < v422)
                    goto LABEL_521;
                  if (v65 != v422)
                    goto LABEL_538;
                }
                else
                {
                  if (v65)
                    goto LABEL_538;
                  v418 = (unint64_t *)&__bid_midpoint128[(v572 - 20)];
                }
                v419 = v418[1];
                if (v553 < v419)
                  goto LABEL_521;
                if (v553 == v419)
                {
                  v420 = *v418;
                  if (v566 < v420)
                    goto LABEL_521;
                  if (v566 == v420)
                  {
                    v415 = 0;
                    v234 = 0;
                    v417 = 1;
LABEL_539:
                    v416 = 1;
                    goto LABEL_540;
                  }
                }
LABEL_538:
                v417 = 0;
                v415 = 1;
                v234 = 1;
                goto LABEL_539;
              }
              goto LABEL_284;
            }
            v233 = v201 + v199;
            v540 = v64;
            v542 = v65;
            if ((int)v62 > v199 || v233 <= 34)
            {
              v240 = v233 > 34;
              if ((int)v62 <= v199)
                v240 = v233 < 35;
              if (v240 || (int)v62 > v199 && v233 < 35 || v233 < (int)v62)
              {
                v551 = v202 == v30;
                if (v199 > 1 || v202 == v30)
                {
                  v558 = v30;
                  if (v233 < 35)
                  {
                    v308 = v233 - v62;
                    if (v233 >= (int)v62)
                    {
                      v309 = 0;
                    }
                    else
                    {
                      v392 = v62 - v233;
                      if ((int)v572 > 19)
                      {
                        v309 = 0;
                        v308 = 0;
                        v453 = __bid_ten2k64[v392];
                        v454 = HIDWORD(v453) * (unint64_t)v566;
                        v455 = v453 * (unint64_t)HIDWORD(v566)
                             + v454
                             + ((v453 * (unint64_t)v566) >> 32);
                        v456 = (v453 * v566) | ((unint64_t)v455 << 32);
                        v457 = HIDWORD(v454)
                             + HIDWORD(v453) * (unint64_t)HIDWORD(v566)
                             + HIDWORD(v455)
                             + v453 * v553;
                        v566 = v456;
                        *(_QWORD *)&v583 = v456;
                        *((_QWORD *)&v583 + 1) = v457;
                        v553 = v457;
                      }
                      else
                      {
                        v309 = 0;
                        v308 = 0;
                        if (v392 > 19)
                        {
                          v465 = &__bid_ten2k128[2 * (v392 - 20)];
                          v466 = *v465 * (unint64_t)HIDWORD(v566);
                          v467 = HIDWORD(*v465) * (unint64_t)v566
                               + v466
                               + ((*v465 * (unint64_t)v566) >> 32);
                          v468 = HIDWORD(v466)
                               + HIDWORD(*v465) * (unint64_t)HIDWORD(v566)
                               + HIDWORD(v467)
                               + v465[1] * v566;
                          *(_QWORD *)&v583 = (*v465 * v566) | ((unint64_t)v467 << 32);
                          *((_QWORD *)&v583 + 1) = v468;
                          v553 = v468;
                        }
                        else
                        {
                          v393 = __bid_ten2k64[v392];
                          v394 = v393 * (unint64_t)HIDWORD(v566);
                          v395 = HIDWORD(v393) * (unint64_t)v566
                               + v394
                               + ((v393 * (unint64_t)v566) >> 32);
                          v553 = HIDWORD(v394) + HIDWORD(v393) * (unint64_t)HIDWORD(v566) + HIDWORD(v395);
                          *(_QWORD *)&v583 = (v393 * v566) | ((unint64_t)v395 << 32);
                          *((_QWORD *)&v583 + 1) = v553;
                        }
                        v566 = v583;
                      }
                    }
                    goto LABEL_398;
                  }
LABEL_397:
                  v558 = v30;
                  v308 = 34 - v62;
                  v309 = v233 - 34;
LABEL_398:
                  v310 = 0;
                  v311 = 0;
                  v312 = v67;
                  v546 = HIDWORD(v67);
                  v313 = v309;
                  v537 = v308 - 20;
                  v543 = &__bid_ten2k64[v308];
                  v314 = v61 - (uint64_t)v308;
                  v315 = v61 - v308;
                  if (v61 - v308 >= -6176)
                    v315 = -6176;
                  v534 = v315;
                  v535 = v572 - 20 - v309;
                  v316 = v308;
                  v536 = (int)v572 - (unint64_t)v309;
                  v538 = &__bid_ten2k64[(int)v572 - v309];
                  v317 = v66;
                  v544 = v308;
                  v545 = v61 - (uint64_t)v308;
                  while (1)
                  {
                    if (v316 + v311)
                    {
                      if ((int)v62 > 19)
                      {
                        v327 = v543[v311];
                        v328 = HIDWORD(v327) * (unint64_t)v563;
                        v329 = v327 * (unint64_t)v546
                             + v328
                             + ((v327 * (unint64_t)v563) >> 32);
                        *(_QWORD *)&v587 = (v327 * v563) | ((unint64_t)v329 << 32);
                        *((_QWORD *)&v587 + 1) = HIDWORD(v328)
                                               + HIDWORD(v327) * (unint64_t)v546
                                               + HIDWORD(v329)
                                               + v327 * v317;
                      }
                      else
                      {
                        if (v316 + v311 > 19)
                        {
                          v330 = __bid_ten2k128[2 * (v537 + v311)];
                          v331 = HIDWORD(v330);
                          v332 = v330 * (unint64_t)v546;
                          v333 = v330 * (unint64_t)v563;
                          v334 = v331 * (unint64_t)v563;
                          v335 = HIDWORD(v332) + v331 * (unint64_t)v546;
                          v336 = v334 + v332 + HIDWORD(v333);
                          v326 = v333 | ((unint64_t)v336 << 32);
                          v325 = v335 + HIDWORD(v336) + __bid_ten2k128[2 * (v537 + v311) + 1] * v312;
                        }
                        else
                        {
                          v318 = v543[v311];
                          v319 = HIDWORD(v318);
                          v320 = v318 * (unint64_t)v546;
                          v321 = v318 * (unint64_t)v563;
                          v322 = v319 * (unint64_t)v563;
                          v323 = HIDWORD(v320) + v319 * (unint64_t)v546;
                          v324 = v322 + v320 + HIDWORD(v321);
                          v325 = v323 + HIDWORD(v324);
                          v326 = v321 | ((unint64_t)v324 << 32);
                        }
                        *(_QWORD *)&v587 = v326;
                        *((_QWORD *)&v587 + 1) = v325;
                      }
                    }
                    else
                    {
                      *(_QWORD *)&v587 = v312;
                      *((_QWORD *)&v587 + 1) = v317;
                    }
                    if (v313 == v311)
                    {
                      *(_QWORD *)&v582 = v566;
                      *((_QWORD *)&v582 + 1) = v553;
                    }
                    else
                    {
                      v337 = v62;
                      if ((int)v572 > 18)
                      {
                        if (v572 > 0x26)
                        {
                          v339 = v313 + v310;
                          if (v572 > 0x39)
                          {
                            *(_QWORD *)&v588 = v566;
                            *((_QWORD *)&v588 + 1) = v553;
                            *(_QWORD *)&v589 = v542;
                            *((_QWORD *)&v589 + 1) = v540;
                            __bid_round256_58_76(v572, v339, (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                            if (v585)
                            {
                              if ((uint64_t)(v536 + v311) > 19)
                              {
                                v580 = *(_OWORD *)&__bid_ten2k128[2 * (v535 + v311)];
                                v340 = v580;
                              }
                              else
                              {
                                v340 = v538[v311];
                                *(_QWORD *)&v580 = v340;
                              }
                            }
                            else
                            {
                              v340 = v580;
                            }
                            v341 = *((_QWORD *)&v580 + 1);
                          }
                          else
                          {
                            *(_QWORD *)&v588 = v566;
                            *((_QWORD *)&v588 + 1) = v553;
                            v589 = v542;
                            __bid_round192_39_57(v572, v339, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                            if (v585)
                            {
                              if ((uint64_t)(v536 + v311) > 19)
                              {
                                v590[0] = *(_OWORD *)&__bid_ten2k128[2 * (v535 + v311)];
                                v340 = *(_QWORD *)&v590[0];
                              }
                              else
                              {
                                v340 = v538[v311];
                                *(_QWORD *)&v590[0] = v340;
                              }
                            }
                            else
                            {
                              v340 = *(_QWORD *)&v590[0];
                            }
                            v341 = *((_QWORD *)&v590[0] + 1);
                          }
                          *(_QWORD *)&v582 = v340;
                          *((_QWORD *)&v582 + 1) = v341;
                          v317 = v560;
                          v312 = v563;
                          v62 = v337;
                          v316 = v544;
                          v314 = v545;
                        }
                        else
                        {
                          *(_QWORD *)&v583 = v566;
                          *((_QWORD *)&v583 + 1) = v553;
                          __bid_round128_19_38(v572, v313 + v310, v566, v553, (unint64_t *)&v582, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                          v317 = v560;
                          v312 = v563;
                          v62 = v337;
                          v316 = v544;
                          v314 = v545;
                          if (v585)
                          {
                            if ((uint64_t)(v536 + v311) > 19)
                              v582 = *(_OWORD *)&__bid_ten2k128[2 * (v535 + v311)];
                            else
                              *(_QWORD *)&v582 = v538[v311];
                          }
                        }
                      }
                      else
                      {
                        __bid_round64_2_18(v572, v313 + v310, v566, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                        if (v585)
                        {
                          v338 = v538[v311];
                          v584 = v338;
                        }
                        else
                        {
                          v338 = v584;
                        }
                        v316 = v544;
                        v314 = v545;
                        v582 = v338;
                        v317 = v560;
                        v312 = v563;
                        v62 = v337;
                      }
                    }
                    v342 = v314 + v310;
                    if (v551)
                      break;
                    v343 = v587;
                    v344 = v587 - v582;
                    v345 = (__PAIR128__(*((_QWORD *)&v587 + 1) - *((_QWORD *)&v582 + 1), v587) - (unint64_t)v582) >> 64;
                    v587 = __PAIR128__(*((_QWORD *)&v587 + 1) - *((_QWORD *)&v582 + 1), v587) - (unint64_t)v582;
                    if (v342 < -6175)
                    {
                      LODWORD(v342) = v534;
LABEL_476:
                      if (DWORD1(v586))
                      {
                        *(_QWORD *)&v586 = 1;
                        goto LABEL_876;
                      }
                      if ((_DWORD)v586)
                      {
                        LODWORD(v586) = 0;
LABEL_499:
                        DWORD1(v586) = 1;
                        goto LABEL_876;
                      }
                      if ((v343 & 1) == 0)
                      {
                        if (HIDWORD(v586))
                        {
                          *((_QWORD *)&v586 + 1) = 1;
                        }
                        else if (DWORD2(v586))
                        {
                          *((_QWORD *)&v586 + 1) = 0x100000000;
                        }
                        goto LABEL_876;
                      }
                      if (HIDWORD(v586))
                      {
                        *(_QWORD *)&v587 = v344 + 1;
                        if (v344 == -1)
                        {
                          v448 = v345 + 1;
                          goto LABEL_875;
                        }
                        if (v344 != 0x378D8E63FFFFFFFFLL || v345 != 0x1ED09BEAD87C0)
                          goto LABEL_876;
                        goto LABEL_814;
                      }
                      v487 = DWORD2(v586);
                      if (!DWORD2(v586))
                        goto LABEL_876;
                      v488 = v344 - 1;
                      *(_QWORD *)&v587 = v488;
                      if (v343 == (_QWORD)v582)
                      {
                        v448 = v345 - 1;
                        goto LABEL_875;
                      }
                      if (!(v345 | v488))
                      {
                        v21 = 0;
                        v587 = 0uLL;
                        *a1 = 0;
                        *a2 = v487;
                        goto LABEL_71;
                      }
                      goto LABEL_876;
                    }
                    v346 = v313 + v310;
                    if (v345 < 0x314DC6448D93 || v344 < 0x38C15B0A00000000 && v345 == 0x314DC6448D93)
                    {
                      if (v346 < 1)
                        goto LABEL_476;
                    }
                    else if (v345 != 0x314DC6448D93
                           || v344 != 0x38C15B0A00000000
                           || *(_QWORD *)((char *)&v586 + 4) == 0
                           || v346 <= 0)
                    {
                      goto LABEL_476;
                    }
                    v586 = 0uLL;
                    ++v311;
                    --v310;
                    v585 = 0;
                  }
                  v353 = v587;
                  v587 += v582;
                  v354 = v587;
                  if (*((_QWORD *)&v587 + 1) > 0x1ED09BEAD87C0uLL
                    || (unint64_t)v587 > 0x378D8E63FFFFFFFFLL && *((_QWORD *)&v587 + 1) == 0x1ED09BEAD87C0)
                  {
                    v355 = v586;
                    v573 = DWORD1(v586);
                    v356 = DWORD2(v586);
                    v357 = HIDWORD(v586);
                    v586 = 0uLL;
                    v583 = v587;
                    __bid_round128_19_38(35, 1, v587, *((unint64_t *)&v587 + 1), (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    v358 = HIDWORD(v586);
                    if (v355 | v357 && HIDWORD(v586))
                    {
                      v359 = v587;
                      *(_QWORD *)&v587 = v587 - 1;
                      if (!v359)
                        --*((_QWORD *)&v587 + 1);
                      v358 = 0;
                      HIDWORD(v586) = 0;
                      v360 = 1;
                      DWORD1(v586) = 1;
                      v361 = DWORD2(v586);
                      v362 = v586;
                      goto LABEL_802;
                    }
                    v361 = DWORD2(v586);
                    if (v573 | v356 && DWORD2(v586))
                    {
                      v179 = __CFADD__((_QWORD)v587, 1);
                      *(_QWORD *)&v587 = v587 + 1;
                      if (v179)
                        ++*((_QWORD *)&v587 + 1);
                      v361 = 0;
                      DWORD2(v586) = 0;
                      v362 = 1;
                      LODWORD(v586) = 1;
                      v360 = DWORD1(v586);
                      goto LABEL_802;
                    }
                    v362 = v586;
                    v360 = DWORD1(v586);
                    if (v586 == 0)
                    {
                      if (v355 | v357)
                      {
                        v362 = 1;
                        LODWORD(v586) = 1;
                      }
                      else
                      {
                        v362 = 0;
                      }
                      if (v573 | v356)
                      {
                        v361 = 0;
                        v358 = 0;
                        v360 = 1;
                        DWORD1(v586) = 1;
                      }
                      else
                      {
                        v360 = 0;
                        v361 = 0;
                        v358 = 0;
                      }
                      goto LABEL_802;
                    }
                    v464 = (v355 | v357) == 0;
                    if (!DWORD2(v586))
                      v464 = 1;
                    if (v464)
                    {
                      v489 = (v573 | v356) == 0;
                      if (!HIDWORD(v586))
                        v489 = 1;
                      if (v489)
                      {
LABEL_802:
                        LODWORD(v342) = v342 + 1;
                        if (!v358 && !v361 && !v360 && !v362 && (v357 || v356 || v355 | v573))
                          goto LABEL_499;
                        goto LABEL_876;
                      }
                      v360 = 0;
                      v361 = 0;
                      v358 = 0;
                      v362 = 1;
                      *(_QWORD *)&v586 = 1;
                    }
                    else
                    {
                      v362 = 0;
                      v361 = 0;
                      v358 = 0;
                      v360 = 1;
                      *(_QWORD *)&v586 = 0x100000000;
                    }
                    *((_QWORD *)&v586 + 1) = 0;
                    goto LABEL_802;
                  }
                  if ((v353 & 1) == 0)
                    goto LABEL_876;
                  if (DWORD2(v586))
                  {
                    *((_QWORD *)&v586 + 1) = 0x100000000;
                    *(_QWORD *)&v587 = v587 + 1;
                    if ((_QWORD)v354 == -1)
                    {
                      v448 = *((_QWORD *)&v354 + 1) + 1;
LABEL_875:
                      *((_QWORD *)&v587 + 1) = v448;
                      goto LABEL_876;
                    }
                    if (v354 != __PAIR128__(0x1ED09BEAD87C0, 0x378D8E63FFFFFFFFLL))
                      goto LABEL_876;
LABEL_814:
                    v587 = xmmword_1B8917D20;
                    LODWORD(v342) = v342 + 1;
                    goto LABEL_876;
                  }
                  if (!HIDWORD(v586))
                    goto LABEL_876;
                  *((_QWORD *)&v586 + 1) = 1;
                  *(_QWORD *)&v587 = v587 - 1;
                  if (!(_QWORD)v354)
                  {
                    v448 = *((_QWORD *)&v354 + 1) - 1;
                    goto LABEL_875;
                  }
                  if (!(*((_QWORD *)&v354 + 1) | ((_QWORD)v354 - 1)))
                  {
                    v587 = 0uLL;
                    *a1 = 0;
                    v294 = 1;
                    goto LABEL_375;
                  }
LABEL_876:
                  if ((_DWORD)v342 == -6176)
                  {
                    if ((*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFuLL) < 0x314DC6448D93
                      || (v496 = 0, (*((_QWORD *)&v587 + 1) & 0x1FFFFFFFFFFFFLL) == 0x314DC6448D93)
                      && (unint64_t)v587 < 0x38C15B0A00000000)
                    {
                      v496 = 1;
                    }
                    v497 = (*((_QWORD *)&v587 + 1) & 0x7FFFFFFFFFFFFFFFLL) == 0x314DC6448D93
                        && (_QWORD)v587 == 0x38C15B0A00000000;
                    v498 = v551;
                    if (!v497)
                      v498 = 1;
                    if (v498)
                      v499 = v496;
                    else
                      v499 = 1;
LABEL_889:
                    LODWORD(v342) = -6176;
                    goto LABEL_895;
                  }
                  if ((int)v342 > -6177)
                  {
                    v499 = 0;
LABEL_895:
                    v21 = v586;
                    v505 = DWORD1(v586);
                    v506 = DWORD2(v586);
                    v507 = HIDWORD(v586);
                    if (v586 != 0)
                    {
                      v508 = *a12;
                      *a12 |= 0x20u;
                      if (v499)
                        *a12 = v508 | 0x30;
                    }
                    if (v587 == __PAIR128__(0x1ED09BEAD87C0, 0x378D8E6400000000))
                    {
                      *(_QWORD *)&v587 = 0x38C15B0A00000000;
                      LODWORD(v342) = v342 + 1;
                      v509 = 0x314DC6448D93;
                    }
                    else
                    {
                      v509 = *((_QWORD *)&v587 + 1);
                    }
                    *((_QWORD *)&v587 + 1) = v509 | ((unint64_t)(v342 + 6176) << 49) | v558;
                    if (a11 || (int)v342 < 6112)
                    {
                      if (a11)
                        bid_rounding_correction(a11, v505, v21, v507, v506, v342, (uint64_t *)&v587, a12);
                    }
                    else
                    {
                      *(_QWORD *)&v587 = 0;
                      *((_QWORD *)&v587 + 1) = v558 | 0x7800000000000000;
                      *a12 |= 0x28u;
                    }
                    *a1 = v507;
                    *a2 = v506;
                    *a3 = v505;
                    goto LABEL_72;
                  }
                  v500 = -6176 - v342;
                  v501 = v586;
                  v576 = DWORD1(v586);
                  v502 = DWORD2(v586);
                  v503 = HIDWORD(v586);
                  v586 = 0uLL;
                  if (*((_QWORD *)&v587 + 1))
                  {
                    if (v587 >= __PAIR128__(5, 0x6BC75E2D63100000))
                    {
                      v510 = &qword_1B8A50F68;
                      for (i = 1; i != 19; ++i)
                      {
                        if (v587 < *(_OWORD *)(v510 - 1))
                          break;
                        v510 += 2;
                      }
                      j = (i + 20);
                    }
                    else
                    {
                      j = 20;
                    }
                  }
                  else
                  {
                    for (j = 1; j != 20; ++j)
                    {
                      if ((unint64_t)v587 < __bid_ten2k64[j])
                        break;
                    }
                  }
                  v512 = j - v500;
                  if ((_DWORD)j == v500)
                  {
                    v587 = xmmword_1B8917D30;
                    LODWORD(v586) = 1;
                  }
                  else if ((int)j > 18)
                  {
                    if (j <= 0x26)
                    {
                      v583 = v587;
                      __bid_round128_19_38(j, v500, v587, *((unint64_t *)&v587 + 1), (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                      if (v585)
                      {
                        if (v512 > 19)
                          v587 = *(_OWORD *)&__bid_ten2k128[2 * (v512 - 20)];
                        else
                          *(_QWORD *)&v587 = __bid_ten2k64[v512];
                      }
                    }
                  }
                  else
                  {
                    __bid_round64_2_18(j, v500, v587, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                    if (v585)
                      v513 = &__bid_ten2k64[v512];
                    else
                      v513 = &v584;
                    v587 = *v513;
                  }
                  v514 = HIDWORD(v586);
                  if (v501 | v503 && HIDWORD(v586))
                  {
                    v515 = v587;
                    *(_QWORD *)&v587 = v587 - 1;
                    if (!v515)
                      --*((_QWORD *)&v587 + 1);
                    v514 = 0;
                    HIDWORD(v586) = 0;
                    v516 = 1;
                    DWORD1(v586) = 1;
                    v517 = DWORD2(v586);
                    v518 = v586;
                  }
                  else
                  {
                    v517 = DWORD2(v586);
                    if (v576 | v502 && DWORD2(v586))
                    {
                      v179 = __CFADD__((_QWORD)v587, 1);
                      *(_QWORD *)&v587 = v587 + 1;
                      if (v179)
                        ++*((_QWORD *)&v587 + 1);
                      v517 = 0;
                      DWORD2(v586) = 0;
                      v518 = 1;
                      LODWORD(v586) = 1;
                      v516 = DWORD1(v586);
                    }
                    else
                    {
                      v518 = v586;
                      v516 = DWORD1(v586);
                      if (v586 == 0)
                      {
                        if (v501 | v503)
                        {
                          v518 = 1;
                          LODWORD(v586) = 1;
                        }
                        else
                        {
                          v518 = 0;
                        }
                        if (v576 | v502)
                        {
                          v517 = 0;
                          v514 = 0;
                          v516 = 1;
                          DWORD1(v586) = 1;
                        }
                        else
                        {
                          v516 = 0;
                          v517 = 0;
                          v514 = 0;
                        }
                      }
                      else
                      {
                        v519 = (v501 | v503) == 0;
                        if (!DWORD2(v586))
                          v519 = 1;
                        if (v519)
                        {
                          v520 = (v576 | v502) == 0;
                          if (!HIDWORD(v586))
                            v520 = 1;
                          if (v520)
                            goto LABEL_954;
                          v516 = 0;
                          v517 = 0;
                          v514 = 0;
                          v518 = 1;
                          *(_QWORD *)&v586 = 1;
                        }
                        else
                        {
                          v518 = 0;
                          v517 = 0;
                          v514 = 0;
                          v516 = 1;
                          *(_QWORD *)&v586 = 0x100000000;
                        }
                        *((_QWORD *)&v586 + 1) = 0;
                      }
                    }
                  }
LABEL_954:
                  LODWORD(v342) = -6176;
                  v499 = 1;
                  if (v514 || v517 || v516 || v518)
                    goto LABEL_895;
                  if (v503 || v502 || v501 | v576)
                    DWORD1(v586) = 1;
                  goto LABEL_889;
                }
              }
            }
            else
            {
              v551 = v202 == v30;
              if (v199 > 1 || v202 == v30)
                goto LABEL_397;
            }
            if (v233 >= (int)v62)
            {
              v199 = -v199;
              v244 = v566;
              v241 = v201;
              v243 = v553;
              v246 = v202;
              v245 = v66;
              v242 = v67;
            }
            else
            {
              v200 = v61;
              v241 = v62;
              v242 = v566;
              LODWORD(v62) = v201;
              v243 = v66;
              v244 = v67;
              v245 = v553;
              v246 = v30;
              v30 = v202;
            }
            *(_QWORD *)&v588 = v244;
            *((_QWORD *)&v588 + 1) = v243;
            *(_QWORD *)&v589 = v542;
            *((_QWORD *)&v589 + 1) = v540;
            bid_add_and_round(v62, v241, v200, v199, v30, v246, v242, v245, (int64x2_t *)&v588, a11, (int *)&v586 + 3, (_BOOL4 *)&v586 + 2, (int *)&v586 + 1, (int *)&v586, a12, (__int128 *)&v587);
LABEL_374:
            *a1 = HIDWORD(v586);
            v294 = DWORD2(v586);
LABEL_375:
            *a2 = v294;
            v21 = v586;
            *a3 = DWORD1(v586);
            goto LABEL_72;
          }
          v567 = v63;
          v199 = v62 - (v192 + v63 - v61);
          if ((int)v62 >= 35 && (int)v62 <= v199)
          {
            v561 = v192 + v63 - v61 - v62;
            v549 = v61;
            v554 = v30;
            v209 = v62 - 34;
            if (v62 > 0x26)
            {
              *(_QWORD *)&v588 = v67;
              *((_QWORD *)&v588 + 1) = v66;
              if (v62 > 0x39)
              {
                *(_QWORD *)&v589 = v65;
                *((_QWORD *)&v589 + 1) = v64;
                __bid_round256_58_76(v62, (v62 - 34), (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                v247 = v580;
              }
              else
              {
                v589 = v65;
                __bid_round192_39_57(v62, v62 - 34, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                v247 = v590[0];
              }
              v587 = v247;
            }
            else
            {
              *(_QWORD *)&v583 = v67;
              *((_QWORD *)&v583 + 1) = v66;
              __bid_round128_19_38(v62, v62 - 34, v67, v66, (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
            }
            v301 = v209 + v549;
            v21 = v586;
            if (v585)
              v302 = v301 + 1;
            else
              v302 = v301;
            v303 = DWORD2(v586);
            v304 = DWORD1(v586);
            if (v586 == 0)
            {
              v305 = v554;
              if (v554 == v29)
              {
                v303 = 0;
                v306 = 0;
                v21 = 0;
                v304 = 1;
LABEL_642:
                v441 = a11;
LABEL_643:
                if (a11 || v302 < 6112)
                {
                  *((_QWORD *)&v587 + 1) |= ((unint64_t)(((_WORD)v302 + 6176) & 0x3FFF) << 49) | v305;
                  if (a11)
                    bid_rounding_correction(v441, v304, v21, v306, v303, v302, (uint64_t *)&v587, a12);
                }
                else
                {
                  *(_QWORD *)&v587 = 0;
                  *((_QWORD *)&v587 + 1) = v305 | 0x7800000000000000;
                  *a12 |= 0x28u;
                }
                if (v304 | v21)
                  v449 = 1;
                else
                  v449 = v306;
                if ((v449 & 1) != 0 || v303)
                  *a12 |= 0x20u;
                *a1 = v306;
                *a2 = v303;
                *a3 = v304;
                goto LABEL_72;
              }
              v303 = 0;
              v21 = 1;
              if (v587 == __PAIR128__(0x314DC6448D93, 0x38C15B0A00000000) && v561 >= 0xFFFFFFDD)
              {
                if (v567 > 19)
                {
                  v428 = (unint64_t *)&__bid_midpoint128[v567 - 20];
                  v429 = v428[1];
                  if (v26 < v429)
                  {
LABEL_563:
                    v303 = 0;
                    v306 = 0;
                    v304 = 0;
                    goto LABEL_641;
                  }
                  if (v26 != v429)
                    goto LABEL_638;
                  v307 = *v428;
                }
                else
                {
                  v307 = __bid_midpoint64[v567 - 1];
                }
                if (v571 < v307)
                  goto LABEL_563;
                if (v571 == v307)
                {
                  v303 = 0;
                  v21 = 0;
                  v304 = 0;
                  v306 = 1;
                  goto LABEL_641;
                }
LABEL_638:
                v303 = 0;
                v306 = 0;
                v21 = 0;
LABEL_639:
                v587 = xmmword_1B8917D10;
                --v302;
                goto LABEL_640;
              }
              v306 = 0;
              v304 = 0;
LABEL_641:
              v305 = v554;
              goto LABEL_642;
            }
            if (HIDWORD(v586))
            {
              if (v29 == v554)
                goto LABEL_390;
              v363 = v587;
              v364 = v587 - 1;
              *(_QWORD *)&v587 = v587 - 1;
              v306 = 0;
              if ((_QWORD)v363)
              {
                if (v364 != 0x38C15B09FFFFFFFFLL || *((_QWORD *)&v363 + 1) != 0x314DC6448D93)
                {
                  v305 = v554;
                  v441 = a11;
                  v304 = 1;
                  goto LABEL_643;
                }
                v306 = 0;
                goto LABEL_639;
              }
              *((_QWORD *)&v587 + 1) = *((_QWORD *)&v363 + 1) - 1;
            }
            else
            {
              if (!DWORD2(v586))
              {
                v306 = 0;
                goto LABEL_641;
              }
              if (v29 == v554)
              {
                v179 = __CFADD__((_QWORD)v587, 1);
                *(_QWORD *)&v587 = v587 + 1;
                v303 = 0;
                if (v179)
                {
                  v306 = 0;
                  ++*((_QWORD *)&v587 + 1);
                  goto LABEL_391;
                }
LABEL_390:
                v306 = 0;
LABEL_391:
                v21 = 1;
                goto LABEL_641;
              }
              v303 = 0;
              v306 = 0;
            }
LABEL_640:
            v304 = 1;
            goto LABEL_641;
          }
          if (v197 <= 0xFFFFFFDE && (int)v62 < 35)
            goto LABEL_277;
          v211 = v62 - (v192 - v61);
          if (v197 >= 0xFFFFFFDF && (int)v62 <= v199 && v211 > 34)
            goto LABEL_277;
          v212 = v211 < 35 && (int)v62 <= v199;
          v213 = (int)v62 > v199 && (int)v62 < 35;
          v214 = !v213 || v211 <= 34;
          v215 = !v214;
          if (v212
            || v215
            || ((int)v62 < 35 ? (v216 = v211 < (int)v62) : (v216 = 0),
                !v216 ? (v217 = 0) : (v217 = 1),
                v211 < 35 ? (v218 = (int)v62 <= v211) : (v218 = 0),
                v218 ? (v219 = (int)v62 <= v199) : (v219 = 1),
                !v219 || (v217 & 1) != 0))
          {
LABEL_277:
            v198 = v571;
            v200 = (v27 >> 49) - 6176;
            *((_QWORD *)&v583 + 1) = v26;
            v201 = v567;
            v553 = v26;
            v566 = v571;
            v27 = v35;
            v202 = a10 & 0x8000000000000000;
            goto LABEL_278;
          }
          v539 = v64;
          v541 = v65;
          v559 = v66;
          v562 = v67;
          v550 = v61;
          v555 = v30;
          v583 = 0uLL;
          v220 = v197 > 0xFFFFFFDE;
          if ((v197 > 0xFFFFFFDE || (int)v62 <= v199 || (int)v62 >= v211)
            && (v197 < 0xFFFFFFDF || (int)v62 < 35 || (int)v62 >= v211))
          {
            if ((int)v62 < v211)
              v220 = 1;
            if (v220)
            {
              v460 = (int)v62 >= 35 && v211 <= 34;
              v461 = !v460;
              v462 = (int)v62 < v211 || v211 < 35;
              v463 = !v462 && v197 >= 0xFFFFFFDF;
              if (!v463 && v461)
                goto LABEL_69;
            }
            *(_QWORD *)&v588 = v67;
            *((_QWORD *)&v588 + 1) = v66;
            *(_QWORD *)&v589 = v65;
            *((_QWORD *)&v589 + 1) = v64;
            bid_add_and_round(v567, v62, v61, v199, v29, v30, v571, v26, (int64x2_t *)&v588, a11, (int *)&v586 + 3, (_BOOL4 *)&v586 + 2, (int *)&v586 + 1, (int *)&v586, a12, (__int128 *)&v587);
            goto LABEL_374;
          }
          v221 = v61 - v192;
          if (v567 > 18)
          {
            if (v567 > 0x26)
              goto LABEL_684;
            __bid_round128_19_38(v567, v221, v571, v26, (unint64_t *)&v582, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
            v26 = *((_QWORD *)&v582 + 1);
            v222 = v582;
          }
          else
          {
            __bid_round64_2_18(v567, v221, v571, &v584, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
            v222 = v584;
          }
          v571 = v222;
LABEL_684:
          if (v585)
          {
            *(_QWORD *)&v583 = v571;
            *((_QWORD *)&v583 + 1) = v26;
            v458 = ((5 * (unint64_t)v571) >> 31) + 10 * HIDWORD(v571);
            v571 = (10 * v571) & 0xFFFFFFFELL | (v458 << 32);
            v26 = 10 * v26 + HIDWORD(v458);
          }
          v581 = 0uLL;
          *(_QWORD *)&v580 = v571;
          *((_QWORD *)&v580 + 1) = v26;
          if (v30 == v29)
          {
            *(_QWORD *)&v588 = v562;
            *((_QWORD *)&v588 + 1) = v559;
            *(_QWORD *)&v589 = v541;
            *((_QWORD *)&v589 + 1) = v539;
            v578 = v580;
            v579 = v581;
            bid_add256(&v588, &v578, &v580);
            goto LABEL_765;
          }
          *(_QWORD *)&v588 = v562;
          *((_QWORD *)&v588 + 1) = v559;
          *(_QWORD *)&v589 = v541;
          *((_QWORD *)&v589 + 1) = v539;
          v578 = v580;
          v579 = v581;
          bid_sub256(&v588, &v578, &v580);
          if (DWORD1(v586))
          {
            *(_QWORD *)&v586 = 1;
            goto LABEL_765;
          }
          if ((_DWORD)v586)
          {
            *(_QWORD *)&v586 = 0x100000000;
            goto LABEL_765;
          }
          if ((v562 & 1) == 0)
          {
            if (HIDWORD(v586))
            {
              *((_QWORD *)&v586 + 1) = 1;
            }
            else if (DWORD2(v586))
            {
              *((_QWORD *)&v586 + 1) = 0x100000000;
            }
LABEL_765:
            v588 = v580;
            v589 = v581;
            v475 = bid_bid_nr_digits256((unint64_t *)&v588);
            if ((int)v475 <= 33)
            {
              v476 = *((_QWORD *)&v587 + 1);
              goto LABEL_769;
            }
            v477 = v475 - 34;
            if ((_DWORD)v475 == 34)
            {
              v587 = v580;
              v476 = *((_QWORD *)&v580 + 1);
              goto LABEL_769;
            }
            v484 = v586;
            v483 = DWORD1(v586);
            v485 = HIDWORD(v586);
            v575 = DWORD2(v586);
            v586 = 0uLL;
            if (v475 > 0x26)
            {
              v588 = v580;
              if (v475 > 0x39)
              {
                v589 = v581;
                __bid_round256_58_76(v475, (v475 - 34), (unint64_t *)&v588, (unint64_t *)&v580, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                v476 = *((_QWORD *)&v580 + 1);
                v486 = v580;
              }
              else
              {
                v589 = (unint64_t)v581;
                __bid_round192_39_57(v475, v475 - 34, (unint64_t *)&v588, (unint64_t *)v590, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                v476 = *((_QWORD *)&v590[0] + 1);
                v486 = *(_QWORD *)&v590[0];
              }
              *(_QWORD *)&v582 = v486;
              *((_QWORD *)&v582 + 1) = v476;
            }
            else
            {
              v583 = v580;
              __bid_round128_19_38(v475, v475 - 34, v580, *((unint64_t *)&v580 + 1), (unint64_t *)&v582, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
              v476 = *((_QWORD *)&v582 + 1);
              v486 = v582;
            }
            v550 += v477 + v585;
            *(_QWORD *)&v587 = v486;
            if (v484 | v485 && HIDWORD(v586))
            {
              *(_QWORD *)&v587 = v486 - 1;
              if (v486)
              {
                HIDWORD(v586) = 0;
                DWORD1(v586) = 1;
                if (v476 == 0x314DC6448D93 && v486 == 0x38C15B0A00000000)
                {
                  v476 = 0x1ED09BEAD87C0;
                  v587 = xmmword_1B8917D10;
                  --v550;
                }
                goto LABEL_769;
              }
              --v476;
              HIDWORD(v586) = 0;
LABEL_873:
              DWORD1(v586) = 1;
              goto LABEL_769;
            }
            if (v483 | v575 && DWORD2(v586))
            {
              *(_QWORD *)&v587 = v486 + 1;
              if (v486 == -1)
                *((_QWORD *)&v587 + 1) = ++v476;
              DWORD2(v586) = 0;
              LODWORD(v586) = 1;
              goto LABEL_769;
            }
            if (v586 == 0)
            {
              LODWORD(v586) = (v484 | v485) != 0;
              if (!(v483 | v575))
                goto LABEL_769;
              goto LABEL_873;
            }
            v522 = (v484 | v485) == 0;
            if (!DWORD2(v586))
              v522 = 1;
            if (v522)
            {
              v528 = (v483 | v575) == 0;
              if (!HIDWORD(v586))
                v528 = 1;
              if (v528)
              {
LABEL_769:
                v478 = v550;
                if (a11)
                {
                  *(_QWORD *)&v583 = v587;
                  *((_QWORD *)&v583 + 1) = v555 | v476 | 0x3040000000000000;
                  bid_rounding_correction(a11, SDWORD1(v586), v586, SHIDWORD(v586), SDWORD2(v586), 0, (uint64_t *)&v583, a12);
                  v478 = v550 - 6176 + ((*((_QWORD *)&v583 + 1) >> 49) & 0x3FFF);
                }
                v479 = v478 < -6176;
                *((_QWORD *)&v587 + 1) = v476 | ((unint64_t)(v550 + 6176) << 49) | v555;
                if (!a11 && v550 >= 6112)
                {
                  *(_QWORD *)&v587 = 0;
                  *((_QWORD *)&v587 + 1) = v555 | 0x7800000000000000;
                  *a12 |= 0x28u;
                  goto LABEL_374;
                }
                if (v550 > -6177)
                {
                  v555 |= v476 | ((unint64_t)(v550 + 6176) << 49);
LABEL_988:
                  if (a11)
                  {
                    bid_rounding_correction(a11, SDWORD1(v586), v586, SHIDWORD(v586), SDWORD2(v586), v550, (uint64_t *)&v587, a12);
                    v555 = *((_QWORD *)&v587 + 1);
                  }
                  if ((v555 & 0x7FFFFFFFFFFFFFFFLL) == 0x314DC6448D93 && (_QWORD)v587 == 0x38C15B0A00000000)
                  {
                    switch(a11)
                    {
                      case 0u:
                      case 4u:
                        if (HIDWORD(v586) | v586)
                          goto LABEL_1005;
                        if (v555 < 0)
                          v523 = 1;
                        else
                          v523 = 2;
                        if (v523 == a11)
                          goto LABEL_1002;
                        break;
                      case 1u:
                        if (v555 < 0)
                          goto LABEL_1002;
                        break;
                      case 2u:
                        if ((v555 & 0x8000000000000000) == 0)
                        {
LABEL_1002:
                          if (HIDWORD(v586) || *(_QWORD *)((char *)&v586 + 4) || (_DWORD)v586)
LABEL_1005:
                            v479 = 1;
                        }
                        break;
                      default:
                        break;
                    }
                  }
                  v525 = DWORD2(v586);
                  v524 = HIDWORD(v586);
                  v21 = v586;
                  v526 = DWORD1(v586);
                  if (v586 != 0)
                  {
                    v527 = *a12;
                    *a12 |= 0x20u;
                    if (v479)
                      *a12 = v527 | 0x30;
                  }
                  *a1 = v524;
                  *a2 = v525;
                  *a3 = v526;
                  goto LABEL_72;
                }
                v481 = v586;
                v480 = DWORD1(v586);
                v482 = HIDWORD(v586);
                v574 = DWORD2(v586);
                v586 = 0uLL;
                if (v550 <= 0xFFFFE7BD)
                {
                  DWORD1(v586) = 1;
                  *(_QWORD *)&v587 = 0;
                  *((_QWORD *)&v587 + 1) = v555;
                  goto LABEL_987;
                }
                v490 = v476 & 0x1FFFFFFFFFFFFLL;
                if (v550 != -6210)
                {
                  *(_QWORD *)&v583 = v587;
                  *((_QWORD *)&v583 + 1) = v476 & 0x1FFFFFFFFFFFFLL;
                  __bid_round128_19_38(34, -6176 - v550, v587, v490, (unint64_t *)&v587, &v585, (_DWORD *)&v586 + 3, (_DWORD *)&v586 + 2, (_DWORD *)&v586 + 1, &v586);
                  v493 = *((_QWORD *)&v587 + 1);
                  if (v585)
                  {
                    v494 = ((5 * (unint64_t)v587) >> 31) + 10 * DWORD1(v587);
                    *(_QWORD *)&v587 = (10 * v587) & 0xFFFFFFFELL | (v494 << 32);
                    v493 = 0xA00000000 * (HIDWORD(*((_QWORD *)&v587 + 1)) & 0x1FFFFLL)
                         + 10 * DWORD2(v587)
                         + HIDWORD(v494);
                  }
                  v555 |= v493 & 0x1FFFFFFFFFFFFLL;
                  *((_QWORD *)&v587 + 1) = v555;
                  if (v481 | v482 && HIDWORD(v586))
                  {
                    v495 = v587;
                    *(_QWORD *)&v587 = v587 - 1;
                    if (!v495)
                      *((_QWORD *)&v587 + 1) = --v555;
                    HIDWORD(v586) = 0;
                  }
                  else
                  {
                    if (v480 | v574 && DWORD2(v586))
                    {
                      v179 = __CFADD__((_QWORD)v587, 1);
                      *(_QWORD *)&v587 = v587 + 1;
                      if (v179)
                        *((_QWORD *)&v587 + 1) = ++v555;
                      DWORD2(v586) = 0;
                      LODWORD(v586) = 1;
                      goto LABEL_987;
                    }
                    if (v586 != 0)
                    {
                      v532 = (v481 | v482) == 0;
                      if (!DWORD2(v586))
                        v532 = 1;
                      if (v532)
                      {
                        v533 = (v480 | v574) == 0;
                        if (!HIDWORD(v586))
                          v533 = 1;
                        if (v533)
                          goto LABEL_987;
                        *(_QWORD *)&v586 = 1;
                      }
                      else
                      {
                        *(_QWORD *)&v586 = 0x100000000;
                      }
                      *((_QWORD *)&v586 + 1) = 0;
LABEL_987:
                      v550 = -6176;
                      goto LABEL_988;
                    }
                    LODWORD(v586) = (v481 | v482) != 0;
                    if (!(v480 | v574))
                      goto LABEL_987;
                  }
                  DWORD1(v586) = 1;
                  goto LABEL_987;
                }
                if (v490 < 0xF684DF56C3E0)
                  goto LABEL_817;
                if (v490 == 0xF684DF56C3E0)
                {
                  if ((unint64_t)v587 < 0x1BC6C73200000000)
                  {
LABEL_817:
                    v491 = 0;
                    DWORD1(v586) = 1;
LABEL_986:
                    *(_QWORD *)&v587 = v491;
                    *((_QWORD *)&v587 + 1) = v555;
                    goto LABEL_987;
                  }
                  if ((_QWORD)v587 == 0x1BC6C73200000000)
                  {
                    v491 = 0;
                    DWORD2(v586) = 1;
                    goto LABEL_986;
                  }
                }
                v491 = 1;
                LODWORD(v586) = 1;
                goto LABEL_986;
              }
              *(_QWORD *)&v586 = 1;
            }
            else
            {
              *(_QWORD *)&v586 = 0x100000000;
            }
            *((_QWORD *)&v586 + 1) = 0;
            goto LABEL_769;
          }
          if (HIDWORD(v586))
          {
            v179 = __CFADD__((_QWORD)v580, 1);
            *(_QWORD *)&v580 = v580 + 1;
            if (!v179)
              goto LABEL_765;
            v179 = __CFADD__((*((_QWORD *)&v580 + 1))++, 1);
            if (!v179)
              goto LABEL_765;
            v179 = __CFADD__((_QWORD)v581, 1);
            *(_QWORD *)&v581 = v581 + 1;
            if (!v179)
              goto LABEL_765;
            v521 = *((_QWORD *)&v581 + 1) + 1;
          }
          else
          {
            if (!DWORD2(v586))
              goto LABEL_765;
            v529 = v580;
            *(_QWORD *)&v580 = v580 - 1;
            if (v529)
              goto LABEL_765;
            if ((*((_QWORD *)&v580 + 1))--)
              goto LABEL_765;
            v531 = v581;
            *(_QWORD *)&v581 = v581 - 1;
            if (v531)
              goto LABEL_765;
            v521 = *((_QWORD *)&v581 + 1) - 1;
          }
          *((_QWORD *)&v581 + 1) = v521;
          goto LABEL_765;
        }
        v548 = v33 + (v25 >> 49) - 6176;
        v63 = v51;
        if ((_DWORD)v62 == 39)
        {
          v86 = HIDWORD(v24);
          v87 = v24 * (unint64_t)HIDWORD(a5);
          v88 = HIDWORD(v87) + HIDWORD(v24) * (unint64_t)HIDWORD(a5);
          v89 = HIDWORD(v24) * (unint64_t)a5
              + v87
              + ((v24 * (unint64_t)a5) >> 32);
          v90 = a7 * (unint64_t)HIDWORD(a5);
          v91 = HIDWORD(a7) * (unint64_t)a5
              + v90
              + ((a7 * (unint64_t)a5) >> 32);
          v92 = (a7 * a5) | ((unint64_t)v91 << 32);
          v93 = __PAIR128__(v88, (v24 * a5) | ((unint64_t)v89 << 32))
              + __PAIR128__(HIDWORD(v89), HIDWORD(v90) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v91));
          v94 = HIDWORD(v22);
          v95 = v22;
          v96 = v24 * (unint64_t)HIDWORD(v22);
          v97 = v24 * (unint64_t)v22;
          v98 = v86 * (unint64_t)v22;
          v99 = HIDWORD(v96) + v86 * (unint64_t)HIDWORD(v22);
          v100 = v98 + v96 + HIDWORD(v97);
          v101 = HIDWORD(v100);
          v102 = v97 | ((unint64_t)v100 << 32);
          v103 = a7 * (unint64_t)HIDWORD(v22);
          v104 = a7 * (unint64_t)v22;
          v105 = HIDWORD(v103) + HIDWORD(a7) * (unint64_t)v94;
          v106 = HIDWORD(a7) * (unint64_t)v95 + v103 + HIDWORD(v104);
          v107 = v104 | ((unint64_t)v106 << 32);
          v108 = __PAIR128__(v99, v102) + __PAIR128__(v101, v105 + HIDWORD(v106));
          v66 = v93 + v107;
          v179 = __CFADD__(__CFADD__((_QWORD)v93, v107), (_QWORD)v108);
          v109 = __CFADD__((_QWORD)v93, v107) + (_QWORD)v108;
          v110 = v179;
          v65 = *((_QWORD *)&v93 + 1) + v109;
          if (__CFADD__(*((_QWORD *)&v93 + 1), v109))
            v111 = 1;
          else
            v111 = v110;
          v64 = *((_QWORD *)&v108 + 1) + v111;
          if (v65)
            goto LABEL_167;
          if (v66 < 0x4B3B4CA85A86C47ALL)
          {
            v62 = 38;
            v65 = 0;
            v61 = v548;
            v67 = (a7 * a5) | ((unint64_t)v91 << 32);
            goto LABEL_217;
          }
          if (v66 != 0x4B3B4CA85A86C47ALL || v92 >= 0x98A224000000000)
          {
LABEL_167:
            v62 = 39;
          }
          else
          {
            v65 = 0;
            v62 = 38;
            v66 = 0x4B3B4CA85A86C47ALL;
          }
LABEL_168:
          v61 = v548;
          v67 = v92;
          goto LABEL_217;
        }
        v565 = (v42 + v36);
        if (v62 <= 0x39)
        {
          if (v22)
          {
            if (v24)
            {
              v112 = HIDWORD(v24);
              v113 = v24 * (unint64_t)HIDWORD(a5);
              v114 = HIDWORD(v113) + HIDWORD(v24) * (unint64_t)HIDWORD(a5);
              v115 = HIDWORD(v24) * (unint64_t)a5
                   + v113
                   + ((v24 * (unint64_t)a5) >> 32);
              v116 = a7 * (unint64_t)HIDWORD(a5);
              v117 = HIDWORD(a7) * (unint64_t)a5
                   + v116
                   + ((a7 * (unint64_t)a5) >> 32);
              v118 = (a7 * a5) | ((unint64_t)v117 << 32);
              v119 = __PAIR128__(v114, (v24 * a5) | ((unint64_t)v115 << 32))
                   + __PAIR128__(HIDWORD(v115), HIDWORD(v116) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v117));
              v120 = HIDWORD(v22);
              v121 = v22;
              v122 = v24 * (unint64_t)HIDWORD(v22);
              v123 = v24 * (unint64_t)v22;
              v124 = v112 * (unint64_t)v22;
              v125 = HIDWORD(v122) + v112 * (unint64_t)HIDWORD(v22);
              v126 = v124 + v122 + HIDWORD(v123);
              v127 = HIDWORD(v126);
              v128 = v123 | ((unint64_t)v126 << 32);
              v129 = a7 * (unint64_t)HIDWORD(v22);
              v130 = a7 * (unint64_t)v22;
              v131 = HIDWORD(v129) + HIDWORD(a7) * (unint64_t)v120;
              v132 = HIDWORD(a7) * (unint64_t)v121 + v129 + HIDWORD(v130);
              v133 = v130 | ((unint64_t)v132 << 32);
              v134 = __PAIR128__(v125, v128) + __PAIR128__(v127, v131 + HIDWORD(v132));
              v66 = v119 + v133;
              v179 = __CFADD__(__CFADD__((_QWORD)v119, v133), (_QWORD)v134);
              v135 = __CFADD__((_QWORD)v119, v133) + (_QWORD)v134;
              v136 = v179;
              v137 = *((_QWORD *)&v119 + 1) + v135;
              if (__CFADD__(*((_QWORD *)&v119 + 1), v135))
                v138 = 1;
              else
                v138 = v136;
              v64 = *((_QWORD *)&v134 + 1) + v138;
LABEL_207:
              v190 = (char *)&__bid_ten2k256 + 32 * (v565 - 40);
              v191 = *((_QWORD *)v190 + 2);
              if (v137 < v191 || v137 == v191 && __PAIR128__(v66, v118) < *(_OWORD *)v190)
              {
                v62 = (v565 - 1);
                v61 = v548;
                v67 = v118;
              }
              else
              {
                v61 = v548;
                v67 = v118;
                v62 = v565;
              }
              v65 = v137;
              goto LABEL_217;
            }
            v64 = 0;
            v181 = HIDWORD(v22);
            v182 = HIDWORD(a7) * (unint64_t)v22;
            v183 = a7 * (unint64_t)v22;
            v184 = a7 * (unint64_t)v181;
            v172 = HIDWORD(v182) + HIDWORD(a7) * (unint64_t)v181;
            v185 = HIDWORD(a7) * (unint64_t)a5;
            v186 = v184 + v182 + HIDWORD(v183);
            v187 = v183 | ((unint64_t)v186 << 32);
            v176 = HIDWORD(v186);
            v188 = a7 * (unint64_t)HIDWORD(a5)
                 + v185
                 + ((a7 * (unint64_t)a5) >> 32);
            v189 = HIDWORD(v185) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v188);
            v118 = (a7 * a5) | ((unint64_t)v188 << 32);
            v179 = __CFADD__(v187, v189);
            v66 = v187 + v189;
          }
          else
          {
            v64 = 0;
            v168 = HIDWORD(v24);
            v169 = v24 * (unint64_t)HIDWORD(a5);
            v170 = v24 * (unint64_t)a5;
            v171 = v168 * (unint64_t)a5;
            v172 = HIDWORD(v169) + v168 * (unint64_t)HIDWORD(a5);
            v173 = a7 * (unint64_t)HIDWORD(a5);
            v174 = v171 + v169 + HIDWORD(v170);
            v175 = v170 | ((unint64_t)v174 << 32);
            v176 = HIDWORD(v174);
            v177 = HIDWORD(a7) * (unint64_t)a5
                 + v173
                 + ((a7 * (unint64_t)a5) >> 32);
            v178 = HIDWORD(v173) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v177);
            v118 = (a7 * a5) | ((unint64_t)v177 << 32);
            v179 = __CFADD__(v175, v178);
            v66 = v175 + v178;
          }
          v137 = v176 + v179 + v172;
          goto LABEL_207;
        }
        v139 = HIDWORD(v24);
        v140 = v24 * (unint64_t)HIDWORD(a5);
        v141 = HIDWORD(v140) + HIDWORD(v24) * (unint64_t)HIDWORD(a5);
        v142 = HIDWORD(v24) * (unint64_t)a5
             + v140
             + ((v24 * (unint64_t)a5) >> 32);
        v143 = a7 * (unint64_t)HIDWORD(a5);
        v144 = HIDWORD(a7) * (unint64_t)a5
             + v143
             + ((a7 * (unint64_t)a5) >> 32);
        v92 = (a7 * a5) | ((unint64_t)v144 << 32);
        v145 = __PAIR128__(v141, (v24 * a5) | ((unint64_t)v142 << 32))
             + __PAIR128__(HIDWORD(v142), HIDWORD(v143) + HIDWORD(a7) * (unint64_t)HIDWORD(a5) + HIDWORD(v144));
        v146 = HIDWORD(v22);
        v147 = v22;
        v148 = v24 * (unint64_t)HIDWORD(v22);
        v149 = v24 * (unint64_t)v22;
        v150 = v139 * (unint64_t)v22;
        v151 = HIDWORD(v148) + v139 * (unint64_t)HIDWORD(v22);
        v152 = v150 + v148 + HIDWORD(v149);
        v153 = HIDWORD(v152);
        v154 = v149 | ((unint64_t)v152 << 32);
        v155 = a7 * (unint64_t)HIDWORD(v22);
        v156 = a7 * (unint64_t)v22;
        v157 = HIDWORD(v155) + HIDWORD(a7) * (unint64_t)v146;
        v158 = HIDWORD(a7) * (unint64_t)v147 + v155 + HIDWORD(v156);
        v159 = v156 | ((unint64_t)v158 << 32);
        v160 = __PAIR128__(v151, v154) + __PAIR128__(v153, v157 + HIDWORD(v158));
        v66 = v145 + v159;
        v179 = __CFADD__(__CFADD__((_QWORD)v145, v159), (_QWORD)v160);
        v161 = __CFADD__((_QWORD)v145, v159) + (_QWORD)v160;
        v162 = v179;
        v163 = *((_QWORD *)&v145 + 1) + v161;
        if (__CFADD__(*((_QWORD *)&v145 + 1), v161))
          v164 = 1;
        else
          v164 = v162;
        v165 = *((_QWORD *)&v160 + 1) + v164;
        if ((_DWORD)v565 == 58)
        {
          v64 = *((_QWORD *)&v160 + 1) + v164;
          if (!v165)
          {
            if (v163 < 0x28C87CB5C89A2571)
            {
              v64 = 0;
              v62 = 57;
              goto LABEL_215;
            }
            if (v163 == 0x28C87CB5C89A2571)
            {
              if (v66 < 0xEBFDCB54864ADA83)
              {
                v64 = 0;
                v62 = 57;
LABEL_788:
                v65 = 0x28C87CB5C89A2571;
                goto LABEL_168;
              }
              if (v66 == 0xEBFDCB54864ADA83 && v92 >> 57 < 0x25)
              {
                v64 = 0;
                v62 = 57;
                v66 = 0xEBFDCB54864ADA83;
                goto LABEL_788;
              }
            }
          }
          v62 = 58;
        }
        else
        {
          v166 = (char *)&__bid_ten2k256 + 32 * (v565 - 40);
          v167 = *((_QWORD *)v166 + 3);
          v64 = v165;
          if (v165 >= v167)
          {
            if (v165 != v167
              || (v180 = *((_QWORD *)v166 + 2), v163 >= v180)
              && (v163 != v180 || __PAIR128__(v66, v92) >= *(_OWORD *)v166))
            {
              v61 = v548;
              v67 = v92;
              v62 = v565;
LABEL_216:
              v65 = v163;
              goto LABEL_217;
            }
          }
          v62 = (v565 - 1);
        }
LABEL_215:
        v61 = v548;
        v67 = v92;
        goto LABEL_216;
      }
    }
    else if (v26 | v28)
    {
      goto LABEL_90;
    }
    if (v35 >= v27)
      v35 = v27;
    *((_QWORD *)&v587 + 1) = v35;
    if (v30 == v29)
    {
      v31 = v35 | v29;
    }
    else
    {
      if (a11 != 1)
        goto LABEL_75;
      v31 = v35 | 0x8000000000000000;
    }
LABEL_74:
    *((_QWORD *)&v587 + 1) = v31;
LABEL_75:
    *(_QWORD *)&v587 = 0;
    goto LABEL_69;
  }
  if ((a6 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
    || (a6 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a5 > 0x38C15B09FFFFFFFFLL)
  {
    a5 = 0;
    a6 &= 0xFFFFC00000000000;
  }
  if ((~a6 & 0x7E00000000000000) == 0)
    *a12 |= 1u;
  v21 = 0;
  *(_QWORD *)&v587 = a5;
  *((_QWORD *)&v587 + 1) = a6 & 0xFC003FFFFFFFFFFFLL;
LABEL_70:
  *a1 = 0;
  *a2 = 0;
LABEL_71:
  *a3 = 0;
LABEL_72:
  *a4 = v21;
  return v587;
}

uint64_t bid_rounding_correction(uint64_t result, int a2, int a3, int a4, int a5, int a6, uint64_t *a7, _DWORD *a8)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  unsigned __int128 v20;
  uint64_t v21;

  v8 = *a7;
  v9 = a7[1];
  if (a4 | a3 | a2 | a5)
    *a8 |= 0x20u;
  v10 = v9 & 0x8000000000000000;
  v11 = (unint64_t)(a6 + 6176) << 49;
  v12 = v9 & 0x1FFFFFFFFFFFFLL;
  if ((v9 & 0x8000000000000000) == 0)
  {
    if ((_DWORD)result != 2 || !a2)
    {
      v13 = (_DWORD)result == 2;
      goto LABEL_10;
    }
LABEL_16:
    if (__CFADD__(v8++, 1))
      ++v12;
    v16 = 0x314DC6448D93;
    v17 = (unint64_t)(a6 + 6177) << 49;
    if (v12 == 0x1ED09BEAD87C0)
      v18 = a6 + 1;
    else
      v18 = a6;
    if (v12 == 0x1ED09BEAD87C0)
    {
      v19 = 0x38C15B0A00000000;
    }
    else
    {
      v17 = (unint64_t)(a6 + 6176) << 49;
      v16 = v12;
      v19 = v8;
    }
    if (v8 == 0x378D8E6400000000)
    {
      a6 = v18;
      v11 = v17;
      v12 = v16;
      v8 = v19;
    }
    goto LABEL_26;
  }
  if ((_DWORD)result == 1 && a2)
    goto LABEL_16;
  v13 = (_DWORD)result == 1;
LABEL_10:
  v14 = v13 || (_DWORD)result == 4;
  if (v14 && a5)
    goto LABEL_16;
  if (a4 | a3 && ((result & 0xFFFFFFFE) == 2 && v10 || (result & 0xFFFFFFFD) == 1 && !v10))
  {
    v20 = __PAIR128__(v12, v8) - 1;
    v12 = *((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1) == 0x314DC6448D93 && (v8 = 0x38C15B09FFFFFFFFLL, (_QWORD)v20 == 0x38C15B09FFFFFFFFLL))
    {
      if (v11)
      {
        v8 = 0x378D8E63FFFFFFFFLL;
        v12 = 0x1ED09BEAD87C0;
        v21 = (a6 + 6175);
        --a6;
        v11 = v21 << 49;
      }
      else
      {
        *a8 |= 0x10u;
        v12 = 0x314DC6448D93;
      }
    }
    else
    {
      v8 = v20;
    }
  }
LABEL_26:
  if (a6 < 6112)
    goto LABEL_45;
  *a8 |= 0x28u;
  v11 = 0;
  if (!v10)
  {
    v12 = 0x7800000000000000;
    if ((_DWORD)result != 2)
    {
      v8 = 0;
      if ((_DWORD)result != 4)
      {
        v11 = 0;
        v12 = 0x5FFFED09BEAD87C0;
LABEL_43:
        v8 = 0x378D8E63FFFFFFFFLL;
        goto LABEL_45;
      }
      goto LABEL_45;
    }
LABEL_44:
    v8 = 0;
    goto LABEL_45;
  }
  v12 = 0xF800000000000000;
  if ((_DWORD)result == 1)
    goto LABEL_44;
  v8 = 0;
  if ((_DWORD)result != 4)
  {
    v11 = 0;
    v12 = 0xDFFFED09BEAD87C0;
    goto LABEL_43;
  }
LABEL_45:
  *a7 = v8;
  a7[1] = v11 | v12 | v10;
  return result;
}

double bid_add_and_round(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, int64x2_t *a9, unsigned int a10, int *a11, _BOOL4 *a12, int *a13, int *a14, int *a15, __int128 *a16)
{
  uint64_t v16;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unsigned __int128 v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  unint64_t v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unsigned int v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unsigned __int128 v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int64x2_t v89;
  unint64_t v90;
  unint64_t v91;
  int64x2_t v92;
  int64x2_t v93;
  uint64_t v94;
  int v95;
  _BOOL4 v96;
  unint64_t v97;
  int64x2_t *v98;
  uint64_t v99;
  int64x2_t v100;
  int v101;
  double result;
  int v103;
  unint64_t v104;
  unint64_t v105;
  _BOOL4 v106;
  int v107;
  int v108;
  int v109;
  int v110;
  unint64_t v111;
  _BOOL8 v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t *v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  int v120;
  _BOOL4 v121;
  uint64_t v122;
  int v123;
  BOOL v124;
  int v125;
  char v126;
  _BOOL4 v127;
  int64x2_t v128;
  int64x2_t v129;
  __int128 v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  int64x2_t v134;
  int64x2_t v135;
  int64x2_t v136;
  int64x2_t v137;
  unint64_t v138;
  int64x2_t v139;
  int64x2_t v140;
  _OWORD v141[2];
  uint64_t v142;

  v16 = a6;
  v142 = *MEMORY[0x1E0C80C00];
  v138 = 0;
  v137 = 0uLL;
  v136 = 0uLL;
  memset(v141, 0, sizeof(v141));
  v134 = 0u;
  v135 = 0u;
  v132 = 0;
  v133 = 0;
  v131 = 0;
  v130 = *a16;
  v19 = a2 - (a4 + a1);
  if (a2 == a4 + a1)
  {
    v20 = 0;
    v21 = 0;
    v135 = 0uLL;
    v134.i64[0] = a7;
    v134.i64[1] = a8;
  }
  else
  {
    v22 = HIDWORD(a7);
    if (v19 > 19)
    {
      if (v19 > 0x26)
      {
        if (v19 > 0x39)
        {
          v74 = &__bid_ten2k128[2 * (v19 - 58)];
          v75 = HIDWORD(*v74);
          v76 = *v74 * (unint64_t)HIDWORD(a7);
          v77 = *v74 * (unint64_t)a7;
          v78 = v75 * (unint64_t)a7 + v76 + HIDWORD(v77);
          v71 = *v74 * a7;
          v72 = v74[1] * a7 + v75 * (unint64_t)HIDWORD(a7) + HIDWORD(v76) + HIDWORD(v78);
          v136.i64[0] = v71 | ((unint64_t)v78 << 32);
          v136.i64[1] = v72;
          v73 = v75 * a7 + v76 + HIDWORD(v77);
        }
        else
        {
          v64 = __bid_ten2k64[v19 - 38];
          v65 = HIDWORD(v64);
          v66 = v64;
          v67 = v64 * a8;
          v68 = HIDWORD(v64) * (unint64_t)a7;
          v69 = v64 * (unint64_t)a7;
          v70 = v66 * (unint64_t)HIDWORD(a7) + v68 + HIDWORD(v69);
          v71 = v69;
          v72 = v67 + v65 * (unint64_t)HIDWORD(a7) + HIDWORD(v68) + HIDWORD(v70);
          v136.i64[0] = v69 | ((unint64_t)v70 << 32);
          v136.i64[1] = v72;
          v73 = v70;
        }
        v79 = ((1518781562 * (unint64_t)v71) >> 32)
            + 1262177448 * v71
            + 1518781562 * v73;
        a7 = 0x98A224000000000 * v71;
        v80 = __PAIR128__(((1518781562 * (unint64_t)v73) >> 32) + 1262177448 * v73, (1518781562 * v71) | (v79 << 32))+ __PAIR128__(HIDWORD(v79), ((160047680 * (unint64_t)v71) >> 32) + 160047680 * v73);
        v81 = HIDWORD(v72);
        v82 = ((1518781562 * (unint64_t)HIDWORD(v72)) >> 32) + 1262177448 * HIDWORD(v72);
        v83 = (1518781562 * HIDWORD(v72))
            + 1262177448 * v72
            + ((1518781562 * (unint64_t)v72) >> 32);
        v84 = HIDWORD(v83);
        v85 = (1518781562 * v72) | (v83 << 32);
        v86 = (160047680 * (unint64_t)v72) >> 32;
        v87 = 0x98A224000000000 * v72;
        v59 = (__PAIR128__(v82, v85) + __PAIR128__(v84, v86 + 160047680 * v81)) >> 64;
        a8 = v87
           + ((1518781562 * v71) | (v79 << 32))
           + ((160047680 * (unint64_t)v71) >> 32)
           + 160047680 * v73;
        v134.i64[0] = 0x98A224000000000 * v71;
        v134.i64[1] = a8;
        v63 = __CFADD__(__CFADD__(v87, ((1518781562 * v71) | (v79 << 32))+ ((160047680 * (unint64_t)v71) >> 32)+ 160047680 * v73), v85 + v86 + 160047680 * v81);
        v88 = __CFADD__(v87, ((1518781562 * v71) | (v79 << 32))+ ((160047680 * (unint64_t)v71) >> 32)+ 160047680 * v73)+ v85+ v86+ 160047680 * v81;
        LODWORD(v62) = v63;
        v63 = __CFADD__(*((_QWORD *)&v80 + 1), v88);
        v20 = *((_QWORD *)&v80 + 1) + v88;
      }
      else
      {
        v33 = &__bid_ten2k128[2 * (v19 - 20)];
        v34 = *v33;
        v35 = v33[1];
        v36 = HIDWORD(v34);
        v37 = HIDWORD(v34) * (unint64_t)a8;
        v38 = HIDWORD(v37) + HIDWORD(v34) * (unint64_t)HIDWORD(a8);
        v39 = v34 * (unint64_t)HIDWORD(a8)
            + v37
            + ((v34 * (unint64_t)a8) >> 32);
        v40 = HIDWORD(v39);
        v41 = (v34 * a8) | ((unint64_t)v39 << 32);
        LODWORD(v39) = a7;
        v42 = HIDWORD(v34) * (unint64_t)a7;
        v43 = v35 * (unint64_t)a7;
        v44 = v34 * (unint64_t)a7;
        v45 = v34 * (unint64_t)v22 + v42 + HIDWORD(v44);
        a7 = v44 | ((unint64_t)v45 << 32);
        v46 = __PAIR128__(v38, v41)
            + __PAIR128__(v40, HIDWORD(v42) + v36 * (unint64_t)v22 + HIDWORD(v45));
        v47 = HIDWORD(v35);
        LODWORD(v41) = v35;
        v48 = HIDWORD(v35) * (unint64_t)a8;
        v49 = v35 * (unint64_t)a8;
        v50 = HIDWORD(v48) + v47 * (unint64_t)HIDWORD(a8);
        v51 = v41 * (unint64_t)HIDWORD(a8) + v48 + HIDWORD(v49);
        v52 = HIDWORD(v51);
        v53 = v49 | ((unint64_t)v51 << 32);
        v54 = v47 * (unint64_t)v39;
        v55 = v41 * (unint64_t)v22;
        v56 = HIDWORD(v54) + v47 * (unint64_t)v22;
        v57 = v55 + v54 + HIDWORD(v43);
        v58 = v43 | ((unint64_t)v57 << 32);
        v60 = v53 + v56 + HIDWORD(v57);
        v59 = (__PAIR128__(v50, v53) + __PAIR128__(v52, v56 + HIDWORD(v57))) >> 64;
        a8 = v58 + v46;
        v134.i64[0] = a7;
        v134.i64[1] = v58 + v46;
        v61 = __CFADD__(v58, (_QWORD)v46) + v60;
        LODWORD(v62) = __CFADD__(__CFADD__(v58, (_QWORD)v46), v60);
        v63 = __CFADD__(*((_QWORD *)&v46 + 1), v61);
        v20 = *((_QWORD *)&v46 + 1) + v61;
      }
      if (v63)
        v62 = 1;
      else
        v62 = v62;
      v21 = v59 + v62;
      v135.i64[0] = v20;
      v135.i64[1] = v21;
    }
    else
    {
      v21 = 0;
      v137 = (int64x2_t)(unint64_t)__bid_ten2k64[v19];
      v23 = v137.u32[1] * (unint64_t)a8;
      v24 = HIDWORD(v23) + v137.u32[1] * (unint64_t)HIDWORD(a8);
      v25 = v137.u32[0] * (unint64_t)HIDWORD(a8)
          + v23
          + ((v137.u32[0] * (unint64_t)a8) >> 32);
      v26 = HIDWORD(v25);
      v27 = (v137.i32[0] * a8) | ((unint64_t)v25 << 32);
      v28 = v137.u32[1] * (unint64_t)a7;
      v29 = v137.u32[0] * (unint64_t)a7;
      v30 = v137.u32[0] * (unint64_t)v22 + v28 + HIDWORD(v29);
      v31 = HIDWORD(v28) + v137.u32[1] * (unint64_t)v22 + HIDWORD(v30);
      a7 = v29 | ((unint64_t)v30 << 32);
      v134.i64[0] = a7;
      v134.i64[1] = v27 + v31;
      v32 = v27 + v31;
      v20 = (__PAIR128__(v24, v27) + __PAIR128__(v26, v31)) >> 64;
      a8 = v32;
      v135 = (int64x2_t)v20;
    }
  }
  if (a6 == a5)
  {
    v89 = a9[1];
    v139 = *a9;
    v140 = v89;
    v128 = v134;
    v129 = v135;
    bid_add256(&v139, &v128, &v134);
  }
  else
  {
    v90 = a9[1].u64[1];
    if (v21 > v90
      || v21 == v90 && ((v91 = a9[1].u64[0], v20 > v91) || v20 == v91 && __PAIR128__(a8, a7) >= *(_OWORD *)a9))
    {
      v139 = v134;
      v140 = v135;
      v93 = a9[1];
      v128 = *a9;
      v129 = v93;
      bid_sub256(&v139, &v128, &v134);
      v16 = a5;
    }
    else
    {
      v92 = a9[1];
      v139 = *a9;
      v140 = v92;
      v128 = v134;
      v129 = v135;
      bid_sub256(&v139, &v128, &v134);
    }
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v134), (int32x4_t)vceqzq_s64(v135))))) & 1) == 0)
    {
      if (a3 <= -6176)
        v101 = -6176;
      else
        v101 = a3;
      *(_QWORD *)&v130 = 0;
      *((_QWORD *)&v130 + 1) = ((unint64_t)(a10 == 1) << 63) | ((unint64_t)(v101 + 6176) << 49);
      result = 0.0;
      *a16 = v130;
      return result;
    }
  }
  v139 = v134;
  v140 = v135;
  v94 = bid_bid_nr_digits256((unint64_t *)&v139);
  v95 = v94 - 34;
  if ((int)v94 > 34)
  {
    if (v94 > 0x26)
    {
      v139 = v134;
      if (v94 > 0x39)
      {
        v140 = v135;
        __bid_round256_58_76(v94, (v94 - 34), (unint64_t *)&v139, (unint64_t *)&v134, &v131, (_DWORD *)&v133 + 1, &v133, (_DWORD *)&v132 + 1, &v132);
        v100 = v134;
      }
      else
      {
        v140 = (int64x2_t)v135.u64[0];
        __bid_round192_39_57(v94, v94 - 34, (unint64_t *)&v139, (unint64_t *)v141, &v131, (_DWORD *)&v133 + 1, &v133, (_DWORD *)&v132 + 1, &v132);
        v100 = (int64x2_t)v141[0];
      }
      v136 = v100;
      v99 = v100.i64[1];
    }
    else
    {
      v137 = v134;
      __bid_round128_19_38(v94, v94 - 34, v134.u64[0], v134.u64[1], (unint64_t *)&v136, &v131, (_DWORD *)&v133 + 1, &v133, (_DWORD *)&v132 + 1, &v132);
      v99 = v136.i64[1];
    }
    v103 = v95 + a3;
    v96 = v95 + a3 < -6176;
    a3 = v131 + v103;
    if (a10)
    {
      v137.i64[0] = v136.i64[0];
      v137.i64[1] = v16 | v99 | 0x3040000000000000;
      bid_rounding_correction(a10, SHIDWORD(v132), v132, SHIDWORD(v133), v133, 0, v137.i64, a15);
    }
    v97 = v99 | ((unint64_t)(a3 + 6176) << 49);
    v94 = 34;
    v98 = &v136;
  }
  else
  {
    v96 = (int)v94 + a3 < -6142;
    v97 = v134.i64[1] | ((unint64_t)(a3 + 6176) << 49);
    v98 = &v134;
  }
  v104 = v97 | v16;
  v105 = v98->i64[0];
  *(_QWORD *)&v130 = v98->i64[0];
  *((_QWORD *)&v130 + 1) = v104;
  if (!a10 && a3 + (int)v94 >= 6146)
  {
    *(_QWORD *)&v130 = 0;
    *((_QWORD *)&v130 + 1) = v16 | 0x7800000000000000;
    result = 0.0;
    *a16 = v130;
    *a15 |= 0x28u;
    return result;
  }
  v127 = v96;
  v106 = v133;
  v107 = HIDWORD(v133);
  v109 = v132;
  v108 = HIDWORD(v132);
  if (a3 <= -6177)
  {
    v132 = 0;
    v133 = 0;
    v110 = -6176 - a3;
    if (-6176 - a3 > (int)v94)
    {
      v109 = 0;
      v106 = 0;
      v107 = 0;
      *(_QWORD *)&v130 = 0;
      *((_QWORD *)&v130 + 1) = v16;
LABEL_52:
      a3 = -6176;
      v108 = 1;
      goto LABEL_89;
    }
    if (v110 != (_DWORD)v94)
    {
      if ((int)v94 > 18)
      {
        v137.i64[0] = v105;
        v137.i64[1] = v104 & 0x1FFFFFFFFFFFFLL;
        __bid_round128_19_38(v94, v110, v105, v104 & 0x1FFFFFFFFFFFFLL, (unint64_t *)&v130, &v131, (_DWORD *)&v133 + 1, &v133, (_DWORD *)&v132 + 1, &v132);
        v113 = *((_QWORD *)&v130 + 1);
      }
      else
      {
        __bid_round64_2_18(v94, v110, v105, &v138, &v131, (_DWORD *)&v133 + 1, &v133, (_DWORD *)&v132 + 1, &v132);
        v113 = 0;
        *(_QWORD *)&v130 = v138;
      }
      if (v131)
      {
        v118 = ((5 * (unint64_t)v130) >> 31) + 10 * DWORD1(v130);
        *(_QWORD *)&v130 = (10 * v130) | (v118 << 32);
        v113 = 0xA00000000 * (HIDWORD(v113) & 0x1FFFF) + 10 * v113 + HIDWORD(v118);
      }
      v119 = v113 & 0x1FFFFFFFFFFFFLL | v16;
      *((_QWORD *)&v130 + 1) = v119;
      v120 = v109 | v107;
      v121 = (v109 | v107) != 0;
      v107 = HIDWORD(v133);
      if (v120 && HIDWORD(v133))
      {
        v122 = v130;
        *(_QWORD *)&v130 = v130 - 1;
        if (!v122)
          *((_QWORD *)&v130 + 1) = v119 - 1;
        v107 = 0;
        v106 = v133;
        a3 = -6176;
        v108 = 1;
        v109 = v132;
        goto LABEL_89;
      }
      v123 = v108 | v106;
      v124 = (v108 | v106) != 0;
      v106 = v133;
      if (v123 && (_DWORD)v133)
      {
        v63 = __CFADD__((_QWORD)v130, 1);
        *(_QWORD *)&v130 = v130 + 1;
        if (v63)
          *((_QWORD *)&v130 + 1) = v119 + 1;
        v106 = 0;
        a3 = -6176;
        v109 = 1;
        v108 = HIDWORD(v132);
        goto LABEL_89;
      }
      v109 = v132;
      v108 = HIDWORD(v132);
      if (!v133 && !v132)
      {
        v106 = 0;
        v107 = 0;
        a3 = -6176;
        v109 = v121;
        v108 = v123 != 0;
        goto LABEL_89;
      }
      if (!(_DWORD)v133)
        LOBYTE(v121) = 0;
      if (v121)
      {
        v109 = 0;
        v106 = 0;
        v107 = 0;
        goto LABEL_52;
      }
      v126 = !v124;
      if (!HIDWORD(v133))
        v126 = 1;
      if ((v126 & 1) == 0)
      {
        v108 = 0;
        v106 = 0;
        v107 = 0;
        a3 = -6176;
        v109 = 1;
        goto LABEL_89;
      }
LABEL_88:
      a3 = -6176;
      goto LABEL_89;
    }
    if ((int)v94 > 19)
    {
      v114 = v104 & 0x1FFFFFFFFFFFFLL;
      v115 = (unint64_t *)&__bid_midpoint128[(v94 - 20)];
      v116 = v115[1];
      if (v114 >= v116)
      {
        if (v114 == v116)
        {
          v117 = *v115;
          if (v105 < v117)
            goto LABEL_62;
          if (v105 == v117)
          {
            v109 = 0;
            v108 = 0;
            v112 = 0;
            v106 = 1;
            goto LABEL_87;
          }
        }
        v108 = 0;
        v106 = 0;
        v109 = 1;
        v112 = 1;
        goto LABEL_87;
      }
    }
    else
    {
      v111 = __bid_midpoint64[(v94 - 1)];
      if (v105 >= v111)
      {
        v108 = 0;
        v106 = v105 == v111;
        v112 = v105 != v111;
        v109 = v112;
LABEL_87:
        v107 = 0;
        *(_QWORD *)&v130 = v112;
        *((_QWORD *)&v130 + 1) = v16;
        goto LABEL_88;
      }
    }
LABEL_62:
    v109 = 0;
    v106 = 0;
    v112 = 0;
    v108 = 1;
    goto LABEL_87;
  }
LABEL_89:
  if (a10)
    bid_rounding_correction(a10, v108, v109, v107, v106, a3, (uint64_t *)&v130, a15);
  if (v107 || v106 || v108 || v109)
  {
    v125 = *a15;
    *a15 |= 0x20u;
    if (v127)
      *a15 = v125 | 0x30;
  }
  *a11 = v107;
  *a12 = v106;
  *a13 = v108;
  *a14 = v109;
  result = *(double *)&v130;
  *a16 = v130;
  return result;
}

_QWORD *bid_add256(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = result[1];
  v4 = *a2 + *result;
  if (__CFADD__(*a2, *result) && (v5 = __CFADD__(v3, 1), ++v3, result[1] = v3, v5))
  {
    v6 = result[2];
    v7 = v6 + 1;
    result[2] = v6 + 1;
    if (v6 == -1)
      ++result[3];
    v8 = a2[1];
  }
  else
  {
    v9 = a2[1];
    v7 = result[2];
    v5 = __CFADD__(v9, v3);
    v8 = v9 + v3;
    if (v5)
    {
      v5 = __CFADD__(v7++, 1);
      result[2] = v7;
      if (v5)
      {
        v10 = result[3] + 1;
        result[3] = v10;
        v11 = a2[2];
        goto LABEL_16;
      }
    }
  }
  v12 = a2[2];
  v10 = result[3];
  v5 = __CFADD__(v12, v7);
  v11 = v12 + v7;
  if (v5)
    result[3] = ++v10;
LABEL_16:
  v13 = a2[3] + v10;
  *a3 = v4;
  a3[1] = v8;
  a3[2] = v11;
  a3[3] = v13;
  return result;
}

_QWORD *bid_sub256(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = result[1];
  v4 = *result - *a2;
  if (*result >= *a2)
  {
    v5 = result[1];
  }
  else
  {
    v5 = v3 - 1;
    result[1] = v3 - 1;
    if (!v3)
    {
      v6 = result[2];
      v7 = v6 - 1;
      result[2] = v6 - 1;
      if (!v6)
        --result[3];
      v8 = a2[1];
      v5 = -1;
      goto LABEL_10;
    }
  }
  v8 = a2[1];
  v7 = result[2];
  if (v8 > v5)
  {
    result[2] = v7 - 1;
    if (!v7)
    {
      v10 = result[3] - 1;
      result[3] = v10;
      v9 = a2[2];
      v7 = -1;
      goto LABEL_13;
    }
    --v7;
  }
LABEL_10:
  v9 = a2[2];
  v10 = result[3];
  if (v9 > v7)
    result[3] = --v10;
LABEL_13:
  v11 = v5 - v8;
  v12 = v10 - a2[3];
  *a3 = v4;
  a3[1] = v11;
  a3[2] = v7 - v9;
  a3[3] = v12;
  return result;
}

uint64_t bid_bid_nr_digits256(unint64_t *a1)
{
  unint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t i;

  v1 = a1[3];
  if (v1)
  {
LABEL_2:
    v2 = &qword_1B8A52598;
    v3 = 1;
    v4 = &qword_1B8A52598;
    do
    {
      v5 = *v4;
      v4 += 4;
      v6 = v1 == v5;
      if (v1 < v5)
        break;
      if (v6)
      {
        v7 = a1[2];
        v8 = *(v2 - 1);
        if (v7 < v8 || v7 == v8 && *(_OWORD *)a1 < *(_OWORD *)(v2 - 3))
          break;
      }
      ++v3;
      v2 = v4;
    }
    while (v3 != 30);
    return (v3 + 39);
  }
  v10 = a1[2];
  if (v10 == 2)
  {
    if (*(_OWORD *)a1 >= __PAIR128__(0xF050FE938943ACC4, 0x5F65568000000000))
      goto LABEL_2;
    return 39;
  }
  if (v10 == 1)
    return 39;
  if (v10)
    goto LABEL_2;
  v11 = a1[1];
  if (v11)
  {
    if (v11 < 5 || v11 == 5 && *a1 < 0x6BC75E2D63100000)
    {
      return 20;
    }
    else
    {
      v14 = &qword_1B8A50F68;
      for (i = 1; i != 19; ++i)
      {
        if (*(_OWORD *)a1 < *(_OWORD *)(v14 - 1))
          break;
        v14 += 2;
      }
      return (i + 20);
    }
  }
  else
  {
    v12 = *a1;
    v13 = 1;
    result = 20;
    while (v12 >= __bid_ten2k64[v13])
    {
      if (++v13 == 20)
        return result;
    }
    return v13;
  }
}

unint64_t __bid128_fmod(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, _DWORD *a5)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned __int128 v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unsigned __int128 v54;
  unint64_t v55;
  unint64_t v56;
  _BOOL4 v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v62;
  unint64_t v63[2];
  unint64_t v64[2];
  __int128 v65;

  v5 = a3;
  v6 = a4 & 0x7800000000000000;
  if (((a4 >> 61) & 3) == 3)
  {
    if (v6 == 0x7800000000000000)
    {
      v7 = 0xFE00000000000000;
      if ((a4 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
      {
        v12 = (a4 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a3 >= 0x38C15B0A00000000;
        if (!v12)
        {
          v7 = 0xFE003FFFFFFFFFFFLL;
          v8 = a3;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
      }
      LODWORD(v10) = 0;
      v11 = 0;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        v5 = 0;
      else
        v5 = v8;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        v7 = 0xF800000000000000;
      v9 = v7 & a4;
    }
    else
    {
      v5 = 0;
      v9 = 0;
      v11 = 0;
      v10 = (a4 >> 47) & 0x3FFF;
    }
  }
  else
  {
    v9 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
      || (a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a3 >= 0x378D8E6400000000)
    {
      v5 = 0;
      v9 = 0;
    }
    v10 = (a4 >> 49) & 0x3FFF;
    v11 = v9 | v5;
  }
  v65 = 0uLL;
  v14 = a2 & 0x7800000000000000;
  if (((a2 >> 61) & 3) == 3)
  {
    if (v14 == 0x7800000000000000)
    {
      *(_QWORD *)&v65 = a1;
      if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
        || (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a1 >= 0x38C15B0A00000000)
      {
        *(_QWORD *)&v65 = 0;
      }
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        *(_QWORD *)&v65 = 0;
    }
    goto LABEL_70;
  }
  v15 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    goto LABEL_36;
  if ((a2 & 0x1FFFFFFFFFFFFLL) != 0x1ED09BEAD87C0)
  {
    v62 = a1;
    goto LABEL_37;
  }
  v62 = a1;
  if (a1 >= 0x378D8E6400000000)
  {
LABEL_36:
    v62 = 0;
    v15 = 0;
  }
LABEL_37:
  *(_QWORD *)&v65 = v62;
  *((_QWORD *)&v65 + 1) = v15;
  v16 = (a2 >> 49) & 0x3FFF;
  if (!(v15 | v62))
  {
LABEL_70:
    if ((~a4 & 0x7E00000000000000) == 0)
      *a5 |= 1u;
    if ((~a2 & 0x7C00000000000000) == 0)
    {
      if ((~a2 & 0x7E00000000000000) == 0)
        *a5 |= 1u;
      return v65;
    }
    v27 = a4 & 0x7C00000000000000;
    if (v14 == 0x7800000000000000 && v27 != 0x7C00000000000000 || !(v9 | v5))
      goto LABEL_86;
    if (v27 == 0x7800000000000000 || v11)
      return 0;
LABEL_81:
    if (v27 == 0x7C00000000000000)
    {
      if ((~a4 & 0x7E00000000000000) == 0)
        *a5 |= 1u;
      return v5;
    }
    v5 = a1;
    if (v6 == 0x7800000000000000)
      return v5;
LABEL_86:
    v5 = 0;
    *a5 |= 1u;
    return v5;
  }
  if (!v11)
  {
    v27 = a4 & 0x7C00000000000000;
    goto LABEL_81;
  }
  v64[0] = 0;
  v64[1] = 0;
  v17 = v16 - v10;
  if ((int)v16 <= (int)v10)
  {
    if (v17 < -34)
      return a1;
    v28 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * (v10 - v16));
    v29 = *v28;
    v30 = v28[1];
    v31 = HIDWORD(v30);
    v32 = v30 * (unint64_t)HIDWORD(v5);
    v33 = HIDWORD(v32) + HIDWORD(v30) * (unint64_t)HIDWORD(v5);
    v34 = HIDWORD(v30) * (unint64_t)v5
        + v32
        + ((v30 * (unint64_t)v5) >> 32);
    v35 = HIDWORD(v34);
    v36 = (v30 * v5) | ((unint64_t)v34 << 32);
    v37 = HIDWORD(*v28);
    v38 = *v28 * (unint64_t)HIDWORD(v5);
    v39 = *v28 * (unint64_t)v5;
    v40 = HIDWORD(v38) + HIDWORD(*v28) * HIDWORD(v5);
    v41 = HIDWORD(*v28) * v5 + v38 + HIDWORD(v39);
    v42 = __PAIR128__(v33, v36) + __PAIR128__(v35, v40 + HIDWORD(v41));
    v43 = v30 * (unint64_t)HIDWORD(v9);
    v44 = v30 * (unint64_t)v9;
    v45 = v31 * (unint64_t)v9;
    v46 = HIDWORD(v43) + v31 * (unint64_t)HIDWORD(v9);
    v47 = v45 + v43 + HIDWORD(v44);
    v48 = HIDWORD(v47);
    v49 = v44 | ((unint64_t)v47 << 32);
    v50 = v29 * (unint64_t)HIDWORD(v9);
    v51 = v29 * (unint64_t)v9;
    v52 = HIDWORD(v29) * (unint64_t)v9 + v50 + HIDWORD(v51);
    v53 = v51 | ((unint64_t)v52 << 32);
    v54 = __PAIR128__(v46, v49)
        + __PAIR128__(v48, HIDWORD(v50) + v37 * (unint64_t)HIDWORD(v9) + HIDWORD(v52));
    v55 = v36 + v40 + HIDWORD(v41) + v53;
    v12 = __CFADD__(__CFADD__((_QWORD)v42, v53), v49 + HIDWORD(v50) + v37 * (unint64_t)HIDWORD(v9) + HIDWORD(v52));
    v56 = __CFADD__((_QWORD)v42, v53)
        + v49
        + HIDWORD(v50)
        + v37 * (unint64_t)HIDWORD(v9)
        + HIDWORD(v52);
    v57 = v12;
    v58 = *((_QWORD *)&v42 + 1) + v56;
    v59 = __CFADD__(*((_QWORD *)&v42 + 1), v56) || (unint64_t)v57;
    if (v58 || *((_QWORD *)&v54 + 1) != v59 << 63 >> 63 || v55 > v15)
    {
      return a1;
    }
    else
    {
      v60 = v39 | ((unint64_t)v41 << 32);
      if (v55 != v15 || (v5 = a1, v60 <= (unint64_t)v65))
      {
        v63[0] = 0;
        v63[1] = 0;
        bid___div_128_by_128_1078(v64, v63, v65, *((unint64_t *)&v65 + 1), v60, v55);
        return v63[0];
      }
    }
  }
  else
  {
    if (v9)
      v18 = 38;
    else
      v18 = 34;
    do
    {
      if (v17 < 1)
        break;
      v19 = ((unint64_t)COERCE_UNSIGNED_INT((float)(unint64_t)v65 + (float)((float)v15 * 1.8447e19)) >> 23)
          - 127;
      v20 = v18 - __bid_estimate_decimal_digits[v19];
      v21 = (_QWORD *)((char *)&__bid_power10_index_binexp_128 + 16 * v19);
      v22 = v21[1];
      if ((uint64_t)(v15 - v22) > 0 || v15 == v22 && (unint64_t)v65 >= *v21)
        --v20;
      if (v17 >= v20)
      {
        v17 -= v20;
      }
      else
      {
        v20 = v17;
        v17 = 0;
      }
      v23 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * v20);
      v24 = *v23;
      v25 = *v23 * (unint64_t)DWORD1(v65);
      v26 = HIDWORD(v24) * (unint64_t)v65
          + v25
          + ((v24 * (unint64_t)v65) >> 32);
      bid___div_128_by_128_1078(v64, (unint64_t *)&v65, (*v23 * v65) | ((unint64_t)v26 << 32), v24 * v15 + v23[1] * v65 + HIDWORD(v24) * (unint64_t)DWORD1(v65) + HIDWORD(v25) + HIDWORD(v26), v5, v9);
      v15 = *((_QWORD *)&v65 + 1);
    }
    while (v65 != 0);
    return v65;
  }
  return v5;
}

unint64_t *bid___div_128_by_128_1078(unint64_t *result, unint64_t *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  unint64_t v39;
  unsigned __int128 v40;
  BOOL v41;
  unint64_t v42;

  if (!(a4 | a6))
  {
    *result = a3 / a5;
    result[1] = 0;
    *a2 = 0;
    a2[1] = 0;
    v21 = a3 - *result * a5;
    goto LABEL_39;
  }
  v6 = (double)a5 + (double)a6 * 1.84467441e19;
  v7 = ((double)a3 + (double)a4 * 1.84467441e19) / v6;
  if (!a6 && !(a5 >> 28) && a5 << 36 <= a4)
  {
    v8 = v7 * 8.67361738e-19;
    v9 = (unint64_t)v8 - 4;
    v10 = HIDWORD(v9) * a5;
    v11 = ((unint64_t)v8 - 4) * a5;
    v12 = HIDWORD(v10);
    v13 = HIDWORD(v11) + v10;
    *((_QWORD *)&v14 + 1) = (v12 + HIDWORD(v13));
    *(_QWORD *)&v14 = v11 & 0xFFFFFFF0 | (v13 << 32);
    v15 = a4 - (v14 >> 4);
    v37 = a3 >= v11 << 60;
    a3 -= v11 << 60;
    v16 = !v37;
    a4 = v15 - v16;
    v17 = (double)a3 + (double)(unint64_t)(v15 - v16) * 1.84467441e19;
    v18 = v9 >> 4;
    v7 = v17 / v6;
    v19 = v9 << 60;
    v20 = a5 >> 13;
LABEL_12:
    if (a4 > v20 || a4 == v20 && a3 > a5 << 51)
    {
      v23 = v7 * 1.77635684e-15;
      v24 = (unint64_t)v23 - 1;
      v25 = HIDWORD(v24) * (unint64_t)a5;
      v26 = v24 * (unint64_t)a5;
      v27 = ((unint64_t)v23 - 1) * (unint64_t)HIDWORD(a5) + v25 + HIDWORD(v26);
      *((_QWORD *)&v28 + 1) = (v24 * a6 + HIDWORD(v24) * HIDWORD(a5) + HIDWORD(v25) + HIDWORD(v27));
      *(_QWORD *)&v28 = v26 & 0xFFFF8000 | (v27 << 32);
      v29 = a4 - (v28 >> 15);
      v37 = a3 >= v26 << 49;
      a3 -= v26 << 49;
      v30 = !v37;
      a4 = v29 - v30;
      v37 = __CFADD__(v19, v24 << 49);
      v19 += v24 << 49;
      v18 += v37 + (v24 >> 15);
      v7 = ((double)a3 + (double)(unint64_t)(v29 - v30) * 1.84467441e19) / v6;
    }
    goto LABEL_20;
  }
  v19 = 0;
  if (!(a6 >> 13))
  {
    *((_QWORD *)&v22 + 1) = a6;
    *(_QWORD *)&v22 = a5;
    v20 = v22 >> 13;
    v18 = 0;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_20:
  v31 = (unint64_t)v7;
  v32 = (unint64_t)v7 >> 32;
  v33 = v32 * (unint64_t)a5;
  v34 = (unint64_t)v7 * (unint64_t)HIDWORD(a5)
      + v33
      + (((unint64_t)v7 * (unint64_t)a5) >> 32);
  v35 = (__PAIR128__(a4, a3)
       - __PAIR128__((unint64_t)v7 * a6 + v32 * (unint64_t)HIDWORD(a5) + HIDWORD(v33) + HIDWORD(v34), ((unint64_t)v7 * a5) | ((unint64_t)v34 << 32))) >> 64;
  v21 = a3 - (((unint64_t)v7 * a5) | ((unint64_t)v34 << 32));
  if (v35 < 0)
  {
    v39 = v31 - 1;
    v35 = (__PAIR128__(v35, v21) + __PAIR128__(a6, a5)) >> 64;
    v21 += a5;
    v31 -= 2;
    v40 = __PAIR128__(v35, v21) + __PAIR128__(a6, a5);
    v41 = v35 >= 0;
    if (v35 < 0)
      v35 = (__PAIR128__(v35, v21) + __PAIR128__(a6, a5)) >> 64;
    else
      v31 = v39;
    if (!v41)
      v21 = v40;
  }
  else
  {
    v36 = v35 - a6;
    if (v35 > a6 || (v35 == a6 ? (v37 = v21 >= a5) : (v37 = 0), v37))
    {
      ++v31;
      v37 = v21 >= a5;
      v21 -= a5;
      v38 = !v37;
      v35 = v36 - v38;
    }
  }
  v37 = __CFADD__(v31, v19);
  v42 = v31 + v19;
  if (v37)
    ++v18;
  *result = v42;
  result[1] = v18;
  a2[1] = v35;
LABEL_39:
  *a2 = v21;
  return result;
}

uint64_t __bid128_hypot(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v29;
  char v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unsigned __int128 v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  _BOOL8 v62;
  unint64_t v63;
  unsigned __int128 v64;
  int v65;
  unint64_t v66;
  BOOL v67;
  char v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  BOOL v73;
  unint64_t v74;
  unsigned int v75;
  uint64_t v76;
  char v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  BOOL v83;
  _BOOL4 v84;
  uint64_t v85[2];
  uint64_t v86[2];
  __n128 v87;
  _OWORD v88[2];
  int8x8_t v89[3];
  int8x8_t v90[3];
  int8x8_t v91[3];
  int8x8_t v92[3];

  v10 = __bid128_quiet_greater(a3, a4 & 0x7FFFFFFFFFFFFFFFLL, a1, a2 & 0x7FFFFFFFFFFFFFFFLL, &my_fpsf);
  if (v10)
    v11 = a2;
  else
    v11 = a4;
  if (v10)
    v12 = a1;
  else
    v12 = a3;
  if (v10)
    v13 = a4;
  else
    v13 = a2;
  if (v10)
    v14 = a3;
  else
    v14 = a1;
  v15 = v11 & 0x7800000000000000;
  if (((v11 >> 61) & 3) != 3)
  {
    v18 = v11 & 0x1FFFFFFFFFFFFLL;
    if ((v11 & 0x1FFFFFFFFFFFFLL) <= 0x1ED09BEAD87C0)
    {
      if ((v11 & 0x1FFFFFFFFFFFFLL) != 0x1ED09BEAD87C0)
      {
        v39 = v12;
LABEL_22:
        v19 = (v11 >> 49) & 0x3FFF;
        v20 = v18 | v39;
        goto LABEL_39;
      }
      v39 = v12;
      if (v12 < 0x378D8E6400000000)
        goto LABEL_22;
    }
    v39 = 0;
    v18 = 0;
    goto LABEL_22;
  }
  if (v15 == 0x7800000000000000)
  {
    v16 = 0xFE00000000000000;
    if ((v11 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
    {
      v21 = (v11 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && v12 >= 0x38C15B0A00000000;
      if (!v21)
      {
        v16 = 0xFE003FFFFFFFFFFFLL;
        v17 = v12;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    LODWORD(v19) = 0;
    v20 = 0;
    if ((v11 & 0x7C00000000000000) == 0x7800000000000000)
      v39 = 0;
    else
      v39 = v17;
    if ((v11 & 0x7C00000000000000) == 0x7800000000000000)
      v16 = 0xF800000000000000;
    v18 = v11 & v16;
  }
  else
  {
    v39 = 0;
    v18 = 0;
    v20 = 0;
    v19 = (v11 >> 47) & 0x3FFF;
  }
LABEL_39:
  v23 = v13 & 0x7800000000000000;
  if (((v13 >> 61) & 3) == 3)
  {
    if (v23 == 0x7800000000000000)
    {
      if ((v13 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
      {
        if ((v13 & 0x3FFFFFFFFFFFLL) != 0x314DC6448D93 || v14 < 0x38C15B0A00000000)
          v24 = v14;
        else
          v24 = 0;
      }
      else
      {
        v24 = 0;
      }
      if ((v13 & 0x7C00000000000000) == 0x7800000000000000)
        v40 = 0;
      else
        v40 = v24;
    }
    else
    {
      v40 = 0;
    }
    goto LABEL_65;
  }
  v25 = v13 & 0x1FFFFFFFFFFFFLL;
  if ((v13 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    goto LABEL_47;
  if ((v13 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0)
  {
    v40 = v14;
    if (v14 < 0x378D8E6400000000)
      goto LABEL_48;
LABEL_47:
    v40 = 0;
    v25 = 0;
    goto LABEL_48;
  }
  v40 = v14;
LABEL_48:
  if (!(v25 | v40))
  {
LABEL_65:
    if ((~v13 & 0x7C00000000000000) == 0)
    {
      v29 = v13 & 0x7E00000000000000;
      if ((~v11 & 0x7E00000000000000) == 0 || v29 == 0x7E00000000000000)
        my_fpsf |= 1u;
      if ((v11 & 0x7C00000000000000) != 0x7800000000000000 || v29 == 0x7E00000000000000)
        return v40;
      else
        return 0;
    }
    if ((~v11 & 0x7E00000000000000) != 0 && v23 == 0x7800000000000000)
      return 0;
    if (v20)
      return v12;
    v31 = 1;
    goto LABEL_100;
  }
  if (!v20)
  {
    v31 = 0;
LABEL_100:
    if ((~v11 & 0x7C00000000000000) == 0)
    {
      if ((~v11 & 0x7E00000000000000) == 0)
        my_fpsf |= 1u;
      return v39;
    }
    if (v15 == 0x7800000000000000)
      return 0;
    if ((v31 & 1) != 0)
      return v40;
    return v14;
  }
  v26 = (v13 >> 49) & 0x3FFF;
  if ((int)v26 - (int)v19 >= 35)
    return v14;
  v87 = 0uLL;
  v32 = v18 | ((unint64_t)(v19 - v26 + 6176) << 49);
  v86[0] = __bid128_to_binary128(v40, v25 | 0x3040000000000000, a5, &my_fpsf);
  v86[1] = v33;
  v85[0] = __bid128_to_binary128(v39, v32, a5, &my_fpsf);
  v85[1] = v34;
  memset(v91, 0, sizeof(v91));
  memset(v90, 0, sizeof(v90));
  memset(v89, 0, sizeof(v89));
  memset(v88, 0, sizeof(v88));
  if ((__dpml_bid_unpack2__(v86, v85, (uint64_t)v91, (uint64_t)v90, qword_1B891F078, (uint64_t)&v87, (uint64_t *)v88) & 0x8000000000000000) == 0)
  {
    memset(v92, 0, sizeof(v92));
    __dpml_bid_multiply__(v91, v91, v92);
    __dpml_bid_multiply__(v90, v90, v89);
    __dpml_bid_addsub__((uint64_t)v89, v92, 0, (uint64_t)v92);
    __dpml_bid_ffs_and_shift__((uint64_t)v92, 0);
    __dpml_bid_ux_sqrt_evaluation__(v92, v89);
    __dpml_bid_pack__((unsigned int *)v89, &v87, 0, 14);
  }
  v35 = __binary128_to_bid128(v87.n128_u64[0], v87.n128_u64[1], a5, &my_fpsf);
  v37 = v36 & 0x1FFFFFFFFFFFFLL;
  if (v35 == 0x378D8E6400000000 && (v36 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0)
    v39 = 0x38C15B0A00000000;
  else
    v39 = v35;
  v38 = v26
      + ((v36 >> 49) & 0x3FFF)
      - 6176
      + (v35 == 0x378D8E6400000000 && (v36 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0);
  if (v35 == 0x378D8E6400000000 && (v36 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0)
    v37 = 0x314DC6448D93;
  if (v38 < 0x3000)
    return v39;
  if (v38 < 0)
  {
    if (v38 > 0xFFFFFFDD)
    {
      v41 = -v38;
      v42 = __bid_round_const_table_128[36 * a5 + -v38] + __PAIR128__(v37, v39);
      v43 = &__bid_reciprocals10_128[2 * -v38];
      v44 = *v43;
      v45 = v43[1];
      v46 = v45 * (unint64_t)DWORD1(v42);
      v47 = HIDWORD(v46);
      v48 = HIDWORD(v45) * (unint64_t)v42
          + v46
          + ((v45 * (unint64_t)v42) >> 32);
      v49 = (v45 * v42) | ((unint64_t)v48 << 32);
      v50 = DWORD2(v42) * (unint64_t)HIDWORD(v44);
      v51 = HIDWORD(v42) * (unint64_t)v44
          + v50
          + ((DWORD2(v42) * (unint64_t)v44) >> 32);
      v52 = (DWORD2(v42) * v44) | ((unint64_t)v51 << 32);
      v53 = v44 * (unint64_t)DWORD1(v42);
      v54 = HIDWORD(v44) * (unint64_t)v42
          + v53
          + ((v44 * (unint64_t)v42) >> 32);
      v55 = HIDWORD(v53) + HIDWORD(v44) * (unint64_t)DWORD1(v42) + HIDWORD(v54);
      v56 = (v44 * v42) | ((unint64_t)v54 << 32);
      v57 = HIDWORD(v42) * (unint64_t)v45;
      v58 = HIDWORD(v57) + HIDWORD(v42) * (unint64_t)HIDWORD(v45);
      v59 = DWORD2(v42) * (unint64_t)HIDWORD(v45)
          + v57
          + ((DWORD2(v42) * (unint64_t)v45) >> 32);
      v60 = HIDWORD(v59);
      v61 = (DWORD2(v42) * v45) | ((unint64_t)v59 << 32);
      v62 = __CFADD__(v49, v52);
      v63 = v49 + v52 + v55;
      v64 = __PAIR128__(v58, v61)
          + __PAIR128__(v60, (__PAIR128__(v47+ HIDWORD(v45) * (unint64_t)DWORD1(v42)+ HIDWORD(v42) * (unint64_t)HIDWORD(v44)+ HIDWORD(v50)+ HIDWORD(v48)+ HIDWORD(v51), v49 + v52)+ __PAIR128__(v62, v55)) >> 64);
      v65 = __bid_recip_scale[v41];
      if (v65 >= 64)
        v39 = *((_QWORD *)&v64 + 1) >> v65;
      else
        v39 = (*((_QWORD *)&v64 + 1) << -(char)v65) | ((unint64_t)v64 >> v65);
      if (!a5 && (v39 & 1) != 0)
      {
        if (v65 < 65)
        {
          v67 = 0;
          v66 = (_QWORD)v64 << -(char)v65;
        }
        else
        {
          v66 = (*((_QWORD *)&v64 + 1) << -(char)v65) | ((unint64_t)v64 >> v65);
          v67 = (_QWORD)v64 << -(char)v65 != 0;
        }
        if (!v66 && !v67 && (v63 < v45 || v63 == v45 && v56 < v44))
          --v39;
      }
      if ((my_fpsf & 0x20) != 0)
      {
        v72 = 16;
LABEL_139:
        my_fpsf |= v72;
      }
      else
      {
        v69 = 0x80 - v65;
        if (v65 < 65)
        {
          v71 = 0;
          v70 = (_QWORD)v64 << -(char)v65;
        }
        else
        {
          v70 = (*((_QWORD *)&v64 + 1) << v69) | ((unint64_t)v64 >> v65);
          v71 = (_QWORD)v64 << v69;
        }
        switch(a5)
        {
          case 0:
          case 4:
            v72 = 48;
            if (v70 != 0x8000000000000000 || v71)
              goto LABEL_139;
            v73 = v63 == v45;
            if (v63 >= v45)
              goto LABEL_158;
            break;
          case 1:
          case 3:
            if (v70 | v71)
            {
              v72 = 48;
              goto LABEL_139;
            }
            v73 = v63 == v45;
            if (v63 >= v45)
            {
              v72 = 48;
LABEL_158:
              if (!v73 || v56 >= v44)
                goto LABEL_139;
            }
            break;
          default:
            v21 = __CFADD__(__CFADD__(v56, v44), v63);
            v74 = __CFADD__(v56, v44) + v63;
            v75 = v21;
            if (__CFADD__(v74, v45))
              v76 = 1;
            else
              v76 = v75;
            if (v65 < 65)
            {
              v79 = 0;
              v78 = v70 >> -(char)v65;
              v77 = v65 - 64;
            }
            else
            {
              v77 = v65 - 64;
              v78 = (v71 >> v69) | (v70 << v65);
              v79 = v70 >> v69;
            }
            v80 = 1 << v77;
            if (v65 < 64)
              v80 = 0;
            v21 = __CFADD__(v78, v76);
            v81 = v78 + v76;
            if (v21)
              v82 = v79 + 1;
            else
              v82 = v79;
            if (v82 <= v80)
            {
              v83 = v65 < 64 && v81 >> v65 == 0;
              v84 = v83;
              v72 = 48;
              if (v82 != v80 || v84)
                goto LABEL_139;
            }
            break;
        }
      }
    }
    else
    {
      my_fpsf |= 0x30u;
      return a5 == 2;
    }
    return v39;
  }
  if (v38 > 0x3021)
    goto LABEL_122;
  while (1)
  {
    if (v37 < 0x314DC6448D93)
    {
      if (v38 < 12288)
        return v39;
      goto LABEL_96;
    }
    if (v37 != 0x314DC6448D93)
      goto LABEL_121;
    if (v39 >= 0x38C15B0A00000000 || v38 < 12288)
      break;
LABEL_96:
    v37 = (v39 >> 63) + (v39 >> 61) + 10 * v37;
    if (10 * v39 < 8 * v39)
      ++v37;
    --v38;
    v39 *= 10;
  }
  v37 = 0x314DC6448D93;
LABEL_121:
  if (v38 >= 12288)
  {
LABEL_122:
    if (v39 | v37)
    {
      my_fpsf |= 0x28u;
      if ((a5 | 2) == 3)
        return 0x378D8E63FFFFFFFFLL;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return v39;
}

uint64_t __bid128_lgamma(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __n128 *v26;
  __n128 *v27;
  uint64_t v28;
  uint64_t v29[2];
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  uint64_t v34[2];
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  int v40;
  int v41[8];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a1;
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    if (!__bid128_isZero(a1, a2))
    {
      if ((~a2 & 0x7800000000000000) == 0)
        return 0;
      v39 = 0uLL;
      v38 = 0uLL;
      v37 = 0uLL;
      v36 = 0uLL;
      v35 = 0uLL;
      v33 = 0uLL;
      v32 = 0uLL;
      v31 = 0uLL;
      v30 = 0uLL;
      v29[0] = 0;
      v29[1] = 0;
      bid128_to_binary128_2part(v39.n128_u64, v37.n128_u64, v4, a2);
      if (!bid_f128_cmp((uint64_t *)&v39, (uint64_t *)&c_m1e34, 3u))
      {
        if (bid_f128_cmp((uint64_t *)&v39, (uint64_t *)&c_1e34, 6u))
        {
          v7 = __bid128_add(v4, a2, 5uLL, 0xB03E000000000000, a3, &my_fpsf);
          v9 = v8;
          v10 = __bid128_log(v4, a2, a3);
          v12 = v11;
          v13 = __bid128_sub(0x8512E0B1F71B1870, 0x2FFDC512596BF2BELL, v4, a2, a3, &my_fpsf);
          return bid128_ext_fma(v41, (int *)&v42, (int *)v34, &v40, v7, v9, v10, v12, v13, v14, a3, &my_fpsf);
        }
        if (!bid_f128_cmp((uint64_t *)&v39, (uint64_t *)&c_half_1083, 3u)
          || (v16 = __bid128_round_integral_nearest_even(v4, a2, &my_fpsf),
              !__bid128_quiet_equal(v16, v17, v4, a2, &my_fpsf)))
        {
          if (bid_f128_cmp((uint64_t *)&v39, (uint64_t *)&c_half_1083, 6u))
          {
            bid_f128_lgamma(&v36, (uint64_t *)&v39);
            bid_f128_mul(&v38, (uint64_t *)&c_1_plus_eps, (uint64_t *)&v39);
            bid_f128_nextafter(&v38, (uint64_t *)&v39, (uint64_t *)&v38);
            bid_f128_lgamma(&v35, (uint64_t *)&v38);
            bid_f128_sub(&v30, (uint64_t *)&v35, (uint64_t *)&v36);
            bid_f128_sub(&v31, (uint64_t *)&v38, (uint64_t *)&v39);
            bid_f128_div(&v31, (uint64_t *)&v37, (uint64_t *)&v31);
            bid_f128_mul(&v31, (uint64_t *)&v31, (uint64_t *)&v30);
            bid_f128_add(&v36, (uint64_t *)&v36, (uint64_t *)&v31);
            v19 = v36.n128_u64[1];
            v18 = v36.n128_u64[0];
            v20 = a3;
          }
          else
          {
            v42 = 0;
            v43 = 0;
            v44 = 0;
            __dpml_bid_unpack_x_or_y__((uint64_t *)&v39, 0, (uint64_t)&v42, &qword_1B891D780, (uint64_t)v29, v41);
            if (bid_f128_cmp(v29, (uint64_t *)&c_1em100, 3u))
              return __bid128_log(v4, a2 & 0x7FFFFFFFFFFFFFFFLL, a3);
            v21 = __bid128_round_integral_nearest_even(v4, a2, &my_fpsf);
            v23 = __bid128_sub(v4, a2, v21, v22, a3, &my_fpsf);
            v25 = v24;
            bid_f128_sub(&v33, (uint64_t *)&c_one_1084, (uint64_t *)&v39);
            if (bid_f128_cmp((uint64_t *)&v39, (uint64_t *)&c_minus_one, 3u))
            {
              bid_f128_add(&v32, (uint64_t *)&v33, (uint64_t *)&v39);
              v26 = (__n128 *)&c_one_1084;
              v27 = &v32;
            }
            else
            {
              bid_f128_sub(&v32, (uint64_t *)&c_one_1084, (uint64_t *)&v33);
              v26 = &v32;
              v27 = &v39;
            }
            bid_f128_sub(&v32, (uint64_t *)v26, (uint64_t *)v27);
            v39 = v33;
            bid_f128_sub(&v37, (uint64_t *)&v32, (uint64_t *)&v37);
            bid_f128_lgamma(&v36, (uint64_t *)&v39);
            bid_f128_mul(&v38, (uint64_t *)&c_1_plus_eps, (uint64_t *)&v39);
            bid_f128_lgamma(&v35, (uint64_t *)&v38);
            bid_f128_sub(&v30, (uint64_t *)&v35, (uint64_t *)&v36);
            bid_f128_sub(&v31, (uint64_t *)&v38, (uint64_t *)&v39);
            bid_f128_div(&v31, (uint64_t *)&v37, (uint64_t *)&v31);
            bid_f128_mul(&v31, (uint64_t *)&v31, (uint64_t *)&v30);
            bid_f128_add(&v36, (uint64_t *)&v36, (uint64_t *)&v31);
            v34[0] = __bid128_to_binary128(v23, v25, a3, &my_fpsf);
            v34[1] = v28;
            bid_f128_mul(&v30, (uint64_t *)&c_pi_1085, v34);
            __dpml_bid_C_ux_trig__((uint64_t *)&v30, 0, 1, &__dpml_bid_trig_x_table, &v30, v41);
            v42 = 0;
            v43 = 0;
            v44 = 0;
            __dpml_bid_unpack_x_or_y__((uint64_t *)&v30, 0, (uint64_t)&v42, &qword_1B891D780, (uint64_t)&v30, v41);
            bid_f128_log(&v30, (uint64_t *)&v30);
            bid_f128_sub(&v30, (uint64_t *)&c_log_pi, (uint64_t *)&v30);
            bid_f128_sub(&v36, (uint64_t *)&v30, (uint64_t *)&v36);
            v19 = v36.n128_u64[1];
            v18 = v36.n128_u64[0];
            v20 = a3;
          }
          return __binary128_to_bid128(v18, v19, v20, &my_fpsf);
        }
      }
    }
    v4 = 0;
    my_fpsf |= 4u;
    return v4;
  }
  if ((~a2 & 0x7E00000000000000) == 0)
    my_fpsf |= 1u;
  if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
    || (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a1 >= 0x38C15B0A00000000)
  {
    return 0;
  }
  return v4;
}

unint64_t __bid128_log(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __n128 v20;
  __n128 v21;
  uint64_t v22[2];
  __n128 v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26[5];
  _QWORD v27[3];

  v4 = a1;
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    if (__bid128_isZero(a1, a2))
    {
      v4 = 0;
      my_fpsf |= 4u;
      return v4;
    }
    if ((a2 & 0x8000000000000000) != 0)
    {
      v4 = 0;
      my_fpsf |= 1u;
      return v4;
    }
    v23 = 0uLL;
    v22[0] = 0;
    v22[1] = 0;
    v21 = 0uLL;
    if (__bid128_quiet_greater(v4, a2, 1uLL, 0x5320000000000000, &my_fpsf))
    {
      v6 = __bid128_mul(v4, a2, 1uLL, 0xD60000000000000, a3, &my_fpsf);
      v24 = __bid128_to_binary128(v6, v7, a3, &my_fpsf);
      v25 = v8;
      bid_f128_log(&v23, (uint64_t *)&v24);
      bid_f128_add(&v23, (uint64_t *)&v23, (uint64_t *)&c_4464_ln_10);
    }
    else
    {
      if (!__bid128_quiet_less(v4, a2, 1uLL, 0xD60000000000000, &my_fpsf))
      {
        v20 = 0uLL;
        v24 = __bid128_to_binary128(v4, a2, a3, &my_fpsf);
        v25 = v16;
        bid_f128_log(&v23, (uint64_t *)&v24);
        bid_f128_sub(&v20, (uint64_t *)&v24, (uint64_t *)&c_one_1088);
        memset(v27, 0, sizeof(v27));
        __dpml_bid_unpack_x_or_y__((uint64_t *)&v20, 0, (uint64_t)v27, &qword_1B891D780, (uint64_t)v22, v26);
        if (bid_f128_cmp(v22, (uint64_t *)&c_half_1089, 1u))
        {
          v17 = __bid128_add(v4, a2, 1uLL, 0xB040000000000000, a3, &my_fpsf);
          v26[0] = __bid128_to_binary128(v17, v18, a3, &my_fpsf);
          v26[1] = v19;
          bid_f128_sub(&v21, (uint64_t *)&v20, v26);
          bid_f128_div(&v21, (uint64_t *)&v21, (uint64_t *)&v24);
          bid_f128_sub(&v23, (uint64_t *)&v23, (uint64_t *)&v21);
        }
        v13 = v23.n128_u64[1];
        v12 = v23.n128_u64[0];
        v14 = a3;
        return __binary128_to_bid128(v12, v13, v14, &my_fpsf);
      }
      v9 = __bid128_mul(v4, a2, 1uLL, 0x5320000000000000, a3, &my_fpsf);
      v24 = __bid128_to_binary128(v9, v10, a3, &my_fpsf);
      v25 = v11;
      bid_f128_log(&v23, (uint64_t *)&v24);
      bid_f128_sub(&v23, (uint64_t *)&v23, (uint64_t *)&c_4464_ln_10);
    }
    v13 = v23.n128_u64[1];
    v12 = v23.n128_u64[0];
    v14 = a3;
    return __binary128_to_bid128(v12, v13, v14, &my_fpsf);
  }
  if ((~a2 & 0x7E00000000000000) == 0)
    my_fpsf |= 1u;
  if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
    || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
  {
    return 0;
  }
  return v4;
}

unint64_t __bid128_log10(unint64_t a1, unint64_t a2, unsigned int a3, int *a4)
{
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19[2];
  __n128 v20;
  __n128 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24[4];
  __n128 v25;
  uint64_t v26;

  v6 = a1;
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    if (__bid128_isZero(a1, a2))
    {
      v6 = 0;
      *a4 |= 4u;
    }
    else if ((a2 & 0x8000000000000000) != 0)
    {
      v6 = 0;
      *a4 |= 1u;
    }
    else
    {
      v21 = 0uLL;
      if (__bid128_quiet_greater(v6, a2, 1uLL, 0x5320000000000000, a4))
      {
        v8 = __bid128_mul(v6, a2, 1uLL, 0xD60000000000000, a3, a4);
        v22 = __bid128_to_binary128(v8, v9, a3, a4);
        v23 = v10;
        bid_f128_log(&v21, (uint64_t *)&v22);
        bid_f128_mul(&v21, (uint64_t *)&v21, (uint64_t *)&c_inv_log10);
        bid_f128_add(&v21, (uint64_t *)&v21, (uint64_t *)&c_4464);
      }
      else if (__bid128_quiet_less(v6, a2, 1uLL, 0xD60000000000000, a4))
      {
        v11 = __bid128_mul(v6, a2, 1uLL, 0x5320000000000000, a3, a4);
        v22 = __bid128_to_binary128(v11, v12, a3, a4);
        v23 = v13;
        bid_f128_log(&v21, (uint64_t *)&v22);
        bid_f128_mul(&v21, (uint64_t *)&v21, (uint64_t *)&c_inv_log10);
        bid_f128_sub(&v21, (uint64_t *)&v21, (uint64_t *)&c_4464);
      }
      else
      {
        v20 = 0uLL;
        v19[0] = 0;
        v19[1] = 0;
        v22 = __bid128_to_binary128(v6, a2, a3, a4);
        v23 = v14;
        bid_f128_log(&v21, (uint64_t *)&v22);
        bid_f128_sub(&v20, (uint64_t *)&v22, (uint64_t *)&c_one_1092);
        v25 = 0uLL;
        v26 = 0;
        __dpml_bid_unpack_x_or_y__((uint64_t *)&v20, 0, (uint64_t)&v25, &qword_1B891D780, (uint64_t)v19, v24);
        if (bid_f128_cmp(v19, (uint64_t *)&c_half_1093, 1u))
        {
          v25 = 0uLL;
          v15 = __bid128_add(v6, a2, 1uLL, 0xB040000000000000, a3, a4);
          v24[0] = __bid128_to_binary128(v15, v16, a3, a4);
          v24[1] = v17;
          bid_f128_sub(&v25, (uint64_t *)&v20, v24);
          bid_f128_div(&v25, (uint64_t *)&v25, (uint64_t *)&v22);
          bid_f128_sub(&v21, (uint64_t *)&v21, (uint64_t *)&v25);
        }
        bid_f128_mul(&v21, (uint64_t *)&v21, (uint64_t *)&c_inv_log10);
      }
      return __binary128_to_bid128(v21.n128_u64[0], v21.n128_u64[1], a3, a4);
    }
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      *a4 |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v6;
}

uint64_t __bid128_mul(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5, int *a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  if ((~a2 & 0x7800000000000000) != 0 && (~a4 & 0x7800000000000000) != 0)
  {
    if ((~a2 & 0x6000000000000000) != 0)
    {
      v11 = a2 & 0x1FFFFFFFFFFFFLL;
      if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0 || a1 > 0x378D8E63FFFFFFFFLL && v11 == 0x1ED09BEAD87C0)
      {
        v10 = 0;
        v11 = 0;
      }
      else
      {
        v10 = a1;
      }
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    if ((~a4 & 0x6000000000000000) != 0)
    {
      v13 = a4 & 0x1FFFFFFFFFFFFLL;
      if ((a4 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0
        || (a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a3 > 0x378D8E63FFFFFFFFLL)
      {
        v12 = 0;
        v13 = 0;
      }
      else
      {
        v12 = a3;
      }
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
    if (!(v11 | v10) || !(v13 | v12))
      return 0;
  }
  v18 = v6;
  v19 = v7;
  return bid128_ext_fma(&v17, &v16, &v15, &v14, a3, a4, a1, a2, 0, 0x5FFE000000000000uLL, a5, a6);
}

uint64_t __bid128_isZero(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _BOOL4 v3;
  unsigned int v5;

  v2 = a2 & 0x1FFFFFFFFFFFFLL;
  v3 = (~a2 & 0x6000000000000000) == 0;
  if (a1 > 0x378D8E63FFFFFFFFLL && v2 == 0x1ED09BEAD87C0)
    v3 = 1;
  if (!(v2 | a1))
    v3 = 1;
  v5 = v2 > 0x1ED09BEAD87C0 || v3;
  if ((~a2 & 0x7800000000000000) != 0)
    return v5;
  else
    return 0;
}

uint64_t __bid128_pow(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unsigned int a5, int *a6)
{
  uint64_t v12;
  int isZero;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v22;
  unint64_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int v26;
  unint64_t v27;
  int8x16_t v28;
  int32x4_t v29;
  int8x16_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unsigned __int128 v53;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t *v68;
  unsigned __int128 v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  _BOOL8 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  __int128 v96;
  unint64_t v97;
  unsigned int v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unsigned int v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unsigned int v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unsigned __int128 v120;
  BOOL v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unsigned int v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unsigned int v140;
  unint64_t v141;
  unint64_t v142;
  unsigned __int128 v143;
  _BOOL4 v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unsigned int v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unsigned int v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unsigned int v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t v182;
  unsigned int v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  _BOOL8 v187;
  unint64_t v188;
  unsigned int v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unsigned int v199;
  unsigned int v200;
  unint64_t v201;
  unsigned int v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unsigned int v207;
  unsigned int v208;
  unint64_t v209;
  unint64_t v210;
  unint64_t v211;
  uint64_t v212;
  unint64_t v213;
  unsigned int v214;
  unint64_t v215;
  unint64_t v216;
  unsigned int v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  _BOOL8 v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  unsigned int v225;
  unint64_t v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  unint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  _BOOL8 v240;
  uint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unsigned int v251;
  unint64_t v252;
  uint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unsigned int v256;
  unint64_t v257;
  uint64_t v258;
  unint64_t v259;
  unsigned int v260;
  unint64_t v261;
  uint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  unint64_t v267;
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  unint64_t v278;
  unint64_t v279;
  uint64_t v280;
  unint64_t v281;
  unint64_t v282;
  unint64_t v283;
  uint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  _BOOL4 v288;
  unint64_t v289;
  uint64_t v290;
  unint64_t v291;
  unint64_t v292;
  _BOOL4 v293;
  unint64_t v294;
  uint64_t v295;
  unint64_t v296;
  unsigned int v297;
  unint64_t v298;
  uint64_t v299;
  uint64_t v300;
  unint64_t v301;
  _BOOL4 v302;
  unint64_t v303;
  uint64_t v304;
  unint64_t v305;
  _BOOL4 v306;
  unint64_t v307;
  uint64_t v308;
  unint64_t v309;
  uint64_t v310;
  unint64_t v311;
  unint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  unint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unsigned int v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  unint64_t v324;
  unint64_t v325;
  unint64_t v326;
  uint64_t v327;
  unint64_t v328;
  unint64_t v329;
  unint64_t v330;
  unsigned __int128 v331;
  uint64_t v332;
  unint64_t v333;
  unint64_t v334;
  unint64_t v335;
  unint64_t v336;
  unint64_t v337;
  unint64_t v338;
  unint64_t v339;
  unint64_t v340;
  unint64_t v341;
  unint64_t v342;
  unint64_t v343;
  unint64_t v344;
  unint64_t v345;
  _BOOL8 v346;
  uint64_t v347;
  unint64_t v348;
  unint64_t v349;
  uint64_t v350;
  _BOOL4 v351;
  uint64_t v352;
  uint64_t v353;
  unint64_t v354;
  unsigned int v355;
  unint64_t v356;
  uint64_t v357;
  unint64_t v358;
  unint64_t v359;
  unint64_t v360;
  _BOOL4 v361;
  unint64_t v362;
  uint64_t v363;
  unint64_t v364;
  unsigned int v365;
  unint64_t v366;
  uint64_t v367;
  unint64_t v368;
  unint64_t v369;
  unsigned int v370;
  _BOOL8 v371;
  unint64_t v372;
  unint64_t v373;
  unsigned int v374;
  unint64_t v375;
  unint64_t v376;
  unint64_t v377;
  unint64_t v378;
  unint64_t v379;
  uint64_t v380;
  unint64_t v381;
  unint64_t v382;
  unint64_t v383;
  unsigned int v384;
  unint64_t v385;
  unint64_t v386;
  unint64_t v387;
  unint64_t v388;
  unint64_t v389;
  unint64_t v390;
  unint64_t v391;
  unint64_t v392;
  uint64_t v393;
  unint64_t v394;
  unint64_t v395;
  unint64_t v396;
  unint64_t v397;
  unsigned __int128 v398;
  uint64_t v399;
  unint64_t v400;
  unint64_t v401;
  unint64_t v402;
  unint64_t v403;
  unint64_t v404;
  unint64_t v405;
  unint64_t v406;
  unint64_t v407;
  unint64_t v408;
  unint64_t v409;
  unint64_t v410;
  unint64_t v411;
  unint64_t v412;
  _BOOL8 v413;
  uint64_t v414;
  unint64_t v415;
  unint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  unint64_t v420;
  unsigned int v421;
  unint64_t v422;
  uint64_t v423;
  unint64_t v424;
  unint64_t v425;
  unint64_t v426;
  _BOOL4 v427;
  unint64_t v428;
  uint64_t v429;
  unint64_t v430;
  unsigned int v431;
  unint64_t v432;
  uint64_t v433;
  unint64_t v434;
  unint64_t v435;
  unint64_t v436;
  unint64_t v437;
  unint64_t v438;
  unint64_t v439;
  unint64_t v440;
  unint64_t v441;
  unint64_t v442;
  unint64_t v443;
  unint64_t v444;
  unint64_t v445;
  unint64_t v446;
  unint64_t v447;
  unint64_t v448;
  unint64_t v449;
  unint64_t v450;
  unint64_t v451;
  unint64_t v452;
  unint64_t v453;
  unint64_t v454;
  uint64_t v455;
  unint64_t v456;
  unint64_t v457;
  unint64_t v458;
  uint64_t v459;
  unint64_t v460;
  unint64_t v461;
  unint64_t v462;
  uint64_t v463;
  unint64_t v464;
  unint64_t v465;
  unint64_t v466;
  _BOOL4 v467;
  unint64_t v468;
  uint64_t v469;
  unint64_t v470;
  unsigned int v471;
  unint64_t v472;
  uint64_t v473;
  uint64_t v474;
  unint64_t v475;
  _BOOL8 v476;
  unsigned int v477;
  unint64_t v478;
  uint64_t v479;
  unint64_t v480;
  uint64_t v481;
  unint64_t v482;
  unsigned __int128 v483;
  _BOOL4 v484;
  unint64_t v485;
  unint64_t v486;
  unint64_t v487;
  unint64_t v488;
  unint64_t v489;
  uint64_t v490;
  unint64_t v491;
  unint64_t v492;
  _BOOL8 v493;
  unsigned int v494;
  unint64_t v495;
  unint64_t v496;
  unint64_t v497;
  unint64_t v498;
  unint64_t v499;
  unint64_t v500;
  unint64_t v501;
  unint64_t v502;
  uint64_t v503;
  unint64_t v504;
  unint64_t v505;
  unint64_t v506;
  unint64_t v507;
  _BOOL8 v508;
  uint64_t v509;
  unint64_t v510;
  unint64_t v511;
  unint64_t v512;
  unint64_t v513;
  unint64_t v514;
  unint64_t v515;
  unint64_t v516;
  unint64_t v517;
  unint64_t v518;
  unint64_t v519;
  unint64_t v520;
  unint64_t v521;
  unint64_t v522;
  _BOOL8 v523;
  unsigned int v524;
  unint64_t v525;
  uint64_t v526;
  unint64_t v527;
  unint64_t v528;
  _BOOL4 v529;
  unint64_t v530;
  uint64_t v531;
  unint64_t v532;
  unsigned int v533;
  unint64_t v534;
  uint64_t v535;
  unint64_t v536;
  unint64_t v537;
  unint64_t v538;
  _BOOL4 v539;
  unint64_t v540;
  uint64_t v541;
  unint64_t v542;
  unsigned int v543;
  unint64_t v544;
  uint64_t v545;
  unint64_t v546;
  unint64_t v547;
  unint64_t v548;
  unint64_t v549;
  unint64_t v550;
  unint64_t v551;
  unint64_t v552;
  uint64_t v553;
  uint64_t v554;
  unint64_t v555;
  unint64_t v556;
  unint64_t v557;
  unint64_t v558;
  unint64_t v559;
  uint64_t v560;
  unsigned int v561;
  unint64_t v562;
  unint64_t v563;
  unint64_t v564;
  unint64_t v565;
  unint64_t v566;
  unint64_t v567;
  unint64_t v568;
  uint64_t v569;
  uint64_t v570;
  unint64_t v571;
  unint64_t v572;
  unsigned __int128 v573;
  unint64_t v574;
  unsigned int v575;
  unint64_t v576;
  unint64_t v577;
  uint64_t v578;
  unint64_t v579;
  unint64_t v580;
  uint64_t v581;
  unint64_t v582;
  unint64_t v583;
  uint64_t v584;
  unint64_t v585;
  unint64_t v586;
  unint64_t v587;
  unint64_t v588;
  unint64_t v589;
  unint64_t v590;
  unint64_t v591;
  uint64_t v592;
  unint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  unint64_t v600;
  uint64_t v601;
  unint64_t v602;
  unint64_t v603;
  unint64_t v604;
  unint64_t v605;
  unint64_t v606;
  unint64_t v607;
  unint64_t v608;
  unsigned int v609;
  unint64_t v610;
  unint64_t v611;
  unint64_t v612;
  unint64_t v613;
  unint64_t v614;
  unint64_t v615;
  unint64_t v616;
  unint64_t v617;
  uint64_t v618;
  unint64_t v619;
  unint64_t v620;
  unint64_t v621;
  unint64_t v622;
  unint64_t v623;
  unint64_t v624;
  _BOOL8 v625;
  unsigned int v626;
  unint64_t v627;
  unint64_t v628;
  unint64_t v629;
  unint64_t v630;
  unint64_t v631;
  uint64_t v632;
  unint64_t v633;
  unint64_t v634;
  unint64_t v635;
  unint64_t v636;
  unint64_t v637;
  unint64_t v638;
  unint64_t v639;
  unint64_t v640;
  _BOOL8 v641;
  unsigned int v642;
  unint64_t v643;
  uint64_t v644;
  unint64_t v645;
  unint64_t v646;
  _BOOL4 v647;
  unint64_t v648;
  uint64_t v649;
  unint64_t v650;
  unsigned int v651;
  unint64_t v652;
  uint64_t v653;
  unint64_t v654;
  unint64_t v655;
  _BOOL4 v656;
  unint64_t v657;
  uint64_t v658;
  unint64_t v659;
  unsigned int v660;
  unint64_t v661;
  unint64_t v662;
  unint64_t v663;
  unint64_t v664;
  unint64_t v665;
  unint64_t v666;
  unint64_t v667;
  uint64_t v668;
  unint64_t v669;
  unint64_t v670;
  unint64_t v671;
  unint64_t v672;
  _BOOL8 v673;
  unint64_t v674;
  unint64_t v675;
  uint64_t v676;
  unsigned int v677;
  unint64_t v678;
  unint64_t v679;
  unint64_t v680;
  unint64_t v681;
  uint64_t v682;
  unint64_t v683;
  unint64_t v684;
  unint64_t v685;
  unint64_t v686;
  unint64_t v687;
  unint64_t v688;
  unint64_t v689;
  unint64_t v690;
  unint64_t v691;
  unint64_t v692;
  unint64_t v693;
  uint64_t v694;
  unint64_t v695;
  unint64_t v696;
  unint64_t v697;
  unint64_t v698;
  unint64_t v699;
  unint64_t v700;
  unint64_t v701;
  unint64_t v702;
  uint64_t v703;
  unint64_t v704;
  unint64_t v705;
  unsigned int v706;
  unint64_t v707;
  uint64_t v708;
  unint64_t v709;
  unint64_t v710;
  unint64_t v711;
  uint64_t v712;
  unint64_t v713;
  unint64_t v714;
  unint64_t v715;
  unint64_t v716;
  uint64_t v717;
  unint64_t v718;
  uint64_t v719;
  unsigned int v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  unsigned int v724;
  unint64_t v725;
  unint64_t v726;
  unint64_t v727;
  unint64_t v728;
  unint64_t v729;
  uint64_t v730;
  unint64_t v731;
  unint64_t v732;
  unint64_t v733;
  unsigned int v734;
  unint64_t v735;
  unint64_t v736;
  unint64_t v737;
  unint64_t v738;
  unint64_t v739;
  unint64_t v740;
  unint64_t v741;
  unint64_t v742;
  uint64_t v743;
  unint64_t v744;
  unint64_t v745;
  unint64_t v746;
  unint64_t v747;
  uint64_t v748;
  unint64_t v749;
  unint64_t v750;
  unint64_t v751;
  unint64_t v752;
  unint64_t v753;
  unint64_t v754;
  unint64_t v755;
  unint64_t v756;
  unint64_t v757;
  unint64_t v758;
  unint64_t v759;
  unint64_t v760;
  unint64_t v761;
  _BOOL8 v762;
  unsigned int v763;
  unint64_t v764;
  uint64_t v765;
  unint64_t v766;
  unint64_t v767;
  unint64_t v768;
  unint64_t v769;
  _BOOL4 v770;
  unint64_t v771;
  uint64_t v772;
  unint64_t v773;
  unsigned int v774;
  unint64_t v775;
  uint64_t v776;
  unint64_t v777;
  unint64_t v778;
  unsigned int v779;
  unint64_t v780;
  uint64_t v781;
  unint64_t v782;
  unsigned int v783;
  unint64_t v784;
  uint64_t v785;
  unint64_t v786;
  unint64_t v787;
  unsigned int v788;
  unint64_t v789;
  _BOOL8 v790;
  uint64_t v791;
  unsigned int v792;
  unint64_t v793;
  unint64_t v794;
  unint64_t v795;
  unint64_t v796;
  unint64_t v797;
  uint64_t v798;
  unint64_t v799;
  unint64_t v800;
  unint64_t v801;
  unsigned int v802;
  unint64_t v803;
  unint64_t v804;
  unint64_t v805;
  unint64_t v806;
  unint64_t v807;
  unint64_t v808;
  unint64_t v809;
  unint64_t v810;
  uint64_t v811;
  unint64_t v812;
  unint64_t v813;
  unint64_t v814;
  unsigned __int128 v815;
  uint64_t v816;
  unint64_t v817;
  int v818;
  unint64_t v819;
  unint64_t v820;
  unint64_t v821;
  unint64_t v822;
  unint64_t v823;
  unint64_t v824;
  unint64_t v825;
  unint64_t v826;
  unint64_t v827;
  unint64_t v828;
  unint64_t v829;
  unint64_t v830;
  unint64_t v831;
  _BOOL8 v832;
  unsigned int v833;
  unint64_t v834;
  uint64_t v835;
  unint64_t v836;
  unint64_t v837;
  uint64_t v838;
  _BOOL4 v839;
  uint64_t v840;
  uint64_t v841;
  unint64_t v842;
  unsigned int v843;
  unint64_t v844;
  uint64_t v845;
  unint64_t v846;
  unint64_t v847;
  unsigned int v848;
  unint64_t v849;
  uint64_t v850;
  unint64_t v851;
  unsigned int v852;
  unint64_t v853;
  uint64_t v854;
  unint64_t v855;
  unint64_t v856;
  unint64_t v857;
  unint64_t v858;
  unint64_t v859;
  unint64_t v860;
  unint64_t v861;
  unint64_t v862;
  unint64_t v863;
  unint64_t v864;
  unsigned int v865;
  unint64_t v866;
  unint64_t v867;
  uint64_t v868;
  unsigned int v869;
  unint64_t v870;
  unint64_t v871;
  unint64_t v872;
  uint64_t v873;
  unint64_t v874;
  unint64_t v875;
  unint64_t v876;
  unint64_t v877;
  unint64_t v878;
  uint64_t v879;
  uint64_t v880;
  unint64_t v881;
  unint64_t v882;
  unint64_t v883;
  unsigned __int128 v884;
  uint64_t v885;
  unint64_t v886;
  unsigned int v887;
  unint64_t v888;
  unsigned int v889;
  unint64_t v890;
  unint64_t v891;
  unint64_t v892;
  unint64_t v893;
  unint64_t v894;
  uint64_t v895;
  unint64_t v896;
  unint64_t v897;
  unint64_t v898;
  unint64_t v899;
  unint64_t v900;
  unint64_t v901;
  _BOOL8 v902;
  uint64_t v903;
  unint64_t v904;
  unint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  unint64_t v909;
  unsigned int v910;
  unint64_t v911;
  uint64_t v912;
  unint64_t v913;
  unint64_t v914;
  _BOOL8 v915;
  unsigned int v916;
  unint64_t v917;
  uint64_t v918;
  unint64_t v919;
  uint64_t v920;
  unint64_t v921;
  uint64_t v922;
  unint64_t v923;
  _BOOL4 v924;
  unint64_t v925;
  unint64_t v926;
  unint64_t v927;
  unint64_t v928;
  unint64_t v929;
  uint64_t v930;
  unint64_t v931;
  unint64_t v932;
  _BOOL8 v933;
  unsigned int v934;
  unint64_t v935;
  unint64_t v936;
  unint64_t v937;
  unint64_t v938;
  unint64_t v939;
  unint64_t v940;
  unint64_t v941;
  unint64_t v942;
  uint64_t v943;
  unint64_t v944;
  unint64_t v945;
  unint64_t v946;
  unint64_t v947;
  unint64_t v948;
  _BOOL8 v949;
  uint64_t v950;
  unint64_t v951;
  unsigned int v952;
  unint64_t v953;
  unint64_t v954;
  unint64_t v955;
  unint64_t v956;
  unint64_t v957;
  unint64_t v958;
  unint64_t v959;
  unint64_t v960;
  unint64_t v961;
  unint64_t v962;
  unint64_t v963;
  unint64_t v964;
  unint64_t v965;
  unint64_t v966;
  unint64_t v967;
  _BOOL8 v968;
  unsigned int v969;
  unint64_t v970;
  uint64_t v971;
  unint64_t v972;
  unint64_t v973;
  unint64_t v974;
  unint64_t v975;
  unint64_t v976;
  unsigned int v977;
  unint64_t v978;
  uint64_t v979;
  unint64_t v980;
  unsigned int v981;
  unint64_t v982;
  uint64_t v983;
  unint64_t v984;
  unint64_t v985;
  unsigned int v986;
  unint64_t v987;
  uint64_t v988;
  unint64_t v989;
  unsigned int v990;
  unint64_t v991;
  uint64_t v992;
  unint64_t v993;
  unint64_t v994;
  unsigned int v995;
  unint64_t v996;
  unint64_t v997;
  unint64_t v998;
  unint64_t v999;
  unint64_t v1000;
  unint64_t v1001;
  unint64_t v1002;
  unint64_t v1003;
  unint64_t v1004;
  uint64_t v1005;
  unint64_t v1006;
  unint64_t v1007;
  unint64_t v1008;
  unint64_t v1009;
  unint64_t v1010;
  unint64_t v1011;
  unint64_t v1012;
  unint64_t v1013;
  uint64_t v1014;
  unint64_t v1015;
  unint64_t v1016;
  unint64_t v1017;
  unint64_t v1018;
  unint64_t v1019;
  unsigned int v1020;
  unint64_t v1021;
  unint64_t v1022;
  unsigned int v1023;
  unint64_t v1024;
  uint64_t v1025;
  uint64_t v1026;
  unint64_t v1027;
  unint64_t v1028;
  unint64_t v1029;
  unint64_t v1030;
  unint64_t v1031;
  unint64_t v1032;
  unint64_t v1033;
  uint64_t v1034;
  unint64_t v1035;
  uint64_t v1036;
  unint64_t v1037;
  unint64_t v1038;
  unint64_t v1039;
  _BOOL8 v1040;
  unsigned int v1041;
  unint64_t v1042;
  uint64_t v1043;
  uint64_t v1044;
  unint64_t v1045;
  unint64_t v1046;
  uint64_t v1047;
  unint64_t v1048;
  unint64_t v1049;
  unsigned int v1050;
  unint64_t v1051;
  uint64_t v1052;
  uint64_t v1053;
  unint64_t v1054;
  unsigned int v1055;
  unint64_t v1056;
  uint64_t v1057;
  unint64_t v1058;
  unsigned int v1059;
  unint64_t v1060;
  uint64_t v1061;
  unsigned __int128 v1062;
  _BOOL4 v1063;
  unint64_t v1064;
  unint64_t v1065;
  uint64_t v1066;
  unint64_t v1067;
  __int128 v1068;
  unint64_t v1069;
  unint64_t v1070;
  unint64_t v1071;
  unsigned __int128 v1072;
  BOOL v1073;
  unint64_t v1074;
  uint64_t v1075;
  uint64_t v1076;
  unint64_t v1077;
  unint64_t v1078;
  unint64_t v1079;
  unsigned __int128 v1080;
  unint64_t v1081;
  unint64_t v1082;
  unsigned __int128 v1083;
  unint64_t v1084;
  unint64_t v1085;
  unsigned __int128 v1086;
  unint64_t v1087;
  uint64_t v1088;
  unint64_t v1089;
  uint64_t v1090;
  unint64_t v1091;
  uint64_t v1092;
  unsigned int v1093;
  unint64_t v1094;
  uint64_t v1095;
  unint64_t v1096;
  unint64_t v1097;
  uint64_t v1098;
  uint64_t v1099;
  unint64_t v1100;
  uint64_t v1101;
  uint64_t v1102;
  unint64_t v1103;
  uint64_t v1104;
  unint64_t v1105;
  uint64_t v1106;
  uint64_t v1107;
  unint64_t v1108;
  uint64_t v1109;
  unint64_t v1110;
  uint64_t v1111;
  unint64_t v1112;
  uint64_t v1113;
  unint64_t v1114;
  uint64_t v1115;
  unint64_t v1116;
  uint64_t v1117;
  uint64_t v1118;
  uint64_t v1119;
  unint64_t v1120;
  uint64_t v1121;
  uint64_t v1122;
  uint64_t v1123;
  unint64_t v1124;
  unint64_t v1125;
  unint64_t v1126;
  unint64_t v1127;
  unint64_t v1128;
  unint64_t v1129;
  uint64_t v1130;
  uint64_t v1131;
  uint64_t v1132;
  unint64_t v1133;
  int v1134;
  unint64_t v1135;
  unint64_t v1136;
  unint64_t v1137;
  unint64_t v1138;
  unint64_t v1139;
  unint64_t v1140;
  unint64_t v1141;
  uint64_t v1142;
  unsigned int v1143;
  unsigned int v1144;
  unint64_t v1145;
  unint64_t v1146;
  unsigned int v1147;
  unsigned int v1148;
  unint64_t v1149;
  unint64_t v1150;
  unint64_t v1151;
  unint64_t v1152;
  uint64_t v1153;
  unsigned int v1154;
  unint64_t v1155;
  unint64_t v1156;
  uint64_t v1157;
  unsigned int v1158;
  unint64_t v1159;
  unint64_t v1160;
  unint64_t v1161;
  unsigned int v1162;
  unint64_t v1163;
  unint64_t v1164;
  unint64_t v1165;
  uint64_t v1166;
  unint64_t v1167;
  unint64_t v1168;
  unint64_t v1169;
  unint64_t v1170;
  unint64_t v1171;
  uint64_t v1172;
  unsigned int v1173;
  unint64_t v1174;
  uint64_t v1175;
  unint64_t v1176;
  unint64_t v1177;
  uint64_t v1178;
  unsigned int v1179;
  unint64_t v1180;
  unint64_t v1181;
  unint64_t v1182;
  unint64_t v1183;
  unint64_t v1184;
  unint64_t v1185;
  unint64_t v1186;
  unint64_t v1187;
  unint64_t v1188;
  uint64_t v1189;
  unint64_t v1190;
  unint64_t v1191;
  uint64_t v1192;
  unint64_t v1193;
  unint64_t v1194;
  unint64_t v1195;
  unint64_t v1196;
  unint64_t v1197;
  uint64_t v1198;
  uint64_t v1199;
  unint64_t v1200;
  unint64_t v1201;
  unint64_t v1202;
  unint64_t v1203;
  uint64_t v1204;
  unint64_t v1205;
  unsigned int v1206;
  unint64_t v1207;
  unint64_t v1208;
  unint64_t v1209;
  uint64_t v1210;
  unint64_t v1211;
  unint64_t v1212;
  unint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  uint64_t v1216;
  uint64_t v1217;
  unint64_t v1218;
  uint64_t v1219;
  uint64_t v1220;
  unint64_t v1221;
  uint64_t v1222;
  unint64_t v1223;
  uint64_t v1224;
  uint64_t v1225;
  unint64_t v1226;
  uint64_t v1227;
  unint64_t v1228;
  unint64_t *v1229;
  uint64_t v1230;
  unint64_t *v1231;
  unint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  unsigned int v1235;
  unsigned int v1236;
  unsigned int v1237;
  uint64_t v1238;
  unsigned int v1239;
  unsigned int v1240;
  unsigned int v1241;
  unsigned int v1242;
  unint64_t v1243;
  uint64_t v1244;
  uint64_t v1245;
  uint64_t v1246;
  unint64_t v1247;
  unint64_t v1248;
  unint64_t v1249;
  int v1250;
  int v1251;
  int v1252;
  int v1253[3];

  v12 = a2 & 0x7E00000000000000;
  if ((a2 & 0x7E00000000000000) == 0x7E00000000000000 || (a4 & 0x7E00000000000000) == 0x7E00000000000000)
    *a6 |= 1u;
  isZero = __bid128_isZero(a3, a4);
  if (v12 != 0x7E00000000000000 && isZero)
    return 1;
  v14 = 1;
  v15 = __bid128_quiet_equal(a1, a2, 1uLL, 0x3040000000000000uLL, a6);
  if (v12 == 0x7E00000000000000 || !v15)
  {
    if ((~a2 & 0x7C00000000000000) != 0)
    {
      if ((~a4 & 0x7C00000000000000) != 0)
      {
        if ((~a4 & 0x7800000000000000) != 0)
        {
          v17 = __bid128_round_integral_nearest_even(a3, a4, a6);
          v19 = __bid128_quiet_equal(v17, v18, a3, a4, a6);
          if ((~a2 & 0x7800000000000000) != 0)
          {
            v20 = v19;
            if (__bid128_isZero(a1, a2))
            {
              if ((a4 & 0x8000000000000000) != 0)
                *a6 |= 4u;
              return 0;
            }
            else if ((a2 & 0x8000000000000000) == 0 || v20)
            {
              v22 = (a2 >> 49) & 0x3FFF;
              v23 = a2 & 0x1FFFFFFFFFFFFLL;
              if ((a2 & 0x1FFFFFFFFFFFFLL) != 0)
              {
                v24 = (int8x16_t)vdupq_n_s64(a2);
                v25 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v24, (int8x16_t)xmmword_1B8917D50), (uint64x2_t)vandq_s8(v24, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v24, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v24, (int8x16_t)xmmword_1B8917D70))));
                *(int8x8_t *)v25.i8 = vorr_s8(*(int8x8_t *)v25.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL));
                v26 = v25.i32[0] | v25.i32[1] | (2 * ((a2 & 0xCCCCCCCCCCCCLL) <= (a2 & 0x1333333333333))) | ((a2 & 0xAAAAAAAAAAAALL) <= (a2 & 0x1555555555555));
                if (v26)
                {
                  v23 = (a1 >> -(char)v26) + (v23 << v26);
                  v27 = a1 << v26;
                }
                else
                {
                  v27 = a1;
                }
              }
              else
              {
                if (a1)
                {
                  v28 = (int8x16_t)vdupq_n_s64(a1);
                  v29 = (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v28, (int8x16_t)xmmword_1B8917D80), (uint64x2_t)vandq_s8(v28, (int8x16_t)xmmword_1B8917D90));
                  v30 = vbicq_s8((int8x16_t)xmmword_1B8917DA0, (int8x16_t)vuzp1q_s32(v29, (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v28, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v28, (int8x16_t)xmmword_1B8917CF0))));
                  *(int8x8_t *)v30.i8 = vorr_s8(vorr_s8(vand_s8((int8x8_t)vmovn_s64((int64x2_t)v29), (int8x8_t)0x4000000000), *(int8x8_t *)v30.i8), (int8x8_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL));
                  v26 = v30.i32[0] | v30.i32[1] | (2 * ((a1 & 0xCCCCCCCCCCCCCCCCLL) <= (a1 & 0x3333333333333333))) | ((a1 & 0xAAAAAAAAAAAAAAAALL) <= (a1 & 0x5555555555555555));
                }
                else
                {
                  v26 = 128;
                }
                v27 = 0;
                v23 = a1 << v26;
              }
              v31 = 128 - v26;
              v32 = 1089684262 * (128 - v26);
              v33 = HIDWORD(v32) + 66254511 * v31;
              v34 = v32 & 0xFFFFFFFE | (v33 << 32);
              v35 = ((3387143064 * v31) & 0xFFFFFFF8 | ((((3387143064u * (unint64_t)v31) >> 32)
                                                           + 3520035243 * v31) << 32))
                  + HIDWORD(v33);
              v1234 = (__PAIR128__((((3387143064u * (unint64_t)v31) >> 32) + 3520035243 * v31) >> 32, (3387143064 * v31) & 0xFFFFFFF8 | ((((3387143064u * (unint64_t)v31) >> 32)+ 3520035243 * v31) << 32))+ __PAIR128__(2977044471u * (unint64_t)v31, HIDWORD(v33))) >> 64;
              if (v22 >> 5 < 0xC1)
              {
                v45 = (6176 - v22);
                v46 = ((2319430631u * (unint64_t)v45) >> 32) + 189540515 * v45;
                v47 = (-1975536665 * v45) | ((unint64_t)v46 << 32);
                v48 = ((2841335982u * (unint64_t)v45) >> 32) + 2862788699 * v45;
                v49 = (-1453631314 * v45) | (v48 << 32);
                v50 = 0xFFFFFFFDB289C88ALL * v45;
                v1073 = __CFADD__(v49, HIDWORD(v46));
                v51 = v49 + HIDWORD(v46);
                v52 = v1073;
                v53 = __PAIR128__(v35, v34) - v47;
                v43 = v53;
                v44 = *((_QWORD *)&v53 + 1) - v51;
                v55 = *((_QWORD *)&v53 + 1) < v51 || *((_QWORD *)&v53 + 1) > v35;
                v1232 = v50 - HIDWORD(v48) - v52;
                v1233 = v55 << 63 >> 63;
              }
              else
              {
                v36 = (v22 - 6176);
                v37 = ((2319430631u * (unint64_t)v36) >> 32) + 189540515 * v36;
                v38 = (-1975536665 * v36) | ((unint64_t)v37 << 32);
                v39 = ((2841335982u * (unint64_t)v36) >> 32) + 2862788699 * v36;
                v40 = HIDWORD(v39);
                v41 = (-1453631314 * v36) | (v39 << 32);
                v42 = (((1299593078 * v36) & 0x7FFFFFFF00000000) + (v36 << 33)) | (1299593078 * v36) & 0xFFFFFFFELL;
                v43 = v38 + v34;
                v44 = __CFADD__(v38, v34) + v35 + v41 + HIDWORD(v37);
                v1232 = (__PAIR128__(v42, v41) + __PAIR128__(v40, HIDWORD(v37))) >> 64;
                v1233 = v41 + HIDWORD(v37);
              }
              v56 = HIBYTE(v23) - 128;
              v57 = bid_recip_table_1[v56];
              v58 = HIDWORD(v57);
              v59 = HIDWORD(v23);
              v60 = HIDWORD(v57) * (unint64_t)v23;
              v61 = v57 * (unint64_t)v23;
              v62 = v57 * (unint64_t)v59 + v60 + HIDWORD(v61);
              v63 = HIDWORD(v27);
              v64 = HIDWORD(v57) * (unint64_t)v27;
              v65 = v57 * (unint64_t)HIDWORD(v27) + v64;
              v66 = v57 * (unint64_t)v27;
              v67 = v65 + HIDWORD(v66);
              v68 = (unint64_t *)((char *)&bid_log_table_1 + 32 * v56);
              v69 = __PAIR128__(HIDWORD(v62), v61 | ((unint64_t)v62 << 32))
                  + __PAIR128__(HIDWORD(v60) + v58 * (unint64_t)v59, HIDWORD(v64) + v58 * (unint64_t)v63 + HIDWORD(v67));
              v70 = ((unint64_t)((__PAIR128__(HIDWORD(v62), v61 | ((unint64_t)v62 << 32))+ __PAIR128__(HIDWORD(v60) + v58 * (unint64_t)v59, HIDWORD(v64)+ v58 * (unint64_t)v63+ HIDWORD(v67))) >> 64) >> 49) & 0x7F;
              v71 = bid_recip_table_2[v70];
              v72 = ((HIDWORD(v71) * (unint64_t)v66) >> 32)
                  + v67 * (unint64_t)HIDWORD(v71)
                  + ((v67 * (unint64_t)v71
                    + (HIDWORD(v71) * v66)
                    + ((v71 * (unint64_t)v66) >> 32)) >> 32);
              v73 = v69 * (unint64_t)HIDWORD(v71);
              v74 = v69 * (unint64_t)v71;
              v75 = DWORD1(v69) * (unint64_t)v71 + v73 + HIDWORD(v74);
              v76 = HIDWORD(v73) + DWORD1(v69) * (unint64_t)HIDWORD(v71) + HIDWORD(v75);
              v77 = DWORD2(v69) * (unint64_t)HIDWORD(v71);
              v78 = DWORD2(v69) * (unint64_t)v71;
              v79 = HIDWORD(v69) * (unint64_t)v71 + v77 + HIDWORD(v78);
              v80 = HIDWORD(v77) + HIDWORD(v69) * (unint64_t)HIDWORD(v71) + HIDWORD(v79);
              v81 = v68[1];
              v82 = v43 - *v68;
              v83 = v43 < *v68;
              v84 = (__PAIR128__(v44, v43) - *v68) >> 64;
              v1073 = v44 - v83 >= v81;
              v85 = v44 - v83 - v81;
              v87 = !v1073 || v84 > v44;
              v1230 = v87;
              v1231 = v68;
              v88 = v74 | ((unint64_t)v75 << 32);
              v89 = v78 | ((unint64_t)v79 << 32);
              v90 = v72 + v88;
              v91 = __CFADD__(v72, v88) + v89;
              LODWORD(v92) = __CFADD__(__CFADD__(v72, v88), v89);
              v1073 = __CFADD__(v76, v91);
              v93 = v76 + v91;
              if (v1073)
                v92 = 1;
              else
                v92 = v92;
              v94 = (unint64_t *)((char *)&bid_log_table_2 + 32 * v70);
              *((_QWORD *)&v96 + 1) = v80 + v92;
              *(_QWORD *)&v96 = v93;
              v95 = v96 >> 62;
              *((_QWORD *)&v96 + 1) = v93;
              *(_QWORD *)&v96 = v90;
              v97 = ~(4 * v90);
              v98 = ~(4 * v90);
              v99 = HIDWORD(v97);
              v1223 = ((HIDWORD(v97) * (unint64_t)v98) >> 32)
                    + HIDWORD(v97) * (unint64_t)HIDWORD(v97)
                    + ((HIDWORD(v97) * (unint64_t)v98
                      + HIDWORD(v97) * v98
                      + ((v97 * (unint64_t)v97) >> 32)) >> 32);
              v100 = ~(unint64_t)(v96 >> 62);
              v101 = HIDWORD(v100);
              v102 = ~(v96 >> 62) * (unint64_t)HIDWORD(v97);
              v103 = ~(v96 >> 62);
              v104 = HIDWORD(v100) * (unint64_t)v98;
              v1242 = v98;
              v105 = ~(v96 >> 62) * (unint64_t)v97;
              v106 = v104 + v103 * HIDWORD(v97) + HIDWORD(v105);
              v107 = HIDWORD(v102) + HIDWORD(v100) * (unint64_t)HIDWORD(v97) + HIDWORD(v106);
              v108 = (unint64_t)~v95 >> 32;
              v109 = ~v95;
              v110 = ~(_DWORD)v95 * (unint64_t)HIDWORD(v97);
              v111 = ~(_DWORD)v95;
              v112 = v108 * (unint64_t)v98;
              v113 = v109 * (unint64_t)v97;
              v114 = v109;
              v115 = v112 + v110 + HIDWORD(v113);
              v116 = HIDWORD(v110) + v108 * (unint64_t)HIDWORD(v97) + HIDWORD(v115);
              v117 = v102 + v104 + HIDWORD(v105);
              v118 = HIDWORD(v104) + HIDWORD(v100) * (unint64_t)HIDWORD(v97) + HIDWORD(v117);
              v119 = v94[1];
              v1229 = v94;
              v120 = __PAIR128__(v85, v82) - *v94;
              v1228 = *((_QWORD *)&v120 + 1) - v119;
              v121 = *((_QWORD *)&v120 + 1) < v119 || *((_QWORD *)&v120 + 1) > v85;
              v122 = HIDWORD(v100) * (unint64_t)v103;
              v123 = v105 | ((unint64_t)v106 << 32);
              v124 = v113 | ((unint64_t)v115 << 32);
              v125 = v121;
              v1227 = v125;
              v126 = v1223 + v123;
              v1073 = __CFADD__(__CFADD__(v1223, v123), v124);
              v127 = __CFADD__(v1223, v123) + v124;
              LODWORD(v128) = v1073;
              v1073 = __CFADD__(v107, v127);
              v129 = v107 + v127;
              v130 = v100;
              v1247 = v100;
              v131 = v122 + v122 + ((v130 * (unint64_t)v130) >> 32);
              v132 = HIDWORD(v122) + HIDWORD(v100) * (unint64_t)HIDWORD(v100) + HIDWORD(v131);
              if (v1073)
                v128 = 1;
              else
                v128 = v128;
              v133 = v116 + v128;
              v134 = v105 | ((unint64_t)v117 << 32);
              v135 = (v100 * v100) | ((unint64_t)v131 << 32);
              v136 = v111 * (unint64_t)v101;
              v137 = v108 * (unint64_t)v103;
              v138 = v114 * (unint64_t)v130;
              v139 = v137 + v136 + HIDWORD(v138);
              v140 = v101;
              v141 = HIDWORD(v136) + v108 * (unint64_t)v101 + HIDWORD(v139);
              v142 = v138 | ((unint64_t)v139 << 32);
              v143 = __PAIR128__(v142, v118) + v135;
              v144 = __CFADD__(__CFADD__(v118, v135), v142);
              v1073 = __CFADD__(v132, *((_QWORD *)&v143 + 1));
              v145 = v132 + *((_QWORD *)&v143 + 1);
              v146 = v1073 || v144;
              v147 = v141 + v146;
              v148 = v110 + v112 + HIDWORD(v113);
              v149 = HIDWORD(v112) + v108 * (unint64_t)HIDWORD(v97) + HIDWORD(v148);
              v150 = v136 + v137 + HIDWORD(v138);
              v151 = v140;
              v152 = HIDWORD(v137) + v108 * (unint64_t)v140 + HIDWORD(v150);
              v153 = v113 | ((unint64_t)v148 << 32);
              v154 = v138 | ((unint64_t)v150 << 32);
              v155 = v108 * (unint64_t)v111;
              v156 = v114;
              v157 = v155 + v155 + ((v114 * (unint64_t)v114) >> 32);
              v158 = HIDWORD(v155) + v108 * (unint64_t)v108 + HIDWORD(v157);
              v159 = (v114 * v114) | ((unint64_t)v157 << 32);
              v160 = v149 + v154;
              v1073 = __CFADD__(__CFADD__(v149, v154), v159);
              v161 = __CFADD__(v149, v154) + v159;
              v162 = v1073;
              v1073 = __CFADD__(v152, v161);
              v163 = v152 + v161;
              if (v1073)
                v164 = 1;
              else
                v164 = v162;
              v165 = __CFADD__(v134, v126) + (_QWORD)v143;
              LODWORD(v166) = __CFADD__(__CFADD__(v134, v126), (_QWORD)v143);
              v1073 = __CFADD__(v129, v165);
              v167 = v129 + v165;
              if (v1073)
                v166 = 1;
              else
                v166 = v166;
              v1073 = __CFADD__(v145, v166);
              v168 = v145 + v166;
              LODWORD(v169) = v1073;
              v1073 = __CFADD__(v133, v168);
              v170 = v133 + v168;
              if (v1073)
                v169 = 1;
              else
                v169 = v169;
              v171 = v147 + v169;
              v1073 = __CFADD__(__CFADD__(v153, v167), v160);
              v172 = __CFADD__(v153, v167) + v160;
              v173 = v1073;
              v174 = v170 + v172;
              if (__CFADD__(v170, v172))
                v175 = 1;
              else
                v175 = v173;
              v1073 = __CFADD__(v163, v175);
              v176 = v163 + v175;
              LODWORD(v177) = v1073;
              v1073 = __CFADD__(v171, v176);
              v178 = v171 + v176;
              v179 = HIDWORD(v178);
              v180 = v158 + v164;
              if (v1073)
                v177 = 1;
              else
                v177 = v177;
              v181 = v180 + v177;
              v182 = (v178 >> 1) | (HIDWORD(v178) << 31) | ((v180 + v177) << 63);
              v183 = v174;
              v184 = HIDWORD(v174);
              v1197 = v97 + ((unint64_t)v174 >> 1) + (HIDWORD(v174) << 31) + (v178 << 63);
              v185 = ((HIDWORD(v174) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v174) * (unint64_t)HIDWORD(v97)
                   + ((v174 * (unint64_t)HIDWORD(v97)
                     + HIDWORD(v174) * v1242
                     + ((v174 * (unint64_t)v97) >> 32)) >> 32);
              v186 = HIDWORD(v174) * (unint64_t)v103;
              v187 = v1197 < v97;
              v1073 = __CFADD__(v187, v1247);
              v188 = v187 + v1247;
              v189 = v1073;
              v1073 = __CFADD__(v182, v188);
              v1190 = v182 + v188;
              v190 = v174 * (unint64_t)v151
                   + v186
                   + ((v174 * (unint64_t)v1247) >> 32);
              v191 = HIDWORD(v186) + HIDWORD(v174) * (unint64_t)v151 + HIDWORD(v190);
              v192 = (v174 * v1247) | ((unint64_t)v190 << 32);
              v1213 = HIDWORD(v174) * (unint64_t)v111;
              v193 = v156;
              v194 = v174 * (unint64_t)v156;
              v195 = v183 * (unint64_t)v108 + v1213 + HIDWORD(v194);
              if (v1073)
                v196 = 1;
              else
                v196 = v189;
              v1224 = v196;
              v197 = v194 | ((unint64_t)v195 << 32);
              v1184 = v185 + v192;
              v1073 = __CFADD__(__CFADD__(v185, v192), v197);
              v198 = __CFADD__(v185, v192) + v197;
              v199 = v1073;
              v1073 = __CFADD__(v191, v198);
              v1203 = v195;
              v1208 = v191 + v198;
              v200 = v178;
              v201 = HIDWORD(v178) * (unint64_t)v1242;
              v202 = v97;
              v1236 = v97;
              v203 = v178 * (unint64_t)HIDWORD(v97)
                   + v201
                   + ((v178 * (unint64_t)v97) >> 32);
              v204 = HIDWORD(v201) + HIDWORD(v178) * (unint64_t)HIDWORD(v97) + HIDWORD(v203);
              v205 = (v178 * v97) | ((unint64_t)v203 << 32);
              v206 = HIDWORD(v178) * (unint64_t)v103;
              v207 = v103;
              v1240 = v103;
              v208 = v151;
              v209 = v178 * (unint64_t)v151
                   + v206
                   + ((v178 * (unint64_t)v1247) >> 32);
              v210 = HIDWORD(v206) + HIDWORD(v178) * (unint64_t)v208 + HIDWORD(v209);
              v211 = (v178 * v1247) | ((unint64_t)v209 << 32);
              if (v1073)
                v212 = 1;
              else
                v212 = v199;
              v1178 = v212;
              v1073 = __CFADD__(v204, v211);
              v213 = v204 + v211;
              v214 = v111;
              v1241 = v111;
              v215 = HIDWORD(v178) * (unint64_t)v111;
              v216 = v178 * (unint64_t)v193;
              v217 = v193;
              v1237 = v208;
              v1238 = v193;
              v218 = v200 * (unint64_t)v108 + v215 + HIDWORD(v216);
              v219 = v216 | ((unint64_t)v218 << 32);
              v221 = v1073;
              v1073 = __CFADD__(v1073, v219);
              v220 = v221 + v219;
              LODWORD(v222) = v1073;
              v1073 = __CFADD__(v210, v220);
              v223 = v210 + v220;
              v224 = HIDWORD(v181);
              v225 = v181;
              v226 = HIDWORD(v181) * (unint64_t)v207;
              v227 = v181 * (unint64_t)v208
                   + v226
                   + ((v181 * (unint64_t)v1247) >> 32);
              v228 = HIDWORD(v226) + HIDWORD(v181) * (unint64_t)v208 + HIDWORD(v227);
              v229 = (v181 * v1247) | ((unint64_t)v227 << 32);
              v230 = HIDWORD(v181) * (unint64_t)v1242;
              v1218 = HIDWORD(v181);
              v1221 = v181;
              v231 = v181 * (unint64_t)v202;
              v232 = v181 * (unint64_t)v99 + v230 + HIDWORD(v231);
              v233 = HIDWORD(v230) + HIDWORD(v181) * (unint64_t)v99 + HIDWORD(v232);
              if (v1073)
                v222 = 1;
              else
                v222 = v222;
              v1073 = __CFADD__(v233, v229);
              v234 = v233 + v229;
              v235 = HIDWORD(v181) * (unint64_t)v214;
              v236 = v181 * (unint64_t)v217;
              v237 = v225 * (unint64_t)v108 + v235 + HIDWORD(v236);
              v238 = v236 | ((unint64_t)v237 << 32);
              v240 = v1073;
              v1073 = __CFADD__(v1073, v238);
              v239 = v240 + v238;
              LODWORD(v241) = v1073;
              v1073 = __CFADD__(v228, v239);
              v242 = v228 + v239;
              if (v1073)
                v241 = 1;
              else
                v241 = v241;
              v1235 = v108;
              v243 = HIDWORD(v1213) + v184 * (unint64_t)v108 + HIDWORD(v1203) + v1178;
              v244 = HIDWORD(v215) + v179 * (unint64_t)v108 + HIDWORD(v218) + v222;
              v245 = v231 | ((unint64_t)v232 << 32);
              v246 = HIDWORD(v235) + v224 * (unint64_t)v108 + HIDWORD(v237) + v241;
              v247 = __CFADD__(v205, v1184) + v213;
              LODWORD(v248) = __CFADD__(__CFADD__(v205, v1184), v213);
              v1073 = __CFADD__(v247, v1208);
              v249 = v247 + v1208;
              if (v1073)
                v248 = 1;
              else
                v248 = v248;
              v1073 = __CFADD__(v223, v248);
              v250 = v223 + v248;
              v251 = v1073;
              v1073 = __CFADD__(v243, v250);
              v252 = v243 + v250;
              if (v1073)
                v253 = 1;
              else
                v253 = v251;
              v254 = v244 + v253;
              v1073 = __CFADD__(__CFADD__(v245, v249), v234);
              v255 = __CFADD__(v245, v249) + v234;
              v256 = v1073;
              v257 = v252 + v255;
              if (__CFADD__(v252, v255))
                v258 = 1;
              else
                v258 = v256;
              v1073 = __CFADD__(v242, v258);
              v259 = v242 + v258;
              v260 = v1073;
              v261 = v254 + v259;
              if (__CFADD__(v254, v259))
                v262 = 1;
              else
                v262 = v260;
              v263 = v246 + v262;
              v264 = 1431655765 * HIDWORD(v257);
              v265 = 1431655765 * v257
                   + v264
                   + ((1431655765 * (unint64_t)v257) >> 32);
              v266 = HIDWORD(v264) + v264 + HIDWORD(v265);
              v267 = (1431655765 * v257) | ((unint64_t)v265 << 32);
              v268 = 1431655765 * HIDWORD(v261);
              v269 = 1431655765 * v261
                   + v268
                   + ((1431655765 * (unint64_t)v261) >> 32);
              v270 = HIDWORD(v268) + v268 + HIDWORD(v269);
              v271 = (1431655765 * v261) | ((unint64_t)v269 << 32);
              v272 = HIDWORD(v263);
              v273 = 1431655765 * HIDWORD(v263);
              v274 = HIDWORD(v273) + v273;
              v1173 = v263;
              v1179 = v263;
              v275 = 1431655765 * v263
                   + v273
                   + ((1431655765 * (unint64_t)v263) >> 32);
              v276 = v274 + HIDWORD(v275);
              v1209 = v276;
              v277 = (1431655765 * v263) | ((unint64_t)v275 << 32);
              v278 = v267 + v266;
              v1073 = __CFADD__(__CFADD__(v267, v266), v267);
              v279 = __CFADD__(v267, v266) + v267;
              LODWORD(v280) = v1073;
              v1073 = __CFADD__(v279, v266);
              v281 = v279 + v266;
              if (v1073)
                v280 = 1;
              else
                v280 = v280;
              v282 = v271 + v270;
              v283 = __CFADD__(v271, v270) + v271;
              LODWORD(v284) = __CFADD__(__CFADD__(v271, v270), v271);
              v1073 = __CFADD__(v283, v270);
              v285 = v283 + v270;
              if (v1073)
                v284 = 1;
              else
                v284 = v284;
              v286 = v277 + v276;
              v287 = __CFADD__(v277, v276) + v277;
              v288 = __CFADD__(__CFADD__(v277, v276), v277);
              v289 = v287 + v276;
              v290 = __CFADD__(v287, v276) || v288;
              v1214 = v290;
              v291 = v266 + v280;
              v292 = __CFADD__(v271, v278) + v282;
              v293 = __CFADD__(__CFADD__(v271, v278), v282);
              v1073 = __CFADD__(v292, v281);
              v294 = v292 + v281;
              v295 = v1073 || v293;
              v1073 = __CFADD__(v285, v295);
              v296 = v285 + v295;
              v297 = v1073;
              v1073 = __CFADD__(v291, v296);
              v298 = v291 + v296;
              if (v1073)
                v299 = 1;
              else
                v299 = v297;
              v1073 = __CFADD__(v277, v294);
              v300 = v270 + v284 + v299;
              v301 = v1073 + v286;
              v302 = __CFADD__(v1073, v286);
              v1073 = __CFADD__(v298, v301);
              v303 = v298 + v301;
              v304 = v1073 || v302;
              v305 = v289 + v304;
              v306 = __CFADD__(v289, v304);
              v1073 = __CFADD__(v300, v305);
              v307 = v300 + v305;
              v308 = v1073 || v306;
              v1204 = v308;
              v1185 = v303 + v1197;
              v309 = __CFADD__(v303, v1197) + v1190;
              LODWORD(v310) = __CFADD__(__CFADD__(v303, v1197), v1190);
              v1073 = __CFADD__(v307, v309);
              v1191 = v307 + v309;
              v311 = ((HIDWORD(v257) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v257) * (unint64_t)v99
                   + ((v257 * (unint64_t)v99
                     + HIDWORD(v257) * v1242
                     + ((v257 * (unint64_t)v1236) >> 32)) >> 32);
              v312 = HIDWORD(v257) * (unint64_t)v1240;
              v1163 = HIDWORD(v257);
              v313 = v257 * (unint64_t)v1237
                   + v312
                   + ((v257 * (unint64_t)v1247) >> 32);
              v314 = HIDWORD(v312) + HIDWORD(v257) * (unint64_t)v1237 + HIDWORD(v313);
              v315 = (v257 * v1247) | ((unint64_t)v313 << 32);
              if (v1073)
                v310 = 1;
              else
                v310 = v310;
              v1198 = v310;
              v1155 = v311 + v315;
              v316 = HIDWORD(v257) * (unint64_t)v1241;
              v1159 = v257 * (unint64_t)v1235
                    + v316
                    + ((v257 * (unint64_t)v1238) >> 32);
              v317 = (v257 * v1238) | ((unint64_t)v1159 << 32);
              v1073 = __CFADD__(__CFADD__(v311, v315), v317);
              v318 = __CFADD__(v311, v315) + v317;
              v319 = v1073;
              v1073 = __CFADD__(v314, v318);
              v1151 = v314 + v318;
              v320 = HIDWORD(v261) * (unint64_t)v1242;
              v321 = v261 * (unint64_t)v99
                   + v320
                   + ((v261 * (unint64_t)v1236) >> 32);
              v322 = HIDWORD(v320) + HIDWORD(v261) * (unint64_t)v99 + HIDWORD(v321);
              v323 = (v261 * v1236) | ((unint64_t)v321 << 32);
              v324 = HIDWORD(v261) * (unint64_t)v1240;
              v325 = v261 * (unint64_t)v1237
                   + v324
                   + ((v261 * (unint64_t)v1247) >> 32);
              v326 = HIDWORD(v324) + HIDWORD(v261) * (unint64_t)v1237 + HIDWORD(v325);
              if (v1073)
                v327 = 1;
              else
                v327 = v319;
              v328 = HIDWORD(v261) * (unint64_t)v1241;
              v329 = v261 * (unint64_t)v1235
                   + v328
                   + ((v261 * (unint64_t)v1238) >> 32);
              v330 = (v261 * v1238) | ((unint64_t)v329 << 32);
              v331 = __PAIR128__(v330, v322)
                   + ((v261 * v1247) | ((unint64_t)v325 << 32));
              LODWORD(v332) = __CFADD__(__CFADD__(v322, (v261 * v1247) | ((unint64_t)v325 << 32)), v330);
              v1073 = __CFADD__(v326, *((_QWORD *)&v331 + 1));
              v333 = v326 + *((_QWORD *)&v331 + 1);
              v334 = v272 * (unint64_t)v1240;
              v335 = v1173 * (unint64_t)v1237
                   + v334
                   + ((v1179 * (unint64_t)v1247) >> 32);
              v336 = HIDWORD(v334) + v272 * (unint64_t)v1237 + HIDWORD(v335);
              v337 = (v1179 * v1247) | ((unint64_t)v335 << 32);
              if (v1073)
                v332 = 1;
              else
                v332 = v332;
              v338 = v272 * (unint64_t)v1242;
              v339 = v1173 * (unint64_t)v99
                   + v338
                   + ((v1179 * (unint64_t)v1236) >> 32);
              v340 = HIDWORD(v338) + v272 * (unint64_t)v99 + HIDWORD(v339);
              v1073 = __CFADD__(v340, v337);
              v341 = v340 + v337;
              v342 = v272 * (unint64_t)v1241;
              v343 = v1173 * (unint64_t)v1235
                   + v342
                   + ((v1179 * (unint64_t)v1238) >> 32);
              v344 = (v1179 * v1238) | ((unint64_t)v343 << 32);
              v346 = v1073;
              v1073 = __CFADD__(v1073, v344);
              v345 = v346 + v344;
              LODWORD(v347) = v1073;
              v1073 = __CFADD__(v336, v345);
              v348 = v336 + v345;
              if (v1073)
                v347 = 1;
              else
                v347 = v347;
              v349 = HIDWORD(v316) + v1163 * (unint64_t)v1235 + HIDWORD(v1159) + v327;
              v350 = __CFADD__(v323, v1155) + (_QWORD)v331;
              v351 = __CFADD__(__CFADD__(v323, v1155), (_QWORD)v331);
              v1073 = __CFADD__(v350, v1151);
              v352 = v350 + v1151;
              v353 = v1073 || v351;
              v1073 = __CFADD__(v333, v353);
              v354 = v333 + v353;
              v355 = v1073;
              v1073 = __CFADD__(v349, v354);
              v356 = v349 + v354;
              if (v1073)
                v357 = 1;
              else
                v357 = v355;
              v358 = HIDWORD(v342) + v272 * (unint64_t)v1235 + HIDWORD(v343) + v347;
              v359 = HIDWORD(v328) + HIDWORD(v261) * (unint64_t)v1235 + HIDWORD(v329) + v332 + v357;
              v360 = __CFADD__((v1179 * v1236) | ((unint64_t)v339 << 32), v352) + v341;
              v361 = __CFADD__(__CFADD__((v1179 * v1236) | ((unint64_t)v339 << 32), v352), v341);
              v362 = v356 + v360;
              v363 = __CFADD__(v356, v360) || v361;
              v1073 = __CFADD__(v348, v363);
              v364 = v348 + v363;
              v365 = v1073;
              v1073 = __CFADD__(v359, v364);
              v366 = v359 + v364;
              if (v1073)
                v367 = 1;
              else
                v367 = v365;
              v368 = v358 + v367;
              v369 = HIDWORD(v362);
              v370 = v362;
              v1164 = v1185 + ((unint64_t)v362 >> 2) + (HIDWORD(v362) << 30) + (v366 << 62);
              v371 = v1164 < v1185;
              v1073 = __CFADD__(v1191, v371);
              v372 = v1191 + v371;
              v373 = (v366 >> 2) | (HIDWORD(v366) << 30) | (v368 << 62);
              v374 = v1073;
              v1073 = __CFADD__(v373, v372);
              v1160 = v373 + v372;
              v375 = ((HIDWORD(v362) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v362) * (unint64_t)v99
                   + ((v362 * (unint64_t)v99
                     + HIDWORD(v362) * v1242
                     + ((v362 * (unint64_t)v1236) >> 32)) >> 32);
              v376 = HIDWORD(v362) * (unint64_t)v1240;
              v377 = v362 * (unint64_t)v1237
                   + v376
                   + ((v362 * (unint64_t)v1247) >> 32);
              v378 = HIDWORD(v376) + HIDWORD(v362) * (unint64_t)v1237 + HIDWORD(v377);
              v379 = (v362 * v1247) | ((unint64_t)v377 << 32);
              if (v1073)
                v380 = 1;
              else
                v380 = v374;
              v1192 = v380;
              v1174 = v375 + v379;
              v381 = v362 * (unint64_t)v1238;
              v1156 = v369 * (unint64_t)v1241;
              v1152 = v370 * (unint64_t)v1235 + v1156 + HIDWORD(v381);
              v382 = v381 | ((unint64_t)v1152 << 32);
              v1073 = __CFADD__(__CFADD__(v375, v379), v382);
              v383 = __CFADD__(v375, v379) + v382;
              v384 = v1073;
              v1167 = v378 + v383;
              v385 = HIDWORD(v366) * (unint64_t)v1242;
              v1239 = v99;
              v386 = v366 * (unint64_t)v99
                   + v385
                   + ((v366 * (unint64_t)v1236) >> 32);
              v387 = HIDWORD(v385) + HIDWORD(v366) * (unint64_t)v99 + HIDWORD(v386);
              v388 = (v366 * v1236) | ((unint64_t)v386 << 32);
              v389 = HIDWORD(v366) * (unint64_t)v1240;
              v390 = v366 * (unint64_t)v1237
                   + v389
                   + ((v366 * (unint64_t)v1247) >> 32);
              v391 = HIDWORD(v389) + HIDWORD(v366) * (unint64_t)v1237 + HIDWORD(v390);
              v392 = (v366 * v1247) | ((unint64_t)v390 << 32);
              if (__CFADD__(v378, v383))
                v393 = 1;
              else
                v393 = v384;
              v1073 = __CFADD__(v387, v392);
              v394 = v387;
              v395 = HIDWORD(v366) * (unint64_t)v1241;
              v396 = v366 * (unint64_t)v1235
                   + v395
                   + ((v366 * (unint64_t)v1238) >> 32);
              v397 = (v366 * v1238) | ((unint64_t)v396 << 32);
              v398 = __PAIR128__(v397, v394) + v392;
              LODWORD(v399) = __CFADD__(v1073, v397);
              v1073 = __CFADD__(v391, *((_QWORD *)&v398 + 1));
              v400 = v391 + *((_QWORD *)&v398 + 1);
              v1186 = v368;
              v401 = HIDWORD(v368) * (unint64_t)v1240;
              v402 = v368 * (unint64_t)v1237
                   + v401
                   + ((v368 * (unint64_t)v1247) >> 32);
              v403 = HIDWORD(v401) + HIDWORD(v368) * (unint64_t)v1237 + HIDWORD(v402);
              v404 = (v368 * v1247) | ((unint64_t)v402 << 32);
              if (v1073)
                v399 = 1;
              else
                v399 = v399;
              v405 = HIDWORD(v368) * (unint64_t)v1242;
              v406 = v368 * (unint64_t)v99
                   + v405
                   + ((v368 * (unint64_t)v1236) >> 32);
              v407 = HIDWORD(v405) + HIDWORD(v368) * (unint64_t)v99 + HIDWORD(v406);
              v1073 = __CFADD__(v407, v404);
              v408 = v407 + v404;
              v409 = HIDWORD(v368) * (unint64_t)v1241;
              v1180 = HIDWORD(v368);
              v410 = v368 * (unint64_t)v1235
                   + v409
                   + ((v368 * (unint64_t)v1238) >> 32);
              v411 = (v368 * v1238) | ((unint64_t)v410 << 32);
              v413 = v1073;
              v1073 = __CFADD__(v1073, v411);
              v412 = v413 + v411;
              LODWORD(v414) = v1073;
              v1073 = __CFADD__(v403, v412);
              v415 = v403 + v412;
              if (v1073)
                v414 = 1;
              else
                v414 = v414;
              v416 = HIDWORD(v1156) + v369 * (unint64_t)v1235 + HIDWORD(v1152) + v393;
              v417 = __CFADD__(v388, v1174) + (_QWORD)v398;
              LODWORD(v418) = __CFADD__(__CFADD__(v388, v1174), (_QWORD)v398);
              v1073 = __CFADD__(v417, v1167);
              v419 = v417 + v1167;
              if (v1073)
                v418 = 1;
              else
                v418 = v418;
              v1073 = __CFADD__(v400, v418);
              v420 = v400 + v418;
              v421 = v1073;
              v1073 = __CFADD__(v416, v420);
              v422 = v416 + v420;
              if (v1073)
                v423 = 1;
              else
                v423 = v421;
              v424 = HIDWORD(v409) + HIDWORD(v368) * (unint64_t)v1235 + HIDWORD(v410) + v414;
              v425 = HIDWORD(v395) + HIDWORD(v366) * (unint64_t)v1235 + HIDWORD(v396) + v399 + v423;
              v426 = __CFADD__((v368 * v1236) | ((unint64_t)v406 << 32), v419) + v408;
              v427 = __CFADD__(__CFADD__((v368 * v1236) | ((unint64_t)v406 << 32), v419), v408);
              v428 = v422 + v426;
              v429 = __CFADD__(v422, v426) || v427;
              v1073 = __CFADD__(v415, v429);
              v430 = v415 + v429;
              v431 = v1073;
              v432 = v425 + v430;
              if (__CFADD__(v425, v430))
                v433 = 1;
              else
                v433 = v431;
              v434 = v424 + v433;
              v435 = HIDWORD(v428);
              v436 = 858993459 * HIDWORD(v428);
              v437 = HIDWORD(v436) + v436;
              v438 = 858993459 * v428
                   + v436
                   + ((858993459 * (unint64_t)v428) >> 32);
              v439 = v437 + HIDWORD(v438);
              v440 = (858993459 * v428) | ((unint64_t)v438 << 32);
              v441 = HIDWORD(v432);
              v442 = 858993459 * HIDWORD(v432);
              v443 = HIDWORD(v442) + v442;
              v444 = 858993459 * v432
                   + v442
                   + ((858993459 * (unint64_t)v432) >> 32);
              v445 = v443 + HIDWORD(v444);
              v446 = (858993459 * v432) | ((unint64_t)v444 << 32);
              v447 = HIDWORD(v434);
              v448 = 858993459 * HIDWORD(v434);
              v449 = HIDWORD(v448) + v448;
              v1143 = v434;
              v1147 = v434;
              v450 = 858993459 * v434
                   + v448
                   + ((858993459 * (unint64_t)v434) >> 32);
              v451 = v449 + HIDWORD(v450);
              v452 = (858993459 * v434) | ((unint64_t)v450 << 32);
              v453 = v440 + v439;
              v1073 = __CFADD__(__CFADD__(v440, v439), v440);
              v454 = __CFADD__(v440, v439) + v440;
              LODWORD(v455) = v1073;
              v1073 = __CFADD__(v454, v439);
              v456 = v454 + v439;
              if (v1073)
                v455 = 1;
              else
                v455 = v455;
              v457 = v446 + v445;
              v458 = __CFADD__(v446, v445) + v446;
              LODWORD(v459) = __CFADD__(__CFADD__(v446, v445), v446);
              v1073 = __CFADD__(v458, v445);
              v460 = v458 + v445;
              if (v1073)
                v459 = 1;
              else
                v459 = v459;
              v461 = v452 + v451;
              v462 = __CFADD__(v452, v451) + v452;
              LODWORD(v463) = __CFADD__(__CFADD__(v452, v451), v452);
              v1073 = __CFADD__(v462, v451);
              v464 = v462 + v451;
              if (v1073)
                v463 = 1;
              else
                v463 = v463;
              v1168 = v451;
              v1175 = v463;
              v465 = v439 + v455;
              v466 = __CFADD__(v446, v453) + v457;
              v467 = __CFADD__(__CFADD__(v446, v453), v457);
              v1073 = __CFADD__(v466, v456);
              v468 = v466 + v456;
              v469 = v1073 || v467;
              v1073 = __CFADD__(v460, v469);
              v470 = v460 + v469;
              v471 = v1073;
              v1073 = __CFADD__(v465, v470);
              v472 = v465 + v470;
              if (v1073)
                v473 = 1;
              else
                v473 = v471;
              v1073 = __CFADD__(v452, v468);
              v474 = v445 + v459 + v473;
              v476 = v1073;
              v1073 = __CFADD__(v1073, v461);
              v475 = v476 + v461;
              v477 = v1073;
              v1073 = __CFADD__(v472, v475);
              v478 = v472 + v475;
              if (v1073)
                v479 = 1;
              else
                v479 = v477;
              v1073 = __CFADD__(v464, v479);
              v480 = v464 + v479;
              LODWORD(v481) = v1073;
              v1073 = __CFADD__(v474, v480);
              v482 = v474 + v480;
              if (v1073)
                v481 = 1;
              else
                v481 = v481;
              v1157 = v481;
              v483 = __PAIR128__(v1160, v478) + v1164;
              v484 = __CFADD__(__CFADD__(v478, v1164), v1160);
              v1073 = __CFADD__(v482, *((_QWORD *)&v483 + 1));
              v1161 = v482 + *((_QWORD *)&v483 + 1);
              v485 = ((HIDWORD(v428) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v428) * (unint64_t)v1239
                   + ((v428 * (unint64_t)v1239
                     + HIDWORD(v428) * v1242
                     + ((v428 * (unint64_t)v1236) >> 32)) >> 32);
              v486 = HIDWORD(v428) * (unint64_t)v1240;
              v487 = v428 * (unint64_t)v1237
                   + v486
                   + ((v428 * (unint64_t)v1247) >> 32);
              v488 = HIDWORD(v486) + HIDWORD(v428) * (unint64_t)v1237 + HIDWORD(v487);
              v489 = (v428 * v1247) | ((unint64_t)v487 << 32);
              v490 = v1073 || v484;
              v1153 = v490;
              v1073 = __CFADD__(v485, v489);
              v1141 = v485 + v489;
              v1136 = v428 * (unint64_t)v1235
                    + HIDWORD(v428) * v1241
                    + ((v428 * (unint64_t)v1238) >> 32);
              v491 = (v428 * v1238) | ((unint64_t)v1136 << 32);
              v493 = v1073;
              v1073 = __CFADD__(v1073, v491);
              v492 = v493 + v491;
              v494 = v1073;
              v1073 = __CFADD__(v488, v492);
              v1138 = v488 + v492;
              v495 = HIDWORD(v432) * (unint64_t)v1242;
              v496 = v432 * (unint64_t)v1239
                   + v495
                   + ((v432 * (unint64_t)v1236) >> 32);
              v497 = HIDWORD(v495) + HIDWORD(v432) * (unint64_t)v1239 + HIDWORD(v496);
              v498 = (v432 * v1236) | ((unint64_t)v496 << 32);
              v499 = HIDWORD(v432) * (unint64_t)v1240;
              v500 = v432 * (unint64_t)v1237
                   + v499
                   + ((v432 * (unint64_t)v1247) >> 32);
              v501 = HIDWORD(v499) + HIDWORD(v432) * (unint64_t)v1237 + HIDWORD(v500);
              v502 = (v432 * v1247) | ((unint64_t)v500 << 32);
              if (v1073)
                v503 = 1;
              else
                v503 = v494;
              v1073 = __CFADD__(v497, v502);
              v1135 = v497 + v502;
              v504 = HIDWORD(v432) * (unint64_t)v1241;
              v505 = v432 * (unint64_t)v1235
                   + v504
                   + ((v432 * (unint64_t)v1238) >> 32);
              v506 = (v432 * v1238) | ((unint64_t)v505 << 32);
              v508 = v1073;
              v1073 = __CFADD__(v1073, v506);
              v507 = v508 + v506;
              LODWORD(v509) = v1073;
              v1073 = __CFADD__(v501, v507);
              v510 = v501 + v507;
              v511 = v447 * (unint64_t)v1240;
              v512 = v1143 * (unint64_t)v1237
                   + v511
                   + ((v1147 * (unint64_t)v1247) >> 32);
              v513 = HIDWORD(v511) + v447 * (unint64_t)v1237 + HIDWORD(v512);
              v514 = (v1147 * v1247) | ((unint64_t)v512 << 32);
              if (v1073)
                v509 = 1;
              else
                v509 = v509;
              v515 = v447 * (unint64_t)v1242;
              v516 = v1143 * (unint64_t)v1239 + v515 + ((v1147 * (unint64_t)v1236) >> 32);
              v517 = HIDWORD(v515) + v447 * (unint64_t)v1239 + HIDWORD(v516);
              v1073 = __CFADD__(v517, v514);
              v518 = v517 + v514;
              v519 = v447 * (unint64_t)v1241;
              v520 = v1143 * (unint64_t)v1235
                   + v519
                   + ((v1147 * (unint64_t)v1238) >> 32);
              v521 = (v1147 * v1238) | ((unint64_t)v520 << 32);
              v523 = v1073;
              v1073 = __CFADD__(v1073, v521);
              v522 = v523 + v521;
              v524 = v1073;
              v1073 = __CFADD__(v513, v522);
              v525 = v513 + v522;
              if (v1073)
                v526 = 1;
              else
                v526 = v524;
              v527 = ((v435 * (unint64_t)v1241) >> 32)
                   + v435 * (unint64_t)v1235
                   + HIDWORD(v1136)
                   + v503;
              v528 = __CFADD__(v498, v1141) + v1135;
              v529 = __CFADD__(__CFADD__(v498, v1141), v1135);
              v530 = v528 + v1138;
              v531 = __CFADD__(v528, v1138) || v529;
              v1073 = __CFADD__(v510, v531);
              v532 = v510 + v531;
              v533 = v1073;
              v1073 = __CFADD__(v527, v532);
              v534 = v527 + v532;
              if (v1073)
                v535 = 1;
              else
                v535 = v533;
              v1073 = __CFADD__((v1147 * v1236) | ((unint64_t)v516 << 32), v530);
              v536 = HIDWORD(v519) + v447 * (unint64_t)v1235 + HIDWORD(v520) + v526;
              v537 = HIDWORD(v504) + v441 * (unint64_t)v1235 + HIDWORD(v505) + v509 + v535;
              v538 = v1073 + v518;
              v539 = __CFADD__(v1073, v518);
              v540 = v534 + v538;
              v541 = __CFADD__(v534, v538) || v539;
              v1073 = __CFADD__(v525, v541);
              v542 = v525 + v541;
              v543 = v1073;
              v544 = v537 + v542;
              if (__CFADD__(v537, v542))
                v545 = 1;
              else
                v545 = v543;
              v546 = v536 + v545;
              v547 = HIDWORD(v540);
              v548 = 2863311530 * v540;
              v549 = ((2863311531u * (unint64_t)HIDWORD(v540)) >> 32)
                   + 2863311530 * HIDWORD(v540)
                   + ((v548
                     + (-1431655765 * HIDWORD(v540))
                     + ((2863311531u * (unint64_t)v540) >> 32)) >> 32);
              v550 = (2863311530u * (unint64_t)HIDWORD(v540)) >> 32;
              v551 = (-1431655766 * HIDWORD(v540)) + HIDWORD(v548);
              v552 = v551 + v548;
              v553 = v550 + 2863311530 * HIDWORD(v540) + ((v551 + v548) >> 32);
              v554 = v548 & 0xFFFFFFFE;
              v555 = v554 | (v552 << 32);
              v1073 = __CFADD__(v549, v555);
              v1137 = v549 + v555;
              v556 = v551 + 715827882 * v540;
              v557 = (v556 << 32) + v1073 + v554;
              v1139 = v553 + v557;
              v1142 = HIDWORD(v556) + __CFADD__(v553, v557) + v550 + 715827882 * HIDWORD(v540);
              v1144 = v544;
              LODWORD(v556) = v544;
              v558 = HIDWORD(v544);
              v559 = 2863311531 * v558;
              v560 = HIDWORD(v559) + 2863311530 * v558;
              v561 = v556;
              v562 = 2863311530 * v556;
              v563 = v562 + v559 + ((2863311531u * (unint64_t)v556) >> 32);
              v564 = v560 + HIDWORD(v563);
              v565 = (-1431655765 * v556) | ((unint64_t)v563 << 32);
              v566 = (2863311530u * (unint64_t)v558) >> 32;
              v567 = (-1431655766 * v558) + HIDWORD(v562);
              v568 = v567 + v562;
              v569 = v566 + 2863311530 * v558 + ((v567 + v562) >> 32);
              v570 = v562 & 0xFFFFFFFE;
              v571 = v570 | (v568 << 32);
              v1073 = __CFADD__(v564, v571);
              v572 = v564 + v571;
              v573 = __PAIR128__(v566 + 715827882 * v558, v569)
                   + __PAIR128__((v567 + 715827882 * v556) >> 32, ((v567 + 715827882 * v556) << 32) + v1073 + v570);
              v1148 = v546;
              v574 = HIDWORD(v546);
              v575 = v546;
              v576 = 2863311531 * HIDWORD(v546);
              v577 = 2863311531 * v546;
              v578 = HIDWORD(v576) + 2863311530 * HIDWORD(v546);
              v579 = 2863311530 * v546;
              v580 = v579 + v576 + HIDWORD(v577);
              v581 = v578 + HIDWORD(v580);
              v582 = 2863311530 * HIDWORD(v546);
              v583 = (-1431655766 * HIDWORD(v546)) + HIDWORD(v579);
              v584 = (-1431655766 * v546);
              v585 = v583 + 2863311530 * v546;
              v586 = v584 | (v585 << 32);
              v1073 = __CFADD__(v581, v586);
              v587 = v581 + v586;
              v588 = v583 + 715827882 * v575;
              v589 = (v588 << 32) + v1073 + v584;
              v590 = v577 | ((unint64_t)v580 << 32);
              v1073 = __CFADD__(__CFADD__(v565, v1137), v572);
              v591 = __CFADD__(v565, v1137) + v572;
              LODWORD(v592) = v1073;
              v1073 = __CFADD__(v591, v1139);
              v593 = v591 + v1139;
              if (v1073)
                v592 = 1;
              else
                v592 = v592;
              v594 = v573 + v592;
              LODWORD(v595) = __CFADD__((_QWORD)v573, v592);
              v1073 = __CFADD__(v1142, v594);
              v596 = v1142 + v594;
              if (v1073)
                v595 = 1;
              else
                v595 = v595;
              v597 = HIDWORD(v582) + 2863311530 * v574 + HIDWORD(v585);
              v598 = v596 + __CFADD__(v590, v593) + v587;
              v1225 = (__PAIR128__(v1238+ (v1221 >> 1)+ (v1218 << 31)+ v1224+ v1209+ v1214+ v1204+ v1198+ (v1186 >> 2)+ (v1180 << 30)+ v1192+ v1168+ v1175+ v1157+ v1153+ 715827882 * v574+ HIDWORD(v582), v597)+ __PAIR128__(HIDWORD(v588), v589)) >> 64;
              v599 = *((_QWORD *)&v573 + 1) + v595 + v597 + v589 + v573;
              v1219 = v598 + v483;
              v600 = __CFADD__(v598, (_QWORD)v483) + v1161;
              LODWORD(v601) = __CFADD__(__CFADD__(v598, (_QWORD)v483), v1161);
              v1073 = __CFADD__(v599, v600);
              v1215 = v599 + v600;
              v602 = ((HIDWORD(v540) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v540) * (unint64_t)v1239
                   + ((v540 * (unint64_t)v1239
                     + HIDWORD(v540) * v1242
                     + ((v540 * (unint64_t)v1236) >> 32)) >> 32);
              v603 = HIDWORD(v540) * (unint64_t)v1240;
              v604 = v540 * (unint64_t)v1237
                   + v603
                   + ((v540 * (unint64_t)v1247) >> 32);
              v605 = HIDWORD(v603) + HIDWORD(v540) * (unint64_t)v1237 + HIDWORD(v604);
              v606 = (v540 * v1247) | ((unint64_t)v604 << 32);
              if (v1073)
                v601 = 1;
              else
                v601 = v601;
              v1205 = v602 + v606;
              v1210 = v601;
              v1181 = v540 * (unint64_t)v1235
                    + HIDWORD(v540) * v1241
                    + ((v540 * (unint64_t)v1238) >> 32);
              v607 = (v540 * v1238) | ((unint64_t)v1181 << 32);
              v1073 = __CFADD__(__CFADD__(v602, v606), v607);
              v608 = __CFADD__(v602, v606) + v607;
              v609 = v1073;
              v1073 = __CFADD__(v605, v608);
              v1193 = v605 + v608;
              v610 = v558 * (unint64_t)v1242;
              v611 = v561 * (unint64_t)v1239 + v610 + ((v1144 * (unint64_t)v1236) >> 32);
              v612 = HIDWORD(v610) + v558 * (unint64_t)v1239 + HIDWORD(v611);
              v613 = (v1144 * v1236) | ((unint64_t)v611 << 32);
              v614 = v558 * (unint64_t)v1240;
              v615 = v561 * (unint64_t)v1237
                   + v614
                   + ((v1144 * (unint64_t)v1247) >> 32);
              v616 = HIDWORD(v614) + v558 * (unint64_t)v1237 + HIDWORD(v615);
              v617 = (v1144 * v1247) | ((unint64_t)v615 << 32);
              if (v1073)
                v618 = 1;
              else
                v618 = v609;
              v1073 = __CFADD__(v612, v617);
              v619 = v612 + v617;
              v620 = v561 * (unint64_t)v1235;
              v621 = v558 * (unint64_t)v1241;
              v622 = v620 + v621 + ((v1144 * (unint64_t)v1238) >> 32);
              v623 = (v1144 * v1238) | ((unint64_t)v622 << 32);
              v625 = v1073;
              v1073 = __CFADD__(v1073, v623);
              v624 = v625 + v623;
              v626 = v1073;
              v1073 = __CFADD__(v616, v624);
              v627 = v616 + v624;
              v628 = v574 * (unint64_t)v1240;
              v629 = v575 * (unint64_t)v1237
                   + v628
                   + ((v1148 * (unint64_t)v1247) >> 32);
              v630 = HIDWORD(v628) + v574 * (unint64_t)v1237 + HIDWORD(v629);
              v631 = (v1148 * v1247) | ((unint64_t)v629 << 32);
              if (v1073)
                v632 = 1;
              else
                v632 = v626;
              v633 = v574 * (unint64_t)v1242;
              v634 = v575 * (unint64_t)v1239 + v633 + ((v1148 * (unint64_t)v1236) >> 32);
              v635 = HIDWORD(v633) + v574 * (unint64_t)v1239 + HIDWORD(v634);
              v1073 = __CFADD__(v635, v631);
              v636 = v635 + v631;
              v637 = v574 * (unint64_t)v1241;
              v638 = v575 * (unint64_t)v1235
                   + v637
                   + ((v1148 * (unint64_t)v1238) >> 32);
              v639 = (v1148 * v1238) | ((unint64_t)v638 << 32);
              v641 = v1073;
              v1073 = __CFADD__(v1073, v639);
              v640 = v641 + v639;
              v642 = v1073;
              v1073 = __CFADD__(v630, v640);
              v643 = v630 + v640;
              if (v1073)
                v644 = 1;
              else
                v644 = v642;
              v1199 = v644;
              v645 = ((v547 * (unint64_t)v1241) >> 32)
                   + v547 * (unint64_t)v1235
                   + HIDWORD(v1181)
                   + v618;
              v646 = __CFADD__(v613, v1205) + v619;
              v647 = __CFADD__(__CFADD__(v613, v1205), v619);
              v648 = v646 + v1193;
              v649 = __CFADD__(v646, v1193) || v647;
              v1073 = __CFADD__(v627, v649);
              v650 = v627 + v649;
              v651 = v1073;
              v1073 = __CFADD__(v645, v650);
              v652 = v645 + v650;
              if (v1073)
                v653 = 1;
              else
                v653 = v651;
              v1073 = __CFADD__((v1148 * v1236) | ((unint64_t)v634 << 32), v648);
              v654 = HIDWORD(v621) + v558 * (unint64_t)v1235 + HIDWORD(v622) + v632 + v653;
              v655 = v1073 + v636;
              v656 = __CFADD__(v1073, v636);
              v657 = v652 + v655;
              v658 = __CFADD__(v652, v655) || v656;
              v1073 = __CFADD__(v643, v658);
              v659 = v643 + v658;
              v660 = v1073;
              v1073 = __CFADD__(v654, v659);
              v661 = v654 + v659;
              v662 = HIDWORD(v657);
              v663 = 2454267026 * v657;
              v664 = ((1227133513 * (unint64_t)HIDWORD(v657)) >> 32)
                   + 2454267026 * HIDWORD(v657)
                   + ((v663
                     + (1227133513 * HIDWORD(v657))
                     + ((1227133513 * (unint64_t)v657) >> 32)) >> 32);
              v665 = (613566756 * HIDWORD(v657))
                   + 1227133513 * v657
                   + ((613566756 * (unint64_t)v657) >> 32);
              v666 = ((613566756 * (unint64_t)HIDWORD(v657)) >> 32)
                   + 1227133513 * HIDWORD(v657)
                   + HIDWORD(v665);
              v667 = (613566756 * v657) | (v665 << 32);
              if (v1073)
                v668 = 1;
              else
                v668 = v660;
              v1073 = __CFADD__(v664, v667);
              v669 = v664 + v667;
              v670 = (-1840700270 * HIDWORD(v657)) + 613566756 * v657 + HIDWORD(v663);
              v671 = (-1840700270 * v657) | (v670 << 32);
              v673 = v1073;
              v1073 = __CFADD__(v1073, v666) | __CFADD__(v671, v1073 + v666);
              v672 = v671 + v673 + v666;
              LODWORD(v671) = v661;
              v1206 = v661;
              v674 = HIDWORD(v661);
              v675 = 1227133513 * v674;
              v676 = HIDWORD(v675) + 2454267026 * v674;
              v677 = v671;
              v678 = 2454267026 * v671;
              v679 = v678 + v675 + ((1227133513 * (unint64_t)v671) >> 32);
              v680 = v676 + HIDWORD(v679);
              v681 = (1227133513 * v671) | ((unint64_t)v679 << 32);
              v682 = (613566756 * v674) + 1227133513 * v671;
              v683 = 613566756 * v671;
              v684 = v682 + HIDWORD(v683);
              v685 = ((613566756 * (unint64_t)v674) >> 32)
                   + 1227133513 * v674
                   + HIDWORD(v684);
              v686 = v683 & 0xFFFFFFFC | (v684 << 32);
              v687 = HIDWORD(v670)
                   + v1073
                   + ((2454267026u * (unint64_t)HIDWORD(v657)) >> 32)
                   + 613566756 * HIDWORD(v657);
              v1073 = __CFADD__(v680, v686);
              v688 = v680 + v686;
              v689 = (-1840700270 * v674) + 613566756 * v677 + HIDWORD(v678);
              v690 = v678 & 0xFFFFFFFE | (v689 << 32);
              v691 = v690 + v1073 + v685;
              v692 = HIDWORD(v689)
                   + (__CFADD__(v1073, v685) | __CFADD__(v690, v1073 + v685))
                   + ((2454267026u * (unint64_t)v674) >> 32)
                   + 613566756 * v674;
              v1073 = __CFADD__(v681, v669);
              v1200 = HIDWORD(v637) + v574 * (unint64_t)v1235 + HIDWORD(v638) + v1199 + v668;
              v693 = 1227133513 * HIDWORD(v1200);
              v694 = HIDWORD(v693) + 2454267026 * HIDWORD(v1200);
              v695 = 2454267026 * v1200;
              v696 = v695 + v693 + ((1227133513 * (unint64_t)v1200) >> 32);
              v697 = v694 + HIDWORD(v696);
              v698 = (1227133513 * v1200) | ((unint64_t)v696 << 32);
              v699 = (613566756 * HIDWORD(v1200))
                   + 1227133513 * v1200
                   + ((613566756 * (unint64_t)v1200) >> 32);
              v700 = ((613566756 * (unint64_t)HIDWORD(v1200)) >> 32)
                   + 1227133513 * HIDWORD(v1200)
                   + HIDWORD(v699);
              v701 = (613566756 * v1200) | (v699 << 32);
              v702 = v1073 + v688;
              LODWORD(v703) = __CFADD__(v1073, v688);
              v1073 = __CFADD__(v702, v672);
              v704 = v702 + v672;
              if (v1073)
                v703 = 1;
              else
                v703 = v703;
              v1073 = __CFADD__(v691, v703);
              v705 = v691 + v703;
              v706 = v1073;
              v1073 = __CFADD__(v687, v705);
              v707 = v687 + v705;
              if (v1073)
                v708 = 1;
              else
                v708 = v706;
              v1073 = __CFADD__(v697, v701);
              v709 = v697;
              v710 = (-1840700270 * HIDWORD(v1200)) + 613566756 * v1200 + HIDWORD(v695);
              v711 = (-1840700270 * v1200) | (v710 << 32);
              v713 = v709 + v701;
              v1073 = __CFADD__(v1073, v700) | __CFADD__(v711, (__PAIR128__(v700, v709) + v701) >> 64);
              v712 = v711 + ((__PAIR128__(v700, v709) + v701) >> 64);
              v714 = HIDWORD(v710)
                   + v1073
                   + v1225
                   + *((_QWORD *)&v483 + 1)
                   + v1210
                   + 613566756 * HIDWORD(v1200)
                   + ((2454267026u * (unint64_t)HIDWORD(v1200)) >> 32);
              v715 = v692 + v708;
              v716 = __CFADD__(v698, v704) + v709 + v701;
              LODWORD(v717) = __CFADD__(__CFADD__(v698, v704), v713);
              v1073 = __CFADD__(v707, v716);
              v718 = v707 + v716;
              if (v1073)
                v717 = 1;
              else
                v717 = v717;
              v1073 = __CFADD__(v712, v717);
              v719 = v712 + v717;
              v720 = v1073;
              v1073 = __CFADD__(v715, v719);
              v721 = v715 + v719;
              if (v1073)
                v722 = 1;
              else
                v722 = v720;
              v1222 = v722;
              v1226 = v714;
              v1211 = v718 + v1219;
              v1073 = __CFADD__(__CFADD__(v718, v1219), v1215);
              v723 = __CFADD__(v718, v1219) + v1215;
              v724 = v1073;
              v1073 = __CFADD__(v721, v723);
              v1216 = v721 + v723;
              v725 = ((HIDWORD(v657) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v657) * (unint64_t)v1239
                   + ((v657 * (unint64_t)v1239
                     + HIDWORD(v657) * v1242
                     + ((v657 * (unint64_t)v1236) >> 32)) >> 32);
              v726 = HIDWORD(v657) * (unint64_t)v1240;
              v727 = v657 * (unint64_t)v1237
                   + v726
                   + ((v657 * (unint64_t)v1247) >> 32);
              v728 = HIDWORD(v726) + HIDWORD(v657) * (unint64_t)v1237 + HIDWORD(v727);
              v729 = (v657 * v1247) | ((unint64_t)v727 << 32);
              if (v1073)
                v730 = 1;
              else
                v730 = v724;
              v1220 = v730;
              v1187 = v725 + v729;
              v1182 = HIDWORD(v657) * (unint64_t)v1241;
              v731 = v657 * (unint64_t)v1235
                   + v1182
                   + ((v657 * (unint64_t)v1238) >> 32);
              v732 = (v657 * v1238) | ((unint64_t)v731 << 32);
              v1073 = __CFADD__(__CFADD__(v725, v729), v732);
              v733 = __CFADD__(v725, v729) + v732;
              v734 = v1073;
              v1073 = __CFADD__(v728, v733);
              v1194 = v728 + v733;
              v735 = v674 * (unint64_t)v1242;
              v736 = v677 * (unint64_t)v1239 + v735 + ((v1206 * (unint64_t)v1236) >> 32);
              v737 = HIDWORD(v735) + v674 * (unint64_t)v1239 + HIDWORD(v736);
              v738 = (v1206 * v1236) | ((unint64_t)v736 << 32);
              v739 = v674 * (unint64_t)v1240;
              v740 = v677 * (unint64_t)v1237
                   + v739
                   + ((v1206 * (unint64_t)v1247) >> 32);
              v741 = HIDWORD(v739) + v674 * (unint64_t)v1237 + HIDWORD(v740);
              v742 = (v1206 * v1247) | ((unint64_t)v740 << 32);
              if (v1073)
                v743 = 1;
              else
                v743 = v734;
              v1169 = v737 + v742;
              v744 = v674 * (unint64_t)v1241;
              v745 = v677 * (unint64_t)v1235
                   + v744
                   + ((v1206 * (unint64_t)v1238) >> 32);
              v746 = (v1206 * v1238) | ((unint64_t)v745 << 32);
              v1073 = __CFADD__(__CFADD__(v737, v742), v746);
              v747 = __CFADD__(v737, v742) + v746;
              LODWORD(v748) = v1073;
              v1073 = __CFADD__(v741, v747);
              v749 = v741 + v747;
              v750 = HIDWORD(v1200) * (unint64_t)v1240;
              v751 = v1200 * (unint64_t)v1237
                   + v750
                   + ((v1200 * (unint64_t)v1247) >> 32);
              v752 = HIDWORD(v750) + HIDWORD(v1200) * (unint64_t)v1237 + HIDWORD(v751);
              v753 = (v1200 * v1247) | ((unint64_t)v751 << 32);
              if (v1073)
                v748 = 1;
              else
                v748 = v748;
              v754 = HIDWORD(v1200) * (unint64_t)v1242;
              v755 = v1200 * (unint64_t)v1239
                   + v754
                   + ((v1200 * (unint64_t)v1236) >> 32);
              v756 = HIDWORD(v754) + HIDWORD(v1200) * (unint64_t)v1239 + HIDWORD(v755);
              v1073 = __CFADD__(v756, v753);
              v757 = v756 + v753;
              v758 = HIDWORD(v1200) * (unint64_t)v1241;
              v759 = v1200 * (unint64_t)v1235
                   + v758
                   + ((v1200 * (unint64_t)v1238) >> 32);
              v760 = (v1200 * v1238) | ((unint64_t)v759 << 32);
              v762 = v1073;
              v1073 = __CFADD__(v1073, v760);
              v761 = v762 + v760;
              v763 = v1073;
              v1073 = __CFADD__(v752, v761);
              v764 = v752 + v761;
              if (v1073)
                v765 = 1;
              else
                v765 = v763;
              v766 = HIDWORD(v1182) + v662 * (unint64_t)v1235 + HIDWORD(v731) + v743;
              v767 = HIDWORD(v744) + v674 * (unint64_t)v1235 + HIDWORD(v745) + v748;
              v768 = (v1200 * v1236) | ((unint64_t)v755 << 32);
              v769 = __CFADD__(v738, v1187) + v1169;
              v770 = __CFADD__(__CFADD__(v738, v1187), v1169);
              v771 = v769 + v1194;
              v772 = __CFADD__(v769, v1194) || v770;
              v1073 = __CFADD__(v749, v772);
              v773 = v749 + v772;
              v774 = v1073;
              v1073 = __CFADD__(v766, v773);
              v775 = v766 + v773;
              if (v1073)
                v776 = 1;
              else
                v776 = v774;
              v777 = v767 + v776;
              v1073 = __CFADD__(__CFADD__(v768, v771), v757);
              v778 = __CFADD__(v768, v771) + v757;
              v779 = v1073;
              v780 = v775 + v778;
              if (__CFADD__(v775, v778))
                v781 = 1;
              else
                v781 = v779;
              v1073 = __CFADD__(v764, v781);
              v782 = v764 + v781;
              v783 = v1073;
              v1073 = __CFADD__(v777, v782);
              v784 = v777 + v782;
              if (v1073)
                v785 = 1;
              else
                v785 = v783;
              v786 = HIDWORD(v758) + HIDWORD(v1200) * (unint64_t)v1235 + HIDWORD(v759) + v765 + v785;
              v787 = HIDWORD(v780);
              v788 = v780;
              v789 = (v784 >> 3) | (HIDWORD(v784) << 29) | (v786 << 61);
              v1183 = v1211 + ((unint64_t)v780 >> 3) + (HIDWORD(v780) << 29) + (v784 << 61);
              v790 = v1183 < v1211;
              v1073 = __CFADD__(v1216, v790);
              v791 = v1216 + v790;
              v792 = v1073;
              v1073 = __CFADD__(v789, v791);
              v1176 = v789 + v791;
              v793 = ((HIDWORD(v780) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v780) * (unint64_t)v1239
                   + ((v780 * (unint64_t)v1239
                     + HIDWORD(v780) * v1242
                     + ((v780 * (unint64_t)v1236) >> 32)) >> 32);
              v794 = HIDWORD(v780) * (unint64_t)v1240;
              v795 = v780 * (unint64_t)v1237
                   + v794
                   + ((v780 * (unint64_t)v1247) >> 32);
              v796 = HIDWORD(v794) + HIDWORD(v780) * (unint64_t)v1237 + HIDWORD(v795);
              v797 = (v780 * v1247) | ((unint64_t)v795 << 32);
              if (v1073)
                v798 = 1;
              else
                v798 = v792;
              v1217 = v798;
              v1201 = v793 + v797;
              v799 = v780 * (unint64_t)v1238;
              v1188 = v787 * (unint64_t)v1241;
              v1170 = v788 * (unint64_t)v1235 + v1188 + HIDWORD(v799);
              v800 = v799 | ((unint64_t)v1170 << 32);
              v1073 = __CFADD__(__CFADD__(v793, v797), v800);
              v801 = __CFADD__(v793, v797) + v800;
              v802 = v1073;
              v1073 = __CFADD__(v796, v801);
              v1195 = v796 + v801;
              v803 = HIDWORD(v784) * (unint64_t)v1242;
              v804 = v784 * (unint64_t)v1239
                   + v803
                   + ((v784 * (unint64_t)v1236) >> 32);
              v805 = HIDWORD(v803) + HIDWORD(v784) * (unint64_t)v1239 + HIDWORD(v804);
              v806 = (v784 * v1236) | ((unint64_t)v804 << 32);
              v807 = HIDWORD(v784) * (unint64_t)v1240;
              v808 = v784 * (unint64_t)v1237
                   + v807
                   + ((v784 * (unint64_t)v1247) >> 32);
              v809 = HIDWORD(v807) + HIDWORD(v784) * (unint64_t)v1237 + HIDWORD(v808);
              v810 = (v784 * v1247) | ((unint64_t)v808 << 32);
              if (v1073)
                v811 = 1;
              else
                v811 = v802;
              v812 = HIDWORD(v784) * (unint64_t)v1241;
              v813 = v784 * (unint64_t)v1235
                   + v812
                   + ((v784 * (unint64_t)v1238) >> 32);
              v814 = (v784 * v1238) | ((unint64_t)v813 << 32);
              v815 = __PAIR128__(v814, v805) + v810;
              LODWORD(v816) = __CFADD__(__CFADD__(v805, v810), v814);
              v1073 = __CFADD__(v809, *((_QWORD *)&v815 + 1));
              v817 = v809 + *((_QWORD *)&v815 + 1);
              v818 = v786;
              v819 = HIDWORD(v786);
              v786 = v786;
              v1212 = v786;
              v820 = v819 * (unint64_t)v1240;
              v821 = v786 * (unint64_t)v1237
                   + v820
                   + ((v786 * (unint64_t)v1247) >> 32);
              v822 = HIDWORD(v820) + v819 * (unint64_t)v1237 + HIDWORD(v821);
              v823 = (v786 * v1247) | ((unint64_t)v821 << 32);
              if (v1073)
                v816 = 1;
              else
                v816 = v816;
              v824 = v819 * (unint64_t)v1242;
              v825 = v786 * (unint64_t)v1239
                   + v824
                   + ((v786 * (unint64_t)v1236) >> 32);
              v826 = HIDWORD(v824) + v819 * (unint64_t)v1239 + HIDWORD(v825);
              v1073 = __CFADD__(v826, v823);
              v827 = v826 + v823;
              v828 = v819 * (unint64_t)v1241;
              v1207 = v819;
              v829 = v786 * (unint64_t)v1235
                   + v828
                   + ((v786 * (unint64_t)v1238) >> 32);
              v830 = (v818 * v1238) | ((unint64_t)v829 << 32);
              v832 = v1073;
              v1073 = __CFADD__(v1073, v830);
              v831 = v832 + v830;
              v833 = v1073;
              v1073 = __CFADD__(v822, v831);
              v834 = v822 + v831;
              if (v1073)
                v835 = 1;
              else
                v835 = v833;
              v836 = HIDWORD(v1188) + v787 * (unint64_t)v1235 + HIDWORD(v1170) + v811;
              v837 = (v818 * v1236) | ((unint64_t)v825 << 32);
              v838 = __CFADD__(v806, v1201) + (_QWORD)v815;
              v839 = __CFADD__(__CFADD__(v806, v1201), (_QWORD)v815);
              v1073 = __CFADD__(v838, v1195);
              v840 = v838 + v1195;
              v841 = v1073 || v839;
              v1073 = __CFADD__(v817, v841);
              v842 = v817 + v841;
              v843 = v1073;
              v1073 = __CFADD__(v836, v842);
              v844 = v836 + v842;
              if (v1073)
                v845 = 1;
              else
                v845 = v843;
              v846 = HIDWORD(v812) + HIDWORD(v784) * (unint64_t)v1235 + HIDWORD(v813) + v816 + v845;
              v1073 = __CFADD__(__CFADD__(v837, v840), v827);
              v847 = __CFADD__(v837, v840) + v827;
              v848 = v1073;
              v849 = v844 + v847;
              if (__CFADD__(v844, v847))
                v850 = 1;
              else
                v850 = v848;
              v1073 = __CFADD__(v834, v850);
              v851 = v834 + v850;
              v852 = v1073;
              v853 = v846 + v851;
              if (__CFADD__(v846, v851))
                v854 = 1;
              else
                v854 = v852;
              v855 = HIDWORD(v828) + v819 * (unint64_t)v1235 + HIDWORD(v829) + v835 + v854;
              v856 = HIDWORD(v849);
              v857 = 1908874353 * v849;
              v858 = ((3340530119u * (unint64_t)HIDWORD(v849)) >> 32)
                   + 1908874353 * HIDWORD(v849)
                   + ((v857
                     + (-954437177 * HIDWORD(v849))
                     + ((3340530119u * (unint64_t)v849) >> 32)) >> 32);
              v859 = 477218588 * v849;
              v860 = (477218588 * HIDWORD(v849)) + 3340530119 * v849 + HIDWORD(v859);
              v861 = ((477218588 * (unint64_t)HIDWORD(v849)) >> 32)
                   + 3340530119 * HIDWORD(v849)
                   + HIDWORD(v860);
              v862 = (477218588 * v849) | (v860 << 32);
              v1165 = v858 + v862;
              v1145 = 1908874353 * HIDWORD(v849);
              v1149 = v859 + v1145 + HIDWORD(v857);
              v1154 = v853;
              v863 = (1908874353 * v849) | (v1149 << 32);
              v1073 = __CFADD__(__CFADD__(v858, v862), v863);
              v864 = __CFADD__(v858, v862) + v863;
              v865 = v1073;
              v1073 = __CFADD__(v861, v864);
              v1171 = v861 + v864;
              v866 = HIDWORD(v853);
              v867 = 3340530119 * HIDWORD(v853);
              v868 = HIDWORD(v867) + 1908874353 * HIDWORD(v853);
              v869 = v853;
              v870 = 1908874353 * v853;
              v871 = 3340530119 * v853;
              v872 = v870 + v867 + HIDWORD(v871);
              v873 = v868 + HIDWORD(v872);
              v874 = v871 | ((unint64_t)v872 << 32);
              v875 = 477218588 * v869;
              v876 = (477218588 * v866) + 3340530119 * v869 + HIDWORD(v875);
              v877 = ((477218588 * (unint64_t)v866) >> 32)
                   + 3340530119 * v866
                   + HIDWORD(v876);
              v878 = (477218588 * v869) | (v876 << 32);
              if (v1073)
                v879 = 1;
              else
                v879 = v865;
              v1073 = __CFADD__(v873, v878);
              v880 = v873;
              v881 = 1908874353 * v866;
              v882 = v875 + v881 + HIDWORD(v870);
              v883 = v870 | ((unint64_t)v882 << 32);
              v884 = __PAIR128__(v883, v880) + v878;
              LODWORD(v885) = __CFADD__(v1073, v883);
              v1073 = __CFADD__(v877, *((_QWORD *)&v884 + 1));
              v886 = v877 + *((_QWORD *)&v884 + 1);
              v887 = v855;
              v1158 = v855;
              v888 = HIDWORD(v855);
              v889 = v887;
              v890 = 477218588 * v887;
              v891 = (477218588 * v888) + 3340530119 * v887 + HIDWORD(v890);
              v892 = ((477218588 * (unint64_t)v888) >> 32)
                   + 3340530119 * v888
                   + HIDWORD(v891);
              v893 = (477218588 * v887) | (v891 << 32);
              if (v1073)
                v885 = 1;
              else
                v885 = v885;
              v894 = 3340530119 * v888;
              v895 = HIDWORD(v894) + 1908874353 * v888;
              v896 = 1908874353 * v889;
              v897 = v896 + v894 + ((3340530119u * (unint64_t)v889) >> 32);
              v898 = v895 + HIDWORD(v897);
              v1073 = __CFADD__(v898, v893);
              v899 = v898 + v893;
              v1196 = v890 + (1908874353 * v888) + HIDWORD(v896);
              v1202 = 1908874353 * v888;
              v900 = (1908874353 * v889) | ((unint64_t)v1196 << 32);
              v902 = v1073;
              v1073 = __CFADD__(v1073, v900);
              v901 = v902 + v900;
              LODWORD(v903) = v1073;
              v1073 = __CFADD__(v892, v901);
              v904 = v892 + v901;
              if (v1073)
                v903 = 1;
              else
                v903 = v903;
              v1189 = v903;
              v905 = HIDWORD(v1145) + 477218588 * HIDWORD(v849) + HIDWORD(v1149) + v879;
              v1073 = __CFADD__(__CFADD__(v874, v1165), (_QWORD)v884);
              v906 = __CFADD__(v874, v1165) + (_QWORD)v884;
              LODWORD(v907) = v1073;
              v1073 = __CFADD__(v906, v1171);
              v908 = v906 + v1171;
              if (v1073)
                v907 = 1;
              else
                v907 = v907;
              v1073 = __CFADD__(v886, v907);
              v909 = v886 + v907;
              v910 = v1073;
              v1073 = __CFADD__(v905, v909);
              v911 = v905 + v909;
              if (v1073)
                v912 = 1;
              else
                v912 = v910;
              v1073 = __CFADD__((-954437177 * v889) | ((unint64_t)v897 << 32), v908);
              v913 = HIDWORD(v881) + 477218588 * v866 + HIDWORD(v882) + v885 + v912;
              v915 = v1073;
              v1073 = __CFADD__(v1073, v899);
              v914 = v915 + v899;
              v916 = v1073;
              v1073 = __CFADD__(v911, v914);
              v917 = v911 + v914;
              if (v1073)
                v918 = 1;
              else
                v918 = v916;
              v1073 = __CFADD__(v904, v918);
              v919 = v904 + v918;
              LODWORD(v920) = v1073;
              v1073 = __CFADD__(v913, v919);
              v921 = v913 + v919;
              if (v1073)
                v920 = 1;
              else
                v920 = v920;
              v1172 = v920;
              v1073 = __CFADD__(v917, v1183);
              v923 = v917 + v1183;
              v922 = (__PAIR128__(v1176, v917) + v1183) >> 64;
              v924 = __CFADD__(v1073, v1176);
              v1073 = __CFADD__(v921, v922);
              v1177 = v921 + v922;
              v925 = ((HIDWORD(v849) * (unint64_t)v1242) >> 32)
                   + HIDWORD(v849) * (unint64_t)v1239
                   + ((v849 * (unint64_t)v1239
                     + HIDWORD(v849) * v1242
                     + ((v849 * (unint64_t)v1236) >> 32)) >> 32);
              v926 = HIDWORD(v849) * (unint64_t)v1240;
              v927 = v849 * (unint64_t)v1237
                   + v926
                   + ((v849 * (unint64_t)v1247) >> 32);
              v928 = HIDWORD(v926) + HIDWORD(v849) * (unint64_t)v1237 + HIDWORD(v927);
              v929 = (v849 * v1247) | ((unint64_t)v927 << 32);
              v930 = v1073 || v924;
              v1166 = v930;
              v1073 = __CFADD__(v925, v929);
              v1146 = v925 + v929;
              v1140 = v849 * (unint64_t)v1235
                    + HIDWORD(v849) * v1241
                    + ((v849 * (unint64_t)v1238) >> 32);
              v931 = (v849 * v1238) | ((unint64_t)v1140 << 32);
              v933 = v1073;
              v1073 = __CFADD__(v1073, v931);
              v932 = v933 + v931;
              v934 = v1073;
              v1073 = __CFADD__(v928, v932);
              v1150 = v928 + v932;
              v935 = v866 * (unint64_t)v1242;
              v936 = v869 * (unint64_t)v1239 + v935 + ((v1154 * (unint64_t)v1236) >> 32);
              v937 = HIDWORD(v935) + v866 * (unint64_t)v1239 + HIDWORD(v936);
              v938 = (v1154 * v1236) | ((unint64_t)v936 << 32);
              v939 = v866 * (unint64_t)v1240;
              v940 = v869 * (unint64_t)v1237
                   + v939
                   + ((v1154 * (unint64_t)v1247) >> 32);
              v941 = HIDWORD(v939) + v866 * (unint64_t)v1237 + HIDWORD(v940);
              v942 = (v1154 * v1247) | ((unint64_t)v940 << 32);
              if (v1073)
                v943 = 1;
              else
                v943 = v934;
              v1073 = __CFADD__(v937, v942);
              v944 = v937 + v942;
              v945 = v866 * (unint64_t)v1241;
              v946 = v869 * (unint64_t)v1235
                   + v945
                   + ((v1154 * (unint64_t)v1238) >> 32);
              v947 = (v1154 * v1238) | ((unint64_t)v946 << 32);
              v949 = v1073;
              v1073 = __CFADD__(v1073, v947);
              v948 = v949 + v947;
              LODWORD(v950) = v1073;
              v1073 = __CFADD__(v941, v948);
              v951 = v941 + v948;
              v952 = v888;
              v953 = v888 * (unint64_t)v1242;
              v954 = HIDWORD(v953) + v888 * (unint64_t)v1239;
              v955 = v889 * (unint64_t)v1239 + v953;
              v956 = v952 * (unint64_t)v1240;
              v957 = HIDWORD(v956) + v952 * (unint64_t)v1237;
              v958 = v889 * (unint64_t)v1237
                   + v956
                   + ((v1158 * (unint64_t)v1247) >> 32);
              v959 = v957 + HIDWORD(v958);
              v960 = (v1158 * v1247) | ((unint64_t)v958 << 32);
              if (v1073)
                v950 = 1;
              else
                v950 = v950;
              v961 = v955 + ((v1158 * (unint64_t)v1236) >> 32);
              v962 = v954 + HIDWORD(v961);
              v1073 = __CFADD__(v962, v960);
              v963 = v962 + v960;
              v1162 = v952;
              v964 = v952 * (unint64_t)v1241;
              v965 = v889 * (unint64_t)v1235
                   + v964
                   + ((v1158 * (unint64_t)v1238) >> 32);
              v966 = (v1158 * v1238) | ((unint64_t)v965 << 32);
              v968 = v1073;
              v1073 = __CFADD__(v1073, v966);
              v967 = v968 + v966;
              v969 = v1073;
              v1073 = __CFADD__(v959, v967);
              v970 = v959 + v967;
              if (v1073)
                v971 = 1;
              else
                v971 = v969;
              v972 = ((v856 * (unint64_t)v1241) >> 32)
                   + v856 * (unint64_t)v1235
                   + HIDWORD(v1140)
                   + v943;
              v973 = HIDWORD(v945) + v866 * (unint64_t)v1235 + HIDWORD(v946) + v950;
              v974 = (v1158 * v1236) | ((unint64_t)v961 << 32);
              v975 = HIDWORD(v964) + v952 * (unint64_t)v1235 + HIDWORD(v965) + v971;
              v1073 = __CFADD__(__CFADD__(v938, v1146), v944);
              v976 = __CFADD__(v938, v1146) + v944;
              v977 = v1073;
              v978 = v976 + v1150;
              if (__CFADD__(v976, v1150))
                v979 = 1;
              else
                v979 = v977;
              v1073 = __CFADD__(v951, v979);
              v980 = v951 + v979;
              v981 = v1073;
              v1073 = __CFADD__(v972, v980);
              v982 = v972 + v980;
              if (v1073)
                v983 = 1;
              else
                v983 = v981;
              v984 = v973 + v983;
              v1073 = __CFADD__(__CFADD__(v974, v978), v963);
              v985 = __CFADD__(v974, v978) + v963;
              v986 = v1073;
              v1073 = __CFADD__(v982, v985);
              v987 = v982 + v985;
              if (v1073)
                v988 = 1;
              else
                v988 = v986;
              v1073 = __CFADD__(v970, v988);
              v989 = v970 + v988;
              v990 = v1073;
              v991 = v984 + v989;
              if (__CFADD__(v984, v989))
                v992 = 1;
              else
                v992 = v990;
              v993 = v975 + v992;
              v994 = HIDWORD(v987);
              v995 = v987;
              v996 = ((2576980378u * (unint64_t)HIDWORD(v987)) >> 32)
                   + 2576980377 * HIDWORD(v987)
                   + ((((2576980378 * HIDWORD(v987)) & 0xFFFFFFFELL)
                     + 2576980377 * v995
                     + ((2576980378u * (unint64_t)v995) >> 32)) >> 32);
              v997 = 2576980377 * HIDWORD(v987);
              v998 = ((2576980377u * (unint64_t)v995) >> 32) + v997;
              v999 = HIDWORD(v997);
              v1000 = HIDWORD(v997) + 2576980377 * v994 + ((v998 + 2576980377 * v995) >> 32);
              v1001 = (-1717986919 * v995) | ((unint64_t)(v998 - 1717986919 * v995) << 32);
              v1002 = v998 + 429496729 * v995;
              v1243 = v996 + v1001;
              v1003 = (-1717986919 * v995) | ((unint64_t)v1002 << 32);
              v1004 = __CFADD__(v996, v1001) + v1003;
              LODWORD(v1005) = __CFADD__(__CFADD__(v996, v1001), v1003);
              v1073 = __CFADD__(v1000, v1004);
              v1248 = v1000 + v1004;
              v1006 = HIDWORD(v991);
              v1007 = (-1717986918 * HIDWORD(v991))
                    + 2576980377 * v991
                    + ((2576980378u * (unint64_t)v991) >> 32);
              v1008 = ((2576980378u * (unint64_t)HIDWORD(v991)) >> 32)
                    + 2576980377 * HIDWORD(v991)
                    + HIDWORD(v1007);
              v1009 = (-1717986918 * v991) | (v1007 << 32);
              v1010 = 2576980377 * HIDWORD(v991);
              v1011 = 2576980377 * v991;
              v1012 = HIDWORD(v1011) + v1010;
              v1013 = HIDWORD(v1010);
              v1014 = v1013 + 2576980377 * HIDWORD(v991) + ((v1012 + v1011) >> 32);
              v1015 = (-1717986919 * v991) | ((unint64_t)(v1012 - 1717986919 * v991) << 32);
              v1016 = v1012 + 429496729 * v991;
              if (v1073)
                v1005 = 1;
              else
                v1005 = v1005;
              v1017 = v1008 + v1015;
              v1018 = v1011 | ((unint64_t)v1016 << 32);
              v1073 = __CFADD__(__CFADD__(v1008, v1015), v1018);
              v1019 = __CFADD__(v1008, v1015) + v1018;
              v1020 = v1073;
              v1073 = __CFADD__(v1014, v1019);
              v1021 = v1014 + v1019;
              v1022 = HIDWORD(v993);
              v1023 = v975 + v992;
              v1024 = 2576980378 * HIDWORD(v993);
              v1025 = HIDWORD(v1024) + 2576980377 * v1022;
              v1026 = (v1024 & 0xFFFFFFFE) + 2576980377 * (v975 + v992);
              v1027 = 2576980377 * v1022;
              v1028 = 2576980377 * (v975 + v992);
              v1029 = HIDWORD(v1028) + v1027;
              v1030 = HIDWORD(v1027) + v1027 + ((v1029 + v1028) >> 32);
              v1031 = v1028 | ((unint64_t)(v1029 - 1717986919 * (v975 + v992)) << 32);
              v1032 = 2576980378 * v1023;
              v1033 = v1029 + 429496729 * v1023;
              if (v1073)
                v1034 = 1;
              else
                v1034 = v1020;
              v1035 = v1026 + HIDWORD(v1032);
              v1036 = v1025 + HIDWORD(v1035);
              v1073 = __CFADD__(v1036, v1031);
              v1037 = v1036 + v1031;
              v1038 = v1028 | ((unint64_t)v1033 << 32);
              v1040 = v1073;
              v1073 = __CFADD__(v1073, v1038);
              v1039 = v1040 + v1038;
              v1041 = v1073;
              v1073 = __CFADD__(v1030, v1039);
              v1042 = v1030 + v1039;
              if (v1073)
                v1043 = 1;
              else
                v1043 = v1041;
              v1044 = v999 + 429496729 * v994 + HIDWORD(v1002) + v1005;
              v1045 = v1032 & 0xFFFFFFFE | (v1035 << 32);
              v1046 = __CFADD__(v1009, v1243) + v1017;
              LODWORD(v1047) = __CFADD__(__CFADD__(v1009, v1243), v1017);
              v1073 = __CFADD__(v1046, v1248);
              v1048 = v1046 + v1248;
              if (v1073)
                v1047 = 1;
              else
                v1047 = v1047;
              v1073 = __CFADD__(v1021, v1047);
              v1049 = v1021 + v1047;
              v1050 = v1073;
              v1073 = __CFADD__(v1044, v1049);
              v1051 = v1044 + v1049;
              if (v1073)
                v1052 = 1;
              else
                v1052 = v1050;
              v1053 = v1013 + 429496729 * v1006 + HIDWORD(v1016) + v1034 + v1052;
              v1073 = __CFADD__(__CFADD__(v1045, v1048), v1037);
              v1054 = __CFADD__(v1045, v1048) + v1037;
              v1055 = v1073;
              v1073 = __CFADD__(v1051, v1054);
              v1056 = v1051 + v1054;
              if (v1073)
                v1057 = 1;
              else
                v1057 = v1055;
              v1073 = __CFADD__(v1042, v1057);
              v1058 = v1042 + v1057;
              v1059 = v1073;
              v1073 = __CFADD__(v1053, v1058);
              v1060 = v1053 + v1058;
              if (v1073)
                v1061 = 1;
              else
                v1061 = v1059;
              v1062 = __PAIR128__(v1177, v1056) + v923;
              v1063 = __CFADD__(__CFADD__(v1056, v923), v1177);
              v1073 = __CFADD__(v1060, *((_QWORD *)&v1062 + 1));
              v1064 = v1060 + *((_QWORD *)&v1062 + 1);
              v1065 = v1226
                    + v1222
                    + v1220
                    + (v1212 >> 3)
                    + (v1207 << 29)
                    + v1217
                    + 477218588 * v1162
                    + HIDWORD(v1202)
                    + HIDWORD(v1196)
                    + v1189
                    + v1172
                    + v1166
                    + 429496729 * v1022
                    + HIDWORD(v1027)
                    + HIDWORD(v1033)
                    + v1043
                    + v1061;
              v1066 = v1073 || v1063;
              *((_QWORD *)&v1068 + 1) = v1064;
              *(_QWORD *)&v1068 = v1056 + v923;
              v1067 = v1068 >> 32;
              v1069 = v1065 + v1066;
              *((_QWORD *)&v1068 + 1) = v1065 + v1066;
              *(_QWORD *)&v1068 = v1064;
              v1070 = v1068 >> 32;
              v1072 = __PAIR128__(v1228, v120) - v1067;
              v1071 = v1072;
              v1073 = *((_QWORD *)&v1072 + 1) <= v1228 && *((_QWORD *)&v1072 + 1) >= v1070;
              v1074 = *((_QWORD *)&v1072 + 1) - v1070;
              v1075 = !v1073;
              v1076 = v1232 + v1234 + v1233 - v1230 - v1227 - (v1231[2] + v1229[2] + HIDWORD(v1069)) - v1075;
              if (v1076 < 0)
              {
                v1076 = ~v1076;
                v1074 = ~v1074;
                v1071 = ~(_QWORD)v1072;
                v1077 = 0x8000000000000000;
              }
              else
              {
                v1077 = 0;
              }
              v1078 = 1042612833 * HIDWORD(v1071);
              v1079 = 542101086 * v1071
                    + v1078
                    + ((1042612833 * (unint64_t)v1071) >> 32);
              v1080 = __PAIR128__(HIDWORD(v1078) + 542101086 * HIDWORD(v1071), (v1071 >> 4) | (HIDWORD(v1071) << 28))+ __PAIR128__(HIDWORD(v1079), (1042612833 * v1071) | ((unint64_t)v1079 << 32));
              v1081 = 1042612833 * HIDWORD(v1074);
              v1082 = 542101086 * v1074
                    + v1081
                    + ((1042612833 * (unint64_t)v1074) >> 32);
              v1083 = __PAIR128__(HIDWORD(v1081) + 542101086 * HIDWORD(v1074), (v1074 >> 4) | (HIDWORD(v1074) << 28))+ __PAIR128__(HIDWORD(v1082), (1042612833 * v1074) | ((unint64_t)v1082 << 32));
              v1084 = 1042612833 * HIDWORD(v1076);
              v1085 = 542101086 * v1076
                    + v1084
                    + ((1042612833 * (unint64_t)v1076) >> 32);
              v1086 = __PAIR128__(HIDWORD(v1084) + 542101086 * HIDWORD(v1076), (v1076 >> 4) | (HIDWORD(v1076) << 28))+ __PAIR128__(HIDWORD(v1085), (1042612833 * v1076) | ((unint64_t)v1085 << 32));
              v1073 = __CFADD__(__CFADD__((_QWORD)v1080, v1074 << 60), ((v1074 >> 4) | (HIDWORD(v1074) << 28))+ ((1042612833 * v1074) | ((unint64_t)v1082 << 32)));
              v1087 = __CFADD__((_QWORD)v1080, v1074 << 60)
                    + ((v1074 >> 4) | (HIDWORD(v1074) << 28))
                    + ((1042612833 * v1074) | ((unint64_t)v1082 << 32));
              LODWORD(v1088) = v1073;
              v1073 = __CFADD__(*((_QWORD *)&v1080 + 1), v1087);
              v1089 = *((_QWORD *)&v1080 + 1) + v1087;
              if (v1073)
                v1088 = 1;
              else
                v1088 = v1088;
              v1090 = *((_QWORD *)&v1083 + 1) + v1088;
              v1091 = v1089 + (v1076 << 60);
              v1073 = __CFADD__(__CFADD__(v1089, v1076 << 60), (_QWORD)v1086);
              v1092 = __CFADD__(v1089, v1076 << 60) + (_QWORD)v1086;
              v1093 = v1073;
              v1094 = v1090 + v1092;
              if (__CFADD__(v1090, v1092))
                v1095 = 1;
              else
                v1095 = v1093;
              v1096 = *((_QWORD *)&v1086 + 1) + v1095;
              if (v1096 > 1)
              {
                v1249 = ((2328306436u * (unint64_t)v1089) >> 32)
                      + 2328306436 * HIDWORD(v1091)
                      + ((((2328306436 * v1089) & 0xFFFFFFFCLL)
                        + 2313682944 * HIDWORD(v1091)
                        + ((2313682944u * (unint64_t)v1089) >> 32)) >> 32);
                v1119 = (v1077 | 0x3008000000000000) + v1096;
                v1123 = v1077 | 0x2FE2000000000000;
              }
              else
              {
                v1097 = __bid128_add(a1, a2 & 0x7FFFFFFFFFFFFFFFLL, 1uLL, 0xB040000000000000, a5, a6);
                v1099 = v1098;
                v1100 = __bid128_mul(v1097, v1098, v1097, v1098, a5, a6);
                v1102 = v1101;
                v1103 = __bid128_mul(5uLL, 0xB03E000000000000, v1100, v1101, a5, a6);
                v1244 = v1104;
                v1105 = __bid128_mul(v1097, v1099, v1100, v1102, a5, a6);
                v1107 = v1106;
                v1108 = __bid128_mul(0x67D9DA2155555555uLL, 0x2FFCA45894E48295, v1105, v1106, a5, a6);
                v1110 = __bid128_add(v1103, v1244, v1108, v1109, a5, a6);
                v1245 = v1111;
                v1112 = __bid128_mul(v1097, v1099, v1105, v1107, a5, a6);
                v1114 = __bid128_mul(0x19uLL, 0xB03C000000000000, v1112, v1113, a5, a6);
                v1116 = __bid128_add(v1110, v1245, v1114, v1115, a5, a6);
                v1246 = v1117;
                v1094 = __bid128_add(v1097, v1099, v1116, v1117, a5, a6);
                v1119 = v1118;
                v1120 = __bid128_sub(v1094, v1118, v1097, v1099, a5, a6);
                v1249 = __bid128_sub(v1120, v1121, v1116, v1246, a5, a6);
                v1123 = v1122;
              }
              v1124 = __bid128_mul(a3, a4, v1094, v1119, a5, a6);
              v1126 = v1125;
              v1127 = bid128_ext_fma(v1253, &v1252, &v1251, &v1250, a3, a4, v1094, v1119, v1124, v1125 ^ 0x8000000000000000, a5, a6);
              v1129 = bid128_ext_fma(v1253, &v1252, &v1251, &v1250, a3, a4, v1249, v1123, v1127, v1128, a5, a6);
              v1131 = v1130;
              v14 = __bid128_exp(v1124, v1126, a5, a6);
              v1133 = v1132;
              if (__bid128_isZero(v14, v1132))
              {
                v14 = 0;
                v1134 = *a6 | 0x10;
              }
              else
              {
                if ((~v1133 & 0x7800000000000000) != 0 || (v1133 & 0x7C00000000000000) == 0x7C00000000000000)
                  return bid128_ext_fma(v1253, &v1252, &v1251, &v1250, v14, v1133, v1129, v1131, v14, v1133, a5, a6);
                v1134 = *a6 | 8;
              }
              *a6 = v1134;
            }
            else
            {
              v14 = 0;
              *a6 |= 1u;
            }
          }
          else
          {
            return 0;
          }
        }
        else
        {
          v16 = a2 & 0x7FFFFFFFFFFFFFFFLL;
          v14 = 1;
          if (!__bid128_quiet_equal(a1, v16, 1uLL, 0x3040000000000000uLL, a6))
          {
            __bid128_quiet_less(a1, v16, 1uLL, 0x3040000000000000, a6);
            return 0;
          }
        }
      }
      else
      {
        if ((a4 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93)
          return 0;
        if ((a4 & 0x3FFFFFFFFFFFLL) != 0x314DC6448D93)
          return a3;
        v14 = a3;
        if (a3 > 0x38C15B09FFFFFFFFLL)
          return 0;
      }
    }
    else
    {
      if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93)
        return 0;
      v14 = a1;
      if (a1 > 0x38C15B09FFFFFFFFLL && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
        return 0;
    }
  }
  return v14;
}

unint64_t __bid128_rem(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  unint64_t *v20;
  unint64_t v21;
  int v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unsigned __int128 v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unsigned __int128 v56;
  unint64_t v57;
  uint64_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  __int128 v69;
  unint64_t v70[2];
  __int128 v71;

  v4 = a3;
  v5 = a4 & 0x7800000000000000;
  if (((a4 >> 61) & 3) == 3)
  {
    if (v5 == 0x7800000000000000)
    {
      v6 = 0xFE00000000000000;
      if ((a4 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
      {
        if ((a4 & 0x3FFFFFFFFFFFLL) != 0x314DC6448D93 || a3 < 0x38C15B0A00000000)
        {
          v6 = 0xFE003FFFFFFFFFFFLL;
          v7 = a3;
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      LODWORD(v9) = 0;
      v10 = 0;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        v4 = 0;
      else
        v4 = v7;
      if ((a4 & 0x7C00000000000000) == 0x7800000000000000)
        v6 = 0xF800000000000000;
      v8 = v6 & a4;
    }
    else
    {
      v4 = 0;
      v8 = 0;
      v10 = 0;
      v9 = (a4 >> 47) & 0x3FFF;
    }
  }
  else
  {
    v8 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
      || (a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a3 >= 0x378D8E6400000000)
    {
      v4 = 0;
      v8 = 0;
    }
    v9 = (a4 >> 49) & 0x3FFF;
    v10 = v8 | v4;
  }
  v71 = 0uLL;
  v13 = a2 & 0x7800000000000000;
  if (((a2 >> 61) & 3) == 3)
  {
    if (v13 == 0x7800000000000000)
    {
      *(_QWORD *)&v71 = a1;
      if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
        || (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && a1 >= 0x38C15B0A00000000)
      {
        *(_QWORD *)&v71 = 0;
      }
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        *(_QWORD *)&v71 = 0;
    }
    goto LABEL_78;
  }
  v14 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    goto LABEL_36;
  if ((a2 & 0x1FFFFFFFFFFFFLL) != 0x1ED09BEAD87C0)
  {
    v65 = a1;
    goto LABEL_37;
  }
  v65 = a1;
  if (a1 >= 0x378D8E6400000000)
  {
LABEL_36:
    v65 = 0;
    v14 = 0;
  }
LABEL_37:
  *(_QWORD *)&v71 = v65;
  *((_QWORD *)&v71 + 1) = v14;
  v15 = (a2 >> 49) & 0x3FFF;
  if (!(v14 | v65))
  {
LABEL_78:
    if ((~a4 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((~a2 & 0x7C00000000000000) == 0)
    {
      if ((~a2 & 0x7E00000000000000) == 0)
        my_fpsf |= 1u;
      return v71;
    }
    v29 = a4 & 0x7C00000000000000;
    if (v13 == 0x7800000000000000 && v29 != 0x7C00000000000000 || !(v8 | v4))
      goto LABEL_94;
    if (v29 == 0x7800000000000000 || v10)
      return 0;
LABEL_89:
    if (v29 == 0x7C00000000000000)
    {
      if ((~a4 & 0x7E00000000000000) == 0)
        my_fpsf |= 1u;
      return v4;
    }
    v4 = a1;
    if (v5 == 0x7800000000000000)
      return v4;
LABEL_94:
    v4 = 0;
    my_fpsf |= 1u;
    return v4;
  }
  if (!v10)
  {
    v29 = a4 & 0x7C00000000000000;
    goto LABEL_89;
  }
  v70[0] = 0;
  v70[1] = 0;
  v16 = v15 - v9;
  if ((int)v15 <= (int)v9)
  {
    if (v16 < -34)
      return a1;
    v30 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * (v9 - v15));
    v31 = *v30;
    v32 = v30[1];
    v33 = HIDWORD(v32);
    v34 = v32 * (unint64_t)HIDWORD(v4);
    v35 = HIDWORD(v34) + HIDWORD(v32) * (unint64_t)HIDWORD(v4);
    v36 = HIDWORD(v32) * (unint64_t)v4
        + v34
        + ((v32 * (unint64_t)v4) >> 32);
    v37 = HIDWORD(v36);
    v38 = (v32 * v4) | ((unint64_t)v36 << 32);
    v39 = HIDWORD(*v30);
    v40 = *v30 * (unint64_t)HIDWORD(v4);
    v41 = *v30 * (unint64_t)v4;
    v42 = HIDWORD(v40) + HIDWORD(*v30) * HIDWORD(v4);
    v43 = HIDWORD(*v30) * v4 + v40 + HIDWORD(v41);
    v44 = __PAIR128__(v35, v38) + __PAIR128__(v37, v42 + HIDWORD(v43));
    v45 = v32 * (unint64_t)HIDWORD(v8);
    v46 = v32 * (unint64_t)v8;
    v47 = v33 * (unint64_t)v8;
    v48 = HIDWORD(v45) + v33 * (unint64_t)HIDWORD(v8);
    v49 = v47 + v45 + HIDWORD(v46);
    v50 = HIDWORD(v49);
    v51 = v46 | ((unint64_t)v49 << 32);
    v52 = v31 * (unint64_t)HIDWORD(v8);
    v53 = v31 * (unint64_t)v8;
    v54 = HIDWORD(v31) * (unint64_t)v8 + v52 + HIDWORD(v53);
    v55 = v53 | ((unint64_t)v54 << 32);
    v56 = __PAIR128__(v48, v51)
        + __PAIR128__(v50, HIDWORD(v52) + v39 * (unint64_t)HIDWORD(v8) + HIDWORD(v54));
    v57 = v38 + v42 + HIDWORD(v43) + v55;
    v58 = __CFADD__(v38 + v42 + HIDWORD(v43), v55) + (_QWORD)v56;
    v59 = __CFADD__(__CFADD__(v38 + v42 + HIDWORD(v43), v55), (_QWORD)v56);
    v60 = *((_QWORD *)&v44 + 1) + v58;
    v61 = __CFADD__(*((_QWORD *)&v44 + 1), v58) || (unint64_t)v59;
    if (!v60
      && *((_QWORD *)&v56 + 1) == v61 << 63 >> 63
      && (*((_QWORD *)&v63 + 1) = v14, *(_QWORD *)&v63 = v71, v62 = v63 >> 63, v57 <= v62))
    {
      v66 = v41 | ((unint64_t)v43 << 32);
      if (v57 != v62 || (v4 = a1, v66 < 2 * (uint64_t)v71))
      {
        v69 = 0uLL;
        bid___div_128_by_128_1078(v70, (unint64_t *)&v69, v71, *((unint64_t *)&v71 + 1), v66, v57);
        v67 = v69 >> 63;
        if (v67 > v57)
          return __PAIR128__(v57, v66) - v69;
        v68 = 2 * v69;
        if (v67 == v57 && v68 > v66)
          return __PAIR128__(v57, v66) - v69;
        if (v67 == v57 && v68 == v66 && (v70[0] & 1) != 0)
          return __PAIR128__(v57, v66) - v69;
        return v69;
      }
    }
    else
    {
      return a1;
    }
  }
  else
  {
    if (v8)
      v17 = 38;
    else
      v17 = 34;
    do
    {
      v18 = ((unint64_t)COERCE_UNSIGNED_INT((float)v65 + (float)((float)(unint64_t)v14
                                                                                       * 1.8447e19)) >> 23)
          - 127;
      v19 = v17 - __bid_estimate_decimal_digits[v18];
      v20 = (unint64_t *)((char *)&__bid_power10_index_binexp_128 + 16 * v18);
      v21 = v20[1];
      if ((uint64_t)(v14 - v21) > 0 || v14 == v21 && v65 >= *v20)
        --v19;
      if (v16 >= v19)
        v22 = v19;
      else
        v22 = v16;
      v23 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * v22);
      v24 = *v23;
      v25 = *v23 * (unint64_t)HIDWORD(v65);
      v26 = HIDWORD(v24) * (unint64_t)v65
          + v25
          + ((v24 * (unint64_t)v65) >> 32);
      bid___div_128_by_128_1078(v70, (unint64_t *)&v71, (*v23 * v65) | ((unint64_t)v26 << 32), v24 * v14 + v23[1] * v65 + HIDWORD(v24) * (unint64_t)HIDWORD(v65) + HIDWORD(v25) + HIDWORD(v26), v4, v8);
      v14 = *((_QWORD *)&v71 + 1);
      v65 = v71;
      if (v71 == 0)
        return v71;
      if (v16 >= v19)
        v16 -= v19;
      else
        v16 = 0;
    }
    while (v16 >= 1);
    v27 = v71 >> 63;
    if (v27 > v8)
      return __PAIR128__(v8 - *((_QWORD *)&v71 + 1), v4) - v71;
    v28 = 2 * v71;
    if (v27 == v8 && v28 > v4)
      return __PAIR128__(v8 - *((_QWORD *)&v71 + 1), v4) - v71;
    if (v27 == v8 && v28 == v4 && (v70[0] & 1) != 0)
      return __PAIR128__(v8 - *((_QWORD *)&v71 + 1), v4) - v71;
    return v71;
  }
  return v4;
}

unint64_t __bid128_round_integral_exact(unint64_t result, uint64_t a2, int a3, _DWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unsigned __int128 v49;
  _BOOL4 v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unsigned int v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unsigned __int128 v82;
  _BOOL4 v83;
  uint64_t v84;
  unint64_t v85;
  unsigned int v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unsigned int v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unsigned __int128 v114;
  _BOOL4 v115;
  uint64_t v116;
  unint64_t v117;
  BOOL v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  BOOL v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unsigned int v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unsigned int v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  unsigned __int128 v153;
  _BOOL4 v154;
  uint64_t v155;
  unint64_t v156;
  BOOL v157;
  int v158;
  int v159;
  int v160;
  unint64_t v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unsigned int v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unsigned __int128 v177;
  unint64_t v178;
  unsigned int v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  unsigned __int128 v192;
  _BOOL4 v193;
  uint64_t v194;
  unint64_t v195;
  BOOL v196;
  int v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  int v201;
  unint64_t v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unint64_t v209;
  unint64_t v210;

  if ((~a2 & 0x7800000000000000) != 0)
  {
    if ((~a2 & 0x6000000000000000) == 0)
    {
      v4 = 0;
      v5 = 0;
      v6 = 4 * a2;
LABEL_18:
      v7 = a2 & 0x8000000000000000;
      v8 = v6 & 0x7FFE000000000000;
      if (!(v5 | v4))
        return 0;
      switch(a3)
      {
        case 0:
        case 4:
          if (v8 <= 0x2FFA000000000000)
            goto LABEL_28;
          goto LABEL_30;
        case 1:
          if (v8 >= 0x2FFC000000000001)
            goto LABEL_30;
LABEL_24:
          result = a2 < 0;
          goto LABEL_29;
        case 2:
          if (v8 >= 0x2FFC000000000001)
            goto LABEL_30;
LABEL_26:
          result = a2 >= 0;
          goto LABEL_29;
        case 3:
          if (v8 >= 0x2FFC000000000001)
            goto LABEL_30;
LABEL_28:
          result = 0;
LABEL_29:
          *a4 |= 0x20u;
          return result;
        default:
LABEL_30:
          v9 = HIDWORD(v5);
          if (v5 >> 53)
            v10 = HIDWORD(v5);
          else
            v10 = v5;
          if (v5 >> 53)
            v11 = -990;
          else
            v11 = -1022;
          if (v4)
            v10 = v4;
          v12 = (COERCE_UNSIGNED_INT64((double)v10) >> 52) & 0x7FF;
          if (v4)
            v11 = -958;
          v13 = (v12 + v11 - 1);
          v14 = *((_DWORD *)&__bid_nr_digits + 8 * v13);
          if (!v14)
          {
            v15 = (char *)&__bid_nr_digits + 32 * v13;
            v14 = *((_DWORD *)v15 + 6);
            v16 = *((_QWORD *)v15 + 1);
            if (v4 > v16 || v4 == v16 && v5 >= *((_QWORD *)&__bid_nr_digits + 4 * v13 + 2))
              ++v14;
          }
          v17 = v8 >> 49;
          if (v17 >> 5 > 0xC0)
            return result;
          break;
      }
      v18 = v17 - 6176;
      switch(a3)
      {
        case 0:
          if (v14 + v18 < 0)
            goto LABEL_28;
          if (v17 < 0x180D)
          {
            v20 = (uint64_t *)&__bid_midpoint128[(6156 - v17)];
            v4 += v20[1];
            v19 = (6175 - v17);
          }
          else
          {
            v19 = (6175 - v17);
            v20 = &__bid_midpoint64[v19];
          }
          v121 = *v20;
          v122 = __CFADD__(v121, v5);
          v123 = v121 + v5;
          if (v122)
            v124 = v4 + 1;
          else
            v124 = v4;
          v125 = HIDWORD(v123);
          v126 = v123;
          v127 = __bid_ten2mk128[2 * v19];
          v128 = __bid_ten2mk128[2 * v19 + 1];
          v129 = HIDWORD(v123) * (unint64_t)v128;
          v130 = HIDWORD(v129) + HIDWORD(v123) * (unint64_t)HIDWORD(v128);
          v131 = v123 * (unint64_t)HIDWORD(v128)
               + v129
               + ((v123 * (unint64_t)v128) >> 32);
          v132 = (v123 * v128) | ((unint64_t)v131 << 32);
          v133 = v127 * (unint64_t)HIDWORD(v123);
          v134 = v127 * (unint64_t)v123;
          v135 = HIDWORD(v127) * (unint64_t)v126 + v133 + HIDWORD(v134);
          v136 = v134 | ((unint64_t)v135 << 32);
          v138 = v132 + HIDWORD(v133) + HIDWORD(v127) * (unint64_t)v125 + HIDWORD(v135);
          v137 = (__PAIR128__(v130, v132)
                + __PAIR128__(HIDWORD(v131), HIDWORD(v133) + HIDWORD(v127) * (unint64_t)v125 + HIDWORD(v135))) >> 64;
          v139 = HIDWORD(v124);
          v140 = v124;
          v141 = HIDWORD(v124) * (unint64_t)v128;
          v142 = HIDWORD(v141) + HIDWORD(v124) * (unint64_t)HIDWORD(v128);
          v143 = v124 * (unint64_t)HIDWORD(v128)
               + v141
               + ((v124 * (unint64_t)v128) >> 32);
          v144 = HIDWORD(v143);
          v145 = (v124 * v128) | ((unint64_t)v143 << 32);
          v146 = HIDWORD(v124) * (unint64_t)v127;
          v147 = v124 * (unint64_t)v127;
          v148 = HIDWORD(v146) + v139 * (unint64_t)HIDWORD(v127);
          v149 = v140 * (unint64_t)HIDWORD(v127) + v146 + HIDWORD(v147);
          v150 = v147 | ((unint64_t)v149 << 32);
          v152 = v145 + v148 + HIDWORD(v149);
          v151 = (__PAIR128__(v142, v145) + __PAIR128__(v144, v148 + HIDWORD(v149))) >> 64;
          v153 = __PAIR128__(v152, v150) + v138;
          v154 = __CFADD__(__CFADD__(v150, v138), v152);
          result = v137 + *((_QWORD *)&v153 + 1);
          v155 = __CFADD__(v137, *((_QWORD *)&v153 + 1)) || v154;
          v156 = v151 + v155;
          if (v17 < 0x181D)
          {
            v197 = __bid_shiftright128[v19];
            if (v17 >> 1 < 0xC05)
            {
              v205 = v156 >> v197;
              v206 = __bid_maskhigh128[v19] & v156;
              if ((v205 & 1) != 0
                && !v206
                && !result
                && ((unint64_t)v153 < v128 || (_QWORD)v153 == v128 && v136 < v127))
              {
                --v205;
              }
              v207 = __bid_onehalf128[v19];
              if (v206 <= v207 && (v206 != v207 || !((unint64_t)v153 | v136 | result))
                || v206 != v207
                || result
                || (v157 = (_QWORD)v153 == v128, (unint64_t)v153 > v128))
              {
                result = v205;
                goto LABEL_228;
              }
              result = v205;
            }
            else
            {
              v198 = (v156 << -(char)v197) | (result >> v197);
              v199 = __bid_maskhigh128[v19] & result;
              if ((v198 & 1) != 0 && !v199 && ((unint64_t)v153 < v128 || (_QWORD)v153 == v128 && v136 < v127))
                --v198;
              v200 = __bid_onehalf128[v19];
              if (v199 <= v200 && (v199 != v200 || !((unint64_t)v153 | v136))
                || v199 != v200
                || (v157 = (_QWORD)v153 == v128, (unint64_t)v153 > v128))
              {
                result = v198;
                goto LABEL_228;
              }
              result = v198;
            }
          }
          else
          {
            if ((result & 1) != 0 && ((unint64_t)v153 < v128 || (_QWORD)v153 == v128 && v136 < v127))
              --result;
            if ((unint64_t)v153 <= 0x8000000000000000 && (!v136 || (_QWORD)v153 != 0x8000000000000000))
              goto LABEL_228;
            v157 = ((unint64_t)v153 ^ 0x8000000000000000) == v128;
            if (((unint64_t)v153 ^ 0x8000000000000000) > v128)
              goto LABEL_228;
          }
          if (!v157 || v136 < v127)
            return result;
LABEL_228:
          *a4 |= 0x20u;
          return result;
        case 1:
          if (v14 + v18 < 1)
            goto LABEL_24;
          v21 = v5;
          v22 = (6175 - v17);
          v23 = __bid_ten2mk128[2 * v22];
          v24 = __bid_ten2mk128[2 * v22 + 1];
          v25 = v24 * (unint64_t)HIDWORD(v5);
          v26 = HIDWORD(v25) + HIDWORD(v24) * (unint64_t)HIDWORD(v5);
          v27 = HIDWORD(v24) * (unint64_t)v5
              + v25
              + ((v24 * (unint64_t)v5) >> 32);
          v28 = (v24 * v5) | ((unint64_t)v27 << 32);
          v29 = v23 * (unint64_t)HIDWORD(v5);
          v30 = v23 * (unint64_t)v5;
          v31 = HIDWORD(v23) * (unint64_t)v21 + v29 + HIDWORD(v30);
          v32 = v30 | ((unint64_t)v31 << 32);
          v34 = v28 + HIDWORD(v29) + HIDWORD(v23) * (unint64_t)v9 + HIDWORD(v31);
          v33 = (__PAIR128__(v26, v28)
               + __PAIR128__(HIDWORD(v27), HIDWORD(v29) + HIDWORD(v23) * (unint64_t)v9 + HIDWORD(v31))) >> 64;
          v35 = HIDWORD(v4);
          v36 = v4;
          v37 = v24 * (unint64_t)HIDWORD(v4);
          v38 = HIDWORD(v37) + HIDWORD(v24) * (unint64_t)HIDWORD(v4);
          v39 = HIDWORD(v24) * (unint64_t)v4
              + v37
              + ((v24 * (unint64_t)v4) >> 32);
          v40 = HIDWORD(v39);
          v41 = (v24 * v4) | ((unint64_t)v39 << 32);
          v42 = v23 * (unint64_t)HIDWORD(v4);
          v43 = v23 * (unint64_t)v4;
          v44 = HIDWORD(v42) + HIDWORD(v23) * (unint64_t)v35;
          v45 = HIDWORD(v23) * (unint64_t)v36 + v42 + HIDWORD(v43);
          v46 = v43 | ((unint64_t)v45 << 32);
          v48 = v41 + v44 + HIDWORD(v45);
          v47 = (__PAIR128__(v38, v41) + __PAIR128__(v40, v44 + HIDWORD(v45))) >> 64;
          v49 = __PAIR128__(v48, v34) + v46;
          v50 = __CFADD__(__CFADD__(v34, v46), v48);
          v51 = v33 + *((_QWORD *)&v49 + 1);
          v52 = __CFADD__(v33, *((_QWORD *)&v49 + 1)) || v50;
          v53 = v47 + v52;
          if (v17 < 0x181D)
          {
            v158 = __bid_shiftright128[v22];
            if (v17 >> 1 < 0xC05)
            {
              result = v53 >> v158;
              if ((__bid_maskhigh128[v22] & v53) != 0
                || v51
                || (unint64_t)v49 > v24
                || (_QWORD)v49 == v24 && v32 >= v23)
              {
                *a4 |= 0x20u;
                if (v7)
                  ++result;
              }
            }
            else
            {
              result = (v53 << -(char)v158) | (v51 >> v158);
              if ((__bid_maskhigh128[v22] & v51) != 0
                || (unint64_t)v49 > v24
                || (_QWORD)v49 == v24 && v32 >= v23)
              {
                *a4 |= 0x20u;
                if (v7)
                  goto LABEL_126;
              }
            }
          }
          else
          {
            if ((unint64_t)v49 > v24)
              goto LABEL_62;
            if ((_QWORD)v49 != v24)
              return v51;
            result = v51;
            if (v32 >= v23)
            {
LABEL_62:
              *a4 |= 0x20u;
              if (v7)
                return v51 + 1;
              else
                return v51;
            }
          }
          return result;
        case 2:
          if (v14 + v18 < 1)
            goto LABEL_26;
          v54 = v5;
          v55 = (6175 - v17);
          v56 = __bid_ten2mk128[2 * v55];
          v57 = __bid_ten2mk128[2 * v55 + 1];
          v58 = v57 * (unint64_t)HIDWORD(v5);
          v59 = HIDWORD(v58) + HIDWORD(v57) * (unint64_t)HIDWORD(v5);
          v60 = HIDWORD(v57) * (unint64_t)v5
              + v58
              + ((v57 * (unint64_t)v5) >> 32);
          v61 = (v57 * v5) | ((unint64_t)v60 << 32);
          v62 = v56 * (unint64_t)HIDWORD(v5);
          v63 = v56 * (unint64_t)v5;
          v64 = HIDWORD(v56) * (unint64_t)v54 + v62 + HIDWORD(v63);
          v65 = v63 | ((unint64_t)v64 << 32);
          v67 = v61 + HIDWORD(v62) + HIDWORD(v56) * (unint64_t)v9 + HIDWORD(v64);
          v66 = (__PAIR128__(v59, v61)
               + __PAIR128__(HIDWORD(v60), HIDWORD(v62) + HIDWORD(v56) * (unint64_t)v9 + HIDWORD(v64))) >> 64;
          v68 = HIDWORD(v4);
          v69 = v4;
          v70 = v57 * (unint64_t)HIDWORD(v4);
          v71 = HIDWORD(v70) + HIDWORD(v57) * (unint64_t)HIDWORD(v4);
          v72 = HIDWORD(v57) * (unint64_t)v4
              + v70
              + ((v57 * (unint64_t)v4) >> 32);
          v73 = HIDWORD(v72);
          v74 = (v57 * v4) | ((unint64_t)v72 << 32);
          v75 = v56 * (unint64_t)HIDWORD(v4);
          v76 = v56 * (unint64_t)v4;
          v77 = HIDWORD(v75) + HIDWORD(v56) * (unint64_t)v68;
          v78 = HIDWORD(v56) * (unint64_t)v69 + v75 + HIDWORD(v76);
          v79 = v76 | ((unint64_t)v78 << 32);
          v81 = v74 + v77 + HIDWORD(v78);
          v80 = (__PAIR128__(v71, v74) + __PAIR128__(v73, v77 + HIDWORD(v78))) >> 64;
          v82 = __PAIR128__(v81, v67) + v79;
          v83 = __CFADD__(__CFADD__(v67, v79), v81);
          v51 = v66 + *((_QWORD *)&v82 + 1);
          v84 = __CFADD__(v66, *((_QWORD *)&v82 + 1)) || v83;
          v85 = v80 + v84;
          if (v17 < 0x181D)
          {
            v159 = __bid_shiftright128[v55];
            if (v17 >> 1 < 0xC05)
            {
              result = v85 >> v159;
              if ((__bid_maskhigh128[v55] & v85) != 0
                || v51
                || (unint64_t)v82 > v57
                || (_QWORD)v82 == v57 && v65 >= v56)
              {
                *a4 |= 0x20u;
                if (!v7)
                  ++result;
              }
            }
            else
            {
              result = (v85 << -(char)v159) | (v51 >> v159);
              if ((__bid_maskhigh128[v55] & v51) != 0
                || (unint64_t)v82 > v57
                || (_QWORD)v82 == v57 && v65 >= v56)
              {
                *a4 |= 0x20u;
                if (!v7)
LABEL_126:
                  ++result;
              }
            }
          }
          else
          {
            if ((unint64_t)v82 <= v57)
            {
              if ((_QWORD)v82 != v57)
                return v51;
              result = v51;
              if (v65 < v56)
                return result;
            }
            *a4 |= 0x20u;
            if (v7)
              return v51;
            else
              return v51 + 1;
          }
          return result;
        case 3:
          if (v14 + v18 < 1)
            goto LABEL_28;
          v86 = v5;
          v87 = (6175 - v17);
          v88 = __bid_ten2mk128[2 * v87];
          v89 = __bid_ten2mk128[2 * v87 + 1];
          v90 = v89 * (unint64_t)HIDWORD(v5);
          v91 = HIDWORD(v90) + HIDWORD(v89) * (unint64_t)HIDWORD(v5);
          v92 = HIDWORD(v89) * (unint64_t)v5
              + v90
              + ((v89 * (unint64_t)v5) >> 32);
          v93 = (v89 * v5) | ((unint64_t)v92 << 32);
          v94 = v88 * (unint64_t)HIDWORD(v5);
          v95 = v88 * (unint64_t)v5;
          v96 = HIDWORD(v88) * (unint64_t)v86 + v94 + HIDWORD(v95);
          v97 = v95 | ((unint64_t)v96 << 32);
          v99 = v93 + HIDWORD(v94) + HIDWORD(v88) * (unint64_t)v9 + HIDWORD(v96);
          v98 = (__PAIR128__(v91, v93)
               + __PAIR128__(HIDWORD(v92), HIDWORD(v94) + HIDWORD(v88) * (unint64_t)v9 + HIDWORD(v96))) >> 64;
          v100 = HIDWORD(v4);
          v101 = v4;
          v102 = v89 * (unint64_t)HIDWORD(v4);
          v103 = HIDWORD(v102) + HIDWORD(v89) * (unint64_t)HIDWORD(v4);
          v104 = HIDWORD(v89) * (unint64_t)v4
               + v102
               + ((v89 * (unint64_t)v4) >> 32);
          v105 = HIDWORD(v104);
          v106 = (v89 * v4) | ((unint64_t)v104 << 32);
          v107 = v88 * (unint64_t)HIDWORD(v4);
          v108 = v88 * (unint64_t)v4;
          v109 = HIDWORD(v107) + HIDWORD(v88) * (unint64_t)v100;
          v110 = HIDWORD(v88) * (unint64_t)v101 + v107 + HIDWORD(v108);
          v111 = v108 | ((unint64_t)v110 << 32);
          v113 = v106 + v109 + HIDWORD(v110);
          v112 = (__PAIR128__(v103, v106) + __PAIR128__(v105, v109 + HIDWORD(v110))) >> 64;
          v114 = __PAIR128__(v113, v99) + v111;
          v115 = __CFADD__(__CFADD__(v99, v111), v113);
          result = v98 + *((_QWORD *)&v114 + 1);
          v116 = __CFADD__(v98, *((_QWORD *)&v114 + 1)) || v115;
          v117 = v112 + v116;
          if (v17 < 0x181D)
          {
            v160 = __bid_shiftright128[v87];
            if (v17 >> 1 < 0xC05)
            {
              if ((__bid_maskhigh128[v87] & v117) != 0
                || result
                || (v118 = (_QWORD)v114 == v89, (unint64_t)v114 > v89))
              {
                result = v117 >> v160;
                goto LABEL_226;
              }
              result = v117 >> v160;
            }
            else
            {
              v161 = (v117 << -(char)v160) | (result >> v160);
              if ((__bid_maskhigh128[v87] & result) != 0 || (v118 = (_QWORD)v114 == v89, (unint64_t)v114 > v89))
              {
                result = v161;
                goto LABEL_226;
              }
              result = v161;
            }
          }
          else
          {
            v118 = (_QWORD)v114 == v89;
            if ((unint64_t)v114 > v89)
              goto LABEL_226;
          }
          if (!v118 || v97 < v88)
            return result;
LABEL_226:
          *a4 |= 0x20u;
          return result;
        case 4:
          if (v14 + v18 < 0)
            goto LABEL_28;
          if (v17 < 0x180D)
          {
            v120 = (uint64_t *)&__bid_midpoint128[(6156 - v17)];
            v4 += v120[1];
            v119 = (6175 - v17);
          }
          else
          {
            v119 = (6175 - v17);
            v120 = &__bid_midpoint64[v119];
          }
          v162 = *v120;
          v122 = __CFADD__(v162, v5);
          v163 = v162 + v5;
          if (v122)
            v164 = v4 + 1;
          else
            v164 = v4;
          v165 = HIDWORD(v163);
          v166 = v163;
          v167 = __bid_ten2mk128[2 * v119];
          v168 = __bid_ten2mk128[2 * v119 + 1];
          v169 = HIDWORD(v163) * (unint64_t)v168;
          v170 = HIDWORD(v169) + HIDWORD(v163) * (unint64_t)HIDWORD(v168);
          v171 = v163 * (unint64_t)HIDWORD(v168)
               + v169
               + ((v163 * (unint64_t)v168) >> 32);
          v172 = (v163 * v168) | ((unint64_t)v171 << 32);
          v173 = v167 * (unint64_t)HIDWORD(v163);
          v174 = v167 * (unint64_t)v163;
          v175 = HIDWORD(v167) * (unint64_t)v166 + v173 + HIDWORD(v174);
          v176 = v174 | ((unint64_t)v175 << 32);
          v177 = __PAIR128__(v170, v172)
               + __PAIR128__(HIDWORD(v171), HIDWORD(v173) + HIDWORD(v167) * (unint64_t)v165 + HIDWORD(v175));
          v178 = HIDWORD(v164);
          v179 = v164;
          v180 = HIDWORD(v164) * (unint64_t)v168;
          v181 = HIDWORD(v180) + HIDWORD(v164) * (unint64_t)HIDWORD(v168);
          v182 = v164 * (unint64_t)HIDWORD(v168)
               + v180
               + ((v164 * (unint64_t)v168) >> 32);
          v183 = HIDWORD(v182);
          v184 = (v164 * v168) | ((unint64_t)v182 << 32);
          v185 = HIDWORD(v164) * (unint64_t)v167;
          v186 = v164 * (unint64_t)v167;
          v187 = HIDWORD(v185) + v178 * (unint64_t)HIDWORD(v167);
          v188 = v179 * (unint64_t)HIDWORD(v167) + v185 + HIDWORD(v186);
          v189 = v186 | ((unint64_t)v188 << 32);
          v191 = v184 + v187 + HIDWORD(v188);
          v190 = (__PAIR128__(v181, v184) + __PAIR128__(v183, v187 + HIDWORD(v188))) >> 64;
          v192 = __PAIR128__(v191, v189) + (unint64_t)v177;
          v193 = __CFADD__(__CFADD__(v189, (_QWORD)v177), v191);
          result = *((_QWORD *)&v177 + 1) + *((_QWORD *)&v192 + 1);
          v194 = __CFADD__(*((_QWORD *)&v177 + 1), *((_QWORD *)&v192 + 1)) || v193;
          v195 = v190 + v194;
          if (v17 < 0x181D)
          {
            v201 = __bid_shiftright128[v119];
            if (v17 >> 1 < 0xC05)
            {
              v208 = v195 >> v201;
              v209 = __bid_maskhigh128[v119] & v195;
              v210 = __bid_onehalf128[v119];
              if (v209 <= v210 && (v209 != v210 || !((unint64_t)v192 | v176 | result))
                || v209 != v210
                || result
                || (v196 = (_QWORD)v192 == v168, (unint64_t)v192 > v168))
              {
                result = v208;
                goto LABEL_230;
              }
              result = v208;
            }
            else
            {
              v202 = (v195 << -(char)v201) | (result >> v201);
              v203 = __bid_maskhigh128[v119] & result;
              v204 = __bid_onehalf128[v119];
              if (v203 <= v204 && (v203 != v204 || !((unint64_t)v192 | v176))
                || v203 != v204
                || (v196 = (_QWORD)v192 == v168, (unint64_t)v192 > v168))
              {
                result = v202;
                goto LABEL_230;
              }
              result = v202;
            }
          }
          else
          {
            if ((unint64_t)v192 <= 0x8000000000000000 && (!v176 || (_QWORD)v192 != 0x8000000000000000))
              goto LABEL_230;
            v196 = ((unint64_t)v192 ^ 0x8000000000000000) == v168;
            if (((unint64_t)v192 ^ 0x8000000000000000) > v168)
              goto LABEL_230;
          }
          if (!v196 || v176 < v167)
            return result;
LABEL_230:
          *a4 |= 0x20u;
          return result;
        default:
          return 0xBADDBADDBADDBADDLL;
      }
    }
    v4 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFuLL) <= 0x1ED09BEAD87C0)
    {
      v5 = result;
      if (result < 0x378D8E6400000000)
      {
LABEL_17:
        v6 = a2;
        goto LABEL_18;
      }
      v6 = a2;
      if (v4 != 0x1ED09BEAD87C0)
        goto LABEL_18;
    }
    v4 = 0;
    v5 = 0;
    goto LABEL_17;
  }
  if ((~a2 & 0x7C00000000000000) != 0)
    return 0;
  if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
    || result >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
  {
    result = 0;
    a2 &= 0xFFFFC00000000000;
  }
  if ((~a2 & 0x7E00000000000000) == 0)
    *a4 |= 1u;
  return result;
}

unint64_t __bid128_round_integral_nearest_even(unint64_t result, uint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int128 v33;
  unint64_t v34;
  unsigned int v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unsigned __int128 v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  unint64_t v55;

  if ((~a2 & 0x7800000000000000) == 0)
  {
    if ((~a2 & 0x7C00000000000000) != 0)
      return 0;
    if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || result >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      result = 0;
      a2 &= 0xFFFFC00000000000;
    }
    if ((~a2 & 0x7E00000000000000) == 0)
      *a3 |= 1u;
    return result;
  }
  if ((~a2 & 0x6000000000000000) == 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = 4 * a2;
    goto LABEL_18;
  }
  v3 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
  {
LABEL_16:
    v3 = 0;
    v4 = 0;
    goto LABEL_17;
  }
  v4 = result;
  if (result >= 0x378D8E6400000000)
  {
    v5 = a2;
    if (v3 != 0x1ED09BEAD87C0)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_17:
  v5 = a2;
LABEL_18:
  v6 = v5 & 0x7FFE000000000000;
  if (!(v4 | v3))
    return 0;
  if (v6 <= 0x2FFA000000000000)
    return 0;
  v7 = HIDWORD(v4);
  if (v4 >> 53)
  {
    v8 = -990;
  }
  else
  {
    v7 = v4;
    v8 = -1022;
  }
  if (v3)
    v7 = v3;
  v9 = (COERCE_UNSIGNED_INT64((double)v7) >> 52) & 0x7FF;
  if (v3)
    v8 = -958;
  v10 = (v9 + v8 - 1);
  v11 = *((_DWORD *)&__bid_nr_digits + 8 * v10);
  if (!v11)
  {
    v12 = (char *)&__bid_nr_digits + 32 * v10;
    v11 = *((_DWORD *)v12 + 6);
    v13 = *((_QWORD *)v12 + 1);
    if (v3 > v13 || v3 == v13 && v4 >= *((_QWORD *)&__bid_nr_digits + 4 * v10 + 2))
      ++v11;
  }
  v14 = v6 >> 49;
  if (v14 >> 5 <= 0xC0)
  {
    if ((int)v14 + v11 - 6176 < 0)
      return 0;
    if (v14 < 0x180D)
    {
      v16 = (uint64_t *)&__bid_midpoint128[(6156 - v14)];
      v3 += v16[1];
      v15 = (6175 - v14);
    }
    else
    {
      v15 = (6175 - v14);
      v16 = &__bid_midpoint64[v15];
    }
    v17 = *v16;
    v18 = __CFADD__(v17, v4);
    v19 = v17 + v4;
    if (v18)
      v20 = v3 + 1;
    else
      v20 = v3;
    v21 = HIDWORD(v19);
    v22 = v19;
    v24 = __bid_ten2mk128[2 * v15];
    v23 = __bid_ten2mk128[2 * v15 + 1];
    v25 = HIDWORD(v19) * (unint64_t)v23;
    v26 = HIDWORD(v25) + HIDWORD(v19) * (unint64_t)HIDWORD(v23);
    v27 = v19 * (unint64_t)HIDWORD(v23)
        + v25
        + ((v19 * (unint64_t)v23) >> 32);
    v28 = (v19 * v23) | ((unint64_t)v27 << 32);
    v29 = v24 * (unint64_t)HIDWORD(v19);
    v30 = v24 * (unint64_t)v19;
    v31 = HIDWORD(v24) * (unint64_t)v22 + v29 + HIDWORD(v30);
    v32 = v30 | ((unint64_t)v31 << 32);
    v33 = __PAIR128__(v26, v28)
        + __PAIR128__(HIDWORD(v27), HIDWORD(v29) + HIDWORD(v24) * (unint64_t)v21 + HIDWORD(v31));
    v34 = HIDWORD(v20);
    v35 = v20;
    v36 = HIDWORD(v20) * (unint64_t)v23;
    v37 = HIDWORD(v36) + HIDWORD(v20) * (unint64_t)HIDWORD(v23);
    v38 = v20 * (unint64_t)HIDWORD(v23)
        + v36
        + ((v20 * (unint64_t)v23) >> 32);
    v39 = HIDWORD(v38);
    v40 = (v20 * v23) | ((unint64_t)v38 << 32);
    v41 = HIDWORD(v20) * (unint64_t)v24;
    v42 = v20 * (unint64_t)v24;
    v43 = HIDWORD(v41) + v34 * (unint64_t)HIDWORD(v24);
    v44 = v35 * (unint64_t)HIDWORD(v24) + v41 + HIDWORD(v42);
    v45 = v42 | ((unint64_t)v44 << 32);
    v46 = __PAIR128__(v37, v40) + __PAIR128__(v39, v43 + HIDWORD(v44));
    v47 = v45 + v33;
    v18 = __CFADD__(__CFADD__(v45, (_QWORD)v33), (_QWORD)v46);
    v48 = __CFADD__(v45, (_QWORD)v33) + (_QWORD)v46;
    v49 = v18;
    v50 = *((_QWORD *)&v33 + 1) + v48;
    if (__CFADD__(*((_QWORD *)&v33 + 1), v48))
      v51 = 1;
    else
      v51 = v49;
    v52 = *((_QWORD *)&v46 + 1) + v51;
    if (v14 < 0x181D)
    {
      v53 = __bid_shiftright128[v15];
      if (v14 >> 1 < 0xC05)
      {
        result = v52 >> v53;
        if (((v52 >> v53) & 1) != 0
          && (__bid_maskhigh128[v15] & v52) == 0
          && !v50
          && (v47 < v23 || v47 == v23 && v32 < v24))
        {
          --result;
        }
      }
      else
      {
        v54 = v52 << -(char)v53;
        v55 = v50 >> v53;
        result = v54 | v55;
        if (((v54 | v55) & 1) != 0
          && (__bid_maskhigh128[v15] & v50) == 0
          && (v47 < v23 || v47 == v23 && v32 < v24))
        {
          --result;
        }
      }
    }
    else if ((v50 & 1) != 0 && (v47 < v23 || v47 == v23 && v32 < v24))
    {
      return v50 - 1;
    }
    else
    {
      return v50;
    }
  }
  return result;
}

unint64_t __bid128_round_integral_negative(unint64_t result, uint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unsigned __int128 v45;
  _BOOL4 v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  unint64_t v50;

  if ((~a2 & 0x7800000000000000) == 0)
  {
    if ((~a2 & 0x7C00000000000000) != 0)
      return 0;
    if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || result >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      result = 0;
      a2 &= 0xFFFFC00000000000;
    }
    if ((~a2 & 0x7E00000000000000) == 0)
      *a3 |= 1u;
    return result;
  }
  if ((~a2 & 0x6000000000000000) == 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = 4 * a2;
    goto LABEL_18;
  }
  v3 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFuLL) <= 0x1ED09BEAD87C0)
  {
    if (result < 0x378D8E6400000000)
    {
      v4 = result;
      goto LABEL_17;
    }
    v4 = result;
    v5 = a2;
    if (v3 != 0x1ED09BEAD87C0)
      goto LABEL_18;
  }
  v3 = 0;
  v4 = 0;
LABEL_17:
  v5 = a2;
LABEL_18:
  v6 = a2 & 0x8000000000000000;
  v7 = v5 & 0x7FFE000000000000;
  if (!(v4 | v3))
    return 0;
  if (v7 <= 0x2FFC000000000000)
    return a2 < 0;
  v8 = HIDWORD(v4);
  if (v4 >> 53)
    v9 = HIDWORD(v4);
  else
    v9 = v4;
  if (v4 >> 53)
    v10 = -990;
  else
    v10 = -1022;
  if (v3)
    v9 = v3;
  v11 = (COERCE_UNSIGNED_INT64((double)v9) >> 52) & 0x7FF;
  if (v3)
    v10 = -958;
  v12 = (v11 + v10 - 1);
  v13 = *((_DWORD *)&__bid_nr_digits + 8 * v12);
  if (!v13)
  {
    v14 = (char *)&__bid_nr_digits + 32 * v12;
    v13 = *((_DWORD *)v14 + 6);
    v15 = *((_QWORD *)v14 + 1);
    if (v3 > v15 || v3 == v15 && v4 >= *((_QWORD *)&__bid_nr_digits + 4 * v12 + 2))
      ++v13;
  }
  v16 = v7 >> 49;
  if ((v7 >> 49) >> 5 <= 0xC0)
  {
    if ((int)v16 + v13 - 6176 < 1)
      return a2 < 0;
    v17 = v4;
    v18 = (6175 - v16);
    v19 = __bid_ten2mk128[2 * v18];
    v20 = __bid_ten2mk128[2 * v18 + 1];
    v21 = v20 * (unint64_t)HIDWORD(v4);
    v22 = HIDWORD(v21) + HIDWORD(v20) * (unint64_t)HIDWORD(v4);
    v23 = HIDWORD(v20) * (unint64_t)v4
        + v21
        + ((v20 * (unint64_t)v4) >> 32);
    v24 = (v20 * v4) | ((unint64_t)v23 << 32);
    v25 = v19 * (unint64_t)HIDWORD(v4);
    v26 = v19 * (unint64_t)v4;
    v27 = HIDWORD(v19) * (unint64_t)v17 + v25 + HIDWORD(v26);
    v28 = v26 | ((unint64_t)v27 << 32);
    v30 = v24 + HIDWORD(v25) + HIDWORD(v19) * (unint64_t)v8 + HIDWORD(v27);
    v29 = (__PAIR128__(v22, v24)
         + __PAIR128__(HIDWORD(v23), HIDWORD(v25) + HIDWORD(v19) * (unint64_t)v8 + HIDWORD(v27))) >> 64;
    v31 = HIDWORD(v3);
    v32 = v3;
    v33 = v20 * (unint64_t)HIDWORD(v3);
    v34 = HIDWORD(v33) + HIDWORD(v20) * (unint64_t)HIDWORD(v3);
    v35 = HIDWORD(v20) * (unint64_t)v3
        + v33
        + ((v20 * (unint64_t)v3) >> 32);
    v36 = HIDWORD(v35);
    v37 = (v20 * v3) | ((unint64_t)v35 << 32);
    v38 = v19 * (unint64_t)HIDWORD(v3);
    v39 = v19 * (unint64_t)v3;
    v40 = HIDWORD(v38) + HIDWORD(v19) * (unint64_t)v31;
    v41 = HIDWORD(v19) * (unint64_t)v32 + v38 + HIDWORD(v39);
    v42 = v39 | ((unint64_t)v41 << 32);
    v44 = v37 + v40 + HIDWORD(v41);
    v43 = (__PAIR128__(v34, v37) + __PAIR128__(v36, v40 + HIDWORD(v41))) >> 64;
    v45 = __PAIR128__(v44, v30) + v42;
    v46 = __CFADD__(__CFADD__(v30, v42), v44);
    result = v29 + *((_QWORD *)&v45 + 1);
    v47 = __CFADD__(v29, *((_QWORD *)&v45 + 1)) || v46;
    v48 = v43 + v47;
    if (v16 >= 0x181D)
    {
      if (v6 && ((unint64_t)v45 > v20 || (_QWORD)v45 == v20 && v28 >= v19))
        ++result;
      return result;
    }
    v49 = __bid_shiftright128[v18];
    if (v16 >> 1 >= 0xC05)
    {
      v50 = (v48 << -(char)v49) | (result >> v49);
      if (!v6)
        return v50;
      if ((__bid_maskhigh128[v18] & result) == 0 && (unint64_t)v45 <= v20)
      {
        if ((_QWORD)v45 != v20)
          return v50;
        result = v50;
        if (v28 < v19)
          return result;
      }
      return v50 + 1;
    }
    if (!v6)
      return v48 >> v49;
    if ((__bid_maskhigh128[v18] & v48) == 0 && !result && (unint64_t)v45 <= v20)
    {
      if ((_QWORD)v45 != v20)
        return v48 >> v49;
      result = v48 >> v49;
      if (v28 < v19)
        return result;
    }
    return (v48 >> v49) + 1;
  }
  return result;
}

unint64_t __bid128_round_integral_zero(unint64_t result, uint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned __int128 v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unsigned __int128 v38;
  BOOL v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;

  if ((~a2 & 0x7800000000000000) == 0)
  {
    if ((~a2 & 0x7C00000000000000) != 0)
      return 0;
    if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || result >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      result = 0;
      a2 &= 0xFFFFC00000000000;
    }
    if ((~a2 & 0x7E00000000000000) == 0)
      *a3 |= 1u;
    return result;
  }
  if ((~a2 & 0x6000000000000000) == 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = 4 * a2;
    goto LABEL_18;
  }
  v3 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFuLL) <= 0x1ED09BEAD87C0)
  {
    if (result < 0x378D8E6400000000)
    {
      v4 = result;
      goto LABEL_17;
    }
    v4 = result;
    v5 = a2;
    if (v3 != 0x1ED09BEAD87C0)
      goto LABEL_18;
  }
  v3 = 0;
  v4 = 0;
LABEL_17:
  v5 = a2;
LABEL_18:
  v6 = v5 & 0x7FFE000000000000;
  if (!(v4 | v3))
    return 0;
  if (v6 <= 0x2FFC000000000000)
    return 0;
  if (v4 >> 53)
    v7 = HIDWORD(v4);
  else
    v7 = v4;
  if (v4 >> 53)
    v8 = -990;
  else
    v8 = -1022;
  if (v3)
    v7 = v3;
  v9 = (COERCE_UNSIGNED_INT64((double)v7) >> 52) & 0x7FF;
  if (v3)
    v8 = -958;
  v10 = (v9 + v8 - 1);
  v11 = *((_DWORD *)&__bid_nr_digits + 8 * v10);
  if (!v11)
  {
    v12 = (char *)&__bid_nr_digits + 32 * v10;
    v11 = *((_DWORD *)v12 + 6);
    v13 = *((_QWORD *)v12 + 1);
    if (v3 > v13 || v3 == v13 && v4 >= *((_QWORD *)&__bid_nr_digits + 4 * v10 + 2))
      ++v11;
  }
  v14 = v6 >> 49;
  if (v14 >> 5 <= 0xC0)
  {
    if ((int)v14 + v11 - 6176 < 1)
      return 0;
    v15 = (6175 - v14);
    v16 = __bid_ten2mk128[2 * v15];
    v17 = __bid_ten2mk128[2 * v15 + 1];
    v18 = HIDWORD(v17);
    v19 = v17 * (unint64_t)HIDWORD(v4);
    v20 = HIDWORD(v19) + HIDWORD(v17) * (unint64_t)HIDWORD(v4);
    v21 = HIDWORD(v17) * (unint64_t)v4
        + v19
        + ((v17 * (unint64_t)v4) >> 32);
    v22 = HIDWORD(v21);
    v23 = (v17 * v4) | ((unint64_t)v21 << 32);
    v24 = HIDWORD(v16);
    v25 = __PAIR128__(v20, v23)
        + __PAIR128__(v22, ((v16 * (unint64_t)HIDWORD(v4)) >> 32)+ HIDWORD(v16) * (unint64_t)HIDWORD(v4)+ ((HIDWORD(v16) * (unint64_t)v4+ (v16 * HIDWORD(v4))+ ((v16 * (unint64_t)v4) >> 32)) >> 32));
    v26 = HIDWORD(v3);
    LODWORD(v23) = v3;
    v27 = v17 * (unint64_t)HIDWORD(v3);
    v28 = v17 * (unint64_t)v3;
    v29 = v18 * (unint64_t)v3;
    v30 = HIDWORD(v27) + v18 * (unint64_t)HIDWORD(v3);
    v31 = v29 + v27 + HIDWORD(v28);
    v32 = HIDWORD(v31);
    v33 = v28 | ((unint64_t)v31 << 32);
    v34 = v16 * (unint64_t)HIDWORD(v3);
    v35 = v16 * (unint64_t)v3;
    v36 = HIDWORD(v16) * (unint64_t)v23 + v34 + HIDWORD(v35);
    v37 = v35 | ((unint64_t)v36 << 32);
    v38 = __PAIR128__(v30, v33)
        + __PAIR128__(v32, HIDWORD(v34) + v24 * (unint64_t)v26 + HIDWORD(v36));
    v39 = __CFADD__(__CFADD__(v37, (_QWORD)v25), v33 + HIDWORD(v34) + v24 * (unint64_t)v26 + HIDWORD(v36));
    v40 = __CFADD__(v37, (_QWORD)v25)
        + v33
        + HIDWORD(v34)
        + v24 * (unint64_t)v26
        + HIDWORD(v36);
    v41 = v39;
    result = *((_QWORD *)&v25 + 1) + v40;
    if (__CFADD__(*((_QWORD *)&v25 + 1), v40))
      v42 = 1;
    else
      v42 = v41;
    v43 = *((_QWORD *)&v38 + 1) + v42;
    if (v14 <= 0x181C)
    {
      v44 = __bid_shiftright128[v15];
      v39 = v14 >> 1 >= 0xC05;
      v45 = -v44;
      v46 = result >> v44;
      v47 = v43 >> v44;
      v48 = (v43 << v45) | v46;
      if (v39)
        return v48;
      else
        return v47;
    }
  }
  return result;
}

unint64_t __bid128_sin(unint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned __int128 v41;
  _BOOL4 v42;
  BOOL v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unsigned int v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unsigned __int128 v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  __int128 v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  int v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  int v105;
  int v106;
  unint64_t v107;
  int8x16_t v108;
  int8x16_t v109;
  __int32 v110;
  unint64_t v111;
  __int128 v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  int v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v124;
  unsigned int v125;
  __n128 v126;
  __n128 v127;
  int v128;
  int v129[8];
  _QWORD v130[4];

  v5 = a1;
  v126 = 0uLL;
  if ((~a2 & 0x6000000000000000) != 0)
  {
    v6 = (((unint64_t)a2 >> 49) & 0x3FFF) - 6176;
    v7 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0 || a1 >= 0x378D8E6400000000 && v7 == 0x1ED09BEAD87C0)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v8 = a1;
    }
LABEL_17:
    if (v8 | v7)
      v9 = v6;
    else
      v9 = -99999;
    if (v9 > -36)
    {
      v11 = (uint64_t *)((char *)&bid_decimal128_moduli_1144 + 48 * (v9 + 35));
      v12 = *v11;
      v13 = v11[1];
      v15 = v11[2];
      v14 = v11[3];
      v16 = v11[4];
      v124 = v11[5];
      v17 = HIDWORD(*v11);
      v18 = ((v12 * (unint64_t)HIDWORD(v8)) >> 32)
          + HIDWORD(v12) * (unint64_t)HIDWORD(v8)
          + ((HIDWORD(v12) * (unint64_t)v8
            + (v12 * HIDWORD(v8))
            + ((v12 * (unint64_t)v8) >> 32)) >> 32);
      v19 = HIDWORD(v13);
      v20 = v13 * (unint64_t)HIDWORD(v8);
      v21 = HIDWORD(v20) + HIDWORD(v13) * (unint64_t)HIDWORD(v8);
      v22 = HIDWORD(v13) * (unint64_t)v8
          + v20
          + ((v13 * (unint64_t)v8) >> 32);
      v23 = v21 + HIDWORD(v22);
      v24 = (v13 * v8) | ((unint64_t)v22 << 32);
      v25 = HIDWORD(v15);
      v26 = v15 * (unint64_t)HIDWORD(v8);
      v27 = HIDWORD(v26) + HIDWORD(v15) * (unint64_t)HIDWORD(v8);
      v28 = HIDWORD(v15) * (unint64_t)v8
          + v26
          + ((v15 * (unint64_t)v8) >> 32);
      v29 = v27 + HIDWORD(v28);
      v30 = (v15 * v8) | ((unint64_t)v28 << 32);
      v31 = HIDWORD(v14);
      v32 = v14 * (unint64_t)HIDWORD(v8);
      v125 = a3;
      v33 = HIDWORD(v32) + HIDWORD(v14) * (unint64_t)HIDWORD(v8);
      v34 = HIDWORD(v14) * (unint64_t)v8
          + v32
          + ((v14 * (unint64_t)v8) >> 32);
      v35 = v33 + HIDWORD(v34);
      v36 = (v14 * v8) | ((unint64_t)v34 << 32);
      v37 = HIDWORD(v16);
      v38 = v16 * (unint64_t)HIDWORD(v8);
      v39 = HIDWORD(v16) * (unint64_t)v8
          + v38
          + ((v16 * (unint64_t)v8) >> 32);
      v40 = (v16 * v8) | ((unint64_t)v39 << 32);
      v41 = __PAIR128__(v30, v18) + v24;
      v42 = __CFADD__(__CFADD__(v18, v24), v30);
      v43 = __CFADD__(v23, *((_QWORD *)&v41 + 1));
      v44 = v23 + *((_QWORD *)&v41 + 1);
      v45 = v43 || v42;
      v43 = __CFADD__(v36, v45);
      v46 = v36 + v45;
      v47 = v43;
      v48 = v29 + v46;
      if (__CFADD__(v29, v46))
        v49 = 1;
      else
        v49 = v47;
      v43 = __CFADD__(v40, v49);
      v50 = v40 + v49;
      v51 = v43;
      v52 = v35 + v50;
      if (__CFADD__(v35, v50))
        v53 = 1;
      else
        v53 = v51;
      v54 = HIDWORD(v7);
      v55 = *v11 * (unint64_t)HIDWORD(v7);
      v56 = v12 * (unint64_t)v7;
      v57 = HIDWORD(v55) + v17 * (unint64_t)HIDWORD(v7);
      v58 = v17 * (unint64_t)v7 + v55 + HIDWORD(v56);
      v59 = v57 + HIDWORD(v58);
      v60 = v56 | ((unint64_t)v58 << 32);
      v61 = v13 * (unint64_t)HIDWORD(v7);
      v62 = v13 * (unint64_t)v7;
      v63 = v19 * (unint64_t)v7;
      v64 = HIDWORD(v61) + v19 * (unint64_t)HIDWORD(v7);
      v65 = v63 + v61 + HIDWORD(v62);
      v66 = v64 + HIDWORD(v65);
      v67 = v62 | ((unint64_t)v65 << 32);
      v68 = v15 * (unint64_t)HIDWORD(v7);
      v69 = v15 * (unint64_t)v7;
      v70 = HIDWORD(v68) + v25 * (unint64_t)HIDWORD(v7);
      v71 = v25 * (unint64_t)v7 + v68 + HIDWORD(v69);
      v72 = v70 + HIDWORD(v71);
      v73 = v69 | ((unint64_t)v71 << 32);
      v74 = v14 * (unint64_t)HIDWORD(v7);
      v75 = v14 * (unint64_t)v7;
      v76 = v31 * (unint64_t)v7 + v74 + HIDWORD(v75);
      v77 = v75 | ((unint64_t)v76 << 32);
      v78 = v16 * v7;
      v79 = __PAIR128__(v73, v59) + v67;
      LODWORD(v80) = __CFADD__(__CFADD__(v59, v67), v73);
      v81 = v66 + *((_QWORD *)&v79 + 1);
      if (__CFADD__(v66, *((_QWORD *)&v79 + 1)))
        v80 = 1;
      else
        v80 = v80;
      v43 = __CFADD__(v77, v80);
      v82 = v77 + v80;
      LODWORD(v83) = v43;
      v43 = __CFADD__(v72, v82);
      v84 = v72 + v82;
      if (v43)
        v83 = 1;
      else
        v83 = v83;
      v85 = __CFADD__(v60, (_QWORD)v41) + (_QWORD)v79;
      LODWORD(v86) = __CFADD__(__CFADD__(v60, (_QWORD)v41), (_QWORD)v79);
      v43 = __CFADD__(v44, v85);
      v87 = v44 + v85;
      if (v43)
        v86 = 1;
      else
        v86 = v86;
      v43 = __CFADD__(v81, v86);
      v88 = v81 + v86;
      LODWORD(v89) = v43;
      v43 = __CFADD__(v88, v48);
      v90 = v88 + v48;
      if (v43)
        v89 = 1;
      else
        v89 = v89;
      v43 = __CFADD__(v84, v89);
      v91 = v84 + v89;
      LODWORD(v92) = v43;
      v43 = __CFADD__(v91, v52);
      v93 = v91 + v52;
      if (v43)
        v92 = 1;
      else
        v92 = v92;
      v94 = v78
          + v31 * (unint64_t)v54
          + HIDWORD(v74)
          + v37 * (unint64_t)HIDWORD(v8)
          + v124 * v8
          + HIDWORD(v38)
          + HIDWORD(v76)
          + HIDWORD(v39)
          + v83
          + v53
          + v92;
      v95 = v94 >> 62;
      *((_QWORD *)&v97 + 1) = v94;
      *(_QWORD *)&v97 = v93;
      v96 = v97 >> 62;
      *((_QWORD *)&v97 + 1) = v93;
      *(_QWORD *)&v97 = v90;
      v98 = v97 >> 62;
      *((_QWORD *)&v97 + 1) = v90;
      *(_QWORD *)&v97 = v87;
      v99 = v97 >> 62;
      v100 = 4 * v87;
      v101 = ((_BYTE)v95 + 1) & 3;
      if (v96 < 0)
      {
        v102 = a2 >= 0;
      }
      else
      {
        v101 = v95;
        v102 = (unint64_t)a2 >> 63;
      }
      if (v96 >= 0)
        v103 = v96;
      else
        v103 = ~v96;
      if (v96 >= 0)
      {
        v104 = v100;
      }
      else
      {
        v98 = ~v98;
        v99 = ~v99;
        v104 = ~v100;
      }
      if (a2 >= 0)
        v105 = v101;
      else
        v105 = -v101 & 3;
      if (v103)
        v106 = 16382;
      else
        v106 = 16318;
      if (v103)
        v107 = v103;
      else
        v107 = v98;
      if (v103)
        v104 = v99;
      else
        v98 = v99;
      v108 = (int8x16_t)vdupq_n_s64(v107);
      v109 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v108, (int8x16_t)xmmword_1B8917CC0), (uint64x2_t)vandq_s8(v108, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v108, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v108, (int8x16_t)xmmword_1B8917CF0))));
      *(int8x8_t *)v109.i8 = vorr_s8(*(int8x8_t *)v109.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v109, v109, 8uLL));
      v110 = v109.i32[0] | v109.i32[1] | (2 * ((v107 & 0xCCCCCCCCCCCCCCCCLL) <= (v107 & 0x3333333333333333))) | ((v107 & 0xAAAAAAAAAAAAAAAALL) <= (v107 & 0x5555555555555555));
      v111 = (v104 >> -(char)v110) + (v98 << v110);
      if (v110)
        v107 = (v98 >> -(char)v110) + (v107 << v110);
      else
        v111 = v98;
      *((_QWORD *)&v112 + 1) = v107;
      *(_QWORD *)&v112 = v111;
      v127.n128_u64[0] = v112 >> 15;
      v127.n128_u64[1] = ((unint64_t)(v106 - v110) << 48) | (v102 << 63) | (v107 >> 15) & 0xFFFFFFFFFFFFLL;
      bid_f128_mul(&v127, (uint64_t *)&c_pi_ov_2_1124, (uint64_t *)&v127);
      switch(v105)
      {
        case 0:
          v113 = &__dpml_bid_trig_x_table;
          v114 = 0;
          v115 = 1;
          goto LABEL_101;
        case 1:
          v113 = (uint64_t *)&unk_1B891F938;
          v114 = 2;
          v115 = 2;
LABEL_101:
          __dpml_bid_C_ux_trig__((uint64_t *)&v127, v114, v115, v113, &v126, v129);
          break;
        case 2:
          v120 = &__dpml_bid_trig_x_table;
          v121 = 0;
          v122 = 1;
          goto LABEL_104;
        case 3:
          v120 = (uint64_t *)&unk_1B891F938;
          v121 = 2;
          v122 = 2;
LABEL_104:
          __dpml_bid_C_ux_trig__((uint64_t *)&v127, v121, v122, v120, &v126, v129);
          memset(v130, 0, 24);
          __dpml_bid_unpack_x_or_y__((uint64_t *)&v126, 0, (uint64_t)v130, &__dpml_bid_bid_x_table, (uint64_t)&v126, v129);
          break;
        default:
          break;
      }
      v118 = v126.n128_u64[1];
      v117 = v126.n128_u64[0];
      v119 = v125;
    }
    else
    {
      if (v9 == -99999)
        return __bid128_mul(a1, a2, 1uLL, 0x3040000000000000, a3, &my_fpsf);
      if (v9 <= 0xFFFFFFCB)
        return bid128_ext_fma(v129, (int *)v130, (int *)&v127, &v128, a1, a2, 1uLL, 0xAFF0000000000000, a1, a2, a3, &my_fpsf);
      v127.n128_u64[0] = __bid128_to_binary128(a1, a2, a3, &my_fpsf);
      v127.n128_u64[1] = v116;
      __dpml_bid_C_ux_trig__((uint64_t *)&v127, 0, 1, &__dpml_bid_trig_x_table, &v126, v129);
      v118 = v126.n128_u64[1];
      v117 = v126.n128_u64[0];
      v119 = a3;
    }
    return __binary128_to_bid128(v117, v118, v119, &my_fpsf);
  }
  if ((~a2 & 0x7800000000000000) != 0)
  {
    v7 = 0;
    v8 = 0;
    v6 = 0;
    goto LABEL_17;
  }
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    v5 = 0;
    my_fpsf |= 1u;
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v5;
}

unint64_t __bid128_sqrt(unint64_t result, unint64_t a2, int a3)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  unsigned __int128 v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  _BOOL8 v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _BOOL8 v90;
  unsigned int v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  unint64_t v96;
  char v97;
  BOOL v98;
  char v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v104;
  int v105;
  unint64_t *v106;
  unint64_t v107;
  int v108;
  uint64_t *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unsigned __int128 v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  _BOOL4 v132;
  unint64_t v133;
  unint64_t *v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  _BOOL4 v163;
  unint64_t v164;
  double v165;
  uint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unsigned int v187;
  unint64_t v188;
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unsigned int v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unsigned int v209;
  unint64_t v210;
  unint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unsigned int v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  _BOOL8 v224;
  unint64_t v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  uint64_t v233;
  unint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unsigned __int128 v245;
  unint64_t v246;
  unsigned int v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  _BOOL8 v258;
  unint64_t v259;
  unint64_t v260;
  uint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unsigned __int128 v264;
  unint64_t v265;
  _BOOL8 v267;
  unint64_t v268;
  unint64_t v269;
  _BOOL8 v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  unint64_t v278;
  unint64_t v279;
  unint64_t v280;
  unint64_t v281;
  unint64_t v282;
  unint64_t v283;
  unint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  unint64_t v293;
  unsigned __int128 v294;
  unint64_t v295;
  unint64_t v296;
  _BOOL8 v297;
  unsigned int v298;
  unint64_t v299;
  uint64_t v300;
  _BOOL8 v301;
  unint64_t v302;
  unsigned int v303;
  uint64_t v304;
  unint64_t v305;
  unsigned int v306;
  uint64_t v307;
  unint64_t v308;
  unint64_t v309;
  unint64_t v310;
  unint64_t v311;
  unint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  unint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unint64_t v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  unsigned __int128 v324;
  unint64_t v325;
  unint64_t v326;
  unint64_t v327;
  unint64_t v328;
  unint64_t v329;
  unint64_t v330;
  unint64_t v331;
  unint64_t v332;
  unint64_t v333;
  unint64_t v334;
  unsigned __int128 v335;
  uint64_t v336;
  unint64_t v337;
  uint64_t v338;
  unint64_t v339;
  unint64_t v340;
  _BOOL4 v341;
  unint64_t v342;
  uint64_t v343;
  unint64_t v344;
  unsigned int v345;
  unint64_t v346;
  uint64_t v347;
  char v348;
  char v349;
  unint64_t v350;
  uint64_t v351;
  unint64_t v352;
  unint64_t v353;
  unint64_t v354;
  __int128 v355;
  unint64_t v356;
  unint64_t v357;
  unsigned int v358;
  unint64_t v359;
  unint64_t v360;
  unint64_t v361;
  unint64_t v362;
  unint64_t v363;
  unint64_t v364;
  unint64_t v365;
  unint64_t v366;
  unint64_t v367;
  unint64_t v368;
  uint64_t v369;
  __int128 v370;
  unint64_t v371;
  unint64_t v372;
  unint64_t v373;
  unint64_t v374;
  unint64_t v375;
  unint64_t v376;
  uint64_t v377;
  _BOOL8 v378;
  unsigned int v379;
  unint64_t v380;
  uint64_t v381;
  unint64_t v382;
  unint64_t v383;
  __int128 v384;
  uint64_t v385;
  unsigned __int128 v386;
  unint64_t v387;
  uint64_t v389;
  unint64_t v390;
  unint64_t v391;
  unint64_t v392;
  unint64_t v393;
  unint64_t v394;
  unint64_t v395;
  unint64_t v396;
  unint64_t v397;
  unint64_t v398;
  BOOL v399;
  unint64_t v400;
  __int128 v401;
  unint64_t v402;
  unint64_t v403;
  unsigned int v404;
  unint64_t v405;
  unint64_t v406;
  unint64_t v407;
  unint64_t v408;
  unint64_t v409;
  unint64_t v410;
  unint64_t v411;
  unint64_t v412;
  unint64_t v413;
  unint64_t v414;
  unint64_t v415;
  unint64_t v416;
  uint64_t v417;
  unint64_t v418;
  unint64_t v419;
  unint64_t v420;
  unint64_t v421;
  uint64_t v422;
  _BOOL8 v423;
  unsigned int v424;
  unint64_t v425;
  uint64_t v426;
  unint64_t v427;
  BOOL v428;
  unint64_t v429;
  unint64_t v430;
  unsigned int v431;
  unint64_t v432;
  uint64_t v433;
  unint64_t v434;
  unint64_t v435;
  unint64_t v436;
  unint64_t v437;
  unint64_t v438;
  BOOL v439;
  unint64_t v440;
  unint64_t v441;
  unint64_t v442;
  unint64_t v443;
  BOOL v444;
  unint64_t v445;
  __int128 v446;
  unint64_t v447;
  unint64_t v448;
  unint64_t v449;
  BOOL v450;
  unint64_t v451;
  __int128 v452;
  unsigned __int128 v453;
  unint64_t v454;
  _BOOL8 v456;
  unint64_t v457;
  unint64_t v458;
  unint64_t v459;
  BOOL v460;

  v4 = a2 & 0x8000000000000000;
  if (((a2 >> 61) & 3) == 3)
  {
    if ((a2 & 0x7800000000000000) == 0x7800000000000000)
    {
      v5 = (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93 && result >= 0x38C15B0A00000000;
      if (!v5)
        v7 = result;
      else
        v7 = 0;
      if ((a2 & 0x3FFFFFFFFFFFLL) <= 0x314DC6448D93)
        v8 = v7;
      else
        v8 = 0;
      if ((a2 & 0x7C00000000000000) == 0x7800000000000000)
        result = 0;
      else
        result = v8;
      if ((a2 & 0x7C00000000000000) != 0x7C00000000000000)
      {
        if (!v4)
          return result;
LABEL_71:
        my_fpsf |= 1u;
        return result;
      }
      goto LABEL_66;
    }
    result = 0;
LABEL_65:
    if ((~a2 & 0x7C00000000000000) != 0)
      return 0;
LABEL_66:
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    return result;
  }
  v9 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0
    || (a2 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && result >= 0x378D8E6400000000)
  {
    result = 0;
    v9 = 0;
  }
  v10 = (a2 >> 49) & 0x3FFF;
  if (!(v9 | result))
    goto LABEL_65;
  if (v4)
  {
    result = 0;
    goto LABEL_71;
  }
  v11 = a2 >> 49;
  *((_QWORD *)&v13 + 1) = v9;
  *(_QWORD *)&v13 = result;
  v12 = v13 >> 61;
  *((_QWORD *)&v13 + 1) = v9;
  *(_QWORD *)&v13 = result;
  v14 = v12 + (v13 >> 63);
  if (10 * result < 2 * result)
    ++v14;
  v15 = (v11 & 1) == 0;
  if ((v11 & 1) != 0)
    v16 = v14;
  else
    v16 = v9;
  if (v15)
    v17 = result;
  else
    v17 = 10 * result;
  v18 = 1.0 / sqrt((double)(unint64_t)v17 + (double)v16 * 1.84467441e19);
  v19 = *(_QWORD *)&v18 >> 52;
  v20 = HIDWORD(*(_QWORD *)&v18) & 0xFFFFFLL | 0x100000;
  v21 = v20 * (unint64_t)v16;
  v22 = HIDWORD(v21) + v20 * (unint64_t)HIDWORD(v16);
  v23 = ((LODWORD(v18) * (unint64_t)v16) >> 32)
      + LODWORD(v18) * (unint64_t)HIDWORD(v16)
      + v21;
  v24 = v20 * (unint64_t)v17;
  v25 = LODWORD(v18) * (unint64_t)v17;
  v26 = HIDWORD(v25) + LODWORD(v18) * (unint64_t)HIDWORD(v17) + v24;
  v27 = LODWORD(v18) * v17;
  v28 = v25 * (unint64_t)LODWORD(v18);
  v29 = (LODWORD(v18) * v17) | ((unint64_t)v26 << 32);
  v30 = __PAIR128__(v22, (LODWORD(v18) * v16) | ((unint64_t)v23 << 32))
      + __PAIR128__(HIDWORD(v23), HIDWORD(v24) + v20 * (unint64_t)HIDWORD(v17) + HIDWORD(v26));
  v31 = v20 * (unint64_t)(LODWORD(v18) * v17);
  v32 = HIDWORD(v28) + v31 + v26 * (unint64_t)LODWORD(v18);
  v33 = HIDWORD(v31) + v26 * (unint64_t)v20 + HIDWORD(v32);
  v34 = (LODWORD(v18) * v16 + HIDWORD(v24) + v20 * HIDWORD(v17) + HIDWORD(v26))
      * (unint64_t)v20;
  v35 = HIDWORD(v34)
      + ((((LODWORD(v18) * v16) | ((unint64_t)v23 << 32))
        + HIDWORD(v24)
        + v20 * (unint64_t)HIDWORD(v17)
        + HIDWORD(v26)) >> 32)
      * v20;
  v36 = DWORD1(v30) * (unint64_t)LODWORD(v18)
      + v34
      + ((v30 * (unint64_t)LODWORD(v18)) >> 32);
  v37 = v35 + HIDWORD(v36);
  v38 = ((LODWORD(v18) * v16 + HIDWORD(v24) + v20 * HIDWORD(v17) + HIDWORD(v26)) * LODWORD(v18)) | ((unint64_t)v36 << 32);
  v39 = ((__PAIR128__(v22, (LODWORD(v18) * v16) | ((unint64_t)v23 << 32))+ __PAIR128__(HIDWORD(v23), HIDWORD(v24) + v20 * (unint64_t)HIDWORD(v17) + HIDWORD(v26))) >> 64)* (unint64_t)v20;
  v40 = HIDWORD(v30) * (unint64_t)LODWORD(v18)
      + v39
      + ((DWORD2(v30) * (unint64_t)LODWORD(v18)) >> 32);
  v41 = HIDWORD(v39)
      + ((__PAIR128__(v22, (LODWORD(v18) * v16) | ((unint64_t)v23 << 32))
        + __PAIR128__(HIDWORD(v23), HIDWORD(v24) + v20 * (unint64_t)HIDWORD(v17) + HIDWORD(v26))) >> 96)
      * v20
      + HIDWORD(v40);
  v42 = (DWORD2(v30) * LODWORD(v18)) | ((unint64_t)v40 << 32);
  v43 = v33 + v38;
  v5 = __CFADD__(__CFADD__(v33, v38), v42);
  v44 = __CFADD__(v33, v38) + v42;
  LODWORD(v45) = v5;
  v5 = __CFADD__(v37, v44);
  v46 = v37 + v44;
  if (v5)
    v45 = 1;
  else
    v45 = v45;
  v47 = v41 + v45;
  v48 = 2 * v19;
  v49 = v28 | ((unint64_t)v32 << 32);
  if (v19 >= 0x3F4)
    v50 = 2086;
  else
    v50 = 2022;
  if (v19 < 0x3F4)
  {
    v49 = v43;
    v43 = v46;
  }
  v51 = (v43 << (v48 - v50)) | (v49 >> (v50 - v48));
  if (v50 == v48)
    v51 = v49;
  v52 = (v47 << (v48 - 102)) | (v46 >> (-90 - v48));
  if ((_DWORD)v19 == 979)
    v52 = v46;
  if (v19 <= 0x3D3)
    v53 = v52;
  else
    v53 = v51;
  v54 = v53 >> 1;
  if (v53 < 0)
  {
    v76 = -(uint64_t)v54;
    v77 = HIDWORD(v76);
    v78 = ((HIDWORD(v76) * (unint64_t)v27) >> 32)
        + HIDWORD(v76) * (unint64_t)v26
        + ((v76 * (unint64_t)v26
          + HIDWORD(v76) * v27
          + ((v76 * (unint64_t)v27) >> 32)) >> 32);
    v79 = HIDWORD(v76) * (unint64_t)v30;
    v80 = HIDWORD(v79) + HIDWORD(v76) * (unint64_t)DWORD1(v30);
    v81 = v76 * (unint64_t)DWORD1(v30)
        + v79
        + ((v76 * (unint64_t)v30) >> 32);
    v82 = v80 + HIDWORD(v81);
    v83 = (v76 * v30) | ((unint64_t)v81 << 32);
    v84 = HIDWORD(v76) * (unint64_t)DWORD2(v30);
    v85 = v76 * (unint64_t)DWORD2(v30);
    v86 = v76 * (unint64_t)HIDWORD(v30) + v84 + HIDWORD(v85);
    v87 = v85 | ((unint64_t)v86 << 32);
    v5 = __CFADD__(v78, v83);
    v88 = v78 + v83;
    v90 = v5;
    v5 = __CFADD__(v5, v87);
    v89 = v90 + v87;
    v91 = v5;
    v5 = __CFADD__(v82, v89);
    v92 = v82 + v89;
    if (v5)
      v93 = 1;
    else
      v93 = v91;
    v94 = (__PAIR128__(v30, v88) + v29) >> 64;
    v72 = v88 + v29;
    v74 = v94 + v92;
    v75 = *((_QWORD *)&v30 + 1)
        + v77 * (unint64_t)HIDWORD(v30)
        + HIDWORD(v84)
        + HIDWORD(v86)
        + v93
        + v30;
  }
  else
  {
    v55 = HIDWORD(v54);
    v56 = (unint64_t)v53 >> 1;
    v57 = ((v55 * (unint64_t)v27) >> 32)
        + v55 * (unint64_t)v26
        + ((v56 * (unint64_t)v26 + v55 * v27 + ((v56 * (unint64_t)v27) >> 32)) >> 32);
    v58 = v55 * (unint64_t)v30;
    v59 = HIDWORD(v58) + v55 * (unint64_t)DWORD1(v30);
    v60 = v56 * (unint64_t)DWORD1(v30) + v58 + ((v56 * (unint64_t)v30) >> 32);
    v61 = v59 + HIDWORD(v60);
    v62 = (v56 * v30) | ((unint64_t)v60 << 32);
    v63 = v55 * (unint64_t)DWORD2(v30);
    v64 = HIDWORD(v63);
    v65 = v56 * (unint64_t)HIDWORD(v30) + v63 + ((v56 * (unint64_t)DWORD2(v30)) >> 32);
    v66 = (v56 * DWORD2(v30)) | ((unint64_t)v65 << 32);
    v5 = __CFADD__(v57, v62);
    v67 = v57 + v62;
    v69 = v5;
    v5 = __CFADD__(v5, v66);
    v68 = v69 + v66;
    LODWORD(v70) = v5;
    v5 = __CFADD__(v61, v68);
    v71 = v61 + v68;
    if (v5)
      v70 = 1;
    else
      v70 = v70;
    v5 = v29 >= v67;
    v72 = v29 - v67;
    v73 = !v5;
    v74 = v30 - v73 - v71;
    v75 = *((_QWORD *)&v30 + 1) - (v64 + v55 * (unint64_t)HIDWORD(v30) + HIDWORD(v65)) - v70 - v30;
  }
  v95 = -78 - v19;
  if (v19 < 0x3B3)
  {
    v96 = 0;
  }
  else
  {
    v95 = 50 - v19;
    v96 = v75;
  }
  if (v19 >= 0x3B3)
    v75 = v74;
  v97 = v95 - 64;
  v98 = v19 > 0x3F2;
  if (v19 <= 0x3F2)
    v99 = v97;
  else
    v99 = 50 - v19;
  if (v98)
    v100 = v74;
  else
    v100 = v96;
  if (v98)
    v75 = v72;
  v101 = (((2 * v100) << ~v99) | (v75 >> v99)) + 1;
  v102 = v101 >> 1;
  if (v102 * v102 == v17
    && ((2 * (v101 >> 1) * (v101 >> 33)
       + ((v102 * (unint64_t)v102) >> 32)) >> 32)
     + (v101 >> 33) * (v101 >> 33) == v16)
  {
    return v101 >> 1;
  }
  v104 = ((unint64_t)COERCE_UNSIGNED_INT((float)result + (float)((float)(unint64_t)v9
                                                                                       * 1.8447e19)) >> 23)
       - 127;
  v105 = __bid_estimate_decimal_digits[v104];
  v106 = (unint64_t *)((char *)&__bid_power10_index_binexp_128 + 16 * v104);
  v107 = v106[1];
  if ((uint64_t)(v9 - v107) > 0 || v9 == v107 && result >= *v106)
    ++v105;
  v108 = (((_BYTE)v10 - (67 - (_BYTE)v105)) & 1) + 67 - v105;
  if (v108 < 39)
  {
    v134 = (unint64_t *)((char *)&__bid_power10_table_128 + 16 * v108);
    v135 = *v134;
    v136 = v134[1];
    v137 = HIDWORD(v136);
    v138 = v136 * (unint64_t)HIDWORD(result);
    v139 = HIDWORD(v138) + HIDWORD(v136) * (unint64_t)HIDWORD(result);
    v140 = HIDWORD(v136) * (unint64_t)result
         + v138
         + ((v136 * (unint64_t)result) >> 32);
    v141 = HIDWORD(v140);
    v142 = (v136 * result) | ((unint64_t)v140 << 32);
    v143 = HIDWORD(v135);
    v144 = v135 * (unint64_t)HIDWORD(result);
    v145 = HIDWORD(v135) * (unint64_t)result
         + v144
         + ((v135 * (unint64_t)result) >> 32);
    v118 = (v135 * result) | ((unint64_t)v145 << 32);
    v147 = v142 + HIDWORD(v144) + HIDWORD(v135) * (unint64_t)HIDWORD(result) + HIDWORD(v145);
    v146 = (__PAIR128__(v139, v142)
          + __PAIR128__(v141, HIDWORD(v144) + HIDWORD(v135) * (unint64_t)HIDWORD(result) + HIDWORD(v145))) >> 64;
    v148 = v136 * (unint64_t)HIDWORD(v9);
    v149 = v136 * (unint64_t)v9;
    v150 = v137 * (unint64_t)v9;
    v151 = HIDWORD(v148) + v137 * (unint64_t)HIDWORD(v9);
    v152 = v150 + v148 + HIDWORD(v149);
    v153 = HIDWORD(v152);
    v154 = v149 | ((unint64_t)v152 << 32);
    v155 = v135 * (unint64_t)HIDWORD(v9);
    v156 = v135 * (unint64_t)v9;
    v157 = HIDWORD(v155) + v143 * (unint64_t)HIDWORD(v9);
    v158 = v143 * (unint64_t)v9 + v155 + HIDWORD(v156);
    v159 = v156 | ((unint64_t)v158 << 32);
    v160 = v154 + v157 + HIDWORD(v158);
    v128 = (__PAIR128__(v151, v154) + __PAIR128__(v153, v157 + HIDWORD(v158))) >> 64;
    v5 = __CFADD__(v147, v159);
    v162 = v147 + v159;
    v161 = (__PAIR128__(v160, v147) + v159) >> 64;
    v130 = v162;
    v163 = __CFADD__(v5, v160);
    v5 = __CFADD__(v146, v161);
    v133 = v146 + v161;
    v132 = v5 || v163;
  }
  else
  {
    v109 = (uint64_t *)((char *)&__bid_power10_table_128 + 16 * (v108 - 37));
    v110 = *v109;
    v111 = *v109 * (unint64_t)HIDWORD(result);
    v112 = *v109 * v9
         + v109[1] * result
         + HIDWORD(*v109) * HIDWORD(result)
         + HIDWORD(v111)
         + ((HIDWORD(*v109) * result
           + v111
           + ((*v109 * (unint64_t)result) >> 32)) >> 32);
    LODWORD(v109) = (result * *v109) >> 32;
    v113 = (v110 * result);
    v114 = 3587851993 * v109;
    v115 = HIDWORD(v114) + 126217744 * v109;
    v116 = ((3587851993u * (unint64_t)v113) >> 32)
         + 126217744 * v113
         + v114;
    v117 = ((16004768 * (unint64_t)v113) >> 32) + 16004768 * v109;
    v118 = 0xF436A000000000 * v113;
    v119 = __PAIR128__(HIDWORD(v116), (-707115303 * v113) | ((unint64_t)v116 << 32))
         + __PAIR128__(v115, v117);
    v120 = HIDWORD(v112);
    v121 = 3587851993 * HIDWORD(v112);
    v122 = HIDWORD(v121) + 126217744 * HIDWORD(v112);
    v123 = 126217744 * v112
         + v121
         + ((3587851993u * (unint64_t)v112) >> 32);
    v124 = HIDWORD(v123);
    v125 = (-707115303 * v112) | ((unint64_t)v123 << 32);
    v126 = (16004768 * (unint64_t)v112) >> 32;
    v127 = 0xF436A000000000 * v112;
    v129 = v125 + v126 + 16004768 * v120;
    v128 = (__PAIR128__(v122, v125) + __PAIR128__(v124, v126 + 16004768 * v120)) >> 64;
    v5 = __CFADD__(v127, (_QWORD)v119);
    v131 = (__PAIR128__(v129, v127) + (unint64_t)v119) >> 64;
    v130 = v127 + v119;
    v132 = __CFADD__(v5, v129);
    v5 = __CFADD__(*((_QWORD *)&v119 + 1), v131);
    v133 = *((_QWORD *)&v119 + 1) + v131;
    if (v5)
      v132 = 1;
  }
  v164 = v128 + v132;
  v165 = 1.0
       / sqrt((double)v164 * 1.84467441e19 * 3.40282367e38+ (double)v133 * 3.40282367e38+ (double)v130 * 1.84467441e19+ (double)v118);
  v166 = HIDWORD(*(_QWORD *)&v165) & 0xFFFFFLL | 0x100000;
  v167 = LODWORD(v165) * (unint64_t)v118;
  v168 = v166 * (unint64_t)v118;
  v169 = HIDWORD(v167) + LODWORD(v165) * (unint64_t)HIDWORD(v118) + v168;
  v170 = HIDWORD(v168) + v166 * (unint64_t)HIDWORD(v118) + HIDWORD(v169);
  v171 = v166 * (unint64_t)v130;
  v172 = HIDWORD(v171) + v166 * (unint64_t)HIDWORD(v130);
  v173 = ((LODWORD(v165) * (unint64_t)v130) >> 32)
       + LODWORD(v165) * (unint64_t)HIDWORD(v130)
       + v171;
  v174 = v172 + HIDWORD(v173);
  v175 = v166 * (unint64_t)v133;
  v176 = HIDWORD(v175) + v166 * (unint64_t)HIDWORD(v133);
  v177 = ((LODWORD(v165) * (unint64_t)v133) >> 32)
       + LODWORD(v165) * (unint64_t)HIDWORD(v133)
       + v175;
  v178 = v176 + HIDWORD(v177);
  v179 = v166 * (unint64_t)v164;
  v180 = ((LODWORD(v165) * (unint64_t)v164) >> 32)
       + LODWORD(v165) * (unint64_t)HIDWORD(v164)
       + v179;
  v181 = *(_QWORD *)&v165 >> 52;
  v182 = (LODWORD(v165) * v130) | ((unint64_t)v173 << 32);
  v183 = (LODWORD(v165) * v133) | ((unint64_t)v177 << 32);
  v184 = (LODWORD(v165) * v164) | ((unint64_t)v180 << 32);
  v185 = v170 + v182;
  v5 = __CFADD__(__CFADD__(v170, v182), v183);
  v186 = __CFADD__(v170, v182) + v183;
  v187 = v5;
  v188 = v174 + v186;
  if (__CFADD__(v174, v186))
    v189 = 1;
  else
    v189 = v187;
  v5 = __CFADD__(v184, v189);
  v190 = v184 + v189;
  v191 = v166 * (unint64_t)v167;
  v192 = (v167 * (unint64_t)LODWORD(v165)) >> 32;
  v193 = v5;
  v194 = v178 + v190;
  if (__CFADD__(v178, v190))
    v195 = 1;
  else
    v195 = v193;
  v196 = HIDWORD(v179) + v166 * (unint64_t)HIDWORD(v164) + HIDWORD(v180) + v195;
  v197 = HIDWORD(v191)
       + v169 * (unint64_t)v166
       + ((v192 + v191 + v169 * (unint64_t)LODWORD(v165)) >> 32);
  v198 = v185 * (unint64_t)v166;
  v199 = HIDWORD(v198) + HIDWORD(v185) * (unint64_t)v166;
  v200 = HIDWORD(v185) * (unint64_t)LODWORD(v165)
       + v198
       + ((v185 * (unint64_t)LODWORD(v165)) >> 32);
  v201 = v199 + HIDWORD(v200);
  v202 = (v185 * LODWORD(v165)) | ((unint64_t)v200 << 32);
  v203 = v188 * (unint64_t)v166;
  v204 = HIDWORD(v203) + HIDWORD(v188) * (unint64_t)v166;
  v205 = HIDWORD(v188) * (unint64_t)LODWORD(v165)
       + v203
       + ((v188 * (unint64_t)LODWORD(v165)) >> 32);
  v206 = v204 + HIDWORD(v205);
  v207 = v205 << 32;
  v208 = HIDWORD(v194);
  v209 = v194;
  v210 = v194 * (unint64_t)v166;
  v211 = HIDWORD(v210) + HIDWORD(v194) * (unint64_t)v166;
  v212 = HIDWORD(v194) * (unint64_t)LODWORD(v165)
       + v210
       + ((v194 * (unint64_t)LODWORD(v165)) >> 32);
  v213 = v211 + HIDWORD(v212);
  v214 = (v194 * LODWORD(v165)) | ((unint64_t)v212 << 32);
  v215 = HIDWORD(v196);
  v216 = v196;
  v217 = v196 * (unint64_t)v166;
  v218 = HIDWORD(v196) * (unint64_t)LODWORD(v165)
       + v217
       + ((v196 * (unint64_t)LODWORD(v165)) >> 32);
  v219 = HIDWORD(v217) + HIDWORD(v196) * (unint64_t)v166 + HIDWORD(v218);
  v220 = (v196 * LODWORD(v165)) | ((unint64_t)v218 << 32);
  v221 = __CFADD__(v202, v197);
  v222 = (v188 * LODWORD(v165)) + __CFADD__(v202, v197) + v207;
  v224 = __CFADD__(v222, v201) || v222 < v221;
  v5 = __CFADD__(v214, v224);
  v225 = v214 + v224;
  LODWORD(v226) = v5;
  v5 = __CFADD__(v206, v225);
  v227 = v206 + v225;
  if (v5)
    v226 = 1;
  else
    v226 = v226;
  v5 = __CFADD__(v220, v226);
  v228 = v220 + v226;
  LODWORD(v229) = v5;
  v5 = __CFADD__(v213, v228);
  v230 = v213 + v228;
  if (v5)
    v229 = 1;
  else
    v229 = v229;
  v231 = v219 + v229;
  v232 = (v230 << (2 * v181 + 25)) | (v227 >> (39 - 2 * v181));
  v233 = (v231 << (2 * v181 + 26)) | (v230 >> (38 - 2 * v181));
  v234 = v233 >> 1;
  if (v233 < 0)
  {
    v273 = -(uint64_t)v232;
    if (v232)
      v234 = ~v234;
    else
      v234 = -(uint64_t)v234;
    v274 = HIDWORD(v273);
    v275 = HIDWORD(v273) * (unint64_t)v196;
    v276 = HIDWORD(v275) + HIDWORD(v273) * (unint64_t)HIDWORD(v196);
    v277 = v273 * (unint64_t)HIDWORD(v196)
         + v275
         + ((v273 * (unint64_t)v196) >> 32);
    v278 = HIDWORD(v277);
    v279 = (v273 * v196) | ((unint64_t)v277 << 32);
    v280 = HIDWORD(v273) * (unint64_t)v194;
    v281 = v273 * (unint64_t)v194;
    v282 = v273 * (unint64_t)HIDWORD(v194) + v280 + HIDWORD(v281);
    v283 = HIDWORD(v280) + v274 * (unint64_t)HIDWORD(v194) + HIDWORD(v282);
    v5 = __CFADD__(v279, v283);
    v284 = v279 + v283;
    v285 = v278 + v5 + v276;
    v246 = HIDWORD(v234);
    v247 = v234;
    v286 = HIDWORD(v234) * (unint64_t)v196;
    v287 = v234 * (unint64_t)HIDWORD(v196)
         + v286
         + ((v234 * (unint64_t)v196) >> 32);
    v288 = HIDWORD(v287);
    v289 = (v234 * v196) | ((unint64_t)v287 << 32);
    v290 = HIDWORD(v234) * (unint64_t)v194;
    v291 = HIDWORD(v290) + HIDWORD(v234) * (unint64_t)HIDWORD(v194);
    v292 = v234 * (unint64_t)HIDWORD(v194)
         + v290
         + ((v234 * (unint64_t)v194) >> 32);
    v293 = (v234 * v194) | ((unint64_t)v292 << 32);
    v294 = __PAIR128__(v288, v289)
         + __PAIR128__(v196 + HIDWORD(v234) * (unint64_t)HIDWORD(v196) + HIDWORD(v286), v291 + HIDWORD(v292));
    v5 = __CFADD__(v293, v284);
    v295 = v293 + v284;
    v297 = v5;
    v5 = __CFADD__(v5, v289 + v291 + HIDWORD(v292));
    v296 = v297 + v289 + v291 + HIDWORD(v292);
    v298 = v5;
    v5 = __CFADD__(v285, v296);
    v299 = v285 + v296;
    if (v5)
      v300 = 1;
    else
      v300 = v298;
    v263 = v185 + v281 + (v282 << 32);
    v301 = v263 < v185;
    v5 = __CFADD__(v188, v301);
    v302 = v188 + v301;
    v303 = v5;
    v265 = v295 + v302;
    if (__CFADD__(v295, v302))
      v304 = 1;
    else
      v304 = v303;
    v5 = __CFADD__(v194, v304);
    v305 = v194 + v304;
    v306 = v5;
    v5 = __CFADD__(v305, v299);
    v269 = v305 + v299;
    if (v5)
      v307 = 1;
    else
      v307 = v306;
    v272 = *((_QWORD *)&v294 + 1) + v300 + v307;
  }
  else
  {
    v235 = HIDWORD(v232);
    v236 = HIDWORD(v232) * (unint64_t)v196;
    v237 = HIDWORD(v236) + HIDWORD(v232) * (unint64_t)HIDWORD(v196);
    v238 = v232 * (unint64_t)HIDWORD(v196)
         + v236
         + ((v232 * (unint64_t)v196) >> 32);
    v239 = HIDWORD(v238);
    v240 = (v232 * v196) | ((unint64_t)v238 << 32);
    v241 = HIDWORD(v232) * (unint64_t)v194;
    v242 = v232 * (unint64_t)v194;
    v243 = v232 * (unint64_t)HIDWORD(v194) + v241 + HIDWORD(v242);
    v244 = v242 | ((unint64_t)v243 << 32);
    v245 = __PAIR128__(v237, v240)
         + __PAIR128__(v239, HIDWORD(v241) + v235 * (unint64_t)HIDWORD(v194) + HIDWORD(v243));
    v246 = HIDWORD(v234);
    v247 = (unint64_t)v233 >> 1;
    v248 = HIDWORD(v234) * (unint64_t)v196;
    v249 = HIDWORD(v248);
    v250 = v247 * (unint64_t)HIDWORD(v196)
         + v248
         + ((v247 * (unint64_t)v196) >> 32);
    v251 = (v247 * v196) | ((unint64_t)v250 << 32);
    v252 = HIDWORD(v234) * (unint64_t)v194;
    v253 = HIDWORD(v252) + HIDWORD(v234) * (unint64_t)HIDWORD(v194);
    v254 = v247 * (unint64_t)HIDWORD(v194)
         + v252
         + ((v247 * (unint64_t)v194) >> 32);
    v255 = v253 + HIDWORD(v254);
    v256 = (v247 * v194) | ((unint64_t)v254 << 32);
    v257 = v251 + v255;
    v258 = __CFADD__(v251, v255);
    v259 = v256 + v245;
    v5 = __CFADD__(__CFADD__(v256, (_QWORD)v245), v257);
    v260 = __CFADD__(v256, (_QWORD)v245) + v257;
    LODWORD(v261) = v5;
    v262 = *((_QWORD *)&v245 + 1) + v260;
    if (__CFADD__(*((_QWORD *)&v245 + 1), v260))
      v261 = 1;
    else
      v261 = v261;
    v264 = __PAIR128__(v188, v185) - v244;
    v263 = v264;
    v265 = *((_QWORD *)&v264 + 1) - v259;
    v267 = *((_QWORD *)&v264 + 1) > v188 || *((_QWORD *)&v264 + 1) < v259;
    v268 = v194 - v267;
    v269 = v268 - v262;
    v271 = v268 < v262 || v268 > v194;
    v272 = v196 - (v249 + HIDWORD(v234) * (unint64_t)HIDWORD(v196) + HIDWORD(v250)) - v258 - v261 - v271;
  }
  v308 = v234 + (v234 >> 1);
  v309 = HIDWORD(v308);
  v310 = HIDWORD(v308) * (unint64_t)v247;
  v311 = v308 * (unint64_t)v247;
  v312 = v308 * (unint64_t)v246 + v310 + HIDWORD(v311);
  v313 = HIDWORD(v310) + v309 * (unint64_t)v246 + HIDWORD(v312);
  LODWORD(v310) = v311;
  v314 = v312 * (unint64_t)v216;
  v315 = v311 * (unint64_t)v216;
  v316 = HIDWORD(v314) + v312 * (unint64_t)v215;
  v317 = HIDWORD(v315) + v310 * (unint64_t)v215 + v314;
  v318 = HIDWORD(v317);
  v319 = v315 | ((unint64_t)v317 << 32);
  v320 = v312 * (unint64_t)v209;
  v321 = v310 * (unint64_t)v209;
  v322 = HIDWORD(v321) + v310 * (unint64_t)v208 + v320;
  v323 = v321 | ((unint64_t)v322 << 32);
  v324 = __PAIR128__(v316, v319)
       + __PAIR128__(v318, HIDWORD(v320) + v312 * (unint64_t)v208 + HIDWORD(v322));
  v325 = HIDWORD(v313);
  v326 = HIDWORD(v313) * (unint64_t)v216;
  v327 = v313 * (unint64_t)v216;
  v328 = v313 * (unint64_t)v215 + v326 + HIDWORD(v327);
  v329 = HIDWORD(v328);
  v330 = v327 | ((unint64_t)v328 << 32);
  v331 = HIDWORD(v313) * (unint64_t)v209;
  v332 = v313 * (unint64_t)v209;
  v333 = v313 * (unint64_t)v208 + v331 + HIDWORD(v332);
  v334 = v332 | ((unint64_t)v333 << 32);
  v335 = __PAIR128__(v329, v330)
       + __PAIR128__(v272 + v325 * (unint64_t)v215 + HIDWORD(v326), HIDWORD(v331) + v325 * (unint64_t)v208 + HIDWORD(v333));
  v336 = v334 + v324;
  v5 = __CFADD__(__CFADD__(v334, (_QWORD)v324), v330 + HIDWORD(v331) + v325 * (unint64_t)v208 + HIDWORD(v333));
  v337 = __CFADD__(v334, (_QWORD)v324)
       + v330
       + HIDWORD(v331)
       + v325 * (unint64_t)v208
       + HIDWORD(v333);
  LODWORD(v338) = v5;
  v5 = __CFADD__(*((_QWORD *)&v324 + 1), v337);
  v339 = *((_QWORD *)&v324 + 1) + v337;
  if (v5)
    v338 = 1;
  else
    v338 = v338;
  v340 = __CFADD__(v263, v323) + v265;
  v341 = __CFADD__(__CFADD__(v263, v323), v265);
  v5 = __CFADD__(v340, v336);
  v342 = v340 + v336;
  v343 = v5 || v341;
  v5 = __CFADD__(v269, v343);
  v344 = v269 + v343;
  v345 = v5;
  v5 = __CFADD__(v344, v339);
  v346 = v344 + v339;
  if (v5)
    v347 = 1;
  else
    v347 = v345;
  v348 = -78 - v181;
  v349 = v181 - 114;
  v350 = (v346 << v349) | (v342 >> v348);
  v351 = ((*((_QWORD *)&v335 + 1) + v338 + v347) << v349) | (v346 >> v348);
  v5 = __CFADD__(v350, 1);
  v352 = v350 + 1;
  if (v5)
    v353 = v351 + 1;
  else
    v353 = v351;
  *((_QWORD *)&v355 + 1) = v353;
  *(_QWORD *)&v355 = v352;
  v354 = v355 >> 1;
  v356 = v353 >> 1;
  if ((a3 & 3) == 0)
  {
    *((_QWORD *)&v401 + 1) = v164;
    *(_QWORD *)&v401 = v133;
    v400 = v401 >> 62;
    *((_QWORD *)&v401 + 1) = v353 >> 1;
    *(_QWORD *)&v401 = v354;
    v402 = v401 >> 63;
    v403 = HIDWORD(v402);
    v404 = v401 >> 63;
    v405 = HIDWORD(v402) * (unint64_t)v404;
    v406 = v402 * (unint64_t)v402;
    v407 = HIDWORD(v405) + v403 * (unint64_t)v403;
    v408 = v405 + v405 + HIDWORD(v406);
    v409 = v407 + HIDWORD(v408);
    v410 = v406 | ((unint64_t)v408 << 32);
    LODWORD(v408) = v354 >> 31;
    v411 = v408 * (unint64_t)v404;
    v412 = ((2 * (_DWORD)v354) | 1u) * (unint64_t)v404;
    v413 = ((2 * (_DWORD)v354) | 1u) * (unint64_t)v403 + v411 + HIDWORD(v412);
    v414 = HIDWORD(v411) + v408 * (unint64_t)v403 + HIDWORD(v413);
    v415 = v412 | ((unint64_t)v413 << 32);
    v416 = v409 + (v414 >> 63);
    *((_QWORD *)&v401 + 1) = v414;
    *(_QWORD *)&v401 = v413 << 32;
    v417 = v401 >> 63;
    v418 = ((2 * (_DWORD)v354) | 1u) * (unint64_t)v408;
    v419 = v418 + v418 + ((((2 * (_DWORD)v354) | 1u) * (unint64_t)((2 * (_DWORD)v354) | 1u)) >> 32);
    v420 = HIDWORD(v418) + v408 * (unint64_t)v408 + HIDWORD(v419);
    v5 = __CFADD__(v420, 2 * v415);
    v421 = v420 + 2 * v415;
    v423 = v5;
    v5 = __CFADD__(v5, v417);
    v422 = v423 + v417;
    v424 = v5;
    v425 = v410 + v422;
    if (__CFADD__(v410, v422))
      v426 = 1;
    else
      v426 = v424;
    v427 = v416 + v426;
    if (v400 > v416 + v426)
      goto LABEL_261;
    *((_QWORD *)&v446 + 1) = v133;
    *(_QWORD *)&v446 = v130;
    v445 = v446 >> 62;
    v447 = 4 * v118;
    v448 = (((2 * (_DWORD)v354) | 1) * ((2 * (_DWORD)v354) | 1u)) | ((unint64_t)v419 << 32);
    *((_QWORD *)&v446 + 1) = v130;
    *(_QWORD *)&v446 = v118;
    v449 = v446 >> 62;
    if (v400 != v416 + v426)
      goto LABEL_319;
    if (v445 > v425 || v445 == v425 && (v449 > v421 || (v449 == v421 ? (v450 = v447 > v448) : (v450 = 0), v450)))
    {
LABEL_261:
      v5 = __CFADD__(v354++, 1);
      if (v5)
        ++v356;
    }
    else
    {
LABEL_319:
      *((_QWORD *)&v452 + 1) = v356;
      *(_QWORD *)&v452 = v354;
      v451 = v452 >> 61;
      v453 = __PAIR128__(v421, v448) - 8 * v354;
      v454 = *((_QWORD *)&v453 + 1) - v451;
      v456 = *((_QWORD *)&v453 + 1) < v451 || *((_QWORD *)&v453 + 1) > v421;
      v457 = v425 - v456;
      v458 = (__PAIR128__(v427, v425) - (v425 - v456)) >> 64;
      if (v458 > v400
        || v458 == v400
        && (v457 > v445
         || v457 == v445 && (v454 > v449 || (v454 == v449 ? (v460 = (unint64_t)v453 > v447) : (v460 = 0), v460))))
      {
        v356 = (__PAIR128__(v356, v354--) - 1) >> 64;
      }
    }
    goto LABEL_336;
  }
  v357 = v353 >> 33;
  v358 = v353 >> 1;
  v359 = v357 * (unint64_t)v358;
  v360 = HIDWORD(v359) + v357 * (unint64_t)v357;
  v361 = v359 + v359 + ((v356 * (unint64_t)v356) >> 32);
  v362 = v360 + HIDWORD(v361);
  v363 = (v356 * v356) | ((unint64_t)v361 << 32);
  v364 = HIDWORD(v354) * (unint64_t)v358;
  v365 = v354 * (unint64_t)v357;
  v366 = HIDWORD(v364) + HIDWORD(v354) * (unint64_t)v357;
  v367 = v365 + v364 + ((v354 * (unint64_t)v356) >> 32);
  v368 = (v354 * v356) | ((unint64_t)v367 << 32);
  *((_QWORD *)&v370 + 1) = v366 + HIDWORD(v367);
  *(_QWORD *)&v370 = v367 << 32;
  v369 = v370 >> 63;
  v371 = HIDWORD(v354) * (unint64_t)v354;
  v372 = HIDWORD(v371) + HIDWORD(v354) * (unint64_t)HIDWORD(v354);
  v373 = v371 + v371 + ((v354 * (unint64_t)v354) >> 32);
  v374 = v372 + HIDWORD(v373);
  v375 = (v354 * v354) | ((unint64_t)v373 << 32);
  v5 = __CFADD__(v374, 2 * v368);
  v376 = v374 + 2 * v368;
  v378 = v5;
  v5 = __CFADD__(v5, v369);
  v377 = v378 + v369;
  v379 = v5;
  v380 = v363 + v377;
  if (__CFADD__(v363, v377))
    v381 = 1;
  else
    v381 = v379;
  v382 = v362 + v381;
  *((_QWORD *)&v384 + 1) = v356;
  *(_QWORD *)&v384 = v354;
  v383 = v384 >> 63;
  v385 = 2 * v354;
  if (v382 > v164
    || v382 == v164
    && (v380 > v133 || v380 == v133 && (v376 > v130 || (v376 == v130 ? (v428 = v375 > v118) : (v428 = 0), v428))))
  {
    v386 = __PAIR128__(v376, v375) - (unint64_t)v385;
    v5 = *((_QWORD *)&v386 + 1) >= v383;
    v387 = *((_QWORD *)&v386 + 1) - v383;
    v389 = !v5 || *((_QWORD *)&v386 + 1) > v376;
    v390 = v380 - v389;
    v391 = (__PAIR128__(v382, v380) - v390) >> 64;
    if (v390 == -1)
      v392 = v391 + 1;
    else
      v392 = v391;
    v393 = v387 + 1;
    if (v387 == -1)
    {
      v394 = v390 + 1;
    }
    else
    {
      v392 = v391;
      v394 = v390;
    }
    if (v387 == -1)
      v393 = 0;
    if ((_QWORD)v386 == -1)
      v395 = v392;
    else
      v395 = v391;
    if ((_QWORD)v386 == -1)
      v396 = v394;
    else
      v396 = v390;
    if ((_QWORD)v386 == -1)
      v397 = v393;
    else
      v397 = v387;
    v356 = (__PAIR128__(v356, v354) - 1) >> 64;
    v398 = v354 - 1;
    if (v395 > v164
      || v395 == v164
      && (v396 > v133
       || v396 == v133 && (v397 > v130 || (v397 == v130 ? (v399 = (uint64_t)v386 + 1 > v118) : (v399 = 0), v399))))
    {
      v356 = (__PAIR128__(v356, v354 - 1) - 1) >> 64;
      v398 = v354 - 2;
    }
    goto LABEL_328;
  }
  v429 = v375 + v385;
  v5 = __CFADD__(__CFADD__(v375, v385), v376);
  v430 = __CFADD__(v375, v385) + v376;
  v431 = v5;
  v5 = __CFADD__(v430, v383);
  v432 = v430 + v383;
  if (v5)
    v433 = 1;
  else
    v433 = v431;
  v5 = __CFADD__(v380, v433);
  v434 = v380 + v433;
  if (v5)
    v435 = v382 + 1;
  else
    v435 = v382;
  if (v434 == -1)
    v436 = v435 + 1;
  else
    v436 = v435;
  v437 = v432 + 1;
  if (v432 == -1)
  {
    v438 = v434 + 1;
  }
  else
  {
    v436 = v435;
    v438 = v434;
  }
  if (v432 == -1)
    v437 = 0;
  v439 = __CFADD__(v429, 1);
  v440 = v429 + 1;
  if (v429 == -1)
    v441 = v436;
  else
    v441 = v435;
  if (v439)
    v442 = v438;
  else
    v442 = v434;
  if (v439)
    v443 = v437;
  else
    v443 = v432;
  if (v441 < v164)
    goto LABEL_308;
  if (v441 != v164)
    goto LABEL_327;
  if (v442 < v133)
    goto LABEL_308;
  if (v442 == v133)
  {
    if (v443 < v130 || (v443 == v130 ? (v444 = v440 > v118) : (v444 = 1), v398 = v354, !v444))
    {
LABEL_308:
      v398 = v354 + 1;
      if (v354 == -1)
        ++v356;
    }
  }
  else
  {
LABEL_327:
    v398 = v354;
  }
LABEL_328:
  if (v398 == -1)
    v459 = v356 + 1;
  else
    v459 = v356;
  if (a3 == 2)
    v354 = v398 + 1;
  else
    v354 = v398;
  if (a3 == 2)
    v356 = v459;
LABEL_336:
  my_fpsf |= 0x20u;
  if (v354 == 0x378D8E6400000000 && v356 == 0x1ED09BEAD87C0)
    return 0x38C15B0A00000000;
  else
    return v354;
}

uint64_t __bid128_to_string(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  _BYTE *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  int v12;
  char v13;
  uint64_t v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  unint64_t v22;
  char *v23;
  char *v24;
  BOOL v25;
  unsigned int *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  unsigned int v106;
  int v107;
  unint64_t v108;
  unint64_t v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  char *v124;
  _BYTE *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unsigned int *v130;
  unsigned int v131;
  char *v132;
  char v133;
  int v134;
  unsigned int v135;
  BOOL v136;
  char v137;
  unsigned int v138;
  signed int v139;
  uint64_t v140;
  char v141;
  int v142;
  uint64_t v143;
  char *v144;
  int v145;
  uint64_t v146;
  char *v147;
  _BYTE v148[4];
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  unsigned int v153;
  _QWORD v154[4];

  v3 = result;
  v154[3] = *MEMORY[0x1E0C80C00];
  if ((~a3 & 0x7800000000000000) == 0)
  {
    if ((~a3 & 0x7C00000000000000) != 0)
    {
      v5 = (_BYTE *)(result + 4);
      if (a3 < 0)
        v12 = 1718503725;
      else
        v12 = 1718503723;
      *(_DWORD *)result = v12;
    }
    else
    {
      if (a3 >= 0)
        v4 = 43;
      else
        v4 = 45;
      *(_BYTE *)result = v4;
      if ((~a3 & 0x7E00000000000000) != 0)
      {
        v5 = (_BYTE *)(result + 4);
        *(_WORD *)(result + 1) = 24910;
        *(_BYTE *)(result + 3) = 78;
      }
      else
      {
        *(_DWORD *)(result + 1) = 1314999891;
        v5 = (_BYTE *)(result + 5);
      }
    }
    goto LABEL_190;
  }
  v6 = a3 & 0x1FFFFFFFFFFFFLL;
  if (a3 & 0x1FFFFFFFFFFFFLL | a2)
  {
    v7 = 4 * a3;
    if ((a3 & 0x6000000000000000) != 0x6000000000000000)
      v7 = a3;
    v8 = (v7 >> 49) & 0x3FFF;
    v9 = v8 - 6176;
    if (a3 < 0)
      v10 = 45;
    else
      v10 = 43;
    *(_BYTE *)result = v10;
    if (v6 > 0x1ED09BEAD87C0
      || (a2 > 0x378D8E63FFFFFFFFLL ? (v17 = v6 == 0x1ED09BEAD87C0) : (v17 = 0),
          !v17 ? (v18 = 0) : (v18 = 1),
          (a3 & 0x6000000000000000) == 0x6000000000000000 || v18))
    {
      *(_BYTE *)(result + 1) = 48;
      v11 = 2;
LABEL_179:
      *(_BYTE *)(v3 + v11) = 69;
      v135 = 6176 - v8;
      v136 = v8 >> 5 >= 0xC1;
      if (v8 >> 5 >= 0xC1)
        v137 = 43;
      else
        v137 = 45;
      if (v136)
        v135 = v9;
      *(_BYTE *)(v3 + v11 + 1) = v137;
      v138 = v11 + 2;
      v139 = (16778 * v135) >> 24;
      v140 = -1000 * v139 + (int)v135;
      if (v135 >= 0x3E8)
      {
        *(_BYTE *)(v3 + v138) = v139 + 48;
        v143 = 3 * (int)v140;
        *(_BYTE *)(v3 + v11 + 3) = __bid_char_table3[v143];
        v144 = &__bid_char_table3[(int)v143];
        v138 = v11 + 5;
        *(_BYTE *)(v3 + v11 + 4) = v144[1];
        v141 = v144[2];
        v142 = 6;
      }
      else if (v140 > 9)
      {
        if (v140 > 0x63)
        {
          v146 = 3 * v140;
          *(_BYTE *)(v3 + v138) = __bid_char_table3[v146];
          v147 = &__bid_char_table3[(int)v146];
          v138 = v11 + 4;
          *(_BYTE *)(v3 + v11 + 3) = v147[1];
          v141 = v147[2];
          v142 = 5;
        }
        else
        {
          v145 = 2 * v140;
          *(_BYTE *)(v3 + v138) = __bid_char_table2[v145 - 20];
          v138 = v11 + 3;
          v141 = __bid_char_table2[v145 - 19];
          v142 = 4;
        }
      }
      else
      {
        v141 = v140 + 48;
        v142 = 3;
      }
      *(_BYTE *)(v3 + v138) = v141;
      v5 = (_BYTE *)(v3 + v11 + v142);
      goto LABEL_190;
    }
    v19 = a2 & 0x7FFFFFFFFFFFFFFLL;
    *((_QWORD *)&v21 + 1) = a3 & 0x1FFFFFFFFFFFFLL;
    *(_QWORD *)&v21 = a2;
    v20 = v21 >> 59;
    if (!v20)
      goto LABEL_48;
    v22 = 0;
    v23 = (char *)&__bid_mod10_18_tbl;
    do
    {
      v24 = &v23[16 * (v20 & 0x3F)];
      v19 += *((_QWORD *)v24 + 1);
      v22 += *(_QWORD *)v24 + (((v19 + 0x21F494C589C0000) & 0x1000000000000000) >> 60);
      if (((v19 + 0x21F494C589C0000) & 0x1000000000000000) != 0)
        v19 = (v19 + 0x21F494C589C0000) & 0xFFFFFFFFFFFFFFFLL;
      v23 += 1024;
      v25 = v20 > 0x3F;
      v20 >>= 6;
    }
    while (v25);
    if (v22)
    {
      if (v22 >= 0x3B9ACA00)
      {
        v39 = (2305843009u * (v22 >> 28)) >> 33;
        v40 = v22 - 1000000000 * (int)v39;
        if (v40 <= 0x3B9AC9FF)
          LODWORD(v22) = ((2305843009u * (v22 >> 28)) >> 32) >> 1;
        else
          LODWORD(v22) = v39 + 1;
        if (v40 <= 0x3B9AC9FF)
          v41 = 0;
        else
          v41 = -1000000000;
        v42 = v41 + v40;
        if (v22 >= 0xF4240)
        {
          v75 = (34359 * (v22 >> 17)) >> 18;
          v76 = v22 - 1000000 * v75;
          v77 = v76 - 1000000;
          if (v76 > 0xF423F)
          {
            LODWORD(v22) = v75 + 1;
          }
          else
          {
            v77 = v76;
            LODWORD(v22) = v75;
          }
          v78 = (v77 & 0x3FF) + 32 * (v77 >> 10) - 8 * (v77 >> 10);
          v79 = (v78 >> 10) + (v77 >> 10);
          v80 = (v78 & 0x3FF) + 32 * (v78 >> 10) - 8 * (v78 >> 10);
          if (v80 > 0x3E7)
          {
            ++v79;
            v80 -= 1000;
          }
          v149 = v79;
          v150 = v80;
          v81 = (34359 * (v42 >> 17)) >> 18;
          v82 = v42 - 1000000 * v81;
          if (v82 > 0xF423F)
          {
            v82 -= 1000000;
            ++v81;
          }
          v83 = (v82 & 0x3FF) + 32 * (v82 >> 10) - 8 * (v82 >> 10);
          v84 = (v83 >> 10) + (v82 >> 10);
          v85 = (v83 & 0x3FF) + 32 * (v83 >> 10) - 8 * (v83 >> 10);
          if (v85 > 0x3E7)
          {
            ++v84;
            v85 -= 1000;
          }
          v151 = v81;
          v152 = v84;
          v26 = (unsigned int *)v154;
          v153 = v85;
        }
        else if (v22 >= 0x3E8)
        {
          v100 = (v22 & 0x3FF) + 32 * (v22 >> 10) - 8 * (v22 >> 10);
          LODWORD(v22) = (v100 >> 10) + (v22 >> 10);
          v101 = (v100 & 0x3FF) + 32 * (v100 >> 10) - 8 * (v100 >> 10);
          if (v101 > 0x3E7)
          {
            LODWORD(v22) = v22 + 1;
            v101 -= 1000;
          }
          v102 = (34359 * (v42 >> 17)) >> 18;
          v103 = v42 - 1000000 * v102;
          if (v103 > 0xF423F)
          {
            v103 -= 1000000;
            ++v102;
          }
          v104 = (v103 & 0x3FF) + 32 * (v103 >> 10) - 8 * (v103 >> 10);
          v105 = (v104 >> 10) + (v103 >> 10);
          v106 = (v104 & 0x3FF) + 32 * (v104 >> 10) - 8 * (v104 >> 10);
          if (v106 <= 0x3E7)
          {
            v107 = v105;
          }
          else
          {
            v106 -= 1000;
            v107 = v105 + 1;
          }
          v149 = v101;
          v150 = v102;
          v26 = &v153;
          v151 = v107;
          v152 = v106;
        }
        else
        {
          v43 = (34359 * (v42 >> 17)) >> 18;
          v44 = v42 - 1000000 * v43;
          if (v44 > 0xF423F)
          {
            v44 -= 1000000;
            ++v43;
          }
          v45 = (v44 & 0x3FF) + 32 * (v44 >> 10) - 8 * (v44 >> 10);
          v46 = (v45 >> 10) + (v44 >> 10);
          v47 = (v45 & 0x3FF) + 32 * (v45 >> 10) - 8 * (v45 >> 10);
          if (v47 > 0x3E7)
          {
            ++v46;
            v47 -= 1000;
          }
          v149 = v43;
          v150 = v46;
          v26 = &v152;
          v151 = v47;
        }
      }
      else if (v22 >= 0xF4240)
      {
        v68 = (34359 * (v22 >> 17)) >> 18;
        v69 = v22 - 1000000 * v68;
        v70 = v69 - 1000000;
        if (v69 > 0xF423F)
        {
          LODWORD(v22) = v68 + 1;
        }
        else
        {
          v70 = v69;
          LODWORD(v22) = v68;
        }
        v71 = (v70 & 0x3FF) + 32 * (v70 >> 10) - 8 * (v70 >> 10);
        v72 = (v71 >> 10) + (v70 >> 10);
        v73 = (v71 & 0x3FF) + 32 * (v71 >> 10) - 8 * (v71 >> 10);
        v74 = v73 - 1000;
        if (v73 <= 0x3E7)
          v74 = v73;
        else
          ++v72;
        v26 = &v151;
        v149 = v72;
        v150 = v74;
      }
      else if (v22 >= 0x3E8)
      {
        v97 = (v22 & 0x3FF) + 32 * (v22 >> 10) - 8 * (v22 >> 10);
        LODWORD(v22) = (v97 >> 10) + (v22 >> 10);
        v98 = (v97 & 0x3FF) + 32 * (v97 >> 10) - 8 * (v97 >> 10);
        v99 = v98 - 1000;
        if (v98 <= 0x3E7)
          v99 = v98;
        else
          LODWORD(v22) = v22 + 1;
        v26 = &v150;
        v149 = v99;
      }
      else
      {
        v26 = &v149;
      }
      v108 = (2305843009u * (v19 >> 28)) >> 33;
      v109 = v19 - 1000000000 * (int)v108;
      if (v109 <= 0x3B9AC9FF)
        v110 = v108;
      else
        v110 = v108 + 1;
      if (v109 <= 0x3B9AC9FF)
        v111 = 0;
      else
        v111 = -1000000000;
      v112 = v111 + v109;
      v113 = (34359 * (v110 >> 17)) >> 18;
      v114 = v110 - 1000000 * v113;
      if (v114 > 0xF423F)
      {
        v114 -= 1000000;
        ++v113;
      }
      v115 = (v114 & 0x3FF) + 32 * (v114 >> 10) - 8 * (v114 >> 10);
      v116 = (v115 >> 10) + (v114 >> 10);
      v117 = (v115 & 0x3FF) + 32 * (v115 >> 10) - 8 * (v115 >> 10);
      if (v117 > 0x3E7)
      {
        ++v116;
        v117 -= 1000;
      }
      *v26 = v113;
      v26[1] = v116;
      v118 = (34359 * (v112 >> 17)) >> 18;
      v119 = v112 - 1000000 * v118;
      if (v119 <= 0xF423F)
      {
        v120 = v118;
      }
      else
      {
        v119 -= 1000000;
        v120 = v118 + 1;
      }
      v121 = (v119 & 0x3FF) + 32 * (v119 >> 10) - 8 * (v119 >> 10);
      v122 = (v121 >> 10) + (v119 >> 10);
      v123 = (v121 & 0x3FF) + 32 * (v121 >> 10) - 8 * (v121 >> 10);
      if (v123 > 0x3E7)
        ++v122;
      v26[2] = v117;
      v26[3] = v120;
      if (v123 > 0x3E7)
        v123 -= 1000;
      v27 = (char *)(v26 + 6);
      v26[4] = v122;
      v26[5] = v123;
      LODWORD(v19) = v22;
    }
    else
    {
LABEL_48:
      if (v19 >= 0x3B9ACA00)
      {
        v28 = (2305843009u * (v19 >> 28)) >> 33;
        v29 = v19 - 1000000000 * (int)v28;
        if (v29 <= 0x3B9AC9FF)
          LODWORD(v19) = ((2305843009u * (v19 >> 28)) >> 32) >> 1;
        else
          LODWORD(v19) = v28 + 1;
        if (v29 <= 0x3B9AC9FF)
          v30 = 0;
        else
          v30 = -1000000000;
        v31 = v30 + v29;
        if (v19 >= 0xF4240)
        {
          v55 = (34359 * (v19 >> 17)) >> 18;
          v56 = v19 - 1000000 * v55;
          v57 = v56 - 1000000;
          if (v56 > 0xF423F)
          {
            LODWORD(v19) = v55 + 1;
          }
          else
          {
            v57 = v56;
            LODWORD(v19) = v55;
          }
          v58 = (v57 & 0x3FF) + 32 * (v57 >> 10) - 8 * (v57 >> 10);
          v59 = (v58 >> 10) + (v57 >> 10);
          v60 = (v58 & 0x3FF) + 32 * (v58 >> 10) - 8 * (v58 >> 10);
          if (v60 > 0x3E7)
          {
            ++v59;
            v60 -= 1000;
          }
          v149 = v59;
          v150 = v60;
          v61 = (34359 * (v31 >> 17)) >> 18;
          v62 = v31 - 1000000 * v61;
          if (v62 <= 0xF423F)
            v63 = v62;
          else
            v63 = v62 - 1000000;
          if (v62 <= 0xF423F)
            v64 = v61;
          else
            v64 = v61 + 1;
          v65 = (v63 & 0x3FF) + 32 * (v63 >> 10) - 8 * (v63 >> 10);
          v66 = (v65 >> 10) + (v63 >> 10);
          v67 = (v65 & 0x3FF) + 32 * (v65 >> 10) - 8 * (v65 >> 10);
          if (v67 > 0x3E7)
          {
            ++v66;
            v67 -= 1000;
          }
          v151 = v64;
          v152 = v66;
          v27 = (char *)v154;
          v153 = v67;
        }
        else if (v19 >= 0x3E8)
        {
          v88 = (v19 & 0x3FF) + 32 * (v19 >> 10) - 8 * (v19 >> 10);
          LODWORD(v19) = (v88 >> 10) + (v19 >> 10);
          v89 = (v88 & 0x3FF) + 32 * (v88 >> 10) - 8 * (v88 >> 10);
          if (v89 > 0x3E7)
          {
            v89 -= 1000;
            LODWORD(v19) = v19 + 1;
          }
          v90 = (34359 * (v31 >> 17)) >> 18;
          v91 = v31 - 1000000 * v90;
          if (v91 <= 0xF423F)
            v92 = v91;
          else
            v92 = v91 - 1000000;
          if (v91 <= 0xF423F)
            v93 = v90;
          else
            v93 = v90 + 1;
          v94 = (v92 & 0x3FF) + 32 * (v92 >> 10) - 8 * (v92 >> 10);
          v95 = (v94 >> 10) + (v92 >> 10);
          v96 = (v94 & 0x3FF) + 32 * (v94 >> 10) - 8 * (v94 >> 10);
          if (v96 > 0x3E7)
          {
            ++v95;
            v96 -= 1000;
          }
          v149 = v89;
          v150 = v93;
          v27 = (char *)&v153;
          v151 = v95;
          v152 = v96;
        }
        else
        {
          v32 = (34359 * (v31 >> 17)) >> 18;
          v33 = v31 - 1000000 * v32;
          if (v33 <= 0xF423F)
            v34 = v33;
          else
            v34 = v33 - 1000000;
          if (v33 <= 0xF423F)
            v35 = v32;
          else
            v35 = v32 + 1;
          v36 = (v34 & 0x3FF) + 32 * (v34 >> 10) - 8 * (v34 >> 10);
          v37 = (v36 >> 10) + (v34 >> 10);
          v38 = (v36 & 0x3FF) + 32 * (v36 >> 10) - 8 * (v36 >> 10);
          if (v38 > 0x3E7)
          {
            ++v37;
            v38 -= 1000;
          }
          v149 = v35;
          v150 = v37;
          v27 = (char *)&v152;
          v151 = v38;
        }
      }
      else if (v19 >= 0xF4240)
      {
        v48 = (34359 * (v19 >> 17)) >> 18;
        v49 = v19 - 1000000 * v48;
        if (v49 <= 0xF423F)
          v50 = v49;
        else
          v50 = v49 - 1000000;
        if (v49 <= 0xF423F)
          LODWORD(v19) = v48;
        else
          LODWORD(v19) = v48 + 1;
        v51 = (v50 & 0x3FF) + 32 * (v50 >> 10) - 8 * (v50 >> 10);
        v52 = (v51 >> 10) + (v50 >> 10);
        v53 = (v51 & 0x3FF) + 32 * (v51 >> 10) - 8 * (v51 >> 10);
        v54 = v53 - 1000;
        if (v53 <= 0x3E7)
          v54 = v53;
        else
          ++v52;
        v27 = (char *)&v151;
        v149 = v52;
        v150 = v54;
      }
      else if (v19 >= 0x3E8)
      {
        v86 = (v19 & 0x3FF) + 32 * (v19 >> 10) - 8 * (v19 >> 10);
        LODWORD(v19) = (v86 >> 10) + (v19 >> 10);
        v87 = (v86 & 0x3FF) + 32 * (v86 >> 10) - 8 * (v86 >> 10);
        if (v87 > 0x3E7)
        {
          LODWORD(v19) = v19 + 1;
          v87 -= 1000;
        }
        v27 = (char *)&v150;
        v149 = v87;
      }
      else
      {
        v27 = (char *)&v149;
      }
    }
    v124 = (char *)&__bid_midi_tbl + 3 * v19;
    if (v19 < 0x64)
    {
      v127 = 2;
      if (v19 < 0xA)
      {
        result = v3 + 1;
        goto LABEL_173;
      }
      v126 = 3;
      v125 = (_BYTE *)(v3 + 1);
    }
    else
    {
      v125 = (_BYTE *)(v3 + 2);
      *(_BYTE *)(v3 + 1) = *v124;
      v126 = 4;
      v127 = 3;
    }
    result = v3 + v127;
    *v125 = v124[1];
    v127 = v126;
LABEL_173:
    v128 = v3 + v127;
    *(_BYTE *)result = v124[2];
    if ((int)((unint64_t)(v27 - v148) >> 2) < 2)
    {
      v134 = v3 + v127;
    }
    else
    {
      v129 = ((unint64_t)(v27 - v148) >> 2) - 1;
      v130 = &v149;
      do
      {
        v131 = *v130++;
        v132 = (char *)&__bid_midi_tbl + 3 * v131;
        *(_WORD *)v128 = *(_WORD *)v132;
        v133 = v132[2];
        v134 = v128 + 3;
        *(_BYTE *)(v128 + 2) = v133;
        v128 += 3;
        --v129;
      }
      while (v129);
    }
    v11 = v134 - v3;
    goto LABEL_179;
  }
  if (a3 < 0)
    v13 = 45;
  else
    v13 = 43;
  *(_BYTE *)result = v13;
  *(_WORD *)(result + 1) = 17712;
  v14 = ((unint64_t)a3 >> 49) & 0x3FFF;
  if (((((unint64_t)a3 >> 49) >> 12) & 3) == 3)
    LODWORD(v14) = ((unint64_t)a3 >> 47) & 0x3FFF;
  v15 = v14 - 6176;
  if (v14 >> 5 < 0xC1)
  {
    result = sprintf((char *)(result + 3), "%d", v15);
    v16 = result + 3;
  }
  else
  {
    *(_BYTE *)(result + 3) = 43;
    result = sprintf((char *)(result + 4), "%u", v15);
    v16 = result + 4;
  }
  v5 = (_BYTE *)(v3 + v16);
LABEL_190:
  *v5 = 0;
  return result;
}

uint64_t __bid128_from_string(unsigned __int8 *a1, int a2, _DWORD *a3)
{
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  int v22;
  BOOL v24;
  int v25;
  unsigned __int8 *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  unint64_t v41;
  int v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int8 *v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  int v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BOOL8 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  int v91;
  char *v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  _BOOL8 v98;
  unint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  int v103;
  int v104;
  char *v105;
  unint64_t v106;
  int v107;
  int v108;
  __int128 v109;
  char v110;
  _BYTE v111[33];
  _BYTE v112[66];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v108 = a2;
  v109 = 0uLL;
  if (!a1)
    return xmmword_1B8917D40;
  while (1)
  {
    v5 = *a1;
    v6 = (char)v5;
    if (v5 > 0x2E)
      goto LABEL_77;
    if (((1 << v5) & 0x100000200) == 0)
      break;
    ++a1;
  }
  if (((1 << v5) & 0x680000000000) == 0)
  {
    if (*a1)
    {
LABEL_77:
      if (((char)v5 - 58) >= 0xFFFFFFF6)
        goto LABEL_6;
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)&v109 = 0;
    if ((((_BYTE)v6 - 65) & 0xFEu) >= 0x1A)
      v32 = v6;
    else
      v32 = v6 + 32;
    if (v32 == 115)
    {
      v47 = (char)a1[1];
      if (((a1[1] - 65) & 0xFEu) < 0x1A)
        v47 += 32;
      if (v47 == 110)
      {
        v48 = (char)a1[2];
        if (((a1[2] - 65) & 0xFEu) < 0x1A)
          v48 += 32;
        if (v48 == 97)
        {
          v49 = (char)a1[3];
          if (((a1[3] - 65) & 0xFEu) < 0x1A)
            v49 += 32;
          if (v49 == 110)
            goto LABEL_129;
        }
      }
    }
    else if (v32 == 105)
    {
      v33 = (char)a1[1];
      if (((a1[1] - 65) & 0xFEu) < 0x1A)
        v33 += 32;
      if (v33 == 110)
      {
        v34 = (char)a1[2];
        if (((a1[2] - 65) & 0xFEu) < 0x1A)
          v34 += 32;
        if (v34 == 102)
        {
          v35 = (char)a1[3];
          if (!a1[3])
            goto LABEL_106;
          if ((((_BYTE)v35 - 65) & 0xFEu) < 0x1A)
            v35 += 32;
          if (v35 == 105)
          {
            v36 = (char)a1[4];
            if (((a1[4] - 65) & 0xFEu) < 0x1A)
              v36 += 32;
            if (v36 == 110)
            {
              v37 = (char)a1[5];
              if (((a1[5] - 65) & 0xFEu) < 0x1A)
                v37 += 32;
              if (v37 == 105)
              {
                v38 = (char)a1[6];
                if (((a1[6] - 65) & 0xFEu) < 0x1A)
                  v38 += 32;
                if (v38 == 116)
                {
                  v39 = (char)a1[7];
                  if (((a1[7] - 65) & 0xFEu) < 0x1A)
                    v39 += 32;
                  if (v39 == 121 && !a1[8])
                  {
LABEL_106:
                    v18 = 0x7800000000000000;
                    goto LABEL_131;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_130:
    v18 = 0x7C00000000000000;
    goto LABEL_131;
  }
LABEL_6:
  v7 = (char)a1[1];
  if (((a1[1] - 65) & 0xFEu) < 0x1A)
    v7 += 32;
  if (v7 == 115)
  {
    v15 = (char)a1[2];
    if (((a1[2] - 65) & 0xFEu) < 0x1A)
      v15 += 32;
    if (v15 != 110)
      goto LABEL_49;
    v16 = (char)a1[3];
    if (((a1[3] - 65) & 0xFEu) < 0x1A)
      v16 += 32;
    if (v16 != 97)
      goto LABEL_49;
    v17 = (char)a1[4];
    if (((a1[4] - 65) & 0xFEu) < 0x1A)
      v17 += 32;
    if (v17 != 110)
      goto LABEL_49;
    *(_QWORD *)&v109 = 0;
    if (v5 == 45)
    {
      v18 = 0xFE00000000000000;
LABEL_131:
      *((_QWORD *)&v109 + 1) = v18;
      return v109;
    }
LABEL_129:
    v18 = 0x7E00000000000000;
    goto LABEL_131;
  }
  if (v7 == 105)
  {
    v8 = (char)a1[2];
    if (((a1[2] - 65) & 0xFEu) < 0x1A)
      v8 += 32;
    if (v8 == 110)
    {
      v9 = (char)a1[3];
      if (((a1[3] - 65) & 0xFEu) < 0x1A)
        v9 += 32;
      if (v9 == 102)
      {
        v10 = (char)a1[4];
        if (!a1[4])
          goto LABEL_33;
        if ((((_BYTE)v10 - 65) & 0xFEu) < 0x1A)
          v10 += 32;
        if (v10 == 105)
        {
          v11 = (char)a1[5];
          if (((a1[5] - 65) & 0xFEu) < 0x1A)
            v11 += 32;
          if (v11 == 110)
          {
            v12 = (char)a1[6];
            if (((a1[6] - 65) & 0xFEu) < 0x1A)
              v12 += 32;
            if (v12 == 105)
            {
              v13 = (char)a1[7];
              if (((a1[7] - 65) & 0xFEu) < 0x1A)
                v13 += 32;
              if (v13 == 116)
              {
                v14 = (char)a1[8];
                if (((a1[8] - 65) & 0xFEu) < 0x1A)
                  v14 += 32;
                if (v14 == 121 && !a1[9])
                {
LABEL_33:
                  *(_QWORD *)&v109 = 0;
                  if (v5 == 45)
                  {
                    v18 = 0xF800000000000000;
                    goto LABEL_131;
                  }
                  if (v5 != 43)
                    goto LABEL_130;
                  goto LABEL_106;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_49:
  v19 = (char)v5 == 45;
  v20 = v19 << 63;
  if (v5 == 43)
    LODWORD(v19) = 1;
  if ((_DWORD)v19)
    v21 = a1 + 1;
  else
    v21 = a1;
  v22 = (char)*v21;
  if (v22 != 46 && (v22 - 58) <= 0xFFFFFFF5)
  {
LABEL_75:
    v31 = v20 | 0x7C00000000000000;
    goto LABEL_76;
  }
  v24 = *v21 == 46;
  v25 = v24;
  if (v24)
    v26 = v21 + 1;
  else
    v26 = v21;
  v27 = *v26;
  if (v27 != 48)
  {
    LODWORD(v29) = 0;
LABEL_108:
    v40 = (char)v27 - 48;
    if (v25)
    {
      if (v40 <= 9)
      {
        v41 = 0;
        v42 = 0;
        do
        {
          if (v41 > 0x21)
          {
            if (v41 <= 0x63)
              v111[v41 - 1] = v27;
            if ((char)v27 > 48)
              v42 = 1;
          }
          else
          {
            v111[v41 - 1] = v27;
          }
          v43 = (char)v26[v41 + 1];
          v27 = v26[++v41];
        }
        while ((v43 - 48) < 0xA);
        LODWORD(v44) = 0;
        v26 += v41;
        LODWORD(v45) = v41;
        if (!v27)
          goto LABEL_119;
LABEL_143:
        if ((v27 & 0xFFFFFFDF) != 0x45)
          return xmmword_1B8917D40;
        v51 = (char)v26[1];
        if ((v51 - 58) <= 0xFFFFFFF5
          && (v51 != 45 && v26[1] != 43 || ((char)v26[2] - 58) <= 0xFFFFFFF5))
        {
          return xmmword_1B8917D40;
        }
        if (v51 == 45)
        {
          v27 = -1;
        }
        else
        {
          if (v26[1] != 43)
          {
            v27 = 0;
            v58 = 1;
LABEL_177:
            v59 = &v26[v58];
            v46 = v51 - 48;
            if (v51 == 48)
            {
              do
              {
                v62 = *++v59;
                v60 = v62;
              }
              while (v62 == 48);
            }
            else
            {
              v61 = *++v59;
              v60 = v61;
            }
            v63 = v60 - 48;
            if (v63 <= 9)
            {
              v64 = 1;
              do
              {
                v46 = 10 * v46 + v63;
                v63 = v59[v64] - 48;
              }
              while (v63 <= 9 && v64++ < 6);
            }
            goto LABEL_187;
          }
          v27 = 0;
        }
        v51 = (char)v26[2];
        v58 = 2;
        goto LABEL_177;
      }
      v42 = 0;
      LODWORD(v45) = 0;
      LODWORD(v41) = 0;
      LODWORD(v44) = 0;
      if (v27)
        goto LABEL_143;
    }
    else
    {
      if (v40 > 9)
      {
        v42 = 0;
        LODWORD(v44) = 0;
      }
      else
      {
        v44 = 0;
        v42 = 0;
        do
        {
          if (v44 > 0x21)
          {
            if (v44 <= 0x63)
              v111[v44 - 1] = v27;
            if ((char)v27 > 48)
              v42 = 1;
          }
          else
          {
            v111[v44 - 1] = v27;
          }
          v50 = (char)v26[v44 + 1];
          v27 = v26[++v44];
        }
        while ((v50 - 48) < 0xA);
        v26 += v44;
      }
      if (v27 == 46)
      {
        v54 = (char)*++v26;
        v53 = v54;
        if (!v54)
        {
          LODWORD(v41) = 0;
          v27 = 0;
          v46 = 0;
          LODWORD(v45) = v44;
          goto LABEL_187;
        }
        v27 = v53;
        if ((v53 - 48) > 9)
        {
          LODWORD(v45) = v44;
        }
        else
        {
          v45 = v44;
          do
          {
            if (v45 > 0x21)
            {
              if (v45 <= 0x63)
                v111[v45 - 1] = v27;
              if ((char)v27 > 48)
                v42 = 1;
            }
            else
            {
              v111[v45 - 1] = v27;
            }
            v55 = (char)*++v26;
            v27 = v55;
            ++v45;
          }
          while ((v55 - 48) < 0xA);
        }
        LODWORD(v41) = v45 - v44;
        if (v27)
          goto LABEL_143;
      }
      else
      {
        LODWORD(v41) = 0;
        LODWORD(v45) = v44;
        if (v27)
          goto LABEL_143;
      }
    }
LABEL_119:
    v46 = 0;
LABEL_187:
    v66 = (v46 + v27) ^ v27;
    if ((int)v45 <= 34)
    {
      v67 = v66 - (v41 + v29) + 6176;
      if (v67 < 0)
      {
        *(_QWORD *)&v109 = 0;
        *((_QWORD *)&v109 + 1) = v20;
      }
      if ((_DWORD)v45)
      {
        v68 = v110 - 48;
        if ((int)v45 > 19)
        {
          v80 = (v45 - 17);
          v81 = v80 - 1;
          v82 = v111;
          do
          {
            v83 = *v82++;
            v68 = v83 + 10 * v68 - 48;
            --v81;
          }
          while (v81);
          v84 = v111[v80 - 1] - 48;
          v85 = v45 - 16;
          v86 = &v111[(v45 - 16) - 1];
          do
          {
            v87 = *v86++;
            v84 = v87 + 10 * v84 - 48;
            ++v85;
          }
          while ((int)v45 > v85);
          v88 = 23283064 * v68
              + 1569325056 * HIDWORD(v68)
              + ((1569325056 * (unint64_t)v68) >> 32);
          v72 = (__PAIR128__(23283064 * (unint64_t)HIDWORD(v68), (1569325056 * v68) | (v88 << 32))
               + __PAIR128__(HIDWORD(v88), v84)) >> 64;
          v68 = ((1569325056 * v68) | (v88 << 32)) + v84;
        }
        else
        {
          if ((int)v45 >= 2)
          {
            v69 = v45 - 1;
            v70 = v111;
            do
            {
              v71 = *v70++;
              v68 = v71 + 10 * v68 - 48;
              --v69;
            }
            while (v69);
          }
          v72 = 0;
        }
      }
      else
      {
        v72 = 0;
        v68 = 0;
      }
LABEL_235:
      bid_get_BID128_1141(&v109, v20, v67, v68, v72, &v108, a3);
      return v109;
    }
    v67 = v44 - v29 + 6142 + v66;
    if (v67 < 0)
    {
      *(_QWORD *)&v109 = 0;
      *((_QWORD *)&v109 + 1) = v20;
    }
    v73 = 0;
    v74 = v110 - 48;
    do
      v74 = (char)v111[v73++] + 10 * v74 - 48;
    while (v73 != 16);
    v75 = 0;
    v76 = v111[16] - 48;
    do
    {
      v77 = (char)v111[v75 + 17];
      v76 = v77 + 10 * v76 - 48;
      ++v75;
    }
    while (v75 != 16);
    v78 = 0;
    v79 = 100000000000000000;
    switch(a2)
    {
      case 0:
        v78 = v112[0] > 52;
        if (v112[0] == 53)
        {
          if (v67 < 0 || (v77 & 1) == 0)
            goto LABEL_246;
        }
        else if (v67 < 0)
        {
LABEL_246:
          if (v67 < 0)
            v104 = 34;
          else
            v104 = 35;
          if (v67 >= 0)
            v78 = 0;
          if (v104 < (int)v45)
          {
            v105 = &v111[v104 - 1];
            v106 = v45 - (unint64_t)v104;
            do
            {
              v107 = *v105++;
              if (v107 > 48)
                goto LABEL_256;
              --v106;
            }
            while (v106);
          }
          goto LABEL_223;
        }
LABEL_230:
        v99 = (v79 & 0xFFEE0000) * (unint64_t)v74;
        v100 = HIDWORD(v79) * (unint64_t)v74
             + (v79 & 0xFFEE0000) * (unint64_t)HIDWORD(v74)
             + HIDWORD(v99);
        v68 = v76 + v78 + (v99 & 0xFFFE0000) + (v100 << 32);
        if (v68 >= v76 + v78)
          v72 = HIDWORD(v100) + HIDWORD(v79) * (unint64_t)HIDWORD(v74);
        else
          v72 = HIDWORD(v100) + HIDWORD(v79) * (unint64_t)HIDWORD(v74) + 1;
        if (v42)
          *a3 |= 0x20u;
        goto LABEL_235;
      case 1:
        if ((char)v5 != 45)
          goto LABEL_222;
        v89 = v112;
        v90 = v45 - 34;
        v78 = 1;
        while (1)
        {
          v91 = *v89++;
          if (v91 > 48)
            goto LABEL_223;
          if (!--v90)
            goto LABEL_222;
        }
      case 2:
        if (v5 == 45)
          goto LABEL_222;
        v92 = v112;
        v93 = v45 - 34;
        v78 = 1;
        while (1)
        {
          v94 = *v92++;
          if (v94 > 48)
            goto LABEL_223;
          if (!--v93)
          {
LABEL_222:
            v78 = 0;
            goto LABEL_223;
          }
        }
      case 4:
        v78 = v112[0] > 52;
        if ((v67 & 0x80000000) == 0)
          goto LABEL_230;
        v101 = v112;
        v102 = v45 - 34;
        while (1)
        {
          v103 = *v101++;
          if (v103 >= 49)
            break;
          if (!--v102)
            goto LABEL_223;
        }
LABEL_256:
        v78 = 1;
LABEL_223:
        v95 = 10 * v76;
        v96 = 1000000000000000000;
        if (v67 <= 0xFFFFFFDE)
        {
          v96 = 100000000000000000;
          v95 = v76;
        }
        v97 = v67 - (v67 > 0xFFFFFFDE);
        if (v97 == -34 && v74 > 0xB1A2BC2EC50000)
        {
          v97 = -34;
          v98 = 0;
        }
        else
        {
          v98 = v78;
        }
        if (v67 < 0)
        {
          v67 = v97;
          v79 = v96;
          v78 = v98;
          v76 = v95;
        }
        goto LABEL_230;
      default:
        goto LABEL_223;
    }
  }
  v28 = 0;
  while (1)
  {
    v27 = v26[1];
    v29 = v25 ? v28 + 1 : v28;
    if (v27 != 46)
      break;
    if (v25)
      goto LABEL_75;
    v30 = v26[2];
    v26 += 2;
    v27 = v30;
    if (!v30)
    {
      v57 = 0x3040000000000000 - (v28 << 49);
      goto LABEL_172;
    }
    v25 = 1;
LABEL_73:
    v28 = v29;
    if (v27 != 48)
      goto LABEL_108;
  }
  if (v26[1])
  {
    ++v26;
    goto LABEL_73;
  }
  v56 = 6176;
  if (v29 < 0x1820)
    v56 = v29;
  v57 = 0x3040000000000000 - (v56 << 49);
LABEL_172:
  v31 = v57 | v20;
LABEL_76:
  *(_QWORD *)&v109 = 0;
  *((_QWORD *)&v109 + 1) = v31;
  return v109;
}

_QWORD *bid_get_BID128_1141(_QWORD *result, uint64_t a2, int a3, unint64_t a4, unint64_t a5, int *a6, _DWORD *a7)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  BOOL v16;
  int v17;
  unsigned __int128 v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _BOOL8 v38;
  unint64_t v39;
  unsigned __int128 v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  char v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  BOOL v56;
  unint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  BOOL v68;
  _BOOL4 v69;

  v7 = 0x378D8E63FFFFFFFFLL;
  if (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0)
    v8 = 0x38C15B0A00000000;
  else
    v8 = a4;
  v9 = (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0) + a3;
  if (a4 == 0x378D8E6400000000 && a5 == 0x1ED09BEAD87C0)
    v10 = 0x314DC6448D93;
  else
    v10 = a5;
  if (v9 < 0x3000)
    goto LABEL_71;
  if ((v9 & 0x80000000) != 0)
  {
    if (v9 > 0xFFFFFFDD)
    {
      v15 = -(int)v9;
      v16 = (*a6 - 1) >= 2 || a2 == 0;
      if (v16)
        v17 = *a6;
      else
        v17 = 3 - *a6;
      v18 = __bid_round_const_table_128[36 * v17 + v15] + __PAIR128__(v10, v8);
      v19 = (unint64_t *)((char *)&__bid_reciprocals10_128 + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      v22 = v21 * (unint64_t)DWORD1(v18);
      v23 = HIDWORD(v22);
      v24 = HIDWORD(v21) * (unint64_t)v18
          + v22
          + ((v21 * (unint64_t)v18) >> 32);
      v25 = (v21 * v18) | ((unint64_t)v24 << 32);
      v26 = DWORD2(v18) * HIDWORD(*v19);
      v27 = HIDWORD(v18) * (unint64_t)v20
          + v26
          + ((DWORD2(v18) * (unint64_t)v20) >> 32);
      v28 = (DWORD2(v18) * *v19) | ((unint64_t)v27 << 32);
      v29 = *v19 * (unint64_t)DWORD1(v18);
      v30 = HIDWORD(v20) * (unint64_t)v18
          + v29
          + ((v20 * (unint64_t)v18) >> 32);
      v31 = HIDWORD(v29) + HIDWORD(*v19) * DWORD1(v18) + HIDWORD(v30);
      v32 = (*v19 * v18) | ((unint64_t)v30 << 32);
      v33 = HIDWORD(v18) * (unint64_t)v21;
      v34 = HIDWORD(v33) + HIDWORD(v18) * (unint64_t)HIDWORD(v21);
      v35 = DWORD2(v18) * (unint64_t)HIDWORD(v21)
          + v33
          + ((DWORD2(v18) * (unint64_t)v21) >> 32);
      v36 = HIDWORD(v35);
      v37 = (DWORD2(v18) * v21) | ((unint64_t)v35 << 32);
      v38 = __CFADD__(v25, v28);
      v39 = v25 + v28 + v31;
      v40 = __PAIR128__(v34, v37)
          + __PAIR128__(v36, (__PAIR128__(v23+ HIDWORD(v21) * (unint64_t)DWORD1(v18)+ HIDWORD(v18) * (unint64_t)HIDWORD(v20)+ HIDWORD(v26)+ HIDWORD(v24)+ HIDWORD(v27), v25 + v28)+ __PAIR128__(v38, v31)) >> 64);
      v41 = __bid_recip_scale[v15];
      v42 = (*((_QWORD *)&v40 + 1) << -(char)v41) | ((unint64_t)v40 >> v41);
      v43 = (unint64_t)((__PAIR128__(v34, v37)
                              + __PAIR128__(v36, (__PAIR128__(v23+ HIDWORD(v21) * (unint64_t)DWORD1(v18)+ HIDWORD(v18) * (unint64_t)HIDWORD(v20)+ HIDWORD(v26)+ HIDWORD(v24)+ HIDWORD(v27), v25 + v28)+ __PAIR128__(v38, v31)) >> 64)) >> 64) >> v41;
      if (v41 >= 64)
      {
        v42 = *((_QWORD *)&v40 + 1) >> v41;
        v43 = 0;
      }
      if (!*a6 && (v42 & 1) != 0)
      {
        v44 = (*((_QWORD *)&v40 + 1) << -(char)v41) | ((unint64_t)v40 >> v41);
        if (v41 >= 65)
        {
          v45 = (_QWORD)v40 << -(char)v41 != 0;
        }
        else
        {
          v44 = (_QWORD)v40 << -(char)v41;
          v45 = 0;
        }
        if (!v44 && !v45 && (v39 < v21 || v39 == v21 && v32 < v20))
          --v42;
      }
      if ((*a7 & 0x20) != 0)
      {
        v55 = 16;
      }
      else
      {
        v46 = 0x80 - v41;
        if (v41 >= 65)
          v47 = (*((_QWORD *)&v40 + 1) << (0x80 - v41)) | ((unint64_t)v40 >> v41);
        else
          v47 = (_QWORD)v40 << -(char)v41;
        if (v41 >= 65)
          v48 = (_QWORD)v40 << (0x80 - v41);
        else
          v48 = 0;
        switch(v17)
        {
          case 0:
          case 4:
            if (v47 == 0x8000000000000000 && v48 == 0)
              goto LABEL_78;
            goto LABEL_110;
          case 1:
          case 3:
            if (v47 | v48)
              goto LABEL_110;
LABEL_78:
            v56 = v39 == v21;
            if (v39 >= v21)
            {
              v55 = 48;
              if (!v56 || v32 >= v20)
                break;
            }
            goto LABEL_112;
          default:
            v12 = __CFADD__(__CFADD__(v32, v20), v39);
            v57 = __CFADD__(v32, v20) + v39;
            v58 = v12;
            if (__CFADD__(v57, v21))
              v59 = 1;
            else
              v59 = v58;
            v60 = v47 >> -(char)v41;
            v61 = (v48 >> v46) | (v47 << v41);
            v62 = v47 >> v46;
            if (v41 >= 65)
              v63 = v62;
            else
              v63 = 0;
            if (v41 < 65)
              v61 = v60;
            v64 = 1 << (v41 - 64);
            if (v41 < 64)
              v64 = 0;
            v65 = v61 + v59;
            if (__CFADD__(v61, v59))
              v66 = v63 + 1;
            else
              v66 = v63;
            if (v66 > v64)
              goto LABEL_112;
            v67 = v65 >> v41;
            v68 = v41 < 64 && v67 == 0;
            v69 = v68;
            if (v66 == v64 && !v69)
              goto LABEL_112;
LABEL_110:
            v55 = 48;
            break;
        }
      }
      *a7 |= v55;
LABEL_112:
      result[1] = v43 | a2;
    }
    else
    {
      *a7 |= 0x30u;
      *result = 0;
      result[1] = a2;
      v14 = *a6;
      if (a2)
      {
        if (v14 != 1)
          return result;
      }
      else if (v14 != 2)
      {
        return result;
      }
      v42 = 1;
    }
    *result = v42;
    return result;
  }
  if (v9 > 0x3021)
    goto LABEL_61;
  while (1)
  {
    if (v10 < 0x314DC6448D93)
    {
      if ((int)v9 < 12288)
        goto LABEL_71;
      goto LABEL_16;
    }
    if (v10 != 0x314DC6448D93)
      goto LABEL_60;
    if (v8 >= 0x38C15B0A00000000 || (int)v9 < 12288)
      break;
LABEL_16:
    v11 = 10 * v8;
    v12 = 10 * v8 >= 8 * v8;
    v13 = (v8 >> 63) + (v8 >> 61) + 10 * v10;
    if (v12)
      v10 = v13;
    else
      v10 = v13 + 1;
    v9 = (v9 - 1);
    v8 = v11;
  }
  v10 = 0x314DC6448D93;
LABEL_60:
  if ((int)v9 < 12288)
  {
LABEL_71:
    *result = v8;
    result[1] = v10 | (v9 << 49) | a2;
    return result;
  }
LABEL_61:
  if (v8 | v10)
  {
    v50 = 0x5FFFED09BEAD87C0;
    *a7 |= 0x28u;
    v51 = *a6;
    if (a2)
      v52 = 2;
    else
      v52 = 1;
    v16 = v51 == v52;
    v53 = 0x7800000000000000;
    if (v16)
    {
      v53 = 0x5FFFED09BEAD87C0;
      v54 = 0x378D8E63FFFFFFFFLL;
    }
    else
    {
      v54 = 0;
    }
    if (v51 != 3)
    {
      v50 = v53;
      v7 = v54;
    }
    *result = v7;
    result[1] = v50 | a2;
  }
  else
  {
    *result = 0;
    result[1] = a2 | 0x5FFE000000000000;
  }
  return result;
}

unint64_t __bid128_tan(unint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned __int128 v42;
  _BOOL4 v43;
  BOOL v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unsigned __int128 v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  __int128 v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  int v101;
  uint64_t v102;
  unint64_t v103;
  int v104;
  int v105;
  unint64_t v106;
  int8x16_t v107;
  int8x16_t v108;
  __int32 v109;
  unint64_t v110;
  __int128 v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  int v115;
  uint64_t v117;
  unint64_t v118;
  unsigned int v119;
  __n128 v120;
  __n128 v121;
  int v122;
  int v123;
  int v124[8];

  v5 = a1;
  v120 = 0uLL;
  if ((~a2 & 0x6000000000000000) != 0)
  {
    v6 = (((unint64_t)a2 >> 49) & 0x3FFF) - 6176;
    v7 = a2 & 0x1FFFFFFFFFFFFLL;
    if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0 || a1 >= 0x378D8E6400000000 && v7 == 0x1ED09BEAD87C0)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v8 = a1;
    }
LABEL_17:
    if (v8 | v7)
      v9 = v6;
    else
      v9 = -53;
    if (v9 > -36)
    {
      v118 = (unint64_t)a2 >> 63;
      v11 = (uint64_t *)((char *)&bid_decimal128_moduli_1144 + 48 * (v9 + 35));
      v12 = *v11;
      v13 = v11[1];
      v15 = v11[2];
      v14 = v11[3];
      v16 = v11[4];
      v117 = v11[5];
      v17 = HIDWORD(*v11);
      v18 = *v11;
      v19 = ((v12 * (unint64_t)HIDWORD(v8)) >> 32)
          + HIDWORD(v12) * (unint64_t)HIDWORD(v8)
          + ((HIDWORD(v12) * (unint64_t)v8
            + (v12 * HIDWORD(v8))
            + ((v12 * (unint64_t)v8) >> 32)) >> 32);
      v20 = HIDWORD(v13);
      v21 = v13 * (unint64_t)HIDWORD(v8);
      v22 = HIDWORD(v21) + HIDWORD(v13) * (unint64_t)HIDWORD(v8);
      v23 = HIDWORD(v13) * (unint64_t)v8
          + v21
          + ((v13 * (unint64_t)v8) >> 32);
      v24 = v22 + HIDWORD(v23);
      v25 = (v13 * v8) | ((unint64_t)v23 << 32);
      v26 = HIDWORD(v15);
      v27 = v15 * (unint64_t)HIDWORD(v8);
      v28 = HIDWORD(v27) + HIDWORD(v15) * (unint64_t)HIDWORD(v8);
      v29 = HIDWORD(v15) * (unint64_t)v8
          + v27
          + ((v15 * (unint64_t)v8) >> 32);
      v30 = v28 + HIDWORD(v29);
      v31 = (v15 * v8) | ((unint64_t)v29 << 32);
      v32 = HIDWORD(v14);
      v33 = v14 * (unint64_t)HIDWORD(v8);
      v34 = HIDWORD(v33) + HIDWORD(v14) * (unint64_t)HIDWORD(v8);
      v35 = HIDWORD(v14) * (unint64_t)v8
          + v33
          + ((v14 * (unint64_t)v8) >> 32);
      v36 = v34 + HIDWORD(v35);
      v37 = (v14 * v8) | ((unint64_t)v35 << 32);
      v38 = HIDWORD(v16);
      v39 = v16 * (unint64_t)HIDWORD(v8);
      v119 = a3;
      v40 = HIDWORD(v16) * (unint64_t)v8
          + v39
          + ((v16 * (unint64_t)v8) >> 32);
      v41 = (v16 * v8) | ((unint64_t)v40 << 32);
      v42 = __PAIR128__(v31, v19) + v25;
      v43 = __CFADD__(__CFADD__(v19, v25), v31);
      v44 = __CFADD__(v24, *((_QWORD *)&v42 + 1));
      v45 = v24 + *((_QWORD *)&v42 + 1);
      v46 = v44 || v43;
      v44 = __CFADD__(v37, v46);
      v47 = v37 + v46;
      v48 = v44;
      v49 = v30 + v47;
      if (__CFADD__(v30, v47))
        v50 = 1;
      else
        v50 = v48;
      v44 = __CFADD__(v41, v50);
      v51 = v41 + v50;
      LODWORD(v52) = v44;
      v53 = v36 + v51;
      if (__CFADD__(v36, v51))
        v52 = 1;
      else
        v52 = v52;
      v54 = HIDWORD(v7);
      v55 = v18 * (unint64_t)HIDWORD(v7);
      v56 = v12 * (unint64_t)v7;
      v57 = HIDWORD(v55) + v17 * (unint64_t)HIDWORD(v7);
      v58 = v17 * (unint64_t)v7 + v55 + HIDWORD(v56);
      v59 = v57 + HIDWORD(v58);
      v60 = v56 | ((unint64_t)v58 << 32);
      v61 = v13 * (unint64_t)HIDWORD(v7);
      v62 = v13 * (unint64_t)v7;
      v63 = v20 * (unint64_t)v7;
      v64 = HIDWORD(v61) + v20 * (unint64_t)HIDWORD(v7);
      v65 = v63 + v61 + HIDWORD(v62);
      v66 = v64 + HIDWORD(v65);
      v67 = v62 | ((unint64_t)v65 << 32);
      v68 = v15 * (unint64_t)HIDWORD(v7);
      v69 = v15 * (unint64_t)v7;
      v70 = HIDWORD(v68) + v26 * (unint64_t)HIDWORD(v7);
      v71 = v26 * (unint64_t)v7 + v68 + HIDWORD(v69);
      v72 = v70 + HIDWORD(v71);
      v73 = v69 | ((unint64_t)v71 << 32);
      v74 = v14 * (unint64_t)HIDWORD(v7);
      v75 = v14 * (unint64_t)v7;
      v76 = v32 * (unint64_t)v7 + v74 + HIDWORD(v75);
      v77 = v75 | ((unint64_t)v76 << 32);
      v78 = v16 * v7;
      v79 = __PAIR128__(v73, v59) + v67;
      LODWORD(v80) = __CFADD__(__CFADD__(v59, v67), v73);
      v81 = v66 + *((_QWORD *)&v79 + 1);
      if (__CFADD__(v66, *((_QWORD *)&v79 + 1)))
        v80 = 1;
      else
        v80 = v80;
      v44 = __CFADD__(v77, v80);
      v82 = v77 + v80;
      LODWORD(v83) = v44;
      v44 = __CFADD__(v72, v82);
      v84 = v72 + v82;
      if (v44)
        v83 = 1;
      else
        v83 = v83;
      v85 = __CFADD__(v60, (_QWORD)v42) + (_QWORD)v79;
      LODWORD(v86) = __CFADD__(__CFADD__(v60, (_QWORD)v42), (_QWORD)v79);
      v44 = __CFADD__(v45, v85);
      v87 = v45 + v85;
      if (v44)
        v86 = 1;
      else
        v86 = v86;
      v44 = __CFADD__(v81, v86);
      v88 = v81 + v86;
      LODWORD(v89) = v44;
      v44 = __CFADD__(v88, v49);
      v90 = v88 + v49;
      if (v44)
        v89 = 1;
      else
        v89 = v89;
      v44 = __CFADD__(v84, v89);
      v91 = v84 + v89;
      LODWORD(v92) = v44;
      v44 = __CFADD__(v91, v53);
      v93 = v91 + v53;
      if (v44)
        v92 = 1;
      else
        v92 = v92;
      v94 = v78
          + v32 * (unint64_t)v54
          + HIDWORD(v74)
          + v38 * (unint64_t)HIDWORD(v8)
          + v117 * v8
          + HIDWORD(v39)
          + HIDWORD(v76)
          + HIDWORD(v40)
          + v83
          + v52
          + v92;
      v95 = v94 >> 62;
      *((_QWORD *)&v97 + 1) = v94;
      *(_QWORD *)&v97 = v93;
      v96 = v97 >> 62;
      *((_QWORD *)&v97 + 1) = v93;
      *(_QWORD *)&v97 = v90;
      v98 = v97 >> 62;
      *((_QWORD *)&v97 + 1) = v90;
      *(_QWORD *)&v97 = v87;
      v99 = v97 >> 62;
      v100 = 4 * v87;
      v101 = ((v94 >> 62) + 1) & 3;
      if (v96 >= 0)
      {
        v102 = v118;
      }
      else
      {
        LODWORD(v95) = v101;
        v102 = v118 ^ 1;
      }
      if (v96 >= 0)
        v103 = v96;
      else
        v103 = ~v96;
      if (v96 < 0)
      {
        v98 = ~v98;
        v99 = ~v99;
        v100 = ~v100;
      }
      if (a2 >= 0)
        v104 = v95;
      else
        v104 = -(int)v95 & 3;
      if (v103)
        v105 = 16382;
      else
        v105 = 16318;
      if (v103)
        v106 = v103;
      else
        v106 = v98;
      if (v103)
        v100 = v99;
      else
        v98 = v99;
      v107 = (int8x16_t)vdupq_n_s64(v106);
      v108 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v107, (int8x16_t)xmmword_1B8917CC0), (uint64x2_t)vandq_s8(v107, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v107, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v107, (int8x16_t)xmmword_1B8917CF0))));
      *(int8x8_t *)v108.i8 = vorr_s8(*(int8x8_t *)v108.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v108, v108, 8uLL));
      v109 = v108.i32[0] | v108.i32[1] | (2 * ((v106 & 0xCCCCCCCCCCCCCCCCLL) <= (v106 & 0x3333333333333333))) | ((v106 & 0xAAAAAAAAAAAAAAAALL) <= (v106 & 0x5555555555555555));
      v110 = (v100 >> -(char)v109) + (v98 << v109);
      if (v109)
        v106 = (v98 >> -(char)v109) + (v106 << v109);
      else
        v110 = v98;
      *((_QWORD *)&v111 + 1) = v106;
      *(_QWORD *)&v111 = v110;
      v121.n128_u64[0] = v111 >> 15;
      v121.n128_u64[1] = ((unint64_t)(v105 - v109) << 48) | (v102 << 63) | (v106 >> 15) & 0xFFFFFFFFFFFFLL;
      bid_f128_mul(&v121, (uint64_t *)&c_pi_ov_2_1145, (uint64_t *)&v121);
      switch(v104)
      {
        case 0:
        case 2:
          __dpml_bid_C_ux_trig__((uint64_t *)&v121, 0, 4, qword_1B891F998, &v120, v124);
          break;
        case 1:
        case 3:
          __dpml_bid_C_ux_trig__((uint64_t *)&v121, 0, 4, qword_1B891F998, &v120, v124);
          bid_f128_div(&v120, (uint64_t *)&c_neg_one, (uint64_t *)&v120);
          break;
        default:
          break;
      }
      v114 = v120.n128_u64[1];
      v113 = v120.n128_u64[0];
      v115 = v119;
    }
    else
    {
      if (v9 <= 0xFFFFFFCB)
        return bid128_ext_fma(v124, (int *)&v121, &v123, &v122, a1, a2, 1uLL, 0x2FF0000000000000, a1, a2, a3, &my_fpsf);
      v121.n128_u64[0] = __bid128_to_binary128(a1, a2, a3, &my_fpsf);
      v121.n128_u64[1] = v112;
      __dpml_bid_C_ux_trig__((uint64_t *)&v121, 0, 4, qword_1B891F998, &v120, v124);
      v114 = v120.n128_u64[1];
      v113 = v120.n128_u64[0];
      v115 = a3;
    }
    return __binary128_to_bid128(v113, v114, v115, &my_fpsf);
  }
  if ((~a2 & 0x7800000000000000) != 0)
  {
    v7 = 0;
    v8 = 0;
    v6 = 0;
    goto LABEL_17;
  }
  if ((~a2 & 0x7C00000000000000) != 0)
  {
    v5 = 0;
    my_fpsf |= 1u;
  }
  else
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFuLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
  }
  return v5;
}

unint64_t __bid128_tgamma(unint64_t a1, unint64_t a2, unsigned int a3)
{
  unint64_t v4;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v4 = a1;
  if ((~a2 & 0x7C00000000000000) == 0)
  {
    if ((~a2 & 0x7E00000000000000) == 0)
      my_fpsf |= 1u;
    if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
      || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
    {
      return 0;
    }
    return v4;
  }
  if (__bid128_isZero(a1, a2))
  {
    v4 = 0;
    my_fpsf |= 4u;
    return v4;
  }
  if ((~a2 & 0x7800000000000000) == 0)
  {
    if ((a2 & 0x8000000000000000) == 0)
      return 0;
LABEL_16:
    v4 = 0;
    my_fpsf |= 1u;
    return v4;
  }
  if (__bid128_quiet_less_equal(v4, a2, 0, 0, &my_fpsf))
  {
    v7 = __bid128_round_integral_nearest_even(v4, a2, &my_fpsf);
    v9 = __bid128_sub(v4, a2, v7, v8, a3, &my_fpsf);
    if (__bid128_isZero(v9, v10))
      goto LABEL_16;
  }
  v11 = __bid128_lgamma(v4, a2, a3);
  v14 = __bid128_exp(v11, v12, a3, &my_fpsf);
  if ((a2 & 0x8000000000000000) != 0 && (v13 & 0x7C00000000000000) != 0x7C00000000000000)
  {
    v15 = __bid128_round_integral_zero(v4, a2, &my_fpsf);
    if (((v16 >> 49) & 0x3FFF) < 0x1820)
      __bid128_add(0x7182B61400000000uLL, 0x3040629B8C891B26, v15, v16, a3, &my_fpsf);
  }
  return v14;
}

uint64_t __bid128_to_int32_int(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned __int128 v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  BOOL v56;
  uint64_t v57;
  unint64_t v58;
  _BOOL4 v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  _BOOL4 v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  _BOOL4 v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  BOOL v83;
  unint64_t v84;
  _QWORD *v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v89;

  if ((~a2 & 0x7800000000000000) == 0)
    goto LABEL_2;
  v4 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFuLL) > 0x1ED09BEAD87C0)
    return 0;
  v3 = 0;
  v7 = a1 > 0x378D8E63FFFFFFFFLL && v4 == 0x1ED09BEAD87C0;
  if (v4 | a1 && (a2 & 0x6000000000000000) != 0x6000000000000000 && !v7)
  {
    v8 = HIDWORD(a1);
    if (a1 >> 53)
    {
      v9 = -990;
    }
    else
    {
      v8 = a1;
      v9 = -1022;
    }
    if (v4)
      v8 = a2 & 0x1FFFFFFFFFFFFLL;
    v10 = (COERCE_UNSIGNED_INT64((double)v8) >> 52) & 0x7FF;
    if (v4)
      v9 = -958;
    v11 = (v10 + v9 - 1);
    v12 = *((_DWORD *)&__bid_nr_digits + 8 * v11);
    if (!v12)
    {
      v13 = (char *)&__bid_nr_digits + 32 * v11;
      v12 = *((_DWORD *)v13 + 6);
      v14 = *((_QWORD *)v13 + 1);
      if (v4 > v14 || v4 == v14 && *((_QWORD *)&__bid_nr_digits + 4 * v11 + 2) <= a1)
        ++v12;
    }
    v15 = ((unint64_t)a2 >> 49) & 0x3FFF;
    v16 = v12 + v15 - 6176;
    if (v16 >= 11)
      goto LABEL_2;
    if (v16 == 10)
    {
      v17 = v12 - 11;
      if ((a2 & 0x8000000000000000) == 0)
      {
        if (v12 <= 11)
        {
          if ((__bid_ten2k64[11 - v12] * a1) >> 32 < 5)
            goto LABEL_34;
LABEL_2:
          *a3 |= 1u;
          return 0x80000000;
        }
        if (v12 > 0x1E)
        {
          v79 = &__bid_ten2k128[2 * (v12 - 31)];
          v81 = *v79;
          v80 = v79[1];
          v82 = HIDWORD(*v79);
          v21 = *v79;
          v22 = 4 * v82 + HIDWORD(v81) + 0x500000000 * v80 + ((4 * v21 + (unint64_t)v81) >> 32);
        }
        else
        {
          v20 = __bid_ten2k64[v17];
          LODWORD(v21) = v20;
          v22 = 5 * HIDWORD(v20) + ((5 * (unint64_t)v20) >> 32);
        }
        if (v4 > v22)
          goto LABEL_2;
        v76 = (unint64_t)(5 * v21) << 32;
        v83 = v4 == v22;
        goto LABEL_79;
      }
      if (v12 > 11)
      {
        if (v12 > 0x1E)
        {
          v85 = &__bid_ten2k128[2 * (v12 - 31)];
          v86 = 5 * *v85;
          v87 = 10 * HIDWORD(*v85) + 5 * *v85 + ((2 * v86) >> 32);
          v76 = (2 * v86) & 0xFFFFFFFE | (v87 << 32);
          v75 = 5 * HIDWORD(*v85) + 0x50000000ALL * v85[1] + HIDWORD(v86) + HIDWORD(v87);
        }
        else
        {
          v69 = __bid_ten2k64[v17];
          v70 = HIDWORD(v69);
          v71 = 5 * v69;
          v72 = 10 * v69;
          v73 = 5 * HIDWORD(v69) + HIDWORD(v71);
          v74 = 10 * v70 + v71 + ((2 * v71) >> 32);
          v75 = v73 + HIDWORD(v74);
          v76 = v72 & 0xFFFFFFFE | (v74 << 32);
        }
        v83 = v4 == v75;
        if (v4 > v75)
          goto LABEL_2;
LABEL_79:
        if (v83 && v76 <= a1)
          goto LABEL_2;
        goto LABEL_34;
      }
      if (__bid_ten2k64[11 - v12] * a1 > 0x500000009)
        goto LABEL_2;
    }
    else if (v16 < 1)
    {
      return 0;
    }
LABEL_34:
    if (v15 >> 5 > 0xC0)
    {
      if ((_DWORD)v15 == 6176)
      {
        if (a2 >= 0)
          return a1;
        else
          return -(uint64_t)a1;
      }
      v3 = __bid_ten2k64[(v15 - 6176)] * a1;
      goto LABEL_100;
    }
    if (v15 < 0x180D)
    {
      v19 = (uint64_t *)&__bid_midpoint128[(6156 - v15)];
      v4 += v19[1];
      v18 = (6175 - v15);
    }
    else
    {
      v18 = (6175 - v15);
      v19 = &__bid_midpoint64[v18];
    }
    v23 = *v19;
    v24 = v23 + a1;
    if (__CFADD__(v23, a1))
      v25 = v4 + 1;
    else
      v25 = v4;
    v26 = HIDWORD(v24);
    v27 = &__bid_ten2mk128[2 * v18];
    v29 = *v27;
    v28 = v27[1];
    v30 = HIDWORD(v28);
    v31 = HIDWORD(v24) * (unint64_t)v28;
    v32 = HIDWORD(v31) + HIDWORD(v24) * (unint64_t)HIDWORD(v28);
    v33 = v24 * (unint64_t)HIDWORD(v28)
        + v31
        + ((v24 * (unint64_t)v28) >> 32);
    v34 = HIDWORD(v33);
    v35 = (v24 * v28) | ((unint64_t)v33 << 32);
    v36 = HIDWORD(v29);
    v37 = v29 * (unint64_t)HIDWORD(v24);
    v38 = v29 * (unint64_t)v24;
    v39 = HIDWORD(v29) * (unint64_t)v24 + v37 + HIDWORD(v38);
    v40 = v38 | ((unint64_t)v39 << 32);
    v41 = __PAIR128__(v32, v35)
        + __PAIR128__(v34, HIDWORD(v37) + HIDWORD(v29) * (unint64_t)v26 + HIDWORD(v39));
    v42 = HIDWORD(v25);
    LODWORD(v35) = v25;
    v43 = HIDWORD(v25) * (unint64_t)v28;
    v44 = v25 * (unint64_t)v28;
    v45 = v25 * (unint64_t)v30;
    v46 = HIDWORD(v43) + HIDWORD(v25) * (unint64_t)v30;
    v47 = v45 + v43 + HIDWORD(v44);
    v48 = HIDWORD(v47);
    v49 = v44 | ((unint64_t)v47 << 32);
    v50 = HIDWORD(v25) * (unint64_t)v29;
    v51 = v25 * (unint64_t)v29;
    v52 = v35 * (unint64_t)HIDWORD(v29) + v50 + HIDWORD(v51);
    v53 = v51 | ((unint64_t)v52 << 32);
    v55 = v49 + HIDWORD(v50) + v42 * (unint64_t)v36 + HIDWORD(v52);
    v54 = (__PAIR128__(v46, v49)
         + __PAIR128__(v48, HIDWORD(v50) + v42 * (unint64_t)v36 + HIDWORD(v52))) >> 64;
    v56 = __CFADD__(v53, (_QWORD)v41);
    v58 = v53 + v41;
    v57 = (__PAIR128__(v55, v53) + (unint64_t)v41) >> 64;
    v59 = __CFADD__(v56, v55);
    v60 = *((_QWORD *)&v41 + 1) + v57;
    v61 = __CFADD__(*((_QWORD *)&v41 + 1), v57) || v59;
    v62 = v54 + v61;
    v63 = __bid_maskhigh128[v18];
    if (v15 >> 1 >= 0xC05)
    {
      v64 = v63 & v60;
      v65 = (v62 << -(char)__bid_shiftright128[v18]) | (v60 >> __bid_shiftright128[v18]);
      if (v15 < 0x181D)
      {
        v84 = __bid_onehalf128[v18];
        if (v64 <= v84)
        {
          v66 = 0;
          v68 = 1;
          if (v64 != v84 || !(v58 | v40))
            goto LABEL_90;
        }
      }
      else if (v58 <= 0x8000000000000000)
      {
        v66 = 0;
        if (v40)
          v67 = v58 == 0x8000000000000000;
        else
          v67 = 0;
        v68 = !v67;
        goto LABEL_90;
      }
      v66 = 0;
      v68 = 0;
      goto LABEL_90;
    }
    v66 = v63 & v62;
    v65 = v62 >> __bid_shiftright128[v18];
    v77 = __bid_onehalf128[v18];
    if (v66 > v77)
    {
      v78 = 0;
      v68 = 0;
LABEL_96:
      v89 = v68 || v78;
      v3 = v65 - v89;
LABEL_100:
      if (a2 < 0)
        return -(uint64_t)v3;
      return v3;
    }
    v68 = v66 != v77 || !(v58 | v40 | v60);
    v64 = v60;
LABEL_90:
    v78 = 0;
    if (!v66 && !v64 && v58 | v40)
    {
      if (__PAIR128__(v58, v40) <= __bid_ten2mk128trunc[v18])
      {
        v68 = 0;
        v78 = (v65 & 1) == 0;
        v65 &= ~1uLL;
      }
      else
      {
        v78 = 0;
      }
    }
    goto LABEL_96;
  }
  return v3;
}

unint64_t __bid128_to_uint64_int(unint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unsigned __int128 v43;
  BOOL v44;
  unint64_t v45;
  unsigned int v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;

  if ((~a2 & 0x7800000000000000) == 0)
    goto LABEL_2;
  v4 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    return 0;
  v3 = 0;
  v7 = a1 > 0x378D8E63FFFFFFFFLL && v4 == 0x1ED09BEAD87C0;
  if (v4 | a1 && (a2 & 0x6000000000000000) != 0x6000000000000000 && !v7)
  {
    if (a1 >> 53)
      v8 = HIDWORD(a1);
    else
      v8 = a1;
    if (a1 >> 53)
      v9 = -990;
    else
      v9 = -1022;
    if (v4)
      v8 = a2 & 0x1FFFFFFFFFFFFLL;
    v10 = (COERCE_UNSIGNED_INT64((double)v8) >> 52) & 0x7FF;
    if (v4)
      v9 = -958;
    v11 = (v10 + v9 - 1);
    v12 = *((_DWORD *)&__bid_nr_digits + 8 * v11);
    if (!v12)
    {
      v13 = (char *)&__bid_nr_digits + 32 * v11;
      v12 = *((_DWORD *)v13 + 6);
      v14 = *((_QWORD *)v13 + 1);
      if (v4 > v14 || v4 == v14 && *((_QWORD *)&__bid_nr_digits + 4 * v11 + 2) <= a1)
        ++v12;
    }
    v15 = (a2 >> 49) & 0x3FFF;
    v16 = v12 + v15 - 6176;
    if (v16 >= 21)
      goto LABEL_2;
    if (v16 == 20)
    {
      if ((a2 & 0x8000000000000000) != 0)
        goto LABEL_2;
      if (v12 == 1)
      {
        v17 = 5 * a1
            + 1808227885 * HIDWORD(a1)
            + ((1661992960 * (unint64_t)HIDWORD(a1)) >> 32)
            + ((((1661992960 * HIDWORD(a1)) & 0xFFF00000)
              + 1808227885 * a1
              + ((1661992960 * (unint64_t)a1) >> 32)) >> 32);
      }
      else
      {
        if (v12 > 19)
        {
          if (v12 == 21)
          {
            if (v4 >= 0xA)
              goto LABEL_2;
          }
          else if (v12 == 20)
          {
            if (v4)
              goto LABEL_2;
          }
          else if (v4 >= 10 * __bid_ten2k64[v12 - 21])
          {
            goto LABEL_2;
          }
LABEL_42:
          if (v15 >> 5 > 0xC0)
          {
            v3 = a1;
            if ((_DWORD)v15 != 6176)
              return __bid_ten2k64[(v15 - 6176)] * a1;
          }
          else
          {
            v19 = __bid_ten2mk128[2 * (6175 - v15)];
            v20 = __bid_ten2mk128[2 * (6175 - v15) + 1];
            v21 = HIDWORD(v20);
            v22 = v20 * (unint64_t)HIDWORD(a1);
            v23 = HIDWORD(v22) + HIDWORD(v20) * (unint64_t)HIDWORD(a1);
            v24 = HIDWORD(v20) * (unint64_t)a1
                + v22
                + ((v20 * (unint64_t)a1) >> 32);
            v25 = HIDWORD(v24);
            v26 = (v20 * a1) | ((unint64_t)v24 << 32);
            v27 = HIDWORD(v19);
            v29 = (__PAIR128__(v23, v26)
                 + __PAIR128__(v25, ((v19 * (unint64_t)HIDWORD(a1)) >> 32)+ HIDWORD(v19) * (unint64_t)HIDWORD(a1)+ ((HIDWORD(v19) * (unint64_t)a1+ (v19 * HIDWORD(a1))+ ((v19 * (unint64_t)a1) >> 32)) >> 32))) >> 64;
            v28 = v26
                + ((v19 * (unint64_t)HIDWORD(a1)) >> 32)
                + HIDWORD(v19) * (unint64_t)HIDWORD(a1)
                + ((HIDWORD(v19) * (unint64_t)a1
                  + (v19 * HIDWORD(a1))
                  + ((v19 * (unint64_t)a1) >> 32)) >> 32);
            v30 = HIDWORD(v4);
            v31 = v20 * (unint64_t)v30;
            v32 = v20 * (unint64_t)a2;
            v33 = v21 * (unint64_t)a2;
            v34 = HIDWORD(v31) + v21 * (unint64_t)v30;
            v35 = v33 + v31 + HIDWORD(v32);
            v36 = HIDWORD(v35);
            v37 = v32 | ((unint64_t)v35 << 32);
            v38 = v19 * (unint64_t)v30;
            v39 = v19 * (unint64_t)a2;
            v40 = HIDWORD(v38) + v27 * (unint64_t)v30;
            v41 = v27 * (unint64_t)a2 + v38 + HIDWORD(v39);
            v42 = v39 | ((unint64_t)v41 << 32);
            v43 = __PAIR128__(v34, v37) + __PAIR128__(v36, v40 + HIDWORD(v41));
            v44 = __CFADD__(__CFADD__(v42, v28), v37 + v40 + HIDWORD(v41));
            v45 = __CFADD__(v42, v28) + v37 + v40 + HIDWORD(v41);
            v46 = v44;
            v47 = v29 + v45;
            if (__CFADD__(v29, v45))
              v48 = 1;
            else
              v48 = v46;
            v49 = *((_QWORD *)&v43 + 1) + v48;
            v50 = __bid_shiftright128[(6175 - v15)];
            if (v15 >> 1 < 0xC05)
              return v49 >> v50;
            else
              return (v49 << -(char)v50) | (v47 >> v50);
          }
          return v3;
        }
        v18 = __bid_ten2k64[21 - v12];
        v17 = ((v18 * (unint64_t)HIDWORD(a1)) >> 32)
            + HIDWORD(v18) * (unint64_t)HIDWORD(a1)
            + ((HIDWORD(v18) * (unint64_t)a1
              + (v18 * HIDWORD(a1))
              + ((v18 * (unint64_t)a1) >> 32)) >> 32);
      }
      if (v17 < 0xA)
        goto LABEL_42;
    }
    else
    {
      if (v16 < 1)
        return 0;
      if ((a2 & 0x8000000000000000) == 0)
        goto LABEL_42;
    }
LABEL_2:
    *a3 |= 1u;
    return 0x8000000000000000;
  }
  return v3;
}

double __bid128_to_binary64(unint64_t a1, unint64_t a2, int a3, int *a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v8;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int v12;
  _BOOL4 v13;
  int8x16_t v14;
  int8x8_t v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  int v25;
  char *v26;
  __int128 v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  BOOL v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unsigned __int128 v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unsigned int v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  _BOOL4 v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unsigned int v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  int v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  int v114;

  if ((~a2 & 0x6000000000000000) == 0)
  {
    if ((~a2 & 0x7800000000000000) == 0)
    {
      if ((~a2 & 0x7C00000000000000) == 0)
      {
        if ((a2 & 0x200000000000000) != 0)
          *a4 |= 1u;
        if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
          || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
        {
          v4 = a2 & 0x8000000000000000;
        }
        else
        {
          *((_QWORD *)&v27 + 1) = a2;
          *(_QWORD *)&v27 = a1;
          v4 = a2 & 0x8000000000000000 | ((unint64_t)(v27 >> 46) >> 13);
        }
        v6 = v4 | 0x7FF8000000000000;
        return *(double *)&v6;
      }
LABEL_78:
      v6 = a2 & 0x8000000000000000 | 0x7FF0000000000000;
      return *(double *)&v6;
    }
LABEL_11:
    v6 = a2 & 0x8000000000000000;
    return *(double *)&v6;
  }
  v5 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    goto LABEL_11;
  v8 = (a2 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a1 > 0x378D8E63FFFFFFFFLL;
  if (v8 || !(v5 | a1))
    goto LABEL_11;
  v9 = (a2 >> 49) & 0x3FFF;
  if (v5)
  {
    v10 = (int8x16_t)vdupq_n_s64(a2);
    v11 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917D50), (uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917D70))));
    v12 = 2 * ((a2 & 0xCCCCCCCCCCCCLL) <= (a2 & 0x1333333333333));
    v13 = (a2 & 0xAAAAAAAAAAAALL) <= (a2 & 0x1555555555555);
  }
  else
  {
    v14 = (int8x16_t)vdupq_n_s64(a1);
    v12 = 2 * ((a1 & 0xCCCCCCCCCCCCCCCCLL) <= (a1 & 0x3333333333333333));
    v13 = (a1 & 0xAAAAAAAAAAAAAAAALL) <= (a1 & 0x5555555555555555);
    v11 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v14, (int8x16_t)xmmword_1B8917D80), (uint64x2_t)vandq_s8(v14, (int8x16_t)xmmword_1B8917D90)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v14, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v14, (int8x16_t)xmmword_1B8917CF0))), (int8x16_t)xmmword_1B8917DB0, (int8x16_t)xmmword_1B8917DA0);
  }
  v15 = vorr_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
  v16 = v15.i32[0] | v12 | v15.i32[1] | v13;
  v17 = v16 - 15;
  if (v16 != 15)
  {
    if (v16 < 0x4F)
    {
      v5 = (v5 << v17) + (a1 >> (79 - v16));
      a1 <<= v17;
    }
    else
    {
      v5 = a1 << (v16 - 79);
      a1 = 0;
    }
  }
  if (v9 >= 0x1955)
  {
LABEL_72:
    *a4 |= 0x28u;
    if (a3 == 3 || ((a2 & 0x8000000000000000) == 0 ? (v110 = 1) : (v110 = 2), v110 == a3))
    {
      v6 = a2 & 0x8000000000000000 | 0x7FEFFFFFFFFFFFFFLL;
      return *(double *)&v6;
    }
    goto LABEL_78;
  }
  v18 = a2 >> 63;
  *((_QWORD *)&v20 + 1) = v5;
  *(_QWORD *)&v20 = a1;
  v19 = v20 >> 58;
  v21 = a1 << 6;
  if (v9 >= 0x16BB)
    v22 = v9 - 6176;
  else
    v22 = -358;
  v23 = v22;
  v24 = (char *)&bid_breakpoints_binary64 + 16 * v22;
  v25 = bid_exponents_binary64[v22 + 358] - v17;
  if (__PAIR128__(v19, v21) > *((_OWORD *)v24 + 358))
  {
    ++v25;
    v26 = (char *)&unk_1B897C100;
  }
  else
  {
    v26 = (char *)&unk_1B8976D80;
  }
  v28 = &v26[32 * v23];
  v30 = *(_QWORD *)v28;
  v29 = *((_QWORD *)v28 + 1);
  v31 = HIDWORD(v21);
  v32 = (_DWORD)a1 << 6;
  v33 = HIDWORD(*(_QWORD *)v28);
  v34 = *(_QWORD *)v28;
  v35 = ((v34 * (unint64_t)v31) >> 32)
      + v33 * (unint64_t)v31
      + ((v33 * (unint64_t)v32 + v34 * v31 + ((v34 * (unint64_t)v32) >> 32)) >> 32);
  v36 = HIDWORD(v29);
  v37 = v29 * (unint64_t)v31;
  v38 = v29 * (unint64_t)((_DWORD)a1 << 6);
  v39 = *((_QWORD *)v28 + 2);
  v40 = *((_QWORD *)v28 + 3);
  v41 = HIDWORD(v37) + HIDWORD(v29) * (unint64_t)v31;
  v42 = HIDWORD(v29) * (unint64_t)v32 + v37 + HIDWORD(v38);
  v43 = v41 + HIDWORD(v42);
  v44 = v38 & 0xFFFFFFC0 | (v42 << 32);
  v45 = HIDWORD(v39);
  v46 = v39 * (unint64_t)v31;
  v47 = v39 * (unint64_t)v32;
  v48 = HIDWORD(v46) + HIDWORD(v39) * (unint64_t)v31;
  v49 = HIDWORD(v39) * (unint64_t)v32 + v46 + HIDWORD(v47);
  v50 = v48 + HIDWORD(v49);
  v51 = v47 & 0xFFFFFFC0 | (v49 << 32);
  v52 = v40 * (unint64_t)v31;
  v53 = v40 * (unint64_t)v32;
  v54 = HIDWORD(v52) + HIDWORD(v40) * (unint64_t)v31;
  v55 = HIDWORD(v40) * (unint64_t)v32 + v52 + HIDWORD(v53);
  v56 = HIDWORD(v55);
  v57 = v53 & 0xFFFFFFC0 | (v55 << 32);
  v58 = __CFADD__(v35, v44);
  v59 = v35 + v44;
  v60 = v51 + v58 + v43;
  v61 = v57 + (__CFADD__(v58, v43) | __CFADD__(v51, v58 + v43)) + v50;
  v62 = v56
      + (__CFADD__(__CFADD__(v58, v43) | __CFADD__(v51, v58 + v43), v50) | __CFADD__(v57, (__CFADD__(v58, v43) | __CFADD__(v51, v58 + v43)) + v50))
      + v54;
  v63 = HIDWORD(v19);
  LODWORD(v50) = v19;
  v64 = v34 * (unint64_t)HIDWORD(v19);
  v65 = v30 * (unint64_t)v19;
  v66 = v33 * (unint64_t)v19;
  v67 = HIDWORD(v64) + v33 * (unint64_t)HIDWORD(v19);
  v68 = v66 + v64 + HIDWORD(v65);
  v69 = v67 + HIDWORD(v68);
  v70 = v29 * (unint64_t)HIDWORD(v19);
  v71 = v29 * (unint64_t)v19;
  v72 = v36 * (unint64_t)v19;
  v73 = HIDWORD(v70) + v36 * (unint64_t)HIDWORD(v19);
  v74 = v72 + v70 + HIDWORD(v71);
  v75 = v73 + HIDWORD(v74);
  v76 = v71 | ((unint64_t)v74 << 32);
  v77 = v39 * (unint64_t)HIDWORD(v19);
  v78 = v39 * (unint64_t)v19;
  v79 = v45 * (unint64_t)v19;
  v80 = HIDWORD(v77) + v45 * (unint64_t)HIDWORD(v19);
  v81 = v79 + v77 + HIDWORD(v78);
  v82 = v78 | ((unint64_t)v81 << 32);
  v83 = v40 * (unint64_t)HIDWORD(v19);
  v84 = v40 * (unint64_t)v19;
  v85 = HIDWORD(v83) + HIDWORD(v40) * (unint64_t)v63;
  v86 = HIDWORD(v40) * (unint64_t)v50 + v83 + HIDWORD(v84);
  v87 = v84 | ((unint64_t)v86 << 32);
  v88 = __PAIR128__(v82, v69) + v76;
  LODWORD(v89) = __CFADD__(__CFADD__(v69, v76), v82);
  v90 = v80 + HIDWORD(v81);
  v91 = v75 + *((_QWORD *)&v88 + 1);
  if (__CFADD__(v75, *((_QWORD *)&v88 + 1)))
    v89 = 1;
  else
    v89 = v89;
  v58 = __CFADD__(v87, v89);
  v92 = v87 + v89;
  v93 = v58;
  v58 = __CFADD__(v90, v92);
  v94 = v90 + v92;
  v95 = v85 + HIDWORD(v86);
  if (v58)
    v96 = 1;
  else
    v96 = v93;
  v97 = v95 + v96;
  v98 = v65 | ((unint64_t)v68 << 32);
  v99 = __CFADD__(__CFADD__(v98, v59), (_QWORD)v88);
  v100 = __CFADD__(__CFADD__(v98, v59) + (_QWORD)v88, v60) || v99;
  v58 = __CFADD__(v91, v100);
  v101 = v91 + v100;
  LODWORD(v102) = v58;
  v58 = __CFADD__(v101, v61);
  v103 = v101 + v61;
  if (v58)
    v102 = 1;
  else
    v102 = v102;
  v58 = __CFADD__(v94, v102);
  v104 = v94 + v102;
  v105 = v58;
  v58 = __CFADD__(v62, v104);
  v106 = v62 + v104;
  if (v58)
    v107 = 1;
  else
    v107 = v105;
  v108 = v97 + v107;
  if (v25 <= 0)
  {
    v109 = 1 - v25;
    if (v109 >= 55)
      LOBYTE(v109) = 55;
    v103 = (v106 << -(char)v109) + (v103 >> v109);
    v106 = (v108 << -(char)v109) + (v106 >> v109);
    v108 >>= v109;
    v25 = 1;
  }
  if (bid_roundbound_128[(4 * a3) | (2 * v18) | v108 & 1] < __PAIR128__(v106, v103))
  {
    if (++v108 == 0x20000000000000)
    {
      ++v25;
      v108 = 0x10000000000000;
    }
    else if (v108 == 0x10000000000000 && v25 == 1)
    {
      if ((a3 & 3) == 0 && v106 >> 62 != 3
        || (v111 = 0, v113 = v18 + a3, v112 = 1, v113 == 2) && (v106 & 0x8000000000000000) == 0)
      {
        v111 = 0;
        *a4 |= 0x10u;
        v112 = 1;
      }
      goto LABEL_89;
    }
  }
  if (v25 >= 0x7FF)
    goto LABEL_72;
  v111 = v108 & 0xFFFFFFFFFFFFFLL;
  if (v108 >> 52)
    v112 = v25;
  else
    v112 = 0;
LABEL_89:
  if (v106 | v103)
  {
    v114 = *a4;
    *a4 |= 0x20u;
    if (!(_DWORD)v112)
      *a4 = v114 | 0x30;
  }
  v6 = a2 & 0x8000000000000000 | (v112 << 52) | v111;
  return *(double *)&v6;
}

unint64_t __bid128_to_binary128(unint64_t a1, unint64_t a2, int a3, int *a4)
{
  unint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int v10;
  _BOOL4 v11;
  int8x16_t v12;
  int8x8_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int v24;
  char *v25;
  __int128 v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  BOOL v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unsigned __int128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unsigned int v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  _BOOL4 v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unsigned int v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  int v110;
  unsigned int v111;
  BOOL v112;
  char v113;
  unint64_t v114;
  unint64_t v115;
  int v116;
  int v117;
  int v118;
  int v119;

  if ((~a2 & 0x6000000000000000) == 0)
  {
    if ((~a2 & 0x7800000000000000) == 0)
    {
      if ((~a2 & 0x7C00000000000000) == 0)
      {
        if ((a2 & 0x200000000000000) != 0)
          *a4 |= 1u;
        if ((a2 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
          || a1 >= 0x38C15B0A00000000 && (a2 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
        {
          return 0;
        }
        *((_QWORD *)&v26 + 1) = a2;
        *(_QWORD *)&v26 = a1;
        return (2 * (a1 & 0x3FFFFFFFFFFFLL)) | ((unint64_t)(v26 >> 46) << 47);
      }
      return 0;
    }
    return 0;
  }
  v5 = a2 & 0x1FFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
    return 0;
  v6 = (a2 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a1 > 0x378D8E63FFFFFFFFLL;
  if (v6 || !(v5 | a1))
    return 0;
  v7 = (a2 >> 49) & 0x3FFF;
  if (v5)
  {
    v8 = (int8x16_t)vdupq_n_s64(a2);
    v9 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D50), (uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D70))));
    v10 = 2 * ((a2 & 0xCCCCCCCCCCCCLL) <= (a2 & 0x1333333333333));
    v11 = (a2 & 0xAAAAAAAAAAAALL) <= (a2 & 0x1555555555555);
  }
  else
  {
    v12 = (int8x16_t)vdupq_n_s64(a1);
    v10 = 2 * ((a1 & 0xCCCCCCCCCCCCCCCCLL) <= (a1 & 0x3333333333333333));
    v11 = (a1 & 0xAAAAAAAAAAAAAAAALL) <= (a1 & 0x5555555555555555);
    v9 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917D80), (uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917D90)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917CF0))), (int8x16_t)xmmword_1B8917DB0, (int8x16_t)xmmword_1B8917DA0);
  }
  v13 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  v14 = v13.i32[0] | v10 | v13.i32[1] | v11;
  v15 = v14 - 15;
  if (v14 != 15)
  {
    if (v14 < 0x4F)
    {
      v5 = (v5 << v15) + (a1 >> (79 - v14));
      a1 <<= v15;
    }
    else
    {
      v5 = a1 << (v14 - 79);
      a1 = 0;
    }
  }
  if (v7 >= 0x2B65)
  {
LABEL_84:
    *a4 |= 0x28u;
    if (a3 == 3)
      return -1;
    v118 = (a2 & 0x8000000000000000) == 0 ? 1 : 2;
    if (v118 == a3)
      return -1;
    return 0;
  }
  v16 = a2 >> 63;
  *((_QWORD *)&v18 + 1) = v5;
  *(_QWORD *)&v18 = a1;
  v17 = v18 >> 62;
  v19 = 4 * a1;
  if (v7 >= 0x499)
    v20 = v7 - 6176;
  else
    v20 = -5000;
  v21 = v20;
  v22 = &bid_breakpoints_binary128[2 * v20 + 10000];
  v23 = bid_breakpoints_binary128[2 * v20 + 10001];
  v24 = bid_exponents_binary128[v20 + 5000] - v15;
  if (__PAIR128__(v17, v19) > __PAIR128__(v23, *v22))
  {
    ++v24;
    v25 = (char *)&unk_1B8A23AA0;
  }
  else
  {
    v25 = (char *)&unk_1B89D60E0;
  }
  v27 = &v25[32 * v21];
  v29 = *(_QWORD *)v27;
  v28 = *((_QWORD *)v27 + 1);
  v30 = HIDWORD(v19);
  v31 = 4 * a1;
  v32 = HIDWORD(*(_QWORD *)v27);
  v33 = *(_QWORD *)v27;
  v34 = ((v33 * (unint64_t)v30) >> 32)
      + v32 * (unint64_t)v30
      + ((v32 * (unint64_t)v31 + v33 * v30 + ((v33 * (unint64_t)v31) >> 32)) >> 32);
  v35 = HIDWORD(v28);
  v36 = v28 * (unint64_t)v30;
  v37 = v28 * (unint64_t)(4 * a1);
  v38 = *((_QWORD *)v27 + 2);
  v39 = *((_QWORD *)v27 + 3);
  v40 = HIDWORD(v36) + HIDWORD(v28) * (unint64_t)v30;
  v41 = HIDWORD(v28) * (unint64_t)v31 + v36 + HIDWORD(v37);
  v42 = v40 + HIDWORD(v41);
  v43 = v37 & 0xFFFFFFFC | (v41 << 32);
  v44 = HIDWORD(v38);
  v45 = v38 * (unint64_t)v30;
  v46 = v38 * (unint64_t)v31;
  v47 = HIDWORD(v45) + HIDWORD(v38) * (unint64_t)v30;
  v48 = HIDWORD(v38) * (unint64_t)v31 + v45 + HIDWORD(v46);
  v49 = v47 + HIDWORD(v48);
  v50 = v46 & 0xFFFFFFFC | (v48 << 32);
  v51 = v39 * (unint64_t)v30;
  v52 = v39 * (unint64_t)v31;
  v53 = HIDWORD(v51) + HIDWORD(v39) * (unint64_t)v30;
  v54 = HIDWORD(v39) * (unint64_t)v31 + v51 + HIDWORD(v52);
  v55 = HIDWORD(v54);
  v56 = v52 & 0xFFFFFFFC | (v54 << 32);
  v57 = __CFADD__(v34, v43);
  v58 = v34 + v43;
  v59 = v50 + v57 + v42;
  v60 = v56 + (__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42)) + v49;
  v61 = v55
      + (__CFADD__(__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42), v49) | __CFADD__(v56, (__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42)) + v49))
      + v53;
  v62 = HIDWORD(v17);
  LODWORD(v49) = v17;
  v63 = v33 * (unint64_t)HIDWORD(v17);
  v64 = v29 * (unint64_t)v17;
  v65 = v32 * (unint64_t)v17;
  v66 = HIDWORD(v63) + v32 * (unint64_t)HIDWORD(v17);
  v67 = v65 + v63 + HIDWORD(v64);
  v68 = v66 + HIDWORD(v67);
  v69 = v28 * (unint64_t)HIDWORD(v17);
  v70 = v28 * (unint64_t)v17;
  v71 = v35 * (unint64_t)v17;
  v72 = HIDWORD(v69) + v35 * (unint64_t)HIDWORD(v17);
  v73 = v71 + v69 + HIDWORD(v70);
  v74 = v72 + HIDWORD(v73);
  v75 = v70 | ((unint64_t)v73 << 32);
  v76 = v38 * (unint64_t)HIDWORD(v17);
  v77 = v38 * (unint64_t)v17;
  v78 = v44 * (unint64_t)v17;
  v79 = HIDWORD(v76) + v44 * (unint64_t)HIDWORD(v17);
  v80 = v78 + v76 + HIDWORD(v77);
  v81 = v77 | ((unint64_t)v80 << 32);
  v82 = v39 * (unint64_t)HIDWORD(v17);
  v83 = v39 * (unint64_t)v17;
  v84 = HIDWORD(v82) + HIDWORD(v39) * (unint64_t)v62;
  v85 = HIDWORD(v39) * (unint64_t)v49 + v82 + HIDWORD(v83);
  v86 = v83 | ((unint64_t)v85 << 32);
  v87 = __PAIR128__(v81, v68) + v75;
  LODWORD(v88) = __CFADD__(__CFADD__(v68, v75), v81);
  v89 = v79 + HIDWORD(v80);
  v90 = v74 + *((_QWORD *)&v87 + 1);
  if (__CFADD__(v74, *((_QWORD *)&v87 + 1)))
    v88 = 1;
  else
    v88 = v88;
  v57 = __CFADD__(v86, v88);
  v91 = v86 + v88;
  v92 = v57;
  v57 = __CFADD__(v89, v91);
  v93 = v89 + v91;
  v94 = v84 + HIDWORD(v85);
  if (v57)
    v95 = 1;
  else
    v95 = v92;
  v96 = v94 + v95;
  v97 = v64 | ((unint64_t)v67 << 32);
  v98 = __CFADD__(v97, v58) + (_QWORD)v87;
  v99 = __CFADD__(__CFADD__(v97, v58), (_QWORD)v87);
  v100 = v59 + v98;
  v101 = __CFADD__(v59, v98) || v99;
  v57 = __CFADD__(v90, v101);
  v102 = v90 + v101;
  LODWORD(v103) = v57;
  v57 = __CFADD__(v102, v60);
  v104 = v102 + v60;
  if (v57)
    v103 = 1;
  else
    v103 = v103;
  v57 = __CFADD__(v93, v103);
  v105 = v93 + v103;
  v106 = v57;
  v57 = __CFADD__(v61, v105);
  v107 = v61 + v105;
  if (v57)
    v108 = 1;
  else
    v108 = v106;
  result = v96 + v108;
  if (v24 <= 0)
  {
    v110 = 1 - v24;
    if (v110 >= 115)
      v111 = 115;
    else
      v111 = v110;
    v113 = v111 - 64;
    v112 = v111 == 64;
    if (v111 < 0x40)
    {
      v113 = v111;
      v109 = result;
    }
    else
    {
      v109 = 0;
      if (v112)
      {
        v24 = 1;
        goto LABEL_76;
      }
      v100 = v104;
      v104 = v107;
      v107 = result;
    }
    v114 = (v104 << -v113) + (v100 >> v113);
    v115 = (v107 << -v113) + (v104 >> v113);
    result = (v109 << -v113) + (v107 >> v113);
    v109 >>= v113;
    v24 = 1;
    v107 = v115;
    v104 = v114;
  }
  else
  {
    v109 = v96 + v108;
    result = v107;
    v107 = v104;
    v104 = v100;
  }
LABEL_76:
  if (bid_roundbound_128[(4 * a3) | (2 * v16) | result & 1] < __PAIR128__(v107, v104))
  {
    v57 = __CFADD__(result++, 1);
    if (v57)
    {
      if (++v109 == 0x2000000000000)
      {
        result = 0;
        ++v24;
        v109 = 0x1000000000000;
      }
      else
      {
        result = 0;
        if (v109 == 0x1000000000000 && v24 == 1)
        {
          v116 = v16 + a3;
          v117 = 1;
          result = 0;
          if (v116 == 2 && (v107 & 0x8000000000000000) == 0)
          {
            result = 0;
            *a4 |= 0x10u;
            v117 = 1;
          }
          goto LABEL_94;
        }
      }
    }
  }
  if (v24 >= 0x7FFF)
    goto LABEL_84;
  if (HIWORD(v109))
    v117 = v24;
  else
    v117 = 0;
LABEL_94:
  if (v107 | v104)
  {
    v119 = *a4;
    *a4 |= 0x20u;
    if (!v117)
      *a4 = v119 | 0x30;
  }
  return result;
}

unint64_t __binary64_to_bid128(int a1, _DWORD *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  int8x16_t v10;
  int8x16_t v11;
  __int32 v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v31;
  BOOL v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unsigned int v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  _BOOL4 v86;
  uint64_t v87;
  unint64_t v88;
  unsigned int v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unsigned int v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  _BOOL8 v142;
  unsigned int v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unsigned int v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unsigned int v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unsigned int v182;
  uint64_t v183;
  unint64_t v184;
  unsigned int v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unsigned int v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unsigned int v193;
  unint64_t v194;
  unsigned int v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unint64_t v209;
  unint64_t v210;
  unint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  _BOOL8 v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  char v224;
  char v225;
  char v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  uint64_t v234;
  uint64_t v235;
  unint64_t v236;
  unint64_t v237;
  uint64_t v238;
  unint64_t v239;
  uint64_t v240;
  unint64_t v241;
  uint64_t v242;
  unint64_t v243;
  uint64_t v244;
  unint64_t v245;
  unint64_t v246;
  uint64_t v247;
  _BOOL8 v248;
  unint64_t v249;
  uint64_t v250;
  _BOOL8 v251;
  uint64_t v252;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  uint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unsigned int v264;
  char v265;
  unint64_t v266;
  int v267;
  _DWORD *v268;

  v6 = (*(_QWORD *)&a3 >> 52) & 0x7FFLL;
  v7 = *(_QWORD *)&a3 & 0xFFFFFFFFFFFFFLL;
  if ((_DWORD)v6)
  {
    if ((~*(_QWORD *)&a3 & 0x7FF0000000000000) == 0)
    {
      if (!v7)
        return 0;
      if ((*(_QWORD *)&a3 & 0x8000000000000) == 0)
        *a2 |= 1u;
      if (*(_QWORD *)&a3 << 13 > 0xC5371912364FFFFFLL)
        return 0;
      v8 = *(_QWORD *)&a3 << 59;
      if (*(_QWORD *)&a3 << 59 > 0x38C15B09FFFFFFFFuLL
        && ((*(_QWORD *)&a3 >> 5) & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
      {
        return 0;
      }
      return v8;
    }
    v16 = v7 | 0x10000000000000;
    v17 = (v7 | 0x10000000000000) & -(v7 | 0x10000000000000);
    v18 = v17 == 0;
    v19 = (v17 & 0xFFFF0000FFFFLL) == 0;
    v20 = (v17 & 0x1F00FF00FF00FFLL) == 0;
    v21 = (v17 & 0xF0F0F0F0F0F0FLL) == 0;
    v22 = (v17 & 0x13333333333333) == 0;
    v23 = (v17 & 0x15555555555555) == 0;
    v14 = v6 - 1075;
    v15 = v16 << 11;
    if (v6 > 0x46F)
      goto LABEL_30;
    v9 = (16 * v19) | (32 * v18) | (8 * v20) | (4 * v21) | (2 * v22) | v23;
  }
  else
  {
    if (!v7)
      return 0;
    v9 = 0;
    v10 = (int8x16_t)vdupq_n_s64(*(unint64_t *)&a3);
    v11 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917DC0), (uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v10, (int8x16_t)xmmword_1B8917DD0))));
    *(int8x8_t *)v11.i8 = vorr_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    v12 = v11.i32[0] | v11.i32[1] | (2 * ((*(_QWORD *)&a3 & 0xCCCCCCCCCCCCCuLL) <= (*(_QWORD *)&a3 & 0x3333333333333uLL))) | ((*(_QWORD *)&a3 & 0xAAAAAAAAAAAAAuLL) <= (*(_QWORD *)&a3 & 0x5555555555555uLL));
    v13 = v7 << (v12 - 11);
    v14 = -1063 - v12;
    *a2 |= 2u;
    v15 = v13 << 11;
  }
  v24 = v9 + v14;
  if (v9 + v14 < 0)
  {
    if (v24 >= 0xFFFFFFD0)
    {
      v25 = -v24;
      v26 = (unint64_t *)((char *)&bid_coefflimits_bid128 + 16 * v25);
      v27 = *v26;
      v28 = v26[1];
      v29 = v15 >> (v9 + 11);
      if (v28 || v29 <= v27)
        return (bid_power_five[2 * v25] * v29) | ((unint64_t)(HIDWORD(bid_power_five[2 * v25]) * v29 + bid_power_five[2 * v25] * HIDWORD(v29) + ((bid_power_five[2 * v25] * (unint64_t)v29) >> 32)) << 32);
    }
LABEL_30:
    v33 = 17744 - ((19728 * (v14 + 42092) + ((19779 * (v14 + 42092)) >> 16)) >> 16);
    v34 = v33 & 0x7F;
    v35 = v33 >> 7;
    v36 = (uint64_t *)((char *)&bid_innertable_sig + 32 * v34);
    v37 = *v36;
    v38 = v36[1];
    v40 = v36[2];
    v39 = v36[3];
    v41 = bid_innertable_exp[v34];
    if ((_DWORD)v35 != 39)
    {
      v42 = (uint64_t *)((char *)&bid_outertable_sig + 32 * v35);
      v43 = *v42;
      v44 = v42[1];
      v268 = a2;
      v45 = HIDWORD(*v42);
      v46 = *v42;
      v266 = v15;
      v267 = a1;
      v47 = ((v43 * (unint64_t)HIDWORD(v37)) >> 32)
          + HIDWORD(v43) * (unint64_t)HIDWORD(v37)
          + ((HIDWORD(v43) * (unint64_t)v37
            + (v43 * HIDWORD(v37))
            + ((v43 * (unint64_t)v37) >> 32)) >> 32);
      v48 = HIDWORD(v44);
      v265 = v41;
      v49 = v44 * (unint64_t)HIDWORD(v37);
      v50 = HIDWORD(v44) * (unint64_t)v37
          + v49
          + ((v44 * (unint64_t)v37) >> 32);
      v51 = HIDWORD(v49) + HIDWORD(v44) * (unint64_t)HIDWORD(v37) + HIDWORD(v50);
      v53 = v42[2];
      v52 = v42[3];
      v54 = HIDWORD(v53);
      v55 = v53 * (unint64_t)HIDWORD(v37);
      v264 = v35;
      v56 = HIDWORD(v53) * (unint64_t)v37
          + v55
          + ((v53 * (unint64_t)v37) >> 32);
      v57 = HIDWORD(v55) + HIDWORD(v53) * (unint64_t)HIDWORD(v37) + HIDWORD(v56);
      v58 = v52 * (unint64_t)HIDWORD(v37);
      v59 = (v44 * v37) | ((unint64_t)v50 << 32);
      v60 = (v53 * v37) | ((unint64_t)v56 << 32);
      v262 = HIDWORD(v52) * (unint64_t)v37
           + v58
           + ((v52 * (unint64_t)v37) >> 32);
      v263 = HIDWORD(v58) + HIDWORD(v52) * (unint64_t)HIDWORD(v37);
      v61 = (v52 * v37) | ((unint64_t)v262 << 32);
      v261 = v47 + v59;
      v62 = __CFADD__(v47, v59) + v60;
      v63 = __CFADD__(__CFADD__(v47, v59), v60);
      v260 = v51 + v62;
      v64 = __CFADD__(v51, v62) || v63;
      v32 = __CFADD__(v61, v64);
      v65 = v61 + v64;
      LODWORD(v66) = v32;
      v32 = __CFADD__(v57, v65);
      v259 = v57 + v65;
      v67 = v46 * (unint64_t)HIDWORD(v38);
      v68 = HIDWORD(v67) + v45 * (unint64_t)HIDWORD(v38);
      v69 = v45 * (unint64_t)v38
          + v67
          + ((v43 * (unint64_t)v38) >> 32);
      v70 = v68 + HIDWORD(v69);
      v71 = (v43 * v38) | ((unint64_t)v69 << 32);
      v72 = v44 * (unint64_t)HIDWORD(v38);
      v73 = HIDWORD(v72) + HIDWORD(v44) * (unint64_t)HIDWORD(v38);
      v74 = HIDWORD(v44) * (unint64_t)v38
          + v72
          + ((v44 * (unint64_t)v38) >> 32);
      v75 = v73 + HIDWORD(v74);
      v76 = (v44 * v38) | ((unint64_t)v74 << 32);
      v77 = v53 * (unint64_t)HIDWORD(v38);
      v78 = HIDWORD(v53) * (unint64_t)v38
          + v77
          + ((v53 * (unint64_t)v38) >> 32);
      v79 = HIDWORD(v77) + HIDWORD(v53) * (unint64_t)HIDWORD(v38) + HIDWORD(v78);
      v80 = (v53 * v38) | ((unint64_t)v78 << 32);
      v81 = v52 * (unint64_t)HIDWORD(v38);
      if (v32)
        v66 = 1;
      else
        v66 = v66;
      v257 = v66;
      v258 = HIDWORD(v81) + HIDWORD(v52) * (unint64_t)HIDWORD(v38);
      v82 = v52 * (unint64_t)v38;
      v83 = HIDWORD(v52) * (unint64_t)v38 + v81 + HIDWORD(v82);
      v84 = v82 | ((unint64_t)v83 << 32);
      v254 = v70 + v76;
      v85 = __CFADD__(v70, v76) + v80;
      v86 = __CFADD__(__CFADD__(v70, v76), v80);
      v256 = v75 + v85;
      v87 = __CFADD__(v75, v85) || v86;
      v32 = __CFADD__(v84, v87);
      v88 = v84 + v87;
      v89 = v32;
      v32 = __CFADD__(v79, v88);
      v255 = v79 + v88;
      v90 = v44 * (unint64_t)HIDWORD(v40);
      v91 = HIDWORD(v44) * (unint64_t)v40
          + v90
          + ((v44 * (unint64_t)v40) >> 32);
      v92 = HIDWORD(v90) + HIDWORD(v44) * (unint64_t)HIDWORD(v40) + HIDWORD(v91);
      v93 = (v44 * v40) | ((unint64_t)v91 << 32);
      v94 = v53 * (unint64_t)HIDWORD(v40);
      v95 = HIDWORD(v53) * (unint64_t)v40
          + v94
          + ((v53 * (unint64_t)v40) >> 32);
      v96 = HIDWORD(v94) + HIDWORD(v53) * (unint64_t)HIDWORD(v40) + HIDWORD(v95);
      v97 = (v53 * v40) | ((unint64_t)v95 << 32);
      v98 = v46 * (unint64_t)HIDWORD(v40);
      v99 = v45 * (unint64_t)v40 + v98;
      v100 = HIDWORD(v98) + v45 * (unint64_t)HIDWORD(v40);
      v101 = v52 * (unint64_t)HIDWORD(v40);
      v102 = HIDWORD(v101) + HIDWORD(v52) * (unint64_t)HIDWORD(v40);
      v103 = HIDWORD(v52) * (unint64_t)v40 + v101;
      if (v32)
        v104 = 1;
      else
        v104 = v89;
      v105 = v43 * (unint64_t)v40;
      v106 = v99 + HIDWORD(v105);
      v107 = v100 + HIDWORD(v106);
      v108 = v107 + v93;
      v32 = __CFADD__(__CFADD__(v107, v93), v97);
      v109 = __CFADD__(v107, v93) + v97;
      v110 = v32;
      v32 = __CFADD__(v92, v109);
      v111 = v92 + v109;
      v112 = v52 * (unint64_t)v40;
      v113 = v103 + HIDWORD(v112);
      v114 = v112 | ((unint64_t)v113 << 32);
      if (v32)
        v115 = 1;
      else
        v115 = v110;
      v32 = __CFADD__(v114, v115);
      v116 = v114 + v115;
      LODWORD(v117) = v32;
      v32 = __CFADD__(v96, v116);
      v118 = v96 + v116;
      v119 = v46 * (unint64_t)HIDWORD(v39);
      v120 = HIDWORD(v119) + v45 * (unint64_t)HIDWORD(v39);
      v121 = v45 * (unint64_t)v39 + v119;
      v122 = v44 * (unint64_t)HIDWORD(v39);
      v123 = HIDWORD(v122) + HIDWORD(v44) * (unint64_t)HIDWORD(v39);
      v124 = v44 * (unint64_t)v39;
      v125 = v48 * (unint64_t)v39 + v122 + HIDWORD(v124);
      v126 = v123 + HIDWORD(v125);
      v127 = v124 | ((unint64_t)v125 << 32);
      v128 = v53 * (unint64_t)HIDWORD(v39);
      v129 = HIDWORD(v128) + HIDWORD(v53) * (unint64_t)HIDWORD(v39);
      v130 = v53 * (unint64_t)v39;
      v131 = v54 * (unint64_t)v39 + v128 + HIDWORD(v130);
      v132 = v129 + HIDWORD(v131);
      v133 = v130 | ((unint64_t)v131 << 32);
      v134 = v52 * (unint64_t)HIDWORD(v39);
      v135 = HIDWORD(v134) + HIDWORD(v52) * (unint64_t)HIDWORD(v39);
      v136 = HIDWORD(v52) * (unint64_t)v39 + v134;
      if (v32)
        v117 = 1;
      else
        v117 = v117;
      v137 = v43 * (unint64_t)v39;
      v138 = v121 + HIDWORD(v137);
      v139 = v120 + HIDWORD(v138);
      v32 = __CFADD__(v139, v127);
      v140 = v139 + v127;
      v142 = v32;
      v32 = __CFADD__(v32, v133);
      v141 = v142 + v133;
      v143 = v32;
      v32 = __CFADD__(v126, v141);
      v144 = v126 + v141;
      v145 = v52 * (unint64_t)v39;
      v146 = v136 + HIDWORD(v145);
      v147 = v145 | ((unint64_t)v146 << 32);
      if (v32)
        v148 = 1;
      else
        v148 = v143;
      v32 = __CFADD__(v147, v148);
      v149 = v147 + v148;
      LODWORD(v150) = v32;
      v32 = __CFADD__(v132, v149);
      v151 = v132 + v149;
      if (v32)
        v150 = 1;
      else
        v150 = v150;
      v152 = v263 + HIDWORD(v262) + v257;
      v153 = __CFADD__(v71, v261) + v254;
      v154 = v105 | ((unint64_t)v106 << 32);
      LODWORD(v155) = __CFADD__(__CFADD__(v71, v261), v254);
      v32 = __CFADD__(v260, v153);
      v156 = v260 + v153;
      if (v32)
        v155 = 1;
      else
        v155 = v155;
      v32 = __CFADD__(v256, v155);
      v157 = v256 + v155;
      LODWORD(v158) = v32;
      v32 = __CFADD__(v157, v259);
      v159 = v157 + v259;
      if (v32)
        v158 = 1;
      else
        v158 = v158;
      v32 = __CFADD__(v255, v158);
      v160 = v255 + v158;
      v161 = v32;
      v32 = __CFADD__(v152, v160);
      v162 = v152 + v160;
      if (v32)
        v163 = 1;
      else
        v163 = v161;
      v32 = __CFADD__(v154, v156);
      v164 = v137 | ((unint64_t)v138 << 32);
      v165 = v258 + HIDWORD(v83) + v104 + v163;
      a1 = v267;
      v166 = v32 + v108;
      LODWORD(v167) = __CFADD__(v32, v108);
      v32 = __CFADD__(v159, v166);
      v168 = v159 + v166;
      a2 = v268;
      if (v32)
        v167 = 1;
      else
        v167 = v167;
      v32 = __CFADD__(v111, v167);
      v169 = v111 + v167;
      v170 = v32;
      v32 = __CFADD__(v169, v162);
      v171 = v169 + v162;
      if (v32)
        v172 = 1;
      else
        v172 = v170;
      v32 = __CFADD__(v118, v172);
      v173 = v118 + v172;
      LODWORD(v174) = v32;
      v32 = __CFADD__(v165, v173);
      v175 = v165 + v173;
      if (v32)
        v174 = 1;
      else
        v174 = v174;
      v176 = v135 + HIDWORD(v146) + v150;
      v177 = v102 + HIDWORD(v113) + v117 + v174;
      v178 = __CFADD__(v164, v168) + v140;
      LODWORD(v179) = __CFADD__(__CFADD__(v164, v168), v140);
      v32 = __CFADD__(v171, v178);
      v180 = v171 + v178;
      if (v32)
        v179 = 1;
      else
        v179 = v179;
      v32 = __CFADD__(v144, v179);
      v181 = v144 + v179;
      v15 = v266;
      v182 = v32;
      v38 = v181 + v175;
      if (__CFADD__(v181, v175))
        v183 = 1;
      else
        v183 = v182;
      v32 = __CFADD__(v151, v183);
      v184 = v151 + v183;
      v185 = v32;
      v40 = v177 + v184;
      if (__CFADD__(v177, v184))
        v186 = 1;
      else
        v186 = v185;
      v39 = v176 + v186;
      LOBYTE(v41) = v265 + bid_outertable_exp[4 * v264];
      v37 = v180 + 1;
    }
    v187 = HIDWORD(v40);
    v188 = HIDWORD(v39);
    v189 = v40;
    v190 = HIDWORD(v15);
    v191 = v37 * (unint64_t)HIDWORD(v15);
    v192 = HIDWORD(v191);
    v193 = v15 & 0xFFFFF800;
    v194 = HIDWORD(v37) * (unint64_t)v193 + v191;
    v195 = v39;
    v196 = v37 * (unint64_t)v193;
    v197 = v194 + HIDWORD(v196);
    v198 = v192 + HIDWORD(v37) * (unint64_t)v190 + HIDWORD(v197);
    v199 = v38 * (unint64_t)v190;
    v200 = v38 * (unint64_t)v193;
    v201 = HIDWORD(v199);
    v202 = HIDWORD(v38) * (unint64_t)v193 + v199 + HIDWORD(v200);
    v203 = v201 + HIDWORD(v38) * (unint64_t)v190 + HIDWORD(v202);
    v204 = v200 & 0xFFFFF800 | (v202 << 32);
    v205 = v189 * (unint64_t)v190;
    v206 = v189 * (unint64_t)v193;
    v207 = v187 * (unint64_t)v193;
    v208 = HIDWORD(v205) + v187 * (unint64_t)v190;
    v209 = v207 + v205 + HIDWORD(v206);
    v210 = v208 + HIDWORD(v209);
    v211 = v195 * (unint64_t)v190;
    v212 = v206 & 0xFFFFF800 | (v209 << 32);
    v213 = v195 * (unint64_t)v193;
    v214 = HIDWORD(v211) + v188 * (unint64_t)v190;
    v215 = v188 * (unint64_t)v193 + v211;
    v32 = __CFADD__(v198, v204);
    v216 = v198 + v204;
    v217 = v215 + HIDWORD(v213);
    v218 = v213 & 0xFFFFF800 | (v217 << 32);
    v220 = v32;
    v32 = __CFADD__(v32, v203);
    v219 = v220 + v203;
    v32 |= __CFADD__(v212, v219);
    v219 += v212;
    v222 = v32 + v210;
    v32 = __CFADD__(v32, v210) | __CFADD__(v218, v222);
    v221 = v218 + v222;
    v223 = HIDWORD(v217) + v32 + v214;
    v224 = v41 + v14;
    v225 = 75 - v224;
    v226 = v224 - 11;
    v227 = (v219 << (v224 - 11)) + (v216 >> (75 - v224));
    v228 = (v221 << v226) + (v219 >> v225);
    v8 = (v223 << v226) + (v221 >> v225);
    v229 = v223 >> v225;
    if (v223 >> v225 < 0x314DC6448D93 || v223 >> v225 == 0x314DC6448D93 && v8 < 0x38C15B0A00000000)
    {
      v230 = v196 & 0xFFFFF800 | (v197 << 32);
      v231 = v230 << v226;
      v232 = (v216 << v226) + (v230 >> v225);
      v32 = __CFADD__(v231, v231 >> 2);
      v233 = v231 + (v231 >> 2);
      v234 = 8;
      if (v32)
        v235 = 8;
      else
        v235 = 0;
      v236 = v235 & 0xFFFFFFFFFFFFFFF8 | (v233 >> 61);
      v237 = v232 + (v232 >> 2);
      if (__CFADD__(v232, v232 >> 2))
        v238 = 8;
      else
        v238 = 0;
      v239 = v238 & 0xFFFFFFFFFFFFFFF8 | (v237 >> 61);
      v240 = (2 * (v232 & 3)) | (8 * v237);
      v241 = v227 + (v227 >> 2);
      if (__CFADD__(v227, v227 >> 2))
        v242 = 8;
      else
        v242 = 0;
      v243 = v228 + (v228 >> 2);
      if (__CFADD__(v228, v228 >> 2))
        v244 = 8;
      else
        v244 = 0;
      v245 = v8 + (v8 >> 2);
      if (!__CFADD__(v8, v8 >> 2))
        v234 = 0;
      v32 = __CFADD__(v240, v236);
      v246 = v242 & 0xFFFFFFFFFFFFFFF8 | (v241 >> 61);
      v247 = (2 * (v227 & 3)) | (8 * v241);
      v248 = v32;
      v32 = __CFADD__(v32, v247) | __CFADD__(v239, v32 + v247);
      v227 = v239 + v248 + v247;
      v249 = v244 & 0xFFFFFFFFFFFFFFF8 | (v243 >> 61);
      v250 = (2 * (v228 & 3)) | (8 * v243);
      v251 = v32;
      v32 = __CFADD__(v32, v250) | __CFADD__(v246, v32 + v250);
      v228 = v246 + v251 + v250;
      v252 = (2 * (v8 & 3)) | (8 * v245);
      v8 = v249 + v32 + v252;
      v229 = v234
           + (__CFADD__(v32, v252) | __CFADD__(v249, v32 + v252))
           + ((2 * (v229 & 3)) | (8 * (v229 + (v229 >> 2))))
           + (v245 >> 61);
    }
    if (bid_roundbound_128[(*(_QWORD *)&a3 >> 62) & 2 | (4 * a1) | v8 & 1] < __PAIR128__(v228, v227))
    {
      v32 = __CFADD__(v8++, 1);
      if (v32)
      {
        v8 = 0;
      }
      else if (v229 == 0x1ED09BEAD87C0 && v8 == 0x378D8E6400000000)
      {
        v8 = 0x38C15B0A00000000;
      }
    }
    if (v228 | v227)
      *a2 |= 0x20u;
    return v8;
  }
  if (v14 <= 11)
    return v15 >> (11 - v14);
  v8 = v15 << (v14 - 11);
  v31 = v15 >> (75 - v14);
  if (v31 >= 0x1ED09BEAD87C0)
  {
    v32 = v31 != 0x1ED09BEAD87C0 || v8 >= 0x378D8E6400000000;
    if (v32)
      goto LABEL_30;
  }
  return v8;
}

unint64_t __binary128_to_bid128(unint64_t a1, unint64_t a2, int a3, _DWORD *a4)
{
  _DWORD *v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t result;
  int8x16_t v11;
  int8x16_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unint64_t v27;
  __int128 v28;
  unint64_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int v32;
  char v33;
  unint64_t v34;
  __int128 v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _BOOL4 v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unsigned int v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  _BOOL4 v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unsigned __int128 v121;
  _BOOL4 v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  _BOOL8 v154;
  unsigned int v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unsigned int v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unsigned int v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  unint64_t v190;
  _BOOL4 v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unsigned int v195;
  uint64_t v196;
  unint64_t v197;
  unsigned int v198;
  uint64_t v199;
  unint64_t v200;
  unsigned int v201;
  unint64_t v202;
  unint64_t v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unint64_t v209;
  unint64_t v210;
  unint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  unint64_t v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  unint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  _BOOL8 v251;
  unsigned int v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  uint64_t v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unsigned int v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  unint64_t v267;
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  _BOOL4 v271;
  unint64_t v272;
  uint64_t v273;
  unint64_t v274;
  unsigned int v275;
  unint64_t v276;
  uint64_t v277;
  unint64_t v278;
  unsigned int v279;
  unint64_t v280;
  uint64_t v281;
  char v282;
  char v283;
  unint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  uint64_t v291;
  uint64_t v292;
  unint64_t v293;
  unint64_t v294;
  uint64_t v295;
  unint64_t v296;
  uint64_t v297;
  unint64_t v298;
  uint64_t v299;
  unint64_t v300;
  uint64_t v301;
  unint64_t v302;
  unint64_t v303;
  uint64_t v304;
  uint64_t v305;
  unint64_t v306;
  uint64_t v307;
  uint64_t v308;
  _BOOL8 v309;
  uint64_t v310;
  unsigned int v311;
  unint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  uint64_t v316;
  unint64_t v317;
  unint64_t v318;
  unint64_t v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  int v323;
  int v324;
  unint64_t v325;
  _DWORD *v326;
  char v327;

  v4 = a4;
  v6 = HIWORD(a2) & 0x7FFF;
  v7 = a2 & 0xFFFFFFFFFFFFLL;
  if ((_DWORD)v6)
  {
    if ((~a2 & 0x7FFF000000000000) == 0)
    {
      if (!(v7 | a1))
        return 0;
      if ((a2 & 0x800000000000) == 0)
        *a4 |= 1u;
      *((_QWORD *)&v9 + 1) = a2;
      *(_QWORD *)&v9 = a1;
      v8 = v9 >> 47;
      if (v8 > 0xC5371912364FFFFFLL
        || v8 >> 18 == 0x314DC6448D93
        && ((a1 >> 1) & 0x3FFE00000000 | ((unint64_t)v8 << 46)) > 0x38C15B09FFFFFFFFLL)
      {
        return 0;
      }
      else
      {
        return (v8 << 46) | (a1 >> 1) & 0x3FFFFFFFFFFFLL;
      }
    }
    v14 = v7 | 0x1000000000000;
    v15 = a1 & -(uint64_t)a1;
    v16 = (16 * ((v15 & 0xFFFF0000FFFFLL) == 0)) | (32 * ((_DWORD)v15 == 0)) | (8 * ((v15 & 0xFF00FF00FF00FFLL) == 0)) | (4 * ((v15 & 0xF0F0F0F0F0F0F0FLL) == 0)) | (2 * ((v15 & 0x3333333333333333) == 0)) | ((v15 & 0x5555555555555555) == 0);
    v17 = v14 & -v14;
    v18 = v17 == 0;
    v19 = (v17 & 0x100FF00FF00FFLL) == 0;
    v20 = (v17 & 0x10F0F0F0F0F0FLL) == 0;
    v21 = (v17 & 0x1333333333333) == 0;
    v22 = (v17 & 0x1555555555555) == 0;
    if ((v17 & 0xFFFF0000FFFFLL) != 0)
      v23 = 64;
    else
      v23 = 80;
    v24 = v23 | (32 * v18) | (8 * v19) | (4 * v20) | (2 * v21) | v22;
    if (a1)
      v25 = v16;
    else
      v25 = v24;
    v26 = v6 - 16495;
    *((_QWORD *)&v28 + 1) = v14;
    *(_QWORD *)&v28 = a1;
    v27 = v28 >> 49;
    v29 = a1 << 15;
    if (v6 >> 4 > 0x406)
      goto LABEL_53;
  }
  else
  {
    if (!(v7 | a1))
      return 0;
    if (v7)
    {
      v11 = (int8x16_t)vdupq_n_s64(a2);
      v12 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v11, (int8x16_t)xmmword_1B8917DE0), (uint64x2_t)vandq_s8(v11, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v11, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v11, (int8x16_t)xmmword_1B8917DF0))));
      *(int8x8_t *)v12.i8 = vorr_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL));
      v13 = v12.i32[0] | v12.i32[1] | (2 * ((a2 & 0xCCCCCCCCCCCCLL) <= (a2 & 0x333333333333))) | ((a2 & 0xAAAAAAAAAAAALL) <= (a2 & 0x555555555555));
    }
    else
    {
      if (a1)
      {
        v30 = (int8x16_t)vdupq_n_s64(a1);
        v31 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v30, (int8x16_t)xmmword_1B8917CC0), (uint64x2_t)vandq_s8(v30, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v30, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v30, (int8x16_t)xmmword_1B8917CF0))));
        *(int8x8_t *)v31.i8 = vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
        v32 = v31.i32[0] | v31.i32[1] | (2 * ((a1 & 0xCCCCCCCCCCCCCCCCLL) <= (a1 & 0x3333333333333333))) | ((a1 & 0xAAAAAAAAAAAAAAAALL) <= (a1 & 0x5555555555555555));
      }
      else
      {
        v32 = 64;
      }
      v13 = v32 + 64;
    }
    v33 = v13 - 15;
    if (v13 != 15)
    {
      v7 = (v7 << v33) + (a1 >> (79 - v13));
      v34 = a1 << v33;
      if (v13 < 0x4F)
      {
        a1 = v34;
      }
      else
      {
        v7 = a1 << (v13 - 79);
        a1 = 0;
      }
    }
    v25 = 0;
    v26 = -16479 - v13;
    *a4 |= 2u;
    *((_QWORD *)&v35 + 1) = v7;
    *(_QWORD *)&v35 = a1;
    v27 = v35 >> 49;
    v29 = a1 << 15;
  }
  v36 = v25 + v26;
  if (((v25 + v26) & 0x80000000) != 0)
  {
    if (v36 >= 0xFFFFFFD0)
    {
      v37 = -v36;
      v38 = (unint64_t *)((char *)&bid_coefflimits_bid128 + 16 * v37);
      v39 = v38[1];
      v40 = (v27 << (49 - v25)) + (v29 >> (v25 + 15));
      v41 = v27 >> (v25 - 49);
      v42 = v25 >= 0x31;
      v43 = v25 >= 0x31 ? 0 : v27 >> (v25 + 15);
      v44 = v42 ? v41 : v40;
      if (v43 < v39)
        return (bid_power_five[2 * v37] * v44) | ((unint64_t)(HIDWORD(bid_power_five[2 * v37]) * v44 + bid_power_five[2 * v37] * HIDWORD(v44) + ((bid_power_five[2 * v37] * (unint64_t)v44) >> 32)) << 32);
      v45 = *v38;
      if (v43 == v39 && v44 <= v45)
        return (bid_power_five[2 * v37] * v44) | ((unint64_t)(HIDWORD(bid_power_five[2 * v37]) * v44 + bid_power_five[2 * v37] * HIDWORD(v44) + ((bid_power_five[2 * v37] * (unint64_t)v44) >> 32)) << 32);
    }
    goto LABEL_53;
  }
  if (v26 <= -49)
    return v27 >> (-49 - v26);
  result = (v27 << (v26 + 49)) + (v29 >> (15 - v26));
  v47 = v27 >> (15 - v26);
  if (v47 >= 0x1ED09BEAD87C0 && (v47 != 0x1ED09BEAD87C0 || result >= 0x378D8E6400000000))
  {
LABEL_53:
    v48 = 17744 - ((19728 * (v26 + 42152) + ((19779 * (v26 + 42152)) >> 16)) >> 16);
    v49 = v48 & 0x7F;
    v50 = v48 >> 7;
    v51 = (uint64_t *)((char *)&bid_innertable_sig + 32 * v49);
    v53 = *v51;
    v52 = v51[1];
    v55 = v51[2];
    v54 = v51[3];
    v56 = bid_innertable_exp[v49];
    v327 = v26;
    if ((_DWORD)v50 != 39)
    {
      v324 = bid_innertable_exp[v49];
      v57 = (uint64_t *)((char *)&bid_outertable_sig + 32 * v50);
      v59 = *v57;
      v58 = v57[1];
      v323 = v50;
      v60 = HIDWORD(*v57);
      v311 = *v57;
      v61 = ((v59 * (unint64_t)HIDWORD(v53)) >> 32)
          + HIDWORD(v59) * (unint64_t)HIDWORD(v53)
          + ((HIDWORD(v59) * (unint64_t)v53
            + (v59 * HIDWORD(v53))
            + ((v59 * (unint64_t)v53) >> 32)) >> 32);
      v62 = HIDWORD(v58);
      v63 = v58 * (unint64_t)HIDWORD(v53);
      v64 = HIDWORD(v58) * (unint64_t)v53
          + v63
          + ((v58 * (unint64_t)v53) >> 32);
      v65 = HIDWORD(v63) + HIDWORD(v58) * (unint64_t)HIDWORD(v53) + HIDWORD(v64);
      v67 = v57[2];
      v66 = v57[3];
      v68 = HIDWORD(v67);
      v69 = v67 * (unint64_t)HIDWORD(v53);
      v326 = v4;
      v70 = HIDWORD(v67) * (unint64_t)v53
          + v69
          + ((v67 * (unint64_t)v53) >> 32);
      v71 = HIDWORD(v69) + HIDWORD(v67) * (unint64_t)HIDWORD(v53) + HIDWORD(v70);
      v325 = v29;
      v72 = v66 * (unint64_t)HIDWORD(v53);
      v73 = (v58 * v53) | ((unint64_t)v64 << 32);
      v74 = (v67 * v53) | ((unint64_t)v70 << 32);
      v321 = HIDWORD(v66) * (unint64_t)v53
           + v72
           + ((v66 * (unint64_t)v53) >> 32);
      v322 = HIDWORD(v72) + HIDWORD(v66) * (unint64_t)HIDWORD(v53);
      v75 = (v66 * v53) | (v321 << 32);
      v320 = v61 + v73;
      v76 = __CFADD__(v61, v73) + v74;
      v77 = __CFADD__(__CFADD__(v61, v73), v74);
      v78 = v65 + v76;
      v79 = __CFADD__(v65, v76) || v77;
      v42 = __CFADD__(v75, v79);
      v80 = v75 + v79;
      v81 = v42;
      v318 = v71 + v80;
      v319 = v78;
      v82 = v311 * (unint64_t)HIDWORD(v52);
      v83 = HIDWORD(v82) + v60 * (unint64_t)HIDWORD(v52);
      v84 = v60 * (unint64_t)v52
          + v82
          + ((v59 * (unint64_t)v52) >> 32);
      v85 = v83 + HIDWORD(v84);
      v86 = (v59 * v52) | ((unint64_t)v84 << 32);
      v87 = v58 * (unint64_t)HIDWORD(v52);
      v88 = HIDWORD(v87) + HIDWORD(v58) * (unint64_t)HIDWORD(v52);
      v89 = HIDWORD(v58) * (unint64_t)v52
          + v87
          + ((v58 * (unint64_t)v52) >> 32);
      v90 = v88 + HIDWORD(v89);
      v91 = (v58 * v52) | ((unint64_t)v89 << 32);
      v92 = v67 * (unint64_t)HIDWORD(v52);
      v93 = HIDWORD(v67) * (unint64_t)v52
          + v92
          + ((v67 * (unint64_t)v52) >> 32);
      v94 = HIDWORD(v92) + HIDWORD(v67) * (unint64_t)HIDWORD(v52) + HIDWORD(v93);
      v95 = (v67 * v52) | ((unint64_t)v93 << 32);
      v96 = v66 * (unint64_t)HIDWORD(v52);
      v317 = HIDWORD(v96) + HIDWORD(v66) * (unint64_t)HIDWORD(v52);
      if (__CFADD__(v71, v80))
        v97 = 1;
      else
        v97 = v81;
      v98 = HIDWORD(v66) * (unint64_t)v52
          + v96
          + ((v66 * (unint64_t)v52) >> 32);
      v99 = (v66 * v52) | ((unint64_t)v98 << 32);
      v313 = v85 + v91;
      v100 = __CFADD__(v85, v91) + v95;
      v101 = __CFADD__(__CFADD__(v85, v91), v95);
      v315 = v90 + v100;
      v316 = v97;
      v102 = __CFADD__(v90, v100) || v101;
      v42 = __CFADD__(v99, v102);
      v103 = v99 + v102;
      LODWORD(v104) = v42;
      v42 = __CFADD__(v94, v103);
      v314 = v94 + v103;
      v105 = v58 * (unint64_t)HIDWORD(v55);
      v106 = HIDWORD(v58) * (unint64_t)v55
           + v105
           + ((v58 * (unint64_t)v55) >> 32);
      v107 = HIDWORD(v105) + HIDWORD(v58) * (unint64_t)HIDWORD(v55) + HIDWORD(v106);
      v108 = (v58 * v55) | ((unint64_t)v106 << 32);
      v109 = v67 * (unint64_t)HIDWORD(v55);
      v110 = HIDWORD(v67) * (unint64_t)v55
           + v109
           + ((v67 * (unint64_t)v55) >> 32);
      v111 = HIDWORD(v109) + HIDWORD(v67) * (unint64_t)HIDWORD(v55) + HIDWORD(v110);
      v112 = (v67 * v55) | ((unint64_t)v110 << 32);
      v113 = v311 * (unint64_t)HIDWORD(v55);
      v114 = v60 * (unint64_t)v55 + v113;
      v115 = HIDWORD(v113) + v60 * (unint64_t)HIDWORD(v55);
      v116 = v66 * (unint64_t)HIDWORD(v55);
      v312 = HIDWORD(v116) + HIDWORD(v66) * (unint64_t)HIDWORD(v55);
      v117 = HIDWORD(v66) * (unint64_t)v55 + v116;
      if (v42)
        v104 = 1;
      else
        v104 = v104;
      v118 = v59 * (unint64_t)v55;
      v119 = v114 + HIDWORD(v118);
      v120 = v115 + HIDWORD(v119);
      v121 = __PAIR128__(v112, v120) + v108;
      v122 = __CFADD__(__CFADD__(v120, v108), v112);
      v123 = v107 + *((_QWORD *)&v121 + 1);
      v124 = v66 * (unint64_t)v55;
      v125 = v117 + HIDWORD(v124);
      v126 = v124 | ((unint64_t)v125 << 32);
      v127 = __CFADD__(v107, *((_QWORD *)&v121 + 1)) || v122;
      v42 = __CFADD__(v126, v127);
      v128 = v126 + v127;
      LODWORD(v129) = v42;
      v42 = __CFADD__(v111, v128);
      v130 = v111 + v128;
      v131 = v311 * (unint64_t)HIDWORD(v54);
      v132 = HIDWORD(v131) + v60 * (unint64_t)HIDWORD(v54);
      v133 = v60 * (unint64_t)v54 + v131;
      v134 = v58 * (unint64_t)HIDWORD(v54);
      v135 = HIDWORD(v134) + HIDWORD(v58) * (unint64_t)HIDWORD(v54);
      v136 = v58 * (unint64_t)v54;
      v137 = v62 * (unint64_t)v54 + v134 + HIDWORD(v136);
      v138 = v135 + HIDWORD(v137);
      v139 = v136 | ((unint64_t)v137 << 32);
      v140 = v67 * (unint64_t)HIDWORD(v54);
      v141 = HIDWORD(v140) + HIDWORD(v67) * (unint64_t)HIDWORD(v54);
      v142 = v67 * (unint64_t)v54;
      v143 = v68 * (unint64_t)v54 + v140 + HIDWORD(v142);
      v144 = v141 + HIDWORD(v143);
      v145 = v142 | ((unint64_t)v143 << 32);
      v146 = v66 * (unint64_t)HIDWORD(v54);
      v147 = HIDWORD(v146) + HIDWORD(v66) * (unint64_t)HIDWORD(v54);
      v4 = v326;
      v148 = HIDWORD(v66) * (unint64_t)v54 + v146;
      if (v42)
        v129 = 1;
      else
        v129 = v129;
      v149 = v59 * (unint64_t)v54;
      v150 = v133 + HIDWORD(v149);
      v151 = v132 + HIDWORD(v150);
      v42 = __CFADD__(v151, v139);
      v152 = v151 + v139;
      v154 = v42;
      v42 = __CFADD__(v42, v145);
      v153 = v154 + v145;
      v155 = v42;
      v42 = __CFADD__(v138, v153);
      v156 = v138 + v153;
      v157 = v66 * (unint64_t)v54;
      v158 = v148 + HIDWORD(v157);
      v159 = v157 | ((unint64_t)v158 << 32);
      if (v42)
        v160 = 1;
      else
        v160 = v155;
      v42 = __CFADD__(v159, v160);
      v161 = v159 + v160;
      LODWORD(v162) = v42;
      v42 = __CFADD__(v144, v161);
      v163 = v144 + v161;
      if (v42)
        v162 = 1;
      else
        v162 = v162;
      v164 = v322 + HIDWORD(v321) + v316;
      v165 = __CFADD__(v86, v320) + v313;
      v166 = v118 | ((unint64_t)v119 << 32);
      LODWORD(v167) = __CFADD__(__CFADD__(v86, v320), v313);
      v42 = __CFADD__(v319, v165);
      v168 = v319 + v165;
      if (v42)
        v167 = 1;
      else
        v167 = v167;
      v42 = __CFADD__(v315, v167);
      v169 = v315 + v167;
      LODWORD(v170) = v42;
      v42 = __CFADD__(v169, v318);
      v171 = v169 + v318;
      if (v42)
        v170 = 1;
      else
        v170 = v170;
      v42 = __CFADD__(v314, v170);
      v172 = v314 + v170;
      v173 = v42;
      v42 = __CFADD__(v164, v172);
      v174 = v164 + v172;
      if (v42)
        v175 = 1;
      else
        v175 = v173;
      v176 = v149 | ((unint64_t)v150 << 32);
      v177 = v317 + HIDWORD(v98) + v104 + v175;
      v42 = __CFADD__(__CFADD__(v166, v168), (_QWORD)v121);
      v178 = __CFADD__(v166, v168) + (_QWORD)v121;
      LODWORD(v179) = v42;
      v42 = __CFADD__(v171, v178);
      v180 = v171 + v178;
      if (v42)
        v179 = 1;
      else
        v179 = v179;
      v42 = __CFADD__(v123, v179);
      v181 = v123 + v179;
      v182 = v42;
      v42 = __CFADD__(v181, v174);
      v183 = v181 + v174;
      if (v42)
        v184 = 1;
      else
        v184 = v182;
      v42 = __CFADD__(v130, v184);
      v185 = v130 + v184;
      LODWORD(v186) = v42;
      v42 = __CFADD__(v177, v185);
      v187 = v177 + v185;
      if (v42)
        v186 = 1;
      else
        v186 = v186;
      v188 = v147 + HIDWORD(v158) + v162;
      v189 = v312 + HIDWORD(v125) + v129 + v186;
      v190 = __CFADD__(v176, v180) + v152;
      v191 = __CFADD__(__CFADD__(v176, v180), v152);
      v42 = __CFADD__(v183, v190);
      v192 = v183 + v190;
      v193 = v42 || v191;
      v42 = __CFADD__(v156, v193);
      v194 = v156 + v193;
      v195 = v42;
      v52 = v194 + v187;
      if (__CFADD__(v194, v187))
        v196 = 1;
      else
        v196 = v195;
      v42 = __CFADD__(v163, v196);
      v197 = v163 + v196;
      v198 = v42;
      v42 = __CFADD__(v189, v197);
      v55 = v189 + v197;
      v29 = v325;
      if (v42)
        v199 = 1;
      else
        v199 = v198;
      v54 = v188 + v199;
      LOBYTE(v56) = v324 + bid_outertable_exp[4 * v323];
      v53 = v192 + 1;
    }
    v200 = HIDWORD(v29);
    v201 = v29 & 0xFFFF8000;
    v202 = v53 * (unint64_t)HIDWORD(v29);
    v203 = v53 * (unint64_t)v201;
    v204 = HIDWORD(v53) * (unint64_t)v201 + v202 + HIDWORD(v203);
    v205 = HIDWORD(v202) + HIDWORD(v53) * (unint64_t)v200 + HIDWORD(v204);
    v206 = HIDWORD(v52);
    v207 = v52 * (unint64_t)v200;
    v208 = v52 * (unint64_t)v201;
    v209 = HIDWORD(v52) * (unint64_t)v201 + v207 + HIDWORD(v208);
    v210 = HIDWORD(v207) + HIDWORD(v52) * (unint64_t)v200 + HIDWORD(v209);
    v211 = v208 & 0xFFFF8000 | (v209 << 32);
    v212 = HIDWORD(v55);
    v213 = v55 * (unint64_t)v200;
    v214 = v55 * (unint64_t)v201;
    v215 = HIDWORD(v213) + HIDWORD(v55) * (unint64_t)v200;
    v216 = HIDWORD(v55) * (unint64_t)v201 + v213 + HIDWORD(v214);
    v217 = v215 + HIDWORD(v216);
    v218 = v214 & 0xFFFF8000 | (v216 << 32);
    v219 = HIDWORD(v54);
    v220 = v54 * (unint64_t)v200;
    v221 = v54 * (unint64_t)v201;
    v222 = HIDWORD(v220) + HIDWORD(v54) * (unint64_t)v200;
    v223 = HIDWORD(v54) * (unint64_t)v201 + v220 + HIDWORD(v221);
    v224 = HIDWORD(v223);
    v225 = v221 & 0xFFFF8000 | (v223 << 32);
    v226 = v205 + v211;
    v42 = __CFADD__(__CFADD__(v205, v211), v210);
    v227 = __CFADD__(v205, v211) + v210;
    v42 |= __CFADD__(v218, v227);
    v227 += v218;
    v228 = v225 + v42 + v217;
    v229 = v224 + (__CFADD__(v42, v217) | __CFADD__(v225, v42 + v217)) + v222;
    v230 = v53 * (unint64_t)HIDWORD(v27);
    v231 = v53 * (unint64_t)v27;
    v232 = HIDWORD(v230) + HIDWORD(v53) * (unint64_t)HIDWORD(v27);
    v233 = HIDWORD(v53) * (unint64_t)v27 + v230;
    v234 = v52 * (unint64_t)HIDWORD(v27);
    v235 = v52 * (unint64_t)v27;
    v236 = v206 * (unint64_t)v27;
    v237 = HIDWORD(v234) + v206 * (unint64_t)HIDWORD(v27);
    v238 = v236 + v234 + HIDWORD(v235);
    v239 = v235 | ((unint64_t)v238 << 32);
    v240 = v233 + HIDWORD(v231);
    v241 = v55 * (unint64_t)HIDWORD(v27);
    v242 = v232 + HIDWORD(v240);
    v42 = __CFADD__(v242, v239);
    v243 = v242 + v239;
    v244 = v55 * (unint64_t)v27;
    v245 = HIDWORD(v241);
    v246 = v212 * (unint64_t)v27 + v241;
    v247 = v245 + v212 * (unint64_t)HIDWORD(v27);
    v248 = v246 + HIDWORD(v244);
    v249 = v244 | ((unint64_t)v248 << 32);
    v251 = v42;
    v42 = __CFADD__(v42, v249);
    v250 = v251 + v249;
    v252 = v42;
    v253 = v54 * (unint64_t)HIDWORD(v27);
    v254 = v237 + HIDWORD(v238);
    v42 = __CFADD__(v254, v250);
    v255 = v254 + v250;
    if (v42)
      v256 = 1;
    else
      v256 = v252;
    v257 = v54 * (unint64_t)v27;
    v258 = v219 * (unint64_t)v27;
    v259 = HIDWORD(v253) + v219 * (unint64_t)HIDWORD(v27);
    v260 = v258 + v253 + HIDWORD(v257);
    v261 = v257 | ((unint64_t)v260 << 32);
    v42 = __CFADD__(v261, v256);
    v262 = v261 + v256;
    v263 = v42;
    v264 = v247 + HIDWORD(v248);
    v42 = __CFADD__(v264, v262);
    v265 = v264 + v262;
    if (v42)
      v266 = 1;
    else
      v266 = v263;
    v267 = v259 + HIDWORD(v260) + v266;
    v268 = v231 | ((unint64_t)v240 << 32);
    v269 = v226 + v268;
    v270 = __CFADD__(v226, v268) + v243;
    v271 = __CFADD__(__CFADD__(v226, v268), v243);
    v272 = v270 + v227;
    v273 = __CFADD__(v270, v227) || v271;
    v42 = __CFADD__(v255, v273);
    v274 = v255 + v273;
    v275 = v42;
    v42 = __CFADD__(v274, v228);
    v276 = v274 + v228;
    if (v42)
      v277 = 1;
    else
      v277 = v275;
    v42 = __CFADD__(v265, v277);
    v278 = v265 + v277;
    v279 = v42;
    v280 = v229 + v278;
    if (__CFADD__(v229, v278))
      v281 = 1;
    else
      v281 = v279;
    v282 = v56 + v327 + 49;
    v283 = 15 - (v56 + v327);
    v284 = v267 + v281;
    v285 = (v276 << v282) + (v272 >> v283);
    v286 = (v280 << v282) + (v276 >> v283);
    result = (v284 << v282) + (v280 >> v283);
    v287 = v284 >> v283;
    if (v284 >> v283 < 0x314DC6448D93 || v287 == 0x314DC6448D93 && result < 0x38C15B0A00000000)
    {
      v288 = (v269 << v282) + ((v203 & 0xFFFF8000 | (v204 << 32)) >> v283);
      v289 = (v272 << v282) + (v269 >> v283);
      v42 = __CFADD__(v288, v288 >> 2);
      v290 = v288 + (v288 >> 2);
      v291 = 8;
      if (v42)
        v292 = 8;
      else
        v292 = 0;
      v293 = v292 & 0xFFFFFFFFFFFFFFF8 | (v290 >> 61);
      v294 = v289 + (v289 >> 2);
      if (__CFADD__(v289, v289 >> 2))
        v295 = 8;
      else
        v295 = 0;
      v296 = v295 & 0xFFFFFFFFFFFFFFF8 | (v294 >> 61);
      v297 = (2 * (v289 & 3)) | (8 * v294);
      v298 = v285 + (v285 >> 2);
      if (__CFADD__(v285, v285 >> 2))
        v299 = 8;
      else
        v299 = 0;
      v300 = v286 + (v286 >> 2);
      if (__CFADD__(v286, v286 >> 2))
        v301 = 8;
      else
        v301 = 0;
      v302 = result + (result >> 2);
      if (!__CFADD__(result, result >> 2))
        v291 = 0;
      v303 = v299 & 0xFFFFFFFFFFFFFFF8 | (v298 >> 61);
      v304 = (2 * (v285 & 3)) | (8 * v298);
      v42 = __CFADD__(__CFADD__(v297, v293), v304);
      v305 = __CFADD__(v297, v293) + v304;
      v42 |= __CFADD__(v296, v305);
      v285 = v296 + v305;
      v306 = v301 & 0xFFFFFFFFFFFFFFF8 | (v300 >> 61);
      v307 = (2 * (v286 & 3)) | (8 * v300);
      v309 = v42;
      v42 = __CFADD__(v42, v307);
      v308 = v309 + v307;
      v42 |= __CFADD__(v303, v308);
      v286 = v303 + v308;
      v310 = (2 * (result & 3)) | (8 * v302);
      result = v306 + v42 + v310;
      v287 = v291
           + (__CFADD__(v42, v310) | __CFADD__(v306, v42 + v310))
           + ((2 * (v287 & 3)) | (8 * (v287 + (v287 >> 2))))
           + (v302 >> 61);
    }
    if (bid_roundbound_128[(a2 >> 62) & 2 | (4 * a3) | result & 1] < __PAIR128__(v286, v285))
    {
      v42 = __CFADD__(result++, 1);
      if (v42)
      {
        result = 0;
      }
      else if (v287 == 0x1ED09BEAD87C0 && result == 0x378D8E6400000000)
      {
        result = 0x38C15B0A00000000;
      }
    }
    if (v286 | v285)
      *v4 |= 0x20u;
  }
  return result;
}

unint64_t *bid128_to_binary128_2part(unint64_t *result, unint64_t *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int v10;
  _BOOL4 v11;
  int8x16_t v12;
  int8x8_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  __int128 v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  BOOL v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unsigned __int128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unsigned int v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unsigned int v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unsigned int v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  int v110;
  unsigned int v111;
  BOOL v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  int v120;
  int v121;
  int8x16_t v122;
  int8x16_t v123;
  unsigned int v124;
  int v125;
  char v126;

  v4 = a4 & 0x8000000000000000;
  if ((~a4 & 0x6000000000000000) != 0)
  {
    v5 = a4 & 0x1FFFFFFFFFFFFLL;
    if ((a4 & 0x1FFFFFFFFFFFFLL) > 0x1ED09BEAD87C0)
      goto LABEL_62;
    v6 = (a4 & 0x1FFFFFFFFFFFFLL) == 0x1ED09BEAD87C0 && a3 > 0x378D8E63FFFFFFFFLL;
    if (v6 || !(v5 | a3))
      goto LABEL_62;
    v7 = (a4 >> 49) & 0x3FFF;
    if (v5)
    {
      v8 = (int8x16_t)vdupq_n_s64(a4);
      v9 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D50), (uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D60), (uint64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1B8917D70))));
      v10 = 2 * ((a4 & 0xCCCCCCCCCCCCLL) <= (a4 & 0x1333333333333));
      v11 = (a4 & 0xAAAAAAAAAAAALL) <= (a4 & 0x1555555555555);
    }
    else
    {
      v12 = (int8x16_t)vdupq_n_s64(a3);
      v10 = 2 * ((a3 & 0xCCCCCCCCCCCCCCCCLL) <= (a3 & 0x3333333333333333));
      v11 = (a3 & 0xAAAAAAAAAAAAAAAALL) <= (a3 & 0x5555555555555555);
      v9 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917D80), (uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917D90)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v12, (int8x16_t)xmmword_1B8917CF0))), (int8x16_t)xmmword_1B8917DB0, (int8x16_t)xmmword_1B8917DA0);
    }
    v13 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
    v14 = v13.i32[0] | v10 | v13.i32[1] | v11;
    v15 = v14 - 15;
    if (v14 != 15)
    {
      if (v14 < 0x4F)
      {
        v5 = (v5 << v15) + (a3 >> (79 - v14));
        a3 <<= v15;
      }
      else
      {
        v5 = a3 << (v14 - 79);
        a3 = 0;
      }
    }
    if (v7 >= 0x2B65)
      goto LABEL_61;
    *((_QWORD *)&v17 + 1) = v5;
    *(_QWORD *)&v17 = a3;
    v16 = v17 >> 62;
    v18 = 4 * a3;
    if (v7 >= 0x499)
      v19 = v7 - 6176;
    else
      v19 = -5000;
    v20 = v19;
    v21 = &bid_breakpoints_binary128[2 * v19 + 10000];
    v22 = bid_breakpoints_binary128[2 * v19 + 10001];
    v23 = bid_exponents_binary128[v19 + 5000] - v15;
    if (__PAIR128__(v16, v18) > __PAIR128__(v22, *v21))
    {
      v23 = (v23 + 1);
      v24 = (char *)&unk_1B8A23AA0;
    }
    else
    {
      v24 = (char *)&unk_1B89D60E0;
    }
    v27 = &v24[32 * v20];
    v29 = *(_QWORD *)v27;
    v28 = *((_QWORD *)v27 + 1);
    v30 = HIDWORD(v18);
    v31 = 4 * a3;
    v32 = HIDWORD(*(_QWORD *)v27);
    v33 = *(_QWORD *)v27;
    v34 = ((v33 * (unint64_t)v30) >> 32)
        + v32 * (unint64_t)v30
        + ((v32 * (unint64_t)v31 + v33 * v30 + ((v33 * (unint64_t)v31) >> 32)) >> 32);
    v35 = HIDWORD(v28);
    v36 = v28 * (unint64_t)v30;
    v37 = v28 * (unint64_t)(4 * a3);
    v38 = *((_QWORD *)v27 + 2);
    v39 = *((_QWORD *)v27 + 3);
    v40 = HIDWORD(v36) + HIDWORD(v28) * (unint64_t)v30;
    v41 = HIDWORD(v28) * (unint64_t)v31 + v36 + HIDWORD(v37);
    v42 = v40 + HIDWORD(v41);
    v43 = v37 & 0xFFFFFFFC | (v41 << 32);
    v44 = HIDWORD(v38);
    v45 = v38 * (unint64_t)v30;
    v46 = v38 * (unint64_t)v31;
    v47 = HIDWORD(v45) + HIDWORD(v38) * (unint64_t)v30;
    v48 = HIDWORD(v38) * (unint64_t)v31 + v45 + HIDWORD(v46);
    v49 = v47 + HIDWORD(v48);
    v50 = v46 & 0xFFFFFFFC | (v48 << 32);
    v51 = v39 * (unint64_t)v30;
    v52 = v39 * (unint64_t)v31;
    v53 = HIDWORD(v51) + HIDWORD(v39) * (unint64_t)v30;
    v54 = HIDWORD(v39) * (unint64_t)v31 + v51 + HIDWORD(v52);
    v55 = HIDWORD(v54);
    v56 = v52 & 0xFFFFFFFC | (v54 << 32);
    v57 = __CFADD__(v34, v43);
    v58 = v34 + v43;
    v59 = v50 + v57 + v42;
    v60 = v56 + (__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42)) + v49;
    v61 = v55
        + (__CFADD__(__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42), v49) | __CFADD__(v56, (__CFADD__(v57, v42) | __CFADD__(v50, v57 + v42)) + v49))
        + v53;
    v62 = HIDWORD(v16);
    LODWORD(v49) = v16;
    v63 = v33 * (unint64_t)HIDWORD(v16);
    v64 = v29 * (unint64_t)v16;
    v65 = v32 * (unint64_t)v16;
    v66 = HIDWORD(v63) + v32 * (unint64_t)HIDWORD(v16);
    v67 = v65 + v63 + HIDWORD(v64);
    v68 = v66 + HIDWORD(v67);
    v69 = v28 * (unint64_t)HIDWORD(v16);
    v70 = v28 * (unint64_t)v16;
    v71 = v35 * (unint64_t)v16;
    v72 = HIDWORD(v69) + v35 * (unint64_t)HIDWORD(v16);
    v73 = v71 + v69 + HIDWORD(v70);
    v74 = v72 + HIDWORD(v73);
    v75 = v70 | ((unint64_t)v73 << 32);
    v76 = v38 * (unint64_t)HIDWORD(v16);
    v77 = v38 * (unint64_t)v16;
    v78 = v44 * (unint64_t)v16;
    v79 = HIDWORD(v76) + v44 * (unint64_t)HIDWORD(v16);
    v80 = v78 + v76 + HIDWORD(v77);
    v81 = v77 | ((unint64_t)v80 << 32);
    v82 = v39 * (unint64_t)HIDWORD(v16);
    v83 = v39 * (unint64_t)v16;
    v84 = HIDWORD(v82) + HIDWORD(v39) * (unint64_t)v62;
    v85 = HIDWORD(v39) * (unint64_t)v49 + v82 + HIDWORD(v83);
    v86 = v83 | ((unint64_t)v85 << 32);
    v87 = __PAIR128__(v81, v68) + v75;
    LODWORD(v88) = __CFADD__(__CFADD__(v68, v75), v81);
    v89 = v79 + HIDWORD(v80);
    v90 = v74 + *((_QWORD *)&v87 + 1);
    if (__CFADD__(v74, *((_QWORD *)&v87 + 1)))
      v88 = 1;
    else
      v88 = v88;
    v57 = __CFADD__(v86, v88);
    v91 = v86 + v88;
    v92 = v57;
    v57 = __CFADD__(v89, v91);
    v93 = v89 + v91;
    v94 = v84 + HIDWORD(v85);
    if (v57)
      v95 = 1;
    else
      v95 = v92;
    v96 = v94 + v95;
    v97 = v64 | ((unint64_t)v67 << 32);
    v98 = __CFADD__(v97, v58) + (_QWORD)v87;
    LODWORD(v99) = __CFADD__(__CFADD__(v97, v58), (_QWORD)v87);
    v57 = __CFADD__(v59, v98);
    v100 = v59 + v98;
    if (v57)
      v99 = 1;
    else
      v99 = v99;
    v57 = __CFADD__(v90, v99);
    v101 = v90 + v99;
    v102 = v57;
    v103 = v101 + v60;
    if (__CFADD__(v101, v60))
      v104 = 1;
    else
      v104 = v102;
    v57 = __CFADD__(v93, v104);
    v105 = v93 + v104;
    v106 = v57;
    v57 = __CFADD__(v61, v105);
    v107 = v61 + v105;
    if (v57)
      v108 = 1;
    else
      v108 = v106;
    v109 = v96 + v108;
    if ((int)v23 <= 0)
    {
      v110 = 1 - v23;
      if (v110 >= 115)
        v111 = 115;
      else
        v111 = v110;
      v112 = v111 == 64;
      if (v111 < 0x40)
      {
        v115 = v103;
        v116 = v107;
        v113 = v109;
      }
      else
      {
        v113 = 0;
        v114 = 0;
        LOBYTE(v111) = v111 - 64;
        v100 = v103;
        v115 = v107;
        v116 = v109;
        if (v112)
          goto LABEL_74;
      }
      v100 = (v115 << -(char)v111) + (v100 >> v111);
      v103 = (v116 << -(char)v111) + (v115 >> v111);
      v107 = (v113 << -(char)v111) + (v116 >> v111);
      v23 = 1;
      v109 = v113 >> v111;
    }
    else if (v23 >= 0x7FFF)
    {
      goto LABEL_61;
    }
    v117 = v107;
    v107 = v103;
    v114 = v109 & 0xFFFFFFFFFFFFLL;
    v118 = HIWORD(v109);
    v109 = v117;
    v103 = v100;
    if (v118)
    {
LABEL_75:
      *result = v117;
      result[1] = v114 + v4 + (v23 << 48);
      if (v107)
        v119 = v100;
      else
        v119 = 0;
      if (v107)
        v100 = v107;
      if (v100
        && (v107 ? (v120 = -113) : (v120 = -177),
            v121 = v23 + v120,
            v122 = (int8x16_t)vdupq_n_s64(v100),
            v123 = vbicq_s8((int8x16_t)xmmword_1B8917D00, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v122, (int8x16_t)xmmword_1B8917CC0), (uint64x2_t)vandq_s8(v122, (int8x16_t)xmmword_1B8917CE0)), (int32x4_t)vcgtq_u64((uint64x2_t)vandq_s8(v122, (int8x16_t)xmmword_1B8917CD0), (uint64x2_t)vandq_s8(v122, (int8x16_t)xmmword_1B8917CF0)))), *(int8x8_t *)v123.i8 = vorr_s8(*(int8x8_t *)v123.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v123, v123, 8uLL)), v124 = v123.i32[0] | v123.i32[1] | (2 * ((v100 & 0xCCCCCCCCCCCCCCCCLL) <= (v100 & 0x3333333333333333))) | ((v100 & 0xAAAAAAAAAAAAAAAALL) <= (v100 & 0x5555555555555555)), v125 = v121 - v124, v125 >= 0))
      {
        v126 = v124 - 15;
        if (v124 > 0xF)
        {
          v100 = (v100 << v126) + (v119 >> (79 - v124));
          v119 <<= v126;
        }
        else if (v124 != 15)
        {
          v119 = (v100 << (v124 + 49)) + (v119 >> (15 - v124));
          v100 >>= 15 - v124;
        }
        v4 |= v100 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v125 << 48);
        *a2 = v119;
      }
      else
      {
        *a2 = 0;
      }
      result = a2;
      goto LABEL_63;
    }
LABEL_74:
    v23 = 0;
    v117 = v109;
    v100 = v103;
    goto LABEL_75;
  }
  if ((~a4 & 0x7800000000000000) != 0)
  {
LABEL_62:
    *result = 0;
    goto LABEL_63;
  }
  if ((~a4 & 0x7C00000000000000) != 0)
  {
LABEL_61:
    v4 |= 0x7FFF000000000000uLL;
    goto LABEL_62;
  }
  if ((a4 & 0x3FFFFFFFFFFFLL) > 0x314DC6448D93
    || a3 >= 0x38C15B0A00000000 && (a4 & 0x3FFFFFFFFFFFLL) == 0x314DC6448D93)
  {
    v4 |= 0x7FFF800000000000uLL;
    goto LABEL_62;
  }
  *((_QWORD *)&v26 + 1) = a4;
  *(_QWORD *)&v26 = a3;
  v25 = v26 >> 46;
  v4 |= (v25 >> 17) | 0x7FFF800000000000;
  *result = (2 * (a3 & 0x3FFFFFFFFFFFLL)) | (v25 << 47);
LABEL_63:
  result[1] = v4;
  return result;
}

uint64_t __bid_round64_2_18(uint64_t result, int a2, uint64_t a3, unint64_t *a4, int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  _DWORD *v23;
  int v25;

  v9 = a2 - 1;
  v10 = __bid_midpoint64[v9] + a3;
  v11 = HIDWORD(v10);
  v12 = __bid_Kx64[v9];
  v13 = HIDWORD(v12);
  v14 = HIDWORD(v10) * (unint64_t)v12;
  v15 = v10 * (unint64_t)v12;
  v16 = (LODWORD(__bid_midpoint64[v9]) + a3) * (unint64_t)v13
      + v14
      + HIDWORD(v15);
  v17 = HIDWORD(v14) + v11 * (unint64_t)v13 + HIDWORD(v16);
  v18 = v15 | ((unint64_t)v16 << 32);
  v19 = v17 >> __bid_Ex64m64[v9];
  v20 = v17 & __bid_mask64[v9];
  v21 = __bid_half64[v9];
  if (v20 <= v21 && (v18 ? (v22 = v20 == v21) : (v22 = 0), v23 = a9, !v22)
    || (v23 = a8, v20 != v21)
    || (v23 = a8, v18 > __bid_ten2mxtrunc64[v9]))
  {
    *v23 = 1;
  }
  if (!v20 && v18 <= __bid_ten2mxtrunc64[v9])
  {
    if ((v19 & 1) == 0)
      a7 = a6;
    *a7 = 1;
    v19 &= ~1uLL;
    *a8 = 0;
    *a9 = 0;
  }
  if (v19 == __bid_ten2k64[(int)result - a2])
  {
    v19 = __bid_ten2k64[(int)result - a2 - 1];
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  *a5 = v25;
  *a4 = v19;
  return result;
}

uint64_t __bid_round128_19_38(uint64_t result, int a2, unint64_t a3, unint64_t a4, unint64_t *a5, int *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned __int128 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned __int128 v42;
  unint64_t v43;
  BOOL v44;
  uint64_t v45;
  unsigned int v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  BOOL v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t *v58;
  unint64_t v59;
  BOOL v60;
  unint64_t v61;
  BOOL v62;
  _DWORD *v63;
  int v65;
  _QWORD *v66;
  unint64_t *v67;
  int v68;
  unint64_t v69;

  v10 = a2 - 1;
  if (a2 > 19)
  {
    v13 = (__bid_midpoint128[a2 - 20] + __PAIR128__(a4, a3)) >> 64;
    v12 = *(_QWORD *)&__bid_midpoint128[a2 - 20] + a3;
    v10 = v10;
  }
  else
  {
    v11 = __bid_midpoint64[v10];
    v12 = v11 + a3;
    if (__CFADD__(v11, a3))
      v13 = a4 + 1;
    else
      v13 = a4;
  }
  v14 = HIDWORD(v12);
  v15 = &__bid_Kx128[2 * v10];
  v17 = *v15;
  v16 = v15[1];
  v18 = HIDWORD(v16);
  v19 = v16 * (unint64_t)HIDWORD(v12);
  v20 = HIDWORD(v19) + HIDWORD(v16) * (unint64_t)HIDWORD(v12);
  v21 = HIDWORD(v16) * (unint64_t)v12
      + v19
      + ((v16 * (unint64_t)v12) >> 32);
  v22 = HIDWORD(v21);
  v23 = (v16 * v12) | ((unint64_t)v21 << 32);
  v24 = HIDWORD(v17);
  v25 = v17 * (unint64_t)HIDWORD(v12);
  v26 = v17 * (unint64_t)v12;
  v27 = HIDWORD(v17) * (unint64_t)v12 + v25 + HIDWORD(v26);
  v28 = v26 | ((unint64_t)v27 << 32);
  v29 = __PAIR128__(v20, v23)
      + __PAIR128__(v22, HIDWORD(v25) + HIDWORD(v17) * (unint64_t)v14 + HIDWORD(v27));
  v30 = HIDWORD(v13);
  LODWORD(v23) = v13;
  v31 = v16 * (unint64_t)HIDWORD(v13);
  v32 = v16 * (unint64_t)v13;
  v33 = v18 * (unint64_t)v13;
  v34 = HIDWORD(v31) + v18 * (unint64_t)HIDWORD(v13);
  v35 = v33 + v31 + HIDWORD(v32);
  v36 = HIDWORD(v35);
  v37 = v32 | ((unint64_t)v35 << 32);
  v38 = v17 * (unint64_t)HIDWORD(v13);
  v39 = v17 * (unint64_t)v13;
  v40 = HIDWORD(v17) * (unint64_t)v23 + v38 + HIDWORD(v39);
  v41 = v39 | ((unint64_t)v40 << 32);
  v42 = __PAIR128__(v34, v37)
      + __PAIR128__(v36, HIDWORD(v38) + v24 * (unint64_t)v30 + HIDWORD(v40));
  v43 = v29 + v41;
  v44 = __CFADD__(__CFADD__((_QWORD)v29, v41), (_QWORD)v42);
  v45 = __CFADD__((_QWORD)v29, v41) + (_QWORD)v42;
  v46 = v44;
  v47 = *((_QWORD *)&v29 + 1) + v45;
  if (__CFADD__(*((_QWORD *)&v29 + 1), v45))
    v48 = 1;
  else
    v48 = v46;
  v49 = *((_QWORD *)&v42 + 1) + v48;
  v50 = __bid_Ex128m128[v10];
  if (a2 <= 19)
  {
    v51 = (v49 << -(char)v50) | (v47 >> v50);
    v52 = v49 >> v50;
    v47 &= __bid_mask128[v10];
    v53 = __bid_half128[v10];
    if (v47 > v53 || (v47 == v53 ? (v54 = (v43 | v28) == 0) : (v54 = 1), !v54))
    {
      if (v47 != v53
        || (v58 = (unint64_t *)&__bid_ten2mxtrunc128[v10], v61 = v58[1], v62 = v43 == v61, v43 > v61))
      {
        v55 = 0;
        goto LABEL_34;
      }
      v55 = 0;
      if (!v62)
        goto LABEL_38;
LABEL_64:
      v69 = *v58;
      v63 = a9;
      if (v28 <= v69)
        goto LABEL_38;
      goto LABEL_37;
    }
    v55 = 0;
LABEL_36:
    v63 = a10;
    goto LABEL_37;
  }
  v51 = v49 >> v50;
  v55 = __bid_mask128[v10] & v49;
  v56 = __bid_half128[v10];
  if (v55 <= v56 && (v55 != v56 || !(v43 | v28 | v47)))
  {
    v52 = 0;
    goto LABEL_36;
  }
  if (v55 == v56 && v47 == 0)
  {
    v58 = (unint64_t *)&__bid_ten2mxtrunc128[v10];
    v59 = v58[1];
    v60 = v43 == v59;
    if (v43 <= v59)
    {
      v47 = 0;
      v52 = 0;
      if (!v60)
        goto LABEL_38;
      goto LABEL_64;
    }
    v47 = 0;
  }
  v52 = 0;
LABEL_34:
  v63 = a9;
LABEL_37:
  *v63 = 1;
LABEL_38:
  if (!(v55 | v47) && __PAIR128__(v43, v28) <= __bid_ten2mxtrunc128[v10])
  {
    if ((v51 & 1) == 0)
      a8 = a7;
    *a8 = 1;
    v51 &= ~1uLL;
    *a9 = 0;
    *a10 = 0;
  }
  v65 = result - a2;
  if ((int)result - a2 <= 19)
  {
    if (!v52)
    {
      if (v51 != __bid_ten2k64[v65])
      {
        v68 = 0;
        v52 = 0;
        goto LABEL_57;
      }
      v52 = 0;
      v51 = __bid_ten2k64[v65 - 1];
      goto LABEL_55;
    }
LABEL_56:
    v68 = 0;
    goto LABEL_57;
  }
  if (v65 == 20)
  {
    if (v52 != 5)
      goto LABEL_56;
    if (v51 != 0x6BC75E2D63100000)
    {
      v68 = 0;
      v52 = 5;
      goto LABEL_57;
    }
    v52 = 0;
    v51 = 0x8AC7230489E80000;
  }
  else
  {
    v66 = &__bid_ten2k128[2 * (v65 - 20)];
    if (v52 != v66[1] || v51 != *v66)
      goto LABEL_56;
    v67 = &__bid_ten2k128[2 * (v65 - 21)];
    v51 = *v67;
    v52 = v67[1];
  }
LABEL_55:
  v68 = 1;
LABEL_57:
  *a6 = v68;
  *a5 = v51;
  a5[1] = v52;
  return result;
}

int *__bid_round192_39_57(int a1, int a2, unint64_t *a3, unint64_t *a4, int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  int *result;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL4 v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unsigned int v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unsigned int v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  _BOOL8 v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unsigned int v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  _BOOL4 v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unsigned int v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  int v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t *v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  _DWORD *v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t *v138;
  unint64_t v139;
  unint64_t v140;
  char *v141;
  unint64_t v142;
  _DWORD *v143;
  unsigned int v144;
  int v145;
  _QWORD *v146;
  unint64_t *v147;
  _QWORD *v148;
  unint64_t *v149;
  unint64_t v150;
  unint64_t v151;

  v9 = a2 - 1;
  if (a2 > 19)
  {
    v15 = *a3;
    if (a2 > 0x26)
    {
      v18 = (_QWORD *)((char *)&__bid_midpoint192 + 32 * (a2 - 39));
      v19 = a3[1];
      v12 = __CFADD__(*v18, v15);
      v13 = *v18 + v15;
      *a3 = v13;
      if (v12 && (v12 = __CFADD__(v19, 1), ++v19, v12))
      {
        result = a5;
        v20 = a3[2] + 1;
        v11 = v18[1];
        a3[1] = v11;
      }
      else
      {
        result = a5;
        v23 = v18[1];
        v12 = __CFADD__(v23, v19);
        v11 = v23 + v19;
        a3[1] = v11;
        v20 = a3[2];
        if (v12)
          ++v20;
      }
      v22 = v18[2] + v20;
      goto LABEL_26;
    }
    v16 = &__bid_midpoint128[a2 - 20];
    v17 = a3[1];
    v12 = __CFADD__(*v16, v15);
    v13 = *v16 + v15;
    *a3 = v13;
    if (v12)
    {
      v12 = __CFADD__(v17++, 1);
      if (v12)
      {
        result = a5;
        ++a3[2];
        v11 = v16[1];
        a3[1] = v11;
        goto LABEL_27;
      }
    }
    v21 = v16[1];
    v12 = __CFADD__(v21, v17);
    v11 = v21 + v17;
    a3[1] = v11;
    if (!v12)
      goto LABEL_22;
    result = a5;
  }
  else
  {
    v10 = __bid_midpoint64[v9];
    v11 = a3[1];
    v12 = __CFADD__(v10, *a3);
    v13 = v10 + *a3;
    *a3 = v13;
    if (!v12 || (v12 = __CFADD__(v11, 1), ++v11, a3[1] = v11, !v12))
    {
LABEL_22:
      result = a5;
      goto LABEL_27;
    }
    result = a5;
    v11 = 0;
  }
  v22 = a3[2] + 1;
LABEL_26:
  a3[2] = v22;
LABEL_27:
  v24 = HIDWORD(v13);
  v25 = v13;
  v26 = (int)v9;
  v27 = (uint64_t *)((char *)&__bid_Kx192 + 32 * (int)v9);
  v28 = *v27;
  v29 = v27[1];
  v30 = HIDWORD(*v27);
  v31 = *v27;
  v32 = v31 * (unint64_t)HIDWORD(v13);
  v33 = v31 * (unint64_t)v13;
  v34 = v30 * (unint64_t)v13 + v32 + HIDWORD(v33);
  v35 = HIDWORD(v32) + v30 * (unint64_t)HIDWORD(v13) + HIDWORD(v34);
  v36 = HIDWORD(v29);
  v37 = v29 * (unint64_t)HIDWORD(v13);
  v38 = HIDWORD(v37) + HIDWORD(v29) * (unint64_t)HIDWORD(v13);
  v39 = HIDWORD(v29) * (unint64_t)v13
      + v37
      + ((v29 * (unint64_t)v13) >> 32);
  v40 = v38 + HIDWORD(v39);
  v41 = (v29 * v13) | ((unint64_t)v39 << 32);
  v42 = v27[2];
  v43 = v42 * (unint64_t)HIDWORD(v13);
  v44 = v42 * (unint64_t)v13;
  v45 = HIDWORD(v43) + HIDWORD(v42) * (unint64_t)v24;
  v46 = HIDWORD(v42) * (unint64_t)v25 + v43 + HIDWORD(v44);
  v47 = v45 + HIDWORD(v46);
  v48 = v44 | ((unint64_t)v46 << 32);
  v49 = v35 + v41;
  v50 = __CFADD__(v35, v41) + v48;
  v51 = __CFADD__(__CFADD__(v35, v41), v48);
  v52 = v40 + v50;
  v53 = __CFADD__(v40, v50) || v51;
  v54 = v47 + v53;
  v55 = HIDWORD(v11) * (unint64_t)v31;
  v56 = HIDWORD(v55) + HIDWORD(v11) * (unint64_t)v30;
  v57 = HIDWORD(v11) * (unint64_t)v29;
  v58 = v11 * (unint64_t)HIDWORD(v29)
      + v57
      + ((v11 * (unint64_t)v29) >> 32);
  v59 = HIDWORD(v57) + HIDWORD(v11) * (unint64_t)HIDWORD(v29) + HIDWORD(v58);
  v60 = (v11 * v29) | ((unint64_t)v58 << 32);
  v61 = HIDWORD(v11) * (unint64_t)v42;
  v62 = HIDWORD(v61) + HIDWORD(v11) * (unint64_t)HIDWORD(v42);
  v63 = v11 * (unint64_t)HIDWORD(v42) + v61;
  v64 = v11 * (unint64_t)v28;
  v65 = v11 * (unint64_t)v30 + v55 + HIDWORD(v64);
  v66 = v56 + HIDWORD(v65);
  v67 = v11 * (unint64_t)v42;
  v68 = v63 + HIDWORD(v67);
  v69 = v62 + HIDWORD(v68);
  v70 = v67 | ((unint64_t)v68 << 32);
  v71 = v66 + v60;
  v12 = __CFADD__(__CFADD__(v66, v60), v70);
  v72 = __CFADD__(v66, v60) + v70;
  v73 = v12;
  v12 = __CFADD__(v59, v72);
  v74 = v59 + v72;
  if (v12)
    v75 = 1;
  else
    v75 = v73;
  v76 = v69 + v75;
  v77 = a3[2];
  v78 = HIDWORD(v77);
  v79 = v77;
  v80 = HIDWORD(v77) * (unint64_t)v31;
  v81 = v77 * (unint64_t)v28;
  v82 = HIDWORD(v80) + HIDWORD(v77) * (unint64_t)v30;
  v83 = v77 * (unint64_t)v30 + v80 + HIDWORD(v81);
  v84 = v82 + HIDWORD(v83);
  v85 = HIDWORD(v77) * (unint64_t)v29;
  v86 = v77 * (unint64_t)v29;
  v87 = HIDWORD(v85) + HIDWORD(v77) * (unint64_t)v36;
  v88 = v77 * (unint64_t)v36 + v85 + HIDWORD(v86);
  v89 = v87 + HIDWORD(v88);
  v90 = v86 | ((unint64_t)v88 << 32);
  v91 = HIDWORD(v77) * (unint64_t)v42;
  v92 = v77 * (unint64_t)v42;
  v93 = HIDWORD(v91) + v78 * (unint64_t)HIDWORD(v42);
  v94 = v79 * (unint64_t)HIDWORD(v42) + v91 + HIDWORD(v92);
  v95 = v92 | ((unint64_t)v94 << 32);
  v12 = __CFADD__(v84, v90);
  v96 = v84 + v90;
  v98 = v12;
  v12 = __CFADD__(v12, v95);
  v97 = v98 + v95;
  LODWORD(v99) = v12;
  v12 = __CFADD__(v89, v97);
  v100 = v89 + v97;
  v101 = v93 + HIDWORD(v94);
  if (v12)
    v99 = 1;
  else
    v99 = v99;
  v102 = v101 + v99;
  v103 = v64 | ((unint64_t)v65 << 32);
  v104 = v103 + v49;
  v105 = __CFADD__(v103, v49) + v71;
  v106 = v33 | ((unint64_t)v34 << 32);
  LODWORD(v107) = __CFADD__(__CFADD__(v103, v49), v71);
  v12 = __CFADD__(v105, v52);
  v108 = v105 + v52;
  if (v12)
    v107 = 1;
  else
    v107 = v107;
  v12 = __CFADD__(v74, v107);
  v109 = v74 + v107;
  v110 = v12;
  v111 = v81 | ((unint64_t)v83 << 32);
  v12 = __CFADD__(v54, v109);
  v112 = v54 + v109;
  if (v12)
    v113 = 1;
  else
    v113 = v110;
  v114 = v76 + v113;
  v115 = v108 + v111;
  v116 = __CFADD__(v108, v111) + v96;
  v117 = __CFADD__(__CFADD__(v108, v111), v96);
  v118 = v112 + v116;
  v119 = __CFADD__(v112, v116) || v117;
  v12 = __CFADD__(v100, v119);
  v120 = v100 + v119;
  v121 = v12;
  v122 = v114 + v120;
  if (__CFADD__(v114, v120))
    v123 = 1;
  else
    v123 = v121;
  v124 = v102 + v123;
  v125 = __bid_Ex192m192[(int)v9];
  if (a2 >= 20)
  {
    v127 = v124 >> v125;
    if (a2 < 0x27)
    {
      v128 = (v124 << -(char)v125) | (v122 >> v125);
      v122 &= __bid_mask192[v26];
      v135 = __bid_half192[v26];
      if (v122 > v135)
        goto LABEL_79;
      if (v122 == v135)
      {
        if (v118 || v115 || v104 || v106)
        {
LABEL_79:
          v133 = 0;
          if (v122 != v135 || v118)
          {
            v134 = a8;
            v126 = 0;
            goto LABEL_115;
          }
          v130 = (unint64_t *)((char *)&__bid_ten2mxtrunc192 + 32 * v26);
          v136 = v130[2];
          if (v115 > v136)
            goto LABEL_82;
          if (v115 == v136)
          {
            v150 = v130[1];
            if (v104 > v150)
            {
LABEL_82:
              v118 = 0;
              v133 = 0;
              v126 = 0;
              goto LABEL_76;
            }
            if (v104 == v150)
            {
              v118 = 0;
              v133 = 0;
              v126 = 0;
LABEL_163:
              v151 = *v130;
              v134 = a8;
              goto LABEL_168;
            }
          }
          v118 = 0;
          v133 = 0;
          v126 = 0;
          goto LABEL_116;
        }
        v118 = 0;
      }
      v133 = 0;
      v126 = 0;
      goto LABEL_103;
    }
    v133 = __bid_mask192[v26] & v124;
    v137 = __bid_half192[v26];
    if (v133 > v137)
    {
LABEL_89:
      v126 = 0;
      if (v133 != v137 || v122 || v118)
      {
        v134 = a8;
        v128 = v127;
        v127 = 0;
        goto LABEL_115;
      }
      v138 = (unint64_t *)((char *)&__bid_ten2mxtrunc192 + 32 * v26);
      v139 = v138[2];
      if (v115 > v139)
        goto LABEL_95;
      if (v115 == v139)
      {
        v140 = v138[1];
        if (v104 > v140)
        {
LABEL_95:
          v118 = 0;
          v122 = 0;
          v126 = 0;
          v134 = a8;
LABEL_112:
          v128 = v127;
          v127 = 0;
          goto LABEL_115;
        }
        if (v104 == v140)
        {
          v118 = 0;
          v122 = 0;
          v126 = 0;
          v151 = *v138;
          v134 = a8;
          v128 = v127;
          v127 = 0;
LABEL_168:
          if (v106 <= v151)
            goto LABEL_116;
          goto LABEL_115;
        }
      }
      v118 = 0;
      v122 = 0;
      v126 = 0;
      v128 = v127;
      v127 = 0;
      goto LABEL_116;
    }
    if (v133 == v137)
    {
      if (v122 || v118 || v115 || v104 || v106)
        goto LABEL_89;
      v118 = 0;
      v122 = 0;
    }
    v126 = 0;
    v134 = a9;
    goto LABEL_112;
  }
  v126 = v124 >> v125;
  v127 = (v124 << -(char)v125) | (v122 >> v125);
  v128 = (v122 << -(char)v125) | (v118 >> v125);
  v118 &= __bid_mask192[v26];
  v129 = __bid_half192[v26];
  if (v118 <= v129 && (v118 != v129 || !v115 && !v104 && !v106))
  {
    v122 = 0;
    v133 = 0;
LABEL_103:
    v134 = a9;
    goto LABEL_115;
  }
  if (v118 != v129)
    goto LABEL_75;
  v130 = (unint64_t *)((char *)&__bid_ten2mxtrunc192 + 32 * v26);
  v131 = v130[2];
  if (v115 > v131)
    goto LABEL_75;
  if (v115 != v131)
    goto LABEL_164;
  v132 = v130[1];
  if (v104 <= v132)
  {
    if (v104 == v132)
    {
      v122 = 0;
      v133 = 0;
      goto LABEL_163;
    }
LABEL_164:
    v122 = 0;
    v133 = 0;
    goto LABEL_116;
  }
LABEL_75:
  v122 = 0;
  v133 = 0;
LABEL_76:
  v134 = a8;
LABEL_115:
  *v134 = 1;
LABEL_116:
  if (!v133 && !v122 && !v118)
  {
    v141 = (char *)&__bid_ten2mxtrunc192 + 32 * v26;
    v142 = *((_QWORD *)v141 + 2);
    if (v115 < v142 || v115 == v142 && __PAIR128__(v104, v106) <= *(_OWORD *)v141)
    {
      v143 = a7;
      if ((v128 & 1) == 0)
        v143 = a6;
      *v143 = 1;
      v128 &= ~1uLL;
      *a8 = 0;
      *a9 = 0;
    }
  }
  v144 = a1 - a2;
  if (a1 - a2 > 19)
  {
    if (v144 == 20)
    {
      if (v126)
        goto LABEL_153;
      if (v127 == 5)
      {
        if (v128 != 0x6BC75E2D63100000)
        {
          v145 = 0;
          v126 = 0;
          v127 = 5;
          goto LABEL_154;
        }
        v126 = 0;
        v127 = 0;
        v128 = 0x8AC7230489E80000;
        goto LABEL_129;
      }
    }
    else
    {
      if (v144 > 0x26)
      {
        if (v144 == 39)
        {
          if (v126 == 2)
          {
            if (v127 != 0xF050FE938943ACC4)
            {
              v145 = 0;
              v126 = 2;
              goto LABEL_154;
            }
            if (v128 != 0x5F65568000000000)
            {
              v145 = 0;
              v126 = 2;
              v127 = 0xF050FE938943ACC4;
              goto LABEL_154;
            }
            v126 = 0;
            v128 = 0x98A224000000000;
            v127 = 0x4B3B4CA85A86C47ALL;
            goto LABEL_129;
          }
        }
        else
        {
          v148 = (_QWORD *)((char *)&__bid_ten2k256 + 32 * v144 - 1248);
          if (v126 == v148[2] && v127 == v148[1] && v128 == *v148)
          {
            v149 = (unint64_t *)((char *)&__bid_ten2k256 + 32 * v144 - 1280);
            v128 = *v149;
            v127 = v149[1];
            v126 = v149[2];
            goto LABEL_129;
          }
        }
LABEL_153:
        v145 = 0;
        goto LABEL_154;
      }
      if (v126)
        goto LABEL_153;
      v146 = &__bid_ten2k128[2 * v144 - 40];
      if (v127 == v146[1] && v128 == *v146)
      {
        v126 = 0;
        v147 = &__bid_ten2k128[2 * v144 - 42];
        v128 = *v147;
        v127 = v147[1];
        goto LABEL_129;
      }
    }
    v145 = 0;
    v126 = 0;
    goto LABEL_154;
  }
  if (v126 | v127)
    goto LABEL_153;
  if (v128 != __bid_ten2k64[v144])
  {
    v145 = 0;
    v126 = 0;
    v127 = 0;
    goto LABEL_154;
  }
  v126 = 0;
  v127 = 0;
  v128 = __bid_ten2k64[(int)v144 - 1];
LABEL_129:
  v145 = 1;
LABEL_154:
  *result = v145;
  a4[1] = v127;
  a4[2] = v126;
  *a4 = v128;
  return result;
}

uint64_t __bid_round256_58_76(int a1, uint64_t a2, unint64_t *a3, unint64_t *a4, int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unsigned int v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unsigned int v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  _BOOL8 v117;
  unsigned int v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unsigned int v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  _BOOL8 v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unsigned int v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  _BOOL8 v175;
  unsigned int v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  unsigned int v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  unint64_t v190;
  unsigned int v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unsigned int v195;
  unint64_t v196;
  uint64_t v197;
  uint64_t result;
  unint64_t v199;
  unsigned int v200;
  unint64_t v201;
  uint64_t v202;
  unint64_t v203;
  int v204;
  unint64_t v205;
  uint64_t v206;
  unint64_t v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  unint64_t *v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  _DWORD *v224;
  unint64_t v225;
  unint64_t v226;
  char *v227;
  unint64_t v228;
  unint64_t v229;
  _DWORD *v230;
  unsigned int v231;
  int v232;
  unint64_t *v233;
  _QWORD *v234;
  unint64_t *v235;
  uint64_t v236;
  _QWORD *v237;
  unint64_t *v238;
  _QWORD *v239;
  unint64_t *v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unsigned int v254;
  unint64_t v255;
  uint64_t v256;
  int v257;

  v9 = (int)a2 - 1;
  if ((int)a2 <= 19)
  {
    v10 = __bid_midpoint64[v9];
    v11 = a3[1];
    v24 = __CFADD__(v10, *a3);
    v12 = v10 + *a3;
    *a3 = v12;
    if (!v24)
      goto LABEL_54;
    v24 = __CFADD__(v11, 1);
    a3[1] = ++v11;
    if (!v24)
      goto LABEL_54;
    v13 = a3[2];
    a3[2] = v13 + 1;
    v11 = 0;
    if (v13 != -1)
      goto LABEL_54;
    goto LABEL_44;
  }
  if (a2 > 0x26)
  {
    v17 = *a3;
    if (a2 <= 0x3A)
    {
      v18 = (_QWORD *)((char *)&__bid_midpoint192 + 32 * (a2 - 39));
      v19 = a3[1];
      v24 = __CFADD__(*v18, v17);
      v12 = *v18 + v17;
      *a3 = v12;
      if (v24 && (v24 = __CFADD__(v19, 1), ++v19, v24))
      {
        v20 = a3[2];
        v24 = __CFADD__(v20, 1);
        v21 = v20 + 1;
        if (v24)
          ++a3[3];
        v11 = v18[1];
        a3[1] = v11;
      }
      else
      {
        v30 = v18[1];
        v21 = a3[2];
        v11 = v30 + v19;
        a3[1] = v30 + v19;
        if (__CFADD__(v30, v19))
        {
          v24 = __CFADD__(v21++, 1);
          if (v24)
          {
            ++a3[3];
            a3[2] = v18[2];
            goto LABEL_54;
          }
        }
      }
      v31 = v18[2];
      v24 = __CFADD__(v31, v21);
      v25 = v31 + v21;
      goto LABEL_42;
    }
    v26 = (_QWORD *)((char *)&__bid_midpoint256 + 32 * (a2 - 59));
    v27 = a3[1];
    v24 = __CFADD__(*v26, v17);
    v12 = *v26 + v17;
    *a3 = v12;
    if (v24 && (v24 = __CFADD__(v27, 1), ++v27, v24))
    {
      v28 = a3[2];
      v24 = __CFADD__(v28, 1);
      v29 = v28 + 1;
      if (v24)
        ++a3[3];
      v11 = v26[1];
      a3[1] = v11;
    }
    else
    {
      v33 = v26[1];
      v29 = a3[2];
      v11 = v33 + v27;
      a3[1] = v33 + v27;
      if (__CFADD__(v33, v27))
      {
        v24 = __CFADD__(v29++, 1);
        if (v24)
        {
          v34 = a3[3] + 1;
          a3[2] = v26[2];
LABEL_52:
          v32 = v26[3] + v34;
          goto LABEL_53;
        }
      }
    }
    v35 = v26[2];
    v24 = __CFADD__(v35, v29);
    a3[2] = v35 + v29;
    v34 = a3[3];
    if (v24)
      ++v34;
    goto LABEL_52;
  }
  v14 = &__bid_midpoint128[(a2 - 20)];
  v15 = a3[1];
  v24 = __CFADD__(*v14, *a3);
  v12 = *v14 + *a3;
  *a3 = v12;
  if (v24)
  {
    v24 = __CFADD__(v15++, 1);
    if (v24)
    {
      v16 = a3[2];
      a3[2] = v16 + 1;
      if (v16 == -1)
        ++a3[3];
      v11 = v14[1];
      a3[1] = v11;
      goto LABEL_54;
    }
  }
  v22 = v14[1];
  v11 = v22 + v15;
  a3[1] = v22 + v15;
  if (!__CFADD__(v22, v15))
    goto LABEL_54;
  v23 = a3[2];
  v24 = __CFADD__(v23, 1);
  v25 = v23 + 1;
LABEL_42:
  a3[2] = v25;
  if (v24)
  {
LABEL_44:
    v32 = a3[3] + 1;
LABEL_53:
    a3[3] = v32;
  }
LABEL_54:
  v36 = HIDWORD(v12);
  v256 = (int)v9;
  v37 = (uint64_t *)((char *)&__bid_Kx256 + 32 * (int)v9);
  v38 = *v37;
  v39 = v37[1];
  v40 = HIDWORD(*v37);
  v41 = *v37;
  v42 = v41 * (unint64_t)HIDWORD(v12);
  v254 = v41 * v12;
  v255 = v40 * (unint64_t)v12
       + v42
       + ((v41 * (unint64_t)v12) >> 32);
  v43 = HIDWORD(v42) + v40 * (unint64_t)HIDWORD(v12) + HIDWORD(v255);
  v44 = HIDWORD(v39);
  v45 = v39 * (unint64_t)HIDWORD(v12);
  v46 = v39 * (unint64_t)v12;
  v47 = HIDWORD(v39) * (unint64_t)v12 + v45 + HIDWORD(v46);
  v48 = HIDWORD(v45) + HIDWORD(v39) * (unint64_t)HIDWORD(v12) + HIDWORD(v47);
  v49 = v37[2];
  v50 = v37[3];
  v51 = v49 * (unint64_t)HIDWORD(v12);
  v52 = v49 * (unint64_t)v12;
  v53 = HIDWORD(v49) * (unint64_t)v12 + v51 + HIDWORD(v52);
  v54 = HIDWORD(v51) + HIDWORD(v49) * (unint64_t)HIDWORD(v12) + HIDWORD(v53);
  v55 = v50 * (unint64_t)HIDWORD(v12);
  v56 = v50 * (unint64_t)v12;
  v57 = HIDWORD(v50) * (unint64_t)v12 + v55 + HIDWORD(v56);
  v58 = HIDWORD(v55) + HIDWORD(v50) * (unint64_t)v36 + HIDWORD(v57);
  v59 = v46 | ((unint64_t)v47 << 32);
  v60 = v52 | ((unint64_t)v53 << 32);
  v61 = v56 | ((unint64_t)v57 << 32);
  v253 = v43 + v59;
  v24 = __CFADD__(__CFADD__(v43, v59), v60);
  v62 = __CFADD__(v43, v59) + v60;
  v63 = v24;
  v251 = v48 + v62;
  if (__CFADD__(v48, v62))
    v64 = 1;
  else
    v64 = v63;
  v24 = __CFADD__(v61, v64);
  v65 = v61 + v64;
  v66 = v24;
  v250 = v54 + v65;
  if (__CFADD__(v54, v65))
    v67 = 1;
  else
    v67 = v66;
  v252 = v58 + v67;
  v68 = HIDWORD(v11) * (unint64_t)v41;
  v69 = HIDWORD(v11) * (unint64_t)v39;
  v70 = HIDWORD(v69) + HIDWORD(v11) * (unint64_t)HIDWORD(v39);
  v71 = v11 * (unint64_t)HIDWORD(v39)
      + v69
      + ((v11 * (unint64_t)v39) >> 32);
  v72 = v70 + HIDWORD(v71);
  v73 = (v11 * v39) | ((unint64_t)v71 << 32);
  v74 = HIDWORD(v11) * (unint64_t)v49;
  v75 = HIDWORD(v74) + HIDWORD(v11) * (unint64_t)HIDWORD(v49);
  v76 = v11 * (unint64_t)HIDWORD(v49)
      + v74
      + ((v11 * (unint64_t)v49) >> 32);
  v257 = v9;
  v77 = v75 + HIDWORD(v76);
  v78 = (v11 * v49) | ((unint64_t)v76 << 32);
  v79 = HIDWORD(v11) * (unint64_t)v50;
  v80 = v11 * (unint64_t)v38;
  v81 = v11 * (unint64_t)v40 + v68 + HIDWORD(v80);
  v82 = HIDWORD(v68) + HIDWORD(v11) * (unint64_t)v40 + HIDWORD(v81);
  v83 = v11 * (unint64_t)HIDWORD(v50)
      + v79
      + ((v11 * (unint64_t)v50) >> 32);
  v84 = HIDWORD(v79) + HIDWORD(v11) * (unint64_t)HIDWORD(v50) + HIDWORD(v83);
  v85 = (v11 * v50) | ((unint64_t)v83 << 32);
  v86 = v82 + v73;
  v24 = __CFADD__(__CFADD__(v82, v73), v78);
  v87 = __CFADD__(v82, v73) + v78;
  v88 = v24;
  v24 = __CFADD__(v72, v87);
  v89 = v72 + v87;
  if (v24)
    v90 = 1;
  else
    v90 = v88;
  v24 = __CFADD__(v85, v90);
  v91 = v85 + v90;
  v92 = v24;
  v93 = v77 + v91;
  if (__CFADD__(v77, v91))
    v94 = 1;
  else
    v94 = v92;
  v249 = v84 + v94;
  v95 = a3[2];
  v96 = a3[3];
  v97 = HIDWORD(v95) * (unint64_t)v39;
  v98 = v95 * (unint64_t)HIDWORD(v39)
      + v97
      + ((v95 * (unint64_t)v39) >> 32);
  v99 = HIDWORD(v97) + HIDWORD(v95) * (unint64_t)HIDWORD(v39) + HIDWORD(v98);
  v100 = (v95 * v39) | ((unint64_t)v98 << 32);
  v101 = HIDWORD(v95) * (unint64_t)v49;
  v102 = v95 * (unint64_t)HIDWORD(v49)
       + v101
       + ((v95 * (unint64_t)v49) >> 32);
  v103 = HIDWORD(v101) + HIDWORD(v95) * (unint64_t)HIDWORD(v49) + HIDWORD(v102);
  v104 = (v95 * v49) | ((unint64_t)v102 << 32);
  v105 = HIDWORD(v95) * (unint64_t)v41;
  v106 = v95 * (unint64_t)v40 + v105;
  v107 = HIDWORD(v105) + HIDWORD(v95) * (unint64_t)v40;
  v108 = HIDWORD(v95) * (unint64_t)v50;
  v109 = v95 * (unint64_t)HIDWORD(v50)
       + v108
       + ((v95 * (unint64_t)v50) >> 32);
  v110 = HIDWORD(v108) + HIDWORD(v95) * (unint64_t)HIDWORD(v50) + HIDWORD(v109);
  v111 = (v95 * v50) | ((unint64_t)v109 << 32);
  v112 = v95 * (unint64_t)v38;
  v113 = v106 + HIDWORD(v112);
  v114 = v107 + HIDWORD(v113);
  v24 = __CFADD__(v114, v100);
  v115 = v114 + v100;
  v117 = v24;
  v24 = __CFADD__(v24, v104);
  v116 = v117 + v104;
  v118 = v24;
  v119 = v99 + v116;
  if (__CFADD__(v99, v116))
    v120 = 1;
  else
    v120 = v118;
  v24 = __CFADD__(v111, v120);
  v121 = v111 + v120;
  v122 = v24;
  v123 = v103 + v121;
  if (__CFADD__(v103, v121))
    v124 = 1;
  else
    v124 = v122;
  v125 = v110 + v124;
  v126 = HIDWORD(v96) * (unint64_t)v41;
  v127 = HIDWORD(v126) + HIDWORD(v96) * (unint64_t)v40;
  v128 = v96 * (unint64_t)v40 + v126;
  v129 = HIDWORD(v96) * (unint64_t)v39;
  v130 = HIDWORD(v129) + HIDWORD(v96) * (unint64_t)HIDWORD(v39);
  v131 = v96 * (unint64_t)v39;
  v132 = v96 * (unint64_t)v44 + v129 + HIDWORD(v131);
  v133 = v130 + HIDWORD(v132);
  v134 = v131 | ((unint64_t)v132 << 32);
  v135 = HIDWORD(v96) * (unint64_t)v49;
  v136 = HIDWORD(v135) + HIDWORD(v96) * (unint64_t)HIDWORD(v49);
  v137 = HIDWORD(v96) * (unint64_t)v50;
  v138 = HIDWORD(v137) + HIDWORD(v96) * (unint64_t)HIDWORD(v50);
  v139 = v96 * (unint64_t)HIDWORD(v50);
  v140 = v96 * (unint64_t)v38;
  v141 = v128 + HIDWORD(v140);
  v142 = v127 + HIDWORD(v141);
  v24 = __CFADD__(v142, v134);
  v143 = v142 + v134;
  v144 = v96 * (unint64_t)HIDWORD(v49)
       + v135
       + ((v96 * (unint64_t)v49) >> 32);
  v145 = (v96 * v49) | ((unint64_t)v144 << 32);
  v147 = v24;
  v24 = __CFADD__(v24, v145);
  v146 = v147 + v145;
  LODWORD(v148) = v24;
  v149 = v133 + v146;
  v150 = v96 * (unint64_t)v50;
  if (__CFADD__(v133, v146))
    v148 = 1;
  else
    v148 = v148;
  v151 = v139 + v137 + HIDWORD(v150);
  v152 = v150 | ((unint64_t)v151 << 32);
  v24 = __CFADD__(v152, v148);
  v153 = v152 + v148;
  v154 = v136 + HIDWORD(v144);
  v155 = v24;
  v24 = __CFADD__(v154, v153);
  v156 = v154 + v153;
  v157 = v138 + HIDWORD(v151);
  if (v24)
    v158 = 1;
  else
    v158 = v155;
  v159 = v157 + v158;
  v160 = v80 | ((unint64_t)v81 << 32);
  v162 = (__PAIR128__(v86, v160) + v253) >> 64;
  v161 = v160 + v253;
  LODWORD(v163) = __CFADD__(__CFADD__(v160, v253), v86);
  v24 = __CFADD__(v162, v251);
  v164 = v162 + v251;
  if (v24)
    v163 = 1;
  else
    v163 = v163;
  v24 = __CFADD__(v89, v163);
  v165 = v89 + v163;
  LODWORD(v166) = v24;
  v24 = __CFADD__(v165, v250);
  v167 = v165 + v250;
  if (v24)
    v166 = 1;
  else
    v166 = v166;
  v24 = __CFADD__(v93, v166);
  v168 = v93 + v166;
  LODWORD(v169) = v24;
  v24 = __CFADD__(v252, v168);
  v170 = v252 + v168;
  if (v24)
    v169 = 1;
  else
    v169 = v169;
  v171 = v249 + v169;
  v172 = v112 | ((unint64_t)v113 << 32);
  v24 = __CFADD__(v164, v172);
  v173 = v164 + v172;
  v175 = v24;
  v24 = __CFADD__(v24, v115);
  v174 = v175 + v115;
  v176 = v24;
  v24 = __CFADD__(v167, v174);
  v177 = v167 + v174;
  v178 = v254 | ((unint64_t)v255 << 32);
  if (v24)
    v179 = 1;
  else
    v179 = v176;
  v24 = __CFADD__(v119, v179);
  v180 = v119 + v179;
  v181 = v24;
  v182 = v180 + v170;
  v183 = v140 | ((unint64_t)v141 << 32);
  if (__CFADD__(v180, v170))
    v184 = 1;
  else
    v184 = v181;
  v24 = __CFADD__(v123, v184);
  v185 = v123 + v184;
  LODWORD(v186) = v24;
  v24 = __CFADD__(v171, v185);
  v187 = v171 + v185;
  if (v24)
    v186 = 1;
  else
    v186 = v186;
  v188 = v125 + v186;
  v189 = v177 + v183;
  v24 = __CFADD__(__CFADD__(v177, v183), v143);
  v190 = __CFADD__(v177, v183) + v143;
  v191 = v24;
  v192 = v182 + v190;
  if (__CFADD__(v182, v190))
    v193 = 1;
  else
    v193 = v191;
  v24 = __CFADD__(v149, v193);
  v194 = v149 + v193;
  v195 = v24;
  v196 = v194 + v187;
  if (__CFADD__(v194, v187))
    v197 = 1;
  else
    v197 = v195;
  result = a2;
  v24 = __CFADD__(v156, v197);
  v199 = v156 + v197;
  v200 = v24;
  v201 = v188 + v199;
  if (__CFADD__(v188, v199))
    v202 = 1;
  else
    v202 = v200;
  v203 = v159 + v202;
  v204 = __bid_Ex256m256[v257];
  if ((int)a2 < 20)
  {
    v205 = v203 >> v204;
    v206 = (v203 << -(char)v204) | (v201 >> v204);
    v207 = (v201 << -(char)v204) | (v196 >> v204);
    v208 = (v196 << -(char)v204) | (v192 >> v204);
    v209 = v256;
    v192 &= __bid_mask256[v256];
    v210 = __bid_half256[v256];
    if (v192 <= v210 && (v192 != v210 || !v189 && !v173 && !v161 && !v178))
    {
      v196 = 0;
      v201 = 0;
      v215 = 0;
LABEL_237:
      v224 = a9;
      goto LABEL_238;
    }
    if (v192 != v210)
      goto LABEL_165;
    v211 = (unint64_t *)((char *)&__bid_ten2mxtrunc256 + 32 * v256);
    v212 = v211[2];
    if (v189 > v212)
      goto LABEL_165;
    v213 = v211[3];
    if (v189 == v213 && v173 > v212)
      goto LABEL_165;
    v196 = 0;
    if (v189 != v213 || v173 != v212)
    {
      v201 = 0;
      v215 = 0;
      goto LABEL_239;
    }
    v214 = v211[1];
    if (v161 > v214)
    {
LABEL_165:
      v196 = 0;
      v201 = 0;
      v215 = 0;
LABEL_223:
      v224 = a8;
      goto LABEL_238;
    }
    v196 = 0;
    v201 = 0;
    v215 = 0;
    if (v161 != v214)
      goto LABEL_239;
LABEL_315:
    v224 = a8;
    if (v178 <= *v211)
      goto LABEL_239;
    goto LABEL_238;
  }
  v209 = v256;
  if (a2 >= 0x27)
  {
    if (a2 <= 0x39)
    {
      v207 = v203 >> v204;
      v208 = (v203 << -(char)v204) | (v201 >> v204);
      v201 &= __bid_mask256[v256];
LABEL_194:
      v220 = __bid_half256[v256];
      if (v201 > v220)
        goto LABEL_195;
      if (v201 == v220)
      {
        if (v196 || v192 || v189 || v173 || v161 || v178)
        {
LABEL_195:
          v215 = 0;
          if (v201 != v220 || v196 || v192)
          {
            v224 = a8;
            v206 = 0;
            v205 = 0;
            goto LABEL_238;
          }
          v211 = (unint64_t *)((char *)&__bid_ten2mxtrunc256 + 32 * v256);
          v221 = v211[3];
          if (v189 > v221)
            goto LABEL_203;
          if (v189 == v221)
          {
            v222 = v211[2];
            if (v173 > v222)
            {
LABEL_203:
              v192 = 0;
              v196 = 0;
              v215 = 0;
LABEL_221:
              v206 = 0;
              goto LABEL_222;
            }
            if (v173 == v222)
            {
              v223 = v211[1];
              if (v161 > v223)
                goto LABEL_203;
              if (v161 == v223)
              {
                v192 = 0;
                v196 = 0;
                v215 = 0;
                goto LABEL_313;
              }
            }
          }
          v192 = 0;
          v196 = 0;
          v215 = 0;
LABEL_318:
          v206 = 0;
          goto LABEL_319;
        }
        v192 = 0;
        v196 = 0;
      }
      v215 = 0;
LABEL_235:
      v206 = 0;
      goto LABEL_236;
    }
    if (v257 == 57)
    {
      v207 = 0;
      v208 = v203;
      goto LABEL_194;
    }
    v208 = v203 >> v204;
    v215 = __bid_mask256[v256] & v203;
    v225 = __bid_half256[v256];
    if (v215 > v225)
    {
LABEL_215:
      v207 = 0;
      if (v215 != v225 || v201 || v196 || v192)
      {
        v224 = a8;
        v206 = 0;
        v205 = 0;
        goto LABEL_238;
      }
      v211 = (unint64_t *)((char *)&__bid_ten2mxtrunc256 + 32 * v256);
      v226 = v211[3];
      if (v189 > v226)
        goto LABEL_220;
      if (v189 == v226)
      {
        v241 = v211[2];
        if (v173 > v241)
          goto LABEL_220;
        if (v173 == v241)
        {
          v242 = v211[1];
          if (v161 <= v242)
          {
            if (v161 == v242)
            {
              v192 = 0;
              v196 = 0;
              v201 = 0;
              v207 = 0;
LABEL_313:
              v206 = 0;
              goto LABEL_314;
            }
            goto LABEL_305;
          }
LABEL_220:
          v192 = 0;
          v196 = 0;
          v201 = 0;
          v207 = 0;
          goto LABEL_221;
        }
      }
LABEL_305:
      v192 = 0;
      v196 = 0;
      v201 = 0;
      v207 = 0;
      goto LABEL_318;
    }
    if (v215 == v225)
    {
      if (v201 || v196 || v192 || v189 || v173 || v161 || v178)
        goto LABEL_215;
      v192 = 0;
      v196 = 0;
      v201 = 0;
    }
    v207 = 0;
    goto LABEL_235;
  }
  v206 = v203 >> v204;
  v207 = (v203 << -(char)v204) | (v201 >> v204);
  v208 = (v201 << -(char)v204) | (v196 >> v204);
  v196 &= __bid_mask256[v256];
  v216 = __bid_half256[v256];
  if (v196 > v216)
    goto LABEL_168;
  if (v196 != v216)
    goto LABEL_191;
  if (!v192 && !v189 && !v173 && !v161 && !v178)
  {
    v192 = 0;
LABEL_191:
    v201 = 0;
    v215 = 0;
LABEL_236:
    v205 = 0;
    goto LABEL_237;
  }
LABEL_168:
  v201 = 0;
  if (v196 == v216 && !v192)
  {
    v211 = (unint64_t *)((char *)&__bid_ten2mxtrunc256 + 32 * v256);
    v217 = v211[3];
    if (v189 <= v217)
    {
      if (v189 != v217)
      {
LABEL_310:
        v192 = 0;
        v201 = 0;
        v215 = 0;
LABEL_319:
        v205 = 0;
        goto LABEL_239;
      }
      v218 = v211[2];
      if (v173 <= v218)
      {
        if (v173 == v218)
        {
          v219 = v211[1];
          if (v161 > v219)
            goto LABEL_175;
          if (v161 == v219)
          {
            v192 = 0;
            v201 = 0;
            v215 = 0;
LABEL_314:
            v205 = 0;
            goto LABEL_315;
          }
        }
        goto LABEL_310;
      }
    }
LABEL_175:
    v192 = 0;
    v201 = 0;
    v215 = 0;
LABEL_222:
    v205 = 0;
    goto LABEL_223;
  }
  v224 = a8;
  v215 = 0;
  v205 = 0;
LABEL_238:
  *v224 = 1;
LABEL_239:
  if (!v215 && !v201 && !v196 && !v192)
  {
    v227 = (char *)&__bid_ten2mxtrunc256 + 32 * v209;
    v228 = *((_QWORD *)v227 + 3);
    if (v189 < v228
      || v189 == v228
      && ((v229 = *((_QWORD *)v227 + 2), v173 < v229) || v173 == v229 && __PAIR128__(v161, v178) <= *(_OWORD *)v227))
    {
      v230 = a7;
      if ((v208 & 1) == 0)
        v230 = a6;
      *v230 = 1;
      v208 &= ~1uLL;
      *a8 = 0;
      *a9 = 0;
    }
  }
  v231 = a1 - a2;
  if (a1 - (int)a2 <= 19)
  {
    v232 = 0;
    if (v205 || v206 || v207)
      goto LABEL_291;
    if (v208 != __bid_ten2k64[v231])
    {
      v232 = 0;
      v205 = 0;
      v206 = 0;
      v207 = 0;
      goto LABEL_291;
    }
    v205 = 0;
    v206 = 0;
    v207 = 0;
    v208 = __bid_ten2k64[(int)v231 - 1];
LABEL_257:
    v232 = 1;
LABEL_291:
    v233 = a4;
    goto LABEL_292;
  }
  if (v231 != 20)
  {
    if (v231 > 0x26)
    {
      v236 = v231 - 39;
      if (v231 == 39)
      {
        if (!v205)
        {
          v233 = a4;
          if (v206 != 2)
          {
            v232 = 0;
            v205 = 0;
            goto LABEL_292;
          }
          if (v207 != 0xF050FE938943ACC4)
          {
            v232 = 0;
            v205 = 0;
            v206 = 2;
            goto LABEL_292;
          }
          if (v208 != 0x5F65568000000000)
          {
            v232 = 0;
            v205 = 0;
            v206 = 2;
            v207 = 0xF050FE938943ACC4;
            goto LABEL_292;
          }
          v205 = 0;
          v206 = 0;
          v208 = 0x98A224000000000;
          v207 = 0x4B3B4CA85A86C47ALL;
          goto LABEL_263;
        }
      }
      else if (v231 > 0x39)
      {
        v239 = (_QWORD *)((char *)&__bid_ten2k256 + 32 * v236);
        if (v205 == v239[3] && v206 == v239[2] && v207 == v239[1] && v208 == *v239)
        {
          v240 = (unint64_t *)((char *)&__bid_ten2k256 + 32 * v231 - 1280);
          v208 = *v240;
          v207 = v240[1];
          v206 = v240[2];
          v205 = v240[3];
          goto LABEL_257;
        }
      }
      else if (!v205)
      {
        v237 = (_QWORD *)((char *)&__bid_ten2k256 + 32 * v236);
        if (v206 != v237[2] || v207 != v237[1] || v208 != *v237)
        {
          v232 = 0;
          v205 = 0;
          goto LABEL_291;
        }
        v205 = 0;
        v238 = (unint64_t *)((char *)&__bid_ten2k256 + 32 * v231 - 1280);
        v208 = *v238;
        v207 = v238[1];
        v206 = v238[2];
        goto LABEL_257;
      }
    }
    else if (!(v205 | v206))
    {
      v234 = &__bid_ten2k128[2 * v231 - 40];
      if (v207 != v234[1] || v208 != *v234)
      {
        v232 = 0;
        v205 = 0;
        v206 = 0;
        goto LABEL_291;
      }
      v205 = 0;
      v206 = 0;
      v235 = &__bid_ten2k128[2 * v231 - 42];
      v208 = *v235;
      v207 = v235[1];
      goto LABEL_257;
    }
LABEL_290:
    v232 = 0;
    goto LABEL_291;
  }
  if (v205 | v206)
    goto LABEL_290;
  v233 = a4;
  if (v207 != 5)
  {
    v232 = 0;
    v205 = 0;
    v206 = 0;
    goto LABEL_292;
  }
  if (v208 != 0x6BC75E2D63100000)
  {
    v232 = 0;
    v205 = 0;
    v206 = 0;
    v207 = 5;
    goto LABEL_292;
  }
  v205 = 0;
  v206 = 0;
  v207 = 0;
  v208 = 0x8AC7230489E80000;
LABEL_263:
  v232 = 1;
LABEL_292:
  *a5 = v232;
  v233[2] = v206;
  v233[3] = v205;
  *v233 = v208;
  v233[1] = v207;
  return result;
}

uint64_t sub_1B89127C8()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1B89127D4()
{
  return MEMORY[0x1E0CAF2C8]();
}

uint64_t sub_1B89127E0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B89127EC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B89127F8()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B8912804()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1B8912810()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B891281C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B8912828()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1B8912834()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B8912840()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B891284C()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1B8912858()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1B8912864()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1B8912870()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B891287C()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1B8912888()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1B8912894()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_1B89128A0()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_1B89128AC()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1B89128B8()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1B89128C4()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B89128D0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B89128DC()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B89128E8()
{
  return MEMORY[0x1E0DAF2E8]();
}

uint64_t sub_1B89128F4()
{
  return MEMORY[0x1E0DAF2F0]();
}

uint64_t sub_1B8912900()
{
  return MEMORY[0x1E0DAF2F8]();
}

uint64_t sub_1B891290C()
{
  return MEMORY[0x1E0DAF300]();
}

uint64_t sub_1B8912918()
{
  return MEMORY[0x1E0DAF308]();
}

uint64_t sub_1B8912924()
{
  return MEMORY[0x1E0DAF318]();
}

uint64_t sub_1B8912930()
{
  return MEMORY[0x1E0DAF328]();
}

uint64_t sub_1B891293C()
{
  return MEMORY[0x1E0DAF330]();
}

uint64_t sub_1B8912948()
{
  return MEMORY[0x1E0DAF338]();
}

uint64_t sub_1B8912954()
{
  return MEMORY[0x1E0DAF358]();
}

uint64_t sub_1B8912960()
{
  return MEMORY[0x1E0DAF360]();
}

uint64_t sub_1B891296C()
{
  return MEMORY[0x1E0DAF370]();
}

uint64_t sub_1B8912978()
{
  return MEMORY[0x1E0DAF380]();
}

uint64_t sub_1B8912984()
{
  return MEMORY[0x1E0DAF388]();
}

uint64_t sub_1B8912990()
{
  return MEMORY[0x1E0DAF3B0]();
}

uint64_t sub_1B891299C()
{
  return MEMORY[0x1E0DAF3C0]();
}

uint64_t sub_1B89129A8()
{
  return MEMORY[0x1E0DAF3C8]();
}

uint64_t sub_1B89129B4()
{
  return MEMORY[0x1E0DAF3D0]();
}

uint64_t sub_1B89129C0()
{
  return MEMORY[0x1E0DAF3D8]();
}

uint64_t sub_1B89129CC()
{
  return MEMORY[0x1E0DAF3E0]();
}

uint64_t sub_1B89129D8()
{
  return MEMORY[0x1E0DAF3E8]();
}

uint64_t sub_1B89129E4()
{
  return MEMORY[0x1E0DAF3F0]();
}

uint64_t sub_1B89129F0()
{
  return MEMORY[0x1E0DAF400]();
}

uint64_t sub_1B89129FC()
{
  return MEMORY[0x1E0DAF408]();
}

uint64_t sub_1B8912A08()
{
  return MEMORY[0x1E0DAF418]();
}

uint64_t sub_1B8912A14()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B8912A20()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B8912A2C()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1B8912A38()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B8912A44()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1B8912A50()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1B8912A5C()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1B8912A68()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1B8912A74()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B8912A80()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B8912A8C()
{
  return MEMORY[0x1E0DEA390]();
}

uint64_t sub_1B8912A98()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B8912AA4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B8912AB0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B8912ABC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B8912AC8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B8912AD4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B8912AE0()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1B8912AEC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1B8912AF8()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1B8912B04()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1B8912B10()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B8912B1C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B8912B28()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1B8912B34()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1B8912B40()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1B8912B4C()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1B8912B58()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B8912B64()
{
  return MEMORY[0x1E0DEA818]();
}

uint64_t sub_1B8912B70()
{
  return MEMORY[0x1E0DEA820]();
}

uint64_t sub_1B8912B7C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1B8912B88()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1B8912B94()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1B8912BA0()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1B8912BAC()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1B8912BB8()
{
  return MEMORY[0x1E0DEA8C0]();
}

uint64_t sub_1B8912BC4()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1B8912BD0()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1B8912BDC()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1B8912BE8()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t sub_1B8912BF4()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1B8912C00()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B8912C0C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B8912C18()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1B8912C24()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1B8912C30()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t sub_1B8912C3C()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1B8912C48()
{
  return MEMORY[0x1E0DEAB10]();
}

uint64_t sub_1B8912C54()
{
  return MEMORY[0x1E0DEAB50]();
}

uint64_t sub_1B8912C60()
{
  return MEMORY[0x1E0DEAB80]();
}

uint64_t sub_1B8912C6C()
{
  return MEMORY[0x1E0DEAB88]();
}

uint64_t sub_1B8912C78()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1B8912C84()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B8912C90()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B8912C9C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B8912CA8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B8912CB4()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1B8912CC0()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B8912CCC()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B8912CD8()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1B8912CE4()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B8912CF0()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B8912CFC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B8912D08()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1B8912D14()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1B8912D20()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B8912D2C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B8912D38()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1B8912D44()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1B8912D50()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B8912D5C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B8912D68()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1B8912D74()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B8912D80()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B8912D8C()
{
  return MEMORY[0x1E0DEB2D8]();
}

uint64_t sub_1B8912D98()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B8912DA4()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1B8912DB0()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1B8912DBC()
{
  return MEMORY[0x1E0DEB640]();
}

uint64_t sub_1B8912DC8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B8912DD4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B8912DE0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B8912DEC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B8912DF8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B8912E04()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1B8912E10()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1B8912E1C()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1B8912E28()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B8912E34()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1B8912E40()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1B8912E4C()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B8912E58()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1B8912E64()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1B8912E70()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B8912E7C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B8912E88()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B8912E94()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B8912EA0()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B8912EAC()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B8912EB8()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B8912EC4()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B8912ED0()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B8912EDC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B8912EE8()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B8912EF4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B8912F00()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B8912F0C()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B8912F18()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B8912F24()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1B8912F30()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_1B8912F3C()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_1B8912F48()
{
  return MEMORY[0x1E0DEC3C0]();
}

uint64_t sub_1B8912F54()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1B8912F60()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B8912F6C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B8912F78()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B8912F84()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B8912F90()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B8912F9C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B8912FA8()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B8912FB4()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B8912FC0()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B8912FCC()
{
  return MEMORY[0x1E0DECCE0]();
}

uint64_t sub_1B8912FD8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B8912FE4()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1B8912FF0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B8912FFC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B8913008()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B8913014()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B8913020()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B891302C()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_1B8913038()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B8913044()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1B8913050()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B891305C()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1B8913068()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1B8913074()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B8913080()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B891308C()
{
  return MEMORY[0x1E0DEDE10]();
}

uint64_t sub_1B8913098()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B89130A4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B89130B0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B89130BC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B89130C8()
{
  return MEMORY[0x1E0DEE7C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double acosh(long double __x)
{
  long double result;

  MEMORY[0x1E0C81510](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double asinh(long double __x)
{
  long double result;

  MEMORY[0x1E0C815A8](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atanh(long double __x)
{
  long double result;

  MEMORY[0x1E0C81638](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cbrt(long double __x)
{
  long double result;

  MEMORY[0x1E0C81850](__x);
  return result;
}

void clearerr(FILE *a1)
{
  MEMORY[0x1E0C82648](a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B50](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F0](__x);
  return result;
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F8](__x);
  return result;
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1E0C83638](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

double j0(double a1)
{
  double result;

  MEMORY[0x1E0C839D0](a1);
  return result;
}

double j1(double a1)
{
  double result;

  MEMORY[0x1E0C839D8](a1);
  return result;
}

long double lgamma(long double __x)
{
  long double result;

  MEMORY[0x1E0C83B60](__x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int raise(int a1)
{
  return MEMORY[0x1E0C84FA8](*(_QWORD *)&a1);
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C850A8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x1E0C85428](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

long double strtold(const char *a1, char **a2)
{
  long double result;

  MEMORY[0x1E0C85668](a1, a2);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

long double tanh(long double __x)
{
  long double result;

  MEMORY[0x1E0C857F8](__x);
  return result;
}

long double tgamma(long double __x)
{
  long double result;

  MEMORY[0x1E0C858D0](__x);
  return result;
}

char *__cdecl u_austrcpy(char *dst, const UChar *src)
{
  return (char *)MEMORY[0x1E0DE5950](dst, src);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x1E0DE5A30](*(_QWORD *)&c);
}

UChar *__cdecl u_uastrncpy(UChar *dst, const char *src, int32_t n)
{
  return (UChar *)MEMORY[0x1E0DE5B30](dst, src, *(_QWORD *)&n);
}

uint64_t unum_close()
{
  return MEMORY[0x1E0DE6530]();
}

uint64_t unum_formatDoubleCurrency()
{
  return MEMORY[0x1E0DE6550]();
}

uint64_t unum_open()
{
  return MEMORY[0x1E0DE6598]();
}

double y0(double a1)
{
  double result;

  MEMORY[0x1E0C86800](a1);
  return result;
}

double y1(double a1)
{
  double result;

  MEMORY[0x1E0C86808](a1);
  return result;
}

