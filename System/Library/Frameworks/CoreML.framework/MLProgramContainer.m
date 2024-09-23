@implementation MLProgramContainer

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t **v17;
  uint64_t **v18;
  uint64_t v19;
  uint64_t Attribute;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Function;
  uint64_t v27;
  __int128 **v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  char v33;
  void *v34;
  void *v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  std::string __p;
  char **v41;
  char *v42[2];
  char **v43;
  char *v44[2];
  char **v45;
  char *v46[2];
  char **v47;
  char *v48[2];
  char **v49;
  char *v50[2];
  void **v51[2];
  char v52;
  uint64_t v53;
  std::__shared_weak_count *v54;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a1, "loadProgramFromCompiledArchive:error:", a3, a7);
  if (v53)
  {
    URLOfMILTextInArchive((_MLModelInputArchiver *)a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "containerFromCompiledArchiveCommon:filename:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v16, v12, v13, v14, a7);
    v17 = (uint64_t **)objc_claimAutoreleasedReturnValue();

    if (*a7)
    {
      v18 = 0;
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(v17, "modelDescription");
    v19 = objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(v51, "main");
    MIL::IRProgram::GetFunction();
    std::string::basic_string[abi:ne180100]<0>(&__p, "CoreML_IsRank5ArrayMapping");
    Attribute = MIL::IRObject::TryGetAttribute();
    v21 = Attribute;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (v21)
        goto LABEL_7;
    }
    else if (Attribute)
    {
LABEL_7:
      v22 = MIL::IRValue::GetScalar<BOOL>();
      goto LABEL_10;
    }
    v22 = 0;
LABEL_10:
    objc_msgSend(v17, "setNdArrayInterpretation:", v22 ^ 1u);
    if (v52 < 0)
      operator delete(v51[0]);
    objc_msgSend(v17, "setModelIsMIL:", 1);
    v23 = v53;
    std::string::basic_string[abi:ne180100]<0>(&__p, "train");
    v24 = (*(uint64_t (**)(uint64_t, std::string *))(*(_QWORD *)v23 + 56))(v23, &__p);
    v25 = v24;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (!v25)
        goto LABEL_17;
    }
    else if (!v24)
    {
LABEL_17:
      std::string::basic_string[abi:ne180100]<0>(v51, "main");
      Function = MIL::IRProgram::GetFunction();
      v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)Function + 40))(Function);
      v28 = (__int128 **)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 88))(v27);
      memset(&__p, 0, sizeof(__p));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, *v28, v28[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v28[1] - (char *)*v28) >> 3));
      if (v52 < 0)
        operator delete(v51[0]);
      CoreML::stringArrayToObjC((uint64_t **)&__p);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOutputLayerNames:", v29);

      v51[0] = (void **)&__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51);
      v30 = v53;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "updateOptionalDefaultValueParametersInContainer:usingProgram:functionName:modelDescription:", v17, v30, v31, v19);

      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
      *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
      v42[0] = 0;
      v42[1] = 0;
      v41 = v42;
      v43 = v44;
      v44[0] = 0;
      v46[0] = 0;
      v46[1] = 0;
      v44[1] = 0;
      v45 = v46;
      v47 = v48;
      v48[0] = 0;
      v50[0] = 0;
      v50[1] = 0;
      v48[1] = 0;
      v49 = v50;
      std::string::basic_string[abi:ne180100]<0>(v51, "main");
      v32 = objc_msgSend(a1, "populateInputNameToShapeMap:fromContainer:forFunction:program:withValidation:error:", &__p, v17, v51, v53, objc_msgSend(v17, "modelIsTrainingProgram") ^ 1, a7);
      v33 = v32;
      if (v52 < 0)
      {
        operator delete(v51[0]);
        if ((v33 & 1) != 0)
          goto LABEL_21;
      }
      else if ((v32 & 1) != 0)
      {
LABEL_21:
        if (v17 + 1 != (uint64_t **)&__p)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 1, __p.__r_.__value_.__l.__data_, &__p.__r_.__value_.__l.__size_);
        if (v17 + 4 != (uint64_t **)&v41)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 4, v41, v42);
        if (v17 + 7 != (uint64_t **)&v43)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 7, v43, v44);
        if (v17 + 10 != (uint64_t **)&v45)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 10, v45, v46);
        if (v17 + 13 != (uint64_t **)&v47)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 13, v47, v48);
        if (v17 + 16 != (uint64_t **)&v49)
          std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>(v17 + 16, v49, v50);
        neuralNetworkOutputFromArchive(a3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v19;
        objc_msgSend(v17, "setCompilerOutput:", v34);

        v18 = v17;
        goto LABEL_36;
      }
      v18 = 0;
      v35 = (void *)v19;
LABEL_36:
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v50[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v48[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v46[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v44[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v42[0]);
      std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)__p.__r_.__value_.__l.__size_);

      goto LABEL_37;
    }
    objc_msgSend(v17, "setModelIsTrainingProgram:", 1);
    goto LABEL_17;
  }
  v18 = 0;
LABEL_38:
  v36 = v54;
  if (v54)
  {
    p_shared_owners = (unint64_t *)&v54->__shared_owners_;
    do
      v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  return v18;
}

