@implementation ATXHistogramData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  char *value;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  objc_msgSend(v8, "encodeInt32:forKey:", *(unsigned int *)(*(_QWORD *)value + 24), CFSTR("count"));
  v5 = *(_QWORD **)value;
  if (*(_QWORD *)(*(_QWORD *)value + 24))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", **(_QWORD **)value, 4 * *(_QWORD *)(*(_QWORD *)value + 24));
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("scores"));

    v5 = *(_QWORD **)value;
  }
  if (v5[7])
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)(*(_QWORD *)value + 32), 4 * *(_QWORD *)(*(_QWORD *)value + 56));
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("abs"));

  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

}

- (ATXHistogramData)init
{
  char *v2;
  char *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXHistogramData;
  v2 = -[ATXHistogramData init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v5 = v2 + 8;
    v4 = (void *)*((_QWORD *)v2 + 1);
    if (v4)
    {
      *((_QWORD *)v3 + 2) = v4;
      free(v4);
      *v5 = 0;
      *((_QWORD *)v3 + 2) = 0;
      *((_QWORD *)v3 + 3) = 0;
    }
    v7 = v3 + 40;
    v6 = (void *)*((_QWORD *)v3 + 5);
    v8 = 0uLL;
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    if (v6)
    {
      *((_QWORD *)v3 + 6) = v6;
      free(v6);
      v8 = 0uLL;
      *v7 = 0;
      *((_QWORD *)v3 + 6) = 0;
      *((_QWORD *)v3 + 7) = 0;
    }
    v3[72] = 0;
    *(_OWORD *)v7 = v8;
    *(_OWORD *)(v3 + 56) = v8;
    v9 = operator new();
    *(_QWORD *)v9 = v5;
    proactive::pas::detail::RecursiveMutex::RecursiveMutex((pthread_mutex_t *)(v9 + 8));
    v11 = 0;
  }
  return (ATXHistogramData *)v3;
}

- (void)clear
{
  char *value;

  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(_BYTE *)(*(_QWORD *)value + 64))
  {
    __break(1u);
  }
  else
  {
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(_QWORD *)value, 0);
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(_QWORD *)value + 32, 0);
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (void)add:(float)a3 a:(unsigned __int16)a4 b:(unsigned __int16)a5
{
  int v6;
  int v7;
  char *value;
  pthread_mutex_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  if (fabsf(a3) != INFINITY)
  {
    v6 = a5;
    v7 = a4;
    value = (char *)self->_guardedData.__ptr_.__value_;
    v9 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    v10 = *(_QWORD **)value;
    if (*(_BYTE *)(*(_QWORD *)value + 64))
    {
      __break(1u);
    }
    else
    {
      v11 = v10[7];
      if (v11)
      {
        v12 = 0;
        while (*(_DWORD *)(v10[4] + 4 * v12) != (v6 | (v7 << 16)))
        {
          if (v11 == ++v12)
            goto LABEL_7;
        }
        *(float *)(*v10 + 4 * v12) = fmaxf(*(float *)(*v10 + 4 * v12) + a3, 0.0);
      }
      else
      {
LABEL_7:
        if (a3 >= 0.0)
        {
          v13 = v10[3];
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(_QWORD *)value, v13 + 1);
          *(float *)(*v10 + 4 * v13) = fmaxf(a3, 0.0);
          v14 = (_QWORD *)(*(_QWORD *)value + 32);
          v15 = *(_QWORD *)(*(_QWORD *)value + 56);
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)v14, v15 + 1);
          *(_DWORD *)(*v14 + 4 * v15) = v6 | (v7 << 16);
        }
      }
      pthread_mutex_unlock(v9);
    }
  }
}

