@implementation ARPointCloud

- (ARPointCloud)initWithPointData:(id)a3
{
  unint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  char *v9;
  uint64_t v10;
  float64x2_t *v11;
  float v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  ARPointCloud *v34;
  id v36;
  void *v37;
  __int128 v38;
  void *v39;
  void *v40;
  char *v41;
  void *v42[2];
  char *v43;
  void *__p;
  char *v45;
  char *v46;
  __int128 v47;
  char *v48;

  v47 = 0uLL;
  v48 = 0;
  __p = 0;
  v45 = 0;
  v46 = 0;
  v36 = a3;
  v4 = objc_msgSend(v36, "length");
  v5 = objc_retainAutorelease(v36);
  v6 = objc_msgSend(v5, "bytes");
  v7 = v4 >> 5;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v47, v4 >> 5);
  std::vector<unsigned long long>::reserve(&__p, v4 >> 5);
  v37 = v5;
  if (v4 > 0x1F)
  {
    v10 = 0;
    if (v7 <= 1)
      v7 = 1;
    do
    {
      v11 = (float64x2_t *)(v6 + 32 * v10);
      *(float32x2_t *)&v8 = vcvt_f32_f64(*v11);
      v12 = v11[1].f64[0];
      *((float *)&v8 + 2) = v12;
      v13 = *((_QWORD *)&v47 + 1);
      if (*((_QWORD *)&v47 + 1) >= (unint64_t)v48)
      {
        v38 = v8;
        v15 = (uint64_t)(*((_QWORD *)&v47 + 1) - v47) >> 4;
        if ((unint64_t)(v15 + 1) >> 60)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        v16 = (uint64_t)&v48[-v47] >> 3;
        if (v16 <= v15 + 1)
          v16 = v15 + 1;
        if ((unint64_t)&v48[-v47] >= 0x7FFFFFFFFFFFFFF0)
          v17 = 0xFFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v18 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v48, v17);
        else
          v18 = 0;
        v19 = &v18[16 * v15];
        *(_OWORD *)v19 = v38;
        v14 = v19 + 16;
        v20 = (char *)*((_QWORD *)&v47 + 1);
        v21 = (char *)v47;
        if (*((_QWORD *)&v47 + 1) != (_QWORD)v47)
        {
          do
          {
            v22 = *((_OWORD *)v20 - 1);
            v20 -= 16;
            *((_OWORD *)v19 - 1) = v22;
            v19 -= 16;
          }
          while (v20 != v21);
          v20 = (char *)v47;
        }
        *(_QWORD *)&v47 = v19;
        *((_QWORD *)&v47 + 1) = v14;
        v48 = &v18[16 * v17];
        if (v20)
          operator delete(v20);
      }
      else
      {
        **((_OWORD **)&v47 + 1) = v8;
        v14 = (_OWORD *)(v13 + 16);
      }
      *((_QWORD *)&v47 + 1) = v14;
      v23 = *(int *)(v6 + 32 * v10 + 24);
      v24 = v45;
      if (v45 >= v46)
      {
        v25 = (char *)__p;
        v26 = (v45 - (_BYTE *)__p) >> 3;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        v28 = v46 - (_BYTE *)__p;
        if ((v46 - (_BYTE *)__p) >> 2 > v27)
          v27 = v28 >> 2;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v29 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v46, v29);
          v25 = (char *)__p;
          v24 = v45;
        }
        else
        {
          v30 = 0;
        }
        v31 = &v30[8 * v26];
        *(_QWORD *)v31 = v23;
        v9 = v31 + 8;
        while (v24 != v25)
        {
          v32 = *((_QWORD *)v24 - 1);
          v24 -= 8;
          *((_QWORD *)v31 - 1) = v32;
          v31 -= 8;
        }
        __p = v31;
        v45 = v9;
        v46 = &v30[8 * v29];
        if (v25)
          operator delete(v25);
      }
      else
      {
        *(_QWORD *)v45 = v23;
        v9 = v24 + 8;
      }
      v45 = v9;
      ++v10;
    }
    while (v10 != v7);
  }
  else
  {
    v9 = v45;
  }
  *(_OWORD *)v42 = v47;
  v33 = v48;
  v48 = 0;
  v47 = 0uLL;
  v39 = __p;
  v40 = v9;
  v41 = v46;
  v45 = 0;
  v46 = 0;
  v43 = v33;
  __p = 0;
  v34 = -[ARPointCloud initWithPointsVector:identifiersVector:](self, "initWithPointsVector:identifiersVector:", v42, &v39);
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }
  if (__p)
  {
    v45 = (char *)__p;
    operator delete(__p);
  }
  if ((_QWORD)v47)
  {
    *((_QWORD *)&v47 + 1) = v47;
    operator delete((void *)v47);
  }

  return v34;
}

