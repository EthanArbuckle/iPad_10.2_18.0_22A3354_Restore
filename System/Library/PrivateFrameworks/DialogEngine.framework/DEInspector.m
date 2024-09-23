@implementation DEInspector

+ (id)getParamsForPattern:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  std::string *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  std::string *v31;
  void *v32;
  _QWORD *v33;
  _QWORD **v34;
  BOOL v35;
  id v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  _QWORD **v41;
  _QWORD *v42;
  uint64_t v43;
  std::string v44;
  uint64_t *v45;
  _QWORD *v46[2];
  char v47;
  __n128 v48;
  uint64_t v49;
  uint64_t v50;
  void *v51[2];
  char v52;
  void *v53[2];
  char v54;
  std::string *v55;

  MEMORY[0x1E0C80A78](a1);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = objc_retainAutorelease(v14);
  std::string::basic_string[abi:ne180100]<0>(v53, (char *)objc_msgSend(v17, "UTF8String"));
  v18 = objc_retainAutorelease(v16);
  std::string::basic_string[abi:ne180100]<0>(v51, (char *)objc_msgSend(v18, "UTF8String"));
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setPatternId:", v18);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v19, "setParams:", v20);
  siri::dialogengine::GetTemplateDirs((uint64_t)v53, 1, (uint64_t)&v41);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)&v49, (std::string **)&v41);
  v45 = (uint64_t *)&v41;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
  siri::dialogengine::PatternFile::LoadFromId(&v49, (uint64_t)v51, 0, &v48);
  v21 = v48.n128_u64[0];
  if (v48.n128_u64[0])
  {
    v46[1] = 0;
    v46[0] = 0;
    v45 = (uint64_t *)v46;
    v47 = 0;
    siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v41, (const siri::dialogengine::RequestInfo *)&v50);
    memset(&v44, 0, sizeof(v44));
    std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v44, (uint64_t)v42, v43, 0xAAAAAAAAAAAAAAABLL * ((v43 - (uint64_t)v42) >> 5));
    if (v12)
      v22 = 2;
    else
      v22 = 0;
    siri::dialogengine::GetParamsForPattern(v21, (std::string **)&v44, v22, v10, v8, (uint64_t)&v45);
    v55 = &v44;
    std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);
    siri::dialogengine::RequestInfo::~RequestInfo((void **)&v41);
    siri::dialogengine::ParameterCollection::GetUniqueParameters(&v45, (siri::dialogengine::Context *)&v49, (uint64_t **)&v41);
    v23 = v41;
    if (v41 != &v42)
    {
      do
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = v23[7];
        if (*(char *)(v25 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)(v25 + 8), *(_QWORD *)(v25 + 16));
        }
        else
        {
          v26 = *(_OWORD *)(v25 + 8);
          v44.__r_.__value_.__r.__words[2] = *(_QWORD *)(v25 + 24);
          *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v26;
        }
        if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v27 = &v44;
        else
          v27 = (std::string *)v44.__r_.__value_.__r.__words[0];
        objc_msgSend(v24, "stringWithUTF8String:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__r_.__value_.__l.__data_);
        v29 = (void *)MEMORY[0x1E0CB3940];
        v30 = v23[7];
        if (*(char *)(v30 + 55) < 0)
          std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)(v30 + 32), *(_QWORD *)(v30 + 40));
        else
          v44 = *(std::string *)(v30 + 32);
        if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v31 = &v44;
        else
          v31 = (std::string *)v44.__r_.__value_.__r.__words[0];
        objc_msgSend(v29, "stringWithUTF8String:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__r_.__value_.__l.__data_);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, v28);

        v33 = (_QWORD *)v23[1];
        if (v33)
        {
          do
          {
            v34 = (_QWORD **)v33;
            v33 = (_QWORD *)*v33;
          }
          while (v33);
        }
        else
        {
          do
          {
            v34 = (_QWORD **)v23[2];
            v35 = *v34 == v23;
            v23 = v34;
          }
          while (!v35);
        }
        v23 = v34;
      }
      while (v34 != &v42);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v42);
    std::__tree<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>>>::destroy(v46[0]);
  }
  v36 = v19;
  v37 = (std::__shared_weak_count *)v48.n128_u64[1];
  if (v48.n128_u64[1])
  {
    v38 = (unint64_t *)(v48.n128_u64[1] + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)&v49);

  if (v52 < 0)
    operator delete(v51[0]);
  if (v54 < 0)
    operator delete(v53[0]);

  return v36;
}

