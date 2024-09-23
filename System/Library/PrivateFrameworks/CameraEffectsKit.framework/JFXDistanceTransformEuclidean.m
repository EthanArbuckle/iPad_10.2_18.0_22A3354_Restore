@implementation JFXDistanceTransformEuclidean

uint64_t __JFXDistanceTransformEuclidean_block_invoke(uint64_t result, double a2, double a3, uint8x8_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  signed int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int32x4_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int32x4_t v21;
  int16x4_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int32x4_t v29;

  v4 = result;
  v5 = *(_DWORD *)(result + 48);
  v6 = v5 + 7;
  if (v5 >= 0)
    v6 = *(_DWORD *)(result + 48);
  v7 = v6 & 0xFFFFFFF8;
  if (v5 >= 8)
  {
    v8 = 0;
    do
    {
      result = distancesForWColumns<(SIMDWidth)8>(*(_QWORD *)(v4 + 32), v8, *(_QWORD *)(v4 + 40), *(_DWORD *)(v4 + 52), *(_DWORD *)(v4 + 56), *(unsigned __int8 *)(v4 + 60));
      v8 += 8;
    }
    while (v8 < v7);
    v5 = *(_DWORD *)(v4 + 48);
  }
  if (v7 < v5)
  {
    v9 = v7;
    v10 = 4 * v7;
    v11.i64[0] = 0x100000001;
    v11.i64[1] = 0x100000001;
    do
    {
      v12 = *(unsigned int *)(v4 + 56);
      if ((int)v12 >= 1)
      {
        v13 = *(_QWORD *)(v4 + 32);
        v14 = *(_QWORD *)(v4 + 40);
        *(int16x4_t *)v15.i8 = vdup_n_s16(-*(unsigned __int8 *)(v4 + 60));
        v16 = vdupq_n_s32(v12);
        v17 = (int32x4_t *)(v14 + v10);
        v18 = *(int *)(v4 + 52);
        v19 = v13;
        v20 = *(unsigned int *)(v4 + 56);
        v21 = v16;
        do
        {
          a4.i32[0] = *(_DWORD *)(v19 + v9);
          v22 = (int16x4_t)vmovl_u8(a4).u64[0];
          a4 = (uint8x8_t)(v15.i64[0] & 0xFF00FF00FF00FFLL);
          v21 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v21, v11), (int8x16_t)vmovl_s16(vceq_s16(v22, (int16x4_t)(v15.i64[0] & 0xFF00FF00FF00FFLL))));
          *v17 = v21;
          v17 = (int32x4_t *)((char *)v17 + 4 * v18);
          v19 += v18;
          --v20;
        }
        while (v20);
        v23 = v12 + 1;
        v24 = (v12 - 1) * v18;
        v25 = v14 + 4 * v24;
        v26 = -4 * v18;
        v27 = v13 + v24;
        v28 = -v18;
        do
        {
          v15.i32[0] = *(_DWORD *)(v27 + v9);
          v16 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v16, v11), (int8x16_t)vmovl_s16(vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v15.i8), (int16x4_t)a4)));
          v29 = vminq_s32(v16, *(int32x4_t *)(v25 + v10));
          v15 = vmulq_s32(v29, v29);
          *(int32x4_t *)(v25 + v10) = v15;
          --v23;
          v25 += v26;
          v27 += v28;
        }
        while (v23 > 1);
        v5 = *(_DWORD *)(v4 + 48);
      }
      v9 += 4;
      v10 += 16;
    }
    while (v9 < v5);
  }
  return result;
}

