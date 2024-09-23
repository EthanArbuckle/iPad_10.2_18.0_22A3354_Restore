uint64_t ML3SubscriptionContainerImportItem::isValid(ML3DAAPImportItem *this)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = ML3DAAPContainerImportItem::isValid(this);
  if ((_DWORD)result)
  {
    if (ML3DAAPImportItem::getIntegerValue(this, 184549408) == 1)
    {
      v3 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = 1;
        _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "ignoring container with cloud id %lld", (uint8_t *)&v4, 0xCu);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void ML3SubscriptionContainerImportItem::getStringValue(ML3DAAPImportItem *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::string *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 __dst;
  std::string __p;
  std::string __str;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  *(_QWORD *)a3 = off_1E5B4D010;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v5 = (std::string *)(a3 + 16);
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  if ((_DWORD)a2 != 184549450)
  {
    ML3DAAPImportItem::getStringValue(this, a2, (uint64_t)&__dst);
    *(_BYTE *)(a3 + 8) = BYTE8(__dst);
    std::string::operator=(v5, &__p);
    *(_QWORD *)&__dst = off_1E5B4D010;
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
    v9 = (void *)__p.__r_.__value_.__r.__words[0];
    goto LABEL_13;
  }
  memset(&__str, 0, sizeof(__str));
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v18, *((_QWORD *)this + 8), 0x61654361u);
  if (v18)
  {
    std::string::basic_string[abi:ne180100](&__dst, *(void **)(v18 + 48), *(_QWORD *)(v18 + 64));
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
    __str.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0];
  }
  else
  {
    ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v16, *((_QWORD *)this + 8), 0x61654354u);
    if (v16)
    {
      std::string::basic_string[abi:ne180100](&__dst, *(void **)(v16 + 48), *(_QWORD *)(v16 + 64));
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
      __str.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0];
    }
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v6 = v19;
  if (v19)
  {
    v7 = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  std::string::operator=(v5, &__str);
  *(_BYTE *)(a3 + 8) = 1;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    v9 = (void *)__str.__r_.__value_.__r.__words[0];
LABEL_13:
    operator delete(v9);
  }
}

void sub_1AC37F55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25)
{
  uint64_t v25;
  void **v26;
  uint64_t v27;
  uint64_t v28;

  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100](v28 - 64);
  *(_QWORD *)v25 = v27;
  if (*(char *)(v25 + 39) < 0)
    operator delete(*v26);
  _Unwind_Resume(a1);
}

uint64_t ML3SubscriptionContainerImportItem::getIntegerValue(ML3DAAPImportItem *this, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;

  if ((_DWORD)a2 != 184549426)
    return ML3DAAPContainerImportItem::getIntegerValue(this, a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v2, v3);
  return (uint64_t)v4;
}

void ML3SubscriptionContainerImportItem::getDescription(ML3SubscriptionContainerImportItem *this)
{
  _QWORD *v2;
  _QWORD *v3;
  std::string *v4;
  std::string::size_type size;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::string *v9;
  std::string::size_type v10;
  std::string v11;
  _QWORD v12[2];
  std::string __p;
  void *v14;
  char v15;
  uint64_t v16;
  std::string v17;
  uint64_t (**v18)();
  std::string v19;
  char v20;

  (*(void (**)(uint64_t (***__return_ptr)(), ML3SubscriptionContainerImportItem *, uint64_t))(*(_QWORD *)this + 24))(&v18, this, 184549384);
  (*(void (**)(ML3SubscriptionContainerImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 184549408);
  (*(void (**)(_QWORD *__return_ptr, ML3SubscriptionContainerImportItem *, uint64_t))(*(_QWORD *)this + 24))(v12, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v12[0] = off_1E5B4D010;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v17 = __p;
  }
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"<ML3SubscriptionContainerImportItem ", 36);
  *(_DWORD *)((char *)&v12[1] + *(_QWORD *)(v12[0] - 24)) = *(_DWORD *)((_BYTE *)&v12[1] + *(_QWORD *)(v12[0] - 24)) & 0xFFFFFFB5 | 8;
  v2 = (_QWORD *)std::ostream::operator<<();
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" global_id=", 11);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v17;
  else
    v4 = (std::string *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  else
    size = v17.__r_.__value_.__l.__size_;
  v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)v4, size);
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" cloud_id=", 10);
  *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 2;
  v8 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", name=", 7);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v11, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    v11 = v19;
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v11;
  else
    v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = HIBYTE(v11.__r_.__value_.__r.__words[2]);
  else
    v10 = v11.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v9, v10);
  v20 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)&v20, 1);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v15 < 0)
    operator delete(v14);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1AF43C6FC](&v16);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  v18 = off_1E5B4D010;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
}

void sub_1AC37F8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  uint64_t v22;

  std::ostringstream::~ostringstream((uint64_t)&a15);
  if (*(char *)(v22 - 105) < 0)
    operator delete(*(void **)(v22 - 128));
  *(_QWORD *)(v22 - 96) = off_1E5B4D010;
  if (*(char *)(v22 - 57) < 0)
    operator delete(*(void **)(v22 - 80));
  _Unwind_Resume(a1);
}

id ML3SubscriptionContainerImportItem::getDeduplicationPredicates(ML3SubscriptionContainerImportItem *this)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  std::string::size_type size;
  char v8;
  void *v9;
  void *v10;
  uint64_t (**v12)();
  std::string __p;
  std::string v14;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  ML3DAAPContainerImportItem::getDeduplicationPredicates(this);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (*(uint64_t (**)(ML3SubscriptionContainerImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 184549408);
  if (v5)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("store_cloud_id"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  (*(void (**)(uint64_t (***__return_ptr)(), ML3SubscriptionContainerImportItem *, uint64_t))(*(_QWORD *)this + 24))(&v12, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v14, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v12 = off_1E5B4D010;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v14 = __p;
  }
  size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  v8 = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v14.__r_.__value_.__l.__size_;
  if (size)
  {
    ML3CPPBridgeString((const UInt8 *)&v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("cloud_global_id"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    v8 = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  }
  if (v8 < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1AC37FAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  if (a17 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void ML3SubscriptionContainerImportItem::_createImportItemValue(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;

  *a4 = 0;
  a4[1] = 0;
  if (a2 == 218103812)
  {
    v6 = operator new();
    v7 = (_QWORD *)v6;
    v8 = *a3;
    v9 = (std::__shared_weak_count *)a3[1];
    v28 = *a3;
    v29 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    ML3DAAPTrackImportItem::ML3DAAPTrackImportItem(v6, v8, v9);
    *v7 = &off_1E5B4E4D8;
    *(_QWORD *)&v30 = v7;
    v12 = (_QWORD *)operator new();
    *v12 = &off_1E5B51A08;
    v12[1] = 0;
    v12[2] = 0;
    v12[3] = v7;
    *((_QWORD *)&v30 + 1) = v12;
    std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)a4, &v30);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v29;
    if (v29)
    {
      v17 = (unint64_t *)&v29->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
LABEL_25:
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    v19 = a3[1];
    v26 = *a3;
    v27 = (std::__shared_weak_count *)v19;
    if (v19)
    {
      v20 = (unint64_t *)(v19 + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    ML3DAAPContainerImportItem::_createImportItemValue(a1, a2, &v26, &v30);
    std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)a4, &v30);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v16 = v27;
    if (v27)
    {
      v25 = (unint64_t *)&v27->__shared_owners_;
      do
        v18 = __ldaxr(v25);
      while (__stlxr(v18 - 1, v25));
      goto LABEL_25;
    }
  }
}

void sub_1AC37FD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1AF43C744);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_25ML3SubscriptionImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ML3SubscriptionImportItem::~ML3SubscriptionImportItem(ML3SubscriptionImportItem *this)
{
  *(_QWORD *)this = &off_1E5B4D050;
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)this + 64);
  *(_QWORD *)this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);
}

{
  *(_QWORD *)this = &off_1E5B4D050;
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)this + 64);
  *(_QWORD *)this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);
  JUMPOUT(0x1AF43C744);
}

BOOL ML3SubscriptionImportItem::isValid(ML3SubscriptionImportItem *this)
{
  return ((*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 16777217) & 0x408) != 0;
}

void ML3SubscriptionImportItem::getStringValue(ML3DAAPImportItem *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::string *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 __dst;
  std::string __p;
  std::string __str;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  *(_QWORD *)a3 = off_1E5B4D010;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v5 = (std::string *)(a3 + 16);
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  if ((_DWORD)a2 != 167772183)
  {
    ML3DAAPImportItem::getStringValue(this, a2, (uint64_t)&__dst);
    *(_BYTE *)(a3 + 8) = BYTE8(__dst);
    std::string::operator=(v5, &__p);
    *(_QWORD *)&__dst = off_1E5B4D010;
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
    v9 = (void *)__p.__r_.__value_.__r.__words[0];
    goto LABEL_13;
  }
  memset(&__str, 0, sizeof(__str));
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v18, *((_QWORD *)this + 8), 0x61654361u);
  if (v18)
  {
    std::string::basic_string[abi:ne180100](&__dst, *(void **)(v18 + 48), *(_QWORD *)(v18 + 64));
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
    __str.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0];
  }
  else
  {
    ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v16, *((_QWORD *)this + 8), 0x61654354u);
    if (v16)
    {
      std::string::basic_string[abi:ne180100](&__dst, *(void **)(v16 + 48), *(_QWORD *)(v16 + 64));
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
      __str.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0];
    }
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v6 = v19;
  if (v19)
  {
    v7 = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  std::string::operator=(v5, &__str);
  *(_BYTE *)(a3 + 8) = 1;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    v9 = (void *)__str.__r_.__value_.__r.__words[0];
LABEL_13:
    operator delete(v9);
  }
}

void sub_1AC380078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25)
{
  uint64_t v25;
  void **v26;
  uint64_t v27;
  uint64_t v28;

  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100](v28 - 64);
  *(_QWORD *)v25 = v27;
  if (*(char *)(v25 + 39) < 0)
    operator delete(*v26);
  _Unwind_Resume(a1);
}

unint64_t ML3SubscriptionImportItem::getIntegerValue(ML3SubscriptionImportItem *this, uint64_t a2)
{
  if ((_DWORD)a2 == 100663345)
    return 1;
  if ((_DWORD)a2 == 234881030)
    return (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 234881032);
  return ML3DAAPTrackImportItem::getIntegerValue(this, a2);
}

uint64_t ML3SubscriptionImportItem::getDescription(ML3SubscriptionImportItem *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v8[11];
  char v9;
  uint64_t v10;
  char v11;

  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663305);
  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663297);
  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663337);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"<ML3SubscriptionImportItem ", 27);
  *(_DWORD *)((char *)&v8[1] + *(_QWORD *)(v8[0] - 24)) = *(_DWORD *)((_BYTE *)&v8[1] + *(_QWORD *)(v8[0] - 24)) & 0xFFFFFFB5 | 8;
  v2 = (_QWORD *)std::ostream::operator<<();
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" sagaId=", 8);
  *(_DWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 2;
  v4 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", storeId=", 10);
  v5 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)", subscriptionId=", 17);
  v6 = (_QWORD *)std::ostream::operator<<();
  v11 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)&v11, 1);
  std::stringbuf::str();
  v8[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v8 + *(_QWORD *)(v8[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v8[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v9 < 0)
    operator delete((void *)v8[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AF43C6FC](&v10);
}

void sub_1AC3802FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ML3SubscriptionImportItem::getSourceIdentifiers@<X0>(ML3SubscriptionImportItem *this@<X0>, BOOL *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  std::vector<long long>::vector(a3);
  *a2 = 0;
  v6 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663305);
  if (v6)
    *(_QWORD *)(*a3 + 16) = v6;
  v7 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663297);
  if (v7)
    *(_QWORD *)(*a3 + 40) = v7;
  result = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663337);
  if (result)
    *(_QWORD *)(*a3 + 48) = result;
  return result;
}

