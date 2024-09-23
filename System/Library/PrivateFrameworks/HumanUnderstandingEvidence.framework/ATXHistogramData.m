@implementation ATXHistogramData

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
  pthread_mutexattr_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
    v13.__sig = 0;
    *(_QWORD *)v13.__opaque = 0;
    pthread_mutexattr_init(&v13);
    pthread_mutexattr_settype(&v13, 2);
    pthread_mutex_init((pthread_mutex_t *)(v9 + 8), &v13);
    pthread_mutexattr_destroy(&v13);
    v11 = 0;
    sub_1C1265B14((uint64_t *)v3 + 10, v9);
    sub_1C1265B14(&v11, 0);
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
    sub_1C1265B74(*(_QWORD *)value, 0);
    sub_1C1265DA4(*(_QWORD *)value + 32, 0);
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
          sub_1C1265B74(*(_QWORD *)value, v13 + 1);
          *(float *)(*v10 + 4 * v13) = fmaxf(a3, 0.0);
          v14 = (_QWORD *)(*(_QWORD *)value + 32);
          v15 = *(_QWORD *)(*(_QWORD *)value + 56);
          sub_1C1265DA4((uint64_t)v14, v15 + 1);
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
  uint64_t v30;
  int8x16_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int8x16_t *v35;
  int16x8_t v36;
  int32x4_t v37;
  int32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  int8x16_t v47;
  float result;
  void *v50;
  float32x4_t v51;
  float32x4_t v53;

  v6 = a6;
  v7 = a5;
  v8 = a3;
  if (a6 == 0xFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("b != SUMALL"));

  }
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v11 = **(_QWORD **)value;
  v12 = *(_QWORD *)(*(_QWORD *)value + 8);
  v13 = v12 - v11;
  if (v12 == v11)
  {
    v19 = 0uLL;
    v29 = 0uLL;
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
    v29 = 0uLL;
    do
    {
      v30 = *(_QWORD *)(*(_QWORD *)value + 32) + 32 * v14;
      v31 = *(int8x16_t *)v30;
      v32 = *(int16x8_t *)(v30 + 16);
      v33 = (int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(*(int16x8_t *)v30, v16)), v22));
      v34 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v32, v16), (int8x16_t)v21);
      v35 = (int8x16_t *)(v11 + 32 * v14);
      v36 = vcltzq_s16(vshlq_n_s16(v33, 0xFuLL));
      v37 = vabdq_s32((int32x4_t)vandq_s8(v31, v23), v17);
      v38 = vabdq_s32((int32x4_t)vandq_s8((int8x16_t)v32, v23), v17);
      v39 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v37), v37)), a4);
      v40 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v38), v38)), a4);
      v41 = vmlaq_f32(_Q6, v40, v40);
      v42 = vmlaq_f32(_Q6, v39, v39);
      v43 = (float32x4_t)vandq_s8(vandq_s8(*v35, (int8x16_t)v36), (int8x16_t)vrev32q_s16(v36));
      v44 = vrecpeq_f32(v42);
      v45 = vmulq_f32(v44, vrecpsq_f32(v42, v44));
      v46 = vrecpeq_f32(v41);
      v29 = vaddq_f32(v29, vmulq_f32(vmulq_f32(v46, vrecpsq_f32(v41, v46)), (float32x4_t)vandq_s8(vandq_s8(v35[1], (int8x16_t)v34), (int8x16_t)vrev32q_s16(v34))));
      v19 = vaddq_f32(v19, vmulq_f32(v45, v43));
      ++v14;
    }
    while (v15 > v14);
  }
  v51 = v29;
  v53 = v19;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  v47 = (int8x16_t)vaddq_f32(v53, v51);
  result = vaddv_f32(vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL)));
  if (fabsf(result) == INFINITY)
    return 0.0;
  return result;
}

- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4;
  int v5;
  pthread_mutex_t *v6;
  float v7;
  uint64_t **value;

  v4 = a4;
  v5 = a3;
  value = (uint64_t **)self->_guardedData.__ptr_.__value_;
  v6 = (pthread_mutex_t *)(value + 1);
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  v7 = sub_1C1266140(&value, v5, v4);
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
    v11[2] = sub_1C12660F8;
    v11[3] = &unk_1E7A7BA70;
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
    v9[2] = sub_1C126611C;
    v9[3] = &unk_1E7A7BA70;
    v10 = a3;
    v9[4] = &v13;
    -[ATXHistogramData enumerate:](self, "enumerate:", v9);
    goto LABEL_8;
  }
  -[ATXHistogramData lookupUnsmoothedA:b:](self, "lookupUnsmoothedA:b:");
  return v4 > 0.0;
}

- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4;
  int v5;
  char *value;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v13;
  BOOL v14;

  if ((a4 & a3) == 0xFFFF)
    goto _objc_msgSend$clear;
  v4 = a4;
  v5 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  self = *(ATXHistogramData **)value;
  if (*(_BYTE *)(*(_QWORD *)value + 64))
  {
    __break(1u);
_objc_msgSend$clear:
    MEMORY[0x1E0DE7D20](self, sel_clear);
    return;
  }
  v7 = *(_QWORD *)&self->_anon_8[16];
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)&self->_anon_8[24];
    do
    {
      v11 = *(_DWORD *)(v10 + 4 * v8);
      v13 = v4 == 0xFFFF || v4 == (unsigned __int16)*(_DWORD *)(v10 + 4 * v8);
      v14 = HIWORD(v11) == v5 || v5 == 0xFFFF;
      if (!v14 || !v13)
      {
        *(_DWORD *)(v10 + 4 * v9) = v11;
        *((_DWORD *)self->super.isa + v9++) = *((_DWORD *)self->super.isa + v8);
      }
      ++v8;
    }
    while (v7 != v8);
    sub_1C1265B74((uint64_t)self, v9);
    sub_1C1265DA4(*(_QWORD *)value + 32, v9);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
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
  exp2(-1.0 / a3);
  MEMORY[0x1E0DE7D20](self, sel_decayByFactor_);
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
  id v5;
  ATXHistogramData *v6;
  void *v7;
  void ***value;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  void *v21;
  void *v22;
  SEL v23;
  void *v24;

  v5 = a3;
  v6 = -[ATXHistogramData init](self, "init");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1C3BA8890]();
    value = (void ***)v6->_guardedData.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)(value + 1));
    v9 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("count"));
    if (!v9)
    {
LABEL_15:
      pthread_mutex_unlock((pthread_mutex_t *)(value + 1));
      objc_autoreleasePoolPop(v7);
      goto LABEL_16;
    }
    v10 = v9;
    sub_1C1265B74((uint64_t)*value, v9);
    sub_1C1265DA4((uint64_t)(*value + 4), v10);
    v23 = a2;
    v24 = v7;
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scores"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length") == 4 * v10)
    {
      if (!v11)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, v6, CFSTR("ATXHistogramData.mm"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length == count * sizeof(sp->scores[0])"));

      if (!v11)
      {
LABEL_6:
        objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abs"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length") == 4 * v10)
        {
          if (!v14)
          {
LABEL_9:
            v17 = (unint64_t)(*value)[3];
            v7 = v24;
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

            goto LABEL_15;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, v6, CFSTR("ATXHistogramData.mm"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length == count * sizeof(sp->abs[0])"));

          if (!v14)
            goto LABEL_9;
        }
        v15 = (*value)[4];
        v16 = objc_retainAutorelease(v14);
        memcpy(v15, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
        goto LABEL_9;
      }
    }
    v12 = **value;
    v13 = objc_retainAutorelease(v11);
    memcpy(v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    goto LABEL_6;
  }
LABEL_16:

  return v6;
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

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  sub_1C1265B14((uint64_t *)&self->_guardedData, 0);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
