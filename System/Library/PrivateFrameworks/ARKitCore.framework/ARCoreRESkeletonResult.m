@implementation ARCoreRESkeletonResult

- (ARCoreRESkeletonResult)initWithModelJointTransforms:(id *)a3 localJointTransformsSRT:(id *)a4 numberOfTransforms:(unint64_t)a5 liftedSkeletonData:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  ARCoreRESkeletonResult *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v26;
  __int128 v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  objc_super v29;

  v13 = a6;
  v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ARCoreRESkeletonResult;
  v15 = -[ARCoreRESkeletonResult init](&v29, sel_init);
  if (v15)
  {
    v27 = 0uLL;
    v28 = 0;
    v26 = v13;
    std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&v27, a3, (uint64_t)a3 + 64 * a5, a5);
    begin = v15->_modelTransforms.__begin_;
    if (begin)
    {
      v15->_modelTransforms.__end_ = begin;
      operator delete(begin);
      v15->_modelTransforms.__begin_ = 0;
      v15->_modelTransforms.__end_ = 0;
      v15->_modelTransforms.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v15->_modelTransforms.__begin_ = v27;
    v15->_modelTransforms.__end_cap_.__value_ = v28;
    v27 = 0uLL;
    v28 = 0;
    std::vector<ARSRT>::__init_with_size[abi:ne180100]<ARSRT const*,ARSRT const*>(&v27, a4, (uint64_t)a4 + 48 * a5, a5);
    v17 = v15->_localTransformsSRT.__begin_;
    if (v17)
    {
      v15->_localTransformsSRT.__end_ = v17;
      operator delete(v17);
      v15->_localTransformsSRT.__begin_ = 0;
      v15->_localTransformsSRT.__end_ = 0;
      v15->_localTransformsSRT.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v15->_localTransformsSRT.__begin_ = v27;
    v15->_localTransformsSRT.__end_cap_.__value_ = v28;
    std::vector<simd_float4x4>::resize((uint64_t)&v15->_localTransforms, a5);
    if (a5)
    {
      v18 = 0;
      v19 = 40;
      do
      {
        ARMatrix4x4FromRotationAndTranslation();
        v20 = (_OWORD *)((char *)v15->_localTransforms.__begin_ + v18);
        *v20 = v21;
        v20[1] = v22;
        v20[2] = v23;
        v20[3] = v24;
        v19 += 48;
        v18 += 64;
        --a5;
      }
      while (a5);
    }
    objc_storeStrong((id *)&v15->_liftingResult, a6);
    objc_storeStrong((id *)&v15->_identifier, a7);
    v13 = v26;
  }

  return v15;
}

- (const)jointModelTransforms
{
  return self->_modelTransforms.__begin_;
}

- (const)jointLocalTransforms
{
  return self->_localTransforms.__begin_;
}

- (const)localJointTransformsSRT
{
  return (const $8D1985C799415D2CB3AD20D417DB6B01 *)self->_localTransformsSRT.__begin_;
}

- (unint64_t)jointTransformCount
{
  return (self->_modelTransforms.__end_ - self->_modelTransforms.__begin_) >> 6;
}