- (ARPointCloud)initWithCV3DPointData:(id)a3 minVergenceAngleCosine:(double)a4
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  float64x2_t *v14;
  float v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  float v37;
  char *v38;
  void *v39;
  char *v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  float *v46;
  int v47;
  ARPointCloud *v48;
  id v50;
  void *v51;
  __int128 v52;
  void *v53[2];
  char *v54;
  void *v55[2];
  char *v56;
  void *v57[2];
  char *v58;
  void *__p[2];
  char *v60;
  __int128 v61;
  char *v62;
  __int128 v63;
  char *v64;

  v63 = 0uLL;
  v64 = 0;
  v61 = 0uLL;
  v62 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v60 = 0;
  v50 = a3;
  v6 = objc_msgSend(v50, "length");
  v7 = objc_retainAutorelease(v50);
  v8 = objc_msgSend(v7, "bytes");
  v9 = v6 / 0x28;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v63, v6 / 0x28);
  std::vector<unsigned long long>::reserve((void **)&v61, v6 / 0x28);
  std::vector<float>::reserve(__p, v6 / 0x28);
  v51 = v7;
  if (v6 >= 0x28)
  {
    v12 = 0;
    v11 = 0;
    if (v9 <= 1)
      v9 = 1;
    do
    {
      v13 = *(double *)(v8 + 40 * v12 + 32);
      if (v13 <= a4)
      {
        v14 = (float64x2_t *)(v8 + 40 * v12);
        *(float32x2_t *)&v10 = vcvt_f32_f64(*v14);
        v15 = v14[1].f64[0];
        *((float *)&v10 + 2) = v15;
        v16 = *((_QWORD *)&v63 + 1);
        if (*((_QWORD *)&v63 + 1) >= (unint64_t)v64)
        {
          v52 = v10;
          v18 = (uint64_t)(*((_QWORD *)&v63 + 1) - v63) >> 4;
          if ((unint64_t)(v18 + 1) >> 60)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v19 = (uint64_t)&v64[-v63] >> 3;
          if (v19 <= v18 + 1)
            v19 = v18 + 1;
          if ((unint64_t)&v64[-v63] >= 0x7FFFFFFFFFFFFFF0)
            v20 = 0xFFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v21 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v64, v20);
          else
            v21 = 0;
          v22 = &v21[16 * v18];
          *(_OWORD *)v22 = v52;
          v17 = v22 + 16;
          v23 = (char *)*((_QWORD *)&v63 + 1);
          v24 = (char *)v63;
          if (*((_QWORD *)&v63 + 1) != (_QWORD)v63)
          {
            do
            {
              v25 = *((_OWORD *)v23 - 1);
              v23 -= 16;
              *((_OWORD *)v22 - 1) = v25;
              v22 -= 16;
            }
            while (v23 != v24);
            v23 = (char *)v63;
          }
          *(_QWORD *)&v63 = v22;
          *((_QWORD *)&v63 + 1) = v17;
          v64 = &v21[16 * v20];
          if (v23)
            operator delete(v23);
        }
        else
        {
          **((_OWORD **)&v63 + 1) = v10;
          v17 = (_OWORD *)(v16 + 16);
        }
        *((_QWORD *)&v63 + 1) = v17;
        v26 = *(_QWORD *)(v8 + 40 * v12 + 24);
        v27 = (char *)*((_QWORD *)&v61 + 1);
        if (*((_QWORD *)&v61 + 1) >= (unint64_t)v62)
        {
          v29 = (char *)v61;
          v30 = (uint64_t)(*((_QWORD *)&v61 + 1) - v61) >> 3;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v32 = (uint64_t)&v62[-v61];
          if ((uint64_t)&v62[-v61] >> 2 > v31)
            v31 = v32 >> 2;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8)
            v33 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v33 = v31;
          if (v33)
          {
            v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v62, v33);
            v27 = (char *)*((_QWORD *)&v61 + 1);
            v29 = (char *)v61;
          }
          else
          {
            v34 = 0;
          }
          v35 = &v34[8 * v30];
          *(_QWORD *)v35 = v26;
          v28 = v35 + 8;
          while (v27 != v29)
          {
            v36 = *((_QWORD *)v27 - 1);
            v27 -= 8;
            *((_QWORD *)v35 - 1) = v36;
            v35 -= 8;
          }
          *(_QWORD *)&v61 = v35;
          *((_QWORD *)&v61 + 1) = v28;
          v62 = &v34[8 * v33];
          if (v29)
            operator delete(v29);
        }
        else
        {
          **((_QWORD **)&v61 + 1) = v26;
          v28 = v27 + 8;
        }
        *((_QWORD *)&v61 + 1) = v28;
        v37 = v13;
        v38 = (char *)__p[1];
        if (__p[1] >= v60)
        {
          v40 = (char *)__p[0];
          v41 = ((char *)__p[1] - (char *)__p[0]) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v43 = v60 - (char *)__p[0];
          if ((v60 - (char *)__p[0]) >> 1 > v42)
            v42 = v43 >> 1;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL)
            v44 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v60, v44);
            v40 = (char *)__p[0];
            v38 = (char *)__p[1];
          }
          else
          {
            v45 = 0;
          }
          v46 = (float *)&v45[4 * v41];
          *v46 = v37;
          v39 = v46 + 1;
          while (v38 != v40)
          {
            v47 = *((_DWORD *)v38 - 1);
            v38 -= 4;
            *((_DWORD *)v46-- - 1) = v47;
          }
          __p[0] = v46;
          __p[1] = v39;
          v60 = &v45[4 * v44];
          if (v40)
            operator delete(v40);
        }
        else
        {
          *(float *)__p[1] = v37;
          v39 = v38 + 4;
        }
        __p[1] = v39;
        ++v11;
      }
      ++v12;
    }
    while (v12 != v9);
  }
  else
  {
    v11 = 0;
  }
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&v63, v11);
  std::vector<unsigned long long>::resize((uint64_t)&v61, v11);
  std::vector<float>::resize((uint64_t)__p, v11);
  *(_OWORD *)v57 = v63;
  v58 = v64;
  v64 = 0;
  v63 = 0uLL;
  *(_OWORD *)v55 = v61;
  v56 = v62;
  v61 = 0uLL;
  v62 = 0;
  *(_OWORD *)v53 = *(_OWORD *)__p;
  v54 = v60;
  __p[1] = 0;
  v60 = 0;
  __p[0] = 0;
  v48 = -[ARPointCloud initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:](self, "initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:", v57, v55, v53);
  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((_QWORD)v61)
  {
    *((_QWORD *)&v61 + 1) = v61;
    operator delete((void *)v61);
  }
  if ((_QWORD)v63)
  {
    *((_QWORD *)&v63 + 1) = v63;
    operator delete((void *)v63);
  }

  return v48;
}

