@implementation _EARInterpolator

+ (id)interpolate:(id)a3 configPath:(id)a4 dataRoot:(id)a5 modelRoot:(id)a6
{
  id v9;
  void ***v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  std::vector<std::string>::pointer end;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  std::string *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  _EARNgramLmModel *v27;
  unint64_t *p_size;
  unint64_t v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  id v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  std::__split_buffer<std::string>::pointer first;
  std::__split_buffer<std::string>::pointer begin;
  std::vector<std::string> v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  void *v57[2];
  std::string::size_type v58;
  void *__p[2];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  std::__split_buffer<std::string> __v;
  uint8_t v64[1552];
  uint8_t buf[16];
  __int128 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v9 = a4;
  v47 = a5;
  v49 = a6;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v60 = 0;
  }
  memset(&__v, 0, 24);
  *(_OWORD *)buf = 0u;
  v66 = 0u;
  v67 = 1065353216;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v64, (uint64_t)__p, (uint64_t *)&__v, (uint64_t)buf);
  v10 = (void ***)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
  *(_QWORD *)buf = &__v;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v10);
  if (SBYTE7(v60) < 0)
    operator delete(__p[0]);
  if (v49)
  {
    objc_msgSend(v49, "ear_toString");
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    *(_QWORD *)&v66 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::NgramSrilmInterpolationConfig,std::allocator<quasar::NgramSrilmInterpolationConfig>,quasar::SystemConfig &,std::string,void>((uint64_t)v64, (uint64_t)buf, &v55);
  if (SBYTE7(v66) < 0)
    operator delete(*(void **)buf);
  v11 = v48;
  memset(&v54, 0, sizeof(v54));
  *(_OWORD *)__p = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __p, buf, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v12);
        v16 = *((id *)__p[1] + i);
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "ear_toString");
        }
        else
        {
          v57[0] = 0;
          v57[1] = 0;
          v58 = 0;
        }

        end = v54.__end_;
        if (v54.__end_ >= v54.__end_cap_.__value_)
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v54.__end_ - (char *)v54.__begin_) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v54.__end_cap_.__value_ - (char *)v54.__begin_) >> 3) > v21)
            v21 = 0x5555555555555556 * (((char *)v54.__end_cap_.__value_ - (char *)v54.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v54.__end_cap_.__value_ - (char *)v54.__begin_) >> 3) >= 0x555555555555555)
            v22 = 0xAAAAAAAAAAAAAAALL;
          else
            v22 = v21;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v54.__end_cap_;
          if (v22)
            v23 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v54.__end_cap_, v22);
          else
            v23 = 0;
          v24 = v23 + v20;
          __v.__first_ = v23;
          __v.__begin_ = v24;
          __v.__end_cap_.__value_ = &v23[v22];
          v25 = *(_OWORD *)v57;
          v24->__r_.__value_.__r.__words[2] = v58;
          *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
          v57[1] = 0;
          v58 = 0;
          v57[0] = 0;
          __v.__end_ = v24 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v54, &__v);
          v26 = v54.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v54.__end_ = v26;
          if (SHIBYTE(v58) < 0)
            operator delete(v57[0]);
        }
        else
        {
          v19 = *(_OWORD *)v57;
          v54.__end_->__r_.__value_.__r.__words[2] = v58;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v19;
          v54.__end_ = end + 1;
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __p, buf, 16);
    }
    while (v13);
  }

  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    *(_QWORD *)&v66 = 0;
  }
  if (v47)
  {
    objc_msgSend(v47, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v60 = 0;
  }
  quasar::interpolateNgramSrilmArpaFiles((uint64_t)&v55, (uint64_t)buf);
  if (SBYTE7(v60) < 0)
    operator delete(__p[0]);
  if (SBYTE7(v66) < 0)
    operator delete(*(void **)buf);
  if (__v.__first_)
  {
    v27 = [_EARNgramLmModel alloc];
    first = __v.__first_;
    begin = __v.__begin_;
    if (__v.__begin_)
    {
      p_size = &__v.__begin_->__r_.__value_.__l.__size_;
      do
        v29 = __ldxr(p_size);
      while (__stxr(v29 + 1, p_size));
    }
    v50 = v55;
    v51 = v56;
    if (v56)
    {
      p_shared_owners = (unint64_t *)&v56->__shared_owners_;
      do
        v31 = __ldxr(p_shared_owners);
      while (__stxr(v31 + 1, p_shared_owners));
    }
    v32 = -[_EARNgramLmModel _initWithModel:config:](v27, "_initWithModel:config:", &first, &v50, v47);
    v33 = v51;
    if (v51)
    {
      v34 = (unint64_t *)&v51->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v36 = (std::__shared_weak_count *)begin;
    if (begin)
    {
      v37 = &begin->__r_.__value_.__l.__size_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
  }
  else
  {
    EarLmLogger();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v39, OS_LOG_TYPE_DEFAULT, "Interpolation failed", buf, 2u);
    }

    v32 = 0;
  }
  v40 = (std::__shared_weak_count *)__v.__begin_;
  if (__v.__begin_)
  {
    v41 = &__v.__begin_->__r_.__value_.__l.__size_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  *(_QWORD *)buf = &v54;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v43 = v56;
  if (v56)
  {
    v44 = (unint64_t *)&v56->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v64);

  return v32;
}

@end
