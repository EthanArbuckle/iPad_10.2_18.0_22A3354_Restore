@implementation MDLVolumeGrid

- (MDLVolumeGrid)initWithObject:(id)a3 divisions:(int)a4
{
  id v6;
  MDLVolumeGrid *v7;
  uint64_t v8;
  SCNOctree *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MDLVolumeGrid;
  v7 = -[MDLVolumeGrid init](&v11, sel_init);
  if (v7)
  {
    v8 = operator new();
    sub_1DCB3BD64(v8, v6, a4);
    value = v7->_octree.__ptr_.__value_;
    v7->_octree.__ptr_.__value_ = (SCNOctree *)v8;
    if (value)
      sub_1DCB81508((uint64_t)&v7->_octree, value);
  }

  return v7;
}

- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4
{
  id v6;
  MDLVolumeGrid *v7;
  uint64_t v8;
  SCNOctree *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MDLVolumeGrid;
  v7 = -[MDLVolumeGrid init](&v11, sel_init);
  if (v7)
  {
    v8 = operator new();
    sub_1DCB3BBF4(v8, v6, a4);
    value = v7->_octree.__ptr_.__value_;
    v7->_octree.__ptr_.__value_ = (SCNOctree *)v8;
    if (value)
      sub_1DCB81508((uint64_t)&v7->_octree, value);
  }

  return v7;
}

- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4 interiorWidth:(float)a5 exteriorWidth:(float)a6 patchRadius:(float)a7
{
  return (MDLVolumeGrid *)MEMORY[0x1E0DE7D20](self, sel_initWithAsset_divisions_, a3);
}

- (id)meshWithStyle:(unint64_t)a3
{
  uint64_t value;

  value = (uint64_t)self->_octree.__ptr_.__value_;
  if (value)
  {
    sub_1DCB31784((uint64_t *)value, *(_DWORD *)(value + 144), a3 == 2, a3 == 1);
    value = objc_claimAutoreleasedReturnValue();
  }
  return (id)value;
}

- (unint64_t)trianglesIntersectingRayWithOrigin:(MDLVolumeGrid *)self direction:(SEL)a2 count:(unint64_t *)a3
{
  float32x4_t v4;
  int32x4_t v5;
  double v6;
  float32x4_t v8;
  unint64_t *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  _OWORD v19[3];
  BOOL v20;
  BOOL v21;
  BOOL v22;
  char v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[8];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (int32x4_t)vmulq_f32(v4, v4);
  *(_QWORD *)&v6 = vaddq_f32(vaddq_f32((float32x4_t)v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.i8, 1)), (float32x4_t)vdupq_laneq_s32(v5, 2)).u64[0];
  if (*(float *)&v6 <= 0.00000011921)
    return 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 1065353216;
  memset(v29, 0, sizeof(v29));
  LODWORD(v29[0]) = 2139095039;
  v8 = vmulq_n_f32(v4, 1.0 / *(float *)&v6);
  v23 = 0;
  v25 = 0;
  v19[0] = _Q0;
  v19[1] = v8;
  __asm { FMOV            V0.2S, #1.0 }
  *(float32x2_t *)&_Q0 = vdiv_f32(*(float32x2_t *)&_Q0, *(float32x2_t *)v8.f32);
  v8.f32[0] = 1.0 / v8.f32[2];
  LODWORD(v6) = DWORD1(_Q0);
  *((float *)&_Q0 + 2) = 1.0 / v8.f32[2];
  v19[2] = _Q0;
  v20 = *(float *)&_Q0 < 0.0;
  v21 = *((float *)&_Q0 + 1) < 0.0;
  v22 = (float)(1.0 / v8.f32[2]) < 0.0;
  v24 = 0x7F7FFFFF3C800000;
  sub_1DCB3163C((uint64_t *)self->_octree.__ptr_.__value_, (uint64_t)v19, (uint64_t)v29, (uint64_t)&v26, 1.40444725e306, *(double *)v8.i64, v6, (float32x4_t)COERCE_UNSIGNED_INT(1.0));
  v13 = (unint64_t *)malloc_type_malloc(8 * *((_QWORD *)&v27 + 1), 0x100004000313F17uLL);
  v14 = v13;
  v15 = v27;
  if ((_QWORD)v27)
  {
    v16 = 0;
    do
    {
      v17 = v16 + 1;
      v13[v16] = *(int *)(v15 + 16);
      v15 = *(_QWORD *)v15;
      ++v16;
    }
    while (v15);
    v15 = v17;
  }
  *a3 = v15;
  sub_1DCAE6B78((uint64_t)&v26);
  return v14;
}

- (void).cxx_destruct
{
  unique_ptr<ModelIO::SCNOctree, std::default_delete<ModelIO::SCNOctree>> *p_octree;
  SCNOctree *v3;
  SCNOctree *value;

  value = self->_octree.__ptr_.__value_;
  p_octree = &self->_octree;
  v3 = value;
  p_octree->__ptr_.__value_ = 0;
  if (value)
    sub_1DCB81508((uint64_t)p_octree, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