+ (BOOL)populateInputNameToShapeMap:(void *)a3 fromContainer:(id)a4 forFunction:(const void *)a5 program:(const void *)a6 withValidation:(BOOL)a7 error:(id *)a8
{
  uint64_t Function;
  _QWORD *i;
  _QWORD *v12;
  _QWORD *v13;
  std::vector<int>::pointer end;
  int *value;
  std::vector<int>::pointer begin;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int *v23;
  int *v24;
  int v25;
  uint64_t *v26;
  void *v27;
  std::__shared_weak_count *size;
  unint64_t *v29;
  unint64_t v30;
  MIL::Attributes::FlexibleShapeInfo *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  MIL::IRStateValueType *v35;
  uint64_t WrappedType;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD *v45;
  _BOOL4 v46;
  _QWORD *v47;
  _QWORD *v48;
  char *v49;
  char *v50;
  uint64_t *v51;
  uint64_t *v52;
  _DWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  _DWORD *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  int v68;
  _DWORD *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t *v76;
  char *v77;
  _QWORD *v78;
  char *v79;
  char *v80;
  size_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void **v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  char *v103;
  _BYTE *v104;
  unint64_t v105;
  char *v106;
  void *v107;
  uint64_t *v108;
  std::vector<int> *v109;
  unint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  int v126;
  char *v127;
  std::vector<int> *v128;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  std::vector<int> *v134;
  std::vector<int> *v135;
  int value_high;
  char *v137;
  int64_t v138;
  void *v139;
  _QWORD *v140;
  _QWORD *v141;
  BOOL v142;
  uint64_t *v143;
  uint64_t *v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  void *v151;
  uint64_t *v152;
  void *v153;
  char v154;
  uint64_t *v155;
  uint64_t *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t j;
  id v161;
  _QWORD *v162;
  int v163;
  BOOL v164;
  std::runtime_error *v165;
  std::string *v166;
  __int128 v167;
  std::runtime_error *v168;
  std::string *v169;
  __int128 v170;
  std::runtime_error *v171;
  std::string *v172;
  __int128 v173;
  std::runtime_error *v174;
  std::string *v175;
  __int128 v176;
  std::runtime_error *v177;
  std::string *v178;
  __int128 v179;
  std::string *v180;
  std::string::size_type v181;
  std::string *v182;
  __int128 v183;
  std::string *v184;
  __int128 v185;
  std::runtime_error *v186;
  std::string *v187;
  __int128 v188;
  std::string *v189;
  std::string::size_type v190;
  std::string *v191;
  __int128 v192;
  std::string *v193;
  __int128 v194;
  std::runtime_error *exception;
  std::string *v196;
  __int128 v197;
  id v200;
  _BOOL4 v202;
  _QWORD *v203;
  std::string *v204;
  unint64_t __val;
  uint64_t __vala;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  char **v211;
  char *v212[2];
  uint64_t *v213;
  _QWORD *v214[2];
  std::string v215;
  std::string v216;
  std::string v217;
  std::string v218;
  uint64_t *v219;
  _QWORD *v220[2];
  std::vector<int> v221;
  _BYTE v222[128];
  uint64_t v223;

  v202 = a7;
  v223 = *MEMORY[0x1E0C80C00];
  v200 = a4;
  v214[0] = 0;
  v214[1] = 0;
  v212[1] = 0;
  v213 = (uint64_t *)v214;
  v211 = v212;
  v212[0] = 0;
  v204 = (std::string *)a5;
  Function = MIL::IRProgram::GetFunction();
  (*(void (**)(const void *))(*(_QWORD *)a6 + 40))(a6);
  v220[0] = 0;
  v220[1] = 0;
  v219 = (uint64_t *)v220;
  MIL::Attributes::FlexibleShapeInfo::Make();
  __val = Function;
  MIL::Attributes::FlexibleShapeInfo::TryGetDefaultShapes((MIL::Attributes::FlexibleShapeInfo *)v216.__r_.__value_.__l.__data_);
  if (v218.__r_.__value_.__r.__words[0])
  {
    for (i = *(_QWORD **)(v218.__r_.__value_.__r.__words[0] + 16); i; i = (_QWORD *)*i)
    {
      memset(&v221, 0, sizeof(v221));
      std::vector<int>::reserve(&v221, (uint64_t)(i[6] - i[5]) >> 3);
      v12 = (_QWORD *)i[5];
      v13 = (_QWORD *)i[6];
      if (v12 != v13)
      {
        end = v221.__end_;
        value = v221.__end_cap_.__value_;
        begin = v221.__begin_;
        do
        {
          v17 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v12 + 16))(*v12);
          if (v17)
            v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 48))(v17);
          else
            v18 = 1;
          if (end >= value)
          {
            v19 = end - begin;
            v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 62)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            if (((char *)value - (char *)begin) >> 1 > v20)
              v20 = ((char *)value - (char *)begin) >> 1;
            if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
              v21 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v21 = v20;
            if (v21)
              v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v21);
            else
              v22 = 0;
            v23 = (int *)(v21 + 4 * v19);
            *v23 = v18;
            v24 = v23 + 1;
            while (end != begin)
            {
              v25 = *--end;
              *--v23 = v25;
            }
            value = (int *)(v21 + 4 * v22);
            if (begin)
              operator delete(begin);
            begin = v23;
            end = v24;
          }
          else
          {
            *end++ = v18;
          }
          ++v12;
        }
        while (v12 != v13);
        v221.__end_ = end;
        v221.__end_cap_.__value_ = value;
        v221.__begin_ = begin;
      }
      v217.__r_.__value_.__r.__words[0] = (std::string::size_type)(i + 2);
      v26 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v219, i + 2, (__int128 **)&v217);
      v27 = (void *)v26[7];
      if (v27)
      {
        v26[8] = (uint64_t)v27;
        operator delete(v27);
        v26[7] = 0;
        v26[8] = 0;
        v26[9] = 0;
      }
      *(std::vector<int> *)(v26 + 7) = v221;
    }
  }
  size = (std::__shared_weak_count *)v218.__r_.__value_.__l.__size_;
  if (v218.__r_.__value_.__l.__size_)
  {
    v29 = (unint64_t *)(v218.__r_.__value_.__l.__size_ + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v31 = (MIL::Attributes::FlexibleShapeInfo *)v216.__r_.__value_.__r.__words[0];
  v216.__r_.__value_.__r.__words[0] = 0;
  if (v31)
  {
    MIL::Attributes::FlexibleShapeInfo::~FlexibleShapeInfo(v31);
    MEMORY[0x1A1AD6260]();
  }
  v32 = (_QWORD *)(*(uint64_t (**)(unint64_t))(*(_QWORD *)__val + 128))(__val);
  v33 = (_QWORD *)*v32;
  if ((_QWORD *)*v32 != v32 + 1)
  {
    v203 = v32 + 1;
    while (1)
    {
      v34 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v33[7] + 24))(v33[7]);
      if (!v34)
      {
        v35 = (MIL::IRStateValueType *)MIL::IRValueType::TryCastAsStateType((MIL::IRValueType *)v33[7]);
        if (!v35
          || (WrappedType = MIL::IRStateValueType::GetWrappedType(v35),
              (v34 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)WrappedType + 24))(WrappedType)) == 0))
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::operator+<char>();
          v196 = std::string::append(&v218, "' is not of type tensor");
          v197 = *(_OWORD *)&v196->__r_.__value_.__l.__data_;
          v221.__end_cap_.__value_ = (int *)v196->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v221.__begin_ = v197;
          v196->__r_.__value_.__l.__size_ = 0;
          v196->__r_.__value_.__r.__words[2] = 0;
          v196->__r_.__value_.__r.__words[0] = 0;
          std::runtime_error::runtime_error(exception, (const std::string *)&v221);
          __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
      }
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v34 + 104))(v34) & 1) == 0)
      {
        v174 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v175 = std::string::append(&v218, "' does not have fixed rank");
        v176 = *(_OWORD *)&v175->__r_.__value_.__l.__data_;
        v221.__end_cap_.__value_ = (int *)v175->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v221.__begin_ = v176;
        v175->__r_.__value_.__l.__size_ = 0;
        v175->__r_.__value_.__r.__words[2] = 0;
        v175->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v174, (const std::string *)&v221);
        __cxa_throw(v174, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v34 + 96))(v34);
      v39 = *(char **)v37;
      v38 = *(char **)(v37 + 8);
      v40 = *(char **)v37;
      if (*(char **)v37 != v38)
      {
        do
        {
          if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)v39 + 32))(*(_QWORD *)v39))
          {
            v165 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::operator+<char>();
            v166 = std::string::append(&v218, "' consists variadic dimension which is not supported");
            v167 = *(_OWORD *)&v166->__r_.__value_.__l.__data_;
            v221.__end_cap_.__value_ = (int *)v166->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v221.__begin_ = v167;
            v166->__r_.__value_.__l.__size_ = 0;
            v166->__r_.__value_.__r.__words[2] = 0;
            v166->__r_.__value_.__r.__words[0] = 0;
            std::runtime_error::runtime_error(v165, (const std::string *)&v221);
            __cxa_throw(v165, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          v39 += 8;
        }
        while (v39 != v38);
        v39 = *(char **)v37;
        v40 = *(char **)(v37 + 8);
      }
      v41 = v40 - v39;
      __vala = (v40 - v39) >> 3;
      if (!std::string::compare(v204, "main") && (unint64_t)(((v40 - v39) >> 3) - 6) < 0xFFFFFFFFFFFFFFFBLL)
      {
        v177 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v178 = std::string::append(&v216, "' is ");
        v179 = *(_OWORD *)&v178->__r_.__value_.__l.__data_;
        v217.__r_.__value_.__r.__words[2] = v178->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v217.__r_.__value_.__l.__data_ = v179;
        v178->__r_.__value_.__l.__size_ = 0;
        v178->__r_.__value_.__r.__words[2] = 0;
        v178->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v215, __vala);
        if ((v215.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v180 = &v215;
        else
          v180 = (std::string *)v215.__r_.__value_.__r.__words[0];
        if ((v215.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v181 = HIBYTE(v215.__r_.__value_.__r.__words[2]);
        else
          v181 = v215.__r_.__value_.__l.__size_;
        v182 = std::string::append(&v217, (const std::string::value_type *)v180, v181);
        v183 = *(_OWORD *)&v182->__r_.__value_.__l.__data_;
        v218.__r_.__value_.__r.__words[2] = v182->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__r_.__value_.__l.__data_ = v183;
        v182->__r_.__value_.__l.__size_ = 0;
        v182->__r_.__value_.__r.__words[2] = 0;
        v182->__r_.__value_.__r.__words[0] = 0;
        v184 = std::string::append(&v218, ", but it should be between 1 and 5");
        v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
        v221.__end_cap_.__value_ = (int *)v184->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v221.__begin_ = v185;
        v184->__r_.__value_.__l.__size_ = 0;
        v184->__r_.__value_.__r.__words[2] = 0;
        v184->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v177, (const std::string *)&v221);
        __cxa_throw(v177, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (std::string::compare(v204, "main") && v41 >= 0x29)
      {
        v186 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v187 = std::string::append(&v216, "' is ");
        v188 = *(_OWORD *)&v187->__r_.__value_.__l.__data_;
        v217.__r_.__value_.__r.__words[2] = v187->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v217.__r_.__value_.__l.__data_ = v188;
        v187->__r_.__value_.__l.__size_ = 0;
        v187->__r_.__value_.__r.__words[2] = 0;
        v187->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v215, __vala);
        if ((v215.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v189 = &v215;
        else
          v189 = (std::string *)v215.__r_.__value_.__r.__words[0];
        if ((v215.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v190 = HIBYTE(v215.__r_.__value_.__r.__words[2]);
        else
          v190 = v215.__r_.__value_.__l.__size_;
        v191 = std::string::append(&v217, (const std::string::value_type *)v189, v190);
        v192 = *(_OWORD *)&v191->__r_.__value_.__l.__data_;
        v218.__r_.__value_.__r.__words[2] = v191->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v218.__r_.__value_.__l.__data_ = v192;
        v191->__r_.__value_.__l.__size_ = 0;
        v191->__r_.__value_.__r.__words[2] = 0;
        v191->__r_.__value_.__r.__words[0] = 0;
        v193 = std::string::append(&v218, ", but it should be between 0 and 5");
        v194 = *(_OWORD *)&v193->__r_.__value_.__l.__data_;
        v221.__end_cap_.__value_ = (int *)v193->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v221.__begin_ = v194;
        v193->__r_.__value_.__l.__size_ = 0;
        v193->__r_.__value_.__r.__words[2] = 0;
        v193->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v186, (const std::string *)&v221);
        __cxa_throw(v186, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v211, v33 + 4, (__int128 **)&v221)+ 14) = v41 >> 3;
      v42 = v220[0];
      if (!v220[0])
        goto LABEL_61;
      v43 = (uint64_t *)v220;
      do
      {
        v44 = v43;
        v45 = v42 + 4;
        v46 = google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v42 + 4, v33 + 4);
        v47 = v42 + 1;
        if (!v46)
        {
          v47 = v42;
          v43 = v42;
        }
        v42 = (_QWORD *)*v47;
      }
      while (*v47);
      if (v43 == (uint64_t *)v220
        || (!v46 ? (v48 = v45) : (v48 = v44 + 4),
            google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v33 + 4, v48)))
      {
LABEL_61:
        v50 = *(char **)v37;
        v49 = *(char **)(v37 + 8);
        while (v50 != v49)
        {
          if (!(*(uint64_t (**)(_QWORD))(**(_QWORD **)v50 + 16))(*(_QWORD *)v50))
          {
            v168 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::operator+<char>();
            v169 = std::string::append(&v218, " which has unknown dimensions.");
            v170 = *(_OWORD *)&v169->__r_.__value_.__l.__data_;
            v221.__end_cap_.__value_ = (int *)v169->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v221.__begin_ = v170;
            v169->__r_.__value_.__l.__size_ = 0;
            v169->__r_.__value_.__r.__words[2] = 0;
            v169->__r_.__value_.__r.__words[0] = 0;
            std::runtime_error::runtime_error(v168, (const std::string *)&v221);
            __cxa_throw(v168, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          v50 += 8;
        }
        v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
        v51 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221);
        v52 = v51;
        v54 = v51[7];
        v53 = (_DWORD *)v51[8];
        v55 = (uint64_t)v53 - v54;
        if ((unint64_t)v53 - v54 >= 0x14)
        {
          v67 = (v40 - v39) >> 3;
          if ((_DWORD *)((char *)v53 - v54) != (_DWORD *)20)
            v51[8] = v54 + 20;
        }
        else
        {
          v56 = v55 >> 2;
          v57 = 5 - (v55 >> 2);
          v58 = v51[9];
          if (v57 <= (v58 - (uint64_t)v53) >> 2)
          {
            v69 = &v53[v57];
            v70 = 20 - 4 * v56;
            do
            {
              *v53++ = 1;
              v70 -= 4;
            }
            while (v70);
            v51[8] = (uint64_t)v69;
            v67 = (v40 - v39) >> 3;
          }
          else
          {
            v59 = v58 - v54;
            v60 = (v58 - v54) >> 1;
            if (v60 <= 5)
              v60 = 5;
            if (v59 >= 0x7FFFFFFFFFFFFFFCLL)
              v61 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v61 = v60;
            v62 = std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v61);
            v64 = (char *)&v62[v56];
            do
              v62[v56++] = 1;
            while (v56 != 5);
            v65 = (char *)v52[7];
            v66 = (char *)v52[8];
            if (v66 == v65)
            {
              v67 = (v40 - v39) >> 3;
            }
            else
            {
              v67 = (v40 - v39) >> 3;
              do
              {
                v68 = *((_DWORD *)v66 - 1);
                v66 -= 4;
                *((_DWORD *)v64 - 1) = v68;
                v64 -= 4;
              }
              while (v66 != v65);
            }
            v52[7] = (uint64_t)v64;
            v52[8] = (uint64_t)(v62 + 5);
            v52[9] = (uint64_t)&v62[v63];
            if (v65)
              operator delete(v65);
          }
        }
        if (v40 == v39)
        {
          v90 = 1;
        }
        else
        {
          v88 = *(_QWORD *)(*(_QWORD *)v37 + 8 * v67 - 8);
          v89 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v88 + 16))(v88);
          v90 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v89 + 48))(v89);
        }
        v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
        *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7]+ 16) = v90;
        if (v41 >= 9)
        {
          v91 = *(_QWORD *)(*(_QWORD *)v37 + 8 * v67 - 16);
          v92 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v91 + 16))(v91);
          v93 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v92 + 48))(v92);
          v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
          *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7]+ 12) = v93;
          if (v41 > 0x10)
          {
            v94 = *(_QWORD *)(*(_QWORD *)v37 + 8 * v67 - 24);
            v95 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v94 + 16))(v94);
            v96 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v95 + 48))(v95);
            v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
            *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7]+ 8) = v96;
            if (v41 >= 0x19)
            {
              v97 = *(_QWORD *)(*(_QWORD *)v37 + 8 * v67 - 32);
              v98 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v97 + 16))(v97);
              v99 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v98 + 48))(v98);
              v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
              *(_DWORD *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7]+ 4) = v99;
              if (v41 >= 0x21)
              {
                v100 = *(_QWORD *)(*(_QWORD *)v37 + 8 * v67 - 40);
                v101 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v100 + 16))(v100);
                v102 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v101 + 48))(v101);
                v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
                *(_DWORD *)std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7] = v102;
              }
            }
          }
        }
        goto LABEL_159;
      }
      v71 = *(char **)v37;
      v72 = *(char **)(v37 + 8);
      if ((uint64_t)&v72[-*(_QWORD *)v37] >> 3 != (v43[8] - v43[7]) >> 2)
        goto LABEL_206;
      if (v72 != v71)
      {
        v73 = 0;
        while (1)
        {
          v74 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)&v71[8 * v73] + 16))(*(_QWORD *)&v71[8 * v73]);
          if (v74)
          {
            if (*(_DWORD *)(v43[7] + 4 * v73) != (*(unsigned int (**)(uint64_t))(*(_QWORD *)v74 + 48))(v74))
              break;
          }
          ++v73;
          v71 = *(char **)v37;
          if (v73 >= (uint64_t)(*(_QWORD *)(v37 + 8) - *(_QWORD *)v37) >> 3)
            goto LABEL_89;
        }