- (ARPointCloud)initWithPointsVector:(vector<float)__attribute__((ext_vector_type(3 identifiersVector:
{
  ARPointCloud *v4;
  void *__p;
  void *v7;
  uint64_t v8;
  vector<unsigned long long, std::allocator<unsigned long long>> v9;
  __int128 v10;
  uint64_t v11;

  v10 = *(_OWORD *)a3.var0;
  v11 = *((_QWORD *)a3.var0 + 2);
  *((_QWORD *)a3.var0 + 1) = 0;
  *((_QWORD *)a3.var0 + 2) = 0;
  *a3.var0 = 0;
  v9 = *a4;
  a4->__end_ = 0;
  a4->__end_cap_.__value_ = 0;
  a4->__begin_ = 0;
  v7 = 0;
  v8 = 0;
  __p = 0;
  v4 = -[ARPointCloud initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:](self, "initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:", &v10, &v9, &__p);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }
  if ((_QWORD)v10)
  {
    *((_QWORD *)&v10 + 1) = v10;
    operator delete((void *)v10);
  }

  return v4;
}

- (ARPointCloud)initWithPointsVector:(ARPointCloud *)self identifiersVector:(SEL)a2 vergenceAngleCosinesVector:(vector<float)__attribute__((ext_vector_type(3
{
  ARPointCloud *v8;
  ARPointCloud *v9;
  int32x4_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARPointCloud;
  v8 = -[ARPointCloud init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v8->_pointsVector, (__n128 *)a3.var0);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v9->_identifiersVector, (__n128 *)a4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v9->_vergenceAngleCosinesVector, (__n128 *)a5);
    v10 = vdupq_n_s32(0x7FC00000u);
    *(int32x4_t *)v9->_centroid = v10;
    *(int32x4_t *)v9->_standardDeviation = v10;
  }
  return v9;
}

- (ARPointCloud)initWithDepthPointCloud:(id)a3
{
  id v5;
  int v6;
  ARPointCloud *v7;
  ARPointCloud *v8;
  unint64_t *begin;
  float *v10;
  vector<float, std::allocator<float>> *p_vergenceAngleCosinesVector;
  int32x4_t v12;
  __int128 v14;
  unint64_t *v15;
  objc_super v16;

  v5 = a3;
  kdebug_trace();
  v6 = objc_msgSend(v5, "length");
  v16.receiver = self;
  v16.super_class = (Class)ARPointCloud;
  v7 = -[ARPointCloud init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_depthPointCloud, a3);
    std::vector<unsigned long long>::vector(&v14, v6);
    begin = v8->_identifiersVector.__begin_;
    if (begin)
    {
      v8->_identifiersVector.__end_ = begin;
      operator delete(begin);
      v8->_identifiersVector.__begin_ = 0;
      v8->_identifiersVector.__end_ = 0;
      v8->_identifiersVector.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v8->_identifiersVector.__begin_ = v14;
    v8->_identifiersVector.__end_cap_.__value_ = v15;
    p_vergenceAngleCosinesVector = &v8->_vergenceAngleCosinesVector;
    v10 = v8->_vergenceAngleCosinesVector.__begin_;
    if (v10)
    {
      v8->_vergenceAngleCosinesVector.__end_ = v10;
      operator delete(v10);
      p_vergenceAngleCosinesVector->__begin_ = 0;
      v8->_vergenceAngleCosinesVector.__end_ = 0;
      v8->_vergenceAngleCosinesVector.__end_cap_.__value_ = 0;
    }
    p_vergenceAngleCosinesVector->__begin_ = 0;
    v8->_vergenceAngleCosinesVector.__end_ = 0;
    v8->_vergenceAngleCosinesVector.__end_cap_.__value_ = 0;
    v12 = vdupq_n_s32(0x7FC00000u);
    *(int32x4_t *)v8->_centroid = v12;
    *(int32x4_t *)v8->_standardDeviation = v12;
  }
  kdebug_trace();

  return v8;
}

- (NSUInteger)count
{
  ADJasperPointCloud *depthPointCloud;

  depthPointCloud = self->_depthPointCloud;
  if (depthPointCloud)
    return (int)-[ADJasperPointCloud length](depthPointCloud, "length");
  else
    return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_pointsVector.var0) >> 4;
}

- (const)points
{
  ADJasperPointCloud *depthPointCloud;

  depthPointCloud = self->_depthPointCloud;
  if (depthPointCloud)
    return (const simd_float3 *)-[ADJasperPointCloud points](depthPointCloud, "points");
  else
    return (const simd_float3 *)self->_pointsVector.var0;
}

- (id)depthPointCloud
{
  return self->_depthPointCloud;
}

- (const)identifiers
{
  return self->_identifiersVector.__begin_;
}

- (const)vergenceAngleCosines
{
  if (self->_vergenceAngleCosinesVector.__end_ == self->_vergenceAngleCosinesVector.__begin_)
    return 0;
  else
    return self->_vergenceAngleCosinesVector.__begin_;
}

- (double)computeBounds
{
  unint64_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  double result;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;

  if (!objc_msgSend(a1, "count"))
    return 0.0;
  if (objc_msgSend(a1, "count"))
  {
    v2 = 0;
    v3.i64[0] = 0x80000000800000;
    v3.i64[1] = 0x80000000800000;
    v11 = v3;
    v13 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
    do
    {
      v4 = *(float32x4_t *)(objc_msgSend(a1, "points", *(_OWORD *)&v11, *(_OWORD *)&v13) + 16 * v2);
      v4.i32[3] = 0;
      v5 = v14;
      v5.i32[3] = 0;
      v6 = vminnmq_f32(v4, v5);
      v7 = v12;
      v7.i32[3] = 0;
      v11 = vmaxnmq_f32(v4, v7);
      v13 = v6;
      ++v2;
    }
    while (v2 < objc_msgSend(a1, "count"));
  }
  else
  {
    v9.i64[0] = 0x80000000800000;
    v9.i64[1] = 0x80000000800000;
    v11 = v9;
    v13 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
  }
  v10.i64[0] = 0x3F0000003F000000;
  v10.i64[1] = 0x3F0000003F000000;
  *(_QWORD *)&result = vaddq_f32(v13, vmulq_f32(vsubq_f32(v11, v13), v10)).u64[0];
  return result;
}

- (__n128)centroid
{
  return a1[5];
}

- (__n128)standardDeviation
{
  return a1[6];
}

- (id)filterPointCloudFrom:(ARPointCloud *)self ellipsoid:(SEL)a2
{
  float32x4_t v2;
  int8x16_t v3;
  unint64_t v5;
  int8x16_t v6;
  const simd_float3 *v7;
  const simd_float3 *v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  unint64_t *begin;
  char *v20;
  void *v21;
  char *v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  ARPointCloud *v30;
  ARPointCloud *v31;
  int8x16_t v33;
  float32x4_t v34;
  float v35;
  void *v36[2];
  char *v37;
  void *v38[2];
  char *v39;
  void *__p[2];
  char *v41;
  __int128 v42;
  char *v43;

  v34 = v2;
  v35 = *(float *)v3.i32;
  v5 = 0;
  v42 = 0uLL;
  v43 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v41 = 0;
  v3.i32[0] = vextq_s8(v3, v3, 8uLL).u32[0];
  v33 = v3;
  while (v5 < -[ARPointCloud count](self, "count", *(_OWORD *)&v33))
  {
    v6 = (int8x16_t)vabdq_f32((float32x4_t)-[ARPointCloud points](self, "points")[16 * v5], v34);
    if (*(float *)v6.i32 < v35)
    {
      v6.i32[0] = vextq_s8(v6, v6, 8uLL).u32[0];
      *(int32x2_t *)v6.i8 = vcgt_f32(*(float32x2_t *)v33.i8, *(float32x2_t *)v6.i8);
      if ((v6.i8[4] & 1) != 0 && (v6.i8[0] & 1) != 0)
      {
        v7 = -[ARPointCloud points](self, "points");
        v8 = v7;
        v9 = *((_QWORD *)&v42 + 1);
        if (*((_QWORD *)&v42 + 1) >= (unint64_t)v43)
        {
          v11 = (uint64_t)(*((_QWORD *)&v42 + 1) - v42) >> 4;
          if ((unint64_t)(v11 + 1) >> 60)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v12 = (uint64_t)&v43[-v42] >> 3;
          if (v12 <= v11 + 1)
            v12 = v11 + 1;
          if ((unint64_t)&v43[-v42] >= 0x7FFFFFFFFFFFFFF0)
            v13 = 0xFFFFFFFFFFFFFFFLL;
          else
            v13 = v12;
          if (v13)
            v14 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v43, v13);
          else
            v14 = 0;
          v15 = &v14[16 * v11];
          *(simd_float3 *)v15 = v8[v5];
          v10 = v15 + 16;
          v16 = (char *)*((_QWORD *)&v42 + 1);
          v17 = (char *)v42;
          if (*((_QWORD *)&v42 + 1) != (_QWORD)v42)
          {
            do
            {
              v18 = *((_OWORD *)v16 - 1);
              v16 -= 16;
              *((_OWORD *)v15 - 1) = v18;
              v15 -= 16;
            }
            while (v16 != v17);
            v16 = (char *)v42;
          }
          *(_QWORD *)&v42 = v15;
          *((_QWORD *)&v42 + 1) = v10;
          v43 = &v14[16 * v13];
          if (v16)
            operator delete(v16);
        }
        else
        {
          **((_OWORD **)&v42 + 1) = v7[v5];
          v10 = (_OWORD *)(v9 + 16);
        }
        *((_QWORD *)&v42 + 1) = v10;
        begin = self->_identifiersVector.__begin_;
        v20 = (char *)__p[1];
        if (__p[1] >= v41)
        {
          v22 = (char *)__p[0];
          v23 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v25 = v41 - (char *)__p[0];
          if ((v41 - (char *)__p[0]) >> 2 > v24)
            v24 = v25 >> 2;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v26 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v41, v26);
            v22 = (char *)__p[0];
            v20 = (char *)__p[1];
          }
          else
          {
            v27 = 0;
          }
          v28 = &v27[8 * v23];
          *(_QWORD *)v28 = begin[v5];
          v21 = v28 + 8;
          while (v20 != v22)
          {
            v29 = *((_QWORD *)v20 - 1);
            v20 -= 8;
            *((_QWORD *)v28 - 1) = v29;
            v28 -= 8;
          }
          __p[0] = v28;
          __p[1] = v21;
          v41 = &v27[8 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *(_QWORD *)__p[1] = begin[v5];
          v21 = v20 + 8;
        }
        __p[1] = v21;
      }
    }
    ++v5;
  }
  v30 = [ARPointCloud alloc];
  *(_OWORD *)v38 = v42;
  v39 = v43;
  v43 = 0;
  v42 = 0uLL;
  *(_OWORD *)v36 = *(_OWORD *)__p;
  v37 = v41;
  __p[0] = 0;
  __p[1] = 0;
  v41 = 0;
  v31 = -[ARPointCloud initWithPointsVector:identifiersVector:](v30, "initWithPointsVector:identifiersVector:", v38, v36);
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v38[0])
  {
    v38[1] = v38[0];
    operator delete(v38[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((_QWORD)v42)
  {
    *((_QWORD *)&v42 + 1) = v42;
    operator delete((void *)v42);
  }
  return v31;
}

- (id)filterPointCloudWithIdentifiers:(set<unsigned long)long
{
  unint64_t v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *p_var1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *left;
  unint64_t v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *v8;
  unint64_t v9;
  BOOL v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **v11;
  const simd_float3 *v12;
  const simd_float3 *v13;
  char *v14;
  void *v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  unint64_t *begin;
  char *v25;
  void *v26;
  char *v27;
  int64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  ARPointCloud *v35;
  ARPointCloud *v36;
  void *v38[2];
  char *v39;
  void *v40[2];
  char *v41;
  void *__p[2];
  char *v43;
  void *v44[2];
  char *v45;

  v4 = 0;
  v44[0] = 0;
  v44[1] = 0;
  v45 = 0;
  p_var1 = &a3->var0.var1;
  __p[0] = 0;
  __p[1] = 0;
  v43 = 0;
  while (v4 < -[ARPointCloud count](self, "count"))
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)p_var1->var0.__left_;
    if (p_var1->var0.__left_)
    {
      v7 = self->_identifiersVector.__begin_[v4];
      v8 = p_var1;
      do
      {
        v9 = (unint64_t)left[4].var0.__left_;
        v10 = v9 >= v7;
        if (v9 >= v7)
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)left;
        else
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)&left[1];
        if (v10)
          v8 = left;
        left = *v11;
      }
      while (*v11);
      if (v8 != p_var1 && (void *)v7 >= v8[4].var0.__left_)
      {
        v12 = -[ARPointCloud points](self, "points");
        v13 = v12;
        v14 = (char *)v44[1];
        if (v44[1] >= v45)
        {
          v16 = ((char *)v44[1] - (char *)v44[0]) >> 4;
          if ((unint64_t)(v16 + 1) >> 60)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v17 = (v45 - (char *)v44[0]) >> 3;
          if (v17 <= v16 + 1)
            v17 = v16 + 1;
          if ((unint64_t)(v45 - (char *)v44[0]) >= 0x7FFFFFFFFFFFFFF0)
            v18 = 0xFFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v19 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v45, v18);
          else
            v19 = 0;
          v20 = &v19[16 * v16];
          *(simd_float3 *)v20 = v13[v4];
          v15 = v20 + 16;
          v22 = (char *)v44[0];
          v21 = (char *)v44[1];
          if (v44[1] != v44[0])
          {
            do
            {
              v23 = *((_OWORD *)v21 - 1);
              v21 -= 16;
              *((_OWORD *)v20 - 1) = v23;
              v20 -= 16;
            }
            while (v21 != v22);
            v21 = (char *)v44[0];
          }
          v44[0] = v20;
          v44[1] = v15;
          v45 = &v19[16 * v18];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(simd_float3 *)v44[1] = v12[v4];
          v15 = v14 + 16;
        }
        v44[1] = v15;
        begin = self->_identifiersVector.__begin_;
        v25 = (char *)__p[1];
        if (__p[1] >= v43)
        {
          v27 = (char *)__p[0];
          v28 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v30 = v43 - (char *)__p[0];
          if ((v43 - (char *)__p[0]) >> 2 > v29)
            v29 = v30 >> 2;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v31 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v31 = v29;
          if (v31)
          {
            v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v43, v31);
            v27 = (char *)__p[0];
            v25 = (char *)__p[1];
          }
          else
          {
            v32 = 0;
          }
          v33 = &v32[8 * v28];
          *(_QWORD *)v33 = begin[v4];
          v26 = v33 + 8;
          while (v25 != v27)
          {
            v34 = *((_QWORD *)v25 - 1);
            v25 -= 8;
            *((_QWORD *)v33 - 1) = v34;
            v33 -= 8;
          }
          __p[0] = v33;
          __p[1] = v26;
          v43 = &v32[8 * v31];
          if (v27)
            operator delete(v27);
        }
        else
        {
          *(_QWORD *)__p[1] = begin[v4];
          v26 = v25 + 8;
        }
        __p[1] = v26;
      }
    }
    ++v4;
  }
  v35 = [ARPointCloud alloc];
  *(_OWORD *)v40 = *(_OWORD *)v44;
  v41 = v45;
  v44[1] = 0;
  v45 = 0;
  v44[0] = 0;
  *(_OWORD *)v38 = *(_OWORD *)__p;
  v39 = v43;
  __p[0] = 0;
  __p[1] = 0;
  v43 = 0;
  v36 = -[ARPointCloud initWithPointsVector:identifiersVector:](v35, "initWithPointsVector:identifiersVector:", v40, v38);
  if (v38[0])
  {
    v38[1] = v38[0];
    operator delete(v38[0]);
  }
  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v44[0])
  {
    v44[1] = v44[0];
    operator delete(v44[0]);
  }
  return v36;
}

