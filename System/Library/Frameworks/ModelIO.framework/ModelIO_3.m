void sub_1DCC1ADA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_1DCC1ADCC(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  size_t v4;

  v2 = a1[1] - *a1;
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1DCAE4B1C(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }
}

id sub_1DCC1ADF4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v6 = sub_1DCC15118(a1, a2);
  v7 = 12 * v6;
  if (12 * v6 - 1 >= a3)
  {
    v19 = 0;
  }
  else
  {
    v8 = malloc_type_malloc(12 * v6, 0xE312B385uLL);
    v10 = v8;
    v11 = a2 - 2;
    if (a2 != 2)
    {
      v12 = 0;
      v13 = v8;
      do
      {
        if (v12 <= v11)
          v14 = a2 - 2;
        else
          v14 = v12;
        while (v14 != v12)
        {
          v15 = a1 + v12;
          v16 = *(unsigned __int8 *)(a1 + v12++);
          if (v16 != *(unsigned __int8 *)(v15 + 1))
          {
            v14 = v12 - 1;
            break;
          }
        }
        *v13 = *(unsigned __int8 *)(a1 + v14);
        if ((v14 & 1) != 0)
          v17 = 1;
        else
          v17 = 2;
        if ((v14 & 1) != 0)
          v18 = 2;
        else
          v18 = 1;
        v13[1] = *(unsigned __int8 *)(a1 + v14 + v17);
        v13[2] = *(unsigned __int8 *)(a1 + v14 + v18);
        if (v14 < a2 - 3 && *(unsigned __int8 *)(v14 + a1 + 2) == *(unsigned __int8 *)(a1 + v14 + 3))
          v14 += 3;
        v13 += 3;
        v12 = v14 + 1;
      }
      while (v14 + 1 < v11);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)v8, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }
  return v19;
}

id sub_1DCC1AF1C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;

  v6 = sub_1DCC15198(a1, a2);
  v7 = 12 * v6;
  if (12 * v6 - 1 >= a3)
  {
    v20 = 0;
  }
  else
  {
    v8 = malloc_type_malloc(12 * v6, 0xE312B385uLL);
    v10 = v8;
    v11 = a2 - 2;
    if (a2 != 2)
    {
      v12 = 0;
      v13 = v8;
      do
      {
        if (v12 <= v11)
          v14 = a2 - 2;
        else
          v14 = v12;
        while (v14 != v12)
        {
          v15 = (unsigned __int16 *)(a1 + 2 * v12++);
          if (*v15 != v15[1])
          {
            v14 = v12 - 1;
            break;
          }
        }
        if ((v14 & 1) != 0)
          v16 = 1;
        else
          v16 = 2;
        if ((v14 & 1) != 0)
          v17 = 2;
        else
          v17 = 1;
        v18 = *(unsigned __int16 *)(a1 + 2 * (v14 + v17));
        v19 = *(unsigned __int16 *)(a1 + 2 * (v14 + v16));
        *v13 = *(unsigned __int16 *)(a1 + 2 * v14);
        v13[1] = v19;
        v13[2] = v18;
        if (v14 < a2 - 3 && *(unsigned __int16 *)(a1 + 2 * v14 + 4) == *(unsigned __int16 *)(a1 + 2 * (v14 + 3)))
          v14 += 3;
        v13 += 3;
        v12 = v14 + 1;
      }
      while (v14 + 1 < v11);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }
  return v20;
}

id sub_1DCC1B040(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = sub_1DCC15218(a1, a2);
  v7 = 12 * v6;
  if (12 * v6 - 1 >= a3)
  {
    v18 = 0;
  }
  else
  {
    v8 = malloc_type_malloc(12 * v6, 0xE312B385uLL);
    v10 = v8;
    v11 = a2 - 2;
    if (a2 != 2)
    {
      v12 = 0;
      v13 = v8;
      do
      {
        if (v12 <= v11)
          v14 = a2 - 2;
        else
          v14 = v12;
        while (v14 != v12)
        {
          v15 = (_DWORD *)(a1 + 4 * v12++);
          if (*v15 != v15[1])
          {
            v14 = v12 - 1;
            break;
          }
        }
        *v13 = *(_DWORD *)(a1 + 4 * v14);
        if ((v14 & 1) != 0)
          v16 = 1;
        else
          v16 = 2;
        if ((v14 & 1) != 0)
          v17 = 2;
        else
          v17 = 1;
        v13[1] = *(_DWORD *)(a1 + 4 * (v14 + v16));
        v13[2] = *(_DWORD *)(a1 + 4 * (v14 + v17));
        if (v14 < a2 - 3 && *(_DWORD *)(a1 + 4 * v14 + 8) == *(_DWORD *)(a1 + 4 * (v14 + 3)))
          v14 += 3;
        v13 += 3;
        v12 = v14 + 1;
      }
      while (v14 + 1 < v11);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)v8, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }
  return v18;
}

id sub_1DCC1B164(uint64_t a1, unint64_t a2)
{
  void *v2;
  size_t v5;
  const char *v6;
  _BYTE *v7;
  unint64_t v8;
  _BYTE *v9;

  if (a2 >= 2)
  {
    v5 = 3 * (a2 >> 1);
    v7 = malloc_type_malloc(v5, 0x6AE4B2B9uLL);
    v8 = 0;
    v9 = v7;
    do
    {
      *v9 = *(_BYTE *)(a1 + v8);
      v9[1] = *(_BYTE *)(a1 + v8 + 1);
      v9[2] = *(_BYTE *)(a1 + v8 + 2);
      v9[3] = *(_BYTE *)(a1 + v8);
      v9[4] = *(_BYTE *)(a1 + v8 + 2);
      v9[5] = *(_BYTE *)(a1 + v8 + 3);
      v9 += 6;
      v8 += 4;
    }
    while (v8 < a2);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v7, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id sub_1DCC1B230(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  const char *v6;
  void *v7;
  unint64_t v8;
  _WORD *v9;
  _WORD *v10;

  v2 = 6 * (a2 >> 1);
  if (v2)
  {
    v5 = malloc_type_malloc(6 * (a2 >> 1), 0x6AE4B2B9uLL);
    v7 = v5;
    if (a2)
    {
      v8 = 0;
      v9 = v5;
      do
      {
        v10 = (_WORD *)(a1 + 2 * v8);
        *v9 = *v10;
        v9[1] = v10[1];
        v9[2] = v10[2];
        v9[3] = *v10;
        v9[4] = v10[2];
        v9[5] = v10[3];
        v8 += 4;
        v9 += 6;
      }
      while (v8 < a2);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v5, v2);
    v2 = objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  return (id)v2;
}

id sub_1DCC1B2F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  const char *v6;
  void *v7;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v10;

  v2 = 12 * (a2 >> 1);
  if (v2)
  {
    v5 = malloc_type_malloc(12 * (a2 >> 1), 0x6AE4B2B9uLL);
    v7 = v5;
    if (a2)
    {
      v8 = 0;
      v9 = v5;
      do
      {
        v10 = (_DWORD *)(a1 + 4 * v8);
        *v9 = *v10;
        v9[1] = v10[1];
        v9[2] = v10[2];
        v9[3] = *v10;
        v9[4] = v10[2];
        v9[5] = v10[3];
        v8 += 4;
        v9 += 6;
      }
      while (v8 < a2);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v5, v2);
    v2 = objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  return (id)v2;
}

void sub_1DCC1B498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1DCC1B57C(_QWORD *a1, __n128 a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __n128 *v6;
  __n128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 *v11;
  uint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  __n128 v16;

  v5 = a1[8];
  v3 = (uint64_t)(a1 + 8);
  v4 = v5;
  v6 = *(__n128 **)(v3 - 16);
  *(_QWORD *)(v3 - 8) = v6;
  if ((unint64_t)v6 >= v5)
  {
    v8 = v4 - (_QWORD)v6;
    v9 = v8 >> 4;
    if ((unint64_t)(v8 >> 4) <= 1)
      v9 = 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v10 = 0x7FFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v11 = (__n128 *)sub_1DCAF116C(v3, v10);
    v13 = &v11[2 * v12];
    v11->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v11[1] = a2;
    v7 = v11 + 2;
    v15 = (__n128 *)a1[6];
    v14 = (__n128 *)a1[7];
    if (v14 != v15)
    {
      do
      {
        v16 = v14[-1];
        v11[-2] = v14[-2];
        v11[-1] = v16;
        v11 -= 2;
        v14 -= 2;
      }
      while (v14 != v15);
      v14 = (__n128 *)a1[6];
    }
    a1[6] = v11;
    a1[7] = v7;
    a1[8] = v13;
    if (v14)
      operator delete(v14);
  }
  else
  {
    v6->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v6[1] = a2;
    v7 = v6 + 2;
  }
  a1[7] = v7;
  sub_1DCB47B94((uint64_t)a1);
}

void sub_1DCC1B670(_QWORD *a1, __n128 a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __n128 *v6;
  __n128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 *v11;
  uint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  __n128 v16;

  v5 = a1[11];
  v3 = (uint64_t)(a1 + 11);
  v4 = v5;
  v6 = *(__n128 **)(v3 - 16);
  *(_QWORD *)(v3 - 8) = v6;
  if ((unint64_t)v6 >= v5)
  {
    v8 = v4 - (_QWORD)v6;
    v9 = v8 >> 4;
    if ((unint64_t)(v8 >> 4) <= 1)
      v9 = 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v10 = 0x7FFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v11 = (__n128 *)sub_1DCAF116C(v3, v10);
    v13 = &v11[2 * v12];
    v11->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v11[1] = a2;
    v7 = v11 + 2;
    v15 = (__n128 *)a1[9];
    v14 = (__n128 *)a1[10];
    if (v14 != v15)
    {
      do
      {
        v16 = v14[-1];
        v11[-2] = v14[-2];
        v11[-1] = v16;
        v11 -= 2;
        v14 -= 2;
      }
      while (v14 != v15);
      v14 = (__n128 *)a1[9];
    }
    a1[9] = v11;
    a1[10] = v7;
    a1[11] = v13;
    if (v14)
      operator delete(v14);
  }
  else
  {
    v6->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v6[1] = a2;
    v7 = v6 + 2;
  }
  a1[10] = v7;
  sub_1DCB47B94((uint64_t)a1);
}

void sub_1DCC1B76C(_QWORD *a1, __n128 a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __n128 *v6;
  __n128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 *v11;
  uint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  __n128 v16;

  v5 = a1[5];
  v3 = (uint64_t)(a1 + 5);
  v4 = v5;
  v6 = *(__n128 **)(v3 - 16);
  *(_QWORD *)(v3 - 8) = v6;
  if ((unint64_t)v6 >= v5)
  {
    v8 = v4 - (_QWORD)v6;
    v9 = v8 >> 4;
    if ((unint64_t)(v8 >> 4) <= 1)
      v9 = 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v10 = 0x7FFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v11 = (__n128 *)sub_1DCAF116C(v3, v10);
    v13 = &v11[2 * v12];
    v11->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v11[1] = a2;
    v7 = v11 + 2;
    v15 = (__n128 *)a1[3];
    v14 = (__n128 *)a1[4];
    if (v14 != v15)
    {
      do
      {
        v16 = v14[-1];
        v11[-2] = v14[-2];
        v11[-1] = v16;
        v11 -= 2;
        v14 -= 2;
      }
      while (v14 != v15);
      v14 = (__n128 *)a1[3];
    }
    a1[3] = v11;
    a1[4] = v7;
    a1[5] = v13;
    if (v14)
      operator delete(v14);
  }
  else
  {
    v6->n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v6[1] = a2;
    v7 = v6 + 2;
  }
  a1[4] = v7;
  sub_1DCB47B94((uint64_t)a1);
}

void sub_1DCC1B934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1B9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1BA50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1BAA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1BBD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1BD5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1BF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;
  void *v28;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

BOOL MDLAABB::intersect(MDLAABB *this, float32x4_t *a2, float *a3, float *a4, unsigned __int8 *a5)
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  float32x4_t v8;
  __int128 v9;
  uint64_t v10;
  __int32 *v11;
  __int32 *v12;
  uint64_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  int8x8_t v23;
  int8x8_t v24;
  float v25;
  _OWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)this;
  v27[0] = *((_OWORD *)this + 1);
  v27[1] = v5;
  v6 = a2[3].u8[0];
  v7 = v27[v6];
  v8 = a2[2];
  v9 = v27[v6 ^ 1];
  v10 = a2[3].u8[1];
  v11 = (__int32 *)((unint64_t)&v27[v10] | 4);
  v12 = (__int32 *)((unint64_t)&v27[v10 ^ 1] | 4);
  v13 = a2[3].u8[2];
  v14.i32[0] = DWORD2(v27[v13]);
  v14.i32[1] = *(_DWORD *)((unint64_t)&v27[v13 ^ 1] | 8);
  v15 = vmul_laneq_f32(vsub_f32(v14, (float32x2_t)vdup_laneq_s32(*(int32x4_t *)a2, 2)), v8, 2);
  v16 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v7, 0);
  if (v15.f32[1] >= v15.f32[0])
    v17 = v15.f32[0];
  else
    v17 = v15.f32[1];
  v16.i32[0] = *v11;
  v18 = (float32x2_t)vrev64_s32(*(int32x2_t *)a2->f32);
  v19 = (float32x2_t)vrev64_s32(*(int32x2_t *)v8.f32);
  v20 = vmul_f32(vsub_f32(v16, v18), v19);
  v21 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v9, 0);
  v21.i32[0] = *v12;
  v22 = vmul_f32(vsub_f32(v21, v18), v19);
  v23 = vbsl_s8((int8x8_t)vcgt_f32(v20, v22), (int8x8_t)v22, (int8x8_t)v20);
  if (*(float *)&v23.i32[1] >= *(float *)v23.i32)
    v23.i32[0] = v23.i32[1];
  if (*(float *)v23.i32 < v17)
    *(float *)v23.i32 = v17;
  *a3 = *(float *)v23.i32;
  v24 = vbsl_s8((int8x8_t)vcgt_f32(v22, v20), (int8x8_t)v22, (int8x8_t)v20);
  if (v15.f32[0] >= v15.f32[1])
    v25 = v15.f32[0];
  else
    v25 = v15.f32[1];
  if (*(float *)v24.i32 >= *(float *)&v24.i32[1])
    v24.i32[0] = v24.i32[1];
  if (v25 < *(float *)v24.i32)
    *(float *)v24.i32 = v25;
  *a4 = *(float *)v24.i32;
  *a5 = (*(float *)v24.i32 == v22.f32[1]) | (2 * (*(float *)v24.i32 == v22.f32[0])) | (4
                                                                                     * (*(float *)v24.i32 == v15.f32[1]));
  return *a4 >= *a3;
}

BOOL MDLAABB::intersect(__int128 *a1, uint64_t a2, float32x2_t *a3, float *a4, float *a5, float *a6, _BYTE *a7)
{
  __int128 v7;
  float v8;
  __int128 v9;
  int8x8_t v10;
  float32x2_t v11;
  float32x2_t v12;
  int8x8_t v13;
  float v14;
  float v15;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = *a1;
  v17[0] = a1[1];
  v17[1] = v7;
  a3->f32[0] = (float)(*(float *)&v17[*(unsigned __int8 *)(a2 + 48)] - *(float *)a2) * *(float *)(a2 + 32);
  *a4 = (float)(*(float *)&v17[*(unsigned __int8 *)(a2 + 48) ^ 1] - *(float *)a2) * *(float *)(a2 + 32);
  a3->f32[1] = (float)(*((float *)&v17[*(unsigned __int8 *)(a2 + 49)] + 1) - *(float *)(a2 + 4)) * *(float *)(a2 + 36);
  a4[1] = (float)(*((float *)&v17[*(unsigned __int8 *)(a2 + 49) ^ 1] + 1) - *(float *)(a2 + 4)) * *(float *)(a2 + 36);
  a3[1].f32[0] = (float)(*((float *)&v17[*(unsigned __int8 *)(a2 + 50)] + 2) - *(float *)(a2 + 8)) * *(float *)(a2 + 40);
  v8 = (float)(*((float *)&v17[*(unsigned __int8 *)(a2 + 50) ^ 1] + 2) - *(float *)(a2 + 8)) * *(float *)(a2 + 40);
  v9 = *(_OWORD *)a4;
  a4[2] = v8;
  v10 = vbsl_s8((int8x8_t)vcgt_f32(*a3, *(float32x2_t *)&v9), *(int8x8_t *)&v9, (int8x8_t)*a3);
  if (*(float *)v10.i32 < *(float *)&v10.i32[1])
    v10.i32[0] = v10.i32[1];
  if (v8 >= COERCE_FLOAT(*(_QWORD *)&a3[1]))
    LODWORD(v8) = a3[1];
  if (*(float *)v10.i32 >= v8)
    v8 = *(float *)v10.i32;
  *a5 = v8;
  v11 = (float32x2_t)vrev64_s32((int32x2_t)*a3);
  v12 = (float32x2_t)vrev64_s32(*(int32x2_t *)a4);
  v13 = vbsl_s8((int8x8_t)vcgt_f32(v12, v11), (int8x8_t)v12, (int8x8_t)v11);
  v14 = COERCE_FLOAT(*(_QWORD *)&a3[1]);
  if (v14 < COERCE_FLOAT(*((_QWORD *)a4 + 1)))
    LODWORD(v14) = *((_QWORD *)a4 + 1);
  if (*(float *)v13.i32 >= *(float *)&v13.i32[1])
    v15 = *(float *)&v13.i32[1];
  else
    v15 = *(float *)v13.i32;
  if (v14 >= v15)
    v14 = v15;
  *a6 = v14;
  *a7 = (v14 == *a4) | (2 * (v14 == a4[1])) | (4 * (v14 == a4[2]));
  return *a6 >= *a5;
}

void sub_1DCC1C39C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1C42C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1C544(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1C624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1C6BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1C888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1C994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1CA9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1CB10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1CBA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1CD10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL sub_1DCC1CD44(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  char *v7;
  void **v8;
  FILE *v9;
  _BOOL8 v10;
  void *__p[2];
  uint64_t v13;

  objc_msgSend_path(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    __p[0] = 0;
    __p[1] = 0;
    v13 = 0;
    v5 = objc_retainAutorelease(v3);
    v7 = (char *)objc_msgSend_cStringUsingEncoding_(v5, v6, 4);
    sub_1DCB0345C(__p, v7);
    if (v13 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    v9 = fopen((const char *)v8, "rb");
    v10 = v9 != 0;
    if (v9)
      fclose(v9);
    if (SHIBYTE(v13) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1DCC1CDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

FILE *sub_1DCC1CE1C(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  char *v7;
  void **v8;
  FILE *v9;
  void *__p[2];
  uint64_t v12;

  objc_msgSend_path(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    __p[0] = 0;
    __p[1] = 0;
    v12 = 0;
    v5 = objc_retainAutorelease(v3);
    v7 = (char *)objc_msgSend_cStringUsingEncoding_(v5, v6, 4);
    sub_1DCB0345C(__p, v7);
    if (v12 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    v9 = fopen((const char *)v8, "rb");
    if (SHIBYTE(v12) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1DCC1CEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

FILE *sub_1DCC1CEE8(void *a1, const char *a2, uint64_t a3)
{
  FILE *result;
  FILE *v4;
  uint64_t v5;

  result = sub_1DCC1CE1C(a1, a2, a3);
  if (result)
  {
    v4 = result;
    fseek(result, 0, 2);
    v5 = MEMORY[0x1DF0D24FC](v4);
    fseek(v4, 0, 0);
    fclose(v4);
    return (FILE *)v5;
  }
  return result;
}

void sub_1DCC1CF40(uint64_t a1, uint64_t *a2, void *a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  const char *v41;
  id v42;
  void *v43;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __n128 v52;
  __n128 v53;
  __n128 v54;
  __n128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[4];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend_transform(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v13;
  if (v13)
  {
    objc_msgSend_matrix(v13, v14, v15);
    v16 = 0;
    v61[0] = v17;
    v61[1] = v18;
    v61[2] = v19;
    v61[3] = v20;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v52 + v16 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)a4, COERCE_FLOAT(v61[v16])), (float32x4_t)a5, *(float32x2_t *)&v61[v16], 1), (float32x4_t)a6, (float32x4_t)v61[v16], 2), (float32x4_t)a7, (float32x4_t)v61[v16], 3);
      ++v16;
    }
    while (v16 != 4);
    a5 = v53;
    a4 = v52;
    a7 = v55;
    a6 = v54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v10;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v42 = v23;
    objc_msgSend_submeshes(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v57, v63, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v58 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v52 = 0u;
          sub_1DCC1D2AC(a2, (__int128 *)&v52);

          v32 = a2[1];
          *(__n128 *)(v32 - 80) = a4;
          *(__n128 *)(v32 - 64) = a5;
          *(__n128 *)(v32 - 48) = a6;
          *(__n128 *)(v32 - 32) = a7;
          objc_storeStrong((id *)(a2[1] - 16), a3);
          objc_storeStrong((id *)(a2[1] - 8), v31);
        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v33, (uint64_t)&v57, v63, 16);
      }
      while (v28);
    }

  }
  objc_msgSend_children(v10, v21, v22);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = v34;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v48, v62, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v49 != v39)
            objc_enumerationMutation(v36);
          sub_1DCC1CF40(a1, a2, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j), a4, a5, a6, a7);
        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v41, (uint64_t)&v48, v62, 16);
      }
      while (v38);
    }

  }
}

void sub_1DCC1D228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t sub_1DCC1D2AC(uint64_t *a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_OWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v13 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v7 - *a1) >> 4);
    v14 = v13 + 1;
    if (v13 + 1 > 0x333333333333333)
      sub_1DCAE4C44();
    v15 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x199999999999999)
      v16 = 0x333333333333333;
    else
      v16 = v14;
    v24[4] = result;
    v17 = (char *)sub_1DCB00E24(result, v16);
    v18 = &v17[80 * v13];
    v24[0] = v17;
    v24[1] = v18;
    v24[3] = &v17[80 * v19];
    v21 = *a2;
    v20 = a2[1];
    v22 = a2[3];
    *((_OWORD *)v18 + 2) = a2[2];
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)v18 = v21;
    *((_OWORD *)v18 + 1) = v20;
    v23 = a2[4];
    *((_QWORD *)a2 + 8) = 0;
    *((_QWORD *)a2 + 9) = 0;
    *((_OWORD *)v18 + 4) = v23;
    v24[2] = v18 + 80;
    sub_1DCC1D764(a1, v24);
    v12 = (_OWORD *)a1[1];
    result = sub_1DCC1D988((uint64_t)v24);
  }
  else
  {
    v8 = *a2;
    v9 = a2[1];
    v10 = a2[3];
    v7[2] = a2[2];
    v7[3] = v10;
    *v7 = v8;
    v7[1] = v9;
    v11 = a2[4];
    *((_QWORD *)a2 + 8) = 0;
    *((_QWORD *)a2 + 9) = 0;
    v7[4] = v11;
    v12 = v7 + 5;
    a1[1] = (uint64_t)(v7 + 5);
  }
  a1[1] = (uint64_t)v12;
  return result;
}

void sub_1DCC1D3CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DCC1D988((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DCC1D3E0(uint64_t a1, uint64_t *a2, void *a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  const char *v42;
  id v43;
  void *v44;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __n128 v53;
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _OWORD v62[4];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend_transform(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  if (v12)
  {
    objc_msgSend_matrix(v12, v13, v14);
    v15 = 0;
    v62[0] = v16;
    v62[1] = v17;
    v62[2] = v18;
    v62[3] = v19;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v53 + v15 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)a4, COERCE_FLOAT(v62[v15])), (float32x4_t)a5, *(float32x2_t *)&v62[v15], 1), (float32x4_t)a6, (float32x4_t)v62[v15], 2), (float32x4_t)a7, (float32x4_t)v62[v15], 3);
      ++v15;
    }
    while (v15 != 4);
    a5 = v54;
    a4 = v53;
    a7 = v56;
    a6 = v55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v9;
    objc_msgSend_coarseMesh(v43, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend_submeshes(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v58, v64, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v59 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v53 = 0u;
          sub_1DCC1D2AC(a2, (__int128 *)&v53);

          v33 = a2[1];
          *(__n128 *)(v33 - 80) = a4;
          *(__n128 *)(v33 - 64) = a5;
          *(__n128 *)(v33 - 48) = a6;
          *(__n128 *)(v33 - 32) = a7;
          objc_storeStrong((id *)(a2[1] - 16), v24);
          objc_storeStrong((id *)(a2[1] - 8), v32);
        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v34, (uint64_t)&v58, v64, 16);
      }
      while (v29);
    }

  }
  objc_msgSend_children(v9, v20, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v37 = v35;
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v49, v63, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v50 != v40)
            objc_enumerationMutation(v37);
          sub_1DCC1D3E0(a1, a2, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), a4, a5, a6, a7);
        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v42, (uint64_t)&v49, v63, 16);
      }
      while (v39);
    }

  }
}

void sub_1DCC1D6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sub_1DCC1D764(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DCC1D7D8((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1DCC1D7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v7 = a7;
  *(_QWORD *)&v18 = a6;
  *((_QWORD *)&v18 + 1) = a7;
  v17 = v18;
  v15[0] = a1;
  v15[1] = &v17;
  v15[2] = &v18;
  v16 = 0;
  if (a3 == a5)
  {
    v13 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 80);
      v10 = *(_OWORD *)(a3 - 64);
      v11 = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 - 48);
      *(_OWORD *)(v8 - 32) = v11;
      *(_OWORD *)(v8 - 80) = v9;
      *(_OWORD *)(v8 - 64) = v10;
      v12 = *(_OWORD *)(a3 - 16);
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_OWORD *)(v8 - 16) = v12;
      v8 -= 80;
      v7 -= 80;
      a3 -= 80;
    }
    while (a3 != a5);
    *((_QWORD *)&v18 + 1) = v8;
    v13 = v18;
  }
  LOBYTE(v16) = 1;
  sub_1DCC1D880((uint64_t)v15);
  return v13;
}

uint64_t sub_1DCC1D880(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DCC1D8B4((uint64_t *)a1);
  return a1;
}

void sub_1DCC1D8B4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v14 = v3;
  v15 = v2;
  v16 = v3;
  v17 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v9 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v6;
  sub_1DCC1D928(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_1DCC1D928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t i;

  for (i = *(_QWORD *)(a2 + 32); i != *(_QWORD *)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {

    i = *(_QWORD *)(a2 + 32) + 80;
  }
}

uint64_t sub_1DCC1D988(uint64_t a1)
{
  sub_1DCC1D9BC(a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DCC1D9BC(uint64_t a1, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 80;

  }
}

void sub_1DCC1DA6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1DCC1DA94@<X0>(uint64_t a1@<X0>, unsigned __int8 **a2@<X8>)
{
  unint64_t v3;
  char *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  _BYTE *v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned int v14;
  unint64_t v16;
  unsigned __int8 **v17;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_1DCACA658(a2, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    a2[2] = *(unsigned __int8 **)(a1 + 16);
  }
  LODWORD(v3) = *((char *)a2 + 23);
  v4 = (char *)*a2;
  if ((v3 & 0x80000000) == 0)
    v4 = (char *)a2;
  v5 = *v4;
  v6 = MEMORY[0x1E0C80978];
  if ((v5 & 0x80000000) != 0)
  {
    result = __maskrune(v5, 0x100uLL);
    LOBYTE(v3) = *((_BYTE *)a2 + 23);
    if ((_DWORD)result)
      goto LABEL_16;
  }
  else
  {
    result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v5 + 60) & 0x100;
    if ((_DWORD)result)
      goto LABEL_16;
  }
  if ((v3 & 0x80) != 0)
  {
    v9 = *a2;
    v8 = **a2;
    if (v8 == 58)
      goto LABEL_16;
  }
  else
  {
    v8 = *(unsigned __int8 *)a2;
    if (v8 == 58)
      goto LABEL_16;
    v9 = a2;
  }
  if (v8 != 95)
  {
    *v9 = 95;
    LOBYTE(v3) = *((_BYTE *)a2 + 23);
  }
LABEL_16:
  v10 = (v3 & 0x80u) != 0;
  v11 = v10;
  v3 = v3;
  if (v10)
    v3 = (unint64_t)a2[1];
  if (v3 >= 2)
  {
    v12 = 1;
    do
    {
      v13 = (unsigned __int8 **)*a2;
      if (!v11)
        v13 = a2;
      v14 = *((char *)v13 + v12);
      if ((v14 & 0x80000000) != 0)
        result = __maskrune(*((char *)v13 + v12), 0x500uLL);
      else
        result = *(_DWORD *)(v6 + 4 * v14 + 60) & 0x500;
      if (!(_DWORD)result
        && (v14 - 45 > 0x32
         || ((1 << (v14 - 45)) & 0x4000000002003) == 0))
      {
        if (*((char *)a2 + 23) >= 0)
          v17 = a2;
        else
          v17 = (unsigned __int8 **)*a2;
        *((_BYTE *)v17 + v12) = 95;
      }
      ++v12;
      v11 = *((char *)a2 + 23) < 0;
      v16 = *((unsigned __int8 *)a2 + 23);
      if ((v16 & 0x80u) != 0)
        v16 = (unint64_t)a2[1];
    }
    while (v12 < v16);
  }
  return result;
}

void sub_1DCC1DC40(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_1DCC1E064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  sub_1DCC1EBF8((uint64_t)&a26);
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  __p = &a23;
  sub_1DCB2ED4C((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_1DCC1E314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1DCC1E418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1E60C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC1E6C4(void *a1@<X0>, float32x4_t *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  unint64_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  void *v27;
  const char *v28;
  uint64_t v29;
  float32x4_t v30;
  float32x4_t v31;
  void *v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v55 = v5;
  objc_msgSend_transform(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a2[1];
  v64 = *a2;
  v65 = v11;
  v12 = a2[3];
  v66 = a2[2];
  v67 = v12;
  v53 = v8;
  if (v8)
  {
    objc_msgSend_matrix(v8, v9, v10);
    v13 = 0;
    v68 = v14;
    v69 = v15;
    v70 = v16;
    v71 = v17;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v18 = v64;
    v20 = v66;
    v19 = v65;
    v21 = v67;
    do
    {
      *(float32x4_t *)((char *)&v72 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)((char *)&v68 + v13))), v19, *(float32x2_t *)&v68.f32[v13 / 4], 1), v20, *(float32x4_t *)((char *)&v68 + v13), 2), v21, *(float32x4_t *)((char *)&v68 + v13), 3);
      v13 += 16;
    }
    while (v13 != 64);
    v64 = v72;
    v65 = v73;
    v66 = v74;
    v67 = v75;
  }
  __asm { FMOV            V1.4S, #-1.0 }
  *(_OWORD *)a3 = _Q1;
  *(_OWORD *)(a3 + 16) = 0u;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v55;
  else
    v27 = 0;
  v54 = v27;
  if (v54)
  {
    objc_msgSend_boundingBox(v54, v28, v29);
    v72 = v30;
    v73 = v31;
    sub_1DCB22BEC((float32x4_t *)a3, (__int128 *)&v72, &v64);
  }
  objc_msgSend_children(v55, v28, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v52 = v32;
    v33 = v32;
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v60, v76, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v61 != v38)
            objc_enumerationMutation(v33);
          v40 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend_transform(v40, v35, v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend_transform(v40, v41, v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_matrix(v44, v45, v46);
            v51 = 0;
            v68 = v64;
            v69 = v65;
            v70 = v66;
            v71 = v67;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v72 + v51) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(_OWORD *)((char *)&v68 + v51))), v48, *(float32x2_t *)&v68.f32[v51 / 4], 1), v49, *(float32x4_t *)((char *)&v68 + v51), 2), v50, *(float32x4_t *)((char *)&v68 + v51), 3);
              v51 += 16;
            }
            while (v51 != 64);
            v56 = v72;
            v57 = v73;
            v58 = v74;
            v59 = v75;

          }
          else
          {
            v56 = v64;
            v57 = v65;
            v58 = v66;
            v59 = v67;
          }

          sub_1DCC1E6C4(&v72, v40, &v56);
          sub_1DCB22B5C((float32x4_t *)a3, &v72);
        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v60, v76, 16);
      }
      while (v37);
    }

    v32 = v52;
  }

}

void sub_1DCC1E9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t sub_1DCC1EA70(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DCC1EAE4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1DCC1EAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  v13 = 0;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  LOBYTE(v13) = 1;
  sub_1DCC1EB80((uint64_t)v12);
  return a6;
}

uint64_t sub_1DCC1EB80(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DCC1EBB4(a1);
  return a1;
}

void sub_1DCC1EBB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t sub_1DCC1EBF8(uint64_t a1)
{
  sub_1DCC1EC2C(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DCC1EC2C(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t sub_1DCC1EC80(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_1DCAE4C44();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_1DCB01278(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_1DCACA658(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_1DCC1EA70(a1, v15);
  v13 = a1[1];
  sub_1DCC1EBF8((uint64_t)v15);
  return v13;
}

void sub_1DCC1ED8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DCC1EBF8((uint64_t)va);
  _Unwind_Resume(a1);
}

float sub_1DCC1EDA0(int a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;

  v1 = (__int16)a1 & 0x80000000;
  v2 = a1 & 0x3FF;
  v3 = a1 & 0x7C00;
  if ((a1 & 0x7C00) == 0)
  {
    v5 = __clz(v2);
    v6 = a1 << (v5 - 21);
    v7 = 1124073472 - (v5 << 23);
    v8 = v6 & 0x3FE;
    if ((a1 & 0x3FF) != 0)
    {
      v2 = v8;
    }
    else
    {
      v7 = 0;
      v2 = 0;
    }
    goto LABEL_9;
  }
  if (v3 != 31744)
  {
    v7 = (v3 << 13) + 939524096;
LABEL_9:
    v4 = v7 | (v2 << 13) | v1;
    return *(float *)&v4;
  }
  v4 = v1 | 0x7F800000;
  if ((a1 & 0x3FF) != 0)
    v4 = (__int16)a1 | 0x7FFFFFFF;
  return *(float *)&v4;
}

uint64_t sub_1DCC1EE14(float a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = HIWORD(LODWORD(a1)) & 0x8000;
  v2 = LODWORD(a1) & 0x7F800000;
  v3 = LODWORD(a1) & 0x7FFFFF;
  if ((LODWORD(a1) >> 23) < 0x8Fu)
  {
    v4 = v1 | (((v2 + 0x8000000) | v3) >> 13);
    v1 |= v3 >> (((939524096 - v2) >> 23) + 14);
    if (v2 > 0x38000000)
      LOWORD(v1) = v4;
  }
  else if (v3 && v2 == 2139095040)
  {
    LOWORD(v1) = HIWORD(a1) | 0x7FFF;
  }
  else
  {
    LOWORD(v1) = v1 | 0x7C00;
  }
  return (unsigned __int16)v1;
}

void sub_1DCC1EE8C(void *a1, float *a2, void *a3, float *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  unsigned __int8 v11;
  const char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  float *v37;
  const char *v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  float v42;
  const char *v43;
  __int128 v44;
  float v45[255];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  bzero(v45, 0x3FCuLL);
  v11 = objc_msgSend_format(v8, v9, v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & (v11 < 5u)) == 1)
  {
    objc_msgSend_initializationValue(v8, v12, v13);
    if (v11)
    {
      v15 = 0;
      do
      {
        v44 = v14;
        v45[v15] = *(float *)((unint64_t)&v44 & 0xFFFFFFFFFFFFFFF3 | (4 * (v15 & 3)));
        ++v15;
      }
      while (v11 != v15);
    }
  }
  objc_msgSend_map(v7, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v20 = objc_msgSend_bytes(v16, v18, v19);
  v23 = objc_msgSend_length(v7, v21, v22);
  v25 = objc_retainAutorelease((id)objc_msgSend_initWithBytes_length_(v17, v24, v20, v23));
  v28 = objc_msgSend_mutableBytes(v25, v26, v27);
  v31 = objc_msgSend_offset(v8, v29, v30);
  v34 = objc_msgSend_format(v8, v32, v33);
  v37 = (float *)objc_msgSend_length(v7, v35, v36);
  v40 = objc_msgSend_length(v7, v38, v39);
  sub_1DCACC30C((void *)(v28 + v31), v34, a2, 0, (float *)0xC0000, 0, v45, a4, v41, v42, v37, v40);
  objc_msgSend_fillData_offset_(v7, v43, (uint64_t)v25, 0);

}

void sub_1DCC1F060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC1F09C(void *a1, float *a2, void *a3, void *a4, float *a5, void *a6, float *a7, unint64_t a8, float *a9)
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a1;
  v16 = a3;
  v17 = a6;
  objc_msgSend_map(a4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_bytes(v20, v21, v22);

  objc_msgSend_map(v30, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_bytes(v26, v27, v28);

  sub_1DCACC16C(v29, a2, v16, v23, a5, v17, a7, a8, a9);
}

void sub_1DCC1F180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1DCC1F1B0(_QWORD *a1, float a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  char *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  _WORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  _WORD *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *v43;
  _WORD *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  _WORD *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  _DWORD *v67;
  _WORD *v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  _DWORD *v73;
  float *v74;
  uint64_t (*v75)();

  if ((a1[4] & 0x1000) == 0)
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 == 1.0)
        {
          v3 = a1[8];
          if (v3)
          {
            v4 = a1[4];
            v5 = a1[2];
            v6 = a1[5];
            v7 = (_DWORD *)(*a1 + 8);
            v8 = (unsigned __int8 *)(a1[3] + 1);
            do
            {
              *(v7 - 2) = 2143289344 * *(v8 - 1);
              if (v4 >= 2)
              {
                *(v7 - 1) |= (2093056 * *v8) & 0x3FF000;
                if (v4 != 2)
                {
                  *v7 |= (2044 * v8[1]) & 0xFFC;
                  if (v4 >= 4)
                    v7[1] |= v8[2] & 3;
                }
              }
              v7 = (_DWORD *)((char *)v7 + v5);
              v8 += v6;
              --v3;
            }
            while (v3);
          }
        }
        else
        {
          sub_1DCC28238((uint64_t)nullsub_53, (uint64_t)a1);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v9 = a1[8];
          if (v9)
          {
            v10 = a1[4];
            v11 = a1[2];
            v12 = a1[5];
            v13 = (_DWORD *)(*a1 + 8);
            v14 = (char *)(a1[3] + 1);
            do
            {
              *(v13 - 2) = 2143289344 * *(v14 - 1);
              if (v10 >= 2)
              {
                *(v13 - 1) |= (2093056 * *v14) & 0x3FF000;
                if (v10 != 2)
                {
                  *v13 |= (2044 * v14[1]) & 0xFFC;
                  if (v10 >= 4)
                    v13[1] |= v14[2] & 3;
                }
              }
              v13 = (_DWORD *)((char *)v13 + v11);
              v14 += v12;
              --v9;
            }
            while (v9);
          }
        }
        else
        {
          sub_1DCC2818C((uint64_t)nullsub_52, (uint64_t)a1);
        }
        break;
      case 2uLL:
        v15 = a1[8];
        if (v15)
        {
          v16 = a1[4];
          v17 = a1[2];
          v18 = a1[5];
          v19 = (_DWORD *)(*a1 + 8);
          v20 = (unsigned __int8 *)(a1[3] + 1);
          do
          {
            *(v19 - 2) = 2143289344 * *(v20 - 1);
            if (v16 >= 2)
            {
              *(v19 - 1) |= (2093056 * *v20) & 0x3FF000;
              if (v16 != 2)
              {
                *v19 |= (2044 * v20[1]) & 0xFFC;
                if (v16 >= 4)
                  v19[1] |= v20[2] & 3;
              }
            }
            v19 = (_DWORD *)((char *)v19 + v17);
            v20 += v18;
            --v15;
          }
          while (v15);
        }
        break;
      case 3uLL:
        v21 = a1[8];
        if (v21)
        {
          v22 = a1[4];
          v23 = a1[2];
          v24 = a1[5];
          v25 = (_DWORD *)(*a1 + 8);
          v26 = (char *)(a1[3] + 1);
          do
          {
            *(v25 - 2) = 2143289344 * *(v26 - 1);
            if (v22 >= 2)
            {
              *(v25 - 1) |= (2093056 * *v26) & 0x3FF000;
              if (v22 != 2)
              {
                *v25 |= (2044 * v26[1]) & 0xFFC;
                if (v22 >= 4)
                  v25[1] |= v26[2] & 3;
              }
            }
            v25 = (_DWORD *)((char *)v25 + v23);
            v26 += v24;
            --v21;
          }
          while (v21);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v75 = nullsub_55;
          goto LABEL_109;
        }
        v27 = a1[8];
        if (v27)
        {
          v28 = a1[4];
          v29 = a1[2];
          v30 = a1[5];
          v31 = (_DWORD *)(*a1 + 8);
          v32 = (_WORD *)(a1[3] + 4);
          do
          {
            *(v31 - 2) = 2143289344 * (unsigned __int16)*(v32 - 2);
            if (v28 >= 2)
            {
              *(v31 - 1) |= ((511 * *(v32 - 1)) & 0x3FF) << 12;
              if (v28 != 2)
              {
                *v31 |= (2044 * *v32) & 0xFFC;
                if (v28 >= 4)
                  v31[1] |= v32[1] & 3;
              }
            }
            v31 = (_DWORD *)((char *)v31 + v29);
            v32 = (_WORD *)((char *)v32 + v30);
            --v27;
          }
          while (v27);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v33 = a1[8];
          if (v33)
          {
            v34 = a1[4];
            v35 = a1[2];
            v36 = a1[5];
            v37 = (_DWORD *)(*a1 + 8);
            v38 = (_WORD *)(a1[3] + 4);
            do
            {
              *(v37 - 2) = 2143289344 * (unsigned __int16)*(v38 - 2);
              if (v34 >= 2)
              {
                *(v37 - 1) |= ((511 * *(v38 - 1)) & 0x3FF) << 12;
                if (v34 != 2)
                {
                  *v37 |= (2044 * *v38) & 0xFFC;
                  if (v34 >= 4)
                    v37[1] |= v38[1] & 3;
                }
              }
              v37 = (_DWORD *)((char *)v37 + v35);
              v38 = (_WORD *)((char *)v38 + v36);
              --v33;
            }
            while (v33);
          }
        }
        else
        {
          v75 = nullsub_54;
LABEL_109:
          sub_1DCC282E4((uint64_t)v75, (uint64_t)a1);
        }
        break;
      case 6uLL:
        v39 = a1[8];
        if (v39)
        {
          v40 = a1[4];
          v41 = a1[2];
          v42 = a1[5];
          v43 = (_DWORD *)(*a1 + 8);
          v44 = (_WORD *)(a1[3] + 4);
          do
          {
            *(v43 - 2) = 2143289344 * (unsigned __int16)*(v44 - 2);
            if (v40 >= 2)
            {
              *(v43 - 1) |= ((511 * *(v44 - 1)) & 0x3FF) << 12;
              if (v40 != 2)
              {
                *v43 |= (2044 * *v44) & 0xFFC;
                if (v40 >= 4)
                  v43[1] |= v44[1] & 3;
              }
            }
            v43 = (_DWORD *)((char *)v43 + v41);
            v44 = (_WORD *)((char *)v44 + v42);
            --v39;
          }
          while (v39);
        }
        break;
      case 7uLL:
        v45 = a1[8];
        if (v45)
        {
          v46 = a1[4];
          v47 = a1[2];
          v48 = a1[5];
          v49 = (_DWORD *)(*a1 + 8);
          v50 = (_WORD *)(a1[3] + 4);
          do
          {
            *(v49 - 2) = 2143289344 * (unsigned __int16)*(v50 - 2);
            if (v46 >= 2)
            {
              *(v49 - 1) |= ((511 * *(v50 - 1)) & 0x3FF) << 12;
              if (v46 != 2)
              {
                *v49 |= (2044 * *v50) & 0xFFC;
                if (v46 >= 4)
                  v49[1] |= v50[1] & 3;
              }
            }
            v49 = (_DWORD *)((char *)v49 + v47);
            v50 = (_WORD *)((char *)v50 + v48);
            --v45;
          }
          while (v45);
        }
        break;
      case 8uLL:
        if (a2 != 1.0)
          goto LABEL_111;
        v51 = a1[8];
        if (v51)
        {
          v52 = a1[4];
          v53 = a1[2];
          v54 = a1[5];
          v55 = (_DWORD *)(*a1 + 8);
          v56 = a1[3] + 8;
          do
          {
            *(v55 - 2) = 2143289344 * *(_DWORD *)(v56 - 8);
            if (v52 >= 2)
            {
              *(v55 - 1) |= (2093056 * *(_DWORD *)(v56 - 4)) & 0x3FF000;
              if (v52 != 2)
              {
                *v55 |= (2044 * *(_WORD *)v56) & 0xFFC;
                if (v52 >= 4)
                  v55[1] |= *(_DWORD *)(v56 + 4) & 3;
              }
            }
            v55 = (_DWORD *)((char *)v55 + v53);
            v56 += v54;
            --v51;
          }
          while (v51);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v57 = a1[8];
          if (v57)
          {
            v58 = a1[4];
            v59 = a1[2];
            v60 = a1[5];
            v61 = (_DWORD *)(*a1 + 8);
            v62 = a1[3] + 8;
            do
            {
              *(v61 - 2) = 2143289344 * *(_DWORD *)(v62 - 8);
              if (v58 >= 2)
              {
                *(v61 - 1) |= (2093056 * *(_DWORD *)(v62 - 4)) & 0x3FF000;
                if (v58 != 2)
                {
                  *v61 |= (2044 * *(_WORD *)v62) & 0xFFC;
                  if (v58 >= 4)
                    v61[1] |= *(_DWORD *)(v62 + 4) & 3;
                }
              }
              v61 = (_DWORD *)((char *)v61 + v59);
              v62 += v60;
              --v57;
            }
            while (v57);
          }
        }
        else
        {
LABEL_111:
          sub_1DCC28394((uint64_t)nullsub_56, (uint64_t)a1);
        }
        break;
      case 0xAuLL:
        v63 = a1[8];
        if (v63)
        {
          v64 = a1[4];
          v65 = a1[2];
          v66 = a1[5];
          v67 = (_DWORD *)(*a1 + 8);
          v68 = (_WORD *)(a1[3] + 4);
          do
          {
            *(v67 - 2) = 2143289344 * (unsigned __int16)*(v68 - 2);
            if (v64 >= 2)
            {
              *(v67 - 1) |= ((511 * *(v68 - 1)) & 0x3FF) << 12;
              if (v64 != 2)
              {
                *v67 |= (2044 * *v68) & 0xFFC;
                if (v64 >= 4)
                  v67[1] |= v68[1] & 3;
              }
            }
            v67 = (_DWORD *)((char *)v67 + v65);
            v68 = (_WORD *)((char *)v68 + v66);
            --v63;
          }
          while (v63);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v69 = a1[8];
          if (v69)
          {
            v70 = a1[4];
            v71 = a1[2];
            v72 = a1[5];
            v73 = (_DWORD *)(*a1 + 8);
            v74 = (float *)(a1[3] + 8);
            do
            {
              *(v73 - 2) = (float)(*(v74 - 2) * 511.0) << 22;
              if (v70 >= 2)
              {
                *(v73 - 1) |= ((float)(*(v74 - 1) * 511.0) & 0x3FF) << 12;
                if (v70 != 2)
                {
                  *v73 |= 4 * ((float)(*v74 * 511.0) & 0x3FF);
                  if (v70 >= 4)
                    v73[1] |= v74[1] & 3;
                }
              }
              v73 = (_DWORD *)((char *)v73 + v71);
              v74 = (float *)((char *)v74 + v72);
              --v69;
            }
            while (v69);
          }
        }
        else
        {
          sub_1DCC280D0((uint64_t)nullsub_51, (uint64_t)a1);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC1FA80(_QWORD *a1, float a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  char *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  unsigned __int16 *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *v43;
  unsigned __int16 *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  unsigned __int16 *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  _DWORD *v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  _DWORD *v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  _DWORD *v67;
  unsigned __int16 *v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  _DWORD *v73;
  float *v74;
  uint64_t (*v75)();

  if ((a1[4] & 0x1000) == 0)
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 == 1.0)
        {
          v3 = a1[8];
          if (v3)
          {
            v4 = a1[4];
            v5 = a1[2];
            v6 = a1[5];
            v7 = (_DWORD *)(*a1 + 8);
            v8 = (unsigned __int8 *)(a1[3] + 1);
            do
            {
              *(v7 - 2) = -4194304 * *(v8 - 1);
              if (v4 >= 2)
              {
                *(v7 - 1) |= (-4096 * *v8) & 0x3FF000;
                if (v4 != 2)
                {
                  *v7 |= (-4 * v8[1]) & 0xFFC;
                  if (v4 >= 4)
                    v7[1] |= -v8[2] & 3;
                }
              }
              v7 = (_DWORD *)((char *)v7 + v5);
              v8 += v6;
              --v3;
            }
            while (v3);
          }
        }
        else
        {
          sub_1DCC285A8((uint64_t)nullsub_59, (uint64_t)a1);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v9 = a1[8];
          if (v9)
          {
            v10 = a1[4];
            v11 = a1[2];
            v12 = a1[5];
            v13 = (_DWORD *)(*a1 + 8);
            v14 = (char *)(a1[3] + 1);
            do
            {
              *(v13 - 2) = -4194304 * *(v14 - 1);
              if (v10 >= 2)
              {
                *(v13 - 1) |= (-4096 * *v14) & 0x3FF000;
                if (v10 != 2)
                {
                  *v13 |= (-4 * v14[1]) & 0xFFC;
                  if (v10 >= 4)
                    v13[1] |= -v14[2] & 3;
                }
              }
              v13 = (_DWORD *)((char *)v13 + v11);
              v14 += v12;
              --v9;
            }
            while (v9);
          }
        }
        else
        {
          sub_1DCC28504((uint64_t)nullsub_58, (uint64_t)a1);
        }
        break;
      case 2uLL:
        v15 = a1[8];
        if (v15)
        {
          v16 = a1[4];
          v17 = a1[2];
          v18 = a1[5];
          v19 = (_DWORD *)(*a1 + 8);
          v20 = (unsigned __int8 *)(a1[3] + 1);
          do
          {
            *(v19 - 2) = -4194304 * *(v20 - 1);
            if (v16 >= 2)
            {
              *(v19 - 1) |= (-4096 * *v20) & 0x3FF000;
              if (v16 != 2)
              {
                *v19 |= (-4 * v20[1]) & 0xFFC;
                if (v16 >= 4)
                  v19[1] |= -v20[2] & 3;
              }
            }
            v19 = (_DWORD *)((char *)v19 + v17);
            v20 += v18;
            --v15;
          }
          while (v15);
        }
        break;
      case 3uLL:
        v21 = a1[8];
        if (v21)
        {
          v22 = a1[4];
          v23 = a1[2];
          v24 = a1[5];
          v25 = (_DWORD *)(*a1 + 8);
          v26 = (char *)(a1[3] + 1);
          do
          {
            *(v25 - 2) = -4194304 * *(v26 - 1);
            if (v22 >= 2)
            {
              *(v25 - 1) |= (-4096 * *v26) & 0x3FF000;
              if (v22 != 2)
              {
                *v25 |= (-4 * v26[1]) & 0xFFC;
                if (v22 >= 4)
                  v25[1] |= -v26[2] & 3;
              }
            }
            v25 = (_DWORD *)((char *)v25 + v23);
            v26 += v24;
            --v21;
          }
          while (v21);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v75 = nullsub_61;
          goto LABEL_109;
        }
        v27 = a1[8];
        if (v27)
        {
          v28 = a1[4];
          v29 = a1[2];
          v30 = a1[5];
          v31 = (_DWORD *)(*a1 + 8);
          v32 = (unsigned __int16 *)(a1[3] + 4);
          do
          {
            *(v31 - 2) = -4194304 * *(v32 - 2);
            if (v28 >= 2)
            {
              *(v31 - 1) |= (-*(v32 - 1) & 0x3FF) << 12;
              if (v28 != 2)
              {
                *v31 |= (-4 * *v32) & 0xFFC;
                if (v28 >= 4)
                  v31[1] |= -v32[1] & 3;
              }
            }
            v31 = (_DWORD *)((char *)v31 + v29);
            v32 = (unsigned __int16 *)((char *)v32 + v30);
            --v27;
          }
          while (v27);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v33 = a1[8];
          if (v33)
          {
            v34 = a1[4];
            v35 = a1[2];
            v36 = a1[5];
            v37 = (_DWORD *)(*a1 + 8);
            v38 = (unsigned __int16 *)(a1[3] + 4);
            do
            {
              *(v37 - 2) = -4194304 * *(v38 - 2);
              if (v34 >= 2)
              {
                *(v37 - 1) |= (-*(v38 - 1) & 0x3FF) << 12;
                if (v34 != 2)
                {
                  *v37 |= (-4 * *v38) & 0xFFC;
                  if (v34 >= 4)
                    v37[1] |= -v38[1] & 3;
                }
              }
              v37 = (_DWORD *)((char *)v37 + v35);
              v38 = (unsigned __int16 *)((char *)v38 + v36);
              --v33;
            }
            while (v33);
          }
        }
        else
        {
          v75 = nullsub_60;
LABEL_109:
          sub_1DCC2864C((uint64_t)v75, (uint64_t)a1);
        }
        break;
      case 6uLL:
        v39 = a1[8];
        if (v39)
        {
          v40 = a1[4];
          v41 = a1[2];
          v42 = a1[5];
          v43 = (_DWORD *)(*a1 + 8);
          v44 = (unsigned __int16 *)(a1[3] + 4);
          do
          {
            *(v43 - 2) = -4194304 * *(v44 - 2);
            if (v40 >= 2)
            {
              *(v43 - 1) |= (-*(v44 - 1) & 0x3FF) << 12;
              if (v40 != 2)
              {
                *v43 |= (-4 * *v44) & 0xFFC;
                if (v40 >= 4)
                  v43[1] |= -v44[1] & 3;
              }
            }
            v43 = (_DWORD *)((char *)v43 + v41);
            v44 = (unsigned __int16 *)((char *)v44 + v42);
            --v39;
          }
          while (v39);
        }
        break;
      case 7uLL:
        v45 = a1[8];
        if (v45)
        {
          v46 = a1[4];
          v47 = a1[2];
          v48 = a1[5];
          v49 = (_DWORD *)(*a1 + 8);
          v50 = (unsigned __int16 *)(a1[3] + 4);
          do
          {
            *(v49 - 2) = -4194304 * *(v50 - 2);
            if (v46 >= 2)
            {
              *(v49 - 1) |= (-*(v50 - 1) & 0x3FF) << 12;
              if (v46 != 2)
              {
                *v49 |= (-4 * *v50) & 0xFFC;
                if (v46 >= 4)
                  v49[1] |= -v50[1] & 3;
              }
            }
            v49 = (_DWORD *)((char *)v49 + v47);
            v50 = (unsigned __int16 *)((char *)v50 + v48);
            --v45;
          }
          while (v45);
        }
        break;
      case 8uLL:
        if (a2 != 1.0)
          goto LABEL_111;
        v51 = a1[8];
        if (v51)
        {
          v52 = a1[4];
          v53 = a1[2];
          v54 = a1[5];
          v55 = (_DWORD *)(*a1 + 8);
          v56 = (_DWORD *)(a1[3] + 8);
          do
          {
            *(v55 - 2) = -4194304 * *(v56 - 2);
            if (v52 >= 2)
            {
              *(v55 - 1) |= (-4096 * *(v56 - 1)) & 0x3FF000;
              if (v52 != 2)
              {
                *v55 |= (-4 * *v56) & 0xFFC;
                if (v52 >= 4)
                  v55[1] |= -v56[1] & 3;
              }
            }
            v55 = (_DWORD *)((char *)v55 + v53);
            v56 = (_DWORD *)((char *)v56 + v54);
            --v51;
          }
          while (v51);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v57 = a1[8];
          if (v57)
          {
            v58 = a1[4];
            v59 = a1[2];
            v60 = a1[5];
            v61 = (_DWORD *)(*a1 + 8);
            v62 = (_DWORD *)(a1[3] + 8);
            do
            {
              *(v61 - 2) = -4194304 * *(v62 - 2);
              if (v58 >= 2)
              {
                *(v61 - 1) |= (-4096 * *(v62 - 1)) & 0x3FF000;
                if (v58 != 2)
                {
                  *v61 |= (-4 * *v62) & 0xFFC;
                  if (v58 >= 4)
                    v61[1] |= -v62[1] & 3;
                }
              }
              v61 = (_DWORD *)((char *)v61 + v59);
              v62 = (_DWORD *)((char *)v62 + v60);
              --v57;
            }
            while (v57);
          }
        }
        else
        {
LABEL_111:
          sub_1DCC286F8((uint64_t)nullsub_62, (uint64_t)a1);
        }
        break;
      case 0xAuLL:
        v63 = a1[8];
        if (v63)
        {
          v64 = a1[4];
          v65 = a1[2];
          v66 = a1[5];
          v67 = (_DWORD *)(*a1 + 8);
          v68 = (unsigned __int16 *)(a1[3] + 4);
          do
          {
            *(v67 - 2) = -4194304 * *(v68 - 2);
            if (v64 >= 2)
            {
              *(v67 - 1) |= (-*(v68 - 1) & 0x3FF) << 12;
              if (v64 != 2)
              {
                *v67 |= (-4 * *v68) & 0xFFC;
                if (v64 >= 4)
                  v67[1] |= -v68[1] & 3;
              }
            }
            v67 = (_DWORD *)((char *)v67 + v65);
            v68 = (unsigned __int16 *)((char *)v68 + v66);
            --v63;
          }
          while (v63);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v69 = a1[8];
          if (v69)
          {
            v70 = a1[4];
            v71 = a1[2];
            v72 = a1[5];
            v73 = (_DWORD *)(*a1 + 8);
            v74 = (float *)(a1[3] + 8);
            do
            {
              *(v73 - 2) = (float)(*(v74 - 2) * 1023.0) << 22;
              if (v70 >= 2)
              {
                *(v73 - 1) |= ((float)(*(v74 - 1) * 1023.0) & 0x3FF) << 12;
                if (v70 != 2)
                {
                  *v73 |= 4 * ((float)(*v74 * 1023.0) & 0x3FF);
                  if (v70 >= 4)
                    v73[1] |= (float)(v74[1] * 3.0) & 3;
                }
              }
              v73 = (_DWORD *)((char *)v73 + v71);
              v74 = (float *)((char *)v74 + v72);
              --v69;
            }
            while (v69);
          }
        }
        else
        {
          sub_1DCC28440((uint64_t)nullsub_57, (uint64_t)a1);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC20314(float **a1, float a2, float a3)
{
  float v3;
  float *v5;
  float v6;
  float *v7;
  float *v8;
  unint64_t v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  float *v15;
  float *v16;
  unint64_t v17;
  float *v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  float *v22;
  float v23;
  unsigned int v24;
  float *v25;
  float *v26;
  float *v27;
  _DWORD *v28;
  float *v29;
  float v30;
  unsigned int v31;
  float *v32;
  float *v33;
  float *v34;
  _DWORD *v35;
  float *v36;
  float *v37;
  unint64_t v38;
  float *v39;
  float *v40;
  uint64_t v41;
  uint64_t v42;
  float *v43;
  float *v44;
  float *v45;
  unint64_t v46;
  float *v47;
  uint64_t j;
  uint64_t v49;
  uint64_t v50;
  float *v51;
  float *v52;
  unint64_t v53;
  float v54;
  float *v55;
  float *v56;
  uint64_t v57;
  uint64_t v58;
  float *v59;
  float *v60;
  float *v61;
  unint64_t v62;
  float *v63;
  uint64_t k;
  uint64_t v65;
  uint64_t v66;
  float *v67;
  float *v68;
  unint64_t v69;
  float v70;
  float *v71;
  float *v72;
  uint64_t v73;
  uint64_t v74;
  float *v75;
  float *v76;
  float *v77;
  unint64_t v78;
  float *v79;
  uint64_t m;
  uint64_t v81;
  uint64_t v82;
  float v83;
  float *v84;
  float *v85;
  unint64_t v86;
  float *v87;
  float *v88;
  uint64_t v89;
  uint64_t v90;
  float *v91;
  float *v92;
  float *v93;
  unint64_t v94;
  float *v95;
  uint64_t n;
  uint64_t v97;
  uint64_t v98;
  float *v99;
  float *v100;
  unint64_t v101;
  float *v102;
  float *v103;
  uint64_t v104;
  uint64_t v105;
  float *v106;
  float *v107;
  float *v108;
  unint64_t v109;
  float *v110;
  uint64_t ii;
  uint64_t v112;
  uint64_t v113;
  float *v114;
  float *v115;
  unint64_t v116;
  float v117;
  float *v118;
  float *v119;
  uint64_t v120;
  uint64_t v121;
  float *v122;
  float *v123;
  float *v124;
  unint64_t v125;
  float *v126;
  uint64_t jj;
  uint64_t v128;
  uint64_t v129;
  float *v130;
  float *v131;
  unint64_t v132;
  float v133;
  float *v134;
  float *v135;
  uint64_t v136;
  uint64_t v137;
  float *v138;
  float *v139;
  float *v140;
  unint64_t v141;
  float *v142;
  uint64_t kk;
  uint64_t v144;
  uint64_t v145;
  float *v146;
  float *v147;
  unint64_t v148;
  unsigned int v149;
  float *v150;
  float *v151;
  uint64_t v152;
  float *v153;
  float *v154;
  float *v155;
  unint64_t v156;
  float *v157;
  uint64_t mm;
  uint64_t v159;
  uint64_t v160;
  float *v161;
  float *v162;
  unint64_t v163;
  unsigned int v164;
  float *v165;
  float *v166;
  uint64_t v167;
  float *v168;
  float *v169;
  float *v170;
  unint64_t v171;
  float *v172;
  uint64_t nn;
  uint64_t v174;
  uint64_t v175;
  float *v176;
  unint64_t v177;
  float *v178;
  float *v179;
  uint64_t v180;
  uint64_t v181;
  float *v182;
  float *v183;
  uint64_t v184;
  int v185;
  uint64_t i1;
  uint64_t v187;
  unint64_t v188;
  float *v189;
  float *v190;
  unint64_t v191;
  unsigned int v192;
  float *v193;
  float *v194;
  uint64_t v195;
  float *v196;
  float *v197;
  float *v198;
  unint64_t v199;
  float *v200;
  uint64_t i2;
  uint64_t v202;
  uint64_t v203;
  float (*v204)(char *, float);
  float (*v205)(__int16 *, float);
  uint64_t v206;
  float *v207;
  unint64_t v208;
  float *v209;
  float *v210;
  float *v211;

  v3 = a2;
  v5 = a1[4];
  if (((unsigned __int16)v5 & 0x1000) != 0)
  {
    if (v5 == (float *)593924)
    {
      v29 = a1[8];
      if (v29)
      {
        v30 = a2 * 0.00097752;
        v31 = *((unsigned __int8 *)a1 + 8);
        v32 = a1[2];
        v33 = a1[5];
        v34 = *a1 + 2;
        v35 = a1[3] + 2;
        do
        {
          *(v34 - 2) = v30 * (float)(*(v35 - 2) >> 22);
          if (v31 >= 2)
          {
            *(v34 - 1) = v30 * (float)((*(v35 - 1) >> 12) & 0x3FF);
            if (v31 != 2)
            {
              *v34 = v30 * (float)((*v35 >> 2) & 0x3FF);
              if (v31 >= 4)
                v34[1] = (float)(v3 * 0.33333) * (float)(v35[1] & 3);
            }
          }
          v34 = (float *)((char *)v32 + (_QWORD)v34);
          v35 = (_DWORD *)((char *)v33 + (_QWORD)v35);
          v29 = (float *)((char *)v29 - 1);
        }
        while (v29);
      }
    }
    else if (v5 == (float *)659460)
    {
      v22 = a1[8];
      if (v22)
      {
        v23 = a2 * 0.0019569;
        v24 = *((unsigned __int8 *)a1 + 8);
        v25 = a1[2];
        v26 = a1[5];
        v27 = *a1 + 2;
        v28 = a1[3] + 2;
        do
        {
          *(v27 - 2) = v23 * (float)(*(v28 - 2) >> 22);
          if (v24 >= 2)
          {
            *(v27 - 1) = v23 * (float)((*(v28 - 1) >> 12) & 0x3FF);
            if (v24 != 2)
            {
              *v27 = v23 * (float)((*v28 >> 2) & 0x3FF);
              if (v24 >= 4)
                v27[1] = (float)(v28[1] & 3) * v3;
            }
          }
          v27 = (float *)((char *)v25 + (_QWORD)v27);
          v28 = (_DWORD *)((char *)v26 + (_QWORD)v28);
          v22 = (float *)((char *)v22 - 1);
        }
        while (v22);
      }
    }
  }
  else
  {
    switch((((unint64_t)a1[4] & 0xFFFF0000) - 0x10000) >> 16)
    {
      case 0uLL:
        v6 = 1.0;
        if (v3 != 1.0)
        {
          v204 = (float (*)(char *, float))sub_1DCC28AB8;
          a2 = v3;
          goto LABEL_255;
        }
        v7 = a1[8];
        if (v7)
        {
          v8 = 0;
          v9 = 0;
          v11 = *a1;
          v10 = a1[1];
          if (a1[4] >= v10)
            v12 = a1[1];
          else
            v12 = a1[4];
          v13 = a1[4];
          if (v10 < (unint64_t)v5)
            v13 = a1[1];
          v15 = a1[2];
          v14 = a1[3];
          v16 = a1[5];
          v17 = (unint64_t)a1[6];
          v18 = a1[7];
          do
          {
            if (v9 >= v17)
            {
              if ((_BYTE)v10)
              {
                v21 = 0;
                do
                {
                  v6 = truncf(v18[v21]);
                  v11[v21++] = v6;
                }
                while (v10 != v21);
              }
            }
            else
            {
              if ((_DWORD)v12)
              {
                for (i = 0; i != v12; ++i)
                {
                  LOBYTE(v6) = *((_BYTE *)v14 + i);
                  v6 = (float)LODWORD(v6);
                  v11[i] = v6;
                }
              }
              v20 = v13;
              if (v10 > v5)
              {
                do
                {
                  v6 = truncf(v18[v20]);
                  v11[v20++] = v6;
                }
                while (((_BYTE)v10 - v12 + v13) != v20);
              }
            }
            v11 = (float *)((char *)v15 + (_QWORD)v11);
            v14 = (float *)((char *)v16 + (_QWORD)v14);
            v9 += (unint64_t)v16;
            v8 = (float *)((char *)v8 + 1);
          }
          while (v8 != v7);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v36 = a1[8];
          if (v36)
          {
            v37 = 0;
            v38 = 0;
            v40 = *a1;
            v39 = a1[1];
            if (a1[4] >= v39)
              v41 = a1[1];
            else
              v41 = a1[4];
            v42 = a1[4];
            if (v39 < (unint64_t)v5)
              v42 = a1[1];
            v44 = a1[2];
            v43 = a1[3];
            v45 = a1[5];
            v46 = (unint64_t)a1[6];
            v47 = a1[7];
            do
            {
              if (v38 >= v46)
              {
                if ((_BYTE)v39)
                {
                  v50 = 0;
                  do
                  {
                    v40[v50] = truncf(v47[v50]);
                    ++v50;
                  }
                  while (v39 != v50);
                }
              }
              else
              {
                if ((_DWORD)v41)
                {
                  for (j = 0; j != v41; ++j)
                    v40[j] = (float)*((char *)v43 + j);
                }
                v49 = v42;
                if (v39 > v5)
                {
                  do
                  {
                    v40[v49] = truncf(v47[v49]);
                    ++v49;
                  }
                  while (((_BYTE)v39 - v41 + v42) != v49);
                }
              }
              v40 = (float *)((char *)v44 + (_QWORD)v40);
              v43 = (float *)((char *)v45 + (_QWORD)v43);
              v38 += (unint64_t)v45;
              v37 = (float *)((char *)v37 + 1);
            }
            while (v37 != v36);
          }
        }
        else
        {
          v204 = sub_1DCC28AA8;
LABEL_255:
          sub_1DCC28924(v204, a1, a2);
        }
        break;
      case 2uLL:
        v51 = a1[8];
        if (v51)
        {
          v52 = 0;
          v53 = 0;
          v54 = a2 * 0.0039216;
          v56 = *a1;
          v55 = a1[1];
          if (a1[4] >= v55)
            v57 = a1[1];
          else
            v57 = a1[4];
          v58 = a1[4];
          if (v55 < (unint64_t)v5)
            v58 = a1[1];
          v60 = a1[2];
          v59 = a1[3];
          v61 = a1[5];
          v62 = (unint64_t)a1[6];
          v63 = a1[7];
          do
          {
            if (v53 >= v62)
            {
              if ((_BYTE)v55)
              {
                v66 = 0;
                do
                {
                  v56[v66] = v54 * (float)(char)(int)v63[v66];
                  ++v66;
                }
                while (v55 != v66);
              }
            }
            else
            {
              if ((_DWORD)v57)
              {
                for (k = 0; k != v57; ++k)
                  v56[k] = v54 * (float)*((char *)v59 + k);
              }
              v65 = v58;
              if (v55 > v5)
              {
                do
                {
                  v56[v65] = v54 * (float)(char)(int)v63[v65];
                  ++v65;
                }
                while (((_BYTE)v55 - v57 + v58) != v65);
              }
            }
            v56 = (float *)((char *)v60 + (_QWORD)v56);
            v59 = (float *)((char *)v61 + (_QWORD)v59);
            v53 += (unint64_t)v61;
            v52 = (float *)((char *)v52 + 1);
          }
          while (v52 != v51);
        }
        break;
      case 3uLL:
        v67 = a1[8];
        if (v67)
        {
          v68 = 0;
          v69 = 0;
          v70 = a2 * 0.007874;
          v72 = *a1;
          v71 = a1[1];
          if (a1[4] >= v71)
            v73 = a1[1];
          else
            v73 = a1[4];
          v74 = a1[4];
          if (v71 < (unint64_t)v5)
            v74 = a1[1];
          v76 = a1[2];
          v75 = a1[3];
          v77 = a1[5];
          v78 = (unint64_t)a1[6];
          v79 = a1[7];
          do
          {
            if (v69 >= v78)
            {
              if ((_BYTE)v71)
              {
                v82 = 0;
                do
                {
                  v72[v82] = v70 * truncf(v79[v82]);
                  ++v82;
                }
                while (v71 != v82);
              }
            }
            else
            {
              if ((_DWORD)v73)
              {
                for (m = 0; m != v73; ++m)
                  v72[m] = v70 * (float)*((char *)v75 + m);
              }
              v81 = v74;
              if (v71 > v5)
              {
                do
                {
                  v72[v81] = v70 * truncf(v79[v81]);
                  ++v81;
                }
                while (((_BYTE)v71 - v73 + v74) != v81);
              }
            }
            v72 = (float *)((char *)v76 + (_QWORD)v72);
            v75 = (float *)((char *)v77 + (_QWORD)v75);
            v69 += (unint64_t)v77;
            v68 = (float *)((char *)v68 + 1);
          }
          while (v68 != v67);
        }
        break;
      case 4uLL:
        v83 = 1.0;
        if (v3 != 1.0)
        {
          v205 = (float (*)(__int16 *, float))sub_1DCC28C5C;
          a2 = v3;
          goto LABEL_258;
        }
        v84 = a1[8];
        if (v84)
        {
          v85 = 0;
          v86 = 0;
          v88 = *a1;
          v87 = a1[1];
          if (a1[4] >= v87)
            v89 = a1[1];
          else
            v89 = a1[4];
          v90 = a1[4];
          if (v87 < (unint64_t)v5)
            v90 = a1[1];
          v92 = a1[2];
          v91 = a1[3];
          v93 = a1[5];
          v94 = (unint64_t)a1[6];
          v95 = a1[7];
          do
          {
            if (v86 >= v94)
            {
              if ((_BYTE)v87)
              {
                v98 = 0;
                do
                {
                  v83 = truncf(v95[v98]);
                  v88[v98++] = v83;
                }
                while (v87 != v98);
              }
            }
            else
            {
              if ((_DWORD)v89)
              {
                for (n = 0; n != v89; ++n)
                {
                  LOWORD(v83) = *((_WORD *)v91 + n);
                  v83 = (float)LODWORD(v83);
                  v88[n] = v83;
                }
              }
              v97 = v90;
              if (v87 > v5)
              {
                do
                {
                  v83 = truncf(v95[v97]);
                  v88[v97++] = v83;
                }
                while (((_BYTE)v87 - v89 + v90) != v97);
              }
            }
            v88 = (float *)((char *)v92 + (_QWORD)v88);
            v91 = (float *)((char *)v93 + (_QWORD)v91);
            v86 += (unint64_t)v93;
            v85 = (float *)((char *)v85 + 1);
          }
          while (v85 != v84);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v99 = a1[8];
          if (v99)
          {
            v100 = 0;
            v101 = 0;
            v103 = *a1;
            v102 = a1[1];
            if (a1[4] >= v102)
              v104 = a1[1];
            else
              v104 = a1[4];
            v105 = a1[4];
            if (v102 < (unint64_t)v5)
              v105 = a1[1];
            v107 = a1[2];
            v106 = a1[3];
            v108 = a1[5];
            v109 = (unint64_t)a1[6];
            v110 = a1[7];
            do
            {
              if (v101 >= v109)
              {
                if ((_BYTE)v102)
                {
                  v113 = 0;
                  do
                  {
                    v103[v113] = truncf(v110[v113]);
                    ++v113;
                  }
                  while (v102 != v113);
                }
              }
              else
              {
                if ((_DWORD)v104)
                {
                  for (ii = 0; ii != v104; ++ii)
                    v103[ii] = (float)*((__int16 *)v106 + ii);
                }
                v112 = v105;
                if (v102 > v5)
                {
                  do
                  {
                    v103[v112] = truncf(v110[v112]);
                    ++v112;
                  }
                  while (((_BYTE)v102 - v104 + v105) != v112);
                }
              }
              v103 = (float *)((char *)v107 + (_QWORD)v103);
              v106 = (float *)((char *)v108 + (_QWORD)v106);
              v101 += (unint64_t)v108;
              v100 = (float *)((char *)v100 + 1);
            }
            while (v100 != v99);
          }
        }
        else
        {
          v205 = sub_1DCC28C4C;
LABEL_258:
          sub_1DCC28AC8(v205, a1, a2);
        }
        break;
      case 6uLL:
        v114 = a1[8];
        if (v114)
        {
          v115 = 0;
          v116 = 0;
          v117 = a2 * 0.000015259;
          v119 = *a1;
          v118 = a1[1];
          if (a1[4] >= v118)
            v120 = a1[1];
          else
            v120 = a1[4];
          v121 = a1[4];
          if (v118 < (unint64_t)v5)
            v121 = a1[1];
          v123 = a1[2];
          v122 = a1[3];
          v124 = a1[5];
          v125 = (unint64_t)a1[6];
          v126 = a1[7];
          do
          {
            if (v116 >= v125)
            {
              if ((_BYTE)v118)
              {
                v129 = 0;
                do
                {
                  a3 = v117 * truncf(v126[v129]);
                  v119[v129++] = a3;
                }
                while (v118 != v129);
              }
            }
            else
            {
              if ((_DWORD)v120)
              {
                for (jj = 0; jj != v120; ++jj)
                {
                  LOWORD(a3) = *((_WORD *)v122 + jj);
                  a3 = v117 * (float)LODWORD(a3);
                  v119[jj] = a3;
                }
              }
              v128 = v121;
              if (v118 > v5)
              {
                do
                {
                  a3 = v117 * truncf(v126[v128]);
                  v119[v128++] = a3;
                }
                while (((_BYTE)v118 - v120 + v121) != v128);
              }
            }
            v119 = (float *)((char *)v123 + (_QWORD)v119);
            v122 = (float *)((char *)v124 + (_QWORD)v122);
            v116 += (unint64_t)v124;
            v115 = (float *)((char *)v115 + 1);
          }
          while (v115 != v114);
        }
        break;
      case 7uLL:
        v130 = a1[8];
        if (v130)
        {
          v131 = 0;
          v132 = 0;
          v133 = a2 * 0.000030519;
          v135 = *a1;
          v134 = a1[1];
          if (a1[4] >= v134)
            v136 = a1[1];
          else
            v136 = a1[4];
          v137 = a1[4];
          if (v134 < (unint64_t)v5)
            v137 = a1[1];
          v139 = a1[2];
          v138 = a1[3];
          v140 = a1[5];
          v141 = (unint64_t)a1[6];
          v142 = a1[7];
          do
          {
            if (v132 >= v141)
            {
              if ((_BYTE)v134)
              {
                v145 = 0;
                do
                {
                  v135[v145] = v133 * truncf(v142[v145]);
                  ++v145;
                }
                while (v134 != v145);
              }
            }
            else
            {
              if ((_DWORD)v136)
              {
                for (kk = 0; kk != v136; ++kk)
                  v135[kk] = v133 * (float)*((__int16 *)v138 + kk);
              }
              v144 = v137;
              if (v134 > v5)
              {
                do
                {
                  v135[v144] = v133 * truncf(v142[v144]);
                  ++v144;
                }
                while (((_BYTE)v134 - v136 + v137) != v144);
              }
            }
            v135 = (float *)((char *)v139 + (_QWORD)v135);
            v138 = (float *)((char *)v140 + (_QWORD)v138);
            v132 += (unint64_t)v140;
            v131 = (float *)((char *)v131 + 1);
          }
          while (v131 != v130);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v146 = a1[8];
          if (v146)
          {
            v147 = 0;
            v148 = 0;
            v149 = a1[4];
            v151 = *a1;
            v150 = a1[1];
            if (v149 >= v150)
              v149 = a1[1];
            v152 = a1[4];
            if (v150 < (unint64_t)v5)
              v152 = a1[1];
            v154 = a1[2];
            v153 = a1[3];
            v155 = a1[5];
            v156 = (unint64_t)a1[6];
            v157 = a1[7];
            do
            {
              if (v148 >= v156)
              {
                if ((_BYTE)v150)
                {
                  v160 = 0;
                  do
                  {
                    v151[v160] = (float)(int)v157[v160];
                    ++v160;
                  }
                  while (v150 != v160);
                }
              }
              else
              {
                if (v149)
                {
                  for (mm = 0; mm != v149; ++mm)
                    v151[mm] = (float)SLODWORD(v153[mm]);
                }
                v159 = v152;
                if (v150 > v5)
                {
                  do
                  {
                    v151[v159] = (float)(int)v157[v159];
                    ++v159;
                  }
                  while (((_BYTE)v150 - v149 + v152) != v159);
                }
              }
              v151 = (float *)((char *)v154 + (_QWORD)v151);
              v153 = (float *)((char *)v155 + (_QWORD)v153);
              v148 += (unint64_t)v155;
              v147 = (float *)((char *)v147 + 1);
            }
            while (v147 != v146);
          }
        }
        else
        {
          sub_1DCC28E00((float (*)(unsigned int *, float))sub_1DCC28DF0, a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v161 = a1[8];
          if (v161)
          {
            v162 = 0;
            v163 = 0;
            v164 = a1[4];
            v166 = *a1;
            v165 = a1[1];
            if (v164 >= v165)
              v164 = a1[1];
            v167 = a1[4];
            if (v165 < (unint64_t)v5)
              v167 = a1[1];
            v169 = a1[2];
            v168 = a1[3];
            v170 = a1[5];
            v171 = (unint64_t)a1[6];
            v172 = a1[7];
            do
            {
              if (v163 >= v171)
              {
                if ((_BYTE)v165)
                {
                  v175 = 0;
                  do
                  {
                    v166[v175] = truncf(v172[v175]);
                    ++v175;
                  }
                  while (v165 != v175);
                }
              }
              else
              {
                if (v164)
                {
                  for (nn = 0; nn != v164; ++nn)
                    v166[nn] = (float)SLODWORD(v168[nn]);
                }
                v174 = v167;
                if (v165 > v5)
                {
                  do
                  {
                    v166[v174] = truncf(v172[v174]);
                    ++v174;
                  }
                  while (((_BYTE)v165 - v164 + v167) != v174);
                }
              }
              v166 = (float *)((char *)v169 + (_QWORD)v166);
              v168 = (float *)((char *)v170 + (_QWORD)v168);
              v163 += (unint64_t)v170;
              v162 = (float *)((char *)v162 + 1);
            }
            while (v162 != v161);
          }
        }
        else
        {
          sub_1DCC28C6C(sub_1DCC28DF0, a1, a2);
        }
        break;
      case 0xAuLL:
        v211 = a1[8];
        if (v211)
        {
          v176 = 0;
          v177 = 0;
          v179 = *a1;
          v178 = a1[1];
          if (a1[4] >= v178)
            v180 = a1[1];
          else
            v180 = a1[4];
          if (v178 >= (unint64_t)v5)
            v181 = a1[4];
          else
            v181 = a1[1];
          v206 = v181;
          v182 = a1[3];
          v209 = a1[2];
          v210 = a1[1];
          v183 = a1[7];
          v208 = (unint64_t)a1[6];
          v207 = a1[5];
          v184 = 4 * v178;
          v185 = ((_BYTE)v178 - v180 + v181);
          do
          {
            if (v177 >= v208)
            {
              if ((_BYTE)v210)
              {
                v188 = 0;
                do
                {
                  v179[v188 / 4] = sub_1DCC1EDA0((int)v183[v188 / 4]) * v3;
                  v188 += 4;
                }
                while (v184 != v188);
              }
            }
            else
            {
              if ((_DWORD)v180)
              {
                for (i1 = 0; i1 != v180; ++i1)
                  v179[i1] = sub_1DCC1EDA0(*((unsigned __int16 *)v182 + i1)) * v3;
              }
              v187 = v206;
              if (v210 > v5)
              {
                do
                {
                  v179[v187] = sub_1DCC1EDA0((int)v183[v187]) * v3;
                  ++v187;
                }
                while (v185 != v187);
              }
            }
            v179 = (float *)((char *)v209 + (_QWORD)v179);
            v182 = (float *)((char *)v207 + (_QWORD)v182);
            v177 += (unint64_t)v207;
            v176 = (float *)((char *)v176 + 1);
          }
          while (v176 != v211);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v189 = a1[8];
          if (v189)
          {
            v190 = 0;
            v191 = 0;
            v192 = a1[4];
            v194 = *a1;
            v193 = a1[1];
            if (v192 >= v193)
              v192 = a1[1];
            v195 = a1[4];
            if (v193 < (unint64_t)v5)
              v195 = a1[1];
            v197 = a1[2];
            v196 = a1[3];
            v198 = a1[5];
            v199 = (unint64_t)a1[6];
            v200 = a1[7];
            do
            {
              if (v191 >= v199)
              {
                if ((_BYTE)v193)
                {
                  v203 = 0;
                  do
                  {
                    v194[v203] = v200[v203];
                    ++v203;
                  }
                  while (v193 != v203);
                }
              }
              else
              {
                if (v192)
                {
                  for (i2 = 0; i2 != v192; ++i2)
                    v194[i2] = v196[i2];
                }
                v202 = v195;
                if (v193 > v5)
                {
                  do
                  {
                    v194[v202] = v200[v202];
                    ++v202;
                  }
                  while (((_BYTE)v193 - v192 + v195) != v202);
                }
              }
              v194 = (float *)((char *)v197 + (_QWORD)v194);
              v196 = (float *)((char *)v198 + (_QWORD)v196);
              v191 += (unint64_t)v198;
              v190 = (float *)((char *)v190 + 1);
            }
            while (v190 != v189);
          }
        }
        else
        {
          sub_1DCC2879C(sub_1DCC28918, a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC2121C(uint64_t a1, float a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  _DWORD *v21;
  _BYTE *v22;
  unsigned int v23;
  unint64_t v24;
  float v25;
  _DWORD *v26;
  _BYTE *v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  _BYTE *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  float v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  _BYTE *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  float v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  _BYTE *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  _BYTE *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  _BYTE *v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  float v103;
  uint64_t v104;
  _BYTE *v105;
  uint64_t v106;
  unsigned __int16 *v107;
  uint64_t v108;
  unsigned __int16 *v109;
  _BYTE *v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  float v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  __int16 *v122;
  uint64_t v123;
  __int16 *v124;
  _BYTE *v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  _BYTE *v134;
  uint64_t v135;
  int *v136;
  uint64_t v137;
  int *v138;
  _BYTE *v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  _BYTE *v148;
  uint64_t v149;
  int *v150;
  uint64_t v151;
  int *v152;
  _BYTE *v153;
  uint64_t v154;
  int v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unsigned __int16 *v165;
  uint64_t v166;
  int v167;
  unsigned __int16 *v168;
  _BYTE *v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  _BYTE *v178;
  uint64_t v179;
  float *v180;
  uint64_t v181;
  float *v182;
  _BYTE *v183;
  uint64_t v184;
  float v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;

  v4 = *(_QWORD *)(a1 + 32);
  if ((v4 & 0x1000) != 0)
  {
    if (v4 == 593924)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        v24 = 0;
        v25 = a2 * 0.00097752;
        v26 = *(_DWORD **)(a1 + 24);
        v27 = *(_BYTE **)a1;
        do
        {
          v28 = *(unsigned __int8 *)(a1 + 8);
          *v27 = (int)(float)(v25 * (float)(*v26 >> 22));
          if (v28 >= 2)
          {
            v27[1] = (int)(float)(v25 * (float)((v26[1] >> 12) & 0x3FF));
            if (v28 != 2)
            {
              v27[2] = (int)(float)(v25 * (float)((v26[2] >> 2) & 0x3FF));
              if (v28 >= 4)
                v27[3] = (int)(float)((float)(a2 * 0.33333) * (float)(v26[3] & 3));
            }
          }
          v27 += *(_QWORD *)(a1 + 16);
          v26 = (_DWORD *)((char *)v26 + *(_QWORD *)(a1 + 40));
          ++v24;
        }
        while (v24 < *(_QWORD *)(a1 + 64));
      }
    }
    else if (v4 == 659460 && *(_QWORD *)(a1 + 64))
    {
      v19 = 0;
      v20 = a2 * 0.0019569;
      v21 = *(_DWORD **)(a1 + 24);
      v22 = *(_BYTE **)a1;
      do
      {
        v23 = *(unsigned __int8 *)(a1 + 8);
        *v22 = (int)(float)(v20 * (float)(*v21 >> 22));
        if (v23 >= 2)
        {
          v22[1] = (int)(float)(v20 * (float)((v21[1] >> 12) & 0x3FF));
          if (v23 != 2)
          {
            v22[2] = (int)(float)(v20 * (float)((v21[2] >> 2) & 0x3FF));
            if (v23 >= 4)
              v22[3] = (int)(float)((float)(v21[3] & 3) * a2);
          }
        }
        v22 += *(_QWORD *)(a1 + 16);
        v21 = (_DWORD *)((char *)v21 + *(_QWORD *)(a1 + 40));
        ++v19;
      }
      while (v19 < *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    switch(((*(_QWORD *)(a1 + 32) & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v5 = 0;
            v6 = 0;
            v8 = *(_BYTE **)a1;
            v7 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v7)
              v9 = *(_QWORD *)(a1 + 8);
            else
              v9 = *(_QWORD *)(a1 + 32);
            v10 = *(char **)(a1 + 24);
            v11 = *(_QWORD *)(a1 + 32);
            if (v7 < (unint64_t)v4)
              v11 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v6 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v7)
                {
                  v17 = 0;
                  do
                  {
                    v8[v17] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v17);
                    ++v17;
                  }
                  while (v7 != v17);
                }
              }
              else
              {
                v12 = v10;
                v13 = v8;
                v14 = v9;
                if ((_DWORD)v9)
                {
                  do
                  {
                    v15 = *v12++;
                    *v13++ = v15;
                    --v14;
                  }
                  while (v14);
                }
                v16 = v11;
                if (v7 > v4)
                {
                  do
                  {
                    v8[v16] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v16);
                    ++v16;
                  }
                  while ((v7 - v9 + v11) != v16);
                }
              }
              v8 += *(_QWORD *)(a1 + 16);
              v18 = *(_QWORD *)(a1 + 40);
              v10 += v18;
              v6 += v18;
              ++v5;
            }
            while (v5 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29110((uint64_t)sub_1DCC292A4, (_QWORD *)a1, a2);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v29 = 0;
            v30 = 0;
            v32 = *(_BYTE **)a1;
            v31 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v31)
              v33 = *(_QWORD *)(a1 + 8);
            else
              v33 = *(_QWORD *)(a1 + 32);
            v34 = *(char **)(a1 + 24);
            v35 = *(_QWORD *)(a1 + 32);
            if (v31 < (unint64_t)v4)
              v35 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v30 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v31)
                {
                  v41 = 0;
                  do
                  {
                    v32[v41] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v41);
                    ++v41;
                  }
                  while (v31 != v41);
                }
              }
              else
              {
                v36 = v34;
                v37 = v32;
                v38 = v33;
                if ((_DWORD)v33)
                {
                  do
                  {
                    v39 = *v36++;
                    *v37++ = v39;
                    --v38;
                  }
                  while (v38);
                }
                v40 = v35;
                if (v31 > v4)
                {
                  do
                  {
                    v32[v40] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v40);
                    ++v40;
                  }
                  while ((v31 - v33 + v35) != v40);
                }
              }
              v32 += *(_QWORD *)(a1 + 16);
              v42 = *(_QWORD *)(a1 + 40);
              v34 += v42;
              v30 += v42;
              ++v29;
            }
            while (v29 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29110((uint64_t)sub_1DCC29290, (_QWORD *)a1, a2);
        }
        break;
      case 2uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v43 = 0;
          v44 = 0;
          v45 = a2 * 0.0039216;
          v47 = *(_BYTE **)a1;
          v46 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v46)
            v48 = *(_QWORD *)(a1 + 8);
          else
            v48 = *(_QWORD *)(a1 + 32);
          v49 = *(char **)(a1 + 24);
          v50 = *(_QWORD *)(a1 + 32);
          if (v46 < (unint64_t)v4)
            v50 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v44 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v46)
              {
                v56 = 0;
                do
                {
                  v47[v56] = (int)(float)(v45 * (float)(char)(int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v56));
                  ++v56;
                }
                while (v46 != v56);
              }
            }
            else
            {
              v51 = v49;
              v52 = v47;
              v53 = v48;
              if ((_DWORD)v48)
              {
                do
                {
                  v54 = *v51++;
                  *v52++ = (int)(float)(v45 * (float)v54);
                  --v53;
                }
                while (v53);
              }
              v55 = v50;
              if (v46 > v4)
              {
                do
                {
                  v47[v55] = (int)(float)(v45 * (float)(char)(int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v55));
                  ++v55;
                }
                while ((v46 - v48 + v50) != v55);
              }
            }
            v47 += *(_QWORD *)(a1 + 16);
            v57 = *(_QWORD *)(a1 + 40);
            v49 += v57;
            v44 += v57;
            ++v43;
          }
          while (v43 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 3uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v58 = 0;
          v59 = 0;
          v60 = a2 * 0.007874;
          v62 = *(_BYTE **)a1;
          v61 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v61)
            v63 = *(_QWORD *)(a1 + 8);
          else
            v63 = *(_QWORD *)(a1 + 32);
          v64 = *(char **)(a1 + 24);
          v65 = *(_QWORD *)(a1 + 32);
          if (v61 < (unint64_t)v4)
            v65 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v59 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v61)
              {
                v71 = 0;
                do
                {
                  v62[v71] = (int)(float)(v60 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v71)));
                  ++v71;
                }
                while (v61 != v71);
              }
            }
            else
            {
              v66 = v64;
              v67 = v62;
              v68 = v63;
              if ((_DWORD)v63)
              {
                do
                {
                  v69 = *v66++;
                  *v67++ = (int)(float)(v60 * (float)v69);
                  --v68;
                }
                while (v68);
              }
              v70 = v65;
              if (v61 > v4)
              {
                do
                {
                  v62[v70] = (int)(float)(v60 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v70)));
                  ++v70;
                }
                while ((v61 - v63 + v65) != v70);
              }
            }
            v62 += *(_QWORD *)(a1 + 16);
            v72 = *(_QWORD *)(a1 + 40);
            v64 += v72;
            v59 += v72;
            ++v58;
          }
          while (v58 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 4uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v73 = 0;
            v74 = 0;
            v76 = *(_BYTE **)a1;
            v75 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v75)
              v77 = *(_QWORD *)(a1 + 8);
            else
              v77 = *(_QWORD *)(a1 + 32);
            v78 = *(char **)(a1 + 24);
            v79 = *(_QWORD *)(a1 + 32);
            if (v75 < (unint64_t)v4)
              v79 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v74 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v75)
                {
                  v85 = 0;
                  do
                  {
                    v76[v85] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v85);
                    ++v85;
                  }
                  while (v75 != v85);
                }
              }
              else
              {
                v80 = v78;
                v81 = v76;
                v82 = v77;
                if ((_DWORD)v77)
                {
                  do
                  {
                    v83 = *v80;
                    v80 += 2;
                    *v81++ = v83;
                    --v82;
                  }
                  while (v82);
                }
                v84 = v79;
                if (v75 > v4)
                {
                  do
                  {
                    v76[v84] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v84);
                    ++v84;
                  }
                  while ((v75 - v77 + v79) != v84);
                }
              }
              v76 += *(_QWORD *)(a1 + 16);
              v86 = *(_QWORD *)(a1 + 40);
              v78 += v86;
              v74 += v86;
              ++v73;
            }
            while (v73 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC292B8((uint64_t)sub_1DCC2944C, (_QWORD *)a1, a2);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v87 = 0;
            v88 = 0;
            v90 = *(_BYTE **)a1;
            v89 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v89)
              v91 = *(_QWORD *)(a1 + 8);
            else
              v91 = *(_QWORD *)(a1 + 32);
            v92 = *(char **)(a1 + 24);
            v93 = *(_QWORD *)(a1 + 32);
            if (v89 < (unint64_t)v4)
              v93 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v88 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v89)
                {
                  v99 = 0;
                  do
                  {
                    v90[v99] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v99);
                    ++v99;
                  }
                  while (v89 != v99);
                }
              }
              else
              {
                v94 = v92;
                v95 = v90;
                v96 = v91;
                if ((_DWORD)v91)
                {
                  do
                  {
                    v97 = *v94;
                    v94 += 2;
                    *v95++ = v97;
                    --v96;
                  }
                  while (v96);
                }
                v98 = v93;
                if (v89 > v4)
                {
                  do
                  {
                    v90[v98] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v98);
                    ++v98;
                  }
                  while ((v89 - v91 + v93) != v98);
                }
              }
              v90 += *(_QWORD *)(a1 + 16);
              v100 = *(_QWORD *)(a1 + 40);
              v92 += v100;
              v88 += v100;
              ++v87;
            }
            while (v87 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC292B8((uint64_t)sub_1DCC29438, (_QWORD *)a1, a2);
        }
        break;
      case 6uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v101 = 0;
          v102 = 0;
          v103 = a2 * 0.000015259;
          v105 = *(_BYTE **)a1;
          v104 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v104)
            v106 = *(_QWORD *)(a1 + 8);
          else
            v106 = *(_QWORD *)(a1 + 32);
          v107 = *(unsigned __int16 **)(a1 + 24);
          v108 = *(_QWORD *)(a1 + 32);
          if (v104 < (unint64_t)v4)
            v108 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v102 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v104)
              {
                v114 = 0;
                do
                {
                  v105[v114] = (int)(float)(v103 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v114)));
                  ++v114;
                }
                while (v104 != v114);
              }
            }
            else
            {
              v109 = v107;
              v110 = v105;
              v111 = v106;
              if ((_DWORD)v106)
              {
                do
                {
                  v112 = *v109++;
                  *v110++ = (int)(float)(v103 * (float)v112);
                  --v111;
                }
                while (v111);
              }
              v113 = v108;
              if (v104 > v4)
              {
                do
                {
                  v105[v113] = (int)(float)(v103 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v113)));
                  ++v113;
                }
                while ((v104 - v106 + v108) != v113);
              }
            }
            v105 += *(_QWORD *)(a1 + 16);
            v115 = *(_QWORD *)(a1 + 40);
            v107 = (unsigned __int16 *)((char *)v107 + v115);
            v102 += v115;
            ++v101;
          }
          while (v101 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 7uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v116 = 0;
          v117 = 0;
          v118 = a2 * 0.000030519;
          v120 = *(_BYTE **)a1;
          v119 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v119)
            v121 = *(_QWORD *)(a1 + 8);
          else
            v121 = *(_QWORD *)(a1 + 32);
          v122 = *(__int16 **)(a1 + 24);
          v123 = *(_QWORD *)(a1 + 32);
          if (v119 < (unint64_t)v4)
            v123 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v117 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v119)
              {
                v129 = 0;
                do
                {
                  v120[v129] = (int)(float)(v118 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v129)));
                  ++v129;
                }
                while (v119 != v129);
              }
            }
            else
            {
              v124 = v122;
              v125 = v120;
              v126 = v121;
              if ((_DWORD)v121)
              {
                do
                {
                  v127 = *v124++;
                  *v125++ = (int)(float)(v118 * (float)v127);
                  --v126;
                }
                while (v126);
              }
              v128 = v123;
              if (v119 > v4)
              {
                do
                {
                  v120[v128] = (int)(float)(v118 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v128)));
                  ++v128;
                }
                while ((v119 - v121 + v123) != v128);
              }
            }
            v120 += *(_QWORD *)(a1 + 16);
            v130 = *(_QWORD *)(a1 + 40);
            v122 = (__int16 *)((char *)v122 + v130);
            v117 += v130;
            ++v116;
          }
          while (v116 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v131 = 0;
            v132 = 0;
            v134 = *(_BYTE **)a1;
            v133 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v133)
              v135 = *(_QWORD *)(a1 + 8);
            else
              v135 = *(_QWORD *)(a1 + 32);
            v136 = *(int **)(a1 + 24);
            v137 = *(_QWORD *)(a1 + 32);
            if (v133 < (unint64_t)v4)
              v137 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v132 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v133)
                {
                  v143 = 0;
                  do
                  {
                    v134[v143] = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v143);
                    ++v143;
                  }
                  while (v133 != v143);
                }
              }
              else
              {
                v138 = v136;
                v139 = v134;
                v140 = v135;
                if ((_DWORD)v135)
                {
                  do
                  {
                    v141 = *v138++;
                    *v139++ = v141;
                    --v140;
                  }
                  while (v140);
                }
                v142 = v137;
                if (v133 > v4)
                {
                  do
                  {
                    v134[v142] = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v142);
                    ++v142;
                  }
                  while ((v133 - v135 + v137) != v142);
                }
              }
              v134 += *(_QWORD *)(a1 + 16);
              v144 = *(_QWORD *)(a1 + 40);
              v136 = (int *)((char *)v136 + v144);
              v132 += v144;
              ++v131;
            }
            while (v131 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC295F4((uint64_t)sub_1DCC295E0, (_QWORD *)a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v145 = 0;
            v146 = 0;
            v148 = *(_BYTE **)a1;
            v147 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v147)
              v149 = *(_QWORD *)(a1 + 8);
            else
              v149 = *(_QWORD *)(a1 + 32);
            v150 = *(int **)(a1 + 24);
            v151 = *(_QWORD *)(a1 + 32);
            if (v147 < (unint64_t)v4)
              v151 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v146 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v147)
                {
                  v157 = 0;
                  do
                  {
                    v148[v157] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v157);
                    ++v157;
                  }
                  while (v147 != v157);
                }
              }
              else
              {
                v152 = v150;
                v153 = v148;
                v154 = v149;
                if ((_DWORD)v149)
                {
                  do
                  {
                    v155 = *v152++;
                    *v153++ = v155;
                    --v154;
                  }
                  while (v154);
                }
                v156 = v151;
                if (v147 > v4)
                {
                  do
                  {
                    v148[v156] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v156);
                    ++v156;
                  }
                  while ((v147 - v149 + v151) != v156);
                }
              }
              v148 += *(_QWORD *)(a1 + 16);
              v158 = *(_QWORD *)(a1 + 40);
              v150 = (int *)((char *)v150 + v158);
              v146 += v158;
              ++v145;
            }
            while (v145 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29460((uint64_t)sub_1DCC295E0, (_QWORD *)a1, a2);
        }
        break;
      case 0xAuLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v159 = 0;
          v160 = 0;
          v161 = *(_BYTE **)a1;
          v162 = *(_QWORD *)(a1 + 8);
          v163 = v162;
          if (*(_QWORD *)(a1 + 32) >= v162)
            v164 = *(_QWORD *)(a1 + 8);
          else
            v164 = *(_QWORD *)(a1 + 32);
          v165 = *(unsigned __int16 **)(a1 + 24);
          if (v162 >= (unint64_t)v4)
            v166 = *(_QWORD *)(a1 + 32);
          else
            v166 = *(_QWORD *)(a1 + 8);
          v189 = v166;
          v190 = v164;
          v167 = (v162 - v164 + v166);
          v191 = *(_QWORD *)(a1 + 8);
          v192 = *(_QWORD *)(a1 + 32);
          do
          {
            if (v160 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v162)
              {
                v173 = 0;
                do
                {
                  v161[v173] = (int)(float)(sub_1DCC1EDA0((int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v173)) * a2);
                  ++v173;
                }
                while (v163 != v173);
              }
            }
            else
            {
              v168 = v165;
              v169 = v161;
              v170 = v190;
              if ((_DWORD)v190)
              {
                do
                {
                  v171 = *v168++;
                  *v169++ = (int)(float)(sub_1DCC1EDA0(v171) * a2);
                  --v170;
                }
                while (v170);
              }
              LOBYTE(v162) = v191;
              v172 = v189;
              if (v191 > v192)
              {
                do
                {
                  v161[v172] = (int)(float)(sub_1DCC1EDA0((int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v172)) * a2);
                  ++v172;
                }
                while (v167 != v172);
              }
            }
            v161 += *(_QWORD *)(a1 + 16);
            v174 = *(_QWORD *)(a1 + 40);
            v165 = (unsigned __int16 *)((char *)v165 + v174);
            v160 += v174;
            ++v159;
          }
          while (v159 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v175 = 0;
            v176 = 0;
            v178 = *(_BYTE **)a1;
            v177 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v177)
              v179 = *(_QWORD *)(a1 + 8);
            else
              v179 = *(_QWORD *)(a1 + 32);
            v180 = *(float **)(a1 + 24);
            v181 = *(_QWORD *)(a1 + 32);
            if (v177 < (unint64_t)v4)
              v181 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v176 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v177)
                {
                  v187 = 0;
                  do
                  {
                    v178[v187] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v187);
                    ++v187;
                  }
                  while (v177 != v187);
                }
              }
              else
              {
                v182 = v180;
                v183 = v178;
                v184 = v179;
                if ((_DWORD)v179)
                {
                  do
                  {
                    v185 = *v182++;
                    *v183++ = (int)v185;
                    --v184;
                  }
                  while (v184);
                }
                v186 = v181;
                if (v177 > v4)
                {
                  do
                  {
                    v178[v186] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v186);
                    ++v186;
                  }
                  while ((v177 - v179 + v181) != v186);
                }
              }
              v178 += *(_QWORD *)(a1 + 16);
              v188 = *(_QWORD *)(a1 + 40);
              v180 = (float *)((char *)v180 + v188);
              v176 += v188;
              ++v175;
            }
            while (v175 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC28F88((uint64_t)sub_1DCC29100, (_QWORD *)a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC22230(_QWORD *a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  _WORD *v26;
  _DWORD *v27;
  uint64_t v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _WORD *v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  float v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  float v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t n;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t ii;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t jj;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  unsigned int v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;

  v5 = a1[4];
  if ((v5 & 0x1000) != 0)
  {
    if (v5 == 593924)
    {
      v28 = a1[8];
      if (v28)
      {
        v29 = a2 * 0.00097752;
        v30 = *((unsigned __int8 *)a1 + 8);
        v31 = a1[2];
        v32 = a1[5];
        v33 = (_WORD *)(*a1 + 4);
        v34 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v33 - 2) = (int)(float)(v29 * (float)(*(v34 - 2) >> 22));
          if (v30 >= 2)
          {
            *(v33 - 1) = (int)(float)(v29 * (float)((*(v34 - 1) >> 12) & 0x3FF));
            if (v30 != 2)
            {
              *v33 = (int)(float)(v29 * (float)((*v34 >> 2) & 0x3FF));
              if (v30 >= 4)
                v33[1] = (int)(float)((float)(a2 * 0.33333) * (float)(v34[1] & 3));
            }
          }
          v33 = (_WORD *)((char *)v33 + v31);
          v34 = (_DWORD *)((char *)v34 + v32);
          --v28;
        }
        while (v28);
      }
    }
    else if (v5 == 659460)
    {
      v21 = a1[8];
      if (v21)
      {
        v22 = a2 * 0.0019569;
        v23 = *((unsigned __int8 *)a1 + 8);
        v24 = a1[2];
        v25 = a1[5];
        v26 = (_WORD *)(*a1 + 4);
        v27 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v26 - 2) = (int)(float)(v22 * (float)(*(v27 - 2) >> 22));
          if (v23 >= 2)
          {
            *(v26 - 1) = (int)(float)(v22 * (float)((*(v27 - 1) >> 12) & 0x3FF));
            if (v23 != 2)
            {
              *v26 = (int)(float)(v22 * (float)((*v27 >> 2) & 0x3FF));
              if (v23 >= 4)
                v26[1] = (int)(float)((float)(v27[1] & 3) * a2);
            }
          }
          v26 = (_WORD *)((char *)v26 + v24);
          v27 = (_DWORD *)((char *)v27 + v25);
          --v21;
        }
        while (v21);
      }
    }
  }
  else
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 != 1.0)
        {
          v203 = sub_1DCC29A94;
          goto LABEL_254;
        }
        v6 = a1[8];
        if (v6)
        {
          v7 = 0;
          v8 = 0;
          v10 = *a1;
          v9 = a1[1];
          if (a1[4] >= v9)
            v11 = a1[1];
          else
            v11 = a1[4];
          v12 = a1[4];
          if (v9 < (unint64_t)v5)
            v12 = a1[1];
          v14 = a1[2];
          v13 = a1[3];
          v16 = a1[5];
          v15 = a1[6];
          v17 = a1[7];
          do
          {
            if (v8 >= v15)
            {
              if ((_BYTE)v9)
              {
                v20 = 0;
                do
                {
                  *(_WORD *)(v10 + 2 * v20) = (int)*(float *)(v17 + 4 * v20);
                  ++v20;
                }
                while (v9 != v20);
              }
            }
            else
            {
              if ((_DWORD)v11)
              {
                for (i = 0; i != v11; ++i)
                  *(_WORD *)(v10 + 2 * i) = *(unsigned __int8 *)(v13 + i);
              }
              v19 = v12;
              if (v9 > v5)
              {
                do
                {
                  *(_WORD *)(v10 + 2 * v19) = (int)*(float *)(v17 + 4 * v19);
                  ++v19;
                }
                while ((v9 - v11 + v12) != v19);
              }
            }
            v10 += v14;
            v13 += v16;
            v8 += v16;
            ++v7;
          }
          while (v7 != v6);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v35 = a1[8];
          if (v35)
          {
            v36 = 0;
            v37 = 0;
            v39 = *a1;
            v38 = a1[1];
            if (a1[4] >= v38)
              v40 = a1[1];
            else
              v40 = a1[4];
            v41 = a1[4];
            if (v38 < (unint64_t)v5)
              v41 = a1[1];
            v43 = a1[2];
            v42 = a1[3];
            v45 = a1[5];
            v44 = a1[6];
            v46 = a1[7];
            do
            {
              if (v37 >= v44)
              {
                if ((_BYTE)v38)
                {
                  v49 = 0;
                  do
                  {
                    *(_WORD *)(v39 + 2 * v49) = (int)*(float *)(v46 + 4 * v49);
                    ++v49;
                  }
                  while (v38 != v49);
                }
              }
              else
              {
                if ((_DWORD)v40)
                {
                  for (j = 0; j != v40; ++j)
                    *(_WORD *)(v39 + 2 * j) = *(char *)(v42 + j);
                }
                v48 = v41;
                if (v38 > v5)
                {
                  do
                  {
                    *(_WORD *)(v39 + 2 * v48) = (int)*(float *)(v46 + 4 * v48);
                    ++v48;
                  }
                  while ((v38 - v40 + v41) != v48);
                }
              }
              v39 += v43;
              v42 += v45;
              v37 += v45;
              ++v36;
            }
            while (v36 != v35);
          }
        }
        else
        {
          v203 = sub_1DCC29A80;
LABEL_254:
          sub_1DCC29900((uint64_t)v203, a1, a2);
        }
        break;
      case 2uLL:
        v50 = a1[8];
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = a2 * 0.0039216;
          v55 = *a1;
          v54 = a1[1];
          if (a1[4] >= v54)
            v56 = a1[1];
          else
            v56 = a1[4];
          v57 = a1[4];
          if (v54 < (unint64_t)v5)
            v57 = a1[1];
          v59 = a1[2];
          v58 = a1[3];
          v61 = a1[5];
          v60 = a1[6];
          v62 = a1[7];
          do
          {
            if (v52 >= v60)
            {
              if ((_BYTE)v54)
              {
                v65 = 0;
                do
                {
                  *(_WORD *)(v55 + 2 * v65) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v65));
                  ++v65;
                }
                while (v54 != v65);
              }
            }
            else
            {
              if ((_DWORD)v56)
              {
                for (k = 0; k != v56; ++k)
                  *(_WORD *)(v55 + 2 * k) = (int)(float)(v53 * (float)*(char *)(v58 + k));
              }
              v64 = v57;
              if (v54 > v5)
              {
                do
                {
                  *(_WORD *)(v55 + 2 * v64) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v64));
                  ++v64;
                }
                while ((v54 - v56 + v57) != v64);
              }
            }
            v55 += v59;
            v58 += v61;
            v52 += v61;
            ++v51;
          }
          while (v51 != v50);
        }
        break;
      case 3uLL:
        v66 = a1[8];
        if (v66)
        {
          v67 = 0;
          v68 = 0;
          v69 = a2 * 0.007874;
          v71 = *a1;
          v70 = a1[1];
          if (a1[4] >= v70)
            v72 = a1[1];
          else
            v72 = a1[4];
          v73 = a1[4];
          if (v70 < (unint64_t)v5)
            v73 = a1[1];
          v75 = a1[2];
          v74 = a1[3];
          v77 = a1[5];
          v76 = a1[6];
          v78 = a1[7];
          do
          {
            if (v68 >= v76)
            {
              if ((_BYTE)v70)
              {
                v81 = 0;
                do
                {
                  *(_WORD *)(v71 + 2 * v81) = (int)(float)(v69 * truncf(*(float *)(v78 + 4 * v81)));
                  ++v81;
                }
                while (v70 != v81);
              }
            }
            else
            {
              if ((_DWORD)v72)
              {
                for (m = 0; m != v72; ++m)
                  *(_WORD *)(v71 + 2 * m) = (int)(float)(v69 * (float)*(char *)(v74 + m));
              }
              v80 = v73;
              if (v70 > v5)
              {
                do
                {
                  *(_WORD *)(v71 + 2 * v80) = (int)(float)(v69 * truncf(*(float *)(v78 + 4 * v80)));
                  ++v80;
                }
                while ((v70 - v72 + v73) != v80);
              }
            }
            v71 += v75;
            v74 += v77;
            v68 += v77;
            ++v67;
          }
          while (v67 != v66);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v204 = sub_1DCC29C3C;
          goto LABEL_257;
        }
        v82 = a1[8];
        if (v82)
        {
          v83 = 0;
          v84 = 0;
          v85 = a1[4];
          v87 = *a1;
          v86 = a1[1];
          if (v85 >= v86)
            v85 = a1[1];
          v88 = a1[4];
          if (v86 < (unint64_t)v5)
            v88 = a1[1];
          v90 = a1[2];
          v89 = a1[3];
          v92 = a1[5];
          v91 = a1[6];
          v93 = a1[7];
          do
          {
            if (v84 >= v91)
            {
              if ((_BYTE)v86)
              {
                v96 = 0;
                do
                {
                  *(_WORD *)(v87 + 2 * v96) = (int)*(float *)(v93 + 4 * v96);
                  ++v96;
                }
                while (v86 != v96);
              }
            }
            else
            {
              if (v85)
              {
                v94 = 0;
                do
                {
                  *(_WORD *)(v87 + v94) = *(_WORD *)(v89 + v94);
                  v94 += 2;
                }
                while (2 * v85 != v94);
              }
              v95 = v88;
              if (v86 > v5)
              {
                do
                {
                  *(_WORD *)(v87 + 2 * v95) = (int)*(float *)(v93 + 4 * v95);
                  ++v95;
                }
                while ((v86 - v85 + v88) != v95);
              }
            }
            v87 += v90;
            v89 += v92;
            v84 += v92;
            ++v83;
          }
          while (v83 != v82);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v97 = a1[8];
          if (v97)
          {
            v98 = 0;
            v99 = 0;
            v100 = a1[4];
            v102 = *a1;
            v101 = a1[1];
            if (v100 >= v101)
              v100 = a1[1];
            v103 = a1[4];
            if (v101 < (unint64_t)v5)
              v103 = a1[1];
            v105 = a1[2];
            v104 = a1[3];
            v107 = a1[5];
            v106 = a1[6];
            v108 = a1[7];
            do
            {
              if (v99 >= v106)
              {
                if ((_BYTE)v101)
                {
                  v111 = 0;
                  do
                  {
                    *(_WORD *)(v102 + 2 * v111) = (int)*(float *)(v108 + 4 * v111);
                    ++v111;
                  }
                  while (v101 != v111);
                }
              }
              else
              {
                if (v100)
                {
                  v109 = 0;
                  do
                  {
                    *(_WORD *)(v102 + v109) = *(_WORD *)(v104 + v109);
                    v109 += 2;
                  }
                  while (2 * v100 != v109);
                }
                v110 = v103;
                if (v101 > v5)
                {
                  do
                  {
                    *(_WORD *)(v102 + 2 * v110) = (int)*(float *)(v108 + 4 * v110);
                    ++v110;
                  }
                  while ((v101 - v100 + v103) != v110);
                }
              }
              v102 += v105;
              v104 += v107;
              v99 += v107;
              ++v98;
            }
            while (v98 != v97);
          }
        }
        else
        {
          v204 = sub_1DCC29C28;
LABEL_257:
          sub_1DCC29AA8((uint64_t)v204, a1, a2);
        }
        break;
      case 6uLL:
        v112 = a1[8];
        if (v112)
        {
          v113 = 0;
          v114 = 0;
          v115 = a2 * 0.000015259;
          v116 = a1[4];
          v118 = *a1;
          v117 = a1[1];
          if (v116 >= v117)
            v116 = a1[1];
          v119 = a1[4];
          if (v117 < (unint64_t)v5)
            v119 = a1[1];
          v121 = a1[2];
          v120 = a1[3];
          v123 = a1[5];
          v122 = a1[6];
          v124 = a1[7];
          do
          {
            if (v114 >= v122)
            {
              if ((_BYTE)v117)
              {
                v127 = 0;
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v127));
                  *(_WORD *)(v118 + 2 * v127++) = (int)a3;
                }
                while (v117 != v127);
              }
            }
            else
            {
              if (v116)
              {
                v125 = 0;
                do
                {
                  LOWORD(a3) = *(_WORD *)(v120 + v125);
                  a3 = v115 * (float)LODWORD(a3);
                  *(_WORD *)(v118 + v125) = (int)a3;
                  v125 += 2;
                }
                while (2 * v116 != v125);
              }
              v126 = v119;
              if (v117 > v5)
              {
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v126));
                  *(_WORD *)(v118 + 2 * v126++) = (int)a3;
                }
                while ((v117 - v116 + v119) != v126);
              }
            }
            v118 += v121;
            v120 += v123;
            v114 += v123;
            ++v113;
          }
          while (v113 != v112);
        }
        break;
      case 7uLL:
        v128 = a1[8];
        if (v128)
        {
          v129 = 0;
          v130 = 0;
          v131 = a2 * 0.000030519;
          v132 = a1[4];
          v134 = *a1;
          v133 = a1[1];
          if (v132 >= v133)
            v132 = a1[1];
          v135 = a1[4];
          if (v133 < (unint64_t)v5)
            v135 = a1[1];
          v137 = a1[2];
          v136 = a1[3];
          v139 = a1[5];
          v138 = a1[6];
          v140 = a1[7];
          do
          {
            if (v130 >= v138)
            {
              if ((_BYTE)v133)
              {
                v143 = 0;
                do
                {
                  *(_WORD *)(v134 + 2 * v143) = (int)(float)(v131 * truncf(*(float *)(v140 + 4 * v143)));
                  ++v143;
                }
                while (v133 != v143);
              }
            }
            else
            {
              if (v132)
              {
                v141 = 0;
                do
                {
                  *(_WORD *)(v134 + v141) = (int)(float)(v131 * (float)*(__int16 *)(v136 + v141));
                  v141 += 2;
                }
                while (2 * v132 != v141);
              }
              v142 = v135;
              if (v133 > v5)
              {
                do
                {
                  *(_WORD *)(v134 + 2 * v142) = (int)(float)(v131 * truncf(*(float *)(v140 + 4 * v142)));
                  ++v142;
                }
                while ((v133 - v132 + v135) != v142);
              }
            }
            v134 += v137;
            v136 += v139;
            v130 += v139;
            ++v129;
          }
          while (v129 != v128);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v144 = a1[8];
          if (v144)
          {
            v145 = 0;
            v146 = 0;
            v148 = *a1;
            v147 = a1[1];
            if (a1[4] >= v147)
              v149 = a1[1];
            else
              v149 = a1[4];
            v150 = a1[4];
            if (v147 < (unint64_t)v5)
              v150 = a1[1];
            v152 = a1[2];
            v151 = a1[3];
            v154 = a1[5];
            v153 = a1[6];
            v155 = a1[7];
            do
            {
              if (v146 >= v153)
              {
                if ((_BYTE)v147)
                {
                  v158 = 0;
                  do
                  {
                    *(_WORD *)(v148 + 2 * v158) = *(float *)(v155 + 4 * v158);
                    ++v158;
                  }
                  while (v147 != v158);
                }
              }
              else
              {
                if ((_DWORD)v149)
                {
                  for (n = 0; n != v149; ++n)
                    *(_WORD *)(v148 + 2 * n) = *(_DWORD *)(v151 + 4 * n);
                }
                v157 = v150;
                if (v147 > v5)
                {
                  do
                  {
                    *(_WORD *)(v148 + 2 * v157) = *(float *)(v155 + 4 * v157);
                    ++v157;
                  }
                  while ((v147 - v149 + v150) != v157);
                }
              }
              v148 += v152;
              v151 += v154;
              v146 += v154;
              ++v145;
            }
            while (v145 != v144);
          }
        }
        else
        {
          sub_1DCC29DE4((uint64_t)sub_1DCC29DD0, a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v159 = a1[8];
          if (v159)
          {
            v160 = 0;
            v161 = 0;
            v163 = *a1;
            v162 = a1[1];
            if (a1[4] >= v162)
              v164 = a1[1];
            else
              v164 = a1[4];
            v165 = a1[4];
            if (v162 < (unint64_t)v5)
              v165 = a1[1];
            v167 = a1[2];
            v166 = a1[3];
            v169 = a1[5];
            v168 = a1[6];
            v170 = a1[7];
            do
            {
              if (v161 >= v168)
              {
                if ((_BYTE)v162)
                {
                  v173 = 0;
                  do
                  {
                    *(_WORD *)(v163 + 2 * v173) = (int)*(float *)(v170 + 4 * v173);
                    ++v173;
                  }
                  while (v162 != v173);
                }
              }
              else
              {
                if ((_DWORD)v164)
                {
                  for (ii = 0; ii != v164; ++ii)
                    *(_WORD *)(v163 + 2 * ii) = *(_DWORD *)(v166 + 4 * ii);
                }
                v172 = v165;
                if (v162 > v5)
                {
                  do
                  {
                    *(_WORD *)(v163 + 2 * v172) = (int)*(float *)(v170 + 4 * v172);
                    ++v172;
                  }
                  while ((v162 - v164 + v165) != v172);
                }
              }
              v163 += v167;
              v166 += v169;
              v161 += v169;
              ++v160;
            }
            while (v160 != v159);
          }
        }
        else
        {
          sub_1DCC29C50((uint64_t)sub_1DCC29DD0, a1, a2);
        }
        break;
      case 0xAuLL:
        v211 = a1[8];
        if (v211)
        {
          v174 = 0;
          v175 = 0;
          v177 = *a1;
          v176 = a1[1];
          v178 = v176;
          if (a1[4] >= v176)
            v179 = a1[1];
          else
            v179 = a1[4];
          if (v176 >= (unint64_t)v5)
            v180 = a1[4];
          else
            v180 = a1[1];
          v210 = a1[1];
          v205 = v180;
          v206 = v179;
          v181 = a1[3];
          v209 = a1[2];
          v182 = a1[7];
          v208 = a1[6];
          v207 = a1[5];
          v183 = 2 * v179;
          v184 = (v176 - v179 + v180);
          do
          {
            if (v175 >= v208)
            {
              if ((_BYTE)v210)
              {
                v187 = 0;
                do
                {
                  *(_WORD *)(v177 + 2 * v187) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v182 + 4 * v187)) * a2);
                  ++v187;
                }
                while (v178 != v187);
              }
            }
            else
            {
              if (v206)
              {
                v185 = 0;
                do
                {
                  *(_WORD *)(v177 + v185) = (int)(float)(sub_1DCC1EDA0(*(unsigned __int16 *)(v181 + v185)) * a2);
                  v185 += 2;
                }
                while (v183 != v185);
              }
              v186 = v205;
              if (v210 > v5)
              {
                do
                {
                  *(_WORD *)(v177 + 2 * v186) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v182 + 4 * v186)) * a2);
                  ++v186;
                }
                while (v184 != v186);
              }
            }
            v177 += v209;
            v181 += v207;
            v175 += v207;
            ++v174;
          }
          while (v174 != v211);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v188 = a1[8];
          if (v188)
          {
            v189 = 0;
            v190 = 0;
            v192 = *a1;
            v191 = a1[1];
            if (a1[4] >= v191)
              v193 = a1[1];
            else
              v193 = a1[4];
            v194 = a1[4];
            if (v191 < (unint64_t)v5)
              v194 = a1[1];
            v196 = a1[2];
            v195 = a1[3];
            v198 = a1[5];
            v197 = a1[6];
            v199 = a1[7];
            do
            {
              if (v190 >= v197)
              {
                if ((_BYTE)v191)
                {
                  v202 = 0;
                  do
                  {
                    *(_WORD *)(v192 + 2 * v202) = (int)*(float *)(v199 + 4 * v202);
                    ++v202;
                  }
                  while (v191 != v202);
                }
              }
              else
              {
                if ((_DWORD)v193)
                {
                  for (jj = 0; jj != v193; ++jj)
                    *(_WORD *)(v192 + 2 * jj) = (int)*(float *)(v195 + 4 * jj);
                }
                v201 = v194;
                if (v191 > v5)
                {
                  do
                  {
                    *(_WORD *)(v192 + 2 * v201) = (int)*(float *)(v199 + 4 * v201);
                    ++v201;
                  }
                  while ((v191 - v193 + v194) != v201);
                }
              }
              v192 += v196;
              v195 += v198;
              v190 += v198;
              ++v189;
            }
            while (v189 != v188);
          }
        }
        else
        {
          sub_1DCC29778((uint64_t)sub_1DCC298F0, a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC23160(_QWORD *a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  _DWORD *v27;
  uint64_t v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t ii;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  float v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t jj;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  float v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t kk;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unsigned int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int v183;
  uint64_t mm;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unsigned int v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;

  v5 = a1[4];
  if ((v5 & 0x1000) != 0)
  {
    if (v5 == 593924)
    {
      v28 = a1[8];
      if (v28)
      {
        v29 = a2 * 0.00097752;
        v30 = *((unsigned __int8 *)a1 + 8);
        v31 = a1[2];
        v32 = a1[5];
        v33 = (_DWORD *)(*a1 + 8);
        v34 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v33 - 2) = (int)(float)(v29 * (float)(*(v34 - 2) >> 22));
          if (v30 >= 2)
          {
            *(v33 - 1) = (int)(float)(v29 * (float)((*(v34 - 1) >> 12) & 0x3FF));
            if (v30 != 2)
            {
              *v33 = (int)(float)(v29 * (float)((*v34 >> 2) & 0x3FF));
              if (v30 >= 4)
                v33[1] = (int)(float)((float)(a2 * 0.33333) * (float)(v34[1] & 3));
            }
          }
          v33 = (_DWORD *)((char *)v33 + v31);
          v34 = (_DWORD *)((char *)v34 + v32);
          --v28;
        }
        while (v28);
      }
    }
    else if (v5 == 659460)
    {
      v21 = a1[8];
      if (v21)
      {
        v22 = a2 * 0.0019569;
        v23 = *((unsigned __int8 *)a1 + 8);
        v24 = a1[2];
        v25 = a1[5];
        v26 = (_DWORD *)(*a1 + 8);
        v27 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v26 - 2) = (int)(float)(v22 * (float)(*(v27 - 2) >> 22));
          if (v23 >= 2)
          {
            *(v26 - 1) = (int)(float)(v22 * (float)((*(v27 - 1) >> 12) & 0x3FF));
            if (v23 != 2)
            {
              *v26 = (int)(float)(v22 * (float)((*v27 >> 2) & 0x3FF));
              if (v23 >= 4)
                v26[1] = (int)(float)((float)(v27[1] & 3) * a2);
            }
          }
          v26 = (_DWORD *)((char *)v26 + v24);
          v27 = (_DWORD *)((char *)v27 + v25);
          --v21;
        }
        while (v21);
      }
    }
  }
  else
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 != 1.0)
        {
          v202 = sub_1DCC2A28C;
          goto LABEL_255;
        }
        v6 = a1[8];
        if (v6)
        {
          v7 = 0;
          v8 = 0;
          v10 = *a1;
          v9 = a1[1];
          if (a1[4] >= v9)
            v11 = a1[1];
          else
            v11 = a1[4];
          v12 = a1[4];
          if (v9 < (unint64_t)v5)
            v12 = a1[1];
          v14 = a1[2];
          v13 = a1[3];
          v15 = a1[5];
          v16 = a1[6];
          v17 = a1[7];
          do
          {
            if (v8 >= v16)
            {
              if ((_BYTE)v9)
              {
                v20 = 0;
                do
                {
                  *(_DWORD *)(v10 + v20) = (int)*(float *)(v17 + v20);
                  v20 += 4;
                }
                while (4 * v9 != v20);
              }
            }
            else
            {
              if ((_DWORD)v11)
              {
                for (i = 0; i != v11; ++i)
                  *(_DWORD *)(v10 + 4 * i) = *(unsigned __int8 *)(v13 + i);
              }
              v19 = v12;
              if (v9 > v5)
              {
                do
                {
                  *(_DWORD *)(v10 + 4 * v19) = (int)*(float *)(v17 + 4 * v19);
                  ++v19;
                }
                while ((v9 - v11 + v12) != v19);
              }
            }
            v10 += v14;
            v13 += v15;
            v8 += v15;
            ++v7;
          }
          while (v7 != v6);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v35 = a1[8];
          if (v35)
          {
            v36 = 0;
            v37 = 0;
            v39 = *a1;
            v38 = a1[1];
            if (a1[4] >= v38)
              v40 = a1[1];
            else
              v40 = a1[4];
            v41 = a1[4];
            if (v38 < (unint64_t)v5)
              v41 = a1[1];
            v43 = a1[2];
            v42 = a1[3];
            v44 = a1[5];
            v45 = a1[6];
            v46 = a1[7];
            do
            {
              if (v37 >= v45)
              {
                if ((_BYTE)v38)
                {
                  v49 = 0;
                  do
                  {
                    *(_DWORD *)(v39 + v49) = (int)*(float *)(v46 + v49);
                    v49 += 4;
                  }
                  while (4 * v38 != v49);
                }
              }
              else
              {
                if ((_DWORD)v40)
                {
                  for (j = 0; j != v40; ++j)
                    *(_DWORD *)(v39 + 4 * j) = *(char *)(v42 + j);
                }
                v48 = v41;
                if (v38 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v39 + 4 * v48) = (int)*(float *)(v46 + 4 * v48);
                    ++v48;
                  }
                  while ((v38 - v40 + v41) != v48);
                }
              }
              v39 += v43;
              v42 += v44;
              v37 += v44;
              ++v36;
            }
            while (v36 != v35);
          }
        }
        else
        {
          v202 = sub_1DCC2A278;
LABEL_255:
          sub_1DCC2A0F4((uint64_t)v202, a1, a2);
        }
        break;
      case 2uLL:
        v50 = a1[8];
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = a2 * 0.0039216;
          v55 = *a1;
          v54 = a1[1];
          if (a1[4] >= v54)
            v56 = a1[1];
          else
            v56 = a1[4];
          v57 = a1[4];
          if (v54 < (unint64_t)v5)
            v57 = a1[1];
          v59 = a1[2];
          v58 = a1[3];
          v60 = a1[5];
          v61 = a1[6];
          v62 = a1[7];
          do
          {
            if (v52 >= v61)
            {
              if ((_BYTE)v54)
              {
                v65 = 0;
                do
                {
                  *(_DWORD *)(v55 + v65) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + v65));
                  v65 += 4;
                }
                while (4 * v54 != v65);
              }
            }
            else
            {
              if ((_DWORD)v56)
              {
                for (k = 0; k != v56; ++k)
                  *(_DWORD *)(v55 + 4 * k) = (int)(float)(v53 * (float)*(char *)(v58 + k));
              }
              v64 = v57;
              if (v54 > v5)
              {
                do
                {
                  *(_DWORD *)(v55 + 4 * v64) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v64));
                  ++v64;
                }
                while ((v54 - v56 + v57) != v64);
              }
            }
            v55 += v59;
            v58 += v60;
            v52 += v60;
            ++v51;
          }
          while (v51 != v50);
        }
        break;
      case 3uLL:
        v66 = a1[8];
        if (v66)
        {
          v67 = 0;
          v68 = 0;
          v69 = a2 * 0.007874;
          v71 = *a1;
          v70 = a1[1];
          if (a1[4] >= v70)
            v72 = a1[1];
          else
            v72 = a1[4];
          v73 = a1[4];
          if (v70 < (unint64_t)v5)
            v73 = a1[1];
          v75 = a1[2];
          v74 = a1[3];
          v76 = a1[5];
          v77 = a1[6];
          v78 = a1[7];
          do
          {
            if (v68 >= v77)
            {
              if ((_BYTE)v70)
              {
                v81 = 0;
                do
                {
                  *(_DWORD *)(v71 + v81) = (int)(float)(v69 * truncf(*(float *)(v78 + v81)));
                  v81 += 4;
                }
                while (4 * v70 != v81);
              }
            }
            else
            {
              if ((_DWORD)v72)
              {
                for (m = 0; m != v72; ++m)
                  *(_DWORD *)(v71 + 4 * m) = (int)(float)(v69 * (float)*(char *)(v74 + m));
              }
              v80 = v73;
              if (v70 > v5)
              {
                do
                {
                  *(_DWORD *)(v71 + 4 * v80) = (int)(float)(v69 * truncf(*(float *)(v78 + 4 * v80)));
                  ++v80;
                }
                while ((v70 - v72 + v73) != v80);
              }
            }
            v71 += v75;
            v74 += v76;
            v68 += v76;
            ++v67;
          }
          while (v67 != v66);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v203 = sub_1DCC2A438;
          goto LABEL_258;
        }
        v82 = a1[8];
        if (v82)
        {
          v83 = 0;
          v84 = 0;
          v86 = *a1;
          v85 = a1[1];
          if (a1[4] >= v85)
            v87 = a1[1];
          else
            v87 = a1[4];
          v88 = a1[4];
          if (v85 < (unint64_t)v5)
            v88 = a1[1];
          v90 = a1[2];
          v89 = a1[3];
          v91 = a1[5];
          v92 = a1[6];
          v93 = a1[7];
          do
          {
            if (v84 >= v92)
            {
              if ((_BYTE)v85)
              {
                v96 = 0;
                do
                {
                  *(_DWORD *)(v86 + v96) = (int)*(float *)(v93 + v96);
                  v96 += 4;
                }
                while (4 * v85 != v96);
              }
            }
            else
            {
              if ((_DWORD)v87)
              {
                for (n = 0; n != v87; ++n)
                  *(_DWORD *)(v86 + 4 * n) = *(unsigned __int16 *)(v89 + 2 * n);
              }
              v95 = v88;
              if (v85 > v5)
              {
                do
                {
                  *(_DWORD *)(v86 + 4 * v95) = (int)*(float *)(v93 + 4 * v95);
                  ++v95;
                }
                while ((v85 - v87 + v88) != v95);
              }
            }
            v86 += v90;
            v89 += v91;
            v84 += v91;
            ++v83;
          }
          while (v83 != v82);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v97 = a1[8];
          if (v97)
          {
            v98 = 0;
            v99 = 0;
            v101 = *a1;
            v100 = a1[1];
            if (a1[4] >= v100)
              v102 = a1[1];
            else
              v102 = a1[4];
            v103 = a1[4];
            if (v100 < (unint64_t)v5)
              v103 = a1[1];
            v105 = a1[2];
            v104 = a1[3];
            v106 = a1[5];
            v107 = a1[6];
            v108 = a1[7];
            do
            {
              if (v99 >= v107)
              {
                if ((_BYTE)v100)
                {
                  v111 = 0;
                  do
                  {
                    *(_DWORD *)(v101 + v111) = (int)*(float *)(v108 + v111);
                    v111 += 4;
                  }
                  while (4 * v100 != v111);
                }
              }
              else
              {
                if ((_DWORD)v102)
                {
                  for (ii = 0; ii != v102; ++ii)
                    *(_DWORD *)(v101 + 4 * ii) = *(__int16 *)(v104 + 2 * ii);
                }
                v110 = v103;
                if (v100 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v101 + 4 * v110) = (int)*(float *)(v108 + 4 * v110);
                    ++v110;
                  }
                  while ((v100 - v102 + v103) != v110);
                }
              }
              v101 += v105;
              v104 += v106;
              v99 += v106;
              ++v98;
            }
            while (v98 != v97);
          }
        }
        else
        {
          v203 = sub_1DCC2A424;
LABEL_258:
          sub_1DCC2A2A0((uint64_t)v203, a1, a2);
        }
        break;
      case 6uLL:
        v112 = a1[8];
        if (v112)
        {
          v113 = 0;
          v114 = 0;
          v115 = a2 * 0.000015259;
          v117 = *a1;
          v116 = a1[1];
          if (a1[4] >= v116)
            v118 = a1[1];
          else
            v118 = a1[4];
          v119 = a1[4];
          if (v116 < (unint64_t)v5)
            v119 = a1[1];
          v121 = a1[2];
          v120 = a1[3];
          v122 = a1[5];
          v123 = a1[6];
          v124 = a1[7];
          do
          {
            if (v114 >= v123)
            {
              if ((_BYTE)v116)
              {
                v127 = 0;
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + v127));
                  *(_DWORD *)(v117 + v127) = (int)a3;
                  v127 += 4;
                }
                while (4 * v116 != v127);
              }
            }
            else
            {
              if ((_DWORD)v118)
              {
                for (jj = 0; jj != v118; ++jj)
                {
                  LOWORD(a3) = *(_WORD *)(v120 + 2 * jj);
                  a3 = v115 * (float)LODWORD(a3);
                  *(_DWORD *)(v117 + 4 * jj) = (int)a3;
                }
              }
              v126 = v119;
              if (v116 > v5)
              {
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v126));
                  *(_DWORD *)(v117 + 4 * v126++) = (int)a3;
                }
                while ((v116 - v118 + v119) != v126);
              }
            }
            v117 += v121;
            v120 += v122;
            v114 += v122;
            ++v113;
          }
          while (v113 != v112);
        }
        break;
      case 7uLL:
        v128 = a1[8];
        if (v128)
        {
          v129 = 0;
          v130 = 0;
          v131 = a2 * 0.000030519;
          v133 = *a1;
          v132 = a1[1];
          if (a1[4] >= v132)
            v134 = a1[1];
          else
            v134 = a1[4];
          v135 = a1[4];
          if (v132 < (unint64_t)v5)
            v135 = a1[1];
          v137 = a1[2];
          v136 = a1[3];
          v138 = a1[5];
          v139 = a1[6];
          v140 = a1[7];
          do
          {
            if (v130 >= v139)
            {
              if ((_BYTE)v132)
              {
                v143 = 0;
                do
                {
                  *(_DWORD *)(v133 + v143) = (int)(float)(v131 * truncf(*(float *)(v140 + v143)));
                  v143 += 4;
                }
                while (4 * v132 != v143);
              }
            }
            else
            {
              if ((_DWORD)v134)
              {
                for (kk = 0; kk != v134; ++kk)
                  *(_DWORD *)(v133 + 4 * kk) = (int)(float)(v131 * (float)*(__int16 *)(v136 + 2 * kk));
              }
              v142 = v135;
              if (v132 > v5)
              {
                do
                {
                  *(_DWORD *)(v133 + 4 * v142) = (int)(float)(v131 * truncf(*(float *)(v140 + 4 * v142)));
                  ++v142;
                }
                while ((v132 - v134 + v135) != v142);
              }
            }
            v133 += v137;
            v136 += v138;
            v130 += v138;
            ++v129;
          }
          while (v129 != v128);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v144 = a1[8];
          if (v144)
          {
            v145 = 0;
            v146 = 0;
            v147 = a1[4];
            v149 = *a1;
            v148 = a1[1];
            if (v147 >= v148)
              v147 = a1[1];
            v150 = a1[4];
            if (v148 < (unint64_t)v5)
              v150 = a1[1];
            v152 = a1[2];
            v151 = a1[3];
            v153 = a1[5];
            v154 = a1[6];
            v155 = a1[7];
            do
            {
              if (v146 >= v154)
              {
                if ((_BYTE)v148)
                {
                  v158 = 0;
                  do
                  {
                    *(_DWORD *)(v149 + v158) = *(float *)(v155 + v158);
                    v158 += 4;
                  }
                  while (4 * v148 != v158);
                }
              }
              else
              {
                if (v147)
                {
                  v156 = 0;
                  do
                  {
                    *(_DWORD *)(v149 + v156) = *(_DWORD *)(v151 + v156);
                    v156 += 4;
                  }
                  while (4 * v147 != v156);
                }
                v157 = v150;
                if (v148 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v149 + 4 * v157) = *(float *)(v155 + 4 * v157);
                    ++v157;
                  }
                  while ((v148 - v147 + v150) != v157);
                }
              }
              v149 += v152;
              v151 += v153;
              v146 += v153;
              ++v145;
            }
            while (v145 != v144);
          }
        }
        else
        {
          sub_1DCC2A5E4((uint64_t)sub_1DCC2A5D0, a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v159 = a1[8];
          if (v159)
          {
            v160 = 0;
            v161 = 0;
            v162 = a1[4];
            v164 = *a1;
            v163 = a1[1];
            if (v162 >= v163)
              v162 = a1[1];
            v165 = a1[4];
            if (v163 < (unint64_t)v5)
              v165 = a1[1];
            v167 = a1[2];
            v166 = a1[3];
            v168 = a1[5];
            v169 = a1[6];
            v170 = a1[7];
            do
            {
              if (v161 >= v169)
              {
                if ((_BYTE)v163)
                {
                  v173 = 0;
                  do
                  {
                    *(_DWORD *)(v164 + v173) = (int)*(float *)(v170 + v173);
                    v173 += 4;
                  }
                  while (4 * v163 != v173);
                }
              }
              else
              {
                if (v162)
                {
                  v171 = 0;
                  do
                  {
                    *(_DWORD *)(v164 + v171) = *(_DWORD *)(v166 + v171);
                    v171 += 4;
                  }
                  while (4 * v162 != v171);
                }
                v172 = v165;
                if (v163 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v164 + 4 * v172) = (int)*(float *)(v170 + 4 * v172);
                    ++v172;
                  }
                  while ((v163 - v162 + v165) != v172);
                }
              }
              v164 += v167;
              v166 += v168;
              v161 += v168;
              ++v160;
            }
            while (v160 != v159);
          }
        }
        else
        {
          sub_1DCC2A44C((uint64_t)sub_1DCC2A5D0, a1, a2);
        }
        break;
      case 0xAuLL:
        v209 = a1[8];
        if (v209)
        {
          v174 = 0;
          v175 = 0;
          v177 = *a1;
          v176 = a1[1];
          if (a1[4] >= v176)
            v178 = a1[1];
          else
            v178 = a1[4];
          if (v176 >= (unint64_t)v5)
            v179 = a1[4];
          else
            v179 = a1[1];
          v204 = v179;
          v180 = a1[3];
          v207 = a1[2];
          v208 = a1[1];
          v181 = a1[7];
          v206 = a1[6];
          v205 = a1[5];
          v182 = 4 * v176;
          v183 = (v176 - v178 + v179);
          do
          {
            if (v175 >= v206)
            {
              if ((_BYTE)v208)
              {
                v186 = 0;
                do
                {
                  *(_DWORD *)(v177 + v186) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v181 + v186)) * a2);
                  v186 += 4;
                }
                while (v182 != v186);
              }
            }
            else
            {
              if ((_DWORD)v178)
              {
                for (mm = 0; mm != v178; ++mm)
                  *(_DWORD *)(v177 + 4 * mm) = (int)(float)(sub_1DCC1EDA0(*(unsigned __int16 *)(v180 + 2 * mm)) * a2);
              }
              v185 = v204;
              if (v208 > v5)
              {
                do
                {
                  *(_DWORD *)(v177 + 4 * v185) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v181 + 4 * v185)) * a2);
                  ++v185;
                }
                while (v183 != v185);
              }
            }
            v177 += v207;
            v180 += v205;
            v175 += v205;
            ++v174;
          }
          while (v174 != v209);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v187 = a1[8];
          if (v187)
          {
            v188 = 0;
            v189 = 0;
            v190 = a1[4];
            v192 = *a1;
            v191 = a1[1];
            if (v190 >= v191)
              v190 = a1[1];
            v193 = a1[4];
            if (v191 < (unint64_t)v5)
              v193 = a1[1];
            v195 = a1[2];
            v194 = a1[3];
            v196 = a1[5];
            v197 = a1[6];
            v198 = a1[7];
            do
            {
              if (v189 >= v197)
              {
                if ((_BYTE)v191)
                {
                  v201 = 0;
                  do
                  {
                    *(_DWORD *)(v192 + v201) = (int)*(float *)(v198 + v201);
                    v201 += 4;
                  }
                  while (4 * v191 != v201);
                }
              }
              else
              {
                if (v190)
                {
                  v199 = 0;
                  do
                  {
                    *(_DWORD *)(v192 + v199) = (int)*(float *)(v194 + v199);
                    v199 += 4;
                  }
                  while (4 * v190 != v199);
                }
                v200 = v193;
                if (v191 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v192 + 4 * v200) = (int)*(float *)(v198 + 4 * v200);
                    ++v200;
                  }
                  while ((v191 - v190 + v193) != v200);
                }
              }
              v192 += v195;
              v194 += v196;
              v189 += v196;
              ++v188;
            }
            while (v188 != v187);
          }
        }
        else
        {
          sub_1DCC29F68((uint64_t)sub_1DCC2A0E4, a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC240B0(uint64_t a1, float a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  _DWORD *v21;
  _BYTE *v22;
  unsigned int v23;
  unint64_t v24;
  float v25;
  _DWORD *v26;
  _BYTE *v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  _BYTE *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  float v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  _BYTE *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  float v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  _BYTE *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  _BYTE *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  _BYTE *v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  float v103;
  uint64_t v104;
  _BYTE *v105;
  uint64_t v106;
  unsigned __int16 *v107;
  uint64_t v108;
  unsigned __int16 *v109;
  _BYTE *v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  float v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  __int16 *v122;
  uint64_t v123;
  __int16 *v124;
  _BYTE *v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  _BYTE *v134;
  uint64_t v135;
  int *v136;
  uint64_t v137;
  int *v138;
  _BYTE *v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  _BYTE *v148;
  uint64_t v149;
  int *v150;
  uint64_t v151;
  int *v152;
  _BYTE *v153;
  uint64_t v154;
  int v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unsigned __int16 *v165;
  uint64_t v166;
  int v167;
  unsigned __int16 *v168;
  _BYTE *v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  _BYTE *v178;
  uint64_t v179;
  float *v180;
  uint64_t v181;
  float *v182;
  _BYTE *v183;
  uint64_t v184;
  float v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;

  v4 = *(_QWORD *)(a1 + 32);
  if ((v4 & 0x1000) != 0)
  {
    if (v4 == 593924)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        v24 = 0;
        v25 = a2 * 0.00097752;
        v26 = *(_DWORD **)(a1 + 24);
        v27 = *(_BYTE **)a1;
        do
        {
          v28 = *(unsigned __int8 *)(a1 + 8);
          *v27 = (int)(float)(v25 * (float)(*v26 >> 22));
          if (v28 >= 2)
          {
            v27[1] = (int)(float)(v25 * (float)((v26[1] >> 12) & 0x3FF));
            if (v28 != 2)
            {
              v27[2] = (int)(float)(v25 * (float)((v26[2] >> 2) & 0x3FF));
              if (v28 >= 4)
                v27[3] = (int)(float)((float)(a2 * 0.33333) * (float)(v26[3] & 3));
            }
          }
          v27 += *(_QWORD *)(a1 + 16);
          v26 = (_DWORD *)((char *)v26 + *(_QWORD *)(a1 + 40));
          ++v24;
        }
        while (v24 < *(_QWORD *)(a1 + 64));
      }
    }
    else if (v4 == 659460 && *(_QWORD *)(a1 + 64))
    {
      v19 = 0;
      v20 = a2 * 0.0019569;
      v21 = *(_DWORD **)(a1 + 24);
      v22 = *(_BYTE **)a1;
      do
      {
        v23 = *(unsigned __int8 *)(a1 + 8);
        *v22 = (int)(float)(v20 * (float)(*v21 >> 22));
        if (v23 >= 2)
        {
          v22[1] = (int)(float)(v20 * (float)((v21[1] >> 12) & 0x3FF));
          if (v23 != 2)
          {
            v22[2] = (int)(float)(v20 * (float)((v21[2] >> 2) & 0x3FF));
            if (v23 >= 4)
              v22[3] = (int)(float)((float)(v21[3] & 3) * a2);
          }
        }
        v22 += *(_QWORD *)(a1 + 16);
        v21 = (_DWORD *)((char *)v21 + *(_QWORD *)(a1 + 40));
        ++v19;
      }
      while (v19 < *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    switch(((*(_QWORD *)(a1 + 32) & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v5 = 0;
            v6 = 0;
            v8 = *(_BYTE **)a1;
            v7 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v7)
              v9 = *(_QWORD *)(a1 + 8);
            else
              v9 = *(_QWORD *)(a1 + 32);
            v10 = *(char **)(a1 + 24);
            v11 = *(_QWORD *)(a1 + 32);
            if (v7 < (unint64_t)v4)
              v11 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v6 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v7)
                {
                  v17 = 0;
                  do
                  {
                    v8[v17] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v17);
                    ++v17;
                  }
                  while (v7 != v17);
                }
              }
              else
              {
                v12 = v10;
                v13 = v8;
                v14 = v9;
                if ((_DWORD)v9)
                {
                  do
                  {
                    v15 = *v12++;
                    *v13++ = v15;
                    --v14;
                  }
                  while (v14);
                }
                v16 = v11;
                if (v7 > v4)
                {
                  do
                  {
                    v8[v16] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v16);
                    ++v16;
                  }
                  while ((v7 - v9 + v11) != v16);
                }
              }
              v8 += *(_QWORD *)(a1 + 16);
              v18 = *(_QWORD *)(a1 + 40);
              v10 += v18;
              v6 += v18;
              ++v5;
            }
            while (v5 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29110((uint64_t)sub_1DCC2A790, (_QWORD *)a1, a2);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v29 = 0;
            v30 = 0;
            v32 = *(_BYTE **)a1;
            v31 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v31)
              v33 = *(_QWORD *)(a1 + 8);
            else
              v33 = *(_QWORD *)(a1 + 32);
            v34 = *(char **)(a1 + 24);
            v35 = *(_QWORD *)(a1 + 32);
            if (v31 < (unint64_t)v4)
              v35 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v30 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v31)
                {
                  v41 = 0;
                  do
                  {
                    v32[v41] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v41);
                    ++v41;
                  }
                  while (v31 != v41);
                }
              }
              else
              {
                v36 = v34;
                v37 = v32;
                v38 = v33;
                if ((_DWORD)v33)
                {
                  do
                  {
                    v39 = *v36++;
                    *v37++ = v39;
                    --v38;
                  }
                  while (v38);
                }
                v40 = v35;
                if (v31 > v4)
                {
                  do
                  {
                    v32[v40] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v40);
                    ++v40;
                  }
                  while ((v31 - v33 + v35) != v40);
                }
              }
              v32 += *(_QWORD *)(a1 + 16);
              v42 = *(_QWORD *)(a1 + 40);
              v34 += v42;
              v30 += v42;
              ++v29;
            }
            while (v29 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29110((uint64_t)sub_1DCC2A77C, (_QWORD *)a1, a2);
        }
        break;
      case 2uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v43 = 0;
          v44 = 0;
          v45 = a2 * 0.0039216;
          v47 = *(_BYTE **)a1;
          v46 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v46)
            v48 = *(_QWORD *)(a1 + 8);
          else
            v48 = *(_QWORD *)(a1 + 32);
          v49 = *(char **)(a1 + 24);
          v50 = *(_QWORD *)(a1 + 32);
          if (v46 < (unint64_t)v4)
            v50 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v44 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v46)
              {
                v56 = 0;
                do
                {
                  v47[v56] = (int)(float)(v45 * (float)(char)(int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v56));
                  ++v56;
                }
                while (v46 != v56);
              }
            }
            else
            {
              v51 = v49;
              v52 = v47;
              v53 = v48;
              if ((_DWORD)v48)
              {
                do
                {
                  v54 = *v51++;
                  *v52++ = (int)(float)(v45 * (float)v54);
                  --v53;
                }
                while (v53);
              }
              v55 = v50;
              if (v46 > v4)
              {
                do
                {
                  v47[v55] = (int)(float)(v45 * (float)(char)(int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v55));
                  ++v55;
                }
                while ((v46 - v48 + v50) != v55);
              }
            }
            v47 += *(_QWORD *)(a1 + 16);
            v57 = *(_QWORD *)(a1 + 40);
            v49 += v57;
            v44 += v57;
            ++v43;
          }
          while (v43 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 3uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v58 = 0;
          v59 = 0;
          v60 = a2 * 0.007874;
          v62 = *(_BYTE **)a1;
          v61 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v61)
            v63 = *(_QWORD *)(a1 + 8);
          else
            v63 = *(_QWORD *)(a1 + 32);
          v64 = *(char **)(a1 + 24);
          v65 = *(_QWORD *)(a1 + 32);
          if (v61 < (unint64_t)v4)
            v65 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v59 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v61)
              {
                v71 = 0;
                do
                {
                  v62[v71] = (int)(float)(v60 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v71)));
                  ++v71;
                }
                while (v61 != v71);
              }
            }
            else
            {
              v66 = v64;
              v67 = v62;
              v68 = v63;
              if ((_DWORD)v63)
              {
                do
                {
                  v69 = *v66++;
                  *v67++ = (int)(float)(v60 * (float)v69);
                  --v68;
                }
                while (v68);
              }
              v70 = v65;
              if (v61 > v4)
              {
                do
                {
                  v62[v70] = (int)(float)(v60 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v70)));
                  ++v70;
                }
                while ((v61 - v63 + v65) != v70);
              }
            }
            v62 += *(_QWORD *)(a1 + 16);
            v72 = *(_QWORD *)(a1 + 40);
            v64 += v72;
            v59 += v72;
            ++v58;
          }
          while (v58 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 4uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v73 = 0;
            v74 = 0;
            v76 = *(_BYTE **)a1;
            v75 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v75)
              v77 = *(_QWORD *)(a1 + 8);
            else
              v77 = *(_QWORD *)(a1 + 32);
            v78 = *(char **)(a1 + 24);
            v79 = *(_QWORD *)(a1 + 32);
            if (v75 < (unint64_t)v4)
              v79 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v74 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v75)
                {
                  v85 = 0;
                  do
                  {
                    v76[v85] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v85);
                    ++v85;
                  }
                  while (v75 != v85);
                }
              }
              else
              {
                v80 = v78;
                v81 = v76;
                v82 = v77;
                if ((_DWORD)v77)
                {
                  do
                  {
                    v83 = *v80;
                    v80 += 2;
                    *v81++ = v83;
                    --v82;
                  }
                  while (v82);
                }
                v84 = v79;
                if (v75 > v4)
                {
                  do
                  {
                    v76[v84] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v84);
                    ++v84;
                  }
                  while ((v75 - v77 + v79) != v84);
                }
              }
              v76 += *(_QWORD *)(a1 + 16);
              v86 = *(_QWORD *)(a1 + 40);
              v78 += v86;
              v74 += v86;
              ++v73;
            }
            while (v73 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC292B8((uint64_t)sub_1DCC2A7B8, (_QWORD *)a1, a2);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v87 = 0;
            v88 = 0;
            v90 = *(_BYTE **)a1;
            v89 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v89)
              v91 = *(_QWORD *)(a1 + 8);
            else
              v91 = *(_QWORD *)(a1 + 32);
            v92 = *(char **)(a1 + 24);
            v93 = *(_QWORD *)(a1 + 32);
            if (v89 < (unint64_t)v4)
              v93 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v88 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v89)
                {
                  v99 = 0;
                  do
                  {
                    v90[v99] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v99);
                    ++v99;
                  }
                  while (v89 != v99);
                }
              }
              else
              {
                v94 = v92;
                v95 = v90;
                v96 = v91;
                if ((_DWORD)v91)
                {
                  do
                  {
                    v97 = *v94;
                    v94 += 2;
                    *v95++ = v97;
                    --v96;
                  }
                  while (v96);
                }
                v98 = v93;
                if (v89 > v4)
                {
                  do
                  {
                    v90[v98] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v98);
                    ++v98;
                  }
                  while ((v89 - v91 + v93) != v98);
                }
              }
              v90 += *(_QWORD *)(a1 + 16);
              v100 = *(_QWORD *)(a1 + 40);
              v92 += v100;
              v88 += v100;
              ++v87;
            }
            while (v87 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC292B8((uint64_t)sub_1DCC2A7A4, (_QWORD *)a1, a2);
        }
        break;
      case 6uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v101 = 0;
          v102 = 0;
          v103 = a2 * 0.000015259;
          v105 = *(_BYTE **)a1;
          v104 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v104)
            v106 = *(_QWORD *)(a1 + 8);
          else
            v106 = *(_QWORD *)(a1 + 32);
          v107 = *(unsigned __int16 **)(a1 + 24);
          v108 = *(_QWORD *)(a1 + 32);
          if (v104 < (unint64_t)v4)
            v108 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v102 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v104)
              {
                v114 = 0;
                do
                {
                  v105[v114] = (int)(float)(v103 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v114)));
                  ++v114;
                }
                while (v104 != v114);
              }
            }
            else
            {
              v109 = v107;
              v110 = v105;
              v111 = v106;
              if ((_DWORD)v106)
              {
                do
                {
                  v112 = *v109++;
                  *v110++ = (int)(float)(v103 * (float)v112);
                  --v111;
                }
                while (v111);
              }
              v113 = v108;
              if (v104 > v4)
              {
                do
                {
                  v105[v113] = (int)(float)(v103 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v113)));
                  ++v113;
                }
                while ((v104 - v106 + v108) != v113);
              }
            }
            v105 += *(_QWORD *)(a1 + 16);
            v115 = *(_QWORD *)(a1 + 40);
            v107 = (unsigned __int16 *)((char *)v107 + v115);
            v102 += v115;
            ++v101;
          }
          while (v101 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 7uLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v116 = 0;
          v117 = 0;
          v118 = a2 * 0.000030519;
          v120 = *(_BYTE **)a1;
          v119 = *(_QWORD *)(a1 + 8);
          if (*(_QWORD *)(a1 + 32) >= v119)
            v121 = *(_QWORD *)(a1 + 8);
          else
            v121 = *(_QWORD *)(a1 + 32);
          v122 = *(__int16 **)(a1 + 24);
          v123 = *(_QWORD *)(a1 + 32);
          if (v119 < (unint64_t)v4)
            v123 = *(_QWORD *)(a1 + 8);
          do
          {
            if (v117 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v119)
              {
                v129 = 0;
                do
                {
                  v120[v129] = (int)(float)(v118 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v129)));
                  ++v129;
                }
                while (v119 != v129);
              }
            }
            else
            {
              v124 = v122;
              v125 = v120;
              v126 = v121;
              if ((_DWORD)v121)
              {
                do
                {
                  v127 = *v124++;
                  *v125++ = (int)(float)(v118 * (float)v127);
                  --v126;
                }
                while (v126);
              }
              v128 = v123;
              if (v119 > v4)
              {
                do
                {
                  v120[v128] = (int)(float)(v118 * truncf(*(float *)(*(_QWORD *)(a1 + 56) + 4 * v128)));
                  ++v128;
                }
                while ((v119 - v121 + v123) != v128);
              }
            }
            v120 += *(_QWORD *)(a1 + 16);
            v130 = *(_QWORD *)(a1 + 40);
            v122 = (__int16 *)((char *)v122 + v130);
            v117 += v130;
            ++v116;
          }
          while (v116 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v131 = 0;
            v132 = 0;
            v134 = *(_BYTE **)a1;
            v133 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v133)
              v135 = *(_QWORD *)(a1 + 8);
            else
              v135 = *(_QWORD *)(a1 + 32);
            v136 = *(int **)(a1 + 24);
            v137 = *(_QWORD *)(a1 + 32);
            if (v133 < (unint64_t)v4)
              v137 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v132 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v133)
                {
                  v143 = 0;
                  do
                  {
                    v134[v143] = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v143);
                    ++v143;
                  }
                  while (v133 != v143);
                }
              }
              else
              {
                v138 = v136;
                v139 = v134;
                v140 = v135;
                if ((_DWORD)v135)
                {
                  do
                  {
                    v141 = *v138++;
                    *v139++ = v141;
                    --v140;
                  }
                  while (v140);
                }
                v142 = v137;
                if (v133 > v4)
                {
                  do
                  {
                    v134[v142] = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v142);
                    ++v142;
                  }
                  while ((v133 - v135 + v137) != v142);
                }
              }
              v134 += *(_QWORD *)(a1 + 16);
              v144 = *(_QWORD *)(a1 + 40);
              v136 = (int *)((char *)v136 + v144);
              v132 += v144;
              ++v131;
            }
            while (v131 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC295F4((uint64_t)sub_1DCC2A7CC, (_QWORD *)a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v145 = 0;
            v146 = 0;
            v148 = *(_BYTE **)a1;
            v147 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v147)
              v149 = *(_QWORD *)(a1 + 8);
            else
              v149 = *(_QWORD *)(a1 + 32);
            v150 = *(int **)(a1 + 24);
            v151 = *(_QWORD *)(a1 + 32);
            if (v147 < (unint64_t)v4)
              v151 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v146 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v147)
                {
                  v157 = 0;
                  do
                  {
                    v148[v157] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v157);
                    ++v157;
                  }
                  while (v147 != v157);
                }
              }
              else
              {
                v152 = v150;
                v153 = v148;
                v154 = v149;
                if ((_DWORD)v149)
                {
                  do
                  {
                    v155 = *v152++;
                    *v153++ = v155;
                    --v154;
                  }
                  while (v154);
                }
                v156 = v151;
                if (v147 > v4)
                {
                  do
                  {
                    v148[v156] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v156);
                    ++v156;
                  }
                  while ((v147 - v149 + v151) != v156);
                }
              }
              v148 += *(_QWORD *)(a1 + 16);
              v158 = *(_QWORD *)(a1 + 40);
              v150 = (int *)((char *)v150 + v158);
              v146 += v158;
              ++v145;
            }
            while (v145 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC29460((uint64_t)sub_1DCC2A7CC, (_QWORD *)a1, a2);
        }
        break;
      case 0xAuLL:
        if (*(_QWORD *)(a1 + 64))
        {
          v159 = 0;
          v160 = 0;
          v161 = *(_BYTE **)a1;
          v162 = *(_QWORD *)(a1 + 8);
          v163 = v162;
          if (*(_QWORD *)(a1 + 32) >= v162)
            v164 = *(_QWORD *)(a1 + 8);
          else
            v164 = *(_QWORD *)(a1 + 32);
          v165 = *(unsigned __int16 **)(a1 + 24);
          if (v162 >= (unint64_t)v4)
            v166 = *(_QWORD *)(a1 + 32);
          else
            v166 = *(_QWORD *)(a1 + 8);
          v189 = v166;
          v190 = v164;
          v167 = (v162 - v164 + v166);
          v191 = *(_QWORD *)(a1 + 8);
          v192 = *(_QWORD *)(a1 + 32);
          do
          {
            if (v160 >= *(_QWORD *)(a1 + 48))
            {
              if ((_BYTE)v162)
              {
                v173 = 0;
                do
                {
                  v161[v173] = (int)(float)(sub_1DCC1EDA0((int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v173)) * a2);
                  ++v173;
                }
                while (v163 != v173);
              }
            }
            else
            {
              v168 = v165;
              v169 = v161;
              v170 = v190;
              if ((_DWORD)v190)
              {
                do
                {
                  v171 = *v168++;
                  *v169++ = (int)(float)(sub_1DCC1EDA0(v171) * a2);
                  --v170;
                }
                while (v170);
              }
              LOBYTE(v162) = v191;
              v172 = v189;
              if (v191 > v192)
              {
                do
                {
                  v161[v172] = (int)(float)(sub_1DCC1EDA0((int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v172)) * a2);
                  ++v172;
                }
                while (v167 != v172);
              }
            }
            v161 += *(_QWORD *)(a1 + 16);
            v174 = *(_QWORD *)(a1 + 40);
            v165 = (unsigned __int16 *)((char *)v165 + v174);
            v160 += v174;
            ++v159;
          }
          while (v159 < *(_QWORD *)(a1 + 64));
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v175 = 0;
            v176 = 0;
            v178 = *(_BYTE **)a1;
            v177 = *(_QWORD *)(a1 + 8);
            if (*(_QWORD *)(a1 + 32) >= v177)
              v179 = *(_QWORD *)(a1 + 8);
            else
              v179 = *(_QWORD *)(a1 + 32);
            v180 = *(float **)(a1 + 24);
            v181 = *(_QWORD *)(a1 + 32);
            if (v177 < (unint64_t)v4)
              v181 = *(_QWORD *)(a1 + 8);
            do
            {
              if (v176 >= *(_QWORD *)(a1 + 48))
              {
                if ((_BYTE)v177)
                {
                  v187 = 0;
                  do
                  {
                    v178[v187] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v187);
                    ++v187;
                  }
                  while (v177 != v187);
                }
              }
              else
              {
                v182 = v180;
                v183 = v178;
                v184 = v179;
                if ((_DWORD)v179)
                {
                  do
                  {
                    v185 = *v182++;
                    *v183++ = (int)v185;
                    --v184;
                  }
                  while (v184);
                }
                v186 = v181;
                if (v177 > v4)
                {
                  do
                  {
                    v178[v186] = (int)*(float *)(*(_QWORD *)(a1 + 56) + 4 * v186);
                    ++v186;
                  }
                  while ((v177 - v179 + v181) != v186);
                }
              }
              v178 += *(_QWORD *)(a1 + 16);
              v188 = *(_QWORD *)(a1 + 40);
              v180 = (float *)((char *)v180 + v188);
              v176 += v188;
              ++v175;
            }
            while (v175 < *(_QWORD *)(a1 + 64));
          }
        }
        else
        {
          sub_1DCC28F88((uint64_t)sub_1DCC2A76C, (_QWORD *)a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC250C4(_QWORD *a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  _WORD *v26;
  _DWORD *v27;
  uint64_t v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _WORD *v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  float v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  float v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t n;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t ii;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t jj;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  unsigned int v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;

  v5 = a1[4];
  if ((v5 & 0x1000) != 0)
  {
    if (v5 == 593924)
    {
      v28 = a1[8];
      if (v28)
      {
        v29 = a2 * 0.00097752;
        v30 = *((unsigned __int8 *)a1 + 8);
        v31 = a1[2];
        v32 = a1[5];
        v33 = (_WORD *)(*a1 + 4);
        v34 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v33 - 2) = (int)(float)(v29 * (float)(*(v34 - 2) >> 22));
          if (v30 >= 2)
          {
            *(v33 - 1) = (int)(float)(v29 * (float)((*(v34 - 1) >> 12) & 0x3FF));
            if (v30 != 2)
            {
              *v33 = (int)(float)(v29 * (float)((*v34 >> 2) & 0x3FF));
              if (v30 >= 4)
                v33[1] = (int)(float)((float)(a2 * 0.33333) * (float)(v34[1] & 3));
            }
          }
          v33 = (_WORD *)((char *)v33 + v31);
          v34 = (_DWORD *)((char *)v34 + v32);
          --v28;
        }
        while (v28);
      }
    }
    else if (v5 == 659460)
    {
      v21 = a1[8];
      if (v21)
      {
        v22 = a2 * 0.0019569;
        v23 = *((unsigned __int8 *)a1 + 8);
        v24 = a1[2];
        v25 = a1[5];
        v26 = (_WORD *)(*a1 + 4);
        v27 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v26 - 2) = (int)(float)(v22 * (float)(*(v27 - 2) >> 22));
          if (v23 >= 2)
          {
            *(v26 - 1) = (int)(float)(v22 * (float)((*(v27 - 1) >> 12) & 0x3FF));
            if (v23 != 2)
            {
              *v26 = (int)(float)(v22 * (float)((*v27 >> 2) & 0x3FF));
              if (v23 >= 4)
                v26[1] = (int)(float)((float)(v27[1] & 3) * a2);
            }
          }
          v26 = (_WORD *)((char *)v26 + v24);
          v27 = (_DWORD *)((char *)v27 + v25);
          --v21;
        }
        while (v21);
      }
    }
  }
  else
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 != 1.0)
        {
          v203 = sub_1DCC2A804;
          goto LABEL_254;
        }
        v6 = a1[8];
        if (v6)
        {
          v7 = 0;
          v8 = 0;
          v10 = *a1;
          v9 = a1[1];
          if (a1[4] >= v9)
            v11 = a1[1];
          else
            v11 = a1[4];
          v12 = a1[4];
          if (v9 < (unint64_t)v5)
            v12 = a1[1];
          v14 = a1[2];
          v13 = a1[3];
          v16 = a1[5];
          v15 = a1[6];
          v17 = a1[7];
          do
          {
            if (v8 >= v15)
            {
              if ((_BYTE)v9)
              {
                v20 = 0;
                do
                {
                  *(_WORD *)(v10 + 2 * v20) = (int)*(float *)(v17 + 4 * v20);
                  ++v20;
                }
                while (v9 != v20);
              }
            }
            else
            {
              if ((_DWORD)v11)
              {
                for (i = 0; i != v11; ++i)
                  *(_WORD *)(v10 + 2 * i) = *(unsigned __int8 *)(v13 + i);
              }
              v19 = v12;
              if (v9 > v5)
              {
                do
                {
                  *(_WORD *)(v10 + 2 * v19) = (int)*(float *)(v17 + 4 * v19);
                  ++v19;
                }
                while ((v9 - v11 + v12) != v19);
              }
            }
            v10 += v14;
            v13 += v16;
            v8 += v16;
            ++v7;
          }
          while (v7 != v6);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v35 = a1[8];
          if (v35)
          {
            v36 = 0;
            v37 = 0;
            v39 = *a1;
            v38 = a1[1];
            if (a1[4] >= v38)
              v40 = a1[1];
            else
              v40 = a1[4];
            v41 = a1[4];
            if (v38 < (unint64_t)v5)
              v41 = a1[1];
            v43 = a1[2];
            v42 = a1[3];
            v45 = a1[5];
            v44 = a1[6];
            v46 = a1[7];
            do
            {
              if (v37 >= v44)
              {
                if ((_BYTE)v38)
                {
                  v49 = 0;
                  do
                  {
                    *(_WORD *)(v39 + 2 * v49) = (int)*(float *)(v46 + 4 * v49);
                    ++v49;
                  }
                  while (v38 != v49);
                }
              }
              else
              {
                if ((_DWORD)v40)
                {
                  for (j = 0; j != v40; ++j)
                    *(_WORD *)(v39 + 2 * j) = *(char *)(v42 + j);
                }
                v48 = v41;
                if (v38 > v5)
                {
                  do
                  {
                    *(_WORD *)(v39 + 2 * v48) = (int)*(float *)(v46 + 4 * v48);
                    ++v48;
                  }
                  while ((v38 - v40 + v41) != v48);
                }
              }
              v39 += v43;
              v42 += v45;
              v37 += v45;
              ++v36;
            }
            while (v36 != v35);
          }
        }
        else
        {
          v203 = sub_1DCC2A7F0;
LABEL_254:
          sub_1DCC29900((uint64_t)v203, a1, a2);
        }
        break;
      case 2uLL:
        v50 = a1[8];
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = a2 * 0.0039216;
          v55 = *a1;
          v54 = a1[1];
          if (a1[4] >= v54)
            v56 = a1[1];
          else
            v56 = a1[4];
          v57 = a1[4];
          if (v54 < (unint64_t)v5)
            v57 = a1[1];
          v59 = a1[2];
          v58 = a1[3];
          v61 = a1[5];
          v60 = a1[6];
          v62 = a1[7];
          do
          {
            if (v52 >= v60)
            {
              if ((_BYTE)v54)
              {
                v65 = 0;
                do
                {
                  *(_WORD *)(v55 + 2 * v65) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v65));
                  ++v65;
                }
                while (v54 != v65);
              }
            }
            else
            {
              if ((_DWORD)v56)
              {
                for (k = 0; k != v56; ++k)
                  *(_WORD *)(v55 + 2 * k) = (int)(float)(v53 * (float)*(char *)(v58 + k));
              }
              v64 = v57;
              if (v54 > v5)
              {
                do
                {
                  *(_WORD *)(v55 + 2 * v64) = (int)(float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v64));
                  ++v64;
                }
                while ((v54 - v56 + v57) != v64);
              }
            }
            v55 += v59;
            v58 += v61;
            v52 += v61;
            ++v51;
          }
          while (v51 != v50);
        }
        break;
      case 3uLL:
        v66 = a1[8];
        if (v66)
        {
          v67 = 0;
          v68 = 0;
          v69 = a2 * 0.007874;
          v71 = *a1;
          v70 = a1[1];
          if (a1[4] >= v70)
            v72 = a1[1];
          else
            v72 = a1[4];
          v73 = a1[4];
          if (v70 < (unint64_t)v5)
            v73 = a1[1];
          v75 = a1[2];
          v74 = a1[3];
          v77 = a1[5];
          v76 = a1[6];
          v78 = a1[7];
          do
          {
            if (v68 >= v76)
            {
              if ((_BYTE)v70)
              {
                v81 = 0;
                do
                {
                  *(_WORD *)(v71 + 2 * v81) = (int)(float)(v69 * truncf(*(float *)(v78 + 4 * v81)));
                  ++v81;
                }
                while (v70 != v81);
              }
            }
            else
            {
              if ((_DWORD)v72)
              {
                for (m = 0; m != v72; ++m)
                  *(_WORD *)(v71 + 2 * m) = (int)(float)(v69 * (float)*(char *)(v74 + m));
              }
              v80 = v73;
              if (v70 > v5)
              {
                do
                {
                  *(_WORD *)(v71 + 2 * v80) = (int)(float)(v69 * truncf(*(float *)(v78 + 4 * v80)));
                  ++v80;
                }
                while ((v70 - v72 + v73) != v80);
              }
            }
            v71 += v75;
            v74 += v77;
            v68 += v77;
            ++v67;
          }
          while (v67 != v66);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v204 = sub_1DCC2A82C;
          goto LABEL_257;
        }
        v82 = a1[8];
        if (v82)
        {
          v83 = 0;
          v84 = 0;
          v85 = a1[4];
          v87 = *a1;
          v86 = a1[1];
          if (v85 >= v86)
            v85 = a1[1];
          v88 = a1[4];
          if (v86 < (unint64_t)v5)
            v88 = a1[1];
          v90 = a1[2];
          v89 = a1[3];
          v92 = a1[5];
          v91 = a1[6];
          v93 = a1[7];
          do
          {
            if (v84 >= v91)
            {
              if ((_BYTE)v86)
              {
                v96 = 0;
                do
                {
                  *(_WORD *)(v87 + 2 * v96) = (int)*(float *)(v93 + 4 * v96);
                  ++v96;
                }
                while (v86 != v96);
              }
            }
            else
            {
              if (v85)
              {
                v94 = 0;
                do
                {
                  *(_WORD *)(v87 + v94) = *(_WORD *)(v89 + v94);
                  v94 += 2;
                }
                while (2 * v85 != v94);
              }
              v95 = v88;
              if (v86 > v5)
              {
                do
                {
                  *(_WORD *)(v87 + 2 * v95) = (int)*(float *)(v93 + 4 * v95);
                  ++v95;
                }
                while ((v86 - v85 + v88) != v95);
              }
            }
            v87 += v90;
            v89 += v92;
            v84 += v92;
            ++v83;
          }
          while (v83 != v82);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v97 = a1[8];
          if (v97)
          {
            v98 = 0;
            v99 = 0;
            v100 = a1[4];
            v102 = *a1;
            v101 = a1[1];
            if (v100 >= v101)
              v100 = a1[1];
            v103 = a1[4];
            if (v101 < (unint64_t)v5)
              v103 = a1[1];
            v105 = a1[2];
            v104 = a1[3];
            v107 = a1[5];
            v106 = a1[6];
            v108 = a1[7];
            do
            {
              if (v99 >= v106)
              {
                if ((_BYTE)v101)
                {
                  v111 = 0;
                  do
                  {
                    *(_WORD *)(v102 + 2 * v111) = (int)*(float *)(v108 + 4 * v111);
                    ++v111;
                  }
                  while (v101 != v111);
                }
              }
              else
              {
                if (v100)
                {
                  v109 = 0;
                  do
                  {
                    *(_WORD *)(v102 + v109) = *(_WORD *)(v104 + v109);
                    v109 += 2;
                  }
                  while (2 * v100 != v109);
                }
                v110 = v103;
                if (v101 > v5)
                {
                  do
                  {
                    *(_WORD *)(v102 + 2 * v110) = (int)*(float *)(v108 + 4 * v110);
                    ++v110;
                  }
                  while ((v101 - v100 + v103) != v110);
                }
              }
              v102 += v105;
              v104 += v107;
              v99 += v107;
              ++v98;
            }
            while (v98 != v97);
          }
        }
        else
        {
          v204 = sub_1DCC2A818;
LABEL_257:
          sub_1DCC29AA8((uint64_t)v204, a1, a2);
        }
        break;
      case 6uLL:
        v112 = a1[8];
        if (v112)
        {
          v113 = 0;
          v114 = 0;
          v115 = a2 * 0.000015259;
          v116 = a1[4];
          v118 = *a1;
          v117 = a1[1];
          if (v116 >= v117)
            v116 = a1[1];
          v119 = a1[4];
          if (v117 < (unint64_t)v5)
            v119 = a1[1];
          v121 = a1[2];
          v120 = a1[3];
          v123 = a1[5];
          v122 = a1[6];
          v124 = a1[7];
          do
          {
            if (v114 >= v122)
            {
              if ((_BYTE)v117)
              {
                v127 = 0;
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v127));
                  *(_WORD *)(v118 + 2 * v127++) = (int)a3;
                }
                while (v117 != v127);
              }
            }
            else
            {
              if (v116)
              {
                v125 = 0;
                do
                {
                  LOWORD(a3) = *(_WORD *)(v120 + v125);
                  a3 = v115 * (float)LODWORD(a3);
                  *(_WORD *)(v118 + v125) = (int)a3;
                  v125 += 2;
                }
                while (2 * v116 != v125);
              }
              v126 = v119;
              if (v117 > v5)
              {
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v126));
                  *(_WORD *)(v118 + 2 * v126++) = (int)a3;
                }
                while ((v117 - v116 + v119) != v126);
              }
            }
            v118 += v121;
            v120 += v123;
            v114 += v123;
            ++v113;
          }
          while (v113 != v112);
        }
        break;
      case 7uLL:
        v128 = a1[8];
        if (v128)
        {
          v129 = 0;
          v130 = 0;
          v131 = a2 * 0.000030519;
          v132 = a1[4];
          v134 = *a1;
          v133 = a1[1];
          if (v132 >= v133)
            v132 = a1[1];
          v135 = a1[4];
          if (v133 < (unint64_t)v5)
            v135 = a1[1];
          v137 = a1[2];
          v136 = a1[3];
          v139 = a1[5];
          v138 = a1[6];
          v140 = a1[7];
          do
          {
            if (v130 >= v138)
            {
              if ((_BYTE)v133)
              {
                v143 = 0;
                do
                {
                  *(_WORD *)(v134 + 2 * v143) = (int)(float)(v131 * truncf(*(float *)(v140 + 4 * v143)));
                  ++v143;
                }
                while (v133 != v143);
              }
            }
            else
            {
              if (v132)
              {
                v141 = 0;
                do
                {
                  *(_WORD *)(v134 + v141) = (int)(float)(v131 * (float)*(__int16 *)(v136 + v141));
                  v141 += 2;
                }
                while (2 * v132 != v141);
              }
              v142 = v135;
              if (v133 > v5)
              {
                do
                {
                  *(_WORD *)(v134 + 2 * v142) = (int)(float)(v131 * truncf(*(float *)(v140 + 4 * v142)));
                  ++v142;
                }
                while ((v133 - v132 + v135) != v142);
              }
            }
            v134 += v137;
            v136 += v139;
            v130 += v139;
            ++v129;
          }
          while (v129 != v128);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v144 = a1[8];
          if (v144)
          {
            v145 = 0;
            v146 = 0;
            v148 = *a1;
            v147 = a1[1];
            if (a1[4] >= v147)
              v149 = a1[1];
            else
              v149 = a1[4];
            v150 = a1[4];
            if (v147 < (unint64_t)v5)
              v150 = a1[1];
            v152 = a1[2];
            v151 = a1[3];
            v154 = a1[5];
            v153 = a1[6];
            v155 = a1[7];
            do
            {
              if (v146 >= v153)
              {
                if ((_BYTE)v147)
                {
                  v158 = 0;
                  do
                  {
                    *(_WORD *)(v148 + 2 * v158) = *(float *)(v155 + 4 * v158);
                    ++v158;
                  }
                  while (v147 != v158);
                }
              }
              else
              {
                if ((_DWORD)v149)
                {
                  for (n = 0; n != v149; ++n)
                    *(_WORD *)(v148 + 2 * n) = *(_DWORD *)(v151 + 4 * n);
                }
                v157 = v150;
                if (v147 > v5)
                {
                  do
                  {
                    *(_WORD *)(v148 + 2 * v157) = *(float *)(v155 + 4 * v157);
                    ++v157;
                  }
                  while ((v147 - v149 + v150) != v157);
                }
              }
              v148 += v152;
              v151 += v154;
              v146 += v154;
              ++v145;
            }
            while (v145 != v144);
          }
        }
        else
        {
          sub_1DCC29DE4((uint64_t)sub_1DCC2A840, a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v159 = a1[8];
          if (v159)
          {
            v160 = 0;
            v161 = 0;
            v163 = *a1;
            v162 = a1[1];
            if (a1[4] >= v162)
              v164 = a1[1];
            else
              v164 = a1[4];
            v165 = a1[4];
            if (v162 < (unint64_t)v5)
              v165 = a1[1];
            v167 = a1[2];
            v166 = a1[3];
            v169 = a1[5];
            v168 = a1[6];
            v170 = a1[7];
            do
            {
              if (v161 >= v168)
              {
                if ((_BYTE)v162)
                {
                  v173 = 0;
                  do
                  {
                    *(_WORD *)(v163 + 2 * v173) = (int)*(float *)(v170 + 4 * v173);
                    ++v173;
                  }
                  while (v162 != v173);
                }
              }
              else
              {
                if ((_DWORD)v164)
                {
                  for (ii = 0; ii != v164; ++ii)
                    *(_WORD *)(v163 + 2 * ii) = *(_DWORD *)(v166 + 4 * ii);
                }
                v172 = v165;
                if (v162 > v5)
                {
                  do
                  {
                    *(_WORD *)(v163 + 2 * v172) = (int)*(float *)(v170 + 4 * v172);
                    ++v172;
                  }
                  while ((v162 - v164 + v165) != v172);
                }
              }
              v163 += v167;
              v166 += v169;
              v161 += v169;
              ++v160;
            }
            while (v160 != v159);
          }
        }
        else
        {
          sub_1DCC29C50((uint64_t)sub_1DCC2A840, a1, a2);
        }
        break;
      case 0xAuLL:
        v211 = a1[8];
        if (v211)
        {
          v174 = 0;
          v175 = 0;
          v177 = *a1;
          v176 = a1[1];
          v178 = v176;
          if (a1[4] >= v176)
            v179 = a1[1];
          else
            v179 = a1[4];
          if (v176 >= (unint64_t)v5)
            v180 = a1[4];
          else
            v180 = a1[1];
          v210 = a1[1];
          v205 = v180;
          v206 = v179;
          v181 = a1[3];
          v209 = a1[2];
          v182 = a1[7];
          v208 = a1[6];
          v207 = a1[5];
          v183 = 2 * v179;
          v184 = (v176 - v179 + v180);
          do
          {
            if (v175 >= v208)
            {
              if ((_BYTE)v210)
              {
                v187 = 0;
                do
                {
                  *(_WORD *)(v177 + 2 * v187) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v182 + 4 * v187)) * a2);
                  ++v187;
                }
                while (v178 != v187);
              }
            }
            else
            {
              if (v206)
              {
                v185 = 0;
                do
                {
                  *(_WORD *)(v177 + v185) = (int)(float)(sub_1DCC1EDA0(*(unsigned __int16 *)(v181 + v185)) * a2);
                  v185 += 2;
                }
                while (v183 != v185);
              }
              v186 = v205;
              if (v210 > v5)
              {
                do
                {
                  *(_WORD *)(v177 + 2 * v186) = (int)(float)(sub_1DCC1EDA0((int)*(float *)(v182 + 4 * v186)) * a2);
                  ++v186;
                }
                while (v184 != v186);
              }
            }
            v177 += v209;
            v181 += v207;
            v175 += v207;
            ++v174;
          }
          while (v174 != v211);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v188 = a1[8];
          if (v188)
          {
            v189 = 0;
            v190 = 0;
            v192 = *a1;
            v191 = a1[1];
            if (a1[4] >= v191)
              v193 = a1[1];
            else
              v193 = a1[4];
            v194 = a1[4];
            if (v191 < (unint64_t)v5)
              v194 = a1[1];
            v196 = a1[2];
            v195 = a1[3];
            v198 = a1[5];
            v197 = a1[6];
            v199 = a1[7];
            do
            {
              if (v190 >= v197)
              {
                if ((_BYTE)v191)
                {
                  v202 = 0;
                  do
                  {
                    *(_WORD *)(v192 + 2 * v202) = (int)*(float *)(v199 + 4 * v202);
                    ++v202;
                  }
                  while (v191 != v202);
                }
              }
              else
              {
                if ((_DWORD)v193)
                {
                  for (jj = 0; jj != v193; ++jj)
                    *(_WORD *)(v192 + 2 * jj) = (int)*(float *)(v195 + 4 * jj);
                }
                v201 = v194;
                if (v191 > v5)
                {
                  do
                  {
                    *(_WORD *)(v192 + 2 * v201) = (int)*(float *)(v199 + 4 * v201);
                    ++v201;
                  }
                  while ((v191 - v193 + v194) != v201);
                }
              }
              v192 += v196;
              v195 += v198;
              v190 += v198;
              ++v189;
            }
            while (v189 != v188);
          }
        }
        else
        {
          sub_1DCC29778((uint64_t)sub_1DCC2A7E0, a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

void sub_1DCC25FF4(_QWORD *a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  _DWORD *v27;
  uint64_t v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t ii;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  float v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t jj;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  float v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t kk;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unsigned int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int v183;
  uint64_t mm;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unsigned int v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;

  v5 = a1[4];
  if ((v5 & 0x1000) != 0)
  {
    if (v5 == 593924)
    {
      v28 = a1[8];
      if (v28)
      {
        v29 = a2 * 0.00097752;
        v30 = *((unsigned __int8 *)a1 + 8);
        v31 = a1[2];
        v32 = a1[5];
        v33 = (_DWORD *)(*a1 + 8);
        v34 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v33 - 2) = (float)(v29 * (float)(*(v34 - 2) >> 22));
          if (v30 >= 2)
          {
            *(v33 - 1) = (float)(v29 * (float)((*(v34 - 1) >> 12) & 0x3FF));
            if (v30 != 2)
            {
              *v33 = (float)(v29 * (float)((*v34 >> 2) & 0x3FF));
              if (v30 >= 4)
                v33[1] = (float)((float)(a2 * 0.33333) * (float)(v34[1] & 3));
            }
          }
          v33 = (_DWORD *)((char *)v33 + v31);
          v34 = (_DWORD *)((char *)v34 + v32);
          --v28;
        }
        while (v28);
      }
    }
    else if (v5 == 659460)
    {
      v21 = a1[8];
      if (v21)
      {
        v22 = a2 * 0.0019569;
        v23 = *((unsigned __int8 *)a1 + 8);
        v24 = a1[2];
        v25 = a1[5];
        v26 = (_DWORD *)(*a1 + 8);
        v27 = (_DWORD *)(a1[3] + 8);
        do
        {
          *(v26 - 2) = (float)(v22 * (float)(*(v27 - 2) >> 22));
          if (v23 >= 2)
          {
            *(v26 - 1) = (float)(v22 * (float)((*(v27 - 1) >> 12) & 0x3FF));
            if (v23 != 2)
            {
              *v26 = (float)(v22 * (float)((*v27 >> 2) & 0x3FF));
              if (v23 >= 4)
                v26[1] = (float)((float)(v27[1] & 3) * a2);
            }
          }
          v26 = (_DWORD *)((char *)v26 + v24);
          v27 = (_DWORD *)((char *)v27 + v25);
          --v21;
        }
        while (v21);
      }
    }
  }
  else
  {
    switch(((a1[4] & 0xFFFF0000uLL) - 0x10000) >> 16)
    {
      case 0uLL:
        if (a2 != 1.0)
        {
          v202 = sub_1DCC2A878;
          goto LABEL_255;
        }
        v6 = a1[8];
        if (v6)
        {
          v7 = 0;
          v8 = 0;
          v10 = *a1;
          v9 = a1[1];
          if (a1[4] >= v9)
            v11 = a1[1];
          else
            v11 = a1[4];
          v12 = a1[4];
          if (v9 < (unint64_t)v5)
            v12 = a1[1];
          v14 = a1[2];
          v13 = a1[3];
          v15 = a1[5];
          v16 = a1[6];
          v17 = a1[7];
          do
          {
            if (v8 >= v16)
            {
              if ((_BYTE)v9)
              {
                v20 = 0;
                do
                {
                  *(_DWORD *)(v10 + v20) = (int)*(float *)(v17 + v20);
                  v20 += 4;
                }
                while (4 * v9 != v20);
              }
            }
            else
            {
              if ((_DWORD)v11)
              {
                for (i = 0; i != v11; ++i)
                  *(_DWORD *)(v10 + 4 * i) = *(unsigned __int8 *)(v13 + i);
              }
              v19 = v12;
              if (v9 > v5)
              {
                do
                {
                  *(_DWORD *)(v10 + 4 * v19) = (int)*(float *)(v17 + 4 * v19);
                  ++v19;
                }
                while ((v9 - v11 + v12) != v19);
              }
            }
            v10 += v14;
            v13 += v15;
            v8 += v15;
            ++v7;
          }
          while (v7 != v6);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v35 = a1[8];
          if (v35)
          {
            v36 = 0;
            v37 = 0;
            v39 = *a1;
            v38 = a1[1];
            if (a1[4] >= v38)
              v40 = a1[1];
            else
              v40 = a1[4];
            v41 = a1[4];
            if (v38 < (unint64_t)v5)
              v41 = a1[1];
            v43 = a1[2];
            v42 = a1[3];
            v44 = a1[5];
            v45 = a1[6];
            v46 = a1[7];
            do
            {
              if (v37 >= v45)
              {
                if ((_BYTE)v38)
                {
                  v49 = 0;
                  do
                  {
                    *(_DWORD *)(v39 + v49) = (int)*(float *)(v46 + v49);
                    v49 += 4;
                  }
                  while (4 * v38 != v49);
                }
              }
              else
              {
                if ((_DWORD)v40)
                {
                  for (j = 0; j != v40; ++j)
                    *(_DWORD *)(v39 + 4 * j) = *(char *)(v42 + j);
                }
                v48 = v41;
                if (v38 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v39 + 4 * v48) = (int)*(float *)(v46 + 4 * v48);
                    ++v48;
                  }
                  while ((v38 - v40 + v41) != v48);
                }
              }
              v39 += v43;
              v42 += v44;
              v37 += v44;
              ++v36;
            }
            while (v36 != v35);
          }
        }
        else
        {
          v202 = sub_1DCC2A864;
LABEL_255:
          sub_1DCC2A0F4((uint64_t)v202, a1, a2);
        }
        break;
      case 2uLL:
        v50 = a1[8];
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = a2 * 0.0039216;
          v55 = *a1;
          v54 = a1[1];
          if (a1[4] >= v54)
            v56 = a1[1];
          else
            v56 = a1[4];
          v57 = a1[4];
          if (v54 < (unint64_t)v5)
            v57 = a1[1];
          v59 = a1[2];
          v58 = a1[3];
          v60 = a1[5];
          v61 = a1[6];
          v62 = a1[7];
          do
          {
            if (v52 >= v61)
            {
              if ((_BYTE)v54)
              {
                v65 = 0;
                do
                {
                  *(_DWORD *)(v55 + v65) = (float)(v53 * (float)(char)(int)*(float *)(v62 + v65));
                  v65 += 4;
                }
                while (4 * v54 != v65);
              }
            }
            else
            {
              if ((_DWORD)v56)
              {
                for (k = 0; k != v56; ++k)
                  *(_DWORD *)(v55 + 4 * k) = (float)(v53 * (float)*(char *)(v58 + k));
              }
              v64 = v57;
              if (v54 > v5)
              {
                do
                {
                  *(_DWORD *)(v55 + 4 * v64) = (float)(v53 * (float)(char)(int)*(float *)(v62 + 4 * v64));
                  ++v64;
                }
                while ((v54 - v56 + v57) != v64);
              }
            }
            v55 += v59;
            v58 += v60;
            v52 += v60;
            ++v51;
          }
          while (v51 != v50);
        }
        break;
      case 3uLL:
        v66 = a1[8];
        if (v66)
        {
          v67 = 0;
          v68 = 0;
          v69 = a2 * 0.007874;
          v71 = *a1;
          v70 = a1[1];
          if (a1[4] >= v70)
            v72 = a1[1];
          else
            v72 = a1[4];
          v73 = a1[4];
          if (v70 < (unint64_t)v5)
            v73 = a1[1];
          v75 = a1[2];
          v74 = a1[3];
          v76 = a1[5];
          v77 = a1[6];
          v78 = a1[7];
          do
          {
            if (v68 >= v77)
            {
              if ((_BYTE)v70)
              {
                v81 = 0;
                do
                {
                  *(_DWORD *)(v71 + v81) = (float)(v69 * truncf(*(float *)(v78 + v81)));
                  v81 += 4;
                }
                while (4 * v70 != v81);
              }
            }
            else
            {
              if ((_DWORD)v72)
              {
                for (m = 0; m != v72; ++m)
                  *(_DWORD *)(v71 + 4 * m) = (float)(v69 * (float)*(char *)(v74 + m));
              }
              v80 = v73;
              if (v70 > v5)
              {
                do
                {
                  *(_DWORD *)(v71 + 4 * v80) = (float)(v69 * truncf(*(float *)(v78 + 4 * v80)));
                  ++v80;
                }
                while ((v70 - v72 + v73) != v80);
              }
            }
            v71 += v75;
            v74 += v76;
            v68 += v76;
            ++v67;
          }
          while (v67 != v66);
        }
        break;
      case 4uLL:
        if (a2 != 1.0)
        {
          v203 = sub_1DCC2A8A0;
          goto LABEL_258;
        }
        v82 = a1[8];
        if (v82)
        {
          v83 = 0;
          v84 = 0;
          v86 = *a1;
          v85 = a1[1];
          if (a1[4] >= v85)
            v87 = a1[1];
          else
            v87 = a1[4];
          v88 = a1[4];
          if (v85 < (unint64_t)v5)
            v88 = a1[1];
          v90 = a1[2];
          v89 = a1[3];
          v91 = a1[5];
          v92 = a1[6];
          v93 = a1[7];
          do
          {
            if (v84 >= v92)
            {
              if ((_BYTE)v85)
              {
                v96 = 0;
                do
                {
                  *(_DWORD *)(v86 + v96) = (int)*(float *)(v93 + v96);
                  v96 += 4;
                }
                while (4 * v85 != v96);
              }
            }
            else
            {
              if ((_DWORD)v87)
              {
                for (n = 0; n != v87; ++n)
                  *(_DWORD *)(v86 + 4 * n) = *(unsigned __int16 *)(v89 + 2 * n);
              }
              v95 = v88;
              if (v85 > v5)
              {
                do
                {
                  *(_DWORD *)(v86 + 4 * v95) = (int)*(float *)(v93 + 4 * v95);
                  ++v95;
                }
                while ((v85 - v87 + v88) != v95);
              }
            }
            v86 += v90;
            v89 += v91;
            v84 += v91;
            ++v83;
          }
          while (v83 != v82);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v97 = a1[8];
          if (v97)
          {
            v98 = 0;
            v99 = 0;
            v101 = *a1;
            v100 = a1[1];
            if (a1[4] >= v100)
              v102 = a1[1];
            else
              v102 = a1[4];
            v103 = a1[4];
            if (v100 < (unint64_t)v5)
              v103 = a1[1];
            v105 = a1[2];
            v104 = a1[3];
            v106 = a1[5];
            v107 = a1[6];
            v108 = a1[7];
            do
            {
              if (v99 >= v107)
              {
                if ((_BYTE)v100)
                {
                  v111 = 0;
                  do
                  {
                    *(_DWORD *)(v101 + v111) = (int)*(float *)(v108 + v111);
                    v111 += 4;
                  }
                  while (4 * v100 != v111);
                }
              }
              else
              {
                if ((_DWORD)v102)
                {
                  for (ii = 0; ii != v102; ++ii)
                    *(_DWORD *)(v101 + 4 * ii) = *(__int16 *)(v104 + 2 * ii);
                }
                v110 = v103;
                if (v100 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v101 + 4 * v110) = (int)*(float *)(v108 + 4 * v110);
                    ++v110;
                  }
                  while ((v100 - v102 + v103) != v110);
                }
              }
              v101 += v105;
              v104 += v106;
              v99 += v106;
              ++v98;
            }
            while (v98 != v97);
          }
        }
        else
        {
          v203 = sub_1DCC2A88C;
LABEL_258:
          sub_1DCC2A2A0((uint64_t)v203, a1, a2);
        }
        break;
      case 6uLL:
        v112 = a1[8];
        if (v112)
        {
          v113 = 0;
          v114 = 0;
          v115 = a2 * 0.000015259;
          v117 = *a1;
          v116 = a1[1];
          if (a1[4] >= v116)
            v118 = a1[1];
          else
            v118 = a1[4];
          v119 = a1[4];
          if (v116 < (unint64_t)v5)
            v119 = a1[1];
          v121 = a1[2];
          v120 = a1[3];
          v122 = a1[5];
          v123 = a1[6];
          v124 = a1[7];
          do
          {
            if (v114 >= v123)
            {
              if ((_BYTE)v116)
              {
                v127 = 0;
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + v127));
                  *(_DWORD *)(v117 + v127) = a3;
                  v127 += 4;
                }
                while (4 * v116 != v127);
              }
            }
            else
            {
              if ((_DWORD)v118)
              {
                for (jj = 0; jj != v118; ++jj)
                {
                  LOWORD(a3) = *(_WORD *)(v120 + 2 * jj);
                  a3 = v115 * (float)LODWORD(a3);
                  *(_DWORD *)(v117 + 4 * jj) = a3;
                }
              }
              v126 = v119;
              if (v116 > v5)
              {
                do
                {
                  a3 = v115 * truncf(*(float *)(v124 + 4 * v126));
                  *(_DWORD *)(v117 + 4 * v126++) = a3;
                }
                while ((v116 - v118 + v119) != v126);
              }
            }
            v117 += v121;
            v120 += v122;
            v114 += v122;
            ++v113;
          }
          while (v113 != v112);
        }
        break;
      case 7uLL:
        v128 = a1[8];
        if (v128)
        {
          v129 = 0;
          v130 = 0;
          v131 = a2 * 0.000030519;
          v133 = *a1;
          v132 = a1[1];
          if (a1[4] >= v132)
            v134 = a1[1];
          else
            v134 = a1[4];
          v135 = a1[4];
          if (v132 < (unint64_t)v5)
            v135 = a1[1];
          v137 = a1[2];
          v136 = a1[3];
          v138 = a1[5];
          v139 = a1[6];
          v140 = a1[7];
          do
          {
            if (v130 >= v139)
            {
              if ((_BYTE)v132)
              {
                v143 = 0;
                do
                {
                  *(_DWORD *)(v133 + v143) = (float)(v131 * truncf(*(float *)(v140 + v143)));
                  v143 += 4;
                }
                while (4 * v132 != v143);
              }
            }
            else
            {
              if ((_DWORD)v134)
              {
                for (kk = 0; kk != v134; ++kk)
                  *(_DWORD *)(v133 + 4 * kk) = (float)(v131 * (float)*(__int16 *)(v136 + 2 * kk));
              }
              v142 = v135;
              if (v132 > v5)
              {
                do
                {
                  *(_DWORD *)(v133 + 4 * v142) = (float)(v131 * truncf(*(float *)(v140 + 4 * v142)));
                  ++v142;
                }
                while ((v132 - v134 + v135) != v142);
              }
            }
            v133 += v137;
            v136 += v138;
            v130 += v138;
            ++v129;
          }
          while (v129 != v128);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v144 = a1[8];
          if (v144)
          {
            v145 = 0;
            v146 = 0;
            v147 = a1[4];
            v149 = *a1;
            v148 = a1[1];
            if (v147 >= v148)
              v147 = a1[1];
            v150 = a1[4];
            if (v148 < (unint64_t)v5)
              v150 = a1[1];
            v152 = a1[2];
            v151 = a1[3];
            v153 = a1[5];
            v154 = a1[6];
            v155 = a1[7];
            do
            {
              if (v146 >= v154)
              {
                if ((_BYTE)v148)
                {
                  v158 = 0;
                  do
                  {
                    *(_DWORD *)(v149 + v158) = *(float *)(v155 + v158);
                    v158 += 4;
                  }
                  while (4 * v148 != v158);
                }
              }
              else
              {
                if (v147)
                {
                  v156 = 0;
                  do
                  {
                    *(_DWORD *)(v149 + v156) = *(_DWORD *)(v151 + v156);
                    v156 += 4;
                  }
                  while (4 * v147 != v156);
                }
                v157 = v150;
                if (v148 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v149 + 4 * v157) = *(float *)(v155 + 4 * v157);
                    ++v157;
                  }
                  while ((v148 - v147 + v150) != v157);
                }
              }
              v149 += v152;
              v151 += v153;
              v146 += v153;
              ++v145;
            }
            while (v145 != v144);
          }
        }
        else
        {
          sub_1DCC2A5E4((uint64_t)sub_1DCC2A8B4, a1, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v159 = a1[8];
          if (v159)
          {
            v160 = 0;
            v161 = 0;
            v162 = a1[4];
            v164 = *a1;
            v163 = a1[1];
            if (v162 >= v163)
              v162 = a1[1];
            v165 = a1[4];
            if (v163 < (unint64_t)v5)
              v165 = a1[1];
            v167 = a1[2];
            v166 = a1[3];
            v168 = a1[5];
            v169 = a1[6];
            v170 = a1[7];
            do
            {
              if (v161 >= v169)
              {
                if ((_BYTE)v163)
                {
                  v173 = 0;
                  do
                  {
                    *(_DWORD *)(v164 + v173) = (int)*(float *)(v170 + v173);
                    v173 += 4;
                  }
                  while (4 * v163 != v173);
                }
              }
              else
              {
                if (v162)
                {
                  v171 = 0;
                  do
                  {
                    *(_DWORD *)(v164 + v171) = *(_DWORD *)(v166 + v171);
                    v171 += 4;
                  }
                  while (4 * v162 != v171);
                }
                v172 = v165;
                if (v163 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v164 + 4 * v172) = (int)*(float *)(v170 + 4 * v172);
                    ++v172;
                  }
                  while ((v163 - v162 + v165) != v172);
                }
              }
              v164 += v167;
              v166 += v168;
              v161 += v168;
              ++v160;
            }
            while (v160 != v159);
          }
        }
        else
        {
          sub_1DCC2A44C((uint64_t)sub_1DCC2A8B4, a1, a2);
        }
        break;
      case 0xAuLL:
        v209 = a1[8];
        if (v209)
        {
          v174 = 0;
          v175 = 0;
          v177 = *a1;
          v176 = a1[1];
          if (a1[4] >= v176)
            v178 = a1[1];
          else
            v178 = a1[4];
          if (v176 >= (unint64_t)v5)
            v179 = a1[4];
          else
            v179 = a1[1];
          v204 = v179;
          v180 = a1[3];
          v207 = a1[2];
          v208 = a1[1];
          v181 = a1[7];
          v206 = a1[6];
          v205 = a1[5];
          v182 = 4 * v176;
          v183 = (v176 - v178 + v179);
          do
          {
            if (v175 >= v206)
            {
              if ((_BYTE)v208)
              {
                v186 = 0;
                do
                {
                  *(_DWORD *)(v177 + v186) = (float)(sub_1DCC1EDA0((int)*(float *)(v181 + v186)) * a2);
                  v186 += 4;
                }
                while (v182 != v186);
              }
            }
            else
            {
              if ((_DWORD)v178)
              {
                for (mm = 0; mm != v178; ++mm)
                  *(_DWORD *)(v177 + 4 * mm) = (float)(sub_1DCC1EDA0(*(unsigned __int16 *)(v180 + 2 * mm))
                                                                   * a2);
              }
              v185 = v204;
              if (v208 > v5)
              {
                do
                {
                  *(_DWORD *)(v177 + 4 * v185) = (float)(sub_1DCC1EDA0((int)*(float *)(v181 + 4 * v185))
                                                                     * a2);
                  ++v185;
                }
                while (v183 != v185);
              }
            }
            v177 += v207;
            v180 += v205;
            v175 += v205;
            ++v174;
          }
          while (v174 != v209);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v187 = a1[8];
          if (v187)
          {
            v188 = 0;
            v189 = 0;
            v190 = a1[4];
            v192 = *a1;
            v191 = a1[1];
            if (v190 >= v191)
              v190 = a1[1];
            v193 = a1[4];
            if (v191 < (unint64_t)v5)
              v193 = a1[1];
            v195 = a1[2];
            v194 = a1[3];
            v196 = a1[5];
            v197 = a1[6];
            v198 = a1[7];
            do
            {
              if (v189 >= v197)
              {
                if ((_BYTE)v191)
                {
                  v201 = 0;
                  do
                  {
                    *(_DWORD *)(v192 + v201) = *(float *)(v198 + v201);
                    v201 += 4;
                  }
                  while (4 * v191 != v201);
                }
              }
              else
              {
                if (v190)
                {
                  v199 = 0;
                  do
                  {
                    *(_DWORD *)(v192 + v199) = *(float *)(v194 + v199);
                    v199 += 4;
                  }
                  while (4 * v190 != v199);
                }
                v200 = v193;
                if (v191 > v5)
                {
                  do
                  {
                    *(_DWORD *)(v192 + 4 * v200) = *(float *)(v198 + 4 * v200);
                    ++v200;
                  }
                  while ((v191 - v190 + v193) != v200);
                }
              }
              v192 += v195;
              v194 += v196;
              v189 += v196;
              ++v188;
            }
            while (v188 != v187);
          }
        }
        else
        {
          sub_1DCC29F68((uint64_t)sub_1DCC2A854, a1, a2);
        }
        break;
      default:
        return;
    }
  }
}

uint64_t sub_1DCC26F44(uint64_t result, float a2)
{
  float v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _WORD *v25;
  _DWORD *v26;
  uint64_t v27;
  float v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _WORD *v33;
  _DWORD *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t j;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t k;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  float v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t m;
  uint64_t v77;
  uint64_t v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unsigned int v112;
  float v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  float v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  uint64_t n;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  uint64_t ii;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unsigned int v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  float v184;
  uint64_t v185;
  float v186;
  uint64_t v187;
  float v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int v199;
  uint64_t jj;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  uint64_t v218;
  uint64_t v219;
  unsigned int v220;
  uint64_t v221;
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
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;

  v2 = a2;
  v3 = (_QWORD *)result;
  v4 = *(_QWORD *)(result + 32);
  if ((v4 & 0x1000) != 0)
  {
    if (v4 == 593924)
    {
      v27 = *(_QWORD *)(result + 64);
      if (v27)
      {
        v28 = a2 * 0.00097752;
        v29 = a2 * 0.33333;
        v30 = *(unsigned __int8 *)(result + 8);
        v31 = *(_QWORD *)(result + 16);
        v32 = *(_QWORD *)(result + 40);
        v33 = (_WORD *)(*(_QWORD *)result + 4);
        v34 = (_DWORD *)(*(_QWORD *)(result + 24) + 8);
        do
        {
          result = sub_1DCC1EE14(v28 * (float)(*(v34 - 2) >> 22));
          *(v33 - 2) = result;
          if (v30 >= 2)
          {
            result = sub_1DCC1EE14(v28 * (float)((*(v34 - 1) >> 12) & 0x3FF));
            *(v33 - 1) = result;
            if (v30 != 2)
            {
              result = sub_1DCC1EE14(v28 * (float)((*v34 >> 2) & 0x3FF));
              *v33 = result;
              if (v30 >= 4)
              {
                result = sub_1DCC1EE14(v29 * (float)(v34[1] & 3));
                v33[1] = result;
              }
            }
          }
          v33 = (_WORD *)((char *)v33 + v31);
          v34 = (_DWORD *)((char *)v34 + v32);
          --v27;
        }
        while (v27);
      }
    }
    else if (v4 == 659460)
    {
      v20 = *(_QWORD *)(result + 64);
      if (v20)
      {
        v21 = a2 * 0.0019569;
        v22 = *(unsigned __int8 *)(result + 8);
        v23 = *(_QWORD *)(result + 16);
        v24 = *(_QWORD *)(result + 40);
        v25 = (_WORD *)(*(_QWORD *)result + 4);
        v26 = (_DWORD *)(*(_QWORD *)(result + 24) + 8);
        do
        {
          result = sub_1DCC1EE14(v21 * (float)(*(v26 - 2) >> 22));
          *(v25 - 2) = result;
          if (v22 >= 2)
          {
            result = sub_1DCC1EE14(v21 * (float)((*(v26 - 1) >> 12) & 0x3FF));
            *(v25 - 1) = result;
            if (v22 != 2)
            {
              result = sub_1DCC1EE14(v21 * (float)((*v26 >> 2) & 0x3FF));
              *v25 = result;
              if (v22 >= 4)
              {
                result = sub_1DCC1EE14((float)(v26[1] & 3) * v2);
                v25[1] = result;
              }
            }
          }
          v25 = (_WORD *)((char *)v25 + v23);
          v26 = (_DWORD *)((char *)v26 + v24);
          --v20;
        }
        while (v20);
      }
    }
  }
  else
  {
    v270 = *(_QWORD *)(result + 32);
    switch(((unint64_t)(v270 & 0xFFFF0000) - 0x10000) >> 16)
    {
      case 0uLL:
        v5 = 1.0;
        if (v2 != 1.0)
        {
          v203 = sub_1DCC2A904;
          a2 = v2;
          goto LABEL_269;
        }
        v258 = *(_QWORD *)(result + 64);
        if (v258)
        {
          v6 = 0;
          v7 = 0;
          v9 = *(_QWORD *)result;
          v8 = *(_QWORD *)(result + 8);
          v10 = v8;
          if (*(_QWORD *)(result + 32) >= v8)
            v11 = *(_QWORD *)(result + 8);
          else
            v11 = *(_QWORD *)(result + 32);
          if (v8 >= (unint64_t)v270)
            v12 = *(_QWORD *)(result + 32);
          else
            v12 = *(_QWORD *)(result + 8);
          v210 = v12;
          v13 = *(_QWORD *)(result + 24);
          v234 = *(_QWORD *)(result + 16);
          v246 = *(_QWORD *)(result + 8);
          v14 = *(_QWORD *)(result + 40);
          v222 = *(_QWORD *)(result + 48);
          v15 = *(_QWORD *)(result + 56);
          v16 = (v8 - v11 + v12);
          do
          {
            if (v7 >= v222)
            {
              if ((_BYTE)v246)
              {
                v19 = 0;
                do
                {
                  result = sub_1DCC1EE14(truncf(*(float *)(v15 + 4 * v19)));
                  *(_WORD *)(v9 + 2 * v19++) = result;
                }
                while (v10 != v19);
              }
            }
            else
            {
              if ((_DWORD)v11)
              {
                for (i = 0; i != v11; ++i)
                {
                  LOBYTE(v5) = *(_BYTE *)(v13 + i);
                  result = sub_1DCC1EE14((float)v5);
                  *(_WORD *)(v9 + 2 * i) = result;
                }
              }
              v18 = v210;
              if (v246 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(truncf(*(float *)(v15 + 4 * v18)));
                  *(_WORD *)(v9 + 2 * v18++) = result;
                }
                while (v16 != v18);
              }
            }
            v9 += v234;
            v13 += v14;
            v7 += v14;
            ++v6;
          }
          while (v6 != v258);
        }
        break;
      case 1uLL:
        if (a2 == 1.0)
        {
          v259 = *(_QWORD *)(result + 64);
          if (v259)
          {
            v35 = 0;
            v36 = 0;
            v38 = *(_QWORD *)result;
            v37 = *(_QWORD *)(result + 8);
            v39 = v37;
            if (*(_QWORD *)(result + 32) >= v37)
              v40 = *(_QWORD *)(result + 8);
            else
              v40 = *(_QWORD *)(result + 32);
            if (v37 >= (unint64_t)v270)
              v41 = *(_QWORD *)(result + 32);
            else
              v41 = *(_QWORD *)(result + 8);
            v211 = v41;
            v42 = *(_QWORD *)(result + 24);
            v235 = *(_QWORD *)(result + 16);
            v247 = *(_QWORD *)(result + 8);
            v43 = *(_QWORD *)(result + 40);
            v223 = *(_QWORD *)(result + 48);
            v44 = *(_QWORD *)(result + 56);
            v45 = (v37 - v40 + v41);
            do
            {
              if (v36 >= v223)
              {
                if ((_BYTE)v247)
                {
                  v48 = 0;
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v44 + 4 * v48)));
                    *(_WORD *)(v38 + 2 * v48++) = result;
                  }
                  while (v39 != v48);
                }
              }
              else
              {
                if ((_DWORD)v40)
                {
                  for (j = 0; j != v40; ++j)
                  {
                    result = sub_1DCC1EE14((float)*(char *)(v42 + j));
                    *(_WORD *)(v38 + 2 * j) = result;
                  }
                }
                v47 = v211;
                if (v247 > v270)
                {
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v44 + 4 * v47)));
                    *(_WORD *)(v38 + 2 * v47++) = result;
                  }
                  while (v45 != v47);
                }
              }
              v38 += v235;
              v42 += v43;
              v36 += v43;
              ++v35;
            }
            while (v35 != v259);
          }
        }
        else
        {
          v203 = sub_1DCC2A8E4;
LABEL_269:
          result = sub_1DCC29900((uint64_t)v203, v3, a2);
        }
        break;
      case 2uLL:
        v260 = *(_QWORD *)(result + 64);
        if (v260)
        {
          v49 = 0;
          v50 = 0;
          v51 = a2 * 0.0039216;
          v53 = *(_QWORD *)result;
          v52 = *(_QWORD *)(result + 8);
          v54 = v52;
          if (*(_QWORD *)(result + 32) >= v52)
            v55 = *(_QWORD *)(result + 8);
          else
            v55 = *(_QWORD *)(result + 32);
          if (v52 >= (unint64_t)v270)
            v56 = *(_QWORD *)(result + 32);
          else
            v56 = *(_QWORD *)(result + 8);
          v212 = v56;
          v57 = *(_QWORD *)(result + 24);
          v236 = *(_QWORD *)(result + 16);
          v248 = *(_QWORD *)(result + 8);
          v58 = *(_QWORD *)(result + 40);
          v224 = *(_QWORD *)(result + 48);
          v59 = *(_QWORD *)(result + 56);
          v60 = (v52 - v55 + v56);
          do
          {
            if (v50 >= v224)
            {
              if ((_BYTE)v248)
              {
                v63 = 0;
                do
                {
                  result = sub_1DCC1EE14(v51 * (float)(char)(int)*(float *)(v59 + 4 * v63));
                  *(_WORD *)(v53 + 2 * v63++) = result;
                }
                while (v54 != v63);
              }
            }
            else
            {
              if ((_DWORD)v55)
              {
                for (k = 0; k != v55; ++k)
                {
                  result = sub_1DCC1EE14(v51 * (float)*(char *)(v57 + k));
                  *(_WORD *)(v53 + 2 * k) = result;
                }
              }
              v62 = v212;
              if (v248 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(v51 * (float)(char)(int)*(float *)(v59 + 4 * v62));
                  *(_WORD *)(v53 + 2 * v62++) = result;
                }
                while (v60 != v62);
              }
            }
            v53 += v236;
            v57 += v58;
            v50 += v58;
            ++v49;
          }
          while (v49 != v260);
        }
        break;
      case 3uLL:
        v261 = *(_QWORD *)(result + 64);
        if (v261)
        {
          v64 = 0;
          v65 = 0;
          v66 = a2 * 0.007874;
          v68 = *(_QWORD *)result;
          v67 = *(_QWORD *)(result + 8);
          v69 = v67;
          if (*(_QWORD *)(result + 32) >= v67)
            v70 = *(_QWORD *)(result + 8);
          else
            v70 = *(_QWORD *)(result + 32);
          if (v67 >= (unint64_t)v270)
            v71 = *(_QWORD *)(result + 32);
          else
            v71 = *(_QWORD *)(result + 8);
          v213 = v71;
          v72 = *(_QWORD *)(result + 24);
          v237 = *(_QWORD *)(result + 16);
          v249 = *(_QWORD *)(result + 8);
          v73 = *(_QWORD *)(result + 40);
          v225 = *(_QWORD *)(result + 48);
          v74 = *(_QWORD *)(result + 56);
          v75 = (v67 - v70 + v71);
          do
          {
            if (v65 >= v225)
            {
              if ((_BYTE)v249)
              {
                v78 = 0;
                do
                {
                  result = sub_1DCC1EE14(v66 * truncf(*(float *)(v74 + 4 * v78)));
                  *(_WORD *)(v68 + 2 * v78++) = result;
                }
                while (v69 != v78);
              }
            }
            else
            {
              if ((_DWORD)v70)
              {
                for (m = 0; m != v70; ++m)
                {
                  result = sub_1DCC1EE14(v66 * (float)*(char *)(v72 + m));
                  *(_WORD *)(v68 + 2 * m) = result;
                }
              }
              v77 = v213;
              if (v249 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(v66 * truncf(*(float *)(v74 + 4 * v77)));
                  *(_WORD *)(v68 + 2 * v77++) = result;
                }
                while (v75 != v77);
              }
            }
            v68 += v237;
            v72 += v73;
            v65 += v73;
            ++v64;
          }
          while (v64 != v261);
        }
        break;
      case 4uLL:
        v79 = 1.0;
        if (v2 != 1.0)
        {
          v204 = sub_1DCC2A944;
          a2 = v2;
          goto LABEL_272;
        }
        v262 = *(_QWORD *)(result + 64);
        if (v262)
        {
          v80 = 0;
          v81 = 0;
          v83 = *(_QWORD *)result;
          v82 = *(_QWORD *)(result + 8);
          v84 = v82;
          if (*(_QWORD *)(result + 32) >= v82)
            v85 = *(_QWORD *)(result + 8);
          else
            v85 = *(_QWORD *)(result + 32);
          if (v82 >= (unint64_t)v270)
            v86 = *(_QWORD *)(result + 32);
          else
            v86 = *(_QWORD *)(result + 8);
          v205 = v86;
          v214 = v85;
          v87 = *(_QWORD *)(result + 24);
          v238 = *(_QWORD *)(result + 16);
          v250 = *(_QWORD *)(result + 8);
          v88 = *(_QWORD *)(result + 40);
          v226 = *(_QWORD *)(result + 48);
          v89 = *(_QWORD *)(result + 56);
          v90 = 2 * v85;
          v91 = (v82 - v85 + v86);
          do
          {
            if (v81 >= v226)
            {
              if ((_BYTE)v250)
              {
                v94 = 0;
                do
                {
                  result = sub_1DCC1EE14(truncf(*(float *)(v89 + 4 * v94)));
                  *(_WORD *)(v83 + 2 * v94++) = result;
                }
                while (v84 != v94);
              }
            }
            else
            {
              if (v214)
              {
                v92 = 0;
                do
                {
                  LOWORD(v79) = *(_WORD *)(v87 + v92);
                  result = sub_1DCC1EE14((float)v79);
                  *(_WORD *)(v83 + v92) = result;
                  v92 += 2;
                }
                while (v90 != v92);
              }
              v93 = v205;
              if (v250 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(truncf(*(float *)(v89 + 4 * v93)));
                  *(_WORD *)(v83 + 2 * v93++) = result;
                }
                while (v91 != v93);
              }
            }
            v83 += v238;
            v87 += v88;
            v81 += v88;
            ++v80;
          }
          while (v80 != v262);
        }
        break;
      case 5uLL:
        if (a2 == 1.0)
        {
          v263 = *(_QWORD *)(result + 64);
          if (v263)
          {
            v95 = 0;
            v96 = 0;
            v98 = *(_QWORD *)result;
            v97 = *(_QWORD *)(result + 8);
            v99 = v97;
            if (*(_QWORD *)(result + 32) >= v97)
              v100 = *(_QWORD *)(result + 8);
            else
              v100 = *(_QWORD *)(result + 32);
            if (v97 >= (unint64_t)v270)
              v101 = *(_QWORD *)(result + 32);
            else
              v101 = *(_QWORD *)(result + 8);
            v206 = v101;
            v215 = v100;
            v102 = *(_QWORD *)(result + 24);
            v239 = *(_QWORD *)(result + 16);
            v251 = *(_QWORD *)(result + 8);
            v103 = *(_QWORD *)(result + 40);
            v227 = *(_QWORD *)(result + 48);
            v104 = *(_QWORD *)(result + 56);
            v105 = 2 * v100;
            v106 = (v97 - v100 + v101);
            do
            {
              if (v96 >= v227)
              {
                if ((_BYTE)v251)
                {
                  v109 = 0;
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v104 + 4 * v109)));
                    *(_WORD *)(v98 + 2 * v109++) = result;
                  }
                  while (v99 != v109);
                }
              }
              else
              {
                if (v215)
                {
                  v107 = 0;
                  do
                  {
                    result = sub_1DCC1EE14((float)*(__int16 *)(v102 + v107));
                    *(_WORD *)(v98 + v107) = result;
                    v107 += 2;
                  }
                  while (v105 != v107);
                }
                v108 = v206;
                if (v251 > v270)
                {
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v104 + 4 * v108)));
                    *(_WORD *)(v98 + 2 * v108++) = result;
                  }
                  while (v106 != v108);
                }
              }
              v98 += v239;
              v102 += v103;
              v96 += v103;
              ++v95;
            }
            while (v95 != v263);
          }
        }
        else
        {
          v204 = sub_1DCC2A924;
LABEL_272:
          result = sub_1DCC29AA8((uint64_t)v204, v3, a2);
        }
        break;
      case 6uLL:
        v264 = *(_QWORD *)(result + 64);
        if (v264)
        {
          v110 = 0;
          v111 = 0;
          HIWORD(v112) = 14208;
          v113 = v2 * 0.000015259;
          v115 = *(_QWORD *)result;
          v114 = *(_QWORD *)(result + 8);
          v116 = v114;
          if (*(_QWORD *)(result + 32) >= v114)
            v117 = *(_QWORD *)(result + 8);
          else
            v117 = *(_QWORD *)(result + 32);
          if (v114 >= (unint64_t)v270)
            v118 = *(_QWORD *)(result + 32);
          else
            v118 = *(_QWORD *)(result + 8);
          v207 = v118;
          v216 = v117;
          v119 = *(_QWORD *)(result + 24);
          v240 = *(_QWORD *)(result + 16);
          v252 = *(_QWORD *)(result + 8);
          v120 = *(_QWORD *)(result + 40);
          v228 = *(_QWORD *)(result + 48);
          v121 = *(_QWORD *)(result + 56);
          v122 = 2 * v117;
          v123 = (v114 - v117 + v118);
          do
          {
            if (v111 >= v228)
            {
              if ((_BYTE)v252)
              {
                v126 = 0;
                do
                {
                  result = sub_1DCC1EE14(v113 * truncf(*(float *)(v121 + 4 * v126)));
                  *(_WORD *)(v115 + 2 * v126++) = result;
                }
                while (v116 != v126);
              }
            }
            else
            {
              if (v216)
              {
                v124 = 0;
                do
                {
                  LOWORD(v112) = *(_WORD *)(v119 + v124);
                  result = sub_1DCC1EE14(v113 * (float)v112);
                  *(_WORD *)(v115 + v124) = result;
                  v124 += 2;
                }
                while (v122 != v124);
              }
              v125 = v207;
              if (v252 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(v113 * truncf(*(float *)(v121 + 4 * v125)));
                  *(_WORD *)(v115 + 2 * v125++) = result;
                }
                while (v123 != v125);
              }
            }
            v115 += v240;
            v119 += v120;
            v111 += v120;
            ++v110;
          }
          while (v110 != v264);
        }
        break;
      case 7uLL:
        v265 = *(_QWORD *)(result + 64);
        if (v265)
        {
          v127 = 0;
          v128 = 0;
          v129 = a2 * 0.000030519;
          v131 = *(_QWORD *)result;
          v130 = *(_QWORD *)(result + 8);
          v132 = v130;
          if (*(_QWORD *)(result + 32) >= v130)
            v133 = *(_QWORD *)(result + 8);
          else
            v133 = *(_QWORD *)(result + 32);
          if (v130 >= (unint64_t)v270)
            v134 = *(_QWORD *)(result + 32);
          else
            v134 = *(_QWORD *)(result + 8);
          v208 = v134;
          v217 = v133;
          v135 = *(_QWORD *)(result + 24);
          v241 = *(_QWORD *)(result + 16);
          v253 = *(_QWORD *)(result + 8);
          v136 = *(_QWORD *)(result + 40);
          v229 = *(_QWORD *)(result + 48);
          v137 = *(_QWORD *)(result + 56);
          v138 = 2 * v133;
          v139 = (v130 - v133 + v134);
          do
          {
            if (v128 >= v229)
            {
              if ((_BYTE)v253)
              {
                v142 = 0;
                do
                {
                  result = sub_1DCC1EE14(v129 * truncf(*(float *)(v137 + 4 * v142)));
                  *(_WORD *)(v131 + 2 * v142++) = result;
                }
                while (v132 != v142);
              }
            }
            else
            {
              if (v217)
              {
                v140 = 0;
                do
                {
                  result = sub_1DCC1EE14(v129 * (float)*(__int16 *)(v135 + v140));
                  *(_WORD *)(v131 + v140) = result;
                  v140 += 2;
                }
                while (v138 != v140);
              }
              v141 = v208;
              if (v253 > v270)
              {
                do
                {
                  result = sub_1DCC1EE14(v129 * truncf(*(float *)(v137 + 4 * v141)));
                  *(_WORD *)(v131 + 2 * v141++) = result;
                }
                while (v139 != v141);
              }
            }
            v131 += v241;
            v135 += v136;
            v128 += v136;
            ++v127;
          }
          while (v127 != v265);
        }
        break;
      case 8uLL:
        if (a2 == 1.0)
        {
          v266 = *(_QWORD *)(result + 64);
          if (v266)
          {
            v143 = 0;
            v144 = 0;
            v146 = *(_QWORD *)result;
            v145 = *(_QWORD *)(result + 8);
            v147 = v145;
            if (*(_QWORD *)(result + 32) >= v145)
              v148 = *(_QWORD *)(result + 8);
            else
              v148 = *(_QWORD *)(result + 32);
            if (v145 >= (unint64_t)v270)
              v149 = *(_QWORD *)(result + 32);
            else
              v149 = *(_QWORD *)(result + 8);
            v218 = v149;
            v150 = *(_QWORD *)(result + 24);
            v242 = *(_QWORD *)(result + 16);
            v254 = *(_QWORD *)(result + 8);
            v151 = *(_QWORD *)(result + 40);
            v230 = *(_QWORD *)(result + 48);
            v152 = *(_QWORD *)(result + 56);
            v153 = (v145 - v148 + v149);
            do
            {
              if (v144 >= v230)
              {
                if ((_BYTE)v254)
                {
                  v156 = 0;
                  do
                  {
                    result = sub_1DCC1EE14((float)(int)*(float *)(v152 + 4 * v156));
                    *(_WORD *)(v146 + 2 * v156++) = result;
                  }
                  while (v147 != v156);
                }
              }
              else
              {
                if ((_DWORD)v148)
                {
                  for (n = 0; n != v148; ++n)
                  {
                    result = sub_1DCC1EE14((float)*(int *)(v150 + 4 * n));
                    *(_WORD *)(v146 + 2 * n) = result;
                  }
                }
                v155 = v218;
                if (v254 > v270)
                {
                  do
                  {
                    result = sub_1DCC1EE14((float)(int)*(float *)(v152 + 4 * v155));
                    *(_WORD *)(v146 + 2 * v155++) = result;
                  }
                  while (v153 != v155);
                }
              }
              v146 += v242;
              v150 += v151;
              v144 += v151;
              ++v143;
            }
            while (v143 != v266);
          }
        }
        else
        {
          result = sub_1DCC29DE4((uint64_t)sub_1DCC2A964, (_QWORD *)result, a2);
        }
        break;
      case 9uLL:
        if (a2 == 1.0)
        {
          v267 = *(_QWORD *)(result + 64);
          if (v267)
          {
            v157 = 0;
            v158 = 0;
            v160 = *(_QWORD *)result;
            v159 = *(_QWORD *)(result + 8);
            v161 = v159;
            if (*(_QWORD *)(result + 32) >= v159)
              v162 = *(_QWORD *)(result + 8);
            else
              v162 = *(_QWORD *)(result + 32);
            if (v159 >= (unint64_t)v270)
              v163 = *(_QWORD *)(result + 32);
            else
              v163 = *(_QWORD *)(result + 8);
            v219 = v163;
            v164 = *(_QWORD *)(result + 24);
            v243 = *(_QWORD *)(result + 16);
            v255 = *(_QWORD *)(result + 8);
            v165 = *(_QWORD *)(result + 40);
            v231 = *(_QWORD *)(result + 48);
            v166 = *(_QWORD *)(result + 56);
            v167 = (v159 - v162 + v163);
            do
            {
              if (v158 >= v231)
              {
                if ((_BYTE)v255)
                {
                  v170 = 0;
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v166 + 4 * v170)));
                    *(_WORD *)(v160 + 2 * v170++) = result;
                  }
                  while (v161 != v170);
                }
              }
              else
              {
                if ((_DWORD)v162)
                {
                  for (ii = 0; ii != v162; ++ii)
                  {
                    result = sub_1DCC1EE14((float)*(int *)(v164 + 4 * ii));
                    *(_WORD *)(v160 + 2 * ii) = result;
                  }
                }
                v169 = v219;
                if (v255 > v270)
                {
                  do
                  {
                    result = sub_1DCC1EE14(truncf(*(float *)(v166 + 4 * v169)));
                    *(_WORD *)(v160 + 2 * v169++) = result;
                  }
                  while (v167 != v169);
                }
              }
              v160 += v243;
              v164 += v165;
              v158 += v165;
              ++v157;
            }
            while (v157 != v267);
          }
        }
        else
        {
          result = sub_1DCC29C50((uint64_t)sub_1DCC2A964, (_QWORD *)result, a2);
        }
        break;
      case 0xAuLL:
        v268 = *(_QWORD *)(result + 64);
        if (v268)
        {
          v171 = 0;
          v172 = 0;
          v174 = *(_QWORD *)result;
          v173 = *(_QWORD *)(result + 8);
          v175 = v173;
          if (*(_QWORD *)(result + 32) >= v173)
            v176 = *(_QWORD *)(result + 8);
          else
            v176 = *(_QWORD *)(result + 32);
          if (v173 >= (unint64_t)v270)
            v177 = *(_QWORD *)(result + 32);
          else
            v177 = *(_QWORD *)(result + 8);
          v209 = v177;
          v220 = v176;
          v178 = *(_QWORD *)(result + 24);
          v244 = *(_QWORD *)(result + 16);
          v256 = *(_QWORD *)(result + 8);
          v179 = *(_QWORD *)(result + 40);
          v232 = *(_QWORD *)(result + 48);
          v180 = *(_QWORD *)(result + 56);
          v181 = 2 * v176;
          v182 = (v173 - v176 + v177);
          do
          {
            if (v172 >= v232)
            {
              if ((_BYTE)v256)
              {
                v187 = 0;
                do
                {
                  v188 = sub_1DCC1EDA0((int)*(float *)(v180 + 4 * v187));
                  result = sub_1DCC1EE14(v188 * v2);
                  *(_WORD *)(v174 + 2 * v187++) = result;
                }
                while (v175 != v187);
              }
            }
            else
            {
              if (v220)
              {
                v183 = 0;
                do
                {
                  v184 = sub_1DCC1EDA0(*(unsigned __int16 *)(v178 + v183));
                  result = sub_1DCC1EE14(v184 * v2);
                  *(_WORD *)(v174 + v183) = result;
                  v183 += 2;
                }
                while (v181 != v183);
              }
              v185 = v209;
              if (v256 > v270)
              {
                do
                {
                  v186 = sub_1DCC1EDA0((int)*(float *)(v180 + 4 * v185));
                  result = sub_1DCC1EE14(v186 * v2);
                  *(_WORD *)(v174 + 2 * v185++) = result;
                }
                while (v182 != v185);
              }
            }
            v174 += v244;
            v178 += v179;
            v172 += v179;
            ++v171;
          }
          while (v171 != v268);
        }
        break;
      case 0xBuLL:
        if (a2 == 1.0)
        {
          v269 = *(_QWORD *)(result + 64);
          if (v269)
          {
            v189 = 0;
            v190 = 0;
            v192 = *(_QWORD *)result;
            v191 = *(_QWORD *)(result + 8);
            v193 = v191;
            if (*(_QWORD *)(result + 32) >= v191)
              v194 = *(_QWORD *)(result + 8);
            else
              v194 = *(_QWORD *)(result + 32);
            if (v191 >= (unint64_t)v270)
              v195 = *(_QWORD *)(result + 32);
            else
              v195 = *(_QWORD *)(result + 8);
            v221 = v195;
            v196 = *(_QWORD *)(result + 24);
            v245 = *(_QWORD *)(result + 16);
            v257 = *(_QWORD *)(result + 8);
            v197 = *(_QWORD *)(result + 40);
            v233 = *(_QWORD *)(result + 48);
            v198 = *(_QWORD *)(result + 56);
            v199 = (v191 - v194 + v195);
            do
            {
              if (v190 >= v233)
              {
                if ((_BYTE)v257)
                {
                  v202 = 0;
                  do
                  {
                    result = sub_1DCC1EE14(*(float *)(v198 + 4 * v202));
                    *(_WORD *)(v192 + 2 * v202++) = result;
                  }
                  while (v193 != v202);
                }
              }
              else
              {
                if ((_DWORD)v194)
                {
                  for (jj = 0; jj != v194; ++jj)
                  {
                    result = sub_1DCC1EE14(*(float *)(v196 + 4 * jj));
                    *(_WORD *)(v192 + 2 * jj) = result;
                  }
                }
                v201 = v221;
                if (v257 > v270)
                {
                  do
                  {
                    result = sub_1DCC1EE14(*(float *)(v198 + 4 * v201));
                    *(_WORD *)(v192 + 2 * v201++) = result;
                  }
                  while (v199 != v201);
                }
              }
              v192 += v245;
              v196 += v197;
              v190 += v197;
              ++v189;
            }
            while (v189 != v269);
          }
        }
        else
        {
          result = sub_1DCC29778((uint64_t)sub_1DCC2A8C8, (_QWORD *)result, a2);
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1DCC280D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  float *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (float *)(*(_QWORD *)(a2 + 24) + 8);
    do
    {
      *(v6 - 2) = (float)(*(v7 - 2) * 511.0) << 22;
      if (v3 >= 2)
      {
        *(v6 - 1) |= ((float)(*(v7 - 1) * 511.0) & 0x3FF) << 12;
        if (v3 != 2)
        {
          *v6 |= 4 * ((float)(*v7 * 511.0) & 0x3FF);
          if (v3 >= 4)
            v6[1] |= v7[1] & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 = (float *)((char *)v7 + v5);
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC2818C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  _BYTE *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (_BYTE *)(*(_QWORD *)(a2 + 24) + 3);
    do
    {
      *(v6 - 2) = 2143289344 * (char)*(v7 - 3);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (2093056 * (char)*(v7 - 2)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (2044 * (char)*(v7 - 1)) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= *v7 & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 += v5;
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC28238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  _BYTE *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (_BYTE *)(*(_QWORD *)(a2 + 24) + 3);
    do
    {
      *(v6 - 2) = 2143289344 * *(v7 - 3);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (2093056 * *(v7 - 2)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (2044 * *(v7 - 1)) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= *v7 & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 += v5;
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC282E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  _WORD *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (_WORD *)(*(_QWORD *)(a2 + 24) + 4);
    do
    {
      *(v6 - 2) = 2143289344 * (unsigned __int16)*(v7 - 2);
      if (v3 >= 2)
      {
        *(v6 - 1) |= ((511 * *(v7 - 1)) & 0x3FF) << 12;
        if (v3 != 2)
        {
          *v6 |= (2044 * *v7) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= v7[1] & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 = (_WORD *)((char *)v7 + v5);
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC28394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = *(_QWORD *)(a2 + 24) + 8;
    do
    {
      *(v6 - 2) = 2143289344 * *(_DWORD *)(v7 - 8);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (2093056 * *(_DWORD *)(v7 - 4)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (2044 * *(_WORD *)v7) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= *(_DWORD *)(v7 + 4) & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 += v5;
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC28440(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  float *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (float *)(*(_QWORD *)(a2 + 24) + 8);
    do
    {
      *(v6 - 2) = (float)(*(v7 - 2) * 1023.0) << 22;
      if (v3 >= 2)
      {
        *(v6 - 1) |= ((float)(*(v7 - 1) * 1023.0) & 0x3FF) << 12;
        if (v3 != 2)
        {
          *v6 |= 4 * ((float)(*v7 * 1023.0) & 0x3FF);
          if (v3 >= 4)
            v6[1] |= (float)(v7[1] * 3.0) & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 = (float *)((char *)v7 + v5);
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC28504(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned __int8 *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (unsigned __int8 *)(*(_QWORD *)(a2 + 24) + 3);
    do
    {
      *(v6 - 2) = -4194304 * (char)*(v7 - 3);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (-4096 * (char)*(v7 - 2)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (-4 * (char)*(v7 - 1)) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= -*v7 & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 += v5;
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC285A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned __int8 *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (unsigned __int8 *)(*(_QWORD *)(a2 + 24) + 3);
    do
    {
      *(v6 - 2) = -4194304 * *(v7 - 3);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (-4096 * *(v7 - 2)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (-4 * *(v7 - 1)) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= -*v7 & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 += v5;
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC2864C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned __int16 *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (unsigned __int16 *)(*(_QWORD *)(a2 + 24) + 4);
    do
    {
      *(v6 - 2) = -4194304 * *(v7 - 2);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (-*(v7 - 1) & 0x3FF) << 12;
        if (v3 != 2)
        {
          *v6 |= (-4 * *v7) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= -v7[1] & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 = (unsigned __int16 *)((char *)v7 + v5);
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC286F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 40);
    v6 = (_DWORD *)(*(_QWORD *)a2 + 8);
    v7 = (_DWORD *)(*(_QWORD *)(a2 + 24) + 8);
    do
    {
      *(v6 - 2) = -4194304 * *(v7 - 2);
      if (v3 >= 2)
      {
        *(v6 - 1) |= (-4096 * *(v7 - 1)) & 0x3FF000;
        if (v3 != 2)
        {
          *v6 |= (-4 * *v7) & 0xFFC;
          if (v3 >= 4)
            v6[1] |= -v7[1] & 3;
        }
      }
      v6 = (_DWORD *)((char *)v6 + v4);
      v7 = (_DWORD *)((char *)v7 + v5);
      --v2;
    }
    while (v2);
  }
}

void sub_1DCC2879C(float (*a1)(float *, float), float **a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  unsigned int v25;
  unint64_t v26;
  float v27;
  float v28;

  if (a2[8])
  {
    v6 = 0;
    v7 = 0;
    v9 = a2[3];
    v8 = a2[4];
    v10 = *a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = ((_BYTE)v11 + v13 - v12);
    do
    {
      if (v7 >= (unint64_t)a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = a2[7][v20 / 4];
            v10[v20 / 4] = a1(&v27, a3);
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            *v17++ = a1(v18++, a3);
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = (_BYTE)v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = a2[7][v19];
            v10[v19++] = a1(&v28, a3);
          }
          while (v15 != v19);
        }
      }
      v10 = (float *)((char *)a2[2] + (_QWORD)v10);
      v21 = a2[5];
      v9 = (float *)((char *)v21 + (_QWORD)v9);
      v7 += (unint64_t)v21;
      ++v6;
    }
    while (v6 < (unint64_t)a2[8]);
  }
}

float sub_1DCC28918(float *a1, float a2)
{
  return *a1 * a2;
}

void sub_1DCC28924(float (*a1)(char *, float), float **a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  char v28;

  if (a2[8])
  {
    v6 = 0;
    v7 = 0;
    v9 = a2[3];
    v8 = a2[4];
    v10 = *a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = ((_BYTE)v11 + v13 - v12);
    do
    {
      if (v7 >= (unint64_t)a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)a2[7][v20 / 4];
            v10[v20 / 4] = a1(&v27, a3);
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            *v17++ = a1((char *)v18, a3);
            v18 = (float *)((char *)v18 + 1);
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = (_BYTE)v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)a2[7][v19];
            v10[v19++] = a1(&v28, a3);
          }
          while (v15 != v19);
        }
      }
      v10 = (float *)((char *)a2[2] + (_QWORD)v10);
      v21 = a2[5];
      v9 = (float *)((char *)v21 + (_QWORD)v9);
      v7 += (unint64_t)v21;
      ++v6;
    }
    while (v6 < (unint64_t)a2[8]);
  }
}

float sub_1DCC28AA8(char *a1, float a2)
{
  return (float)*a1 * a2;
}

float sub_1DCC28AB8(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (float)LODWORD(a3) * a2;
}

void sub_1DCC28AC8(float (*a1)(__int16 *, float), float **a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  unsigned int v25;
  unint64_t v26;
  __int16 v27;
  __int16 v28;

  if (a2[8])
  {
    v6 = 0;
    v7 = 0;
    v9 = a2[3];
    v8 = a2[4];
    v10 = *a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = ((_BYTE)v11 + v13 - v12);
    do
    {
      if (v7 >= (unint64_t)a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)a2[7][v20 / 4];
            v10[v20 / 4] = a1(&v27, a3);
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            *v17++ = a1((__int16 *)v18, a3);
            v18 = (float *)((char *)v18 + 2);
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = (_BYTE)v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)a2[7][v19];
            v10[v19++] = a1(&v28, a3);
          }
          while (v15 != v19);
        }
      }
      v10 = (float *)((char *)a2[2] + (_QWORD)v10);
      v21 = a2[5];
      v9 = (float *)((char *)v21 + (_QWORD)v9);
      v7 += (unint64_t)v21;
      ++v6;
    }
    while (v6 < (unint64_t)a2[8]);
  }
}

float sub_1DCC28C4C(__int16 *a1, float a2)
{
  return (float)*a1 * a2;
}

float sub_1DCC28C5C(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (float)LODWORD(a3) * a2;
}

void sub_1DCC28C6C(float (*a1)(int *, float), float **a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  uint64_t v19;
  unint64_t v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v6 = 0;
    v7 = 0;
    v9 = a2[3];
    v8 = a2[4];
    v10 = *a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = ((_BYTE)v11 + v13 - v12);
    do
    {
      if (v7 >= (unint64_t)a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)a2[7][v20 / 4];
            v10[v20 / 4] = a1(&v27, a3);
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            *v17++ = a1((int *)v18++, a3);
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = (_BYTE)v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)a2[7][v19];
            v10[v19++] = a1(&v28, a3);
          }
          while (v15 != v19);
        }
      }
      v10 = (float *)((char *)a2[2] + (_QWORD)v10);
      v21 = a2[5];
      v9 = (float *)((char *)v21 + (_QWORD)v9);
      v7 += (unint64_t)v21;
      ++v6;
    }
    while (v6 < (unint64_t)a2[8]);
  }
}

float sub_1DCC28DF0(int *a1, float a2)
{
  return (float)*a1 * a2;
}

void sub_1DCC28E00(float (*a1)(unsigned int *, float), float **a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  if (a2[8])
  {
    v6 = 0;
    v7 = 0;
    v9 = a2[3];
    v8 = a2[4];
    v10 = *a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v25 = a2[1];
    v26 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v23 = v13;
    v24 = v12;
    v14 = 4 * v11;
    v15 = ((_BYTE)v11 + v13 - v12);
    do
    {
      if (v7 >= (unint64_t)a2[6])
      {
        if ((_BYTE)v11)
        {
          v21 = 0;
          do
          {
            v28 = a2[7][v21 / 4];
            v10[v21 / 4] = a1(&v28, a3);
            v21 += 4;
          }
          while (v14 != v21);
        }
      }
      else
      {
        v27 = v6;
        v16 = v24;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v24)
        {
          do
          {
            v19 = *(_DWORD *)v18++;
            v30 = v19;
            *v17++ = a1((unsigned int *)&v30, a3);
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = (_BYTE)v25;
        v20 = v23;
        v6 = v27;
        if (v26 < v25)
        {
          do
          {
            v29 = a2[7][v20];
            v10[v20++] = a1(&v29, a3);
          }
          while (v15 != v20);
        }
      }
      v10 = (float *)((char *)a2[2] + (_QWORD)v10);
      v22 = a2[5];
      v9 = (float *)((char *)v22 + (_QWORD)v9);
      v7 += (unint64_t)v22;
      ++v6;
    }
    while (v6 < (unint64_t)a2[8]);
  }
}

uint64_t sub_1DCC28F88(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_BYTE *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = *(_DWORD *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = *(_DWORD *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 += a2[2];
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29100(float *a1, float a2)
{
  return (int)(float)(*a1 * a2);
}

uint64_t sub_1DCC29110(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(char *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  char v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(char *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (char *)a2[3];
    v8 = a2[4];
    v10 = (_BYTE *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 += a2[2];
      v21 = a2[5];
      v9 += v21;
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29290(char *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC292A4(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC292B8(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(__int16 *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int16 *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  __int16 v27;
  __int16 v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(__int16 *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (__int16 *)a2[3];
    v8 = a2[4];
    v10 = (_BYTE *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 += a2[2];
      v21 = a2[5];
      v9 = (__int16 *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29438(__int16 *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2944C(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC29460(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_BYTE *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 += a2[2];
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC295E0(int *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC295F4(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(unsigned int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  if (a2[8])
  {
    v5 = (uint64_t (*)(unsigned int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_BYTE *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v25 = a2[1];
    v26 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v23 = v14;
    v24 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v21 = 0;
          do
          {
            v28 = *(float *)(a2[7] + 4 * v21);
            result = v5(&v28, a3);
            v10[v21++] = result;
          }
          while (v12 != v21);
        }
      }
      else
      {
        v27 = v6;
        v16 = v24;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v24)
        {
          do
          {
            v19 = *v18++;
            v30 = v19;
            result = v5((unsigned int *)&v30, a3);
            *v17++ = result;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v25;
        v20 = v23;
        v6 = v27;
        if (v26 < v25)
        {
          do
          {
            v29 = *(float *)(a2[7] + 4 * v20);
            result = v5(&v29, a3);
            v10[v20++] = result;
          }
          while (v15 != v20);
        }
      }
      v10 += a2[2];
      v22 = a2[5];
      v9 = (int *)((char *)v9 + v22);
      v7 += v22;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29778(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _WORD *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_WORD *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = *(_DWORD *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = *(_DWORD *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_WORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC298F0(float *a1, float a2)
{
  return (int)(float)(*a1 * a2);
}

uint64_t sub_1DCC29900(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(char *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _WORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  char v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(char *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (char *)a2[3];
    v8 = a2[4];
    v10 = (_WORD *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_WORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 += v21;
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29A80(char *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC29A94(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC29AA8(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(__int16 *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int16 *v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _WORD *v17;
  __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  __int16 v27;
  __int16 v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(__int16 *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (__int16 *)a2[3];
    v8 = a2[4];
    v10 = (_WORD *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_WORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (__int16 *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29C28(__int16 *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC29C3C(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC29C50(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _WORD *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_WORD *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v22 = v14;
    v23 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + 4 * v20);
            result = v5(&v27, a3);
            v10[v20++] = result;
          }
          while (v12 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_WORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29DD0(int *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC29DE4(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(unsigned int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _WORD *v17;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  if (a2[8])
  {
    v5 = (uint64_t (*)(unsigned int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_WORD *)*a2;
    v11 = a2[1];
    v12 = v11;
    if (v8 >= v11)
      v13 = a2[1];
    else
      v13 = a2[4];
    v25 = a2[1];
    v26 = a2[4];
    if (v11 >= (unint64_t)v8)
      v14 = a2[4];
    else
      v14 = a2[1];
    v23 = v14;
    v24 = v13;
    v15 = (v11 + v14 - v13);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v21 = 0;
          do
          {
            v28 = *(float *)(a2[7] + 4 * v21);
            result = v5(&v28, a3);
            v10[v21++] = result;
          }
          while (v12 != v21);
        }
      }
      else
      {
        v27 = v6;
        v16 = v24;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v24)
        {
          do
          {
            v19 = *v18++;
            v30 = v19;
            result = v5((unsigned int *)&v30, a3);
            *v17++ = result;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v25;
        v20 = v23;
        v6 = v27;
        if (v26 < v25)
        {
          do
          {
            v29 = *(float *)(a2[7] + 4 * v20);
            result = v5(&v29, a3);
            v10[v20++] = result;
          }
          while (v15 != v20);
        }
      }
      v10 = (_WORD *)((char *)v10 + a2[2]);
      v22 = a2[5];
      v9 = (int *)((char *)v9 + v22);
      v7 += v22;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC29F68(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_DWORD *)*a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = (v11 + v13 - v12);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = *(_DWORD *)(a2[7] + v20);
            result = v5(&v27, a3);
            v10[v20 / 4] = result;
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = *(_DWORD *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_DWORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC2A0E4(float *a1, float a2)
{
  return (int)(float)(*a1 * a2);
}

uint64_t sub_1DCC2A0F4(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(char *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  char v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(char *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (char *)a2[3];
    v8 = a2[4];
    v10 = (_DWORD *)*a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = (v11 + v13 - v12);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + v20);
            result = v5(&v27, a3);
            v10[v20 / 4] = result;
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_DWORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 += v21;
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC2A278(char *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A28C(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A2A0(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(__int16 *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int16 *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  __int16 *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  __int16 v27;
  __int16 v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(__int16 *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (__int16 *)a2[3];
    v8 = a2[4];
    v10 = (_DWORD *)*a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = (v11 + v13 - v12);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + v20);
            result = v5(&v27, a3);
            v10[v20 / 4] = result;
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_DWORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (__int16 *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC2A424(__int16 *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A438(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A44C(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;

  if (a2[8])
  {
    v5 = (uint64_t (*)(int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_DWORD *)*a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v24 = a2[1];
    v25 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v22 = v13;
    v23 = v12;
    v14 = 4 * v11;
    v15 = (v11 + v13 - v12);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v20 = 0;
          do
          {
            v27 = (int)*(float *)(a2[7] + v20);
            result = v5(&v27, a3);
            v10[v20 / 4] = result;
            v20 += 4;
          }
          while (v14 != v20);
        }
      }
      else
      {
        v26 = v6;
        v16 = v23;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v23)
        {
          do
          {
            result = v5(v18, a3);
            *v17++ = result;
            ++v18;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v24;
        v19 = v22;
        v6 = v26;
        if (v25 < v24)
        {
          do
          {
            v28 = (int)*(float *)(a2[7] + 4 * v19);
            result = v5(&v28, a3);
            v10[v19++] = result;
          }
          while (v15 != v19);
        }
      }
      v10 = (_DWORD *)((char *)v10 + a2[2]);
      v21 = a2[5];
      v9 = (int *)((char *)v9 + v21);
      v7 += v21;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC2A5D0(int *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A5E4(uint64_t result, _QWORD *a2, float a3)
{
  uint64_t (*v5)(unsigned int *, float);
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _DWORD *v17;
  int *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  if (a2[8])
  {
    v5 = (uint64_t (*)(unsigned int *, float))result;
    v6 = 0;
    v7 = 0;
    v9 = (int *)a2[3];
    v8 = a2[4];
    v10 = (_DWORD *)*a2;
    v11 = a2[1];
    if (v8 >= v11)
      v12 = a2[1];
    else
      v12 = a2[4];
    v25 = a2[1];
    v26 = a2[4];
    if (v11 >= (unint64_t)v8)
      v13 = a2[4];
    else
      v13 = a2[1];
    v23 = v13;
    v24 = v12;
    v14 = 4 * v11;
    v15 = (v11 + v13 - v12);
    do
    {
      if (v7 >= a2[6])
      {
        if ((_BYTE)v11)
        {
          v21 = 0;
          do
          {
            v28 = *(float *)(a2[7] + v21);
            result = v5(&v28, a3);
            v10[v21 / 4] = result;
            v21 += 4;
          }
          while (v14 != v21);
        }
      }
      else
      {
        v27 = v6;
        v16 = v24;
        v17 = v10;
        v18 = v9;
        if ((_DWORD)v24)
        {
          do
          {
            v19 = *v18++;
            v30 = v19;
            result = v5((unsigned int *)&v30, a3);
            *v17++ = result;
            --v16;
          }
          while (v16);
        }
        LOBYTE(v11) = v25;
        v20 = v23;
        v6 = v27;
        if (v26 < v25)
        {
          do
          {
            v29 = *(float *)(a2[7] + 4 * v20);
            result = v5(&v29, a3);
            v10[v20++] = result;
          }
          while (v15 != v20);
        }
      }
      v10 = (_DWORD *)((char *)v10 + a2[2]);
      v22 = a2[5];
      v9 = (int *)((char *)v9 + v22);
      v7 += v22;
      ++v6;
    }
    while (v6 < a2[8]);
  }
  return result;
}

uint64_t sub_1DCC2A76C(float *a1, float a2)
{
  return (int)(float)(*a1 * a2);
}

uint64_t sub_1DCC2A77C(char *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A790(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A7A4(__int16 *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A7B8(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A7CC(int *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A7E0(float *a1, float a2)
{
  return (int)(float)(*a1 * a2);
}

uint64_t sub_1DCC2A7F0(char *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A804(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A818(__int16 *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A82C(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (int)(float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A840(int *a1, float a2)
{
  return (int)(float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A854(float *a1, float a2)
{
  return (float)(*a1 * a2);
}

uint64_t sub_1DCC2A864(char *a1, float a2)
{
  return (float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A878(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return (float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A88C(__int16 *a1, float a2)
{
  return (float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A8A0(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return (float)((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A8B4(int *a1, float a2)
{
  return (float)((float)*a1 * a2);
}

uint64_t sub_1DCC2A8C8(float *a1, float a2)
{
  return sub_1DCC1EE14(*a1 * a2);
}

uint64_t sub_1DCC2A8E4(char *a1, float a2)
{
  return sub_1DCC1EE14((float)*a1 * a2);
}

uint64_t sub_1DCC2A904(_BYTE *a1, float a2, float a3)
{
  LOBYTE(a3) = *a1;
  return sub_1DCC1EE14((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A924(__int16 *a1, float a2)
{
  return sub_1DCC1EE14((float)*a1 * a2);
}

uint64_t sub_1DCC2A944(_WORD *a1, float a2, float a3)
{
  LOWORD(a3) = *a1;
  return sub_1DCC1EE14((float)LODWORD(a3) * a2);
}

uint64_t sub_1DCC2A964(int *a1, float a2)
{
  return sub_1DCC1EE14((float)*a1 * a2);
}

void sub_1DCC2AD10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2ADA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2B1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

id sub_1DCC2B258(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  char *v7;
  std::string *p_str;
  std::string::size_type size;
  unsigned __int8 *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  unsigned __int8 *v14;
  int v15;
  std::string::size_type v16;
  std::string::size_type v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *i;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  std::string v62;
  std::string v63;
  std::string __str;
  char v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  memset(&__str, 0, sizeof(__str));
  v5 = objc_retainAutorelease(v3);
  v7 = (char *)objc_msgSend_cStringUsingEncoding_(v5, v6, 4);
  sub_1DCB0345C(&__str, v7);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_str = &__str;
  else
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  else
    size = __str.__r_.__value_.__l.__size_;
  v10 = (unsigned __int8 *)p_str + size;
  if (size)
  {
    v11 = p_str;
    v12 = (std::string *)((char *)p_str + size);
    do
    {
      v13 = v11;
      v14 = (unsigned __int8 *)v11;
      while (1)
      {
        v15 = *v14++;
        if (v15 == 46)
          break;
        v13 = (std::string *)v14;
        if (v14 == v10)
        {
          v13 = v12;
          goto LABEL_16;
        }
      }
      v11 = (std::string *)((char *)&v13->__r_.__value_.__l.__data_ + 1);
      v12 = v13;
    }
    while (v14 != v10);
  }
  else
  {
    v13 = p_str;
  }
LABEL_16:
  v16 = (char *)v13 - (char *)p_str;
  if (v13 == (std::string *)v10)
    v17 = -1;
  else
    v17 = v16;
  memset(&v63, 0, sizeof(v63));
  std::string::basic_string(&v63, &__str, v17 + 1, size, (std::allocator<char> *)&v62);
  std::string::basic_string(&v62, &__str, 0, v17, (std::allocator<char> *)&v65);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  __str = v62;
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v18, (uint64_t)&__str, 4);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v18, (uint64_t)v62.__r_.__value_.__l.__data_, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v19, (uint64_t)&v63, 4);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v19, (uint64_t)v63.__r_.__value_.__l.__data_, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_characterAtIndex_(v5, v22, 0) == 47)
  {
    v24 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("file://%@"), v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend_initWithString_(v24, v27, (uint64_t)v26);

    if (v28)
      goto LABEL_47;
    goto LABEL_35;
  }
  if (objc_msgSend_rangeOfString_(v5, v23, (uint64_t)CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = objc_alloc(MEMORY[0x1E0C99E98]);
    v31 = objc_msgSend_initWithString_(v32, v33, (uint64_t)v5);
LABEL_34:
    v28 = (void *)v31;
    if (v31)
      goto LABEL_47;
    goto LABEL_35;
  }
  if (v4)
  {
    objc_msgSend_URLForResource_withExtension_(v4, v29, (uint64_t)v20, v21);
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_35:
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v29, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v34, v35, (uint64_t)v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourcePath(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtPath_error_(v38, v45, (uint64_t)v44, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v47 = v46;
    v28 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v58, v66, 16);
    if (v28)
    {
      v57 = v38;
      v50 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend_hasPrefix_(v52, v49, (uint64_t)v5))
          {
            v38 = v57;
            objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v49, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_URLForResource_withExtension_(v54, v55, (uint64_t)v52, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_46;
          }
        }
        v28 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v49, (uint64_t)&v58, v66, 16);
        if (v28)
          continue;
        break;
      }
      v38 = v57;
    }
LABEL_46:

  }
LABEL_47:

  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v63.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

  return v28;
}

void sub_1DCC2B65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  if (a27 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);

  _Unwind_Resume(a1);
}

void sub_1DCC2B8B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2BAA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2BD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  if (a27 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1DCC2BF4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2C024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2C358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DCC2C42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1DCC2C550(void *a1, size_t a2, double a3)
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  char *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;

  v18 = HIDWORD(a3);
  v4 = a1;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v9 = (char *)objc_msgSend_bytes(v6, v7, v8);
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v10, v18 * a2);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend_mutableBytes(v11, v12, v13);
    v15 = v18;
    if (v18 >= 1)
    {
      v16 = v14;
      do
      {
        memcpy((void *)(v16 + (int)--v15 * a2), v9, a2);
        v9 += a2;
      }
      while (v15);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1DCC2C614(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2C7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC2C840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2C990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2CA74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1DCC2CA8C(float32x2_t *a1, float32x4_t a2)
{
  float32x4_t v2;
  float v4;
  uint64_t v5;
  double v6;
  unsigned int v7;
  float32x2_t v8;
  float v9;

  v2 = vabsq_f32(a2);
  if (v2.f32[0] < v2.f32[1] || v2.f32[0] < v2.f32[2])
  {
    v2.i32[0] = a2.i32[2];
    v4 = -a2.f32[0];
    if (a2.f32[2] > 0.0)
    {
      LODWORD(v5) = 5;
    }
    else
    {
      v4 = a2.f32[0];
      LODWORD(v5) = 4;
    }
    v6 = COERCE_DOUBLE(__PAIR64__(a2.u32[1], LODWORD(v4)));
    if (a2.f32[1] > 0.0)
    {
      v7 = 2;
    }
    else
    {
      v2.f32[0] = -a2.f32[2];
      v7 = 3;
    }
    a2.i32[1] = v2.i32[0];
    if (v2.f32[1] >= v2.f32[2])
      v5 = v7;
    else
      v5 = v5;
    if (v2.f32[1] >= v2.f32[2])
      v2.f32[0] = v2.f32[1];
    else
      v2.f32[0] = v2.f32[2];
    if (v2.f32[1] < v2.f32[2])
      *(double *)a2.i64 = v6;
    goto LABEL_26;
  }
  if (v2.f32[0] != 0.0)
  {
    v9 = a2.f32[2];
    v5 = a2.f32[0] <= 0.0;
    if (a2.f32[0] <= 0.0)
      v9 = -a2.f32[2];
    a2.f32[0] = v9;
LABEL_26:
    v8 = vadd_f32(vdiv_f32(vmul_f32(*(float32x2_t *)a2.f32, (float32x2_t)0x3F0000003F000000), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.f32, 0)), (float32x2_t)0x3F0000003F000000);
    goto LABEL_27;
  }
  v5 = 0;
  v8 = 0;
LABEL_27:
  *a1 = v8;
  return v5;
}

float64_t directionForPixel(int a1, float a2, double a3, float64x2_t a4)
{
  double v6;
  double v7;
  double v8;
  double v9;

  _Q0 = (float64x2_t)xmmword_1DCC583A0;
  if (SLODWORD(a2) >= 1)
  {
    v6 = *(float *)a4.f64;
    v7 = (double)SLODWORD(a3) + v6;
    v8 = 2.0 / (double)SLODWORD(a2);
    _Q0.f64[0] = v8 * v7 + -1.0;
    v9 = (double)SHIDWORD(a3) - v6;
    a4.f64[0] = v8 * v9 + -1.0;
    switch(a1)
    {
      case 0:
        __asm { FMOV            V1.2D, #1.0; jumptable 00000001DCC2CBB0 case 0 }
        goto LABEL_5;
      case 1:
        _Q0.f64[0] = -_Q0.f64[0];
        __asm { FMOV            V1.2D, #-1.0 }
LABEL_5:
        _Q1.f64[1] = a4.f64[0];
        goto LABEL_10;
      case 2:
        __asm { FMOV            V1.2D, #1.0; jumptable 00000001DCC2CBB0 case 2 }
        _Q1.f64[0] = v8 * v7 + -1.0;
        _Q0 = a4;
        goto LABEL_10;
      case 3:
        __asm { FMOV            V1.2D, #-1.0; jumptable 00000001DCC2CBB0 case 3 }
        _Q1.f64[0] = v8 * v7 + -1.0;
        _Q0.f64[0] = -a4.f64[0];
        goto LABEL_10;
      case 4:
        _Q1.f64[0] = -_Q0.f64[0];
        _Q1.f64[1] = a4.f64[0];
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_10;
      case 5:
        _Q0.f64[1] = v8 * v9 + -1.0;
        _Q1 = _Q0;
        __asm { FMOV            V0.2D, #-1.0 }
LABEL_10:
        *(float32x2_t *)&_Q0.f64[0] = vcvt_f32_f64(vmulq_n_f64(_Q1, 1.0 / sqrt(vaddvq_f64(vmulq_f64(_Q1, _Q1)) + vmulq_f64(_Q0, _Q0).f64[0])));
        break;
      default:
        return _Q0.f64[0];
    }
  }
  return _Q0.f64[0];
}

float32x2_t equirectangularCoordinateForDirection(__n128 a1)
{
  float v2;
  float v3;

  v2 = a1.n128_f32[1];
  v3 = atan2f(a1.n128_f32[2], a1.n128_f32[0]);
  return vmul_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v2)), LODWORD(v3)), (float32x2_t)0x3EA2F9833E22F983);
}

double sub_1DCC2CC88(double *a1, const char *a2, uint64_t a3, float32x4_t a4)
{
  uint64_t v6;
  double result;

  switch(objc_msgSend_channelCount(a1, a2, a3))
  {
    case 1:
      result = sub_1DCC2CD50(a1, a2, v6, a4);
      break;
    case 2:
      result = sub_1DCC2CE40(a1, a2, v6, a4);
      break;
    case 3:
      result = sub_1DCC2CF30(a1, a2, v6, a4);
      break;
    case 4:
      result = sub_1DCC2D020(a1, a2, v6, a4);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double sub_1DCC2CD50(_QWORD *a1, const char *a2, uint64_t a3, float32x4_t a4)
{
  float32x4_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8x8_t v9;
  int8x16_t v10;
  float32x4_t v11;
  uint8x8_t v12;
  uint8x8_t v13;
  float32x4_t v14;
  float v15;
  float32x4_t v16;
  float v18;
  float32x4_t v19;
  float32x2_t v21;

  if (!a2)
    return 0.0;
  if (objc_msgSend_isCube(a1, a2, a3))
  {
    v6.i64[0] = a1[35];
    v6.i32[1] /= 6;
    v19 = v6;
    v7 = a1[36] * v6.i32[1];
    v21 = 0;
    v8 = (uint64_t)&a2[v7 * sub_1DCC2CA8C(&v21, a4)];
    *(float32x2_t *)v14.f32 = v21;
    v15 = v21.f32[1];
    v16 = v19;
  }
  else
  {
    v18 = atan2f(a4.f32[2], a4.f32[0]);
    v16.f32[0] = acosf(a4.f32[1]);
    v14.f32[0] = v18 * 0.15915;
    v15 = v16.f32[0] * 0.31831;
    v16.i64[0] = a1[35];
    v8 = (uint64_t)a2;
  }
  return sub_1DCC30BBC(v8, v16, v14, v15, v9, v10, v11, v12, v13);
}

double sub_1DCC2CE40(double *a1, const char *a2, uint64_t a3, float32x4_t a4)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint8x8_t v9;
  double v10;
  double v11;
  uint8x8_t v12;
  uint8x8_t v13;
  float v14;
  float v15;
  double v16;
  float v18;
  float v19;
  double v20;
  float32x2_t v22;

  if (!a2)
    return 0.0;
  if (objc_msgSend_isCube(a1, a2, a3))
  {
    v6 = a1[35];
    SHIDWORD(v6) /= 6;
    v20 = v6;
    v7 = *((_QWORD *)a1 + 36) * SHIDWORD(v6);
    v22 = 0;
    v8 = (uint64_t)&a2[v7 * sub_1DCC2CA8C(&v22, a4)];
    v15 = v22.f32[1];
    v14 = v22.f32[0];
    v16 = v20;
  }
  else
  {
    v18 = atan2f(a4.f32[2], a4.f32[0]);
    v19 = acosf(a4.f32[1]);
    v14 = v18 * 0.15915;
    v15 = v19 * 0.31831;
    v16 = a1[35];
    v8 = (uint64_t)a2;
  }
  return sub_1DCC30D14(v8, v16, v14, v15, v9, v10, v11, v12, v13);
}

double sub_1DCC2CF30(double *a1, const char *a2, uint64_t a3, float32x4_t a4)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint8x8_t v9;
  double v10;
  double v11;
  uint8x8_t v12;
  uint8x8_t v13;
  float v14;
  float v15;
  double v16;
  float v18;
  float v19;
  double v20;
  float32x2_t v22;

  if (!a2)
    return 0.0;
  if (objc_msgSend_isCube(a1, a2, a3))
  {
    v6 = a1[35];
    SHIDWORD(v6) /= 6;
    v20 = v6;
    v7 = *((_QWORD *)a1 + 36) * SHIDWORD(v6);
    v22 = 0;
    v8 = (uint64_t)&a2[v7 * sub_1DCC2CA8C(&v22, a4)];
    v15 = v22.f32[1];
    v14 = v22.f32[0];
    v16 = v20;
  }
  else
  {
    v18 = atan2f(a4.f32[2], a4.f32[0]);
    v19 = acosf(a4.f32[1]);
    v14 = v18 * 0.15915;
    v15 = v19 * 0.31831;
    v16 = a1[35];
    v8 = (uint64_t)a2;
  }
  return sub_1DCC30E6C(v8, v16, v14, v15, v9, v10, v11, v12, v13);
}

double sub_1DCC2D020(double *a1, const char *a2, uint64_t a3, float32x4_t a4)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint8x8_t v9;
  double v10;
  double v11;
  uint8x8_t v12;
  uint8x8_t v13;
  float v14;
  float v15;
  double v16;
  float v18;
  float v19;
  double v20;
  float32x2_t v22;

  if (!a2)
    return 0.0;
  if (objc_msgSend_isCube(a1, a2, a3))
  {
    v6 = a1[35];
    SHIDWORD(v6) /= 6;
    v20 = v6;
    v7 = *((_QWORD *)a1 + 36) * SHIDWORD(v6);
    v22 = 0;
    v8 = (uint64_t)&a2[v7 * sub_1DCC2CA8C(&v22, a4)];
    v15 = v22.f32[1];
    v14 = v22.f32[0];
    v16 = v20;
  }
  else
  {
    v18 = atan2f(a4.f32[2], a4.f32[0]);
    v19 = acosf(a4.f32[1]);
    v14 = v18 * 0.15915;
    v15 = v19 * 0.31831;
    v16 = a1[35];
    v8 = (uint64_t)a2;
  }
  return sub_1DCC30FC0(v8, v16, v14, v15, v9, v10, v11, v12, v13);
}

double sub_1DCC2D110(int32x2_t *a1, float32x4_t a2)
{
  double result;

  switch(a1[32].i32[0])
  {
    case 1:
      result = sub_1DCC2D160(a1, 0, a2);
      break;
    case 2:
      result = sub_1DCC2D264(a1, 0, a2);
      break;
    case 3:
      result = sub_1DCC2D368(a1, 0, a2);
      break;
    case 4:
      result = sub_1DCC2D46C(a1, 0, a2);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double sub_1DCC2D160(int32x2_t *a1, signed int a2, float32x4_t a3)
{
  uint64_t v3;
  float32x4_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8x8_t v7;
  int8x16_t v8;
  float32x4_t v9;
  uint8x8_t v10;
  uint8x8_t v11;
  float32x4_t v12;
  float v13;
  float v15;
  float v16;
  float v17;
  float32x4_t v18;
  float32x2_t v19;

  v3 = (uint64_t)a1[a2];
  if (!v3)
    return 0.0;
  v4 = a3;
  *(int32x2_t *)a3.f32 = vshl_s32(a1[33], vneg_s32(vdup_n_s32(a2)));
  if (a1[35].i8[0])
  {
    a3.i32[1] /= 6;
    v18 = a3;
    v5 = (*(_QWORD *)&a1[34] >> a2) * a3.i32[1];
    v19 = 0;
    v6 = v3 + v5 * sub_1DCC2CA8C(&v19, v4);
    *(float32x2_t *)v12.f32 = v19;
    v13 = v19.f32[1];
  }
  else
  {
    v17 = v4.f32[1];
    v18 = a3;
    v15 = atan2f(v4.f32[2], v4.f32[0]);
    v16 = acosf(v17);
    v12.f32[0] = v15 * 0.15915;
    v13 = v16 * 0.31831;
    v6 = v3;
  }
  return sub_1DCC30BBC(v6, v18, v12, v13, v7, v8, v9, v10, v11);
}

double sub_1DCC2D264(int32x2_t *a1, signed int a2, float32x4_t a3)
{
  uint64_t v3;
  int32x2_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8x8_t v8;
  double v9;
  double v10;
  uint8x8_t v11;
  uint8x8_t v12;
  float v13;
  float v14;
  float v16;
  float v17;
  float v18;
  double v19;
  float32x2_t v20;

  v3 = (uint64_t)a1[a2];
  if (!v3)
    return 0.0;
  v5 = vshl_s32(a1[33], vneg_s32(vdup_n_s32(a2)));
  if (a1[35].i8[0])
  {
    v5.i32[1] /= 6;
    v19 = *(double *)&v5;
    v6 = (*(_QWORD *)&a1[34] >> a2) * v5.i32[1];
    v20 = 0;
    v7 = v3 + v6 * sub_1DCC2CA8C(&v20, a3);
    v14 = v20.f32[1];
    v13 = v20.f32[0];
  }
  else
  {
    v18 = a3.f32[1];
    v19 = *(double *)&v5;
    v16 = atan2f(a3.f32[2], a3.f32[0]);
    v17 = acosf(v18);
    v13 = v16 * 0.15915;
    v14 = v17 * 0.31831;
    v7 = v3;
  }
  return sub_1DCC30D14(v7, v19, v13, v14, v8, v9, v10, v11, v12);
}

double sub_1DCC2D368(int32x2_t *a1, signed int a2, float32x4_t a3)
{
  uint64_t v3;
  int32x2_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8x8_t v8;
  double v9;
  double v10;
  uint8x8_t v11;
  uint8x8_t v12;
  float v13;
  float v14;
  float v16;
  float v17;
  float v18;
  double v19;
  float32x2_t v20;

  v3 = (uint64_t)a1[a2];
  if (!v3)
    return 0.0;
  v5 = vshl_s32(a1[33], vneg_s32(vdup_n_s32(a2)));
  if (a1[35].i8[0])
  {
    v5.i32[1] /= 6;
    v19 = *(double *)&v5;
    v6 = (*(_QWORD *)&a1[34] >> a2) * v5.i32[1];
    v20 = 0;
    v7 = v3 + v6 * sub_1DCC2CA8C(&v20, a3);
    v14 = v20.f32[1];
    v13 = v20.f32[0];
  }
  else
  {
    v18 = a3.f32[1];
    v19 = *(double *)&v5;
    v16 = atan2f(a3.f32[2], a3.f32[0]);
    v17 = acosf(v18);
    v13 = v16 * 0.15915;
    v14 = v17 * 0.31831;
    v7 = v3;
  }
  return sub_1DCC30E6C(v7, v19, v13, v14, v8, v9, v10, v11, v12);
}

double sub_1DCC2D46C(int32x2_t *a1, signed int a2, float32x4_t a3)
{
  uint64_t v3;
  int32x2_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8x8_t v8;
  double v9;
  double v10;
  uint8x8_t v11;
  uint8x8_t v12;
  float v13;
  float v14;
  float v16;
  float v17;
  float v18;
  double v19;
  float32x2_t v20;

  v3 = (uint64_t)a1[a2];
  if (!v3)
    return 0.0;
  v5 = vshl_s32(a1[33], vneg_s32(vdup_n_s32(a2)));
  if (a1[35].i8[0])
  {
    v5.i32[1] /= 6;
    v19 = *(double *)&v5;
    v6 = (*(_QWORD *)&a1[34] >> a2) * v5.i32[1];
    v20 = 0;
    v7 = v3 + v6 * sub_1DCC2CA8C(&v20, a3);
    v14 = v20.f32[1];
    v13 = v20.f32[0];
  }
  else
  {
    v18 = a3.f32[1];
    v19 = *(double *)&v5;
    v16 = atan2f(a3.f32[2], a3.f32[0]);
    v17 = acosf(v18);
    v13 = v16 * 0.15915;
    v14 = v17 * 0.31831;
    v7 = v3;
  }
  return sub_1DCC30FC0(v7, v19, v13, v14, v8, v9, v10, v11, v12);
}

double sub_1DCC2D570(int32x2_t *a1, float32x4_t a2, float a3)
{
  int v4;
  float32x4_t v5;
  float32x4_t v6;
  double result;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v12;
  float v13;

  v4 = (int)a3;
  v13 = a3 - truncf(a3);
  switch(a1[32].i32[0])
  {
    case 1:
      *(double *)v5.i64 = sub_1DCC2D160(a1, (int)a3, a2);
      v12 = v5;
      *(double *)v6.i64 = sub_1DCC2D160(a1, v4 + 1, a2);
      goto LABEL_7;
    case 2:
      *(double *)v8.i64 = sub_1DCC2D264(a1, (int)a3, a2);
      v12 = v8;
      *(double *)v6.i64 = sub_1DCC2D264(a1, v4 + 1, a2);
      goto LABEL_7;
    case 3:
      *(double *)v9.i64 = sub_1DCC2D368(a1, (int)a3, a2);
      v12 = v9;
      *(double *)v6.i64 = sub_1DCC2D368(a1, v4 + 1, a2);
      goto LABEL_7;
    case 4:
      *(double *)v10.i64 = sub_1DCC2D46C(a1, (int)a3, a2);
      v12 = v10;
      *(double *)v6.i64 = sub_1DCC2D46C(a1, v4 + 1, a2);
LABEL_7:
      *(_QWORD *)&result = vmlaq_n_f32(v12, vsubq_f32(v6, v12), v13).u64[0];
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double sub_1DCC2D688(double a1, float a2, int32x4_t a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  __float2 v7;
  float64x2_t v8;
  float64x2_t v9;
  int32x4_t v10;
  float32x4_t v11;
  int32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x2_t v15;
  float32x2_t v16;
  int32x4_t v17;
  int32x4_t v18;
  double result;
  float v21;

  v3 = (float)(a2 * a2) * (float)(a2 * a2);
  v4 = *(float *)&a1 * 6.28318531;
  v5 = sqrt((float)(1.0 - *((float *)&a1 + 1)) / ((v3 + -1.0) * *((float *)&a1 + 1) + 1.0));
  v21 = v5;
  v6 = sqrtf(1.0 - (float)(v5 * v5));
  v7 = __sincosf_stret(v4);
  v8.f64[0] = fabsf(*(float *)&a3.i32[2]);
  v9.f64[0] = 0.999;
  v10 = (int32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v9, v8).i64[0], 0), (int8x16_t)xmmword_1DCC58380, (int8x16_t)xmmword_1DCC56FD0);
  v11 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a3, a3), (int8x16_t)a3, 0xCuLL);
  v12 = (int32x4_t)vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)v10, v11)), (float32x4_t)a3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v10, v10), (int8x16_t)v10, 0xCuLL));
  v13 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v12, v12), (int8x16_t)v12, 0xCuLL);
  v14 = (int32x4_t)vmulq_f32((float32x4_t)v12, (float32x4_t)v12);
  v14.i32[0] = vadd_f32(vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2), *(float32x2_t *)v14.i8), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.i8, 1)).u32[0];
  v15 = vrsqrte_f32((float32x2_t)v14.u32[0]);
  v16 = vmul_f32(vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v15, v15)), v15);
  v17 = (int32x4_t)vmulq_n_f32(v13, vmul_f32(v16, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v16, v16))).f32[0]);
  v18 = (int32x4_t)vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL), (float32x4_t)a3)), v11, (float32x4_t)v17);
  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)a3, v21), (float32x4_t)v17, v6 * v7.__cosval), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v18, v18), (int8x16_t)v18, 0xCuLL), v6 * v7.__sinval).u64[0];
  return result;
}

void sub_1DCC2D7D8(void *a1, const char *a2, int a3, float a4, double a5, uint64_t a6, int a7, uint64_t a8)
{
  float32x4_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v22;
  int32x4_t v23;
  signed int v24;
  double v25;
  uint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  int32x4_t v29;
  float32x4_t v30;
  int32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x4_t v35;
  double *v38;
  int32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int32x4_t v42;

  v38 = a1;
  if (a3 == 5)
    v13 = 4;
  else
    v13 = a3;
  if (a3 == 4)
    v14 = 5;
  else
    v14 = v13;
  if (SHIDWORD(a5) >= 1)
  {
    v15 = 0;
    if (4 * a7 <= 1)
      v16 = 1;
    else
      v16 = 4 * a7;
    __asm { FMOV            V0.4S, #1.0 }
    v35 = _Q0;
    do
    {
      v22 = 0;
      do
      {
        v12.i32[0] = 0.5;
        *(double *)v23.i64 = directionForPixel(v14, *(float *)&a5, COERCE_DOUBLE(__PAIR64__(v15, v22)), (float64x2_t)v12);
        v42 = v23;
        if (a7 < 1)
        {
          v23.i32[0] = 0;
          v39.i64[0] = v23.i64[0];
          v40 = 0u;
        }
        else
        {
          v24 = 0;
          v23.i32[0] = 0;
          v39 = v23;
          v40 = 0u;
          do
          {
            *(float *)&v25 = (float)v24 * (float)(1.0 / (float)(4 * a7));
            *((float *)&v25 + 1) = (float)__rbit32(v24) * 2.3283e-10;
            *(double *)v27.i64 = sub_1DCC2D688(v25, a4, v42);
            v28 = v27;
            v29 = (int32x4_t)vmulq_f32(v27, (float32x4_t)v42);
            *(float *)v29.i32 = vaddq_f32(vaddq_f32((float32x4_t)v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.i8, 1)), (float32x4_t)vdupq_laneq_s32(v29, 2)).f32[0];
            v30 = vmlaq_n_f32(vnegq_f32((float32x4_t)v42), v28, *(float *)v29.i32 + *(float *)v29.i32);
            v31 = (int32x4_t)vmulq_f32(v30, (float32x4_t)v42);
            v12 = vaddq_f32((float32x4_t)v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.i8, 1));
            v32 = vaddq_f32(v12, (float32x4_t)vdupq_laneq_s32(v31, 2));
            v32.f32[0] = fmaxf(fminf(v32.f32[0], 1.0), 0.0);
            v41 = v32;
            if (v32.f32[0] >= 0.00000011921)
            {
              *(double *)v33.i64 = sub_1DCC2CC88(v38, a2, v26, v30);
              v34 = v39;
              v12 = v41;
              *(float *)v34.i32 = v41.f32[0] + *(float *)v39.i32;
              v39 = v34;
              v40 = vmlaq_n_f32(v40, v33, v41.f32[0]);
            }
            ++v24;
          }
          while (v16 != v24);
        }
        *(float32x4_t *)(a8 + 16 * (v22 + (HIDWORD(a5) + ~(_DWORD)v15) * LODWORD(a5))) = vmulq_f32(v40, vdivq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.i8, 0)));
        ++v22;
      }
      while (v22 != HIDWORD(a5));
      ++v15;
    }
    while (v15 != HIDWORD(a5));
  }

}

void sub_1DCC2DA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{

  _Unwind_Resume(a1);
}

void sub_1DCC2DCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1DCC2DD54(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_1DCC30ABC((void **)a1, a2 - v2);
  }
}

void sub_1DCC2DFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  void *v18;
  void *v19;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1DCC2E328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2E8B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2EA28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2EB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2EC98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2ED58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DCC2EF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC2EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MDLCheckerboardTexture;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1DCC2F35C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2F4AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2F5B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2F6C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC2FA94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC2FDC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x1DF0D228C](v4, 0x10A0C401EE0EB22);

  _Unwind_Resume(a1);
}

void sub_1DCC2FE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MDLSkyCubeTexture;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1DCC302AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC3062C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC30664(int a1, int a2, unsigned int *a3, float a4, float a5)
{
  float *v10;
  int32x2_t v11;
  float v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  float *v17;
  unsigned int *v18;
  uint64_t v19;
  float *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  float v24;
  int v25;
  float v26;
  float32x2_t v27;
  float v28;
  float v29;
  int v30;
  float v31;
  float32x2_t v32;
  int v33;
  uint64_t v34;
  float v35;
  float *v36;
  float v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  float v44;
  float *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  float v53;
  float v54;
  float v55;
  float v56;
  unsigned int v57;
  float32x2_t v58;
  uint32x2_t v59;

  v10 = (float *)malloc_type_malloc(4 * a2 * a1, 0x100004052888210uLL);
  if (v10)
  {
    v12 = 5.0;
    if (a4 <= 1.0)
      v12 = a4 * 5.0;
    if (a4 < 0.0)
      v12 = 0.0;
    v13 = (unint64_t)v12;
    if ((unint64_t)v12 >= 4)
      v13 = 4;
    v14 = a2 - 1;
    if (a2 >= 1)
    {
      v15 = 0;
      v16 = dword_1DCC5B0B8[325 * v13];
      v17 = v10;
      v18 = a3;
      do
      {
        v19 = a1;
        v20 = v17;
        v21 = a1 - 1;
        if (a1 >= 1)
        {
          do
          {
            v23 = *v18++;
            v22 = v23;
            v24 = 0.0;
            v25 = HIBYTE(v23);
            if (HIBYTE(v23))
            {
              v26 = 255.0 / (double)v25;
              v27 = vmul_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v22), (uint32x2_t)0xFFFFFFF0FFFFFFF8), (int8x8_t)0xFF000000FFLL)), (float32x2_t)0x3DE147AE3F170A3DLL);
              v28 = v26
                  * (float)(0.0039216
                          * (float)((float)(v27.f32[0] + (float)((float)v22 * 0.3)) + v27.f32[1]));
              if (v28 <= 1.0)
                v29 = v28;
              else
                v29 = 1.0;
              if (v28 >= 0.0)
                v24 = v29;
              else
                v24 = 0.0;
            }
            *v20++ = v24;
            --v19;
          }
          while (v19);
        }
        ++v15;
        v17 += a1;
      }
      while (v15 != a2);
      v30 = 0;
      v31 = -a5;
      v32 = (float32x2_t)vdup_n_s32(0x42FF0000u);
      do
      {
        if (a1 >= 1)
        {
          v33 = 0;
          do
          {
            if ((_DWORD)v16)
            {
              v34 = 0;
              v35 = 0.0;
              v36 = (float *)&dword_1DCC5B0B8[325 * v13 + 1];
              v37 = 0.0;
              do
              {
                v38 = v33 + *(char *)v36;
                v39 = v30 + *((char *)v36 + 1);
                if (v21 >= v38)
                  v40 = v33 + *(char *)v36;
                else
                  v40 = a1 - 1;
                if (v38 >= 0)
                  v41 = v40;
                else
                  v41 = 0;
                if (v14 >= v39)
                  v42 = v30 + *((char *)v36 + 1);
                else
                  v42 = a2 - 1;
                if (v39 >= 0)
                  v43 = v42;
                else
                  v43 = 0;
                v44 = v10[v41 + v43 * a1];
                v45 = (float *)&dword_1DCC5B0B8[325 * v13 + 2 * (v16 + v34)];
                v46 = v33 + *((char *)v45 + 4);
                v47 = v30 + *((char *)v45 + 5);
                if (v21 >= v46)
                  v48 = v33 + *((char *)v45 + 4);
                else
                  v48 = a1 - 1;
                if (v46 >= 0)
                  v49 = v48;
                else
                  v49 = 0;
                if (v14 >= v47)
                  v50 = v30 + *((char *)v45 + 5);
                else
                  v50 = a2 - 1;
                if (v47 >= 0)
                  v51 = v50;
                else
                  v51 = 0;
                v37 = v37 + (float)(v36[1] * v44);
                v35 = v35 + (float)(v45[2] * v10[v49 + v51 * a1]);
                ++v34;
                v36 += 2;
              }
              while (v16 != v34);
            }
            else
            {
              v37 = 0.0;
              v35 = 0.0;
            }
            v52 = *a3 & 0xFF000000;
            v53 = v37 * v31;
            v54 = v35 * v31;
            v55 = sqrtf((float)((float)(v53 * v53) + 1.0) + (float)(v54 * v54));
            if (v55 > 0.0001)
            {
              v56 = (float)((float)HIBYTE(*a3) * 0.0039216) / v55;
              v11.i32[0] = 1124007936;
              v57 = (float)((float)((float)(v53 * 127.5) * v56) + 127.5);
              v58 = (float32x2_t)vdup_lane_s32(v11, 0);
              v58.f32[0] = v54 * 127.5;
              v59 = vshl_u32(vcvt_u32_f32(vmla_n_f32(v32, v58, v56)), (uint32x2_t)0x1000000008);
              v52 |= v59.i32[0] | v57 | v59.i32[1];
            }
            *a3++ = v52;
            ++v33;
          }
          while (v33 != a1);
        }
        ++v30;
      }
      while (v30 != a2);
    }
    free(v10);
  }
}

void sub_1DCC30A90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DCC30ABC(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_1DCAE4C44();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_1DCAFBD5C(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_OWORD *)v17 - 1);
        v17 -= 16;
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

double sub_1DCC30BBC(uint64_t a1, float32x4_t a2, float32x4_t a3, float a4, uint8x8_t a5, int8x16_t a6, float32x4_t a7, uint8x8_t a8, uint8x8_t a9)
{
  uint8x8_t v9;
  float v10;
  float v11;
  int v12;
  int v13;
  float v14;
  int v15;
  signed __int32 v16;
  uint64_t v17;
  signed __int32 v18;
  int v19;
  signed __int32 v20;
  signed __int32 v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;

  v10 = (float)((float)a2.i32[0] * a3.f32[0]) + 0.5;
  v11 = (float)((float)(1.0 - a4) * (float)a2.i32[1]) + -0.5;
  v12 = (int)v10;
  v13 = (int)v11;
  a3.f32[0] = vabds_f32(v10, truncf(v10));
  v14 = vabds_f32(v11, truncf(v11));
  v15 = v12 & ~(v12 >> 31);
  if (a2.i32[0] - 1 < v15)
    v15 = a2.i32[0] - 1;
  if (v12 < 0)
    v12 = -1;
  if (a2.i32[0] - 1 >= v12 + 1)
    v16 = v12 + 1;
  else
    v16 = a2.i32[0] - 1;
  v17 = 4 * v16;
  v18 = a2.i32[1] - 1;
  v19 = v13 & ~(v13 >> 31);
  if (a2.i32[1] - 1 < v19)
    v19 = a2.i32[1] - 1;
  v20 = 4 * a2.i32[0] * v19;
  if (v13 < 0)
    v13 = -1;
  if (v18 >= v13 + 1)
    v18 = v13 + 1;
  v21 = 4 * a2.i32[0] * v18;
  a5.i32[0] = *(_DWORD *)(a1 + v20 + 4 * v15);
  a6.i32[0] = 1262485504;
  a7.i32[0] = -884998144;
  a8.i32[0] = *(_DWORD *)(a1 + v17 + v20);
  v22 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a5)), a6), a7);
  a9.i32[0] = *(_DWORD *)(a1 + v21 + (uint64_t)(4 * v15));
  v23 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a8)), a6), a7);
  v9.i32[0] = *(_DWORD *)(a1 + v21 + (uint64_t)(int)v17);
  v24 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a9)), a6), a7);
  v25 = (float32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v9));
  v26 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)v25, a6), a7);
  v25.f32[0] = (float)(1.0 - v14) * (float)(1.0 - a3.f32[0]);
  a7.f32[0] = (float)(1.0 - v14) * a3.f32[0];
  a2.f32[0] = v14 * (float)(1.0 - a3.f32[0]);
  a3.f32[0] = v14 * a3.f32[0];
  a2.i64[0] = vmulq_f32((float32x4_t)vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(v22, v25), a7, v23), a2, v24), a3, v26).u32[0], (float32x4_t)vdupq_n_s32(0x3B808081u)).u64[0];
  return *(double *)a2.i64;
}

double sub_1DCC30D14(uint64_t a1, double a2, float a3, float a4, uint8x8_t a5, double a6, double a7, uint8x8_t a8, uint8x8_t a9)
{
  uint8x8_t v9;
  float v10;
  float v11;
  int v12;
  int v13;
  float v14;
  float v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int8x16_t v23;
  float32x4_t v24;
  double result;

  v10 = (float)((float)SLODWORD(a2) * a3) + 0.5;
  v11 = (float)((float)(1.0 - a4) * (float)SHIDWORD(a2)) + -0.5;
  v12 = (int)v10;
  v13 = (int)v11;
  v14 = vabds_f32(v10, truncf(v10));
  v15 = vabds_f32(v11, truncf(v11));
  v16 = v12 & ~(v12 >> 31);
  if (LODWORD(a2) - 1 < v16)
    v16 = LODWORD(a2) - 1;
  if (v12 < 0)
    v12 = -1;
  if (LODWORD(a2) - 1 >= v12 + 1)
    v17 = v12 + 1;
  else
    v17 = LODWORD(a2) - 1;
  v18 = 4 * v17;
  v19 = HIDWORD(a2) - 1;
  v20 = v13 & ~(v13 >> 31);
  if (HIDWORD(a2) - 1 < v20)
    v20 = HIDWORD(a2) - 1;
  v21 = 4 * LODWORD(a2) * v20;
  if (v13 < 0)
    v13 = -1;
  if (v19 >= v13 + 1)
    v19 = v13 + 1;
  v22 = 4 * LODWORD(a2) * v19;
  a5.i32[0] = *(_DWORD *)(a1 + v21 + 4 * v16);
  v23 = (int8x16_t)vdupq_n_s32(0x4B400000u);
  v24 = (float32x4_t)vdupq_n_s32(0xCB400000);
  a8.i32[0] = *(_DWORD *)(a1 + v18 + v21);
  a9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(4 * v16));
  v9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(int)v18);
  *(_QWORD *)&result = vmulq_f32((float32x4_t)vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a5)), v23), v24), (float)(1.0 - v15) * (float)(1.0 - v14)), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a8)), v23), v24), (float)(1.0 - v15) * v14), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a9)),
                                                           v23),
                                            v24),
                                          v15 * (float)(1.0 - v14)),
                                        vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v9)), v23), v24), v15 * v14).u64[0], (float32x4_t)vdupq_n_s32(0x3B808081u)).u64[0];
  return result;
}

double sub_1DCC30E6C(uint64_t a1, double a2, float a3, float a4, uint8x8_t a5, double a6, double a7, uint8x8_t a8, uint8x8_t a9)
{
  uint8x8_t v9;
  float v10;
  int v11;
  float v12;
  int v13;
  float v14;
  float v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int8x16_t v23;
  float32x4_t v24;
  float32x4_t v25;
  double result;

  v10 = (float)((float)SLODWORD(a2) * a3) + 0.5;
  v11 = (int)v10;
  v12 = (float)((float)(1.0 - a4) * (float)SHIDWORD(a2)) + -0.5;
  v13 = (int)v12;
  v14 = vabds_f32(v10, truncf(v10));
  v15 = vabds_f32(v12, truncf(v12));
  v16 = v11 & ~(v11 >> 31);
  if (LODWORD(a2) - 1 < v16)
    v16 = LODWORD(a2) - 1;
  if (v11 < 0)
    v11 = -1;
  if (LODWORD(a2) - 1 >= v11 + 1)
    v17 = v11 + 1;
  else
    v17 = LODWORD(a2) - 1;
  v18 = 4 * v17;
  v19 = HIDWORD(a2) - 1;
  v20 = v13 & ~(v13 >> 31);
  if (HIDWORD(a2) - 1 < v20)
    v20 = HIDWORD(a2) - 1;
  v21 = 4 * LODWORD(a2) * v20;
  if (v13 < 0)
    v13 = -1;
  if (v19 >= v13 + 1)
    v19 = v13 + 1;
  v22 = 4 * LODWORD(a2) * v19;
  a5.i32[0] = *(_DWORD *)(a1 + v21 + 4 * v16);
  v23 = (int8x16_t)vdupq_n_s32(0x4B400000u);
  v24 = (float32x4_t)vdupq_n_s32(0xCB400000);
  a8.i32[0] = *(_DWORD *)(a1 + v18 + v21);
  a9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(4 * v16));
  v9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(int)v18);
  v25 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a5)), v23), v24), (float)(1.0 - v15) * (float)(1.0 - v14)), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a8)), v23), v24), (float)(1.0 - v15) * v14), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a9)), v23), v24), v15 * (float)(1.0 - v14)), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v9)), v23), v24), v15 * v14);
  v25.i32[3] = 0;
  *(_QWORD *)&result = vmulq_f32(v25, (float32x4_t)vdupq_n_s32(0x3B808081u)).u64[0];
  return result;
}

double sub_1DCC30FC0(uint64_t a1, double a2, float a3, float a4, uint8x8_t a5, double a6, double a7, uint8x8_t a8, uint8x8_t a9)
{
  uint8x8_t v9;
  float v10;
  float v11;
  int v12;
  int v13;
  float v14;
  float v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int8x16_t v23;
  float32x4_t v24;
  double result;

  v10 = (float)((float)SLODWORD(a2) * a3) + 0.5;
  v11 = (float)((float)(1.0 - a4) * (float)SHIDWORD(a2)) + -0.5;
  v12 = (int)v10;
  v13 = (int)v11;
  v14 = vabds_f32(v10, truncf(v10));
  v15 = vabds_f32(v11, truncf(v11));
  v16 = v12 & ~(v12 >> 31);
  if (LODWORD(a2) - 1 < v16)
    v16 = LODWORD(a2) - 1;
  if (v12 < 0)
    v12 = -1;
  if (LODWORD(a2) - 1 >= v12 + 1)
    v17 = v12 + 1;
  else
    v17 = LODWORD(a2) - 1;
  v18 = 4 * v17;
  v19 = HIDWORD(a2) - 1;
  v20 = v13 & ~(v13 >> 31);
  if (HIDWORD(a2) - 1 < v20)
    v20 = HIDWORD(a2) - 1;
  v21 = 4 * LODWORD(a2) * v20;
  if (v13 < 0)
    v13 = -1;
  if (v19 >= v13 + 1)
    v19 = v13 + 1;
  v22 = 4 * LODWORD(a2) * v19;
  a5.i32[0] = *(_DWORD *)(a1 + v21 + 4 * v16);
  v23 = (int8x16_t)vdupq_n_s32(0x4B400000u);
  v24 = (float32x4_t)vdupq_n_s32(0xCB400000);
  a8.i32[0] = *(_DWORD *)(a1 + v18 + v21);
  a9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(4 * v16));
  v9.i32[0] = *(_DWORD *)(a1 + v22 + (uint64_t)(int)v18);
  *(_QWORD *)&result = vmulq_f32(vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a5)), v23), v24), (float)(1.0 - v15) * (float)(1.0 - v14)), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a8)), v23), v24), (float)(1.0 - v15) * v14), vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a9)), v23), v24), v15 * (float)(1.0 - v14)), vaddq_f32(
                             (float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v9)), v23),
                             v24),
                           v15 * v14),
                         (float32x4_t)vdupq_n_s32(0x3B808081u)).u64[0];
  return result;
}

MDLCamera *sub_1DCC31110(_DWORD *a1)
{
  MDLCamera *v2;
  void *v3;
  const char *v4;
  unint64_t v5;
  uint64_t *v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera *v12;
  int v13;
  unsigned int *v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  float v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  int v33;
  unsigned int *v34;
  unsigned int v35;
  const char *v36;
  uint64_t v37;
  double v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  __int128 v44;
  unsigned int *v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  int v49;
  unsigned int *v50;
  unsigned int v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  MDLCamera *v58;
  unsigned int *v59;
  unsigned int v60;
  unsigned int *v61;
  unsigned int v62;
  unsigned int *v63;
  unsigned int v64;
  unsigned int *v65;
  unsigned int v66;
  unsigned int *v67;
  unsigned int v68;
  __int128 v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  float v76;
  int v77;
  float v78;
  int v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _QWORD v89[3];

  v2 = objc_alloc_init(MDLCamera);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)sub_1DCAEEC08(a1) & 0xFFFFFFFFFFFFFFF8;
  if (v5)
  {
    v6 = (uint64_t *)(v5 + 16);
    if (*(char *)(v5 + 39) < 0)
    {
      objc_msgSend_stringWithCString_encoding_(v3, v4, *v6, 4);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = (uint64_t *)"";
  }
  objc_msgSend_stringWithCString_encoding_(v3, v4, (uint64_t)v6, 4);
LABEL_6:
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v2, v8, (uint64_t)v7);

  LODWORD(v9) = 1008981770;
  objc_msgSend_setWorldToMetersConversionScale_(v2, v10, v11, v9);
  v89[1] = 0;
  v89[2] = 0;
  v12 = (pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase();
  v88 = 0;
  v89[0] = MEMORY[0x1E0DF30B8] + 16;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetProjectionAttr(v12);
  v13 = pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>();
  if ((BYTE8(v87) & 7) != 0)
  {
    v14 = (unsigned int *)(*((_QWORD *)&v87 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v15 = __ldxr(v14);
    while (__stlxr(v15 - 2, v14));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v87);
  if (*((_QWORD *)&v86 + 1))
    sub_1DCAEED94(*((uint64_t *)&v86 + 1));
  if (v13)
  {
    v17 = atomic_load(MEMORY[0x1E0DF24F8]);
    if (!v17)
      v17 = sub_1DCAEF3C0(MEMORY[0x1E0DF24F8]);
    if ((v88 & 0xFFFFFFFFFFFFFFF8) == (*(_QWORD *)(v17 + 760) & 0xFFFFFFFFFFFFFFF8))
      objc_msgSend_setProjection_(v2, v16, 1);
  }
  v86 = 0u;
  v87 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetHorizontalApertureAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v84 = 0u;
  v85 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetVerticalApertureAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v82 = 0u;
  v83 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFocalLengthAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v80 = 0u;
  v81 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFocusDistanceAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v79 = 0;
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>())
  {
    LODWORD(v20) = v79;
    objc_msgSend_setSensorVerticalAperture_(v2, v18, v19, v20);
  }
  v78 = 0.0;
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>())
  {
    objc_msgSend_sensorVerticalAperture(v2, v21, v22);
    *(float *)&v24 = v78 / v23;
    objc_msgSend_setSensorAspect_(v2, v25, v26, v24);
  }
  v77 = 0;
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>())
  {
    LODWORD(v29) = v77;
    objc_msgSend_setFocalLength_(v2, v27, v28, v29);
  }
  v76 = 0.0;
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>())
  {
    *(float *)&v32 = v76 * 0.01;
    objc_msgSend_setFocusDistance_(v2, v30, v31, v32);
  }
  v75 = 0;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFStopAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v33 = pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>();
  if ((v74 & 7) != 0)
  {
    v34 = (unsigned int *)(v74 & 0xFFFFFFFFFFFFFFF8);
    do
      v35 = __ldxr(v34);
    while (__stlxr(v35 - 2, v34));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v73);
  if (v72)
    sub_1DCAEED94(v72);
  if (v33)
  {
    LODWORD(v38) = v75;
    objc_msgSend_setFStop_(v2, v36, v37, v38);
  }
  objc_msgSend_sensorShift(v2, v36, v37);
  v71 = v39;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetHorizontalApertureOffsetAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>();
  if ((v74 & 7) != 0)
  {
    v40 = (unsigned int *)(v74 & 0xFFFFFFFFFFFFFFF8);
    do
      v41 = __ldxr(v40);
    while (__stlxr(v41 - 2, v40));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v73);
  if (v72)
    sub_1DCAEED94(v72);
  objc_msgSend_sensorShift(v2, v42, v43);
  v70 = v44;
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetVerticalApertureOffsetAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>();
  if ((v74 & 7) != 0)
  {
    v45 = (unsigned int *)(v74 & 0xFFFFFFFFFFFFFFF8);
    do
      v46 = __ldxr(v45);
    while (__stlxr(v46 - 2, v45));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v73);
  if (v72)
    sub_1DCAEED94(v72);
  objc_msgSend_setSensorShift_(v2, v47, v48, COERCE_DOUBLE(__PAIR64__(DWORD1(v70), v71)), v70);
  pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetClippingRangeAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v89);
  v49 = pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::GfVec2f>();
  if ((v74 & 7) != 0)
  {
    v50 = (unsigned int *)(v74 & 0xFFFFFFFFFFFFFFF8);
    do
      v51 = __ldxr(v50);
    while (__stlxr(v51 - 2, v50));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v73);
  if (v72)
    sub_1DCAEED94(v72);
  if (v49)
  {
    LODWORD(v54) = 0;
    objc_msgSend_setNearVisibilityDistance_(v2, v52, v53, v54);
    LODWORD(v55) = 0;
    objc_msgSend_setFarVisibilityDistance_(v2, v56, v57, v55);
  }
  v58 = v2;
  if ((BYTE8(v81) & 7) != 0)
  {
    v59 = (unsigned int *)(*((_QWORD *)&v81 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v60 = __ldxr(v59);
    while (__stlxr(v60 - 2, v59));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v81);
  if (*((_QWORD *)&v80 + 1))
    sub_1DCAEED94(*((uint64_t *)&v80 + 1));
  if ((BYTE8(v83) & 7) != 0)
  {
    v61 = (unsigned int *)(*((_QWORD *)&v83 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v62 = __ldxr(v61);
    while (__stlxr(v62 - 2, v61));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v83);
  if (*((_QWORD *)&v82 + 1))
    sub_1DCAEED94(*((uint64_t *)&v82 + 1));
  if ((BYTE8(v85) & 7) != 0)
  {
    v63 = (unsigned int *)(*((_QWORD *)&v85 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v64 = __ldxr(v63);
    while (__stlxr(v64 - 2, v63));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v85);
  if (*((_QWORD *)&v84 + 1))
    sub_1DCAEED94(*((uint64_t *)&v84 + 1));
  if ((BYTE8(v87) & 7) != 0)
  {
    v65 = (unsigned int *)(*((_QWORD *)&v87 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v66 = __ldxr(v65);
    while (__stlxr(v66 - 2, v65));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_1DCAEEC34((uint64_t)&v87);
  if (*((_QWORD *)&v86 + 1))
    sub_1DCAEED94(*((uint64_t *)&v86 + 1));
  if ((v88 & 7) != 0)
  {
    v67 = (unsigned int *)(v88 & 0xFFFFFFFFFFFFFFF8);
    do
      v68 = __ldxr(v67);
    while (__stlxr(v68 - 2, v67));
  }
  MEMORY[0x1DF0D0D68](v89);

  return v58;
}

void sub_1DCC316A0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;

  v4 = *(_QWORD *)(v2 - 96);
  if ((v4 & 7) != 0)
  {
    v5 = (unsigned int *)(v4 & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  MEMORY[0x1DF0D0D68](v2 - 88);

  _Unwind_Resume(a1);
}

void sub_1DCC317A8(void *a1, pxrInternal__aapl__pxrReserved__::UsdObject *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  float v14;
  float v15;
  unsigned int *v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  float v20;
  unsigned int *v21;
  unsigned int v22;
  const char *v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  const char *v31;
  uint64_t v32;
  int v33;
  unsigned int *v34;
  unsigned int v35;
  const char *v36;
  uint64_t v37;
  int v38;
  unsigned int *v39;
  unsigned int v40;
  const char *v41;
  uint64_t v42;
  float v43;
  float v44;
  const char *v45;
  uint64_t v46;
  float v47;
  float v48;
  unsigned int *v49;
  unsigned int v50;
  const char *v51;
  uint64_t v52;
  float v53;
  float v54;
  const char *v55;
  uint64_t v56;
  float v57;
  unsigned int *v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[3];
  uint64_t v89;
  char *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if ((sub_1DCB4F88C(a2) & 1) != 0)
  {
    v88[1] = 0;
    v88[2] = 0;
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase();
    v88[0] = MEMORY[0x1E0DF30B8] + 16;
    if (objc_msgSend_projection(v3, v4, v5) == 1)
    {
      v8 = atomic_load(MEMORY[0x1E0DF24F8]);
      if (!v8)
        v8 = sub_1DCAEF3C0(MEMORY[0x1E0DF24F8]);
      v9 = *(_QWORD *)(v8 + 760);
      v89 = v9;
      v90 = (char *)&off_1EA5753D8 + 1;
      if ((v9 & 7) != 0)
      {
        v10 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 2, v10));
        if ((v11 & 1) == 0)
          v89 &= 0xFFFFFFFFFFFFFFF8;
      }
      pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateProjectionAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
      if ((v87 & 7) != 0)
      {
        v12 = (unsigned int *)(v87 & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_1DCAEEC34((uint64_t)&v86);
      if (v85)
        sub_1DCAEED94(v85);
      sub_1DCAEEE2C((uint64_t)&v89);
    }
    objc_msgSend_sensorVerticalAperture(v3, v6, v7);
    v15 = v14;
    v90 = (char *)&unk_1EA5762F3;
    *(float *)&v89 = v14;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateVerticalApertureAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v84 & 7) != 0)
    {
      v16 = (unsigned int *)(v84 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v83);
    if (v82)
      sub_1DCAEED94(v82);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_sensorAspect(v3, v18, v19);
    v90 = (char *)&unk_1EA5762F3;
    *(float *)&v89 = v20 * v15;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateHorizontalApertureAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v81 & 7) != 0)
    {
      v21 = (unsigned int *)(v81 & 0xFFFFFFFFFFFFFFF8);
      do
        v22 = __ldxr(v21);
      while (__stlxr(v22 - 2, v21));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v80);
    if (v79)
      sub_1DCAEED94(v79);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_sensorShift(v3, v23, v24);
    v90 = (char *)&unk_1EA5762F3;
    v60 = v25;
    LODWORD(v89) = v26;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateHorizontalApertureOffsetAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v78 & 7) != 0)
    {
      v27 = (unsigned int *)(v78 & 0xFFFFFFFFFFFFFFF8);
      do
        v28 = __ldxr(v27);
      while (__stlxr(v28 - 2, v27));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v77);
    if (v76)
      sub_1DCAEED94(v76);
    sub_1DCAEEE2C((uint64_t)&v89);
    v90 = (char *)&unk_1EA5762F3;
    LODWORD(v89) = v60;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateVerticalApertureOffsetAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v75 & 7) != 0)
    {
      v29 = (unsigned int *)(v75 & 0xFFFFFFFFFFFFFFF8);
      do
        v30 = __ldxr(v29);
      while (__stlxr(v30 - 2, v29));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v74);
    if (v73)
      sub_1DCAEED94(v73);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_focalLength(v3, v31, v32);
    v90 = (char *)&unk_1EA5762F3;
    LODWORD(v89) = v33;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFocalLengthAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v72 & 7) != 0)
    {
      v34 = (unsigned int *)(v72 & 0xFFFFFFFFFFFFFFF8);
      do
        v35 = __ldxr(v34);
      while (__stlxr(v35 - 2, v34));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v71);
    if (v70)
      sub_1DCAEED94(v70);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_fStop(v3, v36, v37);
    v90 = (char *)&unk_1EA5762F3;
    LODWORD(v89) = v38;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFStopAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v69 & 7) != 0)
    {
      v39 = (unsigned int *)(v69 & 0xFFFFFFFFFFFFFFF8);
      do
        v40 = __ldxr(v39);
      while (__stlxr(v40 - 2, v39));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v68);
    if (v67)
      sub_1DCAEED94(v67);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_worldToMetersConversionScale(v3, v41, v42);
    v44 = v43;
    objc_msgSend_focusDistance(v3, v45, v46);
    v47 = v44 * 100.0;
    v90 = (char *)&unk_1EA5762F3;
    *(float *)&v89 = v48 * (float)(v44 * 100.0);
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFocusDistanceAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v66 & 7) != 0)
    {
      v49 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
      do
        v50 = __ldxr(v49);
      while (__stlxr(v50 - 2, v49));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v65);
    if (v64)
      sub_1DCAEED94(v64);
    sub_1DCAEEE2C((uint64_t)&v89);
    objc_msgSend_nearVisibilityDistance(v3, v51, v52);
    v54 = v53;
    objc_msgSend_farVisibilityDistance(v3, v55, v56);
    v90 = (char *)&off_1EA574E18 + 3;
    *(float *)&v89 = v54 * v47;
    *((float *)&v89 + 1) = v57 * v47;
    pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateClippingRangeAttr((pxrInternal__aapl__pxrReserved__::UsdGeomCamera *)v88, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v89);
    if ((v63 & 7) != 0)
    {
      v58 = (unsigned int *)(v63 & 0xFFFFFFFFFFFFFFF8);
      do
        v59 = __ldxr(v58);
      while (__stlxr(v59 - 2, v58));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_1DCAEEC34((uint64_t)&v62);
    if (v61)
      sub_1DCAEED94(v61);
    sub_1DCAEEE2C((uint64_t)&v89);
    MEMORY[0x1DF0D0D68](v88);
  }

}

void sub_1DCC31CE4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x1DF0D0D68](v2 - 96);

  _Unwind_Resume(a1);
}

void sub_1DCC31D94(void **a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *a1;
  if (v3)
  {
    *(_QWORD *)(a2 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

_QWORD *sub_1DCC31DD8(_QWORD *result)
{
  unsigned int *v1;
  unsigned int v2;

  if ((*result & 7) != 0)
  {
    v1 = (unsigned int *)(*result & 0xFFFFFFFFFFFFFFF8);
    do
      v2 = __ldxr(v1);
    while (__stlxr(v2 - 2, v1));
  }
  return result;
}

void sub_1DCC31DFC(uint64_t a1, uint64_t a2, void **a3)
{
  void *v4;

  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v4;
    operator delete(v4);
  }
  if (*a3)
    operator delete(*a3);
}

void sub_1DCC31E34(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  v5 = *a1;
  if (v5)
  {
    *(_QWORD *)(a3 + 56) = v5;
    operator delete(v5);
  }
  v6 = *a2;
  if (*a2)
  {
    *(_QWORD *)(a3 + 32) = v6;
    operator delete(v6);
  }
  v7 = *(void **)a3;
  if (*(_QWORD *)a3)
  {
    *(_QWORD *)(a3 + 8) = v7;
    operator delete(v7);
  }
}

uint64_t sub_1DCC31E8C(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_1DCC31EC0(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return sub_1DCC0B0DC(result);
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

void CFBundleGetPackageInfo(CFBundleRef bundle, UInt32 *packageType, UInt32 *packageCreator)
{
  MEMORY[0x1E0C98158](bundle, packageType, packageCreator);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
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

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1E0CB2960]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefiner::RefineUniform()
{
  return MEMORY[0x1E0DF2310]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefiner::TopologyRefiner()
{
  return MEMORY[0x1E0DF2318]();
}

void OpenSubdiv::__aapl__::Far::TopologyRefiner::~TopologyRefiner(OpenSubdiv::__aapl__::Far::TopologyRefiner *this)
{
  MEMORY[0x1E0DF2320](this);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyDescriptor::TopologyDescriptor(OpenSubdiv::__aapl__::Far::TopologyDescriptor *this)
{
  return MEMORY[0x1E0DF2328](this);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactory<OpenSubdiv::__aapl__::Far::TopologyDescriptor>::assignComponentTags()
{
  return MEMORY[0x1E0DF2330]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactory<OpenSubdiv::__aapl__::Far::TopologyDescriptor>::reportInvalidTopology()
{
  return MEMORY[0x1E0DF2338]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactory<OpenSubdiv::__aapl__::Far::TopologyDescriptor>::assignComponentTopology()
{
  return MEMORY[0x1E0DF2340]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactory<OpenSubdiv::__aapl__::Far::TopologyDescriptor>::resizeComponentTopology()
{
  return MEMORY[0x1E0DF2348]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactory<OpenSubdiv::__aapl__::Far::TopologyDescriptor>::assignFaceVaryingTopology()
{
  return MEMORY[0x1E0DF2350]();
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase::prepareFaceVaryingChannels(OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase *this, OpenSubdiv::__aapl__::Far::TopologyRefiner *a2)
{
  return MEMORY[0x1E0DF2358](this, a2);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase::prepareComponentTopologySizing(OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase *this, OpenSubdiv::__aapl__::Far::TopologyRefiner *a2)
{
  return MEMORY[0x1E0DF2360](this, a2);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase::prepareComponentTagsAndSharpness(OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase *this, OpenSubdiv::__aapl__::Far::TopologyRefiner *a2)
{
  return MEMORY[0x1E0DF2368](this, a2);
}

uint64_t OpenSubdiv::__aapl__::Far::TopologyRefinerFactoryBase::prepareComponentTopologyAssignment()
{
  return MEMORY[0x1E0DF2370]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4f::SetTranslate()
{
  return MEMORY[0x1E0DF2380]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4f::SetScale()
{
  return MEMORY[0x1E0DF2388]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4f::SetRotate()
{
  return MEMORY[0x1E0DF2390]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4f::operator*=()
{
  return MEMORY[0x1E0DF2398]();
}

uint64_t pxrInternal__aapl__pxrReserved__::TfMallocTag::_End()
{
  return MEMORY[0x1E0DF23B0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::TfMallocTag::_Begin()
{
  return MEMORY[0x1E0DF23B8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDescribe()
{
  return MEMORY[0x1E0DF23C0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCone::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCone *this)
{
  return MEMORY[0x1E0DF23C8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCone::~UsdGeomCone(pxrInternal__aapl__pxrReserved__::UsdGeomCone *this)
{
  MEMORY[0x1E0DF23D0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCube::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCube *this)
{
  return MEMORY[0x1E0DF23D8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCube::~UsdGeomCube(pxrInternal__aapl__pxrReserved__::UsdGeomCube *this)
{
  MEMORY[0x1E0DF23E0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF23E8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::Define()
{
  return MEMORY[0x1E0DF23F0]();
}

void pxrInternal__aapl__pxrReserved__::UsdGeomMesh::~UsdGeomMesh(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  MEMORY[0x1E0DF23F8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdModelAPI::~UsdModelAPI(pxrInternal__aapl__pxrReserved__::UsdModelAPI *this)
{
  MEMORY[0x1E0DF2400](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelRoot::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdSkelRoot *this)
{
  return MEMORY[0x1E0DF2408](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtStreamOut()
{
  return MEMORY[0x1E0DF2410]();
}

{
  return MEMORY[0x1E0DF2418]();
}

{
  return MEMORY[0x1E0DF2420]();
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath()
{
  return MEMORY[0x1E0DF2428]();
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath(pxrInternal__aapl__pxrReserved__::SdfAssetPath *this)
{
  return MEMORY[0x1E0DF2430](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_HashState::_AppendBytes(pxrInternal__aapl__pxrReserved__::Tf_HashState *this, const char *a2)
{
  return MEMORY[0x1E0DF2440](this, a2);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomGprim::~UsdGeomGprim(pxrInternal__aapl__pxrReserved__::UsdGeomGprim *this)
{
  MEMORY[0x1E0DF2448](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomScope::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomScope *this)
{
  return MEMORY[0x1E0DF2450](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomScope::Define()
{
  return MEMORY[0x1E0DF2458]();
}

void pxrInternal__aapl__pxrReserved__::UsdGeomScope::~UsdGeomScope(pxrInternal__aapl__pxrReserved__::UsdGeomScope *this)
{
  MEMORY[0x1E0DF2460](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXform::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomXform *this)
{
  return MEMORY[0x1E0DF2468](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXform::Define()
{
  return MEMORY[0x1E0DF2470]();
}

void pxrInternal__aapl__pxrReserved__::UsdGeomXform::~UsdGeomXform(pxrInternal__aapl__pxrReserved__::UsdGeomXform *this)
{
  MEMORY[0x1E0DF2478](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator::increment(pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator *this)
{
  return MEMORY[0x1E0DF2480](this);
}

void pxrInternal__aapl__pxrReserved__::Usd_PrimData::~Usd_PrimData(pxrInternal__aapl__pxrReserved__::Usd_PrimData *this)
{
  MEMORY[0x1E0DF2488](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::ArGetResolver(pxrInternal__aapl__pxrReserved__ *this)
{
  return MEMORY[0x1E0DF2490](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2498](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCamera::~UsdGeomCamera(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  MEMORY[0x1E0DF24A0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCurves::ComputeExtent()
{
  return MEMORY[0x1E0DF24A8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCurves::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCurves *this)
{
  return MEMORY[0x1E0DF24B0](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCurves::~UsdGeomCurves(pxrInternal__aapl__pxrReserved__::UsdGeomCurves *this)
{
  MEMORY[0x1E0DF24B8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPoints::ComputeExtent()
{
  return MEMORY[0x1E0DF24C0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPoints::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomPoints *this)
{
  return MEMORY[0x1E0DF24C8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomPoints::~UsdGeomPoints(pxrInternal__aapl__pxrReserved__::UsdGeomPoints *this)
{
  MEMORY[0x1E0DF24D0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSphere::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomSphere *this)
{
  return MEMORY[0x1E0DF24D8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomSphere::~UsdGeomSphere(pxrInternal__aapl__pxrReserved__::UsdGeomSphere *this)
{
  MEMORY[0x1E0DF24E0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSubset::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomSubset *this)
{
  return MEMORY[0x1E0DF24E8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetUnassignedIndices()
{
  return MEMORY[0x1E0DF24F0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdReferences::AddInternalReference()
{
  return MEMORY[0x1E0DF2500]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase()
{
  return MEMORY[0x1E0DF2508]();
}

{
  return MEMORY[0x1E0DF2510]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeInput::IsInput()
{
  return MEMORY[0x1E0DF2518]();
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset(pxrInternal__aapl__pxrReserved__::SdfLayerOffset *this, double a2, double a3)
{
  return MEMORY[0x1E0DF2520](this, a2, a3);
}

uint64_t pxrInternal__aapl__pxrReserved__::TfStringPrintf(pxrInternal__aapl__pxrReserved__ *this, const char *a2, ...)
{
  return MEMORY[0x1E0DF2528](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCapsule::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCapsule *this)
{
  return MEMORY[0x1E0DF2530](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCapsule::~UsdGeomCapsule(pxrInternal__aapl__pxrReserved__::UsdGeomCapsule *this)
{
  MEMORY[0x1E0DF2538](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::UsdGeomPrimvar()
{
  return MEMORY[0x1E0DF2540]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeOutput::IsOutput()
{
  return MEMORY[0x1E0DF2548]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::CreateInput()
{
  return MEMORY[0x1E0DF2550]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::CreateOutput()
{
  return MEMORY[0x1E0DF2558]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this)
{
  return MEMORY[0x1E0DF2560](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::Define()
{
  return MEMORY[0x1E0DF2568]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::UsdShadeShader()
{
  return MEMORY[0x1E0DF2570]();
}

void pxrInternal__aapl__pxrReserved__::UsdShadeShader::~UsdShadeShader(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this)
{
  MEMORY[0x1E0DF2578](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::usd_initialize()
{
  return MEMORY[0x1E0DF2588]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCylinder::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomCylinder *this)
{
  return MEMORY[0x1E0DF2590](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomCylinder::~UsdGeomCylinder(pxrInternal__aapl__pxrReserved__::UsdGeomCylinder *this)
{
  MEMORY[0x1E0DF2598](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton *this)
{
  return MEMORY[0x1E0DF25A0](this);
}

void pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton::~UsdSkelSkeleton(pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton *this)
{
  MEMORY[0x1E0DF25A8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfValueTypeName::SdfValueTypeName(pxrInternal__aapl__pxrReserved__::SdfValueTypeName *this)
{
  return MEMORY[0x1E0DF25B0](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_PrimPathNode::~Sdf_PrimPathNode(pxrInternal__aapl__pxrReserved__::Sdf_PrimPathNode *this)
{
  MEMORY[0x1E0DF25B8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomBBoxCache::ComputeWorldBound()
{
  return MEMORY[0x1E0DF25C0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomBBoxCache::UsdGeomBBoxCache()
{
  return MEMORY[0x1E0DF25C8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomBoundable::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomBoundable *this)
{
  return MEMORY[0x1E0DF25D0](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomBoundable::~UsdGeomBoundable(pxrInternal__aapl__pxrReserved__::UsdGeomBoundable *this)
{
  MEMORY[0x1E0DF25D8](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomXformable::~UsdGeomXformable(pxrInternal__aapl__pxrReserved__::UsdGeomXformable *this)
{
  MEMORY[0x1E0DF25E0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterial::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdShadeMaterial *this)
{
  return MEMORY[0x1E0DF25E8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterial::Define()
{
  return MEMORY[0x1E0DF25F0]();
}

void pxrInternal__aapl__pxrReserved__::UsdShadeMaterial::~UsdShadeMaterial(pxrInternal__aapl__pxrReserved__::UsdShadeMaterial *this)
{
  MEMORY[0x1E0DF25F8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2600](this);
}

void pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::~UsdSkelAnimation(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  MEMORY[0x1E0DF2608](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtStreamOutArray()
{
  return MEMORY[0x1E0DF2610]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttributeQuery::UsdAttributeQuery()
{
  return MEMORY[0x1E0DF2620]();
}

{
  return MEMORY[0x1E0DF2628]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2630](this);
}

void pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::~UsdGeomNurbsPatch(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  MEMORY[0x1E0DF2638](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::ComputeExtent()
{
  return MEMORY[0x1E0DF2640]();
}

void pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::~UsdGeomPointBased(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this)
{
  MEMORY[0x1E0DF2648](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomTokensType::UsdGeomTokensType(pxrInternal__aapl__pxrReserved__::UsdGeomTokensType *this)
{
  return MEMORY[0x1E0DF2650](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::FindSchemaInfo()
{
  return MEMORY[0x1E0DF2658]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2660](this);
}

void pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::~UsdSkelBindingAPI(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  MEMORY[0x1E0DF2668](this);
}

void pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape::~UsdSkelBlendShape(pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape *this)
{
  MEMORY[0x1E0DF2670](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_MapperPathNode::~Sdf_MapperPathNode(pxrInternal__aapl__pxrReserved__::Sdf_MapperPathNode *this)
{
  MEMORY[0x1E0DF2678](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_TargetPathNode::~Sdf_TargetPathNode(pxrInternal__aapl__pxrReserved__::Sdf_TargetPathNode *this)
{
  MEMORY[0x1E0DF2680](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_PostErrorHelper()
{
  return MEMORY[0x1E0DF2688]();
}

void pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI::~UsdGeomPrimvarsAPI(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI *this)
{
  MEMORY[0x1E0DF2690](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeTokensType::UsdShadeTokensType(pxrInternal__aapl__pxrReserved__::UsdShadeTokensType *this)
{
  return MEMORY[0x1E0DF2698](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_PrimPartPathNode::operator delete(void *a1)
{
  MEMORY[0x1E0DF26A0](a1);
}

void pxrInternal__aapl__pxrReserved__::Sdf_PropPartPathNode::operator delete(void *a1)
{
  MEMORY[0x1E0DF26A8](a1);
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_PostWarningHelper()
{
  return MEMORY[0x1E0DF26B0]();
}

void pxrInternal__aapl__pxrReserved__::Sdf_MapperArgPathNode::~Sdf_MapperArgPathNode(pxrInternal__aapl__pxrReserved__::Sdf_MapperArgPathNode *this)
{
  MEMORY[0x1E0DF26B8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_FailedVerifyHelper()
{
  return MEMORY[0x1E0DF26C0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_VerifyStringFormat(pxrInternal__aapl__pxrReserved__ *this, const char *a2, ...)
{
  return MEMORY[0x1E0DF26C8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGetStageUpAxis()
{
  return MEMORY[0x1E0DF26D0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSetStageUpAxis()
{
  return MEMORY[0x1E0DF26D8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::ArSetPreferredResolver()
{
  return MEMORY[0x1E0DF26E0]();
}

void pxrInternal__aapl__pxrReserved__::Sdf_ExpressionPathNode::~Sdf_ExpressionPathNode(pxrInternal__aapl__pxrReserved__::Sdf_ExpressionPathNode *this)
{
  MEMORY[0x1E0DF26E8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType::_Init::New(pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType::_Init *this)
{
  return MEMORY[0x1E0DF26F0](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType::~Sdf_ValueTypeNamesType(pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *this)
{
  MEMORY[0x1E0DF26F8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape::_GetStaticTfType(pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape *this)
{
  return MEMORY[0x1E0DF2700](this);
}

void pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape::~UsdDeformersBlendShape(pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape *this)
{
  MEMORY[0x1E0DF2708](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI::GetConnectedSource()
{
  return MEMORY[0x1E0DF2710]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI::HasConnectedSource()
{
  return MEMORY[0x1E0DF2718]();
}

void pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI::~UsdShadeConnectableAPI(pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI *this)
{
  MEMORY[0x1E0DF2720](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_PrimPropertyPathNode::~Sdf_PrimPropertyPathNode(pxrInternal__aapl__pxrReserved__::Sdf_PrimPropertyPathNode *this)
{
  MEMORY[0x1E0DF2778](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate(pxrInternal__aapl__pxrReserved__ *this)
{
  return MEMORY[0x1E0DF2780](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::KindTokens_StaticTokenType::KindTokens_StaticTokenType(pxrInternal__aapl__pxrReserved__::KindTokens_StaticTokenType *this)
{
  return MEMORY[0x1E0DF2788](this);
}

void pxrInternal__aapl__pxrReserved__::KindTokens_StaticTokenType::~KindTokens_StaticTokenType(pxrInternal__aapl__pxrReserved__::KindTokens_StaticTokenType *this)
{
  MEMORY[0x1E0DF2790](this);
}

void pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::~UsdDeformersDeformableMesh(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  MEMORY[0x1E0DF2798](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::GetMaterialBindSubsets(pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *this)
{
  return MEMORY[0x1E0DF27A0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::Apply()
{
  return MEMORY[0x1E0DF27A8]();
}

void pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::~UsdShadeMaterialBindingAPI(pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *this)
{
  MEMORY[0x1E0DF27B0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfGetValueTypeNameForValue(pxrInternal__aapl__pxrReserved__ *this, const VtValue *a2)
{
  return MEMORY[0x1E0DF27B8](this, a2);
}

void pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::~UsdDeformersSkinDeformerAPI(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  MEMORY[0x1E0DF27C0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfFieldKeys_StaticTokenType::SdfFieldKeys_StaticTokenType(pxrInternal__aapl__pxrReserved__::SdfFieldKeys_StaticTokenType *this)
{
  return MEMORY[0x1E0DF27C8](this);
}

void pxrInternal__aapl__pxrReserved__::SdfFieldKeys_StaticTokenType::~SdfFieldKeys_StaticTokenType(pxrInternal__aapl__pxrReserved__::SdfFieldKeys_StaticTokenType *this)
{
  MEMORY[0x1E0DF27D0](this);
}

void pxrInternal__aapl__pxrReserved__::Sdf_PrimVariantSelectionNode::~Sdf_PrimVariantSelectionNode(pxrInternal__aapl__pxrReserved__::Sdf_PrimVariantSelectionNode *this)
{
  MEMORY[0x1E0DF27D8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGetStageMetersPerUnit()
{
  return MEMORY[0x1E0DF27E0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter::_AddRefMaybeLocked()
{
  return MEMORY[0x1E0DF27E8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter::_RemoveRefMaybeLocked()
{
  return MEMORY[0x1E0DF27F0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathInner()
{
  return MEMORY[0x1E0DF27F8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathOuter()
{
  return MEMORY[0x1E0DF2800]();
}

void pxrInternal__aapl__pxrReserved__::Sdf_RelationalAttributePathNode::~Sdf_RelationalAttributePathNode(pxrInternal__aapl__pxrReserved__::Sdf_RelationalAttributePathNode *this)
{
  MEMORY[0x1E0DF2808](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Usd_ThrowExpiredPrimAccessError(pxrInternal__aapl__pxrReserved__ *this, const pxrInternal__aapl__pxrReserved__::Usd_PrimData *a2)
{
  return MEMORY[0x1E0DF2810](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewARKitUsdzPackage()
{
  return MEMORY[0x1E0DF2818]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Tf_PostNullSmartPtrDereferenceFatalError()
{
  return MEMORY[0x1E0DF2820]();
}

uint64_t pxrInternal__aapl__pxrReserved__::TfEnum::GetName()
{
  return MEMORY[0x1E0DF2828]();
}

uint64_t pxrInternal__aapl__pxrReserved__::TfType::_FindByTypeid(pxrInternal__aapl__pxrReserved__::TfType *this, const std::type_info *a2)
{
  return MEMORY[0x1E0DF2830](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::EmptyPath(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2838](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::SdfPath()
{
  return MEMORY[0x1E0DF2840]();
}

uint64_t pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(pxrInternal__aapl__pxrReserved__::TfToken *this)
{
  return MEMORY[0x1E0DF2848](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::TfToken::TfToken(pxrInternal__aapl__pxrReserved__::TfToken *this, const char *a2)
{
  return MEMORY[0x1E0DF2850](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::TfToken::TfToken()
{
  return MEMORY[0x1E0DF2858]();
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::_PerformCast(pxrInternal__aapl__pxrReserved__::VtValue *this, const std::type_info *a2, const VtValue *a3)
{
  return MEMORY[0x1E0DF2860](this, a2, a3);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfLayer::CreateAnonymous()
{
  return MEMORY[0x1E0DF2868]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::swap()
{
  return MEMORY[0x1E0DF2870]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle()
{
  return MEMORY[0x1E0DF2878]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator=()
{
  return MEMORY[0x1E0DF2880]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::swap()
{
  return MEMORY[0x1E0DF2888]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle()
{
  return MEMORY[0x1E0DF2890]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator=()
{
  return MEMORY[0x1E0DF2898]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::DefinePrim(pxrInternal__aapl__pxrReserved__::UsdStage *this, const pxrInternal__aapl__pxrReserved__::SdfPath *a2, const pxrInternal__aapl__pxrReserved__::TfToken *a3)
{
  return MEMORY[0x1E0DF28A0](this, a2, a3);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::OverridePrim(pxrInternal__aapl__pxrReserved__::UsdStage *this, const pxrInternal__aapl__pxrReserved__::SdfPath *a2)
{
  return MEMORY[0x1E0DF28A8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::SetDefaultPrim()
{
  return MEMORY[0x1E0DF28B0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::SetEndTimeCode(pxrInternal__aapl__pxrReserved__::UsdStage *this, double a2)
{
  return MEMORY[0x1E0DF28B8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::IsSupportedFile()
{
  return MEMORY[0x1E0DF28C0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::SetStartTimeCode(pxrInternal__aapl__pxrReserved__::UsdStage *this, double a2)
{
  return MEMORY[0x1E0DF28C8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::_SetMetadataImpl<pxrInternal__aapl__pxrReserved__::SdfAbstractDataConstValue>()
{
  return off_1EA572630();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::Open()
{
  return MEMORY[0x1E0DF28D0]();
}

{
  return MEMORY[0x1E0DF28D8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::pxr_half::operator<<()
{
  return MEMORY[0x1E0DF28E8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::operator<<()
{
  return MEMORY[0x1E0DF28F0]();
}

{
  return MEMORY[0x1E0DF28F8]();
}

{
  return MEMORY[0x1E0DF2900]();
}

{
  return MEMORY[0x1E0DF2908]();
}

{
  return MEMORY[0x1E0DF2910]();
}

{
  return MEMORY[0x1E0DF2918]();
}

{
  return MEMORY[0x1E0DF2920]();
}

{
  return MEMORY[0x1E0DF2928]();
}

{
  return MEMORY[0x1E0DF2930]();
}

{
  return MEMORY[0x1E0DF2938]();
}

{
  return MEMORY[0x1E0DF2940]();
}

{
  return MEMORY[0x1E0DF2948]();
}

{
  return MEMORY[0x1E0DF2950]();
}

{
  return MEMORY[0x1E0DF2958]();
}

{
  return MEMORY[0x1E0DF2960]();
}

uint64_t Alembic::AbcCoreOgawa::v12::WriteArchive::WriteArchive(Alembic::AbcCoreOgawa::v12::WriteArchive *this)
{
  return MEMORY[0x1E0DF2968](this);
}

uint64_t Alembic::Abc::v12::ErrorHandler::operator()()
{
  return MEMORY[0x1E0DF2970]();
}

{
  return MEMORY[0x1E0DF2978]();
}

uint64_t Alembic::Abc::v12::OArrayProperty::setFromPrevious(Alembic::Abc::v12::OArrayProperty *this)
{
  return MEMORY[0x1E0DF2980](this);
}

uint64_t Alembic::Abc::v12::OArrayProperty::set()
{
  return MEMORY[0x1E0DF2988]();
}

void Alembic::Abc::v12::OArrayProperty::~OArrayProperty(Alembic::Abc::v12::OArrayProperty *this)
{
  MEMORY[0x1E0DF2990](this);
}

void Alembic::Abc::v12::OScalarProperty::~OScalarProperty(Alembic::Abc::v12::OScalarProperty *this)
{
  MEMORY[0x1E0DF2998](this);
}

uint64_t Alembic::Abc::v12::OCompoundProperty::OCompoundProperty()
{
  return MEMORY[0x1E0DF29A0]();
}

void Alembic::Abc::v12::OCompoundProperty::~OCompoundProperty(Alembic::Abc::v12::OCompoundProperty *this)
{
  MEMORY[0x1E0DF29A8](this);
}

{
  MEMORY[0x1E0DF29B0](this);
}

uint64_t Alembic::Abc::v12::OObject::getChildHeader()
{
  return MEMORY[0x1E0DF29B8]();
}

uint64_t Alembic::Abc::v12::OObject::OObject()
{
  return MEMORY[0x1E0DF29C0]();
}

void Alembic::Abc::v12::OObject::~OObject(Alembic::Abc::v12::OObject *this)
{
  MEMORY[0x1E0DF29C8](this);
}

{
  MEMORY[0x1E0DF29D0](this);
}

uint64_t Alembic::Abc::v12::OArchive::getTop(Alembic::Abc::v12::OArchive *this)
{
  return MEMORY[0x1E0DF29D8](this);
}

void Alembic::Abc::v12::OArchive::~OArchive(Alembic::Abc::v12::OArchive *this)
{
  MEMORY[0x1E0DF29E0](this);
}

uint64_t Alembic::AbcGeom::v12::OSubDSchema::set()
{
  return MEMORY[0x1E0DF29E8]();
}

uint64_t Alembic::AbcGeom::v12::OSubDSchema::OSubDSchema()
{
  return MEMORY[0x1E0DF29F0]();
}

uint64_t Alembic::AbcGeom::v12::XformSample::reset(Alembic::AbcGeom::v12::XformSample *this)
{
  return MEMORY[0x1E0DF29F8](this);
}

uint64_t Alembic::AbcGeom::v12::XformSample::setMatrix()
{
  return MEMORY[0x1E0DF2A00]();
}

uint64_t Alembic::AbcGeom::v12::XformSample::XformSample(Alembic::AbcGeom::v12::XformSample *this)
{
  return MEMORY[0x1E0DF2A08](this);
}

uint64_t Alembic::AbcGeom::v12::OXformSchema::set(Alembic::AbcGeom::v12::OXformSchema *this, Alembic::AbcGeom::v12::XformSample *a2)
{
  return MEMORY[0x1E0DF2A10](this, a2);
}

uint64_t Alembic::AbcGeom::v12::OXformSchema::OXformSchema()
{
  return MEMORY[0x1E0DF2A18]();
}

uint64_t Alembic::AbcGeom::v12::OPolyMeshSchema::set()
{
  return MEMORY[0x1E0DF2A20]();
}

uint64_t Alembic::AbcGeom::v12::OPolyMeshSchema::OPolyMeshSchema()
{
  return MEMORY[0x1E0DF2A28]();
}

uint64_t OpenSubdiv::__aapl__::Sdc::Crease::DetermineVertexVertexRule(OpenSubdiv::__aapl__::Sdc::Crease *this, float a2, uint64_t a3, const float *a4)
{
  return MEMORY[0x1E0DF2A30](this, a3, a4, a2);
}

uint64_t OpenSubdiv::__aapl__::Sdc::Crease::ComputeFractionalWeightAtVertex(OpenSubdiv::__aapl__::Sdc::Crease *this, float a2, float a3, uint64_t a4, const float *a5, const float *a6)
{
  return MEMORY[0x1E0DF2A38](this, a4, a5, a6, a2, a3);
}

uint64_t OpenSubdiv::__aapl__::Sdc::Crease::SubdivideEdgeSharpnessesAroundVertex(OpenSubdiv::__aapl__::Sdc::Crease *this, uint64_t a2, const float *a3, float *a4)
{
  return MEMORY[0x1E0DF2A40](this, a2, a3, a4);
}

uint64_t pxrInternal__aapl__pxrReserved__::ArResolver::CreateDefaultContextForAsset()
{
  return MEMORY[0x1E0DF2A48]();
}

uint64_t pxrInternal__aapl__pxrReserved__::ArResolver::OpenAsset()
{
  return MEMORY[0x1E0DF2A50]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4d::operator==()
{
  return MEMORY[0x1E0DF2A58]();
}

uint64_t pxrInternal__aapl__pxrReserved__::GfMatrix4f::operator==()
{
  return MEMORY[0x1E0DF2A60]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCone::GetAxisAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCone *this)
{
  return MEMORY[0x1E0DF2A68](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCone::GetHeightAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCone *this)
{
  return MEMORY[0x1E0DF2A70](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCone::GetRadiusAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCone *this)
{
  return MEMORY[0x1E0DF2A78](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCube::GetSizeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCube *this)
{
  return MEMORY[0x1E0DF2A80](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetCornerIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2A88](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetCreaseIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2A90](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetCreaseLengthsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2A98](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateCornerIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AA0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateCreaseIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AA8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateCreaseLengthsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AB0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetFaceVertexCountsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2AB8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetCornerSharpnessesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2AC0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetCreaseSharpnessesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2AC8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetFaceVertexIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2AD0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::GetSubdivisionSchemeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this)
{
  return MEMORY[0x1E0DF2AD8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateFaceVertexCountsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AE0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateCornerSharpnessesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AE8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateCreaseSharpnessesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AF0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateFaceVertexIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2AF8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomMesh::CreateSubdivisionSchemeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomMesh *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2B00](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdModelAPI::SetKind(pxrInternal__aapl__pxrReserved__::UsdModelAPI *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2B08](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdProperty::GetBaseName(pxrInternal__aapl__pxrReserved__::UsdProperty *this)
{
  return MEMORY[0x1E0DF2B10](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdTimeCode::_IssueGetValueOnDefaultError(pxrInternal__aapl__pxrReserved__::UsdTimeCode *this)
{
  return MEMORY[0x1E0DF2B18](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_PathNode::_RemovePathTokenFromTable(pxrInternal__aapl__pxrReserved__::Sdf_PathNode *this)
{
  return MEMORY[0x1E0DF2B20](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTimeSamples()
{
  return MEMORY[0x1E0DF2B28]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::HasAuthoredValueOpinion(pxrInternal__aapl__pxrReserved__::UsdAttribute *this)
{
  return MEMORY[0x1E0DF2B30](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::Get()
{
  return MEMORY[0x1E0DF2B38]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::Set()
{
  return MEMORY[0x1E0DF2B40]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::GfMatrix4d>()
{
  return off_1EA5728B0();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::GfVec2d>()
{
  return off_1EA5728B8();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::GfVec2f>()
{
  return off_1EA5728C0();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>()
{
  return off_1EA5728C8();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::GfMatrix4d>>()
{
  return off_1EA5728D0();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::GfVec3f>>()
{
  return off_1EA5728D8();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::TfToken>>()
{
  return off_1EA5728E0();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<double>>()
{
  return off_1EA5728E8();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<float>>()
{
  return off_1EA5728F0();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<int>>()
{
  return off_1EA5728F8();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<unsigned int>>()
{
  return off_1EA572900();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<BOOL>()
{
  return off_1EA572908();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<double>()
{
  return off_1EA572910();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<float>()
{
  return off_1EA572918();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<int>()
{
  return off_1EA572920();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::GfMatrix4d>()
{
  return off_1EA572928();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::SdfAssetPath>()
{
  return off_1EA572930();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::TfToken>()
{
  return off_1EA572938();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::GfVec2f>>()
{
  return off_1EA572940();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::GfVec3f>>()
{
  return off_1EA572948();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGprim::GetDoubleSidedAttr(pxrInternal__aapl__pxrReserved__::UsdGeomGprim *this)
{
  return MEMORY[0x1E0DF2B48](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGprim::GetOrientationAttr(pxrInternal__aapl__pxrReserved__::UsdGeomGprim *this)
{
  return MEMORY[0x1E0DF2B50](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGprim::GetDisplayColorPrimvar(pxrInternal__aapl__pxrReserved__::UsdGeomGprim *this)
{
  return MEMORY[0x1E0DF2B58](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomGprim::GetDisplayOpacityPrimvar(pxrInternal__aapl__pxrReserved__::UsdGeomGprim *this)
{
  return MEMORY[0x1E0DF2B60](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Usd_PrimData::GetPrimDataAtPathOrInPrototype(pxrInternal__aapl__pxrReserved__::Usd_PrimData *this, const pxrInternal__aapl__pxrReserved__::SdfPath *a2)
{
  return MEMORY[0x1E0DF2B68](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::Usd_PrimData::GetParent(pxrInternal__aapl__pxrReserved__::Usd_PrimData *this)
{
  return MEMORY[0x1E0DF2B70](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::Vt_ArrayBase::_DetachCopyHook(pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *this, const char *a2)
{
  return MEMORY[0x1E0DF2B78](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFStopAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2B80](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFStopAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2B88](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetProjectionAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2B90](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFocalLengthAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2B98](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateProjectionAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BA0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetClippingRangeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BA8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetFocusDistanceAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BB0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFocalLengthAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BB8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateClippingRangeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BC0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateFocusDistanceAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BC8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetVerticalApertureAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BD0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetHorizontalApertureAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BD8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateVerticalApertureAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BE0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateHorizontalApertureAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2BE8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetVerticalApertureOffsetAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BF0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::GetHorizontalApertureOffsetAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this)
{
  return MEMORY[0x1E0DF2BF8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateVerticalApertureOffsetAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2C00](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCamera::CreateHorizontalApertureOffsetAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCamera *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2C08](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCurves::GetWidthsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCurves *this)
{
  return MEMORY[0x1E0DF2C10](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCurves::GetCurveVertexCountsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCurves *this)
{
  return MEMORY[0x1E0DF2C18](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPoints::GetWidthsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomPoints *this)
{
  return MEMORY[0x1E0DF2C20](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSphere::GetRadiusAttr(pxrInternal__aapl__pxrReserved__::UsdGeomSphere *this)
{
  return MEMORY[0x1E0DF2C28](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdGeomSubset *this)
{
  return MEMORY[0x1E0DF2C30](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeInput::GetBaseName(pxrInternal__aapl__pxrReserved__::UsdShadeInput *this)
{
  return MEMORY[0x1E0DF2C38](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeInput::ConnectToSource()
{
  return MEMORY[0x1E0DF2C40]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeInput::Get()
{
  return MEMORY[0x1E0DF2C48]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeInput::Set()
{
  return MEMORY[0x1E0DF2C50]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCapsule::GetAxisAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCapsule *this)
{
  return MEMORY[0x1E0DF2C58](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCapsule::GetHeightAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCapsule *this)
{
  return MEMORY[0x1E0DF2C60](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCapsule::GetRadiusAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCapsule *this)
{
  return MEMORY[0x1E0DF2C68](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::GetIndices()
{
  return MEMORY[0x1E0DF2C70]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::SetIndices()
{
  return MEMORY[0x1E0DF2C78]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::GetElementSize(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar *this)
{
  return MEMORY[0x1E0DF2C80](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::GetInterpolation(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar *this)
{
  return MEMORY[0x1E0DF2C88](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::GetDeclarationInfo(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar *this, pxrInternal__aapl__pxrReserved__::TfToken *a2, pxrInternal__aapl__pxrReserved__::SdfValueTypeName *a3, pxrInternal__aapl__pxrReserved__::TfToken *a4, int *a5)
{
  return MEMORY[0x1E0DF2C90](this, a2, a3, a4, a5);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::Get<pxrInternal__aapl__pxrReserved__::VtValue>()
{
  return MEMORY[0x1E0DF2C98]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::IsIndexed(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar *this)
{
  return MEMORY[0x1E0DF2CA0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXformOp::GetOpName(pxrInternal__aapl__pxrReserved__::UsdGeomXformOp *this)
{
  return MEMORY[0x1E0DF2CA8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeOutput::GetTypeName(pxrInternal__aapl__pxrReserved__::UsdShadeOutput *this)
{
  return MEMORY[0x1E0DF2CB0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeOutput::ConnectToSource(pxrInternal__aapl__pxrReserved__::UsdShadeOutput *this, const pxrInternal__aapl__pxrReserved__::UsdShadeOutput *a2)
{
  return MEMORY[0x1E0DF2CB8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::CreateIdAttr(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2CC0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2CC8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetIdAttr(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this)
{
  return MEMORY[0x1E0DF2CD0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this)
{
  return MEMORY[0x1E0DF2CD8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetOutput(pxrInternal__aapl__pxrReserved__::UsdShadeShader *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2CE0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCylinder::GetAxisAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCylinder *this)
{
  return MEMORY[0x1E0DF2CE8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCylinder::GetHeightAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCylinder *this)
{
  return MEMORY[0x1E0DF2CF0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomCylinder::GetRadiusAttr(pxrInternal__aapl__pxrReserved__::UsdGeomCylinder *this)
{
  return MEMORY[0x1E0DF2CF8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdRelationship::GetForwardedTargets()
{
  return MEMORY[0x1E0DF2D00]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton::GetJointsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton *this)
{
  return MEMORY[0x1E0DF2D08](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton::GetBindTransformsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton *this)
{
  return MEMORY[0x1E0DF2D10](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton::GetRestTransformsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelSkeleton *this)
{
  return MEMORY[0x1E0DF2D18](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(pxrInternal__aapl__pxrReserved__::SdfValueTypeName *this)
{
  return MEMORY[0x1E0DF2D20](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==()
{
  return MEMORY[0x1E0DF2D28]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomBoundable::GetExtentAttr(pxrInternal__aapl__pxrReserved__::UsdGeomBoundable *this)
{
  return MEMORY[0x1E0DF2D30](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomBoundable::CreateExtentAttr(pxrInternal__aapl__pxrReserved__::UsdGeomBoundable *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2D38](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXformable::AddTransformOp()
{
  return MEMORY[0x1E0DF2D40]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetTimeSamples()
{
  return MEMORY[0x1E0DF2D48]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetOrderedXformOps(pxrInternal__aapl__pxrReserved__::UsdGeomXformable *this, BOOL *a2)
{
  return MEMORY[0x1E0DF2D50](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetJointsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D58](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetScalesAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D60](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetRotationsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D68](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetBlendShapesAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D70](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetTranslationsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D78](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelAnimation::GetBlendShapeWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelAnimation *this)
{
  return MEMORY[0x1E0DF2D80](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttributeQuery::GetAttribute(pxrInternal__aapl__pxrReserved__::UsdAttributeQuery *this)
{
  return MEMORY[0x1E0DF2D88](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdAttributeQuery::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::GfVec3f>>()
{
  return off_1EA572B98();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetUFormAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2D90](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetVFormAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2D98](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetUKnotsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DA0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetUOrderAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DA8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetURangeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DB0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetVKnotsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DB8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetVOrderAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DC0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetVRangeAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DC8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetPointWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DD0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetUVertexCountAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DD8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch::GetVVertexCountAttr(pxrInternal__aapl__pxrReserved__::UsdGeomNurbsPatch *this)
{
  return MEMORY[0x1E0DF2DE0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::GetPointsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this)
{
  return MEMORY[0x1E0DF2DE8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::GetNormalsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this)
{
  return MEMORY[0x1E0DF2DF0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::CreatePointsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2DF8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::CreateNormalsAttr(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this, const pxrInternal__aapl__pxrReserved__::VtValue *a2)
{
  return MEMORY[0x1E0DF2E00](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPointBased::GetNormalsInterpolation(pxrInternal__aapl__pxrReserved__::UsdGeomPointBased *this)
{
  return MEMORY[0x1E0DF2E08](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph::GetOutputs(pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph *this)
{
  return MEMORY[0x1E0DF2E10](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph::CreateOutput(pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2, const pxrInternal__aapl__pxrReserved__::SdfValueTypeName *a3)
{
  return MEMORY[0x1E0DF2E18](this, a2, a3);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph::GetInputs(pxrInternal__aapl__pxrReserved__::UsdShadeNodeGraph *this)
{
  return MEMORY[0x1E0DF2E20](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetJointsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E28](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetBlendShapesAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E30](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetJointIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E38](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetJointWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E40](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedSkeleton(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E48](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetBlendShapeTargetsRel(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E50](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetGeomBindTransformAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E58](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedAnimationSource(pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *this)
{
  return MEMORY[0x1E0DF2E60](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape::GetInbetweens(pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape *this)
{
  return MEMORY[0x1E0DF2E68](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape::GetOffsetsAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape *this)
{
  return MEMORY[0x1E0DF2E70](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape::GetPointIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdSkelBlendShape *this)
{
  return MEMORY[0x1E0DF2E78](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI::GetPrimvars(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI *this)
{
  return MEMORY[0x1E0DF2E80](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI::CreatePrimvar(pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2, const pxrInternal__aapl__pxrReserved__::SdfValueTypeName *a3, const pxrInternal__aapl__pxrReserved__::TfToken *a4)
{
  return MEMORY[0x1E0DF2E88](this, a2, a3, a4);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelInbetweenShape::GetOffsets()
{
  return MEMORY[0x1E0DF2E90]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdSkelInbetweenShape::GetWeight(pxrInternal__aapl__pxrReserved__::UsdSkelInbetweenShape *this, float *a2)
{
  return MEMORY[0x1E0DF2E98](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape::GetPointsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersBlendShape *this)
{
  return MEMORY[0x1E0DF2EA0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI::GetInput(pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2EA8](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI::GetInputs(pxrInternal__aapl__pxrReserved__::UsdShadeConnectableAPI *this)
{
  return MEMORY[0x1E0DF2EB0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetMorphWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EB8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetSkinTargetJointsRel(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EC0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetSkinJointIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EC8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetSkinJointWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2ED0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetSkinBindTransformsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2ED8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetMorphTargetBlendShapesRel(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EE0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetSkinMeshBindTransformAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EE8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetMorphChannelTargetCountsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EF0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh::GetMorphChannelTargetWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersDeformableMesh *this)
{
  return MEMORY[0x1E0DF2EF8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::ComputeBoundMaterial()
{
  return MEMORY[0x1E0DF2F00]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::Bind(pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *this, const pxrInternal__aapl__pxrReserved__::UsdShadeMaterial *a2, const pxrInternal__aapl__pxrReserved__::TfToken *a3, const pxrInternal__aapl__pxrReserved__::TfToken *a4)
{
  return MEMORY[0x1E0DF2F08](this, a2, a3, a4);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::GetSkinTargetJointsRel(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  return MEMORY[0x1E0DF2F10](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::GetSkinJointIndicesAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  return MEMORY[0x1E0DF2F18](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::GetSkinJointWeightsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  return MEMORY[0x1E0DF2F20](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::GetSkinBindTransformsAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  return MEMORY[0x1E0DF2F28](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI::GetSkinMeshBindTransformAttr(pxrInternal__aapl__pxrReserved__::UsdDeformersSkinDeformerAPI *this)
{
  return MEMORY[0x1E0DF2F30](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::TfType::GetSizeof(pxrInternal__aapl__pxrReserved__::TfType *this)
{
  return MEMORY[0x1E0DF2F38](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::IsPrimPath(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F40](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::GetNameToken(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F48](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::GetParentPath(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F50](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::AppendProperty(pxrInternal__aapl__pxrReserved__::SdfPath *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2F58](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::IsRootPrimPath(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F60](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::GetName(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F68](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::GetText(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F70](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfPath::GetString(pxrInternal__aapl__pxrReserved__::SdfPath *this)
{
  return MEMORY[0x1E0DF2F78](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::GetAttribute(pxrInternal__aapl__pxrReserved__::UsdPrim *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2F80](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::GetPrototype(pxrInternal__aapl__pxrReserved__::UsdPrim *this)
{
  return MEMORY[0x1E0DF2F88](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::HasAttribute(pxrInternal__aapl__pxrReserved__::UsdPrim *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2)
{
  return MEMORY[0x1E0DF2F90](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(pxrInternal__aapl__pxrReserved__::UsdPrim *this)
{
  return MEMORY[0x1E0DF2F98](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::_IsA()
{
  return MEMORY[0x1E0DF2FA0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdPrim::_HasAPI()
{
  return MEMORY[0x1E0DF2FA8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::_TypeIsImpl(pxrInternal__aapl__pxrReserved__::VtValue *this, const std::type_info *a2)
{
  return MEMORY[0x1E0DF2FB0](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::IsArrayValued(pxrInternal__aapl__pxrReserved__::VtValue *this)
{
  return MEMORY[0x1E0DF2FB8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(pxrInternal__aapl__pxrReserved__::VtValue *this)
{
  return MEMORY[0x1E0DF2FC0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::GetElementTypeid(pxrInternal__aapl__pxrReserved__::VtValue *this)
{
  return MEMORY[0x1E0DF2FC8](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::GetType(pxrInternal__aapl__pxrReserved__::VtValue *this)
{
  return MEMORY[0x1E0DF2FD0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::_FailGet()
{
  return MEMORY[0x1E0DF2FD8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid(pxrInternal__aapl__pxrReserved__::VtValue *this)
{
  return MEMORY[0x1E0DF2FE0](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::SdfLayer::Export()
{
  return MEMORY[0x1E0DF2FE8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::GetPtr()
{
  return MEMORY[0x1E0DF2FF0]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL()
{
  return MEMORY[0x1E0DF2FF8]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator==()
{
  return MEMORY[0x1E0DF3000]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::GetPtr()
{
  return MEMORY[0x1E0DF3008]();
}

uint64_t pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL()
{
  return MEMORY[0x1E0DF3010]();
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(pxrInternal__aapl__pxrReserved__::UsdStage *this)
{
  return MEMORY[0x1E0DF3018](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetPrimAtPath(pxrInternal__aapl__pxrReserved__::UsdStage *this, const pxrInternal__aapl__pxrReserved__::SdfPath *a2)
{
  return MEMORY[0x1E0DF3020](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetPseudoRoot(pxrInternal__aapl__pxrReserved__::UsdStage *this)
{
  return MEMORY[0x1E0DF3028](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetEndTimeCode(pxrInternal__aapl__pxrReserved__::UsdStage *this)
{
  return MEMORY[0x1E0DF3030](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetStartTimeCode(pxrInternal__aapl__pxrReserved__::UsdStage *this)
{
  return MEMORY[0x1E0DF3038](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(pxrInternal__aapl__pxrReserved__::UsdStage *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2, const pxrInternal__aapl__pxrReserved__::TfToken *a3, const pxrInternal__aapl__pxrReserved__::VtValue *a4)
{
  return MEMORY[0x1E0DF3040](this, a2, a3, a4);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::GetTimeCodesPerSecond(pxrInternal__aapl__pxrReserved__::UsdStage *this)
{
  return MEMORY[0x1E0DF3048](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdStage::SetTimeCodesPerSecond(pxrInternal__aapl__pxrReserved__::UsdStage *this, double a2)
{
  return MEMORY[0x1E0DF3050](this, a2);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdObject::SetAssetInfoByKey(pxrInternal__aapl__pxrReserved__::UsdObject *this, const pxrInternal__aapl__pxrReserved__::TfToken *a2, const pxrInternal__aapl__pxrReserved__::VtValue *a3)
{
  return MEMORY[0x1E0DF3058](this, a2, a3);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdObject::_GetDefiningSpecType(pxrInternal__aapl__pxrReserved__::UsdObject *this)
{
  return MEMORY[0x1E0DF3060](this);
}

uint64_t pxrInternal__aapl__pxrReserved__::UsdObject::GetStage(pxrInternal__aapl__pxrReserved__::UsdObject *this)
{
  return MEMORY[0x1E0DF3068](this);
}

uint64_t Alembic::AbcCoreOgawa::v12::WriteArchive::operator()()
{
  return MEMORY[0x1E0DF3070]();
}

uint64_t Alembic::Abc::v12::OArrayProperty::getNumSamples(Alembic::Abc::v12::OArrayProperty *this)
{
  return MEMORY[0x1E0DF3078](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41D0](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
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
  return MEMORY[0x1E0DE4638]();
}

{
  return MEMORY[0x1E0DE4640]();
}

{
  return MEMORY[0x1E0DE4648]();
}

{
  return MEMORY[0x1E0DE4650]();
}

{
  return MEMORY[0x1E0DE4658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
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
  return MEMORY[0x1E0DE4728]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x1E0DE47B0]();
}

{
  return MEMORY[0x1E0DE47B8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
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

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
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

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
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
  return off_1EA573280();
}

void operator delete(void *__p)
{
  off_1EA573288(__p);
}

uint64_t operator delete()
{
  return off_1EA573290();
}

uint64_t operator new[]()
{
  return off_1EA573298();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA5732A0(__sz);
}

uint64_t operator new()
{
  return off_1EA5732A8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
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

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __invert_d4()
{
  return MEMORY[0x1E0C80B20]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

clock_t clock(void)
{
  return MEMORY[0x1E0C82650]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
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

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