LABEL_206:
        v171 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::operator+<char>();
        v172 = std::string::append(&v218, " doesn't match with declared shape in function");
        v173 = *(_OWORD *)&v172->__r_.__value_.__l.__data_;
        v221.__end_cap_.__value_ = (int *)v172->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v221.__begin_ = v173;
        v172->__r_.__value_.__l.__size_ = 0;
        v172->__r_.__value_.__r.__words[2] = 0;
        v172->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(v171, (const std::string *)&v221);
        __cxa_throw(v171, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
LABEL_89:
      v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
      v75 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221);
      v76 = v75;
      if (v43 != v75)
        break;
LABEL_121:
      if (v41 <= 0x27)
      {
        v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
        v108 = std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221);
        v221.__begin_ = (std::vector<int>::pointer)(v33 + 4);
        v109 = (std::vector<int> *)std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v213, v33 + 4, (__int128 **)&v221)[7];
        v110 = 5 - __vala;
        LODWORD(v221.__begin_) = 1;
        v111 = (char *)v108[8];
        v112 = v108[9];
        if (5 - __vala <= (unint64_t)((v112 - (uint64_t)v111) >> 2))
        {
          v120 = v111 - (char *)v109;
          if (v110 <= (v111 - (char *)v109) >> 2)
          {
            v123 = (char *)v108[8];
            v122 = 5 - __vala;
LABEL_137:
            v124 = &v123[-4 * v110];
            v125 = v123;
            while (v124 < v111)
            {
              v126 = *(_DWORD *)v124;
              v124 += 4;
              *(_DWORD *)v125 = v126;
              v125 += 4;
            }
            v127 = (char *)v109 + 4 * v110;
            v108[8] = (uint64_t)v125;
            if (v123 != v127)
              memmove(&v123[-4 * ((v123 - v127) >> 2)], v109, v123 - v127);
            v128 = &v221;
            if (v109 <= &v221)
            {
              if (v108[8] <= (unint64_t)&v221)
                v129 = 0;
              else
                v129 = 5 - __vala;
              v128 = (std::vector<int> *)((char *)&v221 + 4 * v129);
            }
            do
            {
              LODWORD(v109->__begin_) = v128->__begin_;
              v109 = (std::vector<int> *)((char *)v109 + 4);
              --v122;
            }
            while (v122);
            goto LABEL_159;
          }
          v121 = 0;
          v122 = v120 >> 2;
          v123 = &v111[4 * (v110 - (v120 >> 2))];
          do
          {
            *(_DWORD *)&v111[v121] = v221.__begin_;
            v121 += 4;
          }
          while (20 - 4 * (__vala + v122) != v121);
          v108[8] = (uint64_t)v123;
          if (v111 != (char *)v109)
            goto LABEL_137;
        }
        else
        {
          v113 = v108[7];
          v114 = v110 + ((uint64_t)&v111[-v113] >> 2);
          if (v114 >> 62)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v115 = v112 - v113;
          if (v115 >> 1 > v114)
            v114 = v115 >> 1;
          if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFFCLL)
            v116 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v116 = v114;
          if (v116)
          {
            v117 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v116);
            v119 = v118;
          }
          else
          {
            v117 = 0;
            v119 = 0;
          }
          v130 = &v117[4 * (((uint64_t)v109 - v113) >> 2)];
          v131 = &v130[4 * v110];
          v132 = 20 - 4 * __vala;
          v133 = v130;
          do
          {
            *(_DWORD *)v133 = v221.__begin_;
            v133 += 4;
            v132 -= 4;
          }
          while (v132);
          v134 = (std::vector<int> *)v108[7];
          if (v134 != v109)
          {
            v135 = v109;
            do
            {
              value_high = HIDWORD(v135[-1].__end_cap_.__value_);
              v135 = (std::vector<int> *)((char *)v135 - 4);
              *((_DWORD *)v130 - 1) = value_high;
              v130 -= 4;
            }
            while (v135 != v134);
          }
          v137 = (char *)v108[8];
          v138 = v137 - (char *)v109;
          if (v137 != (char *)v109)
            memmove(v131, v109, v137 - (char *)v109);
          v139 = (void *)v108[7];
          v108[7] = (uint64_t)v130;
          v108[8] = (uint64_t)&v131[v138];
          v108[9] = (uint64_t)&v117[4 * v119];
          if (v139)
            operator delete(v139);
        }
      }