uint64_t __JFXDistanceTransformEuclidean_block_invoke_2(uint64_t result, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  v2 = *(_DWORD *)(result + 52);
  v3 = *(_DWORD *)(result + 48) + 8 * a2;
  if (v3 < v2)
  {
    v4 = result;
    do
    {
      result = distancesForWColumns<(SIMDWidth)8>(*(_QWORD *)(v4 + 32), v3, *(_QWORD *)(v4 + 40), v2, *(_DWORD *)(v4 + 56), *(unsigned __int8 *)(v4 + 60));
      v3 += 40;
      v2 = *(_DWORD *)(v4 + 52);
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t __JFXDistanceTransformEuclidean_block_invoke_3()
{
  uint64_t result;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  float v18;
  uint64_t v19;
  int v20;
  float v21;
  int v22;
  float v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  int8x8_t *v32;
  float32x4_t *v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t v36;
  int v37;
  int v38;
  uint64_t v39;
  _DWORD *v40;
  float32x4_t *v41;
  float32x4_t v42;
  int16x8_t v43;
  int v44;
  float32x4_t v45;
  _BYTE v46[4];
  _QWORD v47[321];
  _DWORD v48[640];
  uint64_t v49;

  result = MEMORY[0x24BDAC7A8]();
  v49 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(result + 56);
  if (v2 >= 5)
  {
    v3 = result;
    v4 = v2 / 5;
    v5 = v4 * v1;
    v44 = v4 * v1 + v4;
    v45 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      v6 = operator new[]();
      v7 = *(unsigned int *)(v3 + 64);
      v8 = *(_QWORD *)(v3 + 32);
      v9 = *(_QWORD *)(v3 + 40);
      v48[0] = 0;
      v47[0] = 0x60AD78ECE0AD78ECLL;
      if ((int)v7 > 640)
        __JFXDistanceTransformEuclidean_block_invoke_3_cold_1();
      v10 = v8 + 4 * (int)v7 * v5;
      if ((int)v7 > 1)
      {
        v11 = 0;
        LODWORD(v12) = 0;
        v13 = *(float *)(v9 + 4);
        v14 = -1.0e20;
        v15 = 1;
        do
        {
          v16 = v11 + 1;
          v17 = *(_DWORD *)(v10 + 4 * v15) + v16 * v16;
          v18 = v13 * (float)(v17 - (*(_DWORD *)(v10 + 4 * v11) + v11 * v11));
          if (v18 <= v14)
          {
            v12 = (int)v12;
            do
            {
              if (v12 <= 0)
                __JFXDistanceTransformEuclidean_block_invoke_3_cold_3();
              v19 = *((int *)&v47[320] + v12 + 1);
              v20 = v17 - (*(_DWORD *)(v10 + 4 * v19) + v19 * v19);
              v21 = *(float *)(v9 + 4 * ((int)v16 - (int)v19));
              v22 = v12 - 1;
              v18 = v21 * (float)v20;
              v23 = *(float *)&v46[4 * v12--];
            }
            while (v18 <= v23);
            LODWORD(v12) = v22;
          }
          v24 = (char *)v47 + 4 * (int)v12;
          v12 = (int)v12 + 1;
          v48[v12] = v16;
          *((float *)v47 + v12) = v18;
          ++v15;
          *((_DWORD *)v24 + 2) = 1621981420;
          v11 = v16;
          v14 = v18;
        }
        while (v15 != v7);
      }
      if ((int)v7 >= 1)
      {
        v25 = 0;
        v26 = 0;
        do
        {
          v27 = (int)v26;
          v28 = (v26 << 32) - 0x100000000;
          do
          {
            v29 = v27 + 1;
            v30 = *((float *)v47 + v27 + 1);
            v28 += 0x100000000;
            ++v27;
          }
          while (v30 < (float)(int)v25);
          *(float *)(v6 + 4 * v25) = (float)(*(_DWORD *)(v10 + 4 * *(int *)((char *)v48 + (v28 >> 30)))
                                           + (v25 - *(_DWORD *)((char *)v48 + (v28 >> 30)))
                                           * (v25 - *(_DWORD *)((char *)v48 + (v28 >> 30))));
          ++v25;
          v26 = v29 - 1;
        }
        while (v25 != v7);
      }
      if ((v7 & 3) != 0)
        __JFXDistanceTransformEuclidean_block_invoke_3_cold_2();
      v31 = *(_QWORD *)(v3 + 48);
      if ((int)v7 >= 8)
      {
        v32 = (int8x8_t *)(v31 + (int)v7 * v5);
        v33 = (float32x4_t *)v6;
        v34 = ((int)v7 / 8);
        do
        {
          v36 = *v33;
          v35 = v33[1];
          v33 += 2;
          *v32++ = vmovn_s16(vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vminnmq_f32(vmaxnmq_f32(vrndaq_f32(vsqrtq_f32(v36)), (float32x4_t)0), v45)), (int16x8_t)vcvtq_s32_f32(vminnmq_f32(vmaxnmq_f32(vrndaq_f32(vsqrtq_f32(v35)), (float32x4_t)0), v45))));
          --v34;
        }
        while (v34);
      }
      v37 = 2 * ((int)v7 / 8);
      v38 = v7 + 3;
      if ((int)v7 >= 0)
        v38 = v7;
      if (v37 < v38 >> 2)
      {
        v39 = (v38 >> 2) - (uint64_t)v37;
        v40 = (_DWORD *)(v31 + 4 * v37 + (int)v7 * v5);
        v41 = (float32x4_t *)(v6 + 16 * v37);
        do
        {
          v42 = *v41++;
          v43 = (int16x8_t)vcvtq_s32_f32(vminnmq_f32(vmaxnmq_f32(vrndaq_f32(vsqrtq_f32(v42)), (float32x4_t)0), v45));
          *(int16x4_t *)v43.i8 = vmovn_s32((int32x4_t)v43);
          *v40++ = vmovn_s16(v43).u32[0];
          --v39;
        }
        while (v39);
      }
      result = MEMORY[0x2276A1A80](v6, 0x1000C8052888210);
      ++v5;
    }
    while (v5 < v44);
  }
  return result;
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_1()
{
  __assert_rtn("distancesForRow", "JFXDistanceTransform.mm", 30, "n <= MAX_DIM");
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_2()
{
  __assert_rtn("sqrtAndConvertRowToUChar", "JFXDistanceTransform.mm", 135, "width % kThinWidthCol == 0");
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_3()
{
  __assert_rtn("distancesForRow", "JFXDistanceTransform.mm", 42, "k > 0");
}

@end
