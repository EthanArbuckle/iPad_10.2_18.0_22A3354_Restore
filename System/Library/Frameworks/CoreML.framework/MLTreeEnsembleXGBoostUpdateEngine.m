@implementation MLTreeEnsembleXGBoostUpdateEngine

- (MLTreeEnsembleXGBoostUpdateEngine)initWithCompiledArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  id v29;
  MLTreeEnsembleXGBoostUpdateEngine *v30;
  std::string *p_p;
  void *v32;
  void *v33;
  void *v34;
  MLTreeEnsembleXGBoostUpdateEngine *v35;
  void *v36;
  uint64_t v37;
  MLParameterContainer *parameterContainer;
  id v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  id v44;
  objc_super v45;
  void *v46[3];
  _BYTE v47[24];
  uint64_t v48;
  std::__shared_weak_count *v49;
  __int128 v50;
  std::string __p;
  uint64_t v52;
  std::__shared_weak_count *v53;
  char *v54[3];

  v8 = a4;
  objc_msgSend(v8, "setComputeUnits:", 0);
  v9 = -[MLModel initInterfaceAndMetadataWithCompiledArchive:error:]([MLTreeEnsembleXGBoostUpdateEngine alloc], "initInterfaceAndMetadataWithCompiledArchive:error:", a3, a5);
  if (v9)
  {
    v10 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    v52 = *(_QWORD *)a3;
    v53 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v54, (_QWORD *)a3 + 2);
    v13 = operator>><unsigned char>((uint64_t)&v52, (_QWORD *)v9 + 30);
    if (*((_QWORD *)v9 + 30) == *((_QWORD *)v9 + 31))
    {
      memset(&__p, 0, sizeof(__p));
      operator>>(v13, &__p);
      IArchive::blob(&v48, v52, (uint64_t)&__p);
      (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v48 + 24))(&v50);
      v14 = v50;
      v50 = 0uLL;
      v15 = (std::__shared_weak_count *)*((_QWORD *)v9 + 23);
      *((_OWORD *)v9 + 11) = v14;
      if (v15)
      {
        v16 = (unint64_t *)&v15->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v18 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
      if (*((_QWORD *)&v50 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v21 = v49;
      if (v49)
      {
        v22 = (unint64_t *)&v49->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    v24 = operator>>((uint64_t)&v52);
    v25 = operator>><std::string>(v24, (std::vector<std::string> *)v9 + 8);
    operator>><long long>(v25, (char **)v9 + 27);
    v26 = (void *)MEMORY[0x1E0C99E98];
    v27 = (void *)MEMORY[0x1E0CB3940];
    if (*(char *)(v52 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v52 + 8), *(_QWORD *)(v52 + 16));
    }
    else
    {
      v28 = *(_OWORD *)(v52 + 8);
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v52 + 24);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v28;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v27, "stringWithUTF8String:", p_p);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fileURLWithPath:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    objc_msgSend(v9, "modelDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classesByString");
    objc_msgSend(v9, "classesByInt");
    v45.receiver = self;
    v45.super_class = (Class)MLTreeEnsembleXGBoostUpdateEngine;
    v35 = -[MLTreeEnsembleXGBoostClassifier initWithDescription:configuration:indexToStringLabelArray:indexToIntLabelArray:modelURL:error:](&v45, sel_initWithDescription_configuration_indexToStringLabelArray_indexToIntLabelArray_modelURL_error_, v34, v8, v47, v46, v33, a5);
    if (v46[0])
    {
      v46[1] = v46[0];
      operator delete(v46[0]);
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

    if (v35)
    {
      objc_msgSend(v9, "modelDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      -[MLTreeEnsembleXGBoostUpdateEngine loadParameterDescriptionsAndContainerFromConfiguration:modelDescription:error:](v35, "loadParameterDescriptionsAndContainerFromConfiguration:modelDescription:error:", v8, v36, &v44);
      v37 = objc_claimAutoreleasedReturnValue();
      v29 = v44;
      parameterContainer = v35->_parameterContainer;
      v35->_parameterContainer = (MLParameterContainer *)v37;

      if (v35->_parameterContainer)
      {
        v30 = v35;
LABEL_47:

        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v54[1]);
        v40 = v53;
        if (v53)
        {
          v41 = (unint64_t *)&v53->__shared_owners_;
          do
            v42 = __ldaxr(v41);
          while (__stlxr(v42 - 1, v41));
          if (!v42)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
        }
        goto LABEL_52;
      }
      if (a5)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v29, CFSTR("Error in initalizing model parameters."));
        v39 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      }
    }
    else
    {
      if (a5)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in initalizing update Engine for compiled archive."));
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v29 = 0;
LABEL_42:
        v30 = 0;
        *a5 = v39;
        goto LABEL_47;
      }
      v29 = 0;
    }
    v30 = 0;
    goto LABEL_47;
  }
  if (a5)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in initalizing model interface."));
    v29 = 0;
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  v35 = self;
LABEL_52:

  return v30;
}

