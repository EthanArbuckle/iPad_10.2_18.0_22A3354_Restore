@implementation VNDetectFaceLandmarksRequestConfiguration

- (VNDetectFaceLandmarksRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectFaceLandmarksRequestConfiguration *v3;
  VNDetectFaceLandmarksRequestConfiguration *v4;
  VNDetectFaceLandmarksRequestConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_refineMouthRegion = 1;
    v3->_refineLeftEyeRegion = 1;
    v3->_refineRightEyeRegion = 1;
    v3->_performBlinkDetection = -[VNRequestConfiguration resolvedRevision](v3, "resolvedRevision") != 3;
    v4->_constellation = 1;
    v5 = v4;
  }

  return v4;
}

- (unint64_t)constellation
{
  return self->_constellation;
}

- (BOOL)performBlinkDetection
{
  return self->_performBlinkDetection;
}

- (NSNumber)cascadeStepCount
{
  return self->_cascadeStepCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cascadeStepCount, 0);
}

- (void)setRefineRightEyeRegion:(BOOL)a3
{
  self->_refineRightEyeRegion = a3;
}

- (void)setRefineMouthRegion:(BOOL)a3
{
  self->_refineMouthRegion = a3;
}

- (void)setRefineLeftEyeRegion:(BOOL)a3
{
  self->_refineLeftEyeRegion = a3;
}

- (void)setPerformBlinkDetection:(BOOL)a3
{
  self->_performBlinkDetection = a3;
}

- (void)setCascadeStepCount:(id)a3
{
  objc_storeStrong((id *)&self->_cascadeStepCount, a3);
}

- (void)setConstellation:(unint64_t)a3
{
  self->_constellation = a3;
}

