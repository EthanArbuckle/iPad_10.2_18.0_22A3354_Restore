@implementation MonoPoseEstimatorWrapper

- (MonoPoseEstimatorWrapper)initWithHandScale:(float)a3 boneScale:(const float *)a4 isLeft:(BOOL)a5 useKalman:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  MonoPoseEstimatorWrapper *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t value;
  _OWORD v17[5];
  _OWORD v18[2];
  objc_super v19;

  v6 = a6;
  v7 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MonoPoseEstimatorWrapper;
  v10 = -[MonoPoseEstimatorWrapper init](&v19, sel_init);
  v11 = *((_OWORD *)a4 + 5);
  v17[4] = *((_OWORD *)a4 + 4);
  v18[0] = v11;
  *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)(a4 + 23);
  v12 = *((_OWORD *)a4 + 1);
  v17[0] = *(_OWORD *)a4;
  v17[1] = v12;
  v13 = *((_OWORD *)a4 + 3);
  v17[2] = *((_OWORD *)a4 + 2);
  v17[3] = v13;
  v14 = operator new();
  MonoPoseEstimator::MonoPoseEstimator(v14, v17, v7, v6, a3);
  value = (uint64_t)v10->_estimator.__ptr_.__value_;
  v10->_estimator.__ptr_.__value_ = (MonoPoseEstimator *)v14;
  if (value)
    std::default_delete<MonoPoseEstimator>::operator()[abi:ne180100]((uint64_t)&v10->_estimator, value);
  return v10;
}

- (id)computeTransformsWithHandScale:(float)a3 globalHandCenter:(id)a4 estimatorInput:(BOOL)a5 enrollment:
{
  __int128 v5;
  id v8;
  unint64_t v9;
  _BYTE *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  MonoPoseEstimator *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  MonoPoseEstimator *value;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const void *Transforms;
  uint64_t v55;
  const void *TransformsRaw;
  id v57;
  uint64_t j;
  SimdFloat4x4Obj *v59;
  uint64_t k;
  SimdFloat4x4Obj *v61;
  _OWORD v63[108];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  int v83;
  __int128 v84;
  _BYTE __dst[1736];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v84 = v5;
  v8 = a4;
  if (objc_msgSend(v8, "count") == 2)
  {
    v9 = 0;
    v10 = __dst;
    while (objc_msgSend(v8, "count") > v9)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      ++v9;
      v10 += 708;
    }
    value = self->_estimator.__ptr_.__value_;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "intrinsics");
    v79 = v31;
    v81 = v32;
    v78 = v33;
    v80 = v34;
    v83 = v35;
    v82 = v36;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizer");
    v63[0] = v38;
    v63[1] = v39;
    v63[2] = v40;
    v63[3] = v41;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "intrinsics");
    v73 = v43;
    v75 = v44;
    v72 = v45;
    v74 = v46;
    v77 = v47;
    v76 = v48;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizer");
    v68 = v50;
    v69 = v51;
    v70 = v52;
    v71 = v53;
    MonoPoseEstimator::update((uint64_t)value, (uint64_t)&v84, (uint64_t)__dst, (uint64_t)&v78, (uint64_t)v63, (uint64_t)&__dst[708], (uint64_t)&v72, (uint64_t)&v68, a5);

  }
  else
  {
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v65 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          v17 = self->_estimator.__ptr_.__value_;
          objc_msgSend(v16, "intrinsics");
          DWORD2(v68) = v18;
          DWORD2(v69) = v19;
          *(_QWORD *)&v68 = v20;
          *(_QWORD *)&v69 = v21;
          DWORD2(v70) = v22;
          *(_QWORD *)&v70 = v23;
          objc_msgSend(v16, "localizer");
          v63[0] = v24;
          v63[1] = v25;
          v63[2] = v26;
          v63[3] = v27;
          MonoPoseEstimator::update((uint64_t)v17, (uint64_t)&v84);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
      }
      while (v13);
    }

  }
  Transforms = (const void *)MonoPoseEstimator::getTransforms(self->_estimator.__ptr_.__value_, v28);
  memcpy(__dst, Transforms, 0x6C0uLL);
  TransformsRaw = (const void *)MonoPoseEstimator::getTransformsRaw(self->_estimator.__ptr_.__value_, v55);
  memcpy(v63, TransformsRaw, sizeof(v63));
  v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (j = 0; j != 1728; j += 64)
  {
    v59 = -[SimdFloat4x4Obj initWithSimdFloat4x4:]([SimdFloat4x4Obj alloc], "initWithSimdFloat4x4:", *(double *)&__dst[j], *(double *)&__dst[j + 16], *(double *)&__dst[j + 32], *(double *)&__dst[j + 48]);
    objc_msgSend(v57, "addObject:", v59);

  }
  for (k = 0; k != 108; k += 4)
  {
    v61 = -[SimdFloat4x4Obj initWithSimdFloat4x4:]([SimdFloat4x4Obj alloc], "initWithSimdFloat4x4:", *(double *)&v63[k], *(double *)&v63[k + 1], *(double *)&v63[k + 2], *(double *)&v63[k + 3]);
    objc_msgSend(v57, "addObject:", v61);

  }
  return v57;
}

- (void)reset
{
  MonoPoseEstimator::reset(self->_estimator.__ptr_.__value_);
}

- (void)predict:(float)a3
{
  MonoPoseEstimator::predict(self->_estimator.__ptr_.__value_, a3);
}

- (float)getHandScale
{
  return *((float *)self->_estimator.__ptr_.__value_ + 1480);
}

- (__n128)getWristAccuracy
{
  return *(__n128 *)(*(_QWORD *)(a1 + 8) + 400);
}

- (BOOL)isLeft
{
  return *((_BYTE *)self->_estimator.__ptr_.__value_ + 6236);
}

+ (id)defaultTransformsWithHandScale:(float)a3 isLeft:(BOOL)a4
{
  char v4;
  char v5;
  int v6;
  uint64_t RigTransforms;
  id v8;
  uint64_t i;
  SimdFloat4x4Obj *v10;
  __int128 v12;
  __int128 v13;
  __int128 __b[6];
  _BYTE v15[140];
  int v16;
  _BYTE v17[4232];
  uint64_t v18;

  MEMORY[0x24BDAC7A8](a1, a2);
  v5 = v4;
  v18 = *MEMORY[0x24BDAC8D0];
  v16 = v6;
  memset(v15, 0, sizeof(v15));
  memset_pattern16(__b, &unk_23D9A5AD0, 0x6CuLL);
  v13 = xmmword_23D9A3E90;
  v12 = 0uLL;
  ArvinoRig::ArvinoRig((uint64_t)v17, v15, &v16, __b, &v13, &v12, v5);
  RigTransforms = ArvinoRig::getRigTransforms((ArvinoRig *)v17);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 1728; i += 64)
  {
    v10 = -[SimdFloat4x4Obj initWithSimdFloat4x4:]([SimdFloat4x4Obj alloc], "initWithSimdFloat4x4:", *(double *)(RigTransforms + i), *(double *)(RigTransforms + i + 16), *(double *)(RigTransforms + i + 32), *(double *)(RigTransforms + i + 48));
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

- (void).cxx_destruct
{
  unique_ptr<MonoPoseEstimator, std::default_delete<MonoPoseEstimator>> *p_estimator;
  uint64_t v3;
  MonoPoseEstimator *value;

  value = self->_estimator.__ptr_.__value_;
  p_estimator = &self->_estimator;
  v3 = (uint64_t)value;
  p_estimator->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<MonoPoseEstimator>::operator()[abi:ne180100]((uint64_t)p_estimator, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
