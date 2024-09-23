@implementation MDLVoxelArray

- (void)recalculateExtents
{
  int8x16_t v2;
  unsigned __int8 *anon_60;
  __int128 v4;
  char *next;
  int32x4_t v6;
  int8x16_t v7;
  int v8;
  uint64x2_t v9;
  uint64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  uint64x2_t v14;
  const double *v15;
  int v16;
  int8x16_t v17;
  int8x16_t v18;
  uint64_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int64x2_t v26;
  uint64x2_t v27;
  int64x2_t v28;
  uint64x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x8_t v37;
  int8x16_t v38;
  int8x8_t v39;
  int8x16_t v40;
  int8x8_t v41;
  int v42;
  int8x16_t v43;
  int8x16_t v44;
  int8x16_t v45;
  __int128 v46;
  float32x4_t v47;
  float32x4_t v53;

  anon_60 = self->_anon_60;
  *(_QWORD *)&v4 = 0x8000000080000000;
  *((_QWORD *)&v4 + 1) = 0x8000000080000000;
  *(_OWORD *)self->_anon_60 = v4;
  *(int32x4_t *)&self->_anon_60[16] = vdupq_n_s32(0x80000001);
  if (self->_voxels.__table_.__p2_.__value_)
  {
    next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
    if (next)
    {
      v6 = vdupq_n_s32(0x80000001);
      v2.i64[0] = 0x8000000080000000;
      v7.i64[0] = 0x8000000080000000;
      v7.i64[1] = 0x8000000080000000;
      v8 = 0x7FFFFFFF;
      v9 = (uint64x2_t)vdupq_n_s64(1uLL);
      v10 = (uint64x2_t)vdupq_n_s64(2uLL);
      v11 = vdupq_n_s64(4uLL);
      v12 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      v13 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      v14 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      do
      {
        v15 = (const double *)(next + 16);
        v16 = *((_DWORD *)next + 6);
        v17 = (int8x16_t)vld1q_dup_f64(v15);
        v18 = 0uLL;
        v19 = 24;
        v20 = (int64x2_t)xmmword_1DCC57020;
        v21 = (int64x2_t)xmmword_1DCC57010;
        v22 = (int64x2_t)xmmword_1DCC57000;
        v23 = (int64x2_t)xmmword_1DCC56FF0;
        v24 = 0uLL;
        v25 = 0uLL;
        do
        {
          v26 = v23;
          v27.i64[0] = 3 * v23.i64[0];
          v28 = v22;
          v27.i64[1] = 3 * v26.i64[1];
          v29.i64[0] = 3 * v22.i64[0];
          v29.i64[1] = 3 * v28.i64[1];
          v30 = v25;
          v31 = v24;
          v32 = v18;
          v18 = vorrq_s8(v18, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v9, v29), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v9, v27), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v26, v26)))));
          v33 = vaddq_s64((int64x2_t)v27, v21);
          v34 = vaddq_s64((int64x2_t)v29, v20);
          v25 = vorrq_s8(v25, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v29), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v27), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v33))));
          v24 = vorrq_s8(v24, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v29), v17), (uint64x2_t)vsubq_s64(v12, v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v27), v17), (uint64x2_t)vsubq_s64(v12, v33))));
          v21 = vaddq_s64(v21, v13);
          v20 = vaddq_s64(v20, v13);
          v23 = vaddq_s64(v26, v11);
          v22 = vaddq_s64(v28, v11);
          v19 -= 4;
        }
        while (v19);
        v35 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v14, (uint64x2_t)v28), (int32x4_t)vcgtq_u64(v14, (uint64x2_t)v26));
        v36 = vbslq_s8(v35, v18, v32);
        v37 = vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
        if ((v37.i32[0] | v37.i32[1]) > v6.i32[0])
        {
          v6.i32[0] = v37.i32[0] | v37.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        v38 = vbslq_s8(v35, v25, v30);
        v39 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        if ((v39.i32[0] | v39.i32[1]) > v6.i32[1])
        {
          v6.i32[1] = v39.i32[0] | v39.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        v40 = vbslq_s8(v35, v24, v31);
        v41 = vorr_s8(*(int8x8_t *)v40.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
        v42 = v41.i32[0] | v41.i32[1];
        if ((v41.i32[0] | v41.i32[1]) > v6.i32[2])
        {
          v6.i32[2] = v41.i32[0] | v41.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        if (v16 > v6.i32[3])
        {
          v6.i32[3] = v16;
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        if ((v37.i32[0] | v37.i32[1]) < v7.i32[0])
        {
          v43 = v7;
          v43.i32[0] = v37.i32[0] | v37.i32[1];
          *(int8x16_t *)anon_60 = v43;
          v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[0] = v2.i32[0];
          v2.i64[0] = v7.i64[0];
          v8 = v37.i32[0] | v37.i32[1];
          v7 = v43;
        }
        if ((v39.i32[0] | v39.i32[1]) < v7.i32[1])
        {
          v8 = v7.i32[0];
          v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[1] = v39.i32[0] | v39.i32[1];
          *(int8x16_t *)anon_60 = v7;
          v2.i32[1] = v39.i32[0] | v39.i32[1];
        }
        if (v42 < v7.i32[2])
        {
          v44 = v7;
          v44.i32[2] = v42;
          *(int8x16_t *)anon_60 = v44;
          v8 = v7.i32[0];
          v7.i32[0] = v42;
          v2.i64[0] = v7.i64[0];
          v7 = v44;
        }
        if (v16 < v7.i32[3])
        {
          v45 = v7;
          v45.i32[3] = v16;
          *(int8x16_t *)anon_60 = v45;
          v8 = v7.i32[0];
          v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[0] = v2.i32[0];
          v2.i64[0] = v7.i64[0];
          v7 = v45;
        }
        next = *(char **)next;
      }
      while (next);
    }
    else
    {
      v2.i64[0] = 0x8000000080000000;
      v8 = 0x7FFFFFFF;
    }
    v47 = (float32x4_t)v2;
    v47.i32[0] = v8;
    *(float32x2_t *)v47.f32 = vcvt_f32_s32(*(int32x2_t *)v47.f32);
    v47.f32[2] = (float)v2.i32[0];
    __asm { FMOV            V1.4S, #1.0 }
    v53 = vaddq_f32(v47, _Q1);
    *(float32x4_t *)&self->_anon_80[16] = vmlaq_n_f32(*(float32x4_t *)self->_originatingOffset, v53, self->_voxelExtent);
    *(float32x2_t *)v53.f32 = vcvt_f32_s32(*(int32x2_t *)&self->_anon_60[16]);
    v53.f32[2] = (float)*(int *)&self->_anon_60[24];
    *(float32x4_t *)self->_anon_80 = vmlaq_n_f32(*(float32x4_t *)self->_originatingOffset, vaddq_f32(v53, _Q1), self->_voxelExtent);
  }
  else
  {
    *(_QWORD *)&v46 = 0x80000000800000;
    *((_QWORD *)&v46 + 1) = 0x80000000800000;
    *(_OWORD *)self->_anon_80 = v46;
    *(int32x4_t *)&self->_anon_80[16] = vdupq_n_s32(0x7F7FFFFFu);
  }
}

- (MDLVoxelArray)init
{
  MDLVoxelArray *v2;
  MDLVoxelArray *v3;
  uint64_t v4;
  MortonCode *p_mortonCoder;
  unint64_t *begin;
  unint64_t *v7;
  unint64_t *v8;
  Octree *value;
  MDLVoxelArray *v15;
  void *v17[2];
  _BYTE __p[24];
  unint64_t *v19;
  __int128 v20;
  unint64_t *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MDLVoxelArray;
  v2 = -[MDLObject init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)v17 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    sub_1DCBD192C((uint64_t)&v2->_voxels, (uint64_t *)v17);
    sub_1DCAE6B78((uint64_t)v17);
    sub_1DCB56BA8(v17, v4);
    p_mortonCoder = &v3->mortonCoder;
    begin = v3->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v3->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v3->mortonCoder.mortonkeyX.__end_ = 0;
      v3->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v17;
    v3->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v17[0] = 0;
    v17[1] = 0;
    *(_QWORD *)__p = 0;
    v7 = v3->mortonCoder.mortonkeyY.__begin_;
    if (v7)
    {
      v3->mortonCoder.mortonkeyY.__end_ = v7;
      operator delete(v7);
      v3->mortonCoder.mortonkeyY.__begin_ = 0;
      v3->mortonCoder.mortonkeyY.__end_ = 0;
      v3->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v3->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v3->mortonCoder.mortonkeyY.__end_cap_.__value_ = v19;
    *(_QWORD *)&__p[8] = 0;
    *(_QWORD *)&__p[16] = 0;
    v19 = 0;
    v8 = v3->mortonCoder.mortonkeyZ.__begin_;
    if (v8)
    {
      v3->mortonCoder.mortonkeyZ.__end_ = v8;
      operator delete(v8);
      v3->mortonCoder.mortonkeyZ.__begin_ = 0;
      v3->mortonCoder.mortonkeyZ.__end_ = 0;
      v3->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
      v8 = *(unint64_t **)&__p[8];
    }
    *(_OWORD *)&v3->mortonCoder.mortonkeyZ.__begin_ = v20;
    v3->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v21;
    v20 = 0uLL;
    v21 = 0;
    if (v8)
    {
      *(_QWORD *)&__p[16] = v8;
      operator delete(v8);
    }
    if (v17[0])
    {
      v17[1] = v17[0];
      operator delete(v17[0]);
    }
    *(_QWORD *)v3->_anon_60 = 0;
    *(_QWORD *)&v3->_anon_60[8] = 0;
    *(_OWORD *)&v3->_anon_60[16] = xmmword_1DCC5A480;
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v3->_anon_80 = _Q1;
    *(_OWORD *)&v3->_anon_80[16] = 0u;
    *(_OWORD *)v3->_originatingOffset = 0u;
    v3->_voxelExtent = 1.0;
    value = v3->_octreeData.__ptr_.__value_;
    v3->_octreeData.__ptr_.__value_ = 0;
    if (value)
      sub_1DCBD19CC((uint64_t)&v3->_octreeData, value);
    v3->_levelSet = 0;
    v3->_interiorThickness = 0.0;
    v3->_exteriorThickness = 0.0;
    v15 = v3;
  }

  return v3;
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions patchRadius:(float)patchRadius
{
  MDLAsset *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  MDLVoxelArray *v20;
  MDLVoxelArray *v21;
  MDLVoxelArray *v22;
  uint64_t p_voxels;
  uint64_t v24;
  MortonCode *p_mortonCoder;
  unint64_t *begin;
  unint64_t *v27;
  unint64_t *v28;
  unsigned __int8 *anon_80;
  __int128 v30;
  uint64_t **p_octreeData;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __int128 v41;
  const char *v42;
  uint64_t v43;
  _QWORD *v44;
  MDLVoxelArray *v45;
  void *v47[2];
  _BYTE __p[24];
  unint64_t *v49;
  __int128 v50;
  unint64_t *v51;
  objc_super v52;

  v9 = asset;
  if (divisions <= 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v14, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v12, v13);

  }
  if (patchRadius < 0.0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v17, v18);

  }
  v52.receiver = self;
  v52.super_class = (Class)MDLVoxelArray;
  v20 = -[MDLObject init](&v52, sel_init);
  v21 = v20;
  v22 = v20;
  if (v20)
  {
    *(_OWORD *)v47 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    p_voxels = (uint64_t)&v20->_voxels;
    sub_1DCBD192C((uint64_t)&v20->_voxels, (uint64_t *)v47);
    sub_1DCAE6B78((uint64_t)v47);
    sub_1DCB56BA8(v47, v24);
    p_mortonCoder = &v21->mortonCoder;
    begin = v21->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v21->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v21->mortonCoder.mortonkeyX.__end_ = 0;
      v21->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v47;
    v21->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v47[0] = 0;
    v47[1] = 0;
    *(_QWORD *)__p = 0;
    v27 = v21->mortonCoder.mortonkeyY.__begin_;
    if (v27)
    {
      v21->mortonCoder.mortonkeyY.__end_ = v27;
      operator delete(v27);
      v21->mortonCoder.mortonkeyY.__begin_ = 0;
      v21->mortonCoder.mortonkeyY.__end_ = 0;
      v21->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v21->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v21->mortonCoder.mortonkeyY.__end_cap_.__value_ = v49;
    *(_QWORD *)&__p[8] = 0;
    *(_QWORD *)&__p[16] = 0;
    v49 = 0;
    v28 = v21->mortonCoder.mortonkeyZ.__begin_;
    if (v28)
    {
      v21->mortonCoder.mortonkeyZ.__end_ = v28;
      operator delete(v28);
      v21->mortonCoder.mortonkeyZ.__begin_ = 0;
      v21->mortonCoder.mortonkeyZ.__end_ = 0;
      v21->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v21->mortonCoder.mortonkeyZ.__begin_ = v50;
    v21->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v51;
    v50 = 0uLL;
    v51 = 0;
    if (*(_QWORD *)&__p[8])
    {
      *(_QWORD *)&__p[16] = *(_QWORD *)&__p[8];
      operator delete(*(void **)&__p[8]);
    }
    if (v47[0])
    {
      v47[1] = v47[0];
      operator delete(v47[0]);
    }
    *(_QWORD *)v21->_anon_60 = 0;
    *(_QWORD *)&v21->_anon_60[8] = 0;
    *(_OWORD *)&v21->_anon_60[16] = xmmword_1DCC5A480;
    anon_80 = v21->_anon_80;
    v30 = 0uLL;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)v21->_anon_80 = _Q0;
    *(_OWORD *)&v21->_anon_80[16] = 0u;
    v22->_voxelExtent = 1.0;
    p_octreeData = (uint64_t **)&v21->_octreeData;
    v37 = *p_octreeData;
    *p_octreeData = 0;
    if (v37)
    {
      sub_1DCBD19CC((uint64_t)p_octreeData, v37);
      v30 = 0uLL;
    }
    v22->_levelSet = 0;
    v22->_interiorThickness = 0.0;
    v22->_exteriorThickness = 0.0;
    *(_OWORD *)v22->_originatingOffset = v30;
    if (v9)
    {
      v38 = operator new();
      sub_1DCADED0C(v38, v9, divisions, patchRadius);
      v47[0] = 0;
      v39 = *p_octreeData;
      *p_octreeData = (uint64_t *)v38;
      if (v39)
      {
        sub_1DCBD19CC((uint64_t)p_octreeData, v39);
        v38 = (uint64_t)*p_octreeData;
      }
      v40 = *(_QWORD *)v38;
      if (*(_QWORD *)v38)
      {
        v22->_voxelExtent = *(float *)(v38 + 72);
        v41 = *(_OWORD *)(v40 + 32);
        *((_OWORD *)anon_80 + 1) = v41;
        *(_OWORD *)anon_80 = *(_OWORD *)(v40 + 16);
        *(_OWORD *)v22->_originatingOffset = v41;
        sub_1DCBC71B0(p_mortonCoder, p_voxels, **p_octreeData);
        objc_msgSend_recalculateExtents(v22, v42, v43);
        v44 = v47[0];
        v47[0] = 0;
        if (v44)
          sub_1DCBD19CC((uint64_t)v47, v44);
      }
    }
    v45 = v22;
  }

  return v22;
}

- (MDLVoxelArray)initWithData:(NSData *)voxelData boundingBox:(MDLAxisAlignedBoundingBox *)boundingBox voxelExtent:(float)voxelExtent
{
  float32x4_t v5;
  float v6;
  float v7;
  NSData *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  int16x4_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  MDLVoxelArray *v22;
  MDLVoxelArray *v23;
  uint64_t v24;
  MortonCode *p_mortonCoder;
  unint64_t *begin;
  unint64_t *v27;
  unint64_t *v28;
  Octree *value;
  NSData *v30;
  const char *v31;
  uint64_t v32;
  NSData *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  MDLVoxelArray *v44;
  float32x4_t v46;
  float32x4_t v47;
  void *v48[2];
  _BYTE __p[24];
  unint64_t *v50;
  __int128 v51;
  unint64_t *v52;
  objc_super v53;

  v7 = v6;
  v46 = v5;
  v47 = *(float32x4_t *)&voxelExtent;
  v10 = voxelData;
  if (v7 <= 0.0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v11, v15, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: voxelExtent must be greater than 0"), v13, v14);

  }
  v16 = vmovn_s32(vcgtq_f32(v47, v46));
  if ((v16.i8[0] & 1) == 0 || (v16.i8[2] & 1) == 0 || (v16.i8[4] & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v17, v21, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: maxBounds must be strictly greater than minBounds"), v19, v20);

  }
  v53.receiver = self;
  v53.super_class = (Class)MDLVoxelArray;
  v22 = -[MDLObject init](&v53, sel_init);
  v23 = v22;
  if (v22)
  {
    *(_OWORD *)v48 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    sub_1DCBD192C((uint64_t)&v22->_voxels, (uint64_t *)v48);
    sub_1DCAE6B78((uint64_t)v48);
    sub_1DCB56BA8(v48, v24);
    p_mortonCoder = &v23->mortonCoder;
    begin = v23->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v23->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v23->mortonCoder.mortonkeyX.__end_ = 0;
      v23->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v48;
    v23->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v48[0] = 0;
    v48[1] = 0;
    *(_QWORD *)__p = 0;
    v27 = v23->mortonCoder.mortonkeyY.__begin_;
    if (v27)
    {
      v23->mortonCoder.mortonkeyY.__end_ = v27;
      operator delete(v27);
      v23->mortonCoder.mortonkeyY.__begin_ = 0;
      v23->mortonCoder.mortonkeyY.__end_ = 0;
      v23->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v23->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v23->mortonCoder.mortonkeyY.__end_cap_.__value_ = v50;
    *(_QWORD *)&__p[8] = 0;
    *(_QWORD *)&__p[16] = 0;
    v50 = 0;
    v28 = v23->mortonCoder.mortonkeyZ.__begin_;
    if (v28)
    {
      v23->mortonCoder.mortonkeyZ.__end_ = v28;
      operator delete(v28);
      v23->mortonCoder.mortonkeyZ.__begin_ = 0;
      v23->mortonCoder.mortonkeyZ.__end_ = 0;
      v23->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v23->mortonCoder.mortonkeyZ.__begin_ = v51;
    v23->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v52;
    v51 = 0uLL;
    v52 = 0;
    if (*(_QWORD *)&__p[8])
    {
      *(_QWORD *)&__p[16] = *(_QWORD *)&__p[8];
      operator delete(*(void **)&__p[8]);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
    *(_QWORD *)v23->_anon_60 = 0;
    *(_QWORD *)&v23->_anon_60[8] = 0;
    *(_OWORD *)&v23->_anon_60[16] = xmmword_1DCC5A480;
    *(float32x4_t *)v23->_anon_80 = v47;
    *(float32x4_t *)&v23->_anon_80[16] = v46;
    *(_OWORD *)v23->_originatingOffset = 0u;
    v23->_voxelExtent = v7;
    value = v23->_octreeData.__ptr_.__value_;
    v23->_octreeData.__ptr_.__value_ = 0;
    if (value)
      sub_1DCBD19CC((uint64_t)&v23->_octreeData, value);
    v23->_levelSet = 0;
    v23->_interiorThickness = 0.0;
    v23->_exteriorThickness = 0.0;
    if (v10)
    {
      v30 = objc_retainAutorelease(v10);
      if (objc_msgSend_bytes(v30, v31, v32))
      {
        v33 = objc_retainAutorelease(v30);
        v36 = objc_msgSend_bytes(v33, v34, v35);
        v39 = objc_msgSend_length(v33, v37, v38);
        if (v39 >= 0x10)
        {
          v42 = v39 >> 4;
          do
          {
            if ((*(_DWORD *)v36 & 0x80000000) == 0
              && (*(_DWORD *)(v36 + 4) & 0x80000000) == 0
              && (*(_DWORD *)(v36 + 8) & 0x80000000) == 0)
            {
              v43 = HIDWORD(*(_OWORD *)v36);
              v48[0] = (void *)(p_mortonCoder->mortonkeyZ.__begin_[*(_QWORD *)(v36 + 8)] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)WORD2(*(_QWORD *)v36) >> 8)] | p_mortonCoder->mortonkeyZ.__begin_[BYTE1(*(_QWORD *)(v36 + 8))] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(*(_OWORD *)v36)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[BYTE4(*(_QWORD *)v36)] | p_mortonCoder->mortonkeyX.__begin_[*(_OWORD *)v36]);
              v48[1] = (void *)v43;
              sub_1DCBD1A20((uint64_t)&v23->_voxels, (unint64_t *)v48, (uint64_t)v48);
              v36 += 16;
            }
            --v42;
          }
          while (v42);
        }
        objc_msgSend_recalculateExtents(v23, v40, v41);
      }
    }
    v44 = v23;
  }

  return v23;
}

- (NSUInteger)count
{
  return self->_voxels.__table_.__p2_.__value_;
}

- (BOOL)voxelExistsAtIndex:(MDLVoxelIndex)index allowAnyX:(BOOL)allowAnyX allowAnyY:(BOOL)allowAnyY allowAnyZ:(BOOL)allowAnyZ allowAnyShell:(BOOL)allowAnyShell
{
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  MortonCode *p_mortonCoder;
  char *next;
  uint64x2_t v12;
  uint64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  uint64x2_t v17;
  const double *v18;
  int8x16_t v19;
  int8x16_t v20;
  uint64_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int64x2_t v28;
  uint64x2_t v29;
  int64x2_t v30;
  uint64x2_t v31;
  int8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x8_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64x2_t v44;
  int8x16_t v45;
  _BOOL4 v46;
  BOOL v47;
  unint64_t v48;

  p_voxels = &self->_voxels;
  if (allowAnyX || allowAnyY || allowAnyZ || allowAnyShell)
  {
    next = (char *)p_voxels->__table_.__p1_.__value_.__next_;
    if (next)
    {
      v12 = (uint64x2_t)vdupq_n_s64(1uLL);
      v13 = (uint64x2_t)vdupq_n_s64(2uLL);
      v14 = vdupq_n_s64(4uLL);
      v15 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      v16 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      v17 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      while (1)
      {
        v18 = (const double *)(next + 16);
        v19 = (int8x16_t)vld1q_dup_f64(v18);
        v20 = 0uLL;
        v21 = 24;
        v22 = (int64x2_t)xmmword_1DCC57020;
        v23 = (int64x2_t)xmmword_1DCC57010;
        v24 = (int64x2_t)xmmword_1DCC57000;
        v25 = (int64x2_t)xmmword_1DCC56FF0;
        v26 = 0uLL;
        v27 = 0uLL;
        do
        {
          v28 = v25;
          v29.i64[0] = 3 * v25.i64[0];
          v30 = v24;
          v29.i64[1] = 3 * v28.i64[1];
          v31.i64[0] = 3 * v24.i64[0];
          v31.i64[1] = 3 * v30.i64[1];
          v32 = v27;
          v33 = v26;
          v34 = v20;
          v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v12, v31), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v30, v30))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v12, v29), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28)))));
          v35 = vaddq_s64((int64x2_t)v29, v23);
          v36 = vaddq_s64((int64x2_t)v31, v22);
          v27 = vorrq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v31), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v29), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v35))));
          v26 = vorrq_s8(v26, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v14, v31), v19), (uint64x2_t)vsubq_s64(v15, v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v14, v29), v19), (uint64x2_t)vsubq_s64(v15, v35))));
          v23 = vaddq_s64(v23, v16);
          v22 = vaddq_s64(v22, v16);
          v25 = vaddq_s64(v28, v14);
          v24 = vaddq_s64(v30, v14);
          v21 -= 4;
        }
        while (v21);
        v37 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v17, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v17, (uint64x2_t)v28));
        v38 = vbslq_s8(v37, v27, v32);
        v39 = vbslq_s8(v37, v20, v34);
        v40 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        *(int8x8_t *)v39.i8 = vorr_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL));
        v41 = (v39.i32[0] | v39.i32[1]) == index.i32[0] || allowAnyX;
        v42 = (v40.i32[0] | v40.i32[1]) == index.i32[1] || allowAnyY;
        if (v41 && v42)
        {
          v44 = (uint64x2_t)vdupq_n_s64(0x15uLL);
          v45 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v44, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v44, (uint64x2_t)v28)), v26, v33);
          *(int8x8_t *)v45.i8 = vorr_s8(*(int8x8_t *)v45.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
          v46 = (v45.i32[0] | v45.i32[1]) == index.i32[2] || allowAnyZ;
          v47 = *((_DWORD *)next + 6) == index.i32[3] || allowAnyShell;
          if (v46 && v47)
            break;
        }
        next = *(char **)next;
        if (!next)
          return 0;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    p_mortonCoder = &self->mortonCoder;
    v48 = p_mortonCoder->mortonkeyZ.__begin_[index.u8[8]] | ((p_mortonCoder->mortonkeyY.__begin_[index.u8[5]] | p_mortonCoder->mortonkeyZ.__begin_[index.u8[9]] | p_mortonCoder->mortonkeyX.__begin_[index.u8[1]]) << 24) | p_mortonCoder->mortonkeyY.__begin_[index.u8[4]] | p_mortonCoder->mortonkeyX.__begin_[index.u8[0]];
    return sub_1DCAE745C(p_voxels, &v48) != 0;
  }
}

