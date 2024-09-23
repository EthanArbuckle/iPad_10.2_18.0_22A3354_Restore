@implementation ABPKSkeleton

- (const)localPoses
{
  return self->_localPoses.__begin_;
}

- (const)modelPoses
{
  return self->_modelPoses.__begin_;
}

- (ABPKSkeleton)initWithType:(int64_t)a3
{
  ABPKSkeleton *v4;
  ABPKSkeleton *v5;
  ABPKSkeletonDefinition *v6;
  ABPKSkeletonDefinition *skeletonDefinition;
  void *v8;
  ABPKTransform *begin;
  void *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  ABPKSkeleton *v12;
  NSObject *v13;
  __int128 v15;
  ABPKTransform *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ABPKSkeleton;
  v4 = -[ABPKSkeleton init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_skeletonType = a3;
    switch(a3)
    {
      case 0:
        v6 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 0);
        break;
      case 2:
        v6 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 2);
        break;
      case 3:
        v6 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 3);
        break;
      case 4:
        v6 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 4);
        break;
      default:
        __ABPKLogSharedInstance();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEFAULT, " ERROR: Unsupported ABPKSkeletonType in ABPKSkeleton:initWithType ", (uint8_t *)&v15, 2u);
        }

        goto LABEL_15;
    }
    skeletonDefinition = v5->_skeletonDefinition;
    v5->_skeletonDefinition = v6;

    -[ABPKSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<ABPKTransform>::vector(&v15, objc_msgSend(v8, "jointCount"));
    begin = v5->_localPoses.__begin_;
    if (begin)
    {
      v5->_localPoses.__end_ = begin;
      operator delete(begin);
      v5->_localPoses.__begin_ = 0;
      v5->_localPoses.__end_ = 0;
      v5->_localPoses.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v5->_localPoses.__begin_ = v15;
    v5->_localPoses.__end_cap_.__value_ = v16;
    v15 = 0uLL;
    v16 = 0;

    -[ABPKSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<simd_float4x4>::vector(&v15, objc_msgSend(v10, "jointCount"));
    v11 = v5->_modelPoses.__begin_;
    if (v11)
    {
      v5->_modelPoses.__end_ = v11;
      operator delete(v11);
      v5->_modelPoses.__begin_ = 0;
      v5->_modelPoses.__end_ = 0;
      v5->_modelPoses.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v5->_modelPoses.__begin_ = v15;
    v5->_modelPoses.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v16;
    v16 = 0;
    v15 = 0uLL;

    v12 = v5;
  }
  else
  {
LABEL_15:
    v12 = 0;
  }

  return v12;
}

- (ABPKSkeleton)init
{
  return -[ABPKSkeleton initWithType:](self, "initWithType:", 3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_opt_new();
  v4 = 0;
  for (i = 0; i < -[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"); ++i)
  {
    -[ABPKSkeletonDefinition jointName:](self->_skeletonDefinition, "jointName:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ : (%f, %f, %f)\n"), v6, *(float *)((char *)self->_modelPoses.__begin_ + v4 + 48), *(float *)((char *)self->_modelPoses.__begin_ + v4 + 52), *(float *)((char *)self->_modelPoses.__begin_ + v4 + 56));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 += 64;
    v3 = (void *)v7;
  }
  return v3;
}

- (void)getLocalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v4 = v3;
  v5 = v2;
  if (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      *(_OWORD *)(v5 + 16 * v8) = *(_OWORD *)((char *)self->_localPoses.__begin_ + v7 + 16);
      *(_OWORD *)(v4 + 16 * v8++) = *(_OWORD *)((char *)self->_localPoses.__begin_ + v7);
      v7 += 32;
    }
    while (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount") > v8);
  }
}

- (void)getGlobalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  simd_float4x4 v10;

  v4 = v3;
  v5 = v2;
  if (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v10 = *(simd_float4x4 *)((char *)self->_modelPoses.__begin_ + v7);
      *(simd_float4 *)(v5 + 16 * v8) = v10.columns[3];
      *(double *)&v9 = simd_quaternion(v10);
      *(_OWORD *)(v4 + 16 * v8++) = v9;
      v7 += 64;
    }
    while (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount") > v8);
  }
}

- (void)setModelPoses:(id *)a3 andUpdateLocalPoses:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;

  v4 = a4;
  -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");
  if (v8)
    memmove(self->_modelPoses.__begin_, a3, v8 << 6);

  if (v4)
    -[ABPKSkeleton updateLocalPosesFromModelPoses](self, "updateLocalPosesFromModelPoses");
}

- (void)setModelPosesFromDict:(id)a3 andUpdateLocalPoses:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  v4 = a4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__ABPKSkeleton_setModelPosesFromDict_andUpdateLocalPoses___block_invoke;
  v6[3] = &unk_24CA6E8A0;
  v6[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (v4)
    -[ABPKSkeleton updateLocalPosesFromModelPoses](self, "updateLocalPosesFromModelPoses");
}

void __58__ABPKSkeleton_setModelPosesFromDict_andUpdateLocalPoses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  _OWORD *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v21 = a2;
  v5 = a3;
  v22 = *MEMORY[0x24BDAEE00];
  v23 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  v20 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  v24 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  objc_msgSend(v5, "objectForKey:", CFSTR("translation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v19 = v8;

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v18 = v10;

  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v17 = v12;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = objc_msgSend(*(id *)(v13 + 72), "indexOfJointWithName:", v21);
  *(_QWORD *)&v15 = __PAIR64__(v18, v19);
  *((_QWORD *)&v15 + 1) = __PAIR64__(HIDWORD(v20), v17);
  v16 = (_OWORD *)(*(_QWORD *)(v13 + 32) + (v14 << 6));
  *v16 = v22;
  v16[1] = v23;
  v16[2] = v24;
  v16[3] = v15;

}

- (void)setLocalPoses:(const ABPKTransform *)a3 andUpdateModelPoses:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;

  v4 = a4;
  -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");
  if (v8)
    memmove(self->_localPoses.__begin_, a3, 32 * v8);

  if (v4)
    -[ABPKSkeleton updateModelPosesFromLocalPoses](self, "updateModelPosesFromLocalPoses");
}

- (void)updateLocalPosesFromModelPoses
{
  unint64_t i;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  simd_float4 *v9;
  unint64_t v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  __int128 v14;
  simd_float4 v15;
  __int128 v16;
  simd_float4 v17;
  simd_float4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  simd_float4x4 v22;
  simd_float4x4 v23;

  for (i = 0; ; ++i)
  {
    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition", *(_OWORD *)&v17, *(_OWORD *)&v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "jointCount");

    if (i >= v5)
      break;
    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "parentJoint:", i);

    begin = self->_modelPoses.__begin_;
    v9 = (simd_float4 *)((char *)begin + 64 * i);
    if (v7 == -1)
    {
      *(double *)&v16 = simd_quaternion(*(simd_float4x4 *)v9->f32);
      *((_OWORD *)self->_localPoses.__begin_ + 2 * i) = v16;
      v15 = v9[3];
    }
    else
    {
      v23 = __invert_f4(*((simd_float4x4 *)begin + v7));
      v10 = 0;
      v11 = v9[1];
      v12 = v9[2];
      v13 = v9[3];
      v18 = *v9;
      v19 = (__int128)v11;
      v20 = (__int128)v12;
      v21 = (__int128)v13;
      do
      {
        v22.columns[v10 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v23.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v18 + v10 * 4))), (float32x4_t)v23.columns[1], *(float32x2_t *)&v18.f32[v10], 1), (float32x4_t)v23.columns[2], *(float32x4_t *)((char *)&v18 + v10 * 4), 2), (float32x4_t)v23.columns[3], *(float32x4_t *)((char *)&v18 + v10 * 4), 3);
        v10 += 4;
      }
      while (v10 != 16);
      v17 = v22.columns[3];
      *(double *)&v14 = simd_quaternion(v22);
      v15 = v17;
      *((_OWORD *)self->_localPoses.__begin_ + 2 * i) = v14;
    }
    *((simd_float4 *)self->_localPoses.__begin_ + 2 * i + 1) = v15;
  }
}

