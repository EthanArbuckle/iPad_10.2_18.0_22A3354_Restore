@implementation VNFaceLandmarkDetector

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v5, objc_opt_class(), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  v8 = objc_msgSend(v6, "requestRevision");
  if ((unint64_t)(v8 - 1) >= 2 && v8 != 3 && v8 != 3737841664)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return (Class)v10;
}

+ (const)landmarksMeshPartsForConstellation:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v10;
  id v11;

  if (a3 - 1 > 1)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown constellation type: %lu"), a3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  if (+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::onceToken != -1)
    dispatch_once(&+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::onceToken, &__block_literal_global_3977);
  v4 = *(_QWORD **)(+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8);
  if (!v4)
    goto LABEL_15;
  v5 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= a3;
    if (v6 >= a3)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 == +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8
    || *(_QWORD *)(v5 + 32) > a3)
  {
LABEL_15:
    v5 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8;
  }
  return *(const _LandmarkDetector_faceMeshParts_ **)(v5 + 40);
}

+ (const)allLandmarksPointsIndexesForConstellation:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v10;
  id v11;

  if (a3 - 1 > 1)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown constellation type: %lu"), a3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  if (+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::onceToken != -1)
    dispatch_once(&+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::onceToken, &__block_literal_global_27_3972);
  v4 = *(_QWORD **)(+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
                  + 8);
  if (!v4)
    goto LABEL_15;
  v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
     + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= a3;
    if (v6 >= a3)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 == +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
           + 8
    || *(_QWORD *)(v5 + 32) > a3)
  {
LABEL_15:
    v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
       + 8;
  }
  return (const void *)(v5 + 40);
}

+ (_Geometry2D_point2D_)computeCentroidUsingPoints:(const _Geometry2D_point2D_ *)a3 indicies:(const int *)a4 numberOfIndicies:(int)a5
{
  float32x2_t v5;
  uint64_t v6;
  float32x2_t v7;
  uint64_t v8;
  float32x2_t v9;
  float v10;
  _Geometry2D_point2D_ result;

  if (a5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = a5;
    v7 = 0;
    do
    {
      v8 = *a4++;
      v5 = (float32x2_t)a3[v8];
      v7 = vadd_f32(v7, v5);
      --v6;
    }
    while (v6);
  }
  v5.f32[0] = (float)a5;
  v9 = vdiv_f32(v7, (float32x2_t)vdup_lane_s32((int32x2_t)v5, 0));
  v10 = v9.f32[1];
  result.x = v9.f32[0];
  result.y = v10;
  return result;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VNFaceLandmarkDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __63__VNFaceLandmarkDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

void __68__VNFaceLandmarkDetector_allLandmarksPointsIndexesForConstellation___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  std::vector<int>::pointer begin;
  uint64_t v3;
  int32x4_t v4;
  std::vector<int>::pointer v5;
  int32x4_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  unint64_t v15;
  uint64_t **v16;
  uint64_t **v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int *v23;
  std::vector<int> __p;
  std::vector<int> v25;
  std::vector<int>::value_type __x;
  uint64_t v27;
  std::vector<int> v28;
  uint64_t v29;
  std::vector<int> v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  LODWORD(__p.__begin_) = 0;
  std::vector<int>::vector(&v25, 0x41uLL, (const std::vector<int>::value_type *)&__p);
  v1 = 0;
  begin = v25.__begin_;
  do
  {
    begin[v1] = v1;
    ++v1;
  }
  while (v1 != 65);
  v27 = 1;
  v28 = v25;
  memset(&v25, 0, sizeof(v25));
  __x = 0;
  std::vector<int>::vector(&__p, 0x4CuLL, &__x);
  v3 = 0;
  v4 = (int32x4_t)xmmword_1A15FB450;
  v5 = __p.__begin_;
  v6.i64[0] = 0x400000004;
  v6.i64[1] = 0x400000004;
  do
  {
    *(int32x4_t *)&v5[v3] = v4;
    v4 = vaddq_s32(v4, v6);
    v3 += 4;
  }
  while (v3 != 76);
  v7 = 0;
  v8 = 0;
  v29 = 2;
  v30 = __p;
  memset(&__p, 0, sizeof(__p));
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  v9 = (uint64_t *)(v0 + 8);
  *(_QWORD *)v0 = v0 + 8;
  while (1)
  {
    v10 = &v27 + 4 * v8;
    v11 = (uint64_t *)(v0 + 8);
    if (v9 == (uint64_t *)(v0 + 8))
      goto LABEL_12;
    v12 = v7;
    v13 = (uint64_t *)(v0 + 8);
    if (v7)
    {
      do
      {
        v11 = v12;
        v12 = (uint64_t *)v12[1];
      }
      while (v12);
    }
    else
    {
      do
      {
        v11 = (uint64_t *)v13[2];
        v14 = *v11 == (_QWORD)v13;
        v13 = v11;
      }
      while (v14);
    }
    v15 = *v10;
    if (v11[4] < (unint64_t)*v10)
    {
LABEL_12:
      v16 = v7 ? (uint64_t **)v11 : (uint64_t **)(v0 + 8);
      v17 = v7 ? (uint64_t **)(v11 + 1) : (uint64_t **)(v0 + 8);
    }
    else
    {
      v16 = (uint64_t **)(v0 + 8);
      v17 = (uint64_t **)(v0 + 8);
      if (v7)
      {
        v17 = (uint64_t **)(v0 + 8);
        while (1)
        {
          while (1)
          {
            v16 = (uint64_t **)v7;
            v21 = v7[4];
            if (v15 >= v21)
              break;
            v7 = *v16;
            v17 = v16;
            if (!*v16)
              goto LABEL_19;
          }
          if (v21 >= v15)
            break;
          v17 = v16 + 1;
          v7 = v16[1];
          if (!v7)
            goto LABEL_19;
        }
      }
    }
    if (!*v17)
    {
LABEL_19:
      v18 = (uint64_t *)operator new(0x40uLL);
      v19 = *v10;
      v18[5] = 0;
      v18[4] = v19;
      v18[6] = 0;
      v18[7] = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v18 + 5, (const void *)*(&v27 + 4 * v8 + 1), *((_QWORD *)&v28.__end_ + 4 * v8), (*((_QWORD *)&v28.__end_ + 4 * v8) - *(&v27 + 4 * v8 + 1)) >> 2);
      *v18 = 0;
      v18[1] = 0;
      v18[2] = (uint64_t)v16;
      *v17 = v18;
      v20 = **(_QWORD **)v0;
      if (v20)
      {
        *(_QWORD *)v0 = v20;
        v18 = *v17;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v0 + 8), v18);
      ++*(_QWORD *)(v0 + 16);
    }
    if (++v8 == 2)
      break;
    v9 = *(uint64_t **)v0;
    v7 = *(uint64_t **)(v0 + 8);
  }
  v22 = 0;
  +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap = v0;
  do
  {
    v23 = *(std::vector<int>::pointer *)((char *)&v30.__begin_ + v22);
    if (v23)
    {
      *(std::vector<int>::pointer *)((char *)&v30.__end_ + v22) = v23;
      operator delete(v23);
    }
    v22 -= 32;
  }
  while (v22 != -64);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  if (v25.__begin_)
  {
    v25.__end_ = v25.__begin_;
    operator delete(v25.__begin_);
  }
}