- (NSData)voxelsWithinExtent:(MDLVoxelIndexExtent)extent
{
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  char *next;
  id v5;
  uint64x2_t v6;
  uint64x2_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;
  const double *v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int64x2_t v21;
  uint64x2_t v22;
  int64x2_t v23;
  uint64x2_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int64x2_t v28;
  int64x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int32x4_t v33;
  __int32 v34;
  unsigned int v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int32x4_t *v42;
  uint64x2_t v43;
  uint64x2_t v44;
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  const double *v48;
  int8x16_t v49;
  int8x16_t v50;
  uint64_t v51;
  int64x2_t v52;
  int64x2_t v53;
  int64x2_t v54;
  int64x2_t v55;
  int8x16_t v56;
  int8x16_t v57;
  int64x2_t v58;
  uint64x2_t v59;
  int64x2_t v60;
  uint64x2_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int64x2_t v65;
  int64x2_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16_t v69;
  int32x4_t v70;
  __int32 v71;
  uint64x2_t v73;
  int64x2_t v74;
  uint64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  int64x2_t v78;
  uint64x2_t v79;
  int64x2_t v80;
  uint64x2_t v81;
  int64x2_t v82;
  uint64x2_t v83;
  uint64x2_t v84;
  int32x4_t v85;
  int32x4_t v86[2];

  v86[0] = (int32x4_t)extent.minimumExtent;
  v86[1] = (int32x4_t)extent.maximumExtent;
  p_voxels = &self->_voxels;
  next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v5 = 0;
    v6 = (uint64x2_t)vdupq_n_s64(1uLL);
    v7 = (uint64x2_t)vdupq_n_s64(2uLL);
    v8 = vdupq_n_s64(4uLL);
    v9 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
    v10 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
    v75 = (uint64x2_t)vdupq_n_s64(0x15uLL);
    v83 = v7;
    v84 = v6;
    v80 = v9;
    v82 = v8;
    v78 = v10;
    do
    {
      v11 = (const double *)(next + 16);
      v12 = (int8x16_t)vld1q_dup_f64(v11);
      v13 = 0uLL;
      v14 = 24;
      v15 = (int64x2_t)xmmword_1DCC57020;
      v16 = (int64x2_t)xmmword_1DCC57010;
      v17 = (int64x2_t)xmmword_1DCC57000;
      v18 = (int64x2_t)xmmword_1DCC56FF0;
      v19 = 0uLL;
      v20 = 0uLL;
      do
      {
        v21 = v18;
        v22.i64[0] = 3 * v18.i64[0];
        v23 = v17;
        v22.i64[1] = 3 * v21.i64[1];
        v24.i64[0] = 3 * v17.i64[0];
        v24.i64[1] = 3 * v23.i64[1];
        v25 = v20;
        v26 = v19;
        v27 = v13;
        v13 = vorrq_s8(v13, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v6, v24), v12), (uint64x2_t)vnegq_s64(vaddq_s64(v23, v23))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v6, v22), v12), (uint64x2_t)vnegq_s64(vaddq_s64(v21, v21)))));
        v28 = vaddq_s64((int64x2_t)v22, v16);
        v29 = vaddq_s64((int64x2_t)v24, v15);
        v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v7, v24), v12), (uint64x2_t)vmvnq_s8((int8x16_t)v29)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v7, v22), v12), (uint64x2_t)vmvnq_s8((int8x16_t)v28))));
        v19 = vorrq_s8(v19, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v8, v24), v12), (uint64x2_t)vsubq_s64(v9, v29)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v8, v22), v12), (uint64x2_t)vsubq_s64(v9, v28))));
        v16 = vaddq_s64(v16, v10);
        v15 = vaddq_s64(v15, v10);
        v18 = vaddq_s64(v21, v8);
        v17 = vaddq_s64(v23, v8);
        v14 -= 4;
      }
      while (v14);
      v30 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v75, (uint64x2_t)v23), (int32x4_t)vcgtq_u64(v75, (uint64x2_t)v21));
      v31 = vbslq_s8(v30, v20, v25);
      v32 = vbslq_s8(v30, v19, v26);
      v33 = (int32x4_t)vbslq_s8(v30, v13, v27);
      *(int8x8_t *)v30.i8 = vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
      v34 = v30.i32[0] | v30.i32[1];
      *(int8x8_t *)v30.i8 = vorr_s8(*(int8x8_t *)v32.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL));
      *(int8x8_t *)v33.i8 = vorr_s8(*(int8x8_t *)v33.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v33, (int8x16_t)v33, 8uLL));
      v33.i32[0] |= v33.u32[1];
      v33.i32[1] = v34;
      v33.i32[2] = v30.i32[0] | v30.i32[1];
      v33.i32[3] = *((_DWORD *)next + 6);
      v35 = sub_1DCBC87D0(v86, v33);
      v10 = v78;
      v9 = v80;
      v8 = v82;
      v7 = v83;
      v6 = v84;
      v5 = (char *)v5 + v35;
      next = *(char **)next;
    }
    while (next);
    if (v5)
    {
      v36 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v5 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v36, v37, 16 * (_QWORD)v5));
      v40 = objc_msgSend_mutableBytes(v5, v38, v39);
      v41 = (char *)p_voxels->__table_.__p1_.__value_.__next_;
      if (v41)
      {
        v42 = (int32x4_t *)v40;
        v43 = (uint64x2_t)vdupq_n_s64(1uLL);
        v44 = (uint64x2_t)vdupq_n_s64(2uLL);
        v45 = vdupq_n_s64(4uLL);
        v46 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
        v47 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
        v73 = (uint64x2_t)vdupq_n_s64(0x15uLL);
        v74 = v47;
        v81 = v43;
        v77 = v45;
        v79 = v44;
        v76 = v46;
        do
        {
          v48 = (const double *)(v41 + 16);
          v49 = (int8x16_t)vld1q_dup_f64(v48);
          v50 = 0uLL;
          v51 = 24;
          v52 = (int64x2_t)xmmword_1DCC57020;
          v53 = (int64x2_t)xmmword_1DCC57010;
          v54 = (int64x2_t)xmmword_1DCC57000;
          v55 = (int64x2_t)xmmword_1DCC56FF0;
          v56 = 0uLL;
          v57 = 0uLL;
          do
          {
            v58 = v55;
            v59.i64[0] = 3 * v55.i64[0];
            v60 = v54;
            v59.i64[1] = 3 * v58.i64[1];
            v61.i64[0] = 3 * v54.i64[0];
            v61.i64[1] = 3 * v60.i64[1];
            v62 = v57;
            v63 = v56;
            v64 = v50;
            v50 = vorrq_s8(v50, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v43, v61), v49), (uint64x2_t)vnegq_s64(vaddq_s64(v60, v60))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v43, v59), v49), (uint64x2_t)vnegq_s64(vaddq_s64(v58, v58)))));
            v65 = vaddq_s64((int64x2_t)v59, v53);
            v66 = vaddq_s64((int64x2_t)v61, v52);
            v57 = vorrq_s8(v57, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v44, v61), v49), (uint64x2_t)vmvnq_s8((int8x16_t)v66)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v44, v59), v49), (uint64x2_t)vmvnq_s8((int8x16_t)v65))));
            v56 = vorrq_s8(v56, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v45, v61), v49), (uint64x2_t)vsubq_s64(v46, v66)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v45, v59), v49), (uint64x2_t)vsubq_s64(v46, v65))));
            v53 = vaddq_s64(v53, v47);
            v52 = vaddq_s64(v52, v47);
            v55 = vaddq_s64(v58, v45);
            v54 = vaddq_s64(v60, v45);
            v51 -= 4;
          }
          while (v51);
          v67 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v73, (uint64x2_t)v60), (int32x4_t)vcgtq_u64(v73, (uint64x2_t)v58));
          v68 = vbslq_s8(v67, v57, v62);
          v69 = vbslq_s8(v67, v56, v63);
          v70 = (int32x4_t)vbslq_s8(v67, v50, v64);
          *(int8x8_t *)v67.i8 = vorr_s8(*(int8x8_t *)v68.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL));
          v71 = v67.i32[0] | v67.i32[1];
          *(int8x8_t *)v67.i8 = vorr_s8(*(int8x8_t *)v69.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL));
          *(int8x8_t *)v70.i8 = vorr_s8(*(int8x8_t *)v70.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v70, (int8x16_t)v70, 8uLL));
          v70.i32[0] |= v70.u32[1];
          v70.i32[1] = v71;
          v70.i64[1] = __PAIR64__(*((_DWORD *)v41 + 6), v67.i32[0] | v67.i32[1]);
          v85 = v70;
          if (sub_1DCBC87D0(v86, v70))
            *v42++ = v85;
          v41 = *(char **)v41;
          v44 = v79;
          v43 = v81;
          v46 = v76;
          v45 = v77;
          v47 = v74;
        }
        while (v41);
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return (NSData *)v5;
}