- (AR3DSkeletonDetectionResult)liftedSkeletonData
{
  return self->_liftingResult;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  uint64_t v5;
  char *v6;
  BOOL v7;

  if (a3 < 0)
    return 0;
  if (((self->_modelTransforms.__end_ - self->_modelTransforms.__begin_) >> 6) - 1 < (unint64_t)a3)
    return 0;
  v5 = 0;
  v6 = (char *)&ARRigDependencyTable + 72 * a3;
  v7 = 1;
  while (*(_DWORD *)&v6[4 * v5] != -1)
  {
    v7 = v7 && -[AR3DSkeletonDetectionResult isJointTracked:](self->_liftingResult, "isJointTracked:");
    if (++v5 == 18)
    {
      LODWORD(v5) = 1;
      return v7 && (_DWORD)v5 != 0;
    }
  }
  return v7 && (_DWORD)v5 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_liftingResult, CFSTR("liftingResult"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_modelTransforms.__begin_, self->_modelTransforms.__end_ - self->_modelTransforms.__begin_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("modelTransformData"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_localTransforms.__begin_, self->_localTransforms.__end_ - self->_localTransforms.__begin_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("localTransformData"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_localTransformsSRT.__begin_, self->_localTransformsSRT.__end_ - self->_localTransformsSRT.__begin_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("localTransformSRTData"));

}

- (ARCoreRESkeletonResult)initWithCoder:(id)a3
{
  id v4;
  ARCoreRESkeletonResult *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  AR3DSkeletonDetectionResult *liftingResult;
  void *v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  void *v15;
  void *v16;
  uint64_t v17;
  const void *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  void *v20;
  unint64_t v21;
  const void *v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v23;
  __int128 v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ARCoreRESkeletonResult;
  v5 = -[ARCoreRESkeletonResult init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("liftingResult"));
    v8 = objc_claimAutoreleasedReturnValue();
    liftingResult = v5->_liftingResult;
    v5->_liftingResult = (AR3DSkeletonDetectionResult *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("modelTransformData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "length");
      v13 = (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v25 = 0uLL;
      v26 = 0;
      std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&v25, v13, (uint64_t)v13 + 64 * (uint64_t)(int)(v12 >> 6), (int)(v12 >> 6));
      begin = v5->_modelTransforms.__begin_;
      if (begin)
      {
        v5->_modelTransforms.__end_ = begin;
        operator delete(begin);
        v5->_modelTransforms.__begin_ = 0;
        v5->_modelTransforms.__end_ = 0;
        v5->_modelTransforms.__end_cap_.__value_ = 0;
      }
      *(_OWORD *)&v5->_modelTransforms.__begin_ = v25;
      v5->_modelTransforms.__end_cap_.__value_ = v26;
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("localTransformData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "length");
      v18 = (const void *)objc_msgSend(objc_retainAutorelease(v16), "bytes");
      v25 = 0uLL;
      v26 = 0;
      std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&v25, v18, (uint64_t)v18 + 64 * (uint64_t)(int)(v17 >> 6), (int)(v17 >> 6));
      v19 = v5->_localTransforms.__begin_;
      if (v19)
      {
        v5->_localTransforms.__end_ = v19;
        operator delete(v19);
        v5->_localTransforms.__begin_ = 0;
        v5->_localTransforms.__end_ = 0;
        v5->_localTransforms.__end_cap_.__value_ = 0;
      }
      *(_OWORD *)&v5->_localTransforms.__begin_ = v25;
      v5->_localTransforms.__end_cap_.__value_ = v26;
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("localTransformSRTData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = objc_msgSend(v16, "length");
      v22 = (const void *)objc_msgSend(objc_retainAutorelease(v20), "bytes");
      v25 = 0uLL;
      v26 = 0;
      std::vector<ARSRT>::__init_with_size[abi:ne180100]<ARSRT const*,ARSRT const*>(&v25, v22, (uint64_t)v22 + 48 * (int)(v21 / 0x30), (int)(v21 / 0x30));
      v23 = v5->_localTransformsSRT.__begin_;
      if (v23)
      {
        v5->_localTransformsSRT.__end_ = v23;
        operator delete(v23);
        v5->_localTransformsSRT.__begin_ = 0;
        v5->_localTransformsSRT.__end_ = 0;
        v5->_localTransformsSRT.__end_cap_.__value_ = 0;
      }
      *(_OWORD *)&v5->_localTransformsSRT.__begin_ = v25;
      v5->_localTransformsSRT.__end_cap_.__value_ = v26;
    }

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v13;
  BOOL v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  float32x4_t *v18;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoreRESkeletonResult identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      begin = self->_modelTransforms.__begin_;
      end = self->_modelTransforms.__end_;
      v13 = (end - begin) >> 6;
      if (v13 == (uint64_t)(v5[2] - v5[1]) >> 6)
      {
        v14 = 0;
        v15 = (self->_localTransforms.__end_ - self->_localTransforms.__begin_) >> 6;
        if (v15 != v13 || v15 != (uint64_t)(v5[8] - v5[7]) >> 6)
          goto LABEL_14;
        if (end == begin)
        {
          v14 = 1;
          goto LABEL_14;
        }
        v16 = 0;
        v17 = 0;
        v14 = 1;
        while ((AREqualTransforms(*(float32x4_t *)((char *)begin + v16), *(float32x4_t *)((char *)begin + v16 + 16), *(float32x4_t *)((char *)begin + v16 + 32), *(float32x4_t *)((char *)begin + v16 + 48), *(float32x4_t *)(v5[1] + v16), *(float32x4_t *)(v5[1] + v16 + 16), *(float32x4_t *)(v5[1] + v16 + 32), *(float32x4_t *)(v5[1] + v16 + 48)) & 1) != 0)
        {
          v18 = (float32x4_t *)((char *)self->_localTransforms.__begin_ + v16);
          if ((AREqualTransforms(*v18, v18[1], v18[2], v18[3], *(float32x4_t *)(v5[7] + v16), *(float32x4_t *)(v5[7] + v16 + 16), *(float32x4_t *)(v5[7] + v16 + 32), *(float32x4_t *)(v5[7] + v16 + 48)) & 1) == 0)break;
          ++v17;
          begin = self->_modelTransforms.__begin_;
          v16 += 64;
          if (v17 >= (self->_modelTransforms.__end_ - begin) >> 6)
            goto LABEL_14;
        }
      }
    }
    v14 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((ARCoreRESkeletonResult *)v5 != self)
  {
    std::vector<simd_float4x4>::__assign_with_size[abi:ne180100]<simd_float4x4*,simd_float4x4*>((char *)(v5 + 8), (char *)self->_modelTransforms.__begin_, (uint64_t)self->_modelTransforms.__end_, (self->_modelTransforms.__end_ - self->_modelTransforms.__begin_) >> 6);
    std::vector<ARSRT>::__assign_with_size[abi:ne180100]<ARSRT*,ARSRT*>((char *)(v6 + 32), (char *)self->_localTransformsSRT.__begin_, (uint64_t)self->_localTransformsSRT.__end_, 0xAAAAAAAAAAAAAAABLL * ((self->_localTransformsSRT.__end_ - self->_localTransformsSRT.__begin_) >> 4));
    std::vector<simd_float4x4>::__assign_with_size[abi:ne180100]<simd_float4x4*,simd_float4x4*>((char *)(v6 + 56), (char *)self->_localTransforms.__begin_, (uint64_t)self->_localTransforms.__end_, (self->_localTransforms.__end_ - self->_localTransforms.__begin_) >> 6);
  }
  v7 = -[AR3DSkeletonDetectionResult copyWithZone:](self->_liftingResult, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v7;

  v9 = -[NSUUID copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  return (id)v6;
}

+ (NSArray)jointNames
{
  void *v2;
  void *v3;

  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jointNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (NSArray)jointParentIndices
{
  void *v2;
  void *v3;

  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentIndices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (__n128)visionTransform
{
  return a1[7];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (double)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_liftingResult, 0);
  begin = self->_localTransforms.__begin_;
  if (begin)
  {
    self->_localTransforms.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_localTransformsSRT.__begin_;
  if (v4)
  {
    self->_localTransformsSRT.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_modelTransforms.__begin_;
  if (v5)
  {
    self->_modelTransforms.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
