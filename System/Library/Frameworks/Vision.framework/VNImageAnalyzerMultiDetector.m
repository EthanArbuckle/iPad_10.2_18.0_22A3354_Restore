@implementation VNImageAnalyzerMultiDetector

uint64_t __84__VNImageAnalyzerMultiDetector_createHierarchicalModelForInferenceDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::string v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22[8];
  uint64_t v23;
  __int128 v24;
  std::string::value_type *v25;
  char *v26;
  unint64_t *v27;

  ImageClassifier_loadLabelsAndBooleanFlags(v22, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v2 = *(_QWORD *)v22;
  v3 = v23;
  if (*(_QWORD *)v22 != v23)
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)(v2 + 32) < 2uLL)
        LOBYTE(v5) = 1;
      else
        v5 = (**(unsigned __int8 **)(v2 + 24) >> 1) & 1;
      if (*(char *)(v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v2, *(_QWORD *)(v2 + 8));
        v4 = v20;
      }
      else
      {
        v17 = *(std::string *)v2;
      }
      v18 = v5;
      if (v4 >= v21)
      {
        v7 = (uint64_t)(v4 - v19) >> 5;
        if ((unint64_t)(v7 + 1) >> 59)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v8 = (uint64_t)(v21 - v19) >> 4;
        if (v8 <= v7 + 1)
          v8 = v7 + 1;
        if (v21 - v19 >= 0x7FFFFFFFFFFFFFE0)
          v9 = 0x7FFFFFFFFFFFFFFLL;
        else
          v9 = v8;
        v27 = &v21;
        v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v9);
        v11 = (std::string *)&v10[32 * v7];
        *(_QWORD *)&v24 = v10;
        *((_QWORD *)&v24 + 1) = v11;
        v26 = &v10[32 * v12];
        *v11 = v17;
        memset(&v17, 0, sizeof(v17));
        v11[1].__r_.__value_.__s.__data_[0] = v5;
        v25 = &v11[1].__r_.__value_.__s.__data_[8];
        std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(&v19, &v24);
        v4 = v20;
        std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)&v24);
      }
      else
      {
        v6 = *(_OWORD *)&v17.__r_.__value_.__l.__data_;
        *(_QWORD *)(v4 + 16) = *((_QWORD *)&v17.__r_.__value_.__l + 2);
        *(_OWORD *)v4 = v6;
        *(_BYTE *)(v4 + 24) = v5;
        v4 += 32;
      }
      v20 = v4;
      v2 += 48;
    }
    while (v2 != v3);
  }
  std::allocate_shared[abi:ne180100]<vision::mod::ImageClassifier_HierarchicalModel,std::allocator<vision::mod::ImageClassifier_HierarchicalModel>,char const*,decltype(nullptr),std::vector<std::pair<std::string,BOOL>> &,void>((uint64_t ***)&v24, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), &v19);
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, &v24);
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  *(_QWORD *)&v24 = &v19;
  std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  *(_QWORD *)&v24 = v22;
  std::vector<std::pair<std::string,std::vector<BOOL>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  return 1;
}

- (VNImageAnalyzerMultiDetector)initWithConfigurationOptions:(id)a3
{
  VNImageAnalyzerMultiDetector *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetector;
  result = -[VNDetector initWithConfigurationOptions:](&v4, sel_initWithConfigurationOptions_, a3);
  if (result)
    result->_cachedAllSceneClassificationsFromLastAnalysisAccessLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (unint64_t)modelForRequestClass:(Class)a3 revision:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  _QWORD *v15;
  void *v16;
  _BOOL4 v17;

  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::onceToken != -1)
    dispatch_once(&+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::onceToken, &__block_literal_global_24088);
  v6 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD **)(v6 + 8);
  v9 = (_QWORD *)(v6 + 8);
  v8 = v10;
  if (!v10)
    goto LABEL_20;
  v11 = v9;
  do
  {
    v12 = (void *)v8[4];
    if (v7 == v12)
      v13 = v8[5] < a4;
    else
      v13 = v12 < v7;
    v14 = !v13;
    if (v13)
      v15 = v8 + 1;
    else
      v15 = v8;
    if (v14)
      v11 = v8;
    v8 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v11 == v9 || ((v16 = (void *)v11[4], v16 != v7) ? (v17 = v7 < v16) : (v17 = v11[5] > a4), v17))
LABEL_20:
    v11 = v9;

  if ((_QWORD *)(+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap + 8) == v11)
    return 0;
  else
    return v11[6];
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;

  v6 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v14 = 0;
    goto LABEL_10;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[VNComputeDeviceUtilities espressoV1ModelComputeDevices](VNComputeDeviceUtilities, "espressoV1ModelComputeDevices");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("VNComputeStageMain"));

  v16 = 0;
  v17 = 0;
  LOBYTE(v9) = objc_msgSend(a1, "_getAssociatedBoundingBoxGeneratorClass:options:forConfigurationOptions:error:", &v17, &v16, v6, a4);
  v10 = v16;
  if ((v9 & 1) == 0)
    goto LABEL_7;
  if (v17)
  {
    objc_msgSend(v17, "supportedComputeStageDevicesForOptions:error:", v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("VNComputeStagePostProcessing"));

      goto LABEL_6;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v14 = v8;
LABEL_8:

LABEL_10:
  return v14;
}

+ (BOOL)_getAssociatedBoundingBoxGeneratorClass:(Class *)a3 options:(id *)a4 forConfigurationOptions:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  BOOL v16;
  id v18;

  v10 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "_saliencyHeatmapBoundingBoxGeneratorTypeForOriginatingRequestSpecifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v18 = 0;
      v13 = (void *)objc_msgSend(a1, "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v10);
      v14 = +[VNDetector detectorClassAndConfigurationOptions:forDetectorType:options:error:](VNDetector, "detectorClassAndConfigurationOptions:forDetectorType:options:error:", &v18, v12, v13, a6);
      v15 = v18;

      v16 = v14 != 0;
      if (v14)
      {
        *a3 = v14;
        if (a4)
          *a4 = objc_retainAutorelease(v15);
      }

    }
    else
    {
      *a3 = 0;
      if (a4)
        *a4 = 0;
      v16 = 1;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_saliencyHeatmapBoundingBoxGeneratorTypeForOriginatingRequestSpecifier:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "specifiesRequestClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType;
  }
  else
  {
    if (!objc_msgSend(v3, "specifiesRequestClass:", objc_opt_class()))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType;
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459CE20, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  objc_msgSend(a1, "configurationOptionKeysForDetectorKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isSubsetOfSet:", v9) & 1) != 0)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
    objc_msgSendSuper2(&v14, sel_detectorClassForConfigurationOptions_error_, v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v11, "minusSet:", v9);
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForMissingOptionNamed:](VNError, "errorForMissingOptionNamed:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return (Class)a4;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VNImageAnalyzerMultiDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__VNImageAnalyzerMultiDetector_modelForRequestClass_revision___block_invoke()
{
  _QWORD *v0;
  void *v1;
  uint64_t **v2;
  uint64_t *v3;
  uint64_t **v4;
  void *v5;
  uint64_t **v6;
  void *v7;
  uint64_t **v8;
  void *v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t **v12;
  void *v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t **v16;
  void *v17;
  uint64_t **v18;
  void *v19;
  uint64_t **v20;
  void *v21;
  uint64_t **v22;
  void *v23;
  uint64_t **v24;
  void *v25;
  uint64_t **v26;
  uint64_t *v27;
  uint64_t **v28;
  void *v29;
  uint64_t **v30;
  void *v31;
  uint64_t **v32;
  uint64_t *v33;
  uint64_t **v34;
  void *v35;
  uint64_t **v36;
  uint64_t *v37;
  uint64_t **v38;
  void *v39;
  uint64_t **v40;
  void *v41;
  uint64_t **v42;
  uint64_t *v43;
  uint64_t v44;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = v0 + 1;
  +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap = (uint64_t)v0;
  v1 = (void *)objc_opt_class();
  v2 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v3 = v1;
  v43 = v3;
  v44 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v2, (unint64_t)v3, 2uLL, &v43)[6] = (uint64_t *)1;

  v4 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v3;
  v44 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v4, (unint64_t)v43, 0xDECAF002uLL, &v43)[6] = (uint64_t *)1;

  v5 = (void *)objc_opt_class();
  v6 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v5;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v6, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v7 = (void *)objc_opt_class();
  v8 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v7;
  v44 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v8, (unint64_t)v43, 2uLL, &v43)[6] = (uint64_t *)1;

  v9 = (void *)objc_opt_class();
  v10 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v11 = v9;
  v43 = v11;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v10, (unint64_t)v11, 1uLL, &v43)[6] = (uint64_t *)1;

  v12 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v11;
  v44 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v12, (unint64_t)v43, 0xDECAF002uLL, &v43)[6] = (uint64_t *)1;

  v13 = (void *)objc_opt_class();
  v14 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v15 = v13;
  v43 = v15;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v14, (unint64_t)v15, 1uLL, &v43)[6] = (uint64_t *)1;

  v16 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v15;
  v44 = 3737841665;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v16, (unint64_t)v43, 0xDECAF001uLL, &v43)[6] = (uint64_t *)1;

  v17 = (void *)objc_opt_class();
  v18 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v17;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v18, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v19 = (void *)objc_opt_class();
  v20 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v19;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v20, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v21 = (void *)objc_opt_class();
  v22 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v21;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v22, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v23 = (void *)objc_opt_class();
  v24 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v23;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v24, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v25 = (void *)objc_opt_class();
  v26 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v27 = v25;
  v43 = v27;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v26, (unint64_t)v27, 1uLL, &v43)[6] = (uint64_t *)1;

  v28 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v27;
  v44 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v28, (unint64_t)v43, 0xDECAF002uLL, &v43)[6] = (uint64_t *)1;

  v29 = (void *)objc_opt_class();
  v30 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v29;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v30, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v31 = (void *)objc_opt_class();
  v32 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v33 = v31;
  v43 = v33;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v32, (unint64_t)v33, 1uLL, &v43)[6] = (uint64_t *)1;

  v34 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v33;
  v44 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v34, (unint64_t)v43, 0xDECAF002uLL, &v43)[6] = (uint64_t *)1;

  v35 = (void *)objc_opt_class();
  v36 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v37 = v35;
  v43 = v37;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v36, (unint64_t)v37, 1uLL, &v43)[6] = (uint64_t *)1;

  v38 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v37;
  v44 = 3737841664;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v38, (unint64_t)v43, 0xDECAF000uLL, &v43)[6] = (uint64_t *)1;

  v39 = (void *)objc_opt_class();
  v40 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v39;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v40, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

  v41 = (void *)objc_opt_class();
  v42 = (uint64_t **)+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v43 = v41;
  v44 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v42, (unint64_t)v43, 1uLL, &v43)[6] = (uint64_t *)1;

}

+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNComputeStagePostProcessing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, CFSTR("VNComputeStageMain"), 0);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  }

  return v4;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  VNRegionOfInterestTilingOptions *v7;
  VNRegionOfInterestTilingOptions *inputImageTilingOptions;
  void *v9;
  VisionCoreSceneNetInferenceNetworkDescriptor *v10;
  VisionCoreSceneNetInferenceNetworkDescriptor *inferenceDescriptor;
  VisionCoreSceneNetInferenceNetworkDescriptor *v12;
  void *v13;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsCache *v14;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsCache *operationPointsCache;
  void *v16;
  id v17;
  id v18;
  signed int cachedInferenceImagePixelFormatType;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  char *v50;
  const char *v51;
  char *v52;
  shared_ptr<vision::mod::ImageAnalyzer> *p_imageAnalyzer;
  ImageAnalyzer *ptr;
  uint64_t v55;
  uint64_t *LabelsList;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  char v64;
  vector<unsigned long, std::allocator<unsigned long>> *p_entityNetIndexesToReport;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v68;
  unint64_t *begin;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  BOOL v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  void *v78;
  char *v80;
  const vision::mod::ImageAnalyzer_Options *v81;
  id v82;
  id v83;
  void *v84;
  int v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  __n128 __p;
  char v97;
  id v98;
  std::string __str;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  std::string v105;
  std::string v106;
  std::string v107;
  std::string v108;
  std::string v109;
  std::string v110;
  std::string v111[3];
  std::string v112[4];
  std::string v113;
  __int16 v114;
  std::string v115[8];
  uint64_t v116;
  objc_super v117;

  v6 = a3;
  v117.receiver = self;
  v117.super_class = (Class)VNImageAnalyzerMultiDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v117, sel_completeInitializationForSession_error_, v6, a4))
  {
    v7 = objc_alloc_init(VNRegionOfInterestTilingOptions);
    inputImageTilingOptions = self->_inputImageTilingOptions;
    self->_inputImageTilingOptions = v7;

    -[VNRegionOfInterestTilingOptions setTileOverflowCount:](self->_inputImageTilingOptions, "setTileOverflowCount:", 16);
    -[VNRegionOfInterestTilingOptions setTileOverlapPercentage:](self->_inputImageTilingOptions, "setTileOverlapPercentage:", 0.5);
    -[VNRegionOfInterestTilingOptions setRegionOfInterestAspectRatioThreshold:](self->_inputImageTilingOptions, "setRegionOfInterestAspectRatioThreshold:", 2.0);
    +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice](VNComputeDeviceUtilities, "mostPerformantCPUComputeDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_customClassifierEspressoEngine = +[VNEspressoHelpers espressoEngineForComputeDevice:](VNEspressoHelpers, "espressoEngineForComputeDevice:", v9);
    self->_customClassifierEspressoDeviceID = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:](VNEspressoHelpers, "espressoDeviceIDForComputeDevice:", v9);
    -[VNDetector configurationOptions](self, "configurationOptions");
    __str.__r_.__value_.__r.__words[0] = 0;
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &__str, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"))|| (self->_model = __str.__r_.__value_.__r.__words[0], v93 = (void *)objc_opt_class(), v10 = (VisionCoreSceneNetInferenceNetworkDescriptor *)objc_msgSend(v93, "_newInferenceDescriptorForModel:configuredWithOptions:error:", self->_model, v95, a4), inferenceDescriptor = self->_inferenceDescriptor, self->_inferenceDescriptor = v10, inferenceDescriptor, (v12 = self->_inferenceDescriptor) == 0))
    {
      v21 = 0;
LABEL_91:

      goto LABEL_92;
    }
    -[VisionCoreSceneNetInferenceNetworkDescriptor onlyInputImage](v12, "onlyInputImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedInferenceImagePixelFormatType = objc_msgSend(v13, "pixelFormatType");

    v14 = -[_VNImageAnalyzerMultiDetectorSceneOperationPointsCache initWithInferenceNetworkDescriptor:]([_VNImageAnalyzerMultiDetectorSceneOperationPointsCache alloc], "initWithInferenceNetworkDescriptor:", self->_inferenceDescriptor);
    operationPointsCache = self->_operationPointsCache;
    self->_operationPointsCache = v14;

    -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v21 = 0;
LABEL_90:

      goto LABEL_91;
    }
    -[VisionCoreSceneNetInferenceNetworkDescriptor modelPathForComputeDevice:error:](self->_inferenceDescriptor, "modelPathForComputeDevice:error:", v16, a4);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
    {
      v21 = 0;
      v22 = 0;
LABEL_89:

      goto LABEL_90;
    }
    vision::mod::ImageAnalyzer_Options::ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
    -[VisionCoreSceneNetInferenceNetworkDescriptor analyzerName](self->_inferenceDescriptor, "analyzerName");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::__assign_external(&__str, (const std::string::value_type *)objc_msgSend(v17, "UTF8String"));

    v103 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:](VNEspressoHelpers, "espressoDeviceIDForComputeDevice:", v16);
    v102 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:](VNEspressoHelpers, "espressoStorageTypeForComputeDevice:", v16);
    v100 = +[VNEspressoHelpers espressoEngineForComputeDevice:](VNEspressoHelpers, "espressoEngineForComputeDevice:", v16);
    v101 = 0;
    -[VisionCoreSceneNetInferenceNetworkDescriptor inputImageBlobName](self->_inferenceDescriptor, "inputImageBlobName");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::__assign_external(&v105, (const std::string::value_type *)objc_msgSend(v18, "UTF8String"));

    cachedInferenceImagePixelFormatType = self->_cachedInferenceImagePixelFormatType;
    if (cachedInferenceImagePixelFormatType <= 1094862673)
    {
      if (cachedInferenceImagePixelFormatType == 8)
      {
        v20 = 1;
        goto LABEL_22;
      }
      if (cachedInferenceImagePixelFormatType == 32)
      {
        v20 = 8;
        goto LABEL_22;
      }
    }
    else
    {
      switch(cachedInferenceImagePixelFormatType)
      {
        case 1380401729:
          v20 = 2;
          goto LABEL_22;
        case 1111970369:
          v20 = 4;
          goto LABEL_22;
        case 1094862674:
          v20 = 16;
          goto LABEL_22;
      }
    }
    v20 = 0;
LABEL_22:
    v104 = v20;
    v114 = 256;
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("VNDetectorInitOption_MemoryPoolId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v23, "unsignedLongLongValue");

    v24 = -[VisionCoreSceneNetInferenceNetworkDescriptor shouldInitializeAdditionalModelHeads](self->_inferenceDescriptor, "shouldInitializeAdditionalModelHeads");
    -[VisionCoreSceneNetInferenceNetworkDescriptor sceneRepresentationBlobName](self->_inferenceDescriptor, "sceneRepresentationBlobName");
    v90 = (id)objc_claimAutoreleasedReturnValue();
    if (v90)
      std::string::__assign_external(&v106, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v90), "UTF8String"));
    -[VisionCoreSceneNetInferenceNetworkDescriptor sceneLabelsFileURL](self->_inferenceDescriptor, "sceneLabelsFileURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "VisionCoreFileSystemPathAndReturnError:", 0);
    v26 = objc_claimAutoreleasedReturnValue();

    v89 = (id)v26;
    if (v26)
    {
      -[VisionCoreSceneNetInferenceNetworkDescriptor sceneClassificationLabelsBlobName](self->_inferenceDescriptor, "sceneClassificationLabelsBlobName");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external(&v108, (const std::string::value_type *)objc_msgSend(v27, "UTF8String"));

    }
    -[VisionCoreSceneNetInferenceNetworkDescriptor aestheticsLabelsFileURL](self->_inferenceDescriptor, "aestheticsLabelsFileURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "VisionCoreFileSystemPathAndReturnError:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[VisionCoreSceneNetInferenceNetworkDescriptor aestheticsScoresBlobName](self->_inferenceDescriptor, "aestheticsScoresBlobName");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external(&v110, (const std::string::value_type *)objc_msgSend(v30, "UTF8String"));

      -[VisionCoreSceneNetInferenceNetworkDescriptor aestheticsAttributesBlobName](self->_inferenceDescriptor, "aestheticsAttributesBlobName");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external(&v109, (const std::string::value_type *)objc_msgSend(v31, "UTF8String"));

    }
    v85 = v24;
    -[VisionCoreSceneNetInferenceNetworkDescriptor saliencyAHeatMapBlobName](self->_inferenceDescriptor, "saliencyAHeatMapBlobName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v32;
    if (v32)
    {
      std::string::__assign_external(v111, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
      v33 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v95);
      objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType"), v33, a4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v88;
      if (!v34)
      {
        v21 = 0;
        v22 = v91;
        v43 = v89;
LABEL_88:

        vision::mod::ImageAnalyzer_Options::~ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
        goto LABEL_89;
      }
    }
    -[VisionCoreSceneNetInferenceNetworkDescriptor saliencyOHeatMapBlobName](self->_inferenceDescriptor, "saliencyOHeatMapBlobName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v36;
    if (v36)
    {
      std::string::__assign_external(v112, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
      v37 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v95);
      objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), v37, a4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = v87;
      if (!v38)
      {
        v21 = 0;
        v22 = v91;
        v43 = v89;
LABEL_87:

        v35 = v88;
        goto LABEL_88;
      }
    }
    -[VisionCoreSceneNetInferenceNetworkDescriptor entityNetLabelsFileURL](self->_inferenceDescriptor, "entityNetLabelsFileURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v40;
    if (v40)
    {
      objc_msgSend(v40, "VisionCoreFileSystemPathAndReturnError:", a4);
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        v21 = 0;
LABEL_86:
        v22 = v91;
        v43 = v89;

        v39 = v87;
        goto LABEL_87;
      }
      v83 = (id)v41;
      -[VisionCoreSceneNetInferenceNetworkDescriptor entityNetLabelsBlobName](self->_inferenceDescriptor, "entityNetLabelsBlobName");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external(&v113, (const std::string::value_type *)objc_msgSend(v42, "UTF8String"));

    }
    else
    {
      v83 = 0;
    }
    if (v85)
    {
      -[VisionCoreSceneNetInferenceNetworkDescriptor objectDetectorLabelsFileURL](self->_inferenceDescriptor, "objectDetectorLabelsFileURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "VisionCoreFileSystemPathAndReturnError:", a4);
      v45 = objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        v78 = 0;
        v21 = 0;
        goto LABEL_85;
      }
      v86 = (id)v45;
      if (self->_model == 1)
      {
        -[VisionCoreSceneNetInferenceNetworkDescriptor objectDetectorOutputBlobBaseName](self->_inferenceDescriptor, "objectDetectorOutputBlobBaseName");
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::__assign_external(v115, (const std::string::value_type *)objc_msgSend(v46, "UTF8String"));

        _configureImageAnalyzerOptionsForSceneNetV3ObjDetNet((vision::mod::ImageAnalyzer_Options *)&__str);
        -[VNImageAnalyzerMultiDetector _configureSlidersAdjustmentsInImageAnalyzerOptions:forConfigurationOptions:]((uint64_t)self, (std::vector<std::string> *)&__str);
      }
    }
    else
    {
      v86 = 0;
      if (!v26)
      {
LABEL_48:
        v81 = (const vision::mod::ImageAnalyzer_Options *)v29;
        -[VisionCoreSceneNetInferenceNetworkDescriptor fingerprintsHasherFileURL](self->_inferenceDescriptor, "fingerprintsHasherFileURL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "VisionCoreFileSystemPathAndReturnError:", 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v94 = v48;
        if (v48)
        {
          -[VisionCoreSceneNetInferenceNetworkDescriptor fingerprintsOutputBlobName](self->_inferenceDescriptor, "fingerprintsOutputBlobName");
          v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::__assign_external(&v107, (const std::string::value_type *)objc_msgSend(v49, "UTF8String"));

        }
        v98 = (id)8576;
        v50 = (char *)objc_msgSend(objc_retainAutorelease(v91), "UTF8String");
        v51 = (const char *)objc_msgSend(objc_retainAutorelease(v89), "UTF8String");
        v52 = (char *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
        v92 = objc_retainAutorelease(v86);
        vision::mod::ImageAnalyzer::createImageAnalyzer(&__p, (uint64_t *)&v98, v50, v51, v52, 0, (char *)objc_msgSend(v92, "UTF8String"), (char *)objc_msgSend(objc_retainAutorelease(v83), "UTF8String"), &__str, (const char *)v16, v81);
        p_imageAnalyzer = &self->_imageAnalyzer;
        std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_imageAnalyzer, (__int128 *)&__p);
        std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&__p);
        ptr = self->_imageAnalyzer.__ptr_;
        v21 = ptr != 0;
        if (ptr)
        {
          if (v48)
          {
            kdebug_trace();
            v55 = (uint64_t)p_imageAnalyzer->__ptr_;
            std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v48), "UTF8String"));
            vision::mod::ImageAnalyzer::initHasher(v55, (uint64_t)&__p);
            if (v97 < 0)
              operator delete((void *)__p.n128_u64[0]);
            kdebug_trace();
            ptr = p_imageAnalyzer->__ptr_;
          }
          LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)ptr, 0x1000u);
          v57 = LabelsList[1] - *LabelsList;
          if (v57)
          {
            v58 = 0;
            v59 = v57 / 24;
            if (v59 <= 1)
              v60 = 1;
            else
              v60 = v59;
            do
            {
              v61 = objc_alloc(MEMORY[0x1E0CB3940]);
              v62 = *LabelsList + 24 * v58;
              if (*(char *)(v62 + 23) < 0)
                v62 = *(_QWORD *)v62;
              v63 = (id)objc_msgSend(v61, "initWithUTF8String:", v62);
              v64 = objc_msgSend(v63, "hasPrefix:", CFSTR("CVML_UNKNOWN_"));

              if ((v64 & 1) == 0)
              {
                p_entityNetIndexesToReport = &self->_entityNetIndexesToReport;
                end = self->_entityNetIndexesToReport.__end_;
                value = self->_entityNetIndexesToReport.__end_cap_.__value_;
                if (end >= value)
                {
                  begin = p_entityNetIndexesToReport->__begin_;
                  v70 = end - p_entityNetIndexesToReport->__begin_;
                  v71 = v70 + 1;
                  if ((unint64_t)(v70 + 1) >> 61)
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  v72 = (char *)value - (char *)begin;
                  if (v72 >> 2 > v71)
                    v71 = v72 >> 2;
                  v73 = (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8;
                  v74 = 0x1FFFFFFFFFFFFFFFLL;
                  if (!v73)
                    v74 = v71;
                  if (v74)
                  {
                    v74 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v74);
                    begin = p_entityNetIndexesToReport->__begin_;
                    end = self->_entityNetIndexesToReport.__end_;
                  }
                  else
                  {
                    v75 = 0;
                  }
                  v76 = (unint64_t *)(v74 + 8 * v70);
                  *v76 = v58;
                  v68 = v76 + 1;
                  while (end != begin)
                  {
                    v77 = *--end;
                    *--v76 = v77;
                  }
                  p_entityNetIndexesToReport->__begin_ = v76;
                  self->_entityNetIndexesToReport.__end_ = v68;
                  self->_entityNetIndexesToReport.__end_cap_.__value_ = (unint64_t *)(v74 + 8 * v75);
                  if (begin)
                    operator delete(begin);
                }
                else
                {
                  *end = v58;
                  v68 = end + 1;
                }
                self->_entityNetIndexesToReport.__end_ = v68;
                v48 = v94;
              }

              ++v58;
            }
            while (v58 != v60);
          }
        }
        else if (a4)
        {
          VNErrorForCVMLStatus(v98);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v78 = v92;
        v16 = v80;
        v29 = v82;
        goto LABEL_85;
      }
    }
    if (v93)
      objc_msgSend(v93, "createHierarchicalModelForInferenceDescriptor:error:", self->_inferenceDescriptor, a4);
    else
      __p = 0uLL;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_defaultSceneClassificationHierarchicalModel, (__int128 *)&__p);
    std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&__p);
    if (self->_defaultSceneClassificationHierarchicalModel.__ptr_)
      goto LABEL_48;
    v21 = 0;
    v78 = v86;
LABEL_85:

    goto LABEL_86;
  }
  v21 = 0;
LABEL_92:

  return v21;
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForInferenceDescriptor:(id)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  ImageClassifier_HierarchicalModel *v19;
  __shared_weak_count *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __n128 (*v28)(__n128 *, __n128 *);
  uint64_t (*v29)(uint64_t);
  const char *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v6 = v4;
  v7 = a3;
  objc_msgSend(v7, "sceneLabelsFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "VisionCoreFileSystemPathAndReturnError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "sceneLabelRelationshipsFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "VisionCoreFileSystemPathAndReturnError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x4012000000;
      v28 = __Block_byref_object_copy__391;
      v29 = __Block_byref_object_dispose__392;
      v31 = 0;
      v32 = 0;
      v30 = "";
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__VNImageAnalyzerMultiDetector_createHierarchicalModelForInferenceDescriptor_error___block_invoke;
      aBlock[3] = &unk_1E4547408;
      v22 = v9;
      v24 = &v25;
      v23 = v11;
      v12 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v12, (uint64_t)a4) & 1) != 0)
      {
        v13 = v26[7];
        *v6 = v26[6];
        v6[1] = v13;
        if (v13)
        {
          v14 = (unint64_t *)(v13 + 8);
          do
            v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
        }
      }
      else
      {
        *v6 = 0;
        v6[1] = 0;
      }

      _Block_object_dispose(&v25, 8);
      v16 = v32;
      if (v32)
      {
        p_shared_owners = (unint64_t *)&v32->__shared_owners_;
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
    }
    else
    {
      *v6 = 0;
      v6[1] = 0;
    }

  }
  else
  {
    *v6 = 0;
    v6[1] = 0;
  }

  result.__cntrl_ = v20;
  result.__ptr_ = v19;
  return result;
}

+ (id)_newInferenceDescriptorForModel:(unint64_t)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0DC6CC8], "descriptorForModel:requireObjDetNet:requireSliderNet:error:", a3, v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;

  return v13;
}

void __69__VNImageAnalyzerMultiDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  return self;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageAnalyzerMultiDetector;
  -[VNDetector description](&v6, sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromVisionCoreSceneNetInferenceNetworkModel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR(" %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)signPostAdditionalParameter
{
  unint64_t model;

  model = self->_model;
  return -[VisionCoreSceneNetInferenceNetworkDescriptor shouldInitializeAdditionalModelHeads](self->_inferenceDescriptor, "shouldInitializeAdditionalModelHeads") | (model << 56);
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((Class)objc_opt_class() != a3
    || (-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"), v6) & 1) != 0|| (-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"), v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNImageAnalyzerMultiDetector;
    v7 = -[VNDetector canBehaveAsDetectorOfClass:withConfiguration:](&v9, sel_canBehaveAsDetectorOfClass_withConfiguration_, a3, v6);
  }

  return v7;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  unsigned __int8 v7;

  v6 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    if ((-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"), v6) & 1) != 0)v7 = 1;
    else
      v7 = -[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"), v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  std::__shared_weak_count *v12;
  _BOOL8 v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t (**v24)(void *, const __CFString *, id *);
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  std::__shared_weak_count *v31;
  _BOOL8 v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  BOOL v36;
  std::__shared_weak_count *v37;
  _BOOL8 v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  BOOL v42;
  std::__shared_weak_count *v43;
  _BOOL8 v44;
  unint64_t *v45;
  unint64_t v46;
  void *v47;
  BOOL v48;
  _BOOL8 v49;
  void *v50;
  BOOL v51;
  _BOOL8 v52;
  _QWORD aBlock[5];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BOOL8 v61;
  std::__shared_weak_count *v62;
  objc_super v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v63.receiver = self;
  v63.super_class = (Class)VNImageAnalyzerMultiDetector;
  if (!-[VNDetector warmUpSession:withOptions:error:](&v63, sel_warmUpSession_withOptions_error_, v8, v9, a5))
    goto LABEL_51;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_JunkConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    -[VNImageAnalyzerMultiDetector _junkCustomClassifiersAndReturnError:](&v61, (uint64_t)self, a5);
    v13 = v61;
    v12 = v62;
    if (!v62)
      goto LABEL_7;
    p_shared_owners = (unint64_t *)&v62->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      if (v13)
        goto LABEL_8;
    }
    else
    {
LABEL_7:
      if (v13)
        goto LABEL_8;
    }
LABEL_51:
    LOBYTE(v52) = 0;
    goto LABEL_52;
  }
LABEL_8:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "observationsRecipient");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "originatingRequestSpecifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[VNImageAnalyzerMultiDetector sceneLabelOperationPointsForOriginatingRequestSpecifier:error:](self, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:", v21, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v20) = v22 == 0;

        if ((v20 & 1) != 0)
        {

          LOBYTE(v52) = 0;
          goto LABEL_49;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      if (v17)
        continue;
      break;
    }
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VNImageAnalyzerMultiDetector_warmUpSession_withOptions_error___block_invoke;
  aBlock[3] = &unk_1E4547258;
  aBlock[4] = self;
  v23 = v9;
  v55 = v23;
  v56 = v8;
  v24 = (uint64_t (**)(void *, const __CFString *, id *))_Block_copy(aBlock);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26 && (v24[2](v24, CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType"), a5) & 1) == 0)
    goto LABEL_47;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (!v28 && !v24[2](v24, CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), a5))
    goto LABEL_47;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (!v30)
  {
    -[VNImageAnalyzerMultiDetector _VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:](&v61, (uint64_t)self, a5);
    v32 = v61;
    v31 = v62;
    if (v62)
    {
      v33 = (unint64_t *)&v62->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    if (!v32)
      goto LABEL_47;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  if (!v36)
  {
    -[VNImageAnalyzerMultiDetector _potentialLandmarksCustomClassifierAndReturnError:](&v61, (uint64_t)self, a5);
    v38 = v61;
    v37 = v62;
    if (v62)
    {
      v39 = (unint64_t *)&v62->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    if (!v38)
      goto LABEL_47;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (!v42)
  {
    -[VNImageAnalyzerMultiDetector _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:](&v61, (uint64_t)self, a5);
    v44 = v61;
    v43 = v62;
    if (v62)
    {
      v45 = (unint64_t *)&v62->__shared_owners_;
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    if (!v44)
      goto LABEL_47;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47 == 0;

  if (v48
    || (-[VNImageAnalyzerMultiDetector _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:](&v61, (uint64_t)self, a5), v49 = v61, std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&v61), v49))
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (v51
      || (-[VNImageAnalyzerMultiDetector _cityNatureCustomClassifierAndReturnError:](&v61, (uint64_t)self, a5),
          v52 = v61,
          std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&v61),
          v52))
    {
      LOBYTE(v52) = 1;
    }
  }
  else
  {
LABEL_47:
    LOBYTE(v52) = 0;
  }

LABEL_49:
LABEL_52:

  return v52;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  CGFloat x;
  id v16;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  __int32 v24;
  id v25;
  float v26;
  double v27;
  float v28;
  uint64_t v29;
  double v31;
  double v32;
  void *v33;
  unint64_t v34;
  id *v35;
  _BOOL8 v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  dispatch_block_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _VNImageAnalyzerMultiDetectorTilingSceneConfiguration *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  id v91;
  dispatch_block_t v92;
  id v93;
  NSObject *v94;
  id v95;
  dispatch_block_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  float v119;
  float v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t *v128;
  uint64_t k;
  void *v130;
  float v131;
  float v132;
  void *v133;
  char v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  id v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t *v142;
  uint64_t m;
  void *v144;
  float v145;
  float v146;
  void *v147;
  char v148;
  id v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const __CFString *v163;
  void *v165;
  void *v166;
  id obj;
  uint64_t v168;
  id v169;
  dispatch_group_t v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void (**v175)(void);
  void (**v176)(void);
  void *v177;
  id v178;
  id v179;
  _VNImageAnalyzerMultiDetectorTilingSceneConfiguration *v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  id v185;
  id v186;
  uint64_t v187;
  void *v188;
  void *v189;
  double v190;
  id v191;
  double v192;
  id v193;
  double v194;
  id v195;
  dispatch_group_t v196;
  double v197;
  NSObject *v198;
  double v199;
  id v200;
  id v201;
  id *to;
  id *toa;
  id *v204;
  void *v205;
  void *v207;
  VNImageAnalyzerMultiDetector *val;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _QWORD v221[4];
  NSObject *v222;
  VNImageAnalyzerMultiDetector *v223;
  _VNImageAnalyzerMultiDetectorTilingSceneConfiguration *v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  _QWORD *v230;
  _QWORD *v231;
  _QWORD *v232;
  id v233[2];
  unsigned int v234;
  int v235;
  _QWORD v236[4];
  NSObject *v237;
  id v238;
  id v239;
  id v240;
  id v241;
  _QWORD *v242;
  _QWORD *v243;
  id v244[6];
  int v245;
  unsigned int v246;
  _QWORD v247[4];
  _QWORD v248[5];
  id v249;
  _QWORD v250[4];
  NSObject *v251;
  id v252;
  id v253;
  id v254;
  id v255;
  void (**v256)(void);
  id v257;
  _QWORD *v258;
  _QWORD *v259;
  _QWORD *v260;
  _QWORD *v261;
  uint64_t *v262;
  id v263[5];
  unsigned int v264;
  int v265;
  BOOL v266;
  _QWORD block[4];
  NSObject *v268;
  id v269;
  id v270;
  id v271;
  id v272;
  _QWORD *v273;
  _QWORD *v274;
  id v275[5];
  int v276;
  unsigned int v277;
  BOOL v278;
  _QWORD v279[4];
  _QWORD v280[5];
  id v281;
  _QWORD v282[5];
  id v283;
  id location;
  _QWORD v285[6];
  int v286;
  uint64_t v287;
  uint64_t *v288;
  uint64_t v289;
  uint64_t (*v290)(uint64_t, uint64_t);
  void (*v291)(uint64_t);
  id v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  int32x2_t v297;
  uint64_t v298;
  _BYTE v299[128];
  _BYTE v300[128];
  _BYTE v301[128];
  _BYTE v302[128];
  uint64_t v303;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v303 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v179 = a6;
  v178 = a8;
  val = self;
  v204 = a7;
  v205 = v16;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v17;
  if (!v17)
  {
    v25 = 0;
    goto LABEL_97;
  }
  v298 = 2;
  v297 = vdup_n_s32(0x7FC00000u);
  -[VNImageAnalyzerMultiDetector _getImageCropAndScaleOption:networkRequiredInputImageSize:forOptions:]((uint64_t)self, &v298, &v297, v16);
  *(double *)&to = x;
  v18 = objc_msgSend(v17, "width");
  v19 = (double)(unint64_t)objc_msgSend(v17, "height");
  v194 = (double)(unint64_t)(double)v18;
  v20 = height;
  v192 = (double)(unint64_t)v19;
  v21 = height * v192;
  v22 = *(float *)&v297.i32[1];
  v23 = *(float *)v297.i32;
  if (*(float *)&v297.i32[1] >= *(float *)v297.i32)
    v24 = v297.i32[0];
  else
    v24 = v297.i32[1];
  v197 = v21;
  v199 = width * v194;
  if (width * v194 < v21)
    v21 = width * v194;
  if (v21 >= 1.0)
  {
    v190 = width;
    v26 = v21;
    if (*(float *)&v24 > v26)
    {
      if (v190 >= v20)
        v27 = v20;
      else
        v27 = v190;
      v28 = *(float *)&v24;
      if (v27 > 0.0)
        v28 = *(float *)&v24 / v27;
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v179, (unint64_t)v28);
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
    v29 = objc_claimAutoreleasedReturnValue();
    v174 = (void *)v29;
    if (*(float *)&v24 > v26 || v29 == 0)
    {
      v36 = 0;
      v189 = 0;
      v32 = v20;
      v35 = to;
    }
    else
    {
      v31 = (float)(v22 / v23);
      v32 = v20;
      +[VNRegionOfInterestTiling tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:](VNRegionOfInterestTiling, "tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:", (unint64_t)(double)v18, (unint64_t)v19, self->_inputImageTilingOptions, *(double *)&to, y, v190, v20, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "tileCount");
      v35 = to;
      v36 = v34 > 1;
      if (v34 < 2)
      {
        v189 = 0;
      }
      else
      {
        objc_msgSend(v33, "tiles");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v33, "tileColumnsCount");
        v38 = objc_msgSend(v33, "tileRowsCount");
        v296 = 0u;
        v295 = 0u;
        v294 = 0u;
        v293 = 0u;
        objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_TilingWarningRecorders"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v293, v302, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v294;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v294 != v41)
                objc_enumerationMutation(v39);
              VNRecordImageTilingWarning(*(void **)(*((_QWORD *)&v293 + 1) + 8 * i), v37, v38);
            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v293, v302, 16);
          }
          while (v40);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "setObject:forKeyedSubscript:", v43, CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_TilingIsRequired"));

    v173 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v287 = 0;
    v288 = &v287;
    v289 = 0x3032000000;
    v290 = __Block_byref_object_copy__23953;
    v291 = __Block_byref_object_dispose__23954;
    v292 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v285[0] = 0;
    v285[1] = v285;
    v285[2] = 0x3812000000;
    v285[3] = __Block_byref_object_copy__312;
    v285[4] = __Block_byref_object_dispose__313;
    v285[5] = "";
    v286 = 0;
    objc_initWeak(&location, val);
    v44 = (void *)objc_opt_class();
    v45 = objc_msgSend(v44, "VNClassCode");
    objc_msgSend(v44, "detectorCropCreationAsyncTasksQueue");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = dispatch_group_create();
    objc_msgSend(v44, "detectorCropProcessingAsyncTasksQueue");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = dispatch_group_create();
    v282[0] = 0;
    v282[1] = v282;
    v282[2] = 0x3032000000;
    v282[3] = __Block_byref_object_copy__23953;
    v282[4] = __Block_byref_object_dispose__23954;
    v283 = 0;
    v280[0] = 0;
    v280[1] = v280;
    v280[2] = 0x3032000000;
    v280[3] = __Block_byref_object_copy__23953;
    v280[4] = __Block_byref_object_dispose__23954;
    v281 = 0;
    v279[0] = 0;
    v279[1] = v279;
    v279[2] = 0x2020000000;
    v279[3] = 0;
    v46 = (void *)objc_msgSend(v205, "mutableCopy");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
    block[3] = &unk_1E4547280;
    objc_copyWeak(v275, &location);
    v273 = v282;
    v276 = v45;
    v47 = v170;
    v268 = v47;
    v277 = a3;
    *(double *)&v275[1] = *(double *)&v35 * v194;
    *(double *)&v275[2] = y * v192;
    v275[3] = *(id *)&v199;
    v275[4] = *(id *)&v197;
    v48 = v46;
    v269 = v48;
    v49 = v179;
    v270 = v49;
    v274 = v279;
    v50 = v178;
    v272 = v50;
    v278 = v36;
    v195 = v172;
    v271 = v195;
    v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
    v250[0] = MEMORY[0x1E0C809B0];
    v250[1] = 3221225472;
    v250[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
    v250[3] = &unk_1E45472F8;
    objc_copyWeak(v263, &location);
    v258 = v282;
    v264 = a3;
    v175 = v51;
    v256 = v175;
    v265 = v45;
    v198 = v47;
    v251 = v198;
    v259 = v280;
    v260 = v279;
    v169 = v48;
    v252 = v169;
    v263[1] = v35;
    v263[2] = *(id *)&y;
    v263[3] = *(id *)&v190;
    v263[4] = *(id *)&v32;
    v183 = v49;
    v253 = v183;
    v181 = v50;
    v257 = v181;
    v261 = v285;
    v262 = &v287;
    v191 = v173;
    v254 = v191;
    v266 = v36;
    v193 = v171;
    v255 = v193;
    v176 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v250);
    if (!v36)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Performing createScaledFullImageForProcessingBlock; %@"),
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        (uint64_t)val);
      v175[2]();
      VNValidatedLog(1, (uint64_t)CFSTR("Performing processScaledFullImagePixelBufferBlock; %@"),
        v151,
        v152,
        v153,
        v154,
        v155,
        v156,
        (uint64_t)val);
      v176[2]();
      VNValidatedLog(1, (uint64_t)CFSTR("Finish processing createScaledFullImageForProcessingBlock and processScaledFullImagePixelBufferBlock. currentDetector: %@"), v157, v158, v159, v160, v161, v162, (uint64_t)val);
      if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v191, v204))
      {
        v25 = (id)v288[5];
      }
      else
      {
        v25 = 0;
      }
      goto LABEL_96;
    }
    VNValidatedLog(1, (uint64_t)CFSTR("Scheduling createScaledFullImageForProcessingBlock; %@"),
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      (uint64_t)val);
    objc_msgSend(v195, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v196, v175);
    VNValidatedLog(1, (uint64_t)CFSTR("Scheduling processScaledFullImagePixelBufferBlock; %@"),
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      (uint64_t)val);
    objc_msgSend(v193, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v198, v176);
    v64 = [_VNImageAnalyzerMultiDetectorTilingSceneConfiguration alloc];
    objc_msgSend(v174, "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "observationsRecipient");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = -[_VNImageAnalyzerMultiDetectorTilingSceneConfiguration initWithObservationsRecipient:](v64, "initWithObservationsRecipient:", v66);

    v185 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v186 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v187 = objc_msgSend(v189, "count");
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("Start processing chunksProcessingGroup. currentDetector: %@"), v67, v68, v69, v70, v71, v72, (uint64_t)val);
    if (v187)
    {
      for (j = 0; j != (char *)v187; ++j)
      {
        objc_msgSend(v189, "objectAtIndexedSubscript:", j);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "pixelCropRect");
        v82 = v81;
        v84 = v83;
        v86 = v85;
        v88 = v87;

        v248[0] = 0;
        v248[1] = v248;
        v248[2] = 0x3032000000;
        v248[3] = __Block_byref_object_copy__23953;
        v248[4] = __Block_byref_object_dispose__23954;
        v249 = 0;
        v247[0] = 0;
        v247[1] = v247;
        v247[2] = 0x2020000000;
        v247[3] = 0;
        v89 = (void *)objc_msgSend(v205, "mutableCopy");
        v236[0] = MEMORY[0x1E0C809B0];
        v236[1] = 3221225472;
        v236[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6;
        v236[3] = &unk_1E4547320;
        objc_copyWeak(v244, &location);
        v245 = v45;
        v242 = v248;
        v244[1] = j;
        v90 = v196;
        v237 = v90;
        v246 = a3;
        v244[2] = v82;
        v244[3] = v84;
        v244[4] = v86;
        v244[5] = v88;
        v200 = v89;
        v238 = v200;
        v239 = v183;
        v243 = v247;
        v241 = v181;
        v91 = v195;
        v240 = v91;
        v92 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v236);
        v221[0] = MEMORY[0x1E0C809B0];
        v221[1] = 3221225472;
        v221[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8;
        v221[3] = &unk_1E4547398;
        objc_copyWeak(v233, &location);
        v230 = v248;
        v234 = a3;
        v93 = v92;
        v235 = v45;
        v229 = v93;
        v233[1] = j;
        v94 = v198;
        v222 = v94;
        v223 = val;
        v231 = v247;
        v224 = v180;
        v232 = v285;
        v225 = v185;
        v226 = v186;
        v227 = v191;
        v95 = v193;
        v228 = v95;
        v96 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v221);
        VNValidatedLog(1, (uint64_t)CFSTR("Scheduling createTileCropForProcessingBlock. currentDetector: %@"), v97, v98, v99, v100, v101, v102, (uint64_t)val);
        objc_msgSend(v91, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v90, v93);
        VNValidatedLog(1, (uint64_t)CFSTR("Scheduling processTileBlock. currentDetector: %@"), v103, v104, v105, v106, v107, v108, (uint64_t)val);
        objc_msgSend(v95, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v94, v96);

        objc_destroyWeak(v233);
        objc_destroyWeak(v244);

        _Block_object_dispose(v247, 8);
        _Block_object_dispose(v248, 8);

      }
    }
    VNValidatedLog(1, (uint64_t)CFSTR("Waiting for cropCreationGroup. currentDetector: %@; group: %@"),
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      (uint64_t)val);
    if ((objc_msgSend(v195, "dispatchGroupWait:error:", v196, v204) & 1) != 0)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Waiting for cropProcessingGroup. currentDetector: %@; group: %@"),
        v109,
        v110,
        v111,
        v112,
        v113,
        v114,
        (uint64_t)val);
      if ((objc_msgSend(v193, "dispatchGroupWait:error:", v198, v204) & 1) != 0)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Finish processing cropCreationGroup and cropCreationGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@"),
          v109,
          v110,
          v111,
          v112,
          v113,
          v114,
          (uint64_t)val);
        kdebug_trace();
        if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v191, v204))
        {
          objc_msgSend(v185, "allValues");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "allValues");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v219 = 0u;
          v220 = 0u;
          v217 = 0u;
          v218 = 0u;
          obj = v174;
          v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v217, v301, 16);
          if (v115)
          {
            v182 = *(_QWORD *)v218;
            while (2)
            {
              v168 = v115;
              v116 = 0;
              do
              {
                if (*(_QWORD *)v218 != v182)
                  objc_enumerationMutation(obj);
                v117 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * v116);
                objc_msgSend(v117, "observationsRecipient");
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "originatingRequestSpecifier");
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                -[VNImageAnalyzerMultiDetector sceneLabelOperationPointsForOriginatingRequestSpecifier:error:](val, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                v184 = v116;
                if (v118)
                {
                  objc_msgSend(v117, "disallowedList");
                  toa = (id *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "minimumConfidence");
                  v120 = v119;
                  v201 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v248[0] = 0;
                  v121 = objc_msgSend(v117, "maximumLeafLabels");
                  v122 = v121 & 0x7FFFFFFFFFFFFFFFLL;
                  if ((v121 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFFFLL)
                    v123 = -1;
                  else
                    v123 = v121;
                  v248[0] = v123;
                  if (v123)
                  {
                    v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v215 = 0u;
                    v216 = 0u;
                    v213 = 0u;
                    v214 = 0u;
                    v125 = v166;
                    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v213, v300, 16);
                    if (v126)
                    {
                      v127 = *(_QWORD *)v214;
                      if (v122 == 0x7FFFFFFFFFFFFFFFLL)
                        v128 = 0;
                      else
                        v128 = v248;
                      while (2)
                      {
                        for (k = 0; k != v126; ++k)
                        {
                          if (*(_QWORD *)v214 != v127)
                            objc_enumerationMutation(v125);
                          v130 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * k);
                          objc_msgSend(v130, "confidence");
                          v132 = v131;
                          if (v131 >= v120)
                          {
                            objc_msgSend(v130, "identifier");
                            v133 = (void *)objc_claimAutoreleasedReturnValue();
                            v134 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:]((uint64_t)val, v133, toa, v118, v207, v124, v128, (uint64_t)v204, v132);

                            if ((v134 & 1) == 0)
                            {

LABEL_82:
                              v150 = 1;
                              goto LABEL_83;
                            }
                          }
                        }
                        v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v213, v300, 16);
                        if (v126)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(v201, "addObjectsFromArray:", v124);
                  }
                  v247[0] = 0;
                  v135 = objc_msgSend(v117, "maximumHierarchicalLabels");
                  v136 = v135;
                  v137 = 0x7FFFFFFFLL;
                  if (v135 < 0x7FFFFFFF)
                    v137 = v135;
                  v247[0] = v137;
                  if (v137)
                  {
                    v138 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v211 = 0u;
                    v212 = 0u;
                    v209 = 0u;
                    v210 = 0u;
                    v139 = v165;
                    v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v209, v299, 16);
                    if (v140)
                    {
                      v141 = *(_QWORD *)v210;
                      if (v136 >= 0x7FFFFFFF)
                        v142 = 0;
                      else
                        v142 = v247;
                      while (2)
                      {
                        for (m = 0; m != v140; ++m)
                        {
                          if (*(_QWORD *)v210 != v141)
                            objc_enumerationMutation(v139);
                          v144 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * m);
                          objc_msgSend(v144, "confidence");
                          v146 = v145;
                          if (v145 >= v120)
                          {
                            objc_msgSend(v144, "identifier");
                            v147 = (void *)objc_claimAutoreleasedReturnValue();
                            v148 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:]((uint64_t)val, v147, toa, v118, v207, v138, v142, (uint64_t)v204, v146);

                            if ((v148 & 1) == 0)
                            {

                              goto LABEL_82;
                            }
                          }
                        }
                        v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v209, v299, 16);
                        if (v140)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(v201, "addObjectsFromArray:", v138);
                  }
                  v149 = &__block_literal_global_88;
                  objc_msgSend(v201, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

                  objc_msgSend(v188, "receiveObservations:", v201);
                  objc_msgSend((id)v288[5], "addObjectsFromArray:", v201);
                  v150 = 0;
LABEL_83:

                }
                else
                {
                  v150 = 1;
                }

                if (v150)
                {

                  v25 = 0;
                  goto LABEL_99;
                }
                v116 = v184 + 1;
              }
              while (v184 + 1 != v168);
              v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v217, v301, 16);
              if (v115)
                continue;
              break;
            }
          }

          v25 = (id)v288[5];
LABEL_99:

          goto LABEL_95;
        }
LABEL_94:
        v25 = 0;
LABEL_95:

LABEL_96:
        objc_destroyWeak(v263);

        objc_destroyWeak(v275);
        _Block_object_dispose(v279, 8);
        _Block_object_dispose(v280, 8);

        _Block_object_dispose(v282, 8);
        objc_destroyWeak(&location);
        _Block_object_dispose(v285, 8);
        _Block_object_dispose(&v287, 8);

        goto LABEL_97;
      }
      v163 = CFSTR("Timed out waiting for image analyzer cropProcessingGroup when processing full image and %lu tiles. currentDetector: %@; group: %@");
    }
    else
    {
      v163 = CFSTR("Timed out waiting for image analyzer cropCreationGroup when processing full image and %lu tiles. currentDetector: %@; group: %@");
    }
    VNValidatedLog(4, (uint64_t)v163, v109, v110, v111, v112, v113, v114, v187);
    goto LABEL_94;
  }
  v25 = (id)MEMORY[0x1E0C9AA60];
LABEL_97:

  return v25;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  _BOOL4 v18;
  BOOL v19;
  id *v20;
  uint64_t v21;
  int32x2_t v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t cachedInferenceImagePixelFormatType;
  id v31;
  id v32;
  id *v34;
  __CVBuffer **v35;
  id v36;
  id v37;
  int32x2_t v38;
  uint64_t v39;
  id v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    LOBYTE(v27) = 0;
    goto LABEL_21;
  }
  v39 = 2;
  v38 = vdup_n_s32(0x7FC00000u);
  -[VNImageAnalyzerMultiDetector _getImageCropAndScaleOption:networkRequiredInputImageSize:forOptions:]((uint64_t)self, &v39, &v38, v16);
  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.width = 1.0;
  v42.size.height = 1.0;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v18 = CGRectEqualToRect(v41, v42);
  v19 = v18;
  v35 = a7;
  if (v18)
    v20 = &v37;
  else
    v20 = 0;
  if (v18)
    v37 = 0;
  v21 = v39;
  v22 = v38;
  v36 = v17;
  v23 = v16;
  v24 = v23;
  if (self)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_SkipInputImageScaling"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (!v26)
    {
      v29 = (void *)objc_msgSend(v24, "mutableCopy");
      objc_msgSend(v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      cachedInferenceImagePixelFormatType = self->_cachedInferenceImagePixelFormatType;
      v40 = 0;
      v34 = v20;
      v28 = v36;
      v27 = objc_msgSend(v36, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", (unint64_t)*(float *)&v22.i32[1], (unint64_t)*(float *)v22.i32, cachedInferenceImagePixelFormatType, v21, v29, &v40, x, y, width, height, 0, 0, 0, v34);
      v31 = v40;
      if (a8 && !v27)
      {
        +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 9, CFSTR("Failed to scale the input image"), v31);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_16;
    }
    v27 = objc_msgSend(v36, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)width, (unint64_t)height, self->_cachedInferenceImagePixelFormatType, v24, a8, v20, x, y, width, height);
  }
  else
  {
    v27 = 0;
  }
  v28 = v36;
LABEL_16:

  if (v19)
  {
    v32 = v37;
    *v35 = (__CVBuffer *)v27;
    if (v27)
    {
      -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v24, v32, v28);
      LOBYTE(v27) = 1;
    }
  }
  else
  {
    v32 = 0;
    *v35 = (__CVBuffer *)v27;
    LOBYTE(v27) = v27 != 0;
  }

LABEL_21:
  return v27;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a5;
  v19 = a7;
  v20 = a9;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__23953;
  v49 = __Block_byref_object_dispose__23954;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__23953;
  v43 = __Block_byref_object_dispose__23954;
  v44 = 0;
  -[VNDetector synchronizationQueue](self, "synchronizationQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __130__VNImageAnalyzerMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  v28[3] = &unk_1E45473C0;
  v32 = &v45;
  v28[4] = self;
  v38 = a6;
  v22 = v18;
  v29 = v22;
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  v23 = v19;
  v30 = v23;
  v33 = &v39;
  v24 = v20;
  v31 = v24;
  objc_msgSend(v21, "dispatchSyncByPreservingQueueCapacity:", v28);
  v25 = (void *)v46[5];
  if (v25)
  {
    v26 = v25;
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease((id)v40[5]);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v25;
}

- (id)_processFullImagePixelBuffer:(const __CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CVBuffer *v53;
  _BYTE v54[128];
  uint64_t v55;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v55 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v17 = a4;
  v47 = a7;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_JunkConfiguration"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_TilingIsRequired"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    v23 = objc_msgSend(v48, "width");
    v24 = objc_msgSend(v48, "height");
    if (v22)
      v25 = 0;
    else
      v25 = v38;
    -[VNImageAnalyzerMultiDetector _observationsForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:pixelBuffer:withOptions:originalImageSize:regionOfInterest:qosClass:warningRecorder:error:]((uint64_t)self, v25, v37, v44, v45, v46, v36, v35, (double)v23, (double)v24, x, y, width, height, v43, v34, v40, v39, v41,
      v18,
      v19,
      v20,
      v42,
      (uint64_t)&v53,
      v17,
      a6,
      v47,
      a8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v50 != v30)
              objc_enumerationMutation(v28);
            -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v17, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v29);
      }

      v32 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)hasObjDetNet
{
  ImageAnalyzer *ptr;
  uint64_t v3;

  ptr = self->_imageAnalyzer.__ptr_;
  if (*((char *)ptr + 415) < 0)
    v3 = *((_QWORD *)ptr + 50);
  else
    v3 = *((unsigned __int8 *)ptr + 415);
  return v3 != 0;
}

- (BOOL)hasSliderNet
{
  return *((_QWORD *)self->_imageAnalyzer.__ptr_ + 43) != *((_QWORD *)self->_imageAnalyzer.__ptr_ + 42);
}

- (id)allSceneIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ImageClassifier_HierarchicalModel *ptr;
  uint64_t *i;
  uint64_t v17;
  int64_t size;
  std::string *v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  BOOL v23;
  uint64_t *v24;
  uint64_t *DisallowedLabels;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  uint64_t *v28;
  uint64_t *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  void **v33;
  uint64_t v34;
  void *v35;
  uint64_t *LabelsList;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  unsigned int v45;
  void *v46;
  id v47;
  void *__p[2];
  __int128 v49;
  int v50;
  _QWORD aBlock[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  std::string v60;
  uint64_t v61;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__23953;
  v58 = __Block_byref_object_dispose__23954;
  v59 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__VNImageAnalyzerMultiDetector_allSceneIdentifiersWithOptions_error___block_invoke;
  aBlock[3] = &unk_1E4547430;
  v53 = &v54;
  v8 = v7;
  v52 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "disallowedList");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v55[5];
      v55[5] = v34;

      LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, objc_msgSend(v12, "labelsListType"));
      v37 = *LabelsList;
      v38 = LabelsList[1];
      if (*LabelsList != v38)
      {
        do
        {
          v39 = objc_alloc(MEMORY[0x1E0CB3940]);
          v40 = v37;
          if (*(char *)(v37 + 23) < 0)
            v40 = *(_QWORD *)v37;
          v41 = (void *)objc_msgSend(v39, "initWithUTF8String:", v40);
          v9[2](v9, v41);

          v37 += 24;
        }
        while (v37 != v38);
      }
    }
LABEL_48:
    objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
    v42 = v8;
    goto LABEL_49;
  }
  if (+[VNValidationUtilities validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v10, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"), objc_opt_class(), 1, 1, a4))
  {
    v47 = v6;
    objc_msgSend(v10, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "disallowedList");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v55[5];
    v55[5] = v13;

    v45 = objc_msgSend(v46, "labelsListType");
    ptr = self->_defaultSceneClassificationHierarchicalModel.__ptr_;
    *(_OWORD *)__p = 0u;
    v49 = 0u;
    v50 = 1065353216;
    for (i = (uint64_t *)*((_QWORD *)ptr->var0 + 2); i; i = (uint64_t *)*i)
    {
      if (*((char *)i + 39) < 0)
        std::string::__init_copy_ctor_external(&v60, (const std::string::value_type *)i[2], i[3]);
      else
        v60 = *(std::string *)(i + 2);
      v17 = i[5];
      v61 = v17;
      if (*(_DWORD *)(v17 + 84) != 1 && *(_QWORD *)(v17 + 64) != *(_QWORD *)(v17 + 56))
      {
        size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
        if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          v19 = &v60;
        }
        else
        {
          size = v60.__r_.__value_.__l.__size_;
          v19 = (std::string *)v60.__r_.__value_.__r.__words[0];
        }
        if (size >= 13)
        {
          v20 = (std::string *)((char *)v19 + size);
          v21 = v19;
          do
          {
            v22 = (std::string *)memchr(v21, 67, size - 12);
            if (!v22)
              break;
            v23 = v22->__r_.__value_.__r.__words[0] == 0x4B4E555F4C4D5643
               && *(std::string::size_type *)((char *)v22->__r_.__value_.__r.__words + 5) == 0x5F4E574F4E4B4E55;
            if (v23)
            {
              if (v22 != v20 && v22 == v19)
                goto LABEL_24;
              break;
            }
            v21 = (std::string *)((char *)&v22->__r_.__value_.__l.__data_ + 1);
            size = (char *)v20 - (char *)v21;
          }
          while ((char *)v20 - (char *)v21 >= 13);
        }
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)__p, (unsigned __int8 *)&v60, (uint64_t)&v60);
      }
LABEL_24:
      if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v60.__r_.__value_.__l.__data_);
    }
    v24 = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, v45);
    DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels((uint64_t)self->_imageAnalyzer.__ptr_, v45);
    v27 = (unsigned __int8 *)*v24;
    v26 = (unsigned __int8 *)v24[1];
    v23 = *v24 == (_QWORD)v26;
    v6 = v47;
    if (!v23)
    {
      v28 = DisallowedLabels;
      do
      {
        if (!std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v28, v27))std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)__p, v27, (uint64_t)v27);
        v27 += 24;
      }
      while (v27 != v26);
    }
    v29 = (uint64_t *)v49;
    if ((_QWORD)v49)
    {
      do
      {
        v30 = objc_alloc(MEMORY[0x1E0CB3940]);
        v31 = v29 + 2;
        if (*((char *)v29 + 39) < 0)
          v31 = (_QWORD *)*v31;
        v32 = (void *)objc_msgSend(v30, "initWithUTF8String:", v31);
        v9[2](v9, v32);

        v29 = (uint64_t *)*v29;
      }
      while (v29);
      v33 = (void **)v49;
    }
    else
    {
      v33 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(v33);
    v43 = __p[0];
    __p[0] = 0;
    if (v43)
      operator delete(v43);

    goto LABEL_48;
  }
  v42 = 0;