_QWORD *__61__VNFaceLandmarkDetector_landmarksMeshPartsForConstellation___block_invoke()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;

  result = (_QWORD *)operator new();
  v1 = (uint64_t)result;
  v2 = 0;
  v3 = 0;
  result[1] = 0;
  v4 = result + 1;
  result[2] = 0;
  *result = result + 1;
  v5 = result + 1;
  while (1)
  {
    v6 = (unint64_t *)((char *)&unk_1E4543A48 + 16 * v3);
    v7 = v4;
    if (v5 == v4)
      goto LABEL_8;
    v8 = v2;
    v9 = v4;
    if (v2)
    {
      do
      {
        v7 = v8;
        v8 = (uint64_t *)v8[1];
      }
      while (v8);
    }
    else
    {
      do
      {
        v7 = (uint64_t *)v9[2];
        v10 = *v7 == (_QWORD)v9;
        v9 = v7;
      }
      while (v10);
    }
    v11 = *v6;
    if (v7[4] < *v6)
    {
LABEL_8:
      v12 = v2 ? v7 : v4;
      v13 = v2 ? v7 + 1 : v4;
    }
    else
    {
      v12 = v4;
      v13 = v4;
      if (v2)
      {
        v13 = v4;
        while (1)
        {
          while (1)
          {
            v12 = v2;
            v16 = v2[4];
            if (v11 >= v16)
              break;
            v2 = (uint64_t *)*v12;
            v13 = v12;
            if (!*v12)
              goto LABEL_15;
          }
          if (v16 >= v11)
            break;
          v13 = v12 + 1;
          v2 = (uint64_t *)v12[1];
          if (!v2)
            goto LABEL_15;
        }
      }
    }
    if (!*v13)
    {
LABEL_15:
      v14 = operator new(0x30uLL);
      v14[2] = *(_OWORD *)v6;
      *(_QWORD *)v14 = 0;
      *((_QWORD *)v14 + 1) = 0;
      *((_QWORD *)v14 + 2) = v12;
      *v13 = (uint64_t)v14;
      v15 = **(_QWORD **)v1;
      if (v15)
      {
        *(_QWORD *)v1 = v15;
        v14 = (_OWORD *)*v13;
      }
      result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v1 + 8), (uint64_t *)v14);
      ++*(_QWORD *)(v1 + 16);
    }
    if (++v3 == 2)
      break;
    v5 = *(uint64_t **)v1;
    v2 = *(uint64_t **)(v1 + 8);
  }
  +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap = v1;
  return result;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNFaceLandmarkDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v9, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &self->_requireFaceAttributesPupilRefiner, CFSTR("VNFaceLandmarkDetectorOption_LoadRefinersModel"), v6, 0, a4)&& -[VNFaceLandmarkDetector loadRefinersAndReturnError:](self, "loadRefinersAndReturnError:", a4);

  return v7;
}