- (id)loadParameterDescriptionsAndContainerFromConfiguration:(id)a3 modelDescription:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  float v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  id v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  void (**v88)(CoreML::Specification::StringParameter *__hidden);
  uint64_t v89;
  __int128 *v90[3];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __n128 __p;
  char v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v84 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v6, "parameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v9)
  {
    v86 = *(_QWORD *)v92;
    while (2)
    {
      v87 = v9;
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v92 != v86)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey learningRate](MLParameterKey, "learningRate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "isEqualToString:", v14);

        if (v15)
        {
          CoreML::Specification::DoubleParameter::DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
          objc_msgSend(v6, "parameters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          *(double *)v90 = v18;

          +[MLParameterKey learningRate](MLParameterKey, "learningRate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v19, &v88);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

          +[MLParameterKey learningRate](MLParameterKey, "learningRate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v21);

          CoreML::Specification::DoubleParameter::~DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
        }
        objc_msgSend(v11, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey maxDepth](MLParameterKey, "maxDepth");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "isEqualToString:", v24);

        if (v25)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          objc_msgSend(v6, "parameters");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v11);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = (__int128 *)(int)objc_msgSend(v27, "intValue");

          +[MLParameterKey maxDepth](MLParameterKey, "maxDepth");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v28, &v88);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v29);

          +[MLParameterKey maxDepth](MLParameterKey, "maxDepth");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v30);

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        objc_msgSend(v11, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey minChildWeight](MLParameterKey, "minChildWeight");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "isEqualToString:", v33);

        if (v34)
        {
          CoreML::Specification::DoubleParameter::DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
          objc_msgSend(v6, "parameters");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v11);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "floatValue");
          *(double *)v90 = v37;

          +[MLParameterKey minChildWeight](MLParameterKey, "minChildWeight");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:doubleParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:doubleParameterSpec:", v38, &v88);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v39);

          +[MLParameterKey minChildWeight](MLParameterKey, "minChildWeight");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v40);

          CoreML::Specification::DoubleParameter::~DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
        }
        objc_msgSend(v11, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey numClasses](MLParameterKey, "numClasses");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "name");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v41, "isEqualToString:", v43);

        if (v44)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          objc_msgSend(v6, "parameters");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", v11);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = (__int128 *)(int)objc_msgSend(v46, "intValue");

          +[MLParameterKey numClasses](MLParameterKey, "numClasses");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v47, &v88);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v48);

          +[MLParameterKey numClasses](MLParameterKey, "numClasses");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v49);

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        objc_msgSend(v11, "name");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey numTrees](MLParameterKey, "numTrees");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v50, "isEqualToString:", v52);

        if (v53)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          objc_msgSend(v6, "parameters");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v11);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = (__int128 *)(int)objc_msgSend(v55, "intValue");

          +[MLParameterKey numTrees](MLParameterKey, "numTrees");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:int64ParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:int64ParameterSpec:", v56, &v88);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v57);

          +[MLParameterKey numTrees](MLParameterKey, "numTrees");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v58);

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        objc_msgSend(v11, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey objective](MLParameterKey, "objective");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "name");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v59, "isEqualToString:", v61);

        if (v62)
        {
          CoreML::Specification::StringParameter::StringParameter((CoreML::Specification::StringParameter *)&v88);
          objc_msgSend(v6, "parameters");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", v11);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v64, "isEqualToString:", CFSTR("multi:softprob")) & 1) == 0
            && (objc_msgSend(v64, "isEqualToString:", CFSTR("binary:logistic")) & 1) == 0)
          {
            if (a5)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Objective must be either multi:softprob or binary:logistic."));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_37;
          }
          v65 = objc_retainAutorelease(v64);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v65, "UTF8String"));
          *(_QWORD *)&v66 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v90, &__p).n128_u64[0];
          if (v96 < 0)
            operator delete((void *)__p.n128_u64[0]);
          +[MLParameterKey objective](MLParameterKey, "objective", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:stringParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:stringParameterSpec:", v67, &v88);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v68);

          +[MLParameterKey objective](MLParameterKey, "objective");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v69);

          v88 = &off_1E3D4F798;
          google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
          google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
        }
        objc_msgSend(v11, "name");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterKey updateType](MLParameterKey, "updateType");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "name");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v70, "isEqualToString:", v72);

        if (v73)
        {
          CoreML::Specification::StringParameter::StringParameter((CoreML::Specification::StringParameter *)&v88);
          objc_msgSend(v6, "parameters");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v11);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v75, "isEqualToString:", CFSTR("treeRefresh")) & 1) == 0
            && (objc_msgSend(v75, "isEqualToString:", CFSTR("treeAddition")) & 1) == 0)
          {
            if (a5)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Update type must be either %@ or %@."), CFSTR("treeRefresh"), CFSTR("treeAddition"));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_37:
            v88 = &off_1E3D4F798;
            google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
            google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
            v81 = 0;
            goto LABEL_38;
          }
          v76 = objc_retainAutorelease(v75);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v76, "UTF8String"));
          *(_QWORD *)&v77 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v90, &__p).n128_u64[0];
          if (v96 < 0)
            operator delete((void *)__p.n128_u64[0]);
          +[MLParameterKey updateType](MLParameterKey, "updateType", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLParameterDescription parameterDescriptionForKey:stringParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:stringParameterSpec:", v78, &v88);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v79);

          +[MLParameterKey updateType](MLParameterKey, "updateType");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v80);

          v88 = &off_1E3D4F798;
          google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
          google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
      if (v9)
        continue;
      break;
    }
  }

  +[MLParameterUtils appendParameterDescriptions:toModelDescription:](MLParameterUtils, "appendParameterDescriptions:toModelDescription:", v8, v84);
  objc_msgSend(v84, "parameterDescriptionsByKey");
  obj = (id)objc_claimAutoreleasedReturnValue();
  +[MLParameterContainer parameterContainerFor:descriptions:](MLParameterContainer, "parameterContainerFor:descriptions:", v7, obj);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v81;
}