- (float)lookupUnsmoothedA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4;
  int v5;
  char *value;
  int8x16_t *v7;
  uint64_t v8;
  unint64_t v9;
  int16x8_t *v10;
  int16x8_t v11;
  float32x4_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int8x8_t v15;
  float32x4_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int8x16_t v23;
  float result;
  float32x4_t v25;
  float32x4_t v26;

  v4 = a4;
  v5 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v7 = **(int8x16_t ***)value;
  v8 = *(_QWORD *)(*(_QWORD *)value + 8) - (_QWORD)v7;
  if (v8)
  {
    v9 = v8 >> 5;
    v10 = *(int16x8_t **)(*(_QWORD *)value + 32);
    v11 = (int16x8_t)vdupq_n_s32(v4 | (v5 << 16));
    if (v9 <= 1)
      v9 = 1;
    v12 = 0uLL;
    v13.i64[0] = -1;
    v13.i64[1] = -1;
    v14 = vceqq_s16(v11, v13);
    v15 = vmovn_s16(v14);
    v16 = 0uLL;
    do
    {
      v18 = *v10;
      v17 = v10[1];
      v10 += 2;
      v19 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v17, v11), (int8x16_t)v14);
      v20 = vcltzq_s16(vshlq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(v18, v11)), v15)), 0xFuLL));
      v22 = *v7;
      v21 = v7[1];
      v7 += 2;
      v16 = vaddq_f32(v16, (float32x4_t)vandq_s8(vandq_s8(v21, (int8x16_t)v19), (int8x16_t)vrev32q_s16(v19)));
      v12 = vaddq_f32(v12, (float32x4_t)vandq_s8(vandq_s8(v22, (int8x16_t)v20), (int8x16_t)vrev32q_s16(v20)));
      --v9;
    }
    while (v9);
  }
  else
  {
    v12 = 0uLL;
    v16 = 0uLL;
  }
  v25 = v16;
  v26 = v12;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  v23 = (int8x16_t)vaddq_f32(v26, v25);
  result = vaddv_f32(vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL)));
  if (fabsf(result) == INFINITY)
    return 0.0;
  return result;
}

- (float)lookupSmoothedWithBucketCount:(unsigned __int16)a3 distanceScale:(float)a4 a:(unsigned __int16)a5 b:(unsigned __int16)a6
{
  unsigned int v6;
  int v7;
  unsigned int v8;
  char *value;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int16x8_t v16;
  int32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int8x8_t v22;
  int8x16_t v23;
  float32x4_t v29;
  float32x4_t v30;
  uint64_t v31;
  int8x16_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int8x16_t *v36;
  int32x4_t v37;
  int16x8_t v38;
  int32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  int8x16_t v48;
  float result;
  void *v51;
  float32x4_t v52;
  float32x4_t v54;

  v6 = a6;
  v7 = a5;
  v8 = a3;
  if (a6 == 0xFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("b != SUMALL"));

  }
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v11 = **(_QWORD **)value;
  v12 = *(_QWORD *)(*(_QWORD *)value + 8);
  v13 = v12 - v11;
  if (v12 == v11)
  {
    v19 = 0uLL;
    v30 = 0uLL;
  }
  else
  {
    v14 = 0;
    v15 = v13 >> 5;
    v16 = (int16x8_t)vdupq_n_s32((v7 << 16) | 0xFFFFu);
    v17 = vdupq_n_s32(v6);
    v18 = vdupq_n_s32(v8);
    v19 = 0uLL;
    v20.i64[0] = -1;
    v20.i64[1] = -1;
    v21 = vceqq_s16(v16, v20);
    v22 = vmovn_s16(v21);
    v23.i64[0] = 0xFF000000FFLL;
    v23.i64[1] = 0xFF000000FFLL;
    __asm { FMOV            V6.4S, #1.0 }
    v29 = (float32x4_t)vdupq_n_s32(0x3F36DB6Eu);
    v30 = 0uLL;
    do
    {
      v31 = *(_QWORD *)(*(_QWORD *)value + 32) + 32 * v14;
      v32 = *(int8x16_t *)v31;
      v33 = *(int16x8_t *)(v31 + 16);
      v34 = (int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(*(int16x8_t *)v31, v16)), v22));
      v35 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v33, v16), (int8x16_t)v21);
      v36 = (int8x16_t *)(v11 + 32 * v14);
      v37 = vabdq_s32((int32x4_t)vandq_s8(v32, v23), v17);
      v38 = vcltzq_s16(vshlq_n_s16(v34, 0xFuLL));
      v39 = vabdq_s32((int32x4_t)vandq_s8((int8x16_t)v33, v23), v17);
      v40 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v39), v39)), a4);
      v41 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v37), v37)), a4);
      v42 = vmlaq_f32(_Q6, v41, v41);
      v43 = vmulq_f32(vmlaq_f32(_Q6, v40, v40), v29);
      v44 = vmulq_f32(v42, v29);
      v45 = vrecpeq_f32(v44);
      v46 = vmulq_f32(v45, vrecpsq_f32(v44, v45));
      v47 = vrecpeq_f32(v43);
      v30 = vaddq_f32(v30, vmulq_f32(vmulq_f32(v47, vrecpsq_f32(v43, v47)), (float32x4_t)vandq_s8(vandq_s8(v36[1], (int8x16_t)v35), (int8x16_t)vrev32q_s16(v35))));
      v19 = vaddq_f32(v19, vmulq_f32(v46, (float32x4_t)vandq_s8(vandq_s8(*v36, (int8x16_t)v38), (int8x16_t)vrev32q_s16(v38))));
      ++v14;
    }
    while (v15 > v14);
  }
  v52 = v30;
  v54 = v19;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  v48 = (int8x16_t)vaddq_f32(v54, v52);
  result = vaddv_f32(vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)));
  if (fabsf(result) == INFINITY)
    return 0.0;
  return result;
}

- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4;
  uint64_t v5;
  pthread_mutex_t *v6;
  float v7;
  uint64_t **value;

  v4 = a4;
  v5 = a3;
  value = (uint64_t **)self->_guardedData.__ptr_.__value_;
  v6 = (pthread_mutex_t *)(value + 1);
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  v7 = entropy(&value, v5, v4);
  pthread_mutex_unlock(v6);
  return v7;
}

- (void)enumerate:(id)a3
{
  char *value;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  id v11;

  v11 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v5 = *(_QWORD *)value;
  v6 = *(_BYTE *)(*(_QWORD *)value + 64);
  *(_BYTE *)(v5 + 64) = 1;
  if (*(_QWORD *)(v5 + 56))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      if (*(float *)(*(_QWORD *)v5 + 4 * v7) > 0.0)
      {
        v9 = *(_DWORD *)(*(_QWORD *)(v5 + 32) + 4 * v7);
        (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, HIWORD(v9), (unsigned __int16)v9);
        v5 = *(_QWORD *)value;
      }
      v7 = v8;
    }
    while (*(_QWORD *)(v5 + 56) > (unint64_t)v8++);
  }
  *(_BYTE *)(v5 + 64) = v6;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

}

- (int)countWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  float v4;
  int v5;
  char *value;
  pthread_mutex_t *v7;
  _QWORD v9[5];
  unsigned __int16 v10;
  _QWORD v11[5];
  unsigned __int16 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  if ((a4 & a3) == 0xFFFF)
  {
    value = (char *)self->_guardedData.__ptr_.__value_;
    v7 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    v5 = *(_DWORD *)(*(_QWORD *)value + 24);
    pthread_mutex_unlock(v7);
    return v5;
  }
  if (a3 == 0xFFFF)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__ATXHistogramData_countWhereA_b___block_invoke;
    v11[3] = &unk_1E82E4D60;
    v12 = a4;
    v11[4] = &v13;
    -[ATXHistogramData enumerate:](self, "enumerate:", v11);
LABEL_8:
    v5 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);
    return v5;
  }
  if (a4 == 0xFFFF)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__ATXHistogramData_countWhereA_b___block_invoke_2;
    v9[3] = &unk_1E82E4D60;
    v10 = a3;
    v9[4] = &v13;
    -[ATXHistogramData enumerate:](self, "enumerate:", v9);
    goto LABEL_8;
  }
  -[ATXHistogramData lookupUnsmoothedA:b:](self, "lookupUnsmoothedA:b:");
  return v4 > 0.0;
}