LABEL_49:

  _Block_object_dispose(&v54, 8);
  return v42;
}

- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  -[_VNImageAnalyzerMultiDetectorSceneOperationPointsCache sceneLabelOperationPointsForOriginatingRequestSpecifier:error:](self->_operationPointsCache, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allJunkIdentifiersForOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t **v7;
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t **v23;
  std::__shared_weak_count *v24;

  v6 = a3;
  -[VNImageAnalyzerMultiDetector _junkCustomClassifiersAndReturnError:](&v23, (uint64_t)self, a4);
  v7 = v23;
  if (v23)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = *v7;
    v10 = v7[1];
    while (v9 != v10)
    {
      v11 = *v9;
      v12 = (std::__shared_weak_count *)v9[1];
      v22 = *v9;
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v11 + 312), *(__int128 **)(v11 + 320));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v15, v22, v12);

      if (v12)
      {
        v16 = (unint64_t *)&v12->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      v9 += 2;
    }
  }
  else
  {
    v8 = 0;
  }
  v18 = v24;
  if (v24)
  {
    v19 = (unint64_t *)&v24->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return v8;
}

- (id)allRecognizedObjectsIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 **LabelsList;
  std::vector<std::string>::pointer begin;
  std::string *end;
  std::vector<std::string>::pointer v14;
  std::string::size_type size;
  int v16;
  std::vector<std::string>::pointer v17;
  int data;
  int v19;
  void *v21;
  std::vector<std::string>::pointer v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  std::string *v28;
  __int128 v29;
  std::vector<std::string>::pointer v30;
  std::string::size_type v31;
  int v32;
  _DWORD *v33;
  std::vector<std::string>::pointer v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  std::string *v40;
  __int128 v41;
  std::string *v42;
  VNDisallowedList *v43;
  id v44;
  std::vector<std::string>::pointer v45;
  std::vector<std::string>::pointer i;
  id v47;
  std::vector<std::string>::pointer v48;
  NSString *v49;
  void *__p[2];
  std::string::size_type v52;
  std::vector<std::string> v53;
  std::__split_buffer<std::string> __v;

  v6 = a3;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "observationsRecipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "originatingRequestSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LabelsList = (__int128 **)vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, objc_msgSend(v8, "labelsListType"));
    memset(&v53, 0, sizeof(v53));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v53, *LabelsList, LabelsList[1], 0xAAAAAAAAAAAAAAABLL * (((char *)LabelsList[1] - (char *)*LabelsList) >> 3));
    if (objc_msgSend(v10, "specifiesRequestClass:withAnyRevision:", objc_opt_class(), 1, 3737841667, 0))
    {
      begin = v53.__begin_;
      end = v53.__end_;
      if (v53.__begin_ == v53.__end_)
      {
        v14 = v53.__begin_;
      }
      else
      {
        v14 = v53.__begin_;
        while (1)
        {
          size = HIBYTE(v14->__r_.__value_.__r.__words[2]);
          v16 = (char)size;
          if ((size & 0x80u) != 0)
            size = v14->__r_.__value_.__l.__size_;
          if (size == 5)
          {
            v17 = v16 >= 0 ? v14 : (std::vector<std::string>::pointer)v14->__r_.__value_.__r.__words[0];
            data = (int)v17->__r_.__value_.__l.__data_;
            v19 = v17->__r_.__value_.__s.__data_[4];
            if (data == 1769304678 && v19 == 116)
              break;
          }
          if (++v14 == v53.__end_)
          {
            v14 = v53.__end_;
            break;
          }
        }
      }
      if (v14 != v53.__end_)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "vegetables");
        v22 = v53.__end_;
        if (v53.__end_ >= v53.__end_cap_.__value_)
        {
          v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3);
          v25 = v24 + 1;
          if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) > v25)
            v25 = 0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) >= 0x555555555555555)
            v26 = 0xAAAAAAAAAAAAAAALL;
          else
            v26 = v25;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v53.__end_cap_;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v26);
          else
            v27 = 0;
          v28 = (std::string *)(v26 + 24 * v24);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v26;
          __v.__begin_ = v28;
          __v.__end_cap_.__value_ = (std::string *)(v26 + 24 * v27);
          v29 = *(_OWORD *)__p;
          v28->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
          __p[1] = 0;
          v52 = 0;
          __p[0] = 0;
          __v.__end_ = v28 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v53, &__v);
          end = v53.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v53.__end_ = end;
          if (SHIBYTE(v52) < 0)
          {
            operator delete(__p[0]);
            end = v53.__end_;
          }
        }
        else
        {
          v23 = *(_OWORD *)__p;
          v53.__end_->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
          end = v22 + 1;
          v53.__end_ = v22 + 1;
        }
        begin = v53.__begin_;
      }
      v30 = begin;
      if (begin != end)
      {
        v30 = begin;
        while (1)
        {
          v31 = HIBYTE(v30->__r_.__value_.__r.__words[2]);
          v32 = (char)v31;
          if ((v31 & 0x80u) != 0)
            v31 = v30->__r_.__value_.__l.__size_;
          if (v31 == 4)
          {
            v33 = v32 >= 0 ? v30 : (_DWORD *)v30->__r_.__value_.__r.__words[0];
            if (*v33 == 1752394086)
              break;
          }
          if (++v30 == end)
          {
            v30 = end;
            break;
          }
        }
      }
      if (v30 != end)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "seafood");
        v34 = v53.__end_;
        if (v53.__end_ >= v53.__end_cap_.__value_)
        {
          v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3);
          v37 = v36 + 1;
          if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) > v37)
            v37 = 0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) >= 0x555555555555555)
            v38 = 0xAAAAAAAAAAAAAAALL;
          else
            v38 = v37;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v53.__end_cap_;
          if (v38)
            v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v38);
          else
            v39 = 0;
          v40 = (std::string *)(v38 + 24 * v36);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v38;
          __v.__begin_ = v40;
          __v.__end_cap_.__value_ = (std::string *)(v38 + 24 * v39);
          v41 = *(_OWORD *)__p;
          v40->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v40->__r_.__value_.__l.__data_ = v41;
          __p[1] = 0;
          v52 = 0;
          __p[0] = 0;
          __v.__end_ = v40 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v53, &__v);
          v42 = v53.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v53.__end_ = v42;
          if (SHIBYTE(v52) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v35 = *(_OWORD *)__p;
          v53.__end_->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
          v53.__end_ = v34 + 1;
        }
      }
    }
    objc_msgSend(v8, "disallowedList");
    v43 = (VNDisallowedList *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v21 = (void *)objc_msgSend(v44, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3));
    v45 = v53.__begin_;
    for (i = v53.__end_; v45 != i; ++v45)
    {
      v47 = objc_alloc(MEMORY[0x1E0CB3940]);
      v48 = v45;
      if (SHIBYTE(v45->__r_.__value_.__r.__words[2]) < 0)
        v48 = (std::vector<std::string>::pointer)v45->__r_.__value_.__r.__words[0];
      v49 = (NSString *)objc_msgSend(v47, "initWithUTF8String:", v48);
      if (_isAcceptableClassificationIdentifier(v49, v43))
        objc_msgSend(v21, "addObject:", v49);

    }
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[VNImageAnalyzerMultiDetector _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:](&v9, (uint64_t)self, a4);
  if (v9)
  {
    _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v9 + 312), *(__int128 **)(v9 + 320));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (id)allSignificantEventIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[VNImageAnalyzerMultiDetector _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:](&v9, (uint64_t)self, a4);
  if (v9)
  {
    _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v9 + 312), *(__int128 **)(v9 + 320));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (id)allCityNatureIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[VNImageAnalyzerMultiDetector _cityNatureCustomClassifierAndReturnError:](&v9, (uint64_t)self, a4);
  if (v9)
  {
    _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v9 + 312), *(__int128 **)(v9 + 320));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  ImageAnalyzer_PCA *value;
  unint64_t *begin;

  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_cachedAllSceneClassificationsFromLastAnalysis);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_cityNatureCustomClassifier_DO_NOT_ACCESS_DIRECTLY);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_significantEventCustomClassifier_DO_NOT_ACCESS_DIRECTLY);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifier);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_potentialLandmarkCustomClassifier_DO_NOT_ACCESS_DIRECTLY);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifier);
  value = self->_imageAnalyzerPCA256_DO_NOT_ACCESS_DIRECTLY.__ptr_.__value_;
  self->_imageAnalyzerPCA256_DO_NOT_ACCESS_DIRECTLY.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<vision::mod::ImageAnalyzer_PCA>::operator()[abi:ne180100]((uint64_t)value);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_junkCustomClassifiers_DO_NOT_ACCESS_DIRECTLY);
  objc_storeStrong((id *)&self->_operationPointsCache, 0);
  begin = self->_entityNetIndexesToReport.__begin_;
  if (begin)
  {
    self->_entityNetIndexesToReport.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_imageAnalyzer);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_defaultSceneClassificationHierarchicalModel);
  objc_storeStrong((id *)&self->_inferenceDescriptor, 0);
  objc_storeStrong((id *)&self->_inputImageTilingOptions, 0);
}

- (void)_cityNatureCustomClassifierAndReturnError:(_QWORD *)a3
{
  uint64_t v5;
  void *v7;
  std::string *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *v15;
  std::__shared_weak_count *v16;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 248);
  if (v5)
    goto LABEL_13;
  objc_msgSend(*(id *)(a2 + 80), "cityNatureCustomClassifierDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:](&v15, a2, v7, a3);

  v8 = v15;
  if (v15)
  {
    v9 = v16;
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100]((_QWORD *)(a2 + 248), (uint64_t)v15, (uint64_t)v16);
    if (!v9)
      goto LABEL_11;
LABEL_7:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_11;
  }
  *a1 = 0;
  a1[1] = 0;
  v9 = v16;
  if (v16)
    goto LABEL_7;
LABEL_11:
  if (!v8)
    return;
  v5 = *(_QWORD *)(a2 + 248);
LABEL_13:
  v12 = *(_QWORD *)(a2 + 256);
  *a1 = v5;
  a1[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
}

- (void)_loadCustomClassifierWithDescriptor:(void *)a3 error:(_QWORD *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  std::string::size_type size;
  std::string *v21;
  std::string::size_type v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  std::string::size_type v26;
  std::string *v27;
  std::string::value_type v28;
  char v29;
  std::string *v30;
  std::string *v31;
  uint64_t v32;
  std::string *v33;
  std::string *v34;
  std::string *v35;
  __int128 v36;
  std::string::size_type v37;
  uint64_t v38;
  uint64_t v39;
  std::string::size_type v40;
  std::string::size_type v41;
  std::ios_base *v42;
  std::locale::id *v43;
  uint64_t v44;
  const std::locale::facet *v45;
  unsigned __int8 v46;
  std::string *v47;
  std::string::size_type v48;
  std::string *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  char *v55;
  std::string *v56;
  std::string::size_type v57;
  std::string::size_type v58;
  __int128 v59;
  std::vector<std::string>::pointer v60;
  std::string::size_type v61;
  std::string::pointer data;
  std::string::size_type v63;
  char v64;
  std::string::size_type v65;
  std::string::size_type v66;
  uint64_t context;
  uint64_t plan;
  uint64_t *v69;
  uint64_t v70;
  std::string *v71;
  int blob_dimensions;
  int v73;
  std::string::size_type v74;
  int v75;
  int v76;
  uint64_t *v77;
  uint64_t v78;
  std::string *v79;
  void *v80;
  std::string *v81;
  id v82;
  void *v83;
  void *v84;
  std::string **v85;
  id v86;
  id v87;
  _QWORD *v88;
  id v89;
  id v90;
  id v91;
  std::string v92;
  std::string v93;
  std::string v94;
  std::string v95;
  std::string v96;
  std::string v97;
  std::string v98;
  void *__p[3];
  std::string v100;
  std::string v101;
  std::string v102;
  std::string v103;
  std::string v104;
  std::string __s;
  std::string v106;
  __int128 v107;
  std::string v108;
  std::string v109;
  std::string v110;
  _OWORD v111[2];
  std::string v112;
  _BYTE v113[392];
  _QWORD v114[23];

  v114[20] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v91 = v7;
    objc_msgSend(v7, "modelFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "VisionCoreFileSystemPathAndReturnError:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      *a1 = 0;
      a1[1] = 0;
LABEL_215:

      v7 = v91;
      goto LABEL_216;
    }
    objc_msgSend(v91, "labelsFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = a4;
    objc_msgSend(v10, "VisionCoreFileSystemPathAndReturnError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      *a1 = 0;
      a1[1] = 0;
LABEL_214:

      goto LABEL_215;
    }
    v83 = v11;
    objc_msgSend(v91, "inputBlobName");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "outputBlobName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_DWORD *)(a2 + 64);
    v14 = *(_DWORD *)(a2 + 68);
    v15 = v9;
    v16 = v11;
    v17 = v80;
    v18 = v12;
    objc_msgSend(v15, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_retainAutorelease(v15);
    v84 = v9;
    std::string::basic_string[abi:ne180100]<0>(&v98, (char *)objc_msgSend(v82, "UTF8String"));
    v90 = objc_retainAutorelease(v17);
    std::string::basic_string[abi:ne180100]<0>(&v97, (char *)objc_msgSend(v90, "UTF8String"));
    v89 = objc_retainAutorelease(v18);
    std::string::basic_string[abi:ne180100]<0>(&v96, (char *)objc_msgSend(v89, "UTF8String"));
    v87 = objc_retainAutorelease(v16);
    std::string::basic_string[abi:ne180100]<0>(&v95, (char *)objc_msgSend(v87, "UTF8String"));
    v86 = objc_retainAutorelease(v19);
    std::string::basic_string[abi:ne180100]<0>(&v94, (char *)objc_msgSend(v86, "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v93, "");
    v85 = a1;
    std::string::basic_string[abi:ne180100]<0>(&v92, "");
    memset(__p, 0, sizeof(__p));
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v100, v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
    else
      v100 = v98;
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v101, v97.__r_.__value_.__l.__data_, v97.__r_.__value_.__l.__size_);
    else
      v101 = v97;
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v102, v96.__r_.__value_.__l.__data_, v96.__r_.__value_.__l.__size_);
    else
      v102 = v96;
    if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v103, v95.__r_.__value_.__l.__data_, v95.__r_.__value_.__l.__size_);
    else
      v103 = v95;
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v104, v93.__r_.__value_.__l.__data_, v93.__r_.__value_.__l.__size_);
    else
      v104 = v93;
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__s, v94.__r_.__value_.__l.__data_, v94.__r_.__value_.__l.__size_);
    else
      __s = v94;
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v106, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
    else
      v106 = v92;
    *(_QWORD *)((char *)&v107 + 4) = 0x1001000000000;
    LODWORD(v107) = v13;
    HIDWORD(v107) = v14;
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v109, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
    else
      v109 = v100;
    if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v108, v104.__r_.__value_.__l.__data_, v104.__r_.__value_.__l.__size_);
    else
      v108 = v104;
    size = HIBYTE(v108.__r_.__value_.__r.__words[2]);
    if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v108.__r_.__value_.__l.__size_;
    if (size)
    {
      std::string::basic_string[abi:ne180100]<0>(&v110, ":");
      if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = &v109;
      else
        v21 = (std::string *)v109.__r_.__value_.__r.__words[0];
      if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
      else
        v22 = v109.__r_.__value_.__l.__size_;
      v23 = std::string::insert(&v110, 0, (const std::string::value_type *)v21, v22);
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v112.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v112.__r_.__value_.__l.__data_ = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v25 = &v108;
      else
        v25 = (std::string *)v108.__r_.__value_.__r.__words[0];
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v26 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      else
        v26 = v108.__r_.__value_.__l.__size_;
      v27 = std::string::append(&v112, (const std::string::value_type *)v25, v26);
      v28 = v27->__r_.__value_.__s.__data_[0];
      v111[0] = *(_OWORD *)((char *)&v27->__r_.__value_.__l.__data_ + 1);
      *(_QWORD *)((char *)v111 + 14) = *(std::string::size_type *)((char *)&v27->__r_.__value_.__r.__words[1] + 7);
      v29 = HIBYTE(v27->__r_.__value_.__r.__words[2]);
      v27->__r_.__value_.__l.__size_ = 0;
      v27->__r_.__value_.__r.__words[2] = 0;
      v27->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v112.__r_.__value_.__l.__data_);
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v110.__r_.__value_.__l.__data_);
    }
    else
    {
      v28 = v109.__r_.__value_.__s.__data_[0];
      v111[0] = *(_OWORD *)((char *)&v109.__r_.__value_.__l.__data_ + 1);
      *(_QWORD *)((char *)v111 + 14) = *(std::string::size_type *)((char *)&v109.__r_.__value_.__r.__words[1] + 7);
      v29 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
      memset(&v109, 0, sizeof(v109));
    }
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    LOBYTE(__p[0]) = v28;
    *(_OWORD *)((char *)__p + 1) = v111[0];
    *(void **)((char *)&__p[1] + 7) = *(void **)((char *)v111 + 14);
    HIBYTE(__p[2]) = v29;
    if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v108.__r_.__value_.__l.__data_);
    if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v109.__r_.__value_.__l.__data_);
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v92.__r_.__value_.__l.__data_);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v93.__r_.__value_.__l.__data_);
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v94.__r_.__value_.__l.__data_);
    if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v95.__r_.__value_.__l.__data_);
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v96.__r_.__value_.__l.__data_);
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v97.__r_.__value_.__l.__data_);
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v98.__r_.__value_.__l.__data_);
    v30 = (std::string *)operator new(0x2A0uLL, MEMORY[0x1E0DE4E10]);
    if (!v30)
    {
      *(_QWORD *)&v111[0] = 0;
      v32 = 8571;
LABEL_210:
      v11 = v83;
      if (v88)
      {
        VNErrorForCVMLStatus((id)v32);
        *v88 = (id)objc_claimAutoreleasedReturnValue();
      }
      *a1 = 0;
      a1[1] = 0;
      goto LABEL_213;
    }
    v31 = v30;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v30, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_OWORD *)&v30->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v30->__r_.__value_.__r.__words[2] = (std::string::size_type)__p[2];
    }
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v31 + 1, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
    else
      v31[1] = v100;
    v33 = v31 + 2;
    v81 = v31 + 2;
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v33, v101.__r_.__value_.__l.__data_, v101.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v33->__r_.__value_.__l.__data_ = *(_OWORD *)&v101.__r_.__value_.__l.__data_;
      v31[2].__r_.__value_.__r.__words[2] = v101.__r_.__value_.__r.__words[2];
    }
    v34 = v31 + 3;
    if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v31 + 3, v102.__r_.__value_.__l.__data_, v102.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)&v102.__r_.__value_.__l.__data_;
      v31[3].__r_.__value_.__r.__words[2] = v102.__r_.__value_.__r.__words[2];
    }
    if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v31 + 4, v103.__r_.__value_.__l.__data_, v103.__r_.__value_.__l.__size_);
    else
      v31[4] = v103;
    if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v31 + 5, v104.__r_.__value_.__l.__data_, v104.__r_.__value_.__l.__size_);
    else
      v31[5] = v104;
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v31 + 6, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      v31[6] = __s;
    v35 = v31 + 7;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v35, v106.__r_.__value_.__l.__data_, v106.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v35->__r_.__value_.__l.__data_ = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v31[7].__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
    }
    v36 = v107;
    v31[8].__r_.__value_.__r.__words[2] = 0;
    *(_OWORD *)&v31[8].__r_.__value_.__l.__data_ = v36;
    v31[9].__r_.__value_.__l.__size_ = 0;
    *(_OWORD *)&v31[10].__r_.__value_.__r.__words[1] = 0u;
    LODWORD(v31[9].__r_.__value_.__l.__data_) = 0;
    v31[9].__r_.__value_.__r.__words[2] = 0;
    v31[10].__r_.__value_.__s.__data_[0] = 0;
    *(_OWORD *)&v31[11].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[11].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[12].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[13].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[13].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[14].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[15].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[15].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[16].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[17].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[17].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[18].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[19].__r_.__value_.__l.__data_ = 0u;
    v31[27].__r_.__value_.__r.__words[2] = 0;
    *(_OWORD *)&v31[19].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[20].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[21].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[21].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[22].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[23].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[23].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[24].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[25].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[25].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[26].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[27].__r_.__value_.__l.__data_ = 0u;
    if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v109, v103.__r_.__value_.__l.__data_, v103.__r_.__value_.__l.__size_);
    else
      v109 = v103;
    v37 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
    if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v37 = v109.__r_.__value_.__l.__size_;
    if (!v37)
      goto LABEL_153;
    memset(&v110, 0, sizeof(v110));
    v38 = MEMORY[0x1E0DE4FA8];
    v39 = MEMORY[0x1E0DE4FA8] + 64;
    v40 = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 8);
    v41 = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 16);
    v114[0] = MEMORY[0x1E0DE4FA8] + 64;
    v112.__r_.__value_.__r.__words[0] = v40;
    *(std::string::size_type *)((char *)v112.__r_.__value_.__r.__words + *(_QWORD *)(v40 - 24)) = v41;
    v112.__r_.__value_.__l.__size_ = 0;
    v42 = (std::ios_base *)((char *)&v112 + *(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24));
    std::ios_base::init(v42, &v112.__r_.__value_.__r.__words[2]);
    v42[1].__vftable = 0;
    v42[1].__fmtflags_ = -1;
    v112.__r_.__value_.__r.__words[0] = v38 + 24;
    v114[0] = v39;
    MEMORY[0x1A1B0A688](&v112.__r_.__value_.__r.__words[2]);
    if (!std::filebuf::open())
      std::ios_base::clear((std::ios_base *)((char *)&v112 + *(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v113[*(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24)] | 4);
    v43 = (std::locale::id *)MEMORY[0x1E0DE4A90];
    v44 = MEMORY[0x1E0C80978];
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v112 + *(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24)));
      v45 = std::locale::use_facet((const std::locale *)&v108, v43);
      v46 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v45->__vftable[2].~facet_0)(v45, 10);
      std::locale::~locale((std::locale *)&v108);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v112, (uint64_t)&v110, v46);
      if ((v113[*(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24)] & 5) != 0)
        break;
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v47 = &v110;
      else
        v47 = (std::string *)v110.__r_.__value_.__r.__words[0];
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
      else
        v48 = v110.__r_.__value_.__l.__size_;
      if (!v48)
        goto LABEL_136;
      v49 = (std::string *)((char *)v47 + v48);
      do
      {
        v50 = v47->__r_.__value_.__s.__data_[0];
        if (v47->__r_.__value_.__s.__data_[0] < 0
           ? __maskrune(v50, 0x4000uLL)
           : *(_DWORD *)(v44 + 4 * v50 + 60) & 0x4000)
        {
          break;
        }
        v47 = (std::string *)((char *)v47 + 1);
        --v48;
      }
      while (v48);
      if (v47 == v49 || (std::string *)((char *)&v47->__r_.__value_.__l.__data_ + 1) == v49)
      {
LABEL_136:
        v49 = v47;
      }
      else
      {
        v52 = 1;
        v49 = v47;
        do
        {
          v53 = v47->__r_.__value_.__s.__data_[v52];
          if (v47->__r_.__value_.__s.__data_[v52] < 0)
            v54 = __maskrune(v53, 0x4000uLL);
          else
            v54 = *(_DWORD *)(v44 + 4 * v53 + 60) & 0x4000;
          if (!v54)
          {
            v49->__r_.__value_.__s.__data_[0] = v47->__r_.__value_.__s.__data_[v52];
            v49 = (std::string *)((char *)v49 + 1);
          }
          ++v52;
        }
        while (v48 != v52);
      }
      v55 = (char *)&v110 + HIBYTE(v110.__r_.__value_.__r.__words[2]);
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v56 = &v110;
      }
      else
      {
        v55 = (char *)(v110.__r_.__value_.__r.__words[0] + v110.__r_.__value_.__l.__size_);
        v56 = (std::string *)v110.__r_.__value_.__r.__words[0];
      }
      std::string::erase(&v110, (char *)v49 - (char *)v56, v55 - (char *)v49);
      v57 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v57 = v110.__r_.__value_.__l.__size_;
      if (v57)
      {
        v58 = v31[13].__r_.__value_.__l.__size_;
        if (v58 >= v31[13].__r_.__value_.__r.__words[2])
        {
          v60 = std::vector<std::string>::__push_back_slow_path<std::string const&>((std::vector<std::string> *)&v31[13], (__int128 *)&v110);
        }
        else
        {
          if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v31[13].__r_.__value_.__l.__size_, v110.__r_.__value_.__l.__data_, v110.__r_.__value_.__l.__size_);
          }
          else
          {
            v59 = *(_OWORD *)&v110.__r_.__value_.__l.__data_;
            *(_QWORD *)(v58 + 16) = *((_QWORD *)&v110.__r_.__value_.__l + 2);
            *(_OWORD *)v58 = v59;
          }
          v60 = (std::vector<std::string>::pointer)(v58 + 24);
          v31[13].__r_.__value_.__l.__size_ = v58 + 24;
        }
        v31[13].__r_.__value_.__l.__size_ = (std::string::size_type)v60;
      }
    }
    data = v31[13].__r_.__value_.__l.__data_;
    v61 = v31[13].__r_.__value_.__l.__size_;
    v112.__r_.__value_.__r.__words[0] = *MEMORY[0x1E0DE4F40];
    *(std::string::size_type *)((char *)v112.__r_.__value_.__r.__words
                              + *(_QWORD *)(v112.__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40]
                                                                                                 + 24);
    MEMORY[0x1A1B0A694](&v112.__r_.__value_.__r.__words[2]);
    std::istream::~istream();
    MEMORY[0x1A1B0A808](v114);
    if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v110.__r_.__value_.__l.__data_);
    v34 = v31 + 3;
    if ((std::string::pointer)v61 == data)
      v32 = 8565;
    else
LABEL_153:
      v32 = 8576;
    v9 = v84;
    a1 = v85;
    if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v109.__r_.__value_.__l.__data_);
    if ((v32 & 0xF5) != 0x80)
      goto LABEL_209;
    if (SHIBYTE(v31->__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v112, v31->__r_.__value_.__l.__data_, v31->__r_.__value_.__l.__size_);
    else
      v112 = *v31;
    v63 = HIBYTE(v112.__r_.__value_.__r.__words[2]);
    v64 = HIBYTE(v112.__r_.__value_.__r.__words[2]);
    if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v63 = v112.__r_.__value_.__l.__size_;
    if (!v63)
    {
      v32 = 8568;
      a1 = v85;
      goto LABEL_192;
    }
    if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v110, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v110.__r_.__value_.__l.__data_ = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
      v110.__r_.__value_.__r.__words[2] = v31[2].__r_.__value_.__r.__words[2];
    }
    a1 = v85;
    if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v109, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
    else
      v109 = *v34;
    v65 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
    if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v65 = v110.__r_.__value_.__l.__size_;
    if (!v65)
      goto LABEL_181;
    v66 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
    if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v66 = v109.__r_.__value_.__l.__size_;
    if (v66)
    {
      context = espresso_create_context();
      v31[9].__r_.__value_.__l.__size_ = context;
      if (context)
      {
        plan = espresso_create_plan();
        v31[9].__r_.__value_.__r.__words[2] = plan;
        if (plan)
        {
          if (!espresso_plan_add_network()
            && !espresso_network_declare_input()
            && !espresso_network_declare_output()
            && !espresso_plan_build())
          {
            v69 = &CVML_status_ok;
            goto LABEL_187;
          }
          espresso_plan_get_error_info();
        }
      }
      v69 = &CVML_status_EspressoError;
    }
    else
    {
LABEL_181:
      v69 = &CVML_status_missingOption;
    }
LABEL_187:
    v70 = *v69;
    if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v109.__r_.__value_.__l.__data_);
    if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v110.__r_.__value_.__l.__data_);
    v64 = HIBYTE(v112.__r_.__value_.__r.__words[2]);
    v32 = (v70 + 128) | 0x2100;
LABEL_192:
    v71 = v31 + 2;
    if (v64 < 0)
    {
      operator delete(v112.__r_.__value_.__l.__data_);
      v71 = v31 + 2;
    }
    if (v32 == 128)
    {
      if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v112, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
      else
        v112 = *v71;
      blob_dimensions = espresso_network_query_blob_dimensions();
      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v112.__r_.__value_.__l.__data_);
      if (blob_dimensions)
        goto LABEL_207;
      if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v112, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
      else
        v112 = *v34;
      v73 = espresso_network_query_blob_dimensions();
      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v112.__r_.__value_.__l.__data_);
      if (v73)
      {
LABEL_207:
        espresso_plan_get_error_info();
        v32 = 8539;
      }
      else
      {
        v74 = v31[11].__r_.__value_.__r.__words[2];
        if (v74 <= v31[12].__r_.__value_.__l.__size_)
          v74 = v31[12].__r_.__value_.__l.__size_;
        if (0xAAAAAAAAAAAAAAABLL
           * ((uint64_t)(v31[13].__r_.__value_.__l.__size_ - v31[13].__r_.__value_.__r.__words[0]) >> 3) == v74)
        {
          if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(&v112, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)&v112.__r_.__value_.__l.__data_ = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
            v112.__r_.__value_.__r.__words[2] = v31[2].__r_.__value_.__r.__words[2];
          }
          v75 = espresso_network_bind_buffer();
          if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v112.__r_.__value_.__l.__data_);
          if (v75)
            goto LABEL_233;
          if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v112, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
          else
            v112 = *v34;
          v76 = espresso_network_bind_buffer();
          if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v112.__r_.__value_.__l.__data_);
          if (v76)
          {
LABEL_233:
            espresso_plan_get_error_info();
            v77 = &CVML_status_EspressoError;
          }
          else
          {
            v77 = &CVML_status_ok;
          }
          v78 = *v77 + 128;
          if (v78 == 128)
            v32 = 8576;
          else
            v32 = v78 | 0x2100;
          a1 = v85;
          if (v32 == 128)
          {
            *(_QWORD *)&v111[0] = v31;
            *v85 = v31;
            v11 = v83;
            v79 = (std::string *)operator new();
            v79->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E453BF78;
            v79->__r_.__value_.__l.__size_ = 0;
            v79->__r_.__value_.__r.__words[2] = 0;
            v79[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v31;
            v85[1] = v79;
LABEL_213:
            vision::mod::ImageAnalyzer_CustomClassifierOptions::~ImageAnalyzer_CustomClassifierOptions(__p);

            goto LABEL_214;
          }
          goto LABEL_209;
        }
        v32 = 8574;
      }
      a1 = v85;
    }