- (id)updateParameters
{
  void *v2;
  void *v3;

  -[MLTreeEnsembleXGBoostUpdateEngine parameterContainer](self, "parameterContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentParameterValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MLTreeEnsembleXGBoostUpdateEngine setProgressHandlers:](self, "setProgressHandlers:", v7);
  -[MLTreeEnsembleXGBoostUpdateEngine setProgressHandlersDispatchQueue:](self, "setProgressHandlersDispatchQueue:", v6);

}

- (void)updateModelWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *__p;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  -[MLTreeEnsembleXGBoostUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
  v42 = 0;
  -[MLTreeEnsembleXGBoostClassifier xgBoostDataFormatFromBatchProvider:needLabels:error:](self, "xgBoostDataFormatFromBatchProvider:needLabels:error:", v39, 1, &v42);
  v4 = v42;
  if (v4)
  {
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispatchTrainingCompletionHandlerWithError:onQueue:", v4, v6);

    goto LABEL_34;
  }
  -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_msgSend(v7, "interestedEvents") & 1) == 0;

  if (!v8)
  {
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine updateParameters](self, "updateParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dispatchTrainingBeginProgressHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], v10, v11);

  }
  v53[0] = 0;
  v12 = v43;
  v13 = v47;
  v14 = v48;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v15 = getXGDMatrixCreateFromMatSymbolLoc(void)::ptr;
  v52 = getXGDMatrixCreateFromMatSymbolLoc(void)::ptr;
  if (!getXGDMatrixCreateFromMatSymbolLoc(void)::ptr)
  {
    v16 = (void *)XGBoostFrameworkLibrary();
    v15 = dlsym(v16, "XGDMatrixCreateFromMat");
    v50[3] = (uint64_t)v15;
    getXGDMatrixCreateFromMatSymbolLoc(void)::ptr = v15;
  }
  _Block_object_dispose(&v49, 8);
  if (!v15)
    goto LABEL_40;
  ((void (*)(void *, uint64_t, uint64_t, uint64_t *, float))v15)(v12, v13, v14, v53, -1.0);
  v17 = v53[0];
  v18 = __p;
  v19 = v47;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v20 = getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr;
  v52 = getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr;
  if (!getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr)
  {
    v21 = (void *)XGBoostFrameworkLibrary();
    v20 = dlsym(v21, "XGDMatrixSetFloatInfo");
    v50[3] = (uint64_t)v20;
    getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr = v20;
  }
  _Block_object_dispose(&v49, 8);
  if (!v20)
    goto LABEL_40;
  ((void (*)(uint64_t, const char *, void *, uint64_t))v20)(v17, "label", v18, v19);
  if (!-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"))
  {
    v41 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v22 = getXGBoosterCreateSymbolLoc(void)::ptr;
    v52 = getXGBoosterCreateSymbolLoc(void)::ptr;
    if (!getXGBoosterCreateSymbolLoc(void)::ptr)
    {
      v23 = (void *)XGBoostFrameworkLibrary();
      v22 = dlsym(v23, "XGBoosterCreate");
      v50[3] = (uint64_t)v22;
      getXGBoosterCreateSymbolLoc(void)::ptr = v22;
    }
    _Block_object_dispose(&v49, 8);
    if (v22)
    {
      ((void (*)(uint64_t *, uint64_t, uint64_t *))v22)(v53, 1, &v41);
      -[MLTreeEnsembleXGBoostClassifier setBooster:](self, "setBooster:", v41);
      goto LABEL_17;
    }
LABEL_40:
    dlerror();
    abort_report_np();
LABEL_41:
    __break(1u);
  }
  -[MLTreeEnsembleXGBoostUpdateEngine setPersonalization:](self, "setPersonalization:", 1);
LABEL_17:
  if (-[MLTreeEnsembleXGBoostClassifier booster](self, "booster"))
  {
    v24 = 0;
  }
  else
  {
    softLink_XGDMatrixFree(v53[0]);
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot create update instance."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dispatchTrainingCompletionHandlerWithError:onQueue:", v24, v26);

  }
  v40 = v24;
  v27 = -[MLTreeEnsembleXGBoostUpdateEngine setBoosterParameters:error:](self, "setBoosterParameters:error:", -[MLTreeEnsembleXGBoostClassifier booster](self, "booster"), &v40);
  v4 = v40;

  if (!v27)
  {
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dispatchTrainingCompletionHandlerWithError:onQueue:", v4, v37);
    goto LABEL_33;
  }
  +[MLParameterKey numTrees](MLParameterKey, "numTrees");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedIntValue");

  if (!v30)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("numTrees Parameter must be provided and it should be > 1."));
    v38 = objc_claimAutoreleasedReturnValue();

    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dispatchTrainingCompletionHandlerWithError:onQueue:", v38, v37);
    goto LABEL_32;
  }
  v31 = 0;
  while (1)
  {
    v32 = -[MLTreeEnsembleXGBoostClassifier booster](self, "booster");
    v33 = v53[0];
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v34 = getXGBoosterUpdateOneIterSymbolLoc(void)::ptr;
    v52 = getXGBoosterUpdateOneIterSymbolLoc(void)::ptr;
    if (!getXGBoosterUpdateOneIterSymbolLoc(void)::ptr)
    {
      v35 = (void *)XGBoostFrameworkLibrary();
      v34 = dlsym(v35, "XGBoosterUpdateOneIter");
      v50[3] = (uint64_t)v34;
      getXGBoosterUpdateOneIterSymbolLoc(void)::ptr = v34;
    }
    _Block_object_dispose(&v49, 8);
    if (!v34)
    {
      dlerror();
      abort_report_np();
      goto LABEL_41;
    }
    if (((unsigned int (*)(void *, uint64_t, uint64_t))v34)(v32, v31, v33) == -1)
      break;
    if (v30 == ++v31)
    {
      softLink_XGDMatrixFree(v53[0]);
      -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dispatchTrainingCompletionHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v37);
      goto LABEL_33;
    }
  }
  softLink_XGDMatrixFree(v53[0]);
  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Failed to train at iteration number: %lu"), v31);
  v38 = objc_claimAutoreleasedReturnValue();

  -[MLTreeEnsembleXGBoostUpdateEngine progressHandlers](self, "progressHandlers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dispatchTrainingCompletionHandlerWithError:onQueue:", v38, v37);