- (BOOL)loadRefinersAndReturnError:(id *)a3
{
  char v3;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  if (self->_faceAttributesPupilRefiner.__ptr_)
    return 1;
  if (!self->_requireFaceAttributesPupilRefiner)
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v9, objc_opt_class(), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v3 = v10 != 0;
    if (!v10 || (unint64_t)(objc_msgSend(v10, "requestRevision") - 1) >= 2)
    {

      return v3;
    }
    self->_requireFaceAttributesPupilRefiner = 1;

  }
  self->_modelFilesWereMemmapped = -[VNDetector backingStore](self, "backingStore") < 2;
  VNBinModelFilePathFromModelNameAndThrow(CFSTR("landmarkRefinerAndPupil_v2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__VNFaceLandmarkDetector_loadRefinersAndReturnError___block_invoke;
  v13[3] = &unk_1E45488F0;
  v13[4] = self;
  v14 = v6;
  v7 = v6;
  v8 = _Block_copy(v13);
  v3 = VNExecuteBlock(v8, (uint64_t)a3);

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_modelFilesWereMemmapped)
  {
    VNBinModelFilePathFromModelNameAndThrow(CFSTR("landmarkRefinerAndPupil_v2"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unload:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarkDetector;
  -[VNDetector dealloc](&v5, sel_dealloc);
}

- (void)calculatePupilLocationAndUpdateLandmarkPoints:(void *)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  _DWORD *v26;
  _DWORD *v27;
  _DWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  unint64_t v35;
  uint64_t v36;

  +[VNFaceLandmarkDetector computeCentroidUsingPoints:indicies:numberOfIndicies:](VNFaceLandmarkDetector, "computeCentroidUsingPoints:indicies:numberOfIndicies:", *(_QWORD *)a3, &unk_1A15F9BC0, 8);
  v6 = v4;
  v7 = v5;
  v9 = (_DWORD *)*((_QWORD *)a3 + 1);
  v8 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v9 >= v8)
  {
    v11 = *(_DWORD **)a3;
    v12 = ((uint64_t)v9 - *(_QWORD *)a3) >> 3;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      goto LABEL_32;
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    v15 = (unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8;
    v16 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v15)
      v16 = v13;
    if (v16)
    {
      v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v16);
      v11 = *(_DWORD **)a3;
      v9 = (_DWORD *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v17 = 0;
    }
    v18 = (_DWORD *)(v16 + 8 * v12);
    v19 = v16 + 8 * v17;
    *v18 = v6;
    v18[1] = v7;
    v10 = v18 + 2;
    if (v9 != v11)
    {
      do
      {
        v20 = *((_QWORD *)v9 - 1);
        v9 -= 2;
        *((_QWORD *)v18 - 1) = v20;
        v18 -= 2;
      }
      while (v9 != v11);
      v11 = *(_DWORD **)a3;
    }
    *(_QWORD *)a3 = v18;
    *((_QWORD *)a3 + 1) = v10;
    *((_QWORD *)a3 + 2) = v19;
    if (v11)
      operator delete(v11);
  }
  else
  {
    *v9 = v4;
    v9[1] = v5;
    v10 = v9 + 2;
  }
  *((_QWORD *)a3 + 1) = v10;
  +[VNFaceLandmarkDetector computeCentroidUsingPoints:indicies:numberOfIndicies:](VNFaceLandmarkDetector, "computeCentroidUsingPoints:indicies:numberOfIndicies:", *(_QWORD *)a3, &unk_1A15F9D40, 8);
  v23 = v21;
  v24 = v22;
  v26 = (_DWORD *)*((_QWORD *)a3 + 1);
  v25 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v26 < v25)
  {
    *v26 = v21;
    v26[1] = v22;
    v27 = v26 + 2;
    goto LABEL_31;
  }
  v28 = *(_DWORD **)a3;
  v29 = ((uint64_t)v26 - *(_QWORD *)a3) >> 3;
  v30 = v29 + 1;
  if ((unint64_t)(v29 + 1) >> 61)
LABEL_32:
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  v31 = v25 - (_QWORD)v28;
  if (v31 >> 2 > v30)
    v30 = v31 >> 2;
  v15 = (unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8;
  v32 = 0x1FFFFFFFFFFFFFFFLL;
  if (!v15)
    v32 = v30;
  if (v32)
  {
    v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v32);
    v28 = *(_DWORD **)a3;
    v26 = (_DWORD *)*((_QWORD *)a3 + 1);
  }
  else
  {
    v33 = 0;
  }
  v34 = (_DWORD *)(v32 + 8 * v29);
  v35 = v32 + 8 * v33;
  *v34 = v23;
  v34[1] = v24;
  v27 = v34 + 2;
  if (v26 != v28)
  {
    do
    {
      v36 = *((_QWORD *)v26 - 1);
      v26 -= 2;
      *((_QWORD *)v34 - 1) = v36;
      v34 -= 2;
    }
    while (v26 != v28);
    v28 = *(_DWORD **)a3;
  }
  *(_QWORD *)a3 = v34;
  *((_QWORD *)a3 + 1) = v27;
  *((_QWORD *)a3 + 2) = v35;
  if (v28)
    operator delete(v28);
LABEL_31:
  *((_QWORD *)a3 + 1) = v27;
}

