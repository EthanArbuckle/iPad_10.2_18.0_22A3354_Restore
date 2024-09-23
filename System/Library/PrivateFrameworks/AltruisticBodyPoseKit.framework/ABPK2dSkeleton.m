@implementation ABPK2dSkeleton

- (ABPK2dSkeleton)init
{
  char *v2;
  ABPKSkeletonDefinition *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  void *v17;
  unint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  std::vector<unsigned int> v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ABPK2dSkeleton;
  v2 = -[ABPK2dSkeleton init](&v27, sel_init);
  if (v2)
  {
    v3 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 0);
    v4 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v3;

    objc_msgSend(v2, "skeletonDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v26, objc_msgSend(v5, "jointCount"));
    v7 = v2 + 8;
    v6 = (void *)*((_QWORD *)v2 + 1);
    if (v6)
    {
      *((_QWORD *)v2 + 2) = v6;
      operator delete(v6);
      *v7 = 0;
      *((_QWORD *)v2 + 2) = 0;
      *((_QWORD *)v2 + 3) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 8) = v26;
    memset(&v26, 0, sizeof(v26));

    objc_msgSend(v2, "skeletonDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v26, objc_msgSend(v8, "jointCount"));
    v10 = v2 + 32;
    v9 = (void *)*((_QWORD *)v2 + 4);
    if (v9)
    {
      *((_QWORD *)v2 + 5) = v9;
      operator delete(v9);
      *v10 = 0;
      *((_QWORD *)v2 + 5) = 0;
      *((_QWORD *)v2 + 6) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 32) = v26;
    memset(&v26, 0, sizeof(v26));

    v11 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    while (1)
    {
      objc_msgSend(v2, "skeletonDefinition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "jointCount");

      if (v18 <= v11)
        break;
      *(_QWORD *)(*v7 + 8 * v11) = _D8;
      *(_QWORD *)(*v10 + 8 * v11++) = _D8;
    }
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 136) = _Q0;
    *((_QWORD *)v2 + 16) = 0;
    objc_msgSend(v2, "skeletonDefinition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<float>::vector(&v26, objc_msgSend(v20, "jointCount"));
    v21 = (void *)*((_QWORD *)v2 + 7);
    if (v21)
    {
      *((_QWORD *)v2 + 8) = v21;
      operator delete(v21);
      *((_QWORD *)v2 + 7) = 0;
      *((_QWORD *)v2 + 8) = 0;
      *((_QWORD *)v2 + 9) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 56) = v26;
    memset(&v26, 0, sizeof(v26));

    objc_msgSend(v2, "skeletonDefinition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned int>::vector(&v26, objc_msgSend(v22, "jointCount"));
    v23 = (void *)*((_QWORD *)v2 + 10);
    if (v23)
    {
      *((_QWORD *)v2 + 11) = v23;
      operator delete(v23);
      *((_QWORD *)v2 + 10) = 0;
      *((_QWORD *)v2 + 11) = 0;
      *((_QWORD *)v2 + 12) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 80) = v26;
    memset(&v26, 0, sizeof(v26));

    v2[104] = 0;
    v24 = v2;
  }

  return (ABPK2dSkeleton *)v2;
}

- (ABPK2dSkeleton)initWithType:(int64_t)a3
{
  ABPK2dSkeleton *v4;
  ABPK2dSkeleton *v5;
  ABPKSkeletonDefinition *v6;
  ABPKSkeletonDefinition *skeletonDefinition;
  void *v8;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  void *v10;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v11;
  void *v12;
  float *begin;
  void *v14;
  unsigned int *v15;
  ABPK2dSkeleton *v16;
  std::vector<unsigned int> v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ABPK2dSkeleton;
  v4 = -[ABPK2dSkeleton init](&v19, sel_init);
  v5 = v4;
  if (v4
    && (v4->_skeletonType = a3,
        v6 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", a3), skeletonDefinition = v5->_skeletonDefinition, v5->_skeletonDefinition = v6, skeletonDefinition, v5->_skeletonDefinition))
  {
    -[ABPK2dSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v18, objc_msgSend(v8, "jointCount"));
    var0 = v5->_keypoints2d.var0;
    if (var0)
    {
      *(_QWORD *)v5->_anon_10 = var0;
      operator delete(var0);
      v5->_keypoints2d.var0 = 0;
      *(_QWORD *)v5->_anon_10 = 0;
      *(_QWORD *)&v5->_anon_10[8] = 0;
    }
    *(std::vector<unsigned int> *)&v5->_keypoints2d.var0 = v18;
    memset(&v18, 0, sizeof(v18));

    -[ABPK2dSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v18, objc_msgSend(v10, "jointCount"));
    v11 = v5->_normalizedKeypoints2d.var0;
    if (v11)
    {
      *(_QWORD *)v5->_anon_28 = v11;
      operator delete(v11);
      v5->_normalizedKeypoints2d.var0 = 0;
      *(_QWORD *)v5->_anon_28 = 0;
      *(_QWORD *)&v5->_anon_28[8] = 0;
    }
    *(std::vector<unsigned int> *)&v5->_normalizedKeypoints2d.var0 = v18;
    memset(&v18, 0, sizeof(v18));

    -[ABPK2dSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<float>::vector(&v18, objc_msgSend(v12, "jointCount"));
    begin = v5->_confidences.__begin_;
    if (begin)
    {
      v5->_confidences.__end_ = begin;
      operator delete(begin);
      v5->_confidences.__begin_ = 0;
      v5->_confidences.__end_ = 0;
      v5->_confidences.__end_cap_.__value_ = 0;
    }
    v5->_confidences = (vector<float, std::allocator<float>>)v18;
    memset(&v18, 0, sizeof(v18));

    -[ABPK2dSkeleton skeletonDefinition](v5, "skeletonDefinition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned int>::vector(&v18, objc_msgSend(v14, "jointCount"));
    v15 = v5->_visibility.__begin_;
    if (v15)
    {
      v5->_visibility.__end_ = v15;
      operator delete(v15);
      v5->_visibility.__begin_ = 0;
      v5->_visibility.__end_ = 0;
      v5->_visibility.__end_cap_.__value_ = 0;
    }
    v5->_visibility = (vector<unsigned int, std::allocator<unsigned int>>)v18;
    memset(&v18, 0, sizeof(v18));

    v16 = v5;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  unint64_t i;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  for (i = 0; i < -[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"); ++i)
  {
    -[ABPKSkeletonDefinition jointName:](self->_skeletonDefinition, "jointName:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ : (%f, %f)\n"), v5, COERCE_FLOAT(self->_keypoints2d.var0[i]), COERCE_FLOAT((unint64_t)self->_keypoints2d.var0[i] >> 32));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)setNormalizedKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2
{
  const void *v2;
  double v3;
  double v4;
  const void *v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  float64x2_t v11;
  void *v16;
  unint64_t v17;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v18;
  NSObject *v20;
  CGFloat v21;
  CGFloat v22;
  float64x2_t v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v21 = v3;
  v22 = v4;
  v5 = v2;
  v26 = *MEMORY[0x24BDAC8D0];
  -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");
  if (v8)
    memmove(self->_normalizedKeypoints2d.var0, v5, 8 * v8);

  v9 = 0;
  v10 = 0;
  v11.f64[0] = v21;
  v11.f64[1] = v22;
  v23 = v11;
  __asm { FMOV            V9.2S, #-1.0 }
  while (1)
  {
    -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "jointCount");

    if (v17 <= v9)
      break;
    v18 = self->_normalizedKeypoints2d.var0[v9];
    if (*(float *)&v18 == -1.0 || COERCE_FLOAT((unint64_t)self->_normalizedKeypoints2d.var0[v9] >> 32) == -1.0)
    {
      self->_keypoints2d.var0[v9] = _D9;
      ++v10;
    }
    else
    {
      self->_keypoints2d.var0[v9] = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)vcvt_f32_f64(vmulq_f64(v23, vcvtq_f64_f32((float32x2_t)v18)));
    }
    ++v9;
  }
  __ABPKLogSharedInstance();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v25 = v10;
    _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_DEBUG, " missingJointsCount: %d ", buf, 8u);
  }

  self->_imageRes.width = v21;
  self->_imageRes.height = v22;
  -[ABPK2dSkeleton computeBoundingBox](self, "computeBoundingBox");
}

- (void)setKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2
{
  const void *v2;
  double v3;
  double v4;
  const void *v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  float64x2_t v10;
  void *v15;
  unint64_t v16;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v17;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v19;
  CGFloat v20;
  CGFloat v21;
  float64x2_t v22;

  v20 = v3;
  v21 = v4;
  v5 = v2;
  -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");
  if (v8)
    memmove(self->_keypoints2d.var0, v5, 8 * v8);

  v9 = 0;
  v10.f64[0] = v20;
  v10.f64[1] = v21;
  v22 = v10;
  __asm { FMOV            V8.2S, #-1.0 }
  while (1)
  {
    -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "jointCount");

    if (v16 <= v9)
      break;
    v17 = self->_keypoints2d.var0[v9];
    _ZF = *(float *)&v17 == -1.0 || COERCE_FLOAT((unint64_t)self->_keypoints2d.var0[v9] >> 32) == -1.0;
    v19 = _D8;
    if (!_ZF)
      v19 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)v17), v22));
    self->_normalizedKeypoints2d.var0[v9++] = v19;
  }
  self->_imageRes.width = v20;
  self->_imageRes.height = v21;
  -[ABPK2dSkeleton computeBoundingBox](self, "computeBoundingBox");
}

- (void)computeBoundingBox
{
  unint64_t v3;
  float v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  unint64_t v9;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v11;
  float v13;

  v3 = 0;
  v4 = 0.0;
  v5 = 3.4028e38;
  v6 = 0.0;
  v7 = 3.4028e38;
  while (1)
  {
    -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "jointCount");

    if (v9 <= v3)
      break;
    var0 = self->_keypoints2d.var0;
    v11 = var0[v3];
    if (*(float *)&v11 != -1.0 && *((float *)&v11 + 1) != -1.0)
    {
      if (*(float *)&v11 > v6)
        v13 = *(float *)&v11;
      else
        v13 = v6;
      if (*(float *)&v11 < v7)
        v7 = *(float *)&v11;
      else
        v6 = v13;
      if (*((float *)&v11 + 1) >= v5)
      {
        if (*((float *)&v11 + 1) > v4)
          LODWORD(v4) = HIDWORD(var0[v3]);
      }
      else
      {
        LODWORD(v5) = HIDWORD(var0[v3]);
      }
    }
    ++v3;
  }
  self->_boundingBox.origin.x = v7;
  self->_boundingBox.origin.y = v5;
  self->_boundingBox.size.width = (float)((float)(v6 - v7) + 1.0);
  self->_boundingBox.size.height = (float)((float)(v4 - v5) + 1.0);
}

- (void)setJointConfidences:(const float *)a3
{
  uint64_t v5;
  id v6;

  -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "jointCount");
  if (v5)
    memmove(self->_confidences.__begin_, a3, 4 * v5);

}

- (void)setJointVisibility:(const unsigned int *)a3
{
  uint64_t v5;
  id v6;

  -[ABPK2dSkeleton skeletonDefinition](self, "skeletonDefinition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "jointCount");
  if (v5)
    memmove(self->_visibility.__begin_, a3, 4 * v5);

}

- (void)setHasMissingJoints:(BOOL)a3
{
  self->_hasMissingJoints = a3;
}

- (uint64_t)keypoints2d
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)normalizedKeypoints2d
{
  return *(_QWORD *)(a1 + 32);
}

- (const)confidences
{
  return self->_confidences.__begin_;
}

- (const)visibility
{
  return self->_visibility.__begin_;
}

- (BOOL)hasMissingJoints
{
  return self->_hasMissingJoints;
}

- (void)printData
{
  NSObject *v3;
  CGFloat width;
  CGFloat height;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  double v11;
  double v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  double v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    width = self->_imageRes.width;
    height = self->_imageRes.height;
    *(_DWORD *)buf = 134218240;
    v18 = width;
    v19 = 2048;
    v20 = height;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " Image res: %f,%f ", buf, 0x16u);
  }

  if (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"))
  {
    v6 = 0;
    do
    {
      __ABPKLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[ABPKSkeletonDefinition jointName:](self->_skeletonDefinition, "jointName:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = *(double *)&v8;
        _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " %@ ", buf, 0xCu);

      }
      __ABPKLogSharedInstance();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        var0 = self->_keypoints2d.var0;
        v11 = COERCE_FLOAT(var0[v6]);
        v12 = COERCE_FLOAT((unint64_t)var0[v6] >> 32);
        *(_DWORD *)buf = 134218240;
        v18 = v11;
        v19 = 2048;
        v20 = v12;
        _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " \t Keypoint:    (%f,%f) ", buf, 0x16u);
      }

      __ABPKLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = self->_visibility.__begin_[v6];
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v14;
        _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " \t Visibility:  %u ", buf, 8u);
      }

      __ABPKLogSharedInstance();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = self->_confidences.__begin_[v6];
        *(_DWORD *)buf = 134217984;
        v18 = v16;
        _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \t Confidence:  %f ", buf, 0xCu);
      }

      ++v6;
    }
    while (v6 < -[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount"));
  }
}