LABEL_209:
    *(_QWORD *)&v111[0] = 0;
    vision::mod::ImageAnalyzer_CustomClassifier::~ImageAnalyzer_CustomClassifier((vision::mod::ImageAnalyzer_CustomClassifier *)v31);
    MEMORY[0x1A1B0A898]();
    goto LABEL_210;
  }
  if (a4)
  {
    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("custom classifier descriptor not provided"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  *a1 = 0;
  a1[1] = 0;
LABEL_216:

}

- (void)_VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:(_QWORD *)a3
{
  uint64_t v5;
  void *v7;
  std::string *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *v15;
  std::__shared_weak_count *v16;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 232);
  if (v5)
    goto LABEL_13;
  objc_msgSend(*(id *)(a2 + 80), "VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:](&v15, a2, v7, a3);

  v8 = v15;
  if (v15)
  {
    v9 = v16;
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100]((_QWORD *)(a2 + 232), (uint64_t)v15, (uint64_t)v16);
    if (!v9)
      goto LABEL_11;
LABEL_7:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_11;
  }
  *a1 = 0;
  a1[1] = 0;
  v9 = v16;
  if (v16)
    goto LABEL_7;
LABEL_11:
  if (!v8)
    return;
  v5 = *(_QWORD *)(a2 + 232);
LABEL_13:
  v12 = *(_QWORD *)(a2 + 240);
  *a1 = v5;
  a1[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
}

- (void)_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:(_QWORD *)a3
{
  uint64_t v5;
  void *v7;
  std::string *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *v15;
  std::__shared_weak_count *v16;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 216);
  if (v5)
    goto LABEL_13;
  objc_msgSend(*(id *)(a2 + 80), "VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:](&v15, a2, v7, a3);

  v8 = v15;
  if (v15)
  {
    v9 = v16;
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100]((_QWORD *)(a2 + 216), (uint64_t)v15, (uint64_t)v16);
    if (!v9)
      goto LABEL_11;
LABEL_7:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_11;
  }
  *a1 = 0;
  a1[1] = 0;
  v9 = v16;
  if (v16)
    goto LABEL_7;
LABEL_11:
  if (!v8)
    return;
  v5 = *(_QWORD *)(a2 + 216);
LABEL_13:
  v12 = *(_QWORD *)(a2 + 224);
  *a1 = v5;
  a1[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
}

- (void)_junkCustomClassifiersAndReturnError:(_QWORD *)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  void *v10;
  void *v11;
  _QWORD *v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  int v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 160);
  if (!v5)
  {
    objc_msgSend(*(id *)(a2 + 80), "junkLeafCustomClassifierDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:]((std::string **)&v25, a2, v10, a3);

    if ((_QWORD)v25)
    {
      objc_msgSend(*(id *)(a2 + 80), "junkHierarchicalCustomClassifierDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:]((std::string **)&v24, a2, v11, a3);

      if ((_QWORD)v24)
      {
        v12 = operator new(0x30uLL);
        v12[1] = 0;
        v12[2] = 0;
        *v12 = &off_1E453BB88;
        v12[4] = 0;
        v12[5] = 0;
        v12[3] = 0;
        *(_QWORD *)&v13 = v12 + 3;
        *((_QWORD *)&v13 + 1) = v12;
        v14 = *(std::__shared_weak_count **)(a2 + 168);
        *(_OWORD *)(a2 + 160) = v13;
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldaxr(p_shared_owners);
          while (__stlxr(v16 - 1, p_shared_owners));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](*(char ***)(a2 + 160), &v25);
        std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](*(char ***)(a2 + 160), &v24);
        v17 = 0;
      }
      else
      {
        *a1 = 0;
        a1[1] = 0;
        v17 = 1;
      }
      v18 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
      if (*((_QWORD *)&v24 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
    else
    {
      *a1 = 0;
      a1[1] = 0;
      v17 = 1;
    }
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (!*((_QWORD *)&v25 + 1))
      goto LABEL_26;
    v22 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      if (v17)
        return;
    }
    else
    {
LABEL_26:
      if (v17)
        return;
    }
    v5 = *(_QWORD *)(a2 + 160);
  }
  v6 = *(_QWORD *)(a2 + 168);
  *a1 = v5;
  a1[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
}

void __69__VNImageAnalyzerMultiDetector_allSceneIdentifiersWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  NSString *v3;

  v3 = a2;
  if (_isAcceptableClassificationIdentifier(v3, *(VNDisallowedList **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)_observationsForScenes:(void *)a3 entityNet:(void *)a4 junk:(void *)a5 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a6 landmark:(void *)a7 sceneprints:(void *)a8 compressedSceneprint:(double)a9 fingerprints:(double)a10 aesthetics:(double)a11 saliencyA:(double)a12 saliencyO:(double)a13 recognizeObjects:(double)a14 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a15 VNdGg5skzXHSAENO6T3enHE:(void *)a16 cityNatureGating:(void *)a17 photosAdjustments:(void *)a18 pixelBuffer:(void *)a19 withOptions:(void *)a20 originalImageSize:(void *)a21 regionOfInterest:(void *)a22 qosClass:(void *)a23 warningRecorder:(uint64_t)a24 error:(void *)a25
{
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  int v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _BYTE *v51;
  _BYTE *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  int v57;
  void *v58;
  id v59;
  __int128 **v60;
  void *v61;
  __int128 *v62;
  __int128 *v63;
  __int128 v64;
  id v65;
  std::string *v66;
  void *v67;
  double v68;
  void *v69;
  int v70;
  std::__shared_weak_count *v71;
  unint64_t *p_shared_owners;
  unint64_t v73;
  void *v74;
  VNSceneObservation *v75;
  void *v76;
  VNSceneObservation *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  id *v85;
  FILE *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  id v91;
  void *v92;
  uint64_t v93;
  char *v94;
  __int128 v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  id v99;
  void *v100;
  float **v101;
  uint64_t v102;
  float *v103;
  float *v104;
  uint64_t v105;
  _BYTE *v106;
  _BYTE *v107;
  float v108;
  VNFingerprintHash *v109;
  VNImageFingerprintsObservation *v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t i;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  float v126;
  float v127;
  uint64_t v128;
  char *v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t *j;
  uint64_t v134;
  std::string *v135;
  float v136;
  id v137;
  void *v138;
  uint64_t *v139;
  float v140;
  id v141;
  _QWORD *v142;
  void *v143;
  unint64_t *v144;
  int v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  id *v150;
  id v151;
  char *v152;
  uint64_t v153;
  std::__shared_weak_count *v154;
  unint64_t *v155;
  unint64_t v156;
  __int128 *v157;
  __int128 *v158;
  __int128 v159;
  id v160;
  _BYTE *v161;
  void *v162;
  int v163;
  VNClassificationObservation *v164;
  double v165;
  VNClassificationObservation *v166;
  unint64_t *v167;
  unint64_t v168;
  id v169;
  id v170;
  std::__shared_weak_count *size;
  unint64_t *v172;
  unint64_t v173;
  id v174;
  void *v175;
  uint64_t **v176;
  void *v177;
  void *v178;
  uint64_t *v179;
  uint64_t *v180;
  id v181;
  uint64_t *v182;
  void *v183;
  int v184;
  VNClassificationObservation *v185;
  double v186;
  VNClassificationObservation *v187;
  id v188;
  std::__shared_weak_count *v189;
  unint64_t *v190;
  unint64_t v191;
  id v192;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  uint64_t v198;
  unint64_t *v199;
  unint64_t v200;
  BOOL v201;
  int v202;
  int v203;
  BOOL v204;
  char v205;
  void *v206;
  void *v207;
  void *v208;
  VNClassificationObservation *v209;
  double v210;
  VNClassificationObservation *v211;
  std::__shared_weak_count *v212;
  unint64_t *v213;
  unint64_t v214;
  id v215;
  void *v216;
  void *v217;
  uint64_t v218;
  char *v219;
  float v220;
  float v221;
  uint64_t v222;
  char *v223;
  uint64_t *v224;
  uint64_t *v225;
  void *v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  int v230;
  unsigned __int8 *v231;
  int v232;
  unsigned __int8 *v233;
  int v234;
  unsigned __int8 *v235;
  int v236;
  unsigned __int8 *v237;
  int v238;
  unsigned __int8 *v239;
  int v240;
  unsigned __int8 *v241;
  int v242;
  unsigned __int8 *v243;
  int v244;
  unsigned __int8 *v245;
  unsigned int v246;
  unsigned __int8 *v247;
  unsigned int v248;
  unsigned __int8 *v249;
  unsigned int v250;
  unsigned __int8 *v251;
  unsigned int v252;
  unsigned __int8 *v253;
  unsigned int v254;
  unsigned __int8 *v255;
  unsigned int v256;
  unsigned __int8 *v257;
  unsigned int v258;
  unsigned __int8 *v259;
  unsigned int v260;
  unsigned __int8 *v261;
  unsigned int v262;
  unsigned __int8 *v263;
  unsigned int v264;
  unsigned __int8 *v265;
  unsigned int v266;
  unsigned __int8 *v267;
  unsigned int v268;
  unsigned __int8 *v269;
  unsigned int v270;
  unsigned __int8 *v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  id v284;
  id v285;
  id v286;
  void *v287;
  void *v289;
  FILE *v290;
  uint64_t v291;
  vDSP_Length __P;
  unint64_t v293;
  _QWORD *v294;
  void *v295;
  id v296;
  void *v297;
  VNSceneObservation *v298;
  void *v299;
  VNSceneObservation *v300;
  _QWORD *exception;
  _QWORD *v302;
  _QWORD *v303;
  _QWORD *v304;
  _QWORD *v305;
  unint64_t v306;
  int v307;
  float v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  id v312;
  unsigned int v313;
  id v314;
  unsigned int v315;
  id v322;
  id v323;
  unsigned int v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  id v330;
  void *v331;
  void *v332;
  id obj;
  unsigned int obja;
  void *v335;
  id v336;
  void *v337;
  void *v338;
  void *v339;
  id v340;
  unsigned int v341;
  id v342;
  uint64_t v343;
  id v344;
  void *v345;
  void *v346;
  unsigned int v347;
  id v348;
  id v349;
  id v350;
  id v351;
  char *v352;
  unsigned int v353;
  id v354;
  id v355;
  id v356;
  id v357;
  id v358;
  void *v359;
  void *v360;
  uint64_t v361;
  void *v362;
  void *v363;
  unsigned int v364;
  void *v366[2];
  char v367;
  void *v368[2];
  char v369;
  void *v370[2];
  char v371;
  void *v372[2];
  char v373;
  void *v374[2];
  char v375;
  void *v376[2];
  char v377;
  void *v378[2];
  char v379;
  void *v380[2];
  char v381;
  void *v382[2];
  char v383;
  void *v384[2];
  char v385;
  void *v386[2];
  char v387;
  void *v388[2];
  char v389;
  void *v390[2];
  char v391;
  void *v392[2];
  char v393;
  void *__p;
  _BYTE *v395;
  char v396;
  void *v397[2];
  char v398;
  id v399[2];
  char v400;
  id v401;
  std::__shared_weak_count *v402;
  uint64_t v403;
  std::string v404;
  int v405;
  char v406;
  _BYTE v407[32];
  __int128 v408;
  __int128 v409;
  void *v410[2];
  char v411;
  int8x16_t v412;
  uint64_t v413;
  void *v414;
  void *v415;
  uint64_t v416;

  v416 = *MEMORY[0x1E0C80C00];
  v357 = a2;
  v356 = a3;
  v355 = a4;
  v354 = a5;
  v342 = a6;
  v358 = a7;
  v34 = a8;
  v35 = a15;
  v36 = a16;
  v37 = a17;
  v38 = a18;
  v39 = a19;
  v40 = a20;
  v41 = a21;
  v42 = a22;
  v43 = a23;
  v336 = a25;
  v330 = a27;
  v331 = v38;
  v337 = v35;
  v338 = v34;
  v335 = v36;
  v332 = v37;
  v328 = v40;
  v329 = v39;
  v326 = v42;
  v327 = v41;
  v325 = v43;
  if (!a1)
    goto LABEL_63;
  v44 = -[VNImageAnalyzerMultiDetector _analysisTypeForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:](v357, v356, v355, v354, v342, v358, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
  if (!v44)
  {
    v91 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_392;
  }
  if (!-[VNImageAnalyzerMultiDetector _performAnalysis:pixelBuffer:error:](a1, v44, a24, (uint64_t)a28))
  {
LABEL_63:
    v91 = 0;
    goto LABEL_392;
  }
  v322 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_msgSend(v358, "count");
  if (v34 || v45)
  {
    v46 = v358;
    v314 = v34;
    v312 = v336;
    v323 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v412, *(_QWORD *)(a1 + 112));
    vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&__p, (unint64_t *)&v412);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    memset(v407, 0, sizeof(v407));
    v408 = 0u;
    v409 = 0u;
    obj = v46;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v407, &v412, 16);
    if (!v47)
      goto LABEL_39;
    v348 = **(id **)&v407[16];
    while (1)
    {
      v48 = 0;
      v343 = v47;
      do
      {
        if (**(id **)&v407[16] != v348)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*(_QWORD *)&v407[8] + 8 * v48);
        objc_msgSend(v49, "observationsRecipient");
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v359, "originatingRequestSpecifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "requestClassCode");
        objc_msgSend(v50, "requestRevision");
        kdebug_trace();
        v51 = v395;
        v52 = __p;
        v53 = objc_alloc(MEMORY[0x1E0C99D50]);
        v54 = (void *)objc_msgSend(v53, "initWithBytes:length:", __p, v51 - v52);
        v55 = v359;
        if (!v54)
        {
          v70 = 1;
          goto LABEL_36;
        }
        v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v54, "length"))
        {
          v339 = v56;
          v57 = objc_msgSend(v49, "includeLabelsAndConfidences");
          v58 = (void *)MEMORY[0x1E0C9AA70];
          if (v57)
          {
            -[VNImageAnalyzerMultiDetector _lastAnalysisSceneClassifications](&v401, (os_unfair_lock_s *)a1);
            v59 = objc_alloc(MEMORY[0x1E0C99E08]);
            v60 = (__int128 **)v401;
            v61 = (void *)objc_msgSend(v59, "initWithCapacity:", (uint64_t)(*((_QWORD *)v401 + 1) - *(_QWORD *)v401) >> 5);
            v63 = *v60;
            v62 = v60[1];
            while (v63 != v62)
            {
              if (*((char *)v63 + 23) < 0)
              {
                std::string::__init_copy_ctor_external(&v404, *(const std::string::value_type **)v63, *((_QWORD *)v63 + 1));
              }
              else
              {
                v64 = *v63;
                v404.__r_.__value_.__r.__words[2] = *((_QWORD *)v63 + 2);
                *(_OWORD *)&v404.__r_.__value_.__l.__data_ = v64;
              }
              v405 = *((_DWORD *)v63 + 6);
              v406 = *((_BYTE *)v63 + 28);
              v65 = objc_alloc(MEMORY[0x1E0CB3940]);
              if ((v404.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v66 = &v404;
              else
                v66 = (std::string *)v404.__r_.__value_.__r.__words[0];
              v67 = (void *)objc_msgSend(v65, "initWithUTF8String:", v66);
              LODWORD(v68) = v405;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v69, v67);

              if (SHIBYTE(v404.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v404.__r_.__value_.__l.__data_);
              v63 += 2;
            }
            v58 = (void *)objc_msgSend(v61, "copy");

            v71 = v402;
            if (v402)
            {
              p_shared_owners = (unint64_t *)&v402->__shared_owners_;
              do
                v73 = __ldaxr(p_shared_owners);
              while (__stlxr(v73 - 1, p_shared_owners));
              if (!v73)
              {
                ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
                std::__shared_weak_count::__release_weak(v71);
              }
            }
          }
          objc_msgSend(*(id *)(a1 + 80), "VNSceneprintFromData:labelsAndConfidences:originatingRequestSpecifier:error:", v54, v58, v50, a28);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v74)
          {

            v70 = 1;
            v56 = v339;
            goto LABEL_35;
          }
          v75 = [VNSceneObservation alloc];
          v410[0] = v74;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v410, 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[VNSceneObservation initWithOriginatingRequestSpecifier:sceneprints:](v75, "initWithOriginatingRequestSpecifier:sceneprints:", v50, v76);

          objc_msgSend(v339, "addObject:", v77);
          v55 = v359;
          v56 = v339;
        }
        kdebug_trace();
        objc_msgSend(v55, "receiveObservations:", v56);
        objc_msgSend(v323, "addObjectsFromArray:", v56);
        v70 = 0;
LABEL_35:

LABEL_36:
        if (v70)
        {

          goto LABEL_65;
        }
        ++v48;
      }
      while (v48 != v343);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v407, &v412, 16);
      if (!v47)
      {
LABEL_39:

        if (!v314)
        {
          v91 = v323;
          goto LABEL_66;
        }
        objc_msgSend(v314, "observationsRecipient");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "originatingRequestSpecifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "requestClassCode");
        v80 = objc_msgSend(v79, "requestRevision");
        kdebug_trace();
        if (v80 != 3737841666)
        {
          if (a28)
          {
            +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", v80, objc_opt_class());
            *a28 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_425;
        }
        v81 = *(_QWORD *)(a1 + 176);
        if (v81)
          goto LABEL_417;
        objc_msgSend(*(id *)(a1 + 80), "pca256FileURL");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "VisionCoreFileSystemPathAndReturnError:", 0);
        v83 = (id)objc_claimAutoreleasedReturnValue();
        v84 = v83;
        if (!v83)
        {
          if (a28)
          {
            v289 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to locate %@"), CFSTR("pca256"));
            +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v289);
            *a28 = (id)objc_claimAutoreleasedReturnValue();

          }
          v86 = 0;
          goto LABEL_414;
        }
        std::string::basic_string[abi:ne180100]<0>(v399, (char *)objc_msgSend(objc_retainAutorelease(v83), "UTF8String"));
        std::string::basic_string[abi:ne180100]<0>(v397, (char *)objc_msgSend(CFSTR("pca256"), "UTF8String"));
        v402 = 0;
        v401 = 0;
        v403 = 0;
        if (v400 >= 0)
          v85 = v399;
        else
          v85 = (id *)v399[0];
        v86 = fopen((const char *)v85, "rb");
        if (!v86)
        {
          v87 = 8565;
          goto LABEL_405;
        }
        LODWORD(v392[0]) = 0;
        std::string::basic_string[abi:ne180100]<0>(&v404, "origDim");
        v87 = vision::mod::_readBinSerializerBlob(v86, &v404, (float *)v392, 1);
        if (SHIBYTE(v404.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v404.__r_.__value_.__l.__data_);
        if (v87 == 128)
        {
          v88 = (unint64_t)*(float *)v392;
          if (!(unint64_t)*(float *)v392)
            goto LABEL_403;
          std::string::basic_string[abi:ne180100]<0>(&v404, "pcaDim");
          v87 = vision::mod::_readBinSerializerBlob(v86, &v404, (float *)v392, 1);
          if (SHIBYTE(v404.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v404.__r_.__value_.__l.__data_);
          if (v87 == 128)
          {
            v89 = (unint64_t)*(float *)v392;
            if ((unint64_t)*(float *)v392 - 1 < v88)
            {
              std::vector<float>::resize((char **)&v401, v89 * v88);
              if (v398 >= 0)
                v90 = (char *)v397;
              else
                v90 = (char *)v397[0];
              std::string::basic_string[abi:ne180100]<0>(&v404, v90);
              v87 = vision::mod::_readBinSerializerBlob(v86, &v404, (float *)v401, v89 * v88);
              if (SHIBYTE(v404.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v404.__r_.__value_.__l.__data_);
              if (v87 == 128)
              {
                fclose(v86);
                v87 = 8576;
LABEL_401:
                v290 = (FILE *)operator new(0x28uLL, MEMORY[0x1E0DE4E10]);
                v86 = v290;
                if (v290)
                {
                  v290->_p = 0;
                  *(_QWORD *)&v290->_r = 0;
                  *(_QWORD *)&v290->_flags = 0;
                  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v290, v401, (uint64_t)v402, ((char *)v402 - (_BYTE *)v401) >> 2);
                  v86->_bf._base = (unsigned __int8 *)v88;
                  *(_QWORD *)&v86->_bf._size = v89;
                }
                else
                {
                  v87 = 8571;
                }
LABEL_405:
                if (v401)
                  operator delete(v401);
                if (v398 < 0)
                  operator delete(v397[0]);
                if (v400 < 0)
                  operator delete(v399[0]);
                if (!v86 && a28)
                {
                  VNErrorForCVMLStatus((id)v87);
                  *a28 = (id)objc_claimAutoreleasedReturnValue();
                }
LABEL_414:

                v291 = *(_QWORD *)(a1 + 176);
                *(_QWORD *)(a1 + 176) = v86;
                if (v291)
                  std::default_delete<vision::mod::ImageAnalyzer_PCA>::operator()[abi:ne180100](v291);

                v81 = *(_QWORD *)(a1 + 176);
                if (v81)
                {
LABEL_417:
                  __P = (v395 - (_BYTE *)__p) >> 2;
                  if (__P == *(_QWORD *)(v81 + 24))
                  {
                    v293 = *(_QWORD *)(v81 + 32);
                    v294 = (_QWORD *)operator new();
                    std::vector<float>::vector(v294, v293);
                    vDSP_mmul(*(const float **)v81, 1, (const float *)__p, 1, (float *)*v294, 1, v293, 1uLL, __P);
                    v295 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *v294, v294[1] - *v294);
                    if (v295)
                    {
                      v296 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      if (!objc_msgSend(v295, "length"))
                        goto LABEL_422;
                      +[VNEspressoModelImageprint printWithFloat16PrecisionFloat32Data:originatingRequestSpecifier:error:](VNSceneprint, "printWithFloat16PrecisionFloat32Data:originatingRequestSpecifier:error:", v295, v79, a28);
                      v297 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v297)
                      {
                        v298 = [VNSceneObservation alloc];
                        v404.__r_.__value_.__r.__words[0] = (std::string::size_type)v297;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v404, 1);
                        v299 = (void *)objc_claimAutoreleasedReturnValue();
                        v300 = -[VNSceneObservation initWithOriginatingRequestSpecifier:sceneprints:](v298, "initWithOriginatingRequestSpecifier:sceneprints:", v79, v299);

                        objc_msgSend(v296, "addObject:", v300);
LABEL_422:
                        kdebug_trace();
                        objc_msgSend(v78, "receiveObservations:", v296);
                        objc_msgSend(v323, "addObjectsFromArray:", v296);
                      }

                    }
                    std::default_delete<std::vector<float>>::operator()[abi:ne180100]((uint64_t)v294);
                  }
                  if (a28)
                  {
                    VNErrorForCVMLStatus((id)0x217C);
                    *a28 = (id)objc_claimAutoreleasedReturnValue();
                  }
                }
LABEL_425:

LABEL_65:
                v91 = 0;
LABEL_66:
                if (__p)
                {
                  v395 = __p;
                  operator delete(__p);
                }

                if (v91)
                {
                  objc_msgSend(v322, "addObjectsFromArray:", v91);

                  break;
                }
                goto LABEL_391;
              }
              std::vector<float>::resize((char **)&v401, 0);
LABEL_400:
              fclose(v86);
              if (v87 == 128)
                goto LABEL_401;
LABEL_404:
              v86 = 0;
              goto LABEL_405;
            }
LABEL_403:
            v87 = 8564;
            fclose(v86);
            goto LABEL_404;
          }
        }
        else
        {
          v88 = 0;
        }
        v89 = 0;
        goto LABEL_400;
      }
    }
  }
  if (v337)
  {
    v344 = v337;
    objc_msgSend(v344, "observationsRecipient");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v360 = v92;
    objc_msgSend(v92, "originatingRequestSpecifier");
    v349 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "requestClassCode");
    objc_msgSend(v349, "requestRevision");
    kdebug_trace();
    v402 = 0;
    v401 = 0;
    v403 = 0;
    v93 = *(_QWORD *)(a1 + 112);
    LODWORD(v404.__r_.__value_.__l.__data_) = 1024;
    if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v93 + 824, 0x400u, &v404)+ 20))
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = 8574;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    LODWORD(v404.__r_.__value_.__l.__data_) = 1024;
    v94 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v93 + 784, 0x400u, &v404);
    vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v412, (__int128 *)(v94 + 24), 1);
    vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(v407, (unint64_t *)&v412);
    v399[0] = 0;
    std::vector<long long>::vector(&v404, 1uLL, v399);
    v95 = *(_OWORD *)v407;
    v96 = (std::__shared_weak_count *)operator new(0x90uLL);
    v96->__shared_owners_ = 0;
    v97 = (unint64_t *)&v96->__shared_owners_;
    v96->__shared_weak_owners_ = 0;
    v96->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B958;
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v96[1], &v404, (void *)v95, *((_QWORD *)&v95 + 1) - v95, 1, 0);
    v96[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E453A8D0;
    LODWORD(v96[5].__shared_owners_) = 1;
    v96[5].__shared_weak_owners_ = 0;
    v96[5].__vftable = (std::__shared_weak_count_vtbl *)((*((_QWORD *)&v95 + 1) - (_QWORD)v95) >> 2);
    v399[0] = &v96[1];
    v399[1] = v96;
    if ((*(uint64_t (**)(_QWORD, std::__shared_weak_count *, id *))(**(_QWORD **)(v93 + 1056) + 168))(*(_QWORD *)(v93 + 1056), v96 + 1, &v401) != 3712)
    {
      v302 = __cxa_allocate_exception(8uLL);
      *v302 = 8574;
      __cxa_throw(v302, MEMORY[0x1E0DE4F28], 0);
    }
    do
      v98 = __ldaxr(v97);
    while (__stlxr(v98 - 1, v97));
    if (!v98)
    {
      ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
      std::__shared_weak_count::__release_weak(v96);
    }
    if (v404.__r_.__value_.__r.__words[0])
    {
      v404.__r_.__value_.__l.__size_ = v404.__r_.__value_.__r.__words[0];
      operator delete(v404.__r_.__value_.__l.__data_);
    }
    if (*(_QWORD *)v407)
    {
      *(_QWORD *)&v407[8] = *(_QWORD *)v407;
      operator delete(*(void **)v407);
    }
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    v99 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v100 = (void *)objc_msgSend(v99, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((char *)v402 - (_BYTE *)v401) >> 3));
    v101 = (float **)v401;
    v102 = (uint64_t)v402;
    if (v401 != v402)
    {
      do
      {
        v104 = *v101;
        v103 = v101[1];
        v105 = (char *)v103 - (char *)*v101;
        if (v103 == *v101)
        {
          v106 = 0;
          v107 = 0;
        }
        else
        {
          if (v105 < 0)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v106 = operator new(v105 >> 2);
          v107 = v106;
          do
          {
            v108 = *v104++;
            *v107++ = (int)v108;
          }
          while (v104 != v103);
        }
        v92 = v360;
        v109 = -[VNFingerprintHash initWithBooleanBytes:length:]([VNFingerprintHash alloc], "initWithBooleanBytes:length:", v106, v107 - v106);
        objc_msgSend(v100, "addObject:", v109);

        if (v106)
          operator delete(v106);
        v101 += 3;
      }
      while (v101 != (float **)v102);
    }
    v110 = -[VNImageFingerprintsObservation initWithOriginatingRequestSpecifier:fingerprintHashes:]([VNImageFingerprintsObservation alloc], "initWithOriginatingRequestSpecifier:fingerprintHashes:", v349, v100);
    kdebug_trace();
    v404.__r_.__value_.__r.__words[0] = (std::string::size_type)v110;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v404, 1);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "receiveObservations:", v91);

    v412.i64[0] = (uint64_t)&v401;
    std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v412);

    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v357)
  {
    v111 = v357;
    memset(v407, 0, sizeof(v407));
    v408 = 0u;
    v409 = 0u;
    v350 = v111;
    v112 = 0;
    v113 = objc_msgSend(v350, "countByEnumeratingWithState:objects:count:", v407, &v412, 16);
    if (v113)
    {
      v361 = **(_QWORD **)&v407[16];
      while (2)
      {
        for (i = 0; i != v113; ++i)
        {
          if (**(_QWORD **)&v407[16] != v361)
            objc_enumerationMutation(v350);
          v115 = *(void **)(*(_QWORD *)&v407[8] + 8 * i);
          objc_msgSend(v115, "observationsRecipient");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "originatingRequestSpecifier");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "requestClassCode");
          objc_msgSend(v117, "requestRevision");
          kdebug_trace();
          v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((-[VNImageAnalyzerMultiDetector _populateLeafSceneObservations:hierarchySceneObservations:fromLastAnalysisForSceneConfiguration:error:](a1, v118, v118, v115, a28) & 1) == 0)
          {

            v122 = 0;
            goto LABEL_106;
          }
          v119 = &__block_literal_global_88;
          objc_msgSend(v118, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

          kdebug_trace();
          objc_msgSend(v115, "observationsRecipient");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "receiveObservations:", v118);

          if (v112)
          {
            objc_msgSend(v112, "arrayByAddingObjectsFromArray:", v118);
            v121 = objc_claimAutoreleasedReturnValue();

            v112 = (id)v121;
          }
          else
          {
            v112 = v118;
          }

        }
        v113 = objc_msgSend(v350, "countByEnumeratingWithState:objects:count:", v407, &v412, 16);
        if (v113)
          continue;
        break;
      }
    }

    v112 = v112;
    v122 = v112;