- (id)computeLandmarksScoreOnImage:(const vImage_Buffer *)a3 withFaceBoundingBox:(const _Geometry2D_rect2D_ *)a4 andLandmarks:(const void *)a5 error:(id *)a6
{
  LandmarkAttributes *ptr;
  uint64_t v11;
  size_t v12;
  float *v13;
  uint64_t v14;
  vImagePixelCount height;
  float v16;
  float v17;
  int v18;
  int v19;
  int v20;
  int width;
  BOOL v22;
  int v23;
  int v24;
  int v25;
  float *v26;
  uint64_t v28;
  unint64_t v29;
  float *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  uint64_t v40;
  int64_t v41;
  vDSP_Length v42;
  const float *v43;
  double v44;
  int v45;
  void *v46;
  _QWORD *exception;
  void *v48;
  _BYTE *v49;
  char v50;
  void *__p[3];

  if (a3 && a4 && a5)
  {
    ptr = self->_faceAttributesPupilRefiner.__ptr_;
    v11 = (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3;
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(&v48, ((unint64_t)((v11 - 1) * v11) >> 1) + 1, __p);
    v12 = (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3;
    v50 = 0;
    std::vector<unsigned char>::vector(__p, v12, &v50);
    v13 = *(float **)a5;
    if (*(_QWORD *)a5 == *((_QWORD *)a5 + 1))
    {
      v26 = *(float **)a5;
    }
    else
    {
      v14 = 0;
      do
      {
        height = a3->height;
        v16 = *v13;
        v17 = v13[1];
        v13 += 2;
        v18 = llroundf(v16 + a4->origin.x);
        v19 = llroundf((float)height - (float)(v17 + a4->origin.y));
        v20 = v18 & ~(v18 >> 31);
        width = a3->width;
        v22 = v20 < width;
        v23 = width - 1;
        v24 = v19 & ~(v19 >> 31);
        if (!v22)
          v20 = v23;
        if (v24 >= (int)height)
          v25 = height - 1;
        else
          v25 = v24;
        *((_BYTE *)__p[0] + v14++) = *((_BYTE *)a3->data + a3->rowBytes * v25 + v20);
      }
      while (v13 != *((float **)a5 + 1));
      v26 = v13;
      v13 = *(float **)a5;
    }
    v28 = (char *)v26 - (char *)v13;
    v29 = (unint64_t)((char *)v26 - (char *)v13) >> 3;
    v30 = (float *)v48;
    v31 = (unsigned __int8 *)__p[0];
    if ((int)v29 < 2)
    {
      LODWORD(v33) = 0;
    }
    else
    {
      v32 = 0;
      LODWORD(v33) = 0;
      v34 = (v29 - 1);
      v35 = (int)(v28 >> 3);
      v36 = ((unint64_t)v28 >> 3) - 1;
      v37 = 1;
      do
      {
        v38 = v32 + 1;
        if (v32 + 1 < v35)
        {
          v33 = (int)v33;
          v39 = v31;
          v40 = v36;
          do
          {
            v30[v33++] = (float)(v31[v32] - v39[v37]);
            ++v39;
            --v40;
          }
          while (v40);
        }
        ++v37;
        --v36;
        ++v32;
      }
      while (v38 != v34);
      v30 = (float *)v48;
      v31 = (unsigned __int8 *)__p[0];
    }
    v30[(int)v33] = 1.0;
    if (v31)
    {
      __p[1] = v31;
      operator delete(v31);
    }
    v41 = v49 - (_BYTE *)v48;
    v42 = (v49 - (_BYTE *)v48) >> 2;
    if (v42 != *((_QWORD *)ptr + 3) / 3uLL)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = 2940;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    v43 = (const float *)*((_QWORD *)ptr + 4);
    vDSP_vsub(&v43[v42], 1, (const float *)v48, 1, (float *)v48, 1, v42);
    vDSP_vdiv((const float *)((char *)v43 + 2 * v41), 1, (const float *)v48, 1, (float *)v48, 1, (v49 - (_BYTE *)v48) >> 2);
    LODWORD(__p[0]) = 0;
    vDSP_dotpr((const float *)v48, 1, v43, 1, (float *)__p, (v49 - (_BYTE *)v48) >> 2);
    v45 = (int)__p[0];
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    LODWORD(v44) = v45;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid parameters passed to landmark score computation"), a4, a5);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v46 = 0;
  }
  return v46;
}

- (BOOL)postprocessLandmarkResultsForLandmarks:(const void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 options:(id)a6 warningRecorder:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  __CVBuffer *v32;
  __CVBuffer *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  uint64_t v39;
  float v40;
  float v41;
  _QWORD v42[4];
  unsigned int v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v45 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v45, CFSTR("VNFaceLandmarkDetectorProcessOption_BlinkDetection"), v16, 0, a8)|| (v44 = 0, !+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v44, CFSTR("VNFaceLandmarkDetectorProcessOption_CalculateLandmarkScore"), v16, 0, a8)))
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v18 = 1;
  if (v45 | v44)
  {
    self->_requireFaceAttributesPupilRefiner = 1;
    if (-[VNFaceLandmarkDetector loadRefinersAndReturnError:](self, "loadRefinersAndReturnError:", a8))
    {
      v43 = -1;
      if ((objc_msgSend(v15, "getFaceEXIFOrientation:error:", &v43, a8) & 1) != 0)
      {
        v46 = CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth");
        v21 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight");
        -[VNFaceLandmarkDetector normalizedFaceBBoxForLandmarks:](self, "normalizedFaceBBoxForLandmarks:", v15);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = objc_msgSend(v14, "width");
        v31 = objc_msgSend(v14, "height");
        v32 = (__CVBuffer *)objc_msgSend(v14, "croppedBufferWithWidth:height:format:cropRect:options:error:", v20, v21, 1278226488, v38, a8, v23 * (double)v30, v25 * (double)v31, v27 * (double)v30, v29 * (double)v31);
        v33 = v32;
        if (!v32)
        {
          v18 = 0;
LABEL_18:

          goto LABEL_14;
        }
        CVPixelBufferLockBaseAddress(v32, 1uLL);
        v42[0] = CVPixelBufferGetBaseAddress(v33);
        v42[1] = CVPixelBufferGetHeight(v33);
        v42[2] = CVPixelBufferGetWidth(v33);
        v42[3] = CVPixelBufferGetBytesPerRow(v33);
        v39 = 0;
        v40 = (float)v21;
        v41 = (float)v20;
        if (v44)
        {
          -[VNFaceLandmarkDetector computeLandmarksScoreOnImage:withFaceBoundingBox:andLandmarks:error:](self, "computeLandmarksScoreOnImage:withFaceBoundingBox:andLandmarks:error:", v42, &v39, a3, a8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (!v34)
            goto LABEL_16;
          objc_msgSend(v34, "floatValue");
          objc_msgSend(v15, "setLandmarkScore:");

        }
        if (!v45
          || -[VNFaceLandmarkDetector detectBlinkOnFaceImage:faceObservation:lumaRec2DInImageCoordinates:landmarks:warningRecorder:error:](self, "detectBlinkOnFaceImage:faceObservation:lumaRec2DInImageCoordinates:landmarks:warningRecorder:error:", v42, v15, &v39, a3, v17, a8))
        {
          v36 = 0;
LABEL_17:
          CVPixelBufferUnlockBaseAddress(v33, 1uLL);
          CVPixelBufferRelease(v33);
          v18 = v36 == 0;
          goto LABEL_18;
        }
LABEL_16:
        v36 = 1;
        goto LABEL_17;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v18;
}

- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "alignedBoundingBoxAsCGRect");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectEqualToRect(v16, *MEMORY[0x1E0C9D648]))
  {
    objc_msgSend(v3, "boundingBox");
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)detectBlinkOnFaceImage:(const vImage_Buffer *)a3 faceObservation:(id)a4 lumaRec2DInImageCoordinates:(_Geometry2D_rect2D_ *)a5 landmarks:(const void *)a6 warningRecorder:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  BOOL v18;
  BOOL v19;
  LandmarkAttributes *ptr;
  float y;
  float v22;
  float v23;
  float32_t v24;
  float v25;
  float32_t v26;
  float v27;
  float v28;
  char *data;
  size_t rowBytes;
  int32x2_t v31;
  float height;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  int32x2_t v38;
  int32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  float v42;
  char *v43;
  float32x2_t v44;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  vImagePixelCount width;
  vImagePixelCount v61;
  vImagePixelCount v62;
  vImagePixelCount v63;
  vImagePixelCount v64;
  float x;
  float v66;
  float *v67;
  uint64_t v68;
  float *v69;
  float v70;
  float v71;
  float *v72;
  float *v73;
  float *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  float *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  float *v85;
  int v86;
  float v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  float *v91;
  int v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  LandmarkAttributes *v98;
  uint64_t v99;
  const float *v100;
  const float *v101;
  int64_t v102;
  double v103;
  _QWORD *exception;
  float v106;
  float v107;
  id v108;
  void *v109;
  float v110;
  BOOL v111;
  vImage_Buffer v112;
  vImage_Buffer dest;
  void *__p[3];
  void *v115[3];
  void *v116;
  _BYTE *v117;
  vImage_Buffer v118;
  vImage_Buffer src;
  void *v120[3];
  int v121;
  void *__Y[5];

  __Y[3] = *(void **)MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a7;
  if (a3)
    _ZF = v14 == 0;
  else
    _ZF = 1;
  v18 = _ZF || a5 == 0 || a6 == 0;
  v19 = !v18;
  if (!v18)
  {
    LODWORD(src.data) = 0;
    v111 = v19;
    v108 = v15;
    v109 = v14;
    std::vector<float>::vector(&v116, 0x550uLL, &src);
    LOBYTE(src.data) = 0;
    std::vector<unsigned char>::vector(v115, 0x900uLL, &src);
    LOBYTE(src.data) = 0;
    std::vector<unsigned char>::vector(__p, 0x900uLL, &src);
    v112.rowBytes = 48;
    dest.data = v115[0];
    *(int64x2_t *)&dest.height = vdupq_n_s64(0x30uLL);
    dest.rowBytes = 48;
    v112.data = __p[0];
    *(_OWORD *)&v112.height = *(_OWORD *)&dest.height;
    ptr = self->_faceAttributesPupilRefiner.__ptr_;
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__Y, 0x2A8uLL, &src);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(v120, 0x2A8uLL, &src);
    y = a5->origin.y;
    v22 = *(float *)(*(_QWORD *)a6 + 68) + y;
    v23 = y + *(float *)(*(_QWORD *)a6 + 100);
    v24 = a5->origin.x + *(float *)(*(_QWORD *)a6 + 128);
    v25 = y + *(float *)(*(_QWORD *)a6 + 132);
    v26 = a5->origin.x + *(float *)(*(_QWORD *)a6 + 160);
    v27 = y + *(float *)(*(_QWORD *)a6 + 164);
    v28 = (float)(a5->origin.x + *(float *)(*(_QWORD *)a6 + 96))
        - (float)(*(float *)(*(_QWORD *)a6 + 64) + a5->origin.x);
    data = (char *)a3->data;
    rowBytes = a3->rowBytes;
    v31 = vmovn_s64(*(int64x2_t *)&a3->height);
    height = (float)a3->height;
    v33.f32[0] = height - v22;
    v34.f32[0] = height - v23;
    v35.f32[0] = height - v25;
    v36.f32[0] = height - v27;
    v33.f32[1] = *(float *)(*(_QWORD *)a6 + 64) + a5->origin.x;
    v34.f32[1] = a5->origin.x + *(float *)(*(_QWORD *)a6 + 96);
    v37 = vmul_f32(vadd_f32(v33, v34), (float32x2_t)0x3F0000003F000000);
    *(float *)v38.i32 = sqrtf((float)((float)(v34.f32[0] - v33.f32[0]) * (float)(v34.f32[0] - v33.f32[0]))+ (float)(v28 * v28))* 0.5;
    *(float *)v39.i32 = sqrtf((float)((float)(v36.f32[0] - v35.f32[0]) * (float)(v36.f32[0] - v35.f32[0]))+ (float)((float)(v26 - v24) * (float)(v26 - v24)))* 0.5;
    v40 = (float32x2_t)vdup_lane_s32(v38, 0);
    v41 = vcvt_f32_s32(vmax_s32(vcvt_s32_f32(vrndp_f32(vsub_f32(v37, v40))), (int32x2_t)0x100000001));
    v42 = v41.f32[1];
    v43 = (char *)a3->data + rowBytes * (int)v41.f32[0] + (int)v41.f32[1];
    v107 = v41.f32[0];
    v44 = vsub_f32(vcvt_f32_s32(vmin_s32(vcvt_s32_f32(vrndp_f32(vadd_f32(v37, v40))), v31)), v41);
    __asm { FMOV            V4.2S, #1.0 }
    *(uint64x2_t *)&src.height = vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32(v44, _D4)));
    v35.f32[1] = v24;
    v36.f32[1] = v26;
    src.data = v43;
    src.rowBytes = rowBytes;
    v49 = vmul_f32(vadd_f32(v35, v36), (float32x2_t)0x3F0000003F000000);
    v50 = (float32x2_t)vdup_lane_s32(v39, 0);
    v51 = vcvt_f32_s32(vmax_s32(vcvt_s32_f32(vrndp_f32(vsub_f32(v49, v50))), (int32x2_t)0x100000001));
    v52 = v51.f32[1];
    v106 = v51.f32[0];
    *(uint64x2_t *)&v118.height = vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32(vsub_f32(vcvt_f32_s32(vmin_s32(vcvt_s32_f32(vrndp_f32(vadd_f32(v49, v50))), v31)), v51), _D4)));
    v118.data = &data[rowBytes * (int)v51.f32[0] + (int)v51.f32[1]];
    v118.rowBytes = rowBytes;
    vImageScale_Planar8(&src, &dest, 0, 0x20u);
    vImageScale_Planar8(&v118, &v112, 0, 0x20u);
    computePhogDescriptor(dest.data, __Y);
    computePhogDescriptor(v112.data, v120);
    if (!*((_QWORD *)ptr + 6))
    {
      v74 = 0;
LABEL_58:
      v19 = v111;
LABEL_71:
      v93 = 0;
      v94 = (char *)__Y[0];
      v95 = (char *)v116;
      v96 = (char *)v120[0];
      do
      {
        v97 = &v95[v93];
        *(_DWORD *)v97 = *(_DWORD *)&v94[v93];
        *((_DWORD *)v97 + 680) = *(_DWORD *)&v96[v93];
        v93 += 4;
      }
      while (v93 != 2720);
      v120[1] = v96;
      operator delete(v96);
      if (__Y[0])
      {
        __Y[1] = __Y[0];
        operator delete(__Y[0]);
      }
      v98 = self->_faceAttributesPupilRefiner.__ptr_;
      v118.height = 0;
      v118.width = 0;
      v118.data = &v118.height;
      vision::mod::LandmarkAttributes::computePixelDistanceFeature(&src, (uint64_t)a5, (uint64_t *)a6);
      src.height -= 4;
      v99 = (uint64_t)(src.height - (unint64_t)src.data) >> 2;
      if (v99 != *((_QWORD *)v98 + 16) >> 2)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = 2940;
        __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
      }
      v100 = (const float *)*((_QWORD *)v98 + 17);
      vDSP_vsub((const float *)((char *)v100 + 2 * (src.height - (unint64_t)src.data)), 1, (const float *)src.data, 1, (float *)src.data, 1, (uint64_t)(src.height - (unint64_t)src.data) >> 2);
      vDSP_vdiv(&v100[3 * v99], 1, (const float *)src.data, 1, (float *)src.data, 1, (uint64_t)(src.height - (unint64_t)src.data) >> 2);
      cblas_sgemv(CblasColMajor, CblasTrans, (src.height - (unint64_t)src.data) >> 2, 2, 1.0, v100, (src.height - (unint64_t)src.data) >> 2, (const float *)src.data, 1, 0.0, (float *)__Y, 1);
      LODWORD(v120[0]) = 0;
      if (*((float *)__Y + 1) <= 0.8)
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 0, v120)+ 8) = 0;
      else
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 0, v120)+ 8) = 1065353216;
      v101 = (const float *)*((_QWORD *)v98 + 20);
      v102 = v117 - (_BYTE *)v116;
      vDSP_vsub((const float *)((char *)v101 + v117 - (_BYTE *)v116), 1, (const float *)v116, 1, (float *)v116, 1, (v117 - (_BYTE *)v116) >> 2);
      vDSP_vdiv((const float *)((char *)v101 + 2 * v102), 1, (const float *)v116, 1, (float *)v116, 1, (v117 - (_BYTE *)v116) >> 2);
      cblas_sgemv(CblasColMajor, CblasTrans, (unint64_t)(v117 - (_BYTE *)v116) >> 2, 1, 1.0, v101, (unint64_t)(v117 - (_BYTE *)v116) >> 2, (const float *)v116, 1, 0.0, (float *)v120, 1);
      v15 = v108;
      v14 = v109;
      v121 = 1;
      if (*(float *)v120 <= 0.1)
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &v121)+ 8) = 0;
      else
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &v121)+ 8) = 1065353216;
      if (src.data)
      {
        src.height = (vImagePixelCount)src.data;
        operator delete(src.data);
      }
      LODWORD(src.data) = 1;
      objc_msgSend(v109, "setIsBlinking:", *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &src)+ 8) > 0.1);
      LODWORD(src.data) = 1;
      LODWORD(v103) = *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &src)+ 8);
      objc_msgSend(v109, "setBlinkScore:", v103);
      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy((_QWORD *)v118.height);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v115[0])
      {
        v115[1] = v115[0];
        operator delete(v115[0]);
      }
      if (v74)
        operator delete(v74);
      if (v116)
      {
        v117 = v116;
        operator delete(v116);
      }
      goto LABEL_92;
    }
    espresso_vision_compute_pupil_position();
    v54 = v53;
    v56 = v55;
    espresso_vision_compute_pupil_position();
    v110 = v58;
    v59 = v57;
    if (v54 < 0.15 || v54 > 0.85 || v56 < 0.15 || v56 > 0.85)
    {
      v56 = 0.5;
      v54 = 0.5;
    }
    if (v57 < 0.15 || v57 > 0.85 || v58 < 0.15 || v58 > 0.85)
    {
      v110 = 0.5;
      v59 = 0.5;
    }
    v61 = src.height;
    width = src.width;
    v63 = v118.height;
    v62 = v118.width;
    v64 = a3->height;
    x = a5->origin.x;
    v66 = a5->origin.y;
    v67 = (float *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(1uLL);
    v69 = v67;
    v70 = (float)((float)v64 - (float)(v107 + (float)((float)v61 * v56))) - v66;
    v71 = (float)(v42 + (float)((float)width * v54)) - x;
    v72 = &v67[v68];
    *v67 = v71;
    if (v68 < 2)
    {
      v75 = 2;
      if ((unint64_t)((4 * v68) >> 1) > 2)
        v75 = (4 * v68) >> 1;
      if ((unint64_t)(4 * v68) >= 0x7FFFFFFFFFFFFFFCLL)
        v76 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v76 = v75;
      if (v76)
        v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v76);
      else
        v77 = 0;
      v78 = 0;
      v72 = (float *)(v76 + 4 * v77);
      *(float *)(v76 + 4) = v70;
      v73 = (float *)(v76 + 8);
      do
      {
        *(float *)(v76 + v78 * 4) = v69[v78];
        --v78;
      }
      while (v78 != -1);
      v74 = (float *)v76;
      operator delete(v69);
    }
    else
    {
      v67[1] = v70;
      v73 = v67 + 2;
      v74 = v67;
    }
    v79 = (float)(v52 + (float)((float)v62 * v59)) - x;
    if (v73 >= v72)
    {
      v81 = v73 - v74;
      v82 = v81 + 1;
      if ((unint64_t)(v81 + 1) >> 62)
        goto LABEL_94;
      if (((char *)v72 - (char *)v74) >> 1 > v82)
        v82 = ((char *)v72 - (char *)v74) >> 1;
      if ((unint64_t)((char *)v72 - (char *)v74) >= 0x7FFFFFFFFFFFFFFCLL)
        v83 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v83 = v82;
      if (v83)
        v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v83);
      else
        v84 = 0;
      v85 = (float *)(v83 + 4 * v81);
      v72 = (float *)(v83 + 4 * v84);
      *v85 = v79;
      v80 = v85 + 1;
      while (v73 != v74)
      {
        v86 = *((_DWORD *)v73-- - 1);
        *((_DWORD *)v85-- - 1) = v86;
      }
      operator delete(v74);
      v74 = v85;
    }
    else
    {
      *v73 = v79;
      v80 = v73 + 1;
    }
    v87 = (float)((float)v64 - (float)(v106 + (float)((float)v63 * v110))) - v66;
    if (v80 < v72)
    {
      *v80 = v87;
      goto LABEL_58;
    }
    v88 = v80 - v74;
    v89 = v88 + 1;
    v19 = v111;
    if (!((unint64_t)(v88 + 1) >> 62))
    {
      if (((char *)v72 - (char *)v74) >> 1 > v89)
        v89 = ((char *)v72 - (char *)v74) >> 1;
      if ((unint64_t)((char *)v72 - (char *)v74) >= 0x7FFFFFFFFFFFFFFCLL)
        v90 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v90 = v89;
      if (v90)
      {
        v90 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v90);
        v19 = v111;
      }
      v91 = (float *)(v90 + 4 * v88);
      *v91 = v87;
      while (v80 != v74)
      {
        v92 = *((_DWORD *)v80-- - 1);
        *((_DWORD *)v91-- - 1) = v92;
      }
      operator delete(v74);
      v74 = v91;
      goto LABEL_71;
    }
