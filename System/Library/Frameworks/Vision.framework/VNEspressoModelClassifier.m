@implementation VNEspressoModelClassifier

+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:
{
  _QWORD *v8;
  ImageClassifierAbstract *v10;
  __shared_weak_count *v11;
  shared_ptr<vision::mod::ImageClassifierAbstract> result;

  *v8 = 0;
  v8[1] = 0;

  result.__cntrl_ = v11;
  result.__ptr_ = v10;
  return result;
}

+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7
{
  _QWORD *v7;
  ImageDescriptorProcessorAbstract *v9;
  __shared_weak_count *v10;
  shared_ptr<vision::mod::ImageDescriptorProcessorAbstract> result;

  *v7 = 0;
  v7[1] = 0;

  result.__cntrl_ = v10;
  result.__ptr_ = v9;
  return result;
}

+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  ImageClassifier_HierarchicalModel *v32;
  __shared_weak_count *v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 (*v41)(__n128 *, __n128 *);
  uint64_t (*v42)(uint64_t);
  const char *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v7 = v4;
  v8 = a3;
  objc_msgSend(a1, "classifierResourceTypesToNamesForOriginatingRequestSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    VNFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("espresso-classifier-labels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathForResource:ofType:", v11, CFSTR("csv"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("espresso-classifier-relationships"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("espresso-classifier-relationships"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathForResource:ofType:", v14, CFSTR("txt"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v38 = 0;
        v39 = &v38;
        v40 = 0x4012000000;
        v41 = __Block_byref_object_copy__10940;
        v42 = __Block_byref_object_dispose__10941;
        v44 = 0;
        v45 = 0;
        v43 = "";
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__VNEspressoModelClassifier_createHierarchicalModelForOriginatingRequestSpecifier_error___block_invoke;
        aBlock[3] = &unk_1E4547408;
        v35 = v12;
        v37 = &v38;
        v36 = v15;
        v16 = _Block_copy(aBlock);
        if ((VNExecuteBlock(v16, (uint64_t)a4) & 1) != 0)
        {
          v17 = v39[7];
          *v7 = v39[6];
          v7[1] = v17;
          if (v17)
          {
            v18 = (unint64_t *)(v17 + 8);
            do
              v19 = __ldxr(v18);
            while (__stxr(v19 + 1, v18));
          }
        }
        else
        {
          *v7 = 0;
          v7[1] = 0;
        }

        _Block_object_dispose(&v38, 8);
        v29 = v45;
        if (v45)
        {
          p_shared_owners = (unint64_t *)&v45->__shared_owners_;
          do
            v31 = __ldaxr(p_shared_owners);
          while (__stlxr(v31 - 1, p_shared_owners));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
      }
      else
      {
        if (a4)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("txt"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("could not locate the resource file \"%@\"), v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v28);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        *v7 = 0;
        v7[1] = 0;
      }

      v11 = v13;
    }
    else
    {
      if (a4)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("csv"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("could not locate the resource file \"%@\"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      *v7 = 0;
      v7[1] = 0;
    }

  }
  else
  {
    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ must implement classifierResourceTypesToNamesForOriginatingRequestSpecifier: for %@"), v21, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    *v7 = 0;
    v7[1] = 0;
  }

  result.__cntrl_ = v33;
  result.__ptr_ = v32;
  return result;
}

+ (void)convertRelationships:(id)a3 toStdRelationships:(void *)a4
{
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v6 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__VNEspressoModelClassifier_convertRelationships_toStdRelationships___block_invoke;
  v7[3] = &__block_descriptor_48_e34_v32__0__NSString_8__NSArray_16_B24l;
  v7[4] = v5;
  v7[5] = a4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VNEspressoModelClassifier_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities espressoV1ModelComputeDevices](VNComputeDeviceUtilities, "espressoV1ModelComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __66__VNEspressoModelClassifier_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNEspressoModelClassifier;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_MetalContextPriority"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

void __69__VNEspressoModelClassifier_convertRelationships_toStdRelationships___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer *v10;
  std::pair<std::string, std::string> *v11;
  unint64_t v12;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer v20;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer end;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer begin;
  __int128 v23;
  __int128 v24;
  int64x2_t v25;
  std::pair<std::string, std::string> *v26;
  id obj;
  std::string __str;
  std::string v29;
  _BYTE v30[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::__split_buffer<std::pair<std::string, std::string>> v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v31 = 0u;
        memset(v30, 0, sizeof(v30));
        std::string::basic_string[abi:ne180100]<0>(&v29, (char *)objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", *(_QWORD *)(a1 + 32)));
        std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", *(_QWORD *)(a1 + 32)));
        std::string::operator=((std::string *)v30, &__str);
        std::string::operator=((std::string *)&v30[24], &v29);
        v10 = *(std::__split_buffer<std::pair<std::string, std::string>>::pointer **)(a1 + 40);
        v11 = v10[1];
        v12 = (unint64_t)v10[2];
        if ((unint64_t)v11 >= v12)
        {
          v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)*v10) >> 4);
          v15 = v14 + 1;
          if (v14 + 1 > 0x555555555555555)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (_QWORD)*v10) >> 4);
          if (2 * v16 > v15)
            v15 = 2 * v16;
          if (v16 >= 0x2AAAAAAAAAAAAAALL)
            v17 = 0x555555555555555;
          else
            v17 = v15;
          v36.__end_cap_.__value_ = (std::allocator<std::pair<std::string, std::string>> *)(v10 + 2);
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v17);
          else
            v18 = 0;
          v36.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v17;
          v36.__begin_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)(v17 + 48 * v14);
          v36.__end_ = v36.__begin_;
          v36.__end_cap_.__value_ = (std::pair<std::string, std::string> *)(v17 + 48 * v18);
          std::pair<std::string,std::string>::pair[abi:ne180100](&v36.__begin_->first, (__int128 *)v30);
          v20 = *v10;
          v19 = (unint64_t)v10[1];
          begin = v36.__begin_;
          end = v36.__end_;
          if ((std::__split_buffer<std::pair<std::string, std::string>>::pointer)v19 == *v10)
          {
            v25 = vdupq_n_s64(v19);
          }
          else
          {
            do
            {
              v23 = *(_OWORD *)(v19 - 48);
              begin[-1].first.__r_.__value_.__r.__words[2] = *(_QWORD *)(v19 - 32);
              *(_OWORD *)&begin[-1].first.__r_.__value_.__l.__data_ = v23;
              *(_QWORD *)(v19 - 40) = 0;
              *(_QWORD *)(v19 - 32) = 0;
              *(_QWORD *)(v19 - 48) = 0;
              v24 = *(_OWORD *)(v19 - 24);
              begin[-1].second.__r_.__value_.__r.__words[2] = *(_QWORD *)(v19 - 8);
              *(_OWORD *)&begin[-1].second.__r_.__value_.__l.__data_ = v24;
              --begin;
              *(_QWORD *)(v19 - 16) = 0;
              *(_QWORD *)(v19 - 8) = 0;
              *(_QWORD *)(v19 - 24) = 0;
              v19 -= 48;
            }
            while ((std::__split_buffer<std::pair<std::string, std::string>>::pointer)v19 != v20);
            v25 = *(int64x2_t *)v10;
          }
          v13 = end + 1;
          *v10 = begin;
          v10[1] = end + 1;
          *(int64x2_t *)&v36.__begin_ = v25;
          v26 = v10[2];
          v10[2] = v36.__end_cap_.__value_;
          v36.__end_cap_.__value_ = v26;
          v36.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v25.i64[0];
          std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&v36);
        }
        else
        {
          std::pair<std::string,std::string>::pair[abi:ne180100](&v10[1]->first, (__int128 *)v30);
          v13 = v11 + 1;
          v10[1] = v13;
        }
        v10[1] = v13;
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
        if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v29.__r_.__value_.__l.__data_);
        if (SHIBYTE(v31) < 0)
          operator delete(*(void **)&v30[24]);
        if ((v30[23] & 0x80000000) != 0)
          operator delete(*(void **)v30);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

}

