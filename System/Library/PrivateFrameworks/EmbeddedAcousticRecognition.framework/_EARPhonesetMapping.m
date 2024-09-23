@implementation _EARPhonesetMapping

- (_EARPhonesetMapping)initWithLanguage:(id)a3
{
  id v4;
  _EARPhonesetMapping *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 __p;
  uint64_t v11;
  __int128 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EARPhonesetMapping;
  v5 = -[_EARPhonesetMapping init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p = 0uLL;
      v11 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::PhonesetMapping,std::allocator<quasar::PhonesetMapping>,std::string,void>(&__p, &v12);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v5->_phoneset, &v12);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (SHIBYTE(v11) < 0)
      operator delete((void *)__p);
  }

  return v5;
}

- (id)ipaPhoneSequenceForAsrProns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PhonesetMapping *ptr;
  void **v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  ptr = self->_phoneset.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  quasar::PhonesetMapping::getIpaPhoneSequence((uint64_t)ptr, (uint64_t)&v11, (uint64_t)__p);
  if (v15 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  objc_msgSend(v6, "stringWithUTF8String:", v8, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v13) < 0)
    operator delete(v11);

  return v9;
}

- (id)nvAsrPhoneSequenceForXsampaProns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PhonesetMapping *ptr;
  void **v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  ptr = self->_phoneset.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  quasar::PhonesetMapping::getNvASRPhoneSequence((uint64_t)ptr, (uint64_t)&v11, (uint64_t)__p);
  if (v15 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  objc_msgSend(v6, "stringWithUTF8String:", v8, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v13) < 0)
    operator delete(v11);

  return v9;
}

- (id)supportedXsampaProns
{
  id v2;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer i;
  __int128 v5;
  std::string *p_p;
  void *v7;
  void *v8;
  std::string __p;
  std::vector<std::string> v11;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  quasar::PhonesetMapping::getSupportedXsampaProns(&v11);
  begin = v11.__begin_;
  for (i = v11.__end_; begin != i; ++begin)
  {
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
    }
    else
    {
      v5 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v8 = (void *)objc_msgSend(v2, "copy");
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v8;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_phoneset);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