void sub_1AC3803B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id ML3SubscriptionImportItem::getDeduplicationPredicates(ML3SubscriptionImportItem *this)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v3 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663305);
  if (v3)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663297);
  if (v5)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_item_id"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v30[0] = v6;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v9);

      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.subscription_store_item_id"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v10;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_item_id"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v11;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v14);

    }
    else
    {
      objc_msgSend(v2, "addObject:", v6);

      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.subscription_store_item_id"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_item_id"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v13);
    }

  }
  v15 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(_QWORD *)this + 32))(this, 100663337);
  if (v15)
  {
    if (v3)
    {
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.subscription_store_item_id"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v19);

      if (!v5)
      {
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_item_id"), v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_saga_id"), 0, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v23);

LABEL_14:
      }
    }
    else
    {
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.subscription_store_item_id"), v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v24);

      if (!v5)
      {
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.store_item_id"), v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v20);
        goto LABEL_14;
      }
    }
  }
  return v2;
}

void sub_1AC380888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ML3SubscriptionImportItem::_createImportItemValue(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;

  *a4 = 0;
  a4[1] = 0;
  if (a2 == 218103812)
  {
    v6 = operator new();
    v7 = (_QWORD *)v6;
    v8 = *a3;
    v9 = (std::__shared_weak_count *)a3[1];
    v28 = *a3;
    v29 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    ML3DAAPTrackImportItem::ML3DAAPTrackImportItem(v6, v8, v9);
    *v7 = &off_1E5B4E4D8;
    *(_QWORD *)&v30 = v7;
    v12 = (_QWORD *)operator new();
    *v12 = &off_1E5B51A08;
    v12[1] = 0;
    v12[2] = 0;
    v12[3] = v7;
    *((_QWORD *)&v30 + 1) = v12;
    std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)a4, &v30);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v29;
    if (v29)
    {
      v17 = (unint64_t *)&v29->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
LABEL_25:
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    v19 = a3[1];
    v26 = *a3;
    v27 = (std::__shared_weak_count *)v19;
    if (v19)
    {
      v20 = (unint64_t *)(v19 + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    ML3DAAPImportItem::_createImportItemValue(a1, a2, &v26, &v30);
    std::shared_ptr<ML3ImportItem>::operator=[abi:ne180100]((uint64_t)a4, &v30);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v16 = v27;
    if (v27)
    {
      v25 = (unint64_t *)&v27->__shared_owners_;
      do
        v18 = __ldaxr(v25);
      while (__stlxr(v18 - 1, v25));
      goto LABEL_25;
    }
  }
}

void sub_1AC380B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

sqlite3 **DestroySQLExtensions(sqlite3 **pApp)
{
  sqlite3 **v1;
  sqlite3 *v2;

  if (pApp)
  {
    v1 = pApp;
    v2 = *pApp;
    if (v2)
    {
      sqlite3_create_function(v2, "FindRowForRunningSum_UInt64", 2, 2049, v1, 0, 0, 0);
      sqlite3_create_function(*v1, "CFTimeRelativeToStartOfToday", 1, 2049, v1, 0, 0, 0);
      sqlite3_create_function(*v1, "CFTimeRelativeToEndOfToday", 1, 2049, v1, 0, 0, 0);
    }
    *v1 = 0;
    JUMPOUT(0x1AF43C744);
  }
  return pApp;
}

const __CFString *SQLFunctionName_FindRowForRunningSum()
{
  return CFSTR("FindRowForRunningSum_UInt64");
}

const __CFString *SQLFunctionName_CFTimeRelativeToStartOfToday()
{
  return CFSTR("CFTimeRelativeToStartOfToday");
}

const __CFString *SQLFunctionName_CFTimeRelativeToEndOfToday()
{
  return CFSTR("CFTimeRelativeToEndOfToday");
}

unint64_t ML3SQLiteExtensions::Step_FindRowForRunningSum_UInt64(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  int v5;
  unint64_t result;
  uint64_t v7;
  sqlite3_int64 v8;
  int64x2_t v9;
  int64x2_t v10;

  v5 = (int)a2;
  result = (unint64_t)sqlite3_aggregate_context(this, 56);
  if (v5 >= 1)
  {
    v7 = result;
    if (result)
    {
      if (!*(_QWORD *)(result + 16))
        *(_QWORD *)(result + 8) = 0;
      v8 = sqlite3_value_int64(*a3);
      v9 = vdupq_n_s64(1uLL);
      v9.i64[0] = v8;
      v10 = vaddq_s64(*(int64x2_t *)(v7 + 8), v9);
      *(int64x2_t *)(v7 + 8) = v10;
      result = sqlite3_value_int64(a3[1]);
      if (v10.i64[0] <= result)
        *(_QWORD *)(v7 + 24) = *(_QWORD *)(v7 + 16);
    }
  }
  return result;
}

void ML3SQLiteExtensions::Final_FindRowForRunningSum_UInt64(ML3SQLiteExtensions *this, sqlite3_context *a2)
{
  _QWORD *v3;
  _QWORD *v4;

  v3 = sqlite3_aggregate_context(this, 56);
  if (v3)
  {
    v4 = v3;
    sqlite3_result_int64(this, v3[3]);
    v4[1] = 0;
    v4[2] = 0;
    v4[3] = 0;
  }
}

void ML3SQLiteExtensions::CFTimeRelativeToStartOfToday(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  CFAbsoluteTime *v6;
  CFAbsoluteTime *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;

  v6 = (CFAbsoluteTime *)sqlite3_user_data(this);
  if (v6)
  {
    v7 = v6;
    v8 = sqlite3_value_int64(*a3);
    v9 = ML3SQLiteExtensions::CFTimeRelativeToToday(v7, v8, 1);
    sqlite3_result_int64(this, v9);
  }
}

void ML3SQLiteExtensions::CFTimeRelativeToEndOfToday(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  CFAbsoluteTime *v6;
  CFAbsoluteTime *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;

  v6 = (CFAbsoluteTime *)sqlite3_user_data(this);
  if (v6)
  {
    v7 = v6;
    v8 = sqlite3_value_int64(*a3);
    v9 = ML3SQLiteExtensions::CFTimeRelativeToToday(v7, v8, 0);
    sqlite3_result_int64(this, v9);
  }
}

uint64_t ML3SQLiteExtensions::CFTimeRelativeToToday(CFAbsoluteTime *this, uint64_t a2, int a3)
{
  CFAbsoluteTime Current;
  __CFCalendar *v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;

  if (!*((_BYTE *)this + 48))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
    v11 = 0;
    v10 = 0;
    CFCalendarDecomposeAbsoluteTime(v7, Current, "yMd", (char *)&v11 + 4, &v11, &v10);
    CFCalendarComposeAbsoluteTime(v7, this + 4, "yMdHms", HIDWORD(v11), v11, v10, 0, 0, 0);
    CFCalendarComposeAbsoluteTime(v7, this + 5, "yMdHms", HIDWORD(v11), v11, v10, 23, 59, 59);
    CFRelease(v7);
    *((_BYTE *)this + 48) = 1;
  }
  v8 = 5;
  if (a3)
    v8 = 4;
  return (uint64_t)this[v8] + a2;
}

void ML3GenreDatabaseImportDataSource::~ML3GenreDatabaseImportDataSource(id *this)
{
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource(this);
  JUMPOUT(0x1AF43C744);
}

uint64_t ML3GenreDatabaseImportDataSource::getImportPropertyGroupKey(ML3GenreDatabaseImportDataSource *this)
{
  return 21;
}

uint64_t ML3GenreDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3GenreDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

void ML3VirtualTableBindingVisitor::~ML3VirtualTableBindingVisitor(ML3VirtualTableBindingVisitor *this)
{
  JUMPOUT(0x1AF43C744);
}

void ___ZN18ML3VirtualTableRowC2EP16ML3DatabaseTable_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64x2_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[3];
  int v26;
  char v27;
  char *v28;
  int64x2_t v29;
  char *v30;
  _QWORD *v31;
  char v32;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if ((objc_msgSend(v3, "columnConstraints") & 1) == 0)
  {
    v24 = objc_msgSend(v3, "datatype");
    v28 = 0;
    v25[0] = 0;
    v26 = 0;
    v27 = 1;
    v5 = v4[3];
    v6 = (uint64_t *)v4[2];
    if ((unint64_t)v6 >= v5)
    {
      v8 = v4[1];
      v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v6 - v8) >> 4);
      if (v9 + 1 > 0x555555555555555)
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - v8) >> 4);
      v11 = 2 * v10;
      if (2 * v10 <= v9 + 1)
        v11 = v9 + 1;
      if (v10 >= 0x2AAAAAAAAAAAAAALL)
        v12 = 0x555555555555555;
      else
        v12 = v11;
      v31 = v4 + 3;
      if (v12)
      {
        if (v12 > 0x555555555555555)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v13 = (char *)operator new(48 * v12);
      }
      else
      {
        v13 = 0;
      }
      v14 = (uint64_t *)&v13[48 * v9];
      v28 = v13;
      v29.i64[0] = (uint64_t)v14;
      v29.i64[1] = (uint64_t)v14;
      v30 = &v13[48 * v12];
      *v14 = v24;
      std::__optional_copy_base<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,false>::__optional_copy_base[abi:ne180100]((uint64_t)(v14 + 1), (uint64_t)v25);
      v15 = v29.i64[0];
      v7 = v29.i64[1] + 48;
      v29.i64[1] += 48;
      v17 = v4[1];
      v16 = v4[2];
      if (v16 == v17)
      {
        v21 = vdupq_n_s64(v16);
      }
      else
      {
        v23 = v3;
        v18 = 0;
        do
        {
          v19 = v15 + v18;
          *(_QWORD *)(v19 - 48) = *(_QWORD *)(v16 + v18 - 48);
          *(_BYTE *)(v15 + v18 - 40) = 0;
          *(_BYTE *)(v19 - 8) = 0;
          if (*(_BYTE *)(v16 + v18 - 8))
          {
            *(_BYTE *)(v15 + v18 - 40) = 0;
            *(_DWORD *)(v19 - 16) = -1;
            v20 = *(unsigned int *)(v16 + v18 - 16);
            if ((_DWORD)v20 != -1)
            {
              ((void (*)(char *))off_1E5B65550[v20])(&v32);
              *(_DWORD *)(v19 - 16) = v20;
            }
            *(_BYTE *)(v19 - 8) = 1;
          }
          v18 -= 48;
        }
        while (v16 + v18 != v17);
        v15 += v18;
        v21 = *(int64x2_t *)(v4 + 1);
        v7 = v29.i64[1];
        v3 = v23;
      }
      v4[1] = v15;
      v4[2] = v7;
      v29 = v21;
      v22 = (char *)v4[3];
      v4[3] = v30;
      v30 = v22;
      v28 = (char *)v21.i64[0];
      std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer((uint64_t)&v28);
    }
    else
    {
      *v6 = v24;
      std::__optional_copy_base<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,false>::__optional_copy_base[abi:ne180100]((uint64_t)(v6 + 1), (uint64_t)v25);
      v7 = (uint64_t)(v6 + 6);
      v4[2] = v6 + 6;
    }
    v4[2] = v7;
    if (v27)
      std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v25);
  }

}