LABEL_159:
      v140 = (_QWORD *)v33[1];
      if (v140)
      {
        do
        {
          v141 = v140;
          v140 = (_QWORD *)*v140;
        }
        while (v140);
      }
      else
      {
        do
        {
          v141 = (_QWORD *)v33[2];
          v142 = *v141 == (_QWORD)v33;
          v33 = v141;
        }
        while (!v142);
      }
      v33 = v141;
      if (v141 == v203)
        goto LABEL_165;
    }
    v78 = v75 + 7;
    v77 = (char *)v75[7];
    v79 = (char *)v43[7];
    v80 = (char *)v43[8];
    v81 = v80 - v79;
    v82 = (v80 - v79) >> 2;
    v83 = v75[9];
    if (v82 <= (v83 - (uint64_t)v77) >> 2)
    {
      v103 = v80;
      v86 = (void **)(v75 + 8);
      v104 = (_BYTE *)v75[8];
      v105 = (v104 - v77) >> 2;
      if (v105 < v82)
      {
        if (v104 != v77)
        {
          memmove((void *)v75[7], v79, v104 - v77);
          v77 = (char *)*v86;
        }
        v106 = &v79[4 * v105];
        v81 = v103 - v106;
        if (v103 == v106)
          goto LABEL_120;
        v107 = v77;
        goto LABEL_119;
      }
      if (v103 == v79)
      {
LABEL_120:
        *v86 = &v77[v81];
        goto LABEL_121;
      }
    }
    else
    {
      if (v77)
      {
        v75[8] = (uint64_t)v77;
        operator delete(v77);
        v83 = 0;
        *v78 = 0;
        v76[8] = 0;
        v76[9] = 0;
      }
      if ((v81 & 0x8000000000000000) != 0)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      v84 = v83 >> 1;
      if (v83 >> 1 <= v82)
        v84 = (v80 - v79) >> 2;
      if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFFCLL)
        v85 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v85 = v84;
      std::vector<int>::__vallocate[abi:ne180100](v76 + 7, v85);
      v87 = (char *)v76[8];
      v86 = (void **)(v76 + 8);
      v77 = v87;
      if (v80 == v79)
        goto LABEL_120;
    }
    v107 = v77;
    v106 = v79;