+ (id)concatPointClouds:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  ARPointCloud *v14;
  uint64_t *v15;
  int v16;
  char *v17;
  void *v18;
  char *v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int v26;
  char *v27;
  void *v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  __int128 v36;
  char *v37;
  void *v38;
  char *v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  BOOL v49;
  ARPointCloud *v50;
  __int128 v52;
  __int128 v53;
  void *v54[2];
  char *v55;
  void *v56[2];
  char *v57;
  void *v58[2];
  uint64_t v59;
  void *__p[2];
  char *v61;
  void *v62[2];
  char *v63;
  void *v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t *v70;
  _QWORD *v71;
  unint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v71 = 0;
    v72 = 0;
    v70 = (uint64_t *)&v71;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v67;
      LOBYTE(v7) = 1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v67 != v6)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v10 = 0;
          v7 = (objc_msgSend(v9, "vergenceAngleCosines") != 0) & v7;
          while (v10 < objc_msgSend(v9, "count"))
          {
            v11 = objc_msgSend(v9, "identifiers");
            v12 = *(_OWORD *)(objc_msgSend(v9, "points") + 16 * v10);
            v52 = v12;
            LODWORD(v12) = 0;
            if (v7)
              LODWORD(v12) = *(_DWORD *)(objc_msgSend(v9, "vergenceAngleCosines", *(double *)&v12) + 4 * v10);
            v13 = v52;
            HIDWORD(v13) = v12;
            v64[0] = *(void **)(v11 + 8 * v10);
            v65 = v13;
            _ZNSt3__16__treeINS_12__value_typeIyDv4_fEENS_19__map_value_compareIyS3_NS_4lessIyEELb1EEENS_9allocatorIS3_EEE25__emplace_unique_key_argsIyJNS_4pairIyS2_EEEEENSC_INS_15__tree_iteratorIS3_PNS_11__tree_nodeIS3_PvEElEEbEERKT_DpOT0_(&v70, (unint64_t *)v64, (uint64_t)v64);
            ++v10;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 1;
    }

    v64[0] = 0;
    v64[1] = 0;
    *(_QWORD *)&v65 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(v64, v72);
    v62[0] = 0;
    v62[1] = 0;
    v63 = 0;
    std::vector<unsigned long long>::reserve(v62, v72);
    __p[0] = 0;
    __p[1] = 0;
    v61 = 0;
    if (v7)
      std::vector<float>::reserve(__p, v72);
    v15 = v70;
    if (v70 != (uint64_t *)&v71)
    {
      do
      {
        if (v7)
        {
          v16 = *((_DWORD *)v15 + 15);
          v17 = (char *)__p[1];
          if (__p[1] >= v61)
          {
            v19 = (char *)__p[0];
            v20 = ((char *)__p[1] - (char *)__p[0]) >> 2;
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 62)
              std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
            v22 = v61 - (char *)__p[0];
            if ((v61 - (char *)__p[0]) >> 1 > v21)
              v21 = v22 >> 1;
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
              v23 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v23 = v21;
            if (v23)
            {
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v61, v23);
              v19 = (char *)__p[0];
              v17 = (char *)__p[1];
            }
            else
            {
              v24 = 0;
            }
            v25 = &v24[4 * v20];
            *(_DWORD *)v25 = v16;
            v18 = v25 + 4;
            while (v17 != v19)
            {
              v26 = *((_DWORD *)v17 - 1);
              v17 -= 4;
              *((_DWORD *)v25 - 1) = v26;
              v25 -= 4;
            }
            __p[0] = v25;
            __p[1] = v18;
            v61 = &v24[4 * v23];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *(_DWORD *)__p[1] = v16;
            v18 = v17 + 4;
          }
          __p[1] = v18;
        }
        v27 = (char *)v64[1];
        if (v64[1] >= (void *)v65)
        {
          v53 = *((_OWORD *)v15 + 3);
          v29 = ((char *)v64[1] - (char *)v64[0]) >> 4;
          if ((unint64_t)(v29 + 1) >> 60)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v30 = (uint64_t)(v65 - (unint64_t)v64[0]) >> 3;
          if (v30 <= v29 + 1)
            v30 = v29 + 1;
          if ((unint64_t)v65 - (unint64_t)v64[0] >= 0x7FFFFFFFFFFFFFF0)
            v31 = 0xFFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v32 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v65, v31);
          else
            v32 = 0;
          v33 = &v32[16 * v29];
          *(_OWORD *)v33 = v53;
          v28 = v33 + 16;
          v35 = (char *)v64[0];
          v34 = (char *)v64[1];
          if (v64[1] != v64[0])
          {
            do
            {
              v36 = *((_OWORD *)v34 - 1);
              v34 -= 16;
              *((_OWORD *)v33 - 1) = v36;
              v33 -= 16;
            }
            while (v34 != v35);
            v34 = (char *)v64[0];
          }
          v64[0] = v33;
          v64[1] = v28;
          *(_QWORD *)&v65 = &v32[16 * v31];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *(_OWORD *)v64[1] = *((_OWORD *)v15 + 3);
          v28 = v27 + 16;
        }
        v64[1] = v28;
        v37 = (char *)v62[1];
        if (v62[1] >= v63)
        {
          v39 = (char *)v62[0];
          v40 = ((char *)v62[1] - (char *)v62[0]) >> 3;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v42 = v63 - (char *)v62[0];
          if ((v63 - (char *)v62[0]) >> 2 > v41)
            v41 = v42 >> 2;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
            v43 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v63, v43);
            v39 = (char *)v62[0];
            v37 = (char *)v62[1];
          }
          else
          {
            v44 = 0;
          }
          v45 = &v44[8 * v40];
          *(_QWORD *)v45 = v15[4];
          v38 = v45 + 8;
          while (v37 != v39)
          {
            v46 = *((_QWORD *)v37 - 1);
            v37 -= 8;
            *((_QWORD *)v45 - 1) = v46;
            v45 -= 8;
          }
          v62[0] = v45;
          v62[1] = v38;
          v63 = &v44[8 * v43];
          if (v39)
            operator delete(v39);
        }
        else
        {
          *(_QWORD *)v62[1] = v15[4];
          v38 = v37 + 8;
        }
        v62[1] = v38;
        v47 = (uint64_t *)v15[1];
        if (v47)
        {
          do
          {
            v48 = v47;
            v47 = (uint64_t *)*v47;
          }
          while (v47);
        }
        else
        {
          do
          {
            v48 = (uint64_t *)v15[2];
            v49 = *v48 == (_QWORD)v15;
            v15 = v48;
          }
          while (!v49);
        }
        v15 = v48;
      }
      while (v48 != (uint64_t *)&v71);
    }
    v50 = [ARPointCloud alloc];
    *(_OWORD *)v58 = *(_OWORD *)v64;
    v59 = v65;
    v64[1] = 0;
    *(_QWORD *)&v65 = 0;
    v64[0] = 0;
    *(_OWORD *)v56 = *(_OWORD *)v62;
    v57 = v63;
    v62[0] = 0;
    v62[1] = 0;
    v63 = 0;
    *(_OWORD *)v54 = *(_OWORD *)__p;
    v55 = v61;
    __p[1] = 0;
    v61 = 0;
    __p[0] = 0;
    v14 = -[ARPointCloud initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:](v50, "initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:", v58, v56, v54);
    if (v54[0])
    {
      v54[1] = v54[0];
      operator delete(v54[0]);
    }
    if (v56[0])
    {
      v56[1] = v56[0];
      operator delete(v56[0]);
    }
    if (v58[0])
    {
      v58[1] = v58[0];
      operator delete(v58[0]);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v62[0])
    {
      v62[1] = v62[0];
      operator delete(v62[0]);
    }
    if (v64[0])
    {
      v64[1] = v64[0];
      operator delete(v64[0]);
    }
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v70, v71);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)emptyPointCloud
{
  void *v2;
  void *__p;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v6 = 0;
  v7 = 0;
  __p = 0;
  v5 = 0;
  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPointsVector:identifiersVector:", &v7, &__p);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
  if (v7)
  {
    v8 = v7;
    operator delete(v7);
  }
  return v2;
}

