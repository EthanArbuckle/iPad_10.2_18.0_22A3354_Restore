@implementation IPDetector

uint64_t __IPDetector_response_block_invoke(uint64_t result, int a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 *v11;
  int16x8_t *v12;
  int8x16_t v13;
  int16x4_t v14;
  int8x16_t v15;
  int16x4_t v16;
  int8x16_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int32x4_t v20;
  int32x4_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  unsigned __int8 *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;

  if (a3 >= 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(result + 48) * a2;
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 2 * v4;
    v6 = (unsigned __int8 *)(*(_QWORD *)(result + 40) + v4);
    v7 = *(_DWORD *)(result + 64);
    do
    {
      v9 = *(int *)(result + 56);
      v8 = *(int *)(result + 60);
      if (v7 < 1)
      {
        v22 = v6 - 3;
        v23 = v6 + 3;
        v24 = &v6[-v9];
        v25 = &v6[v9];
        v26 = &v6[v8 - 2];
        v27 = &v6[v8 + 2];
        v30 = &v6[-v8];
        v29 = &v6[-v8 + 2];
        v28 = v30 - 2;
        v12 = (int16x8_t *)v5;
        v11 = v6;
      }
      else
      {
        v10 = 0;
        v11 = v6;
        v12 = (int16x8_t *)v5;
        do
        {
          v13 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v11);
          v14 = (int16x4_t)vextq_s8(v13, v13, 8uLL).u64[0];
          *(int16x4_t *)v13.i8 = vadd_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8);
          v15 = (int8x16_t)vaddl_u8(*(uint8x8_t *)(v11 + 3), *(uint8x8_t *)(v11 - 3));
          v16 = vsub_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
          v17 = (int8x16_t)vaddl_u8(*(uint8x8_t *)&v11[v9], *(uint8x8_t *)&v11[-v9]);
          *(int16x4_t *)v13.i8 = vsub_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v17.i8);
          v18 = vmull_s16(v16, *(int16x4_t *)v13.i8);
          *(int16x4_t *)v13.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v13.i8, v16), 4uLL);
          v19 = vsubq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)&v11[-v8 + 2], *(uint8x8_t *)&v11[v8 - 2]), (int16x8_t)vaddl_u8(*(uint8x8_t *)&v11[v8 + 2], *(uint8x8_t *)&v11[-v8 - 2]));
          v20 = vmlsl_s16(vmlsl_s16(v18, *(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8), *(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
          *(int16x4_t *)v13.i8 = vadd_s16(v14, v14);
          *(int16x4_t *)v15.i8 = vsub_s16(*(int16x4_t *)v13.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
          *(int16x4_t *)v13.i8 = vsub_s16(*(int16x4_t *)v13.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
          *(int16x4_t *)v17.i8 = vshrn_n_s32(v20, 9uLL);
          v21 = vmull_s16(*(int16x4_t *)v15.i8, *(int16x4_t *)v13.i8);
          *(int16x4_t *)v13.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8), 4uLL);
          v11 += 8;
          *v12++ = vshrn_high_n_s32(*(int16x4_t *)v17.i8, vmlsl_high_s16(vmlsl_s16(v21, *(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8), v19, v19), 9uLL);
          ++v10;
          v7 = *(_DWORD *)(result + 64);
        }
        while (v10 < v7);
        v22 = v11 - 3;
        v23 = v11 + 3;
        v24 = &v11[-v9];
        v25 = &v11[v9];
        v26 = &v11[v8 - 2];
        v27 = &v11[v8 + 2];
        v28 = &v11[-v8 - 2];
        v29 = &v11[-v8 + 2];
      }
      v31 = *(_DWORD *)(result + 68);
      if (v31 >= 1)
      {
        do
        {
          v32 = *v11++;
          v33 = 2 * v32;
          v35 = *v22++;
          v34 = v35;
          v36 = *v23++;
          v37 = v33 - (v34 + v36);
          v39 = *v24++;
          v38 = v39;
          v40 = *v25++;
          v41 = v33 - (v38 + v40);
          v42 = v41 * v37;
          v43 = (v41 + v37) >> 4;
          v45 = *v26++;
          v44 = v45;
          v46 = *v27++;
          v47 = v44 - v46;
          v49 = *v29++;
          v48 = v49;
          v50 = *v28++;
          v12->i16[0] = (v42 - (v47 - v50 + v48) * (v47 - v50 + v48) - v43 * v43) >> 9;
          v12 = (int16x8_t *)((char *)v12 + 2);
          --v31;
        }
        while (v31);
      }
      v51 = *(_QWORD *)(result + 48);
      v6 += v51;
      v5 += 2 * v51;
      ++v3;
    }
    while (v3 != a3);
  }
  return result;
}

uint64_t __IPDetector_response_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

uint64_t __IPDetector_response_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 48)));
}

uint64_t __IPDetector_cornerDetect_block_invoke(uint64_t result, int a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  _WORD *v26;
  unsigned int v27;
  _WORD *v28;

  v3 = a2 + a3 - 1;
  if (a2 + 1 < v3)
  {
    v5 = *(_QWORD *)(result + 40);
    v4 = *(_QWORD *)(result + 48);
    v6 = *(_QWORD **)(result + 32);
    v7 = v6[4];
    v8 = a2;
    v9 = v5 + a2;
    v10 = v6[8];
    v11 = *(_DWORD *)(result + 56);
    v12 = v8 + 1;
    v13 = v4 * (2 * v9 + 4) + 2 * v5 + v7 + 2;
    v14 = 2 * v4;
    v15 = v4 * (2 * v9 + 2) + 2 * v5 + v7 + 4;
    result = 2 * v4 * v9 + 2 * v5 + v7 + 4;
    do
    {
      if (v11 >= 3)
      {
        v16 = 20 * *(unsigned __int16 *)(v10 + 2 * v12);
        v17 = 2;
        v18 = 1;
        do
        {
          v19 = v15 + v17;
          v20 = *(__int16 *)(v15 + v17 - 4);
          if (v20 >= 1 && v20 >= *(__int16 *)(v19 - 6) && v20 >= *(__int16 *)(v19 - 2))
          {
            v21 = result + v17;
            if (v20 >= *(__int16 *)(result + v17 - 4))
            {
              v22 = (__int16 *)(v13 + v17);
              if (v20 >= *(__int16 *)(v13 + v17 - 2)
                && v20 >= *(__int16 *)(v21 - 6)
                && v20 >= *(__int16 *)(v21 - 2)
                && v20 >= *(v22 - 2)
                && v20 >= *v22)
              {
                v23 = v6[6];
                v24 = v16 + *(unsigned __int16 *)(v6[7] + v17);
                v25 = v23 + 6 * v24;
                v27 = *(unsigned __int16 *)(v25 + 4);
                v26 = (_WORD *)(v25 + 4);
                if (v27 < (unsigned __int16)v20)
                {
                  *v26 = v20;
                  v28 = (_WORD *)(v23 + 6 * v24);
                  *v28 = v18 + v5;
                  v28[1] = v12 + v5;
                }
              }
            }
          }
          ++v18;
          v17 += 2;
        }
        while (v11 - 1 != v18);
      }
      ++v12;
      v13 += v14;
      v15 += v14;
      result += v14;
    }
    while (v3 != (_DWORD)v12);
  }
  return result;
}

uint64_t __IPDetector_cornerDetect_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

uint64_t __IPDetector_cornerDetect_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 48)));
}

@end