LABEL_32:
  v4 = (id)v38;
LABEL_33:

LABEL_34:
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }

}

- (BOOL)setBoosterParameters:(void *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t v26[16];

  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MLParameterKey maxDepth](MLParameterKey, "maxDepth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[MLParameterKey numClasses](MLParameterKey, "numClasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[MLParameterKey minChildWeight](MLParameterKey, "minChildWeight");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          +[MLParameterKey objective](MLParameterKey, "objective");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = v20 != 0;
          if (v20)
          {
            +[MLParameterKey updateType](MLParameterKey, "updateType");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23 && !-[MLTreeEnsembleXGBoostUpdateEngine personalization](self, "personalization"))
            {
              +[MLLogging coreChannel](MLLogging, "coreChannel");
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v26 = 0;
                _os_log_impl(&dword_19C486000, v24, OS_LOG_TYPE_INFO, "updateType can only be used for personalization use case while the current use case is not personalization. This parameter is ignored.", v26, 2u);
              }

            }
            softLink_XGBoosterSetParam(a3, "eta", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
            softLink_XGBoosterSetParam(a3, "max_depth", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
            softLink_XGBoosterSetParam(a3, "num_class", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
            softLink_XGBoosterSetParam(a3, "min_child_weight", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
            softLink_XGBoosterSetParam(a3, "objective", (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
            if (-[MLTreeEnsembleXGBoostUpdateEngine personalization](self, "personalization")
              && objc_msgSend(v23, "isEqualToString:", CFSTR("treeRefresh")))
            {
              softLink_XGBoosterSetParam(a3, "process_type", "update");
              softLink_XGBoosterSetParam(a3, "updater", "refresh");
            }

          }
          else if (a4)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("objective parameter must be provided."));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else if (a4)
        {
          +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("minChildWeight parameter must be provided."));
          v21 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }

      }
      else if (a4)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("numClasses parameter must be provided."));
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

    }
    else if (a4)
    {
      +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("maxDepth Parameter must be provided."));
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("learningRate Parameter must be provided."));
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)parameterValueForKey:(id)a3
{
  -[MLTreeEnsembleXGBoostUpdateEngine parameterValueForKey:error:](self, "parameterValueForKey:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!objc_msgSend(v6, "hasGlobalScope"))
    goto LABEL_3;
  -[MLTreeEnsembleXGBoostUpdateEngine parameterContainer](self, "parameterContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentParameterValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Updated tree ensemble classifier model does not have a parameter for requested key %@."), v6);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)resumeUpdate
{
  -[MLTreeEnsembleXGBoostUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (void)cancelUpdate
{
  -[MLTreeEnsembleXGBoostUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 0);
}

- (void)resumeUpdateWithParameters:(id)a3
{
  -[MLTreeEnsembleXGBoostUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  BOOL result;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;

  v6 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v9 = +[MLSaver copyModelAtURL:toURL:error:](MLSaver, "copyModelAtURL:toURL:error:", v8, v6, &v23);
  v10 = v23;

  if (!v9)
  {
    if (!a4)
    {
      v21 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to copy original model files to the new destionation: %@"), v12);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
    return v21;
  }
  objc_msgSend(v6, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mlmodelc"), CFSTR(".xgboost"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MLTreeEnsembleXGBoostClassifier booster](self, "booster");
  v16 = objc_retainAutorelease(v14);
  v17 = objc_msgSend(v16, "UTF8String");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v18 = getXGBoosterSaveModelSymbolLoc(void)::ptr;
  v27 = getXGBoosterSaveModelSymbolLoc(void)::ptr;
  if (!getXGBoosterSaveModelSymbolLoc(void)::ptr)
  {
    v19 = (void *)XGBoostFrameworkLibrary();
    v18 = dlsym(v19, "XGBoosterSaveModel");
    v25[3] = (uint64_t)v18;
    getXGBoosterSaveModelSymbolLoc(void)::ptr = v18;
  }
  _Block_object_dispose(&v24, 8);
  if (v18)
  {
    v20 = ((uint64_t (*)(void *, uint64_t))v18)(v15, v17);
    v21 = v20 != -1;
    if (a4)
    {
      if (v20 == -1)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot save the trained model."));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_11;
  }
  dlerror();
  result = abort_report_np();
  __break(1u);
  return result;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (void)setProgressHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlers, a3);
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return self->_progressHandlersDispatchQueue;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, a3);
}

- (BOOL)continueWithUpdate
{
  return self->_continueWithUpdate;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  self->_continueWithUpdate = a3;
}

- (BOOL)personalization
{
  return self->_personalization;
}

- (void)setPersonalization:(BOOL)a3
{
  self->_personalization = a3;
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (void)setParameterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parameterContainer, a3);
}

- (vector<std::string,)classesByString
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::string, std::allocator<std::string>> *)std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)retstr, (__int128 *)self->_classesByString.__begin_, (__int128 *)self->_classesByString.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_classesByString.__end_- (char *)self->_classesByString.__begin_) >> 3));
}