- (void)updateModelPosesFromLocalPoses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  ABPKTransform *begin;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  float32x4_t *v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD *v27;
  _OWORD *v28;
  __int128 v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[4];
  _OWORD v36[4];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentChildOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v7), "intValue");
        -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "parentJoint:", v8);

        begin = self->_localPoses.__begin_;
        *(double *)&v12 = simd_matrix4x4(*((float32x4_t *)begin + 2 * v8));
        if (v10 == -1)
        {
          v28 = (_OWORD *)((char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v8);
          *v28 = v12;
          v28[1] = v13;
          v28[2] = v14;
          v28[3] = v15;
          v29 = *((_OWORD *)self->_localPoses.__begin_ + 2 * v8 + 1);
          v30 = (char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v8;
          HIDWORD(v29) = *((_DWORD *)v30 + 15);
          *((_OWORD *)v30 + 3) = v29;
        }
        else
        {
          v16 = 0;
          v17 = *((_OWORD *)begin + 2 * v8 + 1);
          HIDWORD(v17) = HIDWORD(v15);
          v18 = self->_modelPoses.__begin_;
          v19 = (float32x4_t *)((char *)v18 + 64 * v10);
          v20 = *v19;
          v21 = v19[1];
          v22 = v19[2];
          v23 = v19[3];
          v35[0] = v12;
          v35[1] = v13;
          v35[2] = v14;
          v35[3] = v17;
          do
          {
            v36[v16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(v35[v16])), v21, *(float32x2_t *)&v35[v16], 1), v22, (float32x4_t)v35[v16], 2), v23, (float32x4_t)v35[v16], 3);
            ++v16;
          }
          while (v16 != 4);
          v24 = v36[1];
          v25 = v36[2];
          v26 = v36[3];
          v27 = (_OWORD *)((char *)v18 + 64 * (uint64_t)v8);
          *v27 = v36[0];
          v27[1] = v24;
          v27[2] = v25;
          v27[3] = v26;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v5);
  }

}