LABEL_119:
    memmove(v107, v106, v81);
    goto LABEL_120;
  }
LABEL_165:
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v220[0]);
  v143 = v213;
  if (v213 != (uint64_t *)v214)
  {
    do
    {
      v144 = v143 + 4;
      v145 = *(_DWORD *)(v143[7] + 16);
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3, v143 + 4, (__int128 **)&v221)+ 14) = v145;
      v146 = *(_DWORD *)(v143[7] + 12);
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 3, v143 + 4, (__int128 **)&v221)+ 14) = v146;
      v147 = *(_DWORD *)(v143[7] + 8);
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 6, v143 + 4, (__int128 **)&v221)+ 14) = v147;
      v148 = *(_DWORD *)(v143[7] + 4);
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 9, v143 + 4, (__int128 **)&v221)+ 14) = v148;
      v149 = *(_DWORD *)v143[7];
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 12, v143 + 4, (__int128 **)&v221)+ 14) = v149;
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      v150 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v211, v143 + 4, (__int128 **)&v221)+ 14);
      v221.__begin_ = (std::vector<int>::pointer)(v143 + 4);
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 15, v143 + 4, (__int128 **)&v221)+ 14) = v150;
      if (v202)
      {
        objc_msgSend(v200, "inputLayerNames");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v143 + 4;
        if (*((char *)v143 + 55) < 0)
          v152 = (uint64_t *)*v144;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_msgSend(v151, "containsObject:", v153);

        if ((v154 & 1) == 0)
        {
          if (a8)
          {
            if (*((char *)v143 + 55) < 0)
              v144 = (uint64_t *)*v144;
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MIL program input, '%s', not found in Core ML model inputs"), v144);
            v164 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_226;
          }
LABEL_225:
          v164 = 0;
          goto LABEL_226;
        }
      }
      v155 = (uint64_t *)v143[1];
      if (v155)
      {
        do
        {
          v156 = v155;
          v155 = (uint64_t *)*v155;
        }
        while (v155);
      }
      else
      {
        do
        {
          v156 = (uint64_t *)v143[2];
          v142 = *v156 == (_QWORD)v143;
          v143 = v156;
        }
        while (!v142);
      }
      v143 = v156;
    }
    while (v156 != (uint64_t *)v214);
  }
  if (!v202)
    goto LABEL_195;
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  objc_msgSend(v200, "inputLayerNames");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v207, v222, 16);
  if (!v158)
    goto LABEL_194;
  v159 = *(_QWORD *)v208;
  do
  {
    for (j = 0; j != v158; ++j)
    {
      if (*(_QWORD *)v208 != v159)
        objc_enumerationMutation(v157);
      v161 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v207 + 1) + 8 * j));
      std::string::basic_string[abi:ne180100]<0>(&v221, (char *)objc_msgSend(v161, "UTF8String"));
      v162 = v214[0];
      if (!v214[0])
      {
LABEL_187:
        v163 = 1;
        goto LABEL_189;
      }
      while (google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(&v221, v162 + 4))
      {
LABEL_186:
        v162 = (_QWORD *)*v162;
        if (!v162)
          goto LABEL_187;
      }
      if (google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v162 + 4, &v221))
      {
        ++v162;
        goto LABEL_186;
      }
      v163 = 0;