- (ARHitTestResult)_hitTestPointFromOrigin:(float32x4_t)a3 withDirection:(float)a4 maximumAngle:(float32x4_t)a5 cameraToWorldTransform:(float32x4_t)a6
{
  float32x4_t v10;
  unint64_t v11;
  id v12;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int8x16_t v21;
  ARHitTestResult *v22;
  float32x4_t v23;
  __int128 v28;
  __int128 v30;
  float32x4_t v33;
  float32x4_t v34;
  __int128 v35;
  float32x4_t v36;
  float32x4_t v37;
  float v38;

  if (!objc_msgSend(a1, "count"))
    goto LABEL_14;
  if (objc_msgSend(a1, "count"))
  {
    v11 = 0;
    v10.i32[0] = -8388609;
    v34 = v10;
    v36 = a2;
    do
    {
      v37 = *(float32x4_t *)(objc_msgSend(a1, "points") + 16 * v11);
      v12 = a1[14];
      if (!v12
        || !objc_msgSend(v12, "confidences")
        || ARCheckConfidenceJasper(*(float *)(objc_msgSend(a1[14], "confidences") + 4 * v11)))
      {
        v13 = vaddq_f32(a8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a5, v37.f32[0]), a6, *(float32x2_t *)v37.f32, 1), a7, v37, 2));
        v14 = vsubq_f32(v13, a2);
        v15 = (int32x4_t)vmulq_f32(v14, v14);
        v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
        v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
        v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
        v18 = vmulq_f32(vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]), a3);
        v19 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1)));
        v20 = v34;
        v21 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v19, v34), 0), (int8x16_t)v13, (int8x16_t)v36);
        if (v19.f32[0] > v34.f32[0])
          v20.f32[0] = v19.f32[0];
        v34 = v20;
        v36 = (float32x4_t)v21;
      }
      ++v11;
    }
    while (v11 < objc_msgSend(a1, "count"));
  }
  else
  {
    v34.i32[0] = -8388609;
    v36 = a2;
  }
  if (v34.f32[0] >= cosf(a4))
  {
    v23 = vmulq_f32(vsubq_f32(v36, a2), a3);
    v38 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0];
    v35 = *MEMORY[0x1E0C83FF0];
    v28 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v30 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v22 = -[ARHitTestResult initWithType:]([ARHitTestResult alloc], "initWithType:", 1);
    -[ARHitTestResult setDistance:](v22, "setDistance:", v38);
    v33 = vmlaq_n_f32(a2, a3, v38);
    -[ARHitTestResult setWorldTransform:](v22, "setWorldTransform:", *(double *)&v35, *(double *)&v30, *(double *)&v28, *(double *)v33.i64);
    -[ARHitTestResult setLocalTransform:](v22, "setLocalTransform:", *(double *)&v35, *(double *)&v30, *(double *)&v28, *(double *)vsubq_f32(v33, v36).i64);
  }
  else
  {
LABEL_14:
    v22 = 0;
  }
  return v22;
}