- (void)setClassesByString:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  vector<std::string, std::allocator<std::string>> *p_classesByString;

  p_classesByString = &self->_classesByString;
  if (p_classesByString != a3)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)p_classesByString, (std::string *)a3->__begin_, (__int128 *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
}

- (vector<long)classesByInt
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<long long, std::allocator<long long>> *)std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(retstr, self->_classesByInt.__begin_, (uint64_t)self->_classesByInt.__end_, self->_classesByInt.__end_ - self->_classesByInt.__begin_);
}

- (void)setClassesByInt:(vector<long)long
{
  char *p_classesByInt;

  p_classesByInt = (char *)&self->_classesByInt;
  if (p_classesByInt != (char *)a3)
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>(p_classesByInt, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (shared_ptr<Archiver::MMappedFile>)mmappedModel
{
  MMappedFile **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Archiver::MMappedFile> result;

  cntrl = self->_mmappedModel.__cntrl_;
  *v2 = self->_mmappedModel.__ptr_;
  v2[1] = (MMappedFile *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MMappedFile *)self;
  return result;
}

- (void)setMmappedModel:(shared_ptr<Archiver::MMappedFile>)a3
{
  __shared_weak_count *v3;
  MMappedFile *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(MMappedFile **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_mmappedModel.__cntrl_;
  self->_mmappedModel.__ptr_ = v4;
  self->_mmappedModel.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (vector<unsigned)cachedModel
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned char, std::allocator<unsigned char>> *)std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(retstr, self->_cachedModel.__begin_, (uint64_t)self->_cachedModel.__end_, self->_cachedModel.__end_- self->_cachedModel.__begin_);
}

- (void)setCachedModel:(vector<unsigned)char
{
  vector<unsigned char, std::allocator<unsigned char>> *p_cachedModel;
  char *begin;
  char *end;
  size_t v6;
  char *value;
  char *v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  p_cachedModel = &self->_cachedModel;
  if (&self->_cachedModel != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v6 = end - a3->__begin_;
    value = self->_cachedModel.__end_cap_.__value_;
    v8 = p_cachedModel->__begin_;
    if (value - p_cachedModel->__begin_ >= v6)
    {
      v11 = self->_cachedModel.__end_;
      v12 = v11 - v8;
      if (v11 - v8 < v6)
      {
        v13 = &begin[v12];
        if (v11 != v8)
        {
          memmove(p_cachedModel->__begin_, begin, v12);
          v8 = p_cachedModel->__end_;
        }
        if (end != v13)
          memmove(v8, v13, end - v13);
        v14 = &v8[end - v13];
        goto LABEL_21;
      }
    }
    else
    {
      if (v8)
      {
        self->_cachedModel.__end_ = v8;
        operator delete(v8);
        value = 0;
        p_cachedModel->__begin_ = 0;
        p_cachedModel->__end_ = 0;
        p_cachedModel->__end_cap_.__value_ = 0;
      }
      if ((v6 & 0x8000000000000000) != 0)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      v9 = 2 * (_QWORD)value;
      if (2 * (uint64_t)value <= v6)
        v9 = v6;
      if ((unint64_t)value >= 0x3FFFFFFFFFFFFFFFLL)
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v10 = v9;
      std::vector<unsigned char>::__vallocate[abi:ne180100](p_cachedModel, v10);
      v8 = p_cachedModel->__end_;
    }
    if (end != begin)
      memmove(v8, begin, v6);
    v14 = &v8[v6];
LABEL_21:
    p_cachedModel->__end_ = v14;
  }
}

- (void).cxx_destruct
{
  vector<unsigned char, std::allocator<unsigned char>> *p_cachedModel;
  char *begin;
  int64_t *v5;
  vector<std::string, std::allocator<std::string>> *p_classesByString;

  p_cachedModel = &self->_cachedModel;
  begin = self->_cachedModel.__begin_;
  if (begin)
  {
    p_cachedModel->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_classesByInt.__begin_;
  if (v5)
  {
    self->_classesByInt.__end_ = v5;
    operator delete(v5);
  }
  p_classesByString = &self->_classesByString;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_classesByString);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_mmappedModel);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  return self;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v11 = a5;
  v12 = a6;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "majorVersion");
  if (v14 >= objc_msgSend(v11, "majorVersion"))
  {
    a7 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithCompiledArchive:configuration:error:", a3, v12, a7);
  }
  else if (a7)
  {
    objc_msgSend(v11, "versionNumberString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "versionNumberString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v15, v16);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return a7;
}

@end