- (NSData)voxelIndices
{
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  unint64_t value;
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  int8x16_t *v8;
  char *next;
  uint64x2_t v10;
  uint64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  uint64x2_t v15;
  const double *v16;
  int8x16_t v17;
  int8x16_t v18;
  uint64_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int64x2_t v26;
  uint64x2_t v27;
  int64x2_t v28;
  uint64x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  __int32 v39;

  p_voxels = &self->_voxels;
  value = self->_voxels.__table_.__p2_.__value_;
  if (value)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DF0]);
    value = (unint64_t)objc_retainAutorelease((id)objc_msgSend_initWithLength_(v4, v5, 16 * value));
    v8 = (int8x16_t *)objc_msgSend_mutableBytes((void *)value, v6, v7);
    next = (char *)p_voxels->__table_.__p1_.__value_.__next_;
    if (next)
    {
      v10 = (uint64x2_t)vdupq_n_s64(1uLL);
      v11 = (uint64x2_t)vdupq_n_s64(2uLL);
      v12 = vdupq_n_s64(4uLL);
      v13 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      v14 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      v15 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      do
      {
        v16 = (const double *)(next + 16);
        v17 = (int8x16_t)vld1q_dup_f64(v16);
        v18 = 0uLL;
        v19 = 24;
        v20 = (int64x2_t)xmmword_1DCC57020;
        v21 = (int64x2_t)xmmword_1DCC57010;
        v22 = (int64x2_t)xmmword_1DCC57000;
        v23 = (int64x2_t)xmmword_1DCC56FF0;
        v24 = 0uLL;
        v25 = 0uLL;
        do
        {
          v26 = v23;
          v27.i64[0] = 3 * v23.i64[0];
          v28 = v22;
          v27.i64[1] = 3 * v26.i64[1];
          v29.i64[0] = 3 * v22.i64[0];
          v29.i64[1] = 3 * v28.i64[1];
          v30 = v25;
          v31 = v24;
          v32 = v18;
          v18 = vorrq_s8(v18, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v29), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v27), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v26, v26)))));
          v33 = vaddq_s64((int64x2_t)v27, v21);
          v34 = vaddq_s64((int64x2_t)v29, v20);
          v25 = vorrq_s8(v25, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v11, v29), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v11, v27), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v33))));
          v24 = vorrq_s8(v24, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v12, v29), v17), (uint64x2_t)vsubq_s64(v13, v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v12, v27), v17), (uint64x2_t)vsubq_s64(v13, v33))));
          v21 = vaddq_s64(v21, v14);
          v20 = vaddq_s64(v20, v14);
          v23 = vaddq_s64(v26, v12);
          v22 = vaddq_s64(v28, v12);
          v19 -= 4;
        }
        while (v19);
        v35 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v15, (uint64x2_t)v28), (int32x4_t)vcgtq_u64(v15, (uint64x2_t)v26));
        v36 = vbslq_s8(v35, v25, v30);
        v37 = vbslq_s8(v35, v24, v31);
        v38 = vbslq_s8(v35, v18, v32);
        *(int8x8_t *)v35.i8 = vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
        v39 = v35.i32[0] | v35.i32[1];
        *(int8x8_t *)v35.i8 = vorr_s8(*(int8x8_t *)v37.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL));
        *(int8x8_t *)v38.i8 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        v38.i32[0] |= v38.u32[1];
        v38.i32[1] = v39;
        v38.i64[1] = __PAIR64__(*((_DWORD *)next + 6), v35.i32[0] | v35.i32[1]);
        *v8++ = v38;
        next = *(char **)next;
      }
      while (next);
    }
  }
  return (NSData *)(id)value;
}

