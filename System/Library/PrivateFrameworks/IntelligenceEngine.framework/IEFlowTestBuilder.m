@implementation IEFlowTestBuilder

- (void)clear
{
  siri::intelligence::TestCaseBuilder::Clear((protobuf::FlowTest_Test **)&self->_mBuilder);
}

- (void)sendEvent:(id)a3
{
  void *v3;
  id v4;
  id v6;
  void *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t *p_mBuilder;
  void *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  std::__shared_weak_count *v25;
  void *lpsrc;
  std::__shared_weak_count *v27;
  std::string __p;
  void *v29[2];
  char v30;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "eventId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v7, "eventId");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = (char *)objc_msgSend(v4, "UTF8String");
      v9 = 1;
    }
    else
    {
      v9 = 0;
      v8 = "";
    }
  }
  else
  {
    v9 = 0;
    v8 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v29, v8);
  if (v9)

  if (v7)
  {

    objc_msgSend(v7, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v7, "name");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (char *)objc_msgSend(v4, "UTF8String");
      v11 = 1;
    }
    else
    {
      v11 = 0;
      v10 = "";
    }
  }
  else
  {
    v11 = 0;
    v10 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v10);
  if (v11)

  if (!v7)
  {
    lpsrc = 0;
    v27 = 0;
    p_mBuilder = (uint64_t *)&self->_mBuilder;
LABEL_26:
    v24 = 0;
    v25 = 0;
    goto LABEL_27;
  }

  objc_msgSend(v7, "slots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "slots");
    v13 = objc_claimAutoreleasedReturnValue();
    IE_NSObjectToVariable(v13, &lpsrc);

  }
  else
  {
    lpsrc = 0;
    v27 = 0;
  }

  p_mBuilder = (uint64_t *)&self->_mBuilder;
  if (!lpsrc)
    goto LABEL_26;
  if (!v15)
    goto LABEL_26;
  v24 = v15;
  v25 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
LABEL_27:
  siri::intelligence::TestCaseBuilder::SendIntent(p_mBuilder, (uint64_t)v29, &__p, (uint64_t *)&v24);
  v18 = v25;
  if (v25)
  {
    v19 = (unint64_t *)&v25->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v27;
  if (v27)
  {
    v22 = (unint64_t *)&v27->__shared_owners_;
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
  if (v30 < 0)
    operator delete(v29[0]);

}

- (void)assertResponseAllIds:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  std::vector<std::string>::pointer end;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  id v18;
  void *__p[2];
  std::string::size_type v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  std::vector<std::string> v25;
  std::__split_buffer<std::string> __v;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  memset(&v25, 0, sizeof(v25));
  v18 = a3;
  if (v18)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = v18;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v7)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
            end = v25.__end_;
            if (v25.__end_ >= v25.__end_cap_.__value_)
            {
              v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_ - (char *)v25.__begin_) >> 3);
              v11 = v10 + 1;
              if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::pair<void (*)(void const*),void const*>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) > v11)
                v11 = 0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) >= 0x555555555555555)
                v12 = 0xAAAAAAAAAAAAAAALL;
              else
                v12 = v11;
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v25.__end_cap_;
              if (v12)
                v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v25.__end_cap_, v12);
              else
                v13 = 0;
              v14 = v13 + v10;
              __v.__first_ = v13;
              __v.__begin_ = v14;
              __v.__end_cap_.__value_ = &v13[v12];
              v15 = *(_OWORD *)__p;
              v14->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
              __p[1] = 0;
              v20 = 0;
              __p[0] = 0;
              __v.__end_ = v14 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v25, &__v);
              v16 = v25.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
              v25.__end_ = v16;
              if (SHIBYTE(v20) < 0)
                operator delete(__p[0]);
            }
            else
            {
              v9 = *(_OWORD *)__p;
              v25.__end_->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
              v25.__end_ = end + 1;
            }
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v4);
    }

  }
  siri::intelligence::TestCaseBuilder::AssertResponseAllIds((uint64_t *)&self->_mBuilder, (uint64_t *)&v25);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

}

