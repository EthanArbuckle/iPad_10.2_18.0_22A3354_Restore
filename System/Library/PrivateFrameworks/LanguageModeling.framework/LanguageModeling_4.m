void *sub_19C4273A4(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;

  v11 = 2 * a2;
  v12 = malloc_type_calloc(((((a5 + 24) * 2 * a2 + 7) >> 3) & 0x1FFFFFF8) + 8, 1uLL, 0x4E18D228uLL);
  if (v12)
  {
    if (!a3 || !a4)
      goto LABEL_17;
    v13 = 0;
    v14 = a4 + 24;
    v15 = a4;
    v16 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    do
    {
      while (1)
      {
        v19 = ((v13 * v14 + 24) >> 3) + a1;
        v20 = v19 & 0xFFFFFFFFFFFFFFF8;
        v21 = ((_BYTE)v13 * (_BYTE)v14) & 7 | (8 * (v19 & 7));
        v22 = *(_QWORD *)(v19 & 0xFFFFFFFFFFFFFFF8) >> v21;
        if ((unint64_t)(v21 + v15) >= 0x41)
          v22 |= *(_QWORD *)(v20 + 8) << -(char)v21;
        v23 = v22 & v16;
        if ((v22 & v16) != 0)
          break;
        if (++v13 >= a3)
          goto LABEL_17;
      }
      v24 = ((v13 * v14) >> 3) + a1;
      v25 = v24 & 0xFFFFFFFFFFFFFFFCLL;
      v26 = (v13 * v14) & 7 | (8 * (v24 & 3));
      v27 = *(_DWORD *)(v24 & 0xFFFFFFFFFFFFFFFCLL) >> v26;
      if (v26 >= 9)
        v27 |= *(_DWORD *)(v25 + 4) << -(char)v26;
      v17 = sub_19C42751C((uint64_t)v12, v11, a5, v27 & 0xFFFFFF, v23);
      ++v13;
      if (v17)
        v18 = v13 >= a3;
      else
        v18 = 1;
    }
    while (!v18);
    if ((v17 & 1) == 0)
    {
      free(v12);
      return 0;
    }
    else
    {
LABEL_17:
      if (a6)
        *a6 = v11;
    }
  }
  return v12;
}

uint64_t sub_19C42751C(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unint64_t a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;

  v5 = a3 + 24;
  v6 = -1640531573 * a4 % a2;
  if (a3)
  {
    v7 = -1640531573 * a4 % a2;
    while (1)
    {
      v8 = v7 * v5;
      v9 = (v7 * v5 + 24) >> 3;
      v10 = (v7 * v5) & 7;
      v11 = (_QWORD *)((v9 + a1) & 0xFFFFFFFFFFFFFFF8);
      v12 = ((_BYTE)v7 * (_BYTE)v5) & 7 | (8 * ((v9 + a1) & 7));
      v13 = *v11 >> v12;
      if (v12 + (unint64_t)a3 >= 0x41)
        v13 |= v11[1] << -(char)v12;
      if ((v13 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3)) == 0)
        break;
      if (v7 + 1 == a2)
        v7 = 0;
      else
        ++v7;
      if (v7 == v6)
        return 0;
    }
  }
  else
  {
    v8 = v6 * v5;
    v9 = (v6 * v5 + 24) >> 3;
    v10 = (v6 * v5) & 7;
  }
  v15 = (unint64_t)v8 >> 3;
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a1 + v15) & ~(0xFFu >> v10 << v10) | (((0xFFu >> v10) & a4) << v10);
  v16 = v10 | 0x10;
  v17 = v15 + 1;
  do
  {
    if (v16 >= 8)
      v18 = 8;
    else
      v18 = v16;
    *(_BYTE *)(a1 + v17) = (-256 >> (8 - v18)) & *(_BYTE *)(a1 + v17) | (0xFFu >> (8 - v18)) & (a4 >> (24 - v16));
    ++v17;
    v16 -= v18;
  }
  while (v16);
  if (a3)
  {
    v19 = v10 + a3 <= 8 ? a3 : 8 - v10;
    *(_BYTE *)(a1 + v9) = *(_BYTE *)(a1 + v9) & ~(0xFFu >> (8 - v19) << v10) | (((0xFFu >> (8 - v19)) & a5) << v10);
    v20 = a3 - v19;
    if (a3 != v19)
    {
      v21 = v9 + 1;
      do
      {
        if (v20 >= 8)
          v22 = 8;
        else
          v22 = v20;
        *(_BYTE *)(a1 + v21) = (0xFFu >> (8 - v22)) & (a5 >> (a3 - v20)) | (-256 >> (8 - v22)) & *(_BYTE *)(a1 + v21);
        ++v21;
        v20 -= v22;
      }
      while (v20);
    }
  }
  return 1;
}

_QWORD *sub_19C4276DC(_QWORD *a1, int a2)
{
  void *v4;
  _DWORD *v5;
  int v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  int v11;
  char *v12;
  _BYTE *v13;
  BOOL v14;
  uint64_t v15;
  _BYTE *v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  _DWORD *v20;
  unint64_t v21;
  int v22;
  char v23;
  unsigned int v24;
  unsigned int v25;
  char *v26;
  _BYTE *v27;
  unint64_t v28;
  char *v29;
  uint64x2_t v30;
  int16x8_t v31;
  char *v32;
  void *v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  int v37;
  char *v38;
  _BYTE *v39;
  char *exception;
  char v42;
  unsigned int v43;
  _QWORD *v44;
  unsigned int v45;
  char *v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;

  v4 = (void *)operator new();
  *a1 = v4;
  v47 = a2;
  if (read(a2, v4, 0x18uLL) != 24)
    goto LABEL_36;
  v5 = (_DWORD *)*a1;
  if (*(_DWORD *)*a1 != -1381269244)
    goto LABEL_36;
  if (*((_BYTE *)v5 + 4))
    goto LABEL_36;
  v6 = *((unsigned __int8 *)v5 + 5);
  if (!*((_BYTE *)v5 + 5))
    goto LABEL_36;
  v8 = v5[4];
  v7 = v5[5];
  v48 = v5[3];
  v50 = 0;
  *((_BYTE *)v5 + 7) = 64;
  *((_QWORD *)v5 + 4) = 0;
  *((_QWORD *)v5 + 5) = 0;
  *((_QWORD *)v5 + 3) = 0;
  if (v8)
    v9 = v7 == v8;
  else
    v9 = 0;
  if (v9)
  {
    v11 = 3 * v8;
    v49 = 0;
    v12 = (char *)malloc_type_calloc(((3 * v8) & 0x1FFFFFF8) + 8, 1uLL, 0xB6264DD1uLL);
    v13 = malloc_type_calloc(((11 * v8) & 0x1FFFFFF8) + 8, 1uLL, 0x6FD2E88FuLL);
    v46 = v12;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 1;
    if (v14)
      goto LABEL_38;
    v44 = a1;
    v15 = v11 & 0x1FFFFFFF;
    v10 = v15 + 24;
    if (v48 < (int)v15 + 24)
      goto LABEL_36;
    v16 = v13;
    if (read(v47, v12, v11 & 0x1FFFFFFF) != v15)
      goto LABEL_36;
    v17 = 0;
    v45 = ((6 * v6 + 4) >> 3) + 3;
    v18 = 24;
    v43 = v8;
    do
    {
      v19 = (unint64_t)&v46[v17 >> 3];
      v20 = (_DWORD *)(v19 & 0xFFFFFFFFFFFFFFFCLL);
      v21 = 8 * (v19 & 3);
      v22 = *v20 >> v21;
      if (v21 >= 9)
        v22 |= v20[1] << -(char)v21;
      if (v48 < v10 + 3)
        goto LABEL_36;
      if (read(v47, &v50, 3uLL) != 3)
        goto LABEL_36;
      v23 = v50;
      v24 = 4 * v50;
      v25 = (4 * v50) & 0x3FFFFFC;
      if (v25 < v45)
        goto LABEL_36;
      v26 = (char *)malloc_type_malloc(v24 & 0x3FFFFFC, 0x43004D46uLL);
      if (!v26)
        goto LABEL_38;
      v10 += v25;
      if (v48 < v10)
        goto LABEL_36;
      v27 = v26;
      if (read(v47, v26 + 3, v25 - 3) != v25 - 3)
        goto LABEL_36;
      v28 = v18 - 24;
      *v27 = v23;
      v27[1] = v24 >> 10;
      v27[2] = v24 >> 18;
      v16[v28 >> 3] = v22;
      v29 = &v16[v28 >> 3];
      v29[1] = BYTE1(v22);
      v29[2] = BYTE2(v22);
      v16[(unint64_t)v18 >> 3] = (_BYTE)v27;
      v30 = (uint64x2_t)vdupq_n_s64((unint64_t)v27);
      v31 = (int16x8_t)vshlq_u64(v30, (uint64x2_t)xmmword_19C46E030);
      *(int32x2_t *)v30.i8 = vmovn_s64((int64x2_t)vshlq_u64(v30, (uint64x2_t)xmmword_19C46E040));
      *(int32x2_t *)v31.i8 = vmovn_s64((int64x2_t)v31);
      v31.i16[1] = v31.i16[2];
      v31.i16[2] = v30.i16[0];
      v31.i16[3] = v30.i16[2];
      v32 = &v16[v18 >> 3];
      *(_DWORD *)(v32 + 1) = vmovn_s16(v31).u32[0];
      v32[5] = BYTE5(v27);
      v32[6] = BYTE6(v27);
      v32[7] = HIBYTE(v27);
      v18 += 88;
      v17 += 24;
      --v8;
    }
    while (v8);
    v33 = sub_19C4273A4((uint64_t)v16, v43, v43, 0x40u, 0x40u, &v49);
    if (!v33)
      goto LABEL_38;
    a1 = v44;
    v34 = *v44;
    *(_BYTE *)(v34 + 7) = 64;
    *(_DWORD *)(v34 + 20) = v49;
    *(_QWORD *)(v34 + 24) = v33;
    free(v16);
    free(v46);
  }
  else
  {
    v10 = 24;
  }
  if (v48 >= v10 + 3 && read(v47, &v50, 3uLL) == 3)
  {
    v35 = v50;
    v36 = 4 * v50;
    v37 = (4 * v50) & 0x3FFFFFC;
    if (!v37)
      goto LABEL_36;
    v38 = (char *)malloc_type_malloc(v36 & 0x3FFFFFC, 0x7C0C55FAuLL);
    if (v38)
    {
      v39 = v38;
      if (read(v47, v38 + 3, (v37 - 3)) == v37 - 3)
      {
        v10 += v37;
        *v39 = v35;
        v39[1] = v36 >> 10;
        v39[2] = v36 >> 18;
        *(_QWORD *)(*a1 + 32) = v39;
        goto LABEL_34;
      }
LABEL_36:
      exception = (char *)__cxa_allocate_exception(0x20uLL);
      *(_QWORD *)exception = off_1E3D38838;
      strcpy(exception + 8, "Invalid dynamic data");
      v42 = 20;
      goto LABEL_37;
    }
LABEL_38:
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    *(_QWORD *)exception = off_1E3D38838;
    strcpy(exception + 8, "Unable to allocate");
    v42 = 18;
LABEL_37:
    exception[31] = v42;
    __cxa_throw(exception, (struct type_info *)&unk_1E3D32968, (void (*)(void *))sub_19C3123E4);
  }
LABEL_34:
  if (v48 != v10)
    goto LABEL_36;
  return a1;
}

uint64_t *sub_19C427B7C(uint64_t *a1)
{
  if (*a1)
  {
    sub_19C29A56C(a1);
    if (*a1)
      MEMORY[0x1A1AD355C](*a1, 0x1010C4006136809);
  }
  return a1;
}

_QWORD *sub_19C427BC8(_QWORD *result, int *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v6;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD *v12;
  unsigned int v13;
  unsigned int v14;
  _OWORD *v15;
  __int128 v16;
  unint64_t v17;
  int v18;

  v4 = *result;
  if (*result)
  {
    v6 = *(unsigned __int8 *)(v4 + 5);
    if (v6 >= a3)
    {
      v8 = *(unsigned __int8 *)(v4 + 6);
      if (a3)
      {
        v9 = *(_QWORD *)(v4 + 24);
        if (v9)
          v10 = *(_DWORD *)(v4 + 16) == 0;
        else
          v10 = 1;
        if (!v10)
        {
          v12 = result;
          v13 = *(unsigned __int8 *)(v4 + 7);
          v14 = *(_DWORD *)(v4 + 20);
          v17 = 0;
          if (!*(_QWORD *)(v4 + 40))
          {
            v15 = malloc_type_malloc(0x30uLL, 0x100004052888210uLL);
            *(_QWORD *)(v4 + 40) = v15;
            if (v15)
            {
              *(_QWORD *)&v16 = -1;
              *((_QWORD *)&v16 + 1) = -1;
              v15[1] = v16;
              v15[2] = v16;
              *v15 = v16;
            }
          }
          result = (_QWORD *)sub_19C42817C(v9, v14, v13, *(_DWORD **)(*v12 + 40), *a2, 0, &v17);
          if ((_DWORD)result)
            return (_QWORD *)sub_19C427D18(v17, v6, v8, (uint64_t)a2, a3, 0, v17 + ((6 * (unint64_t)v6 + 4) >> 3) + 3, 1, 0, 1u, a4);
        }
      }
      else
      {
        result = *(_QWORD **)(v4 + 32);
        if (result)
        {
          v18 = 0;
          return (_QWORD *)sub_19C427D18((uint64_t)result, 1u, v8, (uint64_t)&v18, 1u, 0, (uint64_t)result + 4, 1, 0, 1u, a4);
        }
      }
    }
  }
  return result;
}

uint64_t sub_19C427D18(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, int a8, unsigned int a9, unsigned int a10, uint64_t a11)
{
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  _DWORD *v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  __n128 v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  float v33;
  float v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  float v51;
  float v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unsigned int v67;
  int v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;

  if (a8 && a9 < a10)
  {
    v14 = *(_DWORD *)(a4 + 4 * a6);
    if (a6)
      v15 = 24;
    else
      v15 = 0;
    v16 = (((3 * a6) >> 2) & 0x1FFFFFFF) + result + 3;
    LODWORD(v16) = *(_DWORD *)(v16 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a6) & 6 | (8 * (v16 & 3)));
    v62 = 4 * v16;
    v17 = (4 * v16) & 0x1C;
    v67 = a6 + 1;
    v63 = result;
    if (a6 + 1 >= a2)
    {
      v23 = 0;
    }
    else
    {
      v18 = 6 * a6 + 3;
      v19 = (v18 >> 3) + result + 3;
      v20 = (_DWORD *)(v19 & 0xFFFFFFFFFFFFFFFCLL);
      v21 = v18 & 7 | (8 * (v19 & 3));
      v22 = *v20 >> v21;
      if (v21 >= 0x1E)
        v22 |= v20[1] << -(char)v21;
      v23 = 4 * (v22 & 7);
    }
    v71 = 0;
    v70 = 0;
    v24 = ((_BYTE)v17 + (_BYTE)v15 + (_BYTE)v23 + 7) & 0xF8;
    v69 = 0;
    result = sub_19C4283A8(a7, a9, a10, v24, v15, v17, v23, v14, 0, &v70, &v71, (unsigned int *)&v69, (unsigned int *)&v69 + 1);
    if ((_DWORD)result)
    {
      v26 = a3;
      v27 = a3 + 31;
      v68 = (a3 + 31) & 0xFFFFFFF8;
      v28 = a7 + ((v24 * a8) >> 3);
      if (v67 == a5)
      {
        v29 = v70;
        if (v70 < v71)
        {
          if ((_DWORD)a3)
          {
            v30 = 8 * v70 * (v27 >> 3);
            do
            {
              v35 = (v30 >> 3) + v28;
              v36 = v35 & 0xFFFFFFFFFFFFFFFCLL;
              v37 = 8 * (v35 & 3);
              v38 = *(_DWORD *)(v35 & 0xFFFFFFFFFFFFFFFCLL) >> v37;
              if (v37 + (unint64_t)a3 >= 0x21)
                v38 |= *(_DWORD *)(v36 + 4) << -(char)v37;
              v39 = ((v26 + v30) >> 3) + v28;
              v40 = v39 & 0xFFFFFFFFFFFFFFFCLL;
              v41 = a3 & 7 | (8 * (v39 & 3));
              v42 = *(_DWORD *)(v39 & 0xFFFFFFFFFFFFFFFCLL) >> v41;
              if (v41 >= 9)
                v42 |= *(_DWORD *)(v40 + 4) << -(char)v41;
              v31 = v38 & (0xFFFFFFFF >> -(char)a3);
              v32 = (v42 >> 22) & 3;
              v25.n128_f32[0] = (float)(v42 & 0x3FFFFF);
              v33 = v25.n128_f32[0] * 0.0078125;
              v34 = v25.n128_f32[0] * 0.000061035;
              if (!v32)
                v25.n128_f32[0] = v25.n128_f32[0] * 0.00000095367;
              if (v32 == 1)
                v25.n128_f32[0] = v34;
              if (v32 == 2)
                v25.n128_f32[0] = v33;
              result = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(a11 + 16))(a11, v31, v25);
              ++v29;
              v30 += v68;
              v26 = a3;
            }
            while (v29 < v71);
          }
          else
          {
            v49 = 8 * v70 * (v27 >> 3);
            do
            {
              v53 = (v49 >> 3) + v28;
              v54 = v53 & 0xFFFFFFFFFFFFFFFCLL;
              v55 = 8 * (v53 & 3);
              v56 = *(_DWORD *)(v53 & 0xFFFFFFFFFFFFFFFCLL) >> v55;
              if (v55 >= 9)
                v56 |= *(_DWORD *)(v54 + 4) << -(char)v55;
              v50 = (v56 >> 22) & 3;
              v25.n128_f32[0] = (float)(v56 & 0x3FFFFF);
              v51 = v25.n128_f32[0] * 0.00000095367;
              v52 = v25.n128_f32[0] * 0.000061035;
              if (v50 == 2)
                v25.n128_f32[0] = v25.n128_f32[0] * 0.0078125;
              if (v50 == 1)
                v25.n128_f32[0] = v52;
              if (!v50)
                v25.n128_f32[0] = v51;
              result = (*(uint64_t (**)(uint64_t, _QWORD, __n128))(a11 + 16))(a11, 0, v25);
              ++v29;
              v49 += v68;
            }
            while (v29 < v71);
          }
        }
      }
      else if (v69 < HIDWORD(v69))
      {
        v43 = v24 * (a8 - 1);
        if (v17)
        {
          v44 = ((v43 + v15) >> 3) + a7;
          v45 = v44 & 0xFFFFFFFFFFFFFFFCLL;
          v46 = 8 * (v44 & 3);
          v47 = *(_DWORD *)(v44 & 0xFFFFFFFFFFFFFFFCLL) >> v46;
          if (v46 + (unint64_t)v17 >= 0x21)
            v47 |= *(_DWORD *)(v45 + 4) << -(char)v46;
          v48 = v47 & (0xFFFFFFFF >> -(char)v17);
        }
        else
        {
          v48 = 0;
        }
        if (v23)
        {
          v57 = ((v43 + v17 + v15) >> 3) + a7;
          v58 = v57 & 0xFFFFFFFFFFFFFFFCLL;
          v59 = v62 & 4 | (8 * (v57 & 3));
          v60 = *(_DWORD *)(v57 & 0xFFFFFFFFFFFFFFFCLL) >> v59;
          if (v59 + (unint64_t)v23 >= 0x21)
            v60 |= *(_DWORD *)(v58 + 4) << -(char)v59;
          v61 = v60 & (0xFFFFFFFF >> -(char)v23);
        }
        else
        {
          v61 = 0;
        }
        return sub_19C427D18(v63, a2, a3, a4, a5, v67, v28 + ((v48 * v68) >> 3), v61, v69, a11);
      }
    }
  }
  return result;
}

uint64_t sub_19C42817C(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4, int a5, unsigned int *a6, unint64_t *a7)
{
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  __int128 v29;
  uint64_t v30;
  int v31;

  v7 = a3 + 24;
  if (a4)
  {
    if (*a4 == a5)
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (a4[2] == a5)
    {
      v8 = 3;
      goto LABEL_14;
    }
    if (a4[4] == a5)
    {
      v8 = 5;
      goto LABEL_14;
    }
    if (a4[6] == a5)
    {
      v8 = 7;
      goto LABEL_14;
    }
    if (a4[8] == a5)
    {
      v8 = 9;
      goto LABEL_14;
    }
    if (a4[10] == a5)
    {
      v8 = 11;
LABEL_14:
      v9 = a4[v8];
      if (v9 == -1 || !a3)
        return 0;
      v10 = v9 * v7;
      v11 = v10 & 7;
      v12 = ((v10 + 24) >> 3) + a1;
      v13 = v12 & 0xFFFFFFFFFFFFFFF8;
      v14 = v11 & 0xFFFFFFFFFFFFFFC7 | (8 * (v12 & 7));
      v15 = *(_QWORD *)(v12 & 0xFFFFFFFFFFFFFFF8) >> v14;
      if (v14 + a3 >= 0x41)
        v15 |= *(_QWORD *)(v13 + 8) << -(char)v14;
      v16 = v15 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3);
      if (!v16)
        return 0;
      if (a6)
        *a6 = v9;
      if (a7)
        *a7 = v16;
      return 1;
    }
  }
  v18 = -1640531573 * a5 % a2;
  if (a3)
  {
    v19 = -1640531573 * a5 % a2;
    while (1)
    {
      v20 = ((v19 * v7 + 24) >> 3) + a1;
      v21 = v20 & 0xFFFFFFFFFFFFFFF8;
      v22 = ((_BYTE)v19 * (_BYTE)v7) & 7 | (8 * (v20 & 7));
      v23 = *(_QWORD *)(v20 & 0xFFFFFFFFFFFFFFF8) >> v22;
      if (v22 + (unint64_t)a3 >= 0x41)
        v23 |= *(_QWORD *)(v21 + 8) << -(char)v22;
      v24 = v23 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3);
      if (!v24)
      {
        result = 0;
        v18 = v19;
        if (a4)
          goto LABEL_38;
        return result;
      }
      v25 = ((v19 * v7) >> 3) + a1;
      v26 = v25 & 0xFFFFFFFFFFFFFFFCLL;
      v27 = (v19 * v7) & 7 | (8 * (v25 & 3));
      v28 = *(_DWORD *)(v25 & 0xFFFFFFFFFFFFFFFCLL) >> v27;
      if (v27 >= 9)
        v28 |= *(_DWORD *)(v26 + 4) << -(char)v27;
      if ((v28 & 0xFFFFFF) == a5)
        break;
      if (v19 + 1 == a2)
        v19 = 0;
      else
        ++v19;
      if (v19 == v18)
        goto LABEL_37;
    }
    if (a6)
      *a6 = v19;
    if (a7)
      *a7 = v24;
    result = 1;
    v18 = v19;
    if (a4)
      goto LABEL_38;
  }
  else
  {
LABEL_37:
    result = 0;
    if (a4)
    {
LABEL_38:
      v29 = *((_OWORD *)a4 + 1);
      *(_OWORD *)(a4 + 2) = *(_OWORD *)a4;
      v30 = *((_QWORD *)a4 + 4);
      *(_OWORD *)(a4 + 6) = v29;
      *((_QWORD *)a4 + 5) = v30;
      if ((_DWORD)result)
        v31 = v18;
      else
        v31 = -1;
      *a4 = a5;
      a4[1] = v31;
    }
  }
  return result;
}

uint64_t sub_19C4283A8(uint64_t a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, _DWORD *a9, unsigned int *a10, unsigned int *a11, unsigned int *a12, unsigned int *a13)
{
  uint64_t result;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  _DWORD *v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  _DWORD *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  _DWORD *v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  _DWORD *v39;
  uint64_t v40;
  int v41;
  unsigned int v42;

  v42 = 0;
  if (a5)
  {
    result = sub_19C42861C(a1, a2, a3, a4, a5, a8, &v42);
    v21 = a10;
    v20 = a11;
    if (!a9)
      goto LABEL_4;
    goto LABEL_3;
  }
  result = 1;
  v21 = a10;
  v20 = a11;
  if (a9)
LABEL_3:
    *a9 = v42;
LABEL_4:
  if (a6)
  {
    if (v42)
    {
      v22 = a5 + (v42 - 1) * a4;
      v23 = (_DWORD *)(((v22 >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
      v24 = v22 & 7 | (8 * (((v22 >> 3) + (_BYTE)a1) & 3));
      v25 = *v23 >> v24;
      if (v24 + (unint64_t)a6 >= 0x21)
        v25 |= v23[1] << -(char)v24;
      v26 = v25 & (0xFFFFFFFF >> -(char)a6);
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;
    if (v42 < a3)
    {
      v28 = a5 + v42 * a4;
      v29 = (_DWORD *)(((v28 >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
      v30 = v28 & 7 | (8 * (((v28 >> 3) + (_BYTE)a1) & 3));
      v31 = *v29 >> v30;
      if (v30 + (unint64_t)a6 >= 0x21)
        v31 |= v29[1] << -(char)v30;
      v27 = v31 & (0xFFFFFFFF >> -(char)a6);
    }
    if (v21)
      *v21 = v26;
    if (v20)
      goto LABEL_23;
  }
  else
  {
    if (v21)
      *v21 = 0;
    if (v20)
    {
      v27 = 0;
LABEL_23:
      *v20 = v27;
    }
  }
  if (a7)
  {
    if (v42)
    {
      v32 = a6 + a5 + (v42 - 1) * a4;
      v33 = (_DWORD *)(((v32 >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
      v34 = v32 & 7 | (8 * (((v32 >> 3) + (_BYTE)a1) & 3));
      v35 = *v33 >> v34;
      if (v34 + (unint64_t)a7 >= 0x21)
        v35 |= v33[1] << -(char)v34;
      v36 = v35 & (0xFFFFFFFF >> -(char)a7);
    }
    else
    {
      v36 = 0;
    }
    v37 = v36;
    if (v42 < a3)
    {
      v38 = a6 + a5 + v42 * a4;
      v39 = (_DWORD *)(((v38 >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
      v40 = v38 & 7 | (8 * (((v38 >> 3) + (_BYTE)a1) & 3));
      v41 = *v39 >> v40;
      if (v40 + (unint64_t)a7 >= 0x21)
        v41 |= v39[1] << -(char)v40;
      v37 = v41 & (0xFFFFFFFF >> -(char)a7);
    }
    if (a12)
      *a12 = v36;
    if (a13)
      goto LABEL_41;
  }
  else
  {
    if (a12)
      *a12 = 0;
    if (a13)
    {
      v37 = 0;
LABEL_41:
      *a13 = v37;
    }
  }
  return result;
}

uint64_t sub_19C42861C(uint64_t a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, unsigned int *a7)
{
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t result;
  _DWORD *v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  unsigned int v24;

  if (a3 <= a2)
    goto LABEL_34;
  v7 = a3 - 1;
  if (!a5)
  {
    v15 = 0;
    if (!a6)
    {
      v24 = a2;
      goto LABEL_31;
    }
LABEL_9:
    result = 0;
    a2 = a3;
    if (!a7)
      return result;
LABEL_35:
    *a7 = a2;
    return result;
  }
  v8 = ((a4 * a2) >> 3) + a1;
  v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
  v10 = (a4 * a2) & 7 | (8 * (v8 & 3));
  v11 = *(_DWORD *)(v8 & 0xFFFFFFFFFFFFFFFCLL) >> v10;
  if (v10 + (unint64_t)a5 >= 0x21)
    v11 |= *(_DWORD *)(v9 + 4) << -(char)v10;
  v12 = 0xFFFFFFFF >> -(char)a5;
  v13 = v11 & v12;
  if (v13 > a6)
  {
LABEL_34:
    result = 0;
    if (!a7)
      return result;
    goto LABEL_35;
  }
  if (v13 == a6)
  {
    v14 = a2;
    goto LABEL_32;
  }
  v17 = (_DWORD *)((((v7 * a4) >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
  v18 = (v7 * a4) & 7 | (8 * ((((v7 * a4) >> 3) + a1) & 3));
  v19 = *v17 >> v18;
  if (v18 + (unint64_t)a5 >= 0x21)
    v19 |= v17[1] << -(char)v18;
  v15 = v19 & v12;
  if (v15 < a6)
    goto LABEL_9;
  if (v15 == a6)
    v20 = a3 - 1;
  else
    v20 = a2;
  if (v20 + 1 >= v7)
  {
    a2 = a3 - 1;
    v24 = a3 - 1;
  }
  else
  {
    do
    {
      v14 = (v7 + v20) >> 1;
      v21 = (_DWORD *)((((v14 * a4) >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
      v22 = (v14 * a4) & 7 | (8 * ((((v14 * a4) >> 3) + (_BYTE)a1) & 3));
      v23 = *v21 >> v22;
      if (v22 + (unint64_t)a5 >= 0x21)
        v23 |= v21[1] << -(char)v22;
      v15 = v23 & (0xFFFFFFFF >> -(char)a5);
      if (v15 > a6)
      {
        v7 = (v7 + v20) >> 1;
      }
      else
      {
        if (v15 == a6)
          goto LABEL_32;
        if (v15 < a6)
          v20 = (v7 + v20) >> 1;
      }
    }
    while (v20 + 1 < v7);
    a2 = v7;
    v24 = v14;
  }
LABEL_31:
  v14 = v24;
  if (v15 != a6)
    goto LABEL_34;
LABEL_32:
  result = 1;
  a2 = v14;
  if (a7)
    goto LABEL_35;
  return result;
}

void sub_19C428814(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8, unsigned int a9, unsigned int a10, int a11, uint64_t a12, float *a13, float *a14)
{
  unsigned int v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  int v32;
  unsigned int v33;
  int v34;
  __n128 v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unsigned int v48;
  int v49;
  float v50;
  float v51;
  float v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unsigned int v64;
  int v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  unsigned int v77;
  _DWORD v78[3];

  if (a8 && a9 < a10)
  {
    v22 = *(_DWORD *)(a4 + 4 * a6);
    v23 = a6 ? 24 : 0;
    v24 = 6 * a6;
    v25 = (((3 * a6) >> 2) & 0x1FFFFFFF) + a1 + 3;
    v26 = (4 * (*(_DWORD *)(v25 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a6) & 6 | (8 * (v25 & 3))))) & 0x1C;
    v27 = a6 + 1;
    v73 = a8;
    if (a6 + 1 >= a2)
    {
      v33 = 0;
    }
    else
    {
      v28 = v24 + 3;
      v29 = (v28 >> 3) + a1 + 3;
      v30 = (_DWORD *)(v29 & 0xFFFFFFFFFFFFFFFCLL);
      v31 = v28 & 7 | (8 * (v29 & 3));
      v32 = *v30 >> v31;
      if (v31 >= 0x1E)
        v32 |= v30[1] << -(char)v31;
      v33 = 4 * (v32 & 7);
    }
    v76 = 0;
    v34 = ((_BYTE)v26 + (_BYTE)v23 + (_BYTE)v33 + 7) & 0xF8;
    v75 = 0;
    v74 = 0;
    if (sub_19C4283A8(a7, a9, a10, v34, v23, v26, v33, v22, 0, (unsigned int *)&v76, (unsigned int *)&v76 + 1, &v74, &v75))
    {
      v71 = a1;
      v72 = a4;
      v70 = a3 + 31;
      v36 = (a3 + 31) & 0xFFFFFFF8;
      v37 = a7 + ((v34 * v73) >> 3);
      if (a6 + 2 == a5)
      {
        if (a14)
        {
          v38 = v76;
          if (v76 < HIDWORD(v76))
          {
            v39 = 8 * v76 * (v70 >> 3);
            while (1)
            {
              if ((_DWORD)a3)
              {
                v40 = (v39 >> 3) + v37;
                v41 = v40 & 0xFFFFFFFFFFFFFFFCLL;
                v42 = 8 * (v40 & 3);
                v43 = *(_DWORD *)(v40 & 0xFFFFFFFFFFFFFFFCLL) >> v42;
                if (v42 + (unint64_t)a3 >= 0x21)
                  v43 |= *(_DWORD *)(v41 + 4) << -(char)v42;
                v44 = v43 & (0xFFFFFFFF >> -(char)a3);
              }
              else
              {
                v44 = 0;
              }
              v45 = ((a3 + v39) >> 3) + v37;
              v46 = v45 & 0xFFFFFFFFFFFFFFFCLL;
              v47 = a3 & 7 | (8 * (v45 & 3));
              v48 = *(_DWORD *)(v45 & 0xFFFFFFFFFFFFFFFCLL) >> v47;
              if (v47 >= 9)
                v48 |= *(_DWORD *)(v46 + 4) << -(char)v47;
              v49 = (v48 >> 22) & 3;
              v35.n128_f32[0] = (float)(v48 & 0x3FFFFF);
              v50 = v35.n128_f32[0] * 0.0078125;
              v51 = v35.n128_f32[0] * 0.000061035;
              if (!v49)
                v35.n128_f32[0] = v35.n128_f32[0] * 0.00000095367;
              if (v49 == 1)
                v35.n128_f32[0] = v51;
              v52 = v49 == 2 ? v50 : v35.n128_f32[0];
              v77 = v44;
              v78[0] = a11;
              v53 = *(_QWORD *)(a12 + 24);
              if (!v53)
                break;
              *a14 = *a14
                   + (float)((*(float (**)(uint64_t, _DWORD *, unsigned int *, __n128))(*(_QWORD *)v53 + 48))(v53, v78, &v77, v35)* v52);
              ++v38;
              v39 += v36;
              if (v38 >= HIDWORD(v76))
                goto LABEL_32;
            }
LABEL_56:
            sub_19C2CCC60();
          }
        }
      }
LABEL_32:
      if (v27 == a5)
      {
        if (a13)
        {
          v54 = v76;
          if (v76 < HIDWORD(v76))
          {
            v55 = 8 * v76 * (v70 >> 3);
            while (1)
            {
              if ((_DWORD)a3)
              {
                v56 = (v55 >> 3) + v37;
                v57 = v56 & 0xFFFFFFFFFFFFFFFCLL;
                v58 = 8 * (v56 & 3);
                v59 = *(_DWORD *)(v56 & 0xFFFFFFFFFFFFFFFCLL) >> v58;
                if (v58 + (unint64_t)a3 >= 0x21)
                  v59 |= *(_DWORD *)(v57 + 4) << -(char)v58;
                v60 = v59 & (0xFFFFFFFF >> -(char)a3);
              }
              else
              {
                v60 = 0;
              }
              v61 = ((a3 + v55) >> 3) + v37;
              v62 = v61 & 0xFFFFFFFFFFFFFFFCLL;
              v63 = a3 & 7 | (8 * (v61 & 3));
              v64 = *(_DWORD *)(v61 & 0xFFFFFFFFFFFFFFFCLL) >> v63;
              if (v63 >= 9)
                v64 |= *(_DWORD *)(v62 + 4) << -(char)v63;
              v65 = (v64 >> 22) & 3;
              v35.n128_f32[0] = (float)(v64 & 0x3FFFFF);
              v66 = v35.n128_f32[0] * 0.0078125;
              v67 = v35.n128_f32[0] * 0.000061035;
              if (!v65)
                v35.n128_f32[0] = v35.n128_f32[0] * 0.00000095367;
              if (v65 == 1)
                v35.n128_f32[0] = v67;
              v68 = v65 == 2 ? v66 : v35.n128_f32[0];
              v77 = v60;
              v78[0] = a11;
              v69 = *(_QWORD *)(a12 + 24);
              if (!v69)
                break;
              *a13 = *a13
                   + (float)((*(float (**)(uint64_t, _DWORD *, unsigned int *, __n128))(*(_QWORD *)v69 + 48))(v69, v78, &v77, v35)* v68);
              ++v54;
              v55 += v36;
              if (v54 >= HIDWORD(v76))
                return;
            }
            goto LABEL_56;
          }
        }
      }
      else if (v74 < v75)
      {
        sub_19C428814(v71, a2, a3, v72);
      }
    }
  }
}

_QWORD *sub_19C428D94(_QWORD *result, int *a2, unsigned int a3, uint64_t a4, __n128 a5)
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  BOOL v14;
  _QWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __n128 v18;
  BOOL v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  unint64_t v31;
  unsigned int v32;

  v5 = *result;
  if (*result)
  {
    v7 = *(unsigned __int8 *)(v5 + 5);
    if (a3 + 1 <= v7)
    {
      v10 = *(unsigned __int8 *)(v5 + 7);
      v30 = *(unsigned __int8 *)(v5 + 6);
      v11 = *(_DWORD *)(v5 + 16);
      v12 = *(_DWORD *)(v5 + 20);
      v32 = 0;
      v13 = *(_QWORD *)(v5 + 24);
      if (a3)
      {
        if (v13)
          v14 = v11 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          v15 = result;
          v31 = 0;
          if (!*(_QWORD *)(v5 + 40))
          {
            v16 = malloc_type_malloc(0x30uLL, 0x100004052888210uLL);
            *(_QWORD *)(v5 + 40) = v16;
            if (v16)
            {
              *(_QWORD *)&v17 = -1;
              *((_QWORD *)&v17 + 1) = -1;
              v16[1] = v17;
              v16[2] = v17;
              *v16 = v17;
            }
          }
          result = (_QWORD *)sub_19C42817C(v13, v12, v10, *(_DWORD **)(*v15 + 40), *a2, &v32, &v31);
          if ((_DWORD)result)
            return (_QWORD *)sub_19C428FC4(v31, v7, v30, *a2, (uint64_t)a2, a3, 0, v31 + ((6 * (unint64_t)v7 + 4) >> 3) + 3, v18, 1, 0, 1u, a4);
        }
      }
      else
      {
        if (v12)
          v19 = (_DWORD)v10 == 0;
        else
          v19 = 1;
        if (!v19)
        {
          v20 = 0;
          v21 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v10;
          do
          {
            v22 = ((v20 + 24) >> 3) + v13;
            v23 = v22 & 0xFFFFFFFFFFFFFFF8;
            v24 = v20 & 7 | (8 * (v22 & 7));
            v25 = *(_QWORD *)(v22 & 0xFFFFFFFFFFFFFFF8) >> v24;
            if ((unint64_t)(v24 + v10) >= 0x41)
              v25 |= *(_QWORD *)(v23 + 8) << -(char)v24;
            result = (_QWORD *)(v25 & v21);
            if ((v25 & v21) != 0)
            {
              v26 = (v20 >> 3) + v13;
              v27 = v26 & 0xFFFFFFFFFFFFFFFCLL;
              v28 = v20 & 7 | (8 * (v26 & 3));
              v29 = *(_DWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL) >> v28;
              if (v28 >= 9)
                v29 |= *(_DWORD *)(v27 + 4) << -(char)v28;
              result = (_QWORD *)sub_19C428FC4((uint64_t)result, v7, v30, v29 & 0xFFFFFF, (uint64_t)a2, 0, 0, (uint64_t)result + ((6 * (unint64_t)v7 + 4) >> 3) + 3, a5, 1, 0, 1u, a4);
            }
            v20 += v10 + 24;
            --v12;
          }
          while (v12);
        }
      }
    }
  }
  return result;
}

uint64_t sub_19C428FC4(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8, __n128 a9, int a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  unsigned int v14;
  BOOL v15;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  float v65;
  float v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  float v77;
  float v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unsigned int v82;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  int v98;
  uint64_t v99;
  int v100;
  int v101;
  float v102;
  float v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unsigned int v107;
  unsigned int v108;
  int v109;
  float v110;
  float v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  uint64_t v118;
  unsigned int v119;
  uint64_t v120;
  unsigned int v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  unsigned int v125;
  unsigned int v126;
  uint64_t v127;
  unsigned int v128;
  unsigned int v129;

  v14 = a11;
  if (a10)
    v15 = a11 >= a12;
  else
    v15 = 1;
  if (!v15)
  {
    if (a7 >= a6)
      v19 = 0;
    else
      v19 = *(_DWORD *)(a5 + 4 * a7);
    if (a7)
      v20 = 24;
    else
      v20 = 0;
    v21 = (((3 * a7) >> 2) & 0x1FFFFFFF) + result + 3;
    v22 = 4 * (*(_DWORD *)(v21 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a7) & 6 | (8 * (v21 & 3))));
    v23 = v22 & 0x1C;
    v24 = a7 + 1;
    if (a7 + 1 >= a2)
    {
      v30 = 0;
    }
    else
    {
      v25 = 6 * a7 + 3;
      v26 = (v25 >> 3) + result + 3;
      v27 = (_DWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL);
      v28 = v25 & 7 | (8 * (v26 & 3));
      v29 = *v27 >> v28;
      if (v28 >= 0x1E)
        v29 |= v27[1] << -(char)v28;
      v30 = 4 * (v29 & 7);
    }
    v31 = v23 + v20;
    v32 = ((_BYTE)v23 + (_BYTE)v20 + (_BYTE)v30 + 7) & 0xF8;
    v33 = a3 + 31;
    v34 = v32 * (a10 - 1);
    if ((v22 & 0x1C) != 0)
    {
      v35 = ((v34 + v20) >> 3) + a8;
      v36 = v35 & 0xFFFFFFFFFFFFFFFCLL;
      v37 = 8 * (v35 & 3);
      v38 = *(_DWORD *)(v35 & 0xFFFFFFFFFFFFFFFCLL) >> v37;
      if (v37 + (unint64_t)(v22 & 0x1C) >= 0x21)
        v38 |= *(_DWORD *)(v36 + 4) << -(char)v37;
      v39 = v38 & (0xFFFFFFFF >> -(char)v23);
    }
    else
    {
      v39 = 0;
    }
    v40 = v33 & 0xFFFFFFF8;
    v129 = 0;
    v128 = 0;
    v127 = 0;
    v41 = a8 + ((v32 * a10) >> 3);
    v124 = a8;
    if (a7 == a6)
    {
      if (a7)
      {
        v122 = 0xFFFFFFFF >> -(v22 & 0x1C);
        v42 = 0xFFFFFFFF >> -(char)a3;
        v43 = a3 & 7;
        v116 = v33 & 0xFFFFFFF8;
        v117 = ((_BYTE)v23 + (_BYTE)v20 + (_BYTE)v30 + 7) & 0xF8;
        v44 = a3;
        v45 = a3;
        v119 = v20;
        v118 = v22 & 0x1C;
        while (1)
        {
          v46 = ((v14 * v32) >> 3) + v124;
          v47 = v46 & 0xFFFFFFFFFFFFFFFCLL;
          v48 = 8 * (v46 & 3);
          v49 = *(_DWORD *)(v46 & 0xFFFFFFFFFFFFFFFCLL) >> v48;
          if (v48 >= 9)
            v49 |= *(_DWORD *)(v47 + 4) << -(char)v48;
          if ((_DWORD)v23)
          {
            v50 = ((v14 * v32 + v20) >> 3) + v124;
            v51 = v50 & 0xFFFFFFFFFFFFFFFCLL;
            v52 = 8 * (v50 & 3);
            v53 = *(_DWORD *)(v50 & 0xFFFFFFFFFFFFFFFCLL) >> v52;
            if ((unint64_t)(v52 + v23) >= 0x21)
              v53 |= *(_DWORD *)(v51 + 4) << -(char)v52;
            v54 = v53 & v122;
            v125 = v14;
            if (!v14)
              goto LABEL_38;
          }
          else
          {
            v54 = 0;
            v125 = v14;
            if (!v14)
              goto LABEL_38;
          }
          if ((_DWORD)v23)
          {
            v55 = ((v20 + (v14 - 1) * v32) >> 3) + v124;
            v56 = v55 & 0xFFFFFFFFFFFFFFFCLL;
            v57 = 8 * (v55 & 3);
            v58 = *(_DWORD *)(v55 & 0xFFFFFFFFFFFFFFFCLL) >> v57;
            if ((unint64_t)(v57 + v23) >= 0x21)
              v58 |= *(_DWORD *)(v56 + 4) << -(char)v57;
            v59 = v58 & v122;
            v60 = v54 - v59;
            if (v54 <= v59)
              goto LABEL_24;
LABEL_39:
            v61 = v49 & 0xFFFFFF;
            if (v44)
            {
              v62 = v116 * v59;
              do
              {
                v67 = (v62 >> 3) + v41;
                v68 = v67 & 0xFFFFFFFFFFFFFFFCLL;
                v69 = 8 * (v67 & 3);
                v70 = *(_DWORD *)(v67 & 0xFFFFFFFFFFFFFFFCLL) >> v69;
                if ((unint64_t)(v69 + v45) >= 0x21)
                  v70 |= *(_DWORD *)(v68 + 4) << -(char)v69;
                v71 = ((v44 + v62) >> 3) + v41;
                v72 = v71 & 0xFFFFFFFFFFFFFFFCLL;
                v73 = v43 & 0xFFFFFFFFFFFFFFE7 | (8 * (v71 & 3));
                v74 = *(_DWORD *)(v71 & 0xFFFFFFFFFFFFFFFCLL) >> v73;
                if (v73 >= 9)
                  v74 |= *(_DWORD *)(v72 + 4) << -(char)v73;
                v63 = v70 & v42;
                v64 = (v74 >> 22) & 3;
                a9.n128_f32[0] = (float)(v74 & 0x3FFFFF);
                v65 = a9.n128_f32[0] * 0.0078125;
                v66 = a9.n128_f32[0] * 0.000061035;
                if (!v64)
                  a9.n128_f32[0] = a9.n128_f32[0] * 0.00000095367;
                if (v64 == 1)
                  a9.n128_f32[0] = v66;
                if (v64 == 2)
                  a9.n128_f32[0] = v65;
                result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a13 + 16))(a13, v61, v63, a9);
                v62 += v40;
                --v60;
              }
              while (v60);
            }
            else
            {
              v75 = v116 * v59;
              do
              {
                v79 = (v75 >> 3) + v41;
                v80 = v79 & 0xFFFFFFFFFFFFFFFCLL;
                v81 = v43 & 0xFFFFFFFFFFFFFFE7 | (8 * (v79 & 3));
                v82 = *(_DWORD *)(v79 & 0xFFFFFFFFFFFFFFFCLL) >> v81;
                if (v81 >= 9)
                  v82 |= *(_DWORD *)(v80 + 4) << -(char)v81;
                v76 = (v82 >> 22) & 3;
                a9.n128_f32[0] = (float)(v82 & 0x3FFFFF);
                v77 = a9.n128_f32[0] * 0.00000095367;
                v78 = a9.n128_f32[0] * 0.000061035;
                if (v76 == 2)
                  a9.n128_f32[0] = a9.n128_f32[0] * 0.0078125;
                if (v76 == 1)
                  a9.n128_f32[0] = v78;
                if (!v76)
                  a9.n128_f32[0] = v77;
                result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, __n128))(a13 + 16))(a13, v61, 0, a9);
                v75 += v40;
                --v60;
              }
              while (v60);
            }
            goto LABEL_24;
          }
LABEL_38:
          v59 = 0;
          v60 = v54;
          if (v54)
            goto LABEL_39;
LABEL_24:
          v14 = v125 + 1;
          v20 = v119;
          v23 = v118;
          v32 = v117;
          if (v125 + 1 == a12)
            return result;
        }
      }
      if (v39)
      {
        v98 = a3;
        v99 = a3 & 7;
        if ((_DWORD)a3)
        {
          v100 = 0;
          do
          {
            v104 = ((v98 + v100) >> 3) + v41;
            v105 = v104 & 0xFFFFFFFFFFFFFFFCLL;
            v106 = v99 & 0xFFFFFFFFFFFFFFE7 | (8 * (v104 & 3));
            v107 = *(_DWORD *)(v104 & 0xFFFFFFFFFFFFFFFCLL) >> v106;
            if (v106 >= 9)
              v107 |= *(_DWORD *)(v105 + 4) << -(char)v106;
            v101 = (v107 >> 22) & 3;
            a9.n128_f32[0] = (float)(v107 & 0x3FFFFF);
            v102 = a9.n128_f32[0] * 0.0078125;
            v103 = a9.n128_f32[0] * 0.000061035;
            if (!v101)
              a9.n128_f32[0] = a9.n128_f32[0] * 0.00000095367;
            if (v101 == 1)
              a9.n128_f32[0] = v103;
            if (v101 == 2)
              a9.n128_f32[0] = v102;
            result = (*(uint64_t (**)(uint64_t, __n128))(a13 + 16))(a13, a9);
            v100 += v40;
            --v39;
          }
          while (v39);
        }
        else
        {
          v108 = 0;
          do
          {
            v112 = (v108 >> 3) + v41;
            v113 = v112 & 0xFFFFFFFFFFFFFFFCLL;
            v114 = v99 & 0xFFFFFFFFFFFFFFE7 | (8 * (v112 & 3));
            v115 = *(_DWORD *)(v112 & 0xFFFFFFFFFFFFFFFCLL) >> v114;
            if (v114 >= 9)
              v115 |= *(_DWORD *)(v113 + 4) << -(char)v114;
            v109 = (v115 >> 22) & 3;
            a9.n128_f32[0] = (float)(v115 & 0x3FFFFF);
            v110 = a9.n128_f32[0] * 0.00000095367;
            v111 = a9.n128_f32[0] * 0.000061035;
            if (v109 == 2)
              a9.n128_f32[0] = a9.n128_f32[0] * 0.0078125;
            if (v109 == 1)
              a9.n128_f32[0] = v111;
            if (!v109)
              a9.n128_f32[0] = v110;
            result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, __n128))(a13 + 16))(a13, a4, 0, a9);
            v108 += v40;
            --v39;
          }
          while (v39);
        }
      }
    }
    else
    {
      v120 = result;
      v121 = a2;
      v123 = a5;
      v126 = a6;
      result = sub_19C4283A8(a8, a11, a12, ((v22 & 0x1C) + v20 + v30 + 7) & 0xF8, v20, v23, v30, v19, 0, &v128, &v129, (unsigned int *)&v127, (unsigned int *)&v127 + 1);
      if ((_DWORD)result && v127 < HIDWORD(v127))
      {
        if (v30)
        {
          v85 = ((v34 + v31) >> 3) + v124;
          v86 = v85 & 0xFFFFFFFFFFFFFFFCLL;
          v87 = v22 & 4 | (8 * (v85 & 3));
          v88 = *(_DWORD *)(v85 & 0xFFFFFFFFFFFFFFFCLL) >> v87;
          v89 = a3;
          v90 = a4;
          v91 = v126;
          v92 = v120;
          v93 = v24;
          if (v87 + (unint64_t)v30 >= 0x21)
            v88 |= *(_DWORD *)(v86 + 4) << -(char)v87;
          v94 = v88 & (0xFFFFFFFF >> -(char)v30);
          v95 = v123;
          v96 = v121;
        }
        else
        {
          v94 = 0;
          v89 = a3;
          v90 = a4;
          v91 = v126;
          v95 = v123;
          v96 = v121;
          v92 = v120;
          v93 = v24;
        }
        return sub_19C428FC4(v92, v96, v89, v90, v95, v91, v93, v41 + ((v39 * v40) >> 3), __PAIR64__(v127, v94), HIDWORD(v127), a13);
      }
    }
  }
  return result;
}

void sub_19C429718(uint64_t a1, unsigned int *a2, uint64_t a3, unsigned int a4, float a5)
{
  unsigned int v7;
  unint64_t v9;
  unsigned int v13;
  _BOOL4 v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  _OWORD *v18;
  __int128 v19;
  _BOOL4 v20;
  _BYTE *v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  int v37;
  char v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  unint64_t v47;
  unsigned int v48;
  unint64_t v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  unint64_t v55;
  BOOL v56;
  unsigned int v57;
  unsigned int v58;
  unint64_t v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  char *v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  int v75;
  int v76;
  unint64_t v77;
  int v78;
  int v79;
  char *v80;
  _BOOL4 v81;
  int v82;
  unsigned int v83;
  unint64_t v84;

  if (!a1)
    return;
  v7 = *(unsigned __int8 *)(a1 + 5);
  if (v7 < a3)
    return;
  v9 = *(unsigned __int8 *)(a1 + 6);
  if (v9 <= 0x3F && a4 >> v9 != 0)
    return;
  if (a5 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    v13 = *(_DWORD *)(a1 + 8);
    if (v13)
      v14 = *(_DWORD *)(a1 + 12) < v13;
    else
      v14 = 1;
  }
  v15 = *(unsigned __int8 *)(a1 + 7);
  v16 = *(_DWORD *)(a1 + 20);
  v82 = *(_DWORD *)(a1 + 16);
  v17 = *(char **)(a1 + 24);
  v18 = *(_OWORD **)(a1 + 40);
  if (v18)
  {
    *(_QWORD *)&v19 = -1;
    *((_QWORD *)&v19 + 1) = -1;
    v18[1] = v19;
    v18[2] = v19;
    *v18 = v19;
  }
  if (*(_QWORD *)(a1 + 32))
    v20 = 0;
  else
    v20 = v14;
  if (v20)
  {
    v21 = malloc_type_calloc(0x20uLL, 1uLL, 0xF8076CD9uLL);
    *(_QWORD *)(a1 + 32) = v21;
    *(_WORD *)v21 = 8;
    v21[2] = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 3) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 3) & 0xF8 | 1;
    *(_DWORD *)(a1 + 12) += 8;
  }
  v81 = v14;
  if (!(_DWORD)a3)
  {
    v39 = *(_QWORD *)(a1 + 32);
    if (!v39)
      return;
    v84 = *(_QWORD *)(a1 + 32);
    v40 = (sub_19C426CE8(v39, 1u, v9, 0, v39 + 4, 1u) - v39 + 3) & 0xFFFFFFFC;
    v83 = 0;
    sub_19C429F10(v39, 1u, v9, (uint64_t)&v83, 1, a4, 0, v39 + 4, a5, 1u, 0, 1u, v14, 0, &v84);
    v41 = v84;
    *(_QWORD *)(a1 + 32) = v84;
    v42 = (sub_19C426CE8(v41, 1u, v9, 0, v41 + 4, 1u) - v41 + 3) & 0xFFFFFFFC;
    v43 = *(_DWORD *)(a1 + 12) - v40;
    goto LABEL_99;
  }
  v22 = 0;
  if (v17 && v82)
  {
    if ((_DWORD)v15)
    {
      v23 = v15 + 24;
      v24 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v15;
      v25 = -1640531573 * *a2 % v16;
      while (1)
      {
        v26 = (unint64_t)&v17[(v25 * v23 + 24) >> 3];
        v27 = v26 & 0xFFFFFFFFFFFFFFF8;
        v28 = ((_BYTE)v25 * (_BYTE)v23) & 7 | (8 * (v26 & 7));
        v29 = *(_QWORD *)(v26 & 0xFFFFFFFFFFFFFFF8) >> v28;
        if ((unint64_t)(v28 + v15) >= 0x41)
          v29 |= *(_QWORD *)(v27 + 8) << -(char)v28;
        v22 = v29 & v24;
        if ((v29 & v24) == 0)
          break;
        v30 = (unint64_t)&v17[(v25 * v23) >> 3];
        v31 = v30 & 0xFFFFFFFFFFFFFFFCLL;
        v32 = (v25 * v23) & 7 | (8 * (v30 & 3));
        v33 = *(_DWORD *)(v30 & 0xFFFFFFFFFFFFFFFCLL) >> v32;
        if (v32 >= 9)
          v33 |= *(_DWORD *)(v31 + 4) << -(char)v32;
        if ((v33 & 0xFFFFFF) == *a2)
          break;
        if (v25 + 1 == v16)
          v25 = 0;
        else
          ++v25;
        if (v25 == -1640531573 * *a2 % v16)
          goto LABEL_35;
      }
    }
    else
    {
LABEL_35:
      v22 = 0;
    }
  }
  if ((_DWORD)a3 == 1 && !v22)
  {
    if (!v81)
      return;
    v22 = (unint64_t)malloc_type_calloc(0x20uLL, 1uLL, 0x7115445CuLL);
    v34 = 0;
    *(_WORD *)v22 = 8;
    *(_BYTE *)(v22 + 2) = 0;
    v35 = v22 + 3;
    v36 = v7;
    do
    {
      v37 = v34 & 6;
      if (v37 == 6)
        v38 = 3;
      else
        v38 = 7;
      *(_BYTE *)(v35 + (v34 >> 3)) = *(_BYTE *)(v35 + (v34 >> 3)) & ~(v38 << v37) | (1 << v37);
      if (v37 == 6)
        *(_BYTE *)(v35 + (v34 >> 3) + 1) &= ~1u;
      v34 += 6;
      --v36;
    }
    while (v36);
    if (v7 >= 2)
    {
      v44 = 0;
      v45 = 3;
      v46 = 1;
      do
      {
        v47 = (6 * v44 + 3);
        v44 = v46;
        v48 = v47 & 7;
        v49 = v47 >> 3;
        v50 = 8 - v48;
        if (v48 <= 5)
          v50 = 3;
        *(_BYTE *)(v35 + v49) = *(_BYTE *)(v35 + v49) & ~(0xFFu >> (8 - v50) << v48) | (((0xFFu >> (8 - v50)) & 1) << v48);
        if (v50 != 3)
        {
          v51 = (v45 >> 3) + 1;
          v52 = 3 - v50;
          do
          {
            if (v52 >= 8)
              v53 = 8;
            else
              v53 = v52;
            *(_BYTE *)(v35 + v51) = (-256 >> (8 - v53)) & *(_BYTE *)(v35 + v51) | (0xFFu >> (8 - v53)) & (1u >> (3 - v52));
            ++v51;
            v52 -= v53;
          }
          while (v52);
        }
        v46 = v44 + 1;
        v45 += 6;
      }
      while (v44 + 1 != v7);
    }
    v78 = v82 + 1;
    if (5 * v16 < 8 * (v82 + 1) || v15 <= 0x3F && v22 >> v15)
    {
      v54 = 0;
      LODWORD(v84) = 0;
      v55 = v22;
      do
      {
        ++v54;
        v56 = v55 > 1;
        v55 >>= 1;
      }
      while (v56);
      if (v54 <= v15)
        v57 = v15;
      else
        v57 = v54;
      if (v17)
      {
        v58 = v15;
        LODWORD(v15) = v57;
        v80 = (char *)sub_19C4273A4((uint64_t)v17, v82, v16, v58, v57, (unsigned int *)&v84);
        free(v17);
        v16 = v84;
        v17 = v80;
      }
      else
      {
        LODWORD(v15) = v57;
        v17 = (char *)malloc_type_calloc((((32 * v57 + 775) >> 3) & 0x1FFFFFF8) + 8, 1uLL, 0x4E18D228uLL);
        v16 = 32 * (v17 != 0);
      }
      *(_QWORD *)(a1 + 24) = v17;
      *(_BYTE *)(a1 + 7) = v15;
      *(_DWORD *)(a1 + 20) = v16;
    }
    if (v17)
    {
      sub_19C42751C((uint64_t)v17, v16, v15, *a2, v22);
      *(_DWORD *)(a1 + 12) += (((unsigned __int16)((6 * v7 + 4) >> 3) + 7) & 0x3FC)
                            - ((3 * v82) & 0x1FFFFFFF)
                            + ((3 * v78) & 0x1FFFFFFF);
      *(_DWORD *)(a1 + 16) = v78;
      ++v82;
    }
  }
  if (v22)
  {
    v84 = v22;
    v77 = ((6 * (unint64_t)v7 + 4) >> 3) + 3;
    v79 = (sub_19C426CE8(v22, v7, v9, 0, v22 + v77, 1u) - v22 + 3) & 0xFFFFFFFC;
    sub_19C429F10(v22, v7, v9, (uint64_t)a2, a3, a4, 0, v22 + v77, a5, 1u, 0, 1u, v81, 0, &v84);
    if (v17)
    {
      v59 = v84;
      if (v84 != v22)
      {
        v60 = v15;
        v61 = v15;
        if (v15 > 0x3F)
        {
          v62 = v16;
        }
        else
        {
          v62 = v16;
          if (v84 >> v15)
          {
            v83 = 0;
            v63 = 0;
            if (v84)
            {
              do
              {
                ++v63;
                v56 = v59 > 1;
                v59 >>= 1;
              }
              while (v56);
            }
            v64 = (char *)sub_19C4273A4((uint64_t)v17, v82, v16, v15, v63, &v83);
            free(v17);
            *(_QWORD *)(a1 + 24) = v64;
            *(_BYTE *)(a1 + 7) = v63;
            v62 = v83;
            *(_DWORD *)(a1 + 20) = v83;
            v61 = v63;
            v17 = v64;
            v60 = v63;
          }
        }
        v65 = *a2;
        if (v60)
        {
          v66 = v60 + 24;
          v67 = -1640531573 * v65 % v62;
          do
          {
            v68 = (unint64_t)&v17[(v67 * v66 + 24) >> 3];
            v69 = v68 & 0xFFFFFFFFFFFFFFF8;
            v70 = ((_BYTE)v67 * (_BYTE)v66) & 7 | (8 * (v68 & 7));
            v71 = *(_QWORD *)(v68 & 0xFFFFFFFFFFFFFFF8) >> v70;
            if ((unint64_t)(v70 + v61) >= 0x41)
              v71 |= *(_QWORD *)(v69 + 8) << -(char)v70;
            if ((v71 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v60)) == 0)
              break;
            v72 = (unint64_t)&v17[(v67 * v66) >> 3];
            v73 = v72 & 0xFFFFFFFFFFFFFFFCLL;
            v74 = (v67 * v66) & 7 | (8 * (v72 & 3));
            v75 = *(_DWORD *)(v72 & 0xFFFFFFFFFFFFFFFCLL) >> v74;
            if (v74 >= 9)
              v75 |= *(_DWORD *)(v73 + 4) << -(char)v74;
            if ((v75 & 0xFFFFFF) == v65)
            {
              sub_19C42ABF4((uint64_t)v17, v66, v60, v67, v84);
              goto LABEL_98;
            }
            if (v67 + 1 == v62)
              v67 = 0;
            else
              ++v67;
          }
          while (v67 != -1640531573 * v65 % v62);
        }
        sub_19C42751C((uint64_t)v17, v62, v60, v65, v84);
      }
    }
LABEL_98:
    v76 = v84;
    v42 = (sub_19C426CE8(v84, v7, v9, 0, v84 + v77, 1u) - v76 + 3) & 0xFFFFFFFC;
    v43 = *(_DWORD *)(a1 + 12) - v79;
LABEL_99:
    *(_DWORD *)(a1 + 12) = v43 + v42;
  }
}

uint64_t sub_19C429F10(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8, float a9, unsigned int a10, unsigned int a11, unsigned int a12, unsigned __int8 a13, unsigned int *a14, _QWORD *a15)
{
  unsigned int v19;
  unsigned int v21;
  uint64_t v22;
  int v23;
  char v24;
  int v25;
  uint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  char *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  int v50;
  float v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int *v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int v59;
  _BYTE *v60;
  uint64_t v62;
  int v63;
  unint64_t v64;
  int v65;
  unsigned int v66;
  int v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  _DWORD *v71;
  unint64_t v72;
  int v73;
  unsigned int v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  unsigned int v84;
  unsigned int v85;
  unint64_t v86;
  size_t v87;
  uint64_t v88;
  int v89;
  BOOL v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  size_t v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  unsigned int v101;
  size_t v102;
  _BYTE *v103;
  char *v104;
  size_t v105;
  char *v106;
  char *v107;
  unsigned int v108;
  int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  int v121;
  int v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  int v126;
  unsigned int v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  int v131;
  unsigned int v132;
  uint64_t v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  char *v141;
  unint64_t v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unint64_t v152;
  _DWORD *v153;
  uint64_t v154;
  int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  size_t __n;
  unsigned int v161;
  uint64_t v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  unsigned int v166;
  _BYTE *__src;
  int v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  unsigned int v172;
  int v173;
  unsigned int v174;
  _BYTE *v175;
  unsigned int v176;
  char *v177;
  unsigned int v178;
  unint64_t v179;
  uint64_t v180;
  unsigned int v182;
  uint64_t v183;
  int v184;
  unsigned int v185;
  _BYTE *v186;
  uint64_t v187;
  uint64_t v188;
  unsigned int v189;
  unsigned int v190[3];

  v19 = a2;
  v189 = a11;
  if (a7)
    v21 = 24;
  else
    v21 = 0;
  v22 = a1 + 3;
  v23 = 6 * a7;
  v24 = (6 * a7) & 6;
  v25 = *(_DWORD *)(((((3 * a7) >> 2) & 0x1FFFFFFF) + v22) & 0xFFFFFFFFFFFFFFFCLL) >> (v24 | (8
                                                                                            * ((((3 * a7) >> 2) + v22) & 3)));
  if (a7 + 1 >= a2)
  {
    v30 = 0;
  }
  else
  {
    v26 = ((v23 + 3) >> 3) + v22;
    v27 = (_DWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL);
    v28 = (v23 + 3) & 7 | (8 * (v26 & 3));
    v29 = *v27 >> v28;
    if (v28 >= 0x1E)
      v29 |= v27[1] << -(char)v28;
    v30 = 4 * (v29 & 7);
  }
  v31 = 0;
  v32 = *(_DWORD *)(a4 + 4 * a7);
  v187 = 0;
  v188 = 0;
  v186 = (_BYTE *)a1;
  if (a7 < a5 && !HIBYTE(v32))
  {
    v33 = 4 * v25;
    v34 = (4 * (_BYTE)v25) & 0x1C;
    v35 = a10;
    v36 = (((4 * (_BYTE)v25) & 0x1C) + (_BYTE)v21 + (_BYTE)v30 + 7) & 0xF8;
    v37 = (v36 * a10) >> 3;
    v38 = (char *)(a8 + v37);
    if (a10)
    {
      v169 = ((3 * a7) >> 2) & 0x1FFFFFFF;
      v171 = a4;
      v174 = a6;
      v177 = (char *)(a8 + v37);
      v178 = a3;
      v182 = a7 + 1;
      v168 = 6 * a7;
      v183 = a8;
      v185 = v21;
      if (sub_19C4283A8(a8, a11, a12, v36, v21, v33 & 0x1C, v30, v32, &v189, (unsigned int *)&v188, (unsigned int *)&v188 + 1, (unsigned int *)&v187, (unsigned int *)&v187 + 1))
      {
        v39 = v178;
        v40 = v188;
        if (v34)
        {
          v41 = v183;
          v42 = ((v36 * (a10 - 1) + v185) >> 3) + v183;
          v43 = v42 & 0xFFFFFFFFFFFFFFFCLL;
          v44 = 8 * (v42 & 3);
          v45 = *(_DWORD *)(v42 & 0xFFFFFFFFFFFFFFFCLL) >> v44;
          v46 = a2;
          if (v44 + (unint64_t)v34 >= 0x21)
            v45 |= *(_DWORD *)(v43 + 4) << -(char)v44;
          v34 = v45 & (0xFFFFFFFF >> -(char)v34);
          if (v182 == (_DWORD)a5)
          {
            if (v34 && v188 < HIDWORD(v188))
            {
              v190[0] = 0;
              v47 = (v178 + 31) & 0xFFFFFFF8;
              v48 = v188;
              v49 = sub_19C42861C((uint64_t)v177, v188, HIDWORD(v188), v47, v178, v174, v190);
              v50 = v190[0];
              if (v49)
              {
                v51 = sub_19C42AC98((uint64_t)v177, v47, v178, v190[0]);
                sub_19C42AD1C((uint64_t)v177, v47, v178, v50, v51 + a9);
                v52 = 0;
LABEL_36:
                v31 = 1;
                goto LABEL_141;
              }
              LODWORD(v46) = a2;
              v39 = v178;
              v41 = v183;
              v40 = v48;
              v52 = a13;
              if (!a13)
              {
LABEL_140:
                v31 = 0;
                goto LABEL_141;
              }
LABEL_35:
              v60 = sub_19C42AE34(a1, v46, v39, v171, v174, a7, v41, a10, a9, v189, v40, v187, v177, v34, v50, 0);
              v52 = 0;
              v186 = v60;
              goto LABEL_36;
            }
            v50 = v188;
LABEL_34:
            v52 = a13;
            if (!a13)
              goto LABEL_140;
            goto LABEL_35;
          }
        }
        else
        {
          v50 = v188;
          v46 = a2;
          v41 = v183;
          if (v182 == (_DWORD)a5)
            goto LABEL_34;
        }
        v166 = a10 - 1;
        v190[0] = 0;
        v62 = (v34 * ((v178 + 31) & 0xFFFFFFF8)) >> 3;
        v31 = sub_19C429F10(a1, v46, v178, v171, a5, v174, a9);
        v63 = v190[0];
        if (!v190[0])
          goto LABEL_138;
        v64 = 8 * (a1 & 3);
        v65 = *(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v64;
        v66 = v185;
        if (v64 >= 9)
          v65 |= *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFFCLL) + 4) << (-8 * (a1 & 3));
        v67 = *(_DWORD *)((a1 + 3 + v169) & 0xFFFFFFFFFFFFFFFCLL) >> (v24 & 0xE7 | (8 * ((a1 + 3 + v169) & 3)));
        v68 = 4 * v67;
        v69 = (4 * v67) & 0x1C;
        v165 = v31;
        if (v182 >= a2)
        {
          v74 = 0;
        }
        else
        {
          v70 = a1 + 3 + ((v168 + 3) >> 3);
          v71 = (_DWORD *)(v70 & 0xFFFFFFFFFFFFFFFCLL);
          v72 = (v168 + 3) & 7 | (8 * (v70 & 3));
          v73 = *v71 >> v72;
          if (v72 >= 0x1E)
            v73 |= v71[1] << -(char)v72;
          v74 = 4 * (v73 & 7);
        }
        v75 = v183;
        v76 = v69 + v185 + 7;
        v77 = (v74 + v76) & 0xF8;
        v184 = v69 + v185;
        v78 = v62;
        if (v74)
        {
          v79 = (((_DWORD)v69 + v185 + v77 * v166) >> 3) + v75;
          v80 = v79 & 0xFFFFFFFFFFFFFFFCLL;
          v81 = v68 & 4 | (8 * (v79 & 3));
          v82 = *(_DWORD *)(v79 & 0xFFFFFFFFFFFFFFFCLL) >> v81;
          v83 = v74;
          if (v81 + (unint64_t)v74 >= 0x21)
            v82 |= *(_DWORD *)(v80 + 4) << -(char)v81;
          v84 = v82 & (0xFFFFFFFF >> -(char)v74);
        }
        else
        {
          v83 = 0;
          v84 = 0;
        }
        v85 = v189;
        v86 = v84 + v190[0];
        __src = v186;
        if (!(v86 >> v83))
        {
          v92 = (v74 + v76) & 0xF8;
          v93 = a10;
          v94 = v69 + v185;
          goto LABEL_121;
        }
        v180 = v83;
        v170 = v68;
        v87 = 4 * (v65 & 0xFFFFFFu);
        v88 = sub_19C426CE8((uint64_t)v186, a2, v178, v182, (uint64_t)&v177[v78], v86);
        v164 = v63;
        if ((_DWORD)v86)
        {
          v89 = -1;
          do
          {
            ++v89;
            v90 = v86 > 1;
            v86 >>= 1;
          }
          while (v90);
          v91 = v89 + 4;
        }
        else
        {
          v91 = 3;
        }
        v95 = v87;
        v96 = v91 & 0xFFFFFFFC;
        v97 = (v91 & 0xFFFFFFFC) + v69 + v185 + 7;
        v92 = v97 & 0xFFFFFFF8;
        v98 = ((v97 & 0xFFFFFFF8) * a10) >> 3;
        v99 = (v77 * a10) >> 3;
        v100 = v98 - v99;
        v101 = v95;
        do
        {
          v102 = v101;
          v103 = &v186[v101];
          v101 *= 2;
        }
        while (v88 + v100 > (unint64_t)v103);
        v163 = v91;
        v179 = v88;
        if (v102 <= v95)
        {
          v104 = v177;
        }
        else
        {
          __n = v95;
          v172 = (v91 & 0xFFFFFFFC) + v69 + v185 + 7;
          v162 = v98 - v99;
          v161 = ((v97 & 0xFFFFFFF8) * a10) >> 3;
          v175 = malloc_type_calloc(v102, 1uLL, 0x2E47B0D0uLL);
          memcpy(v175, v186, __n);
          *v175 = v102 >> 2;
          v175[1] = v102 >> 10;
          v175[2] = v102 >> 18;
          v75 += v175 - v186;
          v104 = &v177[v175 - v186];
          v179 += v175 - v186;
          free(v186);
          v99 = (v77 * a10) >> 3;
          v98 = v161;
          v100 = v162;
          v97 = v172;
          __src = v175;
        }
        if (v98 != v99)
        {
          v105 = v179 - (_QWORD)v104;
          if (v179 > (unint64_t)v104)
          {
            v106 = &v104[v100];
            v107 = v104;
            v108 = v97;
            memmove(v106, v107, v105);
            v97 = v108;
          }
        }
        v109 = v170 & 4;
        if (v69 >= 8)
          v110 = 8;
        else
          v110 = v69;
        v176 = 0xFFu >> (8 - v110);
        v173 = -256 >> (8 - v110);
        v111 = v69 - v110;
        if (v96 + v109 <= 8)
          v112 = v96;
        else
          v112 = 8 - v109;
        v113 = 0xFFu >> (8 - v112);
        v114 = v96 - v112;
        v115 = 8 * (v97 >> 3) * v166;
        v116 = v185 + v115;
        v117 = v185 + v115 + v69;
        while (1)
        {
          --v35;
          if (a7)
          {
            v118 = ((v35 * v77) >> 3) + v75;
            v119 = v118 & 0xFFFFFFFFFFFFFFFCLL;
            v120 = 8 * (v118 & 3);
            v121 = *(_DWORD *)(v118 & 0xFFFFFFFFFFFFFFFCLL) >> v120;
            if (v120 >= 9)
              v121 |= *(_DWORD *)(v119 + 4) << -(char)v120;
            v122 = v121 & 0xFFFFFF;
            if (!(_DWORD)v69)
            {
LABEL_107:
              v127 = 0;
              if (v74)
                goto LABEL_87;
              goto LABEL_108;
            }
          }
          else
          {
            v122 = 0;
            if (!(_DWORD)v69)
              goto LABEL_107;
          }
          v123 = ((v185 + v35 * v77) >> 3) + v75;
          v124 = v123 & 0xFFFFFFFFFFFFFFFCLL;
          v125 = 8 * (v123 & 3);
          v126 = *(_DWORD *)(v123 & 0xFFFFFFFFFFFFFFFCLL) >> v125;
          if ((unint64_t)(v125 + v69) >= 0x21)
            v126 |= *(_DWORD *)(v124 + 4) << -(char)v125;
          v127 = v126 & (0xFFFFFFFF >> -(char)v69);
          if (v74)
          {
LABEL_87:
            v128 = ((v184 + v35 * v77) >> 3) + v75;
            v129 = v128 & 0xFFFFFFFFFFFFFFFCLL;
            v130 = v170 & 4 | (8 * (v128 & 3));
            v131 = *(_DWORD *)(v128 & 0xFFFFFFFFFFFFFFFCLL) >> v130;
            if ((unint64_t)(v130 + v180) >= 0x21)
              v131 |= *(_DWORD *)(v129 + 4) << -(char)v130;
            v132 = v131 & (0xFFFFFFFF >> -(char)v74);
            if (!a7)
              goto LABEL_91;
LABEL_90:
            *(_BYTE *)(v75 + ((unint64_t)(v35 * v92) >> 3)) = v122;
            v133 = (v115 >> 3) + v75;
            *(_BYTE *)(v133 + 1) = BYTE1(v122);
            *(_BYTE *)(v133 + 2) = BYTE2(v122);
            goto LABEL_91;
          }
LABEL_108:
          v132 = 0;
          if (a7)
            goto LABEL_90;
LABEL_91:
          if ((_DWORD)v69)
          {
            *(_BYTE *)(v75 + ((unint64_t)(v185 + v35 * v92) >> 3)) = v173 & *(_BYTE *)(v75
                                                                                            + ((unint64_t)(v185 + v35 * v92) >> 3)) | v127 & v176;
            if (v111)
            {
              v134 = (v116 >> 3) + 1;
              v135 = v111;
              do
              {
                if (v135 >= 8)
                  v136 = 8;
                else
                  v136 = v135;
                *(_BYTE *)(v75 + v134) = (-256 >> (8 - v136)) & *(_BYTE *)(v75 + v134) | (0xFFu >> (8 - v136)) & (v127 >> (v69 - v135));
                ++v134;
                v135 -= v136;
              }
              while (v135);
            }
          }
          if (v96)
          {
            *(_BYTE *)(v75 + ((unint64_t)(v184 + v35 * v92) >> 3)) = *(_BYTE *)(v75
                                                                                     + ((unint64_t)(v184 + v35 * v92) >> 3)) & ~((_BYTE)v113 << v109) | ((v132 & v113) << v109);
            if (v114)
            {
              v137 = (v117 >> 3) + 1;
              v138 = v114;
              do
              {
                if (v138 >= 8)
                  v139 = 8;
                else
                  v139 = v138;
                *(_BYTE *)(v75 + v137) = (-256 >> (8 - v139)) & *(_BYTE *)(v75 + v137) | (0xFFu >> (8 - v139)) & (v132 >> (v96 - v138));
                ++v137;
                v138 -= v139;
              }
              while (v138);
            }
          }
          v115 -= v92;
          v116 -= v92;
          v117 -= v92;
          if (!v35)
          {
            if (v182 < a2)
            {
              v140 = v163 >> 2;
              v141 = __src + 3;
              v142 = (unint64_t)(v168 + 3) >> 3;
              v143 = (((_BYTE)v168 + 3) & 7u) <= 5 ? 3 : 8 - (((_BYTE)v168 + 3) & 7);
              v141[v142] = v141[v142] & ~(0xFFu >> (8 - v143) << ((v168 + 3) & 7)) | ((v140 & (0xFFu >> (8 - v143))) << ((v168 + 3) & 7));
              if (v143 != 3)
              {
                v144 = 3 - v143;
                v145 = v142 + 1;
                do
                {
                  if (v144 >= 8)
                    v146 = 8;
                  else
                    v146 = v144;
                  v141[v145] = (-256 >> (8 - v146)) & v141[v145] | (0xFFu >> (8 - v146)) & (v140 >> (3 - v144));
                  ++v145;
                  v144 -= v146;
                }
                while (v144);
              }
            }
            v74 = v96;
            v66 = v185;
            v93 = a10;
            v63 = v164;
            v94 = v69 + v185;
            v68 = v170;
LABEL_121:
            if (v85 < v93)
            {
              v147 = v68 & 4;
              v148 = v74 + v147 <= 8 ? v74 : 8 - v147;
              if (v74)
              {
                v149 = 0xFFu >> (8 - v148);
                v150 = v74 - v148;
                v151 = v66 + v92 * v85 + v69;
                do
                {
                  v152 = (unint64_t)(v94 + v85 * v92) >> 3;
                  v153 = (_DWORD *)((v152 + v75) & 0xFFFFFFFFFFFFFFFCLL);
                  v154 = v68 & 4 | (8 * ((v152 + v75) & 3));
                  v155 = *v153 >> v154;
                  if (v154 + (unint64_t)v74 >= 0x21)
                    v155 |= v153[1] << -(char)v154;
                  v156 = (v155 & (0xFFFFFFFF >> -(char)v74)) + v63;
                  *(_BYTE *)(v75 + v152) = ((v156 & v149) << v147) | *(_BYTE *)(v75 + v152) & ~((_BYTE)v149 << v147);
                  if (v150)
                  {
                    v157 = (v151 >> 3) + 1;
                    v158 = v150;
                    do
                    {
                      if (v158 >= 8)
                        v159 = 8;
                      else
                        v159 = v158;
                      *(_BYTE *)(v75 + v157) = (-256 >> (8 - v159)) & *(_BYTE *)(v75 + v157) | (0xFFu >> (8 - v159)) & (v156 >> (v74 - v158));
                      ++v157;
                      v158 -= v159;
                    }
                    while (v158);
                  }
                  ++v85;
                  v151 += v92;
                }
                while (v85 != v93);
              }
            }
            v186 = __src;
            v31 = v165;
LABEL_138:
            v52 = 0;
LABEL_141:
            v54 = a14;
            v55 = a15;
            if (!a15)
            {
LABEL_41:
              if (v54)
                *v54 = v52;
              return v31;
            }
LABEL_40:
            *v55 = v186;
            goto LABEL_41;
          }
        }
      }
      v52 = 0;
      if (v182 == (_DWORD)a5)
      {
        v31 = 0;
        v54 = a14;
        a8 = v183;
        v55 = a15;
        v19 = a2;
        a3 = v178;
        v38 = v177;
        a6 = v174;
        a4 = v171;
        if (!a13)
          goto LABEL_39;
        v52 = v188;
        if (v34)
        {
          v56 = ((v185 + v36 * (a10 - 1)) >> 3) + v183;
          v57 = v56 & 0xFFFFFFFFFFFFFFFCLL;
          v58 = 8 * (v56 & 3);
          v59 = *(_DWORD *)(v56 & 0xFFFFFFFFFFFFFFFCLL) >> v58;
          if (v58 + (unint64_t)v34 >= 0x21)
            v59 |= *(_DWORD *)(v57 + 4) << -(char)v58;
          v53 = v59 & (0xFFFFFFFF >> -(char)v34);
        }
        else
        {
          v53 = 0;
        }
        goto LABEL_38;
      }
    }
    else
    {
      v52 = 0;
      if (a7 + 1 == (_DWORD)a5)
      {
        v53 = 0;
        v31 = 0;
        v54 = a14;
        v55 = a15;
        if ((a13 & 1) == 0)
        {
LABEL_39:
          if (!v55)
            goto LABEL_41;
          goto LABEL_40;
        }
LABEL_38:
        v31 = 1;
        v186 = sub_19C42AE34(a1, v19, a3, a4, a6, a7, a8, a10, a9, v189, v52, v187, v38, v53, v52, 1u);
        v52 = 1;
        goto LABEL_39;
      }
    }
    v31 = 0;
    goto LABEL_141;
  }
  return v31;
}

uint64_t sub_19C42ABF4(uint64_t result, int a2, int a3, int a4, unint64_t a5)
{
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  if (a3)
  {
    v5 = (a4 * a2) & 7;
    v6 = (unint64_t)(a4 * a2 + 24) >> 3;
    v7 = 8 - v5;
    if ((v5 + a3) <= 8)
      v7 = a3;
    *(_BYTE *)(result + v6) = *(_BYTE *)(result + v6) & ~(0xFFu >> (8 - v7) << v5) | (((0xFFu >> (8 - v7)) & a5) << v5);
    v8 = a3 - v7;
    if (a3 != v7)
    {
      v9 = v6 + 1;
      do
      {
        if (v8 >= 8)
          v10 = 8;
        else
          v10 = v8;
        *(_BYTE *)(result + v9) = (-256 >> (8 - v10)) & *(_BYTE *)(result + v9) | (0xFFu >> (8 - v10)) & (a5 >> (a3 - v8));
        ++v9;
        v8 -= v10;
      }
      while (v8);
    }
  }
  return result;
}

float sub_19C42AC98(uint64_t a1, int a2, int a3, int a4)
{
  unsigned int v4;
  _DWORD *v5;
  unint64_t v6;
  unsigned int v7;
  int v8;
  float result;
  float v10;
  float v11;

  v4 = a3 + a4 * a2;
  v5 = (_DWORD *)(((v4 >> 3) + a1) & 0xFFFFFFFFFFFFFFFCLL);
  v6 = v4 & 7 | (8 * (((v4 >> 3) + a1) & 3));
  v7 = *v5 >> v6;
  if (v6 >= 9)
    v7 |= v5[1] << -(char)v6;
  v8 = (v7 >> 22) & 3;
  result = (float)(v7 & 0x3FFFFF);
  v10 = result * 0.0078125;
  v11 = result * 0.000061035;
  if (!v8)
    result = result * 0.00000095367;
  if (v8 == 1)
    result = v11;
  if (v8 == 2)
    return v10;
  return result;
}

uint64_t sub_19C42AD1C(uint64_t result, int a2, int a3, int a4, float a5)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  if (a5 >= 4194300.0)
  {
    v9 = 12582912;
    v10 = 0x3FFFFF;
  }
  else
  {
    v5 = vcvts_n_s32_f32(a5, 0x14uLL);
    if (a5 <= 0.0)
      v5 = 0;
    v6 = vcvts_n_s32_f32(a5, 0xEuLL);
    if (a5 >= 4.0)
      v7 = 0x400000;
    else
      v7 = 0;
    if (a5 >= 4.0)
      v5 = v6;
    v8 = vcvts_n_s32_f32(a5, 7uLL);
    if (a5 < 256.0)
      v8 = v5;
    else
      v7 = 0x800000;
    if (a5 >= 32768.0)
      v9 = 12582912;
    else
      v9 = v7;
    if (a5 >= 32768.0)
      v10 = (int)a5;
    else
      v10 = v8;
  }
  if (v10 >= 0x3FFFFF)
    v10 = 0x3FFFFF;
  v11 = v10 | v9;
  v12 = (a3 + a4 * a2);
  *(_BYTE *)(result + (v12 >> 3)) = ((v10 & (0xFFu >> ((a3 + a4 * a2) & 7))) << ((a3 + a4 * a2) & 7)) | *(_BYTE *)(result + (v12 >> 3)) & ~(0xFFu >> ((a3 + a4 * a2) & 7) << ((a3 + a4 * a2) & 7));
  v13 = (v12 | 0xFFFFFFF8) + 24;
  v14 = ((a3 + a4 * a2) >> 3) + 1;
  do
  {
    if (v13 >= 8)
      v15 = 8;
    else
      v15 = v13;
    *(_BYTE *)(result + v14) = (-256 >> (8 - v15)) & *(_BYTE *)(result + v14) | (0xFFu >> (8 - v15)) & (v11 >> (24 - v13));
    ++v14;
    v13 -= v15;
  }
  while (v13);
  return result;
}

_BYTE *sub_19C42AE34(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, float a9, unsigned int a10, unsigned int a11, unsigned int a12, char *a13, int a14, int a15, unsigned __int8 a16)
{
  unsigned int v16;
  uint64_t v17;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  char *v31;
  unsigned int v32;
  int v33;
  size_t v34;
  int v35;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  _BYTE *v44;
  unsigned int v45;
  unsigned int v46;
  size_t v47;
  unint64_t v48;
  _BYTE *v49;
  unsigned int v50;
  BOOL v51;
  int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  _DWORD *v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  _DWORD *v70;
  unint64_t v71;
  int v72;
  unsigned int v73;
  uint64_t v74;
  unsigned int v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  char *v81;
  int v82;
  unint64_t v83;
  unsigned int v84;
  int v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  _BYTE *v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  unsigned int v93;
  unsigned int v94;
  int v95;
  unint64_t v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  char *v101;
  _BYTE *v102;
  unint64_t v103;
  int v104;
  unsigned int v105;
  int v106;
  int v107;
  int v108;
  unsigned int v109;
  unsigned int v110;
  unint64_t v111;
  unsigned int v112;
  int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  unint64_t v120;
  _DWORD *v121;
  uint64_t v122;
  int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  int v127;
  unint64_t v129;
  int v130;
  int v131;
  unint64_t v132;
  uint64_t v133;
  unsigned int v134;
  unsigned int v136;
  unsigned int v137;
  void *__srca;
  char *__src;
  unsigned int v141;
  unsigned int v142;
  unint64_t v143;
  int v144;
  unsigned int v145;
  size_t __n;
  char v147;
  uint64_t v148;
  unint64_t v149;
  unsigned int v150;
  int v151;
  uint64_t v153;
  int v154;

  v16 = a8;
  v17 = a7;
  v20 = 8 * (a1 & 3);
  v21 = *(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v20;
  if (v20 >= 9)
    v21 |= *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFFCLL) + 4) << (-8 * (a1 & 3));
  if (a6)
    v22 = 24;
  else
    v22 = 0;
  v154 = v22;
  v23 = 6 * a6;
  v24 = *(_DWORD *)(((v23 >> 3) + a1 + 3) & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a6) & 6 | (8 * (((v23 >> 3) + a1 + 3) & 3)));
  v25 = (4 * v24) & 0x1C;
  v129 = v23;
  v131 = v23 & 6;
  v132 = v23 >> 3;
  v147 = 4 * v24;
  if (a6 + 1 >= a2)
  {
    v30 = 0;
  }
  else
  {
    v26 = ((v23 + 3) >> 3) + a1 + 3;
    v27 = (_DWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL);
    v28 = ((int)v23 + 3) & 7 | (8 * (v26 & 3));
    v29 = *v27 >> v28;
    if (v28 >= 0x1E)
      v29 |= v27[1] << -(char)v28;
    v30 = 4 * (v29 & 7);
  }
  v31 = a13;
  v32 = a10;
  v33 = *(_DWORD *)(a4 + 4 * a6);
  v34 = 4 * (v21 & 0xFFFFFFu);
  v151 = v25 + v154;
  v35 = ((_BYTE)v30 + (_BYTE)v25 + (_BYTE)v154 + 7) & 0x78;
  v141 = a3 + 31;
  v142 = (a3 + 31) >> 3;
  v153 = v25;
  v37 = sub_19C426CE8(a1, a2, a3, a6, a7, a8);
  v38 = v153;
  v39 = (a14 + 1);
  v40 = v39 >> v153;
  v134 = a2;
  v130 = v33;
  if (v39 >> v153)
  {
    v41 = -1;
    do
    {
      ++v41;
      v51 = v39 > 1;
      v39 >>= 1;
    }
    while (v51);
    v42 = (v41 & 0x7FFFFFFC) + 4;
    v43 = ((v154 | 4) + v30 + v42) & 0xFFFFFFF8;
  }
  else
  {
    v42 = v153;
    v43 = v35;
  }
  v44 = (_BYTE *)a1;
  v136 = a16 + v16;
  v45 = (v35 * v16) >> 3;
  v46 = v34;
  do
  {
    v47 = v46;
    v48 = (unint64_t)&v44[v46];
    v46 *= 2;
  }
  while (v37 + (unint64_t)(v142 - v45 + ((v43 * (a16 + v16)) >> 3)) > v48);
  v137 = v141 & 0xFFFFFFF8;
  v143 = v37;
  if (v47 > v34)
  {
    __n = v34;
    __srca = v44;
    v149 = v40;
    v49 = malloc_type_calloc(v47, 1uLL, 0x4FC83FC7uLL);
    memcpy(v49, __srca, __n);
    *v49 = v47 >> 2;
    v49[1] = v47 >> 10;
    v49[2] = v47 >> 18;
    v17 += v49 - (_BYTE *)__srca;
    v31 = &a13[v49 - (_BYTE *)__srca];
    v143 += v49 - (_BYTE *)__srca;
    free(__srca);
    v45 = (v35 * v16) >> 3;
    v40 = v149;
    v38 = v153;
    v44 = v49;
  }
  v50 = a6;
  if (!v40)
  {
    v84 = a5;
    v85 = a15;
    v83 = v143;
    if (!a16)
      goto LABEL_100;
    goto LABEL_75;
  }
  __src = v44;
  v133 = ((v43 * v16) >> 3) - v45;
  v51 = (v43 * v16) >> 3 != v45 && v143 > (unint64_t)v31;
  if (v51)
  {
    memmove(&v31[v133], v31, v143 - (_QWORD)v31);
    v38 = v153;
    v50 = a6;
  }
  if (v16)
  {
    v150 = 0xFFFFFFFF >> -(char)v38;
    v148 = v147 & 4;
    if (v42 >= 8)
      v52 = 8;
    else
      v52 = v42;
    v145 = 0xFFu >> (8 - v52);
    v144 = -256 >> (8 - v52);
    v53 = v42 - v52;
    if ((v42 & 4) + v30 <= 8)
      v54 = v30;
    else
      v54 = 8 - (v42 & 4);
    v55 = 0xFFu >> (8 - v54);
    v56 = v30 - v54;
    v57 = v43 * (v16 - 1);
    v58 = v154 + v57;
    v59 = v154 + v57 + v42;
    do
    {
      --v16;
      if (v50)
      {
        v60 = ((v16 * v35) >> 3) + v17;
        v61 = v60 & 0xFFFFFFFFFFFFFFFCLL;
        v62 = 8 * (v60 & 3);
        v63 = *(_DWORD *)(v60 & 0xFFFFFFFFFFFFFFFCLL) >> v62;
        if (v62 >= 9)
          v63 |= *(_DWORD *)(v61 + 4) << -(char)v62;
        v64 = v63 & 0xFFFFFF;
        if (!(_DWORD)v38)
        {
LABEL_63:
          v69 = 0;
          if (v30)
            goto LABEL_43;
          goto LABEL_64;
        }
      }
      else
      {
        v64 = 0;
        if (!(_DWORD)v38)
          goto LABEL_63;
      }
      v65 = ((v154 + v16 * v35) >> 3) + v17;
      v66 = (_DWORD *)(v65 & 0xFFFFFFFFFFFFFFFCLL);
      v67 = 8 * (v65 & 3);
      v68 = *v66 >> v67;
      if ((unint64_t)(v67 + v38) >= 0x21)
        v68 |= v66[1] << -(char)v67;
      v69 = v68 & v150;
      if (v30)
      {
LABEL_43:
        v70 = (_DWORD *)((((v151 + v16 * v35) >> 3) + v17) & 0xFFFFFFFFFFFFFFFCLL);
        v71 = v148 & 0xFFFFFFFFFFFFFFE7 | (8 * ((((v151 + v16 * v35) >> 3) + (_BYTE)v17) & 3));
        v72 = *v70 >> v71;
        if (v71 + v30 >= 0x21)
          v72 |= v70[1] << -(char)v71;
        v73 = v72 & (0xFFFFFFFF >> -(char)v30);
        if (!v50)
          goto LABEL_47;
LABEL_46:
        *(_BYTE *)(v17 + ((unint64_t)(v16 * v43) >> 3)) = v64;
        v74 = (v57 >> 3) + v17;
        *(_BYTE *)(v74 + 1) = BYTE1(v64);
        *(_BYTE *)(v74 + 2) = BYTE2(v64);
        goto LABEL_47;
      }
LABEL_64:
      v73 = 0;
      if (v50)
        goto LABEL_46;
LABEL_47:
      if (v42)
      {
        *(_BYTE *)(v17 + ((unint64_t)(v154 + v16 * v43) >> 3)) = v144 & *(_BYTE *)(v17
                                                                                        + ((unint64_t)(v154 + v16 * v43) >> 3)) | v69 & v145;
        if (v53)
        {
          v75 = (v58 >> 3) + 1;
          v76 = v53;
          do
          {
            if (v76 >= 8)
              v77 = 8;
            else
              v77 = v76;
            *(_BYTE *)(v17 + v75) = (-256 >> (8 - v77)) & *(_BYTE *)(v17 + v75) | (0xFFu >> (8 - v77)) & (v69 >> (v42 - v76));
            ++v75;
            v76 -= v77;
          }
          while (v76);
        }
      }
      if (v30)
      {
        *(_BYTE *)(v17 + ((unint64_t)(v42 + v154 + v16 * v43) >> 3)) = *(_BYTE *)(v17
                                                                                       + ((unint64_t)(v42 + v154 + v16 * v43) >> 3)) & ~((_BYTE)v55 << (v42 & 4)) | ((v73 & v55) << (v42 & 4));
        if (v56)
        {
          v78 = (v59 >> 3) + 1;
          v79 = v56;
          do
          {
            if (v79 >= 8)
              v80 = 8;
            else
              v80 = v79;
            *(_BYTE *)(v17 + v78) = (-256 >> (8 - v80)) & *(_BYTE *)(v17 + v78) | (0xFFu >> (8 - v80)) & (v73 >> (v30 - v79));
            ++v78;
            v79 -= v80;
          }
          while (v79);
        }
      }
      v57 -= v43;
      v58 -= v43;
      v59 -= v43;
      v50 = a6;
      v38 = v153;
    }
    while (v16);
  }
  v44 = __src;
  if (v50 < v134)
  {
    v81 = __src + 3;
    v82 = v131 == 6 ? 3 : 7;
    v81[v132] = v81[v132] & ~((_BYTE)v82 << v131) | ((v82 & (v42 >> 2)) << v131);
    if (v131 == 6)
      v81[(v129 >> 3) + 1] = v81[(v129 >> 3) + 1] & 0xFE | ((v42 & 0x10) != 0);
  }
  v31 += v133;
  v83 = v143 + v133;
  v84 = a5;
  v85 = a15;
  if (a16)
  {
LABEL_75:
    v86 = v43 >> 3;
    if (v43)
    {
      v87 = (char *)(v17 + v86 * a10);
      if (v83 > (unint64_t)v87)
      {
        v88 = v83;
        v89 = v44;
        memmove(&v87[v86], v87, v83 - (_QWORD)v87);
        v50 = a6;
        v83 = v88;
        v44 = v89;
        v85 = a15;
      }
    }
    if (v50)
    {
      v90 = v17 + ((unint64_t)(v43 * a10) >> 3);
      *(_WORD *)v90 = v130;
      *(_BYTE *)(v90 + 2) = BYTE2(v130);
    }
    if (v42)
    {
      v91 = (unint64_t)(v154 + v43 * a10) >> 3;
      v92 = v42 >= 8 ? 8 : v42;
      *(_BYTE *)(v17 + v91) = (-256 >> (8 - v92)) & *(_BYTE *)(v17 + v91) | (0xFFu >> (8 - v92)) & a11;
      v93 = v42 - v92;
      if (v93)
      {
        v94 = v91 + 1;
        do
        {
          if (v93 >= 8)
            v95 = 8;
          else
            v95 = v93;
          *(_BYTE *)(v17 + v94) = (-256 >> (8 - v95)) & *(_BYTE *)(v17 + v94) | (0xFFu >> (8 - v95)) & (a11 >> (v42 - v93));
          ++v94;
          v93 -= v95;
        }
        while (v93);
      }
    }
    if (v30)
    {
      v96 = (unint64_t)(v42 + v154 + v43 * a10) >> 3;
      v97 = 8 - (v42 & 4);
      if ((v42 & 4) + v30 <= 8)
        v97 = v30;
      *(_BYTE *)(v17 + v96) = *(_BYTE *)(v17 + v96) & ~(0xFFu >> (8 - v97) << (v42 & 4)) | (((0xFFu >> (8 - v97)) & a12) << (v42 & 4));
      v98 = v30 - v97;
      if (v30 != v97)
      {
        v99 = v96 + 1;
        do
        {
          if (v98 >= 8)
            v100 = 8;
          else
            v100 = v98;
          *(_BYTE *)(v17 + v99) = (-256 >> (8 - v100)) & *(_BYTE *)(v17 + v99) | (0xFFu >> (8 - v100)) & (a12 >> (v30 - v98));
          ++v99;
          v98 -= v100;
        }
        while (v98);
      }
    }
    v31 += v86;
    v83 += v86;
  }
LABEL_100:
  if (v141 >= 8)
  {
    v101 = &v31[v142 * v85];
    if (v83 > (unint64_t)v101)
    {
      v102 = v44;
      memmove(&v101[v142], v101, v83 - (_QWORD)v101);
      v44 = v102;
    }
  }
  if (a3)
  {
    v103 = (unint64_t)(v137 * v85) >> 3;
    v104 = a3 >= 8 ? 8 : a3;
    v31[v103] = (-256 >> (8 - v104)) & v31[v103] | (0xFFu >> (8 - v104)) & v84;
    v105 = a3 - v104;
    if (v105)
    {
      v106 = v103 + 1;
      do
      {
        if (v105 >= 8)
          v107 = 8;
        else
          v107 = v105;
        v31[v106] = (-256 >> (8 - v107)) & v31[v106] | (0xFFu >> (8 - v107)) & (v84 >> (a3 - v105));
        ++v106;
        v105 -= v107;
      }
      while (v105);
    }
  }
  if (a9 >= 4194300.0)
  {
    v108 = 12582912;
    v109 = 0x3FFFFF;
  }
  else if (a9 >= 32768.0)
  {
    v109 = (int)a9;
    v108 = 12582912;
  }
  else if (a9 >= 256.0)
  {
    v109 = vcvts_n_s32_f32(a9, 7uLL);
    v108 = 0x800000;
  }
  else if (a9 >= 4.0)
  {
    v109 = vcvts_n_s32_f32(a9, 0xEuLL);
    v108 = 0x400000;
  }
  else
  {
    v108 = 0;
    if (a9 <= 0.0)
      v109 = 0;
    else
      v109 = vcvts_n_s32_f32(a9, 0x14uLL);
  }
  if (v109 >= 0x3FFFFF)
    v109 = 0x3FFFFF;
  v110 = v109 | v108;
  v111 = (unint64_t)(a3 + v137 * v85) >> 3;
  v31[v111] = ((v109 & (0xFFu >> (a3 & 7))) << (a3 & 7)) | v31[v111] & ~(0xFFu >> (a3 & 7) << (a3 & 7));
  v112 = (a3 | 0xFFFFFFF8) + 24;
  v113 = v111 + 1;
  do
  {
    if (v112 >= 8)
      v114 = 8;
    else
      v114 = v112;
    v31[v113] = (-256 >> (8 - v114)) & v31[v113] | (0xFFu >> (8 - v114)) & (v110 >> (24 - v112));
    ++v113;
    v112 -= v114;
  }
  while (v112);
  if (v136 > a10)
  {
    v115 = v42 >= 8 ? 8 : v42;
    if (v42)
    {
      v116 = 0xFFu >> (8 - v115);
      v117 = -256 >> (8 - v115);
      v118 = v42 - v115;
      v119 = v154 + v43 * a10;
      do
      {
        v120 = (unint64_t)(v154 + v32 * v43) >> 3;
        v121 = (_DWORD *)((v120 + v17) & 0xFFFFFFFFFFFFFFFCLL);
        v122 = 8 * ((v120 + v17) & 3);
        v123 = *v121 >> v122;
        if (v122 + (unint64_t)v42 >= 0x21)
          v123 |= v121[1] << (-8 * ((v120 + v17) & 3));
        v124 = (v123 & (0xFFFFFFFF >> -(char)v42)) + 1;
        *(_BYTE *)(v17 + v120) = v117 & *(_BYTE *)(v17 + v120) | v124 & v116;
        if (v118)
        {
          v125 = (v119 >> 3) + 1;
          v126 = v118;
          do
          {
            if (v126 >= 8)
              v127 = 8;
            else
              v127 = v126;
            *(_BYTE *)(v17 + v125) = (-256 >> (8 - v127)) & *(_BYTE *)(v17 + v125) | (0xFFu >> (8 - v127)) & (v124 >> (v42 - v126));
            ++v125;
            v126 -= v127;
          }
          while (v126);
        }
        ++v32;
        v119 += v43;
      }
      while (v32 != v136);
    }
  }
  return v44;
}

uint64_t sub_19C42B954(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, float a5)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t result;
  int v17;
  int v18;
  int v19;
  char v20;
  uint64_t v21;
  _DWORD *v22;
  unint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unint64_t v39;
  _DWORD *v40;
  unint64_t v41;
  unsigned int v42;
  int v43;
  float v44;
  float v45;
  float v46;
  float v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int v62;

  v6 = 0;
  v7 = a1 + 3;
  v8 = (a3 + 31) & 0xFFFFFFF8;
  v9 = a3 & 7;
  v10 = 0xFFu >> (a3 & 7);
  v11 = ~(v10 << (a3 & 7));
  v12 = (a3 | 0xFFFFFFF8) + 24;
  if (a2 <= 1)
    v13 = 1;
  else
    v13 = a2;
  v14 = v13 - 1;
  v15 = 1;
  result = 947912704;
  v60 = v7;
  v59 = v13 - 1;
  while (1)
  {
    v17 = v6 ? 24 : 0;
    v18 = 6 * v6;
    v19 = *(_DWORD *)(((((3 * v6) >> 2) & 0x1FFFFFFF) + v7) & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * v6) & 6 | (8 * ((((3 * v6) >> 2) + v7) & 3)));
    if (v6 + 1 >= a2)
    {
      v25 = 0;
    }
    else
    {
      v20 = v18 + 3;
      v21 = ((v18 + 3) >> 3) + v7;
      v22 = (_DWORD *)(v21 & 0xFFFFFFFFFFFFFFFCLL);
      v23 = v20 & 7 | (8 * (v21 & 3));
      v24 = *v22 >> v23;
      if (v23 >= 0x1E)
        v24 |= v22[1] << -(char)v23;
      v25 = 4 * (v24 & 7);
    }
    v26 = (4 * v19) & 0x1C;
    v27 = v26 + v17;
    v28 = (((4 * (_BYTE)v19) & 0x1C) + (_BYTE)v17 + (_BYTE)v25 + 7) & 0xF8;
    v29 = v28 * (v15 - 1);
    v30 = v28 * v15;
    if (v26)
      break;
    v36 = 0;
    v35 = a4 + (v30 >> 3);
    if (v6 == v14)
      return result;
LABEL_50:
    if (!v25)
      return result;
    v55 = ((v29 + v27) >> 3) + a4;
    v56 = v55 & 0xFFFFFFFFFFFFFFFCLL;
    v57 = (4 * (_BYTE)v19) & 4 | (8 * (v55 & 3));
    v58 = *(_DWORD *)(v55 & 0xFFFFFFFFFFFFFFFCLL) >> v57;
    if (v57 + (unint64_t)v25 >= 0x21)
      v58 |= *(_DWORD *)(v56 + 4) << -(char)v57;
    v15 = v58 & (0xFFFFFFFF >> -(char)v25);
    if (!v15)
      return result;
    a4 = v35 + ((v36 * v8) >> 3);
    ++v6;
  }
  v62 = v29;
  v31 = ((v29 + v17) >> 3) + a4;
  v32 = v31 & 0xFFFFFFFFFFFFFFFCLL;
  v33 = 8 * (v31 & 3);
  v34 = *(_DWORD *)(v31 & 0xFFFFFFFFFFFFFFFCLL) >> v33;
  if (v33 + (unint64_t)v26 >= 0x21)
    v34 |= *(_DWORD *)(v32 + 4) << -(char)v33;
  v35 = a4 + (v30 >> 3);
  v36 = v34 & (0xFFFFFFFF >> -(char)v26);
  if (v36)
  {
    v37 = 0;
    v38 = a3;
    do
    {
      v39 = (unint64_t)(a3 + v37 * v8) >> 3;
      v40 = (_DWORD *)((v39 + v35) & 0xFFFFFFFFFFFFFFFCLL);
      v41 = v9 & 0xFFFFFFFFFFFFFFE7 | (8 * ((v39 + v35) & 3));
      v42 = *v40 >> v41;
      if (v41 >= 9)
        v42 |= v40[1] << -(char)v41;
      v43 = (v42 >> 22) & 3;
      v44 = (float)(v42 & 0x3FFFFF);
      v45 = v44 * 0.0078125;
      v46 = v44 * 0.000061035;
      if (!v43)
        v44 = v44 * 0.00000095367;
      if (v43 == 1)
        v44 = v46;
      if (v43 == 2)
        v44 = v45;
      v47 = v44 * a5;
      if (v47 >= 4194300.0)
      {
        v49 = 0x3FFFFF;
        v48 = 12582912;
      }
      else if (v47 >= 32768.0)
      {
        v49 = (int)v47;
        v48 = 12582912;
      }
      else if (v47 >= 256.0)
      {
        v49 = vcvts_n_s32_f32(v47, 7uLL);
        v48 = 0x800000;
      }
      else if (v47 >= 4.0)
      {
        v49 = vcvts_n_s32_f32(v47, 0xEuLL);
        v48 = 0x400000;
      }
      else
      {
        v48 = 0;
        if (v47 <= 0.0)
          v49 = 0;
        else
          v49 = vcvts_n_s32_f32(v47, 0x14uLL);
      }
      v50 = (v38 >> 3) + 1;
      if (v49 >= 0x3FFFFF)
        v51 = 0x3FFFFF;
      else
        v51 = v49;
      v52 = v51 | v48;
      *(_BYTE *)(v35 + v39) = ((v51 & v10) << v9) | *(_BYTE *)(v35 + v39) & v11;
      v53 = v12;
      do
      {
        if (v53 >= 8)
          v54 = 8;
        else
          v54 = v53;
        *(_BYTE *)(v35 + v50) = (-256 >> (8 - v54)) & *(_BYTE *)(v35 + v50) | (0xFFu >> (8 - v54)) & (v52 >> (24 - v53));
        ++v50;
        v53 -= v54;
      }
      while (v53);
      ++v37;
      v38 += v8;
    }
    while (v37 != v36);
    v7 = v60;
    v14 = v59;
  }
  v29 = v62;
  if (v6 != v14)
    goto LABEL_50;
  return result;
}

void sub_19C42BD40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int *v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  char *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unsigned int v18;
  _DWORD *v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  size_t v30;
  _QWORD v31[6];

  v7 = *(unsigned __int8 *)(a1 + 7);
  v8 = *(unsigned __int8 *)(a1 + 6);
  v9 = *(_DWORD *)(a1 + 20);
  v30 = *(unsigned __int8 *)(a1 + 5);
  v10 = (unsigned int *)malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  v14 = *(char **)(a1 + 24);
  v15 = *(void **)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  *(_BYTE *)(a1 + 6) = a4;
  *(_BYTE *)(a1 + 7) = 64;
  *(_DWORD *)(a1 + 20) = 0;
  *(_QWORD *)(a1 + 12) = 24;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  if (v15)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 0x40000000;
    v31[2] = sub_19C42BF8C;
    v31[3] = &unk_1E3D3C910;
    v31[4] = a3;
    v31[5] = a1;
    sub_19C427D18((uint64_t)v15, 1u, v8, (uint64_t)v10, 1u, 0, (uint64_t)v15 + 4, 1, 0, 1u, (uint64_t)v31);
    free(v15);
  }
  if (v14)
  {
    v27 = v16;
    v28 = a3;
    if (v9 && (_DWORD)v7)
    {
      v17 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v7;
      v18 = 24;
      do
      {
        v19 = (_DWORD *)((unint64_t)&v14[(v18 - 24) >> 3] & 0xFFFFFFFFFFFFFFFCLL);
        v20 = (v18 - 24) & 7 | (8 * ((unint64_t)&v14[(v18 - 24) >> 3] & 3));
        v21 = *v19 >> v20;
        if (v20 >= 9)
          v21 |= v19[1] << -(char)v20;
        v22 = (unint64_t)&v14[v18 >> 3];
        v23 = v22 & 0xFFFFFFFFFFFFFFF8;
        v24 = (v18 - 24) & 7 | (8 * (v22 & 7));
        v25 = *(_QWORD *)(v22 & 0xFFFFFFFFFFFFFFF8) >> v24;
        if ((unint64_t)(v24 + v7) >= 0x41)
          v25 |= *(_QWORD *)(v23 + 8) << -(char)v24;
        v26 = (void *)(v25 & v17);
        if ((v25 & v17) != 0)
        {
          sub_19C42BFEC(a1, v25 & v17, v30, v8, v21 & 0xFFFFFF, v10, 0, (uint64_t)v26 + ((6 * (unint64_t)v30 + 4) >> 3) + 3, v11, v12, v13, 1u, 0, 1u, a2, v28);
          free(v26);
        }
        v18 += v7 + 24;
        --v9;
      }
      while (v9);
    }
    free(v14);
    v16 = v27;
  }
  if (v16)
    free(v16);
  free(v10);
}

void sub_19C42BF8C(uint64_t a1, uint64_t a2, float a3)
{
  unsigned int v4;
  uint64_t v6;

  if (a3 > 0.0)
  {
    v4 = a2;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
    sub_19C429718(*(_QWORD *)(a1 + 40), 0, 0, v4, a3);
  }
}

void sub_19C42BFEC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int *a6, unsigned int a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, unsigned int a12, unsigned int a13, unsigned int a14, uint64_t a15, uint64_t a16)
{
  unsigned int v16;
  BOOL v17;
  unsigned int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  char v28;
  uint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  int v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  float v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  BOOL v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  int v84;
  float v85;
  float v86;
  float v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  int v93;
  unsigned int v94;
  BOOL v95;
  unsigned int v96;
  int v99;
  uint64_t v100;
  int v101;
  unsigned int v102;
  uint64_t v103;
  int v104;
  char v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  unsigned int v109;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  unsigned int v114;

  v16 = a12;
  v102 = a14;
  if (a12)
    v17 = a13 >= a14;
  else
    v17 = 1;
  if (!v17)
  {
    v20 = a13;
    v100 = a2 + 3;
    v93 = a4 + 31;
    v21 = (a4 + 31) & 0xFFFFFFF8;
    v22 = a4 & 7;
    v114 = 0xFFFFFFFF >> -(char)a4;
    v113 = a4;
    while (1)
    {
      v23 = a7 ? 24 : 0;
      v24 = 6 * a7;
      v25 = (((3 * a7) >> 2) & 0x1FFFFFFF) + v100;
      v26 = *(_DWORD *)(v25 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a7) & 6 | (8 * (v25 & 3)));
      v112 = a7 + 1;
      if (a7 + 1 < a3)
      {
        v28 = v24 + 3;
        v29 = ((v24 + 3) >> 3) + v100;
        v30 = (_DWORD *)(v29 & 0xFFFFFFFFFFFFFFFCLL);
        v31 = v28 & 7 | (8 * (v29 & 3));
        v32 = *v30 >> v31;
        if (v31 >= 0x1E)
          v32 |= v30[1] << -(char)v31;
        v27 = 4 * (v32 & 7);
      }
      else
      {
        v27 = 0;
      }
      v105 = 4 * v26;
      v33 = (4 * v26) & 0x1C;
      v109 = v33 + v23;
      v34 = (((4 * (_BYTE)v26) & 0x1C) + (_BYTE)v23 + (_BYTE)v27 + 7) & 0xF8;
      v103 = v33;
      v111 = a8;
      v99 = v23;
      v107 = v27;
      v104 = v34 * (v16 - 1);
      if (v33)
      {
        v35 = ((v34 * (v16 - 1) + v23) >> 3) + a8;
        v36 = v35 & 0xFFFFFFFFFFFFFFFCLL;
        v37 = 8 * (v35 & 3);
        v38 = *(_DWORD *)(v35 & 0xFFFFFFFFFFFFFFFCLL) >> v37;
        if (v37 + (unint64_t)v33 >= 0x21)
          v38 |= *(_DWORD *)(v36 + 4) << -(char)v37;
        v39 = v38 & (0xFFFFFFFF >> -(char)v33);
      }
      else
      {
        v39 = 0;
      }
      v40 = a8 + ((v34 * v16) >> 3);
      v108 = v40 + ((v39 * v21) >> 3);
      if (a7)
        break;
      v41 = a5;
      if (a15)
        v41 = (*(uint64_t (**)(uint64_t))(a15 + 16))(a15);
      *a6 = v41;
      if (v39)
      {
        v42 = 0;
        while (2)
        {
          v43 = ((a4 + v42) >> 3) + v40;
          v44 = v43 & 0xFFFFFFFFFFFFFFFCLL;
          v45 = v22 & 0xFFFFFFFFFFFFFFE7 | (8 * (v43 & 3));
          v46 = *(_DWORD *)(v43 & 0xFFFFFFFFFFFFFFFCLL) >> v45;
          if (v45 >= 9)
            v46 |= *(_DWORD *)(v44 + 4) << -(char)v45;
          v47 = (v46 >> 22) & 3;
          v48 = v46 & 0x3FFFFF;
          a9.n128_f32[0] = (float)v48;
          a10.n128_f32[0] = (float)v48 * 0.0078125;
          a11.n128_f32[0] = (float)v48 * 0.000061035;
          if (!v47)
            a9.n128_f32[0] = (float)v48 * 0.00000095367;
          if (v47 == 1)
            a9.n128_f32[0] = (float)v48 * 0.000061035;
          if (v47 == 2)
            v49 = (float)v48 * 0.0078125;
          else
            v49 = a9.n128_f32[0];
          if (v49 <= 0.0)
            goto LABEL_27;
          if ((_DWORD)a4)
          {
            v50 = (v42 >> 3) + v40;
            v51 = v50 & 0xFFFFFFFFFFFFFFFCLL;
            v52 = 8 * (v50 & 3);
            v53 = *(_DWORD *)(v50 & 0xFFFFFFFFFFFFFFFCLL) >> v52;
            if ((unint64_t)(v52 + v113) >= 0x21)
              v53 |= *(_DWORD *)(v51 + 4) << -(char)v52;
            v54 = v53 & v114;
            if (!a16)
            {
LABEL_26:
              sub_19C429718(a1, a6, 1, v54, v49);
LABEL_27:
              v42 += v21;
              if (!--v39)
                goto LABEL_45;
              continue;
            }
          }
          else
          {
            v54 = 0;
            if (!a16)
              goto LABEL_26;
          }
          break;
        }
        LODWORD(v54) = (*(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128))(a16 + 16))(a16, v54, a9, a10, a11);
        goto LABEL_26;
      }
LABEL_45:
      if (a3 >= 2 && v107)
      {
        v55 = ((v104 + v109) >> 3) + v111;
        v56 = v55 & 0xFFFFFFFFFFFFFFFCLL;
        v57 = v105 & 4 | (8 * (v55 & 3));
        v58 = *(_DWORD *)(v55 & 0xFFFFFFFFFFFFFFFCLL) >> v57;
        if (v57 + (unint64_t)v107 >= 0x21)
          v58 |= *(_DWORD *)(v56 + 4) << -(char)v57;
        v20 = 0;
        a7 = 1;
        a8 = v108;
        v16 = v58 & (0xFFFFFFFF >> -(char)v107);
        v102 = v16;
        if (v16)
          continue;
      }
      return;
    }
    v101 = v34;
    v59 = a8;
    if (v20 < v102)
    {
      v61 = v112 >= a3 || v27 == 0;
      v95 = v61;
      v96 = 0xFFFFFFFF >> -(char)v33;
      v94 = v93 & 0xFFFFFFF8;
      v106 = a7;
      while (1)
      {
        v62 = ((v20 * v101) >> 3) + v59;
        v63 = v62 & 0xFFFFFFFFFFFFFFFCLL;
        v64 = 8 * (v62 & 3);
        v65 = *(_DWORD *)(v62 & 0xFFFFFFFFFFFFFFFCLL) >> v64;
        if (v64 >= 9)
          v65 |= *(_DWORD *)(v63 + 4) << -(char)v64;
        v66 = v65 & 0xFFFFFF;
        if (a15)
          v66 = (*(uint64_t (**)(void))(a15 + 16))();
        a6[v106] = v66;
        if ((_DWORD)v103)
        {
          v67 = ((v20 * v101 + v99) >> 3) + v59;
          v68 = v67 & 0xFFFFFFFFFFFFFFFCLL;
          v69 = 8 * (v67 & 3);
          v70 = *(_DWORD *)(v67 & 0xFFFFFFFFFFFFFFFCLL) >> v69;
          if ((unint64_t)(v69 + v103) >= 0x21)
            v70 |= *(_DWORD *)(v68 + 4) << -(char)v69;
          v71 = v70 & v96;
          if (!v20)
          {
LABEL_73:
            v72 = v59;
            v77 = 0;
            v78 = v71;
            if (v71)
              break;
            goto LABEL_94;
          }
        }
        else
        {
          v71 = 0;
          if (!v20)
            goto LABEL_73;
        }
        if (!(_DWORD)v103)
          goto LABEL_73;
        v72 = v59;
        v73 = ((v99 + (v20 - 1) * v101) >> 3) + v59;
        v74 = v73 & 0xFFFFFFFFFFFFFFFCLL;
        v75 = 8 * (v73 & 3);
        v76 = *(_DWORD *)(v73 & 0xFFFFFFFFFFFFFFFCLL) >> v75;
        if ((unint64_t)(v75 + v103) >= 0x21)
          v76 |= *(_DWORD *)(v74 + 4) << -(char)v75;
        v77 = v76 & v96;
        v78 = v71 - v77;
        if (v71 > v77)
          break;
LABEL_94:
        v59 = v72;
        if (!v95)
          sub_19C42BFEC(a1, a2, a3, a4);
        if (++v20 == v102)
          return;
      }
      v79 = v94 * v77;
      while (1)
      {
        v80 = ((a4 + v79) >> 3) + v40;
        v81 = v80 & 0xFFFFFFFFFFFFFFFCLL;
        v82 = v22 & 0xFFFFFFFFFFFFFFE7 | (8 * (v80 & 3));
        v83 = *(_DWORD *)(v80 & 0xFFFFFFFFFFFFFFFCLL) >> v82;
        if (v82 >= 9)
          v83 |= *(_DWORD *)(v81 + 4) << -(char)v82;
        v84 = (v83 >> 22) & 3;
        a9.n128_f32[0] = (float)(v83 & 0x3FFFFF);
        v85 = a9.n128_f32[0] * 0.0078125;
        v86 = a9.n128_f32[0] * 0.000061035;
        if (!v84)
          a9.n128_f32[0] = a9.n128_f32[0] * 0.00000095367;
        if (v84 == 1)
          a9.n128_f32[0] = v86;
        if (v84 == 2)
          v87 = v85;
        else
          v87 = a9.n128_f32[0];
        if (v87 <= 0.0)
          goto LABEL_76;
        if ((_DWORD)a4)
          break;
        v92 = 0;
        if (a16)
          goto LABEL_93;
LABEL_75:
        sub_19C429718(a1, a6, v112, v92, v87);
LABEL_76:
        v79 += v21;
        if (!--v78)
          goto LABEL_94;
      }
      v88 = (v79 >> 3) + v40;
      v89 = v88 & 0xFFFFFFFFFFFFFFFCLL;
      v90 = 8 * (v88 & 3);
      v91 = *(_DWORD *)(v88 & 0xFFFFFFFFFFFFFFFCLL) >> v90;
      if ((unint64_t)(v90 + v113) >= 0x21)
        v91 |= *(_DWORD *)(v89 + 4) << -(char)v90;
      v92 = v91 & v114;
      if (!a16)
        goto LABEL_75;
LABEL_93:
      LODWORD(v92) = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(a16 + 16))(a16, v92, a9);
      goto LABEL_75;
    }
  }
}

void sub_19C42C7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int *v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  char *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unsigned int v15;
  _DWORD *v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  _QWORD v27[6];

  if (a1)
  {
    v4 = *(unsigned __int8 *)(a1 + 7);
    v5 = *(unsigned __int8 *)(a1 + 6);
    v6 = *(_DWORD *)(a1 + 20);
    v24 = *(unsigned __int8 *)(a1 + 5);
    v7 = (unsigned int *)malloc_type_calloc(v24, 4uLL, 0x100004052888210uLL);
    v11 = *(char **)(a1 + 24);
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    *(_BYTE *)(a1 + 7) = 64;
    *(_DWORD *)(a1 + 20) = 0;
    *(_QWORD *)(a1 + 12) = 24;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    if (v12)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 0x40000000;
      v27[2] = sub_19C42CA40;
      v27[3] = &unk_1E3D3C938;
      v27[4] = a3;
      v27[5] = a1;
      sub_19C427D18((uint64_t)v12, 1u, v5, (uint64_t)v7, 1u, 0, (uint64_t)v12 + 4, 1, 0, 1u, (uint64_t)v27);
      free(v12);
    }
    if (v11)
    {
      if (v6 && (_DWORD)v4)
      {
        v14 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v4;
        v15 = 24;
        do
        {
          v16 = (_DWORD *)((unint64_t)&v11[(v15 - 24) >> 3] & 0xFFFFFFFFFFFFFFFCLL);
          v17 = (v15 - 24) & 7 | (8 * ((unint64_t)&v11[(v15 - 24) >> 3] & 3));
          v18 = *v16 >> v17;
          if (v17 >= 9)
            v18 |= v16[1] << -(char)v17;
          v19 = (unint64_t)&v11[v15 >> 3];
          v20 = v19 & 0xFFFFFFFFFFFFFFF8;
          v21 = (v15 - 24) & 7 | (8 * (v19 & 7));
          v22 = *(_QWORD *)(v19 & 0xFFFFFFFFFFFFFFF8) >> v21;
          if ((unint64_t)(v21 + v4) >= 0x41)
            v22 |= *(_QWORD *)(v20 + 8) << -(char)v21;
          v23 = (void *)(v22 & v14);
          if ((v22 & v14) != 0)
          {
            sub_19C42CAB0(a1, v22 & v14, v24, v5, v18 & 0xFFFFFF, v7, 0, (uint64_t)v23 + ((6 * (unint64_t)v24 + 4) >> 3) + 3, v8, v9, v10, 1u, 0, 1u, a2, a3);
            free(v23);
          }
          v15 += v4 + 24;
          --v6;
        }
        while (v6);
      }
      free(v11);
    }
    if (v13)
      free(v13);
    free(v7);
  }
}

void sub_19C42CA40(uint64_t a1, uint64_t a2, float a3)
{
  unsigned int v4;
  uint64_t v6;

  if (a3 > 0.0)
  {
    v4 = a2;
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6 || (*(unsigned int (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2))
      sub_19C429718(*(_QWORD *)(a1 + 40), 0, 0, v4, a3);
  }
}

void sub_19C42CAB0(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int *a6, unsigned int a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, unsigned int a12, unsigned int a13, unsigned int a14, uint64_t a15, uint64_t a16)
{
  unsigned int v16;
  BOOL v17;
  unsigned int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  char v28;
  uint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unsigned int v44;
  int v45;
  unsigned int v46;
  float v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  int v56;
  BOOL v58;
  uint64_t v59;
  unint64_t v60;
  int v61;
  unsigned int v62;
  int v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unsigned int v86;
  int v87;
  float v88;
  float v89;
  float v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  int v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  int v104;
  uint64_t v105;
  char v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  unint64_t v110;
  char v111;
  _DWORD *v112;
  BOOL v113;
  int v115;
  uint64_t v116;
  uint64_t v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v125;
  int v126;
  unsigned int v128;
  uint64_t v129;
  int v130;
  unsigned int v131;
  uint64_t v133;
  unsigned int v134;

  v16 = a12;
  v119 = a14;
  if (a12)
    v17 = a13 >= a14;
  else
    v17 = 1;
  if (v17)
    return;
  v20 = a13;
  v117 = a2 + 3;
  v107 = a4 + 31;
  v21 = (a4 + 31) & 0xFFFFFFF8;
  v22 = a4 & 7;
  v134 = 0xFFFFFFFF >> -(char)a4;
  v133 = a4;
  while (1)
  {
    v23 = a7 ? 24 : 0;
    v24 = 6 * a7;
    v25 = (((3 * a7) >> 2) & 0x1FFFFFFF) + v117;
    v26 = *(_DWORD *)(v25 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a7) & 6 | (8 * (v25 & 3)));
    v131 = a7 + 1;
    if (a7 + 1 < a3)
    {
      v28 = v24 + 3;
      v29 = ((v24 + 3) >> 3) + v117;
      v30 = (_DWORD *)(v29 & 0xFFFFFFFFFFFFFFFCLL);
      v31 = v28 & 7 | (8 * (v29 & 3));
      v32 = *v30 >> v31;
      if (v31 >= 0x1E)
        v32 |= v30[1] << -(char)v31;
      v27 = 4 * (v32 & 7);
    }
    else
    {
      v27 = 0;
    }
    v33 = (4 * (_BYTE)v26) & 0x1C;
    v126 = ((4 * v26) & 0x1C) + v23;
    v130 = (((4 * (_BYTE)v26) & 0x1C) + (_BYTE)v23 + (_BYTE)v27 + 7) & 0xF8;
    v115 = v23;
    v116 = (4 * (_BYTE)v26) & 0x1C;
    v128 = v27;
    v122 = 4 * v26;
    v120 = v130 * (v16 - 1);
    if (((4 * (_BYTE)v26) & 0x1C) != 0)
    {
      v34 = ((v130 * (v16 - 1) + v23) >> 3) + a8;
      v35 = v34 & 0xFFFFFFFFFFFFFFFCLL;
      v36 = 8 * (v34 & 3);
      v37 = *(_DWORD *)(v34 & 0xFFFFFFFFFFFFFFFCLL) >> v36;
      if (v36 + (unint64_t)v33 >= 0x21)
        v37 |= *(_DWORD *)(v35 + 4) << -(char)v36;
      v38 = v37 & (0xFFFFFFFF >> -(char)v33);
      if (!a15)
        goto LABEL_23;
    }
    else
    {
      v38 = 0;
      if (!a15)
        goto LABEL_23;
    }
    if (!(*(unsigned int (**)(uint64_t, _QWORD))(a15 + 16))(a15, a5))
      return;
LABEL_23:
    v39 = a8 + ((v130 * v16) >> 3);
    v125 = v39 + ((v38 * v21) >> 3);
    if (a7)
      break;
    *a6 = a5;
    if (v38)
    {
      v40 = 0;
      do
      {
        v41 = ((a4 + v40) >> 3) + v39;
        v42 = v41 & 0xFFFFFFFFFFFFFFFCLL;
        v43 = v22 & 0xFFFFFFFFFFFFFFE7 | (8 * (v41 & 3));
        v44 = *(_DWORD *)(v41 & 0xFFFFFFFFFFFFFFFCLL) >> v43;
        if (v43 >= 9)
          v44 |= *(_DWORD *)(v42 + 4) << -(char)v43;
        v45 = (v44 >> 22) & 3;
        v46 = v44 & 0x3FFFFF;
        a9.n128_f32[0] = (float)v46;
        a10.n128_f32[0] = (float)v46 * 0.0078125;
        a11.n128_f32[0] = (float)v46 * 0.000061035;
        if (!v45)
          a9.n128_f32[0] = (float)v46 * 0.00000095367;
        if (v45 == 1)
          a9.n128_f32[0] = (float)v46 * 0.000061035;
        if (v45 == 2)
          v47 = (float)v46 * 0.0078125;
        else
          v47 = a9.n128_f32[0];
        if (v47 <= 0.0)
          goto LABEL_27;
        if ((_DWORD)a4)
        {
          v48 = (v40 >> 3) + v39;
          v49 = v48 & 0xFFFFFFFFFFFFFFFCLL;
          v50 = 8 * (v48 & 3);
          v51 = *(_DWORD *)(v48 & 0xFFFFFFFFFFFFFFFCLL) >> v50;
          if ((unint64_t)(v50 + v133) >= 0x21)
            v51 |= *(_DWORD *)(v49 + 4) << -(char)v50;
          v52 = v51 & v134;
          if (a16)
          {
LABEL_44:
            if (!(*(unsigned int (**)(uint64_t, uint64_t, __n128, __n128, __n128))(a16 + 16))(a16, v52, a9, a10, a11))goto LABEL_27;
          }
        }
        else
        {
          v52 = 0;
          if (a16)
            goto LABEL_44;
        }
        sub_19C429718(a1, a6, 1, v52, v47);
LABEL_27:
        v40 += v21;
        --v38;
      }
      while (v38);
    }
    if (a3 >= 2 && v128)
    {
      v53 = ((v120 + v126) >> 3) + a8;
      v54 = v53 & 0xFFFFFFFFFFFFFFFCLL;
      v55 = v122 & 4 | (8 * (v53 & 3));
      v56 = *(_DWORD *)(v53 & 0xFFFFFFFFFFFFFFFCLL) >> v55;
      if (v55 + (unint64_t)v128 >= 0x21)
        v56 |= *(_DWORD *)(v54 + 4) << -(char)v55;
      v20 = 0;
      a7 = 1;
      a8 = v125;
      v16 = v56 & (0xFFFFFFFF >> -(char)v128);
      v119 = v16;
      if (v16)
        continue;
    }
    return;
  }
  if (v20 < v119)
  {
    v118 = 0xFFFFFFFF >> -(char)v116;
    v58 = v131 >= a3 || v128 == 0;
    v113 = v58;
    v59 = ((v120 + v126) >> 3) + a8;
    v112 = (_DWORD *)(v59 & 0xFFFFFFFFFFFFFFFCLL);
    v123 = v122 & 4;
    v60 = v123 & 0xFFFFFFFFFFFFFFE7 | (8 * (v59 & 3));
    v121 = v128;
    v110 = v60 + v128;
    v111 = v123 & 0xE7 | (8 * (v59 & 3));
    v106 = 32 - v60;
    v108 = v107 & 0xFFFFFFF8;
    v109 = 0xFFFFFFFF >> -(char)v128;
    v129 = a7;
    while (2)
    {
      v62 = v20;
      v63 = v20 * v130;
      v64 = ((v20 * v130) >> 3) + a8;
      v65 = v64 & 0xFFFFFFFFFFFFFFFCLL;
      v66 = 8 * (v64 & 3);
      v67 = *(_DWORD *)(v64 & 0xFFFFFFFFFFFFFFFCLL) >> v66;
      if (v66 >= 9)
        v67 |= *(_DWORD *)(v65 + 4) << -(char)v66;
      v68 = v67 & 0xFFFFFF;
      if (a15 && !(*(unsigned int (**)(uint64_t, uint64_t))(a15 + 16))(a15, v68))
        goto LABEL_60;
      a6[v129] = v68;
      if ((_DWORD)v116)
      {
        v69 = v115;
        v70 = ((v63 + v115) >> 3) + a8;
        v71 = v70 & 0xFFFFFFFFFFFFFFFCLL;
        v72 = 8 * (v70 & 3);
        v73 = *(_DWORD *)(v70 & 0xFFFFFFFFFFFFFFFCLL) >> v72;
        if ((unint64_t)(v72 + v116) >= 0x21)
          v73 |= *(_DWORD *)(v71 + 4) << -(char)v72;
        v74 = v73 & v118;
        v75 = v130;
        if (!v20)
          goto LABEL_76;
LABEL_71:
        if ((_DWORD)v116)
        {
          v76 = ((v69 + (v20 - 1) * v75) >> 3) + a8;
          v77 = v76 & 0xFFFFFFFFFFFFFFFCLL;
          v78 = 8 * (v76 & 3);
          v79 = *(_DWORD *)(v76 & 0xFFFFFFFFFFFFFFFCLL) >> v78;
          if ((unint64_t)(v78 + v116) >= 0x21)
            v79 |= *(_DWORD *)(v77 + 4) << -(char)v78;
          v80 = v79 & v118;
          v81 = v74 - v80;
          if (v74 <= v80)
            goto LABEL_98;
LABEL_77:
          v82 = v108 * v80;
          while (2)
          {
            v83 = ((a4 + v82) >> 3) + v39;
            v84 = v83 & 0xFFFFFFFFFFFFFFFCLL;
            v85 = v22 & 0xFFFFFFFFFFFFFFE7 | (8 * (v83 & 3));
            v86 = *(_DWORD *)(v83 & 0xFFFFFFFFFFFFFFFCLL) >> v85;
            if (v85 >= 9)
              v86 |= *(_DWORD *)(v84 + 4) << -(char)v85;
            v87 = (v86 >> 22) & 3;
            a9.n128_f32[0] = (float)(v86 & 0x3FFFFF);
            v88 = a9.n128_f32[0] * 0.0078125;
            v89 = a9.n128_f32[0] * 0.000061035;
            if (!v87)
              a9.n128_f32[0] = a9.n128_f32[0] * 0.00000095367;
            if (v87 == 1)
              a9.n128_f32[0] = v89;
            if (v87 == 2)
              v90 = v88;
            else
              v90 = a9.n128_f32[0];
            if (v90 > 0.0)
            {
              if ((_DWORD)a4)
              {
                v91 = (v82 >> 3) + v39;
                v92 = v91 & 0xFFFFFFFFFFFFFFFCLL;
                v93 = 8 * (v91 & 3);
                v94 = *(_DWORD *)(v91 & 0xFFFFFFFFFFFFFFFCLL) >> v93;
                if ((unint64_t)(v93 + v133) >= 0x21)
                  v94 |= *(_DWORD *)(v92 + 4) << -(char)v93;
                v95 = v94 & v134;
                if (!a16)
                {
LABEL_78:
                  sub_19C429718(a1, a6, v131, v95, v90);
                  goto LABEL_79;
                }
              }
              else
              {
                v95 = 0;
                if (!a16)
                  goto LABEL_78;
              }
              if ((*(unsigned int (**)(uint64_t, uint64_t, __n128))(a16 + 16))(a16, v95, a9))
                goto LABEL_78;
            }
LABEL_79:
            v82 += v21;
            if (!--v81)
              goto LABEL_98;
            continue;
          }
        }
      }
      else
      {
        v74 = 0;
        v69 = v115;
        v75 = v130;
        if (v20)
          goto LABEL_71;
      }
LABEL_76:
      v80 = 0;
      v81 = v74;
      if (v74)
        goto LABEL_77;
LABEL_98:
      v62 = v20;
      if (!v113)
      {
        v96 = *v112 >> v111;
        if (v110 >= 0x21)
          v96 |= v112[1] << v106;
        v97 = ((v63 + v126) >> 3) + a8;
        v98 = v97 & 0xFFFFFFFFFFFFFFFCLL;
        v99 = v123 & 0xFFFFFFFFFFFFFFE7 | (8 * (v97 & 3));
        v100 = *(_DWORD *)(v97 & 0xFFFFFFFFFFFFFFFCLL) >> v99;
        if (v99 + v121 >= 0x21)
          v100 |= *(_DWORD *)(v98 + 4) << -(char)v99;
        if (v20)
        {
          v101 = ((v126 + (v20 - 1) * v130) >> 3) + a8;
          v102 = v101 & 0xFFFFFFFFFFFFFFFCLL;
          v103 = v123 & 0xFFFFFFFFFFFFFFE7 | (8 * (v101 & 3));
          v104 = *(_DWORD *)(v101 & 0xFFFFFFFFFFFFFFFCLL) >> v103;
          if (v103 + v121 >= 0x21)
            v104 |= *(_DWORD *)(v102 + 4) << -(char)v103;
          v61 = v104 & v109;
        }
        else
        {
          v61 = 0;
        }
        HIDWORD(v105) = v61;
        LODWORD(v105) = v96 & v109;
        sub_19C42CAB0(a1, a2, a3, a4, a5, a6, v131, v125, v105, v100 & v109, a15, a16);
      }
LABEL_60:
      v20 = v62 + 1;
      if (v62 + 1 == v119)
        return;
      continue;
    }
  }
}

uint64_t sub_19C42D2E4(uint64_t a1, unsigned int a2, float a3)
{
  uint64_t result;
  int v5;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
  {
    v5 = 0;
    return sub_19C429F10(result, 1u, *(_DWORD *)(a1 + 40), (uint64_t)&v5, 1, a2, 0, result + 4, -a3, 1u, 0, 1u, 0, 0, 0);
  }
  return result;
}

uint64_t sub_19C42D348(uint64_t result, unsigned int a2, uint64_t a3, int a4, uint64_t a5, int a6, unsigned int a7, unsigned int a8, float a9, uint64_t a10)
{
  unsigned int v10;
  int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  _DWORD *v20;
  unint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  float v57;
  unsigned int v58;
  int v59;
  float v60;
  float v61;
  float v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  _DWORD *v75;
  unint64_t v76;
  unsigned int v77;
  unsigned int v78;
  float v79;
  int v80;
  float v81;
  float v82;
  unsigned int v83;
  int v84;
  char v85;
  unsigned int v86;
  int v87;
  unint64_t v88;
  char v89;
  uint64_t v90;
  unsigned int v91;
  uint64_t v92;
  _DWORD *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  BOOL v98;
  int v99;
  unsigned int v100;
  int v102;
  unsigned int v104;
  uint64_t v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;
  unsigned int v109;
  int v110;
  _QWORD v111[6];
  int v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  int v116;

  v92 = result;
  if (a6)
  {
    v10 = a7;
    if (a7 < a8)
    {
      if (a4)
        v13 = 24;
      else
        v13 = 0;
      v14 = (((3 * a4) >> 2) & 0x1FFFFFFF) + result + 3;
      v15 = 4 * (*(_DWORD *)(v14 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * a4) & 6 | (8 * (v14 & 3))));
      v16 = v15 & 0x1C;
      v91 = a4 + 1;
      if (a4 + 1 < a2)
      {
        v18 = 6 * a4 + 3;
        v19 = (v18 >> 3) + result + 3;
        v20 = (_DWORD *)(v19 & 0xFFFFFFFFFFFFFFFCLL);
        v21 = v18 & 7 | (8 * (v19 & 3));
        v22 = *v20 >> v21;
        if (v21 >= 0x1E)
          v22 |= v20[1] << -(char)v21;
        v17 = 4 * (v22 & 7);
      }
      else
      {
        v17 = 0;
      }
      v97 = v16 + v13;
      v23 = (a3 + 31) & 0xFFFFFFF8;
      v102 = ((v15 & 0x1C) + (_BYTE)v13 + (_BYTE)v17 + 7) & 0xF8;
      v24 = v102 * (a6 - 1);
      v105 = v15 & 0x1C;
      if ((v15 & 0x1C) != 0)
      {
        v25 = ((v24 + v13) >> 3) + a5;
        v26 = v25 & 0xFFFFFFFFFFFFFFFCLL;
        v27 = 8 * (v25 & 3);
        v28 = *(_DWORD *)(v25 & 0xFFFFFFFFFFFFFFFCLL) >> v27;
        if ((unint64_t)(v27 + v16) >= 0x21)
          v28 |= *(_DWORD *)(v26 + 4) << -(char)v27;
        v100 = 0xFFFFFFFF >> -(char)v16;
        v29 = v28 & v100;
      }
      else
      {
        v29 = 0;
        v100 = -1;
      }
      v106 = 0;
      v30 = 0;
      v31 = a5 + ((v102 * a6) >> 3);
      v90 = v31 + ((v29 * v23) >> 3);
      v33 = v91 >= a2 || v17 == 0;
      v98 = v33;
      v34 = ((v24 + v97) >> 3) + a5;
      v96 = v15 & 4;
      v35 = v96 | (8 * (v34 & 3));
      v94 = (_DWORD *)(v34 & 0xFFFFFFFFFFFFFFFCLL);
      v95 = v17;
      v88 = v35 + v17;
      v89 = v15 & 4 | (8 * (v34 & 3));
      v85 = 32 - v35;
      v108 = a3;
      v107 = 0xFFFFFFFF >> -(char)a3;
      v109 = (a3 | 0xFFFFFFF8) + 24;
      v110 = ~(-1 << (a3 & 7));
      v86 = 0xFFFFFFFF >> -(char)v17;
      v87 = (a3 + 31) & 0xFFFFFFF8;
      v99 = v13;
      while (1)
      {
        if (!(_DWORD)v105)
          goto LABEL_31;
        v36 = ((v13 + v10 * v102) >> 3) + a5;
        v37 = v36 & 0xFFFFFFFFFFFFFFFCLL;
        v38 = 8 * (v36 & 3);
        v39 = *(_DWORD *)(v36 & 0xFFFFFFFFFFFFFFFCLL) >> v38;
        if ((unint64_t)(v38 + v105) >= 0x21)
          v39 |= *(_DWORD *)(v37 + 4) << -(char)v38;
        v30 = v39 & v100;
        if (v10)
          break;
        v106 = 0;
        if (!v98)
        {
LABEL_32:
          v44 = *v94 >> v89;
          if (v88 >= 0x21)
            v44 |= v94[1] << v85;
          v45 = ((v97 + v10 * v102) >> 3) + a5;
          v46 = v45 & 0xFFFFFFFFFFFFFFFCLL;
          v47 = v96 & 0xFFFFFFFFFFFFFFE7 | (8 * (v45 & 3));
          v48 = *(_DWORD *)(v45 & 0xFFFFFFFFFFFFFFFCLL) >> v47;
          if (v47 + v95 >= 0x21)
            v48 |= *(_DWORD *)(v46 + 4) << -(char)v47;
          if (v10)
          {
            v49 = ((v97 + (v10 - 1) * v102) >> 3) + a5;
            v50 = v49 & 0xFFFFFFFFFFFFFFFCLL;
            v51 = v96 & 0xFFFFFFFFFFFFFFE7 | (8 * (v49 & 3));
            v52 = *(_DWORD *)(v49 & 0xFFFFFFFFFFFFFFFCLL) >> v51;
            if (v51 + v95 >= 0x21)
              v52 |= *(_DWORD *)(v50 + 4) << -(char)v51;
            v53 = v52 & v86;
            v54 = v86;
          }
          else
          {
            v53 = 0;
            v54 = v86;
          }
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 0x40000000;
          v111[2] = sub_19C42DA1C;
          v111[3] = &unk_1E3D3C980;
          v112 = v105;
          v113 = v106;
          v114 = v30;
          v115 = a3;
          v116 = v23;
          v111[4] = a10;
          v111[5] = v31;
          result = sub_19C42D348(v92, a2, a3, v91, v90, v44 & v54, v53, v48 & v54, a9, v111);
        }
LABEL_44:
        v104 = v10;
        if (v106 < v30)
        {
          v55 = v106;
          v56 = a3 + v87 * v106;
          v57 = 0.0;
          v58 = v56;
          do
          {
            v63 = (v58 >> 3) + v31;
            v64 = v63 & 0xFFFFFFFFFFFFFFFCLL;
            v65 = a3 & 7 | (8 * (v63 & 3));
            v66 = *(_DWORD *)(v63 & 0xFFFFFFFFFFFFFFFCLL) >> v65;
            if (v65 >= 9)
              v66 |= *(_DWORD *)(v64 + 4) << -(char)v65;
            v59 = (v66 >> 22) & 3;
            v60 = (float)(v66 & 0x3FFFFF);
            v61 = v60 * 0.0078125;
            v62 = v60 * 0.000061035;
            if (!v59)
              v60 = v60 * 0.00000095367;
            if (v59 == 1)
              v60 = v62;
            if (v59 == 2)
              v60 = v61;
            v57 = v60 + v57;
            ++v55;
            v58 += v23;
          }
          while (v30 != v55);
          if (v57 < a9)
          {
            v67 = v106;
            do
            {
              v68 = v67 * v23;
              if ((_DWORD)a3)
              {
                v69 = (v68 >> 3) + v31;
                v70 = v69 & 0xFFFFFFFFFFFFFFFCLL;
                v71 = 8 * (v69 & 3);
                v72 = *(_DWORD *)(v69 & 0xFFFFFFFFFFFFFFFCLL) >> v71;
                if ((unint64_t)(v71 + v108) >= 0x21)
                  v72 |= *(_DWORD *)(v70 + 4) << -(char)v71;
                v73 = v72 & v107;
              }
              else
              {
                v73 = 0;
              }
              v74 = (unint64_t)(v68 + a3) >> 3;
              v75 = (_DWORD *)((v74 + v31) & 0xFFFFFFFFFFFFFFFCLL);
              v76 = a3 & 7 | (8 * ((v74 + v31) & 3));
              v77 = *v75 >> v76;
              if (v76 >= 9)
                v77 |= v75[1] << -(char)v76;
              v78 = (v56 >> 3) + 1;
              v79 = (float)(v77 & 0x3FFFFF);
              v80 = (v77 >> 22) & 3;
              v81 = v79 * 0.0078125;
              v82 = v79 * 0.000061035;
              if (!v80)
                v79 = v79 * 0.00000095367;
              if (v80 == 1)
                v79 = v82;
              if (v80 == 2)
                v79 = v81;
              *(_BYTE *)(v31 + v74) &= v110;
              v83 = v109;
              do
              {
                if (v83 >= 8)
                  v84 = 8;
                else
                  v84 = v83;
                *(_BYTE *)(v31 + v78++) &= -256 >> (8 - v84);
                v83 -= v84;
              }
              while (v83);
              if (v79 > 0.0)
                result = (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 16))(a10, v73);
              ++v67;
              v56 += v23;
            }
            while (v67 != v30);
          }
        }
        v10 = v104 + 1;
        v13 = v99;
        if (v104 + 1 == a8)
          return result;
      }
      v40 = ((v13 + (v10 - 1) * v102) >> 3) + a5;
      v41 = v40 & 0xFFFFFFFFFFFFFFFCLL;
      v42 = 8 * (v40 & 3);
      v43 = *(_DWORD *)(v40 & 0xFFFFFFFFFFFFFFFCLL) >> v42;
      if ((unint64_t)(v42 + v105) >= 0x21)
        v43 |= *(_DWORD *)(v41 + 4) << -(char)v42;
      v106 = v43 & v100;
LABEL_31:
      if (!v98)
        goto LABEL_32;
      goto LABEL_44;
    }
  }
  return result;
}

uint64_t sub_19C42DA1C(uint64_t a1, unsigned int a2, float a3)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  char v14;
  unint64_t v15;
  unsigned int v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v28;

  if (*(_DWORD *)(a1 + 48))
  {
    v6 = *(_DWORD *)(a1 + 52);
    v7 = *(_DWORD *)(a1 + 56);
    if (v6 < v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_DWORD *)(a1 + 60);
      v28 = 0;
      if (sub_19C42861C(v8, v6, v7, (v9 + 31) & 0xFFFFFFF8, v9, a2, &v28))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_DWORD *)(a1 + 60) + *(_DWORD *)(a1 + 64) * v28;
        v12 = v11 >> 3;
        v13 = (_DWORD *)(((v11 >> 3) + v10) & 0xFFFFFFFFFFFFFFFCLL);
        v15 = v11 & 7 | (8 * (((v11 >> 3) + (_BYTE)v10) & 3));
        v16 = *v13 >> v15;
        if (v15 >= 9)
          v16 |= v13[1] << -(char)v15;
        v17 = (v16 >> 22) & 3;
        v18 = (float)(v16 & 0x3FFFFF);
        v19 = v18 * 0.0078125;
        v20 = v18 * 0.000061035;
        if (!v17)
          v18 = v18 * 0.00000095367;
        if (v17 == 1)
          v18 = v20;
        if (v17 == 2)
          v18 = v19;
        v21 = v18 - a3;
        if (v21 >= 4194300.0)
        {
          v22 = 12582912;
          v23 = 0x3FFFFF;
        }
        else if (v21 >= 32768.0)
        {
          v23 = (int)v21;
          v22 = 12582912;
        }
        else if (v21 >= 256.0)
        {
          v23 = vcvts_n_s32_f32(v21, 7uLL);
          v22 = 0x800000;
        }
        else if (v21 >= 4.0)
        {
          v23 = vcvts_n_s32_f32(v21, 0xEuLL);
          v22 = 0x400000;
        }
        else
        {
          v22 = 0;
          if (v21 <= 0.0)
            v23 = 0;
          else
            v23 = vcvts_n_s32_f32(v21, 0x14uLL);
        }
        if (v23 >= 0x3FFFFF)
          v23 = 0x3FFFFF;
        v14 = (*(_BYTE *)(a1 + 60) + *(_BYTE *)(a1 + 64) * v28) & 7;
        *(_BYTE *)(v10 + v12) = ((v23 & (0xFFu >> v14)) << v14) | *(_BYTE *)(v10 + v12) & ~(0xFFu >> v14 << v14);
        v24 = (v11 | 0xFFFFFFF8) + 24;
        v25 = v12 + 1;
        do
        {
          if (v24 >= 8)
            v26 = 8;
          else
            v26 = v24;
          *(_BYTE *)(v10 + v25) = (-256 >> (8 - v26)) & *(_BYTE *)(v10 + v25) | (0xFFu >> (8 - v26)) & ((v23 | v22) >> (24 - v24));
          ++v25;
          v24 -= v26;
        }
        while (v24);
      }
    }
  }
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a3);
}

uint64_t sub_19C42DC40(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  unsigned int v15;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  unsigned int v35;
  unint64_t v36;
  _DWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  unint64_t v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unint64_t v49;
  _DWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD *v53;
  unint64_t v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _DWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _DWORD *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  unint64_t v77;
  _DWORD *v78;
  uint64_t v79;
  uint64_t v80;
  _DWORD *v81;
  uint64_t v83;
  int v84;
  int v85;
  unint64_t v86;
  int v87;
  int v88;
  unint64_t v89;
  int v90;
  unsigned int v91;
  char v92;
  unint64_t v93;
  int v94;
  int v95;
  unint64_t v96;
  unsigned int v97;

  v3 = a3;
  v6 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = 8 * (a1 & 3);
  v8 = *(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v7;
  if (v7 >= 9)
    v8 = (*(_DWORD *)(v6 + 4) << (-8 * (a1 & 3))) | (*(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> (8 * (a1 & 3)));
  v9 = 4 * (v8 & 0xFFFFFF);
  v10 = ((6 * a2 + 4) >> 3) + 3;
  if (v9 < v10)
    return 0;
  v95 = *(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v7;
  v11 = a1 + v10;
  v12 = sub_19C42E228(a1, a2, a3, 0, v11, 1u);
  result = 0;
  v96 = v12;
  if (v11 <= v12 && v12 <= a1 + v9)
  {
    v15 = (v12 - a1 + 3) & 0xFFFFFFFC;
    if (v9 < v15 || v15 < v10)
      return 0;
    v94 = 0;
    v93 = a1 + 3;
    v87 = (v3 + 31) & 0xFFFFFFF8;
    if (a2 <= 1)
      v17 = 1;
    else
      v17 = a2;
    v85 = v17 - 1;
    v18 = 1;
    v89 = v6;
    while (1)
    {
      v19 = v95;
      if (v7 >= 9)
        v19 = (*(_DWORD *)(v6 + 4) << (32 - v7)) | v95;
      if (v94)
        v20 = 24;
      else
        v20 = 0;
      v21 = 6 * v94;
      v22 = (((3 * v94) >> 2) & 0x1FFFFFFF) + v93;
      v23 = *(_DWORD *)(v22 & 0xFFFFFFFFFFFFFFFCLL) >> ((6 * v94) & 6 | (8 * (v22 & 3)));
      v24 = v3;
      if (v94 + 1 >= a2)
      {
        v30 = 0;
      }
      else
      {
        v25 = v21 + 3;
        v26 = ((v21 + 3) >> 3) + v93;
        v27 = (_DWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL);
        v28 = v25 & 7 | (8 * (v26 & 3));
        v29 = *v27 >> v28;
        if (v28 >= 0x1E)
          v29 |= v27[1] << -(char)v28;
        v30 = 4 * (v29 & 7);
      }
      v31 = 4 * (v19 & 0xFFFFFF);
      v92 = 4 * v23;
      v32 = (4 * v23) & 0x1C;
      v97 = v30;
      v90 = v32 + v20;
      v33 = (((4 * (_BYTE)v23) & 0x1C) + (_BYTE)v20 + (_BYTE)v30 + 7) & 0xF8;
      v34 = sub_19C42E228(a1, a2, v24, v94, v11, v18);
      v35 = v18 - 1;
      v36 = ((v33 * (v18 - 1) + v20) >> 3) + v11;
      v37 = (_DWORD *)(v36 & 0xFFFFFFFFFFFFFFFCLL);
      v38 = 8 * (v36 & 3);
      v39 = a1 + v31;
      v40 = 2;
      if ((unint64_t)(v38 + v32) > 0x20)
        v40 = 1;
      v41 = &v37[v40];
      if ((unint64_t)v37 < a1 || (unint64_t)v41 > v39)
        return 0;
      v43 = v34;
      if ((_DWORD)v32)
      {
        v44 = *v37 >> v38;
        v3 = v24;
        if ((unint64_t)(v38 + v32) >= 0x21)
          v44 |= v37[1] << -(char)v38;
        v45 = v44 & (0xFFFFFFFF >> -(char)v32);
      }
      else
      {
        v45 = 0;
        v3 = v24;
      }
      v6 = v89;
      result = 0;
      if (v39 < v96)
        return result;
      if (v43 != v96)
        return result;
      v88 = v33 * (v18 - 1);
      v86 = v11 + ((v33 * v18) >> 3) + ((v45 * v87) >> 3);
      if (v86 > v96)
        return result;
      if (v18 >= 2)
        break;
LABEL_82:
      if (v94 == v85)
        return 1;
      v76 = v92 & 4;
      v77 = ((v88 + v90) >> 3) + v11;
      v78 = (_DWORD *)(v77 & 0xFFFFFFFFFFFFFFFCLL);
      v79 = 8 * (v77 & 3);
      if (v79 + (unint64_t)(v97 + v76) <= 0x20)
        v80 = 2;
      else
        v80 = 1;
      v81 = &v78[v80];
      if ((unint64_t)v78 < a1 || (unint64_t)v81 > v39)
        return 0;
      if (!v97)
        return 1;
      v83 = v79 | v76;
      v84 = *v78 >> v83;
      if (v83 + (unint64_t)v97 >= 0x21)
        v84 |= v78[1] << -(char)v83;
      result = 1;
      v11 = v86;
      ++v94;
      v18 = v84 & (0xFFFFFFFF >> -(char)v97);
      if (!v18)
        return result;
    }
    v46 = v92 & 4;
    v47 = v97 + v46;
    v91 = 0xFFFFFFFF >> -(char)v32;
    v48 = 0xFFFFFFFF >> -(char)v97;
    while (1)
    {
      v49 = (v20 >> 3) + v11;
      v50 = (_DWORD *)(v49 & 0xFFFFFFFFFFFFFFFCLL);
      v51 = 8 * (v49 & 3);
      if ((unint64_t)(v51 + v32) <= 0x20)
        v52 = 2;
      else
        v52 = 1;
      v53 = &v50[v52];
      result = 0;
      if ((unint64_t)v50 < a1 || (unint64_t)v53 > v39)
        return result;
      v55 = ((v33 + v20) >> 3) + v11;
      v56 = (_DWORD *)(v55 & 0xFFFFFFFFFFFFFFFCLL);
      v57 = 8 * (v55 & 3);
      v58 = (unint64_t)(v57 + v32) <= 0x20 ? 8 : 4;
      if ((unint64_t)v56 < a1 || (unint64_t)v56 + v58 > v39)
        return result;
      result = 0;
      v59 = ((v32 + v20) >> 3) + v11;
      v60 = (_DWORD *)(v59 & 0xFFFFFFFFFFFFFFFCLL);
      v61 = 8 * (v59 & 3);
      v62 = (unint64_t)(v61 + v47) <= 0x20 ? 8 : 4;
      if ((unint64_t)v60 < a1 || (unint64_t)v60 + v62 > v39)
        return result;
      result = 0;
      v63 = (((_DWORD)v32 + v33 + v20) >> 3) + v11;
      v64 = (_DWORD *)(v63 & 0xFFFFFFFFFFFFFFFCLL);
      v65 = 8 * (v63 & 3);
      v66 = (unint64_t)(v65 + v47) <= 0x20 ? 8 : 4;
      if ((unint64_t)v64 < a1 || (unint64_t)v64 + v66 > v39)
        return result;
      if ((_DWORD)v32)
      {
        v67 = *v50 >> v51;
        if ((unint64_t)(v51 + v32) >= 0x21)
          v67 |= v50[1] << -(char)v51;
        v68 = *v56 >> v57;
        if ((unint64_t)(v57 + v32) >= 0x21)
          v68 |= v56[1] << -(char)v57;
        v69 = v67 & v91;
        v70 = v68 & v91;
        if (!v97)
        {
LABEL_78:
          v74 = 0;
          v75 = 0;
          goto LABEL_79;
        }
      }
      else
      {
        v69 = 0;
        v70 = 0;
        if (!v97)
          goto LABEL_78;
      }
      v71 = v61 | v46;
      v72 = *v60 >> v71;
      if (v71 + (unint64_t)v97 >= 0x21)
        v72 |= v60[1] << -(char)v71;
      v73 = *v64 >> (v65 | v46);
      if ((v65 | v46) + (unint64_t)v97 >= 0x21)
        v73 |= v64[1] << -(v65 | v46);
      v74 = v72 & v48;
      v75 = v73 & v48;
LABEL_79:
      result = 0;
      if (v69 > v70 || v74 > v75)
        return result;
      v20 += v33;
      if (!--v35)
        goto LABEL_82;
    }
  }
  return result;
}

unint64_t sub_19C42E228(unint64_t a1, unsigned int a2, int a3, int a4, unint64_t a5, unsigned int a6)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  _DWORD *v13;
  unint64_t v14;
  int v15;
  char v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  int v28;
  unsigned int v29;
  unint64_t v30;
  BOOL v31;
  _BOOL4 v32;
  uint64_t v33;
  unint64_t v34;
  _DWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  int v40;

  v6 = 8 * (a1 & 3);
  v7 = a1 + 3;
  v8 = a4 + 1;
  v9 = 6 * a4;
  while (1)
  {
    v10 = *(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v6;
    if (v6 >= 9)
      v10 = (*(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFFCLL) + 4) << (32 - v6)) | (*(_DWORD *)(a1 & 0xFFFFFFFFFFFFFFFCLL) >> v6);
    if (v8 == 1)
      v11 = 0;
    else
      v11 = 24;
    if (v8 < a2)
    {
      v13 = (_DWORD *)((((v9 + 3) >> 3) + v7) & 0xFFFFFFFFFFFFFFFCLL);
      v14 = (v9 + 3) & 7 | (8 * ((((v9 + 3) >> 3) + v7) & 3));
      v15 = *v13 >> v14;
      if (v14 >= 0x1E)
        v15 |= v13[1] << -(char)v14;
      v12 = 4 * (v15 & 7);
    }
    else
    {
      v12 = 0;
    }
    v16 = 4 * (*(_DWORD *)(((v9 >> 3) + v7) & 0xFFFFFFFFFFFFFFFCLL) >> (v9 & 6 | (8 * (((v9 >> 3) + v7) & 3))));
    v17 = (v16 & 0x1C) + v11;
    v18 = ((v16 & 0x1C) + (_BYTE)v11 + (_BYTE)v12 + 7) & 0xF8;
    v19 = v18 * (a6 - 1);
    v20 = ((v19 + v11) >> 3) + a5;
    v21 = (_DWORD *)(v20 & 0xFFFFFFFFFFFFFFFCLL);
    v22 = 8 * (v20 & 3);
    v23 = v22 + (v16 & 0x1C);
    v24 = a1 + 4 * (v10 & 0xFFFFFFu);
    if (v23 <= 0x20)
      v25 = 2;
    else
      v25 = 1;
    v26 = &v21[v25];
    if ((unint64_t)v21 < a1 || (unint64_t)v26 > v24)
      return 0;
    if ((v16 & 0x1C) != 0)
    {
      v28 = *v21 >> v22;
      if (v23 >= 0x21)
        v28 |= v21[1] << -(char)v22;
      v29 = v28 & (0xFFFFFFFF >> -(v16 & 0x1C));
    }
    else
    {
      v29 = 0;
    }
    v30 = a5 + ((v29 * ((a3 + 31) & 0xFFFFFFF8)) >> 3) + ((v18 * a6) >> 3);
    v31 = v30 < a5 || v30 > v24;
    v32 = v31;
    if (v8 >= a2 || v32)
      break;
    v33 = (4
         * (*(_DWORD *)(((v9 >> 3) + v7) & 0xFFFFFFFFFFFFFFFCLL) >> (v9 & 6 | (8
                                                                                              * (((v9 >> 3) + v7) & 3))))) & 4;
    v34 = ((v19 + v17) >> 3) + a5;
    v35 = (_DWORD *)(v34 & 0xFFFFFFFFFFFFFFFCLL);
    v36 = 8 * (v34 & 3);
    if ((unint64_t)v12 + v33 + v36 <= 0x20)
      v37 = 2;
    else
      v37 = 1;
    v38 = &v35[v37];
    if ((unint64_t)v35 < a1 || (unint64_t)v38 > v24)
      return 0;
    a5 = v30;
    if (v12)
    {
      v40 = *v35 >> (v36 | v33);
      if ((v36 | v33) + (unint64_t)v12 >= 0x21)
        v40 |= v35[1] << -(v36 | v33);
      ++v8;
      v9 += 6;
      a6 = v40 & (0xFFFFFFFF >> -(char)v12);
      if (a6)
        continue;
    }
    return a5;
  }
  if (v32)
    return 0;
  else
    return v30;
}

uint64_t sub_19C42E49C(uint64_t result, char *a2, uint64_t a3, char a4)
{
  unsigned int *v7;
  unsigned int *v8;
  char *v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int *v22;
  char *v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  char *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int *v37;
  char *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unint64_t v48;
  unsigned int *v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  int *v53;
  unsigned int *v54;
  char *v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int *v64;
  unsigned int *v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int *v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  unsigned int v75;
  uint64_t v76;
  unsigned int *v77;
  unsigned int *v78;
  unsigned int v79;
  unsigned int v80;
  char *v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int *v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  BOOL v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int *v92;
  unsigned int *v93;
  unsigned int v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  int *v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  char *v116;
  BOOL v118;
  uint64_t v119;
  _DWORD *v120;
  unsigned int *v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  uint64_t v126;
  char *v127;
  int v128;
  int64_t v129;
  int64_t v130;
  BOOL v131;
  uint64_t v132;
  unsigned int *v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int *v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  _DWORD *v143;
  unsigned int v144;
  unsigned int v145;
  uint64_t v146;
  _DWORD *v147;
  _DWORD *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _DWORD *v153;
  unsigned int v154;
  unsigned int v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  char *v160;
  int v161;
  unsigned int v162;
  int v163;
  char *v164;
  unsigned int v165;
  unsigned int v166;
  int v167;

  v7 = (unsigned int *)result;
LABEL_2:
  v8 = (unsigned int *)(a2 - 8);
  v9 = a2 - 4;
  v10 = v7;
  while (2)
  {
    v7 = v10;
    v11 = a2 - (char *)v10;
    v12 = (a2 - (char *)v10) >> 3;
    switch(v12)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v100 = *v10;
        if (*v8 < *v10)
        {
          *v10 = *v8;
          *v8 = v100;
          v101 = v10[1];
          v10[1] = *(_DWORD *)v9;
          *(_DWORD *)v9 = v101;
        }
        return result;
      case 3:
        v102 = v10[2];
        v103 = *v10;
        v104 = *v8;
        if (v102 >= *v10)
        {
          if (v104 >= v102)
            return result;
          v10[2] = v104;
          *v8 = v102;
          v140 = v10[3];
          v10[3] = *(_DWORD *)v9;
          *(_DWORD *)v9 = v140;
          v141 = v10[2];
          v142 = *v10;
          if (v141 >= *v10)
            return result;
          *v10 = v141;
          v10[2] = v142;
          v105 = (int *)(v10 + 1);
          v9 = (char *)(v10 + 3);
        }
        else
        {
          if (v104 >= v102)
          {
            v105 = (int *)(v10 + 3);
            v165 = v10[3];
            v166 = v10[1];
            *v10 = v102;
            v10[1] = v165;
            v10[2] = v103;
            v10[3] = v166;
            if (*v8 >= v103)
              return result;
            v10[2] = *v8;
          }
          else
          {
            v105 = (int *)(v10 + 1);
            *v10 = v104;
          }
          *v8 = v103;
        }
        v167 = *v105;
        *v105 = *(_DWORD *)v9;
        *(_DWORD *)v9 = v167;
        return result;
      case 4:
        return (uint64_t)sub_19C42EFC8((int *)v10, v10 + 2, v10 + 4, (unsigned int *)a2 - 2);
      case 5:
        result = (uint64_t)sub_19C42EFC8((int *)v10, v10 + 2, v10 + 4, v10 + 6);
        v106 = v10[6];
        if (*v8 < v106)
        {
          v10[6] = *v8;
          *v8 = v106;
          v107 = v10[7];
          v10[7] = *(_DWORD *)v9;
          *(_DWORD *)v9 = v107;
          v108 = v10[6];
          v109 = v10[4];
          if (v108 < v109)
          {
            v110 = v10[5];
            v111 = v10[7];
            v10[4] = v108;
            v10[5] = v111;
            v10[6] = v109;
            v10[7] = v110;
            v112 = v10[2];
            if (v108 < v112)
            {
              v113 = v10[3];
              v10[2] = v108;
              v10[3] = v111;
              v10[4] = v112;
              v10[5] = v113;
              v114 = *v10;
              if (v108 < *v10)
              {
                v115 = v10[1];
                *v10 = v108;
                v10[1] = v111;
                v10[2] = v114;
                v10[3] = v115;
              }
            }
          }
        }
        return result;
      default:
        if (v11 <= 191)
        {
          v116 = (char *)(v10 + 2);
          v118 = v10 == (unsigned int *)a2 || v116 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v118)
            {
              v119 = 0;
              v120 = v10;
              do
              {
                v122 = v120[2];
                v123 = *v120;
                v120 = v116;
                if (v122 < v123)
                {
                  v125 = *(_DWORD *)v116;
                  v124 = *((_DWORD *)v116 + 1);
                  v126 = v119;
                  do
                  {
                    v127 = (char *)v10 + v126;
                    v128 = *(unsigned int *)((char *)v10 + v126 + 4);
                    *((_DWORD *)v127 + 2) = v123;
                    *((_DWORD *)v127 + 3) = v128;
                    if (!v126)
                    {
                      v121 = v10;
                      goto LABEL_126;
                    }
                    v123 = *((_DWORD *)v127 - 2);
                    v126 -= 8;
                  }
                  while (v123 > v125);
                  v121 = (unsigned int *)((char *)v10 + v126 + 8);
LABEL_126:
                  *v121 = v125;
                  v121[1] = v124;
                }
                v116 = (char *)(v120 + 2);
                v119 += 8;
              }
              while (v120 + 2 != (_DWORD *)a2);
            }
          }
          else if (!v118)
          {
            v143 = v10 + 3;
            do
            {
              v144 = v7[2];
              v145 = *v7;
              v7 = (unsigned int *)v116;
              if (v144 < v145)
              {
                v146 = *(_QWORD *)v116;
                v147 = v143;
                do
                {
                  v148 = v147;
                  *(v147 - 1) = v145;
                  v149 = *(v147 - 2);
                  v147 -= 2;
                  *v148 = v149;
                  v145 = *(v148 - 5);
                }
                while (v145 > v146);
                *(_QWORD *)(v147 - 1) = v146;
              }
              v116 = (char *)(v7 + 2);
              v143 += 2;
            }
            while (v7 + 2 != (unsigned int *)a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v10 != (unsigned int *)a2)
          {
            v129 = (unint64_t)(v12 - 2) >> 1;
            v130 = v129;
            do
            {
              if (v129 >= v130)
              {
                v132 = (2 * v130) | 1;
                v133 = &v10[2 * v132];
                if (2 * v130 + 2 >= v12)
                {
                  v134 = *v133;
                }
                else
                {
                  v134 = *v133;
                  v135 = v133[2];
                  if (*v133 <= v135)
                    v134 = v133[2];
                  if (*v133 < v135)
                  {
                    v133 += 2;
                    v132 = 2 * v130 + 2;
                  }
                }
                v136 = &v10[2 * v130];
                if (v134 >= *v136)
                {
                  v137 = *v136;
                  v138 = v136[1];
                  while (1)
                  {
                    result = (uint64_t)v136;
                    v136 = v133;
                    *(_DWORD *)result = v134;
                    *(_DWORD *)(result + 4) = v133[1];
                    if (v129 < v132)
                      break;
                    result = (2 * v132) | 1;
                    v133 = &v10[2 * result];
                    v132 = 2 * v132 + 2;
                    if (v132 < v12)
                    {
                      v134 = *v133;
                      v139 = v133[2];
                      if (*v133 <= v139)
                        v134 = v133[2];
                      if (*v133 >= v139)
                        v132 = result;
                      else
                        v133 += 2;
                      if (v134 < v137)
                        break;
                    }
                    else
                    {
                      v134 = *v133;
                      v132 = result;
                      if (*v133 < v137)
                        break;
                    }
                  }
                  *v136 = v137;
                  v136[1] = v138;
                }
              }
              v131 = v130-- <= 0;
            }
            while (!v131);
            v150 = (unint64_t)v11 >> 3;
            do
            {
              v151 = 0;
              v152 = *(_QWORD *)v10;
              v153 = v10;
              do
              {
                v156 = (char *)&v153[2 * v151 + 2];
                v157 = (2 * v151) | 1;
                v151 = 2 * v151 + 2;
                if (v151 < v150)
                {
                  v154 = *(_DWORD *)v156;
                  v155 = *((_DWORD *)v156 + 2);
                  if (*(_DWORD *)v156 <= v155)
                    v154 = *((_DWORD *)v156 + 2);
                  if (*(_DWORD *)v156 >= v155)
                    v151 = v157;
                  else
                    v156 += 8;
                }
                else
                {
                  v154 = *(_DWORD *)v156;
                  v151 = v157;
                }
                *v153 = v154;
                v153[1] = *((_DWORD *)v156 + 1);
                v153 = v156;
              }
              while (v151 <= (uint64_t)((unint64_t)(v150 - 2) >> 1));
              if (v156 == a2 - 8)
              {
                *(_QWORD *)v156 = v152;
              }
              else
              {
                *(_DWORD *)v156 = *((_DWORD *)a2 - 2);
                *((_DWORD *)v156 + 1) = *((_DWORD *)a2 - 1);
                *((_QWORD *)a2 - 1) = v152;
                v158 = v156 - (char *)v10 + 8;
                if (v158 >= 9)
                {
                  v159 = (((unint64_t)v158 >> 3) - 2) >> 1;
                  v160 = (char *)&v10[2 * v159];
                  v161 = *(_DWORD *)v160;
                  if (*(_DWORD *)v160 < *(_DWORD *)v156)
                  {
                    v162 = *(_DWORD *)v156;
                    v163 = *((_DWORD *)v156 + 1);
                    do
                    {
                      v164 = v156;
                      v156 = v160;
                      *(_DWORD *)v164 = v161;
                      *((_DWORD *)v164 + 1) = *((_DWORD *)v160 + 1);
                      if (!v159)
                        break;
                      v159 = (v159 - 1) >> 1;
                      v160 = (char *)&v10[2 * v159];
                      v161 = *(_DWORD *)v160;
                    }
                    while (*(_DWORD *)v160 < v162);
                    *(_DWORD *)v156 = v162;
                    *((_DWORD *)v156 + 1) = v163;
                  }
                }
              }
              a2 -= 8;
              v131 = v150-- <= 2;
            }
            while (!v131);
          }
          return result;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = &v10[2 * ((unint64_t)v12 >> 1)];
        v15 = *v8;
        if ((unint64_t)v11 >= 0x401)
        {
          v16 = *v14;
          v17 = *v10;
          if (*v14 >= *v10)
          {
            if (v15 < v16)
            {
              *v14 = v15;
              *v8 = v16;
              v22 = &v10[2 * v13];
              v24 = v22[1];
              v23 = (char *)(v22 + 1);
              *(_DWORD *)v23 = *(_DWORD *)v9;
              *(_DWORD *)v9 = v24;
              v25 = *v10;
              if (*v14 < *v10)
              {
                *v10 = *v14;
                v18 = v10 + 1;
                *v14 = v25;
                goto LABEL_22;
              }
            }
          }
          else
          {
            if (v15 < v16)
            {
              v18 = v10 + 1;
              *v10 = v15;
              goto LABEL_21;
            }
            *v10 = v16;
            *v14 = v17;
            v29 = v10[1];
            v18 = &v10[2 * v13 + 1];
            v10[1] = *v18;
            *v18 = v29;
            if (*v8 < v17)
            {
              *v14 = *v8;
LABEL_21:
              *v8 = v17;
              v23 = a2 - 4;
LABEL_22:
              v30 = *v18;
              *v18 = *(_DWORD *)v23;
              *(_DWORD *)v23 = v30;
            }
          }
          v31 = v13 - 1;
          v32 = &v10[2 * v13 - 2];
          v33 = *v32;
          v34 = v10[2];
          v35 = *((_DWORD *)a2 - 4);
          if (*v32 >= v34)
          {
            if (v35 < v33)
            {
              *v32 = v35;
              *((_DWORD *)a2 - 4) = v33;
              v37 = &v10[2 * v31];
              v39 = v37[1];
              v38 = (char *)(v37 + 1);
              *(_DWORD *)v38 = *((_DWORD *)a2 - 3);
              *((_DWORD *)a2 - 3) = v39;
              v40 = v10[2];
              if (*v32 < v40)
              {
                v10[2] = *v32;
                *v32 = v40;
                v36 = v10 + 3;
                goto LABEL_35;
              }
            }
          }
          else
          {
            if (v35 < v33)
            {
              v36 = v10 + 3;
              v10[2] = v35;
              goto LABEL_34;
            }
            v43 = &v10[2 * v31];
            v44 = v43[1];
            v36 = v43 + 1;
            v45 = v10[3];
            v10[2] = v33;
            v10[3] = v44;
            *v32 = v34;
            *v36 = v45;
            v46 = *((_DWORD *)a2 - 4);
            if (v46 < v34)
            {
              *v32 = v46;
LABEL_34:
              *((_DWORD *)a2 - 4) = v34;
              v38 = a2 - 12;
LABEL_35:
              v47 = *v36;
              *v36 = *(_DWORD *)v38;
              *(_DWORD *)v38 = v47;
            }
          }
          v48 = v13 + 1;
          v49 = &v10[2 * v13 + 2];
          v50 = *v49;
          v51 = v10[4];
          v52 = *((_DWORD *)a2 - 6);
          if (*v49 >= v51)
          {
            if (v52 < v50)
            {
              *v49 = v52;
              *((_DWORD *)a2 - 6) = v50;
              v54 = &v10[2 * v48];
              v56 = v54[1];
              v55 = (char *)(v54 + 1);
              *(_DWORD *)v55 = *((_DWORD *)a2 - 5);
              *((_DWORD *)a2 - 5) = v56;
              v50 = *v49;
              v57 = v10[4];
              if (*v49 < v57)
              {
                v10[4] = v50;
                *v49 = v57;
                v53 = (int *)(v10 + 5);
                goto LABEL_45;
              }
            }
          }
          else
          {
            if (v52 < v50)
            {
              v53 = (int *)(v10 + 5);
              v10[4] = v52;
              goto LABEL_44;
            }
            v58 = &v10[2 * v48];
            v59 = v58[1];
            v53 = (int *)(v58 + 1);
            result = v10[5];
            v10[4] = v50;
            v10[5] = v59;
            *v49 = v51;
            *v53 = result;
            v60 = *((_DWORD *)a2 - 6);
            if (v60 >= v51)
            {
              v50 = v51;
            }
            else
            {
              *v49 = v60;
LABEL_44:
              *((_DWORD *)a2 - 6) = v51;
              v55 = a2 - 20;
LABEL_45:
              v61 = *v53;
              *v53 = *(_DWORD *)v55;
              *(_DWORD *)v55 = v61;
              v50 = *v49;
            }
          }
          v62 = *v14;
          v63 = *v32;
          if (*v14 >= *v32)
          {
            if (v50 < v62)
            {
              *v14 = v50;
              v66 = &v10[2 * v13];
              v67 = v66[1];
              v65 = v66 + 1;
              result = v67;
              *v49 = v62;
              v68 = &v10[2 * v48];
              *v65 = v68[1];
              v68[1] = v67;
              if (v50 < v63)
              {
                *v32 = v50;
                *v14 = v63;
                v64 = &v10[2 * v31 + 1];
                goto LABEL_54;
              }
              v62 = v50;
            }
          }
          else
          {
            v64 = &v10[2 * v31 + 1];
            if (v50 < v62)
            {
              *v32 = v50;
              *v49 = v63;
              v65 = &v10[2 * v48 + 1];
              goto LABEL_54;
            }
            *v32 = v62;
            *v14 = v63;
            v69 = &v10[2 * v13];
            v71 = v69[1];
            v70 = v69 + 1;
            v72 = *v64;
            *v64 = v71;
            *v70 = v72;
            if (v50 >= v63)
            {
              v62 = v63;
            }
            else
            {
              *v14 = v50;
              *v49 = v63;
              v65 = &v10[2 * v48 + 1];
              v64 = v70;
LABEL_54:
              v73 = *v64;
              *v64 = *v65;
              *v65 = v73;
              v62 = *v14;
            }
          }
          v74 = *v10;
          *v10 = v62;
          v21 = v10 + 1;
          *v14 = v74;
          v27 = (char *)&v10[2 * v13 + 1];
LABEL_56:
          v75 = *v21;
          *v21 = *(_DWORD *)v27;
          *(_DWORD *)v27 = v75;
          goto LABEL_57;
        }
        v19 = *v10;
        v20 = *v14;
        if (*v10 < *v14)
        {
          v21 = &v10[2 * v13 + 1];
          if (v15 >= v19)
          {
            *v14 = v19;
            v41 = v10[1];
            *v10 = v20;
            v42 = *v21;
            *v21 = v41;
            v10[1] = v42;
            if (*v8 >= v20)
              goto LABEL_57;
            *v10 = *v8;
            *v8 = v20;
            v21 = v10 + 1;
          }
          else
          {
            *v14 = v15;
            *v8 = v20;
          }
          v27 = a2 - 4;
          goto LABEL_56;
        }
        if (v15 < v19)
        {
          *v10 = v15;
          *v8 = v19;
          v27 = (char *)(v10 + 1);
          v26 = v10[1];
          v10[1] = *(_DWORD *)v9;
          *(_DWORD *)v9 = v26;
          v28 = *v14;
          if (*v10 < *v14)
          {
            *v14 = *v10;
            *v10 = v28;
            v21 = &v10[2 * v13 + 1];
            goto LABEL_56;
          }
        }
LABEL_57:
        --a3;
        if ((a4 & 1) == 0 && *(v10 - 2) >= *v10)
        {
          v90 = *(_QWORD *)v10;
          if (*v8 <= *(_QWORD *)v10)
          {
            v92 = v10 + 2;
            do
            {
              v10 = v92;
              if (v92 >= (unsigned int *)a2)
                break;
              v92 += 2;
            }
            while (*v10 <= v90);
          }
          else
          {
            do
            {
              v91 = v10[2];
              v10 += 2;
            }
            while (v91 <= v90);
          }
          v93 = (unsigned int *)a2;
          if (v10 < (unsigned int *)a2)
          {
            v93 = (unsigned int *)a2;
            do
            {
              v94 = *(v93 - 2);
              v93 -= 2;
            }
            while (v94 > v90);
          }
          if (v10 < v93)
          {
            v95 = *v10;
            v96 = *v93;
            do
            {
              *v10 = v96;
              *v93 = v95;
              v97 = v10[1];
              v10[1] = v93[1];
              v93[1] = v97;
              do
              {
                v98 = v10[2];
                v10 += 2;
                v95 = v98;
              }
              while (v98 <= v90);
              do
              {
                v99 = *(v93 - 2);
                v93 -= 2;
                v96 = v99;
              }
              while (v99 > v90);
            }
            while (v10 < v93);
          }
          if (v10 - 2 != v7)
          {
            *v7 = *(v10 - 2);
            v7[1] = *(v10 - 1);
          }
          a4 = 0;
          *((_QWORD *)v10 - 1) = v90;
          continue;
        }
        v76 = *(_QWORD *)v10;
        v77 = v10;
        do
        {
          v78 = v77;
          v80 = v77[2];
          v77 += 2;
          v79 = v80;
        }
        while (v80 < v76);
        v81 = a2;
        if (v78 == v10)
        {
          v81 = a2;
          do
          {
            if (v77 >= (unsigned int *)v81)
              break;
            v83 = *((_DWORD *)v81 - 2);
            v81 -= 8;
          }
          while (v83 >= v76);
        }
        else
        {
          do
          {
            v82 = *((_DWORD *)v81 - 2);
            v81 -= 8;
          }
          while (v82 >= v76);
        }
        if (v77 >= (unsigned int *)v81)
        {
          v10 = v77;
        }
        else
        {
          v84 = *(_DWORD *)v81;
          v10 = v77;
          v85 = (unsigned int *)v81;
          do
          {
            *v10 = v84;
            *v85 = v79;
            v86 = v10[1];
            v10[1] = v85[1];
            v85[1] = v86;
            do
            {
              v87 = v10[2];
              v10 += 2;
              v79 = v87;
            }
            while (v87 < v76);
            do
            {
              v88 = *(v85 - 2);
              v85 -= 2;
              v84 = v88;
            }
            while (v88 >= v76);
          }
          while (v10 < v85);
        }
        if (v10 - 2 != v7)
        {
          *v7 = *(v10 - 2);
          v7[1] = *(v10 - 1);
        }
        *((_QWORD *)v10 - 1) = v76;
        if (v77 < (unsigned int *)v81)
        {
LABEL_80:
          result = sub_19C42E49C(v7, v10 - 2, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v89 = sub_19C42F0F8(v7, (char *)v10 - 8);
        result = sub_19C42F0F8(v10, a2);
        if (!(_DWORD)result)
        {
          if (v89)
            continue;
          goto LABEL_80;
        }
        a2 = (char *)(v10 - 2);
        if (!v89)
          goto LABEL_2;
        return result;
    }
  }
}

int *sub_19C42EFC8(int *result, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int *v7;
  unsigned int v8;
  int *v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;

  v4 = *a2;
  v5 = *result;
  v6 = *a3;
  if (*a2 >= *result)
  {
    if (v6 < v4)
    {
      *a2 = v6;
      *a3 = v4;
      v9 = (int *)(a2 + 1);
      v8 = a2[1];
      a2[1] = a3[1];
      a3[1] = v8;
      v10 = *result;
      if (*a2 < *result)
      {
        *result = *a2;
        v7 = result + 1;
        *a2 = v10;
LABEL_10:
        v12 = *v7;
        *v7 = *v9;
        *v9 = v12;
      }
    }
  }
  else
  {
    if (v6 < v4)
    {
      v7 = result + 1;
      *result = v6;
LABEL_9:
      *a3 = v5;
      v9 = (int *)(a3 + 1);
      goto LABEL_10;
    }
    *result = v4;
    *a2 = v5;
    v7 = (int *)(a2 + 1);
    v11 = result[1];
    result[1] = a2[1];
    a2[1] = v11;
    v5 = *a2;
    if (*a3 < *a2)
    {
      *a2 = *a3;
      goto LABEL_9;
    }
  }
  v13 = *a3;
  if (*a4 < *a3)
  {
    *a3 = *a4;
    *a4 = v13;
    v14 = a3[1];
    a3[1] = a4[1];
    a4[1] = v14;
    v15 = *a2;
    if (*a3 < *a2)
    {
      *a2 = *a3;
      *a3 = v15;
      v16 = a2[1];
      a2[1] = a3[1];
      a3[1] = v16;
      v17 = *result;
      if (*a2 < *result)
      {
        *result = *a2;
        *a2 = v17;
        v18 = result[1];
        result[1] = a2[1];
        a2[1] = v18;
      }
    }
  }
  return result;
}

BOOL sub_19C42F0F8(unsigned int *a1, char *a2)
{
  uint64_t v4;
  _BOOL8 result;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int *v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  char *v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  int *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  char *v43;
  uint64_t v44;
  int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  _DWORD *v51;
  int v52;

  v4 = (a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *((_DWORD *)a2 - 2);
      v7 = *a1;
      if (v6 < *a1)
      {
        *a1 = v6;
        *((_DWORD *)a2 - 2) = v7;
        v8 = a1[1];
        a1[1] = *((_DWORD *)a2 - 1);
        *((_DWORD *)a2 - 1) = v8;
      }
      return result;
    case 3:
      v9 = a1[2];
      v10 = *a1;
      v11 = *((_DWORD *)a2 - 2);
      if (v9 < *a1)
      {
        if (v11 >= v9)
        {
          v12 = (int *)(a1 + 3);
          v36 = a1[3];
          v37 = a1[1];
          *a1 = v9;
          a1[1] = v36;
          a1[2] = v10;
          a1[3] = v37;
          v38 = *((_DWORD *)a2 - 2);
          if (v38 >= v10)
            return result;
          a1[2] = v38;
        }
        else
        {
          v12 = (int *)(a1 + 1);
          *a1 = v11;
        }
        *((_DWORD *)a2 - 2) = v10;
        v30 = a2 - 4;
        goto LABEL_25;
      }
      if (v11 < v9)
      {
        a1[2] = v11;
        *((_DWORD *)a2 - 2) = v9;
        v30 = (char *)(a1 + 3);
        v29 = a1[3];
        a1[3] = *((_DWORD *)a2 - 1);
        *((_DWORD *)a2 - 1) = v29;
        v31 = a1[2];
        v32 = *a1;
        if (v31 < *a1)
        {
          *a1 = v31;
          a1[2] = v32;
          v12 = (int *)(a1 + 1);
LABEL_25:
          v39 = *v12;
          *v12 = *(_DWORD *)v30;
          *(_DWORD *)v30 = v39;
          return result;
        }
      }
      return result;
    case 4:
      sub_19C42EFC8((int *)a1, a1 + 2, a1 + 4, (unsigned int *)a2 - 2);
      return 1;
    case 5:
      sub_19C42EFC8((int *)a1, a1 + 2, a1 + 4, a1 + 6);
      v18 = *((_DWORD *)a2 - 2);
      v19 = a1[6];
      if (v18 < v19)
      {
        a1[6] = v18;
        *((_DWORD *)a2 - 2) = v19;
        v20 = a1[7];
        a1[7] = *((_DWORD *)a2 - 1);
        *((_DWORD *)a2 - 1) = v20;
        v21 = a1[6];
        v22 = a1[4];
        if (v21 < v22)
        {
          v23 = a1[5];
          v24 = a1[7];
          a1[4] = v21;
          a1[5] = v24;
          a1[6] = v22;
          a1[7] = v23;
          v25 = a1[2];
          if (v21 < v25)
          {
            v26 = a1[3];
            a1[2] = v21;
            a1[3] = v24;
            a1[4] = v25;
            a1[5] = v26;
            v27 = *a1;
            if (v21 < *a1)
            {
              v28 = a1[1];
              *a1 = v21;
              a1[1] = v24;
              a1[2] = v27;
              a1[3] = v28;
            }
          }
        }
      }
      return 1;
    default:
      v13 = (char *)(a1 + 4);
      v14 = a1[4];
      v15 = a1[2];
      v16 = *a1;
      if (v15 < *a1)
      {
        if (v14 >= v15)
        {
          v17 = (int *)(a1 + 3);
          v40 = a1[3];
          v41 = a1[1];
          *a1 = v15;
          a1[1] = v40;
          a1[2] = v16;
          a1[3] = v41;
          if (v14 >= v16)
            goto LABEL_30;
          a1[2] = v14;
        }
        else
        {
          v17 = (int *)(a1 + 1);
          *a1 = v14;
        }
        a1[4] = v16;
        v34 = (int *)(a1 + 5);
        goto LABEL_29;
      }
      if (v14 < v15)
      {
        v34 = (int *)(a1 + 3);
        v33 = a1[3];
        v35 = a1[5];
        a1[4] = v15;
        a1[5] = v33;
        a1[2] = v14;
        a1[3] = v35;
        if (v14 < v16)
        {
          *a1 = v14;
          a1[2] = v16;
          v17 = (int *)(a1 + 1);
LABEL_29:
          v42 = *v17;
          *v17 = *v34;
          *v34 = v42;
        }
      }
LABEL_30:
      v43 = (char *)(a1 + 6);
      if (a1 + 6 == (unsigned int *)a2)
        return 1;
      v44 = 0;
      v45 = 0;
      while (1)
      {
        v47 = *(_DWORD *)v13;
        if (*(_DWORD *)v43 < *(_DWORD *)v13)
        {
          v49 = *(_DWORD *)v43;
          v48 = *((_DWORD *)v43 + 1);
          v50 = v44;
          do
          {
            v51 = (unsigned int *)((char *)a1 + v50);
            v52 = *(unsigned int *)((char *)a1 + v50 + 20);
            v51[6] = v47;
            v51[7] = v52;
            if (v50 == -16)
            {
              v46 = a1;
              goto LABEL_33;
            }
            v47 = v51[2];
            v50 -= 8;
          }
          while (v47 > v49);
          v46 = (unsigned int *)((char *)a1 + v50 + 24);
LABEL_33:
          *v46 = v49;
          v46[1] = v48;
          if (++v45 == 8)
            return v43 + 8 == a2;
        }
        v13 = v43;
        v44 += 8;
        v43 += 8;
        if (v43 == a2)
          return 1;
      }
  }
}

uint64_t sub_19C42F404(uint64_t a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 68;
  result = 126;
  switch(v1)
  {
    case 0:
    case 2:
      return result;
    case 1:
    case 3:
      result = 123;
      break;
    case 4:
    case 59:
    case 60:
      result = a1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__n128 sub_19C42F448(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void sub_19C42F46C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void sub_19C42F484(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  double v4;
  unint64_t v5;
  double *v6;
  double *v7;
  double *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  double *v16;
  char *v17;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(double *)(a2 + 16) + *(double *)(*(_QWORD *)(a1 + 40) + 104);
  v6 = (double *)v3[6];
  v5 = v3[7];
  if ((unint64_t)v6 >= v5)
  {
    v8 = (double *)v3[5];
    v9 = ((char *)v6 - (char *)v8) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      sub_19C2A18E8();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13 >> 60)
      sub_19C2A143C();
    v14 = 16 * v13;
    v15 = (char *)operator new(16 * v13);
    v16 = (double *)&v15[16 * v9];
    *(_DWORD *)v16 = *(_DWORD *)(a2 + 4);
    v16[1] = v4;
    v7 = v16 + 2;
    if (v6 == v8)
    {
      v17 = &v15[16 * v9];
    }
    else
    {
      do
      {
        v17 = (char *)(v16 - 2);
        *((_OWORD *)v16 - 1) = *((_OWORD *)v6 - 1);
        v6 -= 2;
        v16 -= 2;
      }
      while (v6 != v8);
    }
    v3[5] = v17;
    v3[6] = v7;
    v3[7] = &v15[v14];
    if (v8)
      operator delete(v8);
  }
  else
  {
    *(_DWORD *)v6 = *(_DWORD *)(a2 + 4);
    v6[1] = v4;
    v7 = v6 + 2;
  }
  v3[6] = v7;
}

uint64_t sub_19C42F5A0(uint64_t *a1, const UInt8 *a2, const __CFString *cf, char a4)
{
  const __CFString *v6;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  const void *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  void *exception;
  unsigned int v19;
  CFStringRef v20;
  void *__p[2];
  char v22;
  uint8_t buf[4];
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (cf)
  {
    v6 = cf;
    CFRetain(cf);
    v20 = v6;
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    if (*((char *)a2 + 23) >= 0)
    {
      v8 = a2[23];
    }
    else
    {
      a2 = *(const UInt8 **)a2;
      v8 = v7;
    }
    v6 = CFStringCreateWithBytes(0, a2, v8, 0x8000100u, 0);
    v20 = v6;
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A1AD3154](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
  }
  if ((a4 & 1) == 0 && !sub_19C42F894(&v20))
  {
    v14 = 0;
    goto LABEL_28;
  }
  v19 = 0;
  v9 = *a1;
  v10 = *(_QWORD *)(*a1 + 464);
  if (!v10)
  {
    sub_19C32F738(v9, v6, (int *)&v19);
    v14 = v19;
    if (v19)
      goto LABEL_28;
    goto LABEL_21;
  }
  std::recursive_mutex::lock((std::recursive_mutex *)v10);
  v11 = *(_QWORD **)(v10 + 152);
  v12 = *(_QWORD **)(v10 + 160);
  if (v11 == v12)
  {
LABEL_13:
    v13 = 0;
  }
  else
  {
    while (*v11 != v9)
    {
      v11 += 2;
      if (v11 == v12)
        goto LABEL_13;
    }
    v13 = (const void *)v11[1];
  }
  sub_19C3C2C78(__p, *(_QWORD *)(v10 + 104), *(_QWORD *)(v10 + 112));
  sub_19C3C1DEC(v6, (int *)&v19, *(_QWORD *)(v10 + 128), (uint64_t)__p, *(const void **)(v10 + 176), v13);
  if (__p[0])
    operator delete(__p[0]);
  std::recursive_mutex::unlock((std::recursive_mutex *)v10);
  v14 = v19;
  if (!v19)
  {
LABEL_21:
    v15 = (char *)operator new(0x20uLL);
    strcpy(v15, "addTokenForString() failed");
    sub_19C34EC30("addTokenForString() failed for: %@", (uint64_t)__p, v6);
    if (qword_1EDB97228 != -1)
      dispatch_once(&qword_1EDB97228, &unk_1E3D3ABD0);
    v16 = qword_1EDB97220;
    if (os_log_type_enabled((os_log_t)qword_1EDB97220, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = v15;
      _os_log_impl(&dword_19C291000, v16, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
    if (v22 < 0)
      operator delete(__p[0]);
    operator delete(v15);
    v14 = v19;
  }
LABEL_28:
  CFRelease(v6);
  return v14;
}

void sub_19C42F814(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C42F828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p)
{
  void *v12;

  operator delete(v12);
  sub_19C2E5670(&a11);
  _Unwind_Resume(a1);
}

uint64_t sub_19C42F894(CFStringRef *a1)
{
  uint64_t Length;
  uint64_t v3;
  UniChar *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int8_t v11;
  unsigned __int16 *v12;
  UChar32 v13;
  unsigned int v14;
  uint64_t v15;
  int8_t v18;
  _QWORD v20[2];
  CFRange v21;

  v20[1] = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(*a1);
  MEMORY[0x1E0C80A78]();
  v4 = (UniChar *)((char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21.location = 0;
  v21.length = Length;
  CFStringGetCharacters(*a1, v21, v4);
  v5 = 0;
  v6 = Length - 1;
  if (Length < 1)
    return v5;
  v7 = *v4;
  if (v7 <= 0x2D && ((1 << v7) & 0x20C000000000) != 0)
    return v5;
  if (v7 - 1523 < 2 || v7 == 8217)
    return v5;
  v11 = u_charType(v7);
  if (((1 << v11) & 0x40003FE) == 0)
    return 0;
  v5 = (0x3Eu >> v11) & 1;
  if (Length == 1)
  {
    if (!(_DWORD)v5)
      return v5;
    v5 = 1;
  }
  else
  {
    v12 = v4 + 1;
    do
    {
      while (1)
      {
        v14 = *v12++;
        v13 = v14;
        v15 = (1 << v14) & 0x20C000000000;
        if ((v14 > 0x2D || v15 == 0) && (v13 - 1523) >= 2 && v13 != 8217)
          break;
        if (v6 == 1)
          return 0;
        if (!--v6)
          goto LABEL_31;
      }
      v18 = u_charType(v13);
      if (((0x40003FEu >> v18) & 1) == 0)
        return 0;
      v5 = ((0x3Eu >> v18) & 1) + v5;
      --v6;
    }
    while (v6);
LABEL_31:
    if (!(_DWORD)v5)
      return v5;
  }
  if ((float)((float)v5 / (float)Length) < 0.49 || Length - v5 > 3)
    return 0;
  return v5;
}

_QWORD *sub_19C42FA70(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  _QWORD v10[3];
  _QWORD *v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = v10;
  v8[0] = &off_1E3D303D0;
  v8[1] = a1;
  v9 = v8;
  v10[0] = &off_1E3D38A00;
  v12[0] = &off_1E3D30428;
  v12[1] = v8;
  v13 = v12;
  sub_19C3A5C98(a2, (uint64_t)v10, (uint64_t)v12);
  v2 = v13;
  if (v13 == v12)
  {
    v3 = 4;
    v2 = v12;
  }
  else
  {
    if (!v13)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
  }
  else
  {
    if (!v9)
      goto LABEL_11;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_11:
  result = v11;
  if (v11 == v10)
  {
    v7 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v7 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
}

void sub_19C42FB94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  v21 = a13;
  if (a13 == &a10)
  {
    v22 = 4;
    v21 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  v23 = a17;
  if (a17 == &a14)
  {
    v24 = 4;
    v23 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_16;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_16:
  _Unwind_Resume(exception_object);
}

void sub_19C42FC34()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C42FC48(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D303D0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C42FC7C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D303D0;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C42FC98(uint64_t a1, const UInt8 *a2, const __CFString **a3, _DWORD *a4)
{
  return sub_19C42F5A0(*(uint64_t **)(a1 + 8), a2, *a3, *a4 != 0);
}

uint64_t sub_19C42FCB0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_1"
    || ((v3 & (unint64_t)"ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_1")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C42FD04()
{
  return &unk_1E3D33480;
}

void sub_19C42FD14()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C42FD28()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E3D38A00;
  return result;
}

void sub_19C42FD4C(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E3D38A00;
}

BOOL sub_19C42FD64(uint64_t a1, _DWORD *a2)
{
  return (*a2 - 500) < 0xFFFFFE0D;
}

uint64_t sub_19C42FD78(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v112TokenLearner17learnFromSequenceERNS0_13TokenSequenceEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C42FDCC()
{
  return &unk_1E3D33470;
}

void sub_19C42FDDC(_QWORD *a1)
{
  sub_19C3A6ED0(a1);
  JUMPOUT(0x1A1AD355CLL);
}

float sub_19C42FE00(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 256;
  if (a2 == 1)
    v2 = 216;
  return *(float *)(*(_QWORD *)(a1 + 24) + v2);
}

float sub_19C42FE1C(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 304;
  if (a2 == 1)
    v2 = 220;
  return *(float *)(*(_QWORD *)(a1 + 24) + v2);
}

uint64_t sub_19C42FE38(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 24) + 368);
}

const char *sub_19C42FE44()
{
  return "dynamic model";
}

uint64_t sub_19C42FE50()
{
  return 5;
}

void sub_19C42FE5C(_QWORD *a1)
{
  sub_19C4068E8(a1);
  JUMPOUT(0x1A1AD355CLL);
}

uint64_t sub_19C42FE80(uint64_t a1)
{
  unint64_t v1;
  float *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  size_t v14;
  char *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  _DWORD *v19;
  char *v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  int *v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;
  unint64_t v30;
  _QWORD *v31;
  double v32;
  uint64_t v33;
  float *v34;
  float v35;
  unint64_t v36;
  _QWORD *v37;
  float *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  float *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  float *v57;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  char v65;
  uint64_t v66;
  _BYTE *__src;
  char *v68;
  uint64_t v69;
  void **v70;
  void *__p;

  v1 = *(_QWORD *)(a1 + 80) + 1;
  *(_QWORD *)(a1 + 80) = v1;
  if (v1 > *(_QWORD *)(a1 + 64))
    return 0;
  v3 = *(float **)(a1 + 128);
  if (*(float **)(a1 + 136) == v3)
  {
    v3 = *(float **)(a1 + 136);
    goto LABEL_68;
  }
  if (*(double *)(a1 + 96) < 0.5)
    goto LABEL_68;
  v65 = 0;
  v66 = a1 + 152;
  do
  {
    v6 = *(_QWORD *)(a1 + 128);
    v5 = *(_QWORD *)(a1 + 136);
    v7 = (uint64_t)(v5 - v6) >> 3;
    if (v7 >= *(_QWORD *)(a1 + 56))
      break;
    v8 = *(_BYTE **)(a1 + 104);
    v9 = *(_BYTE **)(a1 + 112);
    v10 = v9 - v8;
    v11 = (v9 - v8) >> 2;
    __p = 0;
    v12 = v11 + v7;
    if (v11 + v7)
    {
      __src = *(_BYTE **)(a1 + 104);
      if (v12 >> 62)
        sub_19C2A18E8();
      v13 = v9 - v8;
      v14 = 4 * v12;
      v15 = (char *)operator new(4 * v12);
      __p = v15;
      bzero(v15, v14);
      v68 = &v15[v14];
      v10 = v13;
      v8 = __src;
      if (v9 != __src)
LABEL_12:
        memmove(v15, v8, v10);
    }
    else
    {
      v68 = 0;
      v15 = 0;
      if (v9 != v8)
        goto LABEL_12;
    }
    if (v5 == v6)
      goto LABEL_30;
    if (v7 <= 1)
      v16 = 1;
    else
      v16 = (uint64_t)(v5 - v6) >> 3;
    if (v16 < 0xC
      || ((unint64_t)&v15[v10] < v6 + 8 * v16 - 4
        ? (v17 = v6 >= (unint64_t)&v15[4 * v16 + v10])
        : (v17 = 1),
          !v17))
    {
      v18 = 0;
LABEL_28:
      v23 = v16 - v18;
      v24 = (int *)(v6 + 8 * v18);
      v25 = &v15[4 * v11];
      do
      {
        v26 = *v24;
        v24 += 2;
        *(_DWORD *)v25 = v26;
        v25 += 4;
        --v23;
      }
      while (v23);
      goto LABEL_30;
    }
    v18 = v16 & 0xFFFFFFFFFFFFFFFCLL;
    v19 = (_DWORD *)(v6 + 16);
    v20 = &v15[4 * v11];
    v21 = v16 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      LODWORD(v22) = *(v19 - 4);
      DWORD1(v22) = *(v19 - 2);
      DWORD2(v22) = *v19;
      HIDWORD(v22) = v19[2];
      *(_OWORD *)v20 = v22;
      v20 += 16;
      v19 += 8;
      v21 -= 4;
    }
    while (v21);
    if (v16 != v18)
    {
      v11 += v18;
      goto LABEL_28;
    }
LABEL_30:
    v27 = *(_QWORD *)(a1 + 16);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
    v29 = (void **)operator new();
    sub_19C4305EC((uint64_t)v29, v28, (uint64_t)v15, (v68 - v15) >> 2, v27 + 88, v66);
    v70 = v29;
    v30 = (unint64_t)v29[3] + 1;
    v29[3] = (void *)v30;
    v31 = *v29;
    v32 = 0.0;
    if (v30 >= ((_BYTE *)v29[1] - (_BYTE *)*v29) >> 3
      || (v33 = v31[v30], v34 = *(float **)(a1 + 136), v35 = *((float *)&v33 + 1) / *(v34 - 1), v32 = v35, v35 < 0.5))
    {
      *(double *)(a1 + 96) = v32;
      if (v31)
        goto LABEL_33;
      goto LABEL_34;
    }
    v36 = *(_QWORD *)(a1 + 144);
    if ((unint64_t)v34 < v36)
    {
      *(_QWORD *)v34 = v33;
      v37 = v34 + 2;
      goto LABEL_62;
    }
    v38 = *(float **)(a1 + 128);
    v39 = ((char *)v34 - (char *)v38) >> 3;
    v40 = v39 + 1;
    if ((unint64_t)(v39 + 1) >> 61)
      sub_19C2A18E8();
    v41 = v36 - (_QWORD)v38;
    if (v41 >> 2 > v40)
      v40 = v41 >> 2;
    if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
      v42 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v42 = v40;
    if (v42)
    {
      v69 = v33;
      if (v42 >> 61)
        sub_19C2A143C();
      v43 = (char *)operator new(8 * v42);
      v33 = v69;
    }
    else
    {
      v43 = 0;
    }
    v44 = &v43[8 * v39];
    v45 = &v43[8 * v42];
    *(_QWORD *)v44 = v33;
    v37 = v44 + 8;
    if (v34 == v38)
    {
      *(_QWORD *)(a1 + 128) = v44;
      *(_QWORD *)(a1 + 136) = v37;
      *(_QWORD *)(a1 + 144) = v45;
LABEL_61:
      operator delete(v34);
      goto LABEL_62;
    }
    v46 = (char *)(v34 - 2) - (char *)v38;
    if (v46 <= 0x57)
      goto LABEL_87;
    if ((unint64_t)((char *)v38 - v43) < 0x20)
      goto LABEL_87;
    v47 = (v46 >> 3) + 1;
    v48 = &v43[8 * v39 - 16];
    v49 = v34 - 4;
    v50 = v47 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v51 = *(_OWORD *)v49;
      *((_OWORD *)v48 - 1) = *((_OWORD *)v49 - 1);
      *(_OWORD *)v48 = v51;
      v48 -= 32;
      v49 -= 8;
      v50 -= 4;
    }
    while (v50);
    v44 -= 8 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
    v34 -= 2 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
    if (v47 != (v47 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_87:
      do
      {
        v52 = *((_QWORD *)v34 - 1);
        v34 -= 2;
        *((_QWORD *)v44 - 1) = v52;
        v44 -= 8;
      }
      while (v34 != v38);
      v38 = *(float **)(a1 + 128);
    }
    *(_QWORD *)(a1 + 128) = v44;
    *(_QWORD *)(a1 + 136) = v37;
    v34 = v38;
    *(_QWORD *)(a1 + 144) = v45;
    if (v38)
      goto LABEL_61;
LABEL_62:
    *(_QWORD *)(a1 + 136) = v37;
    v29 = v70;
    *(double *)(a1 + 96) = v32;
    if (v70)
    {
      v31 = *v70;
      v65 = 1;
      if (*v70)
      {
LABEL_33:
        v29[1] = v31;
        operator delete(v31);
      }
LABEL_34:
      MEMORY[0x1A1AD355C](v29, 0x1020C4016EE4530);
      v4 = __p;
      if (!__p)
        continue;
LABEL_6:
      operator delete(v4);
      continue;
    }
    v65 = 1;
    v4 = __p;
    if (__p)
      goto LABEL_6;
  }
  while (*(double *)(a1 + 96) >= 0.5);
  if ((v65 & 1) != 0)
    return 1;
  v3 = *(float **)(a1 + 128);
LABEL_68:
  *(_QWORD *)(a1 + 136) = v3;
  v53 = *(uint64_t **)(a1 + 48);
  v54 = v53[3] + 1;
  v53[3] = v54;
  v55 = *v53;
  if (v54 >= (v53[1] - *v53) >> 3)
    return 0;
  v56 = *(_QWORD *)(a1 + 144);
  if ((unint64_t)v3 >= v56)
  {
    v59 = v56 - (_QWORD)v3;
    v60 = v59 >> 2;
    if ((unint64_t)(v59 >> 2) <= 1)
      v60 = 1;
    v17 = (unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8;
    v61 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v17)
      v61 = v60;
    if (v61 >> 61)
      sub_19C2A143C();
    v62 = v61;
    v63 = operator new(8 * v61);
    v64 = &v63[v62];
    *v63 = *(_QWORD *)(v55 + 8 * v54);
    v57 = (float *)(v63 + 1);
    *(_QWORD *)(a1 + 128) = v63;
    *(_QWORD *)(a1 + 136) = v63 + 1;
    *(_QWORD *)(a1 + 144) = v64;
    if (v3)
      operator delete(v3);
  }
  else
  {
    *(_QWORD *)v3 = *(_QWORD *)(v55 + 8 * v54);
    v57 = v3 + 2;
  }
  *(_QWORD *)(a1 + 136) = v57;
  *(double *)(a1 + 96) = (float)(*(v57 - 1) / *(float *)(a1 + 88));
  return 1;
}

void sub_19C430390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  sub_19C430A40((uint64_t *)va);
  if (v7)
    operator delete(v7);
  _Unwind_Resume(a1);
}

unint64_t sub_19C4303F0(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  int *v19;
  _QWORD *v20;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  double v28;
  float v29;
  unint64_t v30;
  _DWORD *v31;
  int *v32;
  int v33;
  uint64_t v34;

  v6 = *(_QWORD *)(a1 + 128);
  v5 = *(_QWORD *)(a1 + 136);
  v7 = 0.0;
  v8 = v5 - v6;
  v9 = (uint64_t)(v5 - v6) >> 3;
  if (v5 != v6)
  {
    if (!a3)
    {
      if (!a2)
        return v9;
      if (v9 <= 1)
        v16 = 1;
      else
        v16 = (uint64_t)(v5 - v6) >> 3;
      if (v16 >= 0xA
        && (v6 + 8 * v16 - 4 > (unint64_t)a2 ? (v17 = v6 >= (unint64_t)&a2[v16]) : (v17 = 1), v17))
      {
        v18 = v16 & 0xFFFFFFFFFFFFFFFCLL;
        v19 = (int *)(v6 + 16);
        v20 = a2 + 2;
        v21 = v16 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          v22 = v19 + 2;
          LODWORD(v23) = *(v19 - 4);
          HIDWORD(v23) = *(v19 - 2);
          v24 = *v19;
          v19 += 8;
          LODWORD(v25) = v24;
          HIDWORD(v25) = *v22;
          *(v20 - 1) = v23;
          *v20 = v25;
          v20 += 2;
          v21 -= 4;
        }
        while (v21);
        if (v16 == v18)
          goto LABEL_32;
      }
      else
      {
        v18 = 0;
      }
      v30 = v16 - v18;
      v31 = &a2[v18];
      v32 = (int *)(v6 + 8 * v18);
      do
      {
        v33 = *v32;
        v32 += 2;
        *v31++ = v33;
        --v30;
      }
      while (v30);
      goto LABEL_32;
    }
    if (v9 <= 1)
      v11 = 1;
    else
      v11 = (uint64_t)(v5 - v6) >> 3;
    v7 = log10(*(float *)(v6 + 4) / *(float *)(a1 + 88));
    if (a2)
    {
      *a2 = *(_DWORD *)v6;
      if (v8 >= 0x10)
      {
        v12 = v11 - 1;
        v13 = a2 + 1;
        v14 = v6 + 8;
        do
        {
          v7 = log10(*(float *)(v14 + 4) / *(float *)(v14 - 4)) + v7;
          v15 = *(_DWORD *)v14;
          v14 += 8;
          *v13++ = v15;
          --v12;
        }
        while (v12);
        goto LABEL_32;
      }
LABEL_33:
      v34 = (uint64_t)(*(_QWORD *)(a1 + 112) - *(_QWORD *)(a1 + 104)) >> 2;
      *(_QWORD *)(a3 + 96) = 0;
      *(_QWORD *)(a3 + 104) = v34;
      *(_QWORD *)(a3 + 8) = 0xFFEFFFFFFFFFFFFFLL;
      *(_QWORD *)(a3 + 16) = 0;
      *(_WORD *)(a3 + 24) = 0;
      *(_BYTE *)(a3 + 32) = 1;
      *(_OWORD *)(a3 + 40) = xmmword_19C46DE10;
      *(_DWORD *)(a3 + 56) = 0;
      *(_QWORD *)(a3 + 88) = 0;
      *(double *)a3 = v7;
      *(_DWORD *)(a3 + 116) = *(_DWORD *)(a1 + 72);
      *(_BYTE *)(a3 + 112) = 1;
      *(_OWORD *)(a3 + 72) = xmmword_19C46DFE0;
      *(double *)(a3 + 64) = v7;
      return v9;
    }
    if (v8 < 0x10)
      goto LABEL_33;
    v26 = v11 - 1;
    v27 = (float *)(v6 + 12);
    do
    {
      v28 = *(v27 - 2);
      v29 = *v27;
      v27 += 2;
      v7 = log10(v29 / v28) + v7;
      --v26;
    }
    while (v26);
  }
LABEL_32:
  if (a3)
    goto LABEL_33;
  return v9;
}

uint64_t sub_19C4305EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  float *v30;
  float *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v35;
  unint64_t v36;
  float *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _BYTE *v43;
  unint64_t *v44;
  unint64_t v45;
  float *v46;
  uint64_t v47;
  _OWORD *v48;
  float *v49;
  uint64_t v50;
  __int128 v51;
  unint64_t v52;
  void *__p;
  unsigned int *v54;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = -1;
  (*(void (**)(void **__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a2 + 112))(&__p, a2, a3, a4, a5);
  v8 = (char *)__p;
  v9 = (char *)v54;
  if (__p == v54)
  {
    v10 = (char *)__p;
  }
  else
  {
    v10 = (char *)v54;
    while (1)
    {
      v11 = *(_QWORD *)(a6 + 24);
      if (!v11)
LABEL_63:
        sub_19C2CCC60();
      if (!(*(unsigned int (**)(uint64_t, char *))(*(_QWORD *)v11 + 48))(v11, v8))
        break;
      v8 += 12;
      if (v8 == v9)
        goto LABEL_15;
    }
    if (v8 != v9)
    {
      v12 = v8 + 12;
      v10 = v8;
      while (v12 != v9)
      {
        v13 = *(_QWORD *)(a6 + 24);
        if (!v13)
          goto LABEL_63;
        if ((*(unsigned int (**)(uint64_t, char *))(*(_QWORD *)v13 + 48))(v13, v12))
        {
          v14 = *(_QWORD *)v12;
          *((_DWORD *)v10 + 2) = *((_DWORD *)v12 + 2);
          *(_QWORD *)v10 = v14;
          v10 += 12;
        }
        v12 += 12;
      }
    }
  }
LABEL_15:
  v15 = (char *)__p;
  if (v10 != (char *)v54)
    v54 = (unsigned int *)v10;
  v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (_BYTE *)__p) >> 2);
  v17 = *(_BYTE **)a1;
  if (v16 > (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)
  {
    if (v16 >> 61)
      sub_19C2A18E8();
    v18 = *(_BYTE **)(a1 + 8);
    v19 = (char *)operator new(0x5555555555555558 * ((v10 - (_BYTE *)__p) >> 2));
    v20 = v18 - v17;
    v21 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
    v22 = v21;
    if (v18 == v17)
      goto LABEL_27;
    if ((unint64_t)(v20 - 8) >= 0x58)
    {
      v22 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(&v18[-(v20 & 0xFFFFFFFFFFFFFFF8)] - v19) >= 0x20)
      {
        v23 = v20 >> 3;
        v24 = ((unint64_t)(v20 - 8) >> 3) + 1;
        v25 = &v19[8 * v23 - 16];
        v26 = (__int128 *)(v18 - 16);
        v27 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v28 = *v26;
          *((_OWORD *)v25 - 1) = *(v26 - 1);
          *(_OWORD *)v25 = v28;
          v25 -= 32;
          v26 -= 2;
          v27 -= 4;
        }
        while (v27);
        v22 = &v21[-8 * (v24 & 0x3FFFFFFFFFFFFFFCLL)];
        v18 -= 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        if (v24 == (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          *(_QWORD *)a1 = v22;
          *(_QWORD *)(a1 + 8) = v21;
          *(_QWORD *)(a1 + 16) = &v19[0x5555555555555558 * ((v10 - v15) >> 2)];
          if (v17)
          {
            operator delete(v17);
            v15 = (char *)__p;
            v10 = (char *)v54;
          }
          goto LABEL_29;
        }
      }
    }
    else
    {
      v22 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v29 = *((_QWORD *)v18 - 1);
      v18 -= 8;
      *((_QWORD *)v22 - 1) = v29;
      v22 -= 8;
    }
    while (v18 != v17);
    goto LABEL_27;
  }
LABEL_29:
  v30 = *(float **)(a1 + 8);
  if (v15 != v10)
  {
    while (1)
    {
      v35 = *(unsigned int *)v15 | ((unint64_t)*((unsigned int *)v15 + 2) << 32);
      v36 = *(_QWORD *)(a1 + 16);
      if ((unint64_t)v30 >= v36)
        break;
      *(_QWORD *)v30 = v35;
      v31 = v30 + 2;
LABEL_38:
      *(_QWORD *)(a1 + 8) = v31;
      v15 += 12;
      v30 = v31;
      if (v15 == v10)
        goto LABEL_31;
    }
    v37 = *(float **)a1;
    v38 = (uint64_t)v30 - *(_QWORD *)a1;
    v39 = v38 >> 3;
    v40 = (v38 >> 3) + 1;
    if (v40 >> 61)
      sub_19C2A18E8();
    v41 = v36 - (_QWORD)v37;
    if (v41 >> 2 > v40)
      v40 = v41 >> 2;
    if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
      v42 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v42 = v40;
    if (v42)
    {
      if (v42 >> 61)
        sub_19C2A143C();
      v43 = operator new(8 * v42);
    }
    else
    {
      v43 = 0;
    }
    v44 = (unint64_t *)&v43[8 * v39];
    *v44 = v35;
    v31 = (float *)(v44 + 1);
    if (v30 == v37)
    {
      v37 = v30;
      goto LABEL_61;
    }
    v45 = (char *)v30 - (char *)v37 - 8;
    if (v45 >= 0x58)
    {
      if ((unint64_t)((char *)v30 - v43 - v38) >= 0x20)
      {
        v47 = (v45 >> 3) + 1;
        v46 = &v30[-2 * (v47 & 0x3FFFFFFFFFFFFFFCLL)];
        v48 = &v43[8 * v39 - 16];
        v49 = v30 - 4;
        v50 = v47 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v51 = *(_OWORD *)v49;
          *(v48 - 1) = *((_OWORD *)v49 - 1);
          *v48 = v51;
          v48 -= 2;
          v49 -= 8;
          v50 -= 4;
        }
        while (v50);
        v44 -= v47 & 0x3FFFFFFFFFFFFFFCLL;
        if (v47 == (v47 & 0x3FFFFFFFFFFFFFFCLL))
          goto LABEL_61;
      }
      else
      {
        v46 = v30;
      }
    }
    else
    {
      v46 = v30;
    }
    do
    {
      v52 = *((_QWORD *)v46 - 1);
      v46 -= 2;
      *--v44 = v52;
    }
    while (v46 != v37);
    v37 = *(float **)a1;
LABEL_61:
    *(_QWORD *)a1 = v44;
    *(_QWORD *)(a1 + 8) = v31;
    *(_QWORD *)(a1 + 16) = &v43[8 * v42];
    if (v37)
      operator delete(v37);
    goto LABEL_38;
  }
  v31 = *(float **)(a1 + 8);
LABEL_31:
  v32 = 126 - 2 * __clz(((uint64_t)v31 - *(_QWORD *)a1) >> 3);
  if (v31 == *(float **)a1)
    v33 = 0;
  else
    v33 = v32;
  sub_19C430A94(*(float **)a1, v31, v33, 1);
  if (__p)
  {
    v54 = (unsigned int *)__p;
    operator delete(__p);
  }
  return a1;
}

void sub_19C4309E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  if (__p)
  {
    operator delete(__p);
    v13 = *(void **)v11;
    if (!*(_QWORD *)v11)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v13 = *(void **)v11;
    if (!*(_QWORD *)v11)
      goto LABEL_3;
  }
  *(_QWORD *)(v11 + 8) = v13;
  operator delete(v13);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_19C430A40(uint64_t *a1)
{
  uint64_t v2;
  void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(void **)v2;
    if (*(_QWORD *)v2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1A1AD355C](v2, 0x1020C4016EE4530);
  }
  return a1;
}

float *sub_19C430A94(float *result, float *a2, uint64_t a3, char a4)
{
  float *v7;
  float *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  float *v12;
  float v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float *v19;
  float v20;
  int v21;
  int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float *v31;
  float *v32;
  float v33;
  float v34;
  float *v35;
  float v36;
  float v37;
  int v38;
  float v39;
  float v40;
  float v41;
  int v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float *v47;
  float *v48;
  float v49;
  float v50;
  float *v51;
  float v52;
  float v53;
  int v54;
  float v55;
  float v56;
  float v57;
  int v58;
  float v59;
  float v60;
  float v61;
  float v62;
  int v63;
  int v64;
  int v65;
  float v66;
  int v67;
  float *v68;
  float *v69;
  float *v70;
  float *v71;
  float v72;
  float *v73;
  float v74;
  float *v75;
  float v76;
  int v77;
  float v78;
  float v79;
  BOOL v80;
  float *v81;
  float v82;
  float *v83;
  float v84;
  float *v85;
  float *v86;
  float v87;
  float v88;
  int v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  int v98;
  float v99;
  float v100;
  int v101;
  float v102;
  float v103;
  int v104;
  int v105;
  float v106;
  int v107;
  float v108;
  float v109;
  float *v110;
  BOOL v112;
  uint64_t v113;
  float *v114;
  uint64_t v115;
  float v116;
  float v117;
  float v118;
  uint64_t v119;
  float *v120;
  int64_t v121;
  int64_t v122;
  BOOL v123;
  uint64_t v124;
  float *v125;
  float v126;
  float v127;
  float *v128;
  int v129;
  float *v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  int v134;
  float *v135;
  float v136;
  float v137;
  float v138;
  float *v139;
  float v140;
  uint64_t v141;
  uint64_t v142;
  float v143;
  int v144;
  float *v145;
  float *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  float v151;
  float v152;
  int v153;
  unint64_t v154;
  float *v155;
  float v156;

  v7 = result;
LABEL_2:
  v8 = v7;
  while (2)
  {
    v7 = v8;
    v9 = (char *)a2 - (char *)v8;
    v10 = ((char *)a2 - (char *)v8) >> 3;
    switch(v10)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v92 = *(a2 - 1);
        v93 = v8[1];
        if (v92 > v93)
        {
          v94 = *v8;
          *v8 = *(a2 - 2);
          *(a2 - 2) = v94;
          v8[1] = v92;
          *(a2 - 1) = v93;
        }
        return result;
      case 3:
        v95 = v8[3];
        v96 = v8[1];
        v97 = *(a2 - 1);
        if (v95 <= v96)
        {
          if (v97 > v95)
          {
            v133 = *((_DWORD *)v8 + 2);
            v8[2] = *(a2 - 2);
            *((_DWORD *)a2 - 2) = v133;
            v8[3] = v97;
            *(a2 - 1) = v95;
            v102 = v8[3];
            v108 = v8[1];
            if (v102 > v108)
            {
              v134 = *(_DWORD *)v8;
              *v8 = v8[2];
              *((_DWORD *)v8 + 2) = v134;
              goto LABEL_147;
            }
          }
        }
        else
        {
          v98 = *(_DWORD *)v8;
          if (v97 <= v95)
          {
            *v8 = v8[2];
            *((_DWORD *)v8 + 2) = v98;
            v8[1] = v95;
            v8[3] = v96;
            v156 = *(a2 - 1);
            if (v156 <= v96)
              return result;
            v8[2] = *(a2 - 2);
            *((_DWORD *)a2 - 2) = v98;
            v8[3] = v156;
          }
          else
          {
            *v8 = *(a2 - 2);
            *((_DWORD *)a2 - 2) = v98;
            v8[1] = v97;
          }
          *(a2 - 1) = v96;
        }
        return result;
      case 4:
        return sub_19C4212FC(v8, v8 + 2, v8 + 4, a2 - 2);
      case 5:
        result = sub_19C4212FC(v8, v8 + 2, v8 + 4, v8 + 6);
        v99 = *(a2 - 1);
        v100 = v8[7];
        if (v99 > v100)
        {
          v101 = *((_DWORD *)v8 + 6);
          v8[6] = *(a2 - 2);
          *((_DWORD *)a2 - 2) = v101;
          v8[7] = v99;
          *(a2 - 1) = v100;
          v102 = v8[7];
          v103 = v8[5];
          if (v102 > v103)
          {
            v104 = *((_DWORD *)v8 + 4);
            v105 = *((_DWORD *)v8 + 6);
            *((_DWORD *)v8 + 4) = v105;
            *((_DWORD *)v8 + 6) = v104;
            v8[5] = v102;
            v8[7] = v103;
            v106 = v8[3];
            if (v102 > v106)
            {
              v107 = *((_DWORD *)v8 + 2);
              *((_DWORD *)v8 + 2) = v105;
              *((_DWORD *)v8 + 4) = v107;
              v8[3] = v102;
              v8[5] = v106;
              v108 = v8[1];
              if (v102 > v108)
              {
                v109 = *v8;
                *(_DWORD *)v8 = v105;
                v8[2] = v109;
LABEL_147:
                v8[1] = v102;
                v8[3] = v108;
              }
            }
          }
        }
        return result;
      default:
        if (v9 <= 191)
        {
          v110 = v8 + 2;
          v112 = v8 == a2 || v110 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v112)
            {
              v113 = 0;
              v114 = v8;
              do
              {
                v116 = v114[3];
                v117 = v114[1];
                v114 = v110;
                if (v116 > v117)
                {
                  v118 = *v110;
                  v119 = v113;
                  do
                  {
                    v120 = (float *)((char *)v8 + v119);
                    v120[2] = *(float *)((char *)v8 + v119);
                    v120[3] = *(float *)((char *)v8 + v119 + 4);
                    if (!v119)
                    {
                      v115 = (uint64_t)v8;
                      goto LABEL_122;
                    }
                    v119 -= 8;
                  }
                  while (v116 > *(v120 - 1));
                  v115 = (uint64_t)v8 + v119 + 8;
LABEL_122:
                  *(float *)v115 = v118;
                  *(float *)(v115 + 4) = v116;
                }
                v110 = v114 + 2;
                v113 += 8;
              }
              while (v114 + 2 != a2);
            }
          }
          else if (!v112)
          {
            v135 = v8 + 1;
            do
            {
              v136 = v7[3];
              v137 = v7[1];
              v7 = v110;
              if (v136 > v137)
              {
                v138 = *v110;
                v139 = v135;
                do
                {
                  v139[1] = *(v139 - 1);
                  v139[2] = *v139;
                  v140 = *(v139 - 2);
                  v139 -= 2;
                }
                while (v136 > v140);
                v139[1] = v138;
                v139[2] = v136;
              }
              v110 = v7 + 2;
              v135 += 2;
            }
            while (v7 + 2 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v8 != a2)
          {
            v121 = (unint64_t)(v10 - 2) >> 1;
            v122 = v121;
            do
            {
              if (v121 >= v122)
              {
                v124 = (2 * v122) | 1;
                v125 = &v8[2 * v124];
                if (2 * v122 + 2 < v10 && v125[1] > v125[3])
                {
                  v125 += 2;
                  v124 = 2 * v122 + 2;
                }
                v126 = v125[1];
                v127 = v8[2 * v122 + 1];
                if (v126 <= v127)
                {
                  v128 = &v8[2 * v122];
                  v129 = *(_DWORD *)v128;
                  do
                  {
                    v130 = v128;
                    v128 = v125;
                    *v130 = *v125;
                    v130[1] = v126;
                    if (v121 < v124)
                      break;
                    v131 = 2 * v124;
                    v124 = (2 * v124) | 1;
                    v125 = &v8[2 * v124];
                    v132 = v131 + 2;
                    if (v132 < v10 && v125[1] > v125[3])
                    {
                      v125 += 2;
                      v124 = v132;
                    }
                    v126 = v125[1];
                  }
                  while (v126 <= v127);
                  *(_DWORD *)v128 = v129;
                  v128[1] = v127;
                }
              }
              v123 = v122-- <= 0;
            }
            while (!v123);
            v141 = (unint64_t)v9 >> 3;
            do
            {
              v142 = 0;
              v143 = *v8;
              v144 = *((_DWORD *)v8 + 1);
              v145 = v8;
              do
              {
                v146 = v145;
                v145 += 2 * v142 + 2;
                v147 = 2 * v142;
                v142 = (2 * v142) | 1;
                v148 = v147 + 2;
                if (v148 < v141 && v145[1] > v145[3])
                {
                  v145 += 2;
                  v142 = v148;
                }
                *v146 = *v145;
                v146[1] = v145[1];
              }
              while (v142 <= (uint64_t)((unint64_t)(v141 - 2) >> 1));
              if (v145 == a2 - 2)
              {
                *v145 = v143;
                *((_DWORD *)v145 + 1) = v144;
              }
              else
              {
                *v145 = *(a2 - 2);
                v145[1] = *(a2 - 1);
                *(a2 - 2) = v143;
                *((_DWORD *)a2 - 1) = v144;
                v149 = (char *)v145 - (char *)v8 + 8;
                if (v149 >= 9)
                {
                  v150 = (((unint64_t)v149 >> 3) - 2) >> 1;
                  v151 = v8[2 * v150 + 1];
                  v152 = v145[1];
                  if (v151 > v152)
                  {
                    v153 = *(_DWORD *)v145;
                    do
                    {
                      v154 = v150;
                      v155 = v145;
                      v145 = &v8[2 * v154];
                      *v155 = *v145;
                      v155[1] = v151;
                      if (!v154)
                        break;
                      v150 = (v154 - 1) >> 1;
                      v151 = v8[2 * v150 + 1];
                    }
                    while (v151 > v152);
                    *(_DWORD *)v145 = v153;
                    v8[2 * v154 + 1] = v152;
                  }
                }
              }
              a2 -= 2;
              v123 = v141-- <= 2;
            }
            while (!v123);
          }
          return result;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = &v8[2 * ((unint64_t)v10 >> 1)];
        v13 = *(a2 - 1);
        if ((unint64_t)v9 < 0x401)
        {
          v18 = v8[1];
          v19 = &v8[2 * v11 + 1];
          v20 = *v19;
          if (v18 <= *v19)
          {
            if (v13 > v18)
            {
              v26 = *v8;
              *v8 = *(a2 - 2);
              *(a2 - 2) = v26;
              v8[1] = v13;
              *(a2 - 1) = v18;
              v27 = v8[1];
              v28 = *v19;
              if (v27 > *v19)
              {
                v29 = *v12;
                *v12 = *v8;
                *v8 = v29;
                *v19 = v27;
                v8[1] = v28;
                --a3;
                if ((a4 & 1) != 0)
                  goto LABEL_33;
                goto LABEL_57;
              }
            }
          }
          else
          {
            v21 = *(_DWORD *)v12;
            if (v13 <= v18)
            {
              *v12 = *v8;
              *(_DWORD *)v8 = v21;
              *v19 = v18;
              v8[1] = v20;
              v43 = *(a2 - 1);
              if (v43 <= v20)
                goto LABEL_32;
              *v8 = *(a2 - 2);
              *((_DWORD *)a2 - 2) = v21;
              v8[1] = v43;
            }
            else
            {
              *v12 = *(a2 - 2);
              *((_DWORD *)a2 - 2) = v21;
              *v19 = v13;
            }
            *(a2 - 1) = v20;
          }
LABEL_32:
          --a3;
          if ((a4 & 1) != 0)
            goto LABEL_33;
LABEL_57:
          v45 = v8[1];
          v44 = *v8;
          if (*(v8 - 1) > v45)
            goto LABEL_58;
          if (v45 <= *(a2 - 1))
          {
            v83 = v8 + 2;
            do
            {
              v8 = v83;
              if (v83 >= a2)
                break;
              v84 = v83[1];
              v83 += 2;
            }
            while (v45 <= v84);
          }
          else
          {
            v81 = v8;
            do
            {
              v8 = v81 + 2;
              v82 = v81[3];
              v81 += 2;
            }
            while (v45 <= v82);
          }
          v85 = a2;
          if (v8 < a2)
          {
            v86 = a2;
            do
            {
              v85 = v86 - 2;
              v87 = *(v86 - 1);
              v86 -= 2;
            }
            while (v45 > v87);
          }
          while (v8 < v85)
          {
            v88 = *v8;
            *v8 = *v85;
            *v85 = v88;
            v89 = *((_DWORD *)v8 + 1);
            v8[1] = v85[1];
            *((_DWORD *)v85 + 1) = v89;
            do
            {
              v90 = v8[3];
              v8 += 2;
            }
            while (v45 <= v90);
            do
            {
              v91 = *(v85 - 1);
              v85 -= 2;
            }
            while (v45 > v91);
          }
          if (v8 - 2 != v7)
          {
            *v7 = *(v8 - 2);
            v7[1] = *(v8 - 1);
          }
          a4 = 0;
          *(v8 - 2) = v44;
          *(v8 - 1) = v45;
          continue;
        }
        v14 = v8[1];
        v15 = &v8[2 * v11 + 1];
        v16 = *v15;
        if (*v15 <= v14)
        {
          if (v13 > v16)
          {
            v22 = *(_DWORD *)v12;
            *v12 = *(a2 - 2);
            *((_DWORD *)a2 - 2) = v22;
            *v15 = v13;
            *(a2 - 1) = v16;
            v23 = *v15;
            v24 = v8[1];
            if (*v15 > v24)
            {
              v25 = *v8;
              *v8 = *v12;
              *v12 = v25;
              v8[1] = v23;
              *v15 = v24;
            }
          }
        }
        else
        {
          v17 = *v8;
          if (v13 > v16)
          {
            *v8 = *(a2 - 2);
            *(a2 - 2) = v17;
            v8[1] = v13;
            goto LABEL_22;
          }
          *v8 = *v12;
          *v12 = v17;
          v8[1] = v16;
          *v15 = v14;
          v30 = *(a2 - 1);
          if (v30 > v14)
          {
            *v12 = *(a2 - 2);
            *(a2 - 2) = v17;
            *v15 = v30;
LABEL_22:
            *(a2 - 1) = v14;
          }
        }
        v31 = &v8[2 * v11];
        v33 = *(v31 - 1);
        v32 = v31 - 1;
        v34 = v33;
        v35 = v32 - 1;
        v36 = v8[3];
        v37 = *(a2 - 3);
        if (v33 <= v36)
        {
          if (v37 > v34)
          {
            v39 = *v35;
            *v35 = *(a2 - 4);
            *(a2 - 4) = v39;
            *v32 = v37;
            *(a2 - 3) = v34;
            v40 = *v32;
            v41 = v8[3];
            if (*v32 > v41)
            {
              v42 = *((_DWORD *)v8 + 2);
              v8[2] = *v35;
              *(_DWORD *)v35 = v42;
              v8[3] = v40;
              *v32 = v41;
            }
          }
        }
        else
        {
          v38 = *((_DWORD *)v8 + 2);
          if (v37 > v34)
          {
            v8[2] = *(a2 - 4);
            *((_DWORD *)a2 - 4) = v38;
            v8[3] = v37;
            goto LABEL_36;
          }
          v8[2] = *v35;
          *(_DWORD *)v35 = v38;
          v8[3] = v34;
          *v32 = v36;
          v46 = *(a2 - 3);
          if (v46 > v36)
          {
            *v35 = *(a2 - 4);
            *((_DWORD *)a2 - 4) = v38;
            *v32 = v46;
LABEL_36:
            *(a2 - 3) = v36;
          }
        }
        v47 = &v8[2 * v11];
        v49 = v47[3];
        v48 = v47 + 3;
        v50 = v49;
        v51 = v48 - 1;
        v52 = v8[5];
        v53 = *(a2 - 5);
        if (v49 <= v52)
        {
          if (v53 > v50)
          {
            v55 = *v51;
            *v51 = *(a2 - 6);
            *(a2 - 6) = v55;
            *v48 = v53;
            *(a2 - 5) = v50;
            v56 = *v48;
            v57 = v8[5];
            if (*v48 > v57)
            {
              v58 = *((_DWORD *)v8 + 4);
              v8[4] = *v51;
              *(_DWORD *)v51 = v58;
              v8[5] = v56;
              *v48 = v57;
            }
          }
        }
        else
        {
          v54 = *((_DWORD *)v8 + 4);
          if (v53 > v50)
          {
            v8[4] = *(a2 - 6);
            *((_DWORD *)a2 - 6) = v54;
            v8[5] = v53;
            goto LABEL_45;
          }
          v8[4] = *v51;
          *(_DWORD *)v51 = v54;
          v8[5] = v50;
          *v48 = v52;
          v59 = *(a2 - 5);
          if (v59 > v52)
          {
            *v51 = *(a2 - 6);
            *((_DWORD *)a2 - 6) = v54;
            *v48 = v59;
LABEL_45:
            *(a2 - 5) = v52;
          }
        }
        v60 = *v15;
        v61 = *v32;
        v62 = *v48;
        if (*v15 <= *v32)
        {
          v63 = *(_DWORD *)v12;
          if (v62 <= v60)
          {
            v61 = *v15;
          }
          else
          {
            v64 = *(_DWORD *)v51;
            *v12 = *v51;
            *(_DWORD *)v51 = v63;
            *v15 = v62;
            *v48 = v60;
            if (v62 <= v61)
            {
              v61 = v62;
              v63 = v64;
            }
            else
            {
              v63 = *(_DWORD *)v35;
              *(_DWORD *)v35 = v64;
              *(_DWORD *)v12 = v63;
              *v32 = v62;
              *v15 = v61;
            }
          }
        }
        else
        {
          v63 = *(_DWORD *)v35;
          if (v62 <= v60)
          {
            *v35 = *v12;
            *(_DWORD *)v12 = v63;
            *v32 = v60;
            *v15 = v61;
            if (v62 > v61)
            {
              v65 = *(_DWORD *)v51;
              *v12 = *v51;
              *(_DWORD *)v51 = v63;
              *v15 = v62;
              *v48 = v61;
              v61 = v62;
              v63 = v65;
            }
          }
          else
          {
            *v35 = *v51;
            *(_DWORD *)v51 = v63;
            *v32 = v62;
            *v48 = v61;
            v63 = *(_DWORD *)v12;
            v61 = v60;
          }
        }
        v66 = *v8;
        *(_DWORD *)v8 = v63;
        *v12 = v66;
        v67 = *((_DWORD *)v8 + 1);
        v8[1] = v61;
        *(_DWORD *)v15 = v67;
        --a3;
        if ((a4 & 1) == 0)
          goto LABEL_57;
LABEL_33:
        v44 = *v8;
        v45 = v8[1];
LABEL_58:
        v68 = v8;
        do
        {
          v69 = v68;
          v68 += 2;
        }
        while (v69[3] > v45);
        v70 = a2;
        if (v69 == v8)
        {
          v73 = a2;
          while (v68 < v73)
          {
            v71 = v73 - 2;
            v74 = *(v73 - 1);
            v73 -= 2;
            if (v74 > v45)
              goto LABEL_68;
          }
          v71 = v73;
        }
        else
        {
          do
          {
            v71 = v70 - 2;
            v72 = *(v70 - 1);
            v70 -= 2;
          }
          while (v72 <= v45);
        }
LABEL_68:
        v8 = v68;
        if (v68 < v71)
        {
          v75 = v71;
          do
          {
            v76 = *v8;
            *v8 = *v75;
            *v75 = v76;
            v77 = *((_DWORD *)v8 + 1);
            v8[1] = v75[1];
            *((_DWORD *)v75 + 1) = v77;
            do
            {
              v78 = v8[3];
              v8 += 2;
            }
            while (v78 > v45);
            do
            {
              v79 = *(v75 - 1);
              v75 -= 2;
            }
            while (v79 <= v45);
          }
          while (v8 < v75);
        }
        if (v8 - 2 != v7)
        {
          *v7 = *(v8 - 2);
          v7[1] = *(v8 - 1);
        }
        *(v8 - 2) = v44;
        *(v8 - 1) = v45;
        if (v68 < v71)
        {
LABEL_79:
          result = (float *)sub_19C430A94(v7, v8 - 2, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v80 = sub_19C43160C(v7, v8 - 2);
        result = (float *)sub_19C43160C(v8, a2);
        if (!(_DWORD)result)
        {
          if (v80)
            continue;
          goto LABEL_79;
        }
        a2 = v8 - 2;
        if (!v80)
          goto LABEL_2;
        return result;
    }
  }
}

BOOL sub_19C43160C(float *a1, float *a2)
{
  uint64_t v4;
  _BOOL8 result;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  float v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  float *v18;
  float v19;
  float v20;
  int v21;
  float v22;
  float v23;
  int v24;
  int v25;
  float v26;
  int v27;
  float v28;
  float v29;
  int v30;
  float v31;
  float v32;
  int v33;
  int v34;
  int v35;
  float v36;
  float v37;
  float *v38;
  uint64_t v39;
  int v40;
  float *v41;
  uint64_t v42;
  float v43;
  int v44;
  uint64_t v45;
  float *v46;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = a1[1];
      if (v6 > v7)
      {
        v8 = *a1;
        *a1 = *(a2 - 2);
        *(a2 - 2) = v8;
        a1[1] = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      v9 = a1[3];
      v10 = a1[1];
      v11 = *(a2 - 1);
      if (v9 <= v10)
      {
        if (v11 > v9)
        {
          v30 = *((_DWORD *)a1 + 2);
          a1[2] = *(a2 - 2);
          *((_DWORD *)a2 - 2) = v30;
          a1[3] = v11;
          *(a2 - 1) = v9;
          v31 = a1[3];
          v32 = a1[1];
          if (v31 > v32)
          {
            v33 = *(_DWORD *)a1;
            *a1 = a1[2];
            *((_DWORD *)a1 + 2) = v33;
            a1[1] = v31;
            a1[3] = v32;
          }
        }
      }
      else
      {
        v12 = *(_DWORD *)a1;
        if (v11 <= v9)
        {
          *a1 = a1[2];
          *((_DWORD *)a1 + 2) = v12;
          a1[1] = v9;
          a1[3] = v10;
          v37 = *(a2 - 1);
          if (v37 > v10)
          {
            a1[2] = *(a2 - 2);
            *((_DWORD *)a2 - 2) = v12;
            a1[3] = v37;
            *(a2 - 1) = v10;
          }
        }
        else
        {
          *a1 = *(a2 - 2);
          *((_DWORD *)a2 - 2) = v12;
          a1[1] = v11;
          *(a2 - 1) = v10;
        }
      }
      return result;
    case 4:
      sub_19C4212FC(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      sub_19C4212FC(a1, a1 + 2, a1 + 4, a1 + 6);
      v19 = *(a2 - 1);
      v20 = a1[7];
      if (v19 > v20)
      {
        v21 = *((_DWORD *)a1 + 6);
        a1[6] = *(a2 - 2);
        *((_DWORD *)a2 - 2) = v21;
        a1[7] = v19;
        *(a2 - 1) = v20;
        v22 = a1[7];
        v23 = a1[5];
        if (v22 > v23)
        {
          v24 = *((_DWORD *)a1 + 4);
          v25 = *((_DWORD *)a1 + 6);
          *((_DWORD *)a1 + 4) = v25;
          *((_DWORD *)a1 + 6) = v24;
          a1[5] = v22;
          a1[7] = v23;
          v26 = a1[3];
          if (v22 > v26)
          {
            v27 = *((_DWORD *)a1 + 2);
            *((_DWORD *)a1 + 2) = v25;
            *((_DWORD *)a1 + 4) = v27;
            a1[3] = v22;
            a1[5] = v26;
            v28 = a1[1];
            if (v22 > v28)
            {
              v29 = *a1;
              *(_DWORD *)a1 = v25;
              a1[2] = v29;
              a1[1] = v22;
              a1[3] = v28;
            }
          }
        }
      }
      return 1;
    default:
      v13 = a1[1];
      v14 = a1 + 3;
      v15 = a1[3];
      v16 = a1[5];
      if (v15 > v13)
      {
        v17 = *a1;
        if (v16 <= v15)
        {
          *a1 = a1[2];
          a1[2] = v17;
          a1[1] = v15;
          a1[3] = v13;
          if (v16 <= v13)
            goto LABEL_28;
          a1[2] = a1[4];
          a1[4] = v17;
          v18 = a1 + 3;
        }
        else
        {
          *a1 = a1[4];
          a1[4] = v17;
          v18 = a1 + 1;
        }
        v14 = a1 + 5;
        goto LABEL_27;
      }
      if (v16 > v15)
      {
        v34 = *((_DWORD *)a1 + 2);
        v35 = *((_DWORD *)a1 + 4);
        *((_DWORD *)a1 + 2) = v35;
        *((_DWORD *)a1 + 4) = v34;
        a1[3] = v16;
        a1[5] = v15;
        if (v16 > v13)
        {
          v36 = *a1;
          *(_DWORD *)a1 = v35;
          a1[2] = v36;
          v18 = a1 + 1;
LABEL_27:
          *v18 = v16;
          *v14 = v13;
        }
      }
LABEL_28:
      v38 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v39 = 0;
      v40 = 0;
      v41 = a1 + 4;
      while (1)
      {
        v43 = v38[1];
        if (v43 > v41[1])
        {
          v44 = *(_DWORD *)v38;
          v45 = v39;
          do
          {
            v46 = (float *)((char *)a1 + v45);
            v46[6] = *(float *)((char *)a1 + v45 + 16);
            v46[7] = *(float *)((char *)a1 + v45 + 20);
            if (v45 == -16)
            {
              v42 = (uint64_t)a1;
              goto LABEL_31;
            }
            v45 -= 8;
          }
          while (v43 > v46[3]);
          v42 = (uint64_t)a1 + v45 + 24;
LABEL_31:
          *(_DWORD *)v42 = v44;
          *(float *)(v42 + 4) = v43;
          if (++v40 == 8)
            return v38 + 2 == a2;
        }
        v41 = v38;
        v39 += 8;
        v38 += 2;
        if (v38 == a2)
          return 1;
      }
  }
}

uint64_t sub_19C431964(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, uint64_t a6)
{
  uint64_t v8;
  _QWORD *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t *v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  float v26;

  *(_QWORD *)a1 = &off_1E3D362C0;
  v8 = a2[1];
  *(_QWORD *)(a1 + 8) = *a2;
  v9 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = v8;
  if (v8)
  {
    v10 = (unint64_t *)(v8 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = a5[1];
  *(_QWORD *)(a1 + 24) = *a5;
  *(_QWORD *)(a1 + 32) = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = a4[1];
  *(_QWORD *)(a1 + 40) = *a4;
  *(_QWORD *)(a1 + 48) = v15;
  if (v15)
  {
    v16 = (unint64_t *)(v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = a3[1];
  *(_QWORD *)(a1 + 56) = *a3;
  *(_QWORD *)(a1 + 64) = v18;
  v19 = (uint64_t *)(a1 + 56);
  if (v18)
  {
    v20 = (unint64_t *)(v18 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  v22 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 32))(*a2);
  *(_BYTE *)(a1 + 96) = v22;
  *(_QWORD *)(a1 + 112) = a6;
  v23 = *(_QWORD *)(a1 + 72);
  v24 = (*(_QWORD *)(a1 + 80) - v23) >> 2;
  if (v22 <= v24)
  {
    if (v22 < v24)
      *(_QWORD *)(a1 + 80) = v23 + 4 * v22;
  }
  else
  {
    sub_19C316738(a1 + 72, v22 - v24);
  }
  v25 = *v19;
  if (*v19 && *v9)
  {
    v26 = (*(float (**)(_QWORD))(*(_QWORD *)*v9 + 48))(*v9);
    std::mutex::lock((std::mutex *)(v25 + 96));
    if (!*(_QWORD *)(v25 + 40) && v26 > 0.0)
    {
      *(_QWORD *)(v25 + 40) = (unint64_t)v26;
      *(_BYTE *)(v25 + 24) = 1;
    }
    std::mutex::unlock((std::mutex *)(v25 + 96));
  }
  return a1;
}

void sub_19C431AF0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v8;

  v8 = *v6;
  if (*v6)
  {
    *(_QWORD *)(v1 + 80) = v8;
    operator delete(v8);
  }
  sub_19C2B43C8(v5);
  sub_19C2B43C8(v4);
  sub_19C2B43C8(v3);
  sub_19C2B43C8(v2);
  _Unwind_Resume(a1);
}

void sub_19C431B2C(uint64_t a1, int a2, double *a3, int a4, _DWORD *a5, unint64_t a6, void **a7)
{
  _DWORD *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  _DWORD *v18;
  uint64_t v19;
  double Current;
  double v21;
  uint64_t v22;
  float v23;
  float v24;
  char v25;
  void *v26;
  size_t v27;
  uint64_t v28;
  int v29;
  double *v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  _DWORD *v34;
  unint64_t v35;
  int *v36;
  int *v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _OWORD *v41;
  uint64_t v42;
  __int128 v43;
  int *v44;
  int v45;
  char __dst[64];
  __int128 v47;
  void *v48;

  if (!a4)
    return;
  v14 = &a5[a6];
  v15 = *(unsigned __int8 *)(a1 + 96);
  v16 = v15 - 1;
  v17 = a6 >= v15;
  if (a6 < v15)
    v16 = a6;
  v18 = &v14[1 - v15];
  if (!v17)
    v18 = a5;
  if (!v16)
  {
LABEL_10:
    if (a4 < 0)
      return;
    Current = CFAbsoluteTimeGetCurrent();
    if (a3)
    {
      v21 = fmin(*a3, Current);
      v22 = *(_QWORD *)(a1 + 24);
      v23 = floor((Current - v21) / *(float *)(v22 + 212));
      v24 = expf(*(float *)(v22 + 208) * v23);
      if (v24 <= *(float *)(v22 + 316))
        return;
    }
    else
    {
      v22 = *(_QWORD *)(a1 + 24);
      v24 = 1.0;
      v21 = Current;
    }
    sub_19C3FC584(__dst, (__int128 *)(v22 + 88));
    if (&v47 != (__int128 *)a7)
    {
      v25 = *((_BYTE *)a7 + 23);
      if (SHIBYTE(v48) < 0)
      {
        if (v25 >= 0)
          v26 = a7;
        else
          v26 = *a7;
        if (v25 >= 0)
          v27 = *((unsigned __int8 *)a7 + 23);
        else
          v27 = (size_t)a7[1];
        sub_19C2E54A8((void **)&v47, v26, v27);
      }
      else if ((*((_BYTE *)a7 + 23) & 0x80) != 0)
      {
        sub_19C2E53E4(&v47, *a7, (size_t)a7[1]);
      }
      else
      {
        v47 = *(_OWORD *)a7;
        v48 = a7[2];
      }
    }
    v28 = *(_QWORD *)(a1 + 56);
    if (!v28)
    {
LABEL_36:
      v32 = *(_QWORD *)(a1 + 72);
      v33 = *(unsigned __int8 *)(a1 + 96);
      v34 = &v14[1 - v33];
      if (a6 >= v33)
      {
        v35 = v33 - 1;
      }
      else
      {
        v34 = a5;
        v35 = a6;
      }
      v36 = *(int **)(a1 + 72);
      if (!v35)
        goto LABEL_49;
      v37 = v34;
      v38 = (v35 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v38 < 7)
      {
        v36 = *(int **)(a1 + 72);
      }
      else
      {
        v36 = *(int **)(a1 + 72);
        if ((unint64_t)(v32 - (_QWORD)v34) >= 0x20)
        {
          v39 = (v38 + 1) & 0x7FFFFFFFFFFFFFF8;
          v36 = (int *)(v32 + 4 * v39);
          v40 = v34 + 4;
          v41 = (_OWORD *)(v32 + 16);
          v42 = v39;
          do
          {
            *(_QWORD *)&v43 = __PAIR64__(HIDWORD(*v40), *(_OWORD *)v40) & 0xFFFFFF00FFFFFFLL;
            DWORD2(v43) = v40[1] & 0xFFFFFF;
            HIDWORD(v43) = HIDWORD(*v40) & 0xFFFFFF;
            *(v41 - 1) = *((_OWORD *)v40 - 1) & __PAIR128__(0xFFFFFF00FFFFFFLL, 0xFFFFFF00FFFFFFLL);
            *v41 = v43;
            v40 += 4;
            v41 += 2;
            v42 -= 8;
          }
          while (v42);
          if (v38 + 1 == v39)
            goto LABEL_49;
          v37 = &v34[v39];
        }
      }
      v44 = &v34[v35];
      do
      {
        v45 = *v37++;
        *v36++ = v45 & 0xFFFFFF;
      }
      while (v37 != v44);
LABEL_49:
      *v36 = a4 & 0xFFFFFF;
      (*(void (**)(_QWORD, uint64_t, _QWORD, char *, float))(**(_QWORD **)(a1 + 8) + 120))(*(_QWORD *)(a1 + 8), v32, (v35 + 1), __dst, v24);
      sub_19C2F5EB4((uint64_t)__dst);
      return;
    }
    v29 = (*(uint64_t (**)(_QWORD, char *))(**(_QWORD **)(a1 + 8) + 72))(*(_QWORD *)(a1 + 8), __dst);
    std::mutex::lock((std::mutex *)(v28 + 96));
    if (a2)
    {
      if (a2 == 1)
      {
        if (v29 == 1)
        {
          v30 = (double *)(v28 + 72);
          v31 = *(double *)(v28 + 72);
LABEL_52:
          if (v31 >= v21)
            goto LABEL_35;
          goto LABEL_34;
        }
        if (v29 == 2)
        {
          v30 = (double *)(v28 + 80);
          v31 = *(double *)(v28 + 80);
          goto LABEL_52;
        }
      }
    }
    else
    {
      v30 = (double *)(v28 + 56);
      if (*(double *)(v28 + 56) == 0.0)
LABEL_34:
        *v30 = v21;
    }
LABEL_35:
    *(_BYTE *)(v28 + 24) = 1;
    *(int64x2_t *)(v28 + 32) = vaddq_s64(*(int64x2_t *)(v28 + 32), vdupq_n_s64(1uLL));
    std::mutex::unlock((std::mutex *)(v28 + 96));
    goto LABEL_36;
  }
  v19 = 4 * v16;
  while (*v18)
  {
    ++v18;
    v19 -= 4;
    if (!v19)
      goto LABEL_10;
  }
}

void sub_19C431E10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C2F5EB4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19C431E28(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int *v10;
  int *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  __int128 v17;
  int *v18;
  int v19;
  uint64_t v20;
  int64x2_t v21;

  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(unsigned __int8 *)(a1 + 96);
  v8 = a3 + 4 * a4 + 4 * (1 - v7);
  if (a4 >= v7)
  {
    v9 = v7 - 1;
  }
  else
  {
    v8 = a3;
    v9 = a4;
  }
  v10 = *(int **)(a1 + 72);
  if (!v9)
    goto LABEL_14;
  v11 = (int *)v8;
  v12 = (v9 - 1) & 0x3FFFFFFFFFFFFFFFLL;
  if (v12 < 7)
  {
    v10 = *(int **)(a1 + 72);
  }
  else
  {
    v10 = *(int **)(a1 + 72);
    if ((unint64_t)(v6 - v8) >= 0x20)
    {
      v13 = (v12 + 1) & 0x7FFFFFFFFFFFFFF8;
      v10 = (int *)(v6 + 4 * v13);
      v14 = (_QWORD *)(v8 + 16);
      v15 = (_OWORD *)(v6 + 16);
      v16 = v13;
      do
      {
        *(_QWORD *)&v17 = __PAIR64__(HIDWORD(*v14), *(_OWORD *)v14) & 0xFFFFFF00FFFFFFLL;
        DWORD2(v17) = v14[1] & 0xFFFFFF;
        HIDWORD(v17) = HIDWORD(*v14) & 0xFFFFFF;
        *(v15 - 1) = *((_OWORD *)v14 - 1) & __PAIR128__(0xFFFFFF00FFFFFFLL, 0xFFFFFF00FFFFFFLL);
        *v15 = v17;
        v14 += 4;
        v15 += 2;
        v16 -= 8;
      }
      while (v16);
      if (v12 + 1 == v13)
        goto LABEL_14;
      v11 = (int *)(v8 + 4 * v13);
    }
  }
  v18 = (int *)(v8 + 4 * v9);
  do
  {
    v19 = *v11++;
    *v10++ = v19 & 0xFFFFFF;
  }
  while (v11 != v18);
LABEL_14:
  *v10 = a2 & 0xFFFFFF;
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 128))(*(_QWORD *)(a1 + 8), v6, (v9 + 1), *(_QWORD *)(a1 + 24) + 88);
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
  {
    std::mutex::lock((std::mutex *)(v20 + 96));
    *(_BYTE *)(v20 + 24) = 1;
    v21.i64[0] = -1;
    v21.i64[1] = -1;
    *(int64x2_t *)(v20 + 32) = vaddq_s64(*(int64x2_t *)(v20 + 32), v21);
    std::mutex::unlock((std::mutex *)(v20 + 96));
  }
}

uint64_t sub_19C431F64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, double *a5, uint64_t a6, int a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int *v18;
  unint64_t v19;
  int *v20;
  uint64_t v21;
  _QWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  __int128 v25;
  int *v26;
  int v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  float v38;
  double v39;
  uint64_t v40;
  uint64_t v44;
  uint64_t v45;

  v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8));
  if (!(_DWORD)v12)
    return v12;
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 144))(v13, a2);
  else
    v14 = 0;
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(unsigned __int8 *)(a1 + 96);
  v17 = a3 + 4 * a4 + 4 * (1 - v16);
  if (a4 >= v16)
    a4 = v16 - 1;
  else
    v17 = a3;
  if (a4)
  {
    v18 = (int *)v17;
    v19 = (a4 - 1) & 0x3FFFFFFFFFFFFFFFLL;
    if (v19 < 7)
    {
      v20 = *(int **)(a1 + 72);
    }
    else
    {
      v20 = *(int **)(a1 + 72);
      if ((unint64_t)(v15 - v17) >= 0x20)
      {
        v21 = (v19 + 1) & 0x7FFFFFFFFFFFFFF8;
        v20 = (int *)(v15 + 4 * v21);
        v22 = (_QWORD *)(v17 + 16);
        v23 = (_OWORD *)(v15 + 16);
        v24 = v21;
        do
        {
          *(_QWORD *)&v25 = __PAIR64__(HIDWORD(*v22), *(_OWORD *)v22) & 0xFFFFFF00FFFFFFLL;
          DWORD2(v25) = v22[1] & 0xFFFFFF;
          HIDWORD(v25) = HIDWORD(*v22) & 0xFFFFFF;
          *(v23 - 1) = *((_OWORD *)v22 - 1) & __PAIR128__(0xFFFFFF00FFFFFFLL, 0xFFFFFF00FFFFFFLL);
          *v23 = v25;
          v22 += 4;
          v23 += 2;
          v24 -= 8;
        }
        while (v24);
        if (v19 + 1 == v21)
          goto LABEL_19;
        v18 = (int *)(v17 + 4 * v21);
      }
    }
    v26 = (int *)(v17 + 4 * a4);
    do
    {
      v27 = *v18++;
      *v20++ = v27 & 0xFFFFFF;
    }
    while (v18 != v26);
  }
  else
  {
    v20 = *(int **)(a1 + 72);
  }
LABEL_19:
  *v20 = a2 & 0xFFFFFF;
  v28 = a4 + 1;
  *a5 = 0.0;
  if ((_DWORD)a2 == 2)
    v29 = 2;
  else
    v29 = 1;
  v44 = 0;
  if (v29 <= v28)
  {
    v30 = *(_QWORD *)(a1 + 24);
    v31 = 0.0;
    v32 = v15 + 4 * v28;
    while (1)
    {
      if ((_DWORD)v14 == 1)
      {
        v34 = 0;
      }
      else if (*(_BYTE *)(v30 + 401))
      {
        v34 = 2;
      }
      else
      {
        v34 = 1;
      }
      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, char *, uint64_t *))(**(_QWORD **)(a1 + 8)
                                                                                           + 104))(*(_QWORD *)(a1 + 8), v32 - 4 * (a4 + 1), (a4 + 1), v30 + 88, v34, (char *)&v44 + 4, &v44);
      if ((a4 + 1) <= 1)
        v35 = 24;
      else
        v35 = 16;
      v36 = (*(float (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + v35))(a1, v14);
      if (*((float *)&v44 + 1) >= v36 && *(float *)&v44 > 0.0)
      {
        if ((a4 + 1) >= 2)
        {
          v37 = *(_QWORD *)(a1 + 24);
LABEL_39:
          v38 = *(float *)(*(_QWORD *)(v37 + 264) + 4 * (a4 + 1) - 4);
          v39 = (float)(*((float *)&v44 + 1) / *(float *)&v44);
          v40 = *(_QWORD *)(a6 + 24);
          if (v40)
          {
            v45 = a4;
            v39 = (*(double (**)(uint64_t, uint64_t *))(*(_QWORD *)v40 + 48))(v40, &v45) * v39;
          }
          *a5 = *a5 + fmin(v39, 1.0) * v38;
          goto LABEL_25;
        }
        if (a7)
        {
          v37 = *(_QWORD *)(a1 + 24);
          if (*(float *)&v44 > *(float *)(v37 + 300))
            goto LABEL_39;
        }
      }
LABEL_25:
      v30 = *(_QWORD *)(a1 + 24);
      v31 = *(float *)(*(_QWORD *)(v30 + 264) + 4 * (a4 + 1) - 4) + v31;
      v33 = a4 >= v29;
      LODWORD(a4) = a4 - 1;
      if (!v33)
      {
        v12 = v12;
        if (v31 > 0.0)
          *a5 = *a5 / v31;
        return v12;
      }
    }
  }
  return v12;
}

uint64_t sub_19C432254(uint64_t a1, _QWORD *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  int v17;
  char *v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  *(_QWORD *)a1 = &off_1E3D375B8;
  *(_QWORD *)(a1 + 8) = a2;
  v10 = a2[4];
  *(_QWORD *)(a1 + 16) = a2[3];
  *(_QWORD *)(a1 + 24) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = a2[6];
  *(_QWORD *)(a1 + 32) = a2[5];
  *(_QWORD *)(a1 + 40) = v13;
  if (v13)
  {
    v14 = (unint64_t *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = a5;
  v16 = (uint64_t *)(a1 + 48);
  *(_QWORD *)(a1 + 64) = a6;
  v17 = (*(uint64_t (**)(_QWORD *))(*a2 + 48))(a2);
  *(_DWORD *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 72) = v17;
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  if (4 * a4)
  {
    if (4 * a4 < 0)
      sub_19C2A18E8();
    v18 = (char *)operator new(4 * a4);
    *(_QWORD *)(a1 + 104) = v18;
    *(_QWORD *)(a1 + 112) = v18;
    v19 = &v18[4 * ((4 * a4) >> 2)];
    *(_QWORD *)(a1 + 120) = v19;
    if (a4)
      memmove(v18, a3, 4 * a4);
    *(_QWORD *)(a1 + 112) = v19;
  }
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  v20 = operator new(0x20uLL);
  *v20 = &off_1E3D38950;
  v20[1] = sub_19C432508;
  v20[2] = 0;
  v20[3] = a1;
  *(_QWORD *)(a1 + 176) = v20;
  (*(void (**)(_QWORD, const void *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 8)
                                                                                           + 104))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8), a3, a4, a2[3] + 88, 1, a1 + 88, 0);
  v21 = operator new();
  sub_19C4305EC(v21, *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8), (uint64_t)a3, a4, *(_QWORD *)(a1 + 16) + 88, a1 + 152);
  v22 = *v16;
  *v16 = v21;
  if (v22)
  {
    v23 = *(void **)v22;
    if (*(_QWORD *)v22)
    {
      *(_QWORD *)(v22 + 8) = v23;
      operator delete(v23);
    }
    MEMORY[0x1A1AD355C](v22, 0x1020C4016EE4530);
  }
  return a1;
}

void sub_19C432458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  void **v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  MEMORY[0x1A1AD355C](v15, 0x1020C4016EE4530);
  v18 = (_QWORD *)v11[22];
  if (v18 == v16)
  {
    v19 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v19 = 5;
    v16 = (_QWORD *)v11[22];
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v19))(v16);
LABEL_6:
  v20 = *v14;
  if (*v14)
  {
    v11[17] = v20;
    operator delete(v20);
  }
  v21 = *a10;
  if (*a10)
  {
    v11[14] = v21;
    operator delete(v21);
  }
  sub_19C430A40(v13);
  sub_19C2B43C8(v12);
  sub_19C2B43C8(v10);
  _Unwind_Resume(a1);
}

BOOL sub_19C432508(uint64_t a1, float *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  float v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    return a2[2] >= *(float *)(*(_QWORD *)(a1 + 16) + 256);
  v5 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 144))(v4, *(unsigned int *)a2);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = a2[2];
  if (v5 != 1)
    return v7 >= *(float *)(v6 + 256);
  if (v7 >= *(float *)(v6 + 216))
    return a2[1] == 1.0;
  return 0;
}

void sub_19C4325A4()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C4325B8(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_1E3D38950;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 sub_19C4325F8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D38950;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_19C432620(_QWORD *a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD *);
  _QWORD *v3;

  v1 = a1[2];
  v2 = (uint64_t (*)(_QWORD *))a1[1];
  v3 = (_QWORD *)(a1[3] + (v1 >> 1));
  if ((v1 & 1) != 0)
    v2 = *(uint64_t (**)(_QWORD *))(*v3 + v2);
  return v2(v3);
}

uint64_t sub_19C43263C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__16__bindIMN2LM40DynamicLanguageModelPredictionEnumeratorEKFbRKNS1_15NgramPredictionEEJPS2_RKN"
                     "S_12placeholders4__phILi1EEEEEE"
    || ((v3 & (unint64_t)"NSt3__16__bindIMN2LM40DynamicLanguageModelPredictionEnumeratorEKFbRKNS1_15NgramPredictio"
                                "nEEJPS2_RKNS_12placeholders4__phILi1EEEEEE" & 0x8000000000000000) != 0) != __OFSUB__(v3, "NSt3__16__bindIMN2LM40DynamicLanguageModelPredictionEnumeratorEKFbRKNS1_15NgramPredictionEEJPS2_RKNS_12placeholders4__phILi1EEEEEE")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__16__bindIMN2LM40DynamicLanguageModelPredictionEnumeratorEKFbRKNS1_15NgramPredictionEEJPS2_RKNS_12placeholders4__phILi1EEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C432690()
{
  return &unk_1E3D33448;
}

_QWORD *sub_19C43269C(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E3D373D8;
  a1[2] = &off_1E3D34DF0;
  v2 = (void *)a1[3];
  if (v2)
    munmap(v2, a1[4]);
  a1[4] = 0;
  return a1;
}

void sub_19C4326EC(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E3D373D8;
  a1[2] = &off_1E3D34DF0;
  v2 = (void *)a1[3];
  if (v2)
    munmap(v2, a1[4]);
  a1[4] = 0;
  JUMPOUT(0x1A1AD355CLL);
}

uint64_t sub_19C43274C(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  unsigned int v11;
  int *v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int *v17;
  unsigned int v18;
  int *v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned __int16 v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned __int16 v32;
  BOOL v33;
  __int16 v34;
  unint64_t v35;
  unint64_t v36;
  int *v37;
  int *v38;
  unint64_t v39;
  unint64_t v40;
  int *v41;
  unsigned int v42;
  int *v43;
  int v44;
  int v45;
  int v46;
  unsigned int v47;
  _BOOL4 v48;
  unsigned __int16 v49;

  if (!a4)
    return 1;
  v4 = HIWORD(a2);
  v5 = *(_DWORD *)(a1 + 56);
  if (HIWORD(a2) >= v5)
    return 1;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = (int *)(v8 + 4 * *(unsigned int *)(v9 + 4 * v4));
  v11 = v5 - 1;
  if (v4 == v5 - 1)
  {
    v12 = (int *)(*(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 32));
    if (v10 == v12)
      return 1;
  }
  else
  {
    v12 = (int *)(v8 + 4 * *(unsigned int *)(v9 + 4 * (v4 + 1)));
    if (v10 == v12)
      return 1;
  }
  v14 = a1 + 16;
  v15 = v12 - v10;
  do
  {
    v16 = v15 >> 1;
    v17 = &v10[v15 >> 1];
    v18 = *((unsigned __int16 *)v17 + 1);
    v19 = v17 + 1;
    v15 += ~(v15 >> 1);
    if (v18 < (unsigned __int16)a2)
      v10 = v19;
    else
      v15 = v16;
  }
  while (v15);
  if (v10 >= v12)
    return 1;
  v20 = *v10;
  if ((*v10 ^ (a2 << 16)) >> 16)
    return 1;
  v21 = *(unsigned int *)(a3 + 4 * a4 - 4);
  v22 = v21 >> 16;
  if (HIWORD(*(_DWORD *)(a3 + 4 * a4 - 4)) >= v5)
    return 1;
  v23 = (unsigned int *)(v8 + 4 * *(unsigned int *)(v9 + 4 * v22));
  v24 = (unsigned int *)((_DWORD)v22 == v11
                       ? *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 32)
                       : v8 + 4 * *(unsigned int *)(v9 + 4 * (v22 + 1)));
  if (v23 == v24)
    return 1;
  v25 = v20;
  v26 = v24 - v23;
  do
  {
    v27 = v26 >> 1;
    v28 = &v23[v26 >> 1];
    v29 = *((unsigned __int16 *)v28 + 1);
    v30 = v28 + 1;
    v26 += ~(v26 >> 1);
    if (v29 < (unsigned __int16)*(_DWORD *)(a3 + 4 * a4 - 4))
      v23 = v30;
    else
      v26 = v27;
  }
  while (v26);
  if (v23 >= v24)
    return 1;
  v31 = *v23;
  if ((v31 ^ ((_DWORD)v21 << 16)) >> 16)
    return 1;
  v32 = v31;
  v49 = v31;
  if ((v20 & 0x80) != 0
    && (v20 & 0x1200) != 0
    && a4 >= 2
    && (v31 & 0x100) != 0
    && (*(_DWORD *)(a3 + 4 * a4 - 8) == 1 || a4 >= 3 && *(_DWORD *)(a3 + 4 * a4 - 12) == 1))
  {
    if ((v20 & 0x7000) != 0 && (v31 & 0x7000) != 0)
      return 1;
    if ((v20 & 0xE00) != 0)
    {
      v33 = (v31 & 0xE00) == 0;
      return !v33;
    }
    return 0;
  }
  if ((v20 & 0x100) != 0)
  {
    if (a4 >= 2 && (v31 & 4) != 0 && *(_DWORD *)(a3 + 4 * a4 - 8) == 1)
      return 0;
    if ((v31 & 0x50) != 0)
    {
      v34 = v20 & v31;
LABEL_65:
      v33 = (v34 & 0x7E00) == 0;
      return !v33;
    }
  }
  if ((v20 & 0x10) == 0)
    return 1;
  if (a4 >= 2 && (v31 & 0x6100) == 0x6100)
  {
    v35 = *(unsigned int *)(a3 + 4 * a4 - 8);
    v36 = v35 >> 16;
    if (HIWORD(*(_DWORD *)(a3 + 4 * a4 - 8)) < v5)
    {
      v37 = (int *)(v8 + 4 * *(unsigned int *)(v9 + 4 * v36));
      v38 = (int *)((_DWORD)v36 == v11
                  ? *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 32)
                  : v8 + 4 * *(unsigned int *)(v9 + 4 * (v36 + 1)));
      if (v37 != v38)
      {
        v39 = v38 - v37;
        do
        {
          v40 = v39 >> 1;
          v41 = &v37[v39 >> 1];
          v42 = *((unsigned __int16 *)v41 + 1);
          v43 = v41 + 1;
          v39 += ~(v39 >> 1);
          if (v42 < (unsigned __int16)*(_DWORD *)(a3 + 4 * a4 - 8))
            v37 = v43;
          else
            v39 = v40;
        }
        while (v39);
        if (v37 < v38)
        {
          v44 = *v37;
          if (!((*v37 ^ ((_DWORD)v35 << 16)) >> 16))
          {
            v32 = *v37;
            v49 = v32;
            if ((v44 & 0x40) != 0)
              goto LABEL_64;
          }
        }
      }
    }
  }
  if ((v32 & 0x140) != 0)
  {
LABEL_64:
    v34 = v32 & v25;
    goto LABEL_65;
  }
  if ((v32 & 0x20) == 0)
  {
LABEL_70:
    if (a4 >= 2 && (v32 & 2) != 0)
    {
      v45 = sub_19C3FCED4(v14, *(_DWORD *)(a3 + 4 * a4 - 8), &v49);
      v32 = v49;
      if (v45)
      {
        if ((v49 & 0x10) != 0)
          goto LABEL_64;
      }
    }
    goto LABEL_85;
  }
  if (a4 >= 2)
  {
    v46 = sub_19C3FCED4(a1 + 16, *(_DWORD *)(a3 + 4 * a4 - 8), &v49);
    v32 = v49;
    if (v46)
    {
      if ((v49 & 0x100) != 0)
        goto LABEL_64;
      if ((v49 & 1) == 0)
        return 1;
      if ((v49 & 0x7000) != 0 && (v25 & 0x7000) != 0 || (result = 0, (v49 & 0xE00) != 0) && (v25 & 0xE00) != 0)
      {
        if (a4 < 3)
          return 1;
        v47 = *(_DWORD *)(a3 + 4 * a4 - 12);
        goto LABEL_98;
      }
      return result;
    }
    goto LABEL_70;
  }
LABEL_85:
  if ((v32 & 1) == 0)
    return (v32 & 0x10) == 0 || (v32 & v25 & 0x7E00) != 0;
  if ((v32 & 0x7000) != 0 && (v25 & 0x7000) != 0)
  {
    if (a4 < 2)
      return 1;
    goto LABEL_97;
  }
  v48 = (v32 & 0xE00) == 0;
  if ((v25 & 0xE00) == 0)
    v48 = 1;
  result = !v48;
  if (!v48 && a4 >= 2)
  {
LABEL_97:
    v47 = *(_DWORD *)(a3 + 4 * a4 - 8);
LABEL_98:
    if (!sub_19C3FCED4(v14, v47, &v49))
      return 1;
    v32 = v49;
    if ((v49 & 0x100) == 0)
      return 1;
    goto LABEL_64;
  }
  return result;
}

double sub_19C432B54(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

BOOL sub_19C432B5C()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  void *__p[2];
  char v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = 16;
  while (1)
  {
    std::istream::tellg();
    v1 = v6;
    if (v6 < 0)
      break;
    if ((v6 & 0xF) != 0)
    {
      std::istream::read();
      if (--v0)
        continue;
    }
    return v1 >= 0;
  }
  v5 = 5;
  strcpy((char *)__p, "ERROR");
  v2 = sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)__p, 5);
  sub_19C2A1B24(v2, (uint64_t)": ", 2);
  sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)"AlignInput: can't determine stream position", 43);
  sub_19C351928();
  if (v5 < 0)
    operator delete(__p[0]);
  return v1 >= 0;
}

void sub_19C432C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  sub_19C351928();
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_19C432CA0(_QWORD *a1)
{
  int v2;
  char *v3;
  _QWORD *v5;
  void *__p[2];
  char v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = 16;
  while (1)
  {
    v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    if ((v3[32] & 5) != 0)
      break;
    (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**((_QWORD **)v3 + 5) + 32))(__p, *((_QWORD *)v3 + 5), 0, 1, 16);
    if (v8 < 0)
      break;
    if ((v8 & 0xF) != 0)
    {
      std::ostream::write();
      if (--v2)
        continue;
    }
    return 1;
  }
  v7 = 5;
  strcpy((char *)__p, "ERROR");
  v5 = sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)__p, 5);
  sub_19C2A1B24(v5, (uint64_t)": ", 2);
  sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)"AlignOutput: can't determine stream position", 44);
  sub_19C351928();
  if (v7 < 0)
    operator delete(__p[0]);
  return 0;
}

void sub_19C432DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  sub_19C351928();
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void sub_19C432E18()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C432E2C(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x28uLL);
  *(_QWORD *)v2 = &off_1E3D30530;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 sub_19C432E6C(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D30530;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

CFComparisonResult sub_19C432E94(uint64_t a1, const __CFString **a2, int *a3, uint64_t *a4, int *a5, const __CFLocale **a6, uint64_t a7)
{
  const __CFString *v9;
  int v10;
  uint64_t v11;
  int v12;
  const __CFLocale *v13;
  uint64_t v14;
  int v15;
  const UInt8 *v16;
  CFIndex v17;
  CFStringRef v18;
  CFStringRef v19;
  const void **v20;
  const void *v21;
  const __CFString *v22;
  CFComparisonResult result;
  uint64_t v24;
  uint64_t v25;
  void *exception;
  const __CFLocale *v27;
  int v28;
  uint64_t v29;
  int v30;
  const __CFString *v31;
  CFRange v32;

  v9 = *a2;
  v10 = *a3;
  v11 = *a4;
  v12 = *a5;
  v13 = *a6;
  if (!**(_QWORD **)(a1 + 8))
  {
    v14 = *(_QWORD *)(a1 + 16);
    v15 = *(char *)(v14 + 23);
    if (v15 >= 0)
      v16 = *(const UInt8 **)(a1 + 16);
    else
      v16 = *(const UInt8 **)v14;
    if (v15 >= 0)
      v17 = *(unsigned __int8 *)(v14 + 23);
    else
      v17 = *(_QWORD *)(v14 + 8);
    v18 = CFStringCreateWithBytes(0, v16, v17, 0x8000100u, 0);
    if (!v18)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A1AD3154](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    v19 = v18;
    v20 = *(const void ***)(a1 + 8);
    v21 = *v20;
    *v20 = v19;
    if (v21)
      CFRelease(v21);
  }
  v22 = **(const __CFString ***)(a1 + 8);
  v32.length = CFStringGetLength(v22);
  v32.location = 0;
  result = CFStringCompareWithOptionsAndLocale(v22, v9, v32, **(_QWORD **)(a1 + 24), v13);
  if (result == kCFCompareEqualTo)
  {
    v24 = *(_QWORD *)(a1 + 32);
    v31 = v9;
    v30 = v10;
    v29 = v11;
    v28 = v12;
    v27 = v13;
    v25 = *(_QWORD *)(v24 + 24);
    if (!v25)
      sub_19C2CCC60();
    return (*(uint64_t (**)(uint64_t, const __CFString **, int *, uint64_t *, int *, const __CFLocale **, uint64_t))(*(_QWORD *)v25 + 48))(v25, &v31, &v30, &v29, &v28, &v27, a7);
  }
  return result;
}

void sub_19C432FF4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C43300C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v133enumerateComparableLexiconEntriesERKNSt3__16vectorINS1_10unique_ptrIN2LM7"
                     "LexiconENS1_14default_deleteIS5_EEEENS1_9allocatorIS8_EEEERKNS1_12basic_stringIcNS1_11char_traitsIc"
                     "EENS9_IcEEEEmRKNS1_8functionIFvPK10__CFStringjdNS4_13SourceLexiconEPK10__CFLocaleRbEEEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v133enumerateComparableLexiconEntriesERKNSt3__16vectorINS1_10uniqu"
                                "e_ptrIN2LM7LexiconENS1_14default_deleteIS5_EEEENS1_9allocatorIS8_EEEERKNS1_12basic_strin"
                                "gIcNS1_11char_traitsIcEENS9_IcEEEEmRKNS1_8functionIFvPK10__CFStringjdNS4_13SourceLexicon"
                                "EPK10__CFLocaleRbEEEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v133enumerateComparableLexiconEntriesERKNSt3__16vectorINS1_10unique_ptrIN2LM7LexiconENS1_14default_deleteIS5_EEEENS1_9allocatorIS8_EEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS9_IcEEEEmRKNS1_8functionIFvPK10__CFStringjdNS4_13SourceLexiconEPK10__CFLocaleRbEEEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v133enumerateComparableLexiconEntriesERKNSt3__16vectorINS1_10unique_ptrIN2LM7LexiconENS1_14default_deleteIS5_EEEENS1_9allocatorIS8_EEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS9_IcEEEEmRKNS1_8functionIFvPK10__CFStringjdNS4_13SourceLexiconEPK10__CFLocaleRbEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C433060()
{
  return &unk_1E3D30030;
}

BOOL sub_19C43306C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CFIndex v4;
  CFIndex v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  void *exception;
  unsigned __int8 v11;
  CFTypeRef cf;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  cf = CFStringCreateWithBytes(0, (const UInt8 *)a2, v5, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD3154](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v11 = 0;
  v13[0] = &off_1E3D30638;
  v13[1] = &cf;
  v13[2] = &v11;
  v14 = v13;
  sub_19C319CA4(a1, v2, 1, (uint64_t)v13);
  v6 = v14;
  if (v14 == v13)
  {
    v7 = 4;
    v6 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_10:
  v8 = v11;
  if (cf)
    CFRelease(cf);
  return v8 != 0;
}

void sub_19C4331A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C4331B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a2)
    sub_19C2CDAC8(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_19C43320C()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C433220(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E3D30638;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_19C433258(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D30638;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

CFComparisonResult sub_19C433278(uint64_t a1, const __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, const __CFLocale **a6, _BYTE *a7)
{
  const __CFString *v9;
  const __CFLocale *v10;
  _BOOL4 v11;
  const __CFString *v12;
  CFComparisonResult result;
  CFRange v14;

  v9 = *a2;
  v10 = *a6;
  v11 = sub_19C43336C(*a2, *a6);
  v12 = **(const __CFString ***)(a1 + 8);
  v14.length = CFStringGetLength(v12);
  v14.location = 0;
  result = CFStringCompareWithOptionsAndLocale(v12, v9, v14, v11, v10);
  if (result == kCFCompareEqualTo)
  {
    **(_BYTE **)(a1 + 16) = 1;
    *a7 = 1;
  }
  return result;
}

uint64_t sub_19C43330C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v134isOneWayCaseEquivalentLexiconMatchERKN2LM22CompositeLanguageModelERKNSt3_"
                     "_112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS1_22TokenEnumerationPolicyEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v134isOneWayCaseEquivalentLexiconMatchERKN2LM22CompositeLanguageMo"
                                "delERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS1_22TokenEnumera"
                                "tionPolicyEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v134isOneWayCaseEquivalentLexiconMatchERKN2LM22CompositeLanguageModelERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS1_22TokenEnumerationPolicyEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v134isOneWayCaseEquivalentLexiconMatchERKN2LM22CompositeLanguageModelERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS1_22TokenEnumerationPolicyEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C433360()
{
  return &unk_1E3D334C0;
}

BOOL sub_19C43336C(const __CFString *a1, const __CFLocale *a2)
{
  const __CFAllocator *v4;
  CFIndex Length;
  __CFString *MutableCopy;
  CFComparisonResult v7;
  CFStringRef theString2;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Length = CFStringGetLength(a1);
  MutableCopy = CFStringCreateMutableCopy(v4, Length, a1);
  CFStringLowercase(MutableCopy, a2);
  sub_19C297DB4(&theString2, MutableCopy);
  v7 = CFStringCompare(a1, theString2, 0);
  if (theString2)
    CFRelease(theString2);
  return v7 == kCFCompareEqualTo;
}

void sub_19C433400(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C2E5670((const void **)va);
  _Unwind_Resume(a1);
}

BOOL sub_19C433414(CFStringRef *a1, const __CFLocale *a2)
{
  const __CFString *v4;
  const __CFAllocator *v5;
  CFIndex Length;
  __CFString *MutableCopy;
  CFComparisonResult v8;
  CFStringRef theString2;

  v4 = *a1;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Length = CFStringGetLength(*a1);
  MutableCopy = CFStringCreateMutableCopy(v5, Length, v4);
  CFStringUppercase(MutableCopy, a2);
  sub_19C297DB4(&theString2, MutableCopy);
  v8 = CFStringCompare(*a1, theString2, 0);
  if (theString2)
    CFRelease(theString2);
  return v8 == kCFCompareEqualTo;
}

void sub_19C4334B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C2E5670((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_19C4334C4(unsigned int a1, _QWORD *a2)
{
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  uint64_t v14;
  _OWORD v16[4];
  int64x2_t v17;
  uint64_t v18;
  __int16 v19;
  char v20;
  __int128 v21;
  int v22;
  __int128 v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2[29] + 288) <= a1)
    return 0;
  v18 = 0;
  v19 = 0;
  v20 = 1;
  v21 = xmmword_19C46DE10;
  v22 = 0;
  v23 = xmmword_19C46DE10;
  v25 = 0;
  v26 = 0;
  v24 = 0xFFEFFFFFFFFFFFFFLL;
  v4 = 0uLL;
  memset(v16, 0, sizeof(v16));
  v17 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  if (qword_1EDB97100 != -1)
    dispatch_once(&qword_1EDB97100, &unk_1E3D3BED0);
  v28 = 0;
  v12 = sub_19C32DD08(a2, a1 | ((unint64_t)a1 << 32), (uint64_t *)v16, (uint64_t)&v17, qword_1EDB970F8, 0, 0, v27, v4);
  v13 = v28;
  if (v28 == v27)
  {
    v14 = 4;
    v13 = v27;
  }
  else
  {
    if (!v28)
      goto LABEL_10;
    v14 = 5;
  }
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v13 + 8 * v14))(v13, v5, v6, v7, v8, v9, v10, v11);
LABEL_10:
  if (*(double *)v17.i64 >= -3.0)
    return v12;
  else
    return 0;
}

void sub_19C433610(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(v2 - 32);
  if (v4 == v1)
  {
    v5 = 4;
    v4 = (_QWORD *)(v2 - 56);
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C433648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  char v11;
  int v12;

  v12 = 0;
  std::istream::read();
  v11 = 5;
  strcpy((char *)__p, "ERROR");
  v4 = sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)__p, 5);
  sub_19C2A1B24(v4, (uint64_t)": ", 2);
  v5 = sub_19C2A1B24(MEMORY[0x1E0DE4A50], (uint64_t)"FstHeader::Read: Bad FST header: ", 33);
  v6 = *(char *)(a3 + 23);
  if (v6 >= 0)
    v7 = a3;
  else
    v7 = *(_QWORD *)a3;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a3 + 23);
  else
    v8 = *(_QWORD *)(a3 + 8);
  sub_19C2A1B24(v5, v7, v8);
  sub_19C351928();
  if (v11 < 0)
    operator delete(__p[0]);
  return 0;
}

void sub_19C433920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  sub_19C351928();
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_19C433954(_QWORD *a1)
{
  sub_19C433D10(a1);
  JUMPOUT(0x1A1AD355CLL);
}

BOOL sub_19C433978(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, double *a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v7;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  unsigned int v20;
  int v21;
  double v22;
  unsigned int *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  double v31;
  double v32;
  _QWORD *v33;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint64_t **v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  int v47;
  double v48;

  v7 = *(_QWORD *)(a1 + 152);
  if (v7)
  {
    v11 = *(_QWORD *)(a1 + 16);
    if (a4 >= v11)
      v12 = a3 + 4 * a4 + 4 * (1 - v11);
    else
      v12 = a3;
    if (a4 >= v11)
      v13 = v11 - 1;
    else
      v13 = a4;
    v14 = *(double *)(a1 + 32);
    v47 = *(_DWORD *)(a1 + 48);
    if (v13)
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      do
      {
        v20 = *(_DWORD *)(v12 + 4 * v16);
        if (*(_BYTE *)(a1 + 288) && (v20 < *(_DWORD *)(a1 + 280) || v20 > *(_DWORD *)(a1 + 284)))
        {
          if (v20 <= *(_DWORD *)(a1 + 24))
            v21 = *(_DWORD *)(v12 + 4 * v16);
          else
            v21 = 0;
          *(_DWORD *)(*(_QWORD *)(a1 + 184) + 4 * v17) = v21;
          v19 = 1;
        }
        else
        {
          v19 = sub_19C423E60(*(_QWORD *)(a1 + 152), v20, (unsigned int *)(*(_QWORD *)(a1 + 184) + 4 * v17), 0);
          v18 |= v19 > 1;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 232) + 8 * v16) = v19;
        v17 += v19;
        ++v16;
      }
      while (v13 != v16);
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    if (*(_BYTE *)(a1 + 288) && (*(_DWORD *)(a1 + 280) > a2 || *(_DWORD *)(a1 + 284) < a2))
    {
      a2 = a2 & ~((int)a2 >> 31);
      if (a2 <= *(_DWORD *)(a1 + 24))
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 184) + 4 * v17) = a2;
        v22 = 0.0;
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v13) = 0;
        v22 = -*(double *)(a1 + 40);
        v14 = 0.0;
      }
      v25 = *(unint64_t **)(a1 + 232);
      v25[v13] = 1;
      v26 = v13 + 1;
      if ((v18 & 1) != 0)
      {
        v23 = 0;
        v27 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v23 = (unsigned int *)(*(_QWORD *)(a1 + 184) + 4 * v17);
      v24 = sub_19C423E60(*(_QWORD *)(a1 + 152), a2, v23, *(_QWORD **)(a1 + 208));
      v25 = *(unint64_t **)(a1 + 232);
      v25[v13] = v24;
      v26 = v13 + 1;
      v22 = 0.0;
      if ((v24 > 1) | v18 & 1)
      {
        v27 = v24;
LABEL_30:
        if (v47 == 5)
        {
          v28 = 0;
        }
        else
        {
          v48 = 0.0;
          (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, double *, unint64_t *, uint64_t))(**(_QWORD **)(a1 + 168) + 16))(*(_QWORD *)(a1 + 168), a2, 0, 0, &v48, a6, a7);
          v28 = *(_QWORD *)(a1 + 208);
          if (v27)
          {
            for (i = 0; i != v27; ++i)
            {
              v33 = *(_QWORD **)(a1 + 152);
              v34 = (int8x8_t)v33[12];
              v31 = -10.0;
              if (v34)
              {
                v35 = v23[i];
                v36 = (uint8x8_t)vcnt_s8(v34);
                v36.i16[0] = vaddlv_u8(v36);
                if (v36.u32[0] > 1uLL)
                {
                  v37 = v23[i];
                  if (*(_QWORD *)&v34 <= v35)
                    v37 = v35 % *(_QWORD *)&v34;
                }
                else
                {
                  v37 = (v34.i32[0] - 1) & v35;
                }
                v38 = *(uint64_t ***)(v33[11] + 8 * v37);
                if (v38)
                {
                  v39 = *v38;
                  if (v39)
                  {
                    if (v36.u32[0] < 2uLL)
                    {
                      v40 = *(_QWORD *)&v34 - 1;
                      while (1)
                      {
                        v42 = v39[1];
                        if (v42 == v35)
                        {
                          if (*((_DWORD *)v39 + 4) == (_DWORD)v35)
                            goto LABEL_35;
                        }
                        else if ((v42 & v40) != v37)
                        {
                          goto LABEL_36;
                        }
                        v39 = (uint64_t *)*v39;
                        if (!v39)
                          goto LABEL_36;
                      }
                    }
                    do
                    {
                      v41 = v39[1];
                      if (v41 == v35)
                      {
                        if (*((_DWORD *)v39 + 4) == (_DWORD)v35)
                        {
LABEL_35:
                          v31 = *(double *)(v33[19] + 8 * *((unsigned __int8 *)v39 + 20));
                          break;
                        }
                      }
                      else
                      {
                        if (v41 >= *(_QWORD *)&v34)
                          v41 %= *(_QWORD *)&v34;
                        if (v41 != v37)
                          break;
                      }
                      v39 = (uint64_t *)*v39;
                    }
                    while (v39);
                  }
                }
              }
LABEL_36:
              v32 = __exp10(*(double *)(v28 + 8 * i) - v31 + v48);
              v28 = *(_QWORD *)(a1 + 208);
              *(double *)(v28 + 8 * i) = v32;
            }
          }
          v25 = *(unint64_t **)(a1 + 232);
        }
        v43 = sub_19C3FEBC0(a1, *(unsigned int **)(a1 + 184), v25, v26, *(unsigned int **)(a1 + 256), 0, v28, 0, v14);
        v29 = log10(v43 / v44);
        goto LABEL_60;
      }
    }
    v29 = sub_19C3FE0C0(a1, *(unsigned int **)(a1 + 184), v26, a6, 1, v14);
LABEL_60:
    *a5 = v29 + v22;
  }
  return v7 != 0;
}

_QWORD *sub_19C433D10(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;

  *a1 = &off_1E3D35340;
  v2 = (void *)a1[32];
  if (v2)
  {
    a1[33] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[29];
  if (v3)
  {
    a1[30] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[26];
  if (v4)
  {
    a1[27] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[23];
  if (v5)
  {
    a1[24] = v5;
    operator delete(v5);
  }
  v6 = (std::__shared_weak_count *)a1[22];
  if (!v6)
    goto LABEL_13;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    v9 = (std::__shared_weak_count *)a1[20];
    if (!v9)
      return sub_19C36B630(a1);
  }
  else
  {
LABEL_13:
    v9 = (std::__shared_weak_count *)a1[20];
    if (!v9)
      return sub_19C36B630(a1);
  }
  v10 = (unint64_t *)&v9->__shared_owners_;
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  return sub_19C36B630(a1);
}

void sub_19C433DF8(uint64_t a1, CFDictionaryRef *a2, uint64_t a3, uint64_t a4)
{
  sub_19C3FE1DC(a1, a2, a4);
}

void sub_19C433F9C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;

  v7 = *v5;
  if (*v5)
  {
    v1[33] = v7;
    operator delete(v7);
    v8 = *v4;
    if (!*v4)
    {
LABEL_3:
      v9 = *v3;
      if (!*v3)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v8 = *v4;
    if (!*v4)
      goto LABEL_3;
  }
  v1[30] = v8;
  operator delete(v8);
  v9 = *v3;
  if (!*v3)
  {
LABEL_4:
    v10 = *v2;
    if (!*v2)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  v1[27] = v9;
  operator delete(v9);
  v10 = *v2;
  if (!*v2)
  {
LABEL_5:
    v11 = (std::__shared_weak_count *)v1[22];
    if (!v11)
      goto LABEL_15;
    goto LABEL_11;
  }
LABEL_10:
  v1[24] = v10;
  operator delete(v10);
  v11 = (std::__shared_weak_count *)v1[22];
  if (!v11)
    goto LABEL_15;
LABEL_11:
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_15:
  v14 = (std::__shared_weak_count *)v1[20];
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  sub_19C36B630(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C434084(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  *a1 = &off_1E3D35A10;
  v2 = (std::__shared_weak_count *)a1[27];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return sub_19C34E2D8(a1);
}

void sub_19C4340E8(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  *a1 = &off_1E3D35A10;
  v2 = (std::__shared_weak_count *)a1[27];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  sub_19C34E2D8(a1);
  JUMPOUT(0x1A1AD355CLL);
}

uint64_t sub_19C434160(uint64_t a1, _BYTE **a2, uint64_t a3)
{
  uint64_t v5;
  void *__p[3];

  sub_19C435878(__p, a1, *a2, a2[1]);
  v5 = sub_19C3EE544(a1, __p, a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

void sub_19C4341C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C4341DC(uint64_t a1, _BYTE **a2, uint64_t a3)
{
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BYTE *v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v19;
  __int128 v20;
  int *v21;
  __int128 v22;
  void *__p;
  _BYTE *v24;

  sub_19C435878(&__p, a1, *a2, a2[1]);
  v5 = v24;
  v6 = (v24 - (_BYTE *)__p) >> 2;
  if (v24 == __p)
  {
    v7 = v24;
  }
  else
  {
    do
    {
      if (((*(uint64_t (**)(_QWORD, void *, unint64_t))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), __p, v6) & 1) != 0)break;
      --v6;
    }
    while (v6);
    v5 = __p;
    v7 = v24;
  }
  if (v6 == (v7 - v5) >> 2)
  {
    v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8));
    v10 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8), v8, v9);
  }
  else
  {
    sub_19C435A64(&v21, a1, &__p, v6);
    v11 = v21;
    v10 = (*(uint64_t (**)(_QWORD, int *, uint64_t))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8), v21, (uint64_t)(v22 - (_QWORD)v21) >> 2);
    if (!v10)
    {
      if ((sub_19C3EE544(a1, &__p, a3) & 1) == 0)
        __assert_rtn("_getNetworkState", "CoreLanguageModel.cpp", 161, "false");
      v12 = v24;
      v13 = (v24 - (_BYTE *)__p) >> 2;
      if (v24 == __p)
      {
        v14 = v24;
      }
      else
      {
        do
        {
          if (((*(uint64_t (**)(_QWORD, void *, unint64_t))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), __p, v13) & 1) != 0)break;
          --v13;
        }
        while (v13);
        v12 = __p;
        v14 = v24;
      }
      if (v13 == (v14 - v12) >> 2)
      {
        v15 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8));
        v17 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8), v15, v16);
      }
      else
      {
        sub_19C435A64(&v19, a1, &__p, v13);
        if (v11)
          operator delete(v11);
        v11 = v19;
        v21 = v19;
        v22 = v20;
        v17 = (*(uint64_t (**)(_QWORD, int *, uint64_t))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8), v19, (uint64_t)(v20 - (_QWORD)v19) >> 2);
      }
      v10 = v17;
    }
    if (v11)
      operator delete(v11);
  }
  if (__p)
  {
    v24 = __p;
    operator delete(__p);
  }
  return v10;
}

void sub_19C434410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  void *v19;

  if (v17)
  {
    operator delete(v17);
    v19 = __p;
    if (!__p)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v19 = __p;
    if (!__p)
      goto LABEL_3;
  }
  operator delete(v19);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C434474(uint64_t a1, _QWORD *a2, unint64_t a3, _QWORD *a4)
{
  _DWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  int v11;
  _DWORD *v12;
  int64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  size_t v27;
  char *v28;
  char *v29;
  _DWORD *v30;
  int v31;
  char *v32;
  char *v33;
  int64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _BYTE *v39;
  _DWORD *v40;
  unint64_t v41;
  char *v42;
  int v43;
  uint64_t v44;
  _OWORD *v45;
  char *v46;
  uint64_t v47;
  __int128 v48;
  _BYTE *v49;
  uint64_t v50;
  unint64_t v51;
  BOOL v52;
  _BYTE *v53;
  int64_t v54;
  _DWORD *v55;
  NSObject *v56;
  BOOL v57;
  unint64_t v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  float16x8_t *v63;
  unint64_t v64;
  int *v65;
  uint64_t v66;
  float32x4_t *v67;
  float16x8_t *v68;
  uint64_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  int v74;
  char *v80;
  char *v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *p_shared_owners;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const void *v89;
  __CFError *v90;
  CFTypeRef v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  unint64_t v97;
  char *v98;
  int64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  char *v105;
  char *v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t *v112;
  unint64_t v113;
  _QWORD *v114;
  _BYTE *v115;
  _BYTE *v116;
  int64_t v117;
  char *v118;
  char *v119;
  _QWORD *v120;
  unint64_t v121;
  unint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  char **v126;
  _BYTE *v127;
  _BYTE *v128;
  int64_t v129;
  char *v130;
  char *v131;
  char *v132;
  __int128 v133;
  _QWORD *v134;
  _QWORD *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  __int128 v142;
  __int128 v143;
  char *v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  void *v160;
  char *v161;
  void *v162;
  void *v163;
  char *v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t result;
  uint64_t v169;
  uint64_t v170;
  os_signpost_id_t spid;
  int v172;
  char *v173;
  unint64_t v174;
  unint64_t v175;
  char *v177;
  int v178;
  _QWORD *v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD v185[3];
  void *v186;
  __int128 v187;
  void *v188;
  char *v189;
  char *v190;
  void *__p;
  void *v192;
  char *v193;
  void *v194;
  __int128 v195;
  CFTypeRef v196;
  __CFError *v197;
  void *v198;
  uint8_t buf[8];
  _BYTE v200[24];
  char *v201;
  __int128 v202;
  uint64_t v203;
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v4 = (_DWORD *)*a2;
  if (*(_DWORD *)*a2 != 1)
    __assert_rtn("_forward", "CoreLanguageModel.cpp", 189, "context[0] == kMontrealTokenIDBeginningOfSentence");
  v5 = a3;
  v6 = a2;
  v7 = (_BYTE *)a2[1];
  v8 = (v7 - (_BYTE *)v4) >> 2;
  if (v8 == a3)
    __assert_rtn("_forward", "CoreLanguageModel.cpp", 190, "context.size() != priorContextLength");
  v9 = v8 > a3;
  v10 = v8 - a3;
  if (v9 && v10 > *(_QWORD *)(a1 + 88))
  {
    v5 = sub_19C4356F0(a1, a2);
    v4 = (_DWORD *)*v6;
    v7 = (_BYTE *)v6[1];
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v12 = &v4[v5];
  v194 = 0;
  v195 = 0uLL;
  if (v12 == (_DWORD *)v7)
  {
    v15 = 0;
    v14 = 0;
    v172 = v11;
    if (!v11)
      goto LABEL_15;
    goto LABEL_13;
  }
  v13 = v7 - (_BYTE *)v12;
  if (v7 - (_BYTE *)v12 < 0)
    sub_19C2A18E8();
  v14 = (char *)operator new(v7 - (_BYTE *)v12);
  v15 = &v14[4 * (v13 >> 2)];
  v194 = v14;
  *((_QWORD *)&v195 + 1) = v15;
  memcpy(v14, v12, v13);
  *(_QWORD *)&v195 = v15;
  v172 = v11;
  if (v11)
  {
LABEL_13:
    if (*(_DWORD *)v14 != 1)
    {
      sub_19C40002C(&v194, v14, byte_19C4793A8);
      v14 = (char *)v194;
      v15 = (char *)v195;
    }
  }
LABEL_15:
  __p = 0;
  v192 = 0;
  v193 = 0;
  v16 = (v15 - v14) >> 2;
  if (v15 != v14)
  {
    if (v15 - v14 < 0)
      sub_19C2A18E8();
    __p = operator new(v15 - v14);
    v193 = (char *)__p + 4 * v16;
    memmove(__p, v14, v15 - v14);
    v192 = v193;
  }
  if (v5)
    v17 = v172;
  else
    v17 = 1;
  if ((v17 & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v178 = v172;
    goto LABEL_76;
  }
  v20 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), *v6, v5);
  v22 = v21;
  if (v21 + v16 >= *(_QWORD *)(a1 + 224))
  {
    v18 = 0;
  }
  else
  {
    v23 = (const void *)v20;
    v182 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v20, v21);
    v179 = v6;
    v24 = v22;
    v25 = 0;
    v26 = 0;
    v169 = v24;
    v27 = 4 * v24;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v200 = 0;
    *(_QWORD *)&v200[8] = 0;
    if (4 * v24)
    {
      if ((v27 & 0x8000000000000000) != 0)
        sub_19C2A18E8();
      v28 = (char *)operator new(4 * v24);
      v26 = v28;
      v25 = &v28[4 * ((4 * v169) >> 2)];
      if (v169)
        memmove(v28, v23, v27);
    }
    if (__p)
    {
      v192 = __p;
      operator delete(__p);
    }
    __p = v26;
    v192 = v25;
    v193 = v25;
    if (v15 != v14)
    {
      v29 = v14;
      v180 = (v15 - v14) >> 2;
      while (1)
      {
        v31 = *(_DWORD *)v29;
        if (v25 >= v193)
          break;
        *(_DWORD *)v25 = v31;
        v30 = v25 + 4;
LABEL_33:
        v192 = v30;
        v29 += 4;
        v25 = (char *)v30;
        v16 = v180;
        if (v29 == v15)
          goto LABEL_61;
      }
      v32 = v14;
      v33 = (char *)__p;
      v34 = v25 - (_BYTE *)__p;
      v35 = (v25 - (_BYTE *)__p) >> 2;
      v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 62)
        sub_19C2A18E8();
      v37 = v193 - (_BYTE *)__p;
      if ((v193 - (_BYTE *)__p) >> 1 > v36)
        v36 = v37 >> 1;
      if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
        v38 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v38 = v36;
      if (v38)
      {
        if (v38 >> 62)
          sub_19C2A143C();
        v39 = operator new(4 * v38);
      }
      else
      {
        v39 = 0;
      }
      v40 = &v39[4 * v35];
      *v40 = v31;
      v30 = v40 + 1;
      if (v25 == v33)
      {
        v14 = v32;
        goto LABEL_51;
      }
      v41 = v25 - 4 - v33;
      if (v41 < 0xBC
        || &v39[v34 - 4 - (v41 & 0xFFFFFFFFFFFFFFFCLL)] > &v39[v34 - 4]
        || &v25[-(v41 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v25 - 4
        || (unint64_t)(v25 - v39 - v34) < 0x20)
      {
        v42 = v25;
        v14 = v32;
      }
      else
      {
        v44 = (v41 >> 2) + 1;
        v42 = &v25[-4 * (v44 & 0x7FFFFFFFFFFFFFF8)];
        v45 = &v39[4 * v35 - 16];
        v46 = v25 - 16;
        v47 = v44 & 0x7FFFFFFFFFFFFFF8;
        v14 = v32;
        do
        {
          v48 = *(_OWORD *)v46;
          *(v45 - 1) = *((_OWORD *)v46 - 1);
          *v45 = v48;
          v45 -= 2;
          v46 -= 32;
          v47 -= 8;
        }
        while (v47);
        v40 -= v44 & 0x7FFFFFFFFFFFFFF8;
        if (v44 == (v44 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_51:
          __p = v40;
          v192 = v30;
          v193 = &v39[4 * v38];
          if (v33)
            operator delete(v33);
          goto LABEL_33;
        }
      }
      do
      {
        v43 = *((_DWORD *)v42 - 1);
        v42 -= 4;
        *--v40 = v43;
      }
      while (v42 != v33);
      goto LABEL_51;
    }
LABEL_61:
    v19 = v182;
    if (v182)
    {
      LOBYTE(v172) = 0;
      v178 = 0;
      v18 = v169;
      goto LABEL_76;
    }
    v18 = v169;
    v6 = v179;
  }
  v50 = *v6;
  v49 = (_BYTE *)v6[1];
  if (*(_QWORD *)(a1 + 88) >= (unint64_t)((uint64_t)&v49[-*v6] >> 2))
  {
    v51 = 0;
  }
  else
  {
    v51 = sub_19C4356F0(a1, v6);
    v50 = *v6;
    v49 = (_BYTE *)v6[1];
  }
  v52 = v51 != 0;
  v53 = (_BYTE *)(v50 + 4 * v51);
  *(_QWORD *)buf = 0;
  *(_QWORD *)v200 = 0;
  *(_QWORD *)&v200[8] = 0;
  if (v53 == v49)
  {
    v55 = 0;
  }
  else
  {
    v54 = v49 - v53;
    if (v49 - v53 < 0)
      sub_19C2A18E8();
    v55 = operator new(v49 - v53);
    *(_QWORD *)buf = v55;
    *(_QWORD *)&v200[8] = &v55[v54 >> 2];
    memcpy(v55, v53, v54);
    *(_QWORD *)v200 = &v55[v54 >> 2];
  }
  if (*v55 != 1)
    sub_19C40002C((void **)buf, v55, byte_19C4793A8);
  LOBYTE(v172) = v52;
  if (v194)
  {
    *(_QWORD *)&v195 = v194;
    operator delete(v194);
  }
  v19 = 0;
  v14 = *(char **)buf;
  v194 = *(void **)buf;
  v195 = *(_OWORD *)v200;
  v16 = (uint64_t)(*(_QWORD *)v200 - *(_QWORD *)buf) >> 2;
  v178 = 1;
LABEL_76:
  v188 = 0;
  v189 = 0;
  v190 = 0;
  v186 = 0;
  v187 = 0uLL;
  if (qword_1EDB971E0 != -1)
    dispatch_once(&qword_1EDB971E0, &unk_1E3D3AC10);
  spid = os_signpost_id_generate((os_log_t)qword_1EDB971D8);
  if ((v172 & 1) != 0 || v16 > *(_QWORD *)(a1 + 88) - 4)
  {
    if (qword_1EDB971E0 != -1)
      dispatch_once(&qword_1EDB971E0, &unk_1E3D3AC10);
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v56 = qword_1EDB971D8;
      if (os_signpost_enabled((os_log_t)qword_1EDB971D8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C291000, v56, OS_SIGNPOST_INTERVAL_BEGIN, spid, "TruncatedContextMaxForwardPassesCalculated", (const char *)&unk_19C47C5B5, buf, 2u);
      }
    }
  }
  v170 = v18;
  if (v16)
  {
    v57 = 0;
    v58 = 0;
    v177 = 0;
    v175 = v16 - 1;
    v59 = &qword_1EE41C000;
    v173 = v14;
    v181 = v16;
    while (1)
    {
      ++*a4;
      v61 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(**(_QWORD **)(a1 + 40) + 24))(*(_QWORD *)(a1 + 40), v19, *(unsigned int *)&v14[4 * v58], 5, 0, 0);
      if (!v62)
        goto LABEL_216;
      v63 = *(float16x8_t **)(a1 + 16);
      if (v62 != (uint64_t)(*(_QWORD *)(a1 + 24) - (_QWORD)v63) >> 1)
        __assert_rtn("compressOutputLayer", "NeuralNetworkUtils.hpp", 84, "uncompressed.size() == compressed.size() && \"mismatched output layer sizes\"");
      v64 = (v62 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v64 < 0xF)
        break;
      v66 = (v64 + 1) & 0x7FFFFFFFFFFFFFF0;
      v67 = (float32x4_t *)(v61 + 32);
      v68 = v63 + 1;
      v69 = v66;
      do
      {
        v71 = v67[-2];
        v70 = v67[-1];
        v73 = *v67;
        v72 = v67[1];
        v67 += 4;
        v68[-1] = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v71), v70);
        *v68 = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v73), v72);
        v68 += 2;
        v69 -= 16;
      }
      while (v69);
      if (v64 + 1 != v66)
      {
        v63 = (float16x8_t *)((char *)v63 + 2 * v66);
        v65 = (int *)(v61 + 4 * v66);
        do
        {
LABEL_97:
          v74 = *v65++;
          _S0 = v74;
          __asm { FCVT            H0, S0 }
          v63->i16[0] = _S0;
          v63 = (float16x8_t *)((char *)v63 + 2);
        }
        while (v65 != (int *)(v61 + 4 * v62));
      }
      if (v58 == v175)
      {
        v80 = 0;
      }
      else
      {
        (*(void (**)(uint8_t *__return_ptr))(**(_QWORD **)(a1 + 40) + 32))(buf);
        v80 = *(char **)buf;
        *(_QWORD *)buf = 0;
        if (v177)
        {
          (*(void (**)(char *))(*(_QWORD *)v177 + 8))(v177);
          v81 = *(char **)buf;
          *(_QWORD *)buf = 0;
          if (v81)
            (*(void (**)(char *))(*(_QWORD *)v81 + 8))(v81);
        }
        v177 = v80;
      }
      v82 = *(_QWORD *)(a1 + 40);
      v83 = *(std::__shared_weak_count **)(a1 + 48);
      v185[1] = v82;
      v185[2] = v83;
      if (v83)
      {
        p_shared_owners = (unint64_t *)&v83->__shared_owners_;
        do
          v85 = __ldxr(p_shared_owners);
        while (__stxr(v85 + 1, p_shared_owners));
      }
      if (*(_DWORD *)(v82 + 8) != 1)
        __assert_rtn("copyCurrentIncrementalState", "MontrealInferenceEngine.cpp", 153, "m_architecture == NNModelArchitecture::Transformer");
      v197 = 0;
      v86 = *(_QWORD *)(v82 + 16);
      *(_QWORD *)buf = 0;
      *(_QWORD *)v200 = buf;
      *(_QWORD *)&v200[8] = 0x2000000000;
      v87 = off_1EDB96E78;
      *(_QWORD *)&v200[16] = off_1EDB96E78;
      if (!off_1EDB96E78)
      {
        v198 = 0;
        if (v59[176])
        {
          v88 = (void *)v59[176];
          if (!v88)
            goto LABEL_240;
        }
        else
        {
          v202 = xmmword_1E3D3C608;
          v203 = 0;
          v59[176] = _sl_dlopen();
          v88 = (void *)v59[176];
          if (!v88)
          {
LABEL_240:
            result = abort_report_np();
            goto LABEL_255;
          }
          if (v198)
            free(v198);
        }
        v87 = dlsym(v88, "MRLNeuralNetworkCopyIncrementalStates");
        *(_QWORD *)(*(_QWORD *)v200 + 24) = v87;
        off_1EDB96E78 = v87;
      }
      _Block_object_dispose(buf, 8);
      if (!v87)
      {
        dlerror();
        result = abort_report_np();
LABEL_255:
        __break(1u);
        return result;
      }
      v89 = (const void *)((uint64_t (*)(uint64_t, __CFError **))v87)(v86, &v197);
      sub_19C31D164(&v196, v89);
      v90 = v197;
      if (v197)
      {
        *(_QWORD *)buf = operator new(0x20uLL);
        *(_OWORD *)v200 = xmmword_19C46DE80;
        strcpy(*(char **)buf, "MRLNeuralNetworkCopyStates");
        sub_19C40C030((uint64_t *)buf, v90);
        if ((v200[15] & 0x80000000) != 0)
          operator delete(*(void **)buf);
      }
      v91 = v196;
      v92 = (_QWORD *)operator new();
      v93 = v92;
      v94 = *(_QWORD *)(v82 + 192);
      *v92 = &off_1E3D364C0;
      if (v91)
      {
        CFRetain(v91);
        sub_19C31D164(v93 + 1, v91);
      }
      else
      {
        v92[1] = 0;
      }
      v93[2] = v94;
      if (v196)
        CFRelease(v196);
      v183 = (uint64_t)v80;
      v95 = v189;
      if (v189 < v190)
      {
        *(_QWORD *)v189 = v93;
        v96 = v95 + 8;
        goto LABEL_152;
      }
      v97 = v58;
      v98 = (char *)v188;
      v99 = v189 - (_BYTE *)v188;
      v100 = (v189 - (_BYTE *)v188) >> 3;
      v101 = v100 + 1;
      if ((unint64_t)(v100 + 1) >> 61)
        sub_19C2A18E8();
      v102 = v190 - (_BYTE *)v188;
      if ((v190 - (_BYTE *)v188) >> 2 > v101)
        v101 = v102 >> 2;
      if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFF8)
        v103 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v103 = v101;
      if (v103)
      {
        if (v103 >> 61)
          sub_19C2A143C();
        v104 = (char *)operator new(8 * v103);
      }
      else
      {
        v104 = 0;
      }
      v105 = &v104[8 * v100];
      v106 = &v104[8 * v103];
      *(_QWORD *)v105 = v93;
      v96 = v105 + 8;
      if (v95 == v98)
      {
        v188 = v105;
        v189 = v105 + 8;
        v190 = &v104[8 * v103];
        v58 = v97;
        v59 = &qword_1EE41C000;
        if (!v95)
          goto LABEL_152;
LABEL_151:
        operator delete(v95);
        goto LABEL_152;
      }
      v107 = v95 - v98 - 8;
      v59 = &qword_1EE41C000;
      if (v107 > 0x77
        && (&v95[-(v107 & 0xFFFFFFFFFFFFFFF8) - 8] >= v105 || &v104[v99 - (v107 & 0xFFFFFFFFFFFFFFF8) - 8] >= v95))
      {
        v138 = 0;
        v139 = (v107 >> 3) + 1;
        v108 = &v105[-8 * (v139 & 0x3FFFFFFFFFFFFFFCLL)];
        v140 = v139 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v141 = &v95[v138];
          v143 = *(_OWORD *)&v95[v138 - 32];
          v142 = *(_OWORD *)&v95[v138 - 16];
          v144 = &v105[v138];
          *((_OWORD *)v141 - 2) = 0uLL;
          *((_OWORD *)v141 - 1) = 0uLL;
          *((_OWORD *)v144 - 2) = v143;
          *((_OWORD *)v144 - 1) = v142;
          v138 -= 32;
          v140 -= 4;
        }
        while (v140);
        v58 = v97;
        if (v139 == (v139 & 0x3FFFFFFFFFFFFFFCLL))
          goto LABEL_144;
        v95 -= 8 * (v139 & 0x3FFFFFFFFFFFFFFCLL);
      }
      else
      {
        v108 = v105;
        v58 = v97;
      }
      do
      {
        v109 = *((_QWORD *)v95 - 1);
        v95 -= 8;
        *(_QWORD *)v95 = 0;
        *((_QWORD *)v108 - 1) = v109;
        v108 -= 8;
      }
      while (v95 != v98);
      v98 = (char *)v188;
      v95 = v189;
LABEL_144:
      v188 = v108;
      v189 = v105 + 8;
      v190 = v106;
      if (v95 != v98)
      {
        do
        {
          v111 = *((_QWORD *)v95 - 1);
          v95 -= 8;
          v110 = v111;
          *(_QWORD *)v95 = 0;
          if (v111)
            (*(void (**)(uint64_t))(*(_QWORD *)v110 + 8))(v110);
        }
        while (v95 != v98);
        v95 = v98;
      }
      if (v95)
        goto LABEL_151;
LABEL_152:
      v189 = v96;
      if (v83)
      {
        v112 = (unint64_t *)&v83->__shared_owners_;
        do
          v113 = __ldaxr(v112);
        while (__stlxr(v113 - 1, v112));
        if (!v113)
        {
          ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
          std::__shared_weak_count::__release_weak(v83);
        }
      }
      v114 = (_QWORD *)v187;
      if ((unint64_t)v187 < *((_QWORD *)&v187 + 1))
      {
        *(_OWORD *)v187 = 0uLL;
        v114[2] = 0;
        v19 = v183;
        v116 = *(_BYTE **)(a1 + 16);
        v115 = *(_BYTE **)(a1 + 24);
        v117 = v115 - v116;
        if (v115 != v116)
        {
          if (v117 < 0)
            sub_19C2A18E8();
          v118 = (char *)operator new(v115 - v116);
          *v114 = v118;
          v114[1] = v118;
          v119 = &v118[2 * (v117 >> 1)];
          v114[2] = v119;
          memcpy(v118, v116, v117);
          v114[1] = v119;
        }
        v60 = v114 + 3;
        goto LABEL_88;
      }
      v120 = v186;
      v121 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v187 - (_QWORD)v186) >> 3) + 1;
      if (v121 > 0xAAAAAAAAAAAAAAALL)
        sub_19C2A18E8();
      if (0x5555555555555556 * ((uint64_t)(*((_QWORD *)&v187 + 1) - (_QWORD)v186) >> 3) > v121)
        v121 = 0x5555555555555556 * ((uint64_t)(*((_QWORD *)&v187 + 1) - (_QWORD)v186) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v187 + 1) - (_QWORD)v186) >> 3) >= 0x555555555555555)
        v122 = 0xAAAAAAAAAAAAAAALL;
      else
        v122 = v121;
      v201 = (char *)&v187 + 8;
      v174 = v58;
      if (v122)
      {
        if (v122 > 0xAAAAAAAAAAAAAAALL)
          sub_19C2A143C();
        v123 = (char *)operator new(24 * v122);
      }
      else
      {
        v123 = 0;
      }
      v124 = &v123[8 * ((uint64_t)(v187 - (_QWORD)v186) >> 3)];
      *(_QWORD *)buf = v123;
      *(_QWORD *)v200 = v124;
      v125 = &v123[24 * v122];
      *(_QWORD *)&v200[8] = v124;
      *(_QWORD *)&v200[16] = v125;
      *((_QWORD *)v124 + 1) = 0;
      v126 = (char **)(v124 + 8);
      *((_QWORD *)v124 + 2) = 0;
      *(_QWORD *)v124 = 0;
      v128 = *(_BYTE **)(a1 + 16);
      v127 = *(_BYTE **)(a1 + 24);
      v129 = v127 - v128;
      if (v127 != v128)
      {
        if (v129 < 0)
          sub_19C2A18E8();
        v130 = (char *)operator new(v127 - v128);
        *(_QWORD *)v124 = v130;
        *v126 = v130;
        v131 = &v130[2 * (v129 >> 1)];
        *((_QWORD *)v124 + 2) = v131;
        memcpy(v130, v128, v129);
        *v126 = v131;
      }
      v60 = v124 + 24;
      *(_QWORD *)&v200[8] = v124 + 24;
      if (v114 == v120)
      {
        v186 = v124;
        *(_QWORD *)&v187 = v124 + 24;
        *((_QWORD *)&v187 + 1) = v125;
        v14 = v173;
        v19 = v183;
        v58 = v174;
        v59 = &qword_1EE41C000;
      }
      else
      {
        do
        {
          v132 = v124;
          *((_QWORD *)v124 - 2) = 0;
          *((_QWORD *)v124 - 1) = 0;
          v133 = *(_OWORD *)(v114 - 3);
          v114 -= 3;
          *(_OWORD *)(v124 - 24) = v133;
          v124 -= 24;
          *((_QWORD *)v132 - 1) = v114[2];
          *v114 = 0;
          v114[1] = 0;
          v114[2] = 0;
        }
        while (v114 != v120);
        v114 = v186;
        v134 = (_QWORD *)v187;
        v186 = v124;
        v187 = *(_OWORD *)&v200[8];
        v60 = *(_QWORD **)&v200[8];
        v14 = v173;
        v58 = v174;
        v59 = &qword_1EE41C000;
        if (v134 == v114)
        {
          v19 = v183;
          if (!v114)
            goto LABEL_88;
LABEL_185:
          operator delete(v114);
          goto LABEL_88;
        }
        v135 = v134;
        v19 = v183;
        do
        {
          v137 = (void *)*(v135 - 3);
          v135 -= 3;
          v136 = v137;
          if (v137)
          {
            *(v134 - 2) = v136;
            operator delete(v136);
          }
          v134 = v135;
        }
        while (v135 != v114);
      }
      if (v114)
        goto LABEL_185;
LABEL_88:
      *(_QWORD *)&v187 = v60;
      ++v58;
      v16 = v181;
      v57 = v58 >= v181;
      if (v58 == v181)
        goto LABEL_193;
    }
    v65 = (int *)v61;
    goto LABEL_97;
  }
  v177 = 0;
LABEL_193:
  if ((v172 & 1) != 0 || v16 > *(_QWORD *)(a1 + 88) - 4)
  {
    if (qword_1EDB971E0 != -1)
      dispatch_once(&qword_1EDB971E0, &unk_1E3D3AC10);
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v145 = qword_1EDB971D8;
      if (os_signpost_enabled((os_log_t)qword_1EDB971D8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C291000, v145, OS_SIGNPOST_INTERVAL_END, spid, "TruncatedContextMaxForwardPassesCalculated", (const char *)&unk_19C47C5B5, buf, 2u);
      }
    }
  }
  v146 = 0;
  v147 = 0;
  v148 = (char *)v188;
  do
  {
    if (v16 == v147)
      break;
    if (v178)
      v149 = v14;
    else
      v149 = __p;
    if (v178)
      v150 = v147 + 1;
    else
      v150 = v170 + 1 + v147;
    v151 = *(_QWORD *)&v148[8 * v147];
    v152 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)&v148[8 * v147] = 0;
    v185[0] = v151;
    v153 = (*(uint64_t (**)(uint64_t, void *, uint64_t, _QWORD *))(*(_QWORD *)v152 + 16))(v152, v149, v150, v185);
    v154 = v185[0];
    v185[0] = 0;
    if (v154)
      (*(void (**)(uint64_t))(*(_QWORD *)v154 + 8))(v154);
    v146 += 24;
    ++v147;
  }
  while ((v153 & 1) != 0);
  v155 = v189;
  while (v155 != v148)
  {
    v157 = *((_QWORD *)v155 - 1);
    v155 -= 8;
    v156 = v157;
    *(_QWORD *)v155 = 0;
    if (v157)
      (*(void (**)(uint64_t))(*(_QWORD *)v156 + 8))(v156);
  }
  v189 = v148;
  v57 = 1;
LABEL_216:
  if (v177)
    (*(void (**)(char *))(*(_QWORD *)v177 + 8))(v177);
  v158 = (char *)v186;
  if (v186)
  {
    v159 = (char *)v187;
    v160 = v186;
    if ((void *)v187 != v186)
    {
      v161 = (char *)v187;
      do
      {
        v163 = (void *)*((_QWORD *)v161 - 3);
        v161 -= 24;
        v162 = v163;
        if (v163)
        {
          *((_QWORD *)v159 - 2) = v162;
          operator delete(v162);
        }
        v159 = v161;
      }
      while (v161 != v158);
      v160 = v186;
    }
    *(_QWORD *)&v187 = v158;
    operator delete(v160);
  }
  v164 = (char *)v188;
  if (v188)
  {
    v165 = v189;
    while (v165 != v164)
    {
      v167 = *((_QWORD *)v165 - 1);
      v165 -= 8;
      v166 = v167;
      *(_QWORD *)v165 = 0;
      if (v167)
        (*(void (**)(uint64_t))(*(_QWORD *)v166 + 8))(v166);
    }
    operator delete(v164);
  }
  if (__p)
  {
    v192 = __p;
    operator delete(__p);
  }
  if (v194)
  {
    *(_QWORD *)&v195 = v194;
    operator delete(v194);
  }
  return v57;
}

void sub_19C4354FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,void *a37,uint64_t a38)
{
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;

  v40 = *(void **)(v38 - 192);
  if (v40)
  {
    *(_QWORD *)(v38 - 184) = v40;
    operator delete(v40);
    v41 = __p;
    if (!__p)
    {
LABEL_3:
      v42 = a37;
      if (!a37)
LABEL_8:
        _Unwind_Resume(exception_object);
LABEL_7:
      operator delete(v42);
      goto LABEL_8;
    }
  }
  else
  {
    v41 = __p;
    if (!__p)
      goto LABEL_3;
  }
  operator delete(v41);
  v42 = a37;
  if (!a37)
    goto LABEL_8;
  goto LABEL_7;
}

uint64_t sub_19C4356D0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 208) + 136))(*(_QWORD *)(a1 + 208));
}

uint64_t sub_19C4356E0(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 96) << 32) - 0x100000000;
}

unint64_t sub_19C4356F0(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  unint64_t v8;
  unint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t)(a2[1] - *a2) >> 2;
  v3 = *(_QWORD *)(a1 + 88);
  v4 = v2 > v3;
  v5 = v2 - v3;
  if (!v4)
    __assert_rtn("_truncatedPriorContextLength", "CoreLanguageModel.cpp", 39, "context.size() > m_forwardPassLimit");
  v8 = v5 + 1;
  do
  {
    v9 = v8 - 1;
    if (v8 == 1)
      break;
    v10 = (*(uint64_t (**)(_QWORD, _QWORD *, unint64_t))(**(_QWORD **)(a1 + 208) + 136))(*(_QWORD *)(a1 + 208), a2, v8 - 2);
    v8 = v9;
  }
  while (!v10);
  if (qword_1EE41C5C0 != -1)
    dispatch_once(&qword_1EE41C5C0, &unk_1E3D3C9E8);
  v11 = qword_1EE41C5B8;
  if (os_log_type_enabled((os_log_t)qword_1EE41C5B8, OS_LOG_TYPE_INFO))
  {
    v12 = (uint64_t)(a2[1] - *a2) >> 2;
    v14 = 134218496;
    v15 = v12 - v9;
    v16 = 2048;
    v17 = v12;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_19C291000, v11, OS_LOG_TYPE_INFO, "limiting forward passes to %ld, with contextLength=%zu and priorContextLength=%zu", (uint8_t *)&v14, 0x20u);
  }
  return v9;
}

os_log_t sub_19C43584C()
{
  os_log_t result;

  result = os_log_create("com.apple.LanguageModeling", "CoreLanguageModel");
  qword_1EE41C5B8 = (uint64_t)result;
  return result;
}

void sub_19C435878(void **a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  int64_t v6;
  _BYTE *v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  int64_t v18;
  char *v19;
  char *v20;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v6 = a4 - a3;
  if (a4 == a3)
  {
    v8 = 0;
LABEL_6:
    sub_19C40002C(a1, v8, byte_19C4793A8);
    v8 = *a1;
    v9 = (char *)a1[1];
    goto LABEL_7;
  }
  if (v6 < 0)
    sub_19C2A18E8();
  v8 = operator new(a4 - a3);
  *a1 = v8;
  v9 = &v8[4 * (v6 >> 2)];
  a1[2] = v9;
  memcpy(v8, a3, v6);
  a1[1] = v9;
  if (*(_DWORD *)v8 != 1)
    goto LABEL_6;
LABEL_7:
  v10 = (v9 - v8) >> 2;
  v11 = *(_QWORD *)(a2 + 224);
  v12 = v10 >= v11;
  v13 = v10 - v11;
  if (v13 != 0 && v12)
    v14 = v13 + 1;
  else
    v14 = 0;
  if (v14 < v10)
  {
    while (((*(uint64_t (**)(_QWORD, void **, unint64_t))(**(_QWORD **)(a2 + 208) + 136))(*(_QWORD *)(a2 + 208), a1, v14) & 1) == 0)
    {
      ++v14;
      v16 = (char *)*a1;
      v15 = (char *)a1[1];
      if (v14 >= (v15 - (_BYTE *)*a1) >> 2)
        goto LABEL_16;
    }
  }
  if (v14)
  {
    v16 = (char *)*a1;
    v15 = (char *)a1[1];
LABEL_16:
    v17 = &v16[4 * v14];
    if (v15 == v17)
    {
      v20 = 0;
      v19 = 0;
      if (!v16)
        goto LABEL_20;
    }
    else
    {
      v18 = v15 - v17;
      if (v15 - v17 < 0)
        sub_19C2A18E8();
      v19 = (char *)operator new(v15 - v17);
      v20 = &v19[4 * (v18 >> 2)];
      memmove(v19, v17, v18);
      if (!v16)
        goto LABEL_20;
    }
    a1[1] = v16;
    operator delete(v16);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
LABEL_20:
    *a1 = v19;
    a1[1] = v20;
    a1[2] = v20;
    if (v19 == v20 || *(_DWORD *)v19 != 1)
      sub_19C40002C(a1, v19, byte_19C4793A8);
  }
}

void sub_19C435A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_19C435A64(int **a1, uint64_t a2, _QWORD *a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  int v13;
  _BYTE *v14;
  int64_t v15;
  int *v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  void *v25;
  size_t v26;
  const void *v27;
  char *v28;
  int v29;
  char *v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  char *v37;
  char *v38;
  unint64_t v39;
  char *v40;
  int v41;
  uint64_t v42;
  _OWORD *v43;
  char *v44;
  uint64_t v45;
  __int128 v46;
  _BYTE *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int *v51;
  unint64_t v52;
  BOOL v53;
  int **v54;
  int *v55;
  _BYTE *v56;
  int64_t v57;
  int *v58;
  uint64_t v59;
  int **v60;
  int *v61;
  int *v62;
  int *v63;
  void *__p;
  char *v65;
  char *v66;
  void *v67;
  int *v68;
  int *v69;

  v4 = a4;
  v9 = *a3;
  v8 = (_BYTE *)a3[1];
  v10 = (uint64_t)&v8[-*a3] >> 2;
  v11 = v10 > a4;
  v12 = v10 - a4;
  if (v11 && v12 > *(_QWORD *)(a2 + 88))
  {
    v4 = sub_19C4356F0(a2, a3);
    v9 = *a3;
    v8 = (_BYTE *)a3[1];
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = (_BYTE *)(v9 + 4 * v4);
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v60 = a1;
  if (v14 == v8)
  {
    v17 = 0;
    v16 = 0;
    if (!v13)
      goto LABEL_13;
    goto LABEL_11;
  }
  v15 = v8 - v14;
  if (v8 - v14 < 0)
    sub_19C2A18E8();
  v16 = (int *)operator new(v8 - v14);
  v17 = &v16[v15 >> 2];
  v67 = v16;
  v69 = v17;
  memcpy(v16, v14, v15);
  v68 = v17;
  if (v13)
  {
LABEL_11:
    if (*v16 != 1)
    {
      sub_19C40002C(&v67, v16, byte_19C4793A8);
      v16 = (int *)v67;
      v17 = v68;
    }
  }
LABEL_13:
  __p = 0;
  v65 = 0;
  v66 = 0;
  v18 = (char *)v17 - (char *)v16;
  if (v17 == v16)
  {
    v19 = 0;
  }
  else
  {
    if (v18 < 0)
      sub_19C2A18E8();
    __p = operator new((char *)v17 - (char *)v16);
    v19 = (char *)__p + 4 * (v18 >> 2);
    v66 = v19;
    memmove(__p, v16, (char *)v17 - (char *)v16);
    v65 = v19;
  }
  if (v4)
    v20 = v13;
  else
    v20 = 1;
  if ((v20 & 1) != 0)
  {
    v59 = 0;
    if (!v13)
      goto LABEL_66;
    goto LABEL_22;
  }
  v22 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), *a3, v4);
  v24 = (int *)v67;
  v17 = v68;
  if ((unint64_t)(v23 + (((char *)v68 - (_BYTE *)v67) >> 2)) >= *(_QWORD *)(a2 + 224))
  {
    v48 = *a3;
    v47 = (_BYTE *)a3[1];
    if (*(_QWORD *)(a2 + 88) >= (unint64_t)((uint64_t)&v47[-*a3] >> 2))
    {
      v49 = 0;
    }
    else
    {
      v49 = sub_19C4356F0(a2, a3);
      v48 = *a3;
      v47 = (_BYTE *)a3[1];
    }
    v56 = (_BYTE *)(v48 + 4 * v49);
    v61 = 0;
    v62 = 0;
    v63 = 0;
    if (v56 == v47)
    {
      v58 = 0;
    }
    else
    {
      v57 = v47 - v56;
      if (v47 - v56 < 0)
        sub_19C2A18E8();
      v58 = (int *)operator new(v47 - v56);
      v61 = v58;
      v63 = &v58[v57 >> 2];
      memcpy(v58, v56, v57);
      v62 = v63;
    }
    if (*v58 != 1)
      sub_19C40002C((void **)&v61, v58, byte_19C4793A8);
    if (v67)
    {
      v68 = (int *)v67;
      operator delete(v67);
      v68 = 0;
      v69 = 0;
    }
    v16 = v61;
    v17 = v62;
    v21 = v63;
    goto LABEL_82;
  }
  v19 = 0;
  v25 = 0;
  v59 = v23;
  v26 = 4 * v23;
  v61 = 0;
  v62 = 0;
  v63 = 0;
  if (4 * v23)
  {
    if ((v26 & 0x8000000000000000) != 0)
      sub_19C2A18E8();
    v27 = (const void *)v22;
    v28 = (char *)operator new(4 * v23);
    v25 = v28;
    v19 = &v28[4 * ((4 * v59) >> 2)];
    if (v59)
      memmove(v28, v27, v26);
  }
  if (__p)
  {
    v65 = (char *)__p;
    operator delete(__p);
    v24 = (int *)v67;
    v17 = v68;
  }
  __p = v25;
  v65 = v19;
  v66 = v19;
  if (v24 == v17)
  {
    v16 = v17;
    if (v13)
      goto LABEL_22;
LABEL_66:
    v50 = v59 + v17 - v16;
    v51 = (int *)__p;
    v52 = (v19 - (_BYTE *)__p) >> 2;
    v53 = v50 >= v52;
    if (v50 <= v52)
    {
      v54 = v60;
      if (!v53)
      {
        v19 = (char *)__p + 4 * v50;
        v65 = v19;
      }
    }
    else
    {
      sub_19C316738((uint64_t)&__p, v50 - v52);
      v54 = v60;
      v51 = (int *)__p;
      v19 = v65;
    }
    *v54 = v51;
    v54[1] = (int *)v19;
    v54[2] = (int *)v66;
    v55 = (int *)v67;
    if (v67)
      goto LABEL_84;
    return;
  }
  do
  {
    v29 = *v24;
    if (v19 < v66)
    {
      *(_DWORD *)v19 = v29;
      v19 += 4;
      goto LABEL_34;
    }
    v30 = (char *)__p;
    v31 = v19 - (_BYTE *)__p;
    v32 = (v19 - (_BYTE *)__p) >> 2;
    v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 62)
      sub_19C2A18E8();
    v34 = v66 - (_BYTE *)__p;
    if ((v66 - (_BYTE *)__p) >> 1 > v33)
      v33 = v34 >> 1;
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL)
      v35 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v35 = v33;
    if (v35)
    {
      if (v35 >> 62)
        sub_19C2A143C();
      v36 = operator new(4 * v35);
    }
    else
    {
      v36 = 0;
    }
    v37 = &v36[4 * v32];
    *(_DWORD *)v37 = v29;
    v38 = v37 + 4;
    if (v19 != v30)
    {
      v39 = v19 - 4 - v30;
      if (v39 >= 0xBC)
      {
        if (&v36[v31 - 4 - (v39 & 0xFFFFFFFFFFFFFFFCLL)] > &v36[v31 - 4])
        {
          v40 = v19;
        }
        else if (&v19[-(v39 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v19 - 4)
        {
          v40 = v19;
        }
        else if ((unint64_t)(v19 - v36 - v31) >= 0x20)
        {
          v42 = (v39 >> 2) + 1;
          v40 = &v19[-4 * (v42 & 0x7FFFFFFFFFFFFFF8)];
          v43 = &v36[4 * v32 - 16];
          v44 = v19 - 16;
          v45 = v42 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v46 = *(_OWORD *)v44;
            *(v43 - 1) = *((_OWORD *)v44 - 1);
            *v43 = v46;
            v43 -= 2;
            v44 -= 32;
            v45 -= 8;
          }
          while (v45);
          v37 -= 4 * (v42 & 0x7FFFFFFFFFFFFFF8);
          if (v42 == (v42 & 0x7FFFFFFFFFFFFFF8))
            goto LABEL_50;
        }
        else
        {
          v40 = v19;
        }
      }
      else
      {
        v40 = v19;
      }
      do
      {
        v41 = *((_DWORD *)v40 - 1);
        v40 -= 4;
        *((_DWORD *)v37 - 1) = v41;
        v37 -= 4;
      }
      while (v40 != v30);
    }
LABEL_50:
    __p = v37;
    v65 = v38;
    v66 = &v36[4 * v35];
    if (v30)
      operator delete(v30);
    v19 = v38;
LABEL_34:
    v65 = v19;
    ++v24;
  }
  while (v24 != v17);
  v16 = (int *)v67;
  v17 = v68;
  if (!v13)
    goto LABEL_66;
LABEL_22:
  v21 = v69;
LABEL_82:
  *v60 = v16;
  v60[1] = v17;
  v60[2] = v21;
  v68 = 0;
  v69 = 0;
  v67 = 0;
  if (__p)
  {
    v65 = (char *)__p;
    operator delete(__p);
    v55 = (int *)v67;
    if (v67)
    {
LABEL_84:
      v68 = v55;
      operator delete(v55);
    }
  }
}

void sub_19C435F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  void *v20;
  void *v21;

  if (a12)
  {
    operator delete(a12);
    v20 = a15;
    if (!a15)
    {
LABEL_3:
      v21 = __p;
      if (!__p)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    v20 = a15;
    if (!a15)
      goto LABEL_3;
  }
  operator delete(v20);
  v21 = __p;
  if (!__p)
LABEL_5:
    _Unwind_Resume(exception_object);
LABEL_4:
  operator delete(v21);
  goto LABEL_5;
}

void sub_19C436020(uint64_t a1, CFTypeRef *a2, uint64_t a3, _QWORD *a4, int a5)
{
  _QWORD *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v10 = operator new(0x20uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = &off_1E3D399E8;
  v18[1] = v10;
  v10[3] = &off_1E3D36BE8;
  v17[1] = 0;
  v18[0] = v10 + 3;
  v14 = 0;
  v15 = 0;
  v11 = a4[1];
  v16[0] = *a4;
  v16[1] = v11;
  v17[0] = 0;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  sub_19C3EE644(a1, a2, (uint64_t)v18, (uint64_t)v17, a3, (uint64_t)v16, a5);
}

void sub_19C4362B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  int v17;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      sub_19C2B43C8(v16);
      sub_19C34E2D8(v14);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void sub_19C436308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, char a17)
{
  sub_19C2B43C8((uint64_t)&a13);
  sub_19C2B43C8((uint64_t)&a15);
  sub_19C2B43C8((uint64_t)&a17);
  sub_19C2B43C8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_19C436338(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 88) && sub_19C3BDFF4(*(std::recursive_mutex **)(*(_QWORD *)(a1 + 72) + 464), a2))
    return 1;
  result = sub_19C31939C(*(_QWORD **)(a1 + 72), a2, 0);
  if (!(_DWORD)result)
    return result;
  return (_DWORD)result != 500 || sub_19C43BAA0(*(_QWORD *)(a1 + 72), a2) != 0;
}

_QWORD *sub_19C4363AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int64x2_t v6;
  uint64_t v7;
  __int16 v8;
  char v9;
  __int128 v10;
  int v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v7 = 0;
  v8 = 0;
  v9 = 1;
  v10 = xmmword_19C46DE10;
  v11 = 0;
  v12 = xmmword_19C46DE10;
  v14 = 0;
  v15 = 0;
  v13 = 0xFFEFFFFFFFFFFFFFLL;
  v17 = 0;
  sub_19C43AAE4(a4, a1, a2, *a3, (uint64_t)&v6, 1, v16);
  result = v17;
  if (v17 == v16)
  {
    v5 = 4;
    result = v16;
  }
  else
  {
    if (!v17)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_19C436488(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C4364C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int64x2_t v6;
  uint64_t v7;
  __int16 v8;
  char v9;
  __int128 v10;
  int v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v7 = 0;
  v8 = 0;
  v9 = 1;
  v10 = xmmword_19C46DE10;
  v11 = 0;
  v12 = xmmword_19C46DE10;
  v14 = 0;
  v15 = 0;
  v13 = 0xFFEFFFFFFFFFFFFFLL;
  v17 = 0;
  sub_19C43AAE4(a4, a1, a2, *a3, (uint64_t)&v6, 1, v16);
  result = v17;
  if (v17 == v16)
  {
    v5 = 4;
    result = v16;
  }
  else
  {
    if (!v17)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_19C4365A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C4365DC@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 *v19;
  _QWORD *v20;
  int64x2_t v21;
  __int128 *v22;
  _QWORD v23[3];
  _QWORD *v24;
  uint8_t buf[16];
  uint64_t v26;
  __int16 v27;
  char v28;
  __int128 v29;
  int v30;
  __int128 v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v5 = *a2;
  v6 = a2[1];
  if (*a2 != v6)
  {
    v8 = (uint64_t)result;
    v21 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    do
    {
      v15 = operator new();
      *(int64x2_t *)v15 = v21;
      *(_QWORD *)(v15 + 16) = 0;
      *(_QWORD *)(v15 + 24) = 0;
      *(_BYTE *)(v15 + 32) = 1;
      *(_OWORD *)(v15 + 40) = xmmword_19C46DE10;
      *(_DWORD *)(v15 + 56) = 0;
      *(_OWORD *)(v15 + 64) = xmmword_19C46DE10;
      *(_QWORD *)(v15 + 88) = 0;
      *(_QWORD *)(v15 + 96) = 0;
      *(_QWORD *)(v15 + 80) = 0xFFEFFFFFFFFFFFFFLL;
      *(_DWORD *)(v15 + 104) = 0;
      v16 = *a3;
      *(int64x2_t *)buf = v21;
      v26 = 0;
      v27 = 0;
      v28 = 1;
      v29 = xmmword_19C46DE10;
      v30 = 0;
      v31 = xmmword_19C46DE10;
      v32 = 0xFFEFFFFFFFFFFFFFLL;
      v33 = 0;
      v34 = 0;
      v24 = 0;
      sub_19C43AAE4((uint64_t *)&v22, v8, v5, v16, (uint64_t)buf, 1, v23);
      v17 = v24;
      if (v24 == v23)
      {
        v17 = v23;
        v18 = 4;
      }
      else
      {
        if (!v24)
          goto LABEL_11;
        v18 = 5;
      }
      (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_11:
      MEMORY[0x1A1AD355C](v15, 0x1000C4065B674BELL);
      v19 = v22;
      v20 = (_QWORD *)a4[1];
      if ((unint64_t)v20 < a4[2])
      {
        v9 = (_OWORD *)operator new();
        v10 = *v19;
        v11 = v19[2];
        v9[1] = v19[1];
        v9[2] = v11;
        *v9 = v10;
        v12 = v19[3];
        v13 = v19[4];
        v14 = v19[6];
        v9[5] = v19[5];
        v9[6] = v14;
        v9[3] = v12;
        v9[4] = v13;
        *v20 = v9;
        a4[1] = v20 + 1;
      }
      else
      {
        result = sub_19C3121A4(a4, v22);
        a4[1] = result;
        if (!v19)
          goto LABEL_5;
      }
      result = (_QWORD *)MEMORY[0x1A1AD355C](v19, 0x1000C4065B674BELL);
LABEL_5:
      v5 += 32;
    }
    while (v5 != v6);
  }
  return result;
}

void sub_19C4368F4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (v2)
    JUMPOUT(0x19C4368FCLL);
  sub_19C311DE4(v1);
  _Unwind_Resume(a1);
}

void sub_19C436918(void *a1, int a2)
{
  if (a2)
    sub_19C2CDAC8(a1);
  JUMPOUT(0x19C436934);
}

void sub_19C43693C(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, void ***a4@<X8>)
{
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  void *v23;
  void *v24;
  char *v25;
  char *v26;
  void *v27;
  void *v28;
  __int128 v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v5 = *a2;
  if (a2[1] != *a2)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v10 = (_QWORD *)(v5 + 24 * v7);
      v9 = v10[1];
      v11 = v9 - *v10;
      if (v9 == *v10)
      {
        v14 = 0uLL;
      }
      else
      {
        if (v11 < 0)
          sub_19C2A18E8();
        v12 = operator new((unint64_t)v11 >> 4);
        v13 = 2 * (v11 >> 5);
        v11 = (uint64_t)v12 + v13;
        memset_pattern16(v12, &unk_19C46E0A0, v13);
        *(_QWORD *)&v14 = v12;
        *((_QWORD *)&v14 + 1) = v11;
      }
      v32 = v14;
      if (v6 < v35)
      {
        *(_OWORD *)v6 = v14;
        *((_QWORD *)v6 + 2) = v11;
        v8 = v6 + 24;
      }
      else
      {
        v15 = v33;
        v16 = 0xAAAAAAAAAAAAAAABLL * ((v6 - v33) >> 3) + 1;
        if (v16 > 0xAAAAAAAAAAAAAAALL)
          sub_19C2A18E8();
        if (0x5555555555555556 * ((v35 - v33) >> 3) > v16)
          v16 = 0x5555555555555556 * ((v35 - v33) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v35 - v33) >> 3) >= 0x555555555555555)
          v17 = 0xAAAAAAAAAAAAAAALL;
        else
          v17 = v16;
        if (v17 > 0xAAAAAAAAAAAAAAALL)
          sub_19C2A143C();
        v18 = (char *)operator new(24 * v17);
        v19 = &v18[8 * ((v6 - v33) >> 3)];
        *(_OWORD *)v19 = v32;
        *((_QWORD *)v19 + 2) = v11;
        v8 = v19 + 24;
        if (v6 != v15)
        {
          v20 = v6;
          do
          {
            v21 = *(_OWORD *)(v20 - 24);
            v20 -= 24;
            *(_OWORD *)(v19 - 24) = v21;
            v19 -= 24;
            *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
            *(_QWORD *)v20 = 0;
            *((_QWORD *)v20 + 1) = 0;
            *((_QWORD *)v20 + 2) = 0;
          }
          while (v20 != v15);
          v33 = v19;
          v34 = v8;
          v22 = v6;
          v35 = &v18[24 * v17];
          do
          {
            v24 = (void *)*((_QWORD *)v22 - 3);
            v22 -= 24;
            v23 = v24;
            if (v24)
            {
              *((_QWORD *)v6 - 2) = v23;
              operator delete(v23);
            }
            v6 = v22;
          }
          while (v22 != v15);
          v6 = v15;
          if (!v15)
            goto LABEL_4;
LABEL_27:
          operator delete(v6);
          goto LABEL_4;
        }
        v33 = v19;
        v35 = &v18[24 * v17];
        if (v6)
          goto LABEL_27;
      }
LABEL_4:
      v34 = v8;
      ++v7;
      v5 = *a2;
      v6 = v8;
      if (v7 >= 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3))
        goto LABEL_29;
    }
  }
  v8 = 0;
LABEL_29:
  sub_19C436CFC(a1, a2, &v33, a3, a4);
  v25 = v33;
  if (v33)
  {
    if (v8 != v33)
    {
      v26 = v8;
      do
      {
        v28 = (void *)*((_QWORD *)v26 - 3);
        v26 -= 24;
        v27 = v28;
        if (v28)
        {
          *((_QWORD *)v8 - 2) = v27;
          operator delete(v27);
        }
        v8 = v26;
      }
      while (v26 != v25);
      v8 = v33;
    }
    v34 = v25;
    operator delete(v8);
  }
}

void sub_19C436CFC(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X3>, void ***a5@<X8>)
{
  uint64_t v6;
  char *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  char *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  void *v32;
  void *v33;
  int64x2_t v38;
  __int128 v39;
  void *__p;
  _QWORD *v41;
  char *v42;
  _QWORD v43[3];
  _QWORD *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v41 = 0;
  v42 = 0;
  v6 = *a2;
  if (a2[1] != *a2)
  {
    v7 = 0;
    v8 = 0;
    v38 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    do
    {
      v10 = *(_QWORD *)(v6 + 24 * v8 + 8) - *(_QWORD *)(v6 + 24 * v8);
      if (v10)
      {
        if ((unint64_t)v10 >= 0x4EC4EC4EC4EC4EC1)
          sub_19C2A18E8();
        v11 = v10 >> 5;
        v12 = (char *)operator new(104 * (v10 >> 5));
        v13 = &v12[104 * v11];
        v14 = v12;
        do
        {
          *(int64x2_t *)v14 = v38;
          *((_QWORD *)v14 + 2) = 0;
          *((_WORD *)v14 + 12) = 0;
          v14[32] = 1;
          *(_OWORD *)(v14 + 40) = xmmword_19C46DE10;
          *((_DWORD *)v14 + 14) = 0;
          *((_OWORD *)v14 + 4) = xmmword_19C46DE10;
          *((_QWORD *)v14 + 11) = 0;
          *((_QWORD *)v14 + 12) = 0;
          *((_QWORD *)v14 + 10) = 0xFFEFFFFFFFFFFFFFLL;
          v14 += 104;
        }
        while (v14 != v13);
        *(_QWORD *)&v15 = v12;
        *((_QWORD *)&v15 + 1) = &v12[104 * v11];
      }
      else
      {
        v13 = 0;
        v15 = 0uLL;
      }
      v39 = v15;
      if (v7 < v42)
      {
        *(_OWORD *)v7 = v15;
        *((_QWORD *)v7 + 2) = v13;
        v9 = v7 + 24;
      }
      else
      {
        v16 = (char *)__p;
        v17 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)__p) >> 3);
        v18 = v17 + 1;
        if (v17 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_19C2A18E8();
        if (0x5555555555555556 * ((v42 - (_BYTE *)__p) >> 3) > v18)
          v18 = 0x5555555555555556 * ((v42 - (_BYTE *)__p) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v42 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
          v19 = 0xAAAAAAAAAAAAAAALL;
        else
          v19 = v18;
        if (v19 > 0xAAAAAAAAAAAAAAALL)
          sub_19C2A143C();
        v20 = (char *)operator new(24 * v19);
        v21 = &v20[8 * ((v7 - (_BYTE *)__p) >> 3)];
        *(_OWORD *)v21 = v39;
        *((_QWORD *)v21 + 2) = v13;
        v9 = v21 + 24;
        if (v7 == v16)
        {
          __p = &v20[24 * v17];
          v42 = &v20[24 * v19];
        }
        else
        {
          v22 = v7;
          do
          {
            v23 = *(_OWORD *)(v22 - 24);
            v22 -= 24;
            *(_OWORD *)(v21 - 24) = v23;
            v21 -= 24;
            *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
            *(_QWORD *)v22 = 0;
            *((_QWORD *)v22 + 1) = 0;
            *((_QWORD *)v22 + 2) = 0;
          }
          while (v22 != v16);
          __p = v21;
          v41 = v9;
          v24 = v7;
          v42 = &v20[24 * v19];
          do
          {
            v26 = (void *)*((_QWORD *)v24 - 3);
            v24 -= 24;
            v25 = v26;
            if (v26)
            {
              *((_QWORD *)v7 - 2) = v25;
              operator delete(v25);
            }
            v7 = v24;
          }
          while (v24 != v16);
          v7 = v16;
        }
        if (v7)
          operator delete(v7);
      }
      v41 = v9;
      ++v8;
      v6 = *a2;
      v7 = v9;
    }
    while (v8 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  v44 = 0;
  sub_19C442BD0(a5, a1, a2, a3, a4, &__p, 1, v43);
  v27 = v44;
  if (v44 == v43)
  {
    v28 = 4;
    v27 = v43;
  }
  else
  {
    if (!v44)
      goto LABEL_35;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_35:
  v29 = (char *)__p;
  if (__p)
  {
    v30 = v41;
    if (v41 != __p)
    {
      v31 = (char *)v41;
      do
      {
        v33 = (void *)*((_QWORD *)v31 - 3);
        v31 -= 24;
        v32 = v33;
        if (v33)
        {
          *(v30 - 2) = v32;
          operator delete(v32);
        }
        v30 = v31;
      }
      while (v31 != v29);
    }
    operator delete(v29);
  }
}

void sub_19C43706C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,__int128 buf,uint64_t a25,__int128 *a26)
{
  __int128 *v26;
  __int128 *p_buf;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;

  p_buf = a26;
  if (a26 == v26)
  {
    v30 = 4;
    p_buf = &buf;
  }
  else
  {
    if (!a26)
      goto LABEL_6;
    v30 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)p_buf + 8 * v30))();
LABEL_6:
  if (a2 == 1)
  {
    v31 = __cxa_begin_catch(a1);
    if (qword_1EDB97228 != -1)
      dispatch_once(&qword_1EDB97228, &unk_1E3D3ABD0);
    v32 = qword_1EDB97220;
    if (os_log_type_enabled((os_log_t)qword_1EDB97220, OS_LOG_TYPE_ERROR))
    {
      v33 = (*(uint64_t (**)(void *))(*(_QWORD *)v31 + 16))(v31);
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "conditionalProbability";
      WORD6(buf) = 2080;
      *(_QWORD *)((char *)&buf + 14) = v33;
      _os_log_error_impl(&dword_19C291000, v32, OS_LOG_TYPE_ERROR, "%s: caught unexpected exception: %s", (uint8_t *)&buf, 0x16u);
    }
    *(_OWORD *)a12 = a19;
    *(_QWORD *)(a12 + 16) = a20;
    a20 = 0;
    a19 = 0uLL;
    __cxa_end_catch();
    JUMPOUT(0x19C436FD4);
  }
  sub_19C311614((void ***)&a19);
  sub_19C311A84(&a21);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C4371BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  char *v8;
  _QWORD *result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  if (a3 >= 0x64)
    v7 = 100;
  else
    v7 = a3;
  if (v7)
  {
    v8 = (char *)operator new(8 * v7);
    *a4 = v8;
    a4[1] = v8;
    a4[2] = &v8[8 * v7];
  }
  v12[0] = &off_1E3D39240;
  v12[1] = a4;
  v12[2] = &v11;
  v13 = v12;
  sub_19C43E328(a1, a2, 3uLL, 0, (uint64_t)v12);
  result = v13;
  if (v13 == v12)
  {
    v10 = 4;
    result = v12;
  }
  else
  {
    if (!v13)
      return result;
    v10 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8 * v10))(result);
}

void sub_19C4372A8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19C4372B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void **v13;
  char *v14;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  void *v20;

  v16 = a13;
  if (a13 == v14)
  {
    v17 = 4;
    v16 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:
  v18 = (char *)*v13;
  if (!*v13)
    _Unwind_Resume(exception_object);
  v19 = (char *)v13[1];
  v20 = *v13;
  if (v19 != v18)
  {
    do
      language_modeling::v1::Prediction::~Prediction((language_modeling::v1::Prediction *)(v19 - 8));
    while (v19 != v18);
    v20 = *v13;
  }
  v13[1] = v18;
  operator delete(v20);
  _Unwind_Resume(exception_object);
}

void sub_19C43732C(uint64_t a1, uint64_t *a2, uint64_t **a3, unint64_t a4, uint64_t a5)
{
  sub_19C43D228(a1, a2, *a3, a3[1], a4, 0, a5);
}

void sub_19C437344()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (qword_1EE41C070 != -1)
    dispatch_once(&qword_1EE41C070, &unk_1E3D3CA78);
  v0 = qword_1EE41C068;
  if (os_log_type_enabled((os_log_t)qword_1EE41C068, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "enumerateInlineCompletions";
    _os_log_error_impl(&dword_19C291000, v0, OS_LOG_TYPE_ERROR, "%s: Inline completions are not supported for pure tokenID models", (uint8_t *)&v1, 0xCu);
  }
}

void sub_19C437410(uint64_t a1, uint64_t a2, int a3, uint64_t a4, char a5)
{
  uint64_t *v6;
  __CFString *v11;
  CFIndex Length;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  int64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  unsigned __int8 *v43;
  size_t v44;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  uint64_t v48;
  uint64_t v49;
  const void *v50;
  int64_t v51;
  _DWORD *v52;
  char *v53;
  uint64_t v54;
  int v55;
  const UInt8 *v56;
  CFIndex v57;
  __CFString *v58;
  void *exception;
  uint64_t v60;
  void *__src;
  int v62[2];
  char *v63;

  if (*(_DWORD *)(a1 + 40) == 3)
    return;
  v6 = *(uint64_t **)(a1 + 72);
  if (!*(_BYTE *)(v6[29] + 192))
    return;
  if (*(_DWORD *)(a1 + 144) == 1)
  {
    v11 = (__CFString *)sub_19C2E1370(a2);
    __src = v11;
    Length = CFStringGetLength(v11);
    v13 = sub_19C3304A8(v6, v11, 0, Length);
    if (v11)
      CFRelease(v11);
    if (!v13)
      return;
  }
  v60 = a4;
  v14 = *(unsigned int *)(a1 + 328);
  if ((int)v14 < 1)
    goto LABEL_29;
  v15 = 0;
  v16 = *(_QWORD *)(a1 + 224);
  v17 = *(_BYTE *)(a2 + 23);
  if (v17 >= 0)
    v18 = *(unsigned __int8 *)(a2 + 23);
  else
    v18 = *(_QWORD *)(a2 + 8);
  if (v17 >= 0)
    v19 = (unsigned __int8 *)a2;
  else
    v19 = *(unsigned __int8 **)a2;
  while (1)
  {
    v20 = (unsigned __int8 *)(v16 + 24 * v15);
    v21 = v20[23];
    if ((v21 & 0x80u) == 0)
      v22 = v20[23];
    else
      v22 = *((_QWORD *)v20 + 1);
    if (v22 != v18)
      goto LABEL_15;
    if ((v21 & 0x80) == 0)
      break;
    if (!memcmp(*(const void **)v20, v19, *((_QWORD *)v20 + 1)))
      goto LABEL_25;
LABEL_15:
    if (++v15 == v14)
      goto LABEL_29;
  }
  if (v20[23])
  {
    v23 = v19;
    while (*v20 == *v23)
    {
      ++v20;
      ++v23;
      if (!--v21)
        goto LABEL_25;
    }
    goto LABEL_15;
  }
LABEL_25:
  if ((v15 & 0x80000000) == 0)
  {
    ++*(_QWORD *)(a1 + 336);
    v24 = *(_QWORD *)(a1 + 272);
    v25 = *(_QWORD *)(a1 + 320);
    if (*(_QWORD *)(v24 + 8 * v15) != v25)
    {
      v26 = v25 + 1;
      *(_QWORD *)(a1 + 320) = v26;
      *(_QWORD *)(v24 + 8 * v15) = v26;
    }
    v27 = *(_QWORD *)(a1 + 248) + 24 * v15;
    goto LABEL_69;
  }
LABEL_29:
  ++*(_QWORD *)(a1 + 344);
  sub_19C3A62E8((uint64_t *)(a1 + 136), a2, (uint64_t *)(a1 + 152));
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 112) + 24))(*(_QWORD *)(a1 + 112), a1 + 152);
  sub_19C42FA70(a1 + 120, (uint64_t *)(a1 + 152));
  __src = 0;
  *(_QWORD *)v62 = 0;
  v63 = 0;
  v29 = *(_BYTE **)(a1 + 176);
  v28 = *(_BYTE **)(a1 + 184);
  v30 = v28 - v29;
  if (v28 == v29)
  {
    v31 = 0;
    v32 = 0;
  }
  else
  {
    if (v30 < 0)
      sub_19C2A18E8();
    v31 = (char *)operator new(v28 - v29);
    v32 = &v31[4 * (v30 >> 2)];
    __src = v31;
    v63 = v32;
    memcpy(v31, v29, v30);
    *(_QWORD *)v62 = v32;
  }
  v27 = *(_QWORD *)(a1 + 296);
  v33 = *(_QWORD *)(a1 + 304);
  if (v27 != v33)
  {
    while (*(_QWORD *)(v27 + 8) - *(_QWORD *)v27 != v32 - v31 || memcmp(*(const void **)v27, v31, v32 - v31))
    {
      v27 += 24;
      if (v27 == v33)
      {
        v27 = v33;
        break;
      }
    }
  }
  if (v27 == v33)
  {
    v34 = *(int *)(a1 + 328);
    v35 = *(_QWORD *)(a1 + 224);
    if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 232) - v35) >> 3) <= v34)
    {
      if ((int)v34 < 2)
      {
        LODWORD(v34) = 0;
      }
      else
      {
        v36 = *(unint64_t **)(a1 + 272);
        v37 = *v36;
        v38 = 1;
        LODWORD(v34) = 0;
        do
        {
          v39 = v36[v38];
          if (v37 > v39)
            LODWORD(v34) = v38;
          if (v37 >= v39)
            v37 = v36[v38];
          ++v38;
        }
        while (*(_DWORD *)(a1 + 328) != v38);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 328) = v34 + 1;
    }
    v40 = v35 + 24 * (int)v34;
    if (v40 != a2)
    {
      v41 = *(_BYTE *)(a2 + 23);
      if (*(char *)(v40 + 23) < 0)
      {
        if (v41 >= 0)
          v43 = (unsigned __int8 *)a2;
        else
          v43 = *(unsigned __int8 **)a2;
        if (v41 >= 0)
          v44 = *(unsigned __int8 *)(a2 + 23);
        else
          v44 = *(_QWORD *)(a2 + 8);
        sub_19C2E54A8((void **)v40, v43, v44);
      }
      else if ((*(_BYTE *)(a2 + 23) & 0x80) != 0)
      {
        sub_19C2E53E4((_QWORD *)v40, *(void **)a2, *(_QWORD *)(a2 + 8));
      }
      else
      {
        v42 = *(_OWORD *)a2;
        *(_QWORD *)(v40 + 16) = *(_QWORD *)(a2 + 16);
        *(_OWORD *)v40 = v42;
      }
    }
    v45 = (int)v34;
    v46 = *(_QWORD *)(a1 + 248);
    v47 = (void **)(v46 + 24 * (int)v34);
    v31 = (char *)__src;
    if (v47 != &__src)
    {
      sub_19C35F928(v47, (char *)__src, *(char **)v62, (uint64_t)(*(_QWORD *)v62 - (_QWORD)__src) >> 2);
      v46 = *(_QWORD *)(a1 + 248);
      v31 = (char *)__src;
    }
    v48 = *(_QWORD *)(a1 + 320) + 1;
    *(_QWORD *)(a1 + 320) = v48;
    *(_QWORD *)(*(_QWORD *)(a1 + 272) + 8 * v45) = v48;
    v27 = v46 + 24 * (int)v45;
  }
  if (v31)
  {
    *(_QWORD *)v62 = v31;
    operator delete(v31);
  }
LABEL_69:
  v50 = *(const void **)v27;
  v49 = *(_QWORD *)(v27 + 8);
  v51 = v49 - *(_QWORD *)v27;
  if (v49 == *(_QWORD *)v27)
  {
    v53 = 0;
    v52 = 0;
    if (a5)
      goto LABEL_72;
  }
  else
  {
    if (v51 < 0)
      sub_19C2A18E8();
    v52 = operator new(v49 - *(_QWORD *)v27);
    v53 = (char *)&v52[v51 >> 2];
    memcpy(v52, v50, v51);
    if (a5)
    {
LABEL_72:
      sub_19C350FA0(v60);
      goto LABEL_75;
    }
  }
  CFAbsoluteTimeGetCurrent();
LABEL_75:
  v54 = (v53 - (char *)v52) >> 2;
  if (a3)
  {
    if (a3 == 1)
    {
      v55 = *(char *)(a1 + 71);
      if (v55 >= 0)
        v56 = (const UInt8 *)(a1 + 48);
      else
        v56 = *(const UInt8 **)(a1 + 48);
      if (v55 >= 0)
        v57 = *(unsigned __int8 *)(a1 + 71);
      else
        v57 = *(_QWORD *)(a1 + 56);
      v58 = (__CFString *)CFStringCreateWithBytes(0, v56, v57, 0x8000100u, 0);
      __src = v58;
      if (!v58)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD3154](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      sub_19C330F68(*(_QWORD **)(a1 + 72), v58, v52, v54);
      CFRelease(v58);
    }
    else if (a3 == 2)
    {
      __assert_rtn("addPriorText", "TokenIDLanguageModelSession.cpp", 1162, "false");
    }
  }
  else
  {
    sub_19C330F68(*(_QWORD **)(a1 + 72), (CFStringRef)kLMAdaptationContextSelfSender, v52, v54);
  }
  if (v52)
    operator delete(v52);
}

void sub_19C437938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;

  if (v15)
  {
    operator delete(v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_19C4379D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  NSObject *v8;
  uint64_t *v9;
  const __CFString *v10;
  CFIndex Length;
  _BOOL4 v12;
  char *v13;
  char *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  float v18;
  uint64_t *v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  unsigned int v26;
  double Current;
  unint64_t v28;
  double *v29;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  _BYTE __p[18];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) != 3 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 232) + 192))
  {
    if (*(_DWORD *)(a1 + 144) != 1)
    {
      if (qword_1EDB97228 != -1)
        dispatch_once(&qword_1EDB97228, &unk_1E3D3ABD0);
      v8 = qword_1EDB97220;
      if (os_log_type_enabled((os_log_t)qword_1EDB97220, OS_LOG_TYPE_ERROR))
      {
        v32 = *(_DWORD *)(a1 + 144);
        *(_DWORD *)__p = 136315394;
        *(_QWORD *)&__p[4] = "adaptToText";
        *(_WORD *)&__p[12] = 1024;
        *(_DWORD *)&__p[14] = v32;
        _os_log_error_impl(&dword_19C291000, v8, OS_LOG_TYPE_ERROR, "%s: Unexpected adaptation type: %d (this function is only expected to be used for offline adaptation)", __p, 0x12u);
      }
    }
    v9 = *(uint64_t **)(a1 + 72);
    v10 = sub_19C2E1370(a2);
    *(_QWORD *)__p = v10;
    Length = CFStringGetLength(v10);
    v12 = sub_19C3304A8(v9, v10, 0, Length);
    if (v10)
      CFRelease(v10);
    if (v12)
    {
      sub_19C3A62E8((uint64_t *)(a1 + 136), a2, (uint64_t *)(a1 + 152));
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 112) + 24))(*(_QWORD *)(a1 + 112), a1 + 152);
      v13 = *(char **)(a1 + 176);
      v14 = *(char **)(a1 + 184);
      v15 = (v14 - v13) >> 2;
      v16 = *(uint64_t **)(a1 + 72);
      if (!*(_BYTE *)(a1 + 88))
      {
        if (!sub_19C3306A4(v16, *(unsigned int **)(a1 + 176), (v14 - v13) >> 2))
          return;
LABEL_38:
        sub_19C42FA70(a1 + 120, (uint64_t *)(a1 + 152));
        if (a4)
          Current = sub_19C350FA0(a3);
        else
          Current = CFAbsoluteTimeGetCurrent();
        *(double *)__p = Current;
        if (v14 != v13)
        {
          v28 = 0;
          if (a4)
            v29 = (double *)__p;
          else
            v29 = 0;
          if (v15 <= 1)
            v15 = 1;
          do
          {
            v30 = *(unsigned int *)&v13[4 * v28];
            v31 = *(_QWORD **)(a1 + 72);
            if (*(_BYTE *)(a1 + 88))
              sub_19C3BE7EC(v31[58], *(_DWORD *)(a1 + 144), v29, v30, v13, v28);
            else
              sub_19C32FE80(v31, *(_DWORD *)(a1 + 144), v29, v30, v13, v28);
            ++v28;
          }
          while (v15 != v28);
        }
        return;
      }
      v17 = v16[58];
      std::recursive_mutex::lock((std::recursive_mutex *)v17);
      sub_19C3C2C78(__p, *(_QWORD *)(v17 + 104), *(_QWORD *)(v17 + 112));
      if (*(_QWORD *)(v17 + 144))
      {
        if (*(_QWORD *)__p == *(_QWORD *)&__p[8])
        {
          v20 = 0;
          if (!*(_QWORD *)__p)
          {
LABEL_37:
            std::recursive_mutex::unlock((std::recursive_mutex *)v17);
            if (!v20)
              return;
            goto LABEL_38;
          }
LABEL_36:
          operator delete(*(void **)__p);
          goto LABEL_37;
        }
        v18 = 1.0 / (float)v15;
        v19 = *(uint64_t **)__p;
        do
        {
          if ((unint64_t)(v14 - v13) >= 4)
          {
            v21 = 0;
            v22 = 0;
            v23 = *v19;
            v24 = 4 * v15;
            v25 = (unsigned int *)v13;
            do
            {
              v26 = *v25;
              if (!*v25 || *(_DWORD *)(v23 + 28) <= v26 && v26 <= *(_DWORD *)(v23 + 32))
                ++v21;
              if (v26 - 10 < 0x35)
                ++v22;
              ++v25;
              v24 -= 4;
            }
            while (v24);
            v20 = (float)(v18 * (float)v22) < 0.2 && (float)(v18 * (float)v21) < 0.15;
          }
          else
          {
            v20 = 0;
          }
          if (v20)
            break;
          ++v19;
        }
        while (v19 != *(uint64_t **)&__p[8]);
      }
      else
      {
        v20 = 0;
      }
      if (!*(_QWORD *)__p)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
}

void sub_19C437D50(_Unwind_Exception *a1)
{
  std::recursive_mutex *v1;

  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19C437D64(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    sub_19C2CDAC8(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_19C437D98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  void **p_p;
  uint64_t v10;
  __n128 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  const UInt8 *v18;
  CFIndex v19;
  const __CFString *v20;
  void *exception;
  CFTypeRef cf;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __n128 v27;
  void *__p;
  _BYTE *v29;
  __int128 v30;
  __int128 v31;
  __n128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) == 3 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 232) + 192))
    return;
  v5 = *a3;
  v6 = *(unsigned __int16 *)(a1 + 8);
  if (*(_BYTE *)(a1 + 88))
    v7 = 327680;
  else
    v7 = 0;
  v8 = v7 | v6;
  __p = &off_1E3D30480;
  v29 = (_BYTE *)a1;
  *(_QWORD *)&v30 = &__p;
  sub_19C3168D8(v5, v7 | v6, (uint64_t)&__p);
  p_p = (void **)v30;
  if ((void **)v30 == &__p)
  {
    v10 = 4;
    p_p = &__p;
    goto LABEL_10;
  }
  if ((_QWORD)v30)
  {
    v10 = 5;
LABEL_10:
    (*((void (**)(void))*p_p + v10))();
  }
  sub_19C43B21C((int32x2_t **)&__p, v5, *(_QWORD *)(a1 + 72), v8, *(unsigned __int16 *)(a1 + 8));
  if (*(_BYTE *)(a1 + 88))
  {
    v11.n128_f64[0] = sub_19C43BBCC((uint64_t)&v23, v5, *(_QWORD *)(a1 + 72), v8, *(unsigned __int16 *)(a1 + 8));
    v12 = v23;
    v13 = v24;
  }
  else
  {
    v12 = __p;
    v13 = (v29 - (_BYTE *)__p) >> 2;
    v23 = __p;
    v24 = v13;
    v25 = v30;
    v26 = v31;
    v11 = v32;
    v27 = v32;
  }
  cf = 0;
  v14 = (*(uint64_t (**)(_QWORD, uint64_t, CFTypeRef *, void *, uint64_t, uint64_t, __n128))(**(_QWORD **)(a1 + 112)
                                                                                                  + 40))(*(_QWORD *)(a1 + 112), a2, &cf, v12, v13, 2, v11);
  if ((v14 - 500) <= 0xFFFFFE0C)
    v14 = sub_19C42F5A0((uint64_t *)(a1 + 120), (const UInt8 *)a2, (const __CFString *)cf, (_DWORD)v14 != 0);
  v15 = *(_QWORD **)(a1 + 72);
  if (*(_BYTE *)(a1 + 88))
    sub_19C3BE7EC(v15[58], *(_DWORD *)(a1 + 144), 0, v14, (_DWORD *)v25, *((unint64_t *)&v25 + 1));
  else
    sub_19C32FE80(v15, *(_DWORD *)(a1 + 144), 0, v14, (_DWORD *)v25, *((unint64_t *)&v25 + 1));
  v16 = *(_QWORD **)(a1 + 72);
  v17 = *(char *)(a2 + 23);
  if (v17 >= 0)
    v18 = (const UInt8 *)a2;
  else
    v18 = *(const UInt8 **)a2;
  if (v17 >= 0)
    v19 = *(unsigned __int8 *)(a2 + 23);
  else
    v19 = *(_QWORD *)(a2 + 8);
  v20 = CFStringCreateWithBytes(0, v18, v19, 0x8000100u, 0);
  if (!v20)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD3154](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  sub_19C32F7E8(v16, v20);
  CFRelease(v20);
  if (cf)
    CFRelease(cf);
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
}

void sub_19C438008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_19C2E5670(&a10);
  if (!__p)
    _Unwind_Resume(a1);
  a20 = (uint64_t)__p;
  operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_19C4380BC(uint64_t a1, __int128 *a2, uint64_t *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int32x2_t **v9;
  uint64_t v10;
  __n128 v11;
  int32x2_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::recursive_mutex *v16;
  CFTypeRef v17;
  int v18;
  const __CFString *v19;
  CFTypeRef v20;
  int v21;
  const __CFString *v22;
  CFTypeID v23;
  void *v24;
  CFTypeID TypeID;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  CFTypeRef v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void *v45[2];
  uint64_t v46;
  __int128 __dst;
  uint64_t v48;
  CFTypeRef cf;
  int32x2_t *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __n128 v54;
  void *v55[2];
  uint64_t v56;
  void *__p[2];
  uint64_t v58;
  int32x2_t *v59;
  int32x2_t *v60;
  __int128 v61;
  __int128 v62;
  __n128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) != 3 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 232) + 192))
  {
    v5 = *a3;
    v6 = *(unsigned __int16 *)(a1 + 8);
    if (*(_BYTE *)(a1 + 88))
      v7 = 327680;
    else
      v7 = 0;
    v8 = v7 | v6;
    v59 = (int32x2_t *)&off_1E3D304D8;
    v60 = (int32x2_t *)a1;
    *(_QWORD *)&v61 = &v59;
    sub_19C3168D8(v5, v7 | v6, (uint64_t)&v59);
    v9 = (int32x2_t **)v61;
    if ((int32x2_t **)v61 == &v59)
    {
      v10 = 4;
      v9 = &v59;
    }
    else
    {
      if (!(_QWORD)v61)
        goto LABEL_11;
      v10 = 5;
    }
    ((void (*)(void))(*v9)[v10])();
LABEL_11:
    sub_19C43B21C(&v59, v5, *(_QWORD *)(a1 + 72), v8, *(unsigned __int16 *)(a1 + 8));
    if (*(_BYTE *)(a1 + 88))
    {
      v11.n128_f64[0] = sub_19C43BBCC((uint64_t)&v50, v5, *(_QWORD *)(a1 + 72), v8, *(unsigned __int16 *)(a1 + 8));
      v12 = v50;
      v13 = v51;
    }
    else
    {
      v12 = v59;
      v13 = ((char *)v60 - (char *)v59) >> 2;
      v50 = v59;
      v51 = v13;
      v52 = v61;
      v53 = v62;
      v11 = v63;
      v54 = v63;
    }
    cf = 0;
    v14 = (*(uint64_t (**)(_QWORD, __int128 *, CFTypeRef *, int32x2_t *, uint64_t, uint64_t, __n128))(**(_QWORD **)(a1 + 112) + 40))(*(_QWORD *)(a1 + 112), a2, &cf, v12, v13, 2, v11);
    if (v14 < 0x1F4)
      goto LABEL_56;
    v15 = *(_QWORD *)(a1 + 72);
    if (!*(_BYTE *)(a1 + 88))
    {
      v20 = cf;
      v21 = *((char *)a2 + 23);
      if (cf)
      {
        if (v21 < 0)
        {
          sub_19C2B5238(v45, *(void **)a2, *((_QWORD *)a2 + 1));
        }
        else
        {
          *(_OWORD *)v45 = *a2;
          v46 = *((_QWORD *)a2 + 2);
        }
        v22 = (const __CFString *)cf;
        if (SHIBYTE(v46) < 0)
        {
          sub_19C2B5238(__p, v45[0], (unint64_t)v45[1]);
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)v45;
          v58 = v46;
        }
        if (v22 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v22)))
        {
          sub_19C2E50A4(v55, v22);
          if (SHIBYTE(v58) < 0)
            operator delete(__p[0]);
        }
        else
        {
          *(_OWORD *)v55 = *(_OWORD *)__p;
          v56 = v58;
        }
      }
      else if (v21 < 0)
      {
        sub_19C2B5238(v55, *(void **)a2, *((_QWORD *)a2 + 1));
      }
      else
      {
        *(_OWORD *)v55 = *a2;
        v56 = *((_QWORD *)a2 + 2);
      }
      v14 = sub_19C43BAA0(v15, (uint64_t)v55);
      if (SHIBYTE(v56) < 0)
        operator delete(v55[0]);
      if (v20 && SHIBYTE(v46) < 0)
      {
        v24 = v45[0];
        goto LABEL_55;
      }
LABEL_56:
      if ((_DWORD)v14)
      {
        v26 = *(_QWORD **)(a1 + 72);
        if (*(_BYTE *)(a1 + 88))
        {
          v27 = v26[58];
          v28 = *(_DWORD *)(a1 + 144);
          v29 = *((_QWORD *)&v52 + 1);
          v30 = v52;
          std::recursive_mutex::lock((std::recursive_mutex *)v27);
          if (v29)
          {
            v31 = 4 * v29;
            v32 = v30 + 4 * v29;
            while (v31)
            {
              v33 = *(_DWORD *)(v30 + v31 - 4);
              v31 -= 4;
              if (v33 == 1)
              {
                v34 = (uint64_t)(4 * v29 - (v31 + 4)) >> 2;
                v29 = v34 + 1;
                v30 = v32 + 4 * ~v34;
                break;
              }
            }
          }
          else
          {
            v30 = 0;
          }
          if (v28 != 2 && *(_BYTE *)(*(_QWORD *)(v27 + 88) + 192))
          {
            v36 = *(_QWORD *)(v27 + 144);
            if (v36)
              sub_19C431E28(v36, v14, v30, v29);
            sub_19C3BE128(__p, *(_QWORD *)(v27 + 128) + 616);
            v38 = __p[0];
            v37 = __p[1];
            if (__p[0] != __p[1])
            {
              while (1)
              {
                (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(*(_QWORD *)*v38 + 32))(v55, *v38, v14);
                v39 = (void *)HIBYTE(v56);
                if (v56 < 0)
                  v39 = v55[1];
                if (v39)
                  break;
                if (SHIBYTE(v56) < 0)
                  operator delete(v55[0]);
                v38 += 2;
                if (v38 == v37)
                  goto LABEL_81;
              }
              (*(void (**)(_QWORD, void **, uint64_t, float))(*(_QWORD *)*v38 + 184))(*v38, v55, v14, -1.0);
              if (SHIBYTE(v56) < 0)
                operator delete(v55[0]);
LABEL_81:
              v38 = __p[0];
            }
            if (v38)
            {
              v40 = __p[1];
              v41 = v38;
              if (__p[1] != v38)
              {
                do
                {
                  v42 = (std::__shared_weak_count *)*(v40 - 1);
                  if (v42)
                  {
                    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
                    do
                      v44 = __ldaxr(p_shared_owners);
                    while (__stlxr(v44 - 1, p_shared_owners));
                    if (!v44)
                    {
                      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
                      std::__shared_weak_count::__release_weak(v42);
                    }
                  }
                  v40 -= 2;
                }
                while (v40 != v38);
                v41 = __p[0];
              }
              __p[1] = v38;
              operator delete(v41);
            }
          }
          std::recursive_mutex::unlock((std::recursive_mutex *)v27);
          v35 = cf;
          if (!cf)
            goto LABEL_95;
          goto LABEL_94;
        }
        sub_19C3300C8(v26, *(_DWORD *)(a1 + 144), v14, v52, *((unint64_t *)&v52 + 1));
      }
      v35 = cf;
      if (!cf)
      {
LABEL_95:
        if (v59)
        {
          v60 = v59;
          operator delete(v59);
        }
        return;
      }
LABEL_94:
      CFRelease(v35);
      goto LABEL_95;
    }
    v16 = *(std::recursive_mutex **)(v15 + 464);
    v17 = cf;
    v18 = *((char *)a2 + 23);
    if (!cf)
    {
      if (v18 < 0)
      {
        sub_19C2B5238(v55, *(void **)a2, *((_QWORD *)a2 + 1));
      }
      else
      {
        *(_OWORD *)v55 = *a2;
        v56 = *((_QWORD *)a2 + 2);
      }
      goto LABEL_38;
    }
    if (v18 < 0)
    {
      sub_19C2B5238(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
      v19 = (const __CFString *)cf;
      if ((SHIBYTE(v48) & 0x80000000) == 0)
        goto LABEL_19;
    }
    else
    {
      __dst = *a2;
      v48 = *((_QWORD *)a2 + 2);
      v19 = (const __CFString *)cf;
      if ((SHIBYTE(v48) & 0x80000000) == 0)
      {
LABEL_19:
        *(_OWORD *)__p = __dst;
        v58 = v48;
LABEL_27:
        if (v19 && (v23 = CFStringGetTypeID(), v23 == CFGetTypeID(v19)))
        {
          sub_19C2E50A4(v55, v19);
          if (SHIBYTE(v58) < 0)
            operator delete(__p[0]);
        }
        else
        {
          *(_OWORD *)v55 = *(_OWORD *)__p;
          v56 = v58;
        }
LABEL_38:
        v14 = sub_19C3BDFF4(v16, (uint64_t)v55);
        if (SHIBYTE(v56) < 0)
          operator delete(v55[0]);
        if (v17 && SHIBYTE(v48) < 0)
        {
          v24 = (void *)__dst;
LABEL_55:
          operator delete(v24);
          goto LABEL_56;
        }
        goto LABEL_56;
      }
    }
    sub_19C2B5238(__p, (void *)__dst, *((unint64_t *)&__dst + 1));
    goto LABEL_27;
  }
}

void sub_19C438640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,const void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,char a38)
{
  uint64_t v38;
  void *v40;

  sub_19C2E5670(&a22);
  v40 = *(void **)(v38 - 128);
  if (!v40)
    _Unwind_Resume(a1);
  *(_QWORD *)(v38 - 120) = v40;
  operator delete(v40);
  _Unwind_Resume(a1);
}

void sub_19C43877C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  NSObject *v15;
  _QWORD *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *v21;
  _QWORD *v22;
  char v23;
  _BYTE __p[22];
  unsigned __int8 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) == 3 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 232) + 192))
    return;
  v4 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 16))(*(_QWORD *)(a1 + 112));
  if (!(_DWORD)v4)
  {
    v13 = (char *)operator new(0x38uLL);
    strcpy(v13, "registerNegativeEvidence called with unknown word");
    if (*((char *)a2 + 23) >= 0)
      v14 = a2;
    else
      v14 = (uint64_t *)*a2;
    sub_19C34EC30("registerNegativeEvidence called with unknown word: %s", (uint64_t)&v21, v14);
    if (qword_1EDB97228 != -1)
      dispatch_once(&qword_1EDB97228, &unk_1E3D3ABD0);
    v15 = qword_1EDB97220;
    if (os_log_type_enabled((os_log_t)qword_1EDB97220, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = "logToErrorAndDebug";
      *(_WORD *)&__p[12] = 2080;
      *(_QWORD *)&__p[14] = v13;
      _os_log_error_impl(&dword_19C291000, v15, OS_LOG_TYPE_ERROR, "%s: %s", __p, 0x16u);
      if ((v23 & 0x80000000) == 0)
        goto LABEL_26;
    }
    else if ((v23 & 0x80000000) == 0)
    {
LABEL_26:
      operator delete(v13);
      return;
    }
    operator delete(v21);
    goto LABEL_26;
  }
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(a1 + 88))
  {
    v7 = *(_QWORD *)(v6 + 464);
    if (*(_BYTE *)(*(_QWORD *)(v7 + 88) + 192))
    {
      std::recursive_mutex::lock(*(std::recursive_mutex **)(v6 + 464));
      sub_19C3BE128(&v21, *(_QWORD *)(v7 + 128) + 616);
      v8 = v21;
      v9 = v22;
      if (v21 != v22)
      {
        do
        {
          (*(void (**)(_BYTE *__return_ptr, _QWORD, uint64_t))(*(_QWORD *)*v8 + 32))(__p, *v8, v5);
          v10 = v25;
          if ((v25 & 0x80u) != 0)
            v10 = *(_QWORD *)&__p[8];
          if (v10)
          {
            (*(void (**)(_QWORD, _BYTE *, uint64_t, uint64_t))(*(_QWORD *)*v8 + 192))(*v8, __p, v5, 1);
            v11 = *(_QWORD *)(v7 + 88);
            if (*(_BYTE *)(v11 + 192))
            {
              v12 = *v8;
              if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)*v8 + 200))(*v8, v5) >= *(_DWORD *)(v11 + 392)
                && (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 208))(v12, v5) < *(_DWORD *)(v11 + 396))
              {
                (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v8 + 216))(*v8, v5);
              }
            }
          }
          if ((char)v25 < 0)
            operator delete(*(void **)__p);
          v8 += 2;
        }
        while (v8 != v9);
        v8 = v21;
      }
      if (v8)
      {
        v16 = v22;
        v17 = v8;
        if (v22 != v8)
        {
          do
          {
            v18 = (std::__shared_weak_count *)*(v16 - 1);
            if (v18)
            {
              p_shared_owners = (unint64_t *)&v18->__shared_owners_;
              do
                v20 = __ldaxr(p_shared_owners);
              while (__stlxr(v20 - 1, p_shared_owners));
              if (!v20)
              {
                ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
                std::__shared_weak_count::__release_weak(v18);
              }
            }
            v16 -= 2;
          }
          while (v16 != v8);
          v17 = v21;
        }
        v22 = v8;
        operator delete(v17);
      }
      std::recursive_mutex::unlock((std::recursive_mutex *)v7);
    }
  }
  else
  {
    sub_19C330268((_QWORD *)v6, v5);
  }
}

void sub_19C438AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  std::recursive_mutex *v18;

  std::recursive_mutex::unlock(v18);
  _Unwind_Resume(a1);
}

void sub_19C438B28(uint64_t a1, const UInt8 *a2)
{
  _QWORD *v2;
  CFIndex v3;
  CFIndex v4;
  const __CFString *v5;
  const __CFString *v6;
  void *exception;

  v2 = *(_QWORD **)(a1 + 72);
  v3 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v4 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    v4 = v3;
  }
  v5 = CFStringCreateWithBytes(0, a2, v4, 0x8000100u, 0);
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD3154](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v6 = v5;
  sub_19C32F9D8(v2, v5);
  CFRelease(v6);
}

void sub_19C438BC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C438BE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C2E5670((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19C438BF4(uint64_t a1)
{
  sub_19C330B68(*(_QWORD **)(a1 + 72));
}

uint64_t sub_19C438BFC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 72);
  if (*(_BYTE *)(*(_QWORD *)(v1 + 232) + 192))
  {
    v2 = *(_QWORD *)(v1 + 264);
    if (v2)
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 168))(*(_QWORD *)(v2 + 8));
  }
  return result;
}

_QWORD *sub_19C438C28(uint64_t a1)
{
  return sub_19C3307E4(*(_QWORD **)(a1 + 72));
}

uint64_t sub_19C438C30(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  sub_19C330D00(*(_QWORD *)(a1 + 72));
  *(_BYTE *)(a1 + 88) = 0;
  v2 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  result = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_19C438C90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __CFDictionary *MutableCopy;
  int v6;
  const UInt8 *v7;
  CFIndex v8;
  CFStringRef v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *exception;

  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(v3 + 232);
  if (*(_BYTE *)(v4 + 192))
  {
    sub_19C330D00(*(_QWORD *)(a1 + 72));
    v4 = *(_QWORD *)(v3 + 232);
  }
  *(_BYTE *)(v4 + 192) = 1;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(v3 + 432));
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const UInt8 *)a2;
  else
    v7 = *(const UInt8 **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = CFStringCreateWithBytes(0, v7, v8, 0x8000100u, 0);
  if (v9)
  {
    CFDictionarySetValue(MutableCopy, (const void *)kLMLanguageModelCustomDynamicResourceDirectoryKey, v9);
    CFDictionarySetValue(MutableCopy, (const void *)kLMLanguageModelAdaptationEnabledKey, (const void *)*MEMORY[0x1E0C9AE50]);
    v10 = *(const void **)(v3 + 432);
    if (v10)
      CFRelease(v10);
    *(_QWORD *)(v3 + 432) = MutableCopy;
    v11 = *(_QWORD *)(v3 + 416);
    v12 = operator new();
    sub_19C346094(v12, *(const __CFDictionary **)(v3 + 432), (void **)(v11 + 80));
    v13 = (_QWORD *)operator new();
    *v13 = &off_1E3D39CF8;
    v13[1] = 0;
    v13[2] = 0;
    v13[3] = v12;
    v14 = *(std::__shared_weak_count **)(v3 + 424);
    *(_QWORD *)(v3 + 416) = v12;
    *(_QWORD *)(v3 + 424) = v13;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    sub_19C3284D4(v3);
  }
  exception = __cxa_allocate_exception(0x10uLL);
  MEMORY[0x1A1AD3154](exception, "Could not construct");
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_19C438E60(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C438EEC()
{
  return 0;
}

uint64_t sub_19C438EF4()
{
  return 0;
}

BOOL sub_19C438EFC(uint64_t a1)
{
  uint64_t v1;
  __int128 *v2;
  int v3;
  _BOOL8 v4;
  __int128 v6;
  uint64_t v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 232);
  if (*(char *)(v1 + 455) < 0)
  {
    sub_19C2B5238(&v6, *(void **)(v1 + 432), *(_QWORD *)(v1 + 440));
    v3 = SHIBYTE(v7);
    if ((SHIBYTE(v7) & 0x80000000) == 0)
      return v3 != 0;
LABEL_5:
    v4 = *((_QWORD *)&v6 + 1) != 0;
    operator delete((void *)v6);
    return v4;
  }
  v2 = (__int128 *)(v1 + 432);
  v6 = *v2;
  v7 = *((_QWORD *)v2 + 2);
  v3 = SHIBYTE(v7);
  if (SHIBYTE(v7) < 0)
    goto LABEL_5;
  return v3 != 0;
}

_QWORD *sub_19C438F7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X3>, void ***a5@<X8>)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD *v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[3];
  _QWORD *v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19[0] = &off_1E3D39298;
  v19[1] = a1;
  v20 = v19;
  v17[0] = &off_1E3D392F0;
  v17[1] = a1;
  v18 = v17;
  v16 = v15;
  v15[0] = &off_1E3D39298;
  v15[1] = a1;
  v14 = v13;
  v13[0] = &off_1E3D392F0;
  v13[1] = a1;
  sub_19C4391B0(a5, a1, a2, a3, a4, (uint64_t)v15, (uint64_t)v13);
  v5 = v14;
  if (v14 == v13)
  {
    v6 = 4;
    v5 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:
  v7 = v16;
  if (v16 == v15)
  {
    v8 = 4;
    v7 = v15;
  }
  else
  {
    if (!v16)
      goto LABEL_11;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_11:
  v9 = v18;
  if (v18 == v17)
  {
    v10 = 4;
    v9 = v17;
  }
  else
  {
    if (!v18)
      goto LABEL_16;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_16:
  result = v20;
  if (v20 == v19)
  {
    v12 = 4;
    result = v19;
  }
  else
  {
    if (!v20)
      return result;
    v12 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v12))();
}

void sub_19C4390E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,char *a21)
{
  uint64_t v21;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  v23 = a13;
  if (a13 == &a10)
  {
    v24 = 4;
    v23 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  v25 = a17;
  if (a17 == &a14)
  {
    v26 = 4;
    v25 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v26 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v25 + 8 * v26))();
LABEL_11:
  v27 = a21;
  if (a21 == &a18)
  {
    v28 = 4;
    v27 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_16;
    v28 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
LABEL_16:
  v29 = *(_QWORD **)(v21 - 32);
  if (v29 == (_QWORD *)(v21 - 56))
  {
    v30 = 4;
    v29 = (_QWORD *)(v21 - 56);
  }
  else
  {
    if (!v29)
      goto LABEL_21;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_21:
  _Unwind_Resume(exception_object);
}

void ***sub_19C4391B0(void ***result, uint64_t a2, uint64_t *a3, _QWORD *a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  void ***v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  __int128 *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  __int128 v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  void **v35;
  CFIndex v36;
  const __CFString *v37;
  const void *v38;
  const __CFArray *v39;
  CFIndex Count;
  CFIndex v41;
  CFArrayRef v42;
  CFIndex v43;
  unint64_t v44;
  const __CFLocale *v45;
  CFIndex Length;
  __CFString *MutableCopy;
  CFIndex v48;
  __CFString *v49;
  CFIndex v50;
  __CFString *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  int v56;
  CFArrayRef v57;
  uint64_t v58;
  void **v59;
  void *v60;
  void **v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  __int128 *v65;
  __int128 v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  int64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t *v82;
  char *v83;
  int64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t *v90;
  char *v91;
  uint64_t *v92;
  int64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  char *v98;
  uint64_t *v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  int64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  std::__shared_weak_count *v129;
  unint64_t *v130;
  unint64_t v131;
  uint64_t v132;
  __int128 *v133;
  unint64_t *v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  char *v141;
  uint64_t *v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  void **v150;
  char *v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *exception;
  int64x2_t v164;
  void ***v167;
  std::__shared_weak_count *v168;
  uint64_t v169;
  uint64_t v171;
  unint64_t v172;
  const __CFAllocator *alloc;
  void *v174[2];
  uint64_t v175;
  int v176;
  void *v177[2];
  uint64_t v178;
  int v179;
  void *v180[2];
  uint64_t v181;
  void *__dst[2];
  uint64_t v183;
  int v184;
  void *v185;
  uint64_t *v186;
  uint64_t *v187;
  void ***v188;
  void *v189[2];
  uint64_t v190;
  uint64_t v191;
  std::__shared_weak_count *v192;
  __int128 __p;
  uint64_t v194;
  void *v195[2];
  uint64_t v196;
  __int128 v197;
  uint64_t v198;
  const __CFLocale *v199;
  CFArrayRef v200;
  __int128 v201;
  __int128 v202;
  int v203;
  __int128 v204;
  uint64_t v205;
  __int128 v206;
  uint64_t v207;
  __int128 v208;
  uint64_t v209;
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v8 = *a3;
  v7 = a3[1];
  if (v7 - *a3 != a4[1] - *a4)
    __assert_rtn("normalizedNameTokenConditionalProbabilityWithBlock", "TokenIDLanguageModelSession.cpp", 1431, "tokens.size() == tokensMetadata.size()");
  v9 = result;
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  if (v7 != v8)
  {
    v171 = 0;
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v164 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v167 = result;
    while (1)
    {
      v10 = *a5;
      v11 = operator new();
      sub_19C2967D8(v11, v10);
      v187 = 0;
      v188 = (void ***)v11;
      v185 = 0;
      v186 = 0;
      v12 = v171;
      v13 = *a3;
      v14 = (uint64_t *)(*a3 + 24 * v171);
      v15 = *v14;
      if (v14[1] != *v14)
        break;
LABEL_229:
      v150 = v9[1];
      if (v150 >= v9[2])
      {
        v151 = sub_19C43A684(v9, (__int128 ***)&v185);
      }
      else
      {
        sub_19C311AF8(v9[1], (__int128 ***)&v185);
        v151 = (char *)(v150 + 3);
        v9[1] = v150 + 3;
      }
      v9[1] = (void **)v151;
      v152 = (uint64_t *)v185;
      if (v185)
      {
        v153 = v186;
        while (v153 != v152)
        {
          v155 = *--v153;
          v154 = v155;
          *v153 = 0;
          if (v155)
            MEMORY[0x1A1AD355C](v154, 0x1000C4065B674BELL);
        }
        operator delete(v152);
      }
      result = v188;
      v188 = 0;
      if (result)
      {
        v156 = sub_19C295FA0((uint64_t)result);
        result = (void ***)MEMORY[0x1A1AD355C](v156, 0x10B2C4009D90DC4);
      }
      if (++v171 >= 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 3))
        return result;
    }
    v16 = 0;
    while (1)
    {
      if (!*(_BYTE *)(*(_QWORD *)(*a4 + 24 * v12) + 2 * v16))
      {
        v20 = operator new();
        v21 = v20;
        *(int64x2_t *)v20 = v164;
        *(_QWORD *)(v20 + 16) = 0;
        *(_QWORD *)(v20 + 24) = 0;
        *(_BYTE *)(v20 + 32) = 1;
        *(_OWORD *)(v20 + 40) = xmmword_19C46DE10;
        *(_DWORD *)(v20 + 56) = 0;
        *(_OWORD *)(v20 + 64) = xmmword_19C46DE10;
        *(_QWORD *)(v20 + 88) = 0;
        *(_QWORD *)(v20 + 96) = 0;
        *(_QWORD *)(v20 + 80) = 0xFFEFFFFFFFFFFFFFLL;
        *(_DWORD *)(v20 + 104) = 0;
        v22 = v186;
        if (v186 < v187)
        {
          *v186 = v20;
          v186 = v22 + 1;
        }
        else
        {
          v23 = (uint64_t *)v185;
          v24 = (char *)v186 - (_BYTE *)v185;
          v25 = ((char *)v186 - (_BYTE *)v185) >> 3;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 61)
            sub_19C2A18E8();
          v27 = (char *)v187 - (_BYTE *)v185;
          if (((char *)v187 - (_BYTE *)v185) >> 2 > v26)
            v26 = v27 >> 2;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
            v28 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v28 = v26;
          if (v28)
          {
            if (v28 >> 61)
              sub_19C2A143C();
            v29 = (char *)operator new(8 * v28);
          }
          else
          {
            v29 = 0;
          }
          v90 = (uint64_t *)&v29[8 * v25];
          v91 = &v29[8 * v28];
          *v90 = v21;
          v92 = v90 + 1;
          v93 = (char *)v22 - (char *)v23;
          if (v22 == v23)
          {
            v185 = &v29[8 * v25];
            v187 = (uint64_t *)v91;
          }
          else
          {
            v94 = v93 - 8;
            if ((unint64_t)(v93 - 8) < 0x78
              || &v22[-(v94 >> 3) - 1] < v90 && &v29[v24 - (v94 & 0xFFFFFFFFFFFFFFF8) - 8] < (char *)v22)
            {
              goto LABEL_256;
            }
            v95 = (v94 >> 3) + 1;
            v96 = 8 * (v95 & 0x3FFFFFFFFFFFFFFCLL);
            v97 = &v22[v96 / 0xFFFFFFFFFFFFFFF8];
            v90 = (uint64_t *)((char *)v90 - v96);
            v98 = &v29[8 * v25 - 16];
            v99 = v22 - 2;
            v100 = v95 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v102 = *((_OWORD *)v99 - 1);
              v101 = *(_OWORD *)v99;
              *((_OWORD *)v99 - 1) = 0uLL;
              *(_OWORD *)v99 = 0uLL;
              *((_OWORD *)v98 - 1) = v102;
              *(_OWORD *)v98 = v101;
              v98 -= 32;
              v99 -= 4;
              v100 -= 4;
            }
            while (v100);
            v22 = v97;
            if (v95 != (v95 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_256:
              do
              {
                v103 = *--v22;
                *v22 = 0;
                *--v90 = v103;
              }
              while (v22 != v23);
            }
            v22 = (uint64_t *)v185;
            v104 = v186;
            v185 = v90;
            v187 = (uint64_t *)v91;
            while (v104 != v22)
            {
              v106 = *--v104;
              v105 = v106;
              *v104 = 0;
              if (v106)
                MEMORY[0x1A1AD355C](v105, 0x1000C4065B674BELL);
            }
          }
          if (v22)
            operator delete(v22);
          v186 = v92;
          v9 = v167;
        }
        goto LABEL_8;
      }
      v172 = v16;
      v18 = (__int128 *)(v15 + 32 * v16);
      if (*((char *)v18 + 23) < 0)
      {
        sub_19C2B5238(__dst, *(void **)v18, *((_QWORD *)v18 + 1));
        v13 = *a3;
      }
      else
      {
        v19 = *v18;
        v183 = *((_QWORD *)v18 + 2);
        *(_OWORD *)__dst = v19;
      }
      v184 = *(_DWORD *)(v15 + 32 * v16 + 24);
      v30 = *(_QWORD *)(v13 + 24 * v171) + 32 * v16;
      if (*(char *)(v30 + 23) < 0)
      {
        sub_19C2B5238(v180, *(void **)v30, *(_QWORD *)(v30 + 8));
      }
      else
      {
        v31 = *(_OWORD *)v30;
        v181 = *(_QWORD *)(v30 + 16);
        *(_OWORD *)v180 = v31;
      }
      v32 = *(std::__shared_weak_count **)(a2 + 80);
      v169 = *(_QWORD *)(a2 + 72);
      v191 = v169;
      v192 = v32;
      if (v32)
      {
        p_shared_owners = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldxr(p_shared_owners);
        while (__stxr(v34 + 1, p_shared_owners));
      }
      if (SHIBYTE(v181) < 0)
      {
        sub_19C2B5238(v189, v180[0], (unint64_t)v180[1]);
      }
      else
      {
        *(_OWORD *)v189 = *(_OWORD *)v180;
        v190 = v181;
      }
      if (v190 >= 0)
        v35 = v189;
      else
        v35 = (void **)v189[0];
      if (v190 >= 0)
        v36 = HIBYTE(v190);
      else
        v36 = (CFIndex)v189[1];
      v37 = CFStringCreateWithBytes(0, (const UInt8 *)v35, v36, 0x8000100u, 0);
      if (!v37)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD3154](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      if (SHIBYTE(v190) < 0)
      {
        sub_19C2B5238(&v204, v189[0], (unint64_t)v189[1]);
      }
      else
      {
        v204 = *(_OWORD *)v189;
        v205 = v190;
      }
      v201 = 0u;
      v202 = 0u;
      v203 = 1065353216;
      sub_19C30CC34((uint64_t)&v201, (uint64_t)&v204, (uint64_t)&v204);
      v168 = v32;
      if (SHIBYTE(v205) < 0)
        operator delete((void *)v204);
      v38 = *(const void **)(v169 + 176);
      if (v38)
        CFRetain(*(CFTypeRef *)(v169 + 176));
      sub_19C31D164(&v200, v38);
      v39 = v200;
      if (v200)
      {
        Count = CFArrayGetCount(v200);
        v41 = Count;
        v42 = v200;
        if (!v200)
        {
          v43 = 0;
          if (!Count)
            goto LABEL_88;
LABEL_51:
          v44 = 0;
          while (2)
          {
            if (v39 == v42 && v43 == v44)
              goto LABEL_88;
            sub_19C31D210(&v199, v39, v44);
            v45 = v199;
            Length = CFStringGetLength(v37);
            MutableCopy = CFStringCreateMutableCopy(alloc, Length, v37);
            CFStringCapitalize(MutableCopy, v45);
            sub_19C297DB4(&v204, MutableCopy);
            if (!(_QWORD)v204)
            {
              v157 = __cxa_allocate_exception(0x10uLL);
              MEMORY[0x1A1AD3154](v157, "Could not construct");
              __cxa_throw(v157, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
            }
            sub_19C32EB14(&v197, (const __CFString *)v204);
            if ((_QWORD)v204)
              CFRelease((CFTypeRef)v204);
            v48 = CFStringGetLength(v37);
            v49 = CFStringCreateMutableCopy(alloc, v48, v37);
            CFStringLowercase(v49, v45);
            sub_19C297DB4(&v204, v49);
            if (!(_QWORD)v204)
            {
              v158 = __cxa_allocate_exception(0x10uLL);
              MEMORY[0x1A1AD3154](v158, "Could not construct");
              __cxa_throw(v158, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
            }
            sub_19C32EB14(v195, (const __CFString *)v204);
            if ((_QWORD)v204)
              CFRelease((CFTypeRef)v204);
            v50 = CFStringGetLength(v37);
            v51 = CFStringCreateMutableCopy(alloc, v50, v37);
            CFStringUppercase(v51, v45);
            sub_19C297DB4(&v204, v51);
            if (!(_QWORD)v204)
            {
              v159 = __cxa_allocate_exception(0x10uLL);
              MEMORY[0x1A1AD3154](v159, "Could not construct");
              __cxa_throw(v159, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
            }
            sub_19C32EB14(&__p, (const __CFString *)v204);
            if ((_QWORD)v204)
              CFRelease((CFTypeRef)v204);
            if (SHIBYTE(v198) < 0)
            {
              sub_19C2B5238(&v204, (void *)v197, *((unint64_t *)&v197 + 1));
            }
            else
            {
              v204 = v197;
              v205 = v198;
            }
            if (SHIBYTE(v196) < 0)
            {
              sub_19C2B5238(&v206, v195[0], (unint64_t)v195[1]);
            }
            else
            {
              v206 = *(_OWORD *)v195;
              v207 = v196;
            }
            if (SHIBYTE(v194) < 0)
            {
              sub_19C2B5238(&v208, (void *)__p, *((unint64_t *)&__p + 1));
            }
            else
            {
              v208 = __p;
              v209 = v194;
            }
            sub_19C30CC34((uint64_t)&v201, (uint64_t)&v204, (uint64_t)&v204);
            sub_19C30CC34((uint64_t)&v201, (uint64_t)&v206, (uint64_t)&v206);
            sub_19C30CC34((uint64_t)&v201, (uint64_t)&v208, (uint64_t)&v208);
            if (SHIBYTE(v209) < 0)
            {
              operator delete((void *)v208);
              if (SHIBYTE(v207) < 0)
                goto LABEL_82;
LABEL_75:
              if ((SHIBYTE(v205) & 0x80000000) == 0)
                goto LABEL_76;
LABEL_83:
              operator delete((void *)v204);
              if (SHIBYTE(v194) < 0)
                goto LABEL_84;
LABEL_77:
              if ((SHIBYTE(v196) & 0x80000000) == 0)
                goto LABEL_78;
LABEL_85:
              operator delete(v195[0]);
              if (SHIBYTE(v198) < 0)
                goto LABEL_86;
LABEL_79:
              if (v45)
LABEL_87:
                CFRelease(v45);
            }
            else
            {
              if ((SHIBYTE(v207) & 0x80000000) == 0)
                goto LABEL_75;
LABEL_82:
              operator delete((void *)v206);
              if (SHIBYTE(v205) < 0)
                goto LABEL_83;
LABEL_76:
              if ((SHIBYTE(v194) & 0x80000000) == 0)
                goto LABEL_77;
LABEL_84:
              operator delete((void *)__p);
              if (SHIBYTE(v196) < 0)
                goto LABEL_85;
LABEL_78:
              if ((SHIBYTE(v198) & 0x80000000) == 0)
                goto LABEL_79;
LABEL_86:
              operator delete((void *)v197);
              if (v45)
                goto LABEL_87;
            }
            if (v41 == ++v44)
              goto LABEL_88;
            continue;
          }
        }
        v43 = CFArrayGetCount(v200);
        if (v41)
          goto LABEL_51;
      }
LABEL_88:
      v52 = *(_QWORD **)(v169 + 24);
      v53 = *(_QWORD **)(v169 + 32);
      v54 = (_QWORD *)v202;
      if (v52 == v53 || (_QWORD)v202 == 0)
      {
LABEL_93:
        v56 = 0;
        v57 = v200;
        if (v200)
          goto LABEL_102;
      }
      else
      {
        while (!v54)
        {
LABEL_99:
          if (++v52 == v53)
            goto LABEL_93;
          v54 = (_QWORD *)v202;
        }
        while (1)
        {
          v58 = (*(uint64_t (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)*v52 + 72))(*v52, v54 + 2, 0);
          if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)*v52 + 88))(*v52, v58) == 68
            || (*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)*v52 + 88))(*v52, v58) == 69)
          {
            break;
          }
          v54 = (_QWORD *)*v54;
          if (!v54)
            goto LABEL_99;
        }
        v56 = 1;
        v57 = v200;
        if (v200)
LABEL_102:
          CFRelease(v57);
      }
      v59 = (void **)v202;
      if ((_QWORD)v202)
      {
        do
        {
          v61 = (void **)*v59;
          if (*((char *)v59 + 39) < 0)
            operator delete(v59[2]);
          operator delete(v59);
          v59 = v61;
        }
        while (v61);
      }
      v60 = (void *)v201;
      *(_QWORD *)&v201 = 0;
      if (v60)
        operator delete(v60);
      CFRelease(v37);
      v9 = v167;
      if (SHIBYTE(v190) < 0)
      {
        operator delete(v189[0]);
        if (!v168)
          goto LABEL_116;
      }
      else if (!v168)
      {
        goto LABEL_116;
      }
      v62 = (unint64_t *)&v168->__shared_owners_;
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (v63)
      {
LABEL_116:
        if ((SHIBYTE(v181) & 0x80000000) == 0)
          goto LABEL_117;
        goto LABEL_121;
      }
      ((void (*)(std::__shared_weak_count *))v168->__on_zero_shared)(v168);
      std::__shared_weak_count::__release_weak(v168);
      if ((SHIBYTE(v181) & 0x80000000) == 0)
      {
LABEL_117:
        if (!v56)
          goto LABEL_122;
        goto LABEL_118;
      }
LABEL_121:
      operator delete(v180[0]);
      if (!v56)
      {
LABEL_122:
        v64 = *(_QWORD *)(*a3 + 24 * v171);
        v65 = (__int128 *)(v64 + 32 * v172);
        if (*((char *)v65 + 23) < 0)
        {
          sub_19C2B5238(v174, *(void **)v65, *((_QWORD *)v65 + 1));
        }
        else
        {
          v66 = *v65;
          v175 = *((_QWORD *)v65 + 2);
          *(_OWORD *)v174 = v66;
        }
        v176 = *(_DWORD *)(v64 + 32 * v172 + 24);
        v79 = *(_QWORD *)(a7 + 24);
        if (!v79)
          sub_19C2CCC60();
        (*(void (**)(__int128 *__return_ptr, uint64_t, void **, void ****))(*(_QWORD *)v79 + 48))(&v204, v79, v174, &v188);
        v80 = (char *)v186;
        if (v186 >= v187)
        {
          v83 = (char *)v185;
          v84 = (char *)v186 - (_BYTE *)v185;
          v85 = ((char *)v186 - (_BYTE *)v185) >> 3;
          v86 = v85 + 1;
          if ((unint64_t)(v85 + 1) >> 61)
            sub_19C2A18E8();
          v87 = (char *)v187 - (_BYTE *)v185;
          if (((char *)v187 - (_BYTE *)v185) >> 2 > v86)
            v86 = v87 >> 2;
          if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8)
            v88 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v88 = v86;
          if (v88)
          {
            if (v88 >> 61)
              sub_19C2A143C();
            v89 = (char *)operator new(8 * v88);
          }
          else
          {
            v89 = 0;
          }
          v107 = &v89[8 * v85];
          v108 = &v89[8 * v88];
          v109 = v204;
          *(_QWORD *)&v204 = 0;
          *(_QWORD *)v107 = v109;
          v82 = (uint64_t *)(v107 + 8);
          v110 = v80 - v83;
          if (v80 == v83)
          {
            v185 = &v89[8 * v85];
            v187 = (uint64_t *)v108;
          }
          else
          {
            v111 = v110 - 8;
            if ((unint64_t)(v110 - 8) < 0x78
              || &v80[-8 * (v111 >> 3) - 8] < v107 && &v89[v84 - (v111 & 0xFFFFFFFFFFFFFFF8) - 8] < v80)
            {
              goto LABEL_257;
            }
            v112 = (v111 >> 3) + 1;
            v113 = 8 * (v112 & 0x3FFFFFFFFFFFFFFCLL);
            v114 = &v80[-v113];
            v107 -= v113;
            v115 = &v89[8 * v85 - 16];
            v116 = v80 - 16;
            v117 = v112 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v119 = *((_OWORD *)v116 - 1);
              v118 = *(_OWORD *)v116;
              *((_OWORD *)v116 - 1) = 0uLL;
              *(_OWORD *)v116 = 0uLL;
              *((_OWORD *)v115 - 1) = v119;
              *(_OWORD *)v115 = v118;
              v115 -= 32;
              v116 -= 32;
              v117 -= 4;
            }
            while (v117);
            v80 = v114;
            if (v112 != (v112 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_257:
              do
              {
                v120 = *((_QWORD *)v80 - 1);
                v80 -= 8;
                *(_QWORD *)v80 = 0;
                *((_QWORD *)v107 - 1) = v120;
                v107 -= 8;
              }
              while (v80 != v83);
            }
            v80 = (char *)v185;
            v121 = v186;
            v185 = v107;
            v187 = (uint64_t *)v108;
            while (v121 != (uint64_t *)v80)
            {
              v123 = *--v121;
              v122 = v123;
              *v121 = 0;
              if (v123)
                MEMORY[0x1A1AD355C](v122, 0x1000C4065B674BELL);
            }
          }
          v9 = v167;
          if (v80)
            operator delete(v80);
        }
        else
        {
          v81 = v204;
          *(_QWORD *)&v204 = 0;
          *v186 = v81;
          v82 = (uint64_t *)(v80 + 8);
        }
        v186 = v82;
        v127 = v204;
        *(_QWORD *)&v204 = 0;
        v16 = v172;
        if (v127)
          MEMORY[0x1A1AD355C](v127, 0x1000C4065B674BELL);
        if (SHIBYTE(v175) < 0)
          operator delete(v174[0]);
        language_modeling::v1::LinguisticContext::try_push_back((uint64_t *)&v188, *(_QWORD *)(*a3 + 24 * v171) + 32 * v172);
        if ((SHIBYTE(v183) & 0x80000000) == 0)
          goto LABEL_8;
LABEL_216:
        operator delete(__dst[0]);
        goto LABEL_8;
      }
LABEL_118:
      if (SHIBYTE(v183) < 0)
      {
        sub_19C2B5238(v177, __dst[0], (unint64_t)__dst[1]);
      }
      else
      {
        *(_OWORD *)v177 = *(_OWORD *)__dst;
        v178 = v183;
      }
      v179 = v184;
      v67 = *(_QWORD *)(a6 + 24);
      if (!v67)
        sub_19C2CCC60();
      v68 = (*(double (**)(uint64_t, void **, void ****))(*(_QWORD *)v67 + 48))(v67, v177, &v188);
      if (SHIBYTE(v178) < 0)
        operator delete(v177[0]);
      v69 = operator new();
      v70 = v69;
      *(double *)v69 = v68;
      *(double *)(v69 + 8) = v68;
      *(_QWORD *)(v69 + 16) = 0;
      *(_QWORD *)(v69 + 24) = 0;
      *(_BYTE *)(v69 + 32) = 1;
      *(double *)(v69 + 40) = v68;
      *(_QWORD *)(v69 + 48) = 0x3FF0000000000000;
      *(_DWORD *)(v69 + 56) = 2;
      *(_OWORD *)(v69 + 64) = xmmword_19C46DE10;
      *(_QWORD *)(v69 + 88) = 0;
      *(_QWORD *)(v69 + 96) = 0;
      *(_QWORD *)(v69 + 80) = 0xFFEFFFFFFFFFFFFFLL;
      *(_DWORD *)(v69 + 104) = 0;
      v71 = v186;
      if (v186 < v187)
      {
        *v186 = v69;
        goto LABEL_199;
      }
      v72 = (uint64_t *)v185;
      v73 = (char *)v186 - (_BYTE *)v185;
      v74 = ((char *)v186 - (_BYTE *)v185) >> 3;
      v75 = v74 + 1;
      if ((unint64_t)(v74 + 1) >> 61)
        sub_19C2A18E8();
      v76 = (char *)v187 - (_BYTE *)v185;
      if (((char *)v187 - (_BYTE *)v185) >> 2 > v75)
        v75 = v76 >> 2;
      if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
        v77 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v77 = v75;
      if (v77)
      {
        if (v77 >> 61)
          sub_19C2A143C();
        v78 = (char *)operator new(8 * v77);
      }
      else
      {
        v78 = 0;
      }
      v124 = (uint64_t *)&v78[8 * v74];
      *v124 = v70;
      if (v71 != v72)
      {
        v125 = (char *)v71 - (char *)v72 - 8;
        if (v125 < 0x78)
        {
          v126 = &v78[8 * v74];
          goto LABEL_224;
        }
        v136 = v125 >> 3;
        if (&v71[-(v125 >> 3) - 1] < v124)
        {
          v137 = (unint64_t)&v78[v73 - (v125 & 0xFFFFFFFFFFFFFFF8) - 8];
          v126 = &v78[8 * v74];
          if (v137 < (unint64_t)v71)
            goto LABEL_258;
        }
        v138 = v136 + 1;
        v139 = 8 * (v138 & 0x3FFFFFFFFFFFFFFCLL);
        v140 = &v71[v139 / 0xFFFFFFFFFFFFFFF8];
        v126 = (char *)&v124[v139 / 0xFFFFFFFFFFFFFFF8];
        v141 = &v78[8 * v74 - 16];
        v142 = v71 - 2;
        v143 = v138 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v145 = *((_OWORD *)v142 - 1);
          v144 = *(_OWORD *)v142;
          *((_OWORD *)v142 - 1) = 0uLL;
          *(_OWORD *)v142 = 0uLL;
          *((_OWORD *)v141 - 1) = v145;
          *(_OWORD *)v141 = v144;
          v141 -= 32;
          v142 -= 4;
          v143 -= 4;
        }
        while (v143);
        v71 = v140;
        if (v138 != (v138 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_258:
          do
          {
LABEL_224:
            v146 = *--v71;
            *v71 = 0;
            *((_QWORD *)v126 - 1) = v146;
            v126 -= 8;
          }
          while (v71 != v72);
        }
        v71 = (uint64_t *)v185;
        v147 = v186;
        v185 = v126;
        v187 = (uint64_t *)&v78[8 * v77];
        while (v147 != v71)
        {
          v149 = *--v147;
          v148 = v149;
          *v147 = 0;
          if (v149)
            MEMORY[0x1A1AD355C](v148, 0x1000C4065B674BELL);
        }
        goto LABEL_196;
      }
      v185 = &v78[8 * v74];
      v187 = (uint64_t *)&v78[8 * v77];
LABEL_196:
      if (v71)
        operator delete(v71);
      v71 = v124;
      v9 = v167;
LABEL_199:
      v186 = v71 + 1;
      v128 = *(_QWORD *)(a2 + 72);
      v129 = *(std::__shared_weak_count **)(a2 + 80);
      *(_QWORD *)&v197 = v128;
      *((_QWORD *)&v197 + 1) = v129;
      if (v129)
      {
        v130 = (unint64_t *)&v129->__shared_owners_;
        do
          v131 = __ldxr(v130);
        while (__stxr(v131 + 1, v130));
      }
      v132 = *(_QWORD *)(v128 + 232);
      if (*(char *)(v132 + 455) < 0)
      {
        sub_19C2B5238(&v201, *(void **)(v132 + 432), *(_QWORD *)(v132 + 440));
      }
      else
      {
        v133 = (__int128 *)(v132 + 432);
        v201 = *v133;
        *(_QWORD *)&v202 = *((_QWORD *)v133 + 2);
      }
      if (!v129)
        goto LABEL_209;
      v134 = (unint64_t *)&v129->__shared_owners_;
      do
        v135 = __ldaxr(v134);
      while (__stlxr(v135 - 1, v134));
      if (!v135)
      {
        ((void (*)(std::__shared_weak_count *))v129->__on_zero_shared)(v129);
        std::__shared_weak_count::__release_weak(v129);
        if ((SBYTE7(v202) & 0x80000000) == 0)
        {
LABEL_210:
          v204 = v201;
          v205 = v202;
          LODWORD(v206) = 0;
          v16 = v172;
          goto LABEL_214;
        }
      }
      else
      {
LABEL_209:
        if ((SBYTE7(v202) & 0x80000000) == 0)
          goto LABEL_210;
      }
      sub_19C2B5238(&v204, (void *)v201, *((unint64_t *)&v201 + 1));
      v16 = v172;
      LODWORD(v206) = 0;
      if (SBYTE7(v202) < 0)
        operator delete((void *)v201);
LABEL_214:
      language_modeling::v1::LinguisticContext::try_push_back((uint64_t *)&v188, (uint64_t)&v204);
      if (SHIBYTE(v205) < 0)
      {
        operator delete((void *)v204);
        if ((SHIBYTE(v183) & 0x80000000) == 0)
          goto LABEL_8;
        goto LABEL_216;
      }
      if (SHIBYTE(v183) < 0)
        goto LABEL_216;
LABEL_8:
      ++v16;
      v12 = v171;
      v13 = *a3;
      v17 = (uint64_t *)(*a3 + 24 * v171);
      v15 = *v17;
      if (v16 >= (v17[1] - *v17) >> 5)
        goto LABEL_229;
    }
  }
  return result;
}

void sub_19C43A244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  void ***v46;

  sub_19C311DE4(&a43);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&a46);
  sub_19C311614(v46);
  _Unwind_Resume(a1);
}

void sub_19C43A66C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  sub_19C2CDAC8(exception_object);
}

char *sub_19C43A684(void ***a1, __int128 ***a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  void **v8;
  void **v9;
  void **v10;
  void **v11;
  __int128 v12;
  void **v13;
  void **v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  void **v23;

  v2 = 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1);
  v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_19C2A18E8();
  if (0x5555555555555556 * (a1[2] - *a1) > v3)
    v3 = 0x5555555555555556 * (a1[2] - *a1);
  if (0xAAAAAAAAAAAAAAABLL * (a1[2] - *a1) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_19C2A143C();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v22 = &v7[24 * v2];
  v23 = (void **)&v7[24 * v6];
  sub_19C311AF8(v22, a2);
  v8 = (void **)v22;
  v9 = (void **)(v22 + 24);
  v10 = *a1;
  v11 = a1[1];
  if (v11 == *a1)
  {
    *a1 = (void **)v22;
    a1[1] = v9;
    a1[2] = v23;
  }
  else
  {
    do
    {
      *(v8 - 3) = 0;
      *(v8 - 2) = 0;
      v8 -= 3;
      v8[2] = 0;
      v12 = *(_OWORD *)(v11 - 3);
      v11 -= 3;
      *(_OWORD *)v8 = v12;
      v8[2] = v11[2];
      *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
    }
    while (v11 != v10);
    v11 = *a1;
    v13 = a1[1];
    *a1 = v8;
    a1[1] = v9;
    a1[2] = v23;
    if (v13 != v11)
    {
      v14 = v13;
      do
      {
        v17 = *(v14 - 3);
        v14 -= 3;
        v16 = v17;
        if (v17)
        {
          v18 = *(v13 - 2);
          v15 = v16;
          if (v18 != v16)
          {
            do
            {
              v20 = *--v18;
              v19 = v20;
              *v18 = 0;
              if (v20)
                MEMORY[0x1A1AD355C](v19, 0x1000C4065B674BELL);
            }
            while (v18 != v16);
            v15 = *v14;
          }
          *(v13 - 2) = v16;
          operator delete(v15);
        }
        v13 = v14;
      }
      while (v14 != v11);
    }
  }
  if (v11)
    operator delete(v11);
  return v22 + 24;
}

void sub_19C43A83C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C311FD0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19C43A854()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43A868(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D392F0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43A89C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D392F0;
  a2[1] = v2;
  return result;
}

void sub_19C43A8B8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9[2];
  uint64_t v10;
  int v11;
  void *__p[2];
  char v13;
  int v14;
  int64x2_t v15;
  uint64_t v16;
  __int16 v17;
  char v18;
  __int128 v19;
  int v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  v10 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v11 = *(_DWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 8);
  sub_19C297950(__p, (const UInt8 *)v9);
  v14 = v11;
  v15 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v16 = 0;
  v17 = 0;
  v18 = 1;
  v19 = xmmword_19C46DE10;
  v20 = 0;
  v21 = xmmword_19C46DE10;
  v23 = 0;
  v24 = 0;
  v22 = 0xFFEFFFFFFFFFFFFFLL;
  v26 = 0;
  sub_19C43AAE4(a4, v6, (uint64_t)__p, *a3, (uint64_t)&v15, 1, v25);
  v7 = v26;
  if (v26 == v25)
  {
    v8 = 4;
    v7 = v25;
  }
  else
  {
    if (!v26)
      goto LABEL_6;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_6:
  if ((v13 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10) & 0x80000000) == 0)
      return;
LABEL_10:
    operator delete(v9[0]);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v10) < 0)
    goto LABEL_10;
}

void sub_19C43AA04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v24;
  uint64_t v25;

  v24 = *(_QWORD **)(v22 - 48);
  if (v24 == v21)
  {
    v25 = 4;
    v24 = (_QWORD *)(v22 - 72);
  }
  else
  {
    if (!v24)
    {
      if (a21 < 0)
        goto LABEL_9;
      goto LABEL_5;
    }
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
  if (a21 < 0)
  {
LABEL_9:
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_10:
      operator delete(a9);
      _Unwind_Resume(exception_object);
    }
LABEL_6:
    _Unwind_Resume(exception_object);
  }
LABEL_5:
  if (a14 < 0)
    goto LABEL_10;
  goto LABEL_6;
}

uint64_t sub_19C43AA84(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityER"
                     "KNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataEN"
                     "S5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_1"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalPr"
                                "obabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_"
                                "INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43AAD8()
{
  return &unk_1E3D33700;
}

void sub_19C43AAE4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, _QWORD *a7)
{
  unsigned int v14;
  int32x2_t **v15;
  uint64_t v16;
  int32x2_t *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  CFTypeRef v21;
  int v22;
  const __CFString *v23;
  CFTypeID TypeID;
  uint64_t v25;
  __n128 v26;
  _BOOL4 v27;
  uint64_t v28;
  _QWORD *v29;
  unsigned int v30;
  __int128 *v31;
  uint64_t v32;
  __n128 v33;
  CFTypeRef v34;
  std::recursive_mutex *v35;
  CFTypeRef v36;
  int v37;
  const __CFString *v38;
  CFTypeID v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  std::mutex *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  _QWORD *v61;
  void *v62[2];
  uint64_t v63;
  void *v64[2];
  uint64_t v65;
  uint64_t v66[8];
  void *__dst[2];
  uint64_t v68;
  CFTypeRef cf;
  void *__p[2];
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int128 *v74;
  int32x2_t *v75;
  int32x2_t *v76;
  int32x2_t **v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v14 = *(unsigned __int16 *)(a2 + 8);
  v75 = (int32x2_t *)&off_1E3D30F28;
  v76 = (int32x2_t *)a2;
  v77 = &v75;
  sub_19C3168D8(a4, v14, (uint64_t)&v75);
  v15 = v77;
  if (v77 == &v75)
  {
    v16 = 4;
    v15 = &v75;
  }
  else
  {
    if (!v77)
      goto LABEL_6;
    v16 = 5;
  }
  ((void (*)(void))(*v15)[v16])();
LABEL_6:
  v60 = a6;
  v61 = a7;
  v52 = a4;
  v53 = a1;
  sub_19C43B21C(&v75, a4, *(_QWORD *)(a2 + 72), v14, *(unsigned __int16 *)(a2 + 8));
  v17 = v75;
  v18 = ((char *)v76 - (char *)v75) >> 2;
  v58 = v78;
  v59 = (uint64_t)v77;
  v56 = v80;
  v57 = v79;
  v54 = v82;
  v55 = v81;
  cf = 0;
  v19 = (*(uint64_t (**)(_QWORD, uint64_t, CFTypeRef *, int32x2_t *, uint64_t, uint64_t))(**(_QWORD **)(a2 + 104)
                                                                                               + 40))(*(_QWORD *)(a2 + 104), a3, &cf, v75, v18, 3);
  v20 = *(_QWORD *)(a2 + 72);
  v21 = cf;
  v22 = *(char *)(a3 + 23);
  if (!cf)
  {
    if (v22 < 0)
    {
      sub_19C2B5238(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3;
      v71 = *(_QWORD *)(a3 + 16);
    }
    goto LABEL_20;
  }
  if (v22 < 0)
  {
    sub_19C2B5238(__dst, *(void **)a3, *(_QWORD *)(a3 + 8));
    v23 = (const __CFString *)cf;
    if ((SHIBYTE(v68) & 0x80000000) == 0)
      goto LABEL_9;
LABEL_13:
    sub_19C2B5238(&v72, __dst[0], (unint64_t)__dst[1]);
    goto LABEL_14;
  }
  *(_OWORD *)__dst = *(_OWORD *)a3;
  v68 = *(_QWORD *)(a3 + 16);
  v23 = (const __CFString *)cf;
  if (SHIBYTE(v68) < 0)
    goto LABEL_13;
LABEL_9:
  v72 = *(_OWORD *)__dst;
  v73 = v68;
LABEL_14:
  if (v23 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v23)))
  {
    sub_19C2E50A4(__p, v23);
    if (SHIBYTE(v73) < 0)
      operator delete((void *)v72);
  }
  else
  {
    *(_OWORD *)__p = v72;
    v71 = v73;
  }
LABEL_20:
  v25 = sub_19C43BAA0(v20, (uint64_t)__p);
  if (SHIBYTE(v71) < 0)
    operator delete(__p[0]);
  if (v21 && SHIBYTE(v68) < 0)
    operator delete(__dst[0]);
  v27 = 0;
  if (v19 == 500)
    v28 = 0;
  else
    v28 = v19;
  v29 = *(_QWORD **)(a2 + 72);
  if (*(_DWORD *)(a2 + 40) != 3)
    v27 = *(_BYTE *)(v29[29] + 192) != 0;
  v66[0] = (uint64_t)v17;
  v66[1] = v18;
  v66[2] = v59;
  v66[3] = v58;
  v66[4] = v57;
  v66[5] = v56;
  v66[6] = v55;
  v66[7] = v54;
  if (qword_1EDB97100 != -1)
    dispatch_once(&qword_1EDB97100, &unk_1E3D3BED0);
  if ((sub_19C32DD08(v29, v28 | (v25 << 32), v66, a5, qword_1EDB970F8, v27, v60, v61, v26) & 1) == 0)
    __assert_rtn("combinedConditionalProbability", "TokenIDLanguageModelSession.cpp", 363, "success");
  if (v27 && *(_BYTE *)(a2 + 88))
  {
    v30 = *(unsigned __int16 *)(a2 + 8) | 0x50000;
    *(_QWORD *)&v72 = &off_1E3D30F80;
    *((_QWORD *)&v72 + 1) = a2;
    v74 = &v72;
    sub_19C3168D8(v52, v30, (uint64_t)&v72);
    v31 = v74;
    if (v74 == &v72)
    {
      v32 = 4;
      v31 = &v72;
    }
    else
    {
      if (!v74)
        goto LABEL_40;
      v32 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v31 + 8 * v32))();
LABEL_40:
    v33.n128_f64[0] = sub_19C43BBCC((uint64_t)&v72, v52, *(_QWORD *)(a2 + 72), v30, *(unsigned __int16 *)(a2 + 8));
    v34 = cf;
    cf = 0;
    if (v34)
      CFRelease(v34);
    (*(void (**)(_QWORD, uint64_t, CFTypeRef *, _QWORD, _QWORD, uint64_t, __n128))(**(_QWORD **)(a2 + 96) + 40))(*(_QWORD *)(a2 + 96), a3, &cf, v72, *((_QWORD *)&v72 + 1), 3, v33);
    v35 = *(std::recursive_mutex **)(*(_QWORD *)(a2 + 72) + 464);
    v36 = cf;
    v37 = *(char *)(a3 + 23);
    if (!cf)
    {
      if (v37 < 0)
      {
        sub_19C2B5238(v64, *(void **)a3, *(_QWORD *)(a3 + 8));
      }
      else
      {
        *(_OWORD *)v64 = *(_OWORD *)a3;
        v65 = *(_QWORD *)(a3 + 16);
      }
LABEL_56:
      v40 = sub_19C3BDFF4(v35, (uint64_t)v64);
      if (SHIBYTE(v65) < 0)
        operator delete(v64[0]);
      if (v36 && SHIBYTE(v63) < 0)
        operator delete(v62[0]);
      v41 = *(_QWORD *)(a2 + 72);
      v42 = *(_QWORD *)(v41 + 272);
      if (v42)
      {
        v43 = *(_QWORD *)(v42 + 56);
        if (v43)
        {
          v44 = (std::mutex *)(v43 + 96);
          std::mutex::lock((std::mutex *)(v43 + 96));
          v43 = *(_QWORD *)(v43 + 40);
          std::mutex::unlock(v44);
          v41 = *(_QWORD *)(a2 + 72);
        }
      }
      else
      {
        v43 = 0;
      }
      v45 = *(_QWORD *)(v41 + 464);
      v46 = v73;
      v47 = (unint64_t)v74;
      if (qword_1EDB97100 != -1)
        dispatch_once(&qword_1EDB97100, &unk_1E3D3BED0);
      sub_19C3BEA5C(v45, v40, v46, v47, a5, v60, (uint64_t)v61, v43);
      goto LABEL_68;
    }
    if (v37 < 0)
    {
      sub_19C2B5238(v62, *(void **)a3, *(_QWORD *)(a3 + 8));
      v38 = (const __CFString *)cf;
      if ((SHIBYTE(v63) & 0x80000000) == 0)
        goto LABEL_45;
    }
    else
    {
      *(_OWORD *)v62 = *(_OWORD *)a3;
      v63 = *(_QWORD *)(a3 + 16);
      v38 = (const __CFString *)cf;
      if ((SHIBYTE(v63) & 0x80000000) == 0)
      {
LABEL_45:
        *(_OWORD *)__p = *(_OWORD *)v62;
        v71 = v63;
LABEL_50:
        if (v38 && (v39 = CFStringGetTypeID(), v39 == CFGetTypeID(v38)))
        {
          sub_19C2E50A4(v64, v38);
          if (SHIBYTE(v71) < 0)
            operator delete(__p[0]);
        }
        else
        {
          *(_OWORD *)v64 = *(_OWORD *)__p;
          v65 = v71;
        }
        goto LABEL_56;
      }
    }
    sub_19C2B5238(__p, v62[0], (unint64_t)v62[1]);
    goto LABEL_50;
  }
LABEL_68:
  v48 = operator new();
  v49 = *(_OWORD *)(a5 + 80);
  *(_OWORD *)(v48 + 64) = *(_OWORD *)(a5 + 64);
  *(_OWORD *)(v48 + 80) = v49;
  *(_QWORD *)(v48 + 96) = *(_QWORD *)(a5 + 96);
  v50 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)v48 = *(_OWORD *)a5;
  *(_OWORD *)(v48 + 16) = v50;
  v51 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(v48 + 32) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(v48 + 48) = v51;
  *(_DWORD *)(v48 + 104) = *(_DWORD *)(a5 + 24) & 1 | (2 * ((*(_DWORD *)(a5 + 24) >> 8) & 1));
  *v53 = v48;
  if (cf)
    CFRelease(cf);
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
}

void sub_19C43B0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,const void *a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  uint64_t v53;
  void *v55;

  sub_19C2E5670(&a47);
  v55 = *(void **)(v53 - 168);
  if (!v55)
    _Unwind_Resume(a1);
  *(_QWORD *)(v53 - 160) = v55;
  operator delete(v55);
  _Unwind_Resume(a1);
}

int32x2_t *sub_19C43B21C(int32x2_t **a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  unint64_t v9;
  uint64_t (***v10)();
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (***v15)();
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t (***v20)();
  uint64_t v21;
  int32x2_t *result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  int32x2_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int32x2_t *v32;
  uint64_t **v33;
  uint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint8x8_t v39;
  unint64_t v40;
  uint64_t **v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint8x8_t v45;
  unint64_t v46;
  uint64_t **v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint8x8_t v51;
  unint64_t v52;
  uint64_t **v53;
  uint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int32x2_t *v59;
  size_t v60;
  int32x2_t *v61;
  uint64_t v62;
  int32x2_t *v63;
  unint64_t v64;
  int32x2_t *v65;
  int32x2_t v66;
  uint64_t v67;
  int32x2_t v68;
  int32x2_t v69;
  void *__src;
  uint64_t v71;
  _QWORD v72[3];
  int32x2_t *v73;
  _QWORD v74[3];
  _QWORD *v75;
  _QWORD v76[3];
  _QWORD *v77;
  uint64_t (**v78)();
  _QWORD *v79;
  uint64_t (***v80)();
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v9 = a5 | 0x40000u;
  v76[0] = &off_1E3D30798;
  v76[1] = &v71;
  v77 = v76;
  v78 = &off_1E3D30740;
  v79 = v76;
  v80 = &v78;
  sub_19C31733C(a2, a4, a5 | 0x40000, (uint64_t)&v78);
  v10 = v80;
  if (v80 == &v78)
  {
    v11 = 4;
    v10 = &v78;
  }
  else
  {
    if (!v80)
      goto LABEL_6;
    v11 = 5;
  }
  (*v10)[v11]();
LABEL_6:
  v12 = v77;
  if (v77 == v76)
  {
    v13 = 4;
    v12 = v76;
  }
  else
  {
    if (!v77)
      goto LABEL_11;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_11:
  v74[0] = &off_1E3D307F0;
  v74[1] = &v71;
  v14 = a5 | 0x20000u;
  v75 = v74;
  v78 = &off_1E3D30740;
  v79 = v74;
  v80 = &v78;
  sub_19C31733C(a2, a4, a5 | 0x20000, (uint64_t)&v78);
  v15 = v80;
  if (v80 == &v78)
  {
    v16 = 4;
    v15 = &v78;
  }
  else
  {
    if (!v80)
      goto LABEL_16;
    v16 = 5;
  }
  (*v15)[v16]();
LABEL_16:
  v17 = v75;
  if (v75 == v74)
  {
    v18 = 4;
    v17 = v74;
  }
  else
  {
    if (!v75)
      goto LABEL_21;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_21:
  v72[0] = &off_1E3D30848;
  v72[1] = &v71;
  v19 = a5 | 0x30000u;
  v73 = (int32x2_t *)v72;
  v78 = &off_1E3D30740;
  v79 = v72;
  v80 = &v78;
  sub_19C31733C(a2, a4, v19, (uint64_t)&v78);
  v20 = v80;
  if (v80 == &v78)
  {
    v21 = 4;
    v20 = &v78;
  }
  else
  {
    if (!v80)
      goto LABEL_26;
    v21 = 5;
  }
  (*v20)[v21]();
LABEL_26:
  result = v73;
  if (v73 == (int32x2_t *)v72)
  {
    v23 = 4;
    result = (int32x2_t *)v72;
  }
  else
  {
    if (!v73)
      goto LABEL_31;
    v23 = 5;
  }
  result = (int32x2_t *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v23))();
LABEL_31:
  v24 = *(_QWORD *)(a2 + 56);
  if (!v24)
  {
    v28 = 0;
    v29 = 0;
    __src = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    goto LABEL_118;
  }
  v25 = *(_QWORD *)(a2 + 48);
  v26 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    v27 = a4;
    if (v24 <= a4)
      v27 = a4 % v24;
  }
  else
  {
    v27 = ((_DWORD)v24 - 1) & a4;
  }
  v33 = *(uint64_t ***)(v25 + 8 * v27);
  if (!v33 || (v34 = *v33) == 0)
  {
    v38 = 0;
    v37 = 0;
    goto LABEL_54;
  }
  if (v26.u32[0] < 2uLL)
  {
    while (1)
    {
      v36 = v34[1];
      if (v36 == a4)
      {
        if (*((_DWORD *)v34 + 4) == a4)
          goto LABEL_116;
      }
      else if ((v36 & (v24 - 1)) != v27)
      {
        goto LABEL_52;
      }
      v34 = (uint64_t *)*v34;
      if (!v34)
        goto LABEL_52;
    }
  }
  while (1)
  {
    v35 = v34[1];
    if (v35 == a4)
      break;
    if (v35 >= v24)
      v35 %= v24;
    if (v35 != v27)
    {
LABEL_52:
      v37 = 0;
      v38 = 0;
      goto LABEL_54;
    }
LABEL_42:
    v34 = (uint64_t *)*v34;
    if (!v34)
      goto LABEL_52;
  }
  if (*((_DWORD *)v34 + 4) != a4)
    goto LABEL_42;
LABEL_116:
  v38 = (void *)v34[3];
  v37 = (v34[4] - (uint64_t)v38) >> 2;
LABEL_54:
  v39 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
  v39.i16[0] = vaddlv_u8(v39);
  if (v39.u32[0] > 1uLL)
  {
    v40 = v9;
    if (v24 <= v9)
      v40 = v9 % v24;
  }
  else
  {
    v40 = ((_DWORD)v24 - 1) & v9;
  }
  v41 = *(uint64_t ***)(v25 + 8 * v40);
  __src = v38;
  if (!v41 || (v42 = *v41) == 0)
  {
    v32 = 0;
    v31 = 0;
    v30 = v37;
    goto LABEL_75;
  }
  if (v39.u32[0] < 2uLL)
  {
    while (1)
    {
      v44 = v42[1];
      if (v44 == v9)
      {
        if (*((_DWORD *)v42 + 4) == (_DWORD)v9)
          goto LABEL_117;
      }
      else if ((v44 & (v24 - 1)) != v40)
      {
        goto LABEL_73;
      }
      v42 = (uint64_t *)*v42;
      if (!v42)
        goto LABEL_73;
    }
  }
  while (2)
  {
    v43 = v42[1];
    if (v43 != v9)
    {
      if (v43 >= v24)
        v43 %= v24;
      if (v43 != v40)
      {
LABEL_73:
        v31 = 0;
        v32 = 0;
        v30 = v37;
        goto LABEL_75;
      }
      goto LABEL_63;
    }
    if (*((_DWORD *)v42 + 4) != (_DWORD)v9)
    {
LABEL_63:
      v42 = (uint64_t *)*v42;
      if (!v42)
        goto LABEL_73;
      continue;
    }
    break;
  }
LABEL_117:
  v32 = (int32x2_t *)v42[3];
  v31 = (v42[4] - (uint64_t)v32) >> 2;
  v30 = v37;
LABEL_75:
  v45 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
  v45.i16[0] = vaddlv_u8(v45);
  if (v45.u32[0] > 1uLL)
  {
    v46 = v14;
    if (v24 <= v14)
      v46 = v14 % v24;
  }
  else
  {
    v46 = ((_DWORD)v24 - 1) & v14;
  }
  v47 = *(uint64_t ***)(v25 + 8 * v46);
  if (!v47 || (v48 = *v47) == 0)
  {
    v28 = 0;
    v29 = 0;
    goto LABEL_96;
  }
  if (v45.u32[0] < 2uLL)
  {
    while (1)
    {
      v50 = v48[1];
      if (v50 == v14)
      {
        if (*((_DWORD *)v48 + 4) == (_DWORD)v14)
          goto LABEL_140;
      }
      else if ((v50 & (v24 - 1)) != v46)
      {
        goto LABEL_94;
      }
      v48 = (uint64_t *)*v48;
      if (!v48)
        goto LABEL_94;
    }
  }
  while (2)
  {
    v49 = v48[1];
    if (v49 != v14)
    {
      if (v49 >= v24)
        v49 %= v24;
      if (v49 != v46)
      {
LABEL_94:
        v29 = 0;
        v28 = 0;
        goto LABEL_96;
      }
      goto LABEL_84;
    }
    if (*((_DWORD *)v48 + 4) != (_DWORD)v14)
    {
LABEL_84:
      v48 = (uint64_t *)*v48;
      if (!v48)
        goto LABEL_94;
      continue;
    }
    break;
  }
LABEL_140:
  v28 = (int32x2_t *)v48[3];
  v29 = (v48[4] - (uint64_t)v28) >> 2;
LABEL_96:
  v51 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
  v51.i16[0] = vaddlv_u8(v51);
  if (v51.u32[0] > 1uLL)
  {
    v52 = v19;
    if (v24 <= v19)
      v52 = v19 % v24;
  }
  else
  {
    v52 = ((_DWORD)v24 - 1) & v19;
  }
  v53 = *(uint64_t ***)(v25 + 8 * v52);
  if (!v53 || (v54 = *v53) == 0)
  {
LABEL_118:
    v58 = 0;
    v59 = 0;
    goto LABEL_119;
  }
  if (v51.u32[0] < 2uLL)
  {
    v55 = v24 - 1;
    while (1)
    {
      v57 = v54[1];
      if (v57 == v19)
      {
        if (*((_DWORD *)v54 + 4) == (_DWORD)v19)
          goto LABEL_141;
      }
      else if ((v57 & v55) != v52)
      {
        goto LABEL_118;
      }
      v54 = (uint64_t *)*v54;
      if (!v54)
        goto LABEL_118;
    }
  }
  while (1)
  {
    v56 = v54[1];
    if (v56 == v19)
      break;
    if (v56 >= v24)
      v56 %= v24;
    if (v56 != v52)
      goto LABEL_118;
LABEL_105:
    v54 = (uint64_t *)*v54;
    if (!v54)
      goto LABEL_118;
  }
  if (*((_DWORD *)v54 + 4) != (_DWORD)v19)
    goto LABEL_105;
LABEL_141:
  v59 = (int32x2_t *)v54[3];
  v58 = (v54[4] - (uint64_t)v59) >> 2;
LABEL_119:
  v60 = 4 * v30;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (4 * v30)
  {
    if ((v60 & 0x8000000000000000) != 0)
      sub_19C2A18E8();
    result = (int32x2_t *)operator new(4 * v30);
    v61 = result;
    *a1 = result;
    a1[1] = result;
    v62 = v30;
    v63 = (int32x2_t *)((char *)result + 4 * v30);
    a1[2] = v63;
    if (v62)
      result = (int32x2_t *)memmove(result, __src, v60);
    a1[1] = v63;
    if (v60 - 4 >= 0xC)
    {
      v64 = ((v60 - 4) >> 2) + 1;
      v65 = v61 + 1;
      v66 = vdup_n_s32(0x1F4u);
      v67 = v64 & 0x7FFFFFFFFFFFFFFCLL;
      do
      {
        v68 = vceq_s32(v65[-1], v66);
        if ((v68.i8[0] & 1) != 0)
          v65[-1].i32[0] = 0;
        if ((v68.i8[4] & 1) != 0)
          v65[-1].i32[1] = 0;
        v69 = vceq_s32(*v65, v66);
        if ((v69.i8[0] & 1) != 0)
          v65->i32[0] = 0;
        if ((v69.i8[4] & 1) != 0)
          v65->i32[1] = 0;
        v65 += 2;
        v67 -= 4;
      }
      while (v67);
      if (v64 == (v64 & 0x7FFFFFFFFFFFFFFCLL))
        goto LABEL_120;
      v61 = (int32x2_t *)((char *)v61 + 4 * (v64 & 0x7FFFFFFFFFFFFFFCLL));
    }
    do
    {
      if (v61->i32[0] == 500)
        v61->i32[0] = 0;
      v61 = (int32x2_t *)((char *)v61 + 4);
    }
    while (v61 != v63);
  }
LABEL_120:
  a1[3] = v32;
  a1[4] = (int32x2_t *)v31;
  a1[5] = v28;
  a1[6] = (int32x2_t *)v29;
  a1[7] = v59;
  a1[8] = (int32x2_t *)v58;
  return result;
}

void sub_19C43B97C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  void *v28;

  v28 = *(void **)v26;
  if (*(_QWORD *)v26)
  {
    *(_QWORD *)(v26 + 8) = v28;
    operator delete(v28);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C43BAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 232) + 192))
    return 0;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(v4 + 560);
  v6 = *(std::__shared_weak_count **)(v4 + 568);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if (v5)
        goto LABEL_9;
      return 0;
    }
  }
  if (!v5)
    return 0;
LABEL_9:
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(v11 + 560);
  v13 = *(std::__shared_weak_count **)(v11 + 568);
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v16 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v12 + 24))(v12, a2, 0);
  if (v13)
  {
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v16;
}

void sub_19C43BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_19C2B43C8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double sub_19C43BBCC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t **v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  uint64_t **v25;
  uint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double result;
  uint64_t v32;
  _QWORD v33[3];
  _QWORD *v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5 | 0x60000u;
  v32 = a3;
  v33[0] = &off_1E3D308A0;
  v33[1] = &v32;
  v34 = v33;
  v35[0] = &off_1E3D30740;
  v35[1] = v33;
  v36 = v35;
  sub_19C31733C(a2, a4, a5 | 0x60000, (uint64_t)v35);
  v9 = v36;
  if (v36 == v35)
  {
    v10 = 4;
    v9 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_6;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = v34;
  if (v34 == v33)
  {
    v12 = 4;
    v11 = v33;
    goto LABEL_10;
  }
  if (v34)
  {
    v12 = 5;
LABEL_10:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  v13 = *(_QWORD *)(a2 + 56);
  if (!v13)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_54;
  }
  v14 = *(_QWORD *)(a2 + 48);
  v15 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    v16 = a4;
    if (v13 <= a4)
      v16 = a4 % v13;
  }
  else
  {
    v16 = ((_DWORD)v13 - 1) & a4;
  }
  v19 = *(uint64_t ***)(v14 + 8 * v16);
  if (!v19 || (v20 = *v19) == 0)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_34;
  }
  if (v15.u32[0] < 2uLL)
  {
    while (1)
    {
      v22 = v20[1];
      if (v22 == a4)
      {
        if (*((_DWORD *)v20 + 4) == a4)
          goto LABEL_56;
      }
      else if ((v22 & (v13 - 1)) != v16)
      {
        goto LABEL_32;
      }
      v20 = (uint64_t *)*v20;
      if (!v20)
        goto LABEL_32;
    }
  }
  while (1)
  {
    v21 = v20[1];
    if (v21 == a4)
      break;
    if (v21 >= v13)
      v21 %= v13;
    if (v21 != v16)
    {
LABEL_32:
      v18 = 0;
      v17 = 0;
      goto LABEL_34;
    }
LABEL_22:
    v20 = (uint64_t *)*v20;
    if (!v20)
      goto LABEL_32;
  }
  if (*((_DWORD *)v20 + 4) != a4)
    goto LABEL_22;
LABEL_56:
  v17 = v20[3];
  v18 = (v20[4] - v17) >> 2;
LABEL_34:
  v23 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
  v23.i16[0] = vaddlv_u8(v23);
  if (v23.u32[0] > 1uLL)
  {
    v24 = v8;
    if (v13 <= v8)
      v24 = v8 % v13;
  }
  else
  {
    v24 = ((_DWORD)v13 - 1) & v8;
  }
  v25 = *(uint64_t ***)(v14 + 8 * v24);
  if (v25)
  {
    v26 = *v25;
    if (v26)
    {
      if (v23.u32[0] < 2uLL)
      {
        v27 = v13 - 1;
        while (1)
        {
          v29 = v26[1];
          if (v29 == v8)
          {
            if (*((_DWORD *)v26 + 4) == (_DWORD)v8)
              goto LABEL_57;
          }
          else if ((v29 & v27) != v24)
          {
            goto LABEL_53;
          }
          v26 = (uint64_t *)*v26;
          if (!v26)
            goto LABEL_53;
        }
      }
      do
      {
        v28 = v26[1];
        if (v28 == v8)
        {
          if (*((_DWORD *)v26 + 4) == (_DWORD)v8)
          {
LABEL_57:
            v30 = v26[3];
            v13 = (v26[4] - v30) >> 2;
            goto LABEL_55;
          }
        }
        else
        {
          if (v28 >= v13)
            v28 %= v13;
          if (v28 != v24)
            break;
        }
        v26 = (uint64_t *)*v26;
      }
      while (v26);
    }
  }
LABEL_53:
  v13 = 0;
LABEL_54:
  v30 = 0;
LABEL_55:
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v18;
  *(_QWORD *)(a1 + 16) = v30;
  *(_QWORD *)(a1 + 24) = v13;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  return result;
}

void sub_19C43BEC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  v21 = a13;
  if (a13 == &a10)
  {
    v22 = 4;
    v21 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_19C43BF34()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43BF48(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30740;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43BF7C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30740;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43BF98(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t result;
  uint64_t v6;

  if (*(_DWORD *)(a2 + 24))
    return *a4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24);
  if (!v6)
    sub_19C2CCC60();
  LODWORD(result) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
  if ((_DWORD)result)
    return result;
  else
    return *a4;
}

uint64_t sub_19C43BFEC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v1L18specializeTokenIdsERNS0_21LinguisticContextImplEjjNSt3__18functionIFjRKN"
                     "S3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERKN10applesauce2CF9StringRefEEEEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v1L18specializeTokenIdsERNS0_21LinguisticContextImplEjjNSt3__18fun"
                                "ctionIFjRKNS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERKN10applesauce2C"
                                "F9StringRefEEEEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v1L18specializeTokenIdsERNS0_21LinguisticContextImplEjjNSt3__18functionIFjRKNS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERKN10applesauce2CF9StringRefEEEEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v1L18specializeTokenIdsERNS0_21LinguisticContextImplEjjNSt3__18functionIFjRKNS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEERKN10applesauce2CF9StringRefEEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C040()
{
  return &unk_1E3D30080;
}

void sub_19C43C050()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C064(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D308A0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C098(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D308A0;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C0B4(uint64_t a1, uint64_t a2, const __CFString **a3)
{
  std::recursive_mutex *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  CFTypeID TypeID;
  uint64_t v9;
  void *v11[2];
  uint64_t v12;
  void *__dst[2];
  uint64_t v14;
  void *__p[2];
  uint64_t v16;

  v3 = *(std::recursive_mutex **)(**(_QWORD **)(a1 + 8) + 464);
  v4 = *a3;
  v5 = *(char *)(a2 + 23);
  if (!*a3)
  {
    if (v5 < 0)
    {
      sub_19C2B5238(__dst, *(void **)a2, *(_QWORD *)(a2 + 8));
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)a2;
      v14 = *(_QWORD *)(a2 + 16);
    }
    goto LABEL_15;
  }
  if (v5 < 0)
  {
    sub_19C2B5238(v11, *(void **)a2, *(_QWORD *)(a2 + 8));
    v6 = *a3;
    if ((SHIBYTE(v12) & 0x80000000) == 0)
      goto LABEL_4;
LABEL_8:
    sub_19C2B5238(__p, v11[0], (unint64_t)v11[1]);
    goto LABEL_9;
  }
  *(_OWORD *)v11 = *(_OWORD *)a2;
  v12 = *(_QWORD *)(a2 + 16);
  v6 = v4;
  if (SHIBYTE(v12) < 0)
    goto LABEL_8;
LABEL_4:
  *(_OWORD *)__p = *(_OWORD *)v11;
  v16 = v12;
LABEL_9:
  if (v6 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v6)))
  {
    sub_19C2E50A4(__dst, v6);
    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)__p;
    v14 = v16;
  }
LABEL_15:
  v9 = sub_19C3BDFF4(v3, (uint64_t)__dst);
  if (SHIBYTE(v14) < 0)
    operator delete(__dst[0]);
  if (v4 && SHIBYTE(v12) < 0)
    operator delete(v11[0]);
  return v9;
}

void sub_19C43C20C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (a21 < 0)
    operator delete(__p);
  if (v21)
  {
    if (a14 < 0)
      operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C43C23C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v1L22multilingualTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLang"
                     "uageModelEjtE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v1L22multilingualTokenSpansERNS0_21LinguisticContextImplEPN2LM22Co"
                                "mpositeLanguageModelEjtE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v1L22multilingualTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v1L22multilingualTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C290()
{
  return &unk_1E3D300C0;
}

void sub_19C43C2A0()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C2B4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30F80;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C2E8(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30F80;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C304(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 112)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C43C32C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14Sani"
                     "tizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_1"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityER"
                                "KNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18fun"
                                "ctionIFdmEEEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C380()
{
  return &unk_1E3D30160;
}

void sub_19C43C390()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C3A4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30848;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C3D8(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30848;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = **(_QWORD **)(a1 + 8);
  if (*(_BYTE *)(*(_QWORD *)(v2 + 232) + 192) && (v3 = *(_QWORD *)(v2 + 288)) != 0)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(v3 + 16) + 24))(*(_QWORD *)(v3 + 16), a2, 0);
  else
    return 0;
}

uint64_t sub_19C43C42C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLangu"
                     "ageModelEjtE3$_2"
    || ((v3 & (unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22Com"
                                "positeLanguageModelEjtE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C480()
{
  return &unk_1E3D300B0;
}

void sub_19C43C490()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C4A4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D307F0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C4D8(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D307F0;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = **(_QWORD **)(a1 + 8);
  if (*(_BYTE *)(*(_QWORD *)(v2 + 232) + 192) && (v3 = *(_QWORD *)(v2 + 296)) != 0)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(v3 + 16) + 24))(*(_QWORD *)(v3 + 16), a2, 0);
  else
    return 0;
}

uint64_t sub_19C43C52C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLangu"
                     "ageModelEjtE3$_1"
    || ((v3 & (unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22Com"
                                "positeLanguageModelEjtE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C580()
{
  return &unk_1E3D300A0;
}

void sub_19C43C590()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C5A4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30798;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C5D8(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30798;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C5F4(uint64_t a1, uint64_t a2, const __CFString **a3)
{
  uint64_t v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  CFTypeID TypeID;
  uint64_t v9;
  void *v11[2];
  uint64_t v12;
  void *__dst[2];
  uint64_t v14;
  void *__p[2];
  uint64_t v16;

  v3 = **(_QWORD **)(a1 + 8);
  v4 = *a3;
  v5 = *(char *)(a2 + 23);
  if (!*a3)
  {
    if (v5 < 0)
    {
      sub_19C2B5238(__dst, *(void **)a2, *(_QWORD *)(a2 + 8));
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)a2;
      v14 = *(_QWORD *)(a2 + 16);
    }
    goto LABEL_15;
  }
  if (v5 < 0)
  {
    sub_19C2B5238(v11, *(void **)a2, *(_QWORD *)(a2 + 8));
    v6 = *a3;
    if ((SHIBYTE(v12) & 0x80000000) == 0)
      goto LABEL_4;
LABEL_8:
    sub_19C2B5238(__p, v11[0], (unint64_t)v11[1]);
    goto LABEL_9;
  }
  *(_OWORD *)v11 = *(_OWORD *)a2;
  v12 = *(_QWORD *)(a2 + 16);
  v6 = v4;
  if (SHIBYTE(v12) < 0)
    goto LABEL_8;
LABEL_4:
  *(_OWORD *)__p = *(_OWORD *)v11;
  v16 = v12;
LABEL_9:
  if (v6 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(v6)))
  {
    sub_19C2E50A4(__dst, v6);
    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)__p;
    v14 = v16;
  }
LABEL_15:
  v9 = sub_19C43BAA0(v3, (uint64_t)__dst);
  if (SHIBYTE(v14) < 0)
    operator delete(__dst[0]);
  if (v4 && SHIBYTE(v12) < 0)
    operator delete(v11[0]);
  return v9;
}

void sub_19C43C748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (a21 < 0)
    operator delete(__p);
  if (v21)
  {
    if (a14 < 0)
      operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C43C778(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLangu"
                     "ageModelEjtE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22Com"
                                "positeLanguageModelEjtE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v1L21specializedTokenSpansERNS0_21LinguisticContextImplEPN2LM22CompositeLanguageModelEjtE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C7CC()
{
  return &unk_1E3D30090;
}

void sub_19C43C7DC()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C7F0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30F28;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C824(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30F28;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43C840(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C43C868(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14Sani"
                     "tizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_0"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityER"
                                "KNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18fun"
                                "ctionIFdmEEEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30combinedConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextERN2LM18CompositeScoreInfoEbRKNSt3__18functionIFdmEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43C8BC()
{
  return &unk_1E3D336D0;
}

void sub_19C43C8CC()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43C8E0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D39298;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43C914(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D39298;
  a2[1] = v2;
  return result;
}

double sub_19C43C930(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void *v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void **v17;
  uint64_t v18;
  int8x8_t v19;
  uint8x8_t v20;
  unint64_t v21;
  uint64_t **v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  CFTypeRef v33;
  double result;
  int64x2_t v35;
  void *__dst[2];
  uint64_t v37;
  int v38;
  void *v39[2];
  char v40;
  int v41;
  CFTypeRef cf[2];
  void *__p[2];
  uint64_t v44;
  void **v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)a2;
  v5 = *(char *)(a2 + 23);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD **)(v6 + 72);
  v8 = *(std::__shared_weak_count **)(v6 + 80);
  cf[0] = v7;
  cf[1] = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = v7[29];
  if (*(char *)(v11 + 455) < 0)
  {
    sub_19C2B5238(__p, *(void **)(v11 + 432), *(_QWORD *)(v11 + 440));
  }
  else
  {
    v12 = v11 + 432;
    *(_OWORD *)__p = *(_OWORD *)v12;
    v44 = *(_QWORD *)(v12 + 16);
  }
  if (!v8)
    goto LABEL_11;
  v13 = (unint64_t *)&v8->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if ((SHIBYTE(v44) & 0x80000000) == 0)
      goto LABEL_12;
  }
  else
  {
LABEL_11:
    if ((SHIBYTE(v44) & 0x80000000) == 0)
    {
LABEL_12:
      *(_OWORD *)__dst = *(_OWORD *)__p;
      v37 = v44;
      v38 = 0;
      goto LABEL_16;
    }
  }
  sub_19C2B5238(__dst, __p[0], (unint64_t)__p[1]);
  v38 = 0;
  if (SHIBYTE(v44) < 0)
    operator delete(__p[0]);
LABEL_16:
  sub_19C297950(v39, (const UInt8 *)__dst);
  v41 = v38;
  v15 = *a3;
  v16 = *(unsigned __int16 *)(v6 + 8);
  __p[0] = &off_1E3D30FD8;
  __p[1] = (void *)v6;
  v45 = __p;
  sub_19C3168D8(v15, v16, (uint64_t)__p);
  v17 = v45;
  if (v45 == __p)
  {
    v18 = 4;
    v17 = __p;
    goto LABEL_20;
  }
  if (v45)
  {
    v18 = 5;
LABEL_20:
    (*((void (**)(void))*v17 + v18))();
  }
  v19 = *(int8x8_t *)(v15 + 56);
  if (v19)
  {
    v20 = (uint8x8_t)vcnt_s8(v19);
    v20.i16[0] = vaddlv_u8(v20);
    if (v20.u32[0] > 1uLL)
    {
      v21 = v16;
      if (*(_QWORD *)&v19 <= v16)
        v21 = v16 % *(_QWORD *)&v19;
    }
    else
    {
      v21 = (v19.i32[0] - 1) & v16;
    }
    v22 = *(uint64_t ***)(*(_QWORD *)(v15 + 48) + 8 * v21);
    if (v22)
    {
      v23 = *v22;
      if (v23)
      {
        if (v20.u32[0] < 2uLL)
        {
          v24 = *(_QWORD *)&v19 - 1;
          while (1)
          {
            v26 = v23[1];
            if (v26 == v16)
            {
              if (*((_DWORD *)v23 + 4) == (_DWORD)v16)
                goto LABEL_57;
            }
            else if ((v26 & v24) != v21)
            {
              goto LABEL_41;
            }
            v23 = (uint64_t *)*v23;
            if (!v23)
              goto LABEL_41;
          }
        }
        do
        {
          v25 = v23[1];
          if (v25 == v16)
          {
            if (*((_DWORD *)v23 + 4) == (_DWORD)v16)
            {
LABEL_57:
              v28 = v23[3];
              v27 = (v23[4] - v28) >> 2;
              goto LABEL_42;
            }
          }
          else
          {
            if (v25 >= *(_QWORD *)&v19)
              v25 %= *(_QWORD *)&v19;
            if (v25 != v21)
              break;
          }
          v23 = (uint64_t *)*v23;
        }
        while (v23);
      }
    }
  }
LABEL_41:
  v27 = 0;
  v28 = 0;
LABEL_42:
  cf[0] = 0;
  v29 = (*(uint64_t (**)(_QWORD, void **, CFTypeRef *, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v6 + 104)
                                                                                           + 40))(*(_QWORD *)(v6 + 104), v39, cf, v28, v27, 3);
  v30 = *(_QWORD *)(v6 + 72);
  __p[0] = 0;
  v31 = *(_QWORD *)(v30 + 248);
  if (!v31
    || !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, void **, _QWORD, _QWORD))(*(_QWORD *)v31 + 16))(v31, v29, v28, v27, __p, 0, 0))
  {
    v32 = 0;
    v35 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v33 = cf[0];
    if (!cf[0])
      goto LABEL_48;
    goto LABEL_47;
  }
  *(double *)&v35.i64[1] = *(double *)__p * *(double *)(*(_QWORD *)(v30 + 248) + 8);
  v32 = 1;
  v33 = cf[0];
  if (cf[0])
LABEL_47:
    CFRelease(v33);
LABEL_48:
  if ((v40 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v37) & 0x80000000) == 0)
      goto LABEL_50;
LABEL_55:
    operator delete(__dst[0]);
    if ((v5 & 0x80000000) == 0)
      goto LABEL_51;
    goto LABEL_56;
  }
  operator delete(v39[0]);
  if (SHIBYTE(v37) < 0)
    goto LABEL_55;
LABEL_50:
  if ((v5 & 0x80000000) == 0)
    goto LABEL_51;
LABEL_56:
  operator delete(v4);
LABEL_51:
  result = *(double *)&v35.i64[1];
  if (!v32)
    return -1.79769313e308;
  return result;
}

void sub_19C43CCC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33)
{
  void *v33;
  int v34;

  if (a32 < 0)
    operator delete(__p);
  if (v34 < 0)
    operator delete(v33);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C43CD9C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityER"
                     "KNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataEN"
                     "S5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_0"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalPr"
                                "obabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_"
                                "INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession41normalizedNameTokenConditionalProbabilityERKNSt3__16vectorINS3_INS0_5TokenENS2_9allocatorIS4_EEEENS5_IS7_EEEERKNS3_INS3_INS0_13TokenMetadataENS5_ISC_EEEENS5_ISE_EEEERKNS0_17LinguisticContextEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43CDF0()
{
  return &unk_1E3D336F0;
}

void sub_19C43CE00()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43CE14(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30FD8;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43CE48(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30FD8;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43CE64(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C43CE8C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession30montrealConditionalProbabilityERKNS0_14Sani"
                     "tizedTokenERKNS0_17LinguisticContextEE3$_0"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30montrealConditionalProbabilityER"
                                "KNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession30montrealConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession30montrealConditionalProbabilityERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43CEE0()
{
  return &unk_1E3D336E0;
}

uint64_t sub_19C43CEEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E3D34BE0;
    *(_QWORD *)(v2 + 8) = 0x100000000;
    v3 = *(_QWORD *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(v2 + 16) = v3;
    *(_QWORD *)(v2 + 24) = v4;
    if (v4)
    {
      v5 = (unint64_t *)(v4 + 8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
      v3 = *(_QWORD *)(a1 + 72);
    }
    *(_BYTE *)(v2 + 32) = *(_BYTE *)(v3 + 440);
    *(_QWORD *)(v2 + 48) = 0;
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 40) = 0;
    v7 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v2;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = *(unsigned __int8 *)(a1 + 88);
  result = operator new();
  *(_QWORD *)result = &off_1E3D34BE0;
  *(_DWORD *)(result + 8) = 1;
  *(_DWORD *)(result + 12) = v8;
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(result + 16) = v10;
  *(_QWORD *)(result + 24) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    v10 = *(_QWORD *)(a1 + 72);
  }
  *(_BYTE *)(result + 32) = *(_BYTE *)(v10 + 440);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 40) = 0;
  v14 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = result;
  if (v14)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  return result;
}

void sub_19C43D020()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43D034(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D304D8;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43D068(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D304D8;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43D084(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 112)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C43D0AC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v127TokenIDLanguageModelSession14unAdaptToTokenERKNS0_14SanitizedTokenERKNS0_"
                     "17LinguisticContextEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v127TokenIDLanguageModelSession14unAdaptToTokenERKNS0_14SanitizedT"
                                "okenERKNS0_17LinguisticContextEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v127TokenIDLanguageModelSession14unAdaptToTokenERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v127TokenIDLanguageModelSession14unAdaptToTokenERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43D100()
{
  return &unk_1E3D334B0;
}

void sub_19C43D110()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C43D124(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30480;
  result[1] = v3;
  return result;
}

uint64_t sub_19C43D158(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30480;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C43D174(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 112)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C43D19C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN17language_modeling2v127TokenIDLanguageModelSession12adaptToTokenERKNS0_14SanitizedTokenERKNS0_17"
                     "LinguisticContextEE3$_0"
    || ((v3 & (unint64_t)"ZN17language_modeling2v127TokenIDLanguageModelSession12adaptToTokenERKNS0_14SanitizedTok"
                                "enERKNS0_17LinguisticContextEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN17language_modeling2v127TokenIDLanguageModelSession12adaptToTokenERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN17language_modeling2v127TokenIDLanguageModelSession12adaptToTokenERKNS0_14SanitizedTokenERKNS0_17LinguisticContextEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C43D1F0()
{
  return &unk_1E3D334A0;
}

os_log_t sub_19C43D1FC()
{
  os_log_t result;

  result = os_log_create("com.apple.LanguageModeling", "InlineCompletionsNonStatic");
  qword_1EE41C068 = (uint64_t)result;
  return result;
}

void sub_19C43D228(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, unint64_t a5, int a6, uint64_t a7)
{
  uint64_t *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned __int16 v16;
  const void ****v17;
  uint64_t v18;
  uint64_t v19;
  const void **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void **v31;
  __int128 v32;
  const UInt8 *v33;
  CFIndex v34;
  const __CFString *v35;
  uint64_t v36;
  std::string *p_p;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  _BYTE *v46;
  unsigned __int8 v47;
  NSObject *v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  __n128 v52;
  _QWORD *v53;
  char v54;
  __int128 *p_dst;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  const void **v60;
  __int128 v61;
  const void **v62;
  void **v63;
  char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  __int128 v69;
  char *v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  char *v74;
  char *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  void **v82;
  _QWORD *v83;
  uint64_t v84;
  _BYTE *v85;
  void **v86;
  void **v87;
  unint64_t v88;
  uint64_t v89;
  unsigned int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  char v96;
  void *v97;
  uint64_t v98;
  char v99;
  void **i;
  const void ****v101;
  const void ****v102;
  void *v103;
  void **v104;
  void **v105;
  void **v106;
  void *exception;
  uint64_t v108;
  const void ****v109;
  uint64_t v112;
  unint64_t v113;
  unsigned int v114;
  uint64_t v115;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  int64x2_t v125;
  uint64_t v126[8];
  uint64_t v127;
  void *v128[2];
  void *v129;
  int v130;
  uint64_t v131[8];
  uint64_t v132;
  void *v133;
  _BYTE *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t *v142;
  void *v143;
  char *v144;
  char *v145;
  void *v146;
  const void ****v147;
  _QWORD v148[3];
  _QWORD *v149;
  std::string __p;
  int v151;
  __int128 __dst;
  void *v153;
  __int128 *v154;
  _BYTE buf[32];
  _BYTE v156[32];
  __int128 v157;
  __int128 v158;
  void *v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t *)*a2;
  sub_19C34F930((uint64_t)&v146, a3, a4, 0);
  if (v146 == v147)
    goto LABEL_177;
  if ((char *)v147 - (_BYTE *)v146 != 8)
    goto LABEL_13;
  v10 = *(_QWORD *)(*(_QWORD *)v146 + 32);
  if (*(_QWORD *)(*(_QWORD *)v146 + 24) == v10)
  {
    buf[23] = 0;
    buf[0] = 0;
  }
  else if (*(char *)(v10 - 9) < 0)
  {
    sub_19C2B5238(buf, *(void **)(v10 - 32), *(_QWORD *)(v10 - 24));
  }
  else
  {
    v11 = *(_OWORD *)(v10 - 32);
    *(_QWORD *)&buf[16] = *(_QWORD *)(v10 - 16);
    *(_OWORD *)buf = v11;
  }
  if (buf[23] >= 0)
    v12 = buf[23];
  else
    v12 = *(_QWORD *)&buf[8];
  if ((buf[23] & 0x80000000) == 0)
  {
    if (v12)
      goto LABEL_13;
LABEL_177:
    sub_19C43E328(a1, a2, a5, a6, a7);
    goto LABEL_178;
  }
  operator delete(*(void **)buf);
  if (!v12)
    goto LABEL_177;
LABEL_13:
  v13 = *(unsigned __int16 *)(a1 + 8);
  *(_QWORD *)buf = &off_1E3D30C68;
  *(_QWORD *)&buf[8] = a1;
  *(_QWORD *)&buf[24] = buf;
  v114 = v13;
  sub_19C3168D8((uint64_t)v9, v13, (uint64_t)buf);
  v14 = *(_QWORD **)&buf[24];
  if (*(_BYTE **)&buf[24] == buf)
  {
    v15 = 4;
    v14 = buf;
    goto LABEL_17;
  }
  if (*(_QWORD *)&buf[24])
  {
    v15 = 5;
LABEL_17:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }
  v16 = sub_19C43F13C(*v9, v9[1], *(_QWORD **)(a1 + 72));
  v144 = 0;
  v143 = 0;
  v145 = 0;
  v17 = (const void ****)v146;
  v109 = v147;
  if (v146 != v147)
  {
    v108 = v16;
    v18 = *v9;
    v19 = v9[1];
    v125 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v115 = a1;
    while (1)
    {
      v21 = (uint64_t)**v17;
      v20 = (*v17)[1];
      v22 = (v19 - v18) >> 5;
      v141 = v22;
      v142 = v9;
      if (v20 != (const void **)v21)
      {
        v23 = 32 * (((uint64_t)v20 - v21) >> 5);
        do
        {
          sub_19C315DCC((uint64_t)v9, v21);
          v21 += 32;
          v23 -= 32;
        }
        while (v23);
      }
      *(_QWORD *)buf = &off_1E3D30CC0;
      *(_QWORD *)&buf[8] = a1;
      *(_QWORD *)&buf[24] = buf;
      sub_19C3168D8((uint64_t)v9, v114, (uint64_t)buf);
      v24 = *(_QWORD **)&buf[24];
      if (*(_BYTE **)&buf[24] == buf)
      {
        v24 = buf;
        v25 = 4;
      }
      else
      {
        if (!*(_QWORD *)&buf[24])
          goto LABEL_28;
        v25 = 5;
      }
      (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_28:
      sub_19C43B21C((int32x2_t **)&v133, (uint64_t)v9, *(_QWORD *)(a1 + 72), v114, *(unsigned __int16 *)(a1 + 8));
      v26 = ((v134 - (_BYTE *)v133) >> 2) - 1;
      if (v134 == v133)
        v26 = 0;
      if (v136)
        v27 = v136 - 1;
      else
        v27 = 0;
      if (v138)
        v28 = v138 - 1;
      else
        v28 = 0;
      v29 = v140 - 1;
      if (!v140)
        v29 = 0;
      v30 = *(_QWORD *)(a1 + 72);
      v123 = v135;
      v124 = v133;
      v131[0] = (uint64_t)v133;
      v131[1] = v26;
      v119 = v27;
      v120 = v26;
      v131[2] = v135;
      v131[3] = v27;
      v121 = v139;
      v122 = v137;
      v131[4] = v137;
      v131[5] = v28;
      v117 = v29;
      v118 = v28;
      v131[6] = v139;
      v131[7] = v29;
      v31 = (*v17)[4];
      if ((*v17)[3] == v31)
      {
        buf[23] = 0;
        buf[0] = 0;
      }
      else if (*((char *)v31 - 9) < 0)
      {
        sub_19C2B5238(buf, (void *)*(v31 - 4), (unint64_t)*(v31 - 3));
      }
      else
      {
        v32 = *((_OWORD *)v31 - 2);
        *(_QWORD *)&buf[16] = *(v31 - 2);
        *(_OWORD *)buf = v32;
      }
      if (buf[23] >= 0)
        v33 = buf;
      else
        v33 = *(const UInt8 **)buf;
      if (buf[23] >= 0)
        v34 = buf[23];
      else
        v34 = *(_QWORD *)&buf[8];
      v35 = CFStringCreateWithBytes(0, v33, v34, 0x8000100u, 0);
      *(_QWORD *)&__dst = v35;
      if (!v35)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD3154](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      v113 = v113 & 0xFFFFFFFFFFFF0000 | v108;
      sub_19C31A4AC(&v132, *(_QWORD *)(v30 + 8), *(std::__shared_weak_count **)(v30 + 16), v131, v108, v35, a6);
      CFRelease(v35);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v36 = v132;
      v112 = v132;
      if (!v132)
      {
        *(_QWORD *)buf = operator new(0x28uLL);
        *(_OWORD *)&buf[8] = xmmword_19C46E080;
        strcpy(*(char **)buf, "Failed to create prediction enumerator");
        sub_19C3D8294(&__p, **v17, (*v17)[1]);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        sub_19C34EC30("Failed to create prediction enumerator for stem='%s'", (uint64_t)&__dst, p_p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (qword_1EE41C5D0 != -1)
          dispatch_once(&qword_1EE41C5D0, &unk_1E3D3CA38);
        v38 = qword_1EE41C5C8;
        if (os_log_type_enabled((os_log_t)qword_1EE41C5C8, OS_LOG_TYPE_ERROR))
        {
          v85 = buf;
          if (buf[23] < 0)
            v85 = *(_BYTE **)buf;
          LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"logToErrorAndDebug";
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v85;
          _os_log_error_impl(&dword_19C291000, v38, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&__p, 0x16u);
          if (SHIBYTE(v153) < 0)
            goto LABEL_148;
LABEL_61:
          if ((buf[23] & 0x80000000) != 0)
LABEL_149:
            operator delete(*(void **)buf);
        }
        else
        {
          if ((SHIBYTE(v153) & 0x80000000) == 0)
            goto LABEL_61;
LABEL_148:
          operator delete((void *)__dst);
          if ((buf[23] & 0x80000000) != 0)
            goto LABEL_149;
        }
        v132 = 0;
        goto LABEL_138;
      }
      while (1)
      {
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36) & 1) == 0)
        {
          v132 = 0;
          goto LABEL_137;
        }
        v45 = v144;
        v46 = v143;
        v47 = atomic_load((unsigned __int8 *)&qword_1EDB96E20);
        if ((v47 & 1) == 0 && __cxa_guard_acquire(&qword_1EDB96E20))
        {
          v83 = sub_19C2A6D48(buf, "PredictionCandidateCount");
          qword_1EE41C020 = sub_19C3AA22C((uint64_t)v83);
          *(_QWORD *)&byte_1EE41C028 = v84;
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          __cxa_guard_release(&qword_1EDB96E20);
          a1 = v115;
        }
        if (byte_1EE41C028)
        {
          if (qword_1EDB97228 != -1)
            dispatch_once(&qword_1EDB97228, &unk_1E3D3ABD0);
          v48 = qword_1EDB97220;
          if (os_log_type_enabled((os_log_t)qword_1EDB97220, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "PredictionCandidateCount";
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = qword_1EE41C020;
            _os_log_impl(&dword_19C291000, v48, OS_LOG_TYPE_DEFAULT, "Setting configuration value %s=%zu (overridden by user preferences)", buf, 0x16u);
          }
          v49 = qword_1EE41C020;
        }
        else
        {
          v49 = 100;
        }
        v36 = v132;
        if (0x86BCA1AF286BCA1BLL * ((v45 - v46) >> 3) >= v49)
          break;
        v130 = 0;
        v50 = (*(uint64_t (**)(uint64_t, _QWORD, int *))(*(_QWORD *)v132 + 24))(v132, 0, &v130);
        v51 = 0;
        *(int64x2_t *)buf = v125;
        *(_QWORD *)&buf[16] = 0;
        *(_WORD *)&buf[24] = 0;
        v156[0] = 1;
        v52 = (__n128)xmmword_19C46DE10;
        *(_OWORD *)&v156[8] = xmmword_19C46DE10;
        *(_DWORD *)&v156[24] = 0;
        v157 = xmmword_19C46DE10;
        v158 = 0xFFEFFFFFFFFFFFFFLL;
        v159 = 0;
        if (*(_DWORD *)(a1 + 40) != 3)
          v51 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 232) + 192) != 0;
        if (v130 != 5)
        {
          v53 = *(_QWORD **)(a1 + 72);
          v126[0] = (uint64_t)v124;
          v126[1] = v120;
          v126[2] = v123;
          v126[3] = v119;
          v126[4] = v122;
          v126[5] = v118;
          v126[6] = v121;
          v126[7] = v117;
          if (qword_1EDB97100 != -1)
            dispatch_once(&qword_1EDB97100, &unk_1E3D3BED0);
          v154 = 0;
          v54 = sub_19C32DD08(v53, v50 | ((unint64_t)v50 << 32), v126, (uint64_t)buf, qword_1EDB970F8, v51, 0, &__dst, v52);
          p_dst = v154;
          if (v154 == &__dst)
          {
            p_dst = &__dst;
            v56 = 4;
LABEL_91:
            (*(void (**)(void))(*(_QWORD *)p_dst + 8 * v56))();
          }
          else if (v154)
          {
            v56 = 5;
            goto LABEL_91;
          }
          if ((v54 & 1) == 0)
            __assert_rtn("enumeratePredictions", "TokenIDLanguageModelSession.cpp", 1084, "success");
          goto LABEL_99;
        }
        sub_19C3BE34C((uint64_t)v128, *(std::recursive_mutex **)(*(_QWORD *)(a1 + 72) + 464), v50);
        if (SHIBYTE(v129) < 0)
        {
          sub_19C2B5238(&__dst, v128[0], (unint64_t)v128[1]);
        }
        else
        {
          __dst = *(_OWORD *)v128;
          v153 = v129;
        }
        LODWORD(v154) = 0;
        sub_19C297950(&__p, (const UInt8 *)&__dst);
        v151 = (int)v154;
        v149 = 0;
        sub_19C43AAE4(&v127, a1, (uint64_t)&__p, *a2, (uint64_t)buf, 0, v148);
        v57 = v127;
        v127 = 0;
        if (v57)
          MEMORY[0x1A1AD355C](v57, 0x1000C4065B674BELL);
        v58 = v149;
        if (v149 == v148)
        {
          v58 = v148;
          v59 = 4;
        }
        else
        {
          if (!v149)
            goto LABEL_96;
          v59 = 5;
        }
        (*(void (**)(void))(*v58 + 8 * v59))();
LABEL_96:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v153) & 0x80000000) == 0)
          {
LABEL_98:
            if (SHIBYTE(v129) < 0)
              goto LABEL_116;
            goto LABEL_99;
          }
        }
        else if ((SHIBYTE(v153) & 0x80000000) == 0)
        {
          goto LABEL_98;
        }
        operator delete((void *)__dst);
        if (SHIBYTE(v129) < 0)
LABEL_116:
          operator delete(v128[0]);
LABEL_99:
        v60 = (*v17)[4];
        if ((*v17)[3] == v60)
        {
          HIBYTE(v153) = 0;
          LOBYTE(__dst) = 0;
        }
        else if (*((char *)v60 - 9) < 0)
        {
          sub_19C2B5238(&__dst, (void *)*(v60 - 4), (unint64_t)*(v60 - 3));
        }
        else
        {
          v61 = *((_OWORD *)v60 - 2);
          v153 = (void *)*(v60 - 2);
          __dst = v61;
        }
        v62 = (*v17)[15];
        v63 = (void **)v144;
        if (v144 < v145)
        {
          *(_DWORD *)v144 = v50;
          v40 = *(_OWORD *)&buf[16];
          v39 = *(_OWORD *)v156;
          *(_OWORD *)(v63 + 1) = *(_OWORD *)buf;
          v41 = *(_OWORD *)&v156[16];
          v42 = v157;
          v43 = v158;
          v63[13] = v159;
          *(_OWORD *)(v63 + 5) = v39;
          *(_OWORD *)(v63 + 3) = v40;
          *(_OWORD *)(v63 + 11) = v43;
          *(_OWORD *)(v63 + 9) = v42;
          *(_OWORD *)(v63 + 7) = v41;
          v44 = __dst;
          v63[16] = v153;
          *((_OWORD *)v63 + 7) = v44;
          *((_DWORD *)v63 + 34) = v130;
          v63[18] = v62;
          v144 = (char *)(v63 + 19);
        }
        else
        {
          v64 = (char *)v143;
          v65 = 0x86BCA1AF286BCA1BLL * ((v144 - (_BYTE *)v143) >> 3);
          v66 = v65 + 1;
          if (v65 + 1 > 0x1AF286BCA1AF286)
            sub_19C2A18E8();
          if (0xD79435E50D79436 * ((v145 - (_BYTE *)v143) >> 3) > v66)
            v66 = 0xD79435E50D79436 * ((v145 - (_BYTE *)v143) >> 3);
          if (0x86BCA1AF286BCA1BLL * ((v145 - (_BYTE *)v143) >> 3) >= 0xD79435E50D7943)
            v67 = 0x1AF286BCA1AF286;
          else
            v67 = v66;
          if (v67)
          {
            if (v67 > 0x1AF286BCA1AF286)
              sub_19C2A143C();
            v68 = (char *)operator new(152 * v67);
          }
          else
          {
            v68 = 0;
          }
          v69 = *(_OWORD *)v156;
          v70 = &v68[152 * v65];
          *(_OWORD *)(v70 + 56) = *(_OWORD *)&v156[16];
          v71 = v158;
          *(_OWORD *)(v70 + 72) = v157;
          *(_OWORD *)(v70 + 88) = v71;
          v72 = *(_OWORD *)&buf[16];
          *(_OWORD *)(v70 + 8) = *(_OWORD *)buf;
          *(_OWORD *)(v70 + 24) = v72;
          *(_DWORD *)v70 = v50;
          *((_QWORD *)v70 + 13) = v159;
          *(_OWORD *)(v70 + 40) = v69;
          *((_OWORD *)v70 + 7) = __dst;
          *((_QWORD *)v70 + 16) = v153;
          __dst = 0uLL;
          v153 = 0;
          *((_DWORD *)v70 + 34) = v130;
          *((_QWORD *)v70 + 18) = v62;
          if (v63 == (void **)v64)
          {
            v143 = v70;
            v145 = &v68[152 * v67];
          }
          else
          {
            v73 = 0;
            do
            {
              v74 = &v70[v73 * 8];
              v75 = (char *)&v63[v73];
              *((_DWORD *)v74 - 38) = v63[v73 - 19];
              v76 = *(_OWORD *)&v63[v73 - 18];
              v77 = *(_OWORD *)&v63[v73 - 14];
              *((_OWORD *)v74 - 8) = *(_OWORD *)&v63[v73 - 16];
              *((_OWORD *)v74 - 7) = v77;
              *((_OWORD *)v74 - 9) = v76;
              v78 = *(_OWORD *)&v63[v73 - 12];
              v79 = *(_OWORD *)&v63[v73 - 10];
              v80 = *(_OWORD *)&v63[v73 - 8];
              *((_QWORD *)v74 - 6) = v63[v73 - 6];
              *((_OWORD *)v74 - 5) = v79;
              *((_OWORD *)v74 - 4) = v80;
              *((_OWORD *)v74 - 6) = v78;
              v81 = *(_OWORD *)&v63[v73 - 5];
              *((_QWORD *)v74 - 3) = v63[v73 - 3];
              *(_OWORD *)(v74 - 40) = v81;
              *((_QWORD *)v75 - 4) = 0;
              *((_QWORD *)v75 - 3) = 0;
              *((_QWORD *)v75 - 5) = 0;
              *((_DWORD *)v74 - 4) = v63[v73 - 2];
              *((_QWORD *)v74 - 1) = v63[v73 - 1];
              v73 -= 19;
            }
            while (&v63[v73] != (void **)v64);
            v63 = (void **)v143;
            v82 = (void **)v144;
            v143 = &v70[v73 * 8];
            v145 = &v68[152 * v67];
            if (v144 != (char *)v63)
            {
              do
              {
                if (*((char *)v82 - 17) < 0)
                  operator delete(*(v82 - 5));
                v82 -= 19;
              }
              while (v82 != v63);
            }
          }
          if (v63)
            operator delete(v63);
          v144 = v70 + 152;
          a1 = v115;
          if (SHIBYTE(v153) < 0)
            operator delete((void *)__dst);
        }
      }
      v132 = 0;
      if (!v36)
        goto LABEL_138;
LABEL_137:
      (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
LABEL_138:
      if (v133)
      {
        v134 = v133;
        operator delete(v133);
      }
      while (1)
      {
        v18 = *v9;
        v19 = v9[1];
        if (v22 >= (v19 - *v9) >> 5)
          break;
        sub_19C31618C(v9);
      }
      if (!v112)
        goto LABEL_168;
      if (++v17 == v109)
      {
        v86 = (void **)v143;
        v87 = (void **)v144;
        goto LABEL_151;
      }
    }
  }
  v87 = 0;
  v86 = 0;
LABEL_151:
  v88 = 126 - 2 * __clz(0x86BCA1AF286BCA1BLL * (v87 - v86));
  if (v87 == v86)
    v89 = 0;
  else
    v89 = v88;
  sub_19C43F2A0((uint64_t)v86, (unint64_t)v87, v89, 1);
  if (v87 != v86)
  {
    do
    {
      while (1)
      {
        v90 = *((_DWORD *)v86 + 34) - 1;
        v91 = v90 > 4 ? 0 : dword_19C47C4F4[v90];
        v92 = *(_QWORD *)(a1 + 72);
        v93 = (uint64_t)v86[3];
        LODWORD(v133) = v91;
        sub_19C4406E4((char **)buf, (unsigned int *)v86, 1, (uint64_t)(v86 + 1), v92, a1 + 16, v93, (int *)&v133, (uint64_t)v86[18], (__int128 *)v86 + 7);
        v94 = *(void **)buf;
        if (*(_QWORD *)buf)
          break;
        v86 += 19;
        if (v86 == v87)
          goto LABEL_168;
      }
      *(_QWORD *)buf = 0;
      v133 = v94;
      v95 = *(_QWORD *)(a7 + 24);
      if (!v95)
        sub_19C2CCC60();
      v96 = (*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)v95 + 48))(v95, &v133);
      v97 = v133;
      v133 = 0;
      if (v97)
      {
        v98 = sub_19C296378((uint64_t)v97);
        MEMORY[0x1A1AD355C](v98, 0x1032C4057ACE4D0);
      }
      v86 += 19;
      if (v86 == v87)
        v99 = 0;
      else
        v99 = v96;
    }
    while ((v99 & 1) != 0);
LABEL_168:
    v87 = (void **)v143;
  }
  if (v87)
  {
    for (i = (void **)v144; i != v87; i -= 19)
    {
      if (*((char *)i - 17) < 0)
        operator delete(*(i - 5));
    }
    v144 = (char *)v87;
    operator delete(v87);
  }
LABEL_178:
  v101 = (const void ****)v146;
  if (v146)
  {
    v102 = v147;
    v103 = v146;
    if (v147 != v146)
    {
      do
      {
        v105 = (void **)*--v102;
        v104 = v105;
        *v102 = 0;
        if (v105)
        {
          v106 = sub_19C2E25C8(v104);
          MEMORY[0x1A1AD355C](v106, 0x1030C403C62F202);
        }
      }
      while (v102 != v101);
      v103 = v146;
    }
    v147 = v101;
    operator delete(v103);
  }
}

void sub_19C43E054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *__p,uint64_t a63)
{
  uint64_t a71;
  uint64_t v71;

  if (*(char *)(v71 - 185) < 0)
    operator delete(*(void **)(v71 - 208));
  __cxa_guard_abort(&qword_1EDB96E20);
  if (a61)
    (*(void (**)(uint64_t))(*(_QWORD *)a61 + 8))(a61);
  if (__p)
    operator delete(__p);
  sub_19C43F260(&a71);
  sub_19C440B54((void **)&STACK[0x200]);
  sub_19C2F06DC(&STACK[0x218]);
  _Unwind_Resume(a1);
}

void sub_19C43E328(uint64_t a1, uint64_t *a2, unint64_t a3, int a4, uint64_t a5)
{
  uint64_t v8;
  unsigned int v9;
  int64x2_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int32x2_t *v13;
  int32x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  const void *v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  int v32;
  size_t v33;
  int v34;
  int v35;
  int v36;
  const void *v37;
  unint64_t v38;
  size_t v40;
  uint64_t v41;
  unsigned int v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  _BYTE *v46;
  NSObject *v47;
  int32x2_t *v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char *v62;
  _QWORD *v63;
  _BOOL4 v64;
  int v65;
  int v66;
  size_t v67;
  int v68;
  int v69;
  int v70;
  const void *v71;
  unint64_t v72;
  const void *v73;
  BOOL v74;
  size_t v75;
  uint64_t v76;
  uint64_t v77;
  char **v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  char *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  char v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  size_t v99;
  uint64_t v100;
  size_t *v101;
  unint64_t v102;
  uint64_t *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  __int128 v108;
  char v109;
  int v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  int v114;
  char *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t *v118;
  unint64_t v119;
  uint64_t v120[8];
  int32x2_t *v121;
  int32x2_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  size_t *v128;
  char *v129[3];
  char **v130;
  _BYTE v131[24];
  _BYTE *v132;
  int64x2_t v133;
  uint64_t v134;
  int64x2_t *v135;
  char v136;
  __int128 v137;
  int v138;
  __int128 v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  __int16 v144;
  int v145;
  uint64_t v146;

  v104 = a4;
  v146 = *MEMORY[0x1E0C80C00];
  v103 = a2;
  v8 = *a2;
  v9 = *(unsigned __int16 *)(a1 + 8);
  v133.i64[0] = (uint64_t)&off_1E3D30D18;
  v133.i64[1] = a1;
  v135 = &v133;
  sub_19C3168D8(v8, v9, (uint64_t)&v133);
  v10 = v135;
  if (v135 == &v133)
  {
    v11 = 4;
    v10 = &v133;
  }
  else
  {
    if (!v135)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(v10->i64[0] + 8 * v11))();
LABEL_6:
  v102 = a3;
  v100 = a5;
  v12 = (uint64_t *)v8;
  sub_19C43B21C(&v121, v8, *(_QWORD *)(a1 + 72), v9, *(unsigned __int16 *)(a1 + 8));
  v14 = v121;
  v13 = v122;
  v15 = v123;
  v16 = v124;
  v17 = v125;
  v18 = v126;
  v105 = v127;
  v101 = v128;
  v19 = sub_19C43F13C(*v12, v12[1], *(_QWORD **)(a1 + 72));
  v20 = v12;
  v21 = *(_QWORD *)(a1 + 72);
  v120[0] = (uint64_t)v14;
  v120[1] = ((char *)v13 - (char *)v14) >> 2;
  v120[2] = v15;
  v120[3] = v16;
  v120[4] = v17;
  v120[5] = v18;
  v120[6] = v105;
  v120[7] = (uint64_t)v101;
  v22 = sub_19C32F274(v21, v120, v19, 40, v102, v104);
  if (!v22)
  {
    v45 = (char *)operator new(0x28uLL);
    strcpy(v45, "Failed to create prediction enumerator");
    sub_19C306C68(v131, (__int128 **)v12);
    if (v131[23] >= 0)
      v46 = v131;
    else
      v46 = *(_BYTE **)v131;
    sub_19C34EC30("Failed to create enumerator for context='%s'", (uint64_t)&v133, v46);
    if ((v131[23] & 0x80000000) != 0)
      operator delete(*(void **)v131);
    if (qword_1EE41C5D0 != -1)
      dispatch_once(&qword_1EE41C5D0, &unk_1E3D3CA38);
    v47 = qword_1EE41C5C8;
    if (os_log_type_enabled((os_log_t)qword_1EE41C5C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v131 = 136315394;
      *(_QWORD *)&v131[4] = "logToErrorAndDebug";
      *(_WORD *)&v131[12] = 2080;
      *(_QWORD *)&v131[14] = v45;
      _os_log_error_impl(&dword_19C291000, v47, OS_LOG_TYPE_ERROR, "%s: %s", v131, 0x16u);
      if ((SHIBYTE(v134) & 0x80000000) == 0)
      {
LABEL_61:
        operator delete(v45);
        v48 = v121;
        if (v121)
          goto LABEL_153;
        return;
      }
    }
    else if ((SHIBYTE(v134) & 0x80000000) == 0)
    {
      goto LABEL_61;
    }
    operator delete((void *)v133.i64[0]);
    goto LABEL_61;
  }
  v101 = &v99;
  MEMORY[0x1E0C80A78]();
  v24 = (unsigned int *)((char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v133 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v134 = 0;
  LOWORD(v135) = 0;
  v136 = 1;
  v137 = xmmword_19C46DE10;
  v138 = 0;
  v139 = xmmword_19C46DE10;
  v145 = 0;
  v140 = 0xFFEFFFFFFFFFFFFFLL;
  v141 = 0;
  v105 = a1 + 16;
  v142 = 0;
  v143 = 0;
  v144 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  while ((*(unsigned int (**)(_QWORD *))(*v22 + 16))(v22))
  {
    v25 = (*(uint64_t (**)(_QWORD *, unsigned int *, int64x2_t *))(*v22 + 24))(v22, v24, &v133);
    if ((v145 - 1) > 9)
      v26 = 0;
    else
      v26 = dword_19C47C4CC[v145 - 1];
    v27 = *(_QWORD *)(a1 + 72);
    LODWORD(v108) = v26;
    v131[23] = 0;
    v131[0] = 0;
    sub_19C4406E4((char **)&v112, v24, v25, (uint64_t)&v133, v27, v105, v143, (int *)&v108, 0, (__int128 *)v131);
    v28 = (const void *)v112;
    if ((_QWORD)v112)
    {
      if (v20[1] != *v20)
        goto LABEL_15;
      v31 = *(char *)(v112 + 23);
      if (v31 < 0)
      {
        v37 = *(const void **)v112;
        v38 = *(_QWORD *)(v112 + 8);
        if (!memcmp(*(const void **)v112, "I", v38 != 0) && v38 == 1)
          goto LABEL_45;
        v40 = v38 >= 3 ? 3 : v38;
        if (!memcmp(v37, "I'm", v40) && v38 == 3
          || !memcmp(v37, "i", v38 != 0) && v38 == 1
          || !memcmp(v37, "i'm", v40) && v38 == 3)
        {
          goto LABEL_45;
        }
LABEL_15:
        *(_QWORD *)&v112 = 0;
        v116 = 0;
        *(_QWORD *)v131 = v28;
        v29 = v118;
        if ((unint64_t)v118 < v119)
        {
          *v118 = (uint64_t)v28;
          v118 = v29 + 1;
          v116 = 0;
        }
        else
        {
          v118 = sub_19C2F1218(&v117, (uint64_t *)v131);
          if (*(_QWORD *)v131)
          {
            v30 = sub_19C296378(*(uint64_t *)v131);
            MEMORY[0x1A1AD355C](v30, 0x1032C4057ACE4D0);
          }
          v116 = 0;
        }
      }
      else
      {
        v32 = memcmp((const void *)v112, "I", v31 != 0);
        if (v31 != 1 || v32)
        {
          v33 = v31 >= 3u ? 3 : v31;
          v34 = memcmp(v28, "I'm", v33);
          if (v31 != 3 || v34)
          {
            v35 = memcmp(v28, "i", v31 != 0);
            if (v31 != 1 || v35)
            {
              v36 = memcmp(v28, "i'm", v33);
              if (v31 != 3 || v36)
                goto LABEL_15;
            }
          }
        }
LABEL_45:
        v41 = sub_19C296378((uint64_t)v28);
        MEMORY[0x1A1AD355C](v41, 0x1032C4057ACE4D0);
      }
    }
  }
  if (v104 == 1 || !*(_QWORD *)(*(_QWORD *)(a1 + 72) + 464))
    goto LABEL_133;
  v42 = *(unsigned __int16 *)(a1 + 8) | 0x50000;
  *(_QWORD *)v131 = &off_1E3D30D70;
  *(_QWORD *)&v131[8] = a1;
  v132 = v131;
  sub_19C3168D8((uint64_t)v20, v42, (uint64_t)v131);
  v43 = v132;
  if (v132 == v131)
  {
    v44 = 4;
    v43 = v131;
LABEL_64:
    (*(void (**)(void))(*v43 + 8 * v44))();
  }
  else if (v132)
  {
    v44 = 5;
    goto LABEL_64;
  }
  sub_19C43BBCC((uint64_t)v131, (uint64_t)v20, *(_QWORD *)(a1 + 72), v42, *(unsigned __int16 *)(a1 + 8));
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 464);
  v51 = *(_QWORD *)&v131[16];
  v50 = v132;
  v52 = *(_QWORD *)(v49 + 144);
  std::recursive_mutex::lock((std::recursive_mutex *)v49);
  v53 = operator new();
  v54 = (_QWORD *)v53;
  *(_QWORD *)v53 = &off_1E3D301C0;
  *(_QWORD *)(v53 + 8) = v52;
  *(_QWORD *)(v53 + 16) = v49;
  *(_BYTE *)(v53 + 24) = 1;
  *(_QWORD *)(v53 + 32) = v51;
  *(_QWORD *)(v53 + 40) = v50;
  *(_QWORD *)(v53 + 48) = v102;
  v55 = *(unsigned __int8 *)(v52 + 96) - 1;
  if ((uint64_t)v50 < v55)
    v55 = (uint64_t)v50;
  *(_QWORD *)(v53 + 56) = v55;
  *(_QWORD *)(v53 + 64) = 0;
  *(_QWORD *)(v53 + 88) = 0;
  *(_QWORD *)(v53 + 80) = 0;
  *(_QWORD *)(v53 + 72) = v53 + 80;
  v56 = (char *)malloc_type_calloc(1uLL, 0x83CuLL, 0x105004056F6A631uLL);
  if (v56)
  {
    *((_OWORD *)v56 + 129) = 0u;
    *((_DWORD *)v56 + 520) = 1;
    *(_QWORD *)(v56 + 2084) = 0;
    *(_QWORD *)(v56 + 2092) = 64;
  }
  v54[12] = v56;
  while (2)
  {
    v57 = (*(uint64_t (**)(_QWORD *))(*v54 + 16))(v54);
    v58 = *v54;
    if (v57)
    {
      v59 = (*(uint64_t (**)(_QWORD *, unsigned int *, int64x2_t *))(v58 + 24))(v54, v24, &v133);
      if ((v145 - 1) > 9)
        v60 = 0;
      else
        v60 = dword_19C47C4CC[v145 - 1];
      v61 = *(_QWORD *)(a1 + 72);
      LODWORD(v108) = v60;
      HIBYTE(v113) = 0;
      LOBYTE(v112) = 0;
      sub_19C4406E4(&v115, v24, v59, (uint64_t)&v133, v61, v105, v143, (int *)&v108, 0, &v112);
      v62 = v115;
      if (!v115)
        continue;
      if (v20[1] == *v20)
      {
        v65 = v115[23];
        if (v65 < 0)
        {
          v71 = *(const void **)v115;
          v72 = *((_QWORD *)v115 + 1);
          v73 = *(const void **)v115;
          v102 = v72 != 0;
          v74 = !memcmp(v73, "I", v102) && v72 == 1;
          if (v74
            || (v72 >= 3 ? (v75 = 3) : (v75 = v72),
                (v99 = v75, !memcmp(v71, "I'm", v75)) && v72 == 3
             || !memcmp(v71, "i", v102) && v72 == 1
             || !memcmp(v71, "i'm", v99) && v72 == 3))
          {
LABEL_109:
            v76 = sub_19C296378((uint64_t)v62);
            MEMORY[0x1A1AD355C](v76, 0x1032C4057ACE4D0);
            continue;
          }
        }
        else
        {
          v66 = memcmp(v115, "I", v65 != 0);
          if (v65 == 1 && !v66)
            goto LABEL_109;
          v67 = v65 >= 3u ? 3 : v65;
          v102 = v67;
          v68 = memcmp(v62, "I'm", v67);
          if (v65 == 3 && !v68)
            goto LABEL_109;
          v69 = memcmp(v62, "i", v65 != 0);
          if (v65 == 1 && !v69)
            goto LABEL_109;
          v70 = memcmp(v62, "i'm", v102);
          if (v65 == 3 && !v70)
            goto LABEL_109;
        }
      }
      v63 = *(_QWORD **)(a1 + 72);
      if (v63[31] || v63[17] != v63[16])
      {
        v64 = 1;
        if (!v104)
          goto LABEL_80;
LABEL_126:
        v115 = 0;
        v106 = 0;
        *(_QWORD *)&v112 = v62;
        v84 = v118;
        if ((unint64_t)v118 < v119)
        {
          *v118 = (uint64_t)v62;
          v118 = v84 + 1;
          v106 = 0;
        }
        else
        {
          v118 = sub_19C2F1218(&v117, (uint64_t *)&v112);
          if ((_QWORD)v112)
          {
            v85 = sub_19C296378(v112);
            MEMORY[0x1A1AD355C](v85, 0x1032C4057ACE4D0);
          }
          v106 = 0;
        }
        continue;
      }
      v64 = v63[20] != v63[19];
      if (v104)
        goto LABEL_126;
LABEL_80:
      if (!v64)
        goto LABEL_126;
      if (v62[47] < 0)
      {
        sub_19C2B5238(&v112, *((void **)v62 + 3), *((_QWORD *)v62 + 4));
      }
      else
      {
        v112 = *(_OWORD *)(v62 + 24);
        v113 = *((_QWORD *)v62 + 5);
      }
      v114 = 0;
      sub_19C297950(&v108, (const UInt8 *)&v112);
      v110 = v114;
      v130 = 0;
      sub_19C43AAE4(&v111, a1, (uint64_t)&v108, *v103, (uint64_t)&v133, 1, v129);
      v77 = v111;
      v111 = 0;
      if (v77)
        MEMORY[0x1A1AD355C](v77, 0x1000C4065B674BELL);
      v78 = v130;
      if (v130 == v129)
      {
        v78 = v129;
        v79 = 4;
LABEL_117:
        (*(void (**)(void))&(*v78)[8 * v79])();
      }
      else if (v130)
      {
        v79 = 5;
        goto LABEL_117;
      }
      if (v109 < 0)
        operator delete((void *)v108);
      v80 = *(_QWORD *)(a1 + 72);
      if ((v145 - 1) > 9)
        v81 = 0;
      else
        v81 = dword_19C47C4CC[v145 - 1];
      v107 = v81;
      v109 = 0;
      LOBYTE(v108) = 0;
      sub_19C4406E4(v129, v24, v59, (uint64_t)&v133, v80, v105, v143, &v107, 0, &v108);
      v82 = v129[0];
      v115 = v129[0];
      v83 = sub_19C296378((uint64_t)v62);
      MEMORY[0x1A1AD355C](v83, 0x1032C4057ACE4D0);
      if (SHIBYTE(v113) < 0)
        operator delete((void *)v112);
      v62 = v82;
      goto LABEL_126;
    }
    break;
  }
  (*(void (**)(_QWORD *))(v58 + 8))(v54);
LABEL_133:
  v86 = 126 - 2 * __clz(v118 - v117);
  if (v118 == v117)
    v87 = 0;
  else
    v87 = v86;
  sub_19C441BB4(v117, v118, v87, 1);
  v89 = v117;
  v88 = v118;
  if (v117 != v118)
  {
    v90 = v100;
    do
    {
      v91 = *(_QWORD *)(v90 + 24);
      if (!v91)
        sub_19C2CCC60();
      v92 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v91 + 48))(v91, v89++);
      if (v89 == v88)
        v93 = 0;
      else
        v93 = v92;
    }
    while ((v93 & 1) != 0);
    v89 = v117;
  }
  if (v89)
  {
    v94 = v118;
    v95 = v89;
    if (v118 != v89)
    {
      do
      {
        v97 = *--v94;
        v96 = v97;
        *v94 = 0;
        if (v97)
        {
          v98 = sub_19C296378(v96);
          MEMORY[0x1A1AD355C](v98, 0x1032C4057ACE4D0);
        }
      }
      while (v94 != v89);
      v95 = v117;
    }
    v118 = v89;
    operator delete(v95);
  }
  (*(void (**)(_QWORD *))(*v22 + 8))(v22);
  v48 = v121;
  if (v121)
  {
LABEL_153:
    v122 = v48;
    operator delete(v48);
  }
}

void sub_19C43EEF8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  sub_19C33275C(*(_QWORD **)(v3 + 80));
  v5 = *(_QWORD *)(v3 + 64);
  *(_QWORD *)(v3 + 64) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  if (*(_BYTE *)(v3 + 24))
    std::recursive_mutex::unlock(*(std::recursive_mutex **)(v3 + 16));
  MEMORY[0x1A1AD355C](v3, 0x10F1C40E421CF21);
  sub_19C2F0F74(v1 + 20);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v6 = (void *)v1[31];
  if (!v6)
    _Unwind_Resume(a1);
  v1[32] = v6;
  operator delete(v6);
  _Unwind_Resume(a1);
}

uint64_t sub_19C43F13C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned __int8 v5;
  int v6;
  __int16 v7;
  void *v9[2];
  uint64_t v10;
  void *__p[2];
  uint64_t v12;

  if (a2 == a1)
  {
    v5 = 0;
    v6 = 1;
  }
  else
  {
    sub_19C297950(__p, (const UInt8 *)(a2 - 32));
    if (*(_DWORD *)(a2 - 8))
    {
      v5 = 0;
      v6 = 1;
      if (SHIBYTE(v12) < 0)
        goto LABEL_11;
    }
    else
    {
      if (SHIBYTE(v12) < 0)
      {
        sub_19C2B5238(v9, __p[0], (unint64_t)__p[1]);
      }
      else
      {
        *(_OWORD *)v9 = *(_OWORD *)__p;
        v10 = v12;
      }
      v7 = sub_19C32EC10(a3, (uint64_t)v9);
      v5 = v7;
      v6 = HIBYTE(v7);
      if (SHIBYTE(v10) < 0)
      {
        operator delete(v9[0]);
        if ((SHIBYTE(v12) & 0x80000000) == 0)
          return v5 | (v6 << 8);
        goto LABEL_11;
      }
      if (SHIBYTE(v12) < 0)
LABEL_11:
        operator delete(__p[0]);
    }
  }
  return v5 | (v6 << 8);
}

void sub_19C43F214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if ((a21 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C43F260(_QWORD *a1)
{
  _QWORD *v2;

  while (1)
  {
    v2 = (_QWORD *)a1[1];
    if (*a1 >= (unint64_t)((uint64_t)(v2[1] - *v2) >> 5))
      break;
    sub_19C31618C(v2);
  }
  return a1;
}

void sub_19C43F2A0(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  int v23;
  uint64_t v24;
  void **v25;
  char v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  double v35;
  unint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  int v61;
  void **v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  double v66;
  unint64_t v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  double v71;
  int v72;
  uint64_t v73;
  int v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 *v92;
  int v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _DWORD *v103;
  BOOL v105;
  uint64_t v106;
  unint64_t v107;
  _DWORD *v108;
  double v109;
  void *v110;
  char v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  void **v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  double *v122;
  void **v123;
  int64_t v124;
  int64_t v125;
  int64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  void **v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  int64_t v141;
  BOOL v142;
  uint64_t v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  void **v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  int64_t v154;
  double *v155;
  void **v156;
  unint64_t v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  unint64_t v163;
  __int128 v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  double v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  void **v177;
  __int128 v178;
  unint64_t v179;
  unint64_t v180;
  _DWORD *v181;
  double v182;
  int v183;
  uint64_t v184;
  char v185;
  int v186;
  unint64_t v187;
  uint64_t v188;
  unint64_t v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  unint64_t v193;
  unint64_t v194;
  char v195;
  unint64_t v196;
  int *v197;
  int v198;
  int v199;
  int *v200;
  uint64_t v201;
  uint64_t v202;
  int v203;
  int *v204;
  int v205;
  int v206;
  char v207;
  uint64_t v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  int v214;
  uint64_t v215;
  char v216;
  unint64_t v217;
  _BYTE v218[15];
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  _BYTE v272[15];
  _BYTE v273[15];
  _BYTE v274[15];
  __int128 v275;
  __int128 v276;
  _BYTE v277[15];
  _BYTE v278[15];
  __int128 v279;
  _BYTE v280[15];
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;

void sub_19C4406E4(char **a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8, uint64_t a9, __int128 *a10)
{
  char **v11;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int *v17;
  void **v18;
  char v19;
  __int128 v20;
  void **v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char **v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  void **v33;
  std::string::size_type size;
  int v35;
  const std::string::value_type *v36;
  std::string::size_type v37;
  void **v38;
  std::string::size_type v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char *v43;
  void **v44;
  uint64_t v45;
  uint64_t v46;
  void *__p[2];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  int v54;
  void *__src[2];
  uint64_t v56;
  void **v57;
  void **v58;
  void **i;
  std::string v60;

  v11 = a1;
  if (!a3)
  {
    v45 = a7;
    v46 = a4;
    v18 = 0;
    memset(&v60, 0, sizeof(v60));
    v57 = 0;
    v58 = 0;
    i = 0;
LABEL_60:
    v40 = *(_OWORD *)(v46 + 80);
    v51 = *(_OWORD *)(v46 + 64);
    v52 = v40;
    v53 = *(_QWORD *)(v46 + 96);
    v41 = *(_OWORD *)(v46 + 16);
    *(_OWORD *)__p = *(_OWORD *)v46;
    v48 = v41;
    v42 = *(_OWORD *)(v46 + 48);
    v49 = *(_OWORD *)(v46 + 32);
    v50 = v42;
    v54 = *(_DWORD *)(v46 + 24) & 1 | (2 * ((*(_DWORD *)(v46 + 24) >> 8) & 1));
    v43 = (char *)operator new();
    sub_19C3077FC(v43, (__int128 *)&v60, (__int128 *)&v60, (__int128 *)__p, (uint64_t *)&v57, (uint64_t *)&v57, a10, v45, *a8, a9);
    *v11 = v43;
LABEL_61:
    v44 = v57;
    if (v57)
    {
      while (v18 != v44)
      {
        if (*((char *)v18 - 9) < 0)
          operator delete(*(v18 - 4));
        v18 -= 4;
      }
      operator delete(v44);
      if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return;
    }
    else if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      return;
    }
    operator delete(v60.__r_.__value_.__l.__data_);
    return;
  }
  v14 = a2;
  v15 = 4 * a3;
  v16 = a2;
  v17 = &a2[a3];
  while (*v16 - 3 < 0xFFFFFFFE)
  {
    ++v16;
    v15 -= 4;
    if (!v15)
    {
      v45 = a7;
      v46 = a4;
      v18 = 0;
      memset(&v60, 0, sizeof(v60));
      v57 = 0;
      v58 = 0;
      i = 0;
      while (1)
      {
        if ((*a8 & 0xFFFFFFFE) == 8)
          sub_19C3BE34C((uint64_t)__src, *(std::recursive_mutex **)(a5 + 464), *v14);
        else
          sub_19C319420((_QWORD *)a5, *v14, (uint64_t)__src);
        v19 = HIBYTE(v56);
        if (SHIBYTE(v56) < 0)
        {
          if (__src[1])
          {
            sub_19C2B5238(__p, __src[0], (unint64_t)__src[1]);
LABEL_14:
            DWORD2(v48) = 0;
            if (v18 >= i)
            {
              v23 = (uint64_t)v57;
              v24 = ((char *)v18 - (char *)v57) >> 5;
              v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 59)
                sub_19C2A18E8();
              v26 = v11;
              v27 = (char *)i - (char *)v57;
              if (((char *)i - (char *)v57) >> 4 > v25)
                v25 = v27 >> 4;
              if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0)
                v28 = 0x7FFFFFFFFFFFFFFLL;
              else
                v28 = v25;
              if (v28 >> 59)
                sub_19C2A143C();
              v29 = (char *)operator new(32 * v28);
              v30 = (uint64_t)&v29[32 * v24];
              *(_OWORD *)v30 = *(_OWORD *)__p;
              *(_QWORD *)(v30 + 16) = v48;
              v31 = &v29[32 * v28];
              __p[1] = 0;
              *(_QWORD *)&v48 = 0;
              __p[0] = 0;
              *(_DWORD *)(v30 + 24) = 0;
              v21 = (void **)(v30 + 32);
              if (v18 == (void **)v23)
              {
                v57 = (void **)v30;
                v58 = (void **)(v30 + 32);
                i = (void **)&v29[32 * v28];
                v11 = v26;
              }
              else
              {
                v11 = v26;
                do
                {
                  v32 = *((_OWORD *)v18 - 2);
                  *(_QWORD *)(v30 - 16) = *(v18 - 2);
                  *(_OWORD *)(v30 - 32) = v32;
                  *(v18 - 3) = 0;
                  *(v18 - 2) = 0;
                  *(v18 - 4) = 0;
                  *(_DWORD *)(v30 - 8) = *((_DWORD *)v18 - 2);
                  v30 -= 32;
                  v18 -= 4;
                }
                while (v18 != (void **)v23);
                v18 = v57;
                v33 = v58;
                v57 = (void **)v30;
                v58 = v21;
                for (i = (void **)v31; v33 != v18; v33 -= 4)
                {
                  if (*((char *)v33 - 9) < 0)
                    operator delete(*(v33 - 4));
                }
              }
              if (v18)
                operator delete(v18);
              v58 = v21;
              if (SBYTE7(v48) < 0)
                operator delete(__p[0]);
            }
            else
            {
              v20 = *(_OWORD *)__p;
              v18[2] = (void *)v48;
              *(_OWORD *)v18 = v20;
              *((_DWORD *)v18 + 6) = DWORD2(v48);
              v21 = v18 + 4;
              v58 = v18 + 4;
            }
            size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
            if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              size = v60.__r_.__value_.__l.__size_;
            if (size)
            {
              v35 = *(char *)(a6 + 23);
              if (v35 >= 0)
                v36 = (const std::string::value_type *)a6;
              else
                v36 = *(const std::string::value_type **)a6;
              if (v35 >= 0)
                v37 = *(unsigned __int8 *)(a6 + 23);
              else
                v37 = *(_QWORD *)(a6 + 8);
              std::string::append(&v60, v36, v37);
            }
            if (v56 >= 0)
              v38 = __src;
            else
              v38 = (void **)__src[0];
            if (v56 >= 0)
              v39 = HIBYTE(v56);
            else
              v39 = (std::string::size_type)__src[1];
            std::string::append(&v60, (const std::string::value_type *)v38, v39);
            v22 = 0;
            v18 = v21;
            if ((v56 & 0x8000000000000000) == 0)
              goto LABEL_56;
LABEL_55:
            operator delete(__src[0]);
            goto LABEL_56;
          }
        }
        else if (HIBYTE(v56))
        {
          *(_OWORD *)__p = *(_OWORD *)__src;
          *(_QWORD *)&v48 = v56;
          goto LABEL_14;
        }
        *v11 = 0;
        v22 = 1;
        if (v19 < 0)
          goto LABEL_55;
LABEL_56:
        if ((v22 & 1) != 0)
          goto LABEL_61;
        if (++v14 == v17)
          goto LABEL_60;
      }
    }
  }
  *a1 = 0;
}

void sub_19C440AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;
  uint64_t v36;

  MEMORY[0x1A1AD355C](v35, 0x1032C4057ACE4D0);
  sub_19C2E23C0((void **)(v36 - 136));
  if (*(char *)(v36 - 89) < 0)
    operator delete(*(void **)(v36 - 112));
  _Unwind_Resume(a1);
}

void **sub_19C440B54(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 17) < 0)
          operator delete(*(v3 - 5));
        v3 -= 19;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

int *sub_19C440BC4(int *result, int *a2, int *a3)
{
  _OWORD *v3;
  double v4;
  double *v5;
  double *v6;
  double v7;
  uint64_t *v8;
  int v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
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
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v3 = a2 + 2;
  v4 = *((double *)a2 + 1);
  v5 = (double *)(result + 2);
  v6 = (double *)(a3 + 2);
  v7 = *((double *)a3 + 1);
  if (v4 > *((double *)result + 1))
  {
    v8 = (uint64_t *)(result + 36);
    v9 = *result;
    v10 = (__int128 *)(result + 28);
    if (v7 <= v4)
    {
      *result = *a2;
      *a2 = v9;
      v84 = *(_OWORD *)(result + 18);
      v89 = *(_OWORD *)(result + 22);
      v94 = *((_QWORD *)result + 13);
      v64 = *(_OWORD *)v5;
      v69 = *(_OWORD *)(result + 6);
      v74 = *(_OWORD *)(result + 10);
      v79 = *(_OWORD *)(result + 14);
      v42 = *(_OWORD *)(a2 + 6);
      v41 = *(_OWORD *)(a2 + 10);
      *(_OWORD *)v5 = *v3;
      *(_OWORD *)(result + 6) = v42;
      *(_OWORD *)(result + 10) = v41;
      v44 = *(_OWORD *)(a2 + 18);
      v43 = *(_OWORD *)(a2 + 22);
      v45 = *(_OWORD *)(a2 + 14);
      *((_QWORD *)result + 13) = *((_QWORD *)a2 + 13);
      *(_OWORD *)(result + 18) = v44;
      *(_OWORD *)(result + 22) = v43;
      *(_OWORD *)(result + 14) = v45;
      *v3 = v64;
      *(_OWORD *)(a2 + 6) = v69;
      *((_QWORD *)a2 + 13) = v94;
      *(_OWORD *)(a2 + 18) = v84;
      *(_OWORD *)(a2 + 22) = v89;
      *(_OWORD *)(a2 + 10) = v74;
      *(_OWORD *)(a2 + 14) = v79;
      v46 = *((_QWORD *)result + 16);
      v47 = *v10;
      v48 = *((_QWORD *)a2 + 16);
      *v10 = *((_OWORD *)a2 + 7);
      *((_QWORD *)result + 16) = v48;
      *((_OWORD *)a2 + 7) = v47;
      *((_QWORD *)a2 + 16) = v46;
      LODWORD(v46) = result[34];
      v8 = (uint64_t *)(a2 + 36);
      v49 = *((_QWORD *)a2 + 18);
      result[34] = a2[34];
      a2[34] = v46;
      v50 = *((_QWORD *)result + 18);
      *((_QWORD *)result + 18) = v49;
      *((_QWORD *)a2 + 18) = v50;
      if (*v6 <= *((double *)a2 + 1))
        return result;
      v51 = *a2;
      *a2 = *a3;
      *a3 = v51;
      v85 = *(_OWORD *)(a2 + 18);
      v90 = *(_OWORD *)(a2 + 22);
      v95 = *((_QWORD *)a2 + 13);
      v65 = *v3;
      v70 = *(_OWORD *)(a2 + 6);
      v75 = *(_OWORD *)(a2 + 10);
      v80 = *(_OWORD *)(a2 + 14);
      v53 = *(_OWORD *)(a3 + 6);
      v52 = *(_OWORD *)(a3 + 10);
      *v3 = *(_OWORD *)v6;
      *(_OWORD *)(a2 + 6) = v53;
      *(_OWORD *)(a2 + 10) = v52;
      v55 = *(_OWORD *)(a3 + 18);
      v54 = *(_OWORD *)(a3 + 22);
      v56 = *(_OWORD *)(a3 + 14);
      *((_QWORD *)a2 + 13) = *((_QWORD *)a3 + 13);
      *(_OWORD *)(a2 + 18) = v55;
      *(_OWORD *)(a2 + 22) = v54;
      *(_OWORD *)(a2 + 14) = v56;
      *(_OWORD *)v6 = v65;
      *(_OWORD *)(a3 + 6) = v70;
      *((_QWORD *)a3 + 13) = v95;
      *(_OWORD *)(a3 + 18) = v85;
      *(_OWORD *)(a3 + 22) = v90;
      *(_OWORD *)(a3 + 10) = v75;
      *(_OWORD *)(a3 + 14) = v80;
      v57 = *((_QWORD *)a2 + 16);
      v58 = *((_OWORD *)a2 + 7);
      v59 = *((_QWORD *)a3 + 16);
      *((_OWORD *)a2 + 7) = *((_OWORD *)a3 + 7);
      *((_QWORD *)a2 + 16) = v59;
      *((_OWORD *)a3 + 7) = v58;
      *((_QWORD *)a3 + 16) = v57;
      v19 = a2[34];
      a2[34] = a3[34];
    }
    else
    {
      *result = *a3;
      *a3 = v9;
      v81 = *(_OWORD *)(result + 18);
      v86 = *(_OWORD *)(result + 22);
      v91 = *((_QWORD *)result + 13);
      v61 = *(_OWORD *)v5;
      v66 = *(_OWORD *)(result + 6);
      v71 = *(_OWORD *)(result + 10);
      v76 = *(_OWORD *)(result + 14);
      v12 = *(_OWORD *)(a3 + 6);
      v11 = *(_OWORD *)(a3 + 10);
      *(_OWORD *)v5 = *(_OWORD *)v6;
      *(_OWORD *)(result + 6) = v12;
      *(_OWORD *)(result + 10) = v11;
      v14 = *(_OWORD *)(a3 + 18);
      v13 = *(_OWORD *)(a3 + 22);
      v15 = *(_OWORD *)(a3 + 14);
      *((_QWORD *)result + 13) = *((_QWORD *)a3 + 13);
      *(_OWORD *)(result + 18) = v14;
      *(_OWORD *)(result + 22) = v13;
      *(_OWORD *)(result + 14) = v15;
      *(_OWORD *)v6 = v61;
      *(_OWORD *)(a3 + 6) = v66;
      *((_QWORD *)a3 + 13) = v91;
      *(_OWORD *)(a3 + 18) = v81;
      *(_OWORD *)(a3 + 22) = v86;
      *(_OWORD *)(a3 + 10) = v71;
      *(_OWORD *)(a3 + 14) = v76;
      v16 = *((_QWORD *)result + 16);
      v17 = *v10;
      v18 = *((_QWORD *)a3 + 16);
      *v10 = *((_OWORD *)a3 + 7);
      *((_QWORD *)result + 16) = v18;
      *((_OWORD *)a3 + 7) = v17;
      *((_QWORD *)a3 + 16) = v16;
      v19 = result[34];
      result[34] = a3[34];
    }
    v29 = (uint64_t *)(a3 + 36);
    a3[34] = v19;
    goto LABEL_10;
  }
  if (v7 > v4)
  {
    v20 = *a2;
    *a2 = *a3;
    *a3 = v20;
    v82 = *(_OWORD *)(a2 + 18);
    v87 = *(_OWORD *)(a2 + 22);
    v92 = *((_QWORD *)a2 + 13);
    v62 = *v3;
    v67 = *(_OWORD *)(a2 + 6);
    v72 = *(_OWORD *)(a2 + 10);
    v77 = *(_OWORD *)(a2 + 14);
    v22 = *(_OWORD *)(a3 + 6);
    v21 = *(_OWORD *)(a3 + 10);
    *v3 = *(_OWORD *)v6;
    *(_OWORD *)(a2 + 6) = v22;
    *(_OWORD *)(a2 + 10) = v21;
    v24 = *(_OWORD *)(a3 + 18);
    v23 = *(_OWORD *)(a3 + 22);
    v25 = *(_OWORD *)(a3 + 14);
    *((_QWORD *)a2 + 13) = *((_QWORD *)a3 + 13);
    *(_OWORD *)(a2 + 18) = v24;
    *(_OWORD *)(a2 + 22) = v23;
    *(_OWORD *)(a2 + 14) = v25;
    *(_OWORD *)v6 = v62;
    *(_OWORD *)(a3 + 6) = v67;
    *((_QWORD *)a3 + 13) = v92;
    *(_OWORD *)(a3 + 18) = v82;
    *(_OWORD *)(a3 + 22) = v87;
    *(_OWORD *)(a3 + 10) = v72;
    *(_OWORD *)(a3 + 14) = v77;
    v26 = *((_QWORD *)a2 + 16);
    v27 = *((_OWORD *)a2 + 7);
    v28 = *((_QWORD *)a3 + 16);
    *((_OWORD *)a2 + 7) = *((_OWORD *)a3 + 7);
    *((_QWORD *)a2 + 16) = v28;
    *((_OWORD *)a3 + 7) = v27;
    *((_QWORD *)a3 + 16) = v26;
    v29 = (uint64_t *)(a2 + 36);
    v30 = *((_QWORD *)a2 + 18);
    v31 = a2[34];
    a2[34] = a3[34];
    a3[34] = v31;
    *((_QWORD *)a2 + 18) = *((_QWORD *)a3 + 18);
    *((_QWORD *)a3 + 18) = v30;
    if (*((double *)a2 + 1) > *v5)
    {
      v32 = *result;
      *result = *a2;
      *a2 = v32;
      v83 = *(_OWORD *)(result + 18);
      v88 = *(_OWORD *)(result + 22);
      v93 = *((_QWORD *)result + 13);
      v63 = *(_OWORD *)v5;
      v68 = *(_OWORD *)(result + 6);
      v73 = *(_OWORD *)(result + 10);
      v78 = *(_OWORD *)(result + 14);
      v34 = *(_OWORD *)(a2 + 6);
      v33 = *(_OWORD *)(a2 + 10);
      *(_OWORD *)v5 = *v3;
      *(_OWORD *)(result + 6) = v34;
      *(_OWORD *)(result + 10) = v33;
      v36 = *(_OWORD *)(a2 + 18);
      v35 = *(_OWORD *)(a2 + 22);
      v37 = *(_OWORD *)(a2 + 14);
      *((_QWORD *)result + 13) = *((_QWORD *)a2 + 13);
      *(_OWORD *)(result + 18) = v36;
      *(_OWORD *)(result + 22) = v35;
      *(_OWORD *)(result + 14) = v37;
      *v3 = v63;
      *(_OWORD *)(a2 + 6) = v68;
      *((_QWORD *)a2 + 13) = v93;
      *(_OWORD *)(a2 + 18) = v83;
      *(_OWORD *)(a2 + 22) = v88;
      *(_OWORD *)(a2 + 10) = v73;
      *(_OWORD *)(a2 + 14) = v78;
      v38 = *((_QWORD *)result + 16);
      v39 = *((_OWORD *)result + 7);
      v40 = *((_QWORD *)a2 + 16);
      *((_OWORD *)result + 7) = *((_OWORD *)a2 + 7);
      *((_QWORD *)result + 16) = v40;
      *((_OWORD *)a2 + 7) = v39;
      *((_QWORD *)a2 + 16) = v38;
      LODWORD(v38) = result[34];
      result[34] = a2[34];
      v8 = (uint64_t *)(result + 36);
      a2[34] = v38;
LABEL_10:
      v60 = *v8;
      *v8 = *v29;
      *v29 = v60;
    }
  }
  return result;
}

__n128 sub_19C440FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v8;
  __n128 result;
  __int128 *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  sub_19C440BC4((int *)a1, (int *)a2, (int *)a3);
  v8 = (__int128 *)(a4 + 8);
  result.n128_u64[0] = *(_QWORD *)(a4 + 8);
  v10 = (__int128 *)(a3 + 8);
  if (result.n128_f64[0] > *(double *)(a3 + 8))
  {
    v11 = *(_DWORD *)a3;
    *(_DWORD *)a3 = *(_DWORD *)a4;
    *(_DWORD *)a4 = v11;
    v52 = *(_OWORD *)(a3 + 72);
    v55 = *(_OWORD *)(a3 + 88);
    v58 = *(_QWORD *)(a3 + 104);
    v40 = *v10;
    v43 = *(_OWORD *)(a3 + 24);
    v46 = *(_OWORD *)(a3 + 40);
    v49 = *(_OWORD *)(a3 + 56);
    v13 = *(_OWORD *)(a4 + 24);
    v12 = *(_OWORD *)(a4 + 40);
    *v10 = *v8;
    *(_OWORD *)(a3 + 24) = v13;
    *(_OWORD *)(a3 + 40) = v12;
    v15 = *(_OWORD *)(a4 + 72);
    v14 = *(_OWORD *)(a4 + 88);
    v16 = *(_OWORD *)(a4 + 56);
    *(_QWORD *)(a3 + 104) = *(_QWORD *)(a4 + 104);
    *(_OWORD *)(a3 + 72) = v15;
    *(_OWORD *)(a3 + 88) = v14;
    *(_OWORD *)(a3 + 56) = v16;
    *v8 = v40;
    *(_OWORD *)(a4 + 24) = v43;
    *(_QWORD *)(a4 + 104) = v58;
    *(_OWORD *)(a4 + 72) = v52;
    *(_OWORD *)(a4 + 88) = v55;
    *(_OWORD *)(a4 + 40) = v46;
    *(_OWORD *)(a4 + 56) = v49;
    v17 = *(_QWORD *)(a3 + 128);
    result = *(__n128 *)(a3 + 112);
    v18 = *(_QWORD *)(a4 + 128);
    *(_OWORD *)(a3 + 112) = *(_OWORD *)(a4 + 112);
    *(_QWORD *)(a3 + 128) = v18;
    *(__n128 *)(a4 + 112) = result;
    *(_QWORD *)(a4 + 128) = v17;
    LODWORD(v17) = *(_DWORD *)(a3 + 136);
    *(_DWORD *)(a3 + 136) = *(_DWORD *)(a4 + 136);
    *(_DWORD *)(a4 + 136) = v17;
    v19 = *(_QWORD *)(a3 + 144);
    *(_QWORD *)(a3 + 144) = *(_QWORD *)(a4 + 144);
    *(_QWORD *)(a4 + 144) = v19;
    result.n128_u64[0] = *(_QWORD *)(a3 + 8);
    v20 = (__int128 *)(a2 + 8);
    if (result.n128_f64[0] > *(double *)(a2 + 8))
    {
      v21 = *(_DWORD *)a2;
      *(_DWORD *)a2 = *(_DWORD *)a3;
      *(_DWORD *)a3 = v21;
      v53 = *(_OWORD *)(a2 + 72);
      v56 = *(_OWORD *)(a2 + 88);
      v59 = *(_QWORD *)(a2 + 104);
      v41 = *v20;
      v44 = *(_OWORD *)(a2 + 24);
      v47 = *(_OWORD *)(a2 + 40);
      v50 = *(_OWORD *)(a2 + 56);
      v23 = *(_OWORD *)(a3 + 24);
      v22 = *(_OWORD *)(a3 + 40);
      *v20 = *v10;
      *(_OWORD *)(a2 + 24) = v23;
      *(_OWORD *)(a2 + 40) = v22;
      v25 = *(_OWORD *)(a3 + 72);
      v24 = *(_OWORD *)(a3 + 88);
      v26 = *(_OWORD *)(a3 + 56);
      *(_QWORD *)(a2 + 104) = *(_QWORD *)(a3 + 104);
      *(_OWORD *)(a2 + 72) = v25;
      *(_OWORD *)(a2 + 88) = v24;
      *(_OWORD *)(a2 + 56) = v26;
      *v10 = v41;
      *(_OWORD *)(a3 + 24) = v44;
      *(_QWORD *)(a3 + 104) = v59;
      *(_OWORD *)(a3 + 72) = v53;
      *(_OWORD *)(a3 + 88) = v56;
      *(_OWORD *)(a3 + 40) = v47;
      *(_OWORD *)(a3 + 56) = v50;
      v27 = *(_QWORD *)(a2 + 128);
      result = *(__n128 *)(a2 + 112);
      v28 = *(_QWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 112) = *(_OWORD *)(a3 + 112);
      *(_QWORD *)(a2 + 128) = v28;
      *(__n128 *)(a3 + 112) = result;
      *(_QWORD *)(a3 + 128) = v27;
      LODWORD(v27) = *(_DWORD *)(a2 + 136);
      *(_DWORD *)(a2 + 136) = *(_DWORD *)(a3 + 136);
      *(_DWORD *)(a3 + 136) = v27;
      v29 = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a2 + 144) = *(_QWORD *)(a3 + 144);
      *(_QWORD *)(a3 + 144) = v29;
      result.n128_u64[0] = *(_QWORD *)(a2 + 8);
      v30 = (__int128 *)(a1 + 8);
      if (result.n128_f64[0] > *(double *)(a1 + 8))
      {
        v31 = *(_DWORD *)a1;
        *(_DWORD *)a1 = *(_DWORD *)a2;
        *(_DWORD *)a2 = v31;
        v54 = *(_OWORD *)(a1 + 72);
        v57 = *(_OWORD *)(a1 + 88);
        v60 = *(_QWORD *)(a1 + 104);
        v42 = *v30;
        v45 = *(_OWORD *)(a1 + 24);
        v48 = *(_OWORD *)(a1 + 40);
        v51 = *(_OWORD *)(a1 + 56);
        v33 = *(_OWORD *)(a2 + 24);
        v32 = *(_OWORD *)(a2 + 40);
        *v30 = *v20;
        *(_OWORD *)(a1 + 24) = v33;
        *(_OWORD *)(a1 + 40) = v32;
        v35 = *(_OWORD *)(a2 + 72);
        v34 = *(_OWORD *)(a2 + 88);
        v36 = *(_OWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 72) = v35;
        *(_OWORD *)(a1 + 88) = v34;
        *(_OWORD *)(a1 + 56) = v36;
        *v20 = v42;
        *(_OWORD *)(a2 + 24) = v45;
        *(_QWORD *)(a2 + 104) = v60;
        *(_OWORD *)(a2 + 72) = v54;
        *(_OWORD *)(a2 + 88) = v57;
        *(_OWORD *)(a2 + 40) = v48;
        *(_OWORD *)(a2 + 56) = v51;
        v37 = *(_QWORD *)(a1 + 128);
        result = *(__n128 *)(a1 + 112);
        v38 = *(_QWORD *)(a2 + 128);
        *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
        *(_QWORD *)(a1 + 128) = v38;
        *(__n128 *)(a2 + 112) = result;
        *(_QWORD *)(a2 + 128) = v37;
        LODWORD(v37) = *(_DWORD *)(a1 + 136);
        *(_DWORD *)(a1 + 136) = *(_DWORD *)(a2 + 136);
        *(_DWORD *)(a2 + 136) = v37;
        v39 = *(_QWORD *)(a1 + 144);
        *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
        *(_QWORD *)(a2 + 144) = v39;
      }
    }
  }
  return result;
}

__n128 sub_19C441274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 *v10;
  __n128 result;
  __int128 *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  sub_19C440FC0(a1, a2, a3, a4);
  v10 = (__int128 *)(a5 + 8);
  result.n128_u64[0] = *(_QWORD *)(a5 + 8);
  v12 = (__int128 *)(a4 + 8);
  if (result.n128_f64[0] > *(double *)(a4 + 8))
  {
    v13 = *(_DWORD *)a4;
    *(_DWORD *)a4 = *(_DWORD *)a5;
    *(_DWORD *)a5 = v13;
    v68 = *(_OWORD *)(a4 + 72);
    v72 = *(_OWORD *)(a4 + 88);
    v76 = *(_QWORD *)(a4 + 104);
    v52 = *v12;
    v56 = *(_OWORD *)(a4 + 24);
    v60 = *(_OWORD *)(a4 + 40);
    v64 = *(_OWORD *)(a4 + 56);
    v15 = *(_OWORD *)(a5 + 24);
    v14 = *(_OWORD *)(a5 + 40);
    *v12 = *v10;
    *(_OWORD *)(a4 + 24) = v15;
    *(_OWORD *)(a4 + 40) = v14;
    v17 = *(_OWORD *)(a5 + 72);
    v16 = *(_OWORD *)(a5 + 88);
    v18 = *(_OWORD *)(a5 + 56);
    *(_QWORD *)(a4 + 104) = *(_QWORD *)(a5 + 104);
    *(_OWORD *)(a4 + 72) = v17;
    *(_OWORD *)(a4 + 88) = v16;
    *(_OWORD *)(a4 + 56) = v18;
    *v10 = v52;
    *(_OWORD *)(a5 + 24) = v56;
    *(_QWORD *)(a5 + 104) = v76;
    *(_OWORD *)(a5 + 72) = v68;
    *(_OWORD *)(a5 + 88) = v72;
    *(_OWORD *)(a5 + 40) = v60;
    *(_OWORD *)(a5 + 56) = v64;
    v19 = *(_QWORD *)(a4 + 128);
    result = *(__n128 *)(a4 + 112);
    v20 = *(_QWORD *)(a5 + 128);
    *(_OWORD *)(a4 + 112) = *(_OWORD *)(a5 + 112);
    *(_QWORD *)(a4 + 128) = v20;
    *(__n128 *)(a5 + 112) = result;
    *(_QWORD *)(a5 + 128) = v19;
    LODWORD(v19) = *(_DWORD *)(a4 + 136);
    *(_DWORD *)(a4 + 136) = *(_DWORD *)(a5 + 136);
    *(_DWORD *)(a5 + 136) = v19;
    v21 = *(_QWORD *)(a4 + 144);
    *(_QWORD *)(a4 + 144) = *(_QWORD *)(a5 + 144);
    *(_QWORD *)(a5 + 144) = v21;
    result.n128_u64[0] = *(_QWORD *)(a4 + 8);
    v22 = (__int128 *)(a3 + 8);
    if (result.n128_f64[0] > *(double *)(a3 + 8))
    {
      v23 = *(_DWORD *)a3;
      *(_DWORD *)a3 = *(_DWORD *)a4;
      *(_DWORD *)a4 = v23;
      v69 = *(_OWORD *)(a3 + 72);
      v73 = *(_OWORD *)(a3 + 88);
      v77 = *(_QWORD *)(a3 + 104);
      v53 = *v22;
      v57 = *(_OWORD *)(a3 + 24);
      v61 = *(_OWORD *)(a3 + 40);
      v65 = *(_OWORD *)(a3 + 56);
      v25 = *(_OWORD *)(a4 + 24);
      v24 = *(_OWORD *)(a4 + 40);
      *v22 = *v12;
      *(_OWORD *)(a3 + 24) = v25;
      *(_OWORD *)(a3 + 40) = v24;
      v27 = *(_OWORD *)(a4 + 72);
      v26 = *(_OWORD *)(a4 + 88);
      v28 = *(_OWORD *)(a4 + 56);
      *(_QWORD *)(a3 + 104) = *(_QWORD *)(a4 + 104);
      *(_OWORD *)(a3 + 72) = v27;
      *(_OWORD *)(a3 + 88) = v26;
      *(_OWORD *)(a3 + 56) = v28;
      *v12 = v53;
      *(_OWORD *)(a4 + 24) = v57;
      *(_QWORD *)(a4 + 104) = v77;
      *(_OWORD *)(a4 + 72) = v69;
      *(_OWORD *)(a4 + 88) = v73;
      *(_OWORD *)(a4 + 40) = v61;
      *(_OWORD *)(a4 + 56) = v65;
      v29 = *(_QWORD *)(a3 + 128);
      result = *(__n128 *)(a3 + 112);
      v30 = *(_QWORD *)(a4 + 128);
      *(_OWORD *)(a3 + 112) = *(_OWORD *)(a4 + 112);
      *(_QWORD *)(a3 + 128) = v30;
      *(__n128 *)(a4 + 112) = result;
      *(_QWORD *)(a4 + 128) = v29;
      LODWORD(v29) = *(_DWORD *)(a3 + 136);
      *(_DWORD *)(a3 + 136) = *(_DWORD *)(a4 + 136);
      *(_DWORD *)(a4 + 136) = v29;
      v31 = *(_QWORD *)(a3 + 144);
      *(_QWORD *)(a3 + 144) = *(_QWORD *)(a4 + 144);
      *(_QWORD *)(a4 + 144) = v31;
      result.n128_u64[0] = *(_QWORD *)(a3 + 8);
      v32 = (__int128 *)(a2 + 8);
      if (result.n128_f64[0] > *(double *)(a2 + 8))
      {
        v33 = *(_DWORD *)a2;
        *(_DWORD *)a2 = *(_DWORD *)a3;
        *(_DWORD *)a3 = v33;
        v70 = *(_OWORD *)(a2 + 72);
        v74 = *(_OWORD *)(a2 + 88);
        v78 = *(_QWORD *)(a2 + 104);
        v54 = *v32;
        v58 = *(_OWORD *)(a2 + 24);
        v62 = *(_OWORD *)(a2 + 40);
        v66 = *(_OWORD *)(a2 + 56);
        v35 = *(_OWORD *)(a3 + 24);
        v34 = *(_OWORD *)(a3 + 40);
        *v32 = *v22;
        *(_OWORD *)(a2 + 24) = v35;
        *(_OWORD *)(a2 + 40) = v34;
        v37 = *(_OWORD *)(a3 + 72);
        v36 = *(_OWORD *)(a3 + 88);
        v38 = *(_OWORD *)(a3 + 56);
        *(_QWORD *)(a2 + 104) = *(_QWORD *)(a3 + 104);
        *(_OWORD *)(a2 + 72) = v37;
        *(_OWORD *)(a2 + 88) = v36;
        *(_OWORD *)(a2 + 56) = v38;
        *v22 = v54;
        *(_OWORD *)(a3 + 24) = v58;
        *(_QWORD *)(a3 + 104) = v78;
        *(_OWORD *)(a3 + 72) = v70;
        *(_OWORD *)(a3 + 88) = v74;
        *(_OWORD *)(a3 + 40) = v62;
        *(_OWORD *)(a3 + 56) = v66;
        v39 = *(_QWORD *)(a2 + 128);
        result = *(__n128 *)(a2 + 112);
        v40 = *(_QWORD *)(a3 + 128);
        *(_OWORD *)(a2 + 112) = *(_OWORD *)(a3 + 112);
        *(_QWORD *)(a2 + 128) = v40;
        *(__n128 *)(a3 + 112) = result;
        *(_QWORD *)(a3 + 128) = v39;
        LODWORD(v39) = *(_DWORD *)(a2 + 136);
        *(_DWORD *)(a2 + 136) = *(_DWORD *)(a3 + 136);
        *(_DWORD *)(a3 + 136) = v39;
        v41 = *(_QWORD *)(a2 + 144);
        *(_QWORD *)(a2 + 144) = *(_QWORD *)(a3 + 144);
        *(_QWORD *)(a3 + 144) = v41;
        result.n128_u64[0] = *(_QWORD *)(a2 + 8);
        v42 = (__int128 *)(a1 + 8);
        if (result.n128_f64[0] > *(double *)(a1 + 8))
        {
          v43 = *(_DWORD *)a1;
          *(_DWORD *)a1 = *(_DWORD *)a2;
          *(_DWORD *)a2 = v43;
          v71 = *(_OWORD *)(a1 + 72);
          v75 = *(_OWORD *)(a1 + 88);
          v79 = *(_QWORD *)(a1 + 104);
          v55 = *v42;
          v59 = *(_OWORD *)(a1 + 24);
          v63 = *(_OWORD *)(a1 + 40);
          v67 = *(_OWORD *)(a1 + 56);
          v45 = *(_OWORD *)(a2 + 24);
          v44 = *(_OWORD *)(a2 + 40);
          *v42 = *v32;
          *(_OWORD *)(a1 + 24) = v45;
          *(_OWORD *)(a1 + 40) = v44;
          v47 = *(_OWORD *)(a2 + 72);
          v46 = *(_OWORD *)(a2 + 88);
          v48 = *(_OWORD *)(a2 + 56);
          *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
          *(_OWORD *)(a1 + 72) = v47;
          *(_OWORD *)(a1 + 88) = v46;
          *(_OWORD *)(a1 + 56) = v48;
          *v32 = v55;
          *(_OWORD *)(a2 + 24) = v59;
          *(_QWORD *)(a2 + 104) = v79;
          *(_OWORD *)(a2 + 72) = v71;
          *(_OWORD *)(a2 + 88) = v75;
          *(_OWORD *)(a2 + 40) = v63;
          *(_OWORD *)(a2 + 56) = v67;
          v49 = *(_QWORD *)(a1 + 128);
          result = *(__n128 *)(a1 + 112);
          v50 = *(_QWORD *)(a2 + 128);
          *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
          *(_QWORD *)(a1 + 128) = v50;
          *(__n128 *)(a2 + 112) = result;
          *(_QWORD *)(a2 + 128) = v49;
          LODWORD(v49) = *(_DWORD *)(a1 + 136);
          *(_DWORD *)(a1 + 136) = *(_DWORD *)(a2 + 136);
          *(_DWORD *)(a2 + 136) = v49;
          v51 = *(_QWORD *)(a1 + 144);
          *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
          *(_QWORD *)(a2 + 144) = v51;
        }
      }
    }
  }
  return result;
}

BOOL sub_19C4415FC(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void **v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double *v35;
  void **v36;
  int v37;
  char v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _BYTE v53[15];

  v4 = 0x86BCA1AF286BCA1BLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 144);
      v7 = (__int128 *)(a1 + 8);
      if (*(double *)(a2 - 144) > *(double *)(a1 + 8))
      {
        v8 = *(_DWORD *)a1;
        *(_DWORD *)a1 = *(_DWORD *)(a2 - 152);
        *(_DWORD *)(a2 - 152) = v8;
        v48 = *(_OWORD *)(a1 + 72);
        v50 = *(_OWORD *)(a1 + 88);
        v52 = *(_QWORD *)(a1 + 104);
        v40 = *v7;
        v42 = *(_OWORD *)(a1 + 24);
        v44 = *(_OWORD *)(a1 + 40);
        v46 = *(_OWORD *)(a1 + 56);
        v10 = *(_OWORD *)(a2 - 128);
        v9 = *(_OWORD *)(a2 - 112);
        *v7 = *v6;
        *(_OWORD *)(a1 + 24) = v10;
        *(_OWORD *)(a1 + 40) = v9;
        v12 = *(_OWORD *)(a2 - 80);
        v11 = *(_OWORD *)(a2 - 64);
        v13 = *(_OWORD *)(a2 - 96);
        *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 - 48);
        *(_OWORD *)(a1 + 72) = v12;
        *(_OWORD *)(a1 + 88) = v11;
        *(_OWORD *)(a1 + 56) = v13;
        *v6 = v40;
        *(_OWORD *)(a2 - 128) = v42;
        *(_QWORD *)(a2 - 48) = v52;
        *(_OWORD *)(a2 - 80) = v48;
        *(_OWORD *)(a2 - 64) = v50;
        *(_OWORD *)(a2 - 112) = v44;
        *(_OWORD *)(a2 - 96) = v46;
        v14 = *(_QWORD *)(a1 + 128);
        v15 = *(_OWORD *)(a1 + 112);
        v16 = *(_QWORD *)(a2 - 24);
        *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 - 40);
        *(_QWORD *)(a1 + 128) = v16;
        *(_OWORD *)(a2 - 40) = v15;
        *(_QWORD *)(a2 - 24) = v14;
        LODWORD(v14) = *(_DWORD *)(a1 + 136);
        *(_DWORD *)(a1 + 136) = *(_DWORD *)(a2 - 16);
        *(_DWORD *)(a2 - 16) = v14;
        v17 = *(_QWORD *)(a1 + 144);
        *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 - 8);
        *(_QWORD *)(a2 - 8) = v17;
      }
      return result;
    case 3uLL:
      sub_19C440BC4((int *)a1, (int *)(a1 + 152), (int *)(a2 - 152));
      return 1;
    case 4uLL:
      sub_19C440FC0(a1, a1 + 152, a1 + 304, a2 - 152);
      return 1;
    case 5uLL:
      sub_19C441274(a1, a1 + 152, a1 + 304, a1 + 456, a2 - 152);
      return 1;
    default:
      v18 = a1 + 304;
      sub_19C440BC4((int *)a1, (int *)(a1 + 152), (int *)(a1 + 304));
      v19 = a1 + 456;
      if (a1 + 456 == a2)
        return 1;
      v20 = 0;
      v21 = 0;
      break;
  }
  while (1)
  {
    v22 = *(double *)(v19 + 8);
    if (v22 > *(double *)(v18 + 8))
    {
      v23 = *(_DWORD *)v19;
      v45 = *(_OWORD *)(v19 + 48);
      v47 = *(_OWORD *)(v19 + 64);
      v49 = *(_OWORD *)(v19 + 80);
      v51 = *(_OWORD *)(v19 + 96);
      v41 = *(_OWORD *)(v19 + 16);
      v43 = *(_OWORD *)(v19 + 32);
      v39 = *(void **)(v19 + 112);
      *(_QWORD *)v53 = *(_QWORD *)(v19 + 120);
      *(_QWORD *)&v53[7] = *(_QWORD *)(v19 + 127);
      v24 = *(_BYTE *)(v19 + 135);
      *(_QWORD *)(v19 + 112) = 0;
      *(_QWORD *)(v19 + 120) = 0;
      *(_QWORD *)(v19 + 128) = 0;
      v37 = *(_DWORD *)(v19 + 136);
      v38 = v24;
      v25 = v20;
      v26 = *(_QWORD *)(v19 + 144);
      while (1)
      {
        v27 = a1 + v25;
        *(_DWORD *)(v27 + 456) = *(_DWORD *)(a1 + v25 + 304);
        *(_QWORD *)(v27 + 560) = *(_QWORD *)(a1 + v25 + 408);
        v28 = *(_OWORD *)(a1 + v25 + 392);
        *(_OWORD *)(v27 + 528) = *(_OWORD *)(a1 + v25 + 376);
        *(_OWORD *)(v27 + 544) = v28;
        v29 = *(_OWORD *)(a1 + v25 + 328);
        *(_OWORD *)(v27 + 464) = *(_OWORD *)(a1 + v25 + 312);
        *(_OWORD *)(v27 + 480) = v29;
        v30 = *(_OWORD *)(a1 + v25 + 360);
        *(_OWORD *)(v27 + 496) = *(_OWORD *)(a1 + v25 + 344);
        *(_OWORD *)(v27 + 512) = v30;
        v31 = (void **)(a1 + v25 + 568);
        if (*(char *)(a1 + v25 + 591) < 0)
          operator delete(*v31);
        *(_OWORD *)v31 = *(_OWORD *)(v27 + 416);
        *(_QWORD *)(a1 + v25 + 584) = *(_QWORD *)(v27 + 432);
        *(_BYTE *)(v27 + 439) = 0;
        *(_BYTE *)(v27 + 416) = 0;
        *(_DWORD *)(v27 + 592) = *(_DWORD *)(v27 + 440);
        *(_QWORD *)(v27 + 600) = *(_QWORD *)(v27 + 448);
        if (v25 == -304)
          break;
        v32 = a1 + v25;
        v33 = *(double *)(a1 + v25 + 160);
        v25 -= 152;
        if (v22 <= v33)
        {
          v34 = a1 + v25 + 456;
          v35 = (double *)(v32 + 312);
          v36 = (void **)(v32 + 416);
          goto LABEL_16;
        }
      }
      v35 = (double *)(a1 + 8);
      v36 = (void **)(a1 + 112);
      v34 = a1;
LABEL_16:
      *(_DWORD *)v34 = v23;
      *v35 = v22;
      *(_OWORD *)(v34 + 16) = v41;
      *(_OWORD *)(v34 + 32) = v43;
      *(_OWORD *)(v34 + 80) = v49;
      *(_OWORD *)(v34 + 96) = v51;
      *(_OWORD *)(v34 + 48) = v45;
      *(_OWORD *)(v34 + 64) = v47;
      if (*(char *)(v34 + 135) < 0)
        operator delete(*v36);
      *v36 = v39;
      *(_QWORD *)(v34 + 120) = *(_QWORD *)v53;
      *(_QWORD *)(v34 + 127) = *(_QWORD *)&v53[7];
      *(_BYTE *)(v34 + 135) = v38;
      *(_DWORD *)(v34 + 136) = v37;
      *(_QWORD *)(v34 + 144) = v26;
      if (++v21 == 8)
        return v19 + 152 == a2;
    }
    v18 = v19;
    v20 += 152;
    v19 += 152;
    if (v19 == a2)
      return 1;
  }
}

os_log_t sub_19C4419A8()
{
  os_log_t result;

  result = os_log_create("com.apple.LanguageModeling", "Prediction");
  qword_1EE41C5C8 = (uint64_t)result;
  return result;
}

void sub_19C4419D8()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C4419EC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30CC0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C441A20(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30CC0;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C441A3C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C441A64(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticCont"
                     "extERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerato"
                     "r16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_2"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17Lin"
                                "guisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29Compos"
                                "itePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C441AB8()
{
  return &unk_1E3D33690;
}

void sub_19C441AC8()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C441ADC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30C68;
  result[1] = v3;
  return result;
}

uint64_t sub_19C441B10(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30C68;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C441B2C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C441B54(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticCont"
                     "extERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerato"
                     "r16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_1"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17Lin"
                                "guisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29Compos"
                                "itePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession20enumeratePredictionsERKNS0_17LinguisticContextERKNSt3__16vectorINS0_14CompletionStemENS5_9allocatorIS7_EEEEmN2LM29CompositePredictionEnumerator16PredictionSubsetERKNS5_8functionIFbRKNS0_10PredictionEEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C441BA8()
{
  return &unk_1E3D33680;
}

void sub_19C441BB4(uint64_t *a1, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  BOOL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  BOOL v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t i;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  int64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t *v141;

BOOL sub_19C442648(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *a1;
      if (*(double *)(*(a2 - 1) + 48) > *(double *)(*a1 + 48))
      {
        *a1 = 0;
        v7 = *(a2 - 1);
        *(a2 - 1) = 0;
        v8 = *a1;
        *a1 = v7;
        if (v8)
        {
          v9 = sub_19C296378(v8);
          MEMORY[0x1A1AD355C](v9, 0x1032C4057ACE4D0);
        }
        v10 = *(a2 - 1);
        *(a2 - 1) = v6;
        if (v10)
        {
          v11 = sub_19C296378(v10);
          MEMORY[0x1A1AD355C](v11, 0x1032C4057ACE4D0);
        }
        return 1;
      }
      return result;
    case 3:
      sub_19C30D0D4(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_19C30D2CC(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_19C30D45C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v12 = a1 + 2;
      sub_19C30D0D4(a1, a1 + 1, a1 + 2);
      v13 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v14 = 0;
      v15 = 16;
      break;
  }
  while (1)
  {
    v16 = *v13;
    v17 = *v12;
    if (*(double *)(*v13 + 48) > *(double *)(*v12 + 48))
    {
      v18 = 0;
      *v13 = 0;
      for (i = v15; ; i -= 8)
      {
        v20 = (uint64_t *)((char *)a1 + i);
        *v20 = 0;
        v20[1] = v17;
        if (v18)
        {
          v21 = sub_19C296378(v18);
          MEMORY[0x1A1AD355C](v21, 0x1032C4057ACE4D0);
        }
        if (!i)
          break;
        v22 = (uint64_t *)((char *)a1 + i);
        v17 = *(uint64_t *)((char *)a1 + i - 8);
        if (*(double *)(v16 + 48) <= *(double *)(v17 + 48))
          goto LABEL_19;
        v18 = *v20;
      }
      v22 = a1;
LABEL_19:
      v23 = *v22;
      *v22 = v16;
      if (v23)
      {
        v24 = sub_19C296378(v23);
        MEMORY[0x1A1AD355C](v24, 0x1032C4057ACE4D0);
      }
      if (++v14 == 8)
        return v13 + 1 == a2;
    }
    v12 = v13;
    v15 += 8;
    if (++v13 == a2)
      return 1;
  }
}

void sub_19C442864()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C442878(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30D70;
  result[1] = v3;
  return result;
}

uint64_t sub_19C4428AC(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30D70;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C4428C8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 112)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C4428F0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticCon"
                     "textEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_4"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17Li"
                                "nguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functi"
                                "onIFbRKNS0_10PredictionEEEEE3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_4")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C442944()
{
  return &unk_1E3D30140;
}

void sub_19C442954()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C442968(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30D18;
  result[1] = v3;
  return result;
}

uint64_t sub_19C44299C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30D18;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C4429B8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C4429E0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticCon"
                     "textEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_3"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17Li"
                                "nguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functi"
                                "onIFbRKNS0_10PredictionEEEEE3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_3")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession21_enumeratePredictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetElRKNSt3__18functionIFbRKNS0_10PredictionEEEEE3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C442A34()
{
  return &unk_1E3D30130;
}

void sub_19C442A44()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C442A58(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E3D39240;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_19C442A90(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D39240;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL sub_19C442AB0(uint64_t a1, __int128 **a2)
{
  uint64_t v3;
  char **v4;
  __int128 *v5;
  char *v6;
  char **v7;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(char ***)(v3 + 8);
  v5 = *a2;
  if ((unint64_t)v4 >= *(_QWORD *)(v3 + 16))
  {
    v7 = sub_19C30E95C(*(char ****)(a1 + 8), *a2);
  }
  else
  {
    v6 = (char *)operator new();
    sub_19C29769C(v6, v5);
    *v4 = v6;
    v7 = v4 + 1;
  }
  *(_QWORD *)(v3 + 8) = v7;
  return **(_QWORD **)(a1 + 16) > (unint64_t)((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8)
                                                             - **(_QWORD **)(a1 + 8)) >> 3);
}

void sub_19C442B48(void *a1)
{
  uint64_t v1;

  MEMORY[0x1A1AD355C](v1, 0x1032C4057ACE4D0);
  sub_19C2CDAC8(a1);
}

uint64_t sub_19C442B70(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession11predictionsERKNS0_17LinguisticContextEmN2LM"
                     "29CompositePredictionEnumerator16PredictionSubsetEE3$_0"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession11predictionsERKNS0_17LinguisticCo"
                                "ntextEmN2LM29CompositePredictionEnumerator16PredictionSubsetEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession11predictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession11predictionsERKNS0_17LinguisticContextEmN2LM29CompositePredictionEnumerator16PredictionSubsetEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C442BC4()
{
  return &unk_1E3D33670;
}

void ***sub_19C442BD0(void ***result, uint64_t a2, uint64_t *a3, _QWORD *a4, uint64_t *a5, _QWORD *a6, int a7, _QWORD *a8)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _QWORD *v26;
  uint64_t v27;
  double *v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 **v40;
  __int128 **v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  __int128 **v48;
  unint64_t v49;
  __int128 **v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  __int128 **v55;
  char *v56;
  __int128 **v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 *v61;
  __int128 **v62;
  uint64_t v63;
  uint64_t v64;
  void **v65;
  char *v66;
  void ***v67;
  __int128 **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  const char *v74;
  int v75;
  int64x2_t v77;
  void ***v78;
  void *v85[2];
  char v86;
  int v87;
  void *v88[2];
  char v89;
  int v90;
  double *v91;
  uint64_t v92;
  __int128 **v93;
  __int128 **v94;
  __int128 **v95;
  void ***v96;
  void *__p[2];
  uint64_t v98;
  int v99;
  char v100;
  __int128 v101;
  int v102;
  __int128 v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[3];
  _QWORD *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  v8 = *a3;
  v9 = a3[1];
  v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - *a3) >> 3);
  v78 = result;
  if (v10 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3))
  {
    v74 = "tokens.size() == tokensMetadata.size()";
    v75 = 216;
    goto LABEL_86;
  }
  v11 = a6;
  if (v10 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a6[1] - *a6) >> 3))
  {
    v74 = "tokens.size() == scoreInfos.size()";
    v75 = 217;
LABEL_86:
    __assert_rtn("combinedConditionalProbability", "TokenIDLanguageModelSession.cpp", v75, v74);
  }
  if (v9 != v8)
  {
    v12 = a4;
    v13 = a3;
    v14 = 0;
    v77 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    while (1)
    {
      v15 = (uint64_t)(*(_QWORD *)(v8 + 24 * v14 + 8) - *(_QWORD *)(v8 + 24 * v14)) >> 5;
      if (v15 != (uint64_t)(*(_QWORD *)(*v12 + 24 * v14 + 8) - *(_QWORD *)(*v12 + 24 * v14)) >> 1)
        break;
      if (v15 != 0x4EC4EC4EC4EC4EC5
                * ((uint64_t)(*(_QWORD *)(*v11 + 24 * v14 + 8) - *(_QWORD *)(*v11 + 24 * v14)) >> 3))
      {
        v72 = 220;
        v73 = "tokens[candidate].size() == scoreInfos[candidate].size()";
LABEL_83:
        __assert_rtn("combinedConditionalProbability", "TokenIDLanguageModelSession.cpp", v72, v73);
      }
      v16 = *a5;
      v17 = operator new();
      sub_19C2967D8(v17, v16);
      v95 = 0;
      v96 = (void ***)v17;
      v93 = 0;
      v94 = 0;
      v18 = *(_QWORD *)(*v13 + 24 * v14);
      if (*(_QWORD *)(*v13 + 24 * v14 + 8) != v18)
      {
        v19 = 0;
        while (1)
        {
          v21 = *(_QWORD *)(*v12 + 24 * v14);
          if (*(_BYTE *)(v21 + 2 * v19))
          {
            sub_19C43AAE4(&v92, a2, v18 + 32 * v19, (uint64_t)v96, *(_QWORD *)(*v11 + 24 * v14) + 104 * v19, 1, a8);
            v22 = v92;
            v92 = 0;
            if (v22)
              MEMORY[0x1A1AD355C](v22, 0x1000C4065B674BELL);
            v21 = *(_QWORD *)(*v12 + 24 * v14);
          }
          if (!*(_BYTE *)(v21 + 2 * v19 + 1))
            break;
LABEL_38:
          v31 = *(_QWORD *)(*v11 + 24 * v14);
          v32 = operator new();
          v33 = v32;
          v34 = (__int128 *)(v31 + 104 * v19);
          v35 = *v34;
          v36 = v34[2];
          *(_OWORD *)(v32 + 16) = v34[1];
          *(_OWORD *)(v32 + 32) = v36;
          *(_OWORD *)v32 = v35;
          v37 = v34[3];
          v38 = v34[4];
          v39 = v34[5];
          *(_QWORD *)(v32 + 96) = *((_QWORD *)v34 + 12);
          *(_OWORD *)(v32 + 64) = v38;
          *(_OWORD *)(v32 + 80) = v39;
          *(_OWORD *)(v32 + 48) = v37;
          *(_DWORD *)(v32 + 104) = *((_DWORD *)v34 + 6) & 1 | (2 * ((*((_DWORD *)v34 + 6) >> 8) & 1));
          v40 = v94;
          if (v94 >= v95)
          {
            v41 = v93;
            v42 = (char *)v94 - (char *)v93;
            v43 = v94 - v93;
            v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61)
              sub_19C2A18E8();
            v45 = (char *)v95 - (char *)v93;
            if (((char *)v95 - (char *)v93) >> 2 > v44)
              v44 = v45 >> 2;
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
              v46 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v46 = v44;
            if (v46)
            {
              if (v46 >> 61)
                sub_19C2A143C();
              v47 = (char *)operator new(8 * v46);
            }
            else
            {
              v47 = 0;
            }
            v48 = (__int128 **)&v47[8 * v43];
            *v48 = (__int128 *)v33;
            if (v40 == v41)
            {
              v93 = (__int128 **)&v47[8 * v43];
              v95 = (__int128 **)&v47[8 * v46];
            }
            else
            {
              v49 = (char *)v40 - (char *)v41 - 8;
              if (v49 < 0x78)
              {
                v50 = (__int128 **)&v47[8 * v43];
                goto LABEL_61;
              }
              v51 = v49 >> 3;
              if (&v40[-(v49 >> 3) - 1] < v48)
              {
                v52 = (unint64_t)&v47[v42 - (v49 & 0xFFFFFFFFFFFFFFF8) - 8];
                v50 = (__int128 **)&v47[8 * v43];
                if (v52 < (unint64_t)v40)
                  goto LABEL_91;
              }
              v53 = v51 + 1;
              v54 = 8 * (v53 & 0x3FFFFFFFFFFFFFFCLL);
              v55 = &v40[v54 / 0xFFFFFFFFFFFFFFF8];
              v50 = &v48[v54 / 0xFFFFFFFFFFFFFFF8];
              v56 = &v47[8 * v43 - 16];
              v57 = v40 - 2;
              v58 = v53 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v60 = *((_OWORD *)v57 - 1);
                v59 = *(_OWORD *)v57;
                *((_OWORD *)v57 - 1) = 0uLL;
                *(_OWORD *)v57 = 0uLL;
                *((_OWORD *)v56 - 1) = v60;
                *(_OWORD *)v56 = v59;
                v56 -= 32;
                v57 -= 4;
                v58 -= 4;
              }
              while (v58);
              v40 = v55;
              if (v53 != (v53 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_91:
                do
                {
LABEL_61:
                  v61 = *--v40;
                  *v40 = 0;
                  *--v50 = v61;
                }
                while (v40 != v41);
              }
              v40 = v93;
              v62 = v94;
              v93 = v50;
              v95 = (__int128 **)&v47[8 * v46];
              while (v62 != v40)
              {
                v64 = (uint64_t)*--v62;
                v63 = v64;
                *v62 = 0;
                if (v64)
                  MEMORY[0x1A1AD355C](v63, 0x1000C4065B674BELL);
              }
            }
            if (v40)
              operator delete(v40);
            v40 = v48;
            v12 = a4;
            v11 = a6;
            v13 = a3;
            goto LABEL_11;
          }
          *v94 = (__int128 *)v32;
LABEL_11:
          v20 = v40 + 1;
          v94 = v40 + 1;
          ++v19;
          v18 = *(_QWORD *)(*v13 + 24 * v14);
          if (v19 >= (*(_QWORD *)(*v13 + 24 * v14 + 8) - v18) >> 5)
            goto LABEL_67;
        }
        v23 = *v13;
        v24 = *(_QWORD *)(*v13 + 24 * v14) + 32 * v19;
        if (*(char *)(v24 + 23) < 0)
        {
          sub_19C2B5238(__p, *(void **)v24, *(_QWORD *)(v24 + 8));
          v23 = *v13;
        }
        else
        {
          v25 = *(_OWORD *)v24;
          v98 = *(_QWORD *)(v24 + 16);
          *(_OWORD *)__p = v25;
        }
        v99 = *(_DWORD *)(*(_QWORD *)(v23 + 24 * v14) + 32 * v19 + 24);
        language_modeling::v1::LinguisticContext::try_push_back((uint64_t *)&v96, (uint64_t)__p);
        if (SHIBYTE(v98) < 0)
        {
          operator delete(__p[0]);
          if (!a7)
            goto LABEL_38;
        }
        else if (!a7)
        {
          goto LABEL_38;
        }
        if (v19 + 1 >= (uint64_t)(*(_QWORD *)(*v13 + 24 * v14 + 8) - *(_QWORD *)(*v13 + 24 * v14)) >> 5)
          goto LABEL_38;
        v86 = 4;
        strcpy((char *)v85, "</s>");
        v87 = 2;
        sub_19C297950(v88, (const UInt8 *)v85);
        v90 = v87;
        *(int64x2_t *)__p = v77;
        v98 = 0;
        LOWORD(v99) = 0;
        v100 = 1;
        v101 = xmmword_19C46DE10;
        v102 = 0;
        v103 = xmmword_19C46DE10;
        v104 = 0xFFEFFFFFFFFFFFFFLL;
        v105 = 0;
        v106 = 0;
        v108 = 0;
        sub_19C43AAE4((uint64_t *)&v91, a2, (uint64_t)v88, (uint64_t)v96, (uint64_t)__p, 1, v107);
        v26 = v108;
        if (v108 == v107)
        {
          v26 = v107;
          v27 = 4;
LABEL_29:
          (*(void (**)(void))(*v26 + 8 * v27))();
        }
        else if (v108)
        {
          v27 = 5;
          goto LABEL_29;
        }
        v28 = v91;
        v29 = *v91;
        v30 = __exp10f(v29);
        MEMORY[0x1A1AD355C](v28, 0x1000C4065B674BELL);
        if (v89 < 0)
        {
          operator delete(v88[0]);
          if ((v86 & 0x80000000) == 0)
            goto LABEL_32;
        }
        else if ((v86 & 0x80000000) == 0)
        {
LABEL_32:
          if (v30 <= 0.5)
            goto LABEL_38;
          goto LABEL_36;
        }
        operator delete(v85[0]);
        if (v30 <= 0.5)
          goto LABEL_38;
LABEL_36:
        HIBYTE(v98) = 3;
        LODWORD(__p[0]) = 4092732;
        v99 = 1;
        language_modeling::v1::LinguisticContext::try_push_back((uint64_t *)&v96, (uint64_t)__p);
        if (SHIBYTE(v98) < 0)
          operator delete(__p[0]);
        goto LABEL_38;
      }
      v20 = 0;
LABEL_67:
      v65 = v78[1];
      if (v65 >= v78[2])
      {
        v66 = sub_19C43A684(v78, &v93);
        v67 = v78;
      }
      else
      {
        sub_19C311AF8(v78[1], &v93);
        v66 = (char *)(v65 + 3);
        v67 = v78;
        v78[1] = v65 + 3;
      }
      v67[1] = (void **)v66;
      v68 = v93;
      if (v93)
      {
        if (v20 != v93)
        {
          do
          {
            v70 = (uint64_t)*--v20;
            v69 = v70;
            *v20 = 0;
            if (v70)
              MEMORY[0x1A1AD355C](v69, 0x1000C4065B674BELL);
          }
          while (v20 != v68);
          v20 = v93;
        }
        v94 = v68;
        operator delete(v20);
      }
      result = v96;
      if (v96)
      {
        v71 = sub_19C295FA0((uint64_t)v96);
        result = (void ***)MEMORY[0x1A1AD355C](v71, 0x10B2C4009D90DC4);
      }
      ++v14;
      v8 = *v13;
      if (v14 >= 0xAAAAAAAAAAAAAAABLL * ((v13[1] - *v13) >> 3))
        return result;
    }
    v72 = 219;
    v73 = "tokens[candidate].size() == tokensMetadata[candidate].size()";
    goto LABEL_83;
  }
  return result;
}

void sub_19C443384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;
  _QWORD *v44;
  void **v45;
  void **v46;
  void *v47;
  void **v48;
  void *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;

  v44 = a16;
  a16[1] = v42;
  sub_19C311DE4(&a39);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&a42);
  v45 = (void **)*a16;
  if (!*a16)
    _Unwind_Resume(a1);
  v46 = (void **)a16[1];
  v47 = (void *)*a16;
  if (v46 != v45)
  {
    v48 = (void **)a16[1];
    do
    {
      v51 = *(v48 - 3);
      v48 -= 3;
      v50 = v51;
      if (v51)
      {
        v52 = *(v46 - 2);
        v49 = v50;
        if (v52 != v50)
        {
          do
          {
            v54 = *--v52;
            v53 = v54;
            *v52 = 0;
            if (v54)
              MEMORY[0x1A1AD355C](v53, 0x1000C4065B674BELL);
          }
          while (v52 != v50);
          v49 = *v48;
        }
        *(v46 - 2) = v50;
        operator delete(v49);
      }
      v46 = v48;
    }
    while (v48 != v45);
    v44 = a16;
    v47 = (void *)*a16;
  }
  v44[1] = v45;
  operator delete(v47);
  _Unwind_Resume(a1);
}

void **sub_19C44354C(void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void **v15;
  void **v16;
  void *v17;

  v2 = (char *)a1[9];
  if (v2)
  {
    v3 = (char *)a1[10];
    v4 = a1[9];
    if (v3 != v2)
    {
      v5 = (char *)a1[10];
      do
      {
        v7 = (void *)*((_QWORD *)v5 - 3);
        v5 -= 24;
        v6 = v7;
        if (v7)
        {
          *((_QWORD *)v3 - 2) = v6;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = a1[9];
    }
    a1[10] = v2;
    operator delete(v4);
  }
  v8 = a1[6];
  if (v8)
  {
    a1[7] = v8;
    operator delete(v8);
  }
  v9 = (char *)a1[3];
  if (v9)
  {
    v10 = (char *)a1[4];
    v11 = a1[3];
    if (v10 != v9)
    {
      v12 = (char *)a1[4];
      do
      {
        v14 = (void *)*((_QWORD *)v12 - 3);
        v12 -= 24;
        v13 = v14;
        if (v14)
        {
          *((_QWORD *)v10 - 2) = v13;
          operator delete(v13);
        }
        v10 = v12;
      }
      while (v12 != v9);
      v11 = a1[3];
    }
    a1[4] = v9;
    operator delete(v11);
  }
  v15 = (void **)*a1;
  if (*a1)
  {
    v16 = (void **)a1[1];
    v17 = *a1;
    if (v16 != v15)
    {
      do
      {
        if (*((char *)v16 - 1) < 0)
          operator delete(*(v16 - 3));
        v16 -= 3;
      }
      while (v16 != v15);
      v17 = *a1;
    }
    a1[1] = v15;
    operator delete(v17);
  }
  return a1;
}

const __CFNumber *sub_19C443664(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID TypeID;
  int Value;
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  double valuePtr;

  if (result)
  {
    v1 = result;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      switch(CFNumberGetType(v1))
      {
        case kCFNumberSInt8Type:
          LOBYTE(valuePtr) = 0;
          Value = CFNumberGetValue(v1, kCFNumberSInt8Type, &valuePtr);
          goto LABEL_15;
        case kCFNumberSInt16Type:
          LOWORD(valuePtr) = 0;
          v9 = CFNumberGetValue(v1, kCFNumberSInt16Type, &valuePtr);
          goto LABEL_22;
        case kCFNumberSInt32Type:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberSInt64Type:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloat32Type:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberFloat32Type, &valuePtr);
          goto LABEL_29;
        case kCFNumberFloat64Type:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberFloat64Type, &valuePtr);
          goto LABEL_35;
        case kCFNumberCharType:
          LOBYTE(valuePtr) = 0;
          Value = CFNumberGetValue(v1, kCFNumberCharType, &valuePtr);
LABEL_15:
          v11 = Value != 0;
          if (Value)
            v12 = LOBYTE(valuePtr);
          else
            v12 = 0;
          v13 = -256;
          if ((v11 & (SLOBYTE(valuePtr) < 0)) == 0)
            v13 = 0;
          v8 = v11 << 32;
          LODWORD(v5) = v13 & 0xFFFFFF00 | v12;
          v7 = v5 & 0xFFFFFF00;
          break;
        case kCFNumberShortType:
          LOWORD(valuePtr) = 0;
          v9 = CFNumberGetValue(v1, kCFNumberShortType, &valuePtr);
LABEL_22:
          if (v9)
            v5 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
          else
            v5 = 0;
          goto LABEL_38;
        case kCFNumberIntType:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongLongType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberLongLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloatType:
          LODWORD(valuePtr) = 0;
          v10 = CFNumberGetValue(v1, kCFNumberFloatType, &valuePtr);
LABEL_29:
          v14 = (int)*(float *)&valuePtr;
          goto LABEL_36;
        case kCFNumberDoubleType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberDoubleType, &valuePtr);
          goto LABEL_35;
        case kCFNumberCFIndexType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
          goto LABEL_33;
        case kCFNumberNSIntegerType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberNSIntegerType, &valuePtr);
LABEL_33:
          v14 = LODWORD(valuePtr);
          goto LABEL_36;
        case kCFNumberCGFloatType:
          valuePtr = 0.0;
          v10 = CFNumberGetValue(v1, kCFNumberCGFloatType, &valuePtr);
LABEL_35:
          v14 = (int)valuePtr;
LABEL_36:
          v5 = v14 | 0x100000000;
          if (!v10)
            v5 = 0;
LABEL_38:
          v7 = v5 & 0xFFFFFF00;
          v8 = v5 & 0x100000000;
          break;
        default:
          v7 = 0;
          v8 = 0;
          LOBYTE(v5) = 0;
          break;
      }
      v6 = v8 | v7 & 0xFFFFFF00;
      v5 = v5;
    }
    else
    {
      v4 = CFBooleanGetTypeID();
      if (v4 == CFGetTypeID(v1))
      {
        v5 = CFBooleanGetValue(v1);
        v6 = 0x100000000;
      }
      else
      {
        v5 = 0;
        v6 = 0;
      }
    }
    return (const __CFNumber *)(v6 | v5);
  }
  return result;
}

BOOL sub_19C44391C(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  std::recursive_mutex *v29;
  std::__shared_weak_count *v30;
  char *v31;
  char *v32;
  int v33;
  BOOL v34;
  std::__shared_weak_count *v35;
  void *v36;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t *v38;
  unint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__dst[2];
  uint64_t v43;
  void *__p;
  std::__shared_weak_count *v45;
  char v46;
  char v47;
  uint64_t v48;
  std::__shared_weak_count *v49;

  sub_19C443CD4(&__p, a1, a2, 0x100000002);
  if (!v47)
  {
    if (sub_19C43BAA0(*(_QWORD *)(a1 + 72), a2))
    {
      v5 = *(_QWORD *)(a1 + 72);
      if (*(char *)(a2 + 23) < 0)
      {
        sub_19C2B5238(__dst, *(void **)a2, *(_QWORD *)(a2 + 8));
      }
      else
      {
        *(_OWORD *)__dst = *(_OWORD *)a2;
        v43 = *(_QWORD *)(a2 + 16);
      }
      v7 = sub_19C32FCC0(v5, (uint64_t)__dst);
      if (SHIBYTE(v43) < 0)
        operator delete(__dst[0]);
      v8 = *(_QWORD *)(a1 + 72);
      if (*(char *)(a2 + 23) < 0)
      {
        sub_19C2B5238(v40, *(void **)a2, *(_QWORD *)(a2 + 8));
      }
      else
      {
        *(_OWORD *)v40 = *(_OWORD *)a2;
        v41 = *(_QWORD *)(a2 + 16);
      }
      if (*(_BYTE *)(*(_QWORD *)(v8 + 232) + 192))
      {
        v9 = *(_QWORD *)(v8 + 48);
        v10 = *(void **)(v9 + 560);
        v11 = *(unint64_t **)(v9 + 568);
        __p = v10;
        v45 = (std::__shared_weak_count *)v11;
        if (v11)
        {
          v12 = v11 + 1;
          do
            v13 = __ldxr(v12);
          while (__stxr(v13 + 1, v12));
        }
      }
      else
      {
        v10 = 0;
        __p = 0;
        v45 = 0;
      }
      v14 = *(_QWORD *)(v8 + 48);
      v15 = *(_QWORD *)(v14 + 560);
      v16 = *(std::__shared_weak_count **)(v14 + 568);
      v48 = v15;
      v49 = v16;
      if (v16)
      {
        p_shared_owners = (unint64_t *)&v16->__shared_owners_;
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
      }
      v19 = (*(uint64_t (**)(uint64_t, void **, _QWORD))(*(_QWORD *)v15 + 24))(v15, v40, 0);
      v6 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v10 + 200))(v10, v19);
      if (v16)
      {
        v20 = (unint64_t *)&v16->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      v22 = v45;
      if (v45)
      {
        v23 = (unint64_t *)&v45->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if (SHIBYTE(v41) < 0)
      {
        operator delete(v40[0]);
        if (!*(_BYTE *)(a1 + 88))
          return v7 >= v6 + 3;
      }
      else if (!*(_BYTE *)(a1 + 88))
      {
        return v7 >= v6 + 3;
      }
    }
    else
    {
      v6 = 0;
      v7 = 0;
      if (!*(_BYTE *)(a1 + 88))
        return v7 >= v6 + 3;
    }
    v25 = *(_QWORD *)(a1 + 72);
    v26 = sub_19C3BDFF4(*(std::recursive_mutex **)(v25 + 464), a2);
    if ((_DWORD)v26)
    {
      v27 = v26;
      v28 = sub_19C3BE52C(*(std::recursive_mutex **)(v25 + 464), v26);
      v29 = *(std::recursive_mutex **)(v25 + 464);
      std::recursive_mutex::lock(v29);
      sub_19C3BE128(&__p, v29[2].__m_.__sig + 616);
      v30 = (std::__shared_weak_count *)__p;
      v31 = (char *)v45;
      if (__p == v45)
      {
        v33 = 0;
        v7 += v28;
        if (!__p)
        {
LABEL_60:
          std::recursive_mutex::unlock(v29);
          v6 += v33;
          return v7 >= v6 + 3;
        }
      }
      else
      {
        v32 = (char *)__p + 16;
        do
        {
          v33 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)v32 - 2) + 200))(*((_QWORD *)v32 - 2), v27);
          if (v33)
            v34 = 1;
          else
            v34 = v32 == v31;
          v32 += 16;
        }
        while (!v34);
        v30 = (std::__shared_weak_count *)__p;
        v7 += v28;
        if (!__p)
          goto LABEL_60;
      }
      v35 = v45;
      v36 = v30;
      if (v45 != v30)
      {
        do
        {
          shared_weak_owners = (std::__shared_weak_count *)v35[-1].__shared_weak_owners_;
          if (shared_weak_owners)
          {
            v38 = (unint64_t *)&shared_weak_owners->__shared_owners_;
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))shared_weak_owners->__on_zero_shared)(shared_weak_owners);
              std::__shared_weak_count::__release_weak(shared_weak_owners);
            }
          }
          v35 = (std::__shared_weak_count *)((char *)v35 - 16);
        }
        while (v35 != v30);
        v36 = __p;
      }
      v45 = v30;
      operator delete(v36);
      goto LABEL_60;
    }
    return v7 >= v6 + 3;
  }
  if (v46 < 0)
    operator delete(__p);
  return 0;
}

void sub_19C443C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  std::recursive_mutex *v23;

  std::recursive_mutex::unlock(v23);
  _Unwind_Resume(a1);
}

void sub_19C443CD4(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  const UInt8 *v9;
  CFIndex v10;
  uint64_t v11;
  uint64_t (***v12)();
  uint64_t v13;
  uint64_t v14;
  uint64_t (***v15)();
  uint64_t v16;
  void *exception;
  _QWORD v18[3];
  char v19;
  CFTypeRef cf;
  uint64_t v21;
  uint64_t (**v22)();
  _QWORD *v23;
  CFTypeRef *p_cf;
  uint64_t (***v25)();
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *a1 = 0;
  a1[24] = 0;
  v21 = *MEMORY[0x1E0D437E8];
  v8 = *(char *)(a3 + 23);
  if (v8 >= 0)
    v9 = (const UInt8 *)a3;
  else
    v9 = *(const UInt8 **)a3;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(a3 + 23);
  else
    v10 = *(_QWORD *)(a3 + 8);
  cf = CFStringCreateWithBytes(0, v9, v10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD3154](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v19 = 0;
  v18[0] = a1;
  v18[1] = &v19;
  v18[2] = &v21;
  if ((a4 & 0xFF00000000) == 0)
    LODWORD(a4) = 1;
  v11 = *(_QWORD *)(a2 + 72);
  v22 = &off_1E3D30DC8;
  v23 = v18;
  p_cf = &cf;
  v25 = &v22;
  sub_19C36104C(v11, a3, a4, 129, (uint64_t)&v22);
  v12 = v25;
  if (v25 == &v22)
  {
    v13 = 4;
    v12 = &v22;
    goto LABEL_14;
  }
  if (v25)
  {
    v13 = 5;
LABEL_14:
    (*v12)[v13]();
  }
  if ((a4 & 0xFFFFFFFE) == 2 || !*(_BYTE *)(a2 + 88) || v19)
    goto LABEL_23;
  v14 = *(_QWORD *)(*(_QWORD *)(a2 + 72) + 464);
  v22 = &off_1E3D30E20;
  v23 = v18;
  p_cf = &cf;
  v25 = &v22;
  sub_19C3CA568(v14, a3, 129, (uint64_t)&v22);
  v15 = v25;
  if (v25 == &v22)
  {
    v16 = 4;
    v15 = &v22;
  }
  else
  {
    if (!v25)
      goto LABEL_23;
    v16 = 5;
  }
  (*v15)[v16]();
LABEL_23:
  if (cf)
    CFRelease(cf);
}

void sub_19C443EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, const void *a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, _Unwind_Exception *exception_object)
{
  uint64_t v19;
  _Unwind_Exception *v20;
  char *v22;
  uint64_t v23;

  v22 = (char *)exception_object;
  if (exception_object == v20)
  {
    v23 = 4;
    v22 = &a16;
  }
  else
  {
    if (!exception_object)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  sub_19C2E5670(&a14);
  if (*(_BYTE *)(v19 + 24))
  {
    if (*(char *)(v19 + 23) < 0)
      operator delete(*(void **)v19);
  }
  _Unwind_Resume(a1);
}

void sub_19C443F5C()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C443F70(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E3D30E20;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_19C443FA8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D30E20;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_19C443FC8(uint64_t a1, const __CFString **a2, uint64_t a3, double *a4, uint64_t a5, const __CFLocale **a6, _BYTE *a7)
{
  sub_19C444048(*(uint64_t **)(a1 + 8), *a2, **(CFStringRef **)(a1 + 16), *a6, a7, *a4);
}

uint64_t sub_19C443FE8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_s"
                     "tringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_2"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3_"
                                "_112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnum"
                                "erationPolicyEEEE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C44403C()
{
  return &unk_1E3D30150;
}

void sub_19C444048(uint64_t *a1, const __CFString *a2, CFStringRef theString, const __CFLocale *a4, _BYTE *a5, double a6)
{
  CFIndex Length;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  CFRange v21;

  Length = CFStringGetLength(theString);
  if (Length == CFStringGetLength(a2)
    && (v21.length = CFStringGetLength(theString),
        v21.location = 0,
        CFStringCompareWithOptionsAndLocale(theString, a2, v21, 0, a4) == kCFCompareEqualTo))
  {
    sub_19C29CEF8(a2, &v19);
    v15 = *a1;
    if (*(_BYTE *)(*a1 + 24))
    {
      if (*(char *)(v15 + 23) < 0)
        operator delete(*(void **)v15);
      v16 = v19;
      *(_QWORD *)(v15 + 16) = v20;
      *(_OWORD *)v15 = v16;
    }
    else
    {
      v18 = v19;
      *(_QWORD *)(v15 + 16) = v20;
      *(_OWORD *)v15 = v18;
      *(_BYTE *)(v15 + 24) = 1;
    }
    *(_BYTE *)a1[1] = 1;
    *a5 = 1;
  }
  else if (*(double *)a1[2] < a6)
  {
    sub_19C29CEF8(a2, &v19);
    v13 = *a1;
    if (*(_BYTE *)(*a1 + 24))
    {
      if (*(char *)(v13 + 23) < 0)
        operator delete(*(void **)v13);
      v14 = v19;
      *(_QWORD *)(v13 + 16) = v20;
      *(_OWORD *)v13 = v14;
    }
    else
    {
      v17 = v19;
      *(_QWORD *)(v13 + 16) = v20;
      *(_OWORD *)v13 = v17;
      *(_BYTE *)(v13 + 24) = 1;
    }
    *(double *)a1[2] = a6;
  }
}

void sub_19C4441B4()
{
  JUMPOUT(0x1A1AD355CLL);
}

__n128 sub_19C4441C8(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E3D30DC8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_19C444200(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E3D30DC8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_19C444220(uint64_t a1, const __CFString **a2, uint64_t a3, double *a4, uint64_t a5, const __CFLocale **a6, _BYTE *a7)
{
  sub_19C444048(*(uint64_t **)(a1 + 8), *a2, **(CFStringRef **)(a1 + 16), *a6, a7, *a4);
}

uint64_t sub_19C444240(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_s"
                     "tringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_1"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3_"
                                "_112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnum"
                                "erationPolicyEEEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession24bestWordMatchFromLexiconERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEENS2_8optionalIN2LM22TokenEnumerationPolicyEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C444294()
{
  return &unk_1E3D336A0;
}

void sub_19C4442A0(_QWORD *a1, uint64_t a2, _DWORD *a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, std::string *a8, int a9)
{
  _QWORD *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _DWORD *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  std::string *v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int8x8_t v47;
  uint8x8_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  unint64_t v56;
  char *v57;
  char *v58;
  const std::string::value_type *v59;
  std::string::size_type v60;
  uint64_t v61;
  std::string::size_type v62;
  std::string *v63;
  char *v64;
  uint64_t v65;
  std::string::size_type v66;
  std::string *v67;
  std::string::size_type size;
  uint64_t v69;
  __int128 v70;
  char v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  std::__shared_weak_count *v76;
  unint64_t v77;
  char v78;
  char shared_owners;
  std::__shared_weak_count *v80;
  std::__shared_count v81;
  size_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 *p_src;
  void **v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  char v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *p_shared_owners;
  unint64_t v97;
  _BOOL4 v98;
  _BOOL4 v99;
  unint64_t *v100;
  unint64_t v101;
  void **p_data;
  uint64_t v103;
  _BYTE *v104;
  uint64_t *v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  std::string::size_type v110;
  int8x8_t v111;
  uint8x8_t v112;
  uint64_t v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  _DWORD *v119;
  int v120;
  unint64_t v121;
  unint64_t v122;
  void **v123;
  std::string::size_type v124;
  uint64_t v125;
  std::string::size_type v126;
  std::string *v127;
  std::string::size_type v128;
  uint64_t v129;
  std::string *v130;
  char v131;
  std::__shared_weak_count *v132;
  unsigned int *v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  void *__p[2];
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  int v144;
  void *v145[2];
  uint64_t v146;
  __int16 v147;
  char v148;
  __int128 v149;
  int v150;
  __int128 v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  __int16 v156;
  int v157;
  char *v158;
  char *v159;
  char *v160;
  void *v161[2];
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  std::__shared_weak_count *v167;
  __int128 v168;
  uint64_t v169;
  char v170;
  void *__dst[2];
  unint64_t v172;
  unint64_t i;
  std::__shared_count __src;
  uint64_t shared_weak_owners;
  std::__shared_weak_count *v176;
  std::__shared_weak_count *v177;

  v163 = 0;
  v164 = 0;
  v165 = 0;
  v16 = *(_QWORD **)(a2 + 72);
  v17 = *(_QWORD *)(*(_QWORD *)a5 + 32);
  if (*(_QWORD *)(*(_QWORD *)a5 + 24) == v17)
  {
    HIBYTE(v162) = 0;
    LOBYTE(v161[0]) = 0;
  }
  else if (*(char *)(v17 - 9) < 0)
  {
    sub_19C2B5238(v161, *(void **)(v17 - 32), *(_QWORD *)(v17 - 24));
  }
  else
  {
    v18 = *(_OWORD *)(v17 - 32);
    v162 = *(_QWORD *)(v17 - 16);
    *(_OWORD *)v161 = v18;
  }
  if (!a4)
    goto LABEL_18;
  v19 = a4;
  v20 = &a3[a4];
  while (v19 * 4)
  {
    v21 = a3[--v19];
    if (v21 == 1)
    {
      v22 = (uint64_t)(4 * a4 - (v19 * 4 + 4)) >> 2;
      a4 = v22 + 1;
      a3 = &v20[~v22];
      break;
    }
  }
  if (!a4)
    goto LABEL_18;
  v23 = a4;
  while (v23 * 4)
  {
    v24 = a3[--v23];
    if (v24 != 2)
    {
      a4 -= (uint64_t)(4 * a4 - (v23 * 4 + 4)) >> 2;
      if (!a4)
        a3 = 0;
      break;
    }
  }
  if (a4 < 2 || a4 == 2 && *a3 == 1)
  {
LABEL_18:
    v25 = 0;
    v26 = a1;
    if (SHIBYTE(v162) < 0)
      goto LABEL_242;
LABEL_19:
    if (!v25)
      goto LABEL_243;
LABEL_20:
    *v26 = 0;
    v26[1] = 0;
    v26[2] = 0;
    v158 = 0;
    v159 = 0;
    v160 = 0;
    if (a7)
    {
      if (a7 >> 62)
        sub_19C2A18E8();
      v27 = (char *)operator new(4 * a7);
      v158 = v27;
      v160 = &v27[4 * a7];
      bzero(v27, 4 * a7);
      v159 = &v27[4 * a7];
    }
    else
    {
      v27 = 0;
    }
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25) & 1) == 0)
      goto LABEL_195;
    *(int64x2_t *)v145 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v146 = 0;
    v147 = 0;
    v148 = 1;
    v149 = xmmword_19C46DE10;
    v150 = 0;
    v151 = xmmword_19C46DE10;
    v157 = 0;
    v152 = 0xFFEFFFFFFFFFFFFFLL;
    v153 = 0;
    v154 = 0;
    v155 = 0;
    v156 = 0;
    v28 = (*(uint64_t (**)(uint64_t, char *, void **))(*(_QWORD *)v25 + 24))(v25, v27, v145);
    v29 = v28;
    if (v28)
    {
      v30 = 4 * v28;
      v31 = v27;
      while (*(_DWORD *)v31)
      {
        v31 += 4;
        v30 -= 4;
        if (!v30)
          goto LABEL_29;
      }
LABEL_195:
      if (!v27)
      {
LABEL_197:
        (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
        return;
      }
LABEL_196:
      operator delete(v27);
      goto LABEL_197;
    }
LABEL_29:
    v133 = (unsigned int *)v27;
    if (a9)
      v32 = 9;
    else
      v32 = 6;
    v144 = v32;
    v33 = *(_QWORD *)(a2 + 72);
    v34 = v146;
    v35 = *(_QWORD *)(*(_QWORD *)a5 + 120);
    v36 = *(_QWORD *)(*(_QWORD *)a5 + 32);
    if (*(_QWORD *)(*(_QWORD *)a5 + 24) == v36)
    {
      HIBYTE(v169) = 0;
      LOBYTE(v168) = 0;
    }
    else if (*(char *)(v36 - 9) < 0)
    {
      sub_19C2B5238(&v168, *(void **)(v36 - 32), *(_QWORD *)(v36 - 24));
    }
    else
    {
      v37 = *(_OWORD *)(v36 - 32);
      v169 = *(_QWORD *)(v36 - 16);
      v168 = v37;
    }
    v129 = v35;
    v27 = (char *)v133;
    sub_19C4406E4(&v143, v133, v29, (uint64_t)v145, v33, a2 + 16, v34, &v144, v129, &v168);
    if (SHIBYTE(v169) < 0)
      operator delete((void *)v168);
    v57 = v143;
    if (v143)
    {
      if (qword_1EE41C070 != -1)
        dispatch_once(&qword_1EE41C070, &unk_1E3D3CA78);
      v58 = v57;
      if (v57[23] < 0)
        v58 = *(char **)v57;
      sub_19C34EC30("Generated dynamic inline completion='%s', score=%f", (uint64_t)&v168, v58, *((_QWORD *)v57 + 6));
      if (v169 >= 0)
        v59 = (const std::string::value_type *)&v168;
      else
        v59 = (const std::string::value_type *)v168;
      if (v169 >= 0)
        v60 = HIBYTE(v169);
      else
        v60 = *((_QWORD *)&v168 + 1);
      std::string::append(a8, v59, v60);
      if (SHIBYTE(a8->__r_.__value_.__r.__words[2]) < 0)
      {
        size = a8->__r_.__value_.__l.__size_;
        if (size)
        {
          v63 = (std::string *)a8->__r_.__value_.__r.__words[0];
          if (!*(_BYTE *)(a8->__r_.__value_.__r.__words[0] + size - 1))
          {
            v62 = size - 1;
            a8->__r_.__value_.__l.__size_ = v62;
            goto LABEL_101;
          }
        }
      }
      else
      {
        v61 = HIBYTE(a8->__r_.__value_.__r.__words[2]);
        if (*((_BYTE *)&a8->__r_.__value_.__s + 23) && !a8->__r_.__value_.__s.__data_[v61 - 1])
        {
          v62 = v61 - 1;
          *((_BYTE *)&a8->__r_.__value_.__s + 23) = v61 - 1;
          v63 = a8;
LABEL_101:
          v63->__r_.__value_.__s.__data_[v62] = 0;
        }
      }
      std::string::push_back(a8, 10);
      if (SHIBYTE(v169) < 0)
        operator delete((void *)v168);
      v69 = *(_QWORD *)(*(_QWORD *)a5 + 32);
      v136 = v25;
      v130 = a8;
      if (*(_QWORD *)(*(_QWORD *)a5 + 24) == v69)
      {
        HIBYTE(v140) = 0;
        LOBYTE(__p[0]) = 0;
      }
      else if (*(char *)(v69 - 9) < 0)
      {
        sub_19C2B5238(__p, *(void **)(v69 - 32), *(_QWORD *)(v69 - 24));
      }
      else
      {
        v70 = *(_OWORD *)(v69 - 32);
        v140 = *(_QWORD *)(v69 - 16);
        *(_OWORD *)__p = v70;
      }
      v71 = v57[23];
      v72 = *((_QWORD *)v57 + 1);
      HIBYTE(v169) = 1;
      LOWORD(v168) = 32;
      sub_19C34F0F8((uint64_t)&v176, (__int128 *)v57, (unsigned __int8 *)&v168);
      if (v71 >= 0)
        v73 = v71;
      else
        v73 = v72;
      v74 = 1 << v73;
      if (SHIBYTE(v169) < 0)
        operator delete((void *)v168);
      v76 = v176;
      v75 = v177;
      if (v177 == v176)
      {
        v76 = v177;
        p_data = (void **)&v130->__r_.__value_.__l.__data_;
        if (!v177)
          goto LABEL_179;
LABEL_172:
        if (v75 != v76)
        {
          do
          {
            if (SHIBYTE(v75[-1].__shared_weak_owners_) < 0)
              operator delete(v75[-1].__vftable);
            --v75;
          }
          while (v75 != v76);
          v75 = v176;
        }
        v177 = v76;
        operator delete(v75);
LABEL_179:
        v103 = operator new();
        if (*((char *)p_data + 23) < 0)
        {
          sub_19C2B5238(&v168, *p_data, (unint64_t)p_data[1]);
        }
        else
        {
          v168 = *(_OWORD *)p_data;
          v169 = (uint64_t)p_data[2];
        }
        v27 = (char *)v133;
        sub_19C29769C((char *)v103, (__int128 *)v57);
        *(_QWORD *)(v103 + 256) = v74;
        v104 = (_BYTE *)(v103 + 264);
        if (SHIBYTE(v169) < 0)
        {
          v25 = v136;
          sub_19C2B5238(v104, (void *)v168, *((unint64_t *)&v168 + 1));
          if (SHIBYTE(v169) < 0)
            operator delete((void *)v168);
        }
        else
        {
          *(_OWORD *)v104 = v168;
          *(_QWORD *)(v103 + 280) = v169;
          v25 = v136;
        }
        v141 = 0;
        v142 = v103;
        v105 = (uint64_t *)v26[1];
        if ((unint64_t)v105 >= v26[2])
        {
          v106 = sub_19C307614(v26, &v142);
          v107 = v142;
          v26[1] = v106;
          if (v107)
          {
            if (*(char *)(v107 + 287) < 0)
              operator delete(*(void **)(v107 + 264));
            v108 = sub_19C296378(v107);
            MEMORY[0x1A1AD355C](v108, 0x1032C40D90104AELL);
          }
        }
        else
        {
          *v105 = v103;
          v26[1] = v105 + 1;
        }
        if (SHIBYTE(v140) < 0)
          operator delete(__p[0]);
        v109 = sub_19C296378((uint64_t)v57);
        MEMORY[0x1A1AD355C](v109, 0x1032C4057ACE4D0);
        goto LABEL_195;
      }
      v137 = v57;
      v77 = 0;
      v78 = 0;
LABEL_118:
      v80 = &v76[v77];
      if (SHIBYTE(v80->__shared_weak_owners_) < 0)
      {
        sub_19C2B5238(&__src, v80->__vftable, v80->__shared_owners_);
      }
      else
      {
        v81 = v80->std::__shared_count;
        shared_weak_owners = v80->__shared_weak_owners_;
        __src = v81;
      }
      *(_QWORD *)&v168 = 0;
      sub_19C34EADC((uint64_t *)&__src, (uint64_t *)&v168);
      v82 = v168;
      if (!v77)
      {
        v83 = v140 >= 0 ? (void *)HIBYTE(v140) : __p[1];
        if ((unint64_t)v168 < (unint64_t)v83)
        {
          v84 = 0;
          *(_QWORD *)&v168 = 0;
          do
          {
            v85 = v84;
            sub_19C34EADC((uint64_t *)__p, (uint64_t *)&v168);
            v84 = v85 + 1;
          }
          while ((unint64_t)v168 < (unint64_t)v83);
          *(_QWORD *)&v168 = 0;
          if (v85 == -1)
          {
            v82 = 0;
          }
          else
          {
            v86 = ~v85;
            do
              sub_19C34EADC((uint64_t *)&__src, (uint64_t *)&v168);
            while (!__CFADD__(v86++, 1));
            v82 = v168;
          }
        }
      }
      for (i = v82; ; v82 = i)
      {
        if (SHIBYTE(shared_weak_owners) < 0)
        {
          shared_owners = __src.__shared_owners_;
          if (v82 >= __src.__shared_owners_)
          {
            operator delete(__src.__vftable);
LABEL_117:
            v78 += shared_owners + 1;
            ++v77;
            v76 = v176;
            v75 = v177;
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v177 - (char *)v176) >> 3) <= v77)
            {
              v57 = v137;
              v26 = a1;
              p_data = (void **)&v130->__r_.__value_.__l.__data_;
              if (!v176)
                goto LABEL_179;
              goto LABEL_172;
            }
            goto LABEL_118;
          }
          p_src = (__int128 *)__src.__vftable;
          if (v82 >= 0x7FFFFFFFFFFFFFF8)
LABEL_262:
            sub_19C2A1A54();
        }
        else
        {
          if (v82 >= HIBYTE(shared_weak_owners))
          {
            shared_owners = HIBYTE(shared_weak_owners);
            goto LABEL_117;
          }
          p_src = (__int128 *)&__src;
          if (v82 >= 0x7FFFFFFFFFFFFFF8)
            goto LABEL_262;
        }
        if (v82 >= 0x17)
          break;
        HIBYTE(v172) = v82;
        v89 = __dst;
        if (v82)
          goto LABEL_150;
LABEL_151:
        *((_BYTE *)v89 + v82) = 0;
        sub_19C443CD4(&v168, a2, (uint64_t)__dst, 0);
        if (!v170)
          goto LABEL_135;
        v92 = sub_19C44391C(a2, (uint64_t)__dst);
        v93 = i;
        if (!v92)
        {
          if (i > 3)
            goto LABEL_165;
          v94 = *(_QWORD *)(a2 + 72);
          v95 = *(std::__shared_weak_count **)(a2 + 80);
          v166 = v94;
          v167 = v95;
          if (v95)
          {
            p_shared_owners = (unint64_t *)&v95->__shared_owners_;
            do
              v97 = __ldxr(p_shared_owners);
            while (__stxr(v97 + 1, p_shared_owners));
          }
          v98 = sub_19C43306C(v94, (uint64_t)__dst);
          v99 = v98;
          if (!v95)
            goto LABEL_162;
          v100 = (unint64_t *)&v95->__shared_owners_;
          do
            v101 = __ldaxr(v100);
          while (__stlxr(v101 - 1, v100));
          if (!v101)
          {
            ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
            std::__shared_weak_count::__release_weak(v95);
            if (!v99)
              goto LABEL_165;
          }
          else
          {
LABEL_162:
            if (!v98)
              goto LABEL_165;
          }
          v93 = i;
        }
        v74 |= 1 << (v78 + v93);
LABEL_165:
        if (v170 && SHIBYTE(v169) < 0)
          operator delete((void *)v168);
LABEL_135:
        if (SHIBYTE(v172) < 0)
          operator delete(__dst[0]);
        sub_19C34EADC((uint64_t *)&__src, (uint64_t *)&i);
      }
      v90 = (v82 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v82 | 7) != 0x17)
        v90 = v82 | 7;
      v91 = v90 + 1;
      v89 = (void **)operator new(v90 + 1);
      __dst[1] = (void *)v82;
      v172 = v91 | 0x8000000000000000;
      __dst[0] = v89;
LABEL_150:
      memmove(v89, p_src, v82);
      goto LABEL_151;
    }
    if (qword_1EE41C070 != -1)
      dispatch_once(&qword_1EE41C070, &unk_1E3D3CA78);
    v64 = (char *)operator new(0x48uLL);
    strcpy(v64, "Failed to create predictionImpl: dynamic inline completion is invalid");
    std::string::append(a8, v64, 0x45uLL);
    if (SHIBYTE(a8->__r_.__value_.__r.__words[2]) < 0)
    {
      v110 = a8->__r_.__value_.__l.__size_;
      if (v110)
      {
        v67 = (std::string *)a8->__r_.__value_.__r.__words[0];
        if (!*(_BYTE *)(a8->__r_.__value_.__r.__words[0] + v110 - 1))
        {
          v66 = v110 - 1;
          a8->__r_.__value_.__l.__size_ = v66;
          goto LABEL_201;
        }
      }
    }
    else
    {
      v65 = HIBYTE(a8->__r_.__value_.__r.__words[2]);
      if (*((_BYTE *)&a8->__r_.__value_.__s + 23) && !a8->__r_.__value_.__s.__data_[v65 - 1])
      {
        v66 = v65 - 1;
        *((_BYTE *)&a8->__r_.__value_.__s + 23) = v65 - 1;
        v67 = a8;
LABEL_201:
        v67->__r_.__value_.__s.__data_[v66] = 0;
      }
    }
    std::string::push_back(a8, 10);
    operator delete(v64);
    if (!v133)
      goto LABEL_197;
    goto LABEL_196;
  }
  if (a9)
  {
    v38 = v16[58];
    v134 = *(_QWORD **)(v38 + 144);
    std::recursive_mutex::lock((std::recursive_mutex *)v38);
    v39 = a8;
    v131 = 1;
  }
  else
  {
    v39 = a8;
    v38 = 0;
    v131 = 0;
    v134 = (_QWORD *)v16[34];
  }
  v41 = (std::__shared_weak_count *)v16[1];
  v40 = (std::__shared_weak_count *)v16[2];
  v176 = v41;
  if (!v40 || (v177 = std::__shared_weak_count::lock(v40), (v132 = v177) == 0))
    sub_19C31AF2C();
  v42 = operator new();
  v135 = v42;
  if (SHIBYTE(v162) < 0)
  {
    sub_19C2B5238(&v168, v161[0], (unint64_t)v161[1]);
  }
  else
  {
    v168 = *(_OWORD *)v161;
    v169 = v162;
  }
  sub_19C432254(v42, v134, a3, a4, a7, 3);
  *(_QWORD *)v42 = &off_1E3D374C8;
  *(_QWORD *)(v42 + 184) = v38;
  *(_BYTE *)(v42 + 192) = v131;
  *(_QWORD *)(v42 + 200) = a6;
  *(_QWORD *)(v42 + 208) = v41;
  *(_QWORD *)(v42 + 216) = v132;
  v43 = (unint64_t *)&v132->__shared_owners_;
  do
    v44 = __ldxr(v43);
  while (__stxr(v44 + 1, v43));
  v45 = (_QWORD *)(v135 + 232);
  *(_QWORD *)(v135 + 256) = 0;
  *(_OWORD *)(v135 + 224) = 0u;
  *(_OWORD *)(v135 + 240) = 0u;
  *(_DWORD *)(v135 + 264) = 1065353216;
  sub_19C406F74((float *)(v135 + 232), 2uLL, &xmmword_19C477F68);
  a8 = v39;
  sub_19C406F74((float *)(v135 + 232), 3uLL, xmmword_19C477F78);
  *(_QWORD *)(v135 + 272) = 0;
  *(_QWORD *)(v135 + 280) = 0;
  *(_QWORD *)(v135 + 288) = 0;
  *(_DWORD *)(v135 + 296) = a9;
  *(_QWORD *)(v135 + 80) = -1;
  if (a4 >= 3)
    v46 = 3;
  else
    v46 = a4;
  v47 = *(int8x8_t *)(v135 + 240);
  if (!*(_QWORD *)&v47)
    goto LABEL_263;
  v48 = (uint8x8_t)vcnt_s8(v47);
  v48.i16[0] = vaddlv_u8(v48);
  if (v48.u32[0] > 1uLL)
  {
    v49 = 2;
    if (*(_QWORD *)&v47 <= 2uLL)
      v49 = 2uLL % *(_QWORD *)&v47;
  }
  else
  {
    v49 = (v47.i8[0] - 1) & 2;
  }
  v50 = *(_QWORD **)(*v45 + 8 * v49);
  if (!v50)
    goto LABEL_263;
  v51 = (_QWORD *)*v50;
  if (!v51)
    goto LABEL_263;
  if (v48.u32[0] < 2uLL)
  {
    v52 = *(_QWORD *)&v47 - 1;
    while (1)
    {
      v54 = v51[1];
      if (v54 == 2)
      {
        if (v51[2] == 2)
          goto LABEL_71;
      }
      else if ((v54 & v52) != v49)
      {
        goto LABEL_263;
      }
      v51 = (_QWORD *)*v51;
      if (!v51)
        goto LABEL_263;
    }
  }
  while (1)
  {
    v53 = v51[1];
    if (v53 == 2)
      break;
    if (v53 >= *(_QWORD *)&v47)
      v53 %= *(_QWORD *)&v47;
    if (v53 != v49)
      goto LABEL_263;
LABEL_61:
    v51 = (_QWORD *)*v51;
    if (!v51)
      goto LABEL_263;
  }
  if (v51[2] != 2)
    goto LABEL_61;
LABEL_71:
  v55 = &a3[a4];
  if (*(v55 - 2) != 1)
  {
    v56 = v51[3];
    *(_DWORD *)(v135 + 88) = 0;
    (*(void (**)(_QWORD, _DWORD *, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(v135 + 8) + 8)
                                                                        + 104))(*(_QWORD *)(*(_QWORD *)(v135 + 8) + 8), v55 - 2, 2, v134[3] + 88, 1);
    if (SHIBYTE(v169) < 0)
    {
      sub_19C2B5238(v145, (void *)v168, *((unint64_t *)&v168 + 1));
    }
    else
    {
      *(_OWORD *)v145 = v168;
      v146 = v169;
    }
    sub_19C4073D0(v135, v55 - 2, 2, v56, (unsigned __int8 *)v145, a8);
    if (SHIBYTE(v146) < 0)
      operator delete(v145[0]);
    if (v46 != 2 && *(_QWORD *)(v135 + 272) == *(_QWORD *)(v135 + 280))
    {
      v111 = *(int8x8_t *)(v135 + 240);
      if (v111)
      {
        v112 = (uint8x8_t)vcnt_s8(v111);
        v112.i16[0] = vaddlv_u8(v112);
        if (v112.u32[0] >= 2uLL)
        {
          v113 = 3;
          if (*(_QWORD *)&v111 <= 3uLL)
            v113 = 3uLL % *(_QWORD *)&v111;
        }
        else
        {
          v113 = (v111.i8[0] - 1) & 3;
        }
        v114 = *(_QWORD **)(*v45 + 8 * v113);
        if (v114)
        {
          v115 = (_QWORD *)*v114;
          if (v115)
          {
            if (v112.u32[0] < 2uLL)
            {
              v116 = *(_QWORD *)&v111 - 1;
              while (1)
              {
                v118 = v115[1];
                if (v118 == 3)
                {
                  if (v115[2] == 3)
                    goto LABEL_229;
                }
                else if ((v118 & v116) != v113)
                {
                  goto LABEL_263;
                }
                v115 = (_QWORD *)*v115;
                if (!v115)
                  goto LABEL_263;
              }
            }
            do
            {
              v117 = v115[1];
              if (v117 == 3)
              {
                if (v115[2] == 3)
                {
LABEL_229:
                  v120 = *(v55 - 3);
                  v119 = v55 - 3;
                  if (v120 != 1)
                  {
                    v121 = v115[3];
                    *(_DWORD *)(v135 + 88) = 0;
                    (*(void (**)(_QWORD, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(v135 + 8) + 8) + 104))(*(_QWORD *)(*(_QWORD *)(v135 + 8) + 8), v119, 3, v134[3] + 88, 1, v135 + 88, 0);
                    if (SHIBYTE(v169) < 0)
                    {
                      sub_19C2B5238(v145, (void *)v168, *((unint64_t *)&v168 + 1));
                    }
                    else
                    {
                      *(_OWORD *)v145 = v168;
                      v146 = v169;
                    }
                    sub_19C4073D0(v135, v119, 3, v121, (unsigned __int8 *)v145, a8);
                    if (SHIBYTE(v146) < 0)
                      operator delete(v145[0]);
                  }
                  goto LABEL_235;
                }
              }
              else
              {
                if (v117 >= *(_QWORD *)&v111)
                  v117 %= *(_QWORD *)&v111;
                if (v117 != v113)
                  break;
              }
              v115 = (_QWORD *)*v115;
            }
            while (v115);
          }
        }
      }
LABEL_263:
      sub_19C2B41E0("unordered_map::at: key not found");
    }
  }
LABEL_235:
  if (SHIBYTE(v169) < 0)
    operator delete((void *)v168);
  v26 = a1;
  do
    v122 = __ldaxr(v43);
  while (__stlxr(v122 - 1, v43));
  if (!v122)
  {
    ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
    std::__shared_weak_count::__release_weak(v132);
  }
  v25 = v135;
  if ((SHIBYTE(v162) & 0x80000000) == 0)
    goto LABEL_19;
LABEL_242:
  operator delete(v161[0]);
  if (v25)
    goto LABEL_20;
LABEL_243:
  if (qword_1EE41C070 != -1)
    dispatch_once(&qword_1EE41C070, &unk_1E3D3CA78);
  sub_19C34EC30("%s %s", (uint64_t)v145, "_dynamicInlineCompletions", "Failed to create dynamicInlineCompletion enumerator");
  if (v146 >= 0)
    v123 = v145;
  else
    v123 = (void **)v145[0];
  if (v146 >= 0)
    v124 = HIBYTE(v146);
  else
    v124 = (std::string::size_type)v145[1];
  std::string::append(a8, (const std::string::value_type *)v123, v124);
  if (SHIBYTE(a8->__r_.__value_.__r.__words[2]) < 0)
  {
    v128 = a8->__r_.__value_.__l.__size_;
    if (v128)
    {
      v127 = (std::string *)a8->__r_.__value_.__r.__words[0];
      if (!*(_BYTE *)(a8->__r_.__value_.__r.__words[0] + v128 - 1))
      {
        v126 = v128 - 1;
        a8->__r_.__value_.__l.__size_ = v126;
LABEL_258:
        v127->__r_.__value_.__s.__data_[v126] = 0;
      }
    }
  }
  else
  {
    v125 = HIBYTE(a8->__r_.__value_.__r.__words[2]);
    if (*((_BYTE *)&a8->__r_.__value_.__s + 23) && !a8->__r_.__value_.__s.__data_[v125 - 1])
    {
      v126 = v125 - 1;
      *((_BYTE *)&a8->__r_.__value_.__s + 23) = v125 - 1;
      v127 = a8;
      goto LABEL_258;
    }
  }
  std::string::push_back(a8, 10);
  if (SHIBYTE(v146) < 0)
    operator delete(v145[0]);
  *v26 = 0;
  v26[1] = 0;
  v26[2] = 0;
}

void sub_19C445208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, _QWORD *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,char a26,int a27,__int16 a28,char a29,char a30,int a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60)
{
  uint64_t v60;
  uint64_t v61;

  sub_19C296378(v60);
  if (*(char *)(v61 - 185) < 0)
    operator delete(*(void **)(v61 - 208));
  MEMORY[0x1A1AD355C](v60, 0x1032C40D90104AELL);
  if (a24 < 0)
    operator delete(__p);
  sub_19C3075D0(&a32);
  if (a15)
    operator delete(a15);
  sub_19C2FEFC4(a18);
  if (a16)
    (*(void (**)(uint64_t))(*(_QWORD *)a16 + 8))(a16);
  sub_19C440B54((void **)(v61 - 248));
  _Unwind_Resume(a1);
}

void sub_19C4455F8()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C44560C(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30ED0;
  result[1] = v3;
  return result;
}

uint64_t sub_19C445640(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30ED0;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C44565C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 112)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C445684(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17Linguist"
                     "icContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__11"
                     "2basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_1"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0"
                                "_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16Predi"
                                "ctionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8fun"
                                "ctionIFbRKNS0_16InlineCompletionEEEEE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C4456D8()
{
  return &unk_1E3D336C0;
}

void sub_19C4456E8()
{
  JUMPOUT(0x1A1AD355CLL);
}

_QWORD *sub_19C4456FC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D30E78;
  result[1] = v3;
  return result;
}

uint64_t sub_19C445730(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D30E78;
  a2[1] = v2;
  return result;
}

uint64_t sub_19C44574C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 104)
                                                                                       + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 104), a2, a3, *a4, (uint64_t)(a4[1] - *a4) >> 2, 3);
}

uint64_t sub_19C445774(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17Linguist"
                     "icContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__11"
                     "2basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_0"
    || ((v3 & (unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0"
                                "_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16Predi"
                                "ctionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8fun"
                                "ctionIFbRKNS0_16InlineCompletionEEEEE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK17language_modeling2v127TokenIDLanguageModelSession26enumerateInlineCompletionsERKNS0_17LinguisticContextERKNS0_14CompletionStemEmmN2LM29CompositePredictionEnumerator16PredictionSubsetEbRNSt3__112basic_stringIcNSB_11char_traitsIcEENSB_9allocatorIcEEEERKNSB_8functionIFbRKNS0_16InlineCompletionEEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_19C4457C8()
{
  return &unk_1E3D336B0;
}

const void **sub_19C4457D4(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_19C445804(_QWORD *a1, CFDictionaryRef theDict)
{
  const __CFURL *Value;

  Value = (const __CFURL *)CFDictionaryGetValue(theDict, CFSTR("URL"));
  sub_19C2E15E8(Value, a1);
}

uint64_t CEMCreateEmojiCharacterSet()
{
  return MEMORY[0x1E0D15CE0]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1E0D15DA8]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x1E0C97F08](heap, value);
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x1E0C97F18](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1E0C97F20](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1E0C97F28](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1E0C97F38](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F48](heap);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98090](bundleURL, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x1E0C980E0](allocator, directoryURL, bundleType);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1E0C981A8](bundle, error);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1E0C98328](theSet, *(_QWORD *)&theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987B0](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C987B8](allocator, localeID);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x1E0C987C0](allocator, locale);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987C8](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFTypeID CFLocaleGetTypeID(void)
{
  return MEMORY[0x1E0C987F8]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringCapitalize(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C98F00](theString, locale);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1E0C98F20](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions, locale);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x1E0C99160](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99210](string, range.location, range.length);
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

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C993D8](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99438](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1E0C994E0](url, key, propertyValue, error);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t LDCreateSystemLexiconCompatibilityVersion()
{
  return MEMORY[0x1E0D43810]();
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x1E0D43820]();
}

uint64_t LXCursorConditionalProbability()
{
  return MEMORY[0x1E0D43530]();
}

uint64_t LXCursorCreateByAdvancing()
{
  return MEMORY[0x1E0D43540]();
}

uint64_t LXCursorCreateByAdvancingWithUTF8()
{
  return MEMORY[0x1E0D43548]();
}

uint64_t LXCursorEnumerateChildren()
{
  return MEMORY[0x1E0D43550]();
}

uint64_t LXCursorEnumerateEntries()
{
  return MEMORY[0x1E0D43558]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x1E0D43560]();
}

uint64_t LXCursorEnumerateEntriesRecursivelyWithPolicy()
{
  return MEMORY[0x1E0D43568]();
}

uint64_t LXCursorHasChildren()
{
  return MEMORY[0x1E0D43570]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x1E0D43578]();
}

uint64_t LXCursorHash()
{
  return MEMORY[0x1E0D43580]();
}

uint64_t LXCursorIsRoot()
{
  return MEMORY[0x1E0D43588]();
}

uint64_t LXCursorPrefixProbability()
{
  return MEMORY[0x1E0D43598]();
}

uint64_t LXCursorTerminationProbability()
{
  return MEMORY[0x1E0D435A8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1E0D435C8]();
}

uint64_t LXEntryCreateMutable()
{
  return MEMORY[0x1E0D435D8]();
}

uint64_t LXEntryCreateMutableCopy()
{
  return MEMORY[0x1E0D435E0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1E0D43600]();
}

uint64_t LXEntryGetPartialProbability()
{
  return MEMORY[0x1E0D43608]();
}

uint64_t LXEntryGetPenaltyCount()
{
  return MEMORY[0x1E0D43610]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1E0D43618]();
}

uint64_t LXEntryGetTimestamp()
{
  return MEMORY[0x1E0D43620]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x1E0D43628]();
}

uint64_t LXEntryGetUsageCount()
{
  return MEMORY[0x1E0D43630]();
}

uint64_t LXEntryGetUserBitfield()
{
  return MEMORY[0x1E0D43638]();
}

uint64_t LXLemmatizerCreate()
{
  return MEMORY[0x1E0D43640]();
}

uint64_t LXLemmatizerEnumerateLemmasforString()
{
  return MEMORY[0x1E0D43648]();
}

uint64_t LXLexiconAdd()
{
  return MEMORY[0x1E0D43650]();
}

uint64_t LXLexiconAddEntryWithTokenID()
{
  return MEMORY[0x1E0D43658]();
}

uint64_t LXLexiconClear()
{
  return MEMORY[0x1E0D43668]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x1E0D43678]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1E0D43690]();
}

uint64_t LXLexiconCreateMutable()
{
  return MEMORY[0x1E0D43698]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x1E0D436A0]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1E0D436B8]();
}

uint64_t LXLexiconIncrementPenaltyCount()
{
  return MEMORY[0x1E0D436D8]();
}

uint64_t LXLexiconIncrementUsageCount()
{
  return MEMORY[0x1E0D436E0]();
}

uint64_t LXLexiconLockMemory()
{
  return MEMORY[0x1E0D436E8]();
}

uint64_t LXLexiconRemoveEntry()
{
  return MEMORY[0x1E0D436F0]();
}

uint64_t LXLexiconRepositoryAddOrUpdate()
{
  return MEMORY[0x1E0D436F8]();
}

uint64_t LXLexiconSerializedSize()
{
  return MEMORY[0x1E0D43708]();
}

uint64_t LXLexiconSetUserBitfield()
{
  return MEMORY[0x1E0D43710]();
}

uint64_t LXLexiconUnlockMemory()
{
  return MEMORY[0x1E0D43718]();
}

uint64_t LXLexiconUpdateMetaFlags()
{
  return MEMORY[0x1E0D43720]();
}

uint64_t LXLexiconWrite()
{
  return MEMORY[0x1E0D43728]();
}

uint64_t LXLexiconWriteDebugDump()
{
  return MEMORY[0x1E0D43730]();
}

uint64_t LXMutableEntrySetMetaFlags()
{
  return MEMORY[0x1E0D43738]();
}

uint64_t LXMutableEntryUpdateUsageCount()
{
  return MEMORY[0x1E0D43740]();
}

uint64_t LXTransliterationCopyNativeForTransliterated()
{
  return MEMORY[0x1E0D43748]();
}

uint64_t LXTransliterationCreate()
{
  return MEMORY[0x1E0D43750]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x1E0DE41A0](retstr, this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1E0DE41F8](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x1E0DE4238](this, a2.__data_, a2.__size_);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A0]();
}

{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1E0DE45E8]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1E0DE45F0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4648]();
}

{
  return MEMORY[0x1E0DE4650]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4730]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4820](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4828](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1E0DE4838](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4840](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4858]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F8](this, a2, a3, a4);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A78](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

uint64_t std::__sort<std::__less<char,char> &,char *>()
{
  return MEMORY[0x1E0DE4AD8]();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x1E0DE4B00]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1E0DE4B10]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B48]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
  MEMORY[0x1E0DE4C70](this, a2);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const std::string *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x1E0DE4CA8](this, __msg, __ec);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D40](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1E0DE4D50](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E3D2F388();
}

void operator delete(void *__p)
{
  off_1E3D2F390(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E3D2F398(__p, a2);
}

uint64_t operator delete()
{
  return off_1E3D2F3A0();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1E3D2F3A8(__sz);
}

uint64_t operator new[]()
{
  return off_1E3D2F3B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E3D2F3B8(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E3D2F3C0(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E3D2F3C8(__sz, a2);
}

uint64_t operator new()
{
  return off_1E3D2F3D0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t cmph_search_packed()
{
  return MEMORY[0x1E0DE5268]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
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

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x1E0C832A0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
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

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x1E0C83BD8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C844A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1E0DE8558](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1E0DE8560](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1E0DE8578](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1E0DE5978](*(_QWORD *)&c);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1E0DE5AA0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x1E0DE5CB0]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1E0DE5CE0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x1E0DE5D10]();
}

uint64_t ucol_close()
{
  return MEMORY[0x1E0DE5F70]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x1E0DE5FD0]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x1E0DE5FE8]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1E0DE6008]();
}

uint64_t ucol_openBinary()
{
  return MEMORY[0x1E0DE6010]();
}

uint64_t ucol_openRules()
{
  return MEMORY[0x1E0DE6020]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1E0DE6030]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x1E0DE6038]();
}

uint64_t ulocdata_close()
{
  return MEMORY[0x1E0DE6488]();
}

uint64_t ulocdata_getExemplarSet()
{
  return MEMORY[0x1E0DE64A0]();
}

uint64_t ulocdata_open()
{
  return MEMORY[0x1E0DE64B0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t uset_addAll()
{
  return MEMORY[0x1E0DE6940]();
}

uint64_t uset_addRange()
{
  return MEMORY[0x1E0DE6950]();
}

uint64_t uset_addString()
{
  return MEMORY[0x1E0DE6958]();
}

uint64_t uset_close()
{
  return MEMORY[0x1E0DE6988]();
}

uint64_t uset_contains()
{
  return MEMORY[0x1E0DE6998]();
}

uint64_t uset_openEmpty()
{
  return MEMORY[0x1E0DE69D8]();
}

uint64_t uset_toPattern()
{
  return MEMORY[0x1E0DE6A28]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1E0DE6A50](ut);
}

UText *__cdecl utext_openUTF8(UText *ut, const char *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1E0DE6A98](ut, s, length, status);
}

int32_t utf8_back1SafeBody(const uint8_t *s, int32_t start, int32_t i)
{
  return MEMORY[0x1E0DE6AB8](s, *(_QWORD *)&start, *(_QWORD *)&i);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