+ (BOOL)revision:(unint64_t)a3 supportsConstellation:(unint64_t)a4
{
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  BOOL v17;
  _QWORD *v18;

  if (+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::onceToken != -1)
    dispatch_once(&+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::onceToken, &__block_literal_global_12495);
  v6 = *(_QWORD **)(+[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
                  + 8);
  if (!v6)
    return 0;
  v7 = +[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
     + 8;
  do
  {
    v8 = v6[4];
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = v6;
    else
      v10 = v6 + 1;
    if (v9)
      v7 = (uint64_t)v6;
    v6 = (_QWORD *)*v10;
  }
  while (*v10);
  if (v7 == +[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap
           + 8
    || *(_QWORD *)(v7 + 32) > a3)
  {
    return 0;
  }
  v14 = *(_QWORD **)(v7 + 48);
  v12 = v7 + 48;
  v13 = v14;
  if (!v14)
    goto LABEL_26;
  v15 = (_QWORD *)v12;
  do
  {
    v16 = v13[4];
    v17 = v16 >= a4;
    if (v16 >= a4)
      v18 = v13;
    else
      v18 = v13 + 1;
    if (v17)
      v15 = v13;
    v13 = (_QWORD *)*v18;
  }
  while (*v18);
  if (v15 == (_QWORD *)v12 || v15[4] > a4)
LABEL_26:
    v15 = (_QWORD *)v12;
  return v15 != (_QWORD *)v12;
}

void __76__VNDetectFaceLandmarksRequestConfiguration_revision_supportsConstellation___block_invoke()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t **v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  _QWORD **v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD **v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD **v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD **v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD v40[3];
  _QWORD *v41;
  _QWORD v42[3];
  _QWORD *v43;
  _QWORD v44[3];
  _QWORD *v45;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  v37 = 1;
  std::set<VNRequestFaceLandmarksConstellation>::set[abi:ne180100]((uint64_t *)&v31, &v37, 1);
  v38 = 1;
  v39 = v31;
  v40[0] = v32;
  v40[1] = v33;
  if (v33)
  {
    v32[2] = v40;
    v31 = &v32;
    v32 = 0;
    v33 = 0;
  }
  else
  {
    v39 = v40;
  }
  v36 = 1;
  std::set<VNRequestFaceLandmarksConstellation>::set[abi:ne180100]((uint64_t *)&v28, &v36, 1);
  v40[2] = 2;
  v41 = v28;
  v42[0] = v29;
  v42[1] = v30;
  if (v30)
  {
    v29[2] = v42;
    v28 = &v29;
    v29 = 0;
    v30 = 0;
  }
  else
  {
    v41 = v42;
  }
  v35 = xmmword_1A15C3FE0;
  std::set<VNRequestFaceLandmarksConstellation>::set[abi:ne180100]((uint64_t *)&v25, (unint64_t *)&v35, 2);
  v42[2] = 3;
  v43 = v25;
  v44[0] = v26;
  v44[1] = v27;
  if (v27)
  {
    v26[2] = v44;
    v25 = &v26;
    v26 = 0;
    v27 = 0;
  }
  else
  {
    v43 = v44;
  }
  v34 = xmmword_1A15C3FE0;
  std::set<VNRequestFaceLandmarksConstellation>::set[abi:ne180100]((uint64_t *)&v22, (unint64_t *)&v34, 2);
  v44[2] = 3737841664;
  v45 = v22;
  v46[0] = v23;
  v46[1] = v24;
  if (v24)
  {
    v23[2] = v46;
    v22 = &v23;
    v23 = 0;
    v24 = 0;
  }
  else
  {
    v45 = v46;
  }
  v1 = 0;
  v2 = 0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)v0 = v0 + 8;
  v3 = (uint64_t *)(v0 + 8);
  while (1)
  {
    v4 = &v38 + 4 * v2;
    v5 = (uint64_t *)(v0 + 8);
    if (v3 == (uint64_t *)(v0 + 8))
      goto LABEL_20;
    v6 = v1;
    v7 = (uint64_t *)(v0 + 8);
    if (v1)
    {
      do
      {
        v5 = v6;
        v6 = (uint64_t *)v6[1];
      }
      while (v6);
    }
    else
    {
      do
      {
        v5 = (uint64_t *)v7[2];
        v8 = *v5 == (_QWORD)v7;
        v7 = v5;
      }
      while (v8);
    }
    v9 = *v4;
    if (v5[4] < (unint64_t)*v4)
    {
LABEL_20:
      v10 = v1 ? (uint64_t **)v5 : (uint64_t **)(v0 + 8);
      v11 = v1 ? (uint64_t **)(v5 + 1) : (uint64_t **)(v0 + 8);
    }
    else
    {
      v10 = (uint64_t **)(v0 + 8);
      v11 = (uint64_t **)(v0 + 8);
      if (v1)
      {
        v11 = (uint64_t **)(v0 + 8);
        while (1)
        {
          while (1)
          {
            v10 = (uint64_t **)v1;
            v20 = v1[4];
            if (v9 >= v20)
              break;
            v1 = *v10;
            v11 = v10;
            if (!*v10)
              goto LABEL_27;
          }
          if (v20 >= v9)
            break;
          v11 = v10 + 1;
          v1 = v10[1];
          if (!v1)
            goto LABEL_27;
        }
      }
    }
    if (!*v11)
    {
LABEL_27:
      v12 = (uint64_t *)operator new(0x40uLL);
      v13 = *v4;
      v12[6] = 0;
      v12[5] = (uint64_t)(v12 + 6);
      v12[4] = v13;
      v14 = &v38 + 4 * v2;
      v12[7] = 0;
      v15 = (uint64_t *)v14[1];
      v16 = v14 + 2;
      if (v15 != v14 + 2)
      {
        do
        {
          std::__tree<VNRequestFaceLandmarksConstellation>::__emplace_hint_unique_key_args<VNRequestFaceLandmarksConstellation,VNRequestFaceLandmarksConstellation const&>(v12 + 5, v12 + 6, v15[4], v15[4]);
          v17 = (uint64_t *)v15[1];
          if (v17)
          {
            do
            {
              v18 = v17;
              v17 = (uint64_t *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              v18 = (uint64_t *)v15[2];
              v8 = *v18 == (_QWORD)v15;
              v15 = v18;
            }
            while (!v8);
          }
          v15 = v18;
        }
        while (v18 != v16);
      }
      *v12 = 0;
      v12[1] = 0;
      v12[2] = (uint64_t)v10;
      *v11 = v12;
      v19 = **(_QWORD **)v0;
      if (v19)
      {
        *(_QWORD *)v0 = v19;
        v12 = *v11;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v0 + 8), v12);
      ++*(_QWORD *)(v0 + 16);
    }
    if (++v2 == 4)
      break;
    v3 = *(uint64_t **)v0;
    v1 = *(uint64_t **)(v0 + 8);
  }
  +[VNDetectFaceLandmarksRequestConfiguration revision:supportsConstellation:]::requestRevisionToSupportedConstellationsMap = v0;
  for (i = 112; i != -16; i -= 32)
    std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(_QWORD **)((char *)&v38 + i));
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v23);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v26);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v29);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRefineMouthRegion:", self->_refineMouthRegion);
    objc_msgSend(v5, "setRefineLeftEyeRegion:", self->_refineLeftEyeRegion);
    objc_msgSend(v5, "setRefineRightEyeRegion:", self->_refineRightEyeRegion);
    objc_msgSend(v5, "setPerformBlinkDetection:", self->_performBlinkDetection);
    objc_msgSend(v5, "setCascadeStepCount:", self->_cascadeStepCount);
    objc_msgSend(v5, "setConstellation:", self->_constellation);
  }
  return v5;
}

- (BOOL)refineMouthRegion
{
  return self->_refineMouthRegion;
}

- (BOOL)refineLeftEyeRegion
{
  return self->_refineLeftEyeRegion;
}

- (BOOL)refineRightEyeRegion
{
  return self->_refineRightEyeRegion;
}

@end