uint64_t __89__VNEspressoModelClassifier_createHierarchicalModelForOriginatingRequestSpecifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned __int8 *v5;
  std::string::size_type v6;
  char v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v21;
  std::string v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28[8];
  uint64_t v29;
  __int128 v30;
  char *v31;
  char *v32;
  unint64_t *v33;
  _QWORD v34[5];

  v34[2] = *MEMORY[0x1E0C80C00];
  ImageClassifier_loadLabelsAndBooleanFlags(v28, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  v21 = a1;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v2 = *(_QWORD *)v28;
  v3 = v29;
  if (*(_QWORD *)v28 != v29)
  {
    v4 = 0;
    do
    {
      v5 = *(unsigned __int8 **)(v2 + 24);
      if (*(char *)(v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)v2, *(_QWORD *)(v2 + 8));
        v4 = v26;
      }
      else
      {
        v22 = *(std::string *)v2;
      }
      v23 = v5;
      v24 = 2;
      v34[0] = v22.__r_.__value_.__l.__size_;
      v6 = v22.__r_.__value_.__r.__words[0];
      *(_QWORD *)((char *)v34 + 7) = *(std::string::size_type *)((char *)&v22.__r_.__value_.__r.__words[1] + 7);
      v7 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
      memset(&v22, 0, sizeof(v22));
      v8 = (*v5 >> 1) & 1;
      if (v4 >= v27)
      {
        v10 = (uint64_t)(v4 - v25) >> 5;
        if ((unint64_t)(v10 + 1) >> 59)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v11 = (uint64_t)(v27 - v25) >> 4;
        if (v11 <= v10 + 1)
          v11 = v10 + 1;
        if (v27 - v25 >= 0x7FFFFFFFFFFFFFE0)
          v12 = 0x7FFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        v33 = &v27;
        v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v12);
        v14 = &v13[32 * v10];
        *(_QWORD *)&v30 = v13;
        *((_QWORD *)&v30 + 1) = v14;
        v32 = &v13[32 * v15];
        v16 = v34[0];
        *(_QWORD *)v14 = v6;
        *((_QWORD *)v14 + 1) = v16;
        *(_QWORD *)(v14 + 15) = *(_QWORD *)((char *)v34 + 7);
        v14[23] = v7;
        v14[24] = v8;
        v31 = v14 + 32;
        std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(&v25, &v30);
        v4 = v26;
        std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)&v30);
      }
      else
      {
        *(_QWORD *)v4 = v6;
        v9 = *(_QWORD *)((char *)v34 + 7);
        *(_QWORD *)(v4 + 8) = v34[0];
        *(_QWORD *)(v4 + 15) = v9;
        *(_BYTE *)(v4 + 23) = v7;
        *(_BYTE *)(v4 + 24) = v8;
        v4 += 32;
      }
      v26 = v4;
      v2 += 48;
    }
    while (v2 != v3);
  }
  std::allocate_shared[abi:ne180100]<vision::mod::ImageClassifier_HierarchicalModel,std::allocator<vision::mod::ImageClassifier_HierarchicalModel>,char const*,decltype(nullptr),std::vector<std::pair<std::string,BOOL>> &,void>((uint64_t ***)&v30, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(v21 + 40)), "UTF8String"), &v25);
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(v21 + 48) + 8) + 48, &v30);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
  if (*((_QWORD *)&v30 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  *(_QWORD *)&v30 = &v25;
  std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  *(_QWORD *)&v30 = v28;
  std::vector<std::pair<std::string,std::vector<BOOL>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  return 1;
}

- (id)boundComputeStageDevices
{
  MLComputeDeviceProtocol *computeDevice;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  computeDevice = self->_computeDevice;
  v4 = CFSTR("VNComputeStageMain");
  v5[0] = computeDevice;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  MLComputeDeviceProtocol *v7;
  MLComputeDeviceProtocol *computeDevice;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  VNEspressoModelClassifier *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)VNEspressoModelClassifier;
  if (-[VNDetector completeInitializationForSession:error:](&v32, sel_completeInitializationForSession_error_, a3))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v6, a4);
    v7 = (MLComputeDeviceProtocol *)objc_claimAutoreleasedReturnValue();
    computeDevice = self->_computeDevice;
    self->_computeDevice = v7;

    if (!self->_computeDevice)
    {
      v18 = 0;
LABEL_24:

      return v18;
    }
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v10 = (void *)objc_opt_class();
    objc_msgSend(v10, "classifierResourceTypesToNamesForOriginatingRequestSpecifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      VNFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _modelBundlePathForClassifierResource(v14, v11, CFSTR("espresso-descriptor"), CFSTR("bin"), a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        _modelBundlePathForClassifierResource(v14, v11, CFSTR("espresso-classifier"), CFSTR("bin"), a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          _modelBundlePathForClassifierResource(v14, v11, CFSTR("espresso-classifier-labels"), CFSTR("csv"), a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __68__VNEspressoModelClassifier_completeInitializationForSession_error___block_invoke;
            aBlock[3] = &unk_1E4545070;
            v25 = v6;
            v26 = self;
            v31 = v13;
            v30 = v10;
            v27 = v23;
            v28 = v16;
            v29 = v15;
            v17 = _Block_copy(aBlock);
            v18 = VNExecuteBlock(v17, (uint64_t)a4);

          }
          else
          {
            v18 = 0;
          }
          v21 = v23;

        }
        else
        {
          v18 = 0;
          v21 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      if (!a4)
      {
        v18 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ must implement +classifierResourceTypesToNamesForOriginatingRequestSpecifier: for %@"), v20, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v14);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_22;
  }
  return 0;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  objc_super v31;
  id v32;
  id v33;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v32 = 0;
  v33 = 0;
  objc_msgSend((id)objc_opt_class(), "initDumpDebugIntermediates:debugInfo:", &v33, &v32);
  v19 = v33;
  v20 = v32;
  if (v19)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
  if (v20)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (*((float (**)(ImageDescriptorProcessorAbstract *))self->mDescriptorProcessor.__ptr_->var0 + 19))(self->mDescriptorProcessor.__ptr_);
    if (v23 >= v22)
      v24 = v22;
    else
      v24 = v23;
    v25 = objc_msgSend(v21, "width");
    v26 = objc_msgSend(v21, "height");
    v27 = (unint64_t)v24;
    if (v25 >= v26)
      v25 = v26;
    if (v25 >= v27
      || (VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v17, (unint64_t)v24), v25 >= v27 >> 2))
    {
      v31.receiver = self;
      v31.super_class = (Class)VNEspressoModelClassifier;
      -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v31, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, a3, v16, v17, a7, v18, x, y, width, height);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  BOOL v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = +[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v17, self->mDescriptorProcessor.__ptr_, 1, v16, a7, a8, x, y, width, height);
  else
    v18 = 0;

  return v18;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  ImageDescriptorProcessorAbstract *ptr;
  const void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  ImageClassifierAbstract *v30;
  const void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  vision::mod::ImageDescriptorBufferAbstract *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *i;
  id v42;
  std::string *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  std::__shared_weak_count *v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  objc_class *v57;
  id v58;
  id v59;
  int v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  std::string v65;
  int v66;
  _QWORD v67[3];
  uint64_t v68;
  unint64_t v69;
  id v70;
  const void *v71;
  std::__shared_weak_count *v72;
  _QWORD v73[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v73[1] = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v62 = a7;
  v64 = v17;
  (*((void (**)(const void **__return_ptr))self->mDescriptorProcessor.__ptr_->var0 + 8))(&v71);
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNEspressoModelClassifierProcessOption_CenterTileOnly"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend((id)v18, "BOOLValue");

  v70 = 0;
  LOBYTE(v18) = -[VNDetector getOptionalCanceller:inOptions:error:](self, "getOptionalCanceller:inOptions:error:", &v70, v64, a8);
  v63 = v70;
  if ((v18 & 1) != 0)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v64, a8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v34 = 0;
LABEL_52:

      goto LABEL_53;
    }
    v58 = v20;
    v68 = 0;
    v69 = 0;
    ptr = self->mDescriptorProcessor.__ptr_;
    v22 = v71;
    -[VNDetector metalContext](self, "metalContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v58, a4, ptr, v19, 0, v22, x, y, width, height, v64, v23, v63, &v69, &v68, a8);

    if (!v24)
    {
      v34 = 0;
LABEL_51:
      v20 = v58;
      goto LABEL_52;
    }
    VNRecordImageTilingWarning(v62, v69, v68);
    memset(v67, 0, sizeof(v67));
    v25 = (void *)objc_opt_class();
    objc_msgSend(v25, "returnAllResultsOptionKey");
    v26 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v26;
    if (v26)
    {
      objc_msgSend(v64, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v25;
      v29 = objc_msgSend(v27, "BOOLValue");

      if (v29)
      {
        v30 = self->mClassifier.__ptr_;
        v31 = v71;
        -[VNDetector metalContext](self, "metalContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = +[VNImageClassifier computeLabelsAndConfidence:usingDescriptorBuffer:populateLabelsAndConfidence:options:metalContext:error:](VNImageClassifier, "computeLabelsAndConfidence:usingDescriptorBuffer:populateLabelsAndConfidence:options:metalContext:error:", v30, v31, v67, v64, v32, a8);

        if (!v33)
          goto LABEL_39;
        v60 = 1;
      }
      else
      {
        v60 = 0;
      }
      v25 = v28;
    }
    else
    {
      v60 = 0;
    }
    if (v71)
    else
      v35 = 0;
    v36 = *((_QWORD *)v35 + 9);
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((_QWORD *)v35 + 9));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (*(uint64_t (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(_QWORD *)v35 + 104))(v35);
      v55 = *((_QWORD *)v35 + 12);
      v57 = (objc_class *)objc_msgSend(v25, "espressoModelImageprintClass");
      +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v64, a8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v59 = v37;
        v38 = 0;
        while (1)
        {
          if (v60)
          {
            v39 = v67[0] + 40 * v38;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(v39 + 24));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            for (i = *(uint64_t **)(v39 + 16); i; i = (uint64_t *)*i)
            {
              if (*((char *)i + 39) < 0)
                std::string::__init_copy_ctor_external(&v65, (const std::string::value_type *)i[2], i[3]);
              else
                v65 = *(std::string *)(i + 2);
              v66 = *((_DWORD *)i + 10);
              v42 = objc_alloc(MEMORY[0x1E0CB3940]);
              if ((v65.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v43 = &v65;
              else
                v43 = (std::string *)v65.__r_.__value_.__r.__words[0];
              v44 = (void *)objc_msgSend(v42, "initWithUTF8String:", v43);
              LODWORD(v45) = v66;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setObject:forKey:", v46, v44);

              if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v65.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            v40 = 0;
          }
          v47 = (void *)objc_msgSend([v57 alloc], "initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:requestRevision:", vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v35, v38), v55, 1, v56, v40, objc_msgSend(v59, "requestRevision"));
          if (!v47)
            break;
          objc_msgSend(v61, "addObject:", v47);

          if (++v38 == v36)
          {
            objc_msgSend(v25, "createObservationWithDescriptors:forOriginatingRequestSpecifier:", v61, v59);
            v48 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v48;
            if (v48)
            {
              v73[0] = v48;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_48;
            }
            if (a8)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create observation object"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 0;
              goto LABEL_45;
            }
            v40 = 0;
            goto LABEL_47;
          }
        }
        if (a8)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create image print"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
          v34 = 0;
          *a8 = v49;
          goto LABEL_48;
        }
LABEL_47:
        v34 = 0;
LABEL_48:

        v37 = v59;
      }
      else
      {
        v34 = 0;
      }

      goto LABEL_50;
    }
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot calculate classification image descriptor"));
      v34 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

      v65.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
      std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v65);
      goto LABEL_51;
    }
