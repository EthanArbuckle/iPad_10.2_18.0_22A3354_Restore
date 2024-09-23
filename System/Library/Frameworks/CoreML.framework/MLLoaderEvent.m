@implementation MLLoaderEvent

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setModelType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCompilerVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)extractAndSetModelDetailsFromArchive:(void *)a3
{
  char hasNestedArchive;
  char v6;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  _QWORD *v15;
  void *v16;
  _OWORD *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _OWORD *v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  _OWORD *v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  _OWORD *v31;
  _QWORD *v32;
  void *v33;
  _QWORD *v34;
  _OWORD *v35;
  _QWORD *v36;
  void *v37;
  std::string *p_s1;
  std::string::size_type v43;
  std::string::size_type size;
  uint64_t v45;
  _QWORD *v48;
  _OWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  void *v52;
  _OWORD *v53;
  _QWORD *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  _OWORD *v58;
  _QWORD *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  void *v63[2];
  char v64;
  uint64_t *v65;
  _QWORD *v66[2];
  std::string __s1;
  void *__p;
  std::__shared_weak_count *v69;
  _BYTE v70[8];
  char *v71;
  void **v72;

  std::string::basic_string[abi:ne180100]<0>(&__p, "analytics");
  hasNestedArchive = IArchive::hasNestedArchive(a3, &__p);
  v6 = hasNestedArchive;
  if ((v70[7] & 0x80000000) != 0)
  {
    operator delete(__p);
    if ((v6 & 1) == 0)
      return;
  }
  else if ((hasNestedArchive & 1) == 0)
  {
    return;
  }
  std::string::basic_string[abi:ne180100]<0>(&__s1, "analytics");
  v7 = IArchive::nestedArchive(a3, (uint64_t)&__s1);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 1);
  __p = *(void **)v7;
  v69 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v70, (_QWORD *)v7 + 2);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s1.__r_.__value_.__l.__data_);
  while (1)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)__p + 4) + 16))(*((_QWORD *)__p + 4));
    if (std::istream::peek() == -1)
      break;
    v11 = (void *)MEMORY[0x1A1AD6ED8]();
    memset(&__s1, 0, sizeof(__s1));
    v66[0] = 0;
    v66[1] = 0;
    v65 = (uint64_t *)v66;
    operator>>((uint64_t)&__p, &__s1);
    operator>><std::string,std::string>((uint64_t)&__p, &v65);
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__s1.__r_.__value_.__l.__size_ != 20)
      {
        if (__s1.__r_.__value_.__l.__size_ != 25)
          goto LABEL_108;
        v12 = *(_QWORD *)__s1.__r_.__value_.__l.__data_ == 0x654E6C617275654ELL
           && *(_QWORD *)(__s1.__r_.__value_.__r.__words[0] + 8) == 0x646F4D6B726F7774;
        v13 = v12 && *(_QWORD *)(__s1.__r_.__value_.__r.__words[0] + 16) == 0x6C69617465446C65;
        if (!v13 || *(_BYTE *)(__s1.__r_.__value_.__r.__words[0] + 24) != 115)
          goto LABEL_108;
LABEL_29:
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelNetHash"), "UTF8String"));
        v15 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v15)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelNetHash"), "UTF8String"));
          v72 = v63;
          v17 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v18 = (_QWORD *)v17 + 7;
          if (*((char *)v17 + 79) < 0)
            v18 = (_QWORD *)*v18;
          objc_msgSend(v16, "stringWithUTF8String:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setNnModelNetHash:](self, "setNnModelNetHash:", v19);

          if (v64 < 0)
            operator delete(v63[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelShapeHash"), "UTF8String"));
        v20 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v20)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelShapeHash"), "UTF8String"));
          v72 = v63;
          v22 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v23 = (_QWORD *)v22 + 7;
          if (*((char *)v22 + 79) < 0)
            v23 = (_QWORD *)*v23;
          objc_msgSend(v21, "stringWithUTF8String:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setNnModelShapeHash:](self, "setNnModelShapeHash:", v24);

          if (v64 < 0)
            operator delete(v63[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelWeightsHash"), "UTF8String"));
        v25 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v25)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("nnModelWeightsHash"), "UTF8String"));
          v72 = v63;
          v27 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v28 = (_QWORD *)v27 + 7;
          if (*((char *)v27 + 79) < 0)
            v28 = (_QWORD *)*v28;
          objc_msgSend(v26, "stringWithUTF8String:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setNnModelWeightsHash:](self, "setNnModelWeightsHash:", v29);

          if (v64 < 0)
            operator delete(v63[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
        v30 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v30)
        {
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
          v72 = v63;
          v31 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v32 = (_QWORD *)v31 + 7;
          if (*((char *)v31 + 79) < 0)
            v32 = (_QWORD *)*v32;
          -[MLLoaderEvent numberFromCString:](self, "numberFromCString:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setModelDimension:](self, "setModelDimension:", v33);

          if (v64 < 0)
            operator delete(v63[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("containsCustomLayer"), "UTF8String"));
        v34 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v34)
        {
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("containsCustomLayer"), "UTF8String"));
          v72 = v63;
          v35 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v36 = (_QWORD *)v35 + 7;
          if (*((char *)v35 + 79) < 0)
            v36 = (_QWORD *)*v36;
          -[MLLoaderEvent numberFromCString:](self, "numberFromCString:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setContainsCustomLayer:](self, "setContainsCustomLayer:", v37);
LABEL_106:

          if (v64 < 0)
            operator delete(v63[0]);
          goto LABEL_108;
        }
        goto LABEL_108;
      }
      if (*(_QWORD *)__s1.__r_.__value_.__l.__data_ == 0x6369666963657053
        && *(_QWORD *)(__s1.__r_.__value_.__r.__words[0] + 8) == 0x7465446E6F697461
        && *(_DWORD *)(__s1.__r_.__value_.__r.__words[0] + 16) == 1936484705)
      {
LABEL_93:
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelName"), "UTF8String"));
        v51 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v51)
        {
          v52 = (void *)MEMORY[0x1E0CB3940];
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelName"), "UTF8String"));
          v72 = v63;
          v53 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v54 = (_QWORD *)v53 + 7;
          if (*((char *)v53 + 79) < 0)
            v54 = (_QWORD *)*v54;
          objc_msgSend(v52, "stringWithUTF8String:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setModelName:](self, "setModelName:", v55);

          if (v64 < 0)
            operator delete(v63[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelHash"), "UTF8String"));
        v56 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
        if (v64 < 0)
          operator delete(v63[0]);
        if (v66 != v56)
        {
          v57 = (void *)MEMORY[0x1E0CB3940];
          std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelHash"), "UTF8String"));
          v72 = v63;
          v58 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
          v59 = (_QWORD *)v58 + 7;
          if (*((char *)v58 + 79) < 0)
            v59 = (_QWORD *)*v59;
          objc_msgSend(v57, "stringWithUTF8String:", v59);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLLoaderEvent setModelHash:](self, "setModelHash:", v37);
          goto LABEL_106;
        }
        goto LABEL_108;
      }
      p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(__s1.__r_.__value_.__r.__words[2]) != 20)
      {
        if (HIBYTE(__s1.__r_.__value_.__r.__words[2]) != 25
          || memcmp(&__s1, "NeuralNetworkModelDetails", HIBYTE(__s1.__r_.__value_.__r.__words[2])))
        {
          goto LABEL_108;
        }
        goto LABEL_29;
      }
      if (__s1.__r_.__value_.__r.__words[0] == 0x6369666963657053
        && __s1.__r_.__value_.__l.__size_ == 0x7465446E6F697461
        && LODWORD(__s1.__r_.__value_.__r.__words[2]) == 1936484705)
      {
        goto LABEL_93;
      }
      p_s1 = &__s1;
    }
    v43 = p_s1->__r_.__value_.__r.__words[0];
    size = p_s1->__r_.__value_.__l.__size_;
    v45 = LODWORD(p_s1->__r_.__value_.__r.__words[2]);
    if (v43 == 0x656E696C65706950 && size == 0x7465446C65646F4DLL && v45 == 1936484705)
    {
      std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
      v48 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v65, v63);
      if (v64 < 0)
        operator delete(v63[0]);
      if (v66 != v48)
      {
        std::string::basic_string[abi:ne180100]<0>(v63, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
        v72 = v63;
        v49 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v65, v63, (_OWORD **)&v72);
        v50 = (_QWORD *)v49 + 7;
        if (*((char *)v49 + 79) < 0)
          v50 = (_QWORD *)*v50;
        -[MLLoaderEvent numberFromCString:](self, "numberFromCString:", v50);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLLoaderEvent setModelDimension:](self, "setModelDimension:", v37);
        goto LABEL_106;
      }
    }
LABEL_108:
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v66[0]);
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s1.__r_.__value_.__l.__data_);
    objc_autoreleasePoolPop(v11);
  }
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v71);
  v60 = v69;
  if (v69)
  {
    v61 = (unint64_t *)&v69->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setModelHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setModelDimension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)numberFromCString:(const char *)a3
{
  uint64_t v3;
  std::string __p;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a3);
  v3 = std::stoi(&__p, 0, 10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setNnModelWeightsHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setNnModelShapeHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setNnModelNetHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setFirstPartyExecutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setModelOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setModelLoadTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setComputeUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setModelEngineType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setModelLoadError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)name
{
  __CFString *v2;

  v2 = CFSTR("com.apple.CoreML.MLLoader");
  return (NSString *)CFSTR("com.apple.CoreML.MLLoader");
}