- (void)setVoxelAtIndex:(MDLVoxelIndex)index
{
  const char *v4;
  uint64_t v5;
  Octree *value;
  unint64_t v7[2];

  if (((index.i32[0] | index.i32[1] | index.i32[2]) & 0x80000000) == 0)
  {
    v7[0] = self->mortonCoder.mortonkeyZ.__begin_[index.u8[8]] | ((self->mortonCoder.mortonkeyY.__begin_[index.u8[5]] | self->mortonCoder.mortonkeyZ.__begin_[index.u8[9]] | self->mortonCoder.mortonkeyX.__begin_[index.u8[1]]) << 24) | self->mortonCoder.mortonkeyY.__begin_[index.u8[4]] | self->mortonCoder.mortonkeyX.__begin_[index.u8[0]];
    v7[1] = index.u32[3];
    sub_1DCBD1A20((uint64_t)&self->_voxels, v7, (uint64_t)v7);
    objc_msgSend_recalculateExtents(self, v4, v5);
  }
  value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value)
    sub_1DCBD19CC((uint64_t)&self->_octreeData, value);
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions patchRadius:(float)patchRadius
{
  MDLMesh *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t *v20;
  uint64_t v21;
  int8x16_t v22;
  Octree *v23;
  uint64_t v24;
  unique_ptr<ModelIO::Octree, std::default_delete<ModelIO::Octree>> *p_octreeData;
  Octree *value;
  uint64_t *v27;

  v9 = mesh;
  if (divisions <= 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v14, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v12, v13);

  }
  if (patchRadius < 0.0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v17, v18);

  }
  if (!v9)
    goto LABEL_17;
  v20 = (uint64_t *)operator new();
  sub_1DCADF038((uint64_t)v20, v9, divisions, patchRadius);
  v27 = v20;
  if (!*v20)
  {
    v27 = 0;
LABEL_16:
    sub_1DCBD19CC((uint64_t)&v27, v20);
    goto LABEL_17;
  }
  sub_1DCBC71B0(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&self->_voxels, *v20);
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  v22 = (int8x16_t)vcgtq_f32(*(float32x4_t *)&self->_anon_80[16], *(float32x4_t *)self->_anon_80);
  if (!v22.i32[0]
    || (v22.i32[0] = vextq_s8(v22, v22, 8uLL).u32[0],
        *(int32x2_t *)v22.i8 = vtst_s32(*(int32x2_t *)v22.i8, *(int32x2_t *)v22.i8),
        (v22.i8[4] & 1) == 0)
    || (v22.i8[0] & 1) == 0)
  {
    p_octreeData = &self->_octreeData;
    value = self->_octreeData.__ptr_.__value_;
    self->_octreeData.__ptr_.__value_ = 0;
    if (!value)
      goto LABEL_15;
    goto LABEL_14;
  }
  v23 = (Octree *)v27;
  self->_voxelExtent = *((float *)v27 + 18);
  v24 = *(_QWORD *)v23;
  *(_OWORD *)&self->_anon_80[16] = *(_OWORD *)(*(_QWORD *)v23 + 32);
  *(_OWORD *)self->_anon_80 = *(_OWORD *)(v24 + 16);
  p_octreeData = &self->_octreeData;
  v27 = 0;
  value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = v23;
  if (value)
LABEL_14:
    sub_1DCBD19CC((uint64_t)p_octreeData, value);
LABEL_15:
  objc_msgSend_recalculateExtents(self, (const char *)value, v21);
  v20 = v27;
  v27 = 0;
  if (v20)
    goto LABEL_16;
LABEL_17:

}

- (void)unionWithVoxels:(MDLVoxelArray *)voxels
{
  const char *v4;
  uint64_t v5;
  MDLVoxelArray *v6;
  _OWORD *i;
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  _OWORD *j;
  Octree *value;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v6 = voxels;
  v12 = 0u;
  v13 = 0u;
  v14 = 1065353216;
  for (i = v6->_voxels.__table_.__p1_.__value_.__next_; i; i = *(_OWORD **)i)
  {
    v11 = i[1];
    DWORD2(v11) = 0;
    sub_1DCBD1C44((uint64_t)&v12, (unint64_t *)&v11, &v11);
  }
  p_voxels = &self->_voxels;
  for (j = self->_voxels.__table_.__p1_.__value_.__next_; j; j = *(_OWORD **)j)
  {
    v11 = j[1];
    DWORD2(v11) = 0;
    sub_1DCBD1C44((uint64_t)&v12, (unint64_t *)&v11, &v11);
  }
  if (p_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_1DCBD1E60(p_voxels, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v4, v5);
  value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value)
    sub_1DCBD19CC((uint64_t)&self->_octreeData, value);
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_1DCAE6B78((uint64_t)&v12);

}

- (void)intersectWithVoxels:(MDLVoxelArray *)voxels
{
  MDLVoxelArray *v4;
  const char *v5;
  uint64_t v6;
  MDLVoxelArray *v7;
  _OWORD *next;
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  Octree *value;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v4 = voxels;
  v7 = v4;
  v12 = 0u;
  v13 = 0u;
  v14 = 1065353216;
  next = self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_voxels = &v4->_voxels;
    do
    {
      v11 = next[1];
      if (sub_1DCAE745C(p_voxels, (unint64_t *)&v11))
      {
        DWORD2(v11) = 0;
        sub_1DCBD1C44((uint64_t)&v12, (unint64_t *)&v11, &v11);
      }
      next = *(_OWORD **)next;
    }
    while (next);
  }
  if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_1DCBD1E60(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v5, v6);
  value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value)
    sub_1DCBD19CC((uint64_t)&self->_octreeData, value);
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_1DCAE6B78((uint64_t)&v12);

}

- (void)differenceWithVoxels:(MDLVoxelArray *)voxels
{
  MDLVoxelArray *v4;
  const char *v5;
  uint64_t v6;
  MDLVoxelArray *v7;
  _OWORD *next;
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  Octree *value;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v4 = voxels;
  v7 = v4;
  v12 = 0u;
  v13 = 0u;
  v14 = 1065353216;
  next = self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_voxels = &v4->_voxels;
    do
    {
      v11 = next[1];
      if (!sub_1DCAE745C(p_voxels, (unint64_t *)&v11))
      {
        DWORD2(v11) = 0;
        sub_1DCBD1C44((uint64_t)&v12, (unint64_t *)&v11, &v11);
      }
      next = *(_OWORD **)next;
    }
    while (next);
  }
  if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_1DCBD1E60(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v5, v6);
  value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value)
    sub_1DCBD19CC((uint64_t)&self->_octreeData, value);
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_1DCAE6B78((uint64_t)&v12);

}

- (MDLAxisAlignedBoundingBox)boundingBox
{
  return self;
}

- (MDLVoxelIndex)indexOfSpatialLocation:(vector_float3)location
{
  float32x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  float32x4_t v6;
  float32x4_t v12;
  MDLVoxelIndex result;

  v4.i32[0] = LODWORD(self->_voxelExtent);
  *(float *)v5.i32 = *(float *)v4.i32 * 0.5;
  v6 = vsubq_f32(vsubq_f32(v3, *(float32x4_t *)self->_originatingOffset), (float32x4_t)vdupq_lane_s32(v5, 0));
  __asm { FMOV            V2.4S, #1.0 }
  v12 = vmulq_f32(v6, vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(v4, 0)));
  *(int32x2_t *)result.i8 = vcvt_s32_f32(vrnda_f32(*(float32x2_t *)v12.f32));
  result.i64[1] = llroundf(v12.f32[2]);
  return result;
}