- (ARPointCloud)pointCloudByApplyingTransform:(float32x4_t)a3
{
  unint64_t i;
  uint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint64_t v10;
  _OWORD *f32;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  float32x4_t *v16;
  float32x4_t *v17;
  char *v18;
  float32x4_t v19;
  ARPointCloud *v20;
  ARPointCloud *v21;
  float32x4_t v23;
  void *__p;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34[2];
  char *v35;
  __int128 v36;
  char *v37;

  v36 = 0uLL;
  v37 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v36, objc_msgSend((id)a1, "count"));
  for (i = 0; i < objc_msgSend((id)a1, "count", *(_OWORD *)&v23); ++i)
  {
    v7 = objc_msgSend((id)a1, "points");
    v8 = vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)(v7 + 16 * i))), a3, *(float32x2_t *)(v7 + 16 * i), 1), a4, *(float32x4_t *)(v7 + 16 * i), 2));
    v9 = vdivq_f32(v8, (float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 3));
    v10 = *((_QWORD *)&v36 + 1);
    if (*((_QWORD *)&v36 + 1) >= (unint64_t)v37)
    {
      v23 = v9;
      v12 = (uint64_t)(*((_QWORD *)&v36 + 1) - v36) >> 4;
      if ((unint64_t)(v12 + 1) >> 60)
        std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
      v13 = (uint64_t)&v37[-v36] >> 3;
      if (v13 <= v12 + 1)
        v13 = v12 + 1;
      if ((unint64_t)&v37[-v36] >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      if (v14)
        v15 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v37, v14);
      else
        v15 = 0;
      v16 = (float32x4_t *)&v15[16 * v12];
      *v16 = v23;
      f32 = (_OWORD *)v16[1].f32;
      v17 = (float32x4_t *)*((_QWORD *)&v36 + 1);
      v18 = (char *)v36;
      if (*((_QWORD *)&v36 + 1) != (_QWORD)v36)
      {
        do
        {
          v19 = v17[-1];
          --v17;
          v16[-1] = v19;
          --v16;
        }
        while (v17 != (float32x4_t *)v18);
        v17 = (float32x4_t *)v36;
      }
      *(_QWORD *)&v36 = v16;
      *((_QWORD *)&v36 + 1) = f32;
      v37 = &v15[16 * v14];
      if (v17)
        operator delete(v17);
    }
    else
    {
      **((_OWORD **)&v36 + 1) = v9;
      f32 = (_OWORD *)(v10 + 16);
    }
    *((_QWORD *)&v36 + 1) = f32;
  }
  v20 = [ARPointCloud alloc];
  *(_OWORD *)v34 = v36;
  v35 = v37;
  v37 = 0;
  v36 = 0uLL;
  v32 = 0;
  v33 = 0;
  v31 = 0;
  std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v31, *(const void **)(a1 + 32), *(_QWORD *)(a1 + 40), (uint64_t)(*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32)) >> 3);
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(a1 + 56), *(_QWORD *)(a1 + 64), (uint64_t)(*(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56)) >> 2);
  v21 = -[ARPointCloud initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:](v20, "initWithPointsVector:identifiersVector:vergenceAngleCosinesVector:", v34, &v31, &__p);
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }
  if ((_QWORD)v36)
  {
    *((_QWORD *)&v36 + 1) = v36;
    operator delete((void *)v36);
  }
  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p count=%lu>"), v5, self, -[ARPointCloud count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARPointCloud)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  const void *v7;
  void *v8;
  id v9;
  const void *v10;
  void *v11;
  const void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ARPointCloud;
  v5 = -[ARPointCloud init](&v20, sel_init);
  if (v5)
  {
    v19 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("points"), &v19);
    if (v19)
    {
      v17 = 0uLL;
      v18 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v17, v7, (uint64_t)v7 + (v19 & 0xFFFFFFFFFFFFFFF0), v19 >> 4);
      v8 = (void *)*((_QWORD *)v5 + 1);
      if (v8)
      {
        *((_QWORD *)v5 + 2) = v8;
        operator delete(v8);
        *((_QWORD *)v5 + 1) = 0;
        *((_QWORD *)v5 + 2) = 0;
        *((_QWORD *)v5 + 3) = 0;
      }
      *(_OWORD *)(v5 + 8) = v17;
      *((_QWORD *)v5 + 3) = v18;
    }
    v16 = 0;
    v9 = objc_retainAutorelease(v6);
    v10 = (const void *)objc_msgSend(v9, "decodeBytesForKey:returnedLength:", CFSTR("identifiers"), &v16);
    if (v16)
    {
      v17 = 0uLL;
      v18 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v17, v10, (uint64_t)v10 + (v16 & 0xFFFFFFFFFFFFFFF8), v16 >> 3);
      v11 = (void *)*((_QWORD *)v5 + 4);
      if (v11)
      {
        *((_QWORD *)v5 + 5) = v11;
        operator delete(v11);
        *((_QWORD *)v5 + 4) = 0;
        *((_QWORD *)v5 + 5) = 0;
        *((_QWORD *)v5 + 6) = 0;
      }
      *((_OWORD *)v5 + 2) = v17;
      *((_QWORD *)v5 + 6) = v18;
    }
    v15 = 0;
    v12 = (const void *)objc_msgSend(objc_retainAutorelease(v9), "decodeBytesForKey:returnedLength:", CFSTR("vergenceAngleCosines"), &v15);
    if (v16)
    {
      v18 = 0;
      v17 = 0uLL;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v17, v12, (uint64_t)v12 + (v15 & 0xFFFFFFFFFFFFFFFCLL), v15 >> 2);
      v13 = (void *)*((_QWORD *)v5 + 7);
      if (v13)
      {
        *((_QWORD *)v5 + 8) = v13;
        operator delete(v13);
        *((_QWORD *)v5 + 7) = 0;
        *((_QWORD *)v5 + 8) = 0;
        *((_QWORD *)v5 + 9) = 0;
      }
      *(_OWORD *)(v5 + 56) = v17;
      *((_QWORD *)v5 + 9) = v18;
    }
  }

  return (ARPointCloud *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", -[ARPointCloud points](self, "points"), 16 * -[ARPointCloud count](self, "count"), CFSTR("points"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_identifiersVector.__begin_, (char *)self->_identifiersVector.__end_ - (char *)self->_identifiersVector.__begin_, CFSTR("identifiers"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_vergenceAngleCosinesVector.__begin_, (char *)self->_vergenceAngleCosinesVector.__end_ - (char *)self->_vergenceAngleCosinesVector.__begin_, CFSTR("vergenceAngleCosines"));

}