LABEL_39:
    v34 = 0;
    goto LABEL_50;
  }
  v34 = 0;
LABEL_53:

  v50 = v72;
  if (v72)
  {
    p_shared_owners = (unint64_t *)&v72->__shared_owners_;
    do
      v52 = __ldaxr(p_shared_owners);
    while (__stlxr(v52 - 1, p_shared_owners));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }

  return v34;
}

- (id)calculateImageDescriptors:(id)a3 regionOfInterest:(CGRect)a4 warningRecorder:(id)a5 canceller:(id)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CVPixelBufferRef v29;
  ImageDescriptorProcessorAbstract *ptr;
  const void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  ImageClassifierAbstract *v36;
  const void *v37;
  void *v38;
  BOOL v39;
  id v40;
  vision::mod::ImageDescriptorBufferAbstract *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t *i;
  id v48;
  std::string *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  void *v60;
  uint64_t v61;
  vision::mod::ImageDescriptorBufferAbstract *v62;
  uint64_t v63;
  uint64_t v64;
  objc_class *v65;
  id v66;
  int v67;
  void *v68;
  id v69;
  void *v70;
  id *v71;
  void *v72;
  void *v73;
  id v74;
  std::string v75;
  int v76;
  id v77;
  _QWORD v78[3];
  uint64_t v79;
  unint64_t v80;
  id v81;
  const void *v82;
  std::__shared_weak_count *v83;
  CVPixelBufferRef v84;
  id v85;
  id v86;
  _QWORD v87[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v87[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v74 = a5;
  v16 = a6;
  v85 = 0;
  v86 = 0;
  v70 = (void *)objc_opt_class();
  objc_msgSend(v70, "initDumpDebugIntermediates:debugInfo:", &v86, &v85);
  v17 = v86;
  v18 = v85;
  if (v17)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
  if (v18)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
  v72 = v17;
  v73 = v18;
  v71 = a7;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v15, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_21;
  v20 = (*((float (**)(ImageDescriptorProcessorAbstract *))self->mDescriptorProcessor.__ptr_->var0 + 19))(self->mDescriptorProcessor.__ptr_);
  if (v21 >= v20)
    v22 = v20;
  else
    v22 = v21;
  v23 = objc_msgSend(v19, "width");
  v24 = objc_msgSend(v19, "height");
  v25 = (unint64_t)v22;
  if (v23 >= v24)
    v23 = v24;
  if (v23 < v25)
  {
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v74, (unint64_t)v22);
    if (v23 < v25 >> 2)
    {
      v26 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_70;
    }
  }
  v84 = 0;
  if (!+[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v19, self->mDescriptorProcessor.__ptr_, 1, v15, &v84, a7, x, y, width, height))
  {
LABEL_21:
    v26 = 0;
    goto LABEL_70;
  }
  CVPixelBufferLockBaseAddress(v84, 1uLL);
  (*((void (**)(const void **__return_ptr))self->mDescriptorProcessor.__ptr_->var0 + 8))(&v82);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VNEspressoModelClassifierProcessOption_CenterTileOnly"));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend((id)v27, "BOOLValue");

  v81 = v16;
  LOBYTE(v27) = -[VNDetector getOptionalCanceller:inOptions:error:](self, "getOptionalCanceller:inOptions:error:", &v81, v15, a7);
  v69 = v81;

  if ((v27 & 1) == 0)
  {
    v26 = 0;
    goto LABEL_64;
  }
  v79 = 0;
  v80 = 0;
  v29 = v84;
  ptr = self->mDescriptorProcessor.__ptr_;
  v31 = v82;
  -[VNDetector metalContext](self, "metalContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = +[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v19, v29, ptr, v28, 0, v31, x, y, width, height, v15, v32, v69, &v80, &v79, a7);

  CVPixelBufferUnlockBaseAddress(v84, 1uLL);
  CVPixelBufferRelease(v84);
  v26 = 0;
  v84 = 0;
  if ((v29 & 1) == 0)
    goto LABEL_64;
  VNRecordImageTilingWarning(v74, v80, v79);
  memset(v78, 0, sizeof(v78));
  objc_msgSend(v70, "returnAllResultsOptionKey");
  v33 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v33;
  if (v33
    && (objc_msgSend(v15, "objectForKeyedSubscript:", v33),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v34, "BOOLValue"),
        v34,
        v35))
  {
    v36 = self->mClassifier.__ptr_;
    v37 = v82;
    -[VNDetector metalContext](self, "metalContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    v39 = +[VNImageClassifier computeLabelsAndConfidence:usingDescriptorBuffer:populateLabelsAndConfidence:options:metalContext:error:](VNImageClassifier, "computeLabelsAndConfidence:usingDescriptorBuffer:populateLabelsAndConfidence:options:metalContext:error:", v36, v37, v78, v15, v38, &v77);
    v40 = v77;

    if (!v39)
    {
      if (a7)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Could not compute raw labels and confidence for image"), v40);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_55:
      v26 = 0;
      goto LABEL_63;
    }

    v67 = 1;
  }
  else
  {
    v67 = 0;
  }
  if (v82)
  else
    v41 = 0;
  v42 = *((_QWORD *)v41 + 9);
  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((_QWORD *)v41 + 9));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (*(uint64_t (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(_QWORD *)v41 + 104))(v41);
    v63 = *((_QWORD *)v41 + 12);
    v65 = (objc_class *)objc_msgSend(v70, "espressoModelImageprintClass");
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v15, a7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v61 = v42;
      v62 = v41;
      v66 = v43;
      v44 = 0;
      while (1)
      {
        if (v67)
        {
          v45 = v78[0] + 40 * v44;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(v45 + 24));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = *(uint64_t **)(v45 + 16); i; i = (uint64_t *)*i)
          {
            if (*((char *)i + 39) < 0)
              std::string::__init_copy_ctor_external(&v75, (const std::string::value_type *)i[2], i[3]);
            else
              v75 = *(std::string *)(i + 2);
            v76 = *((_DWORD *)i + 10);
            v48 = objc_alloc(MEMORY[0x1E0CB3940]);
            if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v49 = &v75;
            else
              v49 = (std::string *)v75.__r_.__value_.__r.__words[0];
            v50 = (void *)objc_msgSend(v48, "initWithUTF8String:", v49);
            LODWORD(v51) = v76;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setObject:forKey:", v52, v50);

            if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v75.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          v46 = 0;
        }
        v53 = (void *)objc_msgSend([v65 alloc], "initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:requestRevision:", vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v62, v44), v63, 1, v64, v46, objc_msgSend(v66, "requestRevision"));
        if (!v53)
          break;
        objc_msgSend(v68, "addObject:", v53);

        if (++v44 == v61)
        {
          objc_msgSend(v70, "createObservationWithDescriptors:forOriginatingRequestSpecifier:", v68, v66);
          v54 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v54;
          if (v54)
          {
            v87[0] = v54;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_61;
          }
          if (v71)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create observation object"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0;
            goto LABEL_58;
          }
          v46 = 0;
          goto LABEL_60;
        }
      }
      if (v71)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create image print"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
        v26 = 0;
        *v71 = v55;
        goto LABEL_61;
      }