LABEL_189:
      if (SHIBYTE(v221.__end_cap_.__value_) < 0)
        operator delete(v221.__begin_);
      if (v163)
      {
        if (a8)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Core ML model input, '%@', not found in MIL main program's inputs"), v161);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_225;
      }
    }
    v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v207, v222, 16);
  }
  while (v158);
LABEL_194:

LABEL_195:
  v164 = 1;
LABEL_226:
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v212[0]);
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v214[0]);

  return v164;
}

+ (shared_ptr<MIL::IRProgram>)loadProgramFromCompiledArchive:(void *)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD *v12;
  IRProgram *v13;
  __shared_weak_count *v14;
  id v15;
  uint64_t v16;
  shared_ptr<MIL::IRProgram> result;

  v8 = v4;
  if ((*(unsigned int (**)(_QWORD, SEL))(**(_QWORD **)a3 + 56))(*(_QWORD *)a3, a2) == 1)
  {
    neuralNetworkOutputFromArchive(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    if (v9)
    {
      objc_msgSend(v9, "program");
      v10 = *v8 == 0;
      v9 = v15;
      if (!a4)
        goto LABEL_10;
    }
    else
    {
      *v8 = 0;
      v8[1] = 0;
      v10 = 1;
      if (!a4)
      {
LABEL_10:

        goto LABEL_13;
      }
    }
    if (v10)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Error in reading the in-memory MIL network."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v15;
    }
    goto LABEL_10;
  }
  URLOfMILTextInArchive((_MLModelInputArchiver *)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadProgramAtURL:error:", v11, a4);
  *v8 = v16;
  if (v16)
  {
    v12 = (_QWORD *)operator new();
    *v12 = &off_1E3D5C4F0;
    v12[1] = 0;
    v12[2] = 0;
    v12[3] = v16;
  }
  else
  {
    v12 = 0;
  }
  v8[1] = v12;

LABEL_13:
  result.__cntrl_ = v14;
  result.__ptr_ = v13;
  return result;
}

