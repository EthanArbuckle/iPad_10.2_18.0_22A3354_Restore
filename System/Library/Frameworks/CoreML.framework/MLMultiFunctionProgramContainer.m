@implementation MLMultiFunctionProgramContainer

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  void *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___MLMultiFunctionProgramContainer;
  objc_msgSendSuper2(&v17, sel_containerFromCompiledArchive_modelVersionInfo_compilerVersionInfo_configuration_error_, a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "loadProgramFromCompiledArchive:error:", a3, a7);
    if (v15)
      v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:program:error:", v10, v15, a7);
    else
      v11 = 0;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)())v16->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MLMultiFunctionProgramContainer)initWithContainer:(id)a3 program:(const void *)a4 error:(id *)a5
{
  uint64_t **v6;
  MLMultiFunctionProgramContainer *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t Function;
  uint64_t v12;
  __int128 **v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void **v29;
  char *v30;
  uint64_t **v31;
  std::string *v32;
  __int128 v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  MLMultiFunctionProgramContainer *v52;
  MLMultiFunctionProgramContainer *v54;
  void *v56;
  void *v57;
  std::string *v59;
  char *v60;
  uint64_t v61;
  char **v62;
  char *v63;
  uint64_t v64;
  char **v65;
  char *v66;
  uint64_t v67;
  char **v68;
  char *v69;
  uint64_t v70;
  char **v71;
  char *v72;
  uint64_t v73;
  char **v74;
  char *v75;
  uint64_t v76;
  std::string v77;
  _BYTE v78[16];
  uint64_t *v79;
  objc_super v80;
  _QWORD v81[2];
  char v82;
  uint64_t v83;

  v6 = (uint64_t **)a3;
  v80.receiver = self;
  v80.super_class = (Class)MLMultiFunctionProgramContainer;
  v7 = -[MLMultiFunctionProgramContainer init](&v80, sel_init);
  if (!v7)
    goto LABEL_42;
  v8 = (*(uint64_t (**)(const void *))(*(_QWORD *)a4 + 72))(a4);
  std::unordered_map<std::string,std::shared_ptr<MIL::IRFunction>>::unordered_map((uint64_t)v78, v8);
  v57 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v54 = v7;
  v56 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v9 = v79;
  if (!v79)
  {
LABEL_41:
    objc_msgSend(v6, "setFunctionNameToOutputLayersNames:", v57);
    objc_msgSend(v6, "setFunctionNameToInputLayersNames:", v56);

    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)v78);
    v7 = v54;