LABEL_106:

    if (!v122)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v122);

  }
  if (v356)
  {
    v123 = v356;
    v351 = v123;
    objc_msgSend(v123, "observationsRecipient");
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v362, "originatingRequestSpecifier");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "requestClassCode");
    objc_msgSend(v124, "requestRevision");
    kdebug_trace();
    objc_msgSend((id)a1, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:", v124, a28);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v123, "disallowedList");
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "minimumConfidence");
      v127 = v126;
      v399[0] = (id)objc_msgSend(v123, "maximumLabels");
      v128 = *(_QWORD *)(a1 + 112);
      memset(v407, 0, sizeof(v407));
      LODWORD(v408) = 1065353216;
      v412.i32[0] = 4096;
      if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v128 + 824, 0x1000u, &v412)+ 20))
      {
        v303 = __cxa_allocate_exception(8uLL);
        *v303 = 8574;
        __cxa_throw(v303, MEMORY[0x1E0DE4F28], 0);
      }
      LODWORD(v401) = 4096;
      v129 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v128 + 784, 0x1000u, &v401);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v412, (__int128 *)(v129 + 24), 1);
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v404, (unint64_t *)&v412);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
      v412 = 0uLL;
      v413 = 0;
      v130 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((_QWORD *)(v128 + 744), 0x1000u);
      if (v130)
      {
        LODWORD(v401) = 4096;
        v131 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((_QWORD *)(v128 + 744), 0x1000u, &v401);
        vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v131 + 3), (uint64_t)&v404, (uint64_t)&v412);
      }
      v132 = *(uint64_t **)(a1 + 128);
      for (j = *(uint64_t **)(a1 + 136); v132 != j; ++v132)
      {
        v134 = *v132;
        if (v130)
          v135 = (std::string *)&v412;
        else
          v135 = &v404;
        v136 = *(float *)(v135->__r_.__value_.__r.__words[0] + 4 * v134);
        if (fabsf(v136) >= v127)
        {
          LODWORD(v397[0]) = 4096;
          v401 = (id)(std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v128 + 864, 0x1000u, v397)[3]+ 24 * v134);
          *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v407, (unsigned __int8 *)v401, (__int128 **)&v401)+ 10) = v136;
        }
      }
      if (v412.i64[0])
      {
        v412.i64[1] = v412.i64[0];
        operator delete((void *)v412.i64[0]);
      }
      if (v404.__r_.__value_.__r.__words[0])
      {
        v404.__r_.__value_.__l.__size_ = v404.__r_.__value_.__r.__words[0];
        operator delete(v404.__r_.__value_.__l.__data_);
      }
      v137 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v138 = (void *)objc_msgSend(v137, "initWithCapacity:", *(_QWORD *)&v407[24]);
      v139 = *(uint64_t **)&v407[16];
      if (*(_QWORD *)&v407[16])
      {
        while (1)
        {
          v140 = *((float *)v139 + 10);
          v141 = objc_alloc(MEMORY[0x1E0CB3940]);
          v142 = v139 + 2;
          if (*((char *)v139 + 39) < 0)
            v142 = (_QWORD *)*v142;
          v143 = (void *)objc_msgSend(v141, "initWithUTF8String:", v142);
          v144 = v399[0] == (id)0x7FFFFFFFFFFFFFFFLL ? 0 : (unint64_t *)v399;
          v145 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](a1, v143, v345, v125, v124, v138, v144, (uint64_t)a28, v140);

          if (!v145)
            break;
          v139 = (uint64_t *)*v139;
          if (!v139)
            goto LABEL_132;
        }
        v147 = 0;
      }
      else
      {
LABEL_132:
        v146 = &__block_literal_global_88;
        objc_msgSend(v138, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

        kdebug_trace();
        objc_msgSend(v362, "receiveObservations:", v138);
        v147 = v138;
      }

      std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*(void ***)&v407[16]);
      v148 = *(void **)v407;
      *(_QWORD *)v407 = 0;
      if (v148)
        operator delete(v148);

    }
    else
    {
      v147 = 0;
    }

    if (!v147)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v147);

  }
  if (v355)
  {
    v340 = v355;
    objc_msgSend(v340, "observationsRecipient");
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v346, "originatingRequestSpecifier");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "requestClassCode");
    objc_msgSend(v149, "requestRevision");
    kdebug_trace();
    -[VNImageAnalyzerMultiDetector _junkCustomClassifiersAndReturnError:](&v404, a1, a28);
    v150 = (id *)v404.__r_.__value_.__r.__words[0];
    if (v404.__r_.__value_.__r.__words[0])
    {
      vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v412, *(_QWORD *)(a1 + 112));
      v151 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v152 = (char *)*v150;
      v352 = (char *)v150[1];
      if (*v150 == v352)
      {
LABEL_170:
        v169 = &__block_literal_global_88;
        objc_msgSend(v151, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

        kdebug_trace();
        objc_msgSend(v346, "receiveObservations:", v151);
        v170 = v151;
      }
      else
      {
        while (1)
        {
          v153 = *(_QWORD *)v152;
          v154 = (std::__shared_weak_count *)*((_QWORD *)v152 + 1);
          v401 = *(id *)v152;
          v402 = v154;
          if (v154)
          {
            v155 = (unint64_t *)&v154->__shared_owners_;
            do
              v156 = __ldxr(v155);
            while (__stxr(v156 + 1, v155));
          }
          v399[0] = 0;
          vision::mod::ImageAnalyzer_CustomClassifier::performInference((void ***)v397, v153, (uint64_t)&v412, v399);
          v363 = v397[0];
          if (v397[0])
          {
            v158 = *(__int128 **)v397[0];
            v157 = (__int128 *)*((_QWORD *)v397[0] + 1);
            while (v158 != v157)
            {
              if (*((char *)v158 + 23) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)v407, *(const std::string::value_type **)v158, *((_QWORD *)v158 + 1));
              }
              else
              {
                v159 = *v158;
                *(_QWORD *)&v407[16] = *((_QWORD *)v158 + 2);
                *(_OWORD *)v407 = v159;
              }
              *(_DWORD *)&v407[24] = *((_DWORD *)v158 + 6);
              v160 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v407[23] >= 0)
                v161 = v407;
              else
                v161 = *(_BYTE **)v407;
              v162 = (void *)objc_msgSend(v160, "initWithUTF8String:", v161);
              v163 = *(_DWORD *)&v407[24];
              v164 = [VNClassificationObservation alloc];
              LODWORD(v165) = v163;
              v166 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v164, "initWithOriginatingRequestSpecifier:identifier:confidence:", v149, v162, v165);
              objc_msgSend(v151, "addObject:", v166);

              if ((v407[23] & 0x80000000) != 0)
                operator delete(*(void **)v407);
              v158 += 2;
            }
          }
          else if (a28)
          {
            VNErrorForCVMLStatus(v399[0]);
            *a28 = (id)objc_claimAutoreleasedReturnValue();
          }
          std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100]((void ***)v397);
          if (v154)
          {
            v167 = (unint64_t *)&v154->__shared_owners_;
            do
              v168 = __ldaxr(v167);
            while (__stlxr(v168 - 1, v167));
            if (!v168)
            {
              ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
              std::__shared_weak_count::__release_weak(v154);
            }
          }
          if (!v363)
            break;
          v152 += 16;
          if (v152 == v352)
            goto LABEL_170;
        }
        v170 = 0;
      }

      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    }
    else
    {
      v170 = 0;
    }
    size = (std::__shared_weak_count *)v404.__r_.__value_.__l.__size_;
    if (v404.__r_.__value_.__l.__size_)
    {
      v172 = (unint64_t *)(v404.__r_.__value_.__l.__size_ + 8);
      do
        v173 = __ldaxr(v172);
      while (__stlxr(v173 - 1, v172));
      if (!v173)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }

    if (!v170)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v170);

  }
  if (v354)
  {
    v174 = v354;
    -[VNImageAnalyzerMultiDetector _VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:](v407, a1, a28);
    v175 = *(void **)v407;
    if (*(_QWORD *)v407)
    {
      vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v412, *(_QWORD *)(a1 + 112));
      v404.__r_.__value_.__r.__words[0] = 0;
      vision::mod::ImageAnalyzer_CustomClassifier::performInference((void ***)&v401, (uint64_t)v175, (uint64_t)&v412, &v404);
      v176 = (uint64_t **)v401;
      if (v401)
      {
        objc_msgSend(v174, "observationsRecipient");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "originatingRequestSpecifier");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((char *)v176[1] - (char *)*v176) >> 5);
        v179 = *v176;
        v180 = v176[1];
        if (*v176 != v180)
        {
          do
          {
            v181 = objc_alloc(MEMORY[0x1E0CB3940]);
            v182 = v179;
            if (*((char *)v179 + 23) < 0)
              v182 = (uint64_t *)*v179;
            v183 = (void *)objc_msgSend(v181, "initWithUTF8String:", v182);
            v184 = *((_DWORD *)v179 + 6);
            v185 = [VNClassificationObservation alloc];
            LODWORD(v186) = v184;
            v187 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v185, "initWithOriginatingRequestSpecifier:identifier:confidence:", v178, v183, v186);
            objc_msgSend(v175, "addObject:", v187);

            v179 += 4;
          }
          while (v179 != v180);
        }
        v188 = &__block_literal_global_88;
        objc_msgSend(v175, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

        objc_msgSend(v177, "receiveObservations:", v175);
      }
      else if (a28)
      {
        VNErrorForCVMLStatus(v404.__r_.__value_.__l.__data_);
        v175 = 0;
        *a28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v175 = 0;
      }
      std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100]((void ***)&v401);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    }
    v189 = *(std::__shared_weak_count **)&v407[8];
    if (*(_QWORD *)&v407[8])
    {
      v190 = (unint64_t *)(*(_QWORD *)&v407[8] + 8);
      do
        v191 = __ldaxr(v190);
      while (__stlxr(v191 - 1, v190));
      if (!v191)
      {
        ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
        std::__shared_weak_count::__release_weak(v189);
      }
    }

    if (!v175)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v175);

  }
  if (v342)
  {
    v192 = v342;
    -[VNImageAnalyzerMultiDetector _potentialLandmarksCustomClassifierAndReturnError:](&v404, a1, a28);
    v193 = v404.__r_.__value_.__r.__words[0];
    if (v404.__r_.__value_.__r.__words[0])
    {
      vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v412, *(_QWORD *)(a1 + 112));
      v401 = 0;
      vision::mod::ImageAnalyzer_CustomClassifier::performInference((void ***)v399, v193, (uint64_t)&v412, &v401);
      if (v399[0])
      {
        v195 = *((_QWORD *)v399[0] + 1);
        if (*(_QWORD *)v399[0] != v195)
        {
          v196 = *(_QWORD *)v399[0] + 32;
          v197 = 0;
          while (1)
          {
            if (*(char *)(v196 - 9) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)v407, *(const std::string::value_type **)(v196 - 32), *(_QWORD *)(v196 - 24));
            }
            else
            {
              v194 = *(_OWORD *)(v196 - 32);
              *(_OWORD *)v407 = v194;
              *(_QWORD *)&v407[16] = *(_QWORD *)(v196 - 16);
            }
            v198 = v407[23];
            if (v407[23] < 0)
              v198 = *(_QWORD *)&v407[8];
            if (v198 == 8)
              break;
            v204 = 0;
            if ((v407[23] & 0x80000000) != 0)
              goto LABEL_221;
LABEL_222:
            v205 = v196 == v195 || v204;
            v196 += 32;
            if ((v205 & 1) != 0)
              goto LABEL_231;
          }
          LODWORD(v194) = *(_DWORD *)(v196 - 8);
          v199 = *(unint64_t **)v407;
          if (v407[23] >= 0)
            v199 = (unint64_t *)v407;
          v200 = bswap64(*v199);
          v201 = v200 >= 0x706F736974697665;
          v202 = v200 > 0x706F736974697665;
          v203 = !v201;
          v204 = v202 == v203;
          if (v202 == v203)
            v197 = *(_DWORD *)(v196 - 8);
          if ((v407[23] & 0x80000000) == 0)
            goto LABEL_222;
LABEL_221:
          operator delete(*(void **)v407);
          goto LABEL_222;
        }
        v197 = 0;
LABEL_231:
        objc_msgSend(v192, "observationsRecipient", *(double *)&v194);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "originatingRequestSpecifier");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = [VNClassificationObservation alloc];
        LODWORD(v210) = v197;
        v211 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v209, "initWithOriginatingRequestSpecifier:identifier:confidence:", v208, CFSTR("VNPotentialLandmarkIdentifier"), v210);
        *(_QWORD *)v407 = v211;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v407, 1);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "receiveObservations:", v206);

      }
      else if (a28)
      {
        VNErrorForCVMLStatus(v401);
        v206 = 0;
        *a28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v206 = 0;
      }
      std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100]((void ***)v399);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    }
    else
    {
      v206 = 0;
    }
    v212 = (std::__shared_weak_count *)v404.__r_.__value_.__l.__size_;
    if (v404.__r_.__value_.__l.__size_)
    {
      v213 = (unint64_t *)(v404.__r_.__value_.__l.__size_ + 8);
      do
        v214 = __ldaxr(v213);
      while (__stlxr(v214 - 1, v213));
      if (!v214)
      {
        ((void (*)(std::__shared_weak_count *))v212->__on_zero_shared)(v212);
        std::__shared_weak_count::__release_weak(v212);
      }
    }

    if (!v206)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v206);

  }
  if (v335)
  {
    v215 = v335;
    objc_msgSend(v215, "observationsRecipient");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "originatingRequestSpecifier");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "requestClassCode");
    objc_msgSend(v217, "requestRevision");
    kdebug_trace();
    v218 = *(_QWORD *)(a1 + 112);
    v412.i32[0] = 8;
    if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v218 + 824, 8u, &v412)+ 20))
    {
      v304 = __cxa_allocate_exception(8uLL);
      *v304 = 8574;
      __cxa_throw(v304, MEMORY[0x1E0DE4F28], 0);
    }
    *(_DWORD *)v407 = 8;
    v219 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v218 + 784, 8u, v407);
    vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v412, (__int128 *)(v219 + 24), 0);
    v221 = vision::mod::ImageAnalyzer_Tensor1D<float>::operator[]((uint64_t)&v412, 0, v220);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    v222 = *(_QWORD *)(a1 + 112);
    memset(v407, 0, sizeof(v407));
    LODWORD(v408) = 1065353216;
    v412.i32[0] = 4;
    if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v222 + 824, 4u, &v412)+ 20))
    {
      v305 = __cxa_allocate_exception(8uLL);
      *v305 = 8574;
      __cxa_throw(v305, MEMORY[0x1E0DE4F28], 0);
    }
    LODWORD(v401) = 4;
    v223 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v222 + 784, 4u, &v401);
    vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v412, (__int128 *)(v223 + 24), 1);
    vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v404, (unint64_t *)&v412);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v412);
    v412 = 0uLL;
    v413 = 0;
    v224 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((_QWORD *)(v222 + 744), 4u);
    if (v224)
    {
      LODWORD(v401) = 4;
      v225 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((_QWORD *)(v222 + 744), 4u, &v401);
      vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v225 + 3), (uint64_t)&v404, (uint64_t)&v412);
    }
    v226 = (void *)v404.__r_.__value_.__r.__words[0];
    if (v404.__r_.__value_.__l.__size_ == v404.__r_.__value_.__r.__words[0])
    {
      v226 = (void *)v404.__r_.__value_.__l.__size_;
    }
    else
    {
      v227 = 0;
      v228 = 0;
      do
      {
        v229 = v412.i64[0];
        if (!v224)
          v229 = (uint64_t)v226;
        v230 = *(_DWORD *)(v229 + 4 * v228);
        LODWORD(v399[0]) = 4;
        v401 = (id)(std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v222 + 864, 4u, v399)[3]+ v227);
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v407, (unsigned __int8 *)v401, (__int128 **)&v401)+ 10) = v230;
        v226 = (void *)v404.__r_.__value_.__r.__words[0];
        ++v228;
        v227 += 24;
      }
      while (v228 < (uint64_t)(v404.__r_.__value_.__l.__size_ - v404.__r_.__value_.__r.__words[0]) >> 2);
    }
    if (v412.i64[0])
    {
      v412.i64[1] = v412.i64[0];
      operator delete((void *)v412.i64[0]);
      v226 = (void *)v404.__r_.__value_.__r.__words[0];
    }
    if (v226)
    {
      v404.__r_.__value_.__l.__size_ = (std::string::size_type)v226;
      operator delete(v226);
    }
    std::string::basic_string[abi:ne180100]<0>(&v412, "subject_framing");
    v231 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)&v412);
    if (v231)
      v232 = *((_DWORD *)v231 + 10);
    else
      v232 = 0;
    std::string::basic_string[abi:ne180100]<0>(&v404, "background");
    v233 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)&v404);
    if (v233)
      v234 = *((_DWORD *)v233 + 10);
    else
      v234 = 0;
    std::string::basic_string[abi:ne180100]<0>(&v401, "blur");
    v235 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)&v401);
    if (v235)
      v236 = *((_DWORD *)v235 + 10);
    else
      v236 = 0;
    std::string::basic_string[abi:ne180100]<0>(v399, "subject_sharpness");
    v237 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v399);
    if (v237)
      v238 = *((_DWORD *)v237 + 10);
    else
      v238 = 0;
    std::string::basic_string[abi:ne180100]<0>(v397, "timing");
    v239 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v397);
    if (v239)
      v240 = *((_DWORD *)v239 + 10);
    else
      v240 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, "lightning");
    v241 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)&__p);
    if (v241)
      v242 = *((_DWORD *)v241 + 10);
    else
      v242 = 0;
    std::string::basic_string[abi:ne180100]<0>(v410, "reflections");
    v243 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v410);
    if (v243)
      v244 = *((_DWORD *)v243 + 10);
    else
      v244 = 0;
    std::string::basic_string[abi:ne180100]<0>(v392, "color_harmony");
    v245 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v392);
    if (v245)
      v246 = *((_DWORD *)v245 + 10);
    else
      v246 = 0;
    v364 = v246;
    std::string::basic_string[abi:ne180100]<0>(v390, "color_brightness");
    v247 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v390);
    if (v247)
      v248 = *((_DWORD *)v247 + 10);
    else
      v248 = 0;
    v353 = v248;
    std::string::basic_string[abi:ne180100]<0>(v388, "symmetry");
    v249 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v388);
    if (v249)
      v250 = *((_DWORD *)v249 + 10);
    else
      v250 = 0;
    v347 = v250;
    std::string::basic_string[abi:ne180100]<0>(v386, "repetition");
    v251 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v386);
    if (v251)
      v252 = *((_DWORD *)v251 + 10);
    else
      v252 = 0;
    v341 = v252;
    std::string::basic_string[abi:ne180100]<0>(v384, "immersive_feeling");
    v253 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v384);
    if (v253)
      v254 = *((_DWORD *)v253 + 10);
    else
      v254 = 0;
    obja = v254;
    std::string::basic_string[abi:ne180100]<0>(v382, "perspective");
    v255 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v382);
    if (v255)
      v256 = *((_DWORD *)v255 + 10);
    else
      v256 = 0;
    v324 = v256;
    std::string::basic_string[abi:ne180100]<0>(v380, "post_processing");
    v257 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v380);
    if (v257)
      v258 = *((_DWORD *)v257 + 10);
    else
      v258 = 0;
    v315 = v258;
    std::string::basic_string[abi:ne180100]<0>(v378, "noise");
    v259 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v378);
    if (v259)
      v260 = *((_DWORD *)v259 + 10);
    else
      v260 = 0;
    v313 = v260;
    std::string::basic_string[abi:ne180100]<0>(v376, "failure");
    v261 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v376);
    if (v261)
      v262 = *((_DWORD *)v261 + 10);
    else
      v262 = 0;
    v311 = v262;
    std::string::basic_string[abi:ne180100]<0>(v374, "composition");
    v263 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v374);
    if (v263)
      v264 = *((_DWORD *)v263 + 10);
    else
      v264 = 0;
    v310 = v264;
    std::string::basic_string[abi:ne180100]<0>(v372, "interestingness");
    v265 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v372);
    if (v265)
      v266 = *((_DWORD *)v265 + 10);
    else
      v266 = 0;
    v309 = v266;
    std::string::basic_string[abi:ne180100]<0>(v370, "object_intrusion");
    v308 = v221;
    v267 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v370);
    if (v267)
      v268 = *((_DWORD *)v267 + 10);
    else
      v268 = 0;
    std::string::basic_string[abi:ne180100]<0>(v368, "tilt");
    v307 = v244;
    v269 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v368);
    if (v269)
      v270 = *((_DWORD *)v269 + 10);
    else
      v270 = 0;
    std::string::basic_string[abi:ne180100]<0>(v366, "low_light");
    v271 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v407, (unsigned __int8 *)v366);
    if (v271)
      LODWORD(v272) = *((_DWORD *)v271 + 10);
    else
      LODWORD(v272) = 0;
    v306 = __PAIR64__(LODWORD(v272), v270);
    LODWORD(v279) = v307;
    *(float *)&v272 = v308;
    LODWORD(v273) = v232;
    LODWORD(v274) = v234;
    LODWORD(v275) = v236;
    LODWORD(v276) = v238;
    LODWORD(v277) = v240;
    LODWORD(v278) = v242;
    +[VNImageAestheticsObservation observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:](VNImageAestheticsObservation, "observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:", v217, a28, v272, v273, v274, v275, v276, v277, v278, v279, __PAIR64__(v353, v364), __PAIR64__(v341, v347), __PAIR64__(v324, obja),
      __PAIR64__(v313, v315),
      __PAIR64__(v310, v311),
      __PAIR64__(v268, v309),
      v306);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    if (v367 < 0)
      operator delete(v366[0]);
    if (v369 < 0)
      operator delete(v368[0]);
    if (v371 < 0)
      operator delete(v370[0]);
    if (v373 < 0)
      operator delete(v372[0]);
    if (v375 < 0)
      operator delete(v374[0]);
    if (v377 < 0)
      operator delete(v376[0]);
    if (v379 < 0)
      operator delete(v378[0]);
    if (v381 < 0)
      operator delete(v380[0]);
    if (v383 < 0)
      operator delete(v382[0]);
    if (v385 < 0)
      operator delete(v384[0]);
    if (v387 < 0)
      operator delete(v386[0]);
    if (v389 < 0)
      operator delete(v388[0]);
    if (v391 < 0)
      operator delete(v390[0]);
    if (v393 < 0)
      operator delete(v392[0]);
    if (v411 < 0)
      operator delete(v410[0]);
    if (v396 < 0)
      operator delete(__p);
    if (v398 < 0)
      operator delete(v397[0]);
    if (v400 < 0)
      operator delete(v399[0]);
    if (SHIBYTE(v403) < 0)
      operator delete(v401);
    if (SHIBYTE(v404.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v404.__r_.__value_.__l.__data_);
    if (SHIBYTE(v413) < 0)
      operator delete((void *)v412.i64[0]);
    if (v280)
    {
      kdebug_trace();
      v412.i64[0] = (uint64_t)v280;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v412, 1);
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "receiveObservations:", v281);
      v282 = v281;

    }
    else
    {
      v282 = 0;
    }

    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*(void ***)&v407[16]);
    v283 = *(void **)v407;
    *(_QWORD *)v407 = 0;
    if (v283)
      operator delete(v283);

    if (!v282)
      goto LABEL_390;
    objc_msgSend(v322, "addObjectsFromArray:", v282);

  }
  if (!v332)
    goto LABEL_371;
  v284 = v332;
  v285 = v336;
  v286 = v330;
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&v412, *(_QWORD *)(a1 + 112));
  -[VNImageAnalyzerMultiDetector _processSaliencyTensor:regionOfInterest:originalImageSize:options:saliencyConfiguration:saliencyGeneratorType:startCode:finishCode:qosClass:warningRecorder:error:](a11, a12, a13, a14, a9, a10, a1, &v412, v285, v284, CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType"), 723845552, 723845556, a26, v286, a28);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  free(v414);
  free(v415);

  if (!v287)
  {
LABEL_390:
    v91 = 0;
    goto LABEL_391;
  }
  objc_msgSend(v322, "addObjectsFromArray:", v287);

LABEL_371:
  if (v331)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForSaliencyOConfiguration:regionOfInterest:originalImageSize:options:qosClass:warningRecorder:error:](a1, v331, v336, a26, v330, a28, a11, a12, a13, a14, a9, a10);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v329)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForRecognizeObjectsConfiguration:error:](a1, v329);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v328)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:error:](a1, v328, a28);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v327)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForSignificantEventConfiguration:error:](a1, v327, a28);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v326)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForCityNatureConfiguration:error:](a1, v326, a28);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  if (v325)
  {
    -[VNImageAnalyzerMultiDetector _processLastAnalysisForPhotosAdjustmentsConfiguration:error:](a1, v325, a28);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (!v91)
      goto LABEL_391;
    objc_msgSend(v322, "addObjectsFromArray:", v91);

  }
  v91 = v322;
LABEL_391:

LABEL_392:
  return v91;
}

- (uint64_t)_analysisTypeForScenes:(void *)a1 entityNet:(void *)a2 junk:(void *)a3 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a4 landmark:(void *)a5 sceneprints:(void *)a6 compressedSceneprint:(void *)a7 fingerprints:(void *)a8 aesthetics:(void *)a9 saliencyA:(void *)a10 saliencyO:(void *)a11 recognizeObjects:(void *)a12 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a13 VNdGg5skzXHSAENO6T3enHE:(void *)a14 cityNatureGating:(void *)a15 photosAdjustments:(void *)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v38 = a1;
  v39 = a2;
  v46 = a3;
  v47 = a4;
  v48 = a5;
  v37 = a6;
  v41 = a7;
  v40 = a8;
  v42 = a9;
  v43 = a10;
  v44 = a11;
  v45 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v27 = v38;
  v28 = 0;
  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "analysisTypes", v37) | v28;
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v29);
  }

  if (v46)
    v28 = objc_msgSend(v46, "analysisTypes") | v28;
  if (v47)
    v28 = objc_msgSend(v47, "analysisTypes") | v28;
  if (v48)
    v28 = objc_msgSend(v48, "analysisTypes") | v28;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v32 = v37;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v32);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "analysisTypes", v37) | v28;
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v33);
  }

  if (v41)
    v28 = objc_msgSend(v41, "analysisTypes") | v28;
  if (v23)
    v28 = objc_msgSend(v23, "analysisTypes") | v28;
  if (v24)
    v28 = objc_msgSend(v24, "analysisTypes") | v28;
  if (v25)
    v28 = objc_msgSend(v25, "analysisTypes") | v28;
  if (v39)
    v28 = objc_msgSend(v39, "analysisTypes") | v28;
  if (v40)
    v28 = objc_msgSend(v40, "analysisTypes") | v28;
  if (v42)
    v28 = objc_msgSend(v42, "analysisTypes") | v28;
  if (v43)
    v28 = objc_msgSend(v43, "analysisTypes") | v28;
  if (v44)
    v28 = objc_msgSend(v44, "analysisTypes") | v28;
  if (v45)
    v28 = objc_msgSend(v45, "analysisTypes") | v28;
  if (v26)
    v28 = objc_msgSend(v26, "analysisTypes") | v28;

  return v28;
}

- (uint64_t)_performAnalysis:(uint64_t)a3 pixelBuffer:(uint64_t)a4 error:
{
  void *v5;
  uint64_t v6;
  _QWORD aBlock[6];
  int v9;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__VNImageAnalyzerMultiDetector__performAnalysis_pixelBuffer_error___block_invoke;
  aBlock[3] = &unk_1E4547208;
  v9 = a2;
  aBlock[4] = a1;
  aBlock[5] = a3;
  v5 = _Block_copy(aBlock);
  kdebug_trace();
  v6 = VNExecuteBlock(v5, a4);
  if ((v6 & 1) != 0)
    kdebug_trace();

  return v6;
}

- (id)_processLastAnalysisForSaliencyOConfiguration:(void *)a3 regionOfInterest:(uint64_t)a4 originalImageSize:(void *)a5 options:(_QWORD *)a6 qosClass:(double)a7 warningRecorder:(double)a8 error:(double)a9
{
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char *v27;
  void *v28;
  _QWORD *exception;
  int8x16_t v31[10];
  void *v32;
  void *v33;
  int v34;

  v23 = a2;
  v24 = a3;
  v25 = a5;
  v26 = *(_QWORD *)(a1 + 112);
  v34 = 128;
  if (!*((_BYTE *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v26 + 824, 0x80u, &v34)+ 20))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 8574;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v34 = 128;
  v27 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v26 + 784, 0x80u, &v34);
  vision::mod::ImageAnalyzer_Tensor2D::ImageAnalyzer_Tensor2D((uint64_t)v31, (__int128 *)(v27 + 24));
  -[VNImageAnalyzerMultiDetector _processSaliencyTensor:regionOfInterest:originalImageSize:options:saliencyConfiguration:saliencyGeneratorType:startCode:finishCode:qosClass:warningRecorder:error:](a7, a8, a9, a10, a11, a12, a1, v31, v24, v23, CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), 723845584, 723845588, a4, v25, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  free(v32);
  free(v33);

  return v28;
}