+ (unique_ptr<MIL::IRProgram,)loadProgramAtURL:(id)a3 error:(id *)a4
{
  void ***v4;
  int8x8_t v5;
  void ***v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void **v13;
  uint64_t Attribute;
  uint64_t v15;
  uint64_t Function;
  uint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8x8_t v29;
  unint64_t v30;
  void **v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  float v35;
  _BOOL8 v36;
  unint64_t v37;
  unint64_t v38;
  size_t v39;
  _QWORD *v40;
  _QWORD *v41;
  unint64_t v42;
  void **v43;
  void **v44;
  uint64_t v45;
  MIL::Attributes::IOAliasInfo *v46;
  unique_ptr<MIL::IRProgram, std::default_delete<MIL::IRProgram>> v47;
  void *v48[2];
  uint64_t v49;
  void *__p;
  int8x8_t v51;
  char *v52;
  uint64_t v53;
  float v54;
  uint64_t v55;
  MIL::Attributes::IOAliasInfo *v56;
  void **p_p;
  char **v58;
  char v59;

  v7 = v4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v8, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v12, "UTF8String"));
    CoreML::NNCompiler::Backend::MIL::LoadProgram((uint64_t)&p_p, (uint64_t)&__p);
    v13 = p_p;
    p_p = 0;
    if (SHIBYTE(v52) < 0)
      operator delete(__p);

    std::string::basic_string[abi:ne180100]<0>(&__p, "UpgradeMetadata");
    Attribute = MIL::IRObject::TryGetAttribute();
    v15 = Attribute;
    if (SHIBYTE(v52) < 0)
    {
      operator delete(__p);
      if (!v15)
      {
LABEL_73:
        *v7 = v13;
        goto LABEL_74;
      }
    }
    else if (!Attribute)
    {
      goto LABEL_73;
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, "main");
    Function = MIL::IRProgram::GetFunction();
    if (SHIBYTE(v52) < 0)
      operator delete(__p);
    (*((void (**)(void **))*v13 + 5))(v13);
    MIL::Attributes::IOAliasInfo::Make();
    if (!*(_QWORD *)(MIL::Attributes::IOAliasInfo::GetInternalToExternalNames(v56) + 24))
    {
LABEL_71:
      v46 = v56;
      v56 = 0;
      if (v46)
      {
        MIL::Attributes::IOAliasInfo::~IOAliasInfo(v46);
        MEMORY[0x1A1AD6260]();
      }
      goto LABEL_73;
    }
    v17 = *(uint64_t **)(MIL::Attributes::IOAliasInfo::GetInternalToExternalNames(v56) + 16);
    v51 = 0;
    v52 = 0;
    __p = 0;
    if (v17)
    {
      v18 = -1;
      v19 = v17;
      do
      {
        v20 = v18;
        v19 = (_QWORD *)*v19;
        ++v18;
      }
      while (v19);
      p_p = &__p;
      LOBYTE(v58) = 0;
      if (v18 >= 0x555555555555555)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      v21 = v20 + 2;
      __p = operator new(48 * (v20 + 2));
      v51 = (int8x8_t)__p;
      v52 = (char *)__p + 48 * v21;
      v5 = (int8x8_t)__p;
      do
      {
        if (*((char *)v17 + 39) < 0)
        {
          std::string::__init_copy_ctor_external(*(std::string **)&v5, (const std::string::value_type *)v17[2], v17[3]);
        }
        else
        {
          v22 = *((_OWORD *)v17 + 1);
          *(_QWORD *)(*(_QWORD *)&v5 + 16) = v17[4];
          *(_OWORD *)*(_QWORD *)&v5 = v22;
        }
        v23 = (std::string *)(*(_QWORD *)&v5 + 24);
        if (*((char *)v17 + 63) < 0)
        {
          std::string::__init_copy_ctor_external(v23, (const std::string::value_type *)v17[5], v17[6]);
        }
        else
        {
          v24 = *(_OWORD *)(v17 + 5);
          *(_QWORD *)(*(_QWORD *)&v5 + 40) = v17[7];
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
        }
        v17 = (uint64_t *)*v17;
        *(_QWORD *)&v5 += 48;
      }
      while (v17);
      v51 = v5;
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t, void **))(*(_QWORD *)Function + 224))(&v55, Function, &__p);
    p_p = &__p;
    std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](&p_p);
    v25 = (*((uint64_t (**)(void **))*v13 + 9))(v13);
    std::unordered_map<std::string,std::shared_ptr<MIL::IRFunction>>::unordered_map((uint64_t)&__p, v25);
    std::string::basic_string[abi:ne180100]<0>(v48, "main");
    v26 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v48);
    v27 = v26;
    v28 = (unint64_t)v51;
    if (v51)
    {
      v29 = (uint8x8_t)vcnt_s8(v51);
      v29.i16[0] = vaddlv_u8(v29);
      v30 = v29.u32[0];
      if (v29.u32[0] > 1uLL)
      {
        v5 = (int8x8_t)v26;
        if (v26 >= *(_QWORD *)&v51)
          v5 = (int8x8_t)(v26 % *(_QWORD *)&v51);
      }
      else
      {
        v5 = (int8x8_t)((*(_QWORD *)&v51 - 1) & v26);
      }
      v31 = (void **)*((_QWORD *)__p + *(_QWORD *)&v5);
      if (v31)
      {
        v32 = (char *)*v31;
        if (*v31)
        {
          do
          {
            v33 = *((_QWORD *)v32 + 1);
            if (v33 == v27)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v32 + 16, (unsigned __int8 *)v48))
              {
                goto LABEL_64;
              }
            }
            else
            {
              if (v30 > 1)
              {
                if (v33 >= v28)
                  v33 %= v28;
              }
              else
              {
                v33 &= v28 - 1;
              }
              if (v33 != *(_QWORD *)&v5)
                break;
            }
            v32 = *(char **)v32;
          }
          while (v32);
        }
      }
    }
    v32 = (char *)operator new(0x38uLL);
    p_p = (void **)v32;
    v58 = &v52;
    *(_QWORD *)v32 = 0;
    *((_QWORD *)v32 + 1) = v27;
    *((_OWORD *)v32 + 1) = *(_OWORD *)v48;
    v34 = v49;
    v48[0] = 0;
    v48[1] = 0;
    v49 = 0;
    *((_QWORD *)v32 + 5) = 0;
    *((_QWORD *)v32 + 6) = 0;
    *((_QWORD *)v32 + 4) = v34;
    v59 = 1;
    v35 = (float)(unint64_t)(v53 + 1);
    if (!v28 || (float)(v54 * (float)v28) < v35)
    {
      v36 = 1;
      if (v28 >= 3)
        v36 = (v28 & (v28 - 1)) != 0;
      v37 = v36 | (2 * v28);
      v38 = vcvtps_u32_f32(v35 / v54);
      if (v37 <= v38)
        v39 = v38;
      else
        v39 = v37;
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)&__p, v39);
      v28 = (unint64_t)v51;
      if ((*(_QWORD *)&v51 & (*(_QWORD *)&v51 - 1)) != 0)
      {
        if (v27 >= *(_QWORD *)&v51)
          v5 = (int8x8_t)(v27 % *(_QWORD *)&v51);
        else
          v5 = (int8x8_t)v27;
      }
      else
      {
        v5 = (int8x8_t)((*(_QWORD *)&v51 - 1) & v27);
      }
    }
    v40 = __p;
    v41 = (_QWORD *)*((_QWORD *)__p + *(_QWORD *)&v5);
    if (v41)
    {
      *(_QWORD *)v32 = *v41;
    }
    else
    {
      *(_QWORD *)v32 = v52;
      v52 = v32;
      v40[*(_QWORD *)&v5] = &v52;
      if (!*(_QWORD *)v32)
        goto LABEL_63;
      v42 = *(_QWORD *)(*(_QWORD *)v32 + 8);
      if ((v28 & (v28 - 1)) != 0)
      {
        if (v42 >= v28)
          v42 %= v28;
      }
      else
      {
        v42 &= v28 - 1;
      }
      v41 = (char *)__p + 8 * v42;
    }
    *v41 = v32;