- (void)scaleTransform:(id *)a3 withScale:(float)a4
{
  float32x4_t v4;

  v4 = vmulq_n_f32(*((float32x4_t *)a3 + 3), a4);
  v4.i32[3] = 1.0;
  *((float32x4_t *)a3 + 3) = v4;
}

- (void)updateJointPosesAndRootTransformUsingDepthEstimatedScale
{
  NSObject *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  float32x4_t *v10;
  float32x4_t v11;
  float32x4_t *v12;
  float estimatedScale;
  float32x4_t v14;
  float32x4_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_estimatedScale == -1.0)
  {
    __ABPKLogSharedInstance();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v2, OS_LOG_TYPE_DEFAULT, " Estimated scale not valid, no need to scale poses. ", buf, 2u);
    }

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentChildOrder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "intValue");
          v10 = (float32x4_t *)((char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v9);
          v11 = vmulq_n_f32(v10[3], self->_estimatedScale);
          v11.i32[3] = 1.0;
          v10[3] = v11;
          v12 = (float32x4_t *)((char *)self->_localPoses.__begin_ + 32 * v9);
          v12[1] = vmulq_n_f32(v12[1], self->_estimatedScale);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v6);
    }

    estimatedScale = self->_estimatedScale;
    v14 = vmulq_n_f32(*(float32x4_t *)&self->_anon_50[48], estimatedScale);
    v14.i32[3] = 1.0;
    *(float32x4_t *)&self->_anon_50[48] = v14;
    v15 = vmulq_n_f32(*(float32x4_t *)&self->_anon_90[48], estimatedScale);
    v15.i32[3] = 1.0;
    *(float32x4_t *)&self->_anon_90[48] = v15;
  }
}

- (void)transformModelPoses:(int)a3 andUpdateLocalPoses:(float32x4_t)a4
{
  _OWORD *v7;
  _OWORD *i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[4];
  _OWORD v17[4];

  v7 = (_OWORD *)*((_QWORD *)a1 + 4);
  for (i = (_OWORD *)*((_QWORD *)a1 + 5); v7 != i; v7 += 4)
  {
    v9 = 0;
    v10 = v7[1];
    v11 = v7[2];
    v12 = v7[3];
    v16[0] = *v7;
    v16[1] = v10;
    v16[2] = v11;
    v16[3] = v12;
    do
    {
      v17[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4, COERCE_FLOAT(v16[v9])), a5, *(float32x2_t *)&v16[v9], 1), a6, (float32x4_t)v16[v9], 2), a7, (float32x4_t)v16[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    v13 = v17[1];
    v14 = v17[2];
    v15 = v17[3];
    *v7 = v17[0];
    v7[1] = v13;
    v7[2] = v14;
    v7[3] = v15;
  }
  if (a3)
    return (void *)objc_msgSend(a1, "updateLocalPosesFromModelPoses");
  return a1;
}