uint64_t __34__ATXHistogramData_countWhereA_b___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(result + 40) == a3)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __34__ATXHistogramData_countWhereA_b___block_invoke_2(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 40) == a2)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4;
  int v5;
  char *value;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v14;
  BOOL v15;

  if ((a4 & a3) == 0xFFFF)
  {
    -[ATXHistogramData clear](self, "clear");
  }
  else
  {
    v4 = a4;
    v5 = a3;
    value = (char *)self->_guardedData.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    v7 = *(_QWORD **)value;
    if (*(_BYTE *)(*(_QWORD *)value + 64))
    {
      __break(1u);
    }
    else
    {
      v8 = v7[3];
      if (v8)
      {
        v9 = 0;
        v10 = 0;
        v11 = v7[4];
        do
        {
          v12 = *(_DWORD *)(v11 + 4 * v9);
          v14 = v4 == 0xFFFF || v4 == (unsigned __int16)*(_DWORD *)(v11 + 4 * v9);
          v15 = HIWORD(v12) == v5 || v5 == 0xFFFF;
          if (!v15 || !v14)
          {
            *(_DWORD *)(v11 + 4 * v10) = v12;
            *(_DWORD *)(*v7 + 4 * v10++) = *(_DWORD *)(*v7 + 4 * v9);
          }
          ++v9;
        }
        while (v8 != v9);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)v7, v10);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(_QWORD *)value + 32, v10);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
    }
  }
}

- (void)decayByFactor:(float)a3
{
  char *value;
  uint64_t v4;
  unint64_t v5;
  float32x4_t *v6;
  float32x4_t v7;

  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(_BYTE *)(*(_QWORD *)value + 64))
  {
    __break(1u);
  }
  else
  {
    v4 = **(_QWORD **)value;
    if (*(_QWORD *)(*(_QWORD *)value + 8) != v4)
    {
      v5 = 0;
      do
      {
        v6 = (float32x4_t *)(v4 + 32 * v5);
        v7 = vmulq_n_f32(v6[1], a3);
        *v6 = vmulq_n_f32(*v6, a3);
        v6[1] = v7;
        ++v5;
        v4 = **(_QWORD **)value;
      }
      while (v5 < (*(_QWORD *)(*(_QWORD *)value + 8) - v4) >> 5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (void)decayWithHalfLifeInDays:(float)a3
{
  long double v4;

  v4 = exp2(-1.0 / a3);
  *(float *)&v4 = v4;
  -[ATXHistogramData decayByFactor:](self, "decayByFactor:", (double)v4);
}

- (id)aSet
{
  void *v3;
  char *value;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v9;

  v3 = (void *)objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v5 = *(_QWORD *)value;
  if (*(_QWORD *)(*(_QWORD *)value + 56))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v3, "addIndex:", *(unsigned __int16 *)(*(_QWORD *)(v5 + 32) + 4 * v6 + 2));
      v6 = v7;
      v5 = *(_QWORD *)value;
    }
    while (*(_QWORD *)(*(_QWORD *)value + 56) > (unint64_t)v7++);
  }
  v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (id)bSet
{
  void *v3;
  char *value;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v9;

  v3 = (void *)objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v5 = *(_QWORD *)value;
  if (*(_QWORD *)(*(_QWORD *)value + 56))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v3, "addIndex:", *(unsigned __int16 *)(*(_QWORD *)(v5 + 32) + 4 * v6));
      v6 = v7;
      v5 = *(_QWORD *)value;
    }
    while (*(_QWORD *)(*(_QWORD *)value + 56) > (unint64_t)v7++);
  }
  v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (ATXHistogramData)initWithCoder:(id)a3
{
  id v4;
  ATXHistogramData *v5;
  uint64_t v6;
  void ***value;
  int v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  ATXHistogramData *v36;
  void *context;

  v4 = a3;
  v5 = -[ATXHistogramData init](self, "init");
  if (!v5)
    goto LABEL_23;
  v6 = MEMORY[0x1CAA48B6C]();
  value = (void ***)v5->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("count"));
  context = (void *)v6;
  if (!v8)
    goto LABEL_15;
  v9 = v8;
  _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)*value, v8);
  _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)(*value + 4), v9);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scores"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  if (v11 == 4 * v9)
  {
    if (v10)
    {
      v12 = **value;
      v13 = objc_retainAutorelease(v10);
      memcpy(v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length") == v11)
    {
      if (v14)
      {
        v15 = (*value)[4];
        v16 = objc_retainAutorelease(v14);
        memcpy(v15, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
      }
      v17 = (unint64_t)(*value)[3];
      if (v17)
      {
        v18 = 0;
        v19 = **value;
        do
        {
          if (fabsf(*(float *)&v19[v18]) == INFINITY)
            v19[v18] = 0;
          ++v18;
        }
        while (v17 > v18);
      }

LABEL_15:
      v20 = 1;
      goto LABEL_22;
    }
    __atxlog_handle_default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ATXHistogramData initWithCoder:].cold.1(v21, v29, v30, v31, v32, v33, v34, v35);
    v10 = v14;
  }
  else
  {
    __atxlog_handle_default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ATXHistogramData initWithCoder:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
  }

  v20 = 0;
LABEL_22:
  pthread_mutex_unlock((pthread_mutex_t *)(value + 1));
  objc_autoreleasePoolPop(context);
  if ((v20 & 1) == 0)
  {
    v36 = 0;
    goto LABEL_25;
  }
LABEL_23:
  v36 = v5;
LABEL_25:

  return v36;
}

- (ATXHistogramData)initWithTimeHistogram:(id)a3
{
  id v5;
  ATXHistogramData *v6;
  ATXHistogramData *v7;
  void *v9;
  _QWORD v10[4];
  ATXHistogramData *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("histogram"));

  }
  v6 = -[ATXHistogramData init](self, "init");
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__ATXHistogramData_initWithTimeHistogram___block_invoke;
    v10[3] = &unk_1E82E4D88;
    v11 = v6;
    objc_msgSend(v5, "enumerate:", v10);

  }
  return v7;
}