- (id)_processLastAnalysisForRecognizeObjectsConfiguration:(uint64_t)a1 error:(void *)a2
{
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  float v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  _QWORD *exception;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  std::string::size_type i;
  std::string::size_type size;
  __int128 v19;
  char *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  uint64_t *v25;
  uint64_t v26;
  const std::string::value_type **v27;
  float *v28;
  float v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  float *v32;
  float *v33;
  std::string::size_type v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer v41;
  int *v42;
  float v43;
  unsigned int v45;
  float v46;
  float *v47;
  float v48;
  uint64_t v49;
  std::vector<int>::pointer end;
  int *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  int *v56;
  int v57;
  std::vector<int>::pointer v58;
  int *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  int *v64;
  int v65;
  std::vector<int>::pointer v66;
  int *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  int *v72;
  int v73;
  std::vector<int>::pointer v74;
  int *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  float *v80;
  int *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  float v89;
  float v90;
  float v91;
  float v92;
  uint64_t *v93;
  char *v94;
  char *v95;
  float v96;
  float v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  unint64_t v110;
  __int128 v111;
  uint64_t v112;
  uint64_t *v113;
  std::string::size_type k;
  std::string::size_type v115;
  __int128 v116;
  char *v117;
  float v118;
  uint64_t *v119;
  int v120;
  uint64_t v121;
  uint64_t m;
  uint64_t *v123;
  uint64_t v124;
  const std::string::value_type **v125;
  float *v126;
  float v127;
  uint64_t v128;
  __int128 **v129;
  float v130;
  float *v131;
  float *v132;
  std::string::size_type v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  std::vector<int>::pointer v141;
  std::vector<int>::pointer v142;
  std::vector<int>::pointer v143;
  int *v144;
  VNDisallowedList *v145;
  unint64_t v146;
  float v147;
  unsigned int v149;
  float v150;
  uint64_t v151;
  float *v152;
  float v153;
  uint64_t v154;
  std::vector<int>::pointer v155;
  int *v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  int *v161;
  int v162;
  std::vector<int>::pointer v163;
  int *v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t v168;
  int *v169;
  int v170;
  std::vector<int>::pointer v171;
  int *v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  int *v177;
  int v178;
  std::vector<int>::pointer v179;
  int *v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  int *v185;
  int v186;
  float *v187;
  float *v188;
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  uint64_t v192;
  float *v193;
  int v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  int v201;
  float *v202;
  float v203;
  float v204;
  int v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float *v210;
  float v211;
  float v212;
  float v213;
  float v214;
  uint64_t *v215;
  char *v216;
  char *v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  unint64_t v224;
  unint64_t v225;
  unint64_t v226;
  uint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  uint64_t v232;
  unint64_t v233;
  char *v234;
  char *v235;
  unint64_t v236;
  __int128 v237;
  char **v238;
  uint64_t v239;
  int *v240;
  char **v241;
  char *v242;
  char *v243;
  uint64_t v244;
  unint64_t v245;
  std::string::size_type v246;
  unint64_t v247;
  unint64_t v248;
  std::string::size_type v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  __int128 v258;
  unint64_t v259;
  unint64_t v260;
  uint64_t v261;
  __int128 v262;
  unint64_t v263;
  unint64_t v264;
  VNDisallowedList *v265;
  __int128 v266;
  char *v267;
  std::string::size_type v268;
  char *v269;
  unint64_t v270;
  uint64_t v271;
  std::string::size_type v272;
  float v273;
  float v274;
  float v275;
  float v276;
  uint64_t v277;
  unsigned __int8 *v278;
  __int128 **v279;
  char **v280;
  unsigned __int8 *v281;
  __int128 **v282;
  char **v283;
  uint64_t *n;
  id v285;
  _QWORD *v286;
  NSString *v287;
  int *v288;
  float *v289;
  double x;
  double y;
  double width;
  double height;
  float v294;
  VNClassificationObservation *v295;
  double v296;
  VNClassificationObservation *v297;
  VNRecognizedObjectObservation *v298;
  void *v299;
  double v300;
  VNRecognizedObjectObservation *v301;
  id v302;
  void *v304;
  id v305;
  uint64_t v307;
  uint64_t v308;
  unint64_t v309;
  void *v310;
  _QWORD *v311;
  uint64_t v312;
  unint64_t v313;
  uint64_t v314;
  std::string::size_type v315;
  uint64_t v316;
  unint64_t v317;
  unint64_t v318;
  std::string::size_type v319;
  int *v320;
  uint64_t v321;
  int *v322;
  unint64_t v323;
  int *v324;
  uint64_t v325;
  int *v326;
  int *__p;
  void *__pa;
  char **__pb;
  int *v330;
  unint64_t v331;
  float v332;
  uint64_t v333;
  int *v334;
  uint64_t v335;
  int v336;
  char **v337;
  int *value;
  VNDisallowedList *v339;
  float v340;
  VNDisallowedList *v341;
  VNDisallowedList *v342;
  int *v343;
  int *v344;
  float v345;
  _BYTE *v346;
  id v347;
  __int128 v348;
  __int128 v349;
  int v350;
  void *v351;
  float *v352;
  unint64_t v353;
  std::vector<int> v354;
  std::vector<int> v355;
  std::vector<int> v356;
  std::vector<int> v357;
  _OWORD v358[16];
  std::string v359;
  uint64_t v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  float *v366;
  float *v367;
  float v368;
  std::string v369;
  unsigned __int8 *v370;
  _QWORD v371[3];
  CGRect v372;
  CGRect v373;
  CGRect v374;

  v371[1] = *MEMORY[0x1E0C80C00];
  v305 = a2;
  objc_msgSend(v305, "observationsRecipient");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "originatingRequestSpecifier");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "requestClassCode");
  v2 = objc_msgSend(v310, "requestRevision");
  kdebug_trace();
  kdebug_trace();
  v307 = v2;
  v312 = *(_QWORD *)(a1 + 112);
  objc_msgSend(v305, "minimumDetectionConfidence");
  v4 = v3;
  objc_msgSend(v305, "nonMaximumSuppressionThreshold");
  v6 = v5;
  v348 = 0u;
  v349 = 0u;
  v350 = 1065353216;
  v7 = *(int8x8_t *)(v312 + 832);
  if (!*(_QWORD *)&v7)
    goto LABEL_17;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 64;
    if (*(_QWORD *)&v7 <= 0x40uLL)
      v9 = 0x40uLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (v7.i8[0] - 1) & 0x40;
  }
  v10 = *(uint64_t ***)(*(_QWORD *)(v312 + 824) + 8 * v9);
  if (!v10 || (v11 = *v10) == 0)
  {
LABEL_17:
    exception = __cxa_allocate_exception(8uLL);
    *exception = 8574;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  while (1)
  {
    v12 = v11[1];
    if (v12 == 64)
      break;
    if (v8.u32[0] > 1uLL)
    {
      if (v12 >= *(_QWORD *)&v7)
        v12 %= *(_QWORD *)&v7;
    }
    else
    {
      v12 &= *(_QWORD *)&v7 - 1;
    }
    if (v12 != v9)
      goto LABEL_17;
LABEL_16:
    v11 = (uint64_t *)*v11;
    if (!v11)
      goto LABEL_17;
  }
  if (*((_DWORD *)v11 + 4) != 64)
    goto LABEL_16;
  v14 = (_QWORD *)(v312 + 864);
  v311 = (_QWORD *)(v312 + 864);
  v15 = (_QWORD *)(v312 + 864);
  if (*(_BYTE *)(v312 + 461))
  {
    v16 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v15, 0x40u);
    if (v16)
    {
      memset(&v369, 0, sizeof(v369));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v369, (__int128 *)v16[3], (__int128 *)v16[4], 0xAAAAAAAAAAAAAAABLL * ((v16[4] - v16[3]) >> 3));
      size = v369.__r_.__value_.__l.__size_;
      for (i = v369.__r_.__value_.__r.__words[0]; i != size; i += 24)
      {
        if (*(char *)(i + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v359, *(const std::string::value_type **)i, *(_QWORD *)(i + 8));
        }
        else
        {
          v19 = *(_OWORD *)i;
          v359.__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 16);
          *(_OWORD *)&v359.__r_.__value_.__l.__data_ = v19;
        }
        *(_QWORD *)&v358[0] = &v359;
        v20 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (__int128 **)v358);
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::reserve((uint64_t)(v20 + 40));
        if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v359.__r_.__value_.__l.__data_);
      }
      if (*(float *)(v312 + 452) < v4)
        v4 = *(float *)(v312 + 452);
      *(float *)&v370 = v4;
      v21 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v14, 0x40u);
      if (!v21)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      v22 = -1431655765 * ((v21[4] - v21[3]) >> 3);
      std::vector<float>::vector(&v366, v22, &v370);
      if (v22 >= 2)
      {
        v23 = 0;
        for (j = 1; j != v22; ++j)
        {
          v25 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v25)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v26 = v25[3] + v23;
          v27 = (const std::string::value_type **)(v26 + 24);
          if (*(char *)(v26 + 47) < 0)
          {
            std::string::__init_copy_ctor_external(&v359, *v27, *(_QWORD *)(v26 + 32));
          }
          else
          {
            *(_OWORD *)&v359.__r_.__value_.__l.__data_ = *(_OWORD *)v27;
            v359.__r_.__value_.__r.__words[2] = *(_QWORD *)(v26 + 40);
          }
          v28 = (float *)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>(v312 + 560, &v359);
          if ((float *)(v312 + 568) != v28)
          {
            v29 = v28[14];
            if (v4 >= v29)
              v29 = v4;
            v366[j] = v29;
          }
          if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v359.__r_.__value_.__l.__data_);
          v23 += 24;
        }
      }
      v30 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(v312 + 968), (unsigned __int8 *)(v312 + 216));
      if (!v30)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)&v359, (__int128 *)(v30 + 40));
      v31 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(v312 + 968), (unsigned __int8 *)(v312 + 240));
      if (!v31)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)v358, (__int128 *)(v31 + 40));
      memset(&v357, 0, sizeof(v357));
      memset(&v356, 0, sizeof(v356));
      memset(&v355, 0, sizeof(v355));
      memset(&v354, 0, sizeof(v354));
      v33 = v366;
      v32 = v367;
      v317 = v361;
      v34 = v359.__r_.__value_.__r.__words[0];
      v35 = v360;
      std::vector<int>::reserve(&v357, 0x3E8uLL);
      std::vector<int>::reserve(&v356, 0x3E8uLL);
      std::vector<int>::reserve(&v355, 0x3E8uLL);
      std::vector<float>::reserve((void **)&v354.__begin_, 0x3E8uLL);
      if (v317)
      {
        v36 = (int)(v32 - v33);
        v37 = (unint64_t)(((char *)v32 - (char *)v33) << 30) >> 33;
        v325 = v35;
        v321 = 0;
        v323 = v37;
        do
        {
          if (v35)
          {
            v38 = 0;
            v39 = 0;
            begin = v357.__begin_;
            value = v356.__end_cap_.__value_;
            v343 = v357.__end_cap_.__value_;
            v41 = v356.__begin_;
            v42 = v355.__begin_;
            v330 = v354.__end_cap_.__value_;
            v334 = v355.__end_cap_.__value_;
            __p = v354.__begin_;
            v319 = v34;
            do
            {
              v43 = *(float *)(v34 + 4 * v363 * v39);
              if (v43 < (float)(1.0 - v4) && v37 != 0)
              {
                v45 = 0;
                v46 = (float)(1.0 - v43) * 0.5;
                v47 = (float *)(v34 + v363 * v38 + 4 * v365);
                v48 = -3.4028e38;
                v49 = 1;
                do
                {
                  if (*v47 > v46)
                  {
                    v48 = *v47;
                    v45 = v49;
                    if (!(_DWORD)v49)
                      goto LABEL_133;
                    goto LABEL_61;
                  }
                  if (*v47 > v48 && *v47 > v4)
                  {
                    v48 = *v47;
                    v45 = v49;
                  }
                  ++v49;
                  v47 += v365;
                }
                while (v36 != v49);
                if (!v45)
                  goto LABEL_133;
LABEL_61:
                if (v48 <= v366[v45])
                  goto LABEL_133;
                end = v357.__end_;
                if (v357.__end_ >= v343)
                {
                  v52 = v357.__end_ - begin;
                  v53 = v52 + 1;
                  if ((unint64_t)(v52 + 1) >> 62)
                    goto LABEL_425;
                  if (((char *)v343 - (char *)begin) >> 1 > v53)
                    v53 = ((char *)v343 - (char *)begin) >> 1;
                  if ((unint64_t)((char *)v343 - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
                    v54 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v54 = v53;
                  if (v54)
                    v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v54);
                  else
                    v55 = 0;
                  v56 = (int *)(v54 + 4 * v52);
                  *v56 = v321;
                  v51 = v56 + 1;
                  while (end != begin)
                  {
                    v57 = *--end;
                    *--v56 = v57;
                  }
                  v343 = (int *)(v54 + 4 * v55);
                  v357.__end_ = v51;
                  if (begin)
                    operator delete(begin);
                  begin = v56;
                  v37 = v323;
                  v35 = v325;
                }
                else
                {
                  *v357.__end_ = v321;
                  v51 = end + 1;
                }
                v357.__end_ = v51;
                v58 = v356.__end_;
                if (v356.__end_ >= value)
                {
                  v60 = v356.__end_ - v41;
                  v61 = v60 + 1;
                  if ((unint64_t)(v60 + 1) >> 62)
                    goto LABEL_425;
                  if (((char *)value - (char *)v41) >> 1 > v61)
                    v61 = ((char *)value - (char *)v41) >> 1;
                  if ((unint64_t)((char *)value - (char *)v41) >= 0x7FFFFFFFFFFFFFFCLL)
                    v62 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v62 = v61;
                  if (v62)
                    v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v62);
                  else
                    v63 = 0;
                  v64 = (int *)(v62 + 4 * v60);
                  *v64 = v39;
                  v59 = v64 + 1;
                  while (v58 != v41)
                  {
                    v65 = *--v58;
                    *--v64 = v65;
                  }
                  value = (int *)(v62 + 4 * v63);
                  v356.__end_ = v59;
                  if (v41)
                    operator delete(v41);
                  v41 = v64;
                  v37 = v323;
                  v35 = v325;
                }
                else
                {
                  *v356.__end_ = v39;
                  v59 = v58 + 1;
                }
                v356.__end_ = v59;
                v66 = v355.__end_;
                if (v355.__end_ >= v334)
                {
                  v68 = v355.__end_ - v42;
                  v69 = v68 + 1;
                  if ((unint64_t)(v68 + 1) >> 62)
                  {
LABEL_425:
                    v357.__end_cap_.__value_ = v343;
                    v356.__end_cap_.__value_ = value;
                    v357.__begin_ = begin;
                    v355.__end_cap_.__value_ = v334;
                    v356.__begin_ = v41;
                    v354.__end_cap_.__value_ = v330;
                    v355.__begin_ = v42;
                    v354.__begin_ = __p;
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (((char *)v334 - (char *)v42) >> 1 > v69)
                    v69 = ((char *)v334 - (char *)v42) >> 1;
                  if ((unint64_t)((char *)v334 - (char *)v42) >= 0x7FFFFFFFFFFFFFFCLL)
                    v70 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v70 = v69;
                  if (v70)
                    v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v70);
                  else
                    v71 = 0;
                  v72 = (int *)(v70 + 4 * v68);
                  *v72 = v45;
                  v67 = v72 + 1;
                  while (v66 != v42)
                  {
                    v73 = *--v66;
                    *--v72 = v73;
                  }
                  v334 = (int *)(v70 + 4 * v71);
                  v355.__end_ = v67;
                  if (v42)
                    operator delete(v42);
                  v42 = v72;
                  v37 = v323;
                  v35 = v325;
                }
                else
                {
                  *v355.__end_ = v45;
                  v67 = v66 + 1;
                }
                v355.__end_ = v67;
                v74 = v354.__end_;
                if (v354.__end_ >= v330)
                {
                  v76 = v354.__end_ - __p;
                  v77 = v76 + 1;
                  if ((unint64_t)(v76 + 1) >> 62)
                  {
                    v357.__end_cap_.__value_ = v343;
                    v356.__end_cap_.__value_ = value;
                    v357.__begin_ = begin;
                    v355.__end_cap_.__value_ = v334;
                    v356.__begin_ = v41;
                    v354.__end_cap_.__value_ = v330;
                    v355.__begin_ = v42;
                    v354.__begin_ = __p;
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (((char *)v330 - (char *)__p) >> 1 > v77)
                    v77 = ((char *)v330 - (char *)__p) >> 1;
                  if ((unint64_t)((char *)v330 - (char *)__p) >= 0x7FFFFFFFFFFFFFFCLL)
                    v78 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v78 = v77;
                  if (v78)
                    v78 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v78);
                  else
                    v79 = 0;
                  v80 = (float *)(v78 + 4 * v76);
                  *v80 = v48;
                  v75 = (int *)(v80 + 1);
                  if (v74 == __p)
                  {
                    v81 = __p;
                  }
                  else
                  {
                    v81 = __p;
                    do
                    {
                      v82 = *--v74;
                      *((_DWORD *)v80-- - 1) = v82;
                    }
                    while (v74 != __p);
                  }
                  v330 = (int *)(v78 + 4 * v79);
                  v354.__end_ = v75;
                  if (v81)
                    operator delete(v81);
                  __p = (int *)v80;
                  v37 = v323;
                  v35 = v325;
                }
                else
                {
                  *(float *)v354.__end_ = v48;
                  v75 = v74 + 1;
                }
                v354.__end_ = v75;
                v34 = v319;
              }
LABEL_133:
              ++v39;
              v38 += 4;
            }
            while (v39 != v35);
            v357.__end_cap_.__value_ = v343;
            v356.__end_cap_.__value_ = value;
            v357.__begin_ = begin;
            v355.__end_cap_.__value_ = v334;
            v356.__begin_ = v41;
            v354.__end_cap_.__value_ = v330;
            v355.__begin_ = v42;
            v354.__begin_ = __p;
          }
          v34 += 4 * v364;
          ++v321;
        }
        while (v321 != v317);
      }
      if ((int)((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2) > 0)
      {
        v83 = 0;
        v84 = ((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2);
        do
        {
          v85 = v356.__begin_[v83];
          v86 = v357.__begin_[v83];
          v87 = v355.__begin_[v83];
          v88 = v354.__begin_[v83];
          v89 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 0);
          v90 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 1);
          v91 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 2);
          v92 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 3);
          v93 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v93)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v351 = (void *)(v93[3] + 24 * v87);
          v94 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)v351, (__int128 **)&v351);
          v95 = v94;
          v96 = v92 - v90;
          v97 = v91 - v89;
          v98 = *((_QWORD *)v94 + 6);
          v99 = *((_QWORD *)v94 + 7);
          if (v98 >= v99)
          {
            v101 = *((_QWORD *)v94 + 5);
            v102 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v98 - v101) >> 2);
            v103 = v102 + 1;
            if (v102 + 1 > 0xCCCCCCCCCCCCCCCLL)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            v104 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v99 - v101) >> 2);
            if (2 * v104 > v103)
              v103 = 2 * v104;
            if (v104 >= 0x666666666666666)
              v105 = 0xCCCCCCCCCCCCCCCLL;
            else
              v105 = v103;
            if (v105)
              v105 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v105);
            else
              v106 = 0;
            v107 = v105 + 20 * v102;
            *(_DWORD *)v107 = v88;
            *(float *)(v107 + 4) = v90;
            *(float *)(v107 + 8) = v89;
            *(float *)(v107 + 12) = v97;
            *(float *)(v107 + 16) = v96;
            v109 = (char *)*((_QWORD *)v95 + 5);
            v108 = (char *)*((_QWORD *)v95 + 6);
            v110 = v107;
            if (v108 != v109)
            {
              do
              {
                v111 = *(_OWORD *)(v108 - 20);
                *(_DWORD *)(v110 - 4) = *((_DWORD *)v108 - 1);
                *(_OWORD *)(v110 - 20) = v111;
                v110 -= 20;
                v108 -= 20;
              }
              while (v108 != v109);
              v108 = (char *)*((_QWORD *)v95 + 5);
            }
            v100 = v107 + 20;
            *((_QWORD *)v95 + 5) = v110;
            *((_QWORD *)v95 + 6) = v107 + 20;
            *((_QWORD *)v95 + 7) = v105 + 20 * v106;
            if (v108)
              operator delete(v108);
          }
          else
          {
            *(_DWORD *)v98 = v88;
            *(float *)(v98 + 4) = v90;
            *(float *)(v98 + 8) = v89;
            *(float *)(v98 + 12) = v97;
            v100 = v98 + 20;
            *(float *)(v98 + 16) = v96;
          }
          *((_QWORD *)v95 + 6) = v100;
          ++v83;
        }
        while (v83 != v84);
      }
      if (v354.__begin_)
        operator delete(v354.__begin_);
      v112 = v312;
      if (v355.__begin_)
        operator delete(v355.__begin_);
      if (v356.__begin_)
        operator delete(v356.__begin_);
      if (v357.__begin_)
        operator delete(v357.__begin_);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v358);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v359);
      if (v366)
      {
        v367 = v366;
        operator delete(v366);
      }
      goto LABEL_337;
    }
LABEL_432:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v113 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v15, 0x40u);
  if (!v113)
    goto LABEL_432;
  memset(&v369, 0, sizeof(v369));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v369, (__int128 *)v113[3], (__int128 *)v113[4], 0xAAAAAAAAAAAAAAABLL * ((v113[4] - v113[3]) >> 3));
  v115 = v369.__r_.__value_.__l.__size_;
  for (k = v369.__r_.__value_.__r.__words[0]; k != v115; k += 24)
  {
    if (*(char *)(k + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v359, *(const std::string::value_type **)k, *(_QWORD *)(k + 8));
    }
    else
    {
      v116 = *(_OWORD *)k;
      v359.__r_.__value_.__r.__words[2] = *(_QWORD *)(k + 16);
      *(_OWORD *)&v359.__r_.__value_.__l.__data_ = v116;
    }
    *(_QWORD *)&v358[0] = &v359;
    v117 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (__int128 **)v358);
    std::vector<std::tuple<float,_Geometry2D_rect2D_>>::reserve((uint64_t)(v117 + 40));
    if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v359.__r_.__value_.__l.__data_);
  }
  if (*(float *)(v312 + 452) >= v4)
    v118 = v4;
  else
    v118 = *(float *)(v312 + 452);
  v368 = v118;
  v119 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v14, 0x40u);
  if (!v119)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v120 = -1431655765 * ((v119[4] - v119[3]) >> 3);
  std::vector<float>::vector(&v366, v120, &v368);
  if (v120 >= 2)
  {
    v121 = 0;
    for (m = 1; m != v120; ++m)
    {
      v123 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
      if (!v123)
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      v124 = v123[3] + v121;
      v125 = (const std::string::value_type **)(v124 + 24);
      if (*(char *)(v124 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&v359, *v125, *(_QWORD *)(v124 + 32));
      }
      else
      {
        *(_OWORD *)&v359.__r_.__value_.__l.__data_ = *(_OWORD *)v125;
        v359.__r_.__value_.__r.__words[2] = *(_QWORD *)(v124 + 40);
      }
      v126 = (float *)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>(v312 + 560, &v359);
      if ((float *)(v312 + 568) != v126)
      {
        v127 = v126[14];
        if (v118 >= v127)
          v127 = v118;
        v366[m] = v127;
      }
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v359.__r_.__value_.__l.__data_);
      v121 += 24;
    }
  }
  v112 = v312;
  if (*(_QWORD *)(v312 + 432))
  {
    v128 = 0;
    do
    {
      v129 = (__int128 **)(*(_QWORD *)(v112 + 944) + 24 * v128);
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)&v359, (__int128 *)((char *)*v129 + 168));
      v308 = v128;
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)v358, *v129);
      memset(&v357, 0, sizeof(v357));
      memset(&v356, 0, sizeof(v356));
      memset(&v355, 0, sizeof(v355));
      memset(&v354, 0, sizeof(v354));
      v351 = 0;
      v352 = 0;
      v353 = 0;
      v130 = v368;
      v132 = v366;
      v131 = v367;
      v133 = v359.__r_.__value_.__r.__words[0];
      v314 = v360;
      v309 = v361;
      v134 = v362;
      std::vector<int>::reserve(&v357, 0x3E8uLL);
      std::vector<int>::reserve(&v356, 0x3E8uLL);
      std::vector<int>::reserve(&v355, 0x3E8uLL);
      std::vector<int>::reserve(&v354, 0x3E8uLL);
      std::vector<float>::reserve(&v351, 0x3E8uLL);
      if (v309)
      {
        v316 = 0;
        v135 = ((char *)v131 - (char *)v132) << 30;
        v136 = (int)(v131 - v132);
        v313 = v134 / v136;
        v137 = (v134 / v136);
        __pa = (void *)v137;
        v331 = v135;
        do
        {
          if (v314)
          {
            v138 = 0;
            v315 = v133;
            do
            {
              if ((int)v313 >= 1)
              {
                v139 = 0;
                v140 = 0;
                v141 = v357.__begin_;
                v324 = v356.__end_cap_.__value_;
                v326 = v357.__end_cap_.__value_;
                v142 = v356.__begin_;
                v143 = v355.__begin_;
                v320 = v354.__end_cap_.__value_;
                v322 = v355.__end_cap_.__value_;
                v144 = v354.__begin_;
                v318 = v353;
                v145 = (VNDisallowedList *)v351;
                v335 = v138;
                do
                {
                  v146 = v361 * v360;
                  v147 = *(float *)(v133 + 4 * (v138 + v361 * v360 * (_QWORD)v140 * v136));
                  if (v147 < (float)(1.0 - v130) && v135 >> 33 != 0)
                  {
                    v344 = v144;
                    v149 = 0;
                    v150 = (float)(1.0 - v147) * 0.5;
                    v151 = 4 * v146;
                    v152 = (float *)(v133 + 4 * v146 + 4 * (v138 + v146 * v139));
                    v153 = -3.4028e38;
                    v154 = 1;
                    do
                    {
                      if (*v152 > v150)
                      {
                        v153 = *v152;
                        v149 = v154;
                        if (!(_DWORD)v154)
                          goto LABEL_215;
                        goto LABEL_212;
                      }
                      if (*v152 > v153 && *v152 > v130)
                      {
                        v153 = *v152;
                        v149 = v154;
                      }
                      ++v154;
                      v152 = (float *)((char *)v152 + v151);
                    }
                    while (v136 != v154);
                    if (!v149)
                    {
LABEL_215:
                      v144 = v344;
                      goto LABEL_300;
                    }
LABEL_212:
                    if (v153 <= v366[v149])
                      goto LABEL_215;
                    v155 = v357.__end_;
                    v339 = v145;
                    if (v357.__end_ >= v326)
                    {
                      v157 = v357.__end_ - v141;
                      v158 = v157 + 1;
                      if ((unint64_t)(v157 + 1) >> 62)
                        goto LABEL_421;
                      if (((char *)v326 - (char *)v141) >> 1 > v158)
                        v158 = ((char *)v326 - (char *)v141) >> 1;
                      if ((unint64_t)((char *)v326 - (char *)v141) >= 0x7FFFFFFFFFFFFFFCLL)
                        v159 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v159 = v158;
                      if (v159)
                        v159 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v159);
                      else
                        v160 = 0;
                      v161 = (int *)(v159 + 4 * v157);
                      *v161 = v316;
                      v156 = v161 + 1;
                      while (v155 != v141)
                      {
                        v162 = *--v155;
                        *--v161 = v162;
                      }
                      v326 = (int *)(v159 + 4 * v160);
                      v357.__end_ = v156;
                      if (v141)
                        operator delete(v141);
                      v141 = v161;
                      v138 = v335;
                      v145 = v339;
                      v137 = (unint64_t)__pa;
                      v135 = v331;
                    }
                    else
                    {
                      *v357.__end_ = v316;
                      v156 = v155 + 1;
                    }
                    v357.__end_ = v156;
                    v163 = v356.__end_;
                    if (v356.__end_ >= v324)
                    {
                      v165 = v356.__end_ - v142;
                      v166 = v165 + 1;
                      if ((unint64_t)(v165 + 1) >> 62)
                        goto LABEL_421;
                      if (((char *)v324 - (char *)v142) >> 1 > v166)
                        v166 = ((char *)v324 - (char *)v142) >> 1;
                      if ((unint64_t)((char *)v324 - (char *)v142) >= 0x7FFFFFFFFFFFFFFCLL)
                        v167 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v167 = v166;
                      if (v167)
                        v167 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v167);
                      else
                        v168 = 0;
                      v169 = (int *)(v167 + 4 * v165);
                      *v169 = v335;
                      v164 = v169 + 1;
                      while (v163 != v142)
                      {
                        v170 = *--v163;
                        *--v169 = v170;
                      }
                      v324 = (int *)(v167 + 4 * v168);
                      v356.__end_ = v164;
                      if (v142)
                        operator delete(v142);
                      v142 = v169;
                      v138 = v335;
                      v145 = v339;
                      v137 = (unint64_t)__pa;
                      v135 = v331;
                    }
                    else
                    {
                      *v356.__end_ = v138;
                      v164 = v163 + 1;
                    }
                    v356.__end_ = v164;
                    v171 = v355.__end_;
                    if (v355.__end_ >= v322)
                    {
                      v173 = v355.__end_ - v143;
                      v174 = v173 + 1;
                      if ((unint64_t)(v173 + 1) >> 62)
                        goto LABEL_421;
                      if (((char *)v322 - (char *)v143) >> 1 > v174)
                        v174 = ((char *)v322 - (char *)v143) >> 1;
                      if ((unint64_t)((char *)v322 - (char *)v143) >= 0x7FFFFFFFFFFFFFFCLL)
                        v175 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v175 = v174;
                      if (v175)
                        v175 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v175);
                      else
                        v176 = 0;
                      v177 = (int *)(v175 + 4 * v173);
                      *v177 = (int)v140;
                      v172 = v177 + 1;
                      while (v171 != v143)
                      {
                        v178 = *--v171;
                        *--v177 = v178;
                      }
                      v322 = (int *)(v175 + 4 * v176);
                      v355.__end_ = v172;
                      if (v143)
                        operator delete(v143);
                      v143 = v177;
                      v137 = (unint64_t)__pa;
                      v135 = v331;
                      v138 = v335;
                    }
                    else
                    {
                      *v355.__end_ = (int)v140;
                      v172 = v171 + 1;
                    }
                    v355.__end_ = v172;
                    v179 = v354.__end_;
                    if (v354.__end_ >= v320)
                    {
                      v145 = v339;
                      v181 = v354.__end_ - v344;
                      v182 = v181 + 1;
                      if ((unint64_t)(v181 + 1) >> 62)
                      {
LABEL_421:
                        v357.__end_cap_.__value_ = v326;
                        v356.__end_cap_.__value_ = v324;
                        v357.__begin_ = v141;
                        v355.__end_cap_.__value_ = v322;
                        v356.__begin_ = v142;
                        v354.__end_cap_.__value_ = v320;
                        v355.__begin_ = v143;
                        v354.__begin_ = v344;
                        v353 = v318;
                        v351 = v145;
                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                      }
                      if (((char *)v320 - (char *)v344) >> 1 > v182)
                        v182 = ((char *)v320 - (char *)v344) >> 1;
                      if ((unint64_t)((char *)v320 - (char *)v344) >= 0x7FFFFFFFFFFFFFFCLL)
                        v183 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v183 = v182;
                      if (v183)
                        v183 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v183);
                      else
                        v184 = 0;
                      v185 = (int *)(v183 + 4 * v181);
                      *v185 = v149;
                      v180 = v185 + 1;
                      while (v179 != v344)
                      {
                        v186 = *--v179;
                        *--v185 = v186;
                      }
                      v320 = (int *)(v183 + 4 * v184);
                      v354.__end_ = v180;
                      if (v344)
                        operator delete(v344);
                      v344 = v185;
                      v138 = v335;
                      v145 = v339;
                      v137 = (unint64_t)__pa;
                      v135 = v331;
                    }
                    else
                    {
                      *v354.__end_ = v149;
                      v180 = v179 + 1;
                      v145 = v339;
                    }
                    v354.__end_ = v180;
                    v187 = v352;
                    if ((unint64_t)v352 >= v318)
                    {
                      v189 = ((char *)v352 - (char *)v145) >> 2;
                      v190 = v189 + 1;
                      if ((unint64_t)(v189 + 1) >> 62)
                      {
                        v357.__end_cap_.__value_ = v326;
                        v356.__end_cap_.__value_ = v324;
                        v357.__begin_ = v141;
                        v355.__end_cap_.__value_ = v322;
                        v356.__begin_ = v142;
                        v354.__end_cap_.__value_ = v320;
                        v355.__begin_ = v143;
                        v353 = v318;
                        v354.__begin_ = v344;
                        v351 = v145;
                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                      }
                      if ((uint64_t)(v318 - (_QWORD)v145) >> 1 > v190)
                        v190 = (uint64_t)(v318 - (_QWORD)v145) >> 1;
                      if (v318 - (unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL)
                        v191 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v191 = v190;
                      if (v191)
                        v191 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v191);
                      else
                        v192 = 0;
                      v193 = (float *)(v191 + 4 * v189);
                      *v193 = v153;
                      v188 = v193 + 1;
                      while (v187 != (float *)v145)
                      {
                        v194 = *((_DWORD *)v187-- - 1);
                        *((_DWORD *)v193-- - 1) = v194;
                      }
                      v318 = v191 + 4 * v192;
                      v352 = v188;
                      if (v145)
                        operator delete(v145);
                      v145 = (VNDisallowedList *)v193;
                      v137 = (unint64_t)__pa;
                      v135 = v331;
                      v144 = v344;
                      v138 = v335;
                    }
                    else
                    {
                      *v352 = v153;
                      v188 = v187 + 1;
                      v144 = v344;
                    }
                    v352 = v188;
                    v133 = v315;
                  }
LABEL_300:
                  v140 = (char *)v140 + 1;
                  v139 += v136;
                }
                while (v140 != (void *)v137);
                v357.__end_cap_.__value_ = v326;
                v356.__end_cap_.__value_ = v324;
                v357.__begin_ = v141;
                v355.__end_cap_.__value_ = v322;
                v356.__begin_ = v142;
                v354.__end_cap_.__value_ = v320;
                v355.__begin_ = v143;
                v353 = v318;
                v354.__begin_ = v144;
                v351 = v145;
              }
              ++v138;
            }
            while (v138 != v314);
          }
          v133 += 4 * v364;
          ++v316;
        }
        while (v316 != v309);
      }
      if ((int)((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2) > 0)
      {
        v195 = 0;
        v332 = 1.0 / (float)v309;
        v196 = ((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2);
        do
        {
          v197 = v356.__begin_[v195];
          v198 = v357.__begin_[v195];
          v199 = v355.__begin_[v195];
          v200 = v354.__begin_[v195];
          v201 = *((_DWORD *)v351 + v195);
          v202 = *(float **)(*(_QWORD *)(*(_QWORD *)(v312 + 536) + 24 * v308) + 24 * (int)v199);
          v204 = *v202;
          v203 = v202[1];
          v205 = 4 * v199;
          v206 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, 4 * v199);
          v207 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 1);
          v208 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 2);
          v345 = v207;
          v209 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 3);
          v340 = v203;
          v336 = v201;
          v210 = *(float **)(v312 + 464);
          v211 = *v210;
          v212 = v210[1];
          v213 = expf(v208 * v210[2]);
          v214 = expf(v209 * v210[3]);
          v215 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v215)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v370 = (unsigned __int8 *)(v215[3] + 24 * v200);
          v216 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, v370, (__int128 **)&v370);
          v217 = v216;
          v218 = (float)(v332 * (float)((float)(int)v197 + 0.5)) + (float)((float)(v204 * v206) * v211);
          v219 = (float)(v332 * (float)((float)(int)v198 + 0.5)) + (float)((float)(v340 * v345) * v212);
          v220 = v204 * v213;
          v221 = v340 * v214;
          v222 = v218 - (float)((float)(v204 * v213) * 0.5);
          v223 = v219 - (float)((float)(v340 * v214) * 0.5);
          v224 = *((_QWORD *)v216 + 6);
          v225 = *((_QWORD *)v216 + 7);
          if (v224 >= v225)
          {
            v227 = *((_QWORD *)v216 + 5);
            v228 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v224 - v227) >> 2);
            v229 = v228 + 1;
            if (v228 + 1 > 0xCCCCCCCCCCCCCCCLL)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            v230 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v225 - v227) >> 2);
            if (2 * v230 > v229)
              v229 = 2 * v230;
            if (v230 >= 0x666666666666666)
              v231 = 0xCCCCCCCCCCCCCCCLL;
            else
              v231 = v229;
            if (v231)
              v231 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v231);
            else
              v232 = 0;
            v233 = v231 + 20 * v228;
            *(_DWORD *)v233 = v336;
            *(float *)(v233 + 4) = v222;
            *(float *)(v233 + 8) = v223;
            *(float *)(v233 + 12) = v221;
            *(float *)(v233 + 16) = v220;
            v235 = (char *)*((_QWORD *)v217 + 5);
            v234 = (char *)*((_QWORD *)v217 + 6);
            v236 = v233;
            if (v234 != v235)
            {
              do
              {
                v237 = *(_OWORD *)(v234 - 20);
                *(_DWORD *)(v236 - 4) = *((_DWORD *)v234 - 1);
                *(_OWORD *)(v236 - 20) = v237;
                v236 -= 20;
                v234 -= 20;
              }
              while (v234 != v235);
              v234 = (char *)*((_QWORD *)v217 + 5);
            }
            v226 = v233 + 20;
            *((_QWORD *)v217 + 5) = v236;
            *((_QWORD *)v217 + 6) = v233 + 20;
            *((_QWORD *)v217 + 7) = v231 + 20 * v232;
            if (v234)
              operator delete(v234);
          }
          else
          {
            *(_DWORD *)v224 = v336;
            *(float *)(v224 + 4) = v222;
            *(float *)(v224 + 8) = v223;
            *(float *)(v224 + 12) = v221;
            v226 = v224 + 20;
            *(float *)(v224 + 16) = v220;
          }
          *((_QWORD *)v217 + 6) = v226;
          ++v195;
        }
        while (v195 != v196);
      }
      if (v351)
        operator delete(v351);
      v112 = v312;
      if (v354.__begin_)
        operator delete(v354.__begin_);
      if (v355.__begin_)
        operator delete(v355.__begin_);
      if (v356.__begin_)
        operator delete(v356.__begin_);
      if (v357.__begin_)
        operator delete(v357.__begin_);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v358);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v359);
      v128 = v308 + 1;
    }
    while ((unint64_t)(v308 + 1) < *(_QWORD *)(v312 + 432));
  }
  if (v366)
  {
    v367 = v366;
    operator delete(v366);
  }