- (unint64_t)hash
{
  unint64_t result;

  result = -[ARPointCloud count](self, "count");
  if (result)
    return *self->_identifiersVector.__begin_ ^ -[ARPointCloud count](self, "count") ^ *(self->_identifiersVector.__end_
                                                                                       - 1);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSUInteger v6;
  unint64_t *begin;
  char *v8;
  const void *v9;
  BOOL v10;
  const simd_float3 *v12;
  uint64_t v13;
  NSUInteger v14;
  BOOL v15;
  NSUInteger i;
  uint32x4_t v17;
  float *end;
  float *v19;
  float *v20;
  float *v21;
  float v22;
  float v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ARPointCloud count](self, "count");
    if (v6 != objc_msgSend(v5, "count"))
      goto LABEL_6;
    if ((char *)self->_vergenceAngleCosinesVector.__end_ - (char *)self->_vergenceAngleCosinesVector.__begin_ != v5[8] - v5[7])
      goto LABEL_6;
    begin = self->_identifiersVector.__begin_;
    v8 = (char *)((char *)self->_identifiersVector.__end_ - (char *)begin);
    v9 = (const void *)v5[4];
    if (v8 != (char *)(v5[5] - (_QWORD)v9) || memcmp(begin, v9, (size_t)v8))
      goto LABEL_6;
    v12 = -[ARPointCloud points](self, "points");
    v13 = objc_msgSend(v5, "points");
    v14 = -[ARPointCloud count](self, "count");
    if (!v14)
      goto LABEL_15;
    v15 = 0;
    for (i = 0; i != v14; v15 = i >= v14)
    {
      v17 = (uint32x4_t)vceqq_f32((float32x4_t)v12[i], *(float32x4_t *)(v13 + 16 * i));
      v17.i32[3] = v17.i32[2];
      if ((vminvq_u32(v17) & 0x80000000) == 0)
        break;
      ++i;
    }
    if (v15)
    {
LABEL_15:
      v19 = self->_vergenceAngleCosinesVector.__begin_;
      end = self->_vergenceAngleCosinesVector.__end_;
      if (v19 == end)
      {
        v10 = 1;
      }
      else
      {
        v20 = (float *)v5[7];
        v21 = v19 + 1;
        do
        {
          v22 = *v20++;
          v23 = vabds_f32(*(v21 - 1), v22);
          v10 = v23 <= 0.00000011921;
        }
        while (v23 <= 0.00000011921 && v21++ != end);
      }
    }
    else
    {
LABEL_6:
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  float *begin;
  unint64_t *v4;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;

  objc_storeStrong((id *)&self->_depthPointCloud, 0);
  begin = self->_vergenceAngleCosinesVector.__begin_;
  if (begin)
  {
    self->_vergenceAngleCosinesVector.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_identifiersVector.__begin_;
  if (v4)
  {
    self->_identifiersVector.__end_ = v4;
    operator delete(v4);
  }
  var0 = self->_pointsVector.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_10 = var0;
    operator delete(var0);
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

+ (void)emptyPointCloud
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

@end