- (vector_float3)spatialLocationOfIndex:(MDLVoxelIndex)index
{
  vector_float3 result;

  __asm { FMOV            V2.4S, #1.0 }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (MDLAxisAlignedBoundingBox)voxelBoundingBoxAtIndex:(SEL)a3
{
  uint64_t v4;

  return (MDLAxisAlignedBoundingBox *)objc_msgSend_spatialLocationOfIndex_(self, a3, v4, *(double *)index.i64);
}

- (void)convertToSignedShellField
{
  Octree *value;
  const char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  value = self->_octreeData.__ptr_.__value_;
  if (value && *(_QWORD *)value)
  {
    sub_1DCAE2784((uint64_t)value);
    sub_1DCAE26E8((uint64_t)self->_octreeData.__ptr_.__value_);
    v6 = 0u;
    v7 = 0u;
    v8 = 1065353216;
    sub_1DCBC71B0(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v6, *(_QWORD *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v6)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v8;
      sub_1DCBD1E60(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v7, 0);
    }
    objc_msgSend_recalculateExtents(self, v4, v5);
    self->_levelSet = 1;
    sub_1DCAE6B78((uint64_t)&v6);
  }
}

- (BOOL)isValidSignedShellField
{
  return self->_levelSet;
}

- (void)setShellFieldInteriorThickness:(float)shellFieldInteriorThickness
{
  uint64_t v3;
  double v4;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  float interiorThickness;
  double v14;
  double v15;

  if (shellFieldInteriorThickness < 0.0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: thickness must be greater or equal to 0"), v10, v11);

  }
  interiorThickness = self->_interiorThickness;
  if (interiorThickness != shellFieldInteriorThickness)
  {
    *(float *)&v4 = self->_exteriorThickness;
    if (interiorThickness >= shellFieldInteriorThickness)
    {
      *(float *)&v15 = shellFieldInteriorThickness;
      objc_msgSend_erodeNarrowBandInteriorWidthTo_AndExteriorWidthTo_selector_(self, a2, (uint64_t)a2, v15, v4);
    }
    else
    {
      *(float *)&v14 = shellFieldInteriorThickness;
      objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, a2, v3, v14, v4);
    }
    self->_interiorThickness = shellFieldInteriorThickness;
  }
}

- (void)setShellFieldExteriorThickness:(float)shellFieldExteriorThickness
{
  uint64_t v3;
  double v4;
  float v5;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  float exteriorThickness;

  v5 = shellFieldExteriorThickness;
  if (shellFieldExteriorThickness < 0.0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: thickness must be greater or equal to 0"), v10, v11);

  }
  exteriorThickness = self->_exteriorThickness;
  if (exteriorThickness != v5)
  {
    shellFieldExteriorThickness = self->_interiorThickness;
    if (exteriorThickness >= v5)
    {
      *(float *)&v4 = v5;
      objc_msgSend_erodeNarrowBandInteriorWidthTo_AndExteriorWidthTo_selector_(self, a2, (uint64_t)a2, *(double *)&shellFieldExteriorThickness, v4);
    }
    else
    {
      *(float *)&v4 = v5;
      objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, a2, v3, *(double *)&shellFieldExteriorThickness, v4);
    }
    self->_exteriorThickness = v5;
  }
}

- (void)dilateNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4
{
  Octree *value;
  const char *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  value = self->_octreeData.__ptr_.__value_;
  if (value && *(_QWORD *)value && self->_levelSet)
  {
    sub_1DCAE2C60((uint64_t)value, a3, a4);
    sub_1DCAE26E8((uint64_t)self->_octreeData.__ptr_.__value_);
    v8 = 0u;
    v9 = 0u;
    v10 = 1065353216;
    sub_1DCBC71B0(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v8, *(_QWORD *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v8)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v10;
      sub_1DCBD1E60(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v9, 0);
    }
    objc_msgSend_recalculateExtents(self, v6, v7);
    sub_1DCAE6B78((uint64_t)&v8);
  }
}

- (void)erodeNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4 selector:(SEL)a5
{
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  float32x4_t **value;
  const char *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  if (a3 < 0.0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v9, v13, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: interiorNBWidth must be greater or equal to 0"), v11, v12);

  }
  if (a4 < 0.0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: exteriorNBWidth must be greater or equal to 0"), v16, v17);

  }
  value = (float32x4_t **)self->_octreeData.__ptr_.__value_;
  if (value && *value && self->_levelSet)
  {
    sub_1DCAE3254(value, a3, a4);
    v22 = 0u;
    v23 = 0u;
    v24 = 1065353216;
    sub_1DCBC71B0(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v22, *(_QWORD *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v22)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v24;
      sub_1DCBD1E60(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v23, 0);
    }
    objc_msgSend_recalculateExtents(self, v20, v21);
    sub_1DCAE6B78((uint64_t)&v22);
  }
}