LABEL_337:
  v359.__r_.__value_.__r.__words[0] = (std::string::size_type)&v369;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v359);
  if (*(_BYTE *)(v112 + 460))
  {
    v238 = (char **)v349;
    if ((_QWORD)v349)
    {
      while (2)
      {
        v239 = (uint64_t)v238[5];
        v240 = (int *)v238[6];
        v241 = v238 + 5;
        if (v240 == (int *)v239)
          goto LABEL_389;
        v359.__r_.__value_.__r.__words[0] = (std::string::size_type)vision::mod::sortDetectionsByConfidence;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(std::tuple<float,_Geometry2D_rect2D_>,std::tuple<float,_Geometry2D_rect2D_>),std::tuple<float,_Geometry2D_rect2D_>*,false>(v239, v240, (uint64_t (**)(__int128 *, __int128 *))&v359, 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v240 - v239) >> 2)), 1);
        v243 = v238[5];
        v242 = v238[6];
        memset(&v359, 0, sizeof(v359));
        v244 = v242 - v243;
        __pb = v238;
        if (!v244)
        {
          v341 = 0;
          v250 = 0;
          goto LABEL_385;
        }
        v245 = 0xCCCCCCCCCCCCCCCDLL * (v244 >> 2);
        std::vector<BOOL>::__vallocate[abi:ne180100](&v359, v245);
        v246 = v359.__r_.__value_.__l.__size_;
        v247 = v359.__r_.__value_.__l.__size_ + v245;
        v359.__r_.__value_.__l.__size_ += v245;
        if (v246)
        {
          v248 = v247 - 1;
          if (((v247 - 1) ^ (v246 - 1)) <= 0x3F)
          {
            v249 = v359.__r_.__value_.__r.__words[0];
LABEL_350:
            *(_QWORD *)&v358[0] = v249 + 8 * (v246 >> 6);
            DWORD2(v358[0]) = v246 & 0x3F;
            std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)v358, v245);
            v341 = 0;
            v346 = 0;
            v250 = 0;
            v253 = 0;
            if (v245 <= 1)
              v254 = 1;
            else
              v254 = v245;
            v255 = 24;
            v256 = 1;
            v333 = v254;
            v337 = v238 + 5;
            do
            {
              if (((*(_QWORD *)(v359.__r_.__value_.__r.__words[0] + ((v253 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v253) & 1) != 0)
              {
                ++v253;
              }
              else
              {
                v257 = (uint64_t)&(*v241)[20 * v253];
                if (v250 >= (unint64_t)v346)
                {
                  v259 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v250 - (_QWORD)v341) >> 2) + 1;
                  if (v259 > 0xCCCCCCCCCCCCCCCLL)
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  if (0x999999999999999ALL * ((v346 - (_BYTE *)v341) >> 2) > v259)
                    v259 = 0x999999999999999ALL * ((v346 - (_BYTE *)v341) >> 2);
                  if (0xCCCCCCCCCCCCCCCDLL * ((v346 - (_BYTE *)v341) >> 2) >= 0x666666666666666)
                    v260 = 0xCCCCCCCCCCCCCCCLL;
                  else
                    v260 = v259;
                  if (v260)
                    v260 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v260);
                  else
                    v261 = 0;
                  v262 = *(_OWORD *)v257;
                  v263 = v260 + 4 * ((uint64_t)(v250 - (_QWORD)v341) >> 2);
                  *(_DWORD *)(v263 + 16) = *(_DWORD *)(v257 + 16);
                  *(_OWORD *)v263 = v262;
                  if ((VNDisallowedList *)v250 == v341)
                  {
                    v265 = (VNDisallowedList *)(v260 + 4 * ((uint64_t)(v250 - (_QWORD)v341) >> 2));
                  }
                  else
                  {
                    v264 = v260 + 4 * ((uint64_t)(v250 - (_QWORD)v341) >> 2);
                    do
                    {
                      v265 = (VNDisallowedList *)(v264 - 20);
                      v266 = *(_OWORD *)(v250 - 20);
                      *(_DWORD *)(v264 - 4) = *(_DWORD *)(v250 - 4);
                      *(_OWORD *)(v264 - 20) = v266;
                      v250 -= 20;
                      v264 -= 20;
                    }
                    while ((VNDisallowedList *)v250 != v341);
                  }
                  v346 = (_BYTE *)(v260 + 20 * v261);
                  v250 = v263 + 20;
                  if (v341)
                    operator delete(v341);
                  v341 = v265;
                }
                else
                {
                  v258 = *(_OWORD *)v257;
                  *(_DWORD *)(v250 + 16) = *(_DWORD *)(v257 + 16);
                  *(_OWORD *)v250 = v258;
                  v250 += 20;
                }
                v267 = *v241;
                v358[0] = *(_OWORD *)&(*v241)[20 * v253++ + 4];
                if (v245 > v253)
                {
                  v268 = v359.__r_.__value_.__r.__words[0];
                  v269 = &v267[v255];
                  v270 = v256;
                  do
                  {
                    if ((*(_QWORD *)(v268 + 8 * (v270 >> 6)) & (1 << v270)) == 0)
                    {
                      *(_OWORD *)&v369.__r_.__value_.__l.__data_ = *(_OWORD *)v269;
                      v271 = *((_QWORD *)&v358[0] + 1);
                      v272 = v369.__r_.__value_.__l.__size_;
                      Geometry2D_intersectRect2D((float *)v358, (float *)&v369);
                      v275 = (float)((float)(*((float *)&v272 + 1) * *(float *)&v272)
                                   + (float)(*((float *)&v271 + 1) * *(float *)&v271))
                           - (float)(v274 * v273);
                      v276 = (float)(v274 * v273) / v275;
                      if (v275 <= 0.0)
                        v276 = NAN;
                      if (v276 > v6)
                        *(_QWORD *)(v268 + 8 * (v270 >> 6)) |= 1 << v270;
                    }
                    ++v270;
                    v269 += 20;
                  }
                  while (v245 > v270);
                }
                v254 = v333;
                v241 = v337;
              }
              ++v256;
              v255 += 20;
            }
            while (v253 != v254);
LABEL_385:
            v238 = __pb;
            __pb[6] = __pb[5];
            std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v241, (__int128 *)v341, (__int128 *)v250, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v250 - (_QWORD)v341) >> 2));
            if (v341)
              operator delete(v341);
            if (v359.__r_.__value_.__r.__words[0])
              operator delete(v359.__r_.__value_.__l.__data_);
LABEL_389:
            v238 = (char **)*v238;
            if (!v238)
              goto LABEL_390;
            continue;
          }
        }
        else
        {
          v248 = v247 - 1;
        }
        break;
      }
      v249 = v359.__r_.__value_.__r.__words[0];
      v251 = v248 >> 6;
      if (v247 >= 0x41)
        v252 = v251;
      else
        v252 = 0;
      *(_QWORD *)(v359.__r_.__value_.__r.__words[0] + 8 * v252) = 0;
      goto LABEL_350;
    }
  }
LABEL_390:
  v277 = *((_QWORD *)&v349 + 1);
  kdebug_trace();
  v347 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v277);
  if (v277)
  {
    if (v307 == 1 || v307 == 3737841667)
    {
      std::string::basic_string[abi:ne180100]<0>(&v359, "fruit");
      v278 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(&v348, (unsigned __int8 *)&v359);
      v279 = (__int128 **)v278;
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v359.__r_.__value_.__l.__data_);
        if (!v279)
          goto LABEL_401;
      }
      else if (!v278)
      {
        goto LABEL_401;
      }
      std::string::basic_string[abi:ne180100]<0>(&v359, "vegetable");
      *(_QWORD *)&v358[0] = &v359;
      v280 = (char **)std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (__int128 **)v358);
      if (v280 != (char **)v279)
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v280 + 5, v279[5], v279[6], 0xCCCCCCCCCCCCCCCDLL * (((char *)v279[6] - (char *)v279[5]) >> 2));
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v359.__r_.__value_.__l.__data_);
LABEL_401:
      std::string::basic_string[abi:ne180100]<0>(&v359, "fish");
      v281 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(&v348, (unsigned __int8 *)&v359);
      v282 = (__int128 **)v281;
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v359.__r_.__value_.__l.__data_);
        if (!v282)
          goto LABEL_409;
      }
      else if (!v281)
      {
        goto LABEL_409;
      }
      std::string::basic_string[abi:ne180100]<0>(&v359, "seafood");
      *(_QWORD *)&v358[0] = &v359;
      v283 = (char **)std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (__int128 **)v358);
      if (v283 != (char **)v282)
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v283 + 5, v282[5], v282[6], 0xCCCCCCCCCCCCCCCDLL * (((char *)v282[6] - (char *)v282[5]) >> 2));
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v359.__r_.__value_.__l.__data_);
    }
LABEL_409:
    objc_msgSend(v305, "disallowedList");
    v342 = (VNDisallowedList *)objc_claimAutoreleasedReturnValue();
    for (n = (uint64_t *)v349; n; n = (uint64_t *)*n)
    {
      if (n[6] != n[5])
      {
        v285 = objc_alloc(MEMORY[0x1E0CB3940]);
        v286 = n + 2;
        if (*((char *)n + 39) < 0)
          v286 = (_QWORD *)*v286;
        v287 = (NSString *)objc_msgSend(v285, "initWithUTF8String:", v286);
        if ((_isAcceptableClassificationIdentifier(v287, v342) & 1) != 0)
        {
          v289 = (float *)n[5];
          v288 = (int *)n[6];
          while (v289 != (float *)v288)
          {
            v372.origin.x = v289[1];
            v372.size.height = v289[3];
            v372.size.width = v289[4];
            v372.origin.y = 1.0 - (v289[2] + v372.size.height);
            v374.origin.x = 0.0;
            v374.origin.y = 0.0;
            v374.size.width = 1.0;
            v374.size.height = 1.0;
            v373 = CGRectIntersection(v372, v374);
            x = v373.origin.x;
            y = v373.origin.y;
            width = v373.size.width;
            height = v373.size.height;
            v294 = *v289;
            v295 = [VNClassificationObservation alloc];
            *(float *)&v296 = v294;
            v297 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v295, "initWithOriginatingRequestSpecifier:identifier:confidence:", v310, v287, v296);
            v298 = [VNRecognizedObjectObservation alloc];
            v371[0] = v297;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v371, 1);
            v299 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v300 = v294;
            v301 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v298, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v310, v299, 0, 0, x, y, width, height, v300);

            objc_msgSend(v347, "addObject:", v301);
            v289 += 5;
          }
        }

      }
    }
    v302 = &__block_literal_global_91_33192;
    objc_msgSend(v347, "sortWithOptions:usingComparator:", 16, &__block_literal_global_91_33192);

  }
  kdebug_trace();
  objc_msgSend(v304, "receiveObservations:", v347);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)&v348);

  return v347;
}

- (id)_processLastAnalysisForVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  _DWORD *i;
  _DWORD *v11;
  int v12;
  id v13;
  _DWORD *v14;
  void *v15;
  VNClassificationObservation *v16;
  double v17;
  VNClassificationObservation *v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void **v24;
  id v25;
  _BYTE v26[184];
  void *v27;
  std::__shared_weak_count *v28;

  v5 = a2;
  objc_msgSend(v5, "observationsRecipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingRequestSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestClassCode");
  objc_msgSend(v7, "requestRevision");
  kdebug_trace();
  -[VNImageAnalyzerMultiDetector _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:](&v27, a1, a3);
  v8 = v27;
  if (v27)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v26, *(_QWORD *)(a1 + 112));
    v25 = 0;
    vision::mod::ImageAnalyzer_CustomClassifier::performInference(&v24, (uint64_t)v8, (uint64_t)v26, &v25);
    v9 = v24;
    if (v24)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((_BYTE *)v24[1] - (_BYTE *)*v24) >> 5);
      v11 = *v9;
      for (i = v9[1]; v11 != i; v11 += 8)
      {
        v12 = v11[6];
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = v11;
        if (*((char *)v11 + 23) < 0)
          v14 = *(_DWORD **)v11;
        v15 = (void *)objc_msgSend(v13, "initWithUTF8String:", v14);
        v16 = [VNClassificationObservation alloc];
        LODWORD(v17) = v12;
        v18 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v16, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, v15, v17);
        objc_msgSend(v8, "addObject:", v18);

      }
      v19 = &__block_literal_global_88;
      objc_msgSend(v8, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

      kdebug_trace();
      objc_msgSend(v6, "receiveObservations:", v8);
    }
    else if (a3)
    {
      VNErrorForCVMLStatus(v25);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100](&v24);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)v26);
  }
  v20 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v8;
}

- (id)_processLastAnalysisForSignificantEventConfiguration:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  _DWORD *i;
  _DWORD *v11;
  id v12;
  _DWORD *v13;
  NSString *v14;
  int v15;
  VNClassificationObservation *v16;
  double v17;
  VNClassificationObservation *v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void **v24;
  id v25;
  _BYTE v26[184];
  void *v27;
  std::__shared_weak_count *v28;

  v5 = a2;
  objc_msgSend(v5, "observationsRecipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingRequestSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestClassCode");
  objc_msgSend(v7, "requestRevision");
  kdebug_trace();
  -[VNImageAnalyzerMultiDetector _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:](&v27, a1, a3);
  v8 = v27;
  if (v27)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v26, *(_QWORD *)(a1 + 112));
    v25 = 0;
    vision::mod::ImageAnalyzer_CustomClassifier::performInference(&v24, (uint64_t)v8, (uint64_t)v26, &v25);
    v9 = v24;
    if (v24)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((_BYTE *)v24[1] - (_BYTE *)*v24) >> 5);
      v11 = *v9;
      for (i = v9[1]; v11 != i; v11 += 8)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        v13 = v11;
        if (*((char *)v11 + 23) < 0)
          v13 = *(_DWORD **)v11;
        v14 = (NSString *)objc_msgSend(v12, "initWithUTF8String:", v13);
        if ((_isAcceptableClassificationIdentifier(v14, 0) & 1) != 0)
        {
          v15 = v11[6];
          v16 = [VNClassificationObservation alloc];
          LODWORD(v17) = v15;
          v18 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v16, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, v14, v17);
          objc_msgSend(v8, "addObject:", v18);

        }
      }
      v19 = &__block_literal_global_88;
      objc_msgSend(v8, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

      kdebug_trace();
      objc_msgSend(v6, "receiveObservations:", v8);
    }
    else if (a3)
    {
      VNErrorForCVMLStatus(v25);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100](&v24);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)v26);
  }
  v20 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v8;
}

- (id)_processLastAnalysisForCityNatureConfiguration:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  _DWORD *i;
  _DWORD *v11;
  id v12;
  _DWORD *v13;
  NSString *v14;
  int v15;
  VNClassificationObservation *v16;
  double v17;
  VNClassificationObservation *v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void **v24;
  id v25;
  _BYTE v26[184];
  void *v27;
  std::__shared_weak_count *v28;

  v5 = a2;
  objc_msgSend(v5, "observationsRecipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingRequestSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestClassCode");
  objc_msgSend(v7, "requestRevision");
  kdebug_trace();
  -[VNImageAnalyzerMultiDetector _cityNatureCustomClassifierAndReturnError:](&v27, a1, a3);
  v8 = v27;
  if (v27)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v26, *(_QWORD *)(a1 + 112));
    v25 = 0;
    vision::mod::ImageAnalyzer_CustomClassifier::performInference(&v24, (uint64_t)v8, (uint64_t)v26, &v25);
    v9 = v24;
    if (v24)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((_BYTE *)v24[1] - (_BYTE *)*v24) >> 5);
      v11 = *v9;
      for (i = v9[1]; v11 != i; v11 += 8)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        v13 = v11;
        if (*((char *)v11 + 23) < 0)
          v13 = *(_DWORD **)v11;
        v14 = (NSString *)objc_msgSend(v12, "initWithUTF8String:", v13);
        if ((_isAcceptableClassificationIdentifier(v14, 0) & 1) != 0)
        {
          v15 = v11[6];
          v16 = [VNClassificationObservation alloc];
          LODWORD(v17) = v15;
          v18 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v16, "initWithOriginatingRequestSpecifier:identifier:confidence:", v7, v14, v17);
          objc_msgSend(v8, "addObject:", v18);

        }
      }
      v19 = &__block_literal_global_88;
      objc_msgSend(v8, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

      kdebug_trace();
      objc_msgSend(v6, "receiveObservations:", v8);
    }
    else if (a3)
    {
      VNErrorForCVMLStatus(v25);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    std::unique_ptr<std::vector<std::pair<std::string,float>>>::reset[abi:ne180100](&v24);
    vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)v26);
  }
  v20 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v8;
}

- (id)_processLastAnalysisForPhotosAdjustmentsConfiguration:(_QWORD *)a3 error:
{
  void *v5;
  void *v6;
  id v7;
  uint64_t *i;
  _QWORD *v9;
  char v10;
  char *v11;
  uint64_t v12;
  void **v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  _DWORD *v19;
  _DWORD *v20;
  void *v21;
  char *v22;
  int v23;
  void *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  void *v28;
  void *v29;
  VN1vLyVSh30UQ26TGBoV8MHv *v30;
  void *v31;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[16];
  uint64_t *v38;
  uint64_t v39;
  void *__p[2];
  unsigned __int8 v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v34 = a2;
  objc_msgSend(*(id *)(a1 + 80), "sliderNetBlobNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v33 = v5;
    v35 = objc_msgSend(v5, "length");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    vision::mod::ImageAnalyzer::getSlidersAdjustments((vision::mod::ImageAnalyzer *)v37, *(_QWORD **)(a1 + 112));
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    v36 = (void *)objc_msgSend(v7, "initWithCapacity:", v39);
    for (i = v38; i; i = (uint64_t *)*i)
    {
      v9 = i + 2;
      v10 = *((_BYTE *)i + 39);
      if (v10 < 0)
      {
        v11 = (char *)i[2];
        v12 = i[3];
      }
      else
      {
        v11 = (char *)(i + 2);
        v12 = *((unsigned __int8 *)i + 39);
      }
      if ((v41 & 0x80u) == 0)
        v13 = __p;
      else
        v13 = (void **)__p[0];
      if ((v41 & 0x80u) == 0)
        v14 = v41;
      else
        v14 = (int64_t)__p[1];
      v15 = v35;
      if (v14)
      {
        if (v12 >= v14)
        {
          v22 = &v11[v12];
          v23 = *(char *)v13;
          v24 = v11;
          do
          {
            v25 = v12 - v14;
            if (v25 == -1)
              break;
            v26 = (char *)memchr(v24, v23, v25 + 1);
            if (!v26)
              break;
            v27 = v26;
            if (!memcmp(v26, v13, v14))
            {
              if (v27 != v22)
              {
                v15 = v35;
                if (v27 - v11 != -1)
                  goto LABEL_15;
              }
              break;
            }
            v24 = v27 + 1;
            v12 = v22 - (v27 + 1);
          }
          while (v12 >= v14);
        }
        v15 = 0;
      }
LABEL_15:
      if (v10 < 0)
        v9 = (_QWORD *)*v9;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (char *)v9 + v15);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (i[6] - i[5]) >> 2);
      v19 = (_DWORD *)i[5];
      v20 = (_DWORD *)i[6];
      while (v19 != v20)
      {
        LODWORD(v18) = *v19;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v21);

        ++v19;
      }
      objc_msgSend(v36, "setObject:forKey:", v17, v16);

    }
    objc_msgSend(v34, "observationsRecipient");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "originatingRequestSpecifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[VN1vLyVSh30UQ26TGBoV8MHv initWithOriginatingRequestSpecifier:adjustments:]([VN1vLyVSh30UQ26TGBoV8MHv alloc], "initWithOriginatingRequestSpecifier:adjustments:", v29, v36);
    v42[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "receiveObservations:", v31);

    std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)v37);
    if ((char)v41 < 0)
      operator delete(__p[0]);
  }
  else
  {
    if (!a3)
    {
      v31 = 0;
      goto LABEL_36;
    }
    v33 = 0;
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("adjustments prefix is not available"));
    v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v33;
LABEL_36:

  return v31;
}

- (id)_processSaliencyTensor:(double)a3 regionOfInterest:(double)a4 originalImageSize:(double)a5 options:(double)a6 saliencyConfiguration:(uint64_t)a7 saliencyGeneratorType:(int8x16_t *)a8 startCode:(void *)a9 finishCode:(void *)a10 qosClass:(void *)a11 warningRecorder:(uint64_t)a12 error:(uint64_t)a13
{
  id v25;
  void *v26;
  CVPixelBufferRef DeepCopyCVPixelBufferFromVImageBuffer;
  __CVBuffer *v28;
  void *v29;
  void *v30;
  VNImageBuffer *v31;
  void *v32;
  double v34;
  void *v35;
  VNSaliencyImageObservation *v36;
  void *v37;
  VNImageBuffer *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  unsigned int v46;
  _OWORD v47[2];
  int v48;
  VNSaliencyImageObservation *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v45 = a9;
  v25 = a10;
  v44 = a11;
  v41 = v25;
  v42 = a15;
  objc_msgSend(v25, "observationsRecipient");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "originatingRequestSpecifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "requestClassCode");
  objc_msgSend(v26, "requestRevision");
  kdebug_trace();
  v48 = 0;
  memset(v47, 0, sizeof(v47));
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)v47, a8, &v48);
  v46 = 0;
  DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)v47, v48, (int *)&v46);
  if (DeepCopyCVPixelBufferFromVImageBuffer)
  {
    v28 = DeepCopyCVPixelBufferFromVImageBuffer;
    +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v45, a16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v45);
      objc_msgSend(v29, "detectorOfType:configuredWithOptions:error:", v44, v30, a16);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v31 = [VNImageBuffer alloc];
        v39 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](v31, "initWithCVPixelBuffer:orientation:options:session:", v28, 1, MEMORY[0x1E0C9AA70], v29);
        v50[0] = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        objc_msgSend(v30, "setObject:forKeyedSubscript:", v26, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
        if (objc_msgSend(v26, "observationProvidesBoundsNormalizedToROI"))
          v34 = 0.0;
        else
          v34 = a1;
        objc_msgSend(v40, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a14, v30, 0, a16, 0, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = -[VNSaliencyImageObservation initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:]([VNSaliencyImageObservation alloc], "initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:", v26, v28, v35, a3 * (double)(unint64_t)a5, a4 * (double)(unint64_t)a6);
          kdebug_trace();
          v49 = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "receiveObservations:", v37);

        }
        else
        {
          v37 = 0;
        }

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

    CVPixelBufferRelease(v28);
  }
  else if (a16)
  {
    +[VNError errorForOSStatus:localizedDescription:](VNError, "errorForOSStatus:localizedDescription:", v46, CFSTR("failed to create saliency heat map image"));
    v37 = 0;
    *a16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)_potentialLandmarksCustomClassifierAndReturnError:(_QWORD *)a3
{
  uint64_t v5;
  void *v7;
  std::string *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *v15;
  std::__shared_weak_count *v16;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 200);
  if (v5)
    goto LABEL_13;
  objc_msgSend(*(id *)(a2 + 80), "potentialLandmarksCustomClassifierDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:](&v15, a2, v7, a3);

  v8 = v15;
  if (v15)
  {
    v9 = v16;
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100]((_QWORD *)(a2 + 200), (uint64_t)v15, (uint64_t)v16);
    if (!v9)
      goto LABEL_11;
LABEL_7:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_11;
  }
  *a1 = 0;
  a1[1] = 0;
  v9 = v16;
  if (v16)
    goto LABEL_7;
LABEL_11:
  if (!v8)
    return;
  v5 = *(_QWORD *)(a2 + 200);
LABEL_13:
  v12 = *(_QWORD *)(a2 + 208);
  *a1 = v5;
  a1[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
}

- (void)_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:(_QWORD *)a3
{
  uint64_t v5;
  void *v7;
  std::string *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *v15;
  std::__shared_weak_count *v16;

  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  v5 = *(_QWORD *)(a2 + 184);
  if (v5)
    goto LABEL_13;
  objc_msgSend(*(id *)(a2 + 80), "VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageAnalyzerMultiDetector _loadCustomClassifierWithDescriptor:error:](&v15, a2, v7, a3);

  v8 = v15;
  if (v15)
  {
    v9 = v16;
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100]((_QWORD *)(a2 + 184), (uint64_t)v15, (uint64_t)v16);
    if (!v9)
      goto LABEL_11;
LABEL_7:
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    goto LABEL_11;
  }
  *a1 = 0;
  a1[1] = 0;
  v9 = v16;
  if (v16)
    goto LABEL_7;
LABEL_11:
  if (!v8)
    return;
  v5 = *(_QWORD *)(a2 + 184);
LABEL_13:
  v12 = *(_QWORD *)(a2 + 192);
  *a1 = v5;
  a1[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
}

- (uint64_t)_processSceneIdentifier:(void *)a3 withConfidence:(void *)a4 disallowedList:(void *)a5 operationPoints:(void *)a6 originatingRequestSpecifier:(unint64_t *)a7 observationsArray:(uint64_t)a8 optionalTopN:(float)a9 error:
{
  id v17;
  VNDisallowedList *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  float v26;
  float v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  float v37;
  float v38;
  BOOL v39;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  void *v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  id v50;
  float v51;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  if (!a1)
  {
    v29 = 0;
    goto LABEL_39;
  }
  if ((_isAcceptableClassificationIdentifier((NSString *)v17, v18) & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __167__VNImageAnalyzerMultiDetector__processSceneIdentifier_withConfidence_disallowedList_operationPoints_originatingRequestSpecifier_observationsArray_optionalTopN_error___block_invoke;
    aBlock[3] = &unk_1E4547230;
    v48 = v19;
    v49 = v17;
    v50 = v20;
    v51 = a9;
    v22 = _Block_copy(aBlock);
    if (a7)
    {
      v45 = *a7;
      v46 = v22;
      v23 = objc_msgSend(v21, "count");
      v24 = (void (**)(_QWORD, _QWORD))v46;
      if (v23)
      {
        objc_msgSend(v21, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "confidence");
        if (v26 < a9)
        {
          objc_msgSend(v21, "firstObject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 >= 3 && (objc_msgSend(v44, "confidence"), v27 >= a9))
          {
            v41 = v25;
            v42 = v20;
            v43 = v19;
            v31 = flsl(v23);
            v32 = 0;
            v33 = 0;
            v34 = 2 << v31;
            do
            {
              if (v34 >= 0)
                v35 = v34;
              else
                v35 = v34 + 1;
              v28 = v32 + (v35 >> 1);
              if (v28 < v23)
              {
                objc_msgSend(v21, "objectAtIndex:", v32 + (v35 >> 1));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "confidence");
                v38 = v37;

                if (v38 >= a9)
                {
                  if (v38 <= a9)
                    goto LABEL_35;
                  v33 = -1;
                  v32 += v35 >> 1;
                }
                else
                {
                  v33 = 1;
                }
              }
              v39 = v34 <= 1;
              v34 = v35 >> 1;
            }
            while (!v39);
            v28 = v32 + (v33 >> 31);
LABEL_35:
            v20 = v42;
            v19 = v43;
            v24 = (void (**)(_QWORD, _QWORD))v46;
            v25 = v41;
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_36;
          }
          else
          {
            v28 = 0;
          }
          v24[2](v24, a8);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
LABEL_37:

            goto LABEL_38;
          }
          objc_msgSend(v21, "insertObject:atIndex:", v29, v28);
          if (v23 + 1 > v45)
            objc_msgSend(v21, "removeObjectAtIndex:", v23);

LABEL_36:
          v29 = 1;
          goto LABEL_37;
        }
        if (v23 < v45)
        {
          (*((void (**)(void *, uint64_t))v46 + 2))(v46, a8);
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v44 = (void *)v30;
            objc_msgSend(v21, "addObject:");
            goto LABEL_36;
          }
          goto LABEL_22;
        }
LABEL_21:
        v29 = 1;
LABEL_38:

        goto LABEL_39;
      }
      (*((void (**)(void *, uint64_t))v46 + 2))(v46, a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
LABEL_15:
        objc_msgSend(v21, "addObject:", v25);
        goto LABEL_21;
      }
    }
    else
    {
      v24 = (void (**)(_QWORD, _QWORD))v22;
      (*((void (**)(void *, uint64_t))v22 + 2))(v22, a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        goto LABEL_15;
    }
LABEL_22:
    v29 = 0;
    goto LABEL_38;
  }
  v29 = 1;
LABEL_39:

  return v29;
}

VNClassificationObservation *__167__VNImageAnalyzerMultiDetector__processSceneIdentifier_withConfidence_disallowedList_operationPoints_originatingRequestSpecifier_observationsArray_optionalTopN_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  id v5;
  VNClassificationObservation *v6;
  VNClassificationObservation *v7;
  double v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "getClassificationMetrics:forClassificationIdentifier:error:", &v10, *(_QWORD *)(a1 + 40), a2);
    v5 = v10;
    v6 = 0;
    if (!v4)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
  v7 = [VNClassificationObservation alloc];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  v6 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v7, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v5, v8);