+ (id)getParamsForCat:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  std::string *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  std::string *v23;
  void *v24;
  _QWORD *v25;
  _QWORD **v26;
  BOOL v27;
  _QWORD **v29;
  _QWORD *v30;
  uint64_t v31;
  std::string v32;
  _BYTE v33[8];
  uint64_t v34;
  uint64_t *v35;
  _QWORD *v36[2];
  char v37;
  void *v38[2];
  char v39;
  void *v40[2];
  char v41;
  std::string *v42;

  MEMORY[0x1E0C80A78](a1);
  v8 = v7;
  v10 = v9;
  v11 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(v40, (char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v38, (char *)objc_msgSend(v12, "UTF8String"));
  v13 = (void *)objc_opt_new();
  v36[0] = 0;
  v36[1] = 0;
  v35 = (uint64_t *)v36;
  v37 = 0;
  siri::dialogengine::GetTemplateDirs((uint64_t)v40, 1, (uint64_t)&v29);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v33, (std::string **)&v29);
  v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v29, (const siri::dialogengine::RequestInfo *)&v34);
  memset(&v32, 0, sizeof(v32));
  std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v32, (uint64_t)v30, v31, 0xAAAAAAAAAAAAAAABLL * ((v31 - (uint64_t)v30) >> 5));
  siri::dialogengine::GetParamsForDialogCat((uint64_t *)&v32, (uint64_t)v38, (uint64_t)&v35, 0);
  v42 = &v32;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
  siri::dialogengine::RequestInfo::~RequestInfo((void **)&v29);
  objc_msgSend(v13, "setCatId:", v12);
  v14 = (void *)objc_opt_new();
  siri::dialogengine::ParameterCollection::GetUniqueParameters(&v35, (siri::dialogengine::Context *)v33, (uint64_t **)&v29);
  v15 = v29;
  if (v29 != &v30)
  {
    do
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = v15[7];
      if (*(char *)(v17 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v17 + 8), *(_QWORD *)(v17 + 16));
      }
      else
      {
        v18 = *(_OWORD *)(v17 + 8);
        v32.__r_.__value_.__r.__words[2] = *(_QWORD *)(v17 + 24);
        *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v18;
      }
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = &v32;
      else
        v19 = (std::string *)v32.__r_.__value_.__r.__words[0];
      objc_msgSend(v16, "stringWithUTF8String:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v32.__r_.__value_.__l.__data_);
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = v15[7];
      if (*(char *)(v22 + 55) < 0)
        std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v22 + 32), *(_QWORD *)(v22 + 40));
      else
        v32 = *(std::string *)(v22 + 32);
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v32;
      else
        v23 = (std::string *)v32.__r_.__value_.__r.__words[0];
      objc_msgSend(v21, "stringWithUTF8String:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v32.__r_.__value_.__l.__data_);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, v20);

      v25 = (_QWORD *)v15[1];
      if (v25)
      {
        do
        {
          v26 = (_QWORD **)v25;
          v25 = (_QWORD *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (_QWORD **)v15[2];
          v27 = *v26 == v15;
          v15 = v26;
        }
        while (!v27);
      }
      v15 = v26;
    }
    while (v26 != &v30);
  }
  objc_msgSend(v13, "setParams:", v14);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v30);

  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v33);
  std::__tree<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>>>::destroy(v36[0]);
  if (v39 < 0)
    operator delete(v38[0]);
  if (v41 < 0)
    operator delete(v40[0]);

  return v13;
}

@end