LABEL_94:
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  }
  if (a8)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid parameters passed to blink score computation"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_92:

  return v19;
}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_faceAttributesPupilRefiner);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

uint64_t __53__VNFaceLandmarkDetector_loadRefinersAndReturnError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v17;
  _OWORD v18[2];
  int v19;
  __int128 v20[2];
  int v21;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 105))
  {
    v11 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    v12 = operator new(0xC8uLL);
    v12[1] = 0;
    v12[2] = 0;
    *v12 = &off_1E453B5D8;
    *(_QWORD *)&v20[0] = vision::mod::LandmarkAttributes::LandmarkAttributes((vision::mod::LandmarkAttributes *)(v12 + 3), v11, 1);
    *((_QWORD *)&v20[0] + 1) = v12;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 88, v20);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v20[0] + 1);
    if (*((_QWORD *)&v20[0] + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v20[0] + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    return 1;
  }
  +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "load:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    memset(v20, 0, sizeof(v20));
    v21 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)v20, (char *)objc_msgSend(v5, "baseAddress"), objc_msgSend(v5, "length"));
    memset(v18, 0, sizeof(v18));
    v19 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v18, (uint64_t)v20, 0, vision::mod::LandmarkAttributes::sModelFileInfo);
    v7 = operator new(0xC8uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_1E453B5D8;
    *(_QWORD *)&v17 = vision::mod::LandmarkAttributes::LandmarkAttributes(v7 + 3, v18, 1);
    *((_QWORD *)&v17 + 1) = v7;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 88, &v17);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v18);
    std::__hash_table<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>>>::~__hash_table((uint64_t)v20);

    return 1;
  }
  if (a2)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Could not read landmark refiner model data"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

@end
