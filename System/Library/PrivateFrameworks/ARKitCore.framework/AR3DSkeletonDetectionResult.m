@implementation AR3DSkeletonDetectionResult

- (AR3DSkeletonDetectionResult)initWithJoints:(AR3DSkeletonDetectionResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:
{
  const void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const void *v7;
  id v9;
  char *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v5 = v4;
  v6 = v3;
  v7 = v2;
  v9 = v4;
  v15.receiver = self;
  v15.super_class = (Class)AR3DSkeletonDetectionResult;
  v10 = -[AR3DSkeletonDetectionResult init](&v15, sel_init);
  if (v10)
  {
    v13 = 0uLL;
    v14 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v13, v7, (uint64_t)v7 + 16 * v6, v6);
    v11 = (void *)*((_QWORD *)v10 + 1);
    if (v11)
    {
      *((_QWORD *)v10 + 2) = v11;
      operator delete(v11);
      *((_QWORD *)v10 + 1) = 0;
      *((_QWORD *)v10 + 2) = 0;
      *((_QWORD *)v10 + 3) = 0;
    }
    *(_OWORD *)(v10 + 8) = v13;
    *((_QWORD *)v10 + 3) = v14;
    objc_storeStrong((id *)v10 + 7, v5);
  }

  return (AR3DSkeletonDetectionResult *)v10;
}

- (uint64_t)joints
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)jointsLocalSpace
{
  uint64_t result;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  result = a1[4];
  v4 = a1[5];
  v5 = (char *)(a1 + 4);
  v6 = (char *)*((_QWORD *)v5 - 3);
  v7 = *((_QWORD *)v5 - 2);
  v8 = (v7 - (uint64_t)v6) >> 4;
  if (v8 != (v4 - result) >> 4)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5, v6, v7, v8);
    v33 = 0u;
    v31 = 0u;
    memset(v32, 0, sizeof(v32));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[AR3DSkeletonDetectionResult childrenIndices](AR3DSkeletonDetectionResult, "childrenIndices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "intValue");
          std::deque<std::pair<int,int>>::push_back(v32, &v27);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v11);
    }

    while (*((_QWORD *)&v33 + 1))
    {
      v14 = (int *)(*(_QWORD *)(*((_QWORD *)&v32[0] + 1) + (((unint64_t)v33 >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (v33 & 0x1FF));
      v16 = *v14;
      v15 = v14[1];
      *(_QWORD *)&v33 = v33 + 1;
      --*((_QWORD *)&v33 + 1);
      if ((unint64_t)v33 >= 0x400)
      {
        operator delete(**((void ***)&v32[0] + 1));
        *((_QWORD *)&v32[0] + 1) += 8;
        *(_QWORD *)&v33 = v33 - 512;
      }
      *(float32x4_t *)(a1[4] + 16 * v16) = vsubq_f32(*(float32x4_t *)(a1[1] + 16 * v16), *(float32x4_t *)(a1[1] + 16 * v15));
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      +[AR3DSkeletonDetectionResult childrenIndices](AR3DSkeletonDetectionResult, "childrenIndices", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v24;
        v21 = v16 << 32;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v18);
            v27 = v21 | objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22), "intValue");
            std::deque<std::pair<int,int>>::push_back(v32, &v27);
            ++v22;
          }
          while (v19 != v22);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
        }
        while (v19);
      }

    }
    std::deque<std::pair<int,int>>::~deque[abi:ne180100](v32);
    return *(_QWORD *)v5;
  }
  return result;
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  unint64_t v4;

  if (a3 < 0)
    return 0;
  if (((uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4) - 1 < (unint64_t)a3)
    return 0;
  v4 = ARRigInputJointsDependencies[a3];
  if ((v4 & 0x80000000) != 0
    || -[ABPK2DDetectionResult jointCount](self->_skeletonDetectionResult2D, "jointCount") - 1 < v4)
  {
    return 0;
  }
  return *(_DWORD *)(-[ABPK2DDetectionResult jointTrackingStates](self->_skeletonDetectionResult2D, "jointTrackingStates")+ 4 * v4) == 1;
}