LABEL_42:
    v52 = v6;
    goto LABEL_43;
  }
  while (1)
  {
    v10 = v9 + 2;
    Function = MIL::IRProgram::GetFunction();
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)Function + 40))(Function);
    v13 = (__int128 **)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 88))(v12);
    memset(&v77, 0, sizeof(v77));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v77, *v13, v13[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v13[1] - (char *)*v13) >> 3));
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v15 = MIL::IRProgram::GetFunction();
    v16 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 128))(v15);
    v17 = v16 + 1;
    v18 = (_QWORD *)*v16;
    if ((_QWORD *)*v16 != v16 + 1)
    {
      do
      {
        v19 = v18 + 4;
        if (*((char *)v18 + 55) < 0)
          v19 = (_QWORD *)*v19;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        v21 = (_QWORD *)v18[1];
        if (v21)
        {
          do
          {
            v22 = v21;
            v21 = (_QWORD *)*v21;
          }
          while (v21);
        }
        else
        {
          do
          {
            v22 = (_QWORD *)v18[2];
            v23 = *v22 == (_QWORD)v18;
            v18 = v22;
          }
          while (!v23);
        }
        v18 = v22;
      }
      while (v22 != v17);
    }
    v24 = (uint64_t)(v9 + 2);
    if (*((char *)v9 + 39) < 0)
      v24 = *v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v14, v25);

    CoreML::stringArrayToObjC((uint64_t **)&v77);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (uint64_t)(v9 + 2);
    if (*((char *)v9 + 39) < 0)
      v27 = *v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v26, v28);

    v60 = 0;
    v61 = 0;
    v63 = 0;
    v64 = 0;
    v59 = (std::string *)&v60;
    v62 = &v63;
    v66 = 0;
    v67 = 0;
    v69 = 0;
    v70 = 0;
    v65 = &v66;
    v68 = &v69;
    v72 = 0;
    v73 = 0;
    v75 = 0;
    v76 = 0;
    v71 = &v72;
    v74 = &v75;
    if (!+[MLProgramContainer populateInputNameToShapeMap:fromContainer:forFunction:program:withValidation:error:](MLProgramContainer, "populateInputNameToShapeMap:fromContainer:forFunction:program:withValidation:error:", &v59, v6, v9 + 2, a4, 0, a5))break;
    v29 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)(v6 + 39), &v83, v9 + 2);
    v30 = (char *)*v29;
    if (!*v29)
    {
      v31 = (uint64_t **)v29;
      v30 = (char *)operator new(0xC8uLL);
      v81[0] = v30;
      v81[1] = v6 + 40;
      v82 = 0;
      v32 = (std::string *)(v30 + 32);
      if (*((char *)v9 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v32, (const std::string::value_type *)v9[2], v9[3]);
      }
      else
      {
        v33 = *(_OWORD *)v10;
        *((_QWORD *)v30 + 6) = v9[4];
        *(_OWORD *)&v32->__r_.__value_.__l.__data_ = v33;
      }
      *((_QWORD *)v30 + 8) = 0;
      *((_QWORD *)v30 + 7) = v30 + 64;
      *((_QWORD *)v30 + 11) = 0;
      *((_QWORD *)v30 + 9) = 0;
      *((_QWORD *)v30 + 10) = v30 + 88;
      *((_QWORD *)v30 + 14) = 0;
      *((_QWORD *)v30 + 12) = 0;
      *((_QWORD *)v30 + 13) = v30 + 112;
      *((_QWORD *)v30 + 17) = 0;
      *((_QWORD *)v30 + 15) = 0;
      *((_QWORD *)v30 + 16) = v30 + 136;
      *((_QWORD *)v30 + 20) = 0;
      *((_QWORD *)v30 + 18) = 0;
      *((_QWORD *)v30 + 19) = v30 + 160;
      *((_QWORD *)v30 + 24) = 0;
      *((_QWORD *)v30 + 23) = 0;
      *((_QWORD *)v30 + 21) = 0;
      *((_QWORD *)v30 + 22) = v30 + 184;
      v82 = 1;
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(v6 + 39, v83, v31, (uint64_t *)v30);
      v81[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,InputNameToShapes>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,InputNameToShapes>,void *>>>>::reset[abi:ne180100]((uint64_t)v81);
    }
    v34 = v30 + 64;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 8));
    v35 = v60;
    *((_QWORD *)v30 + 7) = v59;
    *((_QWORD *)v30 + 8) = v35;
    v36 = v61;
    *((_QWORD *)v30 + 9) = v61;
    if (v36)
    {
      *((_QWORD *)v35 + 2) = v34;
      v59 = (std::string *)&v60;
      v60 = 0;
      v61 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 7) = v34;
    }
    v37 = v30 + 88;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 11));
    v38 = v63;
    *((_QWORD *)v30 + 10) = v62;
    *((_QWORD *)v30 + 11) = v38;
    v39 = v64;
    *((_QWORD *)v30 + 12) = v64;
    if (v39)
    {
      *((_QWORD *)v38 + 2) = v37;
      v62 = &v63;
      v63 = 0;
      v64 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 10) = v37;
    }
    v40 = v30 + 112;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 14));
    v41 = v66;
    *((_QWORD *)v30 + 13) = v65;
    *((_QWORD *)v30 + 14) = v41;
    v42 = v67;
    *((_QWORD *)v30 + 15) = v67;
    if (v42)
    {
      *((_QWORD *)v41 + 2) = v40;
      v65 = &v66;
      v66 = 0;
      v67 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 13) = v40;
    }
    v43 = v30 + 136;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 17));
    v44 = v69;
    *((_QWORD *)v30 + 16) = v68;
    *((_QWORD *)v30 + 17) = v44;
    v45 = v70;
    *((_QWORD *)v30 + 18) = v70;
    if (v45)
    {
      *((_QWORD *)v44 + 2) = v43;
      v68 = &v69;
      v69 = 0;
      v70 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 16) = v43;
    }
    v46 = v30 + 160;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 20));
    v47 = v72;
    *((_QWORD *)v30 + 19) = v71;
    *((_QWORD *)v30 + 20) = v47;
    v48 = v73;
    *((_QWORD *)v30 + 21) = v73;
    if (v48)
    {
      *((_QWORD *)v47 + 2) = v46;
      v71 = &v72;
      v72 = 0;
      v73 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 19) = v46;
    }
    v49 = v30 + 184;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 23));
    v50 = v75;
    *((_QWORD *)v30 + 22) = v74;
    *((_QWORD *)v30 + 23) = v50;
    v51 = v76;
    *((_QWORD *)v30 + 24) = v76;
    if (v51)
    {
      *((_QWORD *)v50 + 2) = v49;
      v50 = 0;
      v74 = &v75;
      v75 = 0;
      v76 = 0;
    }
    else
    {
      *((_QWORD *)v30 + 22) = v49;
    }
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v50);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v72);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v69);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v66);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v63);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v60);

    v59 = &v77;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
    v9 = (uint64_t *)*v9;
    if (!v9)
      goto LABEL_41;
  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v75);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v72);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v69);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v66);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v63);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v60);

  v59 = &v77;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);

  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)v78);
  v52 = 0;
  v7 = v54;