- (void)assertResponseAnyId:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  std::vector<std::string>::pointer end;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  id v18;
  void *__p[2];
  std::string::size_type v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  std::vector<std::string> v25;
  std::__split_buffer<std::string> __v;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  memset(&v25, 0, sizeof(v25));
  v18 = a3;
  if (v18)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = v18;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v7)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
            end = v25.__end_;
            if (v25.__end_ >= v25.__end_cap_.__value_)
            {
              v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_ - (char *)v25.__begin_) >> 3);
              v11 = v10 + 1;
              if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::pair<void (*)(void const*),void const*>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) > v11)
                v11 = 0x5555555555555556 * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v25.__end_cap_.__value_ - (char *)v25.__begin_) >> 3) >= 0x555555555555555)
                v12 = 0xAAAAAAAAAAAAAAALL;
              else
                v12 = v11;
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v25.__end_cap_;
              if (v12)
                v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v25.__end_cap_, v12);
              else
                v13 = 0;
              v14 = v13 + v10;
              __v.__first_ = v13;
              __v.__begin_ = v14;
              __v.__end_cap_.__value_ = &v13[v12];
              v15 = *(_OWORD *)__p;
              v14->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
              __p[1] = 0;
              v20 = 0;
              __p[0] = 0;
              __v.__end_ = v14 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v25, &__v);
              v16 = v25.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
              v25.__end_ = v16;
              if (SHIBYTE(v20) < 0)
                operator delete(__p[0]);
            }
            else
            {
              v9 = *(_OWORD *)__p;
              v25.__end_->__r_.__value_.__r.__words[2] = v20;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
              v25.__end_ = end + 1;
            }
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v4);
    }

  }
  siri::intelligence::TestCaseBuilder::AssertResponseAnyId((uint64_t *)&self->_mBuilder, (uint64_t *)&v25);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

}

- (void)setVariable:(id)a3 value:(id)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  std::string __p;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v8 = "";
  std::string::basic_string[abi:ne180100]<0>(&__p, v8);
  IE_NSObjectToVariable(v7, &v19);
  v17 = v19;
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  siri::intelligence::TestCaseBuilder::SetVariable((uint64_t *)&self->_mBuilder, &__p, &v17);
  v11 = v18;
  if (v18)
  {
    v12 = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)gotoResponse:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  std::string __p;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v6 = "";
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  siri::intelligence::TestCaseBuilder::GotoResponse((uint64_t *)&self->_mBuilder, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)switchActivity:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  std::string __p;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v6 = "";
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  siri::intelligence::TestCaseBuilder::SwitchActivity((uint64_t *)&self->_mBuilder, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (int)count
{
  return *((_DWORD *)self->_mBuilder.mImpl.__ptr_ + 8);
}

- (BOOL)addToTestFile:(id)a3 flowId:(id)a4 testName:(id)a5 description:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char v18;
  void *__p[2];
  char v21;
  std::string __str;
  void *v23[2];
  char v24;
  void *v25[2];
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
    v14 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  else
    v14 = "";
  std::string::basic_string[abi:ne180100]<0>(v25, v14);
  if (v11)
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  else
    v15 = "";
  std::string::basic_string[abi:ne180100]<0>(v23, v15);
  if (v12)
    v16 = (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  else
    v16 = "";
  std::string::basic_string[abi:ne180100]<0>(&__str, v16);
  if (v13)
    v17 = (char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  else
    v17 = "";
  std::string::basic_string[abi:ne180100]<0>(__p, v17);
  v18 = siri::intelligence::TestCaseBuilder::AddToTestFile((uint64_t *)&self->_mBuilder, (__int128 *)v25, (__int128 *)v23, &__str, (uint64_t)__p);
  if (v21 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v24 < 0)
    operator delete(v23[0]);
  if (v26 < 0)
    operator delete(v25[0]);

  return v18;
}

- (BOOL)addToTestFile:(id)a3 testName:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  char *v13;
  char v14;
  void *__p[2];
  char v17;
  std::string v18;
  std::string v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
    v11 = (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  else
    v11 = "";
  std::string::basic_string[abi:ne180100]<0>(&v19, v11);
  if (v9)
    v12 = (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v12 = "";
  std::string::basic_string[abi:ne180100]<0>(&v18, v12);
  if (v10)
    v13 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  else
    v13 = "";
  std::string::basic_string[abi:ne180100]<0>(__p, v13);
  v14 = siri::intelligence::TestCaseBuilder::AddToTestFile((uint64_t *)&self->_mBuilder, &v19, &v18, (uint64_t)__p);
  if (v17 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);

  return v14;
}

- (TestCaseBuilder)mBuilder
{
  Impl **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  TestCaseBuilder result;

  cntrl = self->_mBuilder.mImpl.__cntrl_;
  *v2 = self->_mBuilder.mImpl.__ptr_;
  v2[1] = (Impl *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.mImpl.__cntrl_ = (__shared_weak_count *)a2;
  result.mImpl.__ptr_ = (Impl *)self;
  return result;
}

- (void)setMBuilder:(TestCaseBuilder)a3
{
  __shared_weak_count *v3;
  Impl *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(Impl **)a3.mImpl.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.mImpl.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_mBuilder.mImpl.__cntrl_;
  self->_mBuilder.mImpl.__ptr_ = v4;
  self->_mBuilder.mImpl.__cntrl_ = v3;
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

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_mBuilder.mImpl.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  _ZNSt3__115allocate_sharedB8ne180100IN4siri12intelligence15TestCaseBuilder4ImplENS_9allocatorIS4_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&self->_mBuilder.mImpl.__ptr_);
  return self;
}

@end