- (id)toDictionary
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = 0;
  v5 = 4;
  while (-[ABPKSkeletonDefinition jointCount](self->_skeletonDefinition, "jointCount") > v4)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&self->_keypoints2d.var0[v4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    LODWORD(v8) = *(_DWORD *)((char *)self->_keypoints2d.var0 + v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("positions2d"));
    *(float *)&v11 = self->_confidences.__begin_[v4];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("confidence"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_visibility.__begin_[v4]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("visibility"));

    -[ABPKSkeletonDefinition jointName:](self->_skeletonDefinition, "jointName:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v14);

    ++v4;
    v5 += 8;
  }
  return v3;
}

- (int)overlaySkeletonOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:
{
  double v4;
  NSObject *v8;
  double v10;
  uint8_t buf[16];

  if (!a4)
  {
    v10 = v4;
    __ABPKLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_ERROR, " Overlay image not initialized ", buf, 2u);
    }

    v4 = v10;
  }
  return overlay2dResultOnImage(self, (uint64_t)a3, (uint64_t)a4, v4);
}

- (int64_t)skeletonType
{
  return self->_skeletonType;
}

- (ABPKSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)imageRes
{
  double width;
  double height;
  CGSize result;

  width = self->_imageRes.width;
  height = self->_imageRes.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (void).cxx_destruct
{
  unsigned int *begin;
  float *v4;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v6;

  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
  begin = self->_visibility.__begin_;
  if (begin)
  {
    self->_visibility.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_confidences.__begin_;
  if (v4)
  {
    self->_confidences.__end_ = v4;
    operator delete(v4);
  }
  var0 = self->_normalizedKeypoints2d.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v6 = self->_keypoints2d.var0;
  if (v6)
  {
    *(_QWORD *)self->_anon_10 = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