void sub_1AC381728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, ...)
{
  void *v9;
  uint64_t v10;
  va_list va;

  va_start(va, a9);
  std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer((uint64_t)va);
  if (a9)
    std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor(v10);

  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 48;
    if (*(_BYTE *)(v2 - 8))
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 - 40);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 48;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a2 = *a3;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, _DWORD *a2, float *a3)
{
  float result;

  result = *a3;
  *a2 = *(_DWORD *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  *a2 = *a3;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  result = *a3;
  *a2 = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void sub_1AC383D1C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

void sub_1AC38463C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1AC384A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 224), 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19913(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19914(uint64_t a1)
{

}

void sub_1AC385A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19984(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19985(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__20081(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20082(uint64_t a1)
{

}

void ML3ItemSearchDatabaseImportDataSource::~ML3ItemSearchDatabaseImportDataSource(id *this)
{
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource(this);
  JUMPOUT(0x1AF43C744);
}

uint64_t ML3ItemSearchDatabaseImportDataSource::getImportPropertyGroupKey(ML3ItemSearchDatabaseImportDataSource *this)
{
  return 4;
}

uint64_t ML3ItemSearchDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3ItemSearchDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

void ML3ItemSearchDatabaseImportDataSource::prepareColumns(_QWORD *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  std::string __p;
  std::string v22;

  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 33554433);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v22 = __p;
  ML3CPPBridgeString((const UInt8 *)&v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v20[0] = off_1E5B4D010;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772161);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v22 = __p;
  ML3CPPBridgeString((const UInt8 *)&v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v20[0] = off_1E5B4D010;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772164);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v22 = __p;
  ML3CPPBridgeString((const UInt8 *)&v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v20[0] = off_1E5B4D010;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772165);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v22 = __p;
  ML3CPPBridgeString((const UInt8 *)&v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v20[0] = off_1E5B4D010;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)*a2 + 152))(v20, *a2, 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v22 = __p;
  ML3CPPBridgeString((const UInt8 *)&v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v20[0] = off_1E5B4D010;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = *(id *)(a1[3] + 24);
  objc_msgSend(v9, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a1[9] = objc_msgSend(v10, "ML3NameOrderValue");
  a1[10] = v11;

  objc_msgSend(v9, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  a1[11] = objc_msgSend(v12, "ML3NameOrderValue");
  a1[12] = v13;

  objc_msgSend(v9, "objectForKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  a1[13] = objc_msgSend(v14, "ML3NameOrderValue");
  a1[14] = v15;

  objc_msgSend(v9, "objectForKey:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  a1[15] = objc_msgSend(v16, "ML3NameOrderValue");
  a1[16] = v17;

  objc_msgSend(v9, "objectForKey:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  a1[17] = objc_msgSend(v18, "ML3NameOrderValue");
  a1[18] = v19;

}

void sub_1AC386454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (a17 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1AC3864F8()
{
  JUMPOUT(0x1AC3864B4);
}

void sub_1AC386500(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (SHIBYTE(a14) < 0)
    operator delete(a12);
  JUMPOUT(0x1AC3864B8);
}

void sub_1AC38652C()
{
  JUMPOUT(0x1AC3864B8);
}

void sub_1AC386534(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (SHIBYTE(a14) < 0)
    operator delete(a12);
  JUMPOUT(0x1AC3864BCLL);
}

void sub_1AC386560()
{
  JUMPOUT(0x1AC3864BCLL);
}

void sub_1AC386568(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (SHIBYTE(a14) < 0)
    operator delete(a12);
  JUMPOUT(0x1AC3864C0);
}

void sub_1AC386594()
{
  JUMPOUT(0x1AC3864C0);
}

void sub_1AC38659C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (SHIBYTE(a14) < 0)
    operator delete(a12);
  JUMPOUT(0x1AC3864C4);
}

uint64_t ML3ItemSearchDatabaseImportDataSource::integerValueForKey(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  switch((int)a3)
  {
    case 67108865:
      v3 = a1[9];
      break;
    case 67108866:
      v3 = a1[11];
      break;
    case 67108867:
      v3 = a1[13];
      break;
    case 67108868:
      v3 = a1[15];
      break;
    case 67108869:
      v3 = a1[17];
      break;
    default:
      v4 = *a2;
      v5 = (std::__shared_weak_count *)a2[1];
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
      }
      v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 32))(v4, a3);
      if (v5)
      {
        v8 = (unint64_t *)&v5->__shared_owners_;
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
      break;
  }
  return v3;
}

void sub_1AC3866AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ML3ItemSearchDatabaseImportDataSource::hasValueForKey(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v4 = *a2;
  if ((a3 - 67108865) > 4)
  {
    v9 = (std::__shared_weak_count *)a2[1];
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 56))(v4, a3) & 1) != 0)
    {
      v8 = 1;
      if (!v9)
        return v8;
    }
    else if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 200))(v4, a3))
    {
      v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4);
      if (!v9)
        return v8;
    }
    else
    {
      v8 = 0;
      if (!v9)
        return v8;
    }
    v14 = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(v14);
    while (__stlxr(v11 - 1, v14));
    goto LABEL_21;
  }
  v5 = (std::__shared_weak_count *)a2[1];
  v16 = *a2;
  v17 = v5;
  if (v5)
  {
    v6 = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 80))(a1, &v16, a3) != 0;
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
LABEL_21:
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v8;
}

void sub_1AC386814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1AC3874BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1AC387CC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1AC387EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AC3880CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AC388398(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AC388834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1AC3898E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC389B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MLDUpdateSpotlightIndexBundleForBundleIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.videos")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __Block_byref_object_copy__20235(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20236(uint64_t a1)
{

}

uint64_t _MLDUpdateSpotlightIndexVersionForBundle(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint8_t v5[16];
  uint64_t v6;
  uint64_t v7;

  if ((unint64_t)(a1 - 1) < 2)
    return 4;
  v6 = v1;
  v7 = v2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying get the current index version from an unknown bundle", v5, 2u);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __Block_byref_object_copy__20513(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20514(uint64_t a1)
{

}

void sub_1AC38D574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20827(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20828(uint64_t a1)
{

}

void sub_1AC3900E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ML3DatabaseCreateDiskIOError()
{
  void *v0;
  void *v1;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2D50];
  v4[0] = CFSTR("Unrecoverable SQLITE_IOERR detected");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 500, v0);

  return v1;
}

id ML3DatabaseCreateCorruptionError()
{
  void *v0;
  void *v1;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2D50];
  v4[0] = CFSTR("Database corruption has been detected.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 400, v0);

  return v1;
}

void sub_1AC393AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MIPArtistReadFrom(_DWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int *v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t result;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1E5B4A000uLL;
  v8 = &OBJC_IVAR___ML3MusicLibraryResourcesManager__implementation;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v17 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *((_BYTE *)a1 + v8[199]) |= 0x10u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_73;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            v21 = 0;
            goto LABEL_75;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_73:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_75:
        v58 = 10;
        goto LABEL_96;
      case 2u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 20;
        goto LABEL_41;
      case 3u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 22;
        goto LABEL_41;
      case 4u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 12;
        goto LABEL_41;
      case 5u:
        v30 = 0;
        v31 = 0;
        v21 = 0;
        *((_BYTE *)a1 + v8[199]) |= 2u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v21 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v16 = v31++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_79:
        v58 = 4;
        goto LABEL_96;
      case 6u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 14;
LABEL_41:
        v35 = *(void **)&a1[v29];
        *(_QWORD *)&a1[v29] = v28;

        goto LABEL_97;
      case 7u:
        v36 = 0;
        v37 = 0;
        v38 = 0;
        *((_BYTE *)a1 + v8[199]) |= 0x20u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v38 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              v16 = v37++ >= 9;
              if (v16)
              {
                LODWORD(v38) = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v38) = 0;
LABEL_83:
        a1[18] = v38;
        goto LABEL_97;
      case 8u:
        v42 = 0;
        v43 = 0;
        v21 = 0;
        *((_BYTE *)a1 + v8[199]) |= 1u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 1;
            v21 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              v16 = v43++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_87:
        v58 = 2;
        goto LABEL_96;
      case 9u:
        v47 = 0;
        v48 = 0;
        v21 = 0;
        *((_BYTE *)a1 + v8[199]) |= 4u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v21 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              v16 = v48++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_91:
        v58 = 6;
        goto LABEL_96;
      case 0xAu:
        v52 = 0;
        v53 = 0;
        v21 = 0;
        *((_BYTE *)a1 + v8[199]) |= 8u;
        while (2)
        {
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 == -1 || v55 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 1;
            v21 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v16 = v53++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_95:
        v58 = 8;
LABEL_96:
        *(_QWORD *)&a1[v58] = v21;
        goto LABEL_97;
      default:
        if ((v12 >> 3) != 50)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_97;
        }
        v25 = v8;
        v26 = v7;
        v27 = objc_alloc_init(*(Class *)(v7 + 2384));
        objc_msgSend(a1, "addLibraryIdentifiers:", v27);
        if (PBReaderPlaceMark() && (MIPLibraryIdentifierReadFrom((uint64_t)v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v26;
          v8 = v25;
LABEL_97:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
    }
  }
}

void sub_1AC395E8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AC395FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AC3960D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1AC396340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;

  (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  *(_QWORD *)(v23 - 56) = &a10;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 56));
  if (__p)
    operator delete(__p);
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1AF43C744);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI17ML3DAAPImportItemE27__shared_ptr_default_deleteIS1_34ML3SubscriptionContainerImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1AF43C744);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI17ML3DAAPImportItemE27__shared_ptr_default_deleteIS1_25ML3SubscriptionImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void sub_1AC3965B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t MLExceptionsEnabled()
{
  return __exceptionsEnabled;
}

uint64_t MLSetExceptionsEnabled(uint64_t result)
{
  __exceptionsEnabled = result;
  return result;
}

void sub_1AC3969D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC396CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC398B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC398CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22501(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22502(uint64_t a1)
{

}

uint64_t MIPMediaItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  MIPLibraryIdentifier *v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  unint64_t v125;
  char v126;
  char v127;
  unsigned int v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  char v137;
  unsigned int v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  char v153;
  unsigned int v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  char v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  unint64_t v167;
  char v168;
  char v169;
  unsigned int v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  char v174;
  char v175;
  unsigned int v176;
  uint64_t v177;
  unint64_t v178;
  char v179;
  char v180;
  unsigned int v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  char v185;
  char v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  char v191;
  char v192;
  unsigned int v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  char v197;
  char v198;
  unsigned int v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  char v203;
  char v204;
  unsigned int v205;
  uint64_t v206;
  unint64_t v207;
  char v208;
  char v209;
  unsigned int v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  char v214;
  char v215;
  unsigned int v216;
  uint64_t v217;
  unint64_t v218;
  char v219;
  char v220;
  unsigned int v221;
  uint64_t v222;
  unint64_t v223;
  char v224;
  char v225;
  unsigned int v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char v235;
  char v236;
  unsigned int v237;
  uint64_t v238;
  unint64_t v239;
  char v240;
  char v241;
  unsigned int v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  char v246;
  char v247;
  unsigned int v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  char v252;
  char v253;
  unsigned int v254;
  uint64_t v255;
  unint64_t v256;
  char v257;
  char v258;
  unsigned int v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  char v263;
  unsigned int v264;
  uint64_t v265;
  unint64_t v266;
  char v267;
  char v268;
  unsigned int v269;
  uint64_t v270;
  unint64_t v271;
  char v272;
  char v273;
  unsigned int v274;
  uint64_t v275;
  unint64_t v276;
  char v277;
  char v278;
  unsigned int v279;
  uint64_t v280;
  unint64_t v281;
  char v282;
  char v283;
  unsigned int v284;
  uint64_t v285;
  unint64_t v286;
  char v287;
  char v288;
  unsigned int v289;
  uint64_t v290;
  unint64_t v291;
  char v292;
  void *v293;
  char v294;
  unsigned int v295;
  uint64_t v296;
  unint64_t v297;
  char v298;
  char v299;
  unsigned int v300;
  uint64_t v301;
  unint64_t v302;
  char v303;
  uint64_t v304;
  uint64_t v305;
  BOOL v306;
  uint64_t v307;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v6) == 0;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v6))
      return *(_BYTE *)(a2 + *v6) == 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *v4;
      v13 = *(_QWORD *)(a2 + v12);
      if (v13 == -1 || v13 >= *(_QWORD *)(a2 + *v5))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v13);
      *(_QWORD *)(a2 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v9 += 7;
      v15 = v10++ >= 9;
      if (v15)
      {
        v11 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v6);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v6);
    if (*(_BYTE *)(a2 + *v6))
      v11 = 0;
