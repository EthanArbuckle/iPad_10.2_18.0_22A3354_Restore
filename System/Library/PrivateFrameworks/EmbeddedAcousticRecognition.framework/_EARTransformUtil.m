@implementation _EARTransformUtil

+ (id)hatToQsrString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *p_p;
  void *v7;
  void *__p;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v3 = (id)objc_msgSend(v3, "ear_toString");
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  __p = 0;
  v10 = 0;
  v11 = 0;
  v5 = quasar::QsrText::SingletonInstance((quasar::QsrText *)v3);
  if ((quasar::QsrText::hatToQsrToken(v5, (uint64_t)&v12, (uint64_t)&__p) & 1) != 0)
  {
    if (v11 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, __p, v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  if (SHIBYTE(v14) < 0)
    operator delete(v12);

  return v7;
}

+ (id)hatToQsrStrings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  std::vector<std::string>::pointer end;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  quasar::QsrText *v18;
  uint64_t v19;
  void *v20;
  std::vector<std::string> v22;
  void *__p[2];
  std::string::size_type v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  std::__split_buffer<std::string> __v;
  void **v30[18];

  v30[16] = *(void ***)MEMORY[0x1E0C80C00];
  memset(&v22, 0, sizeof(v22));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v24 = 0;
        }

        end = v22.__end_;
        if (v22.__end_ >= v22.__end_cap_.__value_)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_ - (char *)v22.__begin_) >> 3);
          v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) > v12)
            v12 = 0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) >= 0x555555555555555)
            v13 = 0xAAAAAAAAAAAAAAALL;
          else
            v13 = v12;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v22.__end_cap_;
          if (v13)
            v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v22.__end_cap_, v13);
          else
            v14 = 0;
          v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          v24 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v22, &__v);
          v17 = v22.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v22.__end_ = v17;
          if (SHIBYTE(v24) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v10 = *(_OWORD *)__p;
          v22.__end_->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v22.__end_ = end + 1;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

  memset(v30, 0, 24);
  v19 = quasar::QsrText::SingletonInstance(v18);
  if ((quasar::QsrText::hatToQsrTokens(v19, (uint64_t *)&v22, (uint64_t *)v30, 0) & 1) != 0)
    EARHelpers::VectorToArray<std::string>((__int128 **)v30);
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v25 = v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);
  v30[0] = (void **)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v30);

  return v20;
}

@end
