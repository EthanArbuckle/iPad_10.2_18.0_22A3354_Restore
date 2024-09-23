@implementation DEMorphun

- (BOOL)downloadData:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  std::vector<std::string>::pointer end;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  std::string *v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  uint64_t v21;
  std::vector<std::string>::pointer v22;
  std::vector<std::string>::pointer begin;
  __int128 v24;
  std::string *p_p;
  void *v26;
  void *v27;
  std::vector<std::string>::pointer v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  std::string *v33;
  std::string *v34;
  __int128 v35;
  std::string *v36;
  std::vector<std::string>::pointer v37;
  BOOL v38;
  id v40;
  DEMorphun *v41;
  void *v42[2];
  std::string::size_type v43;
  std::string __p;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  std::vector<std::string> v49;
  std::vector<std::string> v50;
  std::__split_buffer<std::string> __v;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  memset(&v50, 0, sizeof(v50));
  memset(&v49, 0, sizeof(v49));
  v40 = a3;
  v41 = self;
  -[DEMorphun getAllPaths](self, "getAllPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = v40;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          std::string::basic_string[abi:ne180100]<0>(v42, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
          siri::dialogengine::GetLocaleLanguage(&__p);
          end = v50.__end_;
          if (v50.__end_ >= v50.__end_cap_.__value_)
          {
            v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v50.__end_ - (char *)v50.__begin_) >> 3);
            v15 = v14 + 1;
            if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<BOOL>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3) > v15)
              v15 = 0x5555555555555556 * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 3) >= 0x555555555555555)
              v16 = 0xAAAAAAAAAAAAAAALL;
            else
              v16 = v15;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v50.__end_cap_;
            if (v16)
              v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v50.__end_cap_, v16);
            else
              v17 = 0;
            v18 = v17 + v14;
            __v.__first_ = v17;
            __v.__begin_ = v18;
            __v.__end_cap_.__value_ = &v17[v16];
            v19 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v18->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
            memset(&__p, 0, sizeof(__p));
            __v.__end_ = v18 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v50, &__v);
            v20 = v50.__end_;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            v50.__end_ = v20;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          else
          {
            v13 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v50.__end_->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v13;
            memset(&__p, 0, sizeof(__p));
            v50.__end_ = end + 1;
          }
          if (SHIBYTE(v43) < 0)
            operator delete(v42[0]);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v6);
  }

  siri::dialogengine::MorphunUpdaterCatutil::Download(v21, (uint64_t *)&v50);
  begin = v50.__begin_;
  v22 = v50.__end_;
  if (v50.__begin_ == v50.__end_)
  {
    v37 = v50.__begin_;
  }
  else
  {
    do
    {
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
      }
      else
      {
        v24 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v24;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEMorphun getPath:](v41, "getPath:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "length"))
      {
        std::string::basic_string[abi:ne180100]<0>(v42, (char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
        v28 = v49.__end_;
        if (v49.__end_ >= v49.__end_cap_.__value_)
        {
          v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v49.__end_ - (char *)v49.__begin_) >> 3);
          v31 = v30 + 1;
          if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3) > v31)
            v31 = 0x5555555555555556 * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v49.__end_cap_.__value_ - (char *)v49.__begin_) >> 3) >= 0x555555555555555)
            v32 = 0xAAAAAAAAAAAAAAALL;
          else
            v32 = v31;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v49.__end_cap_;
          if (v32)
            v33 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v49.__end_cap_, v32);
          else
            v33 = 0;
          v34 = v33 + v30;
          __v.__first_ = v33;
          __v.__begin_ = v34;
          __v.__end_cap_.__value_ = &v33[v32];
          v35 = *(_OWORD *)v42;
          v34->__r_.__value_.__r.__words[2] = v43;
          *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
          v42[1] = 0;
          v43 = 0;
          v42[0] = 0;
          __v.__end_ = v34 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v49, &__v);
          v36 = v49.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v49.__end_ = v36;
          if (SHIBYTE(v43) < 0)
            operator delete(v42[0]);
        }
        else
        {
          v29 = *(_OWORD *)v42;
          v49.__end_->__r_.__value_.__r.__words[2] = v43;
          *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
          v49.__end_ = v28 + 1;
        }
      }

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      ++begin;
    }
    while (begin != v22);
    begin = v50.__begin_;
    v37 = v50.__end_;
  }
  v38 = (char *)v37 - (char *)begin == (char *)v49.__end_ - (char *)v49.__begin_;

  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v49;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v50;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

  return v38;
}

- (id)getPath:(id)a3
{
  id v3;
  std::string *v4;
  void *v5;
  void *v7;
  char v8;
  std::string __p;
  std::string v10;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)objc_msgSend(v3, "UTF8String"));
  siri::dialogengine::GetLocaleLanguage(&__p);
  siri::dialogengine::MorphunUpdaterCatutil::GetPath((uint64_t)&__p, &v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v8 < 0)
    operator delete(v7);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v10;
  else
    v4 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);

  return v5;
}

- (id)getAllPaths
{
  void *v2;
  __int128 *v3;
  void *p_p;
  void *v5;
  std::string *v6;
  void *v7;
  __int128 *v8;
  __int128 *v9;
  BOOL v10;
  std::string v12;
  void *__p;
  char v14;
  __int128 *v15;
  _QWORD *v16[2];

  siri::dialogengine::MorphunUpdaterCatutil::GetPaths((uint64_t)&v15);
  v2 = (void *)objc_opt_new();
  v3 = v15;
  if (v15 != (__int128 *)v16)
  {
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100](&v12, v3 + 2);
      if (v14 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v6 = &v12;
      else
        v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v5, v7);

      if (v14 < 0)
        operator delete(__p);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v12.__r_.__value_.__l.__data_);
      v8 = (__int128 *)*((_QWORD *)v3 + 1);
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = *(__int128 **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (__int128 *)*((_QWORD *)v3 + 2);
          v10 = *(_QWORD *)v9 == (_QWORD)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != (__int128 *)v16);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v16[0]);
  return v2;
}

@end