LABEL_6:

  return v6;
}

- (uint64_t)_populateLeafSceneObservations:(void *)a3 hierarchySceneObservations:(void *)a4 fromLastAnalysisForSceneConfiguration:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  float *v25;
  float v26;
  id v27;
  uint64_t *v28;
  void *v29;
  char v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  void *v50;
  int v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider *v65;
  void *v66;
  void *v67;
  id v68;
  _QWORD aBlock[5];
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  uint64_t v77;
  float v78;
  BOOL v79;
  __int128 v80;
  uint64_t v81;
  unsigned __int8 v82;
  __int128 v83;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "observationsRecipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originatingRequestSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v12;
  objc_msgSend(v12, "requestClassCode");
  v13 = objc_msgSend(v12, "requestRevision");
  kdebug_trace();
  objc_msgSend(v10, "minimumConfidence");
  v15 = v14;
  v81 = 0;
  v16 = objc_msgSend(v10, "maximumLeafLabels");
  v17 = v16 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v16 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFFFLL)
    v18 = -1;
  else
    v18 = v16;
  v81 = v18;
  v65 = -[_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider initWithOperationPointsCache:originatingRequestSpecifier:]([_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider alloc], "initWithOperationPointsCache:originatingRequestSpecifier:", *(_QWORD *)(a1 + 152), v12);
  -[_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider operationPointsAndReturnError:](v65, "operationPointsAndReturnError:", a5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v61 = v13;
    v62 = v9;
    v63 = v8;
    objc_msgSend(v10, "disallowedList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v20 = 0;
    else
      v20 = (unint64_t *)&v81;
    v68 = v19;
    v21 = v12;
    v22 = v67;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VNImageAnalyzerMultiDetector _lastAnalysisSceneClassifications](&v83, (os_unfair_lock_s *)a1);
    v25 = *(float **)v83;
    v24 = *(uint64_t **)(v83 + 8);
    if (*(uint64_t **)v83 == v24)
    {
LABEL_15:
      v64 = v23;
    }
    else
    {
      while (1)
      {
        if (!*((_BYTE *)v25 + 28))
        {
          v26 = v25[6];
          if (v26 >= v15)
          {
            v27 = objc_alloc(MEMORY[0x1E0CB3940]);
            v28 = (uint64_t *)v25;
            if (*((char *)v25 + 23) < 0)
              v28 = *(uint64_t **)v25;
            v29 = (void *)objc_msgSend(v27, "initWithUTF8String:", v28);
            v30 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](a1, v29, v68, v22, v21, v23, v20, (uint64_t)a5, v26);

            if ((v30 & 1) == 0)
              break;
          }
        }
        v25 += 8;
        if (v25 == (float *)v24)
          goto LABEL_15;
      }
      v64 = 0;
    }
    v31 = (std::__shared_weak_count *)*((_QWORD *)&v83 + 1);
    v9 = v62;
    v8 = v63;
    v12 = v66;
    if (*((_QWORD *)&v83 + 1))
    {
      v32 = (unint64_t *)(*((_QWORD *)&v83 + 1) + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }

    v34 = v64;
    if (!v64)
    {
      v55 = 0;
LABEL_63:

      goto LABEL_64;
    }
    objc_msgSend(v63, "addObjectsFromArray:", v64);
    v35 = *(_QWORD *)(a1 + 96);
    v36 = *(std::__shared_weak_count **)(a1 + 104);
    *(_QWORD *)&v83 = v35;
    *((_QWORD *)&v83 + 1) = v36;
    if (v36)
    {
      p_shared_owners = (unint64_t *)&v36->__shared_owners_;
      do
        v38 = __ldxr(p_shared_owners);
      while (__stxr(v38 + 1, p_shared_owners));
    }
    objc_msgSend(v10, "customHierarchy");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
      goto LABEL_38;
    if (objc_msgSend(v39, "requestRevision") == v61)
    {
      objc_msgSend(v40, "hierarchicalModelAndReturnError:", a5);
      v41 = v80;
      v80 = 0uLL;
      v83 = v41;
      if (v36)
      {
        v42 = (unint64_t *)&v36->__shared_owners_;
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        if (!v43)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }
      if (*((_QWORD *)&v80 + 1))
      {
        v44 = (unint64_t *)(*((_QWORD *)&v80 + 1) + 8);
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v80 + 1) + 16))(*((_QWORD *)&v80 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v80 + 1));
        }
      }
      v35 = v83;
      v34 = v64;
      if ((_QWORD)v83)
      {
LABEL_38:

        v46 = objc_msgSend(v10, "maximumHierarchicalLabels");
        v47 = 0x7FFFFFFFLL;
        if (v46 <= 0x7FFFFFFE)
          v47 = v46;
        if (!v47)
          goto LABEL_51;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3321888768;
        aBlock[2] = __134__VNImageAnalyzerMultiDetector__populateLeafSceneObservations_hierarchySceneObservations_fromLastAnalysisForSceneConfiguration_error___block_invoke;
        aBlock[3] = &unk_1E453C0C0;
        aBlock[4] = a1;
        v75 = v35;
        v76 = (std::__shared_weak_count *)*((_QWORD *)&v83 + 1);
        if (*((_QWORD *)&v83 + 1))
        {
          v48 = (unint64_t *)(*((_QWORD *)&v83 + 1) + 8);
          do
            v49 = __ldxr(v48);
          while (__stxr(v49 + 1, v48));
        }
        v79 = v46 > 0x7FFFFFFE;
        v77 = v47;
        v78 = v15;
        v71 = v68;
        v72 = v21;
        v73 = v22;
        v74 = v62;
        v50 = _Block_copy(aBlock);
        v51 = VNExecuteBlock(v50, (uint64_t)a5);
        if ((v51 & 1) == 0)
          v82 = 0;

        v52 = v76;
        if (!v76)
          goto LABEL_50;
        v53 = (unint64_t *)&v76->__shared_owners_;
        do
          v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (v54)
        {
LABEL_50:
          if (!v51)
            goto LABEL_57;
          goto LABEL_51;
        }
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
        if (v51)
        {
LABEL_51:
          kdebug_trace();
          v82 = 1;
        }
LABEL_57:
        v57 = (std::__shared_weak_count *)*((_QWORD *)&v83 + 1);
        v12 = v66;
        if (*((_QWORD *)&v83 + 1))
        {
          v58 = (unint64_t *)(*((_QWORD *)&v83 + 1) + 8);
          do
            v59 = __ldaxr(v58);
          while (__stlxr(v59 - 1, v58));
          if (!v59)
          {
            ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
            std::__shared_weak_count::__release_weak(v57);
          }
        }
        v55 = v82;
        goto LABEL_63;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("custom hierarchy created for revision %lu cannot be used with a detector for revision %lu"), objc_msgSend(v40, "requestRevision"), v61);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v56);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v82 = 0;

    goto LABEL_57;
  }
  v55 = 0;
LABEL_64:

  return v55;
}

BOOL __134__VNImageAnalyzerMultiDetector__populateLeafSceneObservations_hierarchySceneObservations_fromLastAnalysisForSceneConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  _DWORD *v4;
  int v5;
  unint64_t *v6;
  float v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  float v16;
  id v17;
  _QWORD *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint64_t v28;
  void *__p[2];
  void *v30;
  void *v31[2];
  void *v32[2];
  int v33;
  uint64_t v34;
  std::__shared_weak_count *v35;

  v28 = a2;
  -[VNImageAnalyzerMultiDetector _lastAnalysisSceneClassifications](&v34, *(os_unfair_lock_s **)(a1 + 32));
  *(_OWORD *)v31 = 0u;
  *(_OWORD *)v32 = 0u;
  v33 = 1065353216;
  v3 = *(_DWORD **)v34;
  v4 = *(_DWORD **)(v34 + 8);
  while (v3 != v4)
  {
    v5 = v3[6];
    __p[0] = v3;
    *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v31, (unsigned __int8 *)v3, (__int128 **)__p)+ 10) = v5;
    v3 += 8;
  }
  vision::mod::ImageClassifier_HierarchicalModel::infer((uint64_t)__p, *(uint64_t ***)(a1 + 72), v31, 0);
  if (*(_BYTE *)(a1 + 100))
    v6 = 0;
  else
    v6 = (unint64_t *)(a1 + 88);
  v7 = *(float *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = v9;
  v13 = v10;
  if (v8)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (char *)v30;
    if (v30)
    {
      while (1)
      {
        v16 = *((float *)v15 + 10);
        if (v16 >= v7)
        {
          v17 = objc_alloc(MEMORY[0x1E0CB3940]);
          v18 = v15 + 16;
          if (v15[39] < 0)
            v18 = (_QWORD *)*v18;
          v19 = (void *)objc_msgSend(v17, "initWithUTF8String:", v18, v28);
          v20 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](v8, v19, v11, v13, v12, v14, v6, v28, v16);

          if ((v20 & 1) == 0)
            break;
        }
        v15 = *(char **)v15;
        if (!v15)
          goto LABEL_14;
      }
      v21 = 0;
    }
    else
    {
LABEL_14:
      v21 = v14;
    }

  }
  else
  {
    v21 = 0;
  }

  if (v21)
    objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v21);

  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v30);
  v22 = __p[0];
  __p[0] = 0;
  if (v22)
    operator delete(v22);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v32[0]);
  v23 = v31[0];
  v31[0] = 0;
  if (v23)
    operator delete(v23);
  v24 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  return v21 != 0;
}

- (void)_lastAnalysisSceneClassifications
{
  _QWORD *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *DisallowedLabels;
  _BYTE *v10;
  _BYTE *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **p_p;
  int v18;
  BOOL v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void **v27;
  uint64_t v28;
  void **v29;
  int v30;
  void **v31;
  void **v32;
  unint64_t v33;
  void **v34;
  uint64_t v35;
  __int128 v36;
  int64x2_t v37;
  void **v38;
  char *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  _QWORD *exception;
  _QWORD *v47;
  os_unfair_lock_s *v48;
  __int128 v49;
  void **v50;
  __int128 v51;
  std::string v52;
  int v53;
  BOOL v54;
  void *__p;
  void *v56;
  uint64_t v57;
  void **v58;
  int64x2_t v59;
  void **v60;
  void ***v61;
  _BYTE *v62;
  _BYTE *v63;

  v2 = a1;
  if (a2)
  {
    v3 = a2;
    os_unfair_lock_lock(a2 + 66);
    v4 = *(_QWORD *)&v3[68]._os_unfair_lock_opaque;
    if (!v4)
    {
      v5 = *(_QWORD *)&v3[28]._os_unfair_lock_opaque;
      v50 = 0;
      v49 = 0uLL;
      v48 = v3;
      if (*(_BYTE *)(v5 + 384))
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = 8575;
        __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
      }
      LODWORD(v52.__r_.__value_.__l.__data_) = 2;
      v6 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v5 + 784, 2u, &v52);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v58, (__int128 *)(v6 + 24), 0);
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v62, (unint64_t *)&v58);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v58);
      __p = 0;
      v56 = 0;
      v57 = 0;
      v7 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((_QWORD *)(v5 + 744), 2u);
      if (v7)
      {
        LODWORD(v58) = 2;
        v8 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((_QWORD *)(v5 + 744), 2u, &v58);
        vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v8 + 3), (uint64_t)&v62, (uint64_t)&__p);
      }
      DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels(v5, 2u);
      v47 = v2;
      v11 = v62;
      v10 = v63;
      LODWORD(v58) = 2;
      v12 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v5 + 864, 2u, &v58);
      if (v10 != v11)
      {
        v13 = v12;
        v14 = 0;
        if ((unint64_t)((v10 - v11) >> 2) <= 1)
          v15 = 1;
        else
          v15 = (v10 - v11) >> 2;
        do
        {
          v16 = v13[3] + 24 * v14;
          p_p = (void **)&v62;
          if (v7)
            p_p = &__p;
          v18 = *((_DWORD *)*p_p + v14);
          v19 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(DisallowedLabels, (unsigned __int8 *)(v13[3] + 24 * v14)) != 0;
          if (*(char *)(v16 + 23) < 0)
            std::string::__init_copy_ctor_external(&v52, *(const std::string::value_type **)v16, *(_QWORD *)(v16 + 8));
          else
            v52 = *(std::string *)v16;
          v53 = v18;
          v54 = v19;
          v20 = *((_QWORD *)&v49 + 1);
          if (*((_QWORD *)&v49 + 1) >= (unint64_t)v50)
          {
            v22 = v49;
            v23 = (uint64_t)(*((_QWORD *)&v49 + 1) - v49) >> 5;
            v24 = v23 + 1;
            if ((unint64_t)(v23 + 1) >> 59)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            v25 = (uint64_t)v50 - v49;
            if ((uint64_t)((uint64_t)v50 - v49) >> 4 > v24)
              v24 = v25 >> 4;
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0)
              v26 = 0x7FFFFFFFFFFFFFFLL;
            else
              v26 = v24;
            v61 = &v50;
            if (v26)
            {
              if (v26 >> 59)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v27 = (void **)operator new(32 * v26);
            }
            else
            {
              v27 = 0;
            }
            v29 = &v27[4 * v23];
            v58 = v27;
            v59.i64[0] = (uint64_t)v29;
            v59.i64[1] = (uint64_t)v29;
            v60 = &v27[4 * v26];
            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)v29, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
              v30 = v53;
              v19 = v54;
              v20 = *((_QWORD *)&v49 + 1);
              v22 = v49;
              v32 = (void **)v59.i64[1];
              v31 = (void **)v59.i64[0];
            }
            else
            {
              v30 = v18;
              *(std::string *)v29 = v52;
              v31 = v29;
              v32 = v29;
            }
            *((_DWORD *)v29 + 6) = v30;
            *((_BYTE *)v29 + 28) = v19;
            v28 = (uint64_t)(v32 + 4);
            v59.i64[1] = (uint64_t)(v32 + 4);
            if (v20 == v22)
            {
              v37 = vdupq_n_s64(v22);
            }
            else
            {
              v33 = 0;
              do
              {
                v34 = &v31[v33 / 8];
                v35 = v20 + v33;
                v36 = *(_OWORD *)(v20 + v33 - 32);
                *(v34 - 2) = *(void **)(v20 + v33 - 16);
                *((_OWORD *)v34 - 2) = v36;
                *(_QWORD *)(v35 - 24) = 0;
                *(_QWORD *)(v35 - 16) = 0;
                *(_QWORD *)(v35 - 32) = 0;
                *((_DWORD *)v34 - 2) = *(_DWORD *)(v20 + v33 - 8);
                *((_BYTE *)v34 - 4) = *(_BYTE *)(v20 + v33 - 4);
                v33 -= 32;
              }
              while (v20 + v33 != v22);
              v31 = (void **)((char *)v31 + v33);
              v37 = (int64x2_t)v49;
              v28 = v59.i64[1];
            }
            *(_QWORD *)&v49 = v31;
            *((_QWORD *)&v49 + 1) = v28;
            v59 = v37;
            v38 = v50;
            v50 = v60;
            v60 = v38;
            v58 = (void **)v37.i64[0];
            std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)&v58);
            v21 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
          }
          else
          {
            v21 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(*((std::string **)&v49 + 1), v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
            }
            else
            {
              **((_OWORD **)&v49 + 1) = *(_OWORD *)&v52.__r_.__value_.__l.__data_;
              *(_QWORD *)(v20 + 16) = *((_QWORD *)&v52.__r_.__value_.__l + 2);
            }
            *(_DWORD *)(v20 + 24) = v18;
            *(_BYTE *)(v20 + 28) = v19;
            v28 = v20 + 32;
          }
          *((_QWORD *)&v49 + 1) = v28;
          if (v21 < 0)
            operator delete(v52.__r_.__value_.__l.__data_);
          ++v14;
        }
        while (v14 != v15);
      }
      if (__p)
      {
        v56 = __p;
        operator delete(__p);
      }
      v2 = v47;
      v3 = v48;
      if (v62)
      {
        v63 = v62;
        operator delete(v62);
      }
      v39 = (char *)operator new(0x30uLL);
      *((_QWORD *)v39 + 1) = 0;
      *((_QWORD *)v39 + 2) = 0;
      *(_QWORD *)v39 = &off_1E453B370;
      *(_OWORD *)(v39 + 24) = v49;
      *((_QWORD *)v39 + 5) = v50;
      v49 = 0uLL;
      v50 = 0;
      *(_QWORD *)&v51 = v39 + 24;
      *((_QWORD *)&v51 + 1) = v39;
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v48[68], &v51);
      v40 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
      if (*((_QWORD *)&v51 + 1))
      {
        v41 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      v58 = (void **)&v49;
      std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100](&v58);
      v4 = *(_QWORD *)&v48[68]._os_unfair_lock_opaque;
    }
    v43 = *(_QWORD *)&v3[70]._os_unfair_lock_opaque;
    *v2 = v4;
    v2[1] = v43;
    if (v43)
    {
      v44 = (unint64_t *)(v43 + 8);
      do
        v45 = __ldxr(v44);
      while (__stxr(v45 + 1, v44));
    }
    os_unfair_lock_unlock(v3 + 66);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

uint64_t __67__VNImageAnalyzerMultiDetector__performAnalysis_pixelBuffer_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v7;

  v2 = *(os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock(v2 + 66);
  v7 = 0uLL;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v2[68], &v7);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  os_unfair_lock_unlock(v2 + 66);
  vision::mod::ImageAnalyzer::analyzeUsingCVPixelBuffer(*(vision::mod::ImageAnalyzer **)(*(_QWORD *)(a1 + 32) + 112), *(_DWORD *)(a1 + 48), **(__CVBuffer ***)(a1 + 40));
  return 1;
}

void __130__VNImageAnalyzerMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v2 = *(unsigned int *)(a1 + 112);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(double *)(a1 + 80);
  v7 = *(double *)(a1 + 88);
  v8 = *(double *)(a1 + 96);
  v9 = *(double *)(a1 + 104);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v3, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v2, v4, v5, &obj, *(_QWORD *)(a1 + 56), v6, v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (void)_getImageCropAndScaleOption:(int32x2_t *)a3 networkRequiredInputImageSize:(void *)a4 forOptions:
{
  id v7;
  uint64x2_t *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  id v15;

  v7 = a4;
  if (a1)
  {
    v8 = *(uint64x2_t **)(a1 + 112);
    v9 = v8[24].u8[1];
    *a3 = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v8[42])));
    v15 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v12 = 2;
    if (v12 == 2 && v9 == 0)
      v14 = 0;
    else
      v14 = v12;
    *a2 = v14;

    v7 = v15;
  }

}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  uint64_t (**v13)(void *, id *, double, double, double, double);
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  VNAsyncStatus *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  VNAsyncStatus *v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  int v42;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createScaledFullImageForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E4548A88;
    v42 = *(_DWORD *)(a1 + 132);
    v9 = WeakRetained;
    v35 = v9;
    v10 = *(_OWORD *)(a1 + 112);
    v40 = *(_OWORD *)(a1 + 96);
    v41 = v10;
    v36 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 80);
    v37 = v11;
    v39 = v12;
    v38 = *(id *)(a1 + 64);
    v13 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    v14 = *(double *)(a1 + 96);
    v15 = *(double *)(a1 + 104);
    v16 = *(double *)(a1 + 112);
    v17 = *(double *)(a1 + 120);
    v33 = 0;
    v18 = v13[2](v13, &v33, v14, v15, v16, v17);
    v19 = v33;
    v20 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v18, v19);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    VNValidatedLog(1, (uint64_t)CFSTR("createScaledFullImageForProcessingBlock: finish processing; currentDetector: %@"),
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v9);
    kdebug_trace();
    if (*(_BYTE *)(a1 + 136))
      objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v29);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  VNAsyncStatus *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  VNAsyncStatus *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  int v39;
  int v40;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processScaledFullImagePixelBufferBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E45472D0;
    v33 = *(id *)(a1 + 72);
    v10 = v9;
    v29 = v10;
    v39 = *(_DWORD *)(a1 + 172);
    v30 = *(id *)(a1 + 32);
    v40 = *(_DWORD *)(a1 + 168);
    v35 = *(_OWORD *)(a1 + 88);
    v36 = *(_QWORD *)(a1 + 104);
    v31 = *(id *)(a1 + 40);
    v37 = *(_OWORD *)(a1 + 136);
    v38 = *(_OWORD *)(a1 + 152);
    v32 = *(id *)(a1 + 48);
    v34 = *(id *)(a1 + 80);
    v11 = _Block_copy(aBlock);
    v27 = 0;
    v12 = VNExecuteBlock(v11, (uint64_t)&v27);
    v13 = v27;
    v14 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v12, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, (uint64_t)CFSTR("processScaledFullImagePixelBufferBlock: finish processing; currentDetector: %@"),
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)v10);
    kdebug_trace();
    if (*(_BYTE *)(a1 + 176))
      objc_msgSend(*(id *)(a1 + 64), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v23);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t (**v12)(void *, id *, double, double, double, double);
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  VNAsyncStatus *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  VNAsyncStatus *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  int v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7;
    aBlock[3] = &unk_1E4548A88;
    v41 = *(_DWORD *)(a1 + 140);
    v9 = WeakRetained;
    v34 = v9;
    v39 = *(_OWORD *)(a1 + 104);
    v40 = *(_OWORD *)(a1 + 120);
    v35 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 80);
    v36 = v10;
    v38 = v11;
    v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    v13 = *(double *)(a1 + 104);
    v14 = *(double *)(a1 + 112);
    v15 = *(double *)(a1 + 120);
    v16 = *(double *)(a1 + 128);
    v32 = 0;
    v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    v18 = v32;
    v19 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v17, v18);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@"),
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  VNAsyncStatus *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  VNAsyncStatus *v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9;
    aBlock[3] = &unk_1E4547370;
    v41 = *(id *)(a1 + 88);
    v10 = v9;
    v45 = *(_DWORD *)(a1 + 140);
    v11 = *(_QWORD *)(a1 + 128);
    v35 = v10;
    v44 = v11;
    v12 = *(id *)(a1 + 32);
    v46 = *(_DWORD *)(a1 + 136);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v36 = v12;
    v37 = v13;
    v42 = *(_OWORD *)(a1 + 96);
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 112);
    v38 = v15;
    v43 = v16;
    v39 = *(id *)(a1 + 56);
    v40 = *(id *)(a1 + 64);
    v17 = _Block_copy(aBlock);
    v33 = 0;
    v18 = VNExecuteBlock(v17, (uint64_t)&v33);
    v19 = v33;
    v20 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v18, v19);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    objc_msgSend(*(id *)(a1 + 72), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: finish processing; currentDetector: %@"),
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v10);
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 80), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v29);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  _QWORD aBlock[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v18 = 0;
      *a2 = v4;
      return v18;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "completed") & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    return 0;
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10;
  aBlock[3] = &unk_1E4547348;
  v21 = *(id *)(a1 + 32);
  v30 = *(_DWORD *)(a1 + 120);
  v11 = *(id *)(a1 + 40);
  v31 = *(_DWORD *)(a1 + 124);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v22 = v11;
  v23 = v12;
  v14 = *(_QWORD *)(a1 + 96);
  v27 = &v32;
  v28 = v14;
  v15 = v13;
  v16 = *(_QWORD *)(a1 + 104);
  v24 = v15;
  v29 = v16;
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 72);
  v17 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v17, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 124), a2);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  v18 = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  return v18;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = v12;
  if (v11)
  {
    v31[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[VNImageAnalyzerMultiDetector _analysisTypeForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:](v14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    if ((-[VNImageAnalyzerMultiDetector _performAnalysis:pixelBuffer:error:](v11, v15, v10 + 24, (uint64_t)a2) & 1) != 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      LOBYTE(v11) = -[VNImageAnalyzerMultiDetector _populateLeafSceneObservations:hierarchySceneObservations:fromLastAnalysisForSceneConfiguration:error:](v11, v16, v17, v13, a2);
      if ((v11 & 1) != 0)
      {
        v18 = objc_retainAutorelease(v16);
        v19 = objc_retainAutorelease(v17);
      }
      else
      {
        v18 = 0;
        v19 = 0;
      }

    }
    else
    {
      v18 = 0;
      v19 = 0;
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }

  v20 = v18;
  v21 = v19;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v11;
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v29 = *(unsigned __int8 *)(v28 + 24);
  if (*(_BYTE *)(v28 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
    _recordBestClassificationObservations(*(void **)(a1 + 64), v20);
    _recordBestClassificationObservations(*(void **)(a1 + 72), v21);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
  }

  return v29 != 0;
}

uint64_t __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  int v24;

  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v12 = 0;
      *a2 = v4;
      return v12;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "completed") & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E45472A8;
  v15 = *(id *)(a1 + 32);
  v23 = *(_DWORD *)(a1 + 136);
  v16 = *(id *)(a1 + 40);
  v24 = *(_DWORD *)(a1 + 140);
  v20 = *(_OWORD *)(a1 + 88);
  v17 = *(id *)(a1 + 48);
  v21 = *(_OWORD *)(a1 + 104);
  v22 = *(_OWORD *)(a1 + 120);
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 72);
  v11 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v11, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 140), a2);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0;

  return v12;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_processFullImagePixelBuffer:options:regionOfInterest:qosClass:warningRecorder:error:progressHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 124), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (void)_configureSlidersAdjustmentsInImageAnalyzerOptions:(uint64_t)a1 forConfigurationOptions:(std::vector<std::string> *)a2
{
  std::vector<std::string> *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  std::string::size_type v13;
  std::vector<std::string>::pointer end;
  __int128 v15;
  std::vector<std::string>::pointer v16;
  std::string __p;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  std::string v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a2 + 14;
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)&a2[14]);
    objc_msgSend(*(id *)(a1 + 80), "sliderNetBlobNamePrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      std::string::basic_string[abi:ne180100]<0>(&v22, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      objc_msgSend((id)objc_opt_class(), "allPhotosAdjustmentKeys");
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v19;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
            if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&__p, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
            else
              __p = v22;
            v12 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
            v13 = strlen(v12);
            std::string::append(&__p, v12, v13);
            end = a2[14].__end_;
            if (end >= a2[14].__end_cap_.__value_)
            {
              v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v4, (__int128 *)&__p);
            }
            else
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(a2[14].__end_, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else
              {
                v15 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
                end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
              }
              v16 = end + 1;
              a2[14].__end_ = end + 1;
            }
            a2[14].__end_ = v16;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v8);
      }

      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
    }

  }
}

uint64_t __64__VNImageAnalyzerMultiDetector_warmUpSession_withOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "detectorOfType:configuredWithOptions:error:", v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "warmUpSession:withOptions:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a3);
  else
    v9 = 0;

  return v9;
}

- (void)_isNotConfiguredWithBooleanOptionNamed:(void *)a3 butRequiredByOptions:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      objc_msgSend(a1, "configurationOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      a1 = (void *)(v12 ^ 1u);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

+ (id)_inferenceDescriptorForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  v9 = objc_msgSend(v7, "requestClassAndReturnError:", a4);
  if (!v9)
    goto LABEL_7;
  v10 = objc_msgSend(a1, "modelForRequestClass:revision:", v9, objc_msgSend(v8, "requestRevision"));
  if (!v10)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v8);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_msgSend(a1, "_newInferenceDescriptorForModel:configuredWithOptions:error:", v10, v6, a4);
LABEL_8:

  return v11;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (id)disallowedListForModel:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return 0;
  +[VNDisallowedList sceneNetV3](VNDisallowedList, "sceneNetV3", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForMultiDetectorModel:(unint64_t)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v8;
  void *v9;
  ImageClassifier_HierarchicalModel *v10;
  __shared_weak_count *v11;
  id v12;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v8 = v4;
  objc_msgSend(a1, "fullyPopulatedConfigurationOptionsWithOverridingOptions:", MEMORY[0x1E0C9AA70]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "_newInferenceDescriptorForModel:configuredWithOptions:error:", a3);
  if (v9)
  {
    objc_msgSend(a1, "createHierarchicalModelForInferenceDescriptor:error:", v9, a4);
  }
  else
  {
    *v8 = 0;
    v8[1] = 0;
  }

  result.__cntrl_ = v11;
  result.__ptr_ = v10;
  return result;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "_inferenceDescriptorForOptions:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "VisionCoreFileSystemPathAndReturnError:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "inputImageBlobName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "onlyInputImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "supportedImageSizeSetForEspressoModelAtPath:inputImageBlobName:analysisPixelFormatType:error:", v9, v10, objc_msgSend(v11, "pixelFormatType"), a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)allPhotosAdjustmentKeys
{
  return &unk_1E459E1F8;
}

@end
