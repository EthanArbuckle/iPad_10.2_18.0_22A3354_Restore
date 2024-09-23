@implementation MLModelStructureNeuralNetwork

- (MLModelStructureNeuralNetwork)initWithLayers:(id)a3
{
  id v4;
  MLModelStructureNeuralNetwork *v5;
  uint64_t v6;
  NSArray *layers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureNeuralNetwork;
  v5 = -[MLModelStructureNeuralNetwork init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    layers = v5->_layers;
    v5->_layers = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)layers
{
  return self->_layers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  void *v41;
  uint64_t **v42;
  void *v43;
  uint64_t **v44;
  void *v45;
  std::string::size_type v46;
  char v47;
  MLModelStructurePath *v48;
  MLModelStructurePath *v49;
  MLModelStructureNeuralNetworkLayer *v50;
  std::__shared_weak_count *v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id *v62;
  id v63;
  id v64;
  MLModelConfiguration *v65;
  void *v66;
  void *v67;
  __int128 v69;
  uint64_t v70;
  std::string v71;
  __int128 v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  std::__shared_weak_count *v76;
  void **v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint8_t buf[8];
  _BYTE v85[15];
  char v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v63 = a4;
  v64 = a5;
  v62 = a7;
  v65 = objc_alloc_init(MLModelConfiguration);
  +[MLNeuralNetworkV1Container containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLNeuralNetworkV1Container, "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v63, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v66)
  {
LABEL_29:
    v30 = 0;
    goto LABEL_59;
  }
  if (!espresso_create_context())
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Failed to create the context for loading the NeuralNetwork model structure.", buf, 2u);
    }

    if (a7)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create the context for loading the NeuralNetwork model structure."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v20);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  if (!espresso_create_plan())
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Failed to create the plan for loading the NeuralNetwork model structure.", buf, 2u);
    }

    if (a7)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v80 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create the plan for loading the NeuralNetwork model structure."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    espresso_context_destroy();
    goto LABEL_29;
  }
  v10 = v66;
  objc_msgSend(v10, "compilerOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "network");
    if (*(_QWORD *)v85)
    {
      v13 = (unint64_t *)(*(_QWORD *)v85 + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        (*(void (**)(_QWORD))(**(_QWORD **)v85 + 16))(*(_QWORD *)v85);
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v85);
      }
    }
    if (*(_QWORD *)buf)
    {
      objc_msgSend(v12, "network");
      espresso_plan_add_cpp_net();
      if (*((_QWORD *)&v72 + 1))
      {
        v15 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v72 + 1) + 16))(*((_QWORD *)&v72 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v72 + 1));
        }
      }

LABEL_30:
      Espresso::get_internal_network();
      v31 = v75;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(v75[5] - v75[4]) >> 4);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      v32 = v75[4];
      if (v75[5] != v32)
      {
        v33 = 0;
        v34 = 0;
        do
        {
          v35 = *(_QWORD *)(v32 + v33);
          v36 = (uint64_t *)(v35 + 16);
          v37 = v35 + 16;
          if (*(char *)(v35 + 39) < 0)
            v37 = *v36;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *(_QWORD *)(v32 + v33);
          v40 = (_QWORD *)(v39 + 40);
          if (*(char *)(v39 + 63) < 0)
            v40 = (_QWORD *)*v40;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v75 + 7, v34, &v74);
          CoreML::stringArrayToObjC(v42 + 3);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v75 + 12, v34, &v74);
          CoreML::stringArrayToObjC(v44 + 3);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0uLL;
          v73 = 0;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v72, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
          if (*(char *)(v35 + 39) < 0)
          {
            std::string::__init_copy_ctor_external(&v71, *(const std::string::value_type **)(v35 + 16), *(_QWORD *)(v35 + 24));
          }
          else
          {
            *(_OWORD *)&v71.__r_.__value_.__l.__data_ = *(_OWORD *)v36;
            v71.__r_.__value_.__r.__words[2] = *(_QWORD *)(v35 + 32);
          }
          *(_QWORD *)v85 = v71.__r_.__value_.__l.__size_;
          v46 = v71.__r_.__value_.__r.__words[0];
          *(_QWORD *)&v85[7] = *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 7);
          v47 = HIBYTE(v71.__r_.__value_.__r.__words[2]);
          memset(&v71, 0, sizeof(v71));
          *(_QWORD *)buf = v46;
          v86 = v47;
          v87 = 6;
          CoreML::ModelStructure::Path::appendComponent((uint64_t)&v72, (uint64_t)buf);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
          if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v71.__r_.__value_.__l.__data_);
          v48 = [MLModelStructurePath alloc];
          v69 = v72;
          v70 = v73;
          v73 = 0;
          v72 = 0uLL;
          v49 = -[MLModelStructurePath initWithCppPath:](v48, "initWithCppPath:", &v69);
          v77 = (void **)&v69;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v77);
          v50 = -[MLModelStructureNeuralNetworkLayer initWithName:type:inputNames:outputNames:path:]([MLModelStructureNeuralNetworkLayer alloc], "initWithName:type:inputNames:outputNames:path:", v38, v41, v43, v45, v49);
          objc_msgSend(v67, "addObject:", v50);

          v77 = (void **)&v72;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v77);

          v74 = ++v34;
          v32 = v31[4];
          v33 += 16;
        }
        while (v34 < (v31[5] - v32) >> 4);
      }
      v51 = v76;
      if (v76)
      {
        p_shared_owners = (unint64_t *)&v76->__shared_owners_;
        do
          v53 = __ldaxr(p_shared_owners);
        while (__stlxr(v53 - 1, p_shared_owners));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
      }
      v24 = 0;
      v25 = v67;
      goto LABEL_51;
    }
  }
  objc_msgSend(v10, "modelFilePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length") == 0;

  if (v22)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v54, OS_LOG_TYPE_ERROR, "This is a logic error, encountered unexpected internal state when loading the NeuralNetwork model structure.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This is a logic error, encountered unexpected internal state when loading the NeuralNetwork model structure."));
    v25 = 0;
    v24 = 4294967294;
    goto LABEL_51;
  }
  objc_msgSend(v10, "modelFilePath");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v23, "UTF8String");
  v24 = espresso_plan_add_network();

  if (!(_DWORD)v24)
    goto LABEL_30;
  v25 = 0;
LABEL_51:
  espresso_plan_destroy();
  espresso_context_destroy();
  v55 = v25;
  if (v25)
  {
    v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLayers:", v25);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_19C486000, v56, OS_LOG_TYPE_ERROR, "Failed to load the NeuralNetwork model structure due to error code: %d.", buf, 8u);
    }

    if (v62)
    {
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load the NeuralNetwork model structure due to error code: %d."), v24);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v59);
      *v62 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = 0;
  }

LABEL_59:
  return v30;
}

@end
