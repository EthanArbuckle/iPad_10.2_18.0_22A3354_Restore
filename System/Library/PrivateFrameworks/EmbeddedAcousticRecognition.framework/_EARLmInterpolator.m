@implementation _EARLmInterpolator

+ (id)interpolateArpaFilePaths:(id)a3 configPath:(id)a4 dataRoot:(id)a5 modelRoot:(id)a6
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
  _EARNgramLmModel2 *v27;
  unint64_t *p_size;
  unint64_t v29;
  id v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;
  id v42;
  id v43;
  id v44;
  std::__split_buffer<std::string>::pointer first;
  std::__split_buffer<std::string>::pointer begin;
  std::vector<std::string> v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  void *v50[2];
  std::string::size_type v51;
  void *__p[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::__split_buffer<std::string> __v;
  uint8_t v57[1552];
  uint8_t buf[16];
  __int128 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v9 = a4;
  v42 = a5;
  v44 = a6;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v53 = 0;
  }
  memset(&__v, 0, 24);
  *(_OWORD *)buf = 0u;
  v59 = 0u;
  v60 = 1065353216;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v57, (uint64_t)__p, (uint64_t *)&__v, (uint64_t)buf);
  v10 = (void ***)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
  *(_QWORD *)buf = &__v;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v10);
  if (SBYTE7(v53) < 0)
    operator delete(__p[0]);
  if (v44)
  {
    objc_msgSend(v44, "ear_toString");
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    *(_QWORD *)&v59 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::NgramSrilmInterpolationConfig,std::allocator<quasar::NgramSrilmInterpolationConfig>,quasar::SystemConfig &,std::string,void>((uint64_t)v57, (uint64_t)buf, &v48);
  if (SBYTE7(v59) < 0)
    operator delete(*(void **)buf);
  v11 = v43;
  memset(&v47, 0, sizeof(v47));
  *(_OWORD *)__p = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __p, buf, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(v12);
        v16 = *((id *)__p[1] + i);
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "ear_toString");
        }
        else
        {
          v50[0] = 0;
          v50[1] = 0;
          v51 = 0;
        }

        end = v47.__end_;
        if (v47.__end_ >= v47.__end_cap_.__value_)
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v47.__end_ - (char *)v47.__begin_) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v47.__end_cap_.__value_ - (char *)v47.__begin_) >> 3) > v21)
            v21 = 0x5555555555555556 * (((char *)v47.__end_cap_.__value_ - (char *)v47.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v47.__end_cap_.__value_ - (char *)v47.__begin_) >> 3) >= 0x555555555555555)
            v22 = 0xAAAAAAAAAAAAAAALL;
          else
            v22 = v21;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v47.__end_cap_;
          if (v22)
            v23 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v47.__end_cap_, v22);
          else
            v23 = 0;
          v24 = v23 + v20;
          __v.__first_ = v23;
          __v.__begin_ = v24;
          __v.__end_cap_.__value_ = &v23[v22];
          v25 = *(_OWORD *)v50;
          v24->__r_.__value_.__r.__words[2] = v51;
          *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
          v50[1] = 0;
          v51 = 0;
          v50[0] = 0;
          __v.__end_ = v24 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v47, &__v);
          v26 = v47.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v47.__end_ = v26;
          if (SHIBYTE(v51) < 0)
            operator delete(v50[0]);
        }
        else
        {
          v19 = *(_OWORD *)v50;
          v47.__end_->__r_.__value_.__r.__words[2] = v51;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v19;
          v47.__end_ = end + 1;
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
    *(_QWORD *)&v59 = 0;
  }
  if (v42)
  {
    objc_msgSend(v42, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v53 = 0;
  }
  quasar::interpolateNgramSrilmArpaFiles((uint64_t)&v48, (uint64_t)buf);
  if (SBYTE7(v53) < 0)
    operator delete(__p[0]);
  if (SBYTE7(v59) < 0)
    operator delete(*(void **)buf);
  if (__v.__first_)
  {
    v27 = [_EARNgramLmModel2 alloc];
    first = __v.__first_;
    begin = __v.__begin_;
    if (__v.__begin_)
    {
      p_size = &__v.__begin_->__r_.__value_.__l.__size_;
      do
        v29 = __ldxr(p_size);
      while (__stxr(v29 + 1, p_size));
    }
    v30 = -[_EARNgramLmModel2 _initWithModel:](v27, "_initWithModel:", &first, v42);
    v31 = (std::__shared_weak_count *)begin;
    if (begin)
    {
      v32 = &begin->__r_.__value_.__l.__size_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
  }
  else
  {
    EarLmLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v34, OS_LOG_TYPE_DEFAULT, "Interpolation failed", buf, 2u);
    }

    v30 = 0;
  }
  v35 = (std::__shared_weak_count *)__v.__begin_;
  if (__v.__begin_)
  {
    v36 = &__v.__begin_->__r_.__value_.__l.__size_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  *(_QWORD *)buf = &v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v38 = v49;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      v40 = __ldaxr(p_shared_owners);
    while (__stlxr(v40 - 1, p_shared_owners));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v57);

  return v30;
}

@end