LABEL_43:

  return v52;
}

- (NSString)activeFunction
{
  return self->_activeFunction;
}

- (void)setActiveFunction:(id)a3
{
  id v5;
  NSString **p_activeFunction;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t **p_functionNameToInputShapes;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  _OWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  void *__p[2];
  char v19;
  void **v20;

  v5 = a3;
  p_activeFunction = &self->_activeFunction;
  objc_storeStrong((id *)&self->_activeFunction, a3);
  -[MLMultiFunctionProgramContainer functionNameToOutputLayersNames](self, "functionNameToOutputLayersNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", self->_activeFunction);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkContainer setOutputLayerNames:](self, "setOutputLayerNames:", v8);

  -[MLMultiFunctionProgramContainer functionNameToInputLayersNames](self, "functionNameToInputLayersNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", self->_activeFunction);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkContainer setInputLayerNames:](self, "setInputLayerNames:", v10);

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](self->_activeFunction, "UTF8String"));
  p_functionNameToInputShapes = (uint64_t **)&self->functionNameToInputShapes;
  v20 = __p;
  v12 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.widths != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v12 + 56))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.widths, *((_QWORD **)v12 + 7), (_QWORD *)v12 + 8);
  if (v19 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](*p_activeFunction, "UTF8String"));
  v20 = __p;
  v13 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.heights != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v13 + 5))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.heights, *((_QWORD **)v13 + 10), (_QWORD *)v13 + 11);
  if (v19 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](*p_activeFunction, "UTF8String"));
  v20 = __p;
  v14 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.ks != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v14 + 104))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.ks, *((_QWORD **)v14 + 13), (_QWORD *)v14 + 14);
  if (v19 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](*p_activeFunction, "UTF8String"));
  v20 = __p;
  v15 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.batches != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v15 + 8))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.batches, *((_QWORD **)v15 + 16), (_QWORD *)v15 + 17);
  if (v19 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](*p_activeFunction, "UTF8String"));
  v20 = __p;
  v16 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.sequences != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v16 + 152))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.sequences, *((_QWORD **)v16 + 19), (_QWORD *)v16 + 20);
  if (v19 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](*p_activeFunction, "UTF8String"));
  v20 = __p;
  v17 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.ranks != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v17 + 11))
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.ranks, *((_QWORD **)v17 + 22), (_QWORD *)v17 + 23);
  if (v19 < 0)
    operator delete(__p[0]);

}

- (NSDictionary)functionNameToOutputLayersNames
{
  return self->_functionNameToOutputLayersNames;
}

- (void)setFunctionNameToOutputLayersNames:(id)a3
{
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, a3);
}

- (NSDictionary)functionNameToInputLayersNames
{
  return self->_functionNameToInputLayersNames;
}

- (void)setFunctionNameToInputLayersNames:(id)a3
{
  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, 0);
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, 0);
  objc_storeStrong((id *)&self->_activeFunction, 0);
  std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::destroy((_QWORD *)self->functionNameToInputShapes.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 39) = (char *)self + 320;
  return self;
}

@end