LABEL_14:
    if (v16 || (v11 & 7) == 4)
      return *(_BYTE *)(a2 + *v6) == 0;
    v18 = v11 >> 3;
    switch((v11 >> 3))
    {
      case 1u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x80000000uLL;
        while (2)
        {
          v22 = *v4;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v15 = v20++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_433;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_433:
        v304 = 328;
        goto LABEL_627;
      case 2u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 464;
        goto LABEL_403;
      case 3u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 432;
        goto LABEL_403;
      case 4u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x10000uLL;
        while (2)
        {
          v33 = *v4;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v15 = v31++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_437;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_437:
        v305 = 136;
        goto LABEL_644;
      case 5u:
        v36 = 0;
        v37 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 8uLL;
        while (2)
        {
          v38 = *v4;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v32 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v15 = v37++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_441;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_441:
        v305 = 32;
        goto LABEL_644;
      case 6u:
        v41 = 0;
        v42 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x2000uLL;
        while (2)
        {
          v43 = *v4;
          v44 = *(_QWORD *)(a2 + v43);
          if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v44);
            *(_QWORD *)(a2 + v43) = v44 + 1;
            v32 |= (unint64_t)(v45 & 0x7F) << v41;
            if (v45 < 0)
            {
              v41 += 7;
              v15 = v42++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_445;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_445:
        v305 = 112;
        goto LABEL_644;
      case 7u:
        v46 = 0;
        v47 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x200uLL;
        while (2)
        {
          v48 = *v4;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 1;
            v32 |= (unint64_t)(v50 & 0x7F) << v46;
            if (v50 < 0)
            {
              v46 += 7;
              v15 = v47++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_449;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_449:
        v305 = 80;
        goto LABEL_644;
      case 8u:
        v51 = 0;
        v52 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x80uLL;
        while (2)
        {
          v53 = *v4;
          v54 = *(_QWORD *)(a2 + v53);
          if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v54);
            *(_QWORD *)(a2 + v53) = v54 + 1;
            v32 |= (unint64_t)(v55 & 0x7F) << v51;
            if (v55 < 0)
            {
              v51 += 7;
              v15 = v52++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_453;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_453:
        v305 = 64;
        goto LABEL_644;
      case 9u:
        v56 = 0;
        v57 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x4000000uLL;
        while (2)
        {
          v58 = *v4;
          v59 = *(_QWORD *)(a2 + v58);
          if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v59);
            *(_QWORD *)(a2 + v58) = v59 + 1;
            v21 |= (unint64_t)(v60 & 0x7F) << v56;
            if (v60 < 0)
            {
              v56 += 7;
              v15 = v57++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_457;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_457:
        v304 = 248;
        goto LABEL_627;
      case 0xAu:
        v61 = 0;
        v62 = 0;
        v63 = 0;
        *(_QWORD *)(a1 + 496) |= 0x40000000000uLL;
        while (2)
        {
          v64 = *v4;
          v65 = *(_QWORD *)(a2 + v64);
          if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v65);
            *(_QWORD *)(a2 + v64) = v65 + 1;
            v63 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              v15 = v62++ >= 9;
              if (v15)
              {
                v63 = 0;
                goto LABEL_461;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v63 = 0;
LABEL_461:
        v306 = v63 != 0;
        v307 = 485;
        goto LABEL_602;
      case 0xBu:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 408;
        goto LABEL_403;
      case 0xCu:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 320;
        goto LABEL_403;
      case 0xDu:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 256;
        goto LABEL_403;
      case 0xEu:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 192;
        goto LABEL_403;
      case 0xFu:
        v67 = 0;
        v68 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x10000000000uLL;
        while (2)
        {
          v69 = *v4;
          v70 = *(_QWORD *)(a2 + v69);
          if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v70);
            *(_QWORD *)(a2 + v69) = v70 + 1;
            v21 |= (unint64_t)(v71 & 0x7F) << v67;
            if (v71 < 0)
            {
              v67 += 7;
              v15 = v68++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_465;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_465:
        v304 = 480;
        goto LABEL_627;
      case 0x10u:
        v72 = 0;
        v73 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x8000000uLL;
        while (2)
        {
          v74 = *v4;
          v75 = *(_QWORD *)(a2 + v74);
          if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v75);
            *(_QWORD *)(a2 + v74) = v75 + 1;
            v21 |= (unint64_t)(v76 & 0x7F) << v72;
            if (v76 < 0)
            {
              v72 += 7;
              v15 = v73++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_469;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_469:
        v304 = 252;
        goto LABEL_627;
      case 0x11u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 240;
        goto LABEL_403;
      case 0x12u:
        v77 = 0;
        v78 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x20000000uLL;
        while (2)
        {
          v79 = *v4;
          v80 = *(_QWORD *)(a2 + v79);
          if (v80 == -1 || v80 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v80);
            *(_QWORD *)(a2 + v79) = v80 + 1;
            v21 |= (unint64_t)(v81 & 0x7F) << v77;
            if (v81 < 0)
            {
              v77 += 7;
              v15 = v78++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_473;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_473:
        v304 = 280;
        goto LABEL_627;
      case 0x13u:
        v82 = 0;
        v83 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x100uLL;
        while (2)
        {
          v84 = *v4;
          v85 = *(_QWORD *)(a2 + v84);
          if (v85 == -1 || v85 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v85);
            *(_QWORD *)(a2 + v84) = v85 + 1;
            v32 |= (unint64_t)(v86 & 0x7F) << v82;
            if (v86 < 0)
            {
              v82 += 7;
              v15 = v83++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_477;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_477:
        v305 = 72;
        goto LABEL_644;
      case 0x14u:
        v87 = 0;
        v88 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x10000000uLL;
        while (2)
        {
          v89 = *v4;
          v90 = *(_QWORD *)(a2 + v89);
          if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v90);
            *(_QWORD *)(a2 + v89) = v90 + 1;
            v21 |= (unint64_t)(v91 & 0x7F) << v87;
            if (v91 < 0)
            {
              v87 += 7;
              v15 = v88++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_481;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_481:
        v304 = 264;
        goto LABEL_627;
      case 0x15u:
        v92 = 0;
        v93 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x40uLL;
        while (2)
        {
          v94 = *v4;
          v95 = *(_QWORD *)(a2 + v94);
          if (v95 == -1 || v95 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v95);
            *(_QWORD *)(a2 + v94) = v95 + 1;
            v32 |= (unint64_t)(v96 & 0x7F) << v92;
            if (v96 < 0)
            {
              v92 += 7;
              v15 = v93++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_485;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_485:
        v305 = 56;
        goto LABEL_644;
      case 0x16u:
        v97 = 0;
        v98 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x10uLL;
        while (2)
        {
          v99 = *v4;
          v100 = *(_QWORD *)(a2 + v99);
          if (v100 == -1 || v100 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v101 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v100);
            *(_QWORD *)(a2 + v99) = v100 + 1;
            v32 |= (unint64_t)(v101 & 0x7F) << v97;
            if (v101 < 0)
            {
              v97 += 7;
              v15 = v98++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_489;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_489:
        v305 = 40;
        goto LABEL_644;
      case 0x17u:
        v102 = 0;
        v103 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x20uLL;
        while (2)
        {
          v104 = *v4;
          v105 = *(_QWORD *)(a2 + v104);
          if (v105 == -1 || v105 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v106 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v105);
            *(_QWORD *)(a2 + v104) = v105 + 1;
            v32 |= (unint64_t)(v106 & 0x7F) << v102;
            if (v106 < 0)
            {
              v102 += 7;
              v15 = v103++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_493;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_493:
        v305 = 48;
        goto LABEL_644;
      case 0x18u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 208;
        goto LABEL_403;
      case 0x19u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 440;
        goto LABEL_403;
      case 0x1Au:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 272;
        goto LABEL_403;
      case 0x1Bu:
        v107 = 0;
        v108 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x4000uLL;
        while (2)
        {
          v109 = *v4;
          v110 = *(_QWORD *)(a2 + v109);
          if (v110 == -1 || v110 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v110);
            *(_QWORD *)(a2 + v109) = v110 + 1;
            v32 |= (unint64_t)(v111 & 0x7F) << v107;
            if (v111 < 0)
            {
              v107 += 7;
              v15 = v108++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_497;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_497:
        v305 = 120;
        goto LABEL_644;
      case 0x1Cu:
        v112 = 0;
        v113 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x2000000uLL;
        while (2)
        {
          v114 = *v4;
          v115 = *(_QWORD *)(a2 + v114);
          if (v115 == -1 || v115 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v116 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v115);
            *(_QWORD *)(a2 + v114) = v115 + 1;
            v21 |= (unint64_t)(v116 & 0x7F) << v112;
            if (v116 < 0)
            {
              v112 += 7;
              v15 = v113++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_501;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_501:
        v304 = 224;
        goto LABEL_627;
      case 0x1Du:
        v117 = 0;
        v118 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x100000000uLL;
        while (2)
        {
          v119 = *v4;
          v120 = *(_QWORD *)(a2 + v119);
          if (v120 == -1 || v120 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v120);
            *(_QWORD *)(a2 + v119) = v120 + 1;
            v21 |= (unint64_t)(v121 & 0x7F) << v117;
            if (v121 < 0)
            {
              v117 += 7;
              v15 = v118++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_505;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_505:
        v304 = 344;
        goto LABEL_627;
      case 0x1Eu:
        v122 = 0;
        v123 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x200000000uLL;
        while (2)
        {
          v124 = *v4;
          v125 = *(_QWORD *)(a2 + v124);
          if (v125 == -1 || v125 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v126 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v125);
            *(_QWORD *)(a2 + v124) = v125 + 1;
            v21 |= (unint64_t)(v126 & 0x7F) << v122;
            if (v126 < 0)
            {
              v122 += 7;
              v15 = v123++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_509;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_509:
        v304 = 348;
        goto LABEL_627;
      case 0x1Fu:
        v127 = 0;
        v128 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x400uLL;
        while (2)
        {
          v129 = *v4;
          v130 = *(_QWORD *)(a2 + v129);
          if (v130 == -1 || v130 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v131 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v130);
            *(_QWORD *)(a2 + v129) = v130 + 1;
            v32 |= (unint64_t)(v131 & 0x7F) << v127;
            if (v131 < 0)
            {
              v127 += 7;
              v15 = v128++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_513;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_513:
        v305 = 88;
        goto LABEL_644;
      case 0x20u:
        v132 = 0;
        v133 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x2000000000uLL;
        while (2)
        {
          v134 = *v4;
          v135 = *(_QWORD *)(a2 + v134);
          if (v135 == -1 || v135 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v136 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v135);
            *(_QWORD *)(a2 + v134) = v135 + 1;
            v21 |= (unint64_t)(v136 & 0x7F) << v132;
            if (v136 < 0)
            {
              v132 += 7;
              v15 = v133++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_517;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_517:
        v304 = 416;
        goto LABEL_627;
      case 0x21u:
        v137 = 0;
        v138 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x4000000000uLL;
        while (2)
        {
          v139 = *v4;
          v140 = *(_QWORD *)(a2 + v139);
          if (v140 == -1 || v140 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v141 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v140);
            *(_QWORD *)(a2 + v139) = v140 + 1;
            v21 |= (unint64_t)(v141 & 0x7F) << v137;
            if (v141 < 0)
            {
              v137 += 7;
              v15 = v138++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_521;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_521:
        v304 = 420;
        goto LABEL_627;
      case 0x22u:
        v142 = 0;
        v143 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x800uLL;
        while (2)
        {
          v144 = *v4;
          v145 = *(_QWORD *)(a2 + v144);
          if (v145 == -1 || v145 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v146 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v145);
            *(_QWORD *)(a2 + v144) = v145 + 1;
            v32 |= (unint64_t)(v146 & 0x7F) << v142;
            if (v146 < 0)
            {
              v142 += 7;
              v15 = v143++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_525;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_525:
        v305 = 96;
        goto LABEL_644;
      case 0x23u:
        v147 = 0;
        v148 = 0;
        v149 = 0;
        *(_QWORD *)(a1 + 496) |= 0x8000000000000uLL;
        while (2)
        {
          v150 = *v4;
          v151 = *(_QWORD *)(a2 + v150);
          if (v151 == -1 || v151 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v152 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v151);
            *(_QWORD *)(a2 + v150) = v151 + 1;
            v149 |= (unint64_t)(v152 & 0x7F) << v147;
            if (v152 < 0)
            {
              v147 += 7;
              v15 = v148++ >= 9;
              if (v15)
              {
                v149 = 0;
                goto LABEL_529;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v149 = 0;
LABEL_529:
        v306 = v149 != 0;
        v307 = 494;
        goto LABEL_602;
      case 0x24u:
        v153 = 0;
        v154 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 4uLL;
        while (2)
        {
          v155 = *v4;
          v156 = *(_QWORD *)(a2 + v155);
          if (v156 == -1 || v156 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v157 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v156);
            *(_QWORD *)(a2 + v155) = v156 + 1;
            v32 |= (unint64_t)(v157 & 0x7F) << v153;
            if (v157 < 0)
            {
              v153 += 7;
              v15 = v154++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_533;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_533:
        v305 = 24;
        goto LABEL_644;
      case 0x25u:
        v158 = 0;
        v159 = 0;
        v160 = 0;
        *(_QWORD *)(a1 + 496) |= 0x200000000000uLL;
        while (2)
        {
          v161 = *v4;
          v162 = *(_QWORD *)(a2 + v161);
          if (v162 == -1 || v162 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v163 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v162);
            *(_QWORD *)(a2 + v161) = v162 + 1;
            v160 |= (unint64_t)(v163 & 0x7F) << v158;
            if (v163 < 0)
            {
              v158 += 7;
              v15 = v159++ >= 9;
              if (v15)
              {
                v160 = 0;
                goto LABEL_537;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v160 = 0;
LABEL_537:
        v306 = v160 != 0;
        v307 = 488;
        goto LABEL_602;
      case 0x26u:
        v164 = 0;
        v165 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x100000uLL;
        while (2)
        {
          v166 = *v4;
          v167 = *(_QWORD *)(a2 + v166);
          if (v167 == -1 || v167 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v168 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v167);
            *(_QWORD *)(a2 + v166) = v167 + 1;
            v32 |= (unint64_t)(v168 & 0x7F) << v164;
            if (v168 < 0)
            {
              v164 += 7;
              v15 = v165++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_541;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_541:
        v305 = 168;
        goto LABEL_644;
      case 0x27u:
        v169 = 0;
        v170 = 0;
        v171 = 0;
        *(_QWORD *)(a1 + 496) |= 0x100000000000uLL;
        while (2)
        {
          v172 = *v4;
          v173 = *(_QWORD *)(a2 + v172);
          if (v173 == -1 || v173 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v174 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v173);
            *(_QWORD *)(a2 + v172) = v173 + 1;
            v171 |= (unint64_t)(v174 & 0x7F) << v169;
            if (v174 < 0)
            {
              v169 += 7;
              v15 = v170++ >= 9;
              if (v15)
              {
                v171 = 0;
                goto LABEL_545;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v171 = 0;
LABEL_545:
        v306 = v171 != 0;
        v307 = 487;
        goto LABEL_602;
      case 0x28u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 296;
        goto LABEL_403;
      case 0x29u:
        v175 = 0;
        v176 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x40000000uLL;
        while (2)
        {
          v177 = *v4;
          v178 = *(_QWORD *)(a2 + v177);
          if (v178 == -1 || v178 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v179 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v178);
            *(_QWORD *)(a2 + v177) = v178 + 1;
            v21 |= (unint64_t)(v179 & 0x7F) << v175;
            if (v179 < 0)
            {
              v175 += 7;
              v15 = v176++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_549;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_549:
        v304 = 312;
        goto LABEL_627;
      case 0x2Au:
LABEL_34:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_645;
      case 0x2Bu:
        v180 = 0;
        v181 = 0;
        v182 = 0;
        *(_QWORD *)(a1 + 496) |= 0x4000000000000uLL;
        while (2)
        {
          v183 = *v4;
          v184 = *(_QWORD *)(a2 + v183);
          if (v184 == -1 || v184 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v185 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v184);
            *(_QWORD *)(a2 + v183) = v184 + 1;
            v182 |= (unint64_t)(v185 & 0x7F) << v180;
            if (v185 < 0)
            {
              v180 += 7;
              v15 = v181++ >= 9;
              if (v15)
              {
                v182 = 0;
                goto LABEL_553;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v182 = 0;
LABEL_553:
        v306 = v182 != 0;
        v307 = 493;
        goto LABEL_602;
      case 0x2Cu:
        v186 = 0;
        v187 = 0;
        v188 = 0;
        *(_QWORD *)(a1 + 496) |= 0x2000000000000uLL;
        while (2)
        {
          v189 = *v4;
          v190 = *(_QWORD *)(a2 + v189);
          if (v190 == -1 || v190 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v191 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v190);
            *(_QWORD *)(a2 + v189) = v190 + 1;
            v188 |= (unint64_t)(v191 & 0x7F) << v186;
            if (v191 < 0)
            {
              v186 += 7;
              v15 = v187++ >= 9;
              if (v15)
              {
                v188 = 0;
                goto LABEL_557;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v188 = 0;
LABEL_557:
        v306 = v188 != 0;
        v307 = 492;
        goto LABEL_602;
      case 0x2Du:
        v192 = 0;
        v193 = 0;
        v194 = 0;
        *(_QWORD *)(a1 + 496) |= 0x800000000000uLL;
        while (2)
        {
          v195 = *v4;
          v196 = *(_QWORD *)(a2 + v195);
          if (v196 == -1 || v196 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v197 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v196);
            *(_QWORD *)(a2 + v195) = v196 + 1;
            v194 |= (unint64_t)(v197 & 0x7F) << v192;
            if (v197 < 0)
            {
              v192 += 7;
              v15 = v193++ >= 9;
              if (v15)
              {
                v194 = 0;
                goto LABEL_561;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v194 = 0;
LABEL_561:
        v306 = v194 != 0;
        v307 = 490;
        goto LABEL_602;
      case 0x2Eu:
        v198 = 0;
        v199 = 0;
        v200 = 0;
        *(_QWORD *)(a1 + 496) |= 0x20000000000uLL;
        while (2)
        {
          v201 = *v4;
          v202 = *(_QWORD *)(a2 + v201);
          if (v202 == -1 || v202 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v203 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v202);
            *(_QWORD *)(a2 + v201) = v202 + 1;
            v200 |= (unint64_t)(v203 & 0x7F) << v198;
            if (v203 < 0)
            {
              v198 += 7;
              v15 = v199++ >= 9;
              if (v15)
              {
                v200 = 0;
                goto LABEL_565;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v200 = 0;
LABEL_565:
        v306 = v200 != 0;
        v307 = 484;
        goto LABEL_602;
      case 0x2Fu:
        v204 = 0;
        v205 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x8000000000uLL;
        while (2)
        {
          v206 = *v4;
          v207 = *(_QWORD *)(a2 + v206);
          if (v207 == -1 || v207 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v208 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v207);
            *(_QWORD *)(a2 + v206) = v207 + 1;
            v21 |= (unint64_t)(v208 & 0x7F) << v204;
            if (v208 < 0)
            {
              v204 += 7;
              v15 = v205++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_569;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_569:
        v304 = 448;
        goto LABEL_627;
      case 0x30u:
        v209 = 0;
        v210 = 0;
        v211 = 0;
        *(_QWORD *)(a1 + 496) |= 0x10000000000000uLL;
        while (2)
        {
          v212 = *v4;
          v213 = *(_QWORD *)(a2 + v212);
          if (v213 == -1 || v213 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v214 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v213);
            *(_QWORD *)(a2 + v212) = v213 + 1;
            v211 |= (unint64_t)(v214 & 0x7F) << v209;
            if (v214 < 0)
            {
              v209 += 7;
              v15 = v210++ >= 9;
              if (v15)
              {
                v211 = 0;
                goto LABEL_573;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v211 = 0;
LABEL_573:
        v306 = v211 != 0;
        v307 = 495;
        goto LABEL_602;
      case 0x31u:
        v215 = 0;
        v216 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x1000000uLL;
        while (2)
        {
          v217 = *v4;
          v218 = *(_QWORD *)(a2 + v217);
          if (v218 == -1 || v218 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v219 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v218);
            *(_QWORD *)(a2 + v217) = v218 + 1;
            v21 |= (unint64_t)(v219 & 0x7F) << v215;
            if (v219 < 0)
            {
              v215 += 7;
              v15 = v216++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_577;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_577:
        v304 = 220;
        goto LABEL_627;
      case 0x32u:
        v220 = 0;
        v221 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x400000000uLL;
        while (2)
        {
          v222 = *v4;
          v223 = *(_QWORD *)(a2 + v222);
          if (v223 == -1 || v223 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v224 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v223);
            *(_QWORD *)(a2 + v222) = v223 + 1;
            v21 |= (unint64_t)(v224 & 0x7F) << v220;
            if (v224 < 0)
            {
              v220 += 7;
              v15 = v221++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_581;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_581:
        v304 = 352;
        goto LABEL_627;
      case 0x33u:
        v225 = 0;
        v226 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x800000uLL;
        while (2)
        {
          v227 = *v4;
          v228 = *(_QWORD *)(a2 + v227);
          if (v228 == -1 || v228 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v229 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v228);
            *(_QWORD *)(a2 + v227) = v228 + 1;
            v21 |= (unint64_t)(v229 & 0x7F) << v225;
            if (v229 < 0)
            {
              v225 += 7;
              v15 = v226++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_585;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_585:
        v304 = 216;
        goto LABEL_627;
      case 0x34u:
        v230 = 0;
        v231 = 0;
        v232 = 0;
        *(_QWORD *)(a1 + 496) |= 0x400000000000uLL;
        while (2)
        {
          v233 = *v4;
          v234 = *(_QWORD *)(a2 + v233);
          if (v234 == -1 || v234 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v235 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v234);
            *(_QWORD *)(a2 + v233) = v234 + 1;
            v232 |= (unint64_t)(v235 & 0x7F) << v230;
            if (v235 < 0)
            {
              v230 += 7;
              v15 = v231++ >= 9;
              if (v15)
              {
                v232 = 0;
                goto LABEL_589;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v232 = 0;
LABEL_589:
        v306 = v232 != 0;
        v307 = 489;
        goto LABEL_602;
      case 0x35u:
        v236 = 0;
        v237 = 0;
        v21 = 0;
        *(_QWORD *)(a1 + 496) |= 0x1000000000uLL;
        while (2)
        {
          v238 = *v4;
          v239 = *(_QWORD *)(a2 + v238);
          if (v239 == -1 || v239 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v240 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v239);
            *(_QWORD *)(a2 + v238) = v239 + 1;
            v21 |= (unint64_t)(v240 & 0x7F) << v236;
            if (v240 < 0)
            {
              v236 += 7;
              v15 = v237++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_593;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v21) = 0;
LABEL_593:
        v304 = 400;
        goto LABEL_627;
      case 0x36u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 392;
        goto LABEL_403;
      case 0x37u:
        v241 = 0;
        v242 = 0;
        v243 = 0;
        *(_QWORD *)(a1 + 496) |= 0x80000000000uLL;
        while (2)
        {
          v244 = *v4;
          v245 = *(_QWORD *)(a2 + v244);
          if (v245 == -1 || v245 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v246 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v245);
            *(_QWORD *)(a2 + v244) = v245 + 1;
            v243 |= (unint64_t)(v246 & 0x7F) << v241;
            if (v246 < 0)
            {
              v241 += 7;
              v15 = v242++ >= 9;
              if (v15)
              {
                v243 = 0;
                goto LABEL_597;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v243 = 0;
LABEL_597:
        v306 = v243 != 0;
        v307 = 486;
        goto LABEL_602;
      case 0x38u:
        PBReaderReadData();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 288;
LABEL_403:
        v293 = *(void **)(a1 + v29);
        *(_QWORD *)(a1 + v29) = v28;

        goto LABEL_645;
      case 0x39u:
        v247 = 0;
        v248 = 0;
        v249 = 0;
        *(_QWORD *)(a1 + 496) |= 0x1000000000000uLL;
        while (2)
        {
          v250 = *v4;
          v251 = *(_QWORD *)(a2 + v250);
          if (v251 == -1 || v251 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v252 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v251);
            *(_QWORD *)(a2 + v250) = v251 + 1;
            v249 |= (unint64_t)(v252 & 0x7F) << v247;
            if (v252 < 0)
            {
              v247 += 7;
              v15 = v248++ >= 9;
              if (v15)
              {
                v249 = 0;
                goto LABEL_601;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v249 = 0;
LABEL_601:
        v306 = v249 != 0;
        v307 = 491;
LABEL_602:
        *(_BYTE *)(a1 + v307) = v306;
        goto LABEL_645;
      case 0x3Au:
        v253 = 0;
        v254 = 0;
        v32 = 0;
        *(_QWORD *)(a1 + 496) |= 0x1000uLL;
        while (2)
        {
          v255 = *v4;
          v256 = *(_QWORD *)(a2 + v255);
          if (v256 == -1 || v256 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v257 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v256);
            *(_QWORD *)(a2 + v255) = v256 + 1;
            v32 |= (unint64_t)(v257 & 0x7F) << v253;
            if (v257 < 0)
            {
              v253 += 7;
              v15 = v254++ >= 9;
              if (v15)
              {
                v32 = 0;
                goto LABEL_606;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_606:
        v305 = 104;
        goto LABEL_644;
      default:
        switch((int)v18)
        {
          case 200:
            v25 = v2;
            v26 = objc_alloc_init(MIPLibraryIdentifier);
            objc_msgSend((id)a1, "addLibraryIdentifiers:", v26);
            if (PBReaderPlaceMark() && (MIPLibraryIdentifierReadFrom((uint64_t)v26, a2) & 1) != 0)
            {
LABEL_429:
              PBReaderRecallMark();

              v2 = v25;
LABEL_645:
              if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
                return *(_BYTE *)(a2 + *v6) == 0;
              continue;
            }
LABEL_647:

            return 0;
          case 201:
            v258 = 0;
            v259 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x80000uLL;
            while (2)
            {
              v260 = *v4;
              v261 = *(_QWORD *)(a2 + v260);
              if (v261 == -1 || v261 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v262 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v261);
                *(_QWORD *)(a2 + v260) = v261 + 1;
                v32 |= (unint64_t)(v262 & 0x7F) << v258;
                if (v262 < 0)
                {
                  v258 += 7;
                  v15 = v259++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_610;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_610:
            v305 = 160;
            goto LABEL_644;
          case 202:
            v263 = 0;
            v264 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x200000uLL;
            while (2)
            {
              v265 = *v4;
              v266 = *(_QWORD *)(a2 + v265);
              if (v266 == -1 || v266 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v267 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v266);
                *(_QWORD *)(a2 + v265) = v266 + 1;
                v32 |= (unint64_t)(v267 & 0x7F) << v263;
                if (v267 < 0)
                {
                  v263 += 7;
                  v15 = v264++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_614;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_614:
            v305 = 176;
            goto LABEL_644;
          case 203:
            v268 = 0;
            v269 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 1uLL;
            while (2)
            {
              v270 = *v4;
              v271 = *(_QWORD *)(a2 + v270);
              if (v271 == -1 || v271 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v272 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v271);
                *(_QWORD *)(a2 + v270) = v271 + 1;
                v32 |= (unint64_t)(v272 & 0x7F) << v268;
                if (v272 < 0)
                {
                  v268 += 7;
                  v15 = v269++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_618;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_618:
            v305 = 8;
            goto LABEL_644;
          case 204:
            v273 = 0;
            v274 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x8000uLL;
            while (2)
            {
              v275 = *v4;
              v276 = *(_QWORD *)(a2 + v275);
              if (v276 == -1 || v276 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v277 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v276);
                *(_QWORD *)(a2 + v275) = v276 + 1;
                v32 |= (unint64_t)(v277 & 0x7F) << v273;
                if (v277 < 0)
                {
                  v273 += 7;
                  v15 = v274++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_622;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_622:
            v305 = 128;
            goto LABEL_644;
          case 205:
            v278 = 0;
            v279 = 0;
            v21 = 0;
            *(_QWORD *)(a1 + 496) |= 0x800000000uLL;
            while (2)
            {
              v280 = *v4;
              v281 = *(_QWORD *)(a2 + v280);
              if (v281 == -1 || v281 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v282 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v281);
                *(_QWORD *)(a2 + v280) = v281 + 1;
                v21 |= (unint64_t)(v282 & 0x7F) << v278;
                if (v282 < 0)
                {
                  v278 += 7;
                  v15 = v279++ >= 9;
                  if (v15)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_626;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              LODWORD(v21) = 0;
LABEL_626:
            v304 = 376;
LABEL_627:
            *(_DWORD *)(a1 + v304) = v21;
            goto LABEL_645;
          case 206:
            PBReaderReadString();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 368;
            goto LABEL_403;
          case 207:
            v283 = 0;
            v284 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x40000uLL;
            while (2)
            {
              v285 = *v4;
              v286 = *(_QWORD *)(a2 + v285);
              if (v286 == -1 || v286 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v287 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v286);
                *(_QWORD *)(a2 + v285) = v286 + 1;
                v32 |= (unint64_t)(v287 & 0x7F) << v283;
                if (v287 < 0)
                {
                  v283 += 7;
                  v15 = v284++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_631;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_631:
            v305 = 152;
            goto LABEL_644;
          case 208:
            PBReaderReadString();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 384;
            goto LABEL_403;
          case 209:
            PBReaderReadString();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 456;
            goto LABEL_403;
          case 210:
            v288 = 0;
            v289 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x400000uLL;
            while (2)
            {
              v290 = *v4;
              v291 = *(_QWORD *)(a2 + v290);
              if (v291 == -1 || v291 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v292 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v291);
                *(_QWORD *)(a2 + v290) = v291 + 1;
                v32 |= (unint64_t)(v292 & 0x7F) << v288;
                if (v292 < 0)
                {
                  v288 += 7;
                  v15 = v289++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_635;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_635:
            v305 = 184;
            goto LABEL_644;
          case 211:
            PBReaderReadString();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 232;
            goto LABEL_403;
          case 212:
            v294 = 0;
            v295 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 0x20000uLL;
            while (2)
            {
              v296 = *v4;
              v297 = *(_QWORD *)(a2 + v296);
              if (v297 == -1 || v297 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v298 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v297);
                *(_QWORD *)(a2 + v296) = v297 + 1;
                v32 |= (unint64_t)(v298 & 0x7F) << v294;
                if (v298 < 0)
                {
                  v294 += 7;
                  v15 = v295++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_639;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_639:
            v305 = 144;
            goto LABEL_644;
          case 213:
            v299 = 0;
            v300 = 0;
            v32 = 0;
            *(_QWORD *)(a1 + 496) |= 2uLL;
            while (2)
            {
              v301 = *v4;
              v302 = *(_QWORD *)(a2 + v301);
              if (v302 == -1 || v302 >= *(_QWORD *)(a2 + *v5))
              {
                *(_BYTE *)(a2 + *v6) = 1;
              }
              else
              {
                v303 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v302);
                *(_QWORD *)(a2 + v301) = v302 + 1;
                v32 |= (unint64_t)(v303 & 0x7F) << v299;
                if (v303 < 0)
                {
                  v299 += 7;
                  v15 = v300++ >= 9;
                  if (v15)
                  {
                    v32 = 0;
                    goto LABEL_643;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v6))
              v32 = 0;
LABEL_643:
            v305 = 16;
LABEL_644:
            *(_QWORD *)(a1 + v305) = v32;
            goto LABEL_645;
          default:
            switch((int)v18)
            {
              case 400:
                v25 = v2;
                v26 = objc_alloc_init(MIPSong);
                objc_storeStrong((id *)(a1 + 424), v26);
                if (!PBReaderPlaceMark() || (MIPSongReadFrom((uint64_t)v26, a2) & 1) == 0)
                  goto LABEL_647;
                goto LABEL_429;
              case 401:
                v25 = v2;
                v26 = objc_alloc_init(MIPMovie);
                objc_storeStrong((id *)(a1 + 336), v26);
                if (!PBReaderPlaceMark() || (MIPMovieReadFrom((uint64_t)v26, a2) & 1) == 0)
                  goto LABEL_647;
                goto LABEL_429;
              case 402:
                v25 = v2;
                v26 = objc_alloc_init(MIPTVShow);
                objc_storeStrong((id *)(a1 + 472), v26);
                if (!PBReaderPlaceMark() || (MIPTVShowReadFrom((uint64_t)v26, a2) & 1) == 0)
                  goto LABEL_647;
                goto LABEL_429;
              case 403:
                v25 = v2;
                v26 = objc_alloc_init(MIPPodcast);
                objc_storeStrong((id *)(a1 + 360), v26);
                if (!PBReaderPlaceMark() || !MIPPodcastReadFrom((uint64_t)v26, a2))
                  goto LABEL_647;
                goto LABEL_429;
              case 404:
                v25 = v2;
                v26 = objc_alloc_init(MIPAudiobook);
                objc_storeStrong((id *)(a1 + 200), v26);
                if (PBReaderPlaceMark() && (MIPAudiobookReadFrom((uint64_t)v26, a2) & 1) != 0)
                  goto LABEL_429;
                goto LABEL_647;
              default:
                goto LABEL_34;
            }
        }
    }
  }
}

void ML3StoreContainerImportItem::~ML3StoreContainerImportItem(id *this)
{

  *this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)(this + 3));
}

{

  *this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)(this + 3));
  JUMPOUT(0x1AF43C744);
}

uint64_t ML3StoreContainerImportItem::getIntegerValue(ML3StoreContainerImportItem *this, uint64_t a2)
{
  if ((_DWORD)a2 == 184549413)
    return 2;
  if ((_DWORD)a2 == 184549395)
    return *((_BYTE *)this + 18) == 0;
  return ML3StoreImportItem::getIntegerValue(this, a2);
}

BOOL ML3StoreContainerImportItem::hasValue(id *this, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  if ((_DWORD)a2 != 218103812)
    return ML3StoreImportItem::hasValue((ML3StoreImportItem *)this, a2);
  objc_msgSend(this[8], "objectForKeyedSubscript:", CFSTR("childrenIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

void sub_1AC3A3344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ML3StoreContainerImportItem::getImportItemArrayValue(id *this@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  void *v28;
  id obj;
  id obja;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  int64x2_t v37;
  char *v38;
  _QWORD *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if ((a2 - 218103813) >= 2)
  {
    if ((_DWORD)a2 == 218103812)
    {
      objc_msgSend(this[8], "objectForKeyedSubscript:", CFSTR("childrenIds"));
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v33 != v6)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v9 = operator new();
            v10 = objc_msgSend(v8, "longLongValue");
            *(_WORD *)(v9 + 16) = 256;
            *(_BYTE *)(v9 + 18) = 1;
            *(_OWORD *)(v9 + 24) = 0u;
            *(_OWORD *)(v9 + 40) = 0u;
            *(_DWORD *)(v9 + 56) = 1065353216;
            *(_QWORD *)v9 = &off_1E5B50978;
            *(_QWORD *)(v9 + 8) = 0;
            *(_QWORD *)(v9 + 64) = v10;
            *(_QWORD *)&v31 = v9;
            v11 = (_QWORD *)operator new();
            *v11 = &off_1E5B52258;
            v11[1] = 0;
            v11[2] = 0;
            v11[3] = v9;
            *((_QWORD *)&v31 + 1) = v11;
            v13 = a3[1];
            v12 = (unint64_t)a3[2];
            if ((unint64_t)v13 >= v12)
            {
              v15 = (v13 - *a3) >> 4;
              if ((unint64_t)(v15 + 1) >> 60)
                std::vector<long long>::__throw_length_error[abi:ne180100]();
              v16 = v12 - (_QWORD)*a3;
              v17 = v16 >> 3;
              if (v16 >> 3 <= (unint64_t)(v15 + 1))
                v17 = v15 + 1;
              if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
                v18 = 0xFFFFFFFFFFFFFFFLL;
              else
                v18 = v17;
              v39 = a3 + 2;
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v18);
              v21 = &v19[16 * v15];
              *(_OWORD *)v21 = v31;
              v23 = *a3;
              v22 = a3[1];
              if (v22 == *a3)
              {
                v26 = vdupq_n_s64((unint64_t)v22);
                v24 = &v19[16 * v15];
              }
              else
              {
                v24 = &v19[16 * v15];
                do
                {
                  v25 = *((_OWORD *)v22 - 1);
                  v22 -= 16;
                  *((_OWORD *)v24 - 1) = v25;
                  v24 -= 16;
                  *(_QWORD *)v22 = 0;
                  *((_QWORD *)v22 + 1) = 0;
                }
                while (v22 != v23);
                v26 = *(int64x2_t *)a3;
              }
              v14 = v21 + 16;
              *a3 = v24;
              a3[1] = v21 + 16;
              v37 = v26;
              v27 = a3[2];
              a3[2] = &v19[16 * v20];
              v38 = v27;
              v36 = v26.i64[0];
              std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)&v36);
            }
            else
            {
              *(_OWORD *)v13 = v31;
              v14 = v13 + 16;
            }
            a3[1] = v14;
          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v5);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual std::vector<std::shared_ptr<ML3ImportItem>> ML3StoreContainerImportItem::getImportItemArrayValue(MLImportPropertyKey) const");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("ML3StoreContainerImportItem.mm"), 111, CFSTR("getImportItemArrayValue called with unknown property key %x"), a2);

    }
  }
}

void sub_1AC3A368C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, uint64_t a13)
{
  void *v13;

  std::vector<std::shared_ptr<ML3CPP::Element>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void ML3StoreContainerImportItem::getDescription(ML3StoreContainerImportItem *this)
{
  _QWORD *v2;
  _QWORD *v3;
  std::string *v4;
  std::string::size_type size;
  _QWORD *v6;
  _QWORD *v7;
  std::string *v8;
  std::string::size_type v9;
  _QWORD *v10;
  _QWORD v11[2];
  std::string __p;
  void *v13;
  char v14;
  uint64_t v15;
  std::string v16;
  std::string v17;

  (*(void (**)(_QWORD *__return_ptr, ML3StoreContainerImportItem *, uint64_t))(*(_QWORD *)this + 24))(v11, this, 184549384);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v11[0] = off_1E5B4D010;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v17 = __p;
  }
  (*(void (**)(_QWORD *__return_ptr, ML3StoreContainerImportItem *, uint64_t))(*(_QWORD *)this + 24))(v11, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v11[0] = off_1E5B4D010;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v16 = __p;
  }
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"<ML3StoreContainerImportItem ", 29);
  *(_DWORD *)((char *)&v11[1] + *(_QWORD *)(v11[0] - 24)) = *(_DWORD *)((_BYTE *)&v11[1] + *(_QWORD *)(v11[0] - 24)) & 0xFFFFFFB5 | 8;
  v2 = (_QWORD *)std::ostream::operator<<();
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" name=\"", 7);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v17;
  else
    v4 = (std::string *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  else
    size = v17.__r_.__value_.__l.__size_;
  v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)v4, size);
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\", globalID=\"", 13);
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v16;
  else
    v8 = (std::string *)v16.__r_.__value_.__r.__words[0];
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
  else
    v9 = v16.__r_.__value_.__l.__size_;
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\">", 2);
  std::stringbuf::str();
  v11[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v11 + *(_QWORD *)(v11[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v11[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete(v13);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1AF43C6FC](&v15);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
}

void sub_1AC3A398C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (a17 < 0)
    operator delete(__p);
  if (*(char *)(v17 - 57) < 0)
    operator delete(*(void **)(v17 - 80));
  _Unwind_Resume(exception_object);
}

id ML3StoreContainerImportItem::getDeduplicationPredicates(id *this)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(this[8], "objectForKey:", &unk_1E5BAC4F8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  if (v4)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  objc_msgSend(this[8], "objectForKey:", &unk_1E5BAC510);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("cloud_global_id"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  return v2;
}

void sub_1AC3A3AEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t ML3StoreContainerImportItem::getDeduplicationOrderingTerms(ML3StoreContainerImportItem *this)
{
  return 0;
}

void std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1AF43C744);
}

uint64_t std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_36ML3StoreContainerTrackItemImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ML3StoreContainerTrackItemImportItem::~ML3StoreContainerTrackItemImportItem(ML3StoreContainerTrackItemImportItem *this)
{
  *(_QWORD *)this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);
}

{
  *(_QWORD *)this = &off_1E5B4CF28;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);
  JUMPOUT(0x1AF43C744);
}

void ML3StoreContainerTrackItemImportItem::getStringValue(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v5;
  id v6;

  *(_QWORD *)a2 = off_1E5B4D010;
  *(_BYTE *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if ((a1 - 234881028) > 6 || ((1 << (a1 - 4)) & 0x43) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual ML3ImportStringValue ML3StoreContainerTrackItemImportItem::getStringValue(MLImportPropertyKey) const");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ML3StoreContainerImportItem.mm"), 143, CFSTR("ML3StoreContainerTrackItemImportItem::getStringValue called with unknown property key %x"), a1);

  }
}

void sub_1AC3A3D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _QWORD *v10;
  void *v11;
  uint64_t v12;

  *v10 = v12;
  _Unwind_Resume(a1);
}

uint64_t ML3StoreContainerTrackItemImportItem::getIntegerValue(ML3StoreContainerTrackItemImportItem *this, uint64_t a2)
{
  void *v4;
  void *v5;

  if ((_DWORD)a2 == 234881030)
    return *((_QWORD *)this + 8);
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual int64_t ML3StoreContainerTrackItemImportItem::getIntegerValue(MLImportPropertyKey) const");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ML3StoreContainerImportItem.mm"), 158, CFSTR("ML3StoreContainerTrackItemImportItem::getIntegerValue called with unknown property key %x"), a2);

  return 0;
}

void sub_1AC3A3DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL ML3StoreContainerTrackItemImportItem::hasValue(ML3StoreContainerTrackItemImportItem *this, int a2)
{
  return a2 == 234881030;
}

uint64_t ML3StoreContainerTrackItemImportItem::getDescription(ML3StoreContainerTrackItemImportItem *this)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[11];
  char v6;
  uint64_t v7;
  char v8;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"<ML3StoreContainerTrackItemImportItem ", 38);
  *(_DWORD *)((char *)&v5[1] + *(_QWORD *)(v5[0] - 24)) = *(_DWORD *)((_BYTE *)&v5[1] + *(_QWORD *)(v5[0] - 24)) & 0xFFFFFFB5 | 8;
  v1 = (_QWORD *)std::ostream::operator<<();
  v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)" sync_id=", 9);
  *(_DWORD *)((char *)v2 + *(_QWORD *)(*v2 - 24) + 8) = *(_DWORD *)((_BYTE *)v2 + *(_QWORD *)(*v2 - 24) + 8) & 0xFFFFFFB5 | 2;
  v3 = (_QWORD *)std::ostream::operator<<();
  v8 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v8, 1);
  std::stringbuf::str();
  v5[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v5 + *(_QWORD *)(v5[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v5[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v6 < 0)
    operator delete((void *)v5[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AF43C6FC](&v7);
}

void sub_1AC3A3F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23265(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23266(uint64_t a1)
{

}

BOOL ML3ArtworkDeviceSupportsASTC()
{
  return +[ML3MusicLibrary deviceSupportsASTC](ML3MusicLibrary, "deviceSupportsASTC");
}

int64_t ML3ArtworkDevicePreferredImageFormat()
{
  return +[ML3MusicLibrary devicePreferredImageFormat](ML3MusicLibrary, "devicePreferredImageFormat");
}

id ML3ArtworkOriginalArtworkDirectory()
{
  void *v0;
  void *v1;

  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "artworkDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ML3ArtworkRootArtworkCacheDirectory()
{
  void *v0;
  void *v1;

  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rootArtworkCacheDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ML3ArtworkDirectory()
{
  void *v0;
  void *v1;

  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "artworkDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ML3ArtworkArtworkCacheDirectoryForSize(double a1, double a2)
{
  void *v4;
  void *v5;

  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkCacheDirectoryForSize:", a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ML3ArtworkArtworkCacheDirectoryForEffect(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkCacheDirectoryForEffect:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ML3ArtworkRelativePathFromToken(uint64_t a1)
{
  return +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", a1);
}

id ML3ArtworkTokenForArtistHeroArtwork(uint64_t a1)
{
  return +[ML3MusicLibrary artworkTokenForArtistHeroURL:](ML3MusicLibrary, "artworkTokenForArtistHeroURL:", a1);
}

id ML3ArtworkTokenForChapterArtwork(uint64_t a1)
{
  return +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", a1);
}

int64_t ML3ArtworkSourceTypeForTrackSource(uint64_t a1)
{
  return +[ML3MusicLibrary artworkSourceTypeForTrackSource:](ML3MusicLibrary, "artworkSourceTypeForTrackSource:", a1);
}

uint64_t ML3ArtworkHasOriginalArtwork(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOriginalArtworkForRelativePath:", v1);

  return v3;
}

uint64_t ML3ArtworkIsArtworkFetchable(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "isArtworkFetchableForPersistentID:entityType:artworkType:artworkSourceType:", a2, a3, a4, a5);
}

uint64_t AppendNestedSearchCriteriaList()
{
  return MEMORY[0x1E0D4A078]();
}

uint64_t AppendNumericSearchCriterion()
{
  return MEMORY[0x1E0D4A080]();
}

uint64_t AppendSearchCriterion()
{
  return MEMORY[0x1E0D4A088]();
}

uint64_t AppendUStringSearchCriterion()
{
  return MEMORY[0x1E0D4A090]();
}

uint64_t AppendValueRangeSearchCriterion()
{
  return MEMORY[0x1E0D4A098]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98228](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C990D8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x1E0C991F8](theString, replacement);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1E0C99218](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  CFTimeInterval result;

  MEMORY[0x1E0C992A0](tz, at);
  return result;
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t ChapterData_CopyProperty()
{
  return MEMORY[0x1E0D4A0A0]();
}

uint64_t ChapterData_Create()
{
  return MEMORY[0x1E0D4A0A8]();
}

uint64_t ChapterData_CreateWithFlattenedData()
{
  return MEMORY[0x1E0D4A0B0]();
}

uint64_t ChapterData_ExportFlattenedData()
{
  return MEMORY[0x1E0D4A0B8]();
}

uint64_t ChapterData_FindURLForTime()
{
  return MEMORY[0x1E0D4A0C0]();
}

uint64_t ChapterData_FindURLTitleForTime()
{
  return MEMORY[0x1E0D4A0C8]();
}

uint64_t ChapterData_GetFlags()
{
  return MEMORY[0x1E0D4A0D0]();
}

uint64_t ChapterData_GetIndChapterTime()
{
  return MEMORY[0x1E0D4A0D8]();
}

uint64_t ChapterData_GetNameCookieForTime()
{
  return MEMORY[0x1E0D4A0E0]();
}

uint64_t ChapterData_GetNumChapters()
{
  return MEMORY[0x1E0D4A0E8]();
}

uint64_t ChapterData_GetPictureCookieForTime()
{
  return MEMORY[0x1E0D4A0F0]();
}

uint64_t ChapterData_GetURLCookieForTime()
{
  return MEMORY[0x1E0D4A0F8]();
}

uint64_t ChapterData_NewChapter()
{
  return MEMORY[0x1E0D4A100]();
}

uint64_t ChapterData_Release()
{
  return MEMORY[0x1E0D4A108]();
}

uint64_t ChapterData_Retain()
{
  return MEMORY[0x1E0D4A110]();
}

uint64_t ChapterData_SetProperty()
{
  return MEMORY[0x1E0D4A118]();
}

uint64_t CountSearchCriteria()
{
  return MEMORY[0x1E0D4A120]();
}

uint64_t DisposeSearchCriteriaList()
{
  return MEMORY[0x1E0D4A128]();
}

uint64_t GetSearchCriteriaListOptions()
{
  return MEMORY[0x1E0D4A130]();
}

uint64_t GetSearchCriterionInfo()
{
  return MEMORY[0x1E0D4A138]();
}

uint64_t GetSearchCriterionInfoBooleanValue()
{
  return MEMORY[0x1E0D4A140]();
}

uint64_t GetSearchCriterionInfoNumericValue()
{
  return MEMORY[0x1E0D4A148]();
}

uint64_t GetSearchCriterionInfoValueRange()
{
  return MEMORY[0x1E0D4A150]();
}

uint64_t GetValueRangeCriteriaEndValue()
{
  return MEMORY[0x1E0D4A158]();
}

uint64_t GetValueRangeCriteriaStartValue()
{
  return MEMORY[0x1E0D4A160]();
}

uint64_t ITImportSearchCriteriaList()
{
  return MEMORY[0x1E0D4A168]();
}

uint64_t InitValueRangeCriteria()
{
  return MEMORY[0x1E0D4A170]();
}

uint64_t LockSearchCriteriaList()
{
  return MEMORY[0x1E0D4A178]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x1E0D4CE58]();
}

uint64_t MSVCreateTemporaryFileHandle()
{
  return MEMORY[0x1E0D4CE68]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1E0D4CE70]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x1E0D4CE80]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x1E0D4CE88]();
}

uint64_t MSVDeviceIsiPad()
{
  return MEMORY[0x1E0D4CE90]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1E0D4CE98]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x1E0D4CEA0]();
}

uint64_t MSVDeviceSupportsMultipleLibraries()
{
  return MEMORY[0x1E0D4CEB0]();
}

uint64_t MSVDeviceSupportsSideLoadedMediaContent()
{
  return MEMORY[0x1E0D4CEB8]();
}

uint64_t MSVEnableDirStatsForDirectory()
{
  return MEMORY[0x1E0D4CEC0]();
}

uint64_t MSVGetDiskUsageForPath()
{
  return MEMORY[0x1E0D4CEC8]();
}

uint64_t MSVGetKernelBootTime()
{
  return MEMORY[0x1E0D4CED0]();
}

uint64_t MSVGetMaximumScreenScale()
{
  return MEMORY[0x1E0D4CED8]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x1E0D4CEE0]();
}

uint64_t MSVHomeSharingCacheDirectory()
{
  return MEMORY[0x1E0D4CF08]();
}

uint64_t MSVImageUtilitiesAddImageToDestination()
{
  return MEMORY[0x1E0D4CF10]();
}

uint64_t MSVImageUtilitiesAddJPEGToDestination()
{
  return MEMORY[0x1E0D4CF18]();
}

uint64_t MSVImageUtilitiesCreateDataImageDestination()
{
  return MEMORY[0x1E0D4CF28]();
}

uint64_t MSVImageUtilitiesMakeBoundingBoxSize()
{
  return MEMORY[0x1E0D4CF40]();
}

uint64_t MSVMediaLoggingDirectory()
{
  return MEMORY[0x1E0D4CF58]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1E0D4CF60]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1E0D4CF80]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1E0D4CFC8]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1E0D4CFD8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t NewSearchCriteriaList()
{
  return MEMORY[0x1E0D4A180]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1E0D82C18]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1E0D82D08]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1E0DB1020]();
}

uint64_t UnlockSearchCriteriaList()
{
  return MEMORY[0x1E0D4A188]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4278](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4280](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x1E0DE44E8](this, __s, __n);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  MEMORY[0x1E0DE4508](this, __n, *(_QWORD *)&__c);
}

void std::wstring::__grow_by(std::wstring *this, std::wstring::size_type __old_cap, std::wstring::size_type __delta_cap, std::wstring::size_type __old_sz, std::wstring::size_type __n_copy, std::wstring::size_type __n_del, std::wstring::size_type __n_add)
{
  MEMORY[0x1E0DE4518](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::wstring::push_back(std::wstring *this, std::wstring::value_type __c)
{
  MEMORY[0x1E0DE4520](this, *(_QWORD *)&__c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x1E0DE45C8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1E0DE45E8]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4710]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4730]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

std::codecvt<wchar_t, char, mbstate_t> *__cdecl std::codecvt<wchar_t,char,__mbstate_t>::codecvt(std::codecvt<wchar_t, char, mbstate_t> *this, size_t __refs)
{
  return (std::codecvt<wchar_t, char, mbstate_t> *)MEMORY[0x1E0DE4BF8](this, __refs);
}

void std::codecvt<wchar_t,char,__mbstate_t>::~codecvt(std::codecvt<wchar_t, char, mbstate_t> *this)
{
  MEMORY[0x1E0DE4C00](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E5B4B410(__p);
}

uint64_t operator delete()
{
  return off_1E5B4B418();
}

uint64_t operator new[]()
{
  return off_1E5B4B420();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E5B4B428(__sz);
}

uint64_t operator new()
{
  return off_1E5B4B430();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x1E0C81658](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

uint64_t dirstat_np()
{
  return MEMORY[0x1E0C82BB8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1E0C83450](a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1E0DE8550](a1, *(_QWORD *)&nBytes);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85E0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_blob_bytes(sqlite3_blob *a1)
{
  return MEMORY[0x1E0DE8608](a1);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return MEMORY[0x1E0DE8610](a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return MEMORY[0x1E0DE8618](a1, zDb, zTable, zColumn, iRow, *(_QWORD *)&flags, ppBlob);
}

int sqlite3_blob_read(sqlite3_blob *a1, void *Z, int N, int iOffset)
{
  return MEMORY[0x1E0DE8620](a1, Z, *(_QWORD *)&N, *(_QWORD *)&iOffset);
}

int sqlite3_blob_write(sqlite3_blob *a1, const void *z, int n, int iOffset)
{
  return MEMORY[0x1E0DE8628](a1, z, *(_QWORD *)&n, *(_QWORD *)&iOffset);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1E0DE8708](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1E0DE8718](db, zName, p, pClientData);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1E0DE8738](a1, *(_QWORD *)&op);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1E0DE8770](a1, zSQL);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void *__cdecl sqlite3_get_auxdata(sqlite3_context *a1, int N)
{
  return (void *)MEMORY[0x1E0DE87E8](a1, *(_QWORD *)&N);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1E0DE8860](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8888](db, zSql, *(_QWORD *)&nByte, *(_QWORD *)&prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88B8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x1E0DE88C8](a1, a2);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
  MEMORY[0x1E0DE88E0](a1);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x1E0DE88F8](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x1E0DE8900](a1);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8910](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
  MEMORY[0x1E0DE8920](a1, a2);
}

int sqlite3_set_authorizer(sqlite3 *a1, int (__cdecl *xAuth)(void *, int, const char *, const char *, const char *, const char *), void *pUserData)
{
  return MEMORY[0x1E0DE8940](a1, xAuth, pUserData);
}

void sqlite3_set_auxdata(sqlite3_context *a1, int N, void *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8948](a1, *(_QWORD *)&N, a3, a4);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89B0](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE89B8](pStmt);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1E0DE8A10](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A20](a1);
}

int sqlite3_value_bytes16(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A28](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x1E0DE8A30](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A48](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

const void *__cdecl sqlite3_value_text16(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A68](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A70](a1);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

uint64_t ucol_close()
{
  return MEMORY[0x1E0DE5F70]();
}

uint64_t ucol_getBound()
{
  return MEMORY[0x1E0DE5F98]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x1E0DE5FD0]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x1E0DE5FE8]();
}

uint64_t ucol_nextSortKeyPart()
{
  return MEMORY[0x1E0DE6000]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1E0DE6008]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1E0DE6030]();
}

void uiter_setString(UCharIterator *iter, const UChar *s, int32_t length)
{
  MEMORY[0x1E0DE62F0](iter, s, *(_QWORD *)&length);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C859D0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