- (id)createResultScaledByFactor:(float)a3
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v5;
  float32x4_t *v6;
  float32x4_t v7;
  AR3DSkeletonDetectionResult *v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  AR3DSkeletonDetectionResult *v12;
  void *__p;
  _BYTE *v16;

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&__p, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  var0 = self->_jointsVector.var0;
  v5 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
  if (var0 != v5)
  {
    v6 = (float32x4_t *)__p;
    do
    {
      v7 = *(float32x4_t *)var0;
      var0 += 2;
      *v6++ = vmulq_n_f32(v7, a3);
    }
    while (var0 != v5);
  }
  v8 = [AR3DSkeletonDetectionResult alloc];
  v9 = __p;
  v10 = v16;
  -[AR3DSkeletonDetectionResult skeletonDetectionResult2D](self, "skeletonDetectionResult2D");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AR3DSkeletonDetectionResult initWithJoints:numberOfJoints:referenceDetectionResult:](v8, "initWithJoints:numberOfJoints:referenceDetectionResult:", v9, (v10 - v9) >> 4, v11);

  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v7;
  unint64_t v8;
  float32x4_t *v9;
  float32x4_t v10;
  float32x4_t v11;
  char v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    var0 = self->_jointsVector.var0;
    v7 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    v8 = ((char *)v7 - (char *)var0) >> 4;
    v9 = (float32x4_t *)v5[1];
    if (v8 == (uint64_t)(v5[2] - (_QWORD)v9) >> 4)
    {
      if (v7 == var0)
      {
LABEL_8:
        v12 = -[ABPK2DDetectionResult isEqual:](self->_skeletonDetectionResult2D, "isEqual:", v5[7]);
LABEL_11:

        goto LABEL_12;
      }
      if (v8 <= 1)
        v8 = 1;
      while (1)
      {
        v10 = vsubq_f32(*(float32x4_t *)var0, *v9);
        v11 = vmulq_f32(v10, v10);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]) > 0.00000011921)break;
        ++v9;
        var0 += 2;
        if (!--v8)
          goto LABEL_8;
      }
    }
    v12 = 0;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if ((AR3DSkeletonDetectionResult *)v4 != self)
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_jointsVector.var0, *(_QWORD *)self->_anon_10, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  objc_storeStrong(v5 + 7, self->_skeletonDetectionResult2D);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_jointsVector.var0, *(_QWORD *)self->_anon_10 - (unint64_t)self->_jointsVector.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("jointsVector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_skeletonDetectionResult2D, CFSTR("skeletonDetectionResult2D"));

}

- (AR3DSkeletonDetectionResult)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  uint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AR3DSkeletonDetectionResult;
  v5 = -[AR3DSkeletonDetectionResult init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jointsVector"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "length");
      v9 = (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v14 = 0uLL;
      v15 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v14, v9, (uint64_t)v9 + 16 * (int)((unint64_t)v8 >> 4), (int)(v8 >> 4));
      v10 = (void *)*((_QWORD *)v5 + 1);
      if (v10)
      {
        *((_QWORD *)v5 + 2) = v10;
        operator delete(v10);
        *((_QWORD *)v5 + 1) = 0;
        *((_QWORD *)v5 + 2) = 0;
        *((_QWORD *)v5 + 3) = 0;
      }
      *(_OWORD *)(v5 + 8) = v14;
      *((_QWORD *)v5 + 3) = v15;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skeletonDetectionResult2D"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v11;

  }
  return (AR3DSkeletonDetectionResult *)v5;
}

+ (NSArray)childrenIndices
{
  return (NSArray *)&unk_1E66CE9D0;
}

+ (NSArray)jointNames
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (_QWORD *)ARRigInputJoints();
  v3 = (void *)objc_opt_new();
  v4 = 17;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    ++v2;
    --v4;
  }
  while (v4);
  return (NSArray *)v3;
}

+ (NSArray)parentIndices
{
  return (NSArray *)&unk_1E66CE9E8;
}

- (ABPK2DDetectionResult)skeletonDetectionResult2D
{
  return self->_skeletonDetectionResult2D;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v4;

  objc_storeStrong((id *)&self->_skeletonDetectionResult2D, 0);
  var0 = self->_jointsVectorLocalSpace.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_jointsVector.var0;
  if (v4)
  {
    *(_QWORD *)self->_anon_10 = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