- (id)toDictionary
{
  uint64_t v2;
  unint64_t i;
  void *v4;
  simd_float4 *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  simd_float4 v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  void *v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  void *v29;
  id v31;
  void *v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v37;
  simd_float4 v38;
  _QWORD v39[4];
  _QWORD v40[5];
  simd_float4x4 v41;

  v40[3] = *MEMORY[0x24BDAC8D0];
  v31 = (id)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v2 = 0;
  for (i = 0; -[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount", v31) > i; ++i)
  {
    v4 = (void *)objc_opt_new();
    v5 = (simd_float4 *)((char *)self->_modelPoses.__begin_ + v2);
    v34 = v5[1];
    v35 = *v5;
    v33 = v5[2];
    v37 = v5[3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v6;
    HIDWORD(v7) = v37.i32[1];
    LODWORD(v7) = v37.i32[1];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v37.u32[1], v37.u32[2])));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("translation"));
    v41.columns[1] = v34;
    v41.columns[0] = v35;
    v41.columns[2] = v33;
    v41.columns[3] = v37;
    *(double *)v11.i64 = simd_quaternion(v41);
    v38 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v12;
    HIDWORD(v13) = v38.i32[1];
    LODWORD(v13) = v38.i32[1];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v38.u32[1], v38.u32[3])));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v38.u32[1], v38.u32[2])));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("orientation"));
    -[ABPKSkeletonDefinition jointName:](self->_skeletonDefinition, "jointName:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v4, v18);

    v2 += 64;
  }
  v19 = (void *)objc_opt_new();
  -[ABPKSkeleton cameraRootTransform](self, "cameraRootTransform");
  simdMatrix4x4ToNSMat(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("camera_root_transform"));

  -[ABPKSkeleton deviceRootTransform](self, "deviceRootTransform");
  simdMatrix4x4ToNSMat(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("device_root_transform"));

  objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("pose"));
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v19, CFSTR("root_transforms"));

  return v31;
}

- (float)computeHeight
{
  float estimatedScale;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  uint8_t buf[16];

  if (-[ABPKSkeleton skeletonType](self, "skeletonType") == 3)
  {
    estimatedScale = self->_estimatedScale;
    if (estimatedScale == -1.0)
      return 1.8;
    else
      return estimatedScale * 1.8;
  }
  else
  {
    if (-[ABPKSkeleton skeletonType](self, "skeletonType") != 4)
    {
      __ABPKLogSharedInstance();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Invalid skeleton type specified. Returning height = 0 ", buf, 2u);
      }

    }
    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfJointWithName:", CFSTR("leftfoot"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfJointWithName:", CFSTR("leftleg"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfJointWithName:", CFSTR("leftupleg"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfJointWithName:", CFSTR("hips"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfJointWithName:", CFSTR("spine7"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "indexOfJointWithName:", CFSTR("neck1"));

    -[ABPKSkeleton skeletonDefinition](self, "skeletonDefinition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "indexOfJointWithName:", CFSTR("head"));

    v20 = vsubq_f32(*(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v7 << 6) + 48), *(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v9 << 6) + 48));
    v21 = vmulq_f32(v20, v20);
    v22 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).f32[0]);
    v23 = vsubq_f32(*(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v9 << 6) + 48), *(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v11 << 6) + 48));
    v24 = vmulq_f32(v23, v23);
    v25 = v22
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
    v26.i32[0] = *(_DWORD *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v13 << 6) + 52);
    v39 = v26;
    v27.i32[0] = *(_DWORD *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v11 << 6) + 52);
    v28 = vsubq_f32(v39, v27);
    v29 = vmulq_f32(v28, v28);
    v30 = v25
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0]);
    v31 = vsubq_f32(*(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v13 << 6) + 48), *(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v15 << 6) + 48));
    v32 = vmulq_f32(v31, v31);
    v33 = v30
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0]);
    v34 = vsubq_f32(*(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v15 << 6) + 48), *(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v17 << 6) + 48));
    v35 = vmulq_f32(v34, v34);
    v36 = v33
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0]);
    v37 = vsubq_f32(*(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v17 << 6) + 48), *(float32x4_t *)(-[ABPKSkeleton modelPoses](self, "modelPoses") + (v19 << 6) + 48));
    v38 = vmulq_f32(v37, v37);
    return v36
         + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
  }
}

- (int64_t)skeletonType
{
  return self->_skeletonType;
}

- (ABPKSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (float)estimatedScale
{
  return self->_estimatedScale;
}

- (void)setEstimatedScale:(float)a3
{
  self->_estimatedScale = a3;
}

- (__n128)cameraRootTransform
{
  return a1[5];
}

- (__n128)setCameraRootTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)renderingCameraRootTransform
{
  return a1[9];
}

- (__n128)setRenderingCameraRootTransform:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (__n128)deviceRootTransform
{
  return a1[13];
}

- (__n128)setDeviceRootTransform:(__n128)a3
{
  result[13] = a2;
  result[14] = a3;
  result[15] = a4;
  result[16] = a5;
  return result;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  ABPKTransform *v4;

  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
  begin = self->_modelPoses.__begin_;
  if (begin)
  {
    self->_modelPoses.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_localPoses.__begin_;
  if (v4)
  {
    self->_localPoses.__end_ = v4;
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