- (MDLMesh)coarseMeshUsingAllocator:(id)allocator
{
  MDLMeshBufferDataAllocator *v4;
  MDLMeshBufferDataAllocator *v5;
  Octree *value;
  float v7;
  void *v8;
  char *next;
  _DWORD *v10;
  int v11;
  MortonCode *p_mortonCoder;
  uint64x2_t v13;
  uint64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  const double *v18;
  int8x16_t v19;
  int8x16_t v20;
  uint64_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int64x2_t v28;
  uint64x2_t v29;
  int64x2_t v30;
  uint64x2_t v31;
  int8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int v41;
  int8x8_t v42;
  int8x8_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  int v56;
  float32x4_t v57;
  __n128 v58;
  const char *v59;
  MDLMesh *v60;
  MDLMeshBufferDataAllocator *v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  id v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  id v86;
  const char *v87;
  void *v88;
  const char *v89;
  MDLMaterial *v90;
  const char *v91;
  void *v92;
  void *v93;
  const char *v94;
  void *v95;
  MDLSubmesh *v96;
  const char *v97;
  void *v98;
  const char *v99;
  id v100;
  const char *v101;
  const char *v102;
  MDLMeshBufferDataAllocator *v104;
  float32x4_t v105;
  int64x2_t v106;
  int64x2_t v107;
  int64x2_t v108;
  uint64x2_t v109;
  uint64x2_t v110;
  uint64x2_t v111;
  unsigned int v112;
  int v113;
  int v114;
  char **v115;
  int v116;
  unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *p_voxels;
  unint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  _BYTE *v122;
  _BYTE *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  _BYTE *v128;
  _BYTE *v129;
  uint64_t v130;

  v4 = (MDLMeshBufferDataAllocator *)allocator;
  v5 = v4;
  value = self->_octreeData.__ptr_.__value_;
  if (value)
  {
    v7 = log2f((float)*((int *)value + 2));
    sub_1DCAD6F54((uint64_t *)value, (int)v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v104 = v4;
    v128 = 0;
    v129 = 0;
    v130 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v122 = 0;
    v123 = 0;
    v124 = 0;
    v119 = 0;
    v120 = 0;
    v121 = 0;
    p_voxels = &self->_voxels;
    next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
    if (next)
    {
      v10 = self->_voxels.__table_.__p1_.__value_.__next_;
      do
      {
        v11 = v10[6];
        if (v11 < 0)
          v11 = -v11;
        v112 = v11;
        if (v11 > 0x10)
          break;
        v10 = *(_DWORD **)v10;
      }
      while (v10);
      v113 = 0;
      p_mortonCoder = &self->mortonCoder;
      v13 = (uint64x2_t)vdupq_n_s64(1uLL);
      v14 = (uint64x2_t)vdupq_n_s64(2uLL);
      v15 = vdupq_n_s64(4uLL);
      v16 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      v17 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      v111 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      v105 = (float32x4_t)vdupq_n_s32(0x3B800000u);
      v106 = v17;
      v109 = v14;
      v110 = v13;
      v107 = v16;
      v108 = v15;
      do
      {
        v18 = (const double *)(next + 16);
        v114 = *((_DWORD *)next + 6);
        v19 = (int8x16_t)vld1q_dup_f64(v18);
        v20 = 0uLL;
        v21 = 24;
        v22 = (int64x2_t)xmmword_1DCC57020;
        v23 = (int64x2_t)xmmword_1DCC57010;
        v24 = (int64x2_t)xmmword_1DCC57000;
        v25 = (int64x2_t)xmmword_1DCC56FF0;
        v26 = 0uLL;
        v27 = 0uLL;
        do
        {
          v28 = v25;
          v29.i64[0] = 3 * v25.i64[0];
          v30 = v24;
          v29.i64[1] = 3 * v28.i64[1];
          v31.i64[0] = 3 * v24.i64[0];
          v31.i64[1] = 3 * v30.i64[1];
          v32 = v27;
          v33 = v26;
          v34 = v20;
          v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v31), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v30, v30))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v29), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28)))));
          v35 = vaddq_s64((int64x2_t)v29, v23);
          v36 = vaddq_s64((int64x2_t)v31, v22);
          v27 = vorrq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v14, v31), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v14, v29), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v35))));
          v26 = vorrq_s8(v26, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v15, v31), v19), (uint64x2_t)vsubq_s64(v16, v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v15, v29), v19), (uint64x2_t)vsubq_s64(v16, v35))));
          v23 = vaddq_s64(v23, v17);
          v22 = vaddq_s64(v22, v17);
          v25 = vaddq_s64(v28, v15);
          v24 = vaddq_s64(v30, v15);
          v21 -= 4;
        }
        while (v21);
        v115 = (char **)next;
        v37 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v111, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v111, (uint64x2_t)v28));
        v38 = vbslq_s8(v37, v27, v32);
        v39 = vbslq_s8(v37, v26, v33);
        v40 = vbslq_s8(v37, v20, v34);
        *(int8x8_t *)v37.i8 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        v41 = v37.i32[0] | v37.i32[1];
        v42 = vorr_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL));
        v43 = vorr_s8(*(int8x8_t *)v40.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
        v44 = v43.i32[0] | v43.i32[1];
        v45 = ((unsigned __int16)(v42.i16[0] | v42.i16[2]) >> 8);
        v46 = BYTE1(v41);
        v116 = v42.i32[0] | v42.i32[1];
        v47 = (v42.i8[0] | v42.i8[4]);
        if ((v43.i32[0] | v43.i32[1]) <= 1)
        {
          v49 = v41;
          v48 = v41;
          v50 = 2;
        }
        else
        {
          v48 = v41;
          v118 = p_mortonCoder->mortonkeyZ.__begin_[(v42.i8[0] | v42.i8[4])] | ((p_mortonCoder->mortonkeyY.__begin_[BYTE1(v41)] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v42.i16[0] | v42.i16[2]) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[((unsigned __int16)((v43.i16[0] | v43.i16[2]) - 1) >> 8)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v41] | p_mortonCoder->mortonkeyX.__begin_[((v43.i8[0] | v43.i8[4]) - 1)];
          v49 = v41;
          v50 = 2 * (sub_1DCAE745C(p_voxels, &v118) == 0);
        }
        v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[v45] | p_mortonCoder->mortonkeyX.__begin_[((unsigned __int16)(v44 + 1) >> 8)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[(v44 + 1)];
        v51 = v50 | (sub_1DCAE745C(p_voxels, &v118) == 0);
        if (v49 < 2)
        {
          v53 = v51 | 8;
          v52 = v44;
        }
        else
        {
          v52 = v44;
          v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)(v49 - 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)] | p_mortonCoder->mortonkeyZ.__begin_[v45]) << 24) | p_mortonCoder->mortonkeyY.__begin_[(v49 - 1)] | p_mortonCoder->mortonkeyX.__begin_[v44];
          v53 = v51 | (8 * (sub_1DCAE745C(p_voxels, &v118) == 0));
        }
        v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)(v49 + 1) >> 8)] | p_mortonCoder->mortonkeyZ.__begin_[v45] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[(v49 + 1)] | p_mortonCoder->mortonkeyX.__begin_[v52];
        v54 = v53 | (4 * (sub_1DCAE745C(p_voxels, &v118) == 0));
        if (v116 < 2)
        {
          v55 = v54 | 0x20;
        }
        else
        {
          v118 = p_mortonCoder->mortonkeyZ.__begin_[(v116 - 1)] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v116 - 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[v52];
          v55 = v54 | (32 * (sub_1DCAE745C(p_voxels, &v118) == 0));
        }
        v118 = p_mortonCoder->mortonkeyZ.__begin_[(v116 + 1)] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v116 + 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[v52];
        v56 = v55 | (16 * (sub_1DCAE745C(p_voxels, &v118) == 0));
        if (v56)
        {
          v57.f32[0] = (float)v44;
          v57.f32[1] = (float)v49;
          v57.f32[2] = (float)v116;
          v58 = (__n128)vmulq_f32(v57, v105);
          v113 = sub_1DCBCA2FC(v112 > 0x10, v114, v56, v113, &v119, (uint64_t)&v128, &v125, (uint64_t)&v122, v58, (__n128)vaddq_f32((float32x4_t)v58, v105));
        }
        v14 = v109;
        v13 = v110;
        v16 = v107;
        v15 = v108;
        v17 = v106;
        next = *v115;
      }
      while (*v115);
    }
    v60 = [MDLMesh alloc];
    v61 = v104;
    if (!v104)
      v61 = objc_alloc_init(MDLMeshBufferDataAllocator);
    v8 = (void *)objc_msgSend_initWithBufferAllocator_(v60, v59, (uint64_t)v61);
    if (!v104)

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v62, (uint64_t)CFSTR("%@-%@"), CFSTR("Voxel"), CFSTR("position"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v64, (uint64_t)v128, v129 - v128);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v66, (uint64_t)v63, 786435, CFSTR("position"), v65, 12);

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v67, (uint64_t)CFSTR("%@-%@"), CFSTR("Voxel"), CFSTR("normal"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v69, (uint64_t)v125, v126 - v125);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v71, (uint64_t)v68, 786435, CFSTR("normal"), v70, 12);

    if (v123 != v122)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v72, (uint64_t)CFSTR("%@-%@"), CFSTR("Voxel"), CFSTR("color"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v74, (uint64_t)v122, v123 - v122);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v76, (uint64_t)v73, 65540, CFSTR("color"), v75, 4);

    }
    v77 = objc_alloc(MEMORY[0x1E0C99D50]);
    v79 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v77, v78, (uint64_t)v119, v120 - v119, 0);
    objc_msgSend_allocator(v8, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend_newBufferWithData_type_(v82, v83, (uint64_t)v79, 2);

    if (objc_msgSend_conformsToProtocol_(v84, v85, (uint64_t)&unk_1F03B6D88))
    {
      v86 = v84;
      objc_msgSend_stringByAppendingString_(CFSTR("Voxel"), v87, (uint64_t)CFSTR("-Indices"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v86, v89, (uint64_t)v88);

    }
    v90 = [MDLMaterial alloc];
    objc_msgSend_stringByAppendingString_(CFSTR("Voxel"), v91, (uint64_t)CFSTR("-Material"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_opt_new();
    v95 = (void *)objc_msgSend_initWithName_scatteringFunction_(v90, v94, (uint64_t)v92, v93);

    v96 = [MDLSubmesh alloc];
    v98 = (void *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v96, v97, (uint64_t)CFSTR("submesh"), v84, (v120 - v119) >> 2, 32, 2, v95, 0);
    objc_msgSend_setVertexCount_(v8, v99, ((v129 - v128) >> 2) / 3uLL);
    v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_addObject_(v100, v101, (uint64_t)v98);
    objc_msgSend_setSubmeshes_(v8, v102, (uint64_t)v100);

    if (v119)
    {
      v120 = v119;
      operator delete(v119);
    }
    v5 = v104;
    if (v122)
    {
      v123 = v122;
      operator delete(v122);
    }
    if (v125)
    {
      v126 = v125;
      operator delete(v125);
    }
    if (v128)
    {
      v129 = v128;
      operator delete(v128);
    }
  }

  return (MDLMesh *)v8;
}

- (MDLMesh)coarseMesh
{
  return (MDLMesh *)MEMORY[0x1E0DE7D20](self, sel_coarseMeshUsingAllocator_, 0);
}

- (MDLMesh)meshUsingAllocator:(id)allocator
{
  uint64_t *value;
  void *v5;
  int v6;
  int i;
  int j;
  int *v9;
  uint64_t v10;
  int8x16_t v11;
  int64x2_t v12;
  uint64_t v13;
  uint32x4_t v14;
  int8x16_t v15;
  int64x2_t v16;
  int64x2_t v17;
  const float *v18;
  int8x8_t v19;
  const char *v20;
  uint64_t v21;
  int32x4_t v22;
  const char *v23;
  uint64_t v24;
  int32x4_t v25;
  const char *v26;
  uint64_t v27;
  __int128 v28;
  int32x4_t v29;
  int v30;
  int v31;
  __int32 v32;
  int v33;
  int v34;
  unint64_t v35;
  int v36;
  int v37;
  int32x4_t v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  char v50;
  int v51;
  __int32 v52;
  char v53;
  int v54;
  __int32 v55;
  char v56;
  char v57;
  char v58;
  int32x4_t v59;
  _QWORD *v60;
  float v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  __int128 v67;
  int *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  int v74;
  double v75;
  int v76;
  int v77;
  float *v78;
  double v79;
  double v80;
  float v81;
  uint64_t k;
  float v83;
  __int128 v84;
  _BYTE *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  __int128 v95;
  unsigned int v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int32x4_t *v102;
  int v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  int v107;
  int32x4_t *v108;
  uint64_t v109;
  unint64_t v110;
  int32x4_t *v111;
  int32x4_t *v112;
  int32x4_t *v113;
  int32x4_t v114;
  int32x4_t *v115;
  int32x4_t v116;
  BOOL v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  int32x4_t *v122;
  int32x4_t *v123;
  int32x4_t v124;
  const char *v125;
  id v126;
  const char *v127;
  void *v128;
  const char *v129;
  MDLSubmesh *v130;
  int32x4_t *v131;
  _BYTE *v132;
  MDLMaterial *v133;
  const char *v134;
  void *v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  id v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  __int128 *v147;
  __int128 *v148;
  __int128 v149;
  void *v150;
  const char *v151;
  id v152;
  const char *v153;
  void *v154;
  const char *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  void *v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  void *v173;
  const char *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  void *v179;
  const char *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  void *v185;
  const char *v186;
  MDLMesh *v187;
  char *v188;
  _BYTE *v189;
  const char *v190;
  void *v191;
  const char *v192;
  const char *v193;
  double v194;
  const char *v195;
  int v197;
  int v198;
  __int32 v199;
  int v200;
  int v201;
  MDLVoxelArray *v202;
  int v203;
  int v204;
  int v205;
  id v206;
  int v207;
  uint64_t v208;
  int v209;
  char v210;
  __int128 v211;
  int v212;
  int32x4_t v213;
  char v214;
  __int128 v215;
  int32x4_t v216;
  int32x4_t v217;
  void *v218;
  int32x4_t v219;
  int32x4_t v220;
  id v221;
  int v222;
  __int128 v223;
  __int128 v224;
  unint64_t v225;
  void *__p;
  int32x4_t *v227;
  int32x4_t *v228;
  void *v229;
  char *v230;
  char *v231;
  void *v232;
  _BYTE *v233;
  uint64_t v234;
  void *v235;
  _OWORD v236[2];
  _DWORD v237[2];
  int v238;
  uint64_t v239;
  int v240;
  _DWORD v241[256];
  _OWORD v242[6];
  uint64_t v243;
  float32x4x2_t v244;

  v243 = *MEMORY[0x1E0C80C00];
  v206 = allocator;
  value = (uint64_t *)self->_octreeData.__ptr_.__value_;
  if (value && *value && self->_levelSet)
  {
    sub_1DCAE3878(value);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_137;
  }
  if (!v206)
    v206 = (id)objc_opt_new();
  memset(v242, 0, sizeof(v242));
  bzero(v241, 0x400uLL);
  v6 = 0;
  for (i = 0; i != 8; ++i)
  {
    for (j = 1; j < 5; j *= 2)
    {
      if (i <= (j ^ i))
      {
        v9 = (int *)v242 + v6;
        v6 += 2;
        *v9 = i;
        v9[1] = j ^ i;
      }
    }
  }
  v10 = 0;
  v11.i64[0] = 0x100000001;
  v11.i64[1] = 0x100000001;
  v12 = vdupq_n_s64(8uLL);
  do
  {
    v13 = 0;
    v14 = (uint32x4_t)vdupq_n_s32(v10);
    v15 = 0uLL;
    v16 = (int64x2_t)xmmword_1DCC5A4A0;
    v17 = (int64x2_t)xmmword_1DCC5A490;
    do
    {
      v18 = (const float *)&v242[v13];
      v244 = vld2q_f32(v18);
      v15 = vorrq_s8(vbicq_s8((int8x16_t)vshlq_u32((uint32x4_t)v11, (uint32x4_t)vshrn_high_n_s64(vshrn_n_s64(v16, 1uLL), v17, 1uLL)), (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8(veorq_s8((int8x16_t)vshlq_u32(v14, (uint32x4_t)vnegq_s32((int32x4_t)v244.val[1])), (int8x16_t)vshlq_u32(v14, (uint32x4_t)vnegq_s32((int32x4_t)v244.val[0]))), v11))), v15);
      v17 = vaddq_s64(v17, v12);
      v16 = vaddq_s64(v16, v12);
      v13 += 2;
    }
    while (v13 != 6);
    v19 = vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    v241[v10++] = v19.i32[0] | v19.i32[1];
  }
  while (v10 != 256);
  v232 = 0;
  v233 = 0;
  v234 = 0;
  sub_1DCB231F4((uint64_t)&v232, 0x1000uLL);
  objc_msgSend_voxelIndexExtent(self, v20, v21);
  v219 = v22;
  objc_msgSend_voxelIndexExtent(self, v23, v24);
  v213 = v25;
  objc_msgSend_voxelIndexExtent(self, v26, v27);
  v211 = v28;
  v29 = vsubq_s32(v219, v213);
  v30 = v29.i32[1];
  v222 = v29.i32[2];
  v31 = v29.i32[0];
  v229 = 0;
  v230 = 0;
  v231 = 0;
  __p = 0;
  v227 = 0;
  v228 = 0;
  v239 = 0;
  v32 = v29.i32[0] + 4;
  v237[0] = 1;
  v237[1] = v29.i32[0] + 4;
  v33 = v29.i32[1] + 4;
  v34 = (v29.i32[0] + 4) * (v29.i32[1] + 4);
  v238 = v34;
  memset(v236, 0, sizeof(v236));
  v35 = 2 * v34;
  if (v35 > (v233 - (_BYTE *)v232) >> 2)
    sub_1DCB231F4((uint64_t)&v232, v35);
  v36 = v222;
  v240 = 0;
  if (v222 < -1)
    goto LABEL_121;
  v209 = 0;
  v38.i32[3] = -1;
  *(int32x2_t *)v38.i8 = vadd_s32(*(int32x2_t *)&v211, (int32x2_t)-1);
  v207 = v31 + 1;
  v37 = v30 + 1;
  v38.i32[2] = DWORD2(v211) - 1;
  v220 = v38;
  v205 = v36 + 1;
  v39 = 1;
  v40 = 0x1F03AC000uLL;
  v41 = 0x1F03AC000uLL;
  v202 = self;
  v200 = v31;
  v201 = v30;
  v198 = v33;
  v199 = v32;
  v197 = v30 + 1;
  while (2)
  {
    HIDWORD(v239) = 0;
    if (v30 < -1)
      goto LABEL_119;
    v212 = 0;
    v42 = v32 + v32 * v39 * v33 + 1;
    v203 = v39;
    v204 = v34;
    while (2)
    {
      LODWORD(v239) = 0;
      if (v31 < -1)
        goto LABEL_117;
      v43 = 0;
      v44 = (Class *)((char *)&self->super.super.isa + *(int *)(v40 + 3848));
      v45 = (Class *)((char *)&self->super.super.isa + *(int *)(v41 + 3856));
      v46 = v42;
      do
      {
        v208 = v46;
        v47 = 0;
        LODWORD(v48) = 0;
        v49 = 0;
        v50 = 1;
        do
        {
          v51 = 0;
          v210 = v50;
          v52 = v47 + v209;
          v53 = 1;
          do
          {
            v54 = 0;
            v214 = v53;
            v55 = v51 + v212;
            v56 = v48;
            v57 = 1;
            v48 = (int)v48;
            do
            {
              v38.i32[0] = v54 + v43;
              v38.i32[1] = v55;
              v58 = v57;
              v38.i32[2] = v52;
              v59 = vaddq_s32(v38, v220);
              v225 = *(_QWORD *)(v45[6] + 8 * v59.u8[8]) | ((*(_QWORD *)(v45[3] + 8 * v59.u8[5]) | *(_QWORD *)(v45[6] + 8 * v59.u8[9]) | *(_QWORD *)(*v45 + 8 * v59.u8[1])) << 24) | *(_QWORD *)(v45[3] + 8 * v59.u8[4]) | *(_QWORD *)(*v45 + 8 * v59.u8[0]);
              v60 = sub_1DCAE745C(v44, &v225);
              v57 = 0;
              if (v60)
                v61 = 1.0;
              else
                v61 = -1.0;
              *((float *)v236 + v48) = v61;
              v54 = 1;
              v62 = 1 << v56;
              if (v60)
                v62 = 0;
              v49 |= v62;
              ++v48;
              ++v56;
            }
            while ((v58 & 1) != 0);
            v53 = 0;
            v51 = 1;
          }
          while ((v214 & 1) != 0);
          v50 = 0;
          v47 = 1;
        }
        while ((v210 & 1) != 0);
        v63 = v208;
        if (v49 && v49 != 255)
        {
          v64 = 0;
          v65 = 0;
          v66 = v241[v49];
          v67 = 0uLL;
          do
          {
            if (((v66 >> v64) & 1) != 0)
            {
              v68 = (int *)v242 + 2 * v64;
              v69 = *v68;
              v70 = v68[1];
              v71 = (int)*((float *)v236 + v69);
              ++v65;
              v72 = (int)*((float *)v236 + v70);
              v73 = v71 - v72;
              if (v71 != v72)
              {
                v74 = 0;
                v75 = (double)(v71 / v73);
                v76 = 1;
                do
                {
                  v77 = HIDWORD(v67);
                  v78 = (float *)((unint64_t)&v224 & 0xFFFFFFFFFFFFFFF3 | (4 * (v74 & 3)));
                  v224 = v67;
                  if ((v76 & v69) != 0)
                    v79 = 1.0;
                  else
                    v79 = 0.0;
                  if ((v76 & v69) != 0)
                    v80 = 1.0 - v75;
                  else
                    v80 = v75;
                  if ((v76 & v69) != (v76 & v70))
                    v79 = v80;
                  v81 = v79 + *v78;
                  *v78 = v81;
                  v67 = v224;
                  HIDWORD(v67) = v77;
                  ++v74;
                  v76 *= 2;
                }
                while (v74 != 3);
              }
            }
            ++v64;
          }
          while (v64 != 12);
          for (k = 0; k != 3; ++k)
          {
            v83 = (float)*((int *)&v239 + k);
            v223 = v67;
            *(float *)((unint64_t)&v223 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3))) = v83
                                                                                       + (float)(*(float *)((unint64_t)&v223 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3)))
                                                                                               * (float)(1.0 / (float)v65));
            v84 = v223;
            HIDWORD(v84) = HIDWORD(v67);
            v67 = v84;
          }
          v215 = v223;
          v85 = v229;
          v86 = v230;
          v87 = (v230 - (_BYTE *)v229) >> 4;
          *((_DWORD *)v232 + v208) = v87;
          if (v86 >= v231)
          {
            if ((unint64_t)(v87 + 1) >> 60)
              sub_1DCAE4C44();
            v89 = v231 - v85;
            v90 = v89 >> 3;
            if (v89 >> 3 <= (unint64_t)(v87 + 1))
              v90 = v87 + 1;
            if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0)
              v35 = 0xFFFFFFFFFFFFFFFLL;
            else
              v35 = v90;
            if (v35)
              v91 = (char *)sub_1DCAFBD5C((uint64_t)&v231, v35);
            else
              v91 = 0;
            v92 = &v91[16 * v87];
            v38.i32[3] = HIDWORD(v215);
            *(_OWORD *)v92 = v215;
            v88 = v92 + 16;
            v94 = (char *)v229;
            v93 = v230;
            if (v230 != v229)
            {
              do
              {
                v95 = *((_OWORD *)v93 - 1);
                v93 -= 16;
                v38.i32[3] = HIDWORD(v95);
                *((_OWORD *)v92 - 1) = v95;
                v92 -= 16;
              }
              while (v93 != v94);
              v93 = (char *)v229;
            }
            v229 = v92;
            v230 = v88;
            v231 = &v91[16 * v35];
            if (v93)
              operator delete(v93);
            v63 = v208;
          }
          else
          {
            v38.i32[3] = HIDWORD(v215);
            *(_OWORD *)v86 = v215;
            v88 = v86 + 16;
          }
          v96 = 0;
          v230 = v88;
          do
          {
            v97 = v96 + 1;
            if (((v66 >> v96) & 1) == 0)
              goto LABEL_113;
            LODWORD(v98) = v96 - 2;
            v98 = v96 >= 2 ? v98 : v97;
            if (!*((_DWORD *)&v239 + v98))
              goto LABEL_113;
            v99 = v96 ? v96 - 1 : 2;
            if (!*((_DWORD *)&v239 + v99))
              goto LABEL_113;
            v100 = v237[v98];
            v101 = (int)v237[v99];
            v38.i32[0] = *((_DWORD *)v232 + v63);
            v102 = v227;
            if ((v49 & 1) != 0)
            {
              v107 = v63 - v100;
              v38.i32[1] = *((_DWORD *)v232 + v107);
              v38.i32[2] = *((_DWORD *)v232 + v107 - (int)v101);
              v38.i32[3] = *((_DWORD *)v232 + v63 - v101);
              if (v227 >= v228)
              {
                v217 = v38;
                v109 = ((char *)v227 - (_BYTE *)__p) >> 4;
                if ((unint64_t)(v109 + 1) >> 60)
                  sub_1DCAE4C44();
                v110 = ((char *)v228 - (_BYTE *)__p) >> 3;
                if (v110 <= v109 + 1)
                  v110 = v109 + 1;
                if ((unint64_t)((char *)v228 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF0)
                  v35 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v35 = v110;
                if (v35)
                  v106 = (char *)sub_1DCAFBD5C((uint64_t)&v228, v35);
                else
                  v106 = 0;
                v111 = (int32x4_t *)&v106[16 * v109];
                v38.i32[3] = v217.i32[3];
                *v111 = v217;
                v108 = v111 + 1;
                v115 = (int32x4_t *)__p;
                v112 = v227;
                if (v227 != __p)
                {
                  do
                  {
                    v116 = v112[-1];
                    --v112;
                    v38.i32[3] = v116.i32[3];
                    v111[-1] = v116;
                    --v111;
                  }
                  while (v112 != v115);
LABEL_108:
                  v112 = (int32x4_t *)__p;
                }
LABEL_109:
                __p = v111;
                v227 = v108;
                v228 = (int32x4_t *)&v106[16 * v35];
                if (v112)
                  operator delete(v112);
                v63 = v208;
                goto LABEL_112;
              }
            }
            else
            {
              v38.i32[1] = *((_DWORD *)v232 + v63 - v101);
              v103 = v63 - v100;
              v38.i32[2] = *((_DWORD *)v232 + v103 - (int)v101);
              v38.i32[3] = *((_DWORD *)v232 + v103);
              if (v227 >= v228)
              {
                v216 = v38;
                v104 = ((char *)v227 - (_BYTE *)__p) >> 4;
                if ((unint64_t)(v104 + 1) >> 60)
                  sub_1DCAE4C44();
                v105 = ((char *)v228 - (_BYTE *)__p) >> 3;
                if (v105 <= v104 + 1)
                  v105 = v104 + 1;
                if ((unint64_t)((char *)v228 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF0)
                  v35 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v35 = v105;
                if (v35)
                  v106 = (char *)sub_1DCAFBD5C((uint64_t)&v228, v35);
                else
                  v106 = 0;
                v111 = (int32x4_t *)&v106[16 * v104];
                v38.i32[3] = v216.i32[3];
                *v111 = v216;
                v108 = v111 + 1;
                v113 = (int32x4_t *)__p;
                v112 = v227;
                if (v227 != __p)
                {
                  do
                  {
                    v114 = v112[-1];
                    --v112;
                    v38.i32[3] = v114.i32[3];
                    v111[-1] = v114;
                    --v111;
                  }
                  while (v112 != v113);
                  goto LABEL_108;
                }
                goto LABEL_109;
              }
            }
            *v227 = v38;
            v108 = v102 + 1;
LABEL_112:
            v227 = v108;
LABEL_113:
            v96 = v97;
          }
          while (v97 != 3);
        }
        LODWORD(v239) = v43 + 1;
        v46 = v63 + 1;
        v117 = v43++ == v207;
      }
      while (!v117);
      v42 = v46;
      self = v202;
      v31 = v200;
      v30 = v201;
      v33 = v198;
      v32 = v199;
      v39 = v203;
      v34 = v204;
      v37 = v197;
      v40 = 0x1F03AC000;
      v41 = 0x1F03AC000;
LABEL_117:
      HIDWORD(v239) = v212 + 1;
      v42 += 2;
      v117 = v212++ == v37;
      if (!v117)
        continue;
      break;
    }
LABEL_119:
    v240 = v209 + 1;
    v39 ^= 1u;
    v34 = -v34;
    v238 = v34;
    v117 = v209++ == v205;
    if (!v117)
      continue;
    break;
  }