uint64_t __42__ATXHistogramData_initWithTimeHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(float *)&a4 = a4;
  return objc_msgSend(*(id *)(a1 + 32), "add:a:b:", a2, a3, a4);
}

- (ATXHistogramData)initWithCategoricalHistogram:(id)a3
{
  id v5;
  ATXHistogramData *v6;
  ATXHistogramData *v7;
  void *v9;
  _QWORD v10[4];
  ATXHistogramData *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 603, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("histogram"));

  }
  v6 = -[ATXHistogramData init](self, "init");
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__ATXHistogramData_initWithCategoricalHistogram___block_invoke;
    v10[3] = &unk_1E82E4D88;
    v11 = v6;
    objc_msgSend(v5, "enumerate:", v10);

  }
  return v7;
}

uint64_t __49__ATXHistogramData_initWithCategoricalHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(float *)&a4 = a4;
  return objc_msgSend(*(id *)(a1 + 32), "add:a:b:", a2, a3, a4);
}

- (void)applyPermutationToA:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  char *value;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXHistogramData applyPermutationToA:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_15;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v10 = *(_QWORD *)value;
  if (!*(_BYTE *)(*(_QWORD *)value + 64))
  {
    if (*(_QWORD *)(v10 + 56))
    {
      v11 = 0;
      v12 = 1;
      do
      {
        v13 = *(_QWORD *)(v10 + 32);
        v14 = (unint64_t)*(unsigned int *)(v13 + 4 * v11) >> 16;
        if (HIWORD(*(_DWORD *)(v13 + 4 * v11)) >= (unsigned __int16)(v8 >> 1))
        {
          __atxlog_handle_default();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            v26 = v14;
            v27 = 1024;
            v28 = (unsigned __int16)(v8 >> 1);
            _os_log_error_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_ERROR, "%u not found in permutation of length %u", buf, 0xEu);
          }

          v10 = *(_QWORD *)value;
        }
        else
        {
          *(_DWORD *)(v13 + 4 * v11) = (unsigned __int16)*(_DWORD *)(v13 + 4 * v11) | (*(unsigned __int16 *)(v7 + 2 * v14) << 16);
        }
        v11 = v12;
      }
      while (*(_QWORD *)(v10 + 56) > (unint64_t)v12++);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
LABEL_15:

    return;
  }
  __break(1u);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(void **)&self->_anon_8[32];
  if (v3)
  {
    *(_QWORD *)&self->_anon_8[40] = v3;
    free(v3);
  }
  v4 = *(void **)self->_anon_8;
  if (v4)
  {
    *(_QWORD *)&self->_anon_8[8] = v4;
    free(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "invalid input for abs in initWithCoder", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "invalid input for scores in initWithCoder", a5, a6, a7, a8, 0);
}

- (void)applyPermutationToA:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "invalid input for applyPermutationToA: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