LABEL_60:
      v26 = 0;
LABEL_61:

      v43 = v66;
    }
    else
    {
      v26 = 0;
    }

    goto LABEL_63;
  }
  if (!a7)
    goto LABEL_55;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot calculate classification image descriptor"));
  v26 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

  v75.__r_.__value_.__r.__words[0] = (std::string::size_type)v78;
  std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v75);
LABEL_64:
  v56 = v83;
  if (v83)
  {
    p_shared_owners = (unint64_t *)&v83->__shared_owners_;
    do
      v58 = __ldaxr(p_shared_owners);
    while (__stlxr(v58 - 1, p_shared_owners));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v16 = v69;
LABEL_70:

  return v26;
}

- (id)getLabels
{
  ImageClassifierAbstract *ptr;
  id v3;
  void *v4;
  std::string::size_type i;
  std::string::size_type size;
  std::string::size_type v7;
  void *v8;
  std::string v10;
  std::string *v11;

  ptr = self->mClassifier.__ptr_;
  memset(&v10, 0, sizeof(v10));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v10, *((__int128 **)ptr + 1), *((__int128 **)ptr + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)ptr + 2) - *((_QWORD *)ptr + 1)) >> 3));
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v3, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(v10.__r_.__value_.__l.__size_ - v10.__r_.__value_.__r.__words[0]) >> 3));
  size = v10.__r_.__value_.__l.__size_;
  for (i = v10.__r_.__value_.__r.__words[0]; i != size; i += 24)
  {
    v7 = i;
    if (*(char *)(i + 23) < 0)
      v7 = *(_QWORD *)i;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v11 = &v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  return v4;
}