LABEL_121:
  objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], (const char *)v35, 8 * ((((char *)v227 - (_BYTE *)__p) >> 3) + (((char *)v227 - (_BYTE *)__p) >> 4)));
  v221 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v120 = objc_msgSend_mutableBytes(v221, v118, v119);
  v122 = (int32x4_t *)__p;
  v123 = v227;
  while (v122 != v123)
  {
    v124 = *v122++;
    *(int32x4_t *)v120 = vuzp1q_s32(v124, vuzp2q_s32(v124, vdupq_lane_s32(*(int32x2_t *)v124.i8, 0)));
    *(int32x2_t *)(v120 + 16) = vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL));
    v120 += 24;
  }
  v218 = (void *)objc_msgSend_newBufferWithData_type_(v206, v121, (uint64_t)v221, 2);
  if (objc_msgSend_conformsToProtocol_(v218, v125, (uint64_t)&unk_1F03B6D88))
  {
    v126 = v218;
    objc_msgSend_stringByAppendingString_(CFSTR("Voxels"), v127, (uint64_t)CFSTR("-Indices"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v126, v129, (uint64_t)v128);

  }
  v130 = [MDLSubmesh alloc];
  v132 = __p;
  v131 = v227;
  v133 = [MDLMaterial alloc];
  objc_msgSend_stringByAppendingString_(CFSTR("Voxels"), v134, (uint64_t)CFSTR("-Material"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)objc_opt_new();
  v138 = (void *)objc_msgSend_initWithName_scatteringFunction_(v133, v137, (uint64_t)v135, v136);
  v140 = (void *)objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v130, v139, (uint64_t)v218, 2 * ((((char *)v131 - v132) >> 3) + (((char *)v131 - v132) >> 4)), 32, 2, v138);

  objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v141, 4 * (((v230 - (_BYTE *)v229) >> 3) + ((v230 - (_BYTE *)v229) >> 4)));
  v142 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v145 = objc_msgSend_mutableBytes(v142, v143, v144);
  v147 = (__int128 *)v229;
  v148 = (__int128 *)v230;
  while (v147 != v148)
  {
    v149 = *v147++;
    *(_QWORD *)v145 = v149;
    *(_DWORD *)(v145 + 8) = DWORD2(v149);
    v145 += 12;
  }
  v150 = (void *)objc_msgSend_newBufferWithData_type_(v206, v146, (uint64_t)v142, 1);
  if (objc_msgSend_conformsToProtocol_(v150, v151, (uint64_t)&unk_1F03B6D88))
  {
    v152 = v150;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v153, (uint64_t)CFSTR("%@-%@"), CFSTR("Voxels"), CFSTR("position"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v152, v155, (uint64_t)v154);

  }
  v156 = (void *)objc_opt_new();
  objc_msgSend_attributes(v156, v157, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v159, v160, 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v161, v162, (uint64_t)CFSTR("position"));

  objc_msgSend_attributes(v156, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v165, v166, 0);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFormat_(v167, v168, 786435);

  objc_msgSend_attributes(v156, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v171, v172, 0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v173, v174, 0);

  objc_msgSend_attributes(v156, v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v177, v178, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBufferIndex_(v179, v180, 0);

  objc_msgSend_layouts(v156, v181, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v183, v184, 0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStride_(v185, v186, 12);

  v187 = [MDLMesh alloc];
  v189 = v229;
  v188 = v230;
  v235 = v140;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v190, (uint64_t)&v235, 1);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend_initWithVertexBuffer_vertexCount_descriptor_submeshes_(v187, v192, (uint64_t)v150, (v188 - v189) >> 4, v156, v191);

  objc_msgSend_setName_(v5, v193, (uint64_t)CFSTR("Voxels"));
  LODWORD(v194) = 1045220557;
  objc_msgSend_addNormalsWithAttributeNamed_creaseThreshold_(v5, v195, (uint64_t)CFSTR("normal"), v194);

  if (__p)
  {
    v227 = (int32x4_t *)__p;
    operator delete(__p);
  }
  if (v229)
  {
    v230 = (char *)v229;
    operator delete(v229);
  }
  if (v232)
  {
    v233 = v232;
    operator delete(v232);
  }
LABEL_137:

  return (MDLMesh *)v5;
}