LABEL_63:
    p_p = 0;
    ++v53;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)&p_p);
LABEL_64:
    std::shared_ptr<MIL::IRFunction>::operator=[abi:ne180100]<MIL::IRFunction,std::default_delete<MIL::IRFunction>,void>((_QWORD *)v32 + 5, &v55);
    if (SHIBYTE(v49) < 0)
      operator delete(v48[0]);
    (*((void (**)(void ***__return_ptr, void **, void **))*v13 + 11))(&p_p, v13, &__p);
    v43 = p_p;
    p_p = 0;
    (*((void (**)(void **))*v13 + 1))(v13);
    v44 = p_p;
    p_p = 0;
    if (v44)
      (*((void (**)(void **))*v44 + 1))(v44);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)&__p);
    v45 = v55;
    v55 = 0;
    if (v45)
      (*(void (**)(uint64_t))(*(_QWORD *)v45 + 8))(v45);
    v13 = v43;
    goto LABEL_71;
  }
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Error in reading the MIL network."));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  *v7 = 0;
LABEL_74:

  return v47;
}

+ (void)updateOptionalDefaultValueParametersInContainer:(id)a3 usingProgram:(const void *)a4 functionName:(id)a5 modelDescription:(id)a6
{
  id v8;
  uint64_t Attribute;
  MIL::IRValue *v10;
  MIL::IRDictionaryValue *v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  int v15;
  char **v16;
  char **v17;
  char *v18;
  std::string *v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  char v43;
  uint64_t **v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47[2];
  uint64_t v48;
  void *__p[2];
  uint64_t v50;
  int v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v8 = a5;
  v36 = a6;
  v34 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v42, (char *)objc_msgSend(v34, "UTF8String"));
  MIL::IRProgram::GetFunction();
  v45 = 0;
  v46 = 0;
  v44 = &v45;
  std::string::basic_string[abi:ne180100]<0>(__p, "CoreML_InputDefaultValues");
  Attribute = MIL::IRObject::TryGetAttribute();
  v10 = (MIL::IRValue *)Attribute;
  if (SHIBYTE(v50) < 0)
  {
    operator delete(__p[0]);
    if (!v10)
      goto LABEL_20;
    goto LABEL_5;
  }
  if (Attribute)
  {
LABEL_5:
    v11 = (MIL::IRDictionaryValue *)MIL::IRValue::AsDictionary(v10);
    v12 = (_QWORD *)MIL::IRDictionaryValue::begin(v11);
    v13 = MIL::IRDictionaryValue::end(v11);
    while (1)
    {
      if (v12 == (_QWORD *)v13)
        goto LABEL_20;
      MIL::IRValue::GetScalar<std::string>();
      MIL::IRValue::GetScalar<float>();
      v15 = v14;
      *(_OWORD *)__p = *(_OWORD *)v47;
      v50 = v48;
      v47[1] = 0;
      v48 = 0;
      v47[0] = 0;
      v51 = v14;
      v16 = (char **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&v44, &v52, __p);
      if (*v16)
        break;
      v17 = v16;
      v18 = (char *)operator new(0x40uLL);
      v19 = (std::string *)(v18 + 32);
      v20 = HIBYTE(v50);
      if (SHIBYTE(v50) < 0)
      {
        std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      }
      else
      {
        *(_OWORD *)&v19->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        *((_QWORD *)v18 + 6) = v50;
      }
      *((_DWORD *)v18 + 14) = v15;
      v21 = v52;
      *(_QWORD *)v18 = 0;
      *((_QWORD *)v18 + 1) = 0;
      *((_QWORD *)v18 + 2) = v21;
      *v17 = v18;
      if (*v44)
      {
        v44 = (uint64_t **)*v44;
        v18 = *v17;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v45, (uint64_t *)v18);
      ++v46;
      if (v20 < 0)
        goto LABEL_9;
LABEL_10:
      if (SHIBYTE(v48) < 0)
        operator delete(v47[0]);
      v12 = (_QWORD *)*v12;
    }
    if ((v50 & 0x8000000000000000) == 0)
      goto LABEL_10;
LABEL_9:
    operator delete(__p[0]);
    goto LABEL_10;
  }
LABEL_20:
  if (v43 < 0)
    operator delete(v42);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v36, "inputDescriptionsByName");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isOptional");

        if (v29)
        {
          v30 = objc_retainAutorelease(v27);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v30, "UTF8String"));
          v31 = (void *)MEMORY[0x1E0CB37E8];
          v47[0] = __p;
          LODWORD(v32) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v44, __p, (__int128 **)v47)+ 14);
          objc_msgSend(v31, "numberWithFloat:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, v30);

          objc_msgSend(v37, "setObject:forKeyedSubscript:", &unk_1E3DA24B8, v30);
          if (SHIBYTE(v50) < 0)
            operator delete(__p[0]);
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    }
    while (v24);
  }

  objc_msgSend(v35, "setOptionalInputDefaultValues:", v22);
  objc_msgSend(v35, "setOptionalInputTypes:", v37);
  objc_msgSend(v35, "setHasOptionalInputSequenceConcat:", 0);

  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)v45);
}

@end
