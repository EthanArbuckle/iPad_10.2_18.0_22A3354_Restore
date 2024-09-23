@implementation Projections

void __Projections_projectionRows_planar8UtoF_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int i;
  uint64_t v13;
  uint32x4_t *v14;
  uint8x16_t v15;
  uint16x8_t v16;
  uint32x4_t v17;
  uint32x4_t v18;
  uint16x8_t v19;
  uint32x4_t v20;
  uint32x4_t v21;
  uint64_t v22;
  uint64_t v23;

  MEMORY[0x1E0C80A78](a1);
  v2 = v1;
  STACK[0xFC08] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(v3 + 32);
  v5 = (uint64_t *)(v4 + 48 * v1);
  v6 = *((int *)v5 + 6);
  v7 = v5[2];
  v8 = *v5;
  bzero(&v23, 0x3F00uLL);
  v9 = *((_DWORD *)v5 + 3);
  v10 = *((int *)v5 + 2);
  v11 = *((unsigned int *)v5 + 2);
  if (v9 >= 1)
  {
    for (i = 0; i < v9; i += v6)
    {
      if ((int)v10 < 17)
      {
        v13 = 0;
      }
      else
      {
        v13 = 0;
        v14 = (uint32x4_t *)&v23;
        do
        {
          v15 = *(uint8x16_t *)(v8 + v13);
          v16 = vmovl_u8(*(uint8x8_t *)v15.i8);
          v17 = vaddw_u16(*v14, *(uint16x4_t *)v16.i8);
          v18 = vaddw_high_u16(v14[1], v16);
          v19 = vmovl_high_u8(v15);
          *v14 = v17;
          v14[1] = v18;
          v20 = vaddw_u16(v14[2], *(uint16x4_t *)v19.i8);
          v21 = vaddw_high_u16(v14[3], v19);
          v14[2] = v20;
          v14[3] = v21;
          v13 += 16;
          v14 += 4;
        }
        while (v13 < v10 - 16);
        v13 = v13;
      }
      if ((int)v13 < (int)v11)
      {
        do
        {
          *((_DWORD *)&v23 + v13) += *(unsigned __int8 *)(v8 + v13);
          ++v13;
        }
        while (v11 != v13);
      }
      v8 += v7 * v6;
    }
  }
  v22 = v4 + 48 * v2;
  vDSP_vflt32((const int *)&v23, 1, *(float **)(v22 + 32), 1, (int)v11);
  *(_QWORD *)(v22 + 40) = 4736;
}

uint64_t __Projections_projectionCols_planar8UtoF_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int32x2_t v15;
  const char *v16;
  uint8x8_t v17;
  unint64_t v18;
  int32x4_t v19;
  unint64_t v20;
  int v21;

  v2 = *(_QWORD *)(result + 32);
  v3 = (uint64_t *)(v2 + 48 * a2);
  v4 = *((unsigned int *)v3 + 3);
  if ((int)v4 >= 1)
  {
    v5 = *(unsigned int *)(v2 + 48 * a2 + 24);
    if (v5 <= 4 && ((1 << v5) & 0x16) != 0)
    {
      v7 = 0;
      v8 = *v3;
      v9 = v2 + 48 * a2;
      v10 = *(int *)(v9 + 8);
      v11 = *(_QWORD *)(v9 + 32);
      v12 = *(_QWORD *)(v9 + 16);
      v13 = (v10 - 16);
      do
      {
        if ((_DWORD)v5 == 1)
        {
          if ((int)v10 < 17)
          {
            result = 0;
            v19 = 0uLL;
          }
          else
          {
            v18 = 0;
            v19 = 0uLL;
            do
            {
              v19 = vpadalq_s16(v19, (int16x8_t)vpaddlq_u8(*(uint8x16_t *)(v8 + v18)));
              v18 += 16;
            }
            while (v18 < v13);
            result = (((_DWORD)v10 - 17) & 0xFFFFFFF0) + 16;
          }
          v15 = (int32x2_t)vpaddq_s32(v19, v19).u64[0];
        }
        else
        {
          if ((_DWORD)v5 != 2)
          {
            if ((int)v10 < 17)
            {
              result = 0;
              v15.i32[0] = 0;
            }
            else
            {
              v20 = 0;
              v15 = 0;
              do
              {
                v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8((uint8x8_t)vqtbl1_s8(*(int8x16_t *)(v8 + v20), (int8x8_t)0xC0804000C080400)));
                v20 += 16;
              }
              while (v20 < v13);
              result = (((_DWORD)v10 - 17) & 0xFFFFFFF0) + 16;
            }
            goto LABEL_25;
          }
          if ((int)v10 < 17)
          {
            result = 0;
            v15 = 0;
          }
          else
          {
            v14 = 0;
            v15 = 0;
            do
            {
              v16 = (const char *)(v8 + v14);
              v17 = (uint8x8_t)*(_OWORD *)vld2_s8(v16).val;
              v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8(v17));
              v14 += 16;
            }
            while (v14 < v13);
            result = (((_DWORD)v10 - 17) & 0xFFFFFFF0) + 16;
          }
        }
        v15.i32[0] = vpadd_s32(v15, v15).u32[0];
LABEL_25:
        v21 = v15.i32[0];
        if ((int)result < (int)v10)
        {
          result = (int)result;
          do
          {
            v21 += *(unsigned __int8 *)(v8 + result);
            result += v5;
          }
          while (result < v10);
        }
        *(float *)(v11 + 4 * v7) = (float)v21;
        v8 += v12;
        ++v7;
      }
      while (v7 != v4);
    }
  }
  *(_QWORD *)(v2 + 48 * a2 + 40) = 4736;
  return result;
}

@end