- (id)coarseVoxelMeshWithStyle:(unint64_t)a3
{
  Octree *value;
  int v5;

  value = self->_octreeData.__ptr_.__value_;
  v5 = (int)log2f((float)*((int *)value + 2));
  return sub_1DCAD6F54((uint64_t *)value, v5, a3 == 2, a3 == 1);
}

- (vector<int,)boxesPerLayer
{
  Octree *value;

  value = self->_octreeData.__ptr_.__value_;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  return (vector<int, std::allocator<int>> *)sub_1DCB04A00(retstr, *((const void **)value + 6), *((_QWORD *)value + 7), (uint64_t)(*((_QWORD *)value + 7) - *((_QWORD *)value + 6)) >> 2);
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius
{
  uint64_t v10;
  MDLAsset *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  MDLVoxelArray *v34;
  double v35;
  const char *v36;
  MDLVoxelArray *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  double v42;
  double v43;

  v10 = *(_QWORD *)&divisions;
  v13 = asset;
  if ((int)v10 > 0)
  {
    if ((interiorShells & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v19, v23, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: interiorShells must be greater or equal to 0"), v21, v22);

    if ((exteriorShells & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v16, v17);

  if (interiorShells < 0)
    goto LABEL_6;
LABEL_3:
  if ((exteriorShells & 0x80000000) == 0)
    goto LABEL_8;
LABEL_7:
  v24 = (void *)MEMORY[0x1E0C99DA0];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v24, v28, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: exteriorShells must be greater or equal to 0"), v26, v27);

LABEL_8:
  if (patchRadius < 0.0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v29, v33, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v31, v32);

  }
  v34 = [MDLVoxelArray alloc];
  *(float *)&v35 = patchRadius;
  v37 = (MDLVoxelArray *)objc_msgSend_initWithAsset_divisions_patchRadius_(v34, v36, (uint64_t)v13, v10, v35);
  objc_msgSend_convertToSignedShellField(v37, v38, v39);
  LODWORD(v42) = 0;
  LODWORD(v43) = 0;
  if (interiorShells >= 2)
  {
    v43 = (float)(v37->_voxelExtent + v37->_voxelExtent) + (double)(interiorShells - 1) * 0.5 * v37->_voxelExtent;
    *(float *)&v43 = v43;
  }
  if (exteriorShells >= 2)
  {
    v42 = (float)(v37->_voxelExtent + v37->_voxelExtent) + (double)(exteriorShells - 1) * 0.5 * v37->_voxelExtent;
    *(float *)&v42 = v42;
  }
  objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(v37, v40, v41, v43, v42);

  return v37;
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius
{
  uint64_t v10;
  MDLAsset *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  MDLVoxelArray *v34;
  double v35;
  const char *v36;
  MDLVoxelArray *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;

  v10 = *(_QWORD *)&divisions;
  v13 = asset;
  if ((int)v10 <= 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v16, v17);

  }
  if (interiorNBWidth < 0.0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v19, v23, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: interiorNBWidth must be greater or equal to 0"), v21, v22);

  }
  if (exteriorNBWidth < 0.0)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v24, v28, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: exteriorNBWidth must be greater or equal to 0"), v26, v27);

  }
  if (patchRadius < 0.0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v29, v33, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v31, v32);

  }
  v34 = [MDLVoxelArray alloc];
  *(float *)&v35 = patchRadius;
  v37 = (MDLVoxelArray *)objc_msgSend_initWithAsset_divisions_patchRadius_(v34, v36, (uint64_t)v13, v10, v35);
  objc_msgSend_convertToSignedShellField(v37, v38, v39);
  *(float *)&v40 = interiorNBWidth;
  *(float *)&v41 = exteriorNBWidth;
  objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(v37, v42, v43, v40, v41);

  return v37;
}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius
{
  uint64_t v10;
  const char *v13;
  double v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  const char *v34;
  MDLMesh *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  MDLMesh *v42;

  v10 = *(_QWORD *)&divisions;
  v42 = mesh;
  if ((int)v10 > 0)
  {
    if ((interiorShells & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v20, v24, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: interiorShells must be greater or equal to 0"), v22, v23);

    if ((exteriorShells & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x1E0C99DA0];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v17, v18);

  if (interiorShells < 0)
    goto LABEL_6;
LABEL_3:
  if ((exteriorShells & 0x80000000) == 0)
    goto LABEL_8;
LABEL_7:
  v25 = (void *)MEMORY[0x1E0C99DA0];
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v25, v29, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: exteriorShells must be greater or equal to 0"), v27, v28);

LABEL_8:
  if (patchRadius < 0.0)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v30, v34, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v32, v33);

  }
  v35 = v42;
  if (v42)
  {
    *(float *)&v14 = patchRadius;
    objc_msgSend_setVoxelsForMesh_divisions_patchRadius_(self, v13, (uint64_t)v42, v10, v14);
    objc_msgSend_convertToSignedShellField(self, v36, v37);
    LODWORD(v40) = 0;
    LODWORD(v41) = 0;
    if (interiorShells >= 2)
    {
      v41 = (float)(self->_voxelExtent + self->_voxelExtent) + (double)(interiorShells - 1) * 0.5 * self->_voxelExtent;
      *(float *)&v41 = v41;
    }
    if (exteriorShells >= 2)
    {
      v40 = (float)(self->_voxelExtent + self->_voxelExtent) + (double)(exteriorShells - 1) * 0.5 * self->_voxelExtent;
      *(float *)&v40 = v40;
    }
    objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, v38, v39, v41, v40);
    v35 = v42;
  }

}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius
{
  uint64_t v10;
  const char *v13;
  double v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  MDLMesh *v41;

  v10 = *(_QWORD *)&divisions;
  v41 = mesh;
  if ((int)v10 <= 0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: divisions must be greater than 0"), v17, v18);

  }
  if (interiorNBWidth < 0.0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v20, v24, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: interiorNBWidth must be greater or equal to 0"), v22, v23);

  }
  if (exteriorNBWidth < 0.0)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v25, v29, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: exteriorNBWidth must be greater or equal to 0"), v27, v28);

  }
  if (patchRadius < 0.0)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v30, v34, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: patchRadius must be greater or equal to 0"), v32, v33);

  }
  if (v41)
  {
    *(float *)&v14 = patchRadius;
    objc_msgSend_setVoxelsForMesh_divisions_patchRadius_(self, v13, (uint64_t)v41, v10, v14);
    objc_msgSend_convertToSignedShellField(self, v35, v36);
    *(float *)&v37 = interiorNBWidth;
    *(float *)&v38 = exteriorNBWidth;
    objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, v39, v40, v37, v38);
  }

}

- (MDLVoxelIndexExtent)voxelIndexExtent
{
  MDLVoxelIndex v2;
  MDLVoxelIndex v3;
  MDLVoxelIndexExtent result;

  v2 = *(MDLVoxelIndex *)self->_anon_60;
  v3 = *(MDLVoxelIndex *)&self->_anon_60[16];
  result.maximumExtent = v3;
  result.minimumExtent = v2;
  return result;
}

- (float)shellFieldInteriorThickness
{
  return self->_interiorThickness;
}

- (float)shellFieldExteriorThickness
{
  return self->_exteriorThickness;
}

- (void).cxx_destruct
{
  unique_ptr<ModelIO::Octree, std::default_delete<ModelIO::Octree>> *p_octreeData;
  Octree *value;
  MortonCode *p_mortonCoder;
  unint64_t *begin;
  unint64_t *v7;
  unint64_t *v8;

  p_octreeData = &self->_octreeData;
  value = p_octreeData->__ptr_.__value_;
  p_octreeData->__ptr_.__value_ = 0;
  if (value)
    sub_1DCBD19CC((uint64_t)p_octreeData, value);
  p_mortonCoder = &self->mortonCoder;
  begin = self->mortonCoder.mortonkeyZ.__begin_;
  if (begin)
  {
    self->mortonCoder.mortonkeyZ.__end_ = begin;
    operator delete(begin);
  }
  v7 = self->mortonCoder.mortonkeyY.__begin_;
  if (v7)
  {
    self->mortonCoder.mortonkeyY.__end_ = v7;
    operator delete(v7);
  }
  v8 = p_mortonCoder->mortonkeyX.__begin_;
  if (p_mortonCoder->mortonkeyX.__begin_)
  {
    self->mortonCoder.mortonkeyX.__end_ = v8;
    operator delete(v8);
  }
  sub_1DCAE6B78((uint64_t)&self->_voxels);
}

- (id).cxx_construct
{
  self->_voxels.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_voxels.__table_.__p1_.__value_.__next_ = 0u;
  self->_voxels.__table_.__p3_.__value_ = 1.0;
  sub_1DCB56BA8(&self->mortonCoder, a2);
  self->_octreeData.__ptr_.__value_ = 0;
  return self;
}

@end