- (id)disallowedIdentifiers
{
  return self->_disallowedIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedIdentifiers, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->mClassifier);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->mDescriptorProcessor);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

uint64_t __68__VNEspressoModelClassifier_completeInitializationForSession_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *v37;
  uint64_t *i;
  id v39;
  uint64_t *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v46;
  char v47[24];
  char v48;
  _BYTE v49[7];
  uint64_t v50;
  id v51;
  uint64_t v52;
  _BYTE v53[8];
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  uint64_t v59;
  _BYTE v60[7];
  void **v61;

  v59 = 1;
  if (!+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v59, CFSTR("VNDetectorOption_MetalContextPriority"), *(_QWORD *)(a1 + 32), 1, a2))
  {
LABEL_29:
    v18 = 0;
    goto LABEL_30;
  }
  if (+[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88)))
  {
    v4 = 0;
    v5 = 0;
    v46 = 0;
    v6 = 1;
    v7 = 1;
    goto LABEL_8;
  }
  if (!+[VNComputeDeviceUtilities isGPUComputeDevice:](VNComputeDeviceUtilities, "isGPUComputeDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88)))
  {
    if (a2)
    {
      +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  objc_msgSend(*(id *)(a1 + 40), "metalContext");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D1F4E8]);
  if (v8)
  {
    v10 = *(id *)(v8 + 8);
    v11 = *(void **)(v8 + 40);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(v9, "initWithDevice:andWisdomParams:", v10, v12);

  v4 = v13;
  v5 = *(_BYTE *)(a1 + 80);
  v6 = v59;

  v46 = 1;
  v7 = 2;
LABEL_8:
  v14 = *(void **)(a1 + 72);
  v57 = 0;
  v58 = 0;
  v15 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  v16 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String");
  v53[0] = v5;
  v54 = v6;
  v17 = v4;
  v18 = v17;
  v55 = v17;
  v56 = 0;
  if (v14)
  {
    objc_msgSend(v14, "createClassifierWithDescriptor:classifierAbsolutePath:computePlatform:computePath:labelsFilename:options:", &v57, v15, v46, v7, v16, v53);
  }
  else
  {

    *(_QWORD *)v47 = 0;
    *(_QWORD *)&v47[8] = 0;
  }
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 40) + 72, (__int128 *)v47);
  v19 = *(std::__shared_weak_count **)&v47[8];
  if (*(_QWORD *)&v47[8])
  {
    v20 = (unint64_t *)(*(_QWORD *)&v47[8] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v58;
  if (v58)
  {
    p_shared_owners = (unint64_t *)&v58->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72))
  {
    if (a2)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
      v30 = 0;
      *a2 = v29;
      goto LABEL_49;
    }
LABEL_30:
    v30 = 0;
    goto LABEL_49;
  }
  v25 = *(void **)(a1 + 72);
  v26 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String");
  v48 = v5;
  *(_DWORD *)v49 = *(_DWORD *)v60;
  *(_DWORD *)&v49[3] = *(_DWORD *)&v60[3];
  v50 = v6;
  v27 = v18;
  v28 = v27;
  v51 = v27;
  v52 = 0;
  if (v25)
  {
    objc_msgSend(v25, "createDescriprorProcessorWithModelPath:nBatch:computePlatform:computePath:options:", v26, v46, v46, 2, &v48);
  }
  else
  {

    *(_QWORD *)v47 = 0;
    *(_QWORD *)&v47[8] = 0;
  }
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 40) + 56, (__int128 *)v47);
  v31 = *(std::__shared_weak_count **)&v47[8];
  if (*(_QWORD *)&v47[8])
  {
    v32 = (unint64_t *)(*(_QWORD *)&v47[8] + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v34 + 56))
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v34 + 72) + 32))(*(_QWORD *)(v34 + 72));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) + 112) = 2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) + 96) = 1;
    ImageClassifier_loadLabelsAndBooleanFlags(v47, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"));
    v35 = (void *)MEMORY[0x1A1B0B060]();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v47[8] - *(_QWORD *)v47) >> 4));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(uint64_t **)v47;
    for (i = *(uint64_t **)&v47[8]; v37 != i; v37 += 6)
    {
      if ((*(_BYTE *)v37[3] & 1) == 0)
      {
        v39 = objc_alloc(MEMORY[0x1E0CB3940]);
        v40 = v37;
        if (*((char *)v37 + 23) < 0)
          v40 = (uint64_t *)*v37;
        v41 = (void *)objc_msgSend(v39, "initWithUTF8String:", v40);
        objc_msgSend(v36, "addObject:", v41);

      }
    }
    v42 = objc_msgSend(v36, "copy");
    v43 = *(_QWORD *)(a1 + 40);
    v44 = *(void **)(v43 + 96);
    *(_QWORD *)(v43 + 96) = v42;

    objc_autoreleasePoolPop(v35);
    v61 = (void **)v47;
    std::vector<std::pair<std::string,std::vector<BOOL>>>::__destroy_vector::operator()[abi:ne180100](&v61);
    v30 = 1;
  }
  else if (a2)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    v30 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v18 = v28;
LABEL_49:

  return v30;
}

@end