- (void)setModelIsEncrypted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLLoaderEvent modelOrigin](self, "modelOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("modelOrigin"));

  -[MLLoaderEvent modelType](self, "modelType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelType"));

  -[MLLoaderEvent modelVersion](self, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("modelVersion"));

  -[MLLoaderEvent compilerVersion](self, "compilerVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("compilerVersion"));

  -[MLLoaderEvent computeUnits](self, "computeUnits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("computeUnits"));

  -[MLLoaderEvent modelLoadTime](self, "modelLoadTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelLoadTime"));

  -[MLLoaderEvent modelName](self, "modelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("modelName"));

  -[MLLoaderEvent modelHash](self, "modelHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("modelHash"));

  -[MLLoaderEvent modelDimension](self, "modelDimension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("modelDimension"));

  -[MLLoaderEvent nnModelNetHash](self, "nnModelNetHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("nnModelNetHash"));

  -[MLLoaderEvent nnModelShapeHash](self, "nnModelShapeHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("nnModelShapeHash"));

  -[MLLoaderEvent nnModelWeightsHash](self, "nnModelWeightsHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nnModelWeightsHash"));

  -[MLLoaderEvent modelLoadError](self, "modelLoadError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("modelLoadError"));

  -[MLLoaderEvent bundleIdentifier](self, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("bundleIdentifier"));

  -[MLLoaderEvent firstPartyExecutable](self, "firstPartyExecutable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("firstPartyExecutable"));

  -[MLLoaderEvent modelIsEncrypted](self, "modelIsEncrypted");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("modelIsEncrypted"));

  -[MLLoaderEvent modelProgramValidationError](self, "modelProgramValidationError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("modelProgramValidationError"));

  -[MLLoaderEvent modelProgramParsingError](self, "modelProgramParsingError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("modelProgramParsingError"));

  -[MLLoaderEvent modelEngineType](self, "modelEngineType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("modelEngineType"));

  -[MLLoaderEvent processName](self, "processName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("processName"));

  -[MLLoaderEvent containsCustomLayer](self, "containsCustomLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("containsCustomLayer"));

  return (NSDictionary *)v3;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)nnModelWeightsHash
{
  return self->_nnModelWeightsHash;
}

- (NSString)nnModelShapeHash
{
  return self->_nnModelShapeHash;
}

- (NSString)nnModelNetHash
{
  return self->_nnModelNetHash;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSNumber)modelProgramValidationError
{
  return self->_modelProgramValidationError;
}

- (NSNumber)modelProgramParsingError
{
  return self->_modelProgramParsingError;
}

- (NSNumber)modelOrigin
{
  return self->_modelOrigin;
}

- (NSNumber)modelLoadTime
{
  return self->_modelLoadTime;
}

- (NSNumber)modelLoadError
{
  return self->_modelLoadError;
}

- (NSNumber)modelIsEncrypted
{
  return self->_modelIsEncrypted;
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (NSNumber)modelEngineType
{
  return self->_modelEngineType;
}

- (NSNumber)modelDimension
{
  return self->_modelDimension;
}

- (NSNumber)containsCustomLayer
{
  return self->_containsCustomLayer;
}

- (NSNumber)computeUnits
{
  return self->_computeUnits;
}

- (NSString)compilerVersion
{
  return self->_compilerVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDimension, 0);
  objc_storeStrong((id *)&self->_nnModelWeightsHash, 0);
  objc_storeStrong((id *)&self->_nnModelShapeHash, 0);
  objc_storeStrong((id *)&self->_nnModelNetHash, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);
  objc_storeStrong((id *)&self->_containsCustomLayer, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_modelEngineType, 0);
  objc_storeStrong((id *)&self->_modelProgramParsingError, 0);
  objc_storeStrong((id *)&self->_modelProgramValidationError, 0);
  objc_storeStrong((id *)&self->_modelIsEncrypted, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_modelLoadError, 0);
  objc_storeStrong((id *)&self->_modelOrigin, 0);
  objc_storeStrong((id *)&self->_computeUnits, 0);
  objc_storeStrong((id *)&self->_compilerVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelLoadTime, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

- (void)setModelProgramValidationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setModelProgramParsingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setContainsCustomLayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
