id ab_get_framework_log()
{
  if (ab_get_framework_log_onceToken != -1)
    dispatch_once(&ab_get_framework_log_onceToken, &__block_literal_global);
  return (id)ab_get_framework_log_log;
}

void __ab_get_framework_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Health.AFibBurden", "hid-framework");
  v1 = (void *)ab_get_framework_log_log;
  ab_get_framework_log_log = (uint64_t)v0;

}

void sub_235FAC9A0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2;
  MEMORY[0x23B7E80D0](v3, 0x1020C40C76FD9F3);

  _Unwind_Resume(a1);
}

void sub_235FACD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a15, 8);
  if (a21)
  {
    a22 = (uint64_t)a21;
    operator delete(a21);
  }
  _Block_object_dispose((const void *)(v31 - 152), 8);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  *(_QWORD *)(v31 - 152) = &a24;
  std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 152));

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  result = *(__n128 *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

__n128 __Block_byref_object_copy__207(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__208(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_235FAD498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, uint64_t a20,uint64_t *a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  void *v43;
  void *v44;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a19);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a21);
  std::ofstream::~ofstream(&a38);
  if (a28 < 0)
    operator delete(__p);
  if (a34 < 0)
    operator delete(a29);

  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::basic_ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 64;
  a1[52] = MEMORY[0x24BEDB840] + 64;
  v4 = a1 + 1;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 1);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[52] = v3;
  MEMORY[0x23B7E7FC8](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_235FAD69C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x23B7E8064](v1 + 416);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  nlohmann::detail::exception *exception;
  char *v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  __int128 v14;
  std::string::size_type v15;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v10 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v13, v10);
      v11 = std::string::insert(&v13, 0, "cannot use emplace_back() with ");
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v15 = v11->__r_.__value_.__r.__words[2];
      v14 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)&v14, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v5 = *(uint64_t **)(a1 + 8);
  v6 = v5[1];
  if (v6 >= v5[2])
  {
    v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v5, a2);
  }
  else
  {
    *(_BYTE *)v6 = *(_BYTE *)a2;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(a2 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
    *(_BYTE *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
    v7 = v6 + 16;
  }
  v5[1] = v7;
  return v7 - 16;
}

void sub_235FAD810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t **nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(uint64_t **a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a1 + 1, *(unsigned __int8 *)a1);
  return a1;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[5],char const*>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FAD9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[10],double>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FADB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[13],BOOL>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FADD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FADED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

uint64_t *nlohmann::operator<<(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  const std::ios_base *v10;
  std::ios_base::fmtflags fmtflags;
  const std::locale::facet *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v19;
  _QWORD *v20;
  std::__shared_weak_count *v21;
  std::locale v22;
  void (***v23[81])(void);

  v23[80] = *(void (****)(void))MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v6 = *((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = 0;
  v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_250758E40;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_250758E90;
  v7[1].__shared_owners_ = (uint64_t)a1;
  v19 = v7;
  v20 = &v7[1].__vftable;
  v21 = v7;
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  v10 = (const std::ios_base *)((char *)a1 + *(_QWORD *)(v4 - 24));
  fmtflags = v10[1].__fmtflags_;
  if (fmtflags == -1)
  {
    std::ios_base::getloc(v10);
    v12 = std::locale::use_facet(&v22, MEMORY[0x24BEDB350]);
    fmtflags = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
    std::locale::~locale(&v22);
    v10[1].__fmtflags_ = fmtflags;
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer((uint64_t)v23, (uint64_t)&v20, (char)fmtflags, 0);
  v13 = v21;
  if (v21)
  {
    v14 = (unint64_t *)&v21->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v19)
  {
    v16 = (unint64_t *)&v19->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(v23, a2, v6 > 0, 0, v6 & ~(v6 >> 63), 0);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)v23);
  return a1;
}

void sub_235FAE108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, std::locale a13, char a14)
{
  std::locale::~locale(&a13);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x23B7E7FD4](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x23B7E8064](a1 + 52);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<double>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(uint64_t result)
{
  const char *v1;
  int v2;

  switch(*(_BYTE *)result)
  {
    case 1:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::object or m_value.object != nullptr";
      v2 = 1220;
      break;
    case 2:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::array or m_value.array != nullptr";
      v2 = 1221;
      break;
    case 3:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::string or m_value.string != nullptr";
      v2 = 1222;
      break;
    case 8:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::binary or m_value.binary != nullptr";
      v2 = 1223;
      break;
    default:
      return result;
  }
  __assert_rtn("assert_invariant", "json.hpp", v2, v1);
}

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(uint64_t **a1, int a2)
{
  int v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unint64_t i;
  uint64_t v11;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;

  v24 = 0;
  v25 = 0;
  v26 = 0;
  v3 = a2 - 1;
  if (a2 == 1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v24, (*a1)[2]);
    v4 = (uint64_t)(*a1 + 1);
    v5 = (_QWORD *)**a1;
    if (v5 != (_QWORD *)v4)
    {
      v6 = v25;
      do
      {
        if (v6 >= v26)
        {
          v6 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v24, (uint64_t)(v5 + 7));
        }
        else
        {
          *(_BYTE *)v6 = *((_BYTE *)v5 + 56);
          *(_QWORD *)(v6 + 8) = v5[8];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 7));
          *((_BYTE *)v5 + 56) = 0;
          v5[8] = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
          v6 += 16;
        }
        v25 = v6;
        v7 = (_QWORD *)v5[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = (_QWORD *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (_QWORD *)v5[2];
            v9 = *v8 == (_QWORD)v5;
            v5 = v8;
          }
          while (!v9);
        }
        v5 = v8;
      }
      while (v8 != (_QWORD *)v4);
    }
  }
  else if (a2 == 2)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v24, ((*a1)[1] - **a1) >> 4);
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v22, **a1, (*a1)[1], &v24);
  }
  for (i = v25; v24 != v25; i = v25)
  {
    v12 = *(_BYTE *)(i - 16);
    v11 = i - 16;
    LOBYTE(v22) = v12;
    v23 = *(uint64_t **)(v11 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    *(_BYTE *)v11 = 0;
    *(_QWORD *)(v11 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v24, v25 - 16);
    if (v22 == 1)
    {
      v13 = v23;
      v14 = v23 + 1;
      v15 = (_QWORD *)*v23;
      if ((uint64_t *)*v23 != v23 + 1)
      {
        v16 = v25;
        do
        {
          if (v16 >= v26)
          {
            v16 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v24, (uint64_t)(v15 + 7));
          }
          else
          {
            *(_BYTE *)v16 = *((_BYTE *)v15 + 56);
            *(_QWORD *)(v16 + 8) = v15[8];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v15 + 7));
            *((_BYTE *)v15 + 56) = 0;
            v15[8] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
            v16 += 16;
          }
          v25 = v16;
          v17 = (_QWORD *)v15[1];
          if (v17)
          {
            do
            {
              v18 = v17;
              v17 = (_QWORD *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              v18 = (_QWORD *)v15[2];
              v9 = *v18 == (_QWORD)v15;
              v15 = v18;
            }
            while (!v9);
          }
          v15 = v18;
        }
        while (v18 != v14);
        v13 = v23;
      }
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)v13, (char *)v13[1]);
      *v13 = (uint64_t)(v13 + 1);
      v13[2] = 0;
      v13[1] = 0;
    }
    else if (v22 == 2)
    {
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v27, *v23, v23[1], &v24);
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](v23);
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v23, v22);
  }
  switch(v3)
  {
    case 0:
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_41;
    case 1:
      v22 = (void **)*a1;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v22);
      goto LABEL_41;
    case 2:
      v19 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0)
        goto LABEL_42;
      v20 = (void *)*v19;
      break;
    case 7:
      v19 = *a1;
      v21 = (void *)**a1;
      if (!v21)
        goto LABEL_42;
      v19[1] = (uint64_t)v21;
      v20 = v21;
      break;
    default:
      goto LABEL_43;
  }
  operator delete(v20);
LABEL_41:
  v19 = *a1;
LABEL_42:
  operator delete(v19);
LABEL_43:
  v22 = (void **)&v24;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v22);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_235FAE6A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  BOOL v7;

  v1 = result;
  v3 = *result;
  v2 = result[1];
  if (v2 != *result)
  {
    v4 = v2 - 16;
    v5 = (unsigned __int8 *)(v2 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      v6 = *v5;
      v5 -= 16;
      result = (_QWORD *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v4 + 8, v6);
      v7 = v4 == v3;
      v4 = (uint64_t)v5;
    }
    while (!v7);
  }
  v1[1] = v3;
  return result;
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2507589C8, MEMORY[0x24BEDAAF0]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2507589C8, MEMORY[0x24BEDAAF0]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2507589C8, MEMORY[0x24BEDAAF0]);
}

void sub_235FAE7D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _QWORD v14[3];
  char v15;
  __int128 v16;
  __int128 v17;

  v7 = a7;
  *(_QWORD *)&v17 = a6;
  *((_QWORD *)&v17 + 1) = a7;
  v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  v15 = 0;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    v9 = a3 - 16;
    do
    {
      *(_BYTE *)(v7 - 16) = *(_BYTE *)v9;
      v10 = v7 - 16;
      *(_QWORD *)(v10 + 8) = *(_QWORD *)(v9 + 8);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
      *(_BYTE *)v9 = 0;
      *(_QWORD *)(v9 + 8) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
      v7 = *((_QWORD *)&v17 + 1) - 16;
      *((_QWORD *)&v17 + 1) -= 16;
      v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    v12 = v17;
  }
  v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v14 = v3;
  v15 = v2;
  v16 = v3;
  v17 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v9 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t **i;

  for (i = *(uint64_t ***)(a2 + 32); i != *(uint64_t ***)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)i);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(i + 1, *(unsigned __int8 *)i);
    i = (uint64_t **)(*(_QWORD *)(a2 + 32) + 16);
  }
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 16);
  if (v2 != a2)
  {
    v4 = result;
    do
    {
      *(_QWORD *)(v4 + 16) = v2 - 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 16);
      result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v2 - 8, *(unsigned __int8 *)(v2 - 16));
      v2 = *(_QWORD *)(v4 + 16);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  unint64_t v7;

  v5 = a2;
  if (a2 != a3)
  {
    v7 = a4[1];
    do
    {
      if (v7 >= a4[2])
      {
        v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(a4, v5);
      }
      else
      {
        *(_BYTE *)v7 = *(_BYTE *)v5;
        *(_QWORD *)(v7 + 8) = *(_QWORD *)(v5 + 8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
        *(_BYTE *)v5 = 0;
        *(_QWORD *)(v5 + 8) = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        v7 += 16;
      }
      a4[1] = v7;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v15[4] = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(_BYTE *)v11 = *(_BYTE *)a2;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  v15[2] = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_235FAEC40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;

  v3 = result;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != a2)
  {
    v5 = v4 - 16;
    v6 = (unsigned __int8 *)(v4 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
      v7 = *v6;
      v6 -= 16;
      result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v5 + 8, v7);
      v8 = v5 == a2;
      v5 = (uint64_t)v6;
    }
    while (!v8);
  }
  *(_QWORD *)(v3 + 8) = a2;
  return result;
}

void std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *((_QWORD *)a2 + 1));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(a2 + 56));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a2 + 64, a2[56]);
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(uint64_t a1, uint64_t a2)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2 + 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  unsigned int v8;
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (uint64_t)(v4 - 16);
      v7 = v4 - 16;
      do
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
        v8 = *v7;
        v7 -= 16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v6 + 8, v8);
        v9 = v6 == (_QWORD)v2;
        v6 = (uint64_t)v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id **std::unique_ptr<Tellurium::tellurium_classifier_t>::reset[abi:ne180100](id ***a1, id **a2)
{
  id **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Tellurium::tellurium_classifier_t::~tellurium_classifier_t(result);
    JUMPOUT(0x23B7E80D0);
  }
  return result;
}

void Tellurium::tellurium_classifier_t::~tellurium_classifier_t(id **this)
{
  id *v2;

  Tellurium::PredictorWrapper_t::~PredictorWrapper_t(this + 8);
  v2 = this[2];
  if (v2)
  {
    this[3] = v2;
    operator delete(v2);
  }
}

void std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 6;
        v6 = v4;
        std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_235FAEF1C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  v15 += 24;
  std::vector<std::vector<double>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<double>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_235FAF024(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_235FAF094(_Unwind_Exception *exception_object)
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

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::vector<std::vector<double>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<double>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<double>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<double>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

__n128 std::vector<Tellurium::tellurium_input_t>::__construct_one_at_end[abi:ne180100]<Tellurium::tellurium_input_t const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>((_QWORD *)v4, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  result = *(__n128 *)(a2 + 24);
  *(_QWORD *)(v4 + 40) = *(_QWORD *)(a2 + 40);
  *(__n128 *)(v4 + 24) = result;
  *(_QWORD *)(a1 + 8) = v4 + 48;
  return result;
}

void sub_235FAF3F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<Tellurium::tellurium_input_t>::__push_back_slow_path<Tellurium::tellurium_input_t const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  void *v16[2];
  char *v17;
  char *v18;
  uint64_t *v19;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x2AAAAAAAAAAAAAALL)
    v9 = 0x555555555555555;
  else
    v9 = v5;
  v19 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[48 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v17 = v11;
  v18 = &v10[48 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v11, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v12 = &v10[48 * v4];
  v13 = *(_OWORD *)(a2 + 24);
  *((_QWORD *)v12 + 5) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(v12 + 24) = v13;
  v17 += 48;
  std::vector<Tellurium::tellurium_input_t>::__swap_out_circular_buffer(a1, v16);
  v14 = a1[1];
  std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer(v16);
  return v14;
}

void sub_235FAF51C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<double>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_235FAF594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<double>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_235FAF6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t std::vector<Tellurium::tellurium_input_t>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      v8 = *(_OWORD *)(a3 - 48);
      a3 -= 48;
      *(_OWORD *)(v7 - 48) = v8;
      *(_QWORD *)(v7 - 32) = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v9 = *(_QWORD *)(a3 + 40);
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(_QWORD *)(v7 - 8) = v9;
      v7 = *((_QWORD *)&v15 + 1) - 48;
      *((_QWORD *)&v15 + 1) -= 48;
    }
    while (a3 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 6;
  }
}

void **std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer(void **a1)
{
  std::__split_buffer<Tellurium::tellurium_input_t>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<Tellurium::tellurium_input_t>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 48);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  uint64_t v10;
  _BYTE **v11;
  _BYTE *v12;
  int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  nlohmann::detail::exception *exception;
  uint64_t v19;
  uint64_t v20[3];

  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    v13 = 1;
    if ((a4 & 1) != 0)
      goto LABEL_17;
    goto LABEL_10;
  }
  v10 = 32 * a3;
  v11 = (_BYTE **)(a2 + 16);
  while (1)
  {
    v12 = *v11;
    if (**v11 != 2
      || *(_QWORD *)(*((_QWORD *)v12 + 1) + 8) - **((_QWORD **)v12 + 1) != 32
      || *(_BYTE *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10)
      goto LABEL_7;
  }
  v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2)
      v14 = 0;
    else
      v14 = v13;
    if (a5 != 1)
      LOBYTE(v13) = 1;
    if ((v13 & 1) == 0)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v20, "cannot create object from initializer list");
      nlohmann::detail::type_error::create(301, (uint64_t)v20, exception);
    }
    v13 = v14;
  }
LABEL_17:
  v15 = a2 + 32 * a3;
  if (v13)
  {
    *(_BYTE *)a1 = 1;
    v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    *v16 = v16 + 1;
    *(_QWORD *)(a1 + 8) = v16;
    std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(a2, v15, a1);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v19 = v15;
    v20[0] = a2;
    *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v20, &v19);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void sub_235FAFB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void nlohmann::detail::type_error::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;

  std::string::basic_string[abi:ne180100]<0>(&__p, "type_error");
  nlohmann::detail::exception::name(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(_QWORD *)a3 = &unk_250758DF0;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_235FAFC44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::type_error::~type_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_250758E18;
  MEMORY[0x23B7E7F74](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_250758E18;
  MEMORY[0x23B7E7F74](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x23B7E80D0);
}

uint64_t std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE v7[8];
  uint64_t *v8;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(v5, (uint64_t)v7);
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a3 + 8), *(const void ***)(*v8 + 8), *(_QWORD *)(*v8 + 8), *v8 + 16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v7);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_235FAFD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t **v9;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v9, a9);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = operator new(0x18uLL);
  v5 = *a1;
  v6 = *a2;
  v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v4, v5, v6, v7);
  return v4;
}

void sub_235FAFDC4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[](uint64_t a1, uint64_t a2)
{
  nlohmann::detail::exception *exception;
  char *v5;
  std::string *v6;
  __int128 v7;
  std::string v8;
  __int128 v9;
  std::string::size_type v10;

  if (*(_BYTE *)a1 != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v10 = v6->__r_.__value_.__r.__words[2];
    v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(305, (uint64_t)&v9, exception);
  }
  return **(_QWORD **)(a1 + 8) + 16 * a2;
}

void sub_235FAFE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 9)
    return "number";
  else
    return off_250758ED8[v1];
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *p_p;
  std::string::size_type size;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;

  std::operator+<char>();
  v4 = std::string::append(&v12, ".");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_235FB0040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 - 41) < 0)
    operator delete(*(void **)(v26 - 64));
  if (a14 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(_QWORD *)this = &unk_250758E18;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x23B7E7F68]((char *)this + 16, a3);
  return this;
}

void sub_235FB00E4(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

const char *nlohmann::detail::exception::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this + 1);
}

void nlohmann::detail::exception::~exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_250758E18;
  MEMORY[0x23B7E7F74](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_250758E18;
  MEMORY[0x23B7E7F74](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x23B7E80D0);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

uint64_t nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 24))
    return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(a2, v3);
  *(_BYTE *)a2 = *(_BYTE *)v3;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(v3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
  *(_BYTE *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2)
{
  std::string *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  switch(*(_BYTE *)a1)
  {
    case 1:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(const void ****)(a2 + 8));
      goto LABEL_8;
    case 2:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      v4 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(*(_QWORD *)(a2 + 8));
      goto LABEL_8;
    case 4:
      v4 = (std::string *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      v4 = *(std::string **)(a2 + 8);
      goto LABEL_8;
    case 8:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(*(_QWORD *)(a2 + 8));
LABEL_8:
      *(_QWORD *)(a1 + 8) = v4;
      break;
    default:
      break;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(const void ***a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)operator new(0x18uLL);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](v2, a1);
  return v2;
}

void sub_235FB03C4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_235FB0414(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  const void **v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2
    || std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), v12 + 4, a5))
    {
      goto LABEL_16;
    }
    return (const void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, v15 + 4))return (const void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x48uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_235FB072C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, a3, (const void **)(v4 + 32)))break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

std::string *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(&this[1], (char *)a2 + 24);
  return this;
}

void sub_235FB08F8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(*(_QWORD *)a1, (uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_235FB0BC4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_235FB0C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v4, v6);
      v6 += 16;
      v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_235FB0D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(*(_QWORD *)a1, **(_QWORD **)(a1 + 16), **(_QWORD **)(a1 + 16), **(_QWORD **)(a1 + 8), **(_QWORD **)(a1 + 8));
  return a1;
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  BOOL v9;

  if (a3 != a5)
  {
    v6 = a3 - 16;
    v7 = (unsigned __int8 *)(a3 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
      v8 = *v7;
      v7 -= 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(v6 + 8), v8);
      v9 = v6 == a5;
      v6 = (uint64_t)v7;
    }
    while (!v9);
  }
}

std::string *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(uint64_t a1)
{
  std::string *v2;
  std::string *v3;

  v2 = (std::string *)operator new(0x18uLL);
  v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  return v3;
}

void sub_235FB0E2C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v2, *(const void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_235FB0E88(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_235FB0EF8(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v7;
  uint64_t *result;
  uint64_t *v9;
  uint64_t v10;

  v7 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  result = *v7;
  if (!*v7)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a3, a4, (uint64_t)&v9);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v10, v7, v9);
    return v9;
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _OWORD *v8;
  char v9;
  uint64_t v10;
  uint64_t result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  v8[2] = *(_OWORD *)a2;
  *((_QWORD *)v8 + 6) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v9 = *(_BYTE *)a3;
  *((_QWORD *)v8 + 8) = *(_QWORD *)(a3 + 8);
  *((_BYTE *)v8 + 56) = v9;
  v10 = (uint64_t)v8 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_235FB10C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v4, v6);
      v6 += 32;
      v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_235FB1170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, uint64_t a2)
{
  _BYTE v4[8];
  uint64_t *v5;

  nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(a2, (uint64_t)v4);
  *(_BYTE *)a1 = v4[0];
  *(_QWORD *)(a1 + 8) = v5;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  v4[0] = 0;
  v5 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v5, v4[0]);
  return a1;
}

uint64_t nlohmann::detail::external_constructor<(nlohmann::detail::value_t)2>::construct<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<double>,0>(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t *v6;

  *(_BYTE *)a1 = 2;
  v3 = *(uint64_t **)a2;
  v5 = *(uint64_t **)(a2 + 8);
  v6 = v3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(&v6, &v5);
  return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(uint64_t **a1, uint64_t **a2)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;

  v4 = operator new(0x18uLL);
  v5 = *a1;
  v6 = *a2;
  v7 = *a2 - *a1;
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(v4, v5, v6, v7);
  return v4;
}

void sub_235FB129C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(_QWORD *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,double const*,double const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_235FB1314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,double const*,double const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v11 = a4;
  v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *(_QWORD *)(v4 + 8) = 0;
      v7 = *v6++;
      *(_BYTE *)v4 = 7;
      *(_QWORD *)(v4 + 8) = v7;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      v4 = v12 + 16;
      v12 += 16;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v15[4] = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(_BYTE *)v11 = *(_BYTE *)a2;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  v15[2] = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_235FB14AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[5],char const*>(uint64_t **a1, char *a2, char **a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[5],char const*>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB1544(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[5],char const*>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[5],char const*,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB15D4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[5],char const*,0>(_QWORD *a1, char *a2, char **a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)(v5 + 3), a3);
  return a1;
}

void sub_235FB1624(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>(uint64_t a1, char **a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(char **a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, *a1);
  return v2;
}

void sub_235FB16BC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin(unsigned __int8 **result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *result;
  if (!*result)
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

_QWORD *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(_QWORD *result, uint64_t a2)
{
  *result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2)
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[10],double>(uint64_t **a1, char *a2, uint64_t *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[10],double>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB1828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[10],double>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[10],double,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB18B8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[10],double,0>(_QWORD *a1, char *a2, uint64_t *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  v6 = *a3;
  *((_BYTE *)v5 + 24) = 7;
  v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[13],BOOL>(uint64_t **a1, char *a2, unsigned __int8 *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[13],BOOL>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB19A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[13],BOOL>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[13],BOOL,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB1A38(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[13],BOOL,0>(_QWORD *a1, char *a2, unsigned __int8 *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  v6 = *a3;
  *((_BYTE *)v5 + 24) = 4;
  v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, char *a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB1B28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB1BB8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(_QWORD *a1, char *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  *((_BYTE *)v5 + 24) = *(_BYTE *)a3;
  v6 = (uint64_t)(v5 + 3);
  v5[4] = *(_QWORD *)(a3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
  return a1;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(void (****a1)(void), uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v11)(void);
  void (**v12)(void);
  unsigned int v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(void);
  unsigned int v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD **v29;
  uint64_t *v30;
  _QWORD **v31;
  uint64_t (*v32)(void);
  void (*v34)(void);
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t (***v38)(void);
  _QWORD **v39;
  unsigned __int8 **v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  BOOL v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  unsigned __int8 **v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  unsigned int v62;
  _QWORD **v63;
  uint64_t v64;
  void (*v65)(void);
  unint64_t v66;
  _QWORD **v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD **v74;

  switch(*(_BYTE *)a2)
  {
    case 0:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 1:
      v12 = **a1;
      if (!*(_QWORD *)(*(_QWORD *)(a2 + 8) + 16))
      {
        v11 = (uint64_t (*)(void))v12[1];
        return v11();
      }
      if (a3)
      {
        v12[1]();
        v13 = a6 + a5;
        v14 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v15 = (unint64_t)a1[77];
          if (v15 >= v13)
            goto LABEL_7;
        }
        else
        {
          v15 = *((unsigned __int8 *)a1 + 631);
          if (v13 <= v15)
          {
LABEL_7:
            v16 = *(_QWORD **)(a2 + 8);
            v17 = (_QWORD *)*v16;
            if (v16[2] == 1)
            {
              v18 = (_QWORD *)*v16;
            }
            else
            {
              v66 = 0;
              do
              {
                v67 = a1 + 76;
                if (*((char *)a1 + 631) < 0)
                  v67 = (_QWORD **)*v14;
                ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v67, (a6 + a5));
                ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v17 + 4, a4);
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v17 + 7, 1, a4, a5, (a6 + a5));
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v68 = (_QWORD *)v17[1];
                if (v68)
                {
                  do
                  {
                    v18 = v68;
                    v68 = (_QWORD *)*v68;
                  }
                  while (v68);
                }
                else
                {
                  do
                  {
                    v18 = (_QWORD *)v17[2];
                    v50 = *v18 == (_QWORD)v17;
                    v17 = v18;
                  }
                  while (!v50);
                }
                ++v66;
                v16 = *(_QWORD **)(a2 + 8);
                v17 = v18;
              }
              while (v66 < v16[2] - 1);
            }
            v69 = v16 + 1;
            if (v18 == v69)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v70 = (_QWORD *)v18[1];
            if (v70)
            {
              do
              {
                v71 = v70;
                v70 = (_QWORD *)*v70;
              }
              while (v70);
            }
            else
            {
              v73 = v18;
              do
              {
                v71 = (_QWORD *)v73[2];
                v50 = *v71 == (_QWORD)v73;
                v73 = v71;
              }
              while (!v50);
            }
            if (v71 != v69)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v74 = a1 + 76;
            if (*((char *)a1 + 631) < 0)
              v74 = (_QWORD **)*v14;
            ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v74, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v18 + 4, a4);
            ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v18 + 7, 1, a4, a5, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
            v65 = (**a1)[1];
            goto LABEL_108;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v15, 32);
        goto LABEL_7;
      }
      (*v12)();
      v45 = *(_QWORD *)(a2 + 8);
      v46 = *(_QWORD **)v45;
      if (*(_QWORD *)(v45 + 16) != 1)
      {
        v47 = 0;
        do
        {
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v46 + 4, a4);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v46 + 7, 0, a4, a5, a6);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v48 = (_QWORD *)v46[1];
          v49 = v46;
          if (v48)
          {
            do
            {
              v46 = v48;
              v48 = (_QWORD *)*v48;
            }
            while (v48);
          }
          else
          {
            do
            {
              v46 = (_QWORD *)v49[2];
              v50 = *v46 == (_QWORD)v49;
              v49 = v46;
            }
            while (!v50);
          }
          ++v47;
          v45 = *(_QWORD *)(a2 + 8);
        }
        while (v47 < *(_QWORD *)(v45 + 16) - 1);
      }
      v51 = (_QWORD *)(v45 + 8);
      if (v46 == v51)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      v52 = (_QWORD *)v46[1];
      if (v52)
      {
        do
        {
          v53 = v52;
          v52 = (_QWORD *)*v52;
        }
        while (v52);
      }
      else
      {
        v72 = v46;
        do
        {
          v53 = (_QWORD *)v72[2];
          v50 = *v53 == (_QWORD)v72;
          v72 = v53;
        }
        while (!v50);
      }
      if (v53 != v51)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v46 + 4, a4);
      ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v46 + 7, 0, a4, a5, a6);
LABEL_109:
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 2:
      v19 = *(uint64_t **)(a2 + 8);
      v20 = *v19;
      v21 = v19[1];
      v22 = **a1;
      if (v20 == v21)
      {
        v11 = (uint64_t (*)(void))v22[1];
        return v11();
      }
      if (a3)
      {
        v22[1]();
        v23 = a6 + a5;
        v24 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v25 = (unint64_t)a1[77];
          if (v25 >= v23)
            goto LABEL_13;
        }
        else
        {
          v25 = *((unsigned __int8 *)a1 + 631);
          if (v23 <= v25)
          {
LABEL_13:
            v26 = *(uint64_t **)(a2 + 8);
            v28 = *v26;
            v27 = v26[1];
            if (v28 != v27 - 16)
            {
              do
              {
                v29 = a1 + 76;
                if (*((char *)a1 + 631) < 0)
                  v29 = (_QWORD **)*v24;
                ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v29, (a6 + a5));
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v28, 1, a4, a5, (a6 + a5));
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v28 += 16;
                v30 = *(uint64_t **)(a2 + 8);
                v27 = v30[1];
              }
              while (v28 != v27 - 16);
              v28 = *v30;
            }
            if (v28 == v27)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v31 = a1 + 76;
            if (*((char *)a1 + 631) < 0)
              v31 = (_QWORD **)*v24;
            ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v31, (a6 + a5));
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
            if (*((char *)a1 + 631) < 0)
              v24 = (_QWORD *)*v24;
            ((void (*)(void (***)(void), _QWORD *, _QWORD))(**a1)[1])(*a1, v24, a6);
            goto LABEL_95;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v25, 32);
        goto LABEL_13;
      }
      (*v22)();
      v54 = *(uint64_t **)(a2 + 8);
      v56 = *v54;
      v55 = v54[1];
      if (v56 == v55 - 16)
      {
        v57 = v56;
      }
      else
      {
        v57 = v56;
        do
        {
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v57, 0, a4, a5, a6);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v57 += 16;
          v58 = *(uint64_t **)(a2 + 8);
          v55 = v58[1];
        }
        while (v57 != v55 - 16);
        v56 = *v58;
      }
      if (v56 == v55)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v57, 0, a4, a5, a6);
LABEL_95:
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 3:
      (***a1)();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 4:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 5:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(a1, *(_QWORD *)(a2 + 8));
    case 6:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(a1, *(_QWORD *)(a2 + 8));
    case 7:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float((char *)a1, *(double *)(a2 + 8));
    case 8:
      v34 = (**a1)[1];
      if (a3)
      {
        v34();
        v35 = (a6 + a5);
        v36 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v37 = (unint64_t)a1[77];
          if (v37 >= v35)
          {
            v38 = (uint64_t (***)(void))*a1;
            goto LABEL_62;
          }
        }
        else
        {
          v37 = *((unsigned __int8 *)a1 + 631);
          if (v35 <= v37)
          {
            v38 = (uint64_t (***)(void))*a1;
            v39 = a1 + 76;
            goto LABEL_63;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v37, 32);
        v38 = (uint64_t (***)(void))*a1;
        v39 = a1 + 76;
        if ((*((char *)a1 + 631) & 0x80000000) == 0)
        {
LABEL_63:
          ((void (*)(uint64_t (***)(void), _QWORD **, uint64_t))(*v38)[1])(v38, v39, v35);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\"bytes\": [", 10);
          v59 = *(unsigned __int8 ***)(a2 + 8);
          v61 = *v59;
          v60 = v59[1];
          if (v61 != v60)
          {
            if (v61 != v60 - 1)
            {
              do
              {
                v62 = *v61++;
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, v62);
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ", ", 2);
              }
              while (v61 != (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 1));
            }
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *v61);
          }
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "],\n", 3);
          v63 = a1 + 76;
          if (*((char *)a1 + 631) < 0)
            v63 = (_QWORD **)*v36;
          ((void (*)(void (***)(void), _QWORD **, uint64_t))(**a1)[1])(*a1, v63, v35);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\"subtype\": ", 11);
          v64 = *(_QWORD *)(a2 + 8);
          if (*(_BYTE *)(v64 + 25))
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *(unsigned __int8 *)(v64 + 24));
          else
            ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "null", 4);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
          v65 = (**a1)[1];
LABEL_108:
          v65();
          goto LABEL_109;
        }
LABEL_62:
        v39 = (_QWORD **)*v36;
        goto LABEL_63;
      }
      v34();
      v40 = *(unsigned __int8 ***)(a2 + 8);
      v42 = *v40;
      v41 = v40[1];
      if (v42 != v41)
      {
        while (v42 != v41 - 1)
        {
          v43 = *v42++;
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, v43);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v41 = *(unsigned __int8 **)(*(_QWORD *)(a2 + 8) + 8);
        }
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *v42);
      }
      ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "],\"subtype\":", 12);
      v44 = *(_QWORD *)(a2 + 8);
      if (*(_BYTE *)(v44 + 25))
      {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *(unsigned __int8 *)(v44 + 24));
        goto LABEL_109;
      }
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 9:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    default:
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
  }
}

void std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_250758E40;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_250758E40;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B7E80D0);
}

uint64_t std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

uint64_t nlohmann::detail::output_stream_adapter<char>::write_character()
{
  return std::ostream::put();
}

uint64_t nlohmann::detail::output_stream_adapter<char>::write_characters()
{
  return std::ostream::write();
}

void nlohmann::detail::output_stream_adapter<char>::~output_stream_adapter()
{
  JUMPOUT(0x23B7E80D0);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  lconv *v7;
  char *thousands_sep;
  char *decimal_point;
  int8x16_t *v10;
  int8x16_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v7 = localeconv();
  *(_QWORD *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep)
    LOBYTE(thousands_sep) = *thousands_sep;
  *(_BYTE *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point)
    LOBYTE(decimal_point) = *decimal_point;
  *(_OWORD *)(a1 + 90) = 0u;
  *(_BYTE *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(_BYTE *)(a1 + 602) = a3;
  v10 = (int8x16_t *)operator new(0x208uLL);
  *(_QWORD *)(a1 + 608) = v10;
  *(_QWORD *)(a1 + 624) = 0x8000000000000208;
  v11 = vdupq_n_s8(a3);
  *(_QWORD *)(a1 + 616) = 512;
  *v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_235FB2878(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped(uint64_t result, uint64_t *a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  uint64_t *v21;
  int v22;
  unint64_t v23;
  char *v24;
  uint64_t (*v25)(void);
  int v26;
  nlohmann::detail::exception *exception;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  __int128 v31;
  char *v32;
  std::string::size_type v33;
  std::string *v34;
  __int128 v35;
  uint64_t *v36;
  nlohmann::detail::exception *v37;
  std::string v38;
  std::string v39;
  std::string v40;
  __int128 v41;
  std::string::size_type v42;
  char __str[8];
  std::string::size_type v44;
  char v45;
  char v46;
  unsigned int v47[3];

  v46 = 0;
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = a2[1];
  if (!v4)
    return result;
  v7 = (_QWORD *)result;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v47[0] = 0;
  v12 = result + 90;
  do
  {
    if ((v3 & 1) != 0)
      v13 = (uint64_t *)*a2;
    else
      v13 = a2;
    v14 = *((unsigned __int8 *)v13 + v8);
    result = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(&v46, v47, v14);
    if ((_DWORD)result == 1)
    {
      v16 = *((_DWORD *)v7 + 158);
      if ((v16 - 1) >= 2)
      {
        if (!v16)
        {
          v45 = 3;
          *(_DWORD *)__str = 0;
          snprintf(__str, 3uLL, "%.2X", v14);
          exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
          std::to_string(&v38, v8);
          v28 = std::string::insert(&v38, 0, "invalid UTF-8 byte at index ");
          v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v39.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = std::string::append(&v39, ": 0x");
          v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          v40.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          if (v45 >= 0)
            v32 = __str;
          else
            v32 = *(char **)__str;
          if (v45 >= 0)
            v33 = v45;
          else
            v33 = v44;
          v34 = std::string::append(&v40, v32, v33);
          v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          v42 = v34->__r_.__value_.__r.__words[2];
          v41 = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::type_error::create(316, (uint64_t)&v41, exception);
        }
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
      }
      v17 = v9 != 0;
      if (v16 == 1)
      {
        v18 = v12 + v10;
        if (a3)
        {
          *(_DWORD *)v18 = 1717990748;
          *(_WORD *)(v18 + 4) = 25702;
          v10 += 6;
        }
        else
        {
          v10 += 3;
          *(_WORD *)v18 = -16401;
          *(_BYTE *)(v18 + 2) = -67;
        }
        if ((unint64_t)(v10 - 500) <= 0xC)
        {
          result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v10);
          v10 = 0;
        }
      }
      v9 = 0;
      v8 -= v17;
      v46 = 0;
      v11 = v10;
    }
    else if ((_DWORD)result)
    {
      if ((a3 & 1) == 0)
      {
        if (*((char *)a2 + 23) >= 0)
          v19 = a2;
        else
          v19 = (uint64_t *)*a2;
        *(_BYTE *)(v12 + v11++) = *((_BYTE *)v19 + v8);
      }
      ++v9;
    }
    else
    {
      switch(v47[0])
      {
        case 8u:
          v15 = 25180;
          goto LABEL_43;
        case 9u:
          v15 = 29788;
          goto LABEL_43;
        case 0xAu:
          v15 = 28252;
          goto LABEL_43;
        case 0xBu:
          goto LABEL_29;
        case 0xCu:
          v15 = 26204;
          goto LABEL_43;
        case 0xDu:
          v15 = 29276;
          goto LABEL_43;
        default:
          if (v47[0] == 34)
          {
            v15 = 8796;
            goto LABEL_43;
          }
          if (v47[0] == 92)
          {
            v15 = 23644;
LABEL_43:
            *(_WORD *)(v12 + v11) = v15;
            v11 += 2;
            goto LABEL_44;
          }
LABEL_29:
          if (v47[0] > 0x7E)
            v20 = a3;
          else
            v20 = 0;
          if (v47[0] < 0x20 || v20)
          {
            v24 = (char *)(v12 + v11);
            if (HIWORD(v47[0]))
            {
              result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v47[0] >> 10) - 10304), v47[0] & 0x3FF | 0xDC00);
              v11 += 12;
            }
            else
            {
              result = snprintf(v24, 7uLL, "\\u%04x", v47[0]);
              v11 += 6;
            }
          }
          else
          {
            if (*((char *)a2 + 23) >= 0)
              v21 = a2;
            else
              v21 = (uint64_t *)*a2;
            *(_BYTE *)(v12 + v11++) = *((_BYTE *)v21 + v8);
          }
LABEL_44:
          if ((unint64_t)(v11 - 500) > 0xC)
          {
            v9 = 0;
            v10 = v11;
          }
          else
          {
            result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v11);
            v11 = 0;
            v10 = 0;
            v9 = 0;
          }
          break;
      }
    }
    ++v8;
    v22 = *((char *)a2 + 23);
    v3 = v22 >> 31;
    v23 = a2[1];
    if (v22 >= 0)
      v23 = *((unsigned __int8 *)a2 + 23);
  }
  while (v8 < v23);
  if (v46)
  {
    v26 = *((_DWORD *)v7 + 158);
    switch(v26)
    {
      case 1:
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v10);
        v25 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
        break;
      case 2:
        v25 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
        break;
      case 0:
        v45 = 3;
        *(_DWORD *)__str = 0;
        v36 = (uint64_t *)*a2;
        if (v22 >= 0)
          v36 = a2;
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v36 + v23 - 1));
        v37 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        nlohmann::detail::type_error::create(316, (uint64_t)&v41, v37);
      default:
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
    }
    return v25();
  }
  else if (v11)
  {
    v25 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
    return v25();
  }
  return result;
}

void sub_235FB2E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  int v40;
  uint64_t v41;

  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 97) < 0)
        operator delete(*(void **)(v41 - 120));
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(_QWORD *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  char *v5;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)((char *)a1 + 17) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[(a2 - 100 * ((41 * a2) >> 12))];
      v5 = (char *)a1 + 17;
      v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  v5 = (char *)a1 + v3 + 16;
  if (a2 < 0xA)
  {
LABEL_10:
    *(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  *((_WORD *)v5 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[a2];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  _BYTE *v3;
  char *v4;
  int v6;
  unsigned int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  v3 = a1 + 2;
  if ((v2 & 0x8000000000000000) != 0)
  {
    *v3 = 45;
    v2 = -(uint64_t)v2;
    if (v2 >= 0xA)
    {
      v6 = 4;
      v10 = v2;
      while (1)
      {
        if (v10 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_24;
        }
        if (v10 <= 0x3E7)
          break;
        if (v10 >> 4 < 0x271)
          goto LABEL_24;
        v6 += 4;
        v9 = v10 >= 0x186A0;
        v10 /= 0x2710uLL;
        if (!v9)
        {
          v6 -= 3;
          goto LABEL_24;
        }
      }
      --v6;
    }
    else
    {
      v6 = 1;
    }
LABEL_24:
    v7 = v6 + 1;
  }
  else
  {
    if (v2 < 0xA)
    {
      v4 = (char *)a1 + 17;
LABEL_33:
      *(v4 - 1) = v2 + 48;
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
    }
    v7 = 4;
    v8 = v2;
    while (1)
    {
      if (v8 <= 0x63)
      {
        v7 -= 2;
        goto LABEL_25;
      }
      if (v8 <= 0x3E7)
        break;
      if (v8 >> 4 < 0x271)
        goto LABEL_25;
      v7 += 4;
      v9 = v8 >= 0x186A0;
      v8 /= 0x2710uLL;
      if (!v9)
      {
        v7 -= 3;
        goto LABEL_25;
      }
    }
    --v7;
  }
LABEL_25:
  if (v7 >= 0x3F)
    nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
  v4 = &v3[v7];
  if (v2 < 0x64)
  {
    v11 = v2;
  }
  else
  {
    do
    {
      v11 = v2 / 0x64;
      *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v2 % 0x64];
      v4 -= 2;
      v12 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v12 > 0x270);
  }
  if (v11 < 0xA)
  {
    LOBYTE(v2) = v11;
    goto LABEL_33;
  }
  *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v11];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  if (a2 < 0xA)
  {
    v3 = (uint64_t)a1 + 17;
LABEL_21:
    *(_BYTE *)(v3 - 1) = v2 + 48;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  v5 = 4;
  v6 = a2;
  while (1)
  {
    if (v6 <= 0x63)
    {
      v5 -= 2;
      goto LABEL_13;
    }
    if (v6 <= 0x3E7)
      break;
    if (v6 >> 4 < 0x271)
      goto LABEL_13;
    v7 = v6 >> 5;
    v6 /= 0x2710uLL;
    v5 += 4;
    if (v7 <= 0xC34)
    {
      v5 -= 3;
      goto LABEL_13;
    }
  }
  --v5;
LABEL_13:
  if (v5 >= 0x3F)
    nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
  v3 = (uint64_t)a1 + v5 + 16;
  if (a2 < 0x64)
  {
    v8 = a2;
  }
  else
  {
    do
    {
      v8 = v2 / 0x64;
      *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v2 % 0x64];
      v3 -= 2;
      v9 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v9 > 0x270);
  }
  if (v8 < 0xA)
  {
    LOBYTE(v2) = v8;
    goto LABEL_21;
  }
  *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v8];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float(char *a1, double a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, const char *, uint64_t);
  uint64_t v5;
  const char *v6;

  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    v5 = *(_QWORD *)a1;
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v6 = "null";
    v3 = 4;
  }
  else
  {
    v3 = nlohmann::detail::to_chars<double>(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v5 = *(_QWORD *)a1;
    v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(_BYTE *a1, unsigned int *a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;

  v3 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[a3];
  if (*a1)
    v4 = a3 & 0x3F | (*a2 << 6);
  else
    v4 = (0xFFu >> v3) & a3;
  *a2 = v4;
  v5 = 16 * *a1 + v3 + 256;
  if (v5 >= 0x190)
    __assert_rtn("decode", "serializer.hpp", 892, "index < 400");
  v6 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[v5];
  *a1 = v6;
  return v6;
}

char *nlohmann::detail::to_chars<double>(char *a1, uint64_t a2, double a3)
{
  char *v3;
  char *result;
  unint64_t v5;
  char *v6;

  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::to_chars<double>();
  v3 = a1;
  if ((*(_QWORD *)&a3 & 0x8000000000000000) != 0)
  {
    a3 = -a3;
    *a1 = 45;
    v3 = a1 + 1;
  }
  if (a3 == 0.0)
  {
    *(_WORD *)v3 = 11824;
    result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    v5 = a2 - (_QWORD)v3;
    if (a2 - (uint64_t)v3 <= 16)
      nlohmann::detail::to_chars<double>();
    v6 = 0;
    nlohmann::detail::dtoa_impl::grisu2<double>((uint64_t)v3, (unsigned int *)&v6 + 1, &v6, a3);
    if (SHIDWORD(v6) >= 18)
      nlohmann::detail::to_chars<double>();
    if (v5 <= 0x15)
      nlohmann::detail::to_chars<double>();
    if (v5 == 22)
      nlohmann::detail::to_chars<double>();
    return nlohmann::detail::dtoa_impl::format_buffer((nlohmann::detail::dtoa_impl *)v3, (char *)HIDWORD(v6), (int)v6, -4, 15);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2<double>(uint64_t a1, unsigned int *a2, _DWORD *a3, double a4)
{
  uint64_t v7;
  uint64_t v9[6];

  if ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::dtoa_impl::grisu2<double>();
  if (a4 <= 0.0)
    nlohmann::detail::dtoa_impl::grisu2<double>();
  nlohmann::detail::dtoa_impl::compute_boundaries<double>((uint64_t)v9, a4);
  return nlohmann::detail::dtoa_impl::grisu2(a1, a2, a3, v9[2], v9[3], v9[0], v9[1], v7, v9[4], (nlohmann::detail::dtoa_impl *)v9[5]);
}

char *nlohmann::detail::dtoa_impl::format_buffer(nlohmann::detail::dtoa_impl *this, char *a2, int a3, int a4, int a5)
{
  int v5;
  uint64_t v7;
  char *result;
  _BYTE *v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  unsigned int v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;

  if ((a4 & 0x80000000) == 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  if (a5 <= 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  v5 = (int)a2;
  v7 = a3 + (uint64_t)(int)a2;
  if ((a3 & 0x80000000) == 0 && (int)v7 <= a5)
  {
    memset((char *)this + (int)a2, 48, a3);
    *((_BYTE *)this + v7) = 46;
    result = (char *)this + v7 + 2;
    *((_BYTE *)this + (int)v7 + 1) = 48;
    return result;
  }
  if ((int)v7 < 1 || (int)v7 > a5)
  {
    if ((int)v7 > a4 && (int)v7 <= 0)
    {
      v10 = -(int)v7;
      memmove((char *)this + v10 + 2, this, (int)a2);
      *(_WORD *)this = 11824;
      memset((char *)this + 2, 48, v10);
      return (char *)this + v10 + v5 + 2;
    }
    if ((_DWORD)a2 == 1)
    {
      v11 = 1;
    }
    else
    {
      memmove((char *)this + 2, (char *)this + 1, (int)a2 - 1);
      *((_BYTE *)this + 1) = 46;
      v11 = v5 + 1;
    }
    v12 = (char *)this + v11;
    *v12 = 101;
    if ((int)v7 <= -999)
      nlohmann::detail::dtoa_impl::format_buffer();
    if ((int)v7 >= 1001)
      nlohmann::detail::dtoa_impl::format_buffer();
    if ((int)v7 >= 1)
      v13 = 43;
    else
      v13 = 45;
    if ((int)v7 - 1 >= 0)
      v14 = v7 - 1;
    else
      v14 = 1 - v7;
    v12[1] = v13;
    if (v14 > 9)
    {
      if (v14 > 0x63)
      {
        v12[2] = (unsigned __int16)v14 / 0x64u + 48;
        v17 = (unsigned __int16)v14 % 0x64u;
        v12[3] = (v17 / 0xAu) | 0x30;
        v12[4] = (v17 % 0xAu) | 0x30;
        v16 = 2;
        return &v12[v16 + 3];
      }
      v12[2] = v14 / 0xAu + 48;
      v15 = (v14 % 0xAu) | 0x30;
    }
    else
    {
      v12[2] = 48;
      v15 = v14 + 48;
    }
    v12[3] = v15;
    v16 = 1;
    return &v12[v16 + 3];
  }
  if ((a3 & 0x80000000) == 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  v9 = (char *)this + v7;
  memmove(v9 + 1, v9, (int)a2 - (unint64_t)v7);
  *v9 = 46;
  return (char *)this + v5 + 1;
}

uint64_t nlohmann::detail::dtoa_impl::compute_boundaries<double>@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  int v20;
  int v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  int v25;

  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  if (a2 <= 0.0)
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  v4 = *(_QWORD *)&a2 >> 52;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  v6 = 2 * v5;
  v7 = *(_QWORD *)&a2 >> 53;
  v8 = 4 * v5;
  v9 = (*(_QWORD *)&a2 >> 52) - 1077;
  v10 = 0x10000000000000;
  if ((*(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL) != 0)
  {
    v8 = 2 * v5;
    v9 = (*(_QWORD *)&a2 >> 52) - 1076;
    v10 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  }
  v11 = v7 == 0;
  if (v7)
    v12 = v8;
  else
    v12 = 2 * v5;
  if (v11)
    v9 = (*(_QWORD *)&a2 >> 52) - 1076;
  else
    v5 = v10;
  v3 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v4)
  {
    v13 = (*(_QWORD *)&a2 >> 52) - 1076;
  }
  else
  {
    v12 = 2 * v3;
    v9 = -1075;
    v13 = 4294966221;
  }
  if (v4)
  {
    v14 = (*(_QWORD *)&a2 >> 52) - 1075;
  }
  else
  {
    v6 = 2 * v3;
    v14 = 4294966222;
  }
  if (v4)
    v15 = v5;
  else
    v15 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v24 = v12 - 1;
  v25 = v9;
  v16 = nlohmann::detail::dtoa_impl::diyfp::normalize(v6 | 1, v13);
  v18 = v17;
  v19 = nlohmann::detail::dtoa_impl::diyfp::normalize_to(&v24, v17);
  v21 = v20;
  result = nlohmann::detail::dtoa_impl::diyfp::normalize(v15, v14);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v23;
  *(_QWORD *)(a1 + 16) = v19;
  *(_DWORD *)(a1 + 24) = v21;
  *(_QWORD *)(a1 + 32) = v16;
  *(_DWORD *)(a1 + 40) = v18;
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, nlohmann::detail::dtoa_impl *a10)
{
  uint64_t cached_power_for_binary_exponent;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v31[0] = a4;
  v31[1] = a5;
  v30[0] = a6;
  v30[1] = a7;
  v29[0] = a9;
  v29[1] = a10;
  if ((_DWORD)a10 != (_DWORD)a5)
    nlohmann::detail::dtoa_impl::grisu2();
  if ((_DWORD)a10 != (_DWORD)a7)
    nlohmann::detail::dtoa_impl::grisu2();
  cached_power_for_binary_exponent = nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(a10);
  v15 = v14;
  v27 = cached_power_for_binary_exponent;
  v28 = v16;
  v17 = nlohmann::detail::dtoa_impl::diyfp::mul(v30, &v27);
  v19 = v18;
  v20 = nlohmann::detail::dtoa_impl::diyfp::mul(v31, &v27);
  v22 = v21;
  v23 = nlohmann::detail::dtoa_impl::diyfp::mul(v29, &v27);
  *a3 = -v15;
  return nlohmann::detail::dtoa_impl::grisu2_digit_gen(a1, a2, a3, v20 + 1, v22, v17, v19, v25, v23 - 1, v24);
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::normalize(uint64_t result, unint64_t a2)
{
  if (!result)
    __assert_rtn("normalize", "to_chars.hpp", 143, "x.f != 0");
  for (; (result & 0x8000000000000000) == 0; a2 = (a2 - 1) | a2 & 0xFFFFFFFF00000000)
    result *= 2;
  return result;
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::normalize_to(uint64_t *a1, int a2)
{
  int v2;
  uint64_t v3;
  unint64_t result;
  const char *v5;
  int v6;

  v2 = *((_DWORD *)a1 + 2) - a2;
  if (v2 < 0)
  {
    v5 = "delta >= 0";
    v6 = 162;
    goto LABEL_6;
  }
  v3 = *a1;
  result = *a1 << v2;
  if (result >> v2 != v3)
  {
    v5 = "((x.f << delta) >> delta) == x.f";
    v6 = 163;
LABEL_6:
    __assert_rtn("normalize_to", "to_chars.hpp", v6, v5);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(nlohmann::detail::dtoa_impl *this)
{
  int v1;
  unsigned int v2;
  _QWORD *v3;
  int v4;

  if ((int)this <= -1501)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  if ((int)this >= 1501)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v1 = 78913 * (-61 - (int)this) / 0x40000;
  if ((int)this < -61)
    ++v1;
  if (v1 <= -315)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v2 = (int)((v1 + 307 + (((__int16)(v1 + 307) >> 28) & 7)) << 16) >> 19;
  if (v2 >= 0x4F)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v3 = (_QWORD *)((char *)&nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(int)::kCachedPowers
                + 16 * (unsigned __int16)v2);
  v4 = v3[1] + (_DWORD)this;
  if (v4 <= -125)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  if (v4 >= -95)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  return *v3;
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::mul(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = HIDWORD(*a1);
  v3 = HIDWORD(*a2);
  v4 = v3 * (unint64_t)*a1;
  v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_digit_gen(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];

  v47[0] = a4;
  v47[1] = a5;
  v46[0] = a6;
  v46[1] = a7;
  v44 = a9;
  v45 = a10;
  if ((int)a10 <= -61)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  if ((int)a10 >= -31)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v13 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v47);
  v14 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v46);
  v15 = -(int)v45;
  v16 = v44 >> -(char)v45;
  if (!(_DWORD)v16)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v17 = v14;
  v18 = 1 << v15;
  v19 = (1 << v15) - 1;
  v20 = v19 & v44;
  if (v16 <= 0x3B9AC9FF)
  {
    if (v16 <= 0x5F5E0FF)
    {
      if (v16 <= 0x98967F)
      {
        if (v16 <= 0xF423F)
        {
          v23 = v16 >> 5;
          v24 = v16 >> 4;
          if (v16 <= 9)
            v25 = 1;
          else
            v25 = 10;
          if (v16 <= 9)
            v26 = 1;
          else
            v26 = 2;
          if (v16 <= 0x63)
            v27 = v26;
          else
            v27 = 3;
          if (v16 <= 0x63)
            v28 = v25;
          else
            v28 = 100;
          if (v16 <= 0x3E7)
            v29 = v27;
          else
            v29 = 4;
          if (v16 <= 0x3E7)
            v30 = v28;
          else
            v30 = 1000;
          if (v24 <= 0x270)
            v31 = v29;
          else
            v31 = 5;
          if (v24 <= 0x270)
            v32 = v30;
          else
            v32 = 10000;
          if (v23 <= 0xC34)
            v22 = v31;
          else
            v22 = 6;
          if (v23 > 0xC34)
            v21 = 100000;
          else
            v21 = v32;
        }
        else
        {
          v21 = 1000000;
          v22 = 7;
        }
      }
      else
      {
        v21 = 10000000;
        v22 = 8;
      }
    }
    else
    {
      v21 = 100000000;
      v22 = 9;
    }
  }
  else
  {
    v21 = 1000000000;
    v22 = 10;
  }
  v33 = v22 + 1;
  do
  {
    v34 = v16 / v21;
    if (v16 / v21 >= 0xA)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v16 = v16 % v21;
    v35 = (int)*a2;
    *a2 = v35 + 1;
    *(_BYTE *)(a1 + v35) = v34 + 48;
    if ((v16 << v15) + v20 <= v13)
    {
      *a3 = *a3 + v33 - 2;
      v18 = (unint64_t)v21 << v15;
      v40 = (char *)*a2;
      v41 = a1;
      v42 = v13;
      v20 += v16 << v15;
      return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
    }
    v21 /= 0xAu;
    --v33;
  }
  while (v33 > 1);
  if (v20 <= v13)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v36 = 0;
  do
  {
    if (v20 >= 0x199999999999999ALL)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v37 = (10 * v20) >> v15;
    if (v37 >= 0xA)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v38 = (int)*a2;
    *a2 = v38 + 1;
    *(_BYTE *)(a1 + v38) = v37 + 48;
    v39 = 5 * v13;
    v20 = (10 * v20) & v19;
    v13 *= 10;
    v17 *= 10;
    --v36;
  }
  while (v20 > 2 * v39);
  *a3 += v36;
  v40 = (char *)*a2;
  v41 = a1;
  v42 = v13;
  return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::sub(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t result;
  const char *v4;
  int v5;

  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8))
  {
    v4 = "x.e == y.e";
    v5 = 66;
LABEL_6:
    __assert_rtn("sub", "to_chars.hpp", v5, v4);
  }
  v2 = *(_QWORD *)a1 >= *(_QWORD *)a2;
  result = *(_QWORD *)a1 - *(_QWORD *)a2;
  if (!v2)
  {
    v4 = "x.f >= y.f";
    v5 = 67;
    goto LABEL_6;
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_round(uint64_t this, char *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;

  if ((int)a2 <= 0)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a3 > a4)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a4 < a5)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (!a6)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a5 < a3 && a4 - a5 >= a6)
  {
    v6 = ((_DWORD)a2 - 1);
    v7 = -(uint64_t)a5;
    v8 = a6 + a5;
    do
    {
      if (v8 >= a3 && a3 + v7 <= v8 - a3)
        break;
      v9 = *(unsigned __int8 *)(this + v6);
      if (v9 == 48)
        nlohmann::detail::dtoa_impl::grisu2_round();
      *(_BYTE *)(this + v6) = v9 - 1;
      if (v8 >= a3)
        break;
      v10 = a4 - a6 + v7;
      v7 -= a6;
      v8 += a6;
    }
    while (v10 >= a6);
  }
  return this;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0)
    operator delete(*(void **)(a1 + 608));
  return std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x23B7E7FF8](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x23B7E8004](v13);
  return a1;
}

void sub_235FB4060(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x23B7E8004](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x235FB4040);
}

void sub_235FB40A8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_235FB41DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_235FB4350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_235FB48A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_235FB516C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_235FB5320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void std::vector<BOOL>::push_back(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

void PerBucketClassification::~PerBucketClassification(PerBucketClassification *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
    operator delete(v2);
  v3 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v3;
    operator delete(v3);
  }
}

void beryllium::input_t::~input_t(void **this)
{
  void **v2;

  v2 = this + 3;
  std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void sub_235FB5B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t *a43,uint64_t a44,uint64_t a45,uint64_t *a46,uint64_t a47,void *__p,uint64_t a49,int a50,__int16 a51,char a52,char a53,void *a54,uint64_t a55,int a56,__int16 a57,char a58,char a59)
{
  void *v59;
  void *v60;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a43);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a46);
  std::ofstream::~ofstream(&STACK[0x280]);
  if (a53 < 0)
    operator delete(__p);
  if (a59 < 0)
    operator delete(a54);

  _Unwind_Resume(a1);
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[12],int &>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, int *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[12],int &>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FB5E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FB5FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],float>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FB6154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],float &>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FB62F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],ABUnavailabilityReason>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *v9;
  char v10;
  char v11;
  double result;
  nlohmann::detail::exception *exception;
  char *v14;
  std::string *v15;
  __int128 v16;
  _QWORD v17[5];
  std::string v18;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    *v8 = v8 + 1;
    *(_QWORD *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[21],ABUnavailabilityReason>(*(uint64_t ***)(a1 + 8), a2, a3);
  v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(_QWORD *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(_BYTE *)(a4 + 40) = v11;
  return result;
}

void sub_235FB649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

void sub_235FB6A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t **std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(uint64_t **result, int *a2)
{
  uint64_t v2;
  int v3;

  v2 = **result;
  v3 = *a2;
  if (!*(_BYTE *)(v2 + 4))
    *(_BYTE *)(v2 + 4) = 1;
  *(_DWORD *)v2 = v3;
  return result;
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  switch(*a2)
  {
    case 0:
      v3 = *(_QWORD *)(v2 + 8);
      *(_QWORD *)v3 = 1;
      *(_BYTE *)(v3 + 8) = 1;
      break;
    case 1:
      v4 = *(_QWORD *)(v2 + 8);
      v5 = 2;
      goto LABEL_5;
    case 2:
      v4 = *(_QWORD *)(v2 + 8);
      v5 = 3;
LABEL_5:
      *(_QWORD *)v4 = v5;
      *(_BYTE *)(v4 + 8) = 1;
      break;
    case 3:
      v6 = *(_QWORD *)(v2 + 8);
      if (*(_BYTE *)(v6 + 8))
        *(_BYTE *)(v6 + 8) = 0;
      ab_get_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(v7, v8, v9);

      break;
    default:
      return;
  }
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<BOOL>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<BOOL>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    v5 = *(void **)(i - 24);
    v4 = v5;
    if (v5)
      operator delete(v4);
  }
  a1[1] = v2;
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v10 = 0;
    v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = 0;
    v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_235FB6DB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

uint64_t std::vector<std::vector<BOOL>>::__push_back_slow_path<std::vector<BOOL> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  void *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[24 * v4];
  v16 = &v10[24 * v9];
  std::vector<BOOL>::vector(v14, a2);
  v15 = v14 + 24;
  std::vector<std::vector<BOOL>>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<std::vector<BOOL>>::~__split_buffer(&v13);
  return v11;
}

void sub_235FB70F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<BOOL>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<BOOL>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(_QWORD **)a2, 0, (_QWORD *)(*(_QWORD *)a2 + 8 * (*(_QWORD *)(a2 + 8) >> 6)), *(_QWORD *)(a2 + 8) & 0x3F, *(_QWORD *)(a2 + 8));
  }
  return a1;
}

{
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(_QWORD **)a2, 0, (_QWORD *)(*(_QWORD *)a2 + 8 * (*(_QWORD *)(a2 + 8) >> 6)), *(_QWORD *)(a2 + 8) & 0x3F, *(_QWORD *)(a2 + 8));
  }
  return a1;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(_QWORD *a1, _QWORD *a2, unint64_t a3, _QWORD *a4, int a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE v11[32];

  v6 = a1[1];
  v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41)
      v8 = (v7 - 1) >> 6;
    else
      v8 = 0;
    *(_QWORD *)(*a1 + 8 * v8) = 0;
  }
  v9 = *a1 + 8 * (v6 >> 6);
  v10 = v6 & 0x3F;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1@<X1>, unint64_t a2@<X2>, _QWORD *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;

  LODWORD(v6) = a2;
  v7 = *(uint64_t **)a5;
  v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || (_DWORD)a2 != a4)
  {
    do
    {
      v9 = 1 << v8;
      if (((*a1 >> a2) & 1) != 0)
        v10 = *v7 | v9;
      else
        v10 = *v7 & ~v9;
      *v7 = v10;
      v11 = (_DWORD)v6 == 63;
      v12 = v6 == 63;
      v6 = (a2 + 1);
      if (v11)
        v6 = 0;
      if (v8 == 63)
      {
        v8 = 0;
        *(_QWORD *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || (_DWORD)v6 != a4);
    a1 = a3;
  }
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 24) = v8;
}

uint64_t std::vector<std::vector<BOOL>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      v8 = *(a3 - 3);
      a3 -= 3;
      *(_QWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 16) = a3[1];
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>::operator()[abi:ne180100](uint64_t a1)
{
  void **v1;
  void **v2;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*v1)
      operator delete(*v1);
    v1 += 3;
  }
}

void **std::__split_buffer<std::vector<BOOL>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::vector<BOOL>>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::vector<BOOL>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  while (v1 != v2)
  {
    v5 = *(void **)(v1 - 24);
    v1 -= 24;
    v4 = v5;
    *(_QWORD *)(a1 + 16) = v1;
    if (v5)
    {
      operator delete(v4);
      v1 = *(_QWORD *)(a1 + 16);
    }
  }
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[12],int &>(uint64_t **a1, char *a2, int *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[12],int &>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB7508(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[12],int &>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, int *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[12],int &,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB7598(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[12],int &,0>(_QWORD *a1, char *a2, int *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  v6 = *a3;
  *((_BYTE *)v5 + 24) = 5;
  v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(uint64_t **a1, char *a2, float *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[20],float>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB7688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[20],float>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[20],float,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB7718(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[20],float,0>(_QWORD *a1, char *a2, float *a3)
{
  _QWORD *v5;
  double v6;
  uint64_t v7;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  v6 = *a3;
  *((_BYTE *)v5 + 24) = 7;
  v7 = (uint64_t)(v5 + 3);
  *((double *)v5 + 4) = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[21],ABUnavailabilityReason>(uint64_t **a1, char *a2, uint64_t *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[21],ABUnavailabilityReason>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  v5 = *v4;
  if (*v4)
  {
    v6 = __p;
    __p = 0;
    if (v6)
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_235FB780C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[21],ABUnavailabilityReason>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[21],ABUnavailabilityReason,0>(v8 + 4, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_235FB789C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[21],ABUnavailabilityReason,0>(_QWORD *a1, char *a2, uint64_t *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  v6 = *a3;
  *((_BYTE *)v5 + 24) = 5;
  v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t beryllium::process(beryllium *this, core_analytics_t *a2, core_analytics_t *a3)
{
  NSObject *log;
  uint64_t v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (algs_get_log())
  {
    log = algs_get_log();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "1.0.8.2";
      _os_log_impl(&dword_235FAB000, log, OS_LOG_TYPE_DEFAULT, "Beryllium Alg Version: %s", (uint8_t *)&v8, 0xCu);
    }
  }
  beryllium::BerylliumProcessor::BerylliumProcessor((beryllium::BerylliumProcessor *)&v8);
  v6 = beryllium::BerylliumProcessor::beryllium_process((beryllium::BerylliumProcessor *)&v8, this, a2);
  beryllium::BerylliumProcessor::~BerylliumProcessor((beryllium::BerylliumProcessor *)&v8);
  return v6;
}

void sub_235FB7A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  beryllium::BerylliumProcessor::~BerylliumProcessor((beryllium::BerylliumProcessor *)&a9);
  _Unwind_Resume(a1);
}

void beryllium::BerylliumProcessor::~BerylliumProcessor(beryllium::BerylliumProcessor *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)*((_QWORD *)this + 27);
  if (v2)
    operator delete(v2);
  v3 = (void *)*((_QWORD *)this + 24);
  if (v3)
    operator delete(v3);
  v4 = (void *)*((_QWORD *)this + 21);
  if (v4)
  {
    *((_QWORD *)this + 22) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 18);
  if (v5)
    operator delete(v5);
  v6 = (void *)*((_QWORD *)this + 15);
  if (v6)
  {
    *((_QWORD *)this + 16) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 12);
  if (v7)
    operator delete(v7);
  v8 = (void *)*((_QWORD *)this + 9);
  if (v8)
  {
    *((_QWORD *)this + 10) = v8;
    operator delete(v8);
  }
  v9 = (void *)*((_QWORD *)this + 6);
  if (v9)
    operator delete(v9);
  v10 = (void *)*((_QWORD *)this + 3);
  if (v10)
  {
    *((_QWORD *)this + 4) = v10;
    operator delete(v10);
  }
  v11 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v11;
    operator delete(v11);
  }
}

uint64_t algs_get_log()
{
  if (algs_get_log_onceToken != -1)
    dispatch_once(&algs_get_log_onceToken, &__block_literal_global_1);
  return algs_get_log_log;
}

os_log_t __algs_get_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Health.AFibBurden", "hid-algs-burden-computation");
  algs_get_log_log = (uint64_t)result;
  return result;
}

double beryllium::BerylliumProcessor::BerylliumProcessor(beryllium::BerylliumProcessor *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

unint64_t beryllium::BerylliumProcessor::check_input_validity(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a2) >> 3);
  v5 = a2[3];
  if (v4 == 0xAAAAAAAAAAAAAAABLL * ((a2[4] - v5) >> 3))
  {
    if (v3 == v2)
    {
      v6 = 0;
LABEL_12:
      v9 = 0;
    }
    else
    {
      if (v4 <= 1)
        v6 = 1;
      else
        v6 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a2) >> 3);
      v7 = (uint64_t *)(v5 + 8);
      v8 = (_QWORD *)(v2 + 8);
      v9 = 3;
      while (1)
      {
        v10 = *v7;
        v7 += 3;
        if (v10 != (uint64_t)(*v8 - *(v8 - 1)) >> 3)
          break;
        v8 += 3;
        if (!--v6)
          goto LABEL_12;
      }
      v6 = 0x100000000;
    }
  }
  else
  {
    v6 = 0x100000000;
    v9 = 3;
  }
  return v9 | v6;
}

uint64_t beryllium::BerylliumProcessor::check_min_tacho_condition(uint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  double **v12;
  int v13;
  uint64_t v14;
  double *v15;
  unsigned int v16;
  _QWORD *v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;

  v3 = beryllium::BerylliumProcessor::check_input_validity(a1, a2);
  if ((v3 & 0xFF00000000) != 0)
  {
    v4 = v3 & 0xFFFFFF00;
    v5 = v3;
LABEL_3:
    v6 = 0x100000000;
    return v5 | v6 | v4;
  }
  v8 = *a2;
  v4 = a2[1] - *a2;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_3;
  }
  v9 = 0;
  v10 = v4 / 24;
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  v12 = (double **)(v8 + 8);
  v13 = 1;
  v14 = v11;
  do
  {
    v15 = *(v12 - 1);
    if (*v12 != v15)
    {
      v9 += (unint64_t)((char *)*v12 - (char *)v15) >> 3;
      if (*(*v12 - 1) - *v15 > 14400.0)
        v13 = 0;
    }
    v12 += 3;
    --v14;
  }
  while (v14);
  v5 = v9 > 69;
  if (v9 < 70)
  {
    v4 = 0;
    goto LABEL_3;
  }
  v16 = 0;
  v17 = (_QWORD *)(v8 + 8);
  do
  {
    if (*v17 - *(v17 - 1) > 0x20uLL)
      ++v16;
    v17 += 3;
    --v11;
  }
  while (v11);
  v18 = v10 < 0x14;
  v19 = (v13 & v18) == 0;
  if ((v13 & v18) != 0)
    v20 = 0x100000000;
  else
    v20 = 0;
  if (v19)
    v5 = 0;
  else
    v5 = 2;
  if (v16 >= 5)
    v6 = v20;
  else
    v6 = 0x100000000;
  if (v16 < 5)
    v5 = 1;
  v4 = 0;
  return v5 | v6 | v4;
}

uint64_t beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, output_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  const double *v17;
  vDSP_Length v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  vDSP_Length *v27;
  vDSP_Length v28;
  vDSP_Length v29;
  unint64_t v30;
  unint64_t v31;
  double *v32;
  double *v33;
  double *v34;
  double *v35;
  double v36;
  double v37;
  double *v38;
  double v39;
  char *v40;
  int64_t v41;
  double *v42;
  double *v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  double *v50;
  char *v51;
  uint64_t v52;
  double *v53;
  double *v54;
  int v55;
  char v56;
  double v57;
  double *v58;
  double *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  double *v65;
  uint64_t v66;
  double *v67;
  unint64_t v68;
  unint64_t v69;
  void **v70;
  double v71;
  double v72;
  int v73;
  int v74;
  int v75;
  unint64_t v76;
  uint64_t v77;
  const void *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  NSObject *log;
  uint64_t v88;
  signed int v89;
  vDSP_Length v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  char v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  NSObject *v121;
  uint64_t v122;
  unint64_t v123;
  NSObject *v124;
  uint64_t v125;
  NSObject *v126;
  output_t *v128;
  void **v129;
  char *v130;
  _BYTE v131[16];
  void *__p;
  char *v133;
  char *v134;
  void *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  int v139;
  uint64_t v140;
  int v141;
  _BYTE buf[12];
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v135 = 0;
  v136 = 0;
  v137 = 0;
  __p = 0;
  v133 = 0;
  v134 = 0;
  v6 = beryllium::BerylliumProcessor::check_min_tacho_condition((uint64_t)this, (uint64_t *)a2);
  if ((v6 & 0xFF00000000) != 0)
  {
    v7 = v6 & 0xFFFFFF00;
    v8 = v6;
    v9 = 0x100000000;
    goto LABEL_137;
  }
  v10 = *(_QWORD *)a2;
  if (*((_QWORD *)a2 + 1) != *(_QWORD *)a2)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)this + 168, *((_QWORD *)this + 22), *(char **)(v10 + v11), *(char **)(v10 + v11 + 8), (uint64_t)(*(_QWORD *)(v10 + v11 + 8) - *(_QWORD *)(v10 + v11)) >> 3);
      v13 = *((_QWORD *)this + 25);
      v14 = *((_QWORD *)this + 24) + 8 * (v13 >> 6);
      v15 = v13 & 0x3F;
      v16 = *((_QWORD *)a2 + 3) + v11;
      std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>((uint64_t)this + 192, v14, v15, *(_QWORD **)v16, 0, (_QWORD *)(*(_QWORD *)v16 + 8 * (*(_QWORD *)(v16 + 8) >> 6)), *(_QWORD *)(v16 + 8) & 0x3F, *(_QWORD *)(v16 + 8), (uint64_t)buf);
      ++v12;
      v10 = *(_QWORD *)a2;
      v11 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3) > v12);
  }
  v17 = (const double *)*((_QWORD *)this + 22);
  if (v17 == *((const double **)this + 21))
  {
    v29 = 0;
  }
  else
  {
    v18 = 0;
    v19 = v133;
    do
    {
      if (v19 >= v134)
      {
        v21 = (char *)__p;
        v22 = (v19 - (_BYTE *)__p) >> 3;
        v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 61)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v24 = v134 - (_BYTE *)__p;
        if ((v134 - (_BYTE *)__p) >> 2 > v23)
          v23 = v24 >> 2;
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
          v25 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v25 = v23;
        if (v25)
        {
          v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v134, v25);
          v21 = (char *)__p;
          v19 = v133;
        }
        else
        {
          v26 = 0;
        }
        v27 = (vDSP_Length *)&v26[8 * v22];
        *v27 = v18;
        v20 = (char *)(v27 + 1);
        while (v19 != v21)
        {
          v28 = *((_QWORD *)v19 - 1);
          v19 -= 8;
          *--v27 = v28;
        }
        __p = v27;
        v133 = v20;
        v134 = &v26[8 * v25];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *(_QWORD *)v19 = v18;
        v20 = v19 + 8;
      }
      v133 = v20;
      ++v18;
      v17 = (const double *)*((_QWORD *)this + 21);
      v29 = (uint64_t)(*((_QWORD *)this + 22) - (_QWORD)v17) >> 3;
      v19 = v20;
    }
    while (v29 > v18);
  }
  vDSP_vsortiD(v17, (vDSP_Length *)__p, 0, v29, 1);
  vDSP_vsortD(*((double **)this + 21), (uint64_t)(*((_QWORD *)this + 22) - *((_QWORD *)this + 21)) >> 3, 1);
  if (*((_QWORD *)this + 25))
  {
    v30 = 0;
    do
    {
      buf[0] = (*(_QWORD *)(*((_QWORD *)this + 24) + ((*((_QWORD *)__p + v30) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> *((_QWORD *)__p + v30)) & 1;
      std::vector<BOOL>::push_back((uint64_t)this + 216, buf);
      ++v30;
    }
    while (v30 < *((_QWORD *)this + 25));
  }
  v31 = (uint64_t)(*((_QWORD *)this + 22) - *((_QWORD *)this + 21)) >> 3;
  *(_QWORD *)buf = 0;
  std::vector<double>::assign((char **)this, v31, buf);
  v32 = (double *)*((_QWORD *)this + 21);
  v33 = (double *)*((_QWORD *)this + 22);
  v34 = *(double **)this;
  if (v32 != v33)
  {
    v36 = *v32;
    v35 = v32 + 1;
    v37 = v36;
    *v34 = v36;
    if (v35 != v33)
    {
      v38 = v34 + 1;
      do
      {
        v39 = *v35++;
        *v38++ = v39 - v37;
        v37 = v39;
      }
      while (v35 != v33);
    }
  }
  v40 = (char *)*((_QWORD *)this + 1);
  v41 = v40 - (char *)(v34 + 1);
  if (v40 != (char *)(v34 + 1))
    memmove(v34, v34 + 1, v40 - (char *)(v34 + 1));
  *((_QWORD *)this + 1) = (char *)v34 + v41;
  v42 = (double *)v136;
  if (v136 >= v137)
  {
    v44 = (double *)v135;
    v45 = (v136 - (_BYTE *)v135) >> 3;
    v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v47 = v137 - (_BYTE *)v135;
    if ((v137 - (_BYTE *)v135) >> 2 > v46)
      v46 = v47 >> 2;
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
      v48 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v48 = v46;
    if (v48)
    {
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v137, v48);
      v44 = (double *)v135;
      v42 = (double *)v136;
    }
    else
    {
      v49 = 0;
    }
    v50 = (double *)&v49[8 * v45];
    v51 = &v49[8 * v48];
    *v50 = 0.0;
    v43 = v50 + 1;
    while (v42 != v44)
    {
      v52 = *((_QWORD *)v42-- - 1);
      *((_QWORD *)v50-- - 1) = v52;
    }
    v135 = v50;
    v136 = (char *)v43;
    v137 = v51;
    if (v44)
      operator delete(v44);
  }
  else
  {
    *(_QWORD *)v136 = 0;
    v43 = v42 + 1;
  }
  v128 = a3;
  v136 = (char *)v43;
  v53 = *(double **)this;
  v54 = (double *)*((_QWORD *)this + 1);
  if (*(double **)this != v54)
  {
    v55 = 0;
    v56 = 0;
    do
    {
      if (*v53 < 0.0)
        v56 = 1;
      if (*v53 > 14400.0)
      {
        v57 = (double)v55;
        if (v43 >= (double *)v137)
        {
          v59 = (double *)v135;
          v60 = ((char *)v43 - (_BYTE *)v135) >> 3;
          v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 61)
            std::vector<double>::__throw_length_error[abi:ne180100]();
          v62 = v137 - (_BYTE *)v135;
          if ((v137 - (_BYTE *)v135) >> 2 > v61)
            v61 = v62 >> 2;
          if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
            v63 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v63 = v61;
          if (v63)
          {
            v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v137, v63);
            v59 = (double *)v135;
            v43 = (double *)v136;
          }
          else
          {
            v64 = 0;
          }
          v65 = (double *)&v64[8 * v60];
          *v65 = v57;
          v58 = v65 + 1;
          while (v43 != v59)
          {
            v66 = *((_QWORD *)v43-- - 1);
            *((_QWORD *)v65-- - 1) = v66;
          }
          v135 = v65;
          v136 = (char *)v58;
          v137 = &v64[8 * v63];
          if (v59)
            operator delete(v59);
        }
        else
        {
          *v43 = v57;
          v58 = v43 + 1;
        }
        v136 = (char *)v58;
        v43 = v58;
      }
      ++v55;
      ++v53;
    }
    while (v53 != v54);
    if (v56)
    {
      v7 = 0;
      v9 = 0x100000000;
      v8 = 3;
      goto LABEL_137;
    }
  }
  v67 = (double *)v135;
  if (v43 != v135)
  {
    v68 = 0;
    v69 = ((char *)v43 - (_BYTE *)v135) >> 3;
    v70 = (void **)((char *)this + 24);
    v129 = (void **)((char *)this + 144);
    v130 = (char *)this + 120;
    do
    {
      *((_QWORD *)this + 4) = *((_QWORD *)this + 3);
      *((_QWORD *)this + 7) = 0;
      if (v69 - 1 <= v68)
      {
        v71 = (double)(int)(((*((_QWORD *)this + 22) - *((_QWORD *)this + 21)) >> 3) - 1);
        if (!v68)
        {
LABEL_83:
          v72 = *v67;
          goto LABEL_84;
        }
      }
      else
      {
        v71 = v67[v68 + 1];
        if (!v68)
          goto LABEL_83;
      }
      v72 = v67[v68] + 1.0;
LABEL_84:
      v73 = (int)v71;
      v74 = (int)v72;
      v75 = (int)v71 + 1;
      v76 = v75 - (int)v72;
      *(_QWORD *)buf = 0;
      std::vector<double>::assign((char **)this + 3, v76, buf);
      buf[0] = 0;
      std::vector<BOOL>::assign((uint64_t)this + 48, v76, buf);
      v77 = *((_QWORD *)this + 21);
      v78 = (const void *)(v77 + 8 * v74);
      v79 = v77 + 8 * v73 + 8;
      if ((const void *)v79 != v78)
        memmove(*v70, v78, v79 - (_QWORD)v78);
      v80 = *((_QWORD *)this + 27);
      v81 = (unint64_t)v74 >> 6;
      if (v74 < 0)
        v81 = -(uint64_t)((63 - v74) >> 6);
      v82 = v80 + 8 * v81;
      v83 = (unint64_t)v73 >> 6;
      if (v73 < 0)
        v83 = -(uint64_t)((63 - v73) >> 6);
      v84 = v80 + 8 * v83 + 8 * (((v73 & 0x3Fu) + 1) >> 6);
      v85 = *((_QWORD *)this + 6);
      *(_QWORD *)buf = v82;
      if ((v74 & 0x3F) != 0)
      {
        *(_DWORD *)&buf[8] = v74 & 0x3F;
        v140 = v84;
        v141 = v75 & 0x3F;
        v138 = v85;
        v139 = 0;
        std::__copy_unaligned[abi:ne180100]<std::vector<BOOL>,false>((unsigned int *)buf, (uint64_t)&v140, (uint64_t)&v138, (uint64_t)v131);
      }
      else
      {
        *(_DWORD *)&buf[8] = 0;
        v140 = v84;
        v141 = v75 & 0x3F;
        v138 = v85;
        v139 = 0;
        std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,false>(buf, &v140, (uint64_t)&v138, (uint64_t)v131);
      }
      if (algs_get_log() && *((_QWORD *)this + 4) != *((_QWORD *)this + 3))
      {
        v86 = 0;
        do
        {
          log = algs_get_log();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v88 = *((_QWORD *)*v70 + v86);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v88;
            _os_log_debug_impl(&dword_235FAB000, log, OS_LOG_TYPE_DEBUG, "\nPre-Interpolation Trigger Time: %f", buf, 0xCu);
          }
          ++v86;
        }
        while (v86 < (uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 3);
      }
      if (*((_QWORD *)this + 7) == 1)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)this + 72, *((char **)this + 3), *((_QWORD *)this + 4), (uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 3);
        std::vector<BOOL>::operator=((void **)this + 12, (uint64_t)this + 48);
      }
      else
      {
        v89 = vcvtpd_s64_f64((*(double *)(*((_QWORD *)this + 4) - 8) - **((double **)this + 3)) / 600.0);
        *(_QWORD *)buf = 0x4082C00000000000;
        v90 = v89;
        v140 = 0;
        std::vector<double>::assign((char **)this + 9, v89, &v140);
        vDSP_vrampD((const double *)*v70, (const double *)buf, *((double **)this + 9), 1, v90);
        LOBYTE(v140) = 0;
        std::vector<BOOL>::assign((uint64_t)this + 96, v90, &v140);
        v91 = *((_QWORD *)this + 9);
        v92 = *((_QWORD *)this + 10);
        v93 = v92 - v91;
        if (v92 != v91)
        {
          v94 = 0;
          v95 = v93 >> 3;
          v96 = *((_QWORD *)this + 3);
          v97 = *((_QWORD *)this + 4) - v96;
          v98 = 2;
          if ((unint64_t)(v97 >> 3) > 2)
            v98 = v97 >> 3;
          if (v95 <= 1)
            v95 = 1;
          v99 = v98 - 1;
          do
          {
            if ((unint64_t)v97 >= 9)
            {
              v100 = 0;
              v101 = *(double *)(v91 + 8 * v94);
              while (1)
              {
                v102 = *(double *)(v96 + 8 + 8 * v100);
                if (v102 > v101)
                  break;
                if (v99 == ++v100)
                  goto LABEL_118;
              }
              if (vabdd_f64(v101, v102) < vabdd_f64(v101, *(double *)(v96 + 8 * (int)v100)))
                LODWORD(v100) = v100 + 1;
              v103 = v100;
              v104 = ((unint64_t)(int)v100 >> 3) & 0x1FFFFFFFFFFFFFF8;
              v105 = *((_QWORD *)this + 12);
              v106 = v94 >> 6;
              v107 = 1 << v94;
              if (((*(_QWORD *)(*((_QWORD *)this + 6) + v104) >> v103) & 1) != 0)
                v108 = *(_QWORD *)(v105 + 8 * v106) | v107;
              else
                v108 = *(_QWORD *)(v105 + 8 * v106) & ~v107;
              *(_QWORD *)(v105 + 8 * v106) = v108;
            }
LABEL_118:
            ++v94;
          }
          while (v94 != v95);
        }
      }
      v109 = *((_QWORD *)this + 16);
      if (v109 == *((_QWORD *)this + 15))
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v130, *((char **)this + 9), *((_QWORD *)this + 10), (uint64_t)(*((_QWORD *)this + 10) - *((_QWORD *)this + 9)) >> 3);
        std::vector<BOOL>::operator=(v129, (uint64_t)this + 96);
      }
      else
      {
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)v130, v109, *((char **)this + 9), *((char **)this + 10), (uint64_t)(*((_QWORD *)this + 10) - *((_QWORD *)this + 9)) >> 3);
        v110 = *((_QWORD *)this + 19);
        v111 = *((_QWORD *)this + 18) + 8 * (v110 >> 6);
        v112 = *((_QWORD *)this + 13);
        v113 = *((_QWORD *)this + 12) + 8 * (v112 >> 6);
        *(_QWORD *)buf = *((_QWORD *)this + 12);
        *(_DWORD *)&buf[8] = 0;
        v140 = v113;
        v141 = v112 & 0x3F;
        std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)v129, v111, v110 & 0x3F, (uint64_t)buf, (uint64_t)&v140, v112, (uint64_t)&v138);
      }
      ++v68;
      v67 = (double *)v135;
      v69 = (v136 - (_BYTE *)v135) >> 3;
    }
    while (v69 > v68);
  }
  v114 = *((_QWORD *)this + 18);
  v115 = *((_QWORD *)this + 19);
  LODWORD(v138) = 1;
  *(_QWORD *)buf = v114;
  *(_DWORD *)&buf[8] = 0;
  v140 = v114 + 8 * (v115 >> 6);
  v141 = v115 & 0x3F;
  v128->Afib_burden = (float)((float)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)buf, (uint64_t)&v140, &v138)/ (float)*((unint64_t *)this + 19))* 100.0;
  v116 = *((_QWORD *)this + 27);
  v117 = *((_QWORD *)this + 28);
  LODWORD(v138) = 1;
  *(_QWORD *)buf = v116;
  *(_DWORD *)&buf[8] = 0;
  v140 = v116 + 8 * (v117 >> 6);
  v141 = v117 & 0x3F;
  v118 = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)buf, (uint64_t)&v140, &v138);
  v119 = *((_QWORD *)this + 28);
  if (algs_get_log())
  {
    if (*((_QWORD *)this + 16) != *((_QWORD *)this + 15))
    {
      v120 = 0;
      do
      {
        v121 = algs_get_log();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          v122 = *(_QWORD *)(*((_QWORD *)this + 15) + 8 * v120);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v122;
          _os_log_debug_impl(&dword_235FAB000, v121, OS_LOG_TYPE_DEBUG, "\nInterpolated Trigger Time: %f", buf, 0xCu);
        }
        ++v120;
      }
      while (v120 < (uint64_t)(*((_QWORD *)this + 16) - *((_QWORD *)this + 15)) >> 3);
    }
    if (*((_QWORD *)this + 19))
    {
      v123 = 0;
      do
      {
        v124 = algs_get_log();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
        {
          v125 = (*(_QWORD *)(*((_QWORD *)this + 18) + ((v123 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v123) & 1;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v125;
          _os_log_debug_impl(&dword_235FAB000, v124, OS_LOG_TYPE_DEBUG, "\nInterpolated Classification: %u", buf, 8u);
        }
        ++v123;
      }
      while (*((_QWORD *)this + 19) > v123);
    }
    v126 = algs_get_log();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
      beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(v126, (float)((float)v118 / (float)v119) * 100.0);
  }
  v9 = 0;
  v8 = 0;
  v7 = 0;
LABEL_137:
  if (__p)
  {
    v133 = (char *)__p;
    operator delete(__p);
  }
  if (v135)
  {
    v136 = (char *)v135;
    operator delete(v135);
  }
  return v8 | v9 | v7;
}

void sub_235FB88A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::assign(char **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 3)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 3;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 3;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_QWORD *)v16 = *a3;
        v16 += 8;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[8 * a2];
    }
    else
    {
      v17 = &v13[8 * (a2 - v14)];
      v18 = 8 * a2 - 8 * v14;
      do
      {
        *(_QWORD *)v13 = *a3;
        v13 += 8;
        v18 -= 8;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v8 = v6 >> 2;
    if (v6 >> 2 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8)
      v9 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<double>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[8 * a2];
    v12 = 8 * a2;
    do
    {
      *(_QWORD *)v10 = *a3;
      v10 += 8;
      v12 -= 8;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void std::vector<BOOL>::assign(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  char *v14;
  __int128 v15;

  *(_QWORD *)(a1 + 8) = 0;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 16);
    v7 = v6 << 6;
    if (v6 << 6 >= a2)
    {
      *(_QWORD *)(a1 + 8) = a2;
    }
    else
    {
      v14 = 0;
      v15 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v8 = v6 << 7;
      if (v8 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0))
        v8 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v7 <= 0x3FFFFFFFFFFFFFFELL)
        v9 = v8;
      else
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      std::vector<BOOL>::reserve(&v14, v9);
      v11 = v14;
      v12 = *((_QWORD *)&v15 + 1);
      v14 = *(char **)a1;
      v10 = v14;
      v13 = *(_OWORD *)(a1 + 8);
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = a2;
      *(_QWORD *)(a1 + 16) = v12;
      v15 = v13;
      if (v10)
        operator delete(v10);
    }
    if (*a3)
    {
      v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v14, a2);
    }
    else
    {
      v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v14, a2);
    }
  }
}

void sub_235FB8BE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void **std::vector<BOOL>::operator=(void **a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;

  if (a1 != (void **)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    if (v4)
    {
      if (v4 > (_QWORD)a1[2] << 6)
      {
        v5 = *a1;
        if (*a1)
        {
          operator delete(v5);
          *a1 = 0;
          a1[1] = 0;
          a1[2] = 0;
          v4 = *(_QWORD *)(a2 + 8);
        }
        std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
        v4 = *(_QWORD *)(a2 + 8);
      }
      memmove(*a1, *(const void **)a2, (((v4 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8) + 8);
      v6 = *(void **)(a2 + 8);
    }
    else
    {
      v6 = 0;
    }
    a1[1] = v6;
  }
  return a1;
}

void beryllium::BerylliumProcessor::calculateAFdensity(uint64_t a1, double **a2, _QWORD *a3)
{
  char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  long double v12;
  double v13;
  double v14;
  unint64_t v15;
  char *v16;
  double *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  double *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  double *v28;
  const double *v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  int v40;
  unint64_t v41;
  double v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  double *v50;
  uint64_t v51;
  double *v52;
  char *v53;
  _BYTE *v54;
  double *v55;
  double v56;
  uint64_t v57;
  void *v58;
  _BYTE *v59;
  double v60;
  double v61;
  double __B;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  char *v67;
  char *v68;
  double *v69;
  double *v70;
  uint64_t v71;
  void *__p;
  char *v73;
  char *v74;
  double *__A;
  double *v76;
  uint64_t v77;
  double *__C;
  double *v79;
  uint64_t v80;
  double *v81;
  double *v82;
  uint64_t v83;
  double v84;
  int v85;

  v81 = 0;
  v82 = 0;
  v83 = 0;
  __C = 0;
  v79 = 0;
  v80 = 0;
  __A = 0;
  v76 = 0;
  v77 = 0;
  __p = 0;
  v73 = 0;
  v74 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v6 = *(char **)(a1 + 216);
  *(_QWORD *)&v7 = &v6[8 * (*(_QWORD *)(a1 + 224) >> 6)];
  v8 = *(_QWORD *)(a1 + 224) & 0x3FLL;
  LODWORD(__B) = 1;
  v58 = v6;
  LODWORD(v59) = 0;
  v84 = v7;
  v85 = v8;
  v9 = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)&v58, (uint64_t)&v84, &__B);
  v10 = *(_QWORD *)(a1 + 224);
  v11 = *(a2[1] - 1) - **a2;
  v12 = fmod(v11, 600.0);
  v13 = ceil(v11 / 600.0);
  if (v12 == 0.0)
    v14 = v11 / 600.0 + 1.0;
  else
    v14 = v13;
  __B = 600.0;
  v15 = (int)v14;
  v58 = 0;
  std::vector<double>::assign((char **)&v81, v15, &v58);
  v58 = 0;
  std::vector<double>::assign((char **)&__C, v15, &v58);
  v58 = 0;
  std::vector<double>::assign((char **)&__A, v15, &v58);
  vDSP_vrampD(*a2, &__B, v81, 1, v15);
  v61 = 0.0;
  v61 = **a2;
  vDSP_vsubD(&v61, 0, v81, 1, __C, 1, v82 - v81);
  v60 = 0.0;
  v60 = *(a2[1] - 1) - **a2;
  vDSP_vsdivD(__C, 1, &v60, __A, 1, v79 - __C);
  v79 = __C;
  v16 = v73;
  if (v73 >= v74)
  {
    v18 = (char *)__p;
    v19 = (v73 - (_BYTE *)__p) >> 3;
    v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v21 = v74 - (_BYTE *)__p;
    if ((v74 - (_BYTE *)__p) >> 2 > v20)
      v20 = v21 >> 2;
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
      v22 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v22 = v20;
    if (v22)
    {
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v74, v22);
      v18 = (char *)__p;
      v16 = v73;
    }
    else
    {
      v23 = 0;
    }
    v24 = (double *)&v23[8 * v19];
    v25 = &v23[8 * v22];
    *v24 = 0.0;
    v17 = v24 + 1;
    while (v16 != v18)
    {
      v26 = *((_QWORD *)v16 - 1);
      v16 -= 8;
      *((_QWORD *)v24-- - 1) = v26;
    }
    __p = v24;
    v73 = (char *)v17;
    v74 = v25;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *(_QWORD *)v73 = 0;
    v17 = (double *)(v16 + 8);
  }
  v73 = (char *)v17;
  if ((unint64_t)((char *)v82 - (char *)v81) >= 9)
  {
    v27 = 1;
    do
    {
      v67 = (char *)v66;
      v64 = 0;
      v29 = *a2;
      v28 = a2[1];
      if (v28 == *a2)
      {
        v41 = 0;
      }
      else
      {
        v30 = 0;
        do
        {
          if (v29[v30] < v81[v27])
          {
            v31 = v67;
            if (v67 >= v68)
            {
              v33 = (char *)v66;
              v34 = (v67 - (_BYTE *)v66) >> 2;
              v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) >> 62)
                std::vector<double>::__throw_length_error[abi:ne180100]();
              v36 = v68 - (_BYTE *)v66;
              if ((v68 - (_BYTE *)v66) >> 1 > v35)
                v35 = v36 >> 1;
              if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
                v37 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v37 = v35;
              if (v37)
              {
                v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v68, v37);
                v33 = (char *)v66;
                v31 = v67;
              }
              else
              {
                v38 = 0;
              }
              v39 = &v38[4 * v34];
              *(_DWORD *)v39 = v30;
              v32 = v39 + 4;
              while (v31 != v33)
              {
                v40 = *((_DWORD *)v31 - 1);
                v31 -= 4;
                *((_DWORD *)v39 - 1) = v40;
                v39 -= 4;
              }
              v66 = v39;
              v67 = v32;
              v68 = &v38[4 * v37];
              if (v33)
                operator delete(v33);
            }
            else
            {
              *(_DWORD *)v67 = v30;
              v32 = v31 + 4;
            }
            v67 = v32;
            LOBYTE(v58) = (*(_QWORD *)(*a3 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v30) & 1;
            std::vector<BOOL>::push_back((uint64_t)&v63, &v58);
            v29 = *a2;
            v28 = a2[1];
          }
          ++v30;
        }
        while (v30 < v28 - v29);
        v41 = v64;
      }
      LODWORD(v57) = 1;
      v58 = v63;
      LODWORD(v59) = 0;
      *(_QWORD *)&v84 = (char *)v63 + 8 * (v41 >> 6);
      v85 = v41 & 0x3F;
      v42 = 1.0
          / (float)((float)v9 / (float)v10)
          * (double)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)&v58, (uint64_t)&v84, &v57)/ (double)(unint64_t)a3[1];
      v43 = v73;
      if (v73 >= v74)
      {
        v44 = (char *)__p;
        v45 = (v73 - (_BYTE *)__p) >> 3;
        v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 61)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v47 = v74 - (_BYTE *)__p;
        if ((v74 - (_BYTE *)__p) >> 2 > v46)
          v46 = v47 >> 2;
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
          v48 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v48 = v46;
        if (v48)
        {
          v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v74, v48);
          v44 = (char *)__p;
          v43 = v73;
        }
        else
        {
          v49 = 0;
        }
        v50 = (double *)&v49[8 * v45];
        *v50 = v42;
        v17 = v50 + 1;
        while (v43 != v44)
        {
          v51 = *((_QWORD *)v43 - 1);
          v43 -= 8;
          *((_QWORD *)v50-- - 1) = v51;
        }
        __p = v50;
        v73 = (char *)v17;
        v74 = &v49[8 * v48];
        if (v44)
          operator delete(v44);
      }
      else
      {
        *(double *)v73 = v42;
        v17 = (double *)(v43 + 8);
      }
      v73 = (char *)v17;
      ++v27;
    }
    while (v27 < v82 - v81);
  }
  vDSP_vsubD((const double *)__p, 1, __A, 1, (double *)__p, 1, ((char *)v17 - (_BYTE *)__p) >> 3);
  std::vector<double>::vector(&v58, (v73 - (_BYTE *)__p) >> 3);
  v52 = (double *)__p;
  v53 = v73;
  v54 = v58;
  if (__p != v73)
  {
    v55 = (double *)v58;
    do
    {
      v56 = *v52++;
      *v55++ = fabs(v56);
    }
    while (v52 != (double *)v53);
  }
  v84 = 0.0;
  v84 = __A[1] - *__A;
  v57 = 0;
  std::vector<double>::assign((char **)&v69, (v59 - v54) >> 3, &v57);
  vDSP_vtrapzD((const double *)v58, 1, &v84, v69, 1, (v59 - (_BYTE *)v58) >> 3);
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (v63)
    operator delete(v63);
  if (v66)
  {
    v67 = (char *)v66;
    operator delete(v66);
  }
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  if (__p)
  {
    v73 = (char *)__p;
    operator delete(__p);
  }
  if (__A)
  {
    v76 = __A;
    operator delete(__A);
  }
  if (__C)
  {
    v79 = __C;
    operator delete(__C);
  }
  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }
}

void sub_235FB92FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32)
{
  uint64_t v32;
  void *v34;

  if (__p)
    operator delete(__p);
  if (a19)
    operator delete(a19);
  if (a22)
    operator delete(a22);
  if (a25)
    operator delete(a25);
  if (a28)
    operator delete(a28);
  if (a31)
    operator delete(a31);
  v34 = *(void **)(v32 - 168);
  if (v34)
  {
    *(_QWORD *)(v32 - 160) = v34;
    operator delete(v34);
  }
  _Unwind_Resume(exception_object);
}

float beryllium::BerylliumProcessor::TachAFdensity(double **this, const beryllium::input_t *a2, const output_t *a3)
{
  float v3;
  double *v6;
  double *v7;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  int v18;
  char **v19;
  char *v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  int v31;
  char *v32;
  char *v33;
  unint64_t v34;
  double v35;
  char *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  float v40;
  void *v41[3];
  double v42;
  double *__C;
  double *v44;
  uint64_t v45;
  void *v46;
  char *v47;
  char *v48;
  double *v49;
  void *__dst;
  uint64_t v51;
  void *__p;
  _BYTE *v53;
  uint64_t v54;

  __p = 0;
  v53 = 0;
  v54 = 0;
  v49 = 0;
  __dst = 0;
  v51 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  if (a3->Afib_burden < 2.0)
  {
    v3 = -1.0;
    goto LABEL_4;
  }
  v3 = 1.0;
  if (a3->Afib_burden <= 95.0)
  {
    v6 = *this;
    v7 = this[1];
    if (*this == v7)
    {
      v8 = 0;
      v20 = 0;
      v19 = (char **)(this + 21);
      v21 = ((unint64_t)((char *)this[22] - (char *)this[21]) >> 3) - 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      do
      {
        if (*v6 > 14400.0)
        {
          if (v8 >= v48)
          {
            v11 = (char *)v46;
            v12 = (v8 - (_BYTE *)v46) >> 2;
            v13 = v12 + 1;
            if ((unint64_t)(v12 + 1) >> 62)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v14 = v48 - (_BYTE *)v46;
            if ((v48 - (_BYTE *)v46) >> 1 > v13)
              v13 = v14 >> 1;
            if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
              v15 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v15 = v13;
            if (v15)
            {
              v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v48, v15);
              v11 = (char *)v46;
              v8 = v47;
            }
            else
            {
              v16 = 0;
            }
            v17 = &v16[4 * v12];
            *(_DWORD *)v17 = v9;
            v10 = v17 + 4;
            while (v8 != v11)
            {
              v18 = *((_DWORD *)v8 - 1);
              v8 -= 4;
              *((_DWORD *)v17 - 1) = v18;
              v17 -= 4;
            }
            v46 = v17;
            v47 = v10;
            v48 = &v16[4 * v15];
            if (v11)
              operator delete(v11);
          }
          else
          {
            *(_DWORD *)v8 = v9;
            v10 = v8 + 4;
          }
          v47 = v10;
          v8 = v10;
        }
        ++v9;
        ++v6;
      }
      while (v6 != v7);
      v19 = (char **)(this + 21);
      v20 = v48;
      v21 = ((unint64_t)((char *)this[22] - (char *)this[21]) >> 3) - 1;
      if (v8 < v48)
      {
        *(_DWORD *)v8 = v21;
        v22 = v8 + 4;
LABEL_46:
        v47 = v22;
        v32 = &(*v19)[8 * *(int *)v46 + 8];
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v49, (uint64_t)__dst, *v19, v32, (v32 - *v19) >> 3);
        v33 = (char *)v46;
        if (v22 - (_BYTE *)v46 != 4)
        {
          v34 = 0;
          do
          {
            v35 = *((double *)__dst - 1);
            v36 = &v33[4 * v34];
            v37 = (uint64_t)&(*v19)[8 * *(int *)v36];
            v38 = *(double *)(v37 + 8);
            v39 = (uint64_t)&(*v19)[8 * *((int *)v36 + 1) + 8];
            __C = 0;
            v44 = 0;
            v45 = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(&__C, (const void *)(v37 + 8), v39, (v39 - (v37 + 8)) >> 3);
            v42 = v35 + 600.0 - v38;
            std::vector<double>::assign((char **)&__p, v44 - __C, &v42);
            vDSP_vaddD(__C, 1, (const double *)__p, 1, __C, 1, (v53 - (_BYTE *)__p) >> 3);
            std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v49, (uint64_t)__dst, (char *)__C, (char *)v44, v44 - __C);
            if (__C)
            {
              v44 = __C;
              operator delete(__C);
            }
            ++v34;
            v33 = (char *)v46;
          }
          while (((v47 - (_BYTE *)v46) >> 2) - 1 > v34);
        }
        __C = *(double **)v49;
        vDSP_vsubD((const double *)&__C, 0, v49, 1, v49, 1, ((_BYTE *)__dst - (_BYTE *)v49) >> 3);
        std::vector<BOOL>::vector(v41, (uint64_t)(this + 27));
        beryllium::BerylliumProcessor::calculateAFdensity((uint64_t)this, &v49, v41);
        v3 = v40;
        if (v41[0])
          operator delete(v41[0]);
        if (v46)
        {
          v47 = (char *)v46;
          operator delete(v46);
        }
        goto LABEL_55;
      }
    }
    v23 = (char *)v46;
    v24 = (v8 - (_BYTE *)v46) >> 2;
    v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v26 = v20 - (_BYTE *)v46;
    if (v26 >> 1 > v25)
      v25 = v26 >> 1;
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
      v27 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v27 = v25;
    if (v27)
    {
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v48, v27);
      v23 = (char *)v46;
      v8 = v47;
    }
    else
    {
      v28 = 0;
    }
    v29 = &v28[4 * v24];
    v30 = &v28[4 * v27];
    *(_DWORD *)v29 = v21;
    v22 = v29 + 4;
    while (v8 != v23)
    {
      v31 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v29 - 1) = v31;
      v29 -= 4;
    }
    v46 = v29;
    v47 = v22;
    v48 = v30;
    if (v23)
      operator delete(v23);
    goto LABEL_46;
  }
LABEL_55:
  if (v49)
  {
    __dst = v49;
    operator delete(v49);
  }
LABEL_4:
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  return v3;
}

void sub_235FB97D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  if (a22)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

float beryllium::BerylliumProcessor::median(beryllium::BerylliumProcessor *this, double *a2, int a3)
{
  char v4;
  uint64_t v5;
  double v6;
  double *v7;
  double *v8;
  unint64_t v9;
  unint64_t v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  unint64_t v15;
  double *v16;
  void *__p;
  double *v19;
  uint64_t v20;

  if (a3 <= 0)
    beryllium::BerylliumProcessor::median();
  if (!a2)
    beryllium::BerylliumProcessor::median();
  v4 = a3;
  __p = 0;
  v19 = 0;
  v5 = a3;
  v20 = 0;
  std::vector<double>::reserve(&__p, a3);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,double const*,double const*,std::back_insert_iterator<std::vector<double>>,0>(a2, &a2[v5], (uint64_t)&__p);
  v7 = (double *)__p;
  v8 = v19;
  v9 = ((char *)v19 - (_BYTE *)__p) >> 3;
  if ((v4 & 1) != 0)
  {
    v15 = (4 * v9 - 4) & 0xFFFFFFFFFFFFFFF8;
    v16 = (double *)((char *)__p + v15);
    if ((char *)__p + v15 != (char *)v19)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)((char *)__p + v15), v19, v6);
    v14 = *v16;
  }
  else
  {
    v10 = v9 >> 1;
    v11 = (double *)((char *)__p + 8 * v10 - 8);
    if (v11 != v19)
    {
      v6 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)__p + v10 - 1, v19, v6);
      v7 = (double *)__p;
      v8 = v19;
      v10 = (unint64_t)(((char *)v19 - (_BYTE *)__p) >> 3) >> 1;
    }
    v12 = *v11;
    v13 = &v7[v10];
    if (v13 != v8)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v7, &v7[v10], v8, v6);
    v14 = (v12 + *v13) * 0.5;
  }
  if (__p)
  {
    v19 = (double *)__p;
    operator delete(__p);
  }
  return v14;
}

void sub_235FB9978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

float beryllium::BerylliumProcessor::calc_tacho_times_diff_median(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  double *v8;
  char *v9;
  double *v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  float v15;
  uint64_t v17;
  void *__p;
  char *v19;
  uint64_t v20;
  void *v21;
  void *__dst;
  uint64_t v23;

  v21 = 0;
  __dst = 0;
  v23 = 0;
  __p = 0;
  v19 = 0;
  v20 = 0;
  v2 = *(_QWORD *)a2;
  if (*((_QWORD *)a2 + 1) == *(_QWORD *)a2)
    goto LABEL_13;
  v4 = 0;
  do
  {
    v5 = *(_QWORD *)(v2 + 24 * v4 + 8) - *(_QWORD *)(v2 + 24 * v4);
    if (v5)
    {
      v17 = 0;
      this = (beryllium::BerylliumProcessor *)std::vector<double>::assign((char **)&__p, v5 >> 3, &v17);
      v2 = *(_QWORD *)a2;
      v6 = *(_QWORD *)a2 + 24 * v4;
      v7 = *(double **)v6;
      v8 = *(double **)(v6 + 8);
      v9 = (char *)__p;
      if (v7 != v8)
      {
        v11 = *v7;
        v10 = v7 + 1;
        v12 = v11;
        *(double *)__p = v11;
        if (v10 != v8)
        {
          v13 = (double *)(v9 + 8);
          do
          {
            v14 = *v10++;
            *v13++ = v14 - v12;
            v12 = v14;
          }
          while (v10 != v8);
        }
      }
      if (v19 != v9)
      {
        this = (beryllium::BerylliumProcessor *)std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v21, (uint64_t)__dst, v9 + 8, v19, (v19 - (v9 + 8)) >> 3);
        v2 = *(_QWORD *)a2;
      }
    }
    ++v4;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a2 + 1) - v2) >> 3) > v4);
  if (__dst == v21)
LABEL_13:
    v15 = -1.0;
  else
    v15 = beryllium::BerylliumProcessor::median(this, (double *)v21, (unint64_t)((_BYTE *)__dst - (_BYTE *)v21) >> 3);
  if (__p)
  {
    v19 = (char *)__p;
    operator delete(__p);
  }
  if (v21)
  {
    __dst = v21;
    operator delete(v21);
  }
  return v15;
}

void sub_235FB9B84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(exception_object);
}

void beryllium::BerylliumProcessor::calc_timezone_shift(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, core_analytics_t *a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  double *v31;
  char *v32;
  double *v33;
  double v34;
  double *v35;
  double v36;
  const double *v37;
  int64_t v38;
  char *v39;
  double v40;
  double v41;
  double *v42;
  double v43;
  double v44;
  uint64_t v45;
  double __C;
  void *__dst;
  char *v48;
  uint64_t v49;
  void *__p;
  char *v51;
  char *v52;

  __p = 0;
  v51 = 0;
  v52 = 0;
  __dst = 0;
  v48 = 0;
  v49 = 0;
  __C = 0.0;
  v5 = *(_QWORD *)(*(_QWORD *)a2 + 8);
  v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, 1uLL);
  *(_QWORD *)v6 = *(_QWORD *)(v5 - 8);
  v8 = v6 + 8;
  __p = v6;
  v52 = &v6[8 * v7];
  v51 = v6 + 8;
  v9 = *(_QWORD *)a2;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3) >= 2)
  {
    v10 = 1;
    do
    {
      v11 = *(_QWORD **)(v9 + 24 * v10);
      v12 = v52;
      if (v8 >= v52)
      {
        v14 = (char *)__p;
        v15 = (v8 - (_BYTE *)__p) >> 3;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61)
          goto LABEL_54;
        v17 = v52 - (_BYTE *)__p;
        if ((v52 - (_BYTE *)__p) >> 2 > v16)
          v16 = v17 >> 2;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        if (v18)
        {
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, v18);
          v14 = (char *)__p;
          v8 = v51;
        }
        else
        {
          v19 = 0;
        }
        v20 = &v19[8 * v15];
        *(_QWORD *)v20 = *v11;
        v13 = v20 + 8;
        while (v8 != v14)
        {
          v21 = *((_QWORD *)v8 - 1);
          v8 -= 8;
          *((_QWORD *)v20 - 1) = v21;
          v20 -= 8;
        }
        v12 = &v19[8 * v18];
        __p = v20;
        v51 = v13;
        v52 = v12;
        if (v14)
        {
          operator delete(v14);
          v12 = v52;
        }
      }
      else
      {
        *(_QWORD *)v8 = *v11;
        v13 = v8 + 8;
      }
      v51 = v13;
      v22 = *(_QWORD *)(*(_QWORD *)a2 + 24 * v10 + 8);
      if (v13 >= v12)
      {
        v23 = (char *)__p;
        v24 = (v13 - (_BYTE *)__p) >> 3;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61)
LABEL_54:
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v26 = v12 - (_BYTE *)__p;
        if (v26 >> 2 > v25)
          v25 = v26 >> 2;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
          v27 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, v27);
          v23 = (char *)__p;
          v13 = v51;
        }
        else
        {
          v28 = 0;
        }
        v29 = &v28[8 * v24];
        *(_QWORD *)v29 = *(_QWORD *)(v22 - 8);
        v8 = v29 + 8;
        while (v13 != v23)
        {
          v30 = *((_QWORD *)v13 - 1);
          v13 -= 8;
          *((_QWORD *)v29 - 1) = v30;
          v29 -= 8;
        }
        __p = v29;
        v51 = v8;
        v52 = &v28[8 * v27];
        if (v23)
          operator delete(v23);
      }
      else
      {
        *(_QWORD *)v13 = *(_QWORD *)(v22 - 8);
        v8 = v13 + 8;
      }
      v51 = v8;
      ++v10;
      v9 = *(_QWORD *)a2;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3) > v10);
  }
  v45 = 0;
  std::vector<double>::assign((char **)&__dst, (v8 - (_BYTE *)__p) >> 3, &v45);
  v31 = (double *)v51;
  v32 = (char *)__dst;
  if (__p != v51)
  {
    v33 = (double *)((char *)__p + 8);
    v34 = *(double *)__p;
    *(_QWORD *)__dst = *(_QWORD *)__p;
    if (v33 != v31)
    {
      v35 = (double *)(v32 + 8);
      do
      {
        v36 = *v33++;
        *v35++ = v36 - v34;
        v34 = v36;
      }
      while (v33 != v31);
    }
  }
  v37 = (const double *)v32;
  v38 = v48 - (v32 + 8);
  if (v48 != v32 + 8)
  {
    memmove(v32, v32 + 8, v48 - (v32 + 8));
    v37 = (const double *)__dst;
  }
  v48 = &v32[v38];
  vDSP_minvD(v37, 1, &__C, (&v32[v38] - (char *)v37) >> 3);
  v39 = (char *)__dst;
  v40 = 0.0;
  v41 = 0.0;
  if (__dst != v48)
  {
    v42 = (double *)__dst;
    do
    {
      v43 = *v42++;
      if (v43 < 0.0)
        v41 = v41 + 1.0;
    }
    while (v42 != (double *)v48);
  }
  v44 = fabs(__C);
  if (__C < 0.0)
    v40 = v44;
  a3->var2 = v41;
  a3->var3 = v40;
  if (v39)
  {
    v48 = v39;
    operator delete(v39);
  }
  if (__p)
  {
    v51 = (char *)__p;
    operator delete(__p);
  }
}

void sub_235FB9F24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t beryllium::BerylliumProcessor::beryllium_process(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, core_analytics_t *a3)
{
  beryllium::BerylliumProcessor *v6;
  beryllium::BerylliumProcessor *v7;
  uint64_t v8;
  const beryllium::input_t *v9;
  uint64_t v10;
  float v11;
  output_t v13;

  a3->var0 = nanf("");
  a3->var1 = nanf("");
  a3->var2 = nanf("");
  a3->var3 = nanf("");
  a3->var0 = beryllium::BerylliumProcessor::calc_tacho_times_diff_median(v6, a2);
  beryllium::BerylliumProcessor::calc_timezone_shift(v7, a2, a3);
  v8 = beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(this, a2, &v13);
  if ((v8 & 0xFF00000000) != 0)
  {
    v10 = 0x100000000;
  }
  else
  {
    v11 = beryllium::BerylliumProcessor::TachAFdensity((double **)this, v9, &v13);
    v10 = 0;
    a3->var1 = v11;
    LODWORD(v8) = v13;
  }
  return v10 | v8;
}

char *std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v15 = (__dst - (uint64_t)v13) >> 3;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 2 > v14)
      v14 = v16 >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v9, v17);
    else
      v18 = 0;
    v28 = &v18[8 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    v29 = 8 * a5;
    v30 = &v28[8 * a5];
    do
    {
      v31 = *(_QWORD *)v7;
      v7 += 8;
      *(_QWORD *)v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    v35 = v30;
    v5 = std::vector<double>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    v21 = &__src[8 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[8 * a5];
    v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_QWORD *)v25;
        v25 += 8;
        *(_QWORD *)v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[8 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_235FBA1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v8 -= 8;
      *((_QWORD *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(char **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void sub_235FBA348(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, _QWORD *a4@<X3>, unint64_t a5@<X4>, _QWORD *a6@<X5>, int a7@<W6>, unint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  _QWORD *v35;
  unsigned int v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  char *v42;
  int v43;
  char *v44;
  __int128 v45;

  *(_QWORD *)a9 = 0;
  *(_DWORD *)(a9 + 8) = 0;
  v19 = *(_QWORD *)(a1 + 8);
  v18 = *(_QWORD *)(a1 + 16);
  if (v18 << 6 < a8 || v19 > (v18 << 6) - a8)
  {
    v44 = 0;
    v45 = 0uLL;
    v21 = v19 + a8;
    if (v21 < 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    if ((unint64_t)(v18 << 6) > 0x3FFFFFFFFFFFFFFELL)
    {
      v24 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v22 = v18 << 7;
      v23 = (v21 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v22 <= v23)
        v24 = v23;
      else
        v24 = v22;
    }
    std::vector<BOOL>::reserve(&v44, v24);
    v31 = *(unint64_t **)a1;
    *(_QWORD *)&v45 = *(_QWORD *)(a1 + 8) + a8;
    v42 = v44;
    v43 = 0;
    std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>(v31, 0, a2, a3, (uint64_t)&v42, (uint64_t)&v40);
    v32 = v40;
    *(_QWORD *)a9 = v40;
    v33 = v41;
    *(_DWORD *)(a9 + 8) = v41;
    v34 = *(_QWORD *)(a1 + 8);
    v35 = (_QWORD *)(*(_QWORD *)a1 + 8 * (v34 >> 6));
    v36 = v34 & 0x3F;
    v42 = &v44[8 * ((unint64_t)v45 >> 6)];
    v43 = v45 & 0x3F;
    if (v43 == v36)
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v35, v36, (uint64_t)&v42, (uint64_t)&v40);
    else
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v35, v36, (uint64_t)&v42, (uint64_t)&v40);
    v37 = *(char **)a1;
    *(_QWORD *)a1 = v44;
    v44 = v37;
    v38 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v45;
    v45 = v38;
    if (v37)
      operator delete(v37);
  }
  else
  {
    v25 = *(unint64_t **)a1;
    v26 = (_QWORD *)(*(_QWORD *)a1 + 8 * (v19 >> 6));
    v27 = *(_QWORD *)(a1 + 8) & 0x3FLL;
    v28 = v19 & 0x3F;
    *(_QWORD *)(a1 + 8) = v19 + a8;
    v44 = (char *)&v25[(v19 + a8) >> 6];
    if ((((_BYTE)v19 + (_BYTE)a8) & 0x3F) == (_DWORD)v27)
    {
      LODWORD(v45) = v27;
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v26, v28, (uint64_t)&v44, (uint64_t)&v42);
    }
    else
    {
      LODWORD(v45) = ((_BYTE)v19 + (_BYTE)a8) & 0x3F;
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v26, v28, (uint64_t)&v44, (uint64_t)&v42);
    }
    v29 = 8 * (a2 - *(_QWORD *)a1) + a3;
    if (v29 < 0)
    {
      v39 = v29 - 63;
      if (v29 - 63 < 0)
        v39 = 8 * (a2 - *(_QWORD *)a1) + a3;
      v30 = v39 >> 6;
    }
    else
    {
      v30 = (unint64_t)v29 >> 6;
    }
    v32 = *(_QWORD *)a1 + 8 * v30;
    v33 = v29 & 0x3F;
    *(_QWORD *)a9 = v32;
    *(_DWORD *)(a9 + 8) = v33;
  }
  v42 = (char *)v32;
  v43 = v33;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a4, a5, a6, a7, (uint64_t)&v42, (uint64_t)&v44);
}

void sub_235FBA5C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_235FBA68C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, _QWORD *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8;
  _QWORD *result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a4 - (unint64_t)a2 + 8 * ((_QWORD)a3 - a1);
  result = *(_QWORD **)a5;
  if (v8 >= 1)
  {
    if (a4)
    {
      if (v8 >= (unint64_t)a4)
        v10 = a4;
      else
        v10 = v8;
      v8 -= v10;
      v11 = (-1 << (a4 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
      *result = *result & ~v11 | *a3 & v11;
      *(_DWORD *)(a5 + 8) = (*(_DWORD *)(a5 + 8) - (_BYTE)v10) & 0x3F;
    }
    if (v8 >= 0)
      v12 = v8;
    else
      v12 = v8 + 63;
    v13 = v12 >> 6;
    result -= v12 >> 6;
    *(_QWORD *)a5 = result;
    v14 = &a3[-(v12 >> 6)];
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(result, v14, 8 * v13);
      result = *(_QWORD **)a5;
    }
    if (v8 - (v13 << 6) >= 1)
    {
      v15 = -1 << (((_BYTE)v13 << 6) - v8);
      v16 = *(v14 - 1) & v15;
      v17 = *--result;
      *(_QWORD *)a5 = result;
      *result = v17 & ~v15 | v16;
      *(_DWORD *)(a5 + 8) = -(int)v8 & 0x3F;
    }
  }
  *(_QWORD *)a6 = result;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return result;
}

unint64_t std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(unint64_t result@<X0>, unsigned int a2@<W1>, _QWORD *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;

  v6 = a4 - (unint64_t)a2 + 8 * ((_QWORD)a3 - result);
  if (v6 <= 0)
  {
    v11 = *(unint64_t **)a5;
    LODWORD(v9) = *(_DWORD *)(a5 + 8);
  }
  else
  {
    if (a4)
    {
      if (v6 >= (unint64_t)a4)
        v7 = a4;
      else
        v7 = a4 - (unint64_t)a2 + 8 * ((_QWORD)a3 - result);
      v6 -= v7;
      v8 = (-1 << (a4 - v7)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)a4) & *a3;
      v9 = *(unsigned int *)(a5 + 8);
      if (v7 >= v9)
        v10 = *(unsigned int *)(a5 + 8);
      else
        v10 = v7;
      v11 = *(unint64_t **)a5;
      if (v10)
      {
        v12 = v8 >> (a4 - v9);
        if (v9 > a4)
          v12 = v8 << (v9 - a4);
        *v11 = *v11 & ~((-1 << (v9 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v9)) | v12;
        LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v10) & 0x3F;
        *(_DWORD *)(a5 + 8) = v9;
        v7 -= v10;
      }
      if (v7 >= 1)
      {
        v13 = *--v11;
        *(_QWORD *)a5 = v11;
        LODWORD(v9) = -(int)v7 & 0x3F;
        *(_DWORD *)(a5 + 8) = v9;
        *v11 = v13 & ~(-1 << -(char)v7) | (v8 << (v7 + v10 - a4 + (-(char)v7 & 0x3F)));
      }
    }
    else
    {
      LODWORD(v9) = *(_DWORD *)(a5 + 8);
      v11 = *(unint64_t **)a5;
    }
    v14 = 64 - v9;
    v15 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v9;
    if (v6 >= 64)
    {
      v16 = *v11;
      do
      {
        v17 = v6;
        v19 = *--a3;
        v18 = v19;
        result = v19 >> v14;
        *v11 = v16 & ~v15 | (v19 >> v14);
        v20 = *--v11;
        v16 = v20 & v15 | (v18 << v9);
        *v11 = v16;
        v6 = v17 - 64;
      }
      while (v17 > 0x7F);
      *(_QWORD *)a5 = v11;
    }
    if (v6 >= 1)
    {
      v21 = *(a3 - 1) & (-1 << -(char)v6);
      if (v6 >= (unint64_t)v9)
        v22 = v9;
      else
        v22 = v6;
      *v11 = *v11 & ~((-1 << (v9 - v22)) & v15) | (v21 >> v14);
      LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v22) & 0x3F;
      *(_DWORD *)(a5 + 8) = v9;
      if (v6 - v22 >= 1)
      {
        v23 = *--v11;
        *(_QWORD *)a5 = v11;
        *(_DWORD *)(a5 + 8) = (v22 - v6) & 0x3F;
        *v11 = v23 & ~(-1 << (v22 - v6)) | (v21 << (v6 + ((v22 - v6) & 0x3F)));
        LODWORD(v9) = (v22 - v6) & 0x3F;
      }
    }
  }
  *(_QWORD *)a6 = v11;
  *(_DWORD *)(a6 + 8) = v9;
  return result;
}

unint64_t *std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8;
  unint64_t *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;

  v8 = a4 - (unint64_t)a2 + 8 * (a3 - (_QWORD)__src);
  if (v8 <= 0)
  {
    v16 = *(unint64_t **)a5;
  }
  else
  {
    v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2))
        v10 = 64 - a2;
      else
        v10 = v8;
      v8 -= v10;
      v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0)
      v13 = v8;
    else
      v13 = v8 + 63;
    v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    v15 = v8 - (v14 << 6);
    v16 = &__src[v14];
    *(_QWORD *)a5 = v16;
    if (v15 >= 1)
    {
      *v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(_QWORD *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

_QWORD *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

_QWORD *std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,false>@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;

  v7 = *a2;
  v8 = (_QWORD *)*result;
  v9 = *((unsigned int *)a2 + 2) + 8 * (v7 - *result);
  v10 = *((unsigned int *)result + 2);
  v11 = v9 - v10;
  if (v9 - v10 <= 0)
  {
    v19 = *(unint64_t **)a3;
  }
  else
  {
    v12 = result;
    if ((_DWORD)v10)
    {
      if (v11 >= (unint64_t)(64 - v10))
        v13 = (64 - v10);
      else
        v13 = v9 - v10;
      v11 -= v13;
      v14 = *(unint64_t **)a3;
      *v14 = **(_QWORD **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10)) | *v8 & (0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10);
      v15 = v13 + *(unsigned int *)(a3 + 8);
      *(_QWORD *)a3 = (char *)v14 + ((v15 >> 3) & 0x3FFFFFF8);
      *(_DWORD *)(a3 + 8) = v15 & 0x3F;
      v8 = (_QWORD *)(*result + 8);
      *result = v8;
    }
    if (v11 >= 0)
      v16 = v11;
    else
      v16 = v11 + 63;
    v17 = v16 >> 6;
    if ((unint64_t)(v11 + 63) >= 0x7F)
      result = memmove(*(void **)a3, v8, 8 * v17);
    v18 = v11 - (v17 << 6);
    v19 = (unint64_t *)(*(_QWORD *)a3 + 8 * v17);
    *(_QWORD *)a3 = v19;
    if (v18 >= 1)
    {
      v20 = (_QWORD *)(*v12 + 8 * v17);
      *v12 = v20;
      v21 = 0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v17 << 6) - v11);
      v22 = *v20 & v21;
      v19 = *(unint64_t **)a3;
      **(_QWORD **)a3 = **(_QWORD **)a3 & ~v21 | v22;
      *(_DWORD *)(a3 + 8) = v18;
    }
  }
  *(_QWORD *)a4 = v19;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unsigned int *std::__copy_unaligned[abi:ne180100]<std::vector<BOOL>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  int v15;
  unint64_t v16;
  unint64_t *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v4 = *(unint64_t **)result;
  v5 = result[2];
  v6 = *(unsigned int *)(a2 + 8) + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
  if (v6 <= 0)
  {
    v20 = *(uint64_t **)a3;
    v18 = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if ((_DWORD)v5)
    {
      if (v6 >= (unint64_t)(64 - v5))
        v7 = (64 - v5);
      else
        v7 = *(unsigned int *)(a2 + 8) + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
      v6 -= v7;
      v8 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v7)) & (-1 << v5) & *v4;
      v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= (64 - v9))
        v10 = (64 - v9);
      else
        v10 = v7;
      v11 = *(uint64_t **)a3;
      v12 = v8 >> (v5 - v9);
      v13 = v9 >= v5;
      v15 = v9 - v5;
      v14 = v15 != 0 && v13;
      v16 = v8 << v15;
      if (!v14)
        v16 = v12;
      *v11 = **(_QWORD **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v9 - v10)) & (-1 << v9)) | v16;
      v17 = (unint64_t *)((char *)v11 + (((v10 + v9) >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a3 = v17;
      v18 = ((_BYTE)v9 + (_BYTE)v10) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      v19 = v7 - v10;
      if (v19 >= 1)
      {
        *v17 = (v8 >> (v10 + result[2])) | *v17 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v19);
        *(_DWORD *)(a3 + 8) = v19;
        v18 = v19;
      }
      v4 = (unint64_t *)(*(_QWORD *)result + 8);
      *(_QWORD *)result = v4;
    }
    else
    {
      v18 = *(_DWORD *)(a3 + 8);
    }
    v21 = 64 - v18;
    v22 = -1 << v18;
    if (v6 < 64)
    {
      v26 = v6;
    }
    else
    {
      do
      {
        v23 = *v4;
        v24 = *(uint64_t **)a3;
        *v24 = **(_QWORD **)a3 & ~v22 | (v23 << v18);
        v25 = v24[1];
        *(_QWORD *)a3 = ++v24;
        *v24 = v25 & v22 | (v23 >> v21);
        v26 = v6 - 64;
        v4 = (unint64_t *)(*(_QWORD *)result + 8);
        *(_QWORD *)result = v4;
        v14 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v14);
    }
    v20 = *(uint64_t **)a3;
    if (v26 >= 1)
    {
      v27 = *v4 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v26);
      if (v26 >= (unint64_t)v21)
        v28 = 64 - v18;
      else
        v28 = v26;
      *v20 = *v20 & ~((0xFFFFFFFFFFFFFFFFLL >> (v21 - v28)) & v22) | (v27 << v18);
      v20 = (uint64_t *)((char *)v20 + (((v28 + (unint64_t)v18) >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a3 = v20;
      v18 = ((_BYTE)v18 + (_BYTE)v28) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      if (v26 - v28 >= 1)
      {
        *v20 = *v20 & ~(0xFFFFFFFFFFFFFFFFLL >> (v28 - v26)) | (v27 >> v28);
        *(_DWORD *)(a3 + 8) = v26 - v28;
        v18 = v26 - v28;
      }
    }
  }
  *(_QWORD *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v18;
  return result;
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

void std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  char *v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  char *v45;
  int v46;

  *(_QWORD *)a7 = 0;
  *(_DWORD *)(a7 + 8) = 0;
  v15 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  if (v14 << 6 < a6 || v15 > (v14 << 6) - a6)
  {
    v39 = 0;
    v40 = 0uLL;
    v17 = v15 + a6;
    if (v17 < 0)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    if ((unint64_t)(v14 << 6) > 0x3FFFFFFFFFFFFFFELL)
    {
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v18 = v14 << 7;
      v19 = (v17 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v18 <= v19)
        v20 = v19;
      else
        v20 = v18;
    }
    std::vector<BOOL>::reserve(&v39, v20);
    v27 = *(unint64_t **)a1;
    *(_QWORD *)&v40 = *(_QWORD *)(a1 + 8) + a6;
    v45 = v39;
    v46 = 0;
    std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>(v27, 0, a2, a3, (uint64_t)&v45, (uint64_t)&v43);
    v28 = v43;
    *(_QWORD *)a7 = v43;
    v29 = v44;
    *(_DWORD *)(a7 + 8) = v44;
    v30 = *(_QWORD *)(a1 + 8);
    v31 = (_QWORD *)(*(_QWORD *)a1 + 8 * (v30 >> 6));
    v32 = v30 & 0x3F;
    v45 = &v39[8 * ((unint64_t)v40 >> 6)];
    v46 = v40 & 0x3F;
    if (v46 == v32)
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v31, v32, (uint64_t)&v45, (uint64_t)&v43);
    else
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v31, v32, (uint64_t)&v45, (uint64_t)&v43);
    v33 = *(char **)a1;
    *(_QWORD *)a1 = v39;
    v39 = v33;
    v34 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v40;
    v40 = v34;
    if (v33)
      operator delete(v33);
  }
  else
  {
    v21 = *(unint64_t **)a1;
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * (v15 >> 6));
    v23 = *(_QWORD *)(a1 + 8) & 0x3FLL;
    v24 = v15 & 0x3F;
    *(_QWORD *)(a1 + 8) = v15 + a6;
    v39 = (char *)&v21[(v15 + a6) >> 6];
    if ((((_BYTE)v15 + (_BYTE)a6) & 0x3F) == (_DWORD)v23)
    {
      LODWORD(v40) = v23;
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v22, v24, (uint64_t)&v39, (uint64_t)&v45);
    }
    else
    {
      LODWORD(v40) = ((_BYTE)v15 + (_BYTE)a6) & 0x3F;
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v22, v24, (uint64_t)&v39, (uint64_t)&v45);
    }
    v25 = 8 * (a2 - *(_QWORD *)a1) + a3;
    if (v25 < 0)
    {
      v35 = v25 - 63;
      if (v25 - 63 < 0)
        v35 = 8 * (a2 - *(_QWORD *)a1) + a3;
      v26 = v35 >> 6;
    }
    else
    {
      v26 = (unint64_t)v25 >> 6;
    }
    v28 = *(_QWORD *)a1 + 8 * v26;
    v29 = v25 & 0x3F;
    *(_QWORD *)a7 = v28;
    *(_DWORD *)(a7 + 8) = v29;
  }
  v36 = *(_DWORD *)(a4 + 8);
  v37 = *(_QWORD *)a5;
  v38 = *(_DWORD *)(a5 + 8);
  v45 = *(char **)a4;
  v46 = v36;
  v43 = v37;
  v44 = v38;
  v41 = v28;
  v42 = v29;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>((uint64_t *)&v45, &v43, &v41, (uint64_t)&v39);
}

void sub_235FBB3CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  if (*a3)
  {
    v6 = *a1;
    return std::__count_BOOL[abi:ne180100]<true,std::vector<BOOL>,false>((uint64_t)&v6, *(unsigned int *)(a2 + 8) - (unint64_t)*((unsigned int *)a1 + 2) + 8 * (*(_QWORD *)a2 - v3));
  }
  else
  {
    v5 = *a1;
    return std::__count_BOOL[abi:ne180100]<false,std::vector<BOOL>,false>((uint64_t)&v5, *(unsigned int *)(a2 + 8) - (unint64_t)*((unsigned int *)a1 + 2) + 8 * (*(_QWORD *)a2 - v3));
  }
}

uint64_t std::__count_BOOL[abi:ne180100]<true,std::vector<BOOL>,false>(uint64_t a1, unint64_t a2)
{
  int v2;
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    if ((64 - v2) >= a2)
      v3 = a2;
    else
      v3 = (64 - v2);
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v2 - v3)) & (-1 << v2) & **(_QWORD **)a1));
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.u32[0];
    a2 -= v3;
    *(_QWORD *)a1 += 8;
  }
  else
  {
    v5 = 0;
  }
  if (a2 >= 0x40)
  {
    v6 = *(int8x8_t **)a1;
    do
    {
      v7 = *v6++;
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      v5 += v8.u32[0];
      a2 -= 64;
    }
    while (a2 > 0x3F);
    *(_QWORD *)a1 = v6;
  }
  if (a2)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)(**(_QWORD **)a1 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a2)));
    v9.i16[0] = vaddlv_u8(v9);
    v5 += v9.u32[0];
  }
  return v5;
}

uint64_t std::__count_BOOL[abi:ne180100]<false,std::vector<BOOL>,false>(uint64_t a1, unint64_t a2)
{
  int v2;
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint8x8_t v8;
  uint8x8_t v9;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    if ((64 - v2) >= a2)
      v3 = a2;
    else
      v3 = (64 - v2);
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v2 - v3)) & (-1 << v2) & ~**(_QWORD **)a1));
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.u32[0];
    a2 -= v3;
    *(_QWORD *)a1 += 8;
  }
  else
  {
    v5 = 0;
  }
  if (a2 >= 0x40)
  {
    v6 = *(uint64_t **)a1;
    do
    {
      v7 = *v6++;
      v8 = (uint8x8_t)vcnt_s8((int8x8_t)~v7);
      v8.i16[0] = vaddlv_u8(v8);
      v5 += v8.u32[0];
      a2 -= 64;
    }
    while (a2 > 0x3F);
    *(_QWORD *)a1 = v6;
  }
  if (a2)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> -(char)a2) & ~**(_QWORD **)a1));
    v9.i16[0] = vaddlv_u8(v9);
    v5 += v9.u32[0];
  }
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_235FBB678(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_235FBB6F0(_Unwind_Exception *exception_object)
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

_QWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,double const*,double const*,std::back_insert_iterator<std::vector<double>>,0>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;

  v3 = a1;
  v6 = a3;
  if (a1 == a2)
    return a1;
  v4 = a2;
  do
    std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100](uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = *a1;
  v5 = *(_QWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_QWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v6, v12);
      v8 = *(_QWORD **)v4;
      v5 = *(_QWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)v4 = v14;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = *a2;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

double std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3, double result)
{
  double *v4;
  unint64_t v7;
  double *v8;
  double *v9;
  int v10;
  double *v11;
  double *v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;

  if (a3 != a2)
  {
    v4 = a3;
    do
    {
      v7 = v4 - a1;
      if (v7 < 2)
        break;
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        result = *(v4 - 1);
        v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 63)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v4, result);
      v8 = &a1[v7 >> 1];
      v9 = v4 - 1;
      v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v8, v4 - 1);
      result = *a1;
      if (*a1 >= *v8)
      {
        v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9)
          return result;
        while (1)
        {
          v25 = *a1;
          do
          {
            v26 = *v21++;
            result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            v28 = *--v9;
            v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9)
            break;
          *v27 = v29;
          *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2)
          return result;
      }
      else
      {
        v11 = v4 - 1;
LABEL_13:
        v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          v16 = a1 + 1;
        }
        else
        {
          v13 = a1 + 1;
          while (1)
          {
            v14 = *v8;
            do
            {
              v15 = *v13++;
              result = v15;
            }
            while (v15 < v14);
            v16 = v13 - 1;
            do
            {
              v17 = *--v11;
              v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11)
              break;
            *v16 = v18;
            *v11 = result;
            ++v10;
            if (v16 == v8)
              v8 = v11;
          }
        }
        if (v16 != v8)
        {
          result = *v8;
          v19 = *v16;
          if (*v8 < *v16)
          {
            *v16 = result;
            *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2)
          return result;
        if (!v10)
        {
          if (v16 <= a2)
          {
            v23 = v16 + 1;
            while (v23 != v4)
            {
              v24 = *(v23 - 1);
              result = *v23++;
              if (result < v24)
                goto LABEL_29;
            }
          }
          else
          {
            while (v12 != v16)
            {
              v20 = *(v12 - 1);
              result = *v12++;
              if (result < v20)
                goto LABEL_29;
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
          a1 = v16 + 1;
        else
          v4 = v16;
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 >= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

double std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double result)
{
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double v7;
  double v8;

  while (a1 != a2 - 1)
  {
    v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      result = *v3;
      v4 = a1;
      v5 = v3;
      v6 = a1;
      do
      {
        v7 = *v6++;
        v8 = v7;
        if (v7 < result)
        {
          result = v8;
          v5 = v4;
        }
        v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        result = *v3;
        *v3 = *v5;
        *v5 = result;
      }
    }
  }
  return result;
}

void beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(os_log_t log, float a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_235FAB000, log, OS_LOG_TYPE_DEBUG, "\nAfib burden without interpolation: %f", (uint8_t *)&v2, 0xCu);
}

void beryllium::BerylliumProcessor::median()
{
  __assert_rtn("median", "beryllium_core.cpp", 429, "N > 0");
}

{
  __assert_rtn("median", "beryllium_core.cpp", 430, "x != NULL");
}

float stats::mean(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::mean();
  if (!this)
    stats::mean();
  v3 = 0.0;
  vDSP_meanv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::variance(stats *this, const float *a2, int a3)
{
  int v5;
  vDSP_Length v6;
  float v7;
  float *__C;
  float *v10;
  uint64_t v11;
  uint64_t __A;

  if ((int)a2 <= 0)
    stats::variance();
  if (!this)
    stats::variance();
  v5 = (int)a2;
  v11 = 0;
  __A = 0;
  __C = 0;
  v10 = 0;
  v6 = a2;
  std::vector<float>::reserve((void **)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v6);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v6);
  vDSP_dotpr(__C, 1, __C, 1, (float *)&__A, v6);
  v7 = *(float *)&__A / (float)(v5 - (a3 ^ 1));
  *(float *)&__A = v7;
  if (__C)
  {
    v10 = __C;
    operator delete(__C);
  }
  return v7;
}

void sub_235FBC73C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

float stats::covariance(stats *this, const float *a2, const float *a3, const float *a4, int a5)
{
  unsigned int v5;
  float v9;
  float *__B;
  float *v12;
  uint64_t v13;
  float *__C;
  float *v15;
  uint64_t v16;
  float v17;
  uint64_t __A;

  if ((int)a2 <= 0)
    stats::covariance();
  v5 = a2;
  if ((_DWORD)a4 != (_DWORD)a2)
    stats::covariance();
  if (!this)
    stats::covariance();
  if (!a3)
    stats::covariance();
  __A = 0;
  v17 = 0.0;
  __C = 0;
  v15 = 0;
  v16 = 0;
  __B = 0;
  v12 = 0;
  v13 = 0;
  std::vector<float>::reserve((void **)&__C, a2);
  std::vector<float>::reserve((void **)&__B, v5);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v5);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v5);
  vDSP_meanv_wrapper((uint64_t)a3, 1, (float *)&__A, v5);
  vDSP_vsub(a3, 1, (const float *)&__A, 0, __B, 1, v5);
  vDSP_dotpr(__C, 1, __B, 1, &v17, v5);
  v9 = v17 / (float)(int)(v5 - (a5 ^ 1));
  v17 = v9;
  if (__B)
  {
    v12 = __B;
    operator delete(__B);
  }
  if (__C)
  {
    v15 = __C;
    operator delete(__C);
  }
  return v9;
}

void sub_235FBC950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

float stats::std(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0)
    stats::std();
  if (!this)
    stats::std();
  return sqrtf(stats::variance(this, a2, a3));
}

float stats::rmssd(stats *this, const float *a2)
{
  unint64_t v3;
  float v4;
  float *__C;
  float *v7;
  uint64_t v8;
  float v9;

  if ((int)a2 <= 0)
    stats::rmssd();
  if (!this)
    stats::rmssd();
  v9 = 0.0;
  __C = 0;
  v7 = 0;
  v3 = ((_DWORD)a2 - 1);
  v8 = 0;
  std::vector<float>::reserve((void **)&__C, v3);
  vDSP_vsub((const float *)&this->cp_time[1], 1, (const float *)this->cp_time, 1, __C, 1, v3);
  vDSP_dotpr(__C, 1, __C, 1, &v9, v3);
  v4 = sqrtf(v9 / (float)(int)v3);
  v9 = v4;
  if (__C)
  {
    v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_235FBCA68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::madsd(stats *this, const float *a2)
{
  unint64_t v3;
  float v4;
  float *__C;
  float *v7;
  uint64_t v8;
  float v9;

  if ((int)a2 <= 0)
    stats::madsd();
  if (!this)
    stats::madsd();
  v9 = 0.0;
  __C = 0;
  v7 = 0;
  v3 = ((_DWORD)a2 - 1);
  v8 = 0;
  std::vector<float>::reserve((void **)&__C, v3);
  vDSP_vsub((const float *)&this->cp_time[1], 1, (const float *)this->cp_time, 1, __C, 1, v3);
  vDSP_vabs(__C, 1, __C, 1, v3);
  vDSP_meanv_wrapper((uint64_t)__C, 1, &v9, v3);
  v4 = v9;
  if (__C)
  {
    v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_235FBCB44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::mad(stats *this, const float *a2)
{
  vDSP_Length v3;
  float v4;
  float *__C;
  float *v7;
  uint64_t v8;
  uint64_t __A;

  if ((int)a2 <= 0)
    stats::mad();
  if (!this)
    stats::mad();
  v8 = 0;
  __A = 0;
  __C = 0;
  v7 = 0;
  v3 = a2;
  std::vector<float>::reserve((void **)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A, v3);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A, 0, __C, 1, v3);
  vDSP_vabs(__C, 1, __C, 1, v3);
  vDSP_meanv_wrapper((uint64_t)__C, 1, (float *)&__A + 1, v3);
  v4 = *((float *)&__A + 1);
  if (__C)
  {
    v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_235FBCC30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::mad_median(stats *this, const float *a2)
{
  vDSP_Length v4;
  float v5;
  float *__C;
  float *v8;
  uint64_t v9;
  float __A;

  if ((int)a2 <= 0)
    stats::mad_median();
  if (!this)
    stats::mad_median();
  __A = 0.0;
  __C = 0;
  v8 = 0;
  v4 = a2;
  v9 = 0;
  std::vector<float>::reserve((void **)&__C, a2);
  __A = stats::median(this, a2);
  vDSP_vsub((const float *)this->cp_time, 1, &__A, 0, __C, 1, v4);
  vDSP_vabs(__C, 1, __C, 1, v4);
  v5 = stats::median((stats *)__C, a2);
  if (__C)
  {
    v8 = __C;
    operator delete(__C);
  }
  return v5;
}

void sub_235FBCD20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::median(stats *this, const float *a2)
{
  char v3;
  uint64_t v4;
  float v5;
  float *v6;
  float *v7;
  unint64_t v8;
  unint64_t v9;
  float *v10;
  float v11;
  float *v12;
  float v13;
  unint64_t v14;
  float *v15;
  void *__p;
  float *v18;
  uint64_t v19;

  if ((int)a2 <= 0)
    stats::median();
  if (!this)
    stats::median();
  v3 = (char)a2;
  __p = 0;
  v18 = 0;
  v4 = a2;
  v19 = 0;
  std::vector<float>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, &this->cp_time[v4], (uint64_t)&__p);
  v6 = (float *)__p;
  v7 = v18;
  v8 = ((char *)v18 - (_BYTE *)__p) >> 2;
  if ((v3 & 1) != 0)
  {
    v14 = (2 * v8 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    v15 = (float *)((char *)__p + v14);
    if ((char *)__p + v14 != (char *)v18)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v14), v18, v5);
    v13 = *v15;
  }
  else
  {
    v9 = v8 >> 1;
    v10 = (float *)((char *)__p + 4 * v9 - 4);
    if (v10 != v18)
    {
      v5 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v9 - 1, v18, v5);
      v6 = (float *)__p;
      v7 = v18;
      v9 = (unint64_t)(((char *)v18 - (_BYTE *)__p) >> 2) >> 1;
    }
    v11 = *v10;
    v12 = &v6[v9];
    if (v12 != v7)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v6, &v6[v9], v7, v5);
    v13 = (float)(v11 + *v12) * 0.5;
  }
  if (__p)
  {
    v18 = (float *)__p;
    operator delete(__p);
  }
  return v13;
}

void sub_235FBCE5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::range(stats *this, const float *a2)
{
  uint64_t v3;
  uint64_t v5;

  if ((int)a2 <= 0)
    stats::range();
  if (!this)
    stats::range();
  v5 = 0;
  v3 = a2;
  vDSP_maxv_wrapper((uint64_t)this, 1, (float *)&v5 + 1, a2);
  vDSP_minv_wrapper((uint64_t)this, 1, (float *)&v5, v3);
  return *((float *)&v5 + 1) - *(float *)&v5;
}

float stats::max(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::max();
  if (!this)
    stats::max();
  v3 = 0.0;
  vDSP_maxv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::min(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::min();
  if (!this)
    stats::min();
  v3 = 0.0;
  vDSP_minv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

void stats::median_vdsp(stats *this, vDSP_Length *a2, unint64_t *a3)
{
  if ((int)a3 <= 0)
    stats::median_vdsp();
  if (!this)
    stats::median_vdsp();
  if (!a2)
    stats::median_vdsp();
  stats::percentile(this, a2, (vDSP_Length)a3, 50.0);
}

void stats::percentile(stats *this, vDSP_Length *__I, vDSP_Length __N, float a4)
{
  if ((int)__N <= 0)
    stats::percentile();
  if (!this)
    stats::percentile();
  if (!__I)
    stats::percentile();
  if (a4 < 0.0 || a4 > 100.0)
    stats::percentile();
  vDSP_vsorti((const float *)this->cp_time, __I, 0, __N, 1);
}

float stats::auc(stats *this, const float *a2, float a3)
{
  float __C;

  __C = 0.0;
  vDSP_sve((const float *)this->cp_time, 1, &__C, (int)a2);
  return __C * a3;
}

float stats::meanMag(stats *this, const float *a2, vDSP_Length __N)
{
  float __C;

  if ((int)__N <= 0)
    stats::meanMag();
  if (!this)
    stats::meanMag();
  __C = 0.0;
  vDSP_meamgv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::measqv(stats *this, const float *a2, vDSP_Length __N)
{
  float __C;

  if ((int)__N <= 0)
    stats::measqv();
  if (!this)
    stats::measqv();
  __C = 0.0;
  vDSP_measqv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::meassq(stats *this, const float *a2, vDSP_Length __N)
{
  float __C;

  if ((int)__N <= 0)
    stats::meassq();
  if (!this)
    stats::meassq();
  __C = 0.0;
  vDSP_mvessq((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::rmsqv(stats *this, const float *a2, vDSP_Length __N)
{
  float __C;

  if ((int)__N <= 0)
    stats::rmsqv();
  if (!this)
    stats::rmsqv();
  __C = 0.0;
  vDSP_rmsqv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

void stats::kurt(stats *this, const float *a2)
{
  stats *v2;
  float v4;
  float v5;
  double v6;
  uint64_t v7;
  double v8;
  float v9;
  double v10;

  if ((int)a2 <= 0)
    stats::kurt();
  v2 = this;
  if (!this)
    stats::kurt();
  v4 = stats::variance(this, a2, 0);
  v5 = stats::mean(v2, a2);
  if (v4 != 0.0)
  {
    v6 = v5;
    v7 = a2;
    v8 = 0.0;
    do
    {
      v9 = *(float *)v2->cp_time;
      v2 = (stats *)((char *)v2 + 4);
      v10 = (v9 - v6) * (v9 - v6);
      v8 = v8 + v10 * v10;
      --v7;
    }
    while (v7);
  }
}

stats *stats::linear_interp(stats *this, float *a2, float *a3, int a4)
{
  uint64_t v4;
  float *v5;
  uint64_t v6;
  const float *v7;
  uint64_t i;

  if (a4 >= 1)
  {
    v4 = a4;
    v5 = a2;
    do
    {
      *v5++ = *(float *)this->cp_time;
      --v4;
    }
    while (v4);
  }
  if ((int)a3 > 1)
  {
    v6 = 1;
    v7 = &a2[a4];
    do
    {
      if (a4 >= 1)
      {
        for (i = 0; i != a4; ++i)
          v7[i] = *(float *)&this->cp_time[v6 - 1]
                + (float)((float)((float)(*(float *)&this->cp_time[v6] - *(float *)&this->cp_time[v6 - 1])
                                * (float)(i + 1))
                        / (float)a4);
      }
      ++v6;
      v7 += a4;
    }
    while (v6 != a3);
  }
  return this;
}

float stats::pearsonr(stats *this, stats *a2, const float *a3)
{
  stats *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  double v11;
  float v12;
  double v13;
  float v14;

  v5 = this;
  v6 = stats::mean(this, a3);
  v7 = stats::mean(a2, a3);
  v8 = stats::std(v5, a3, 1);
  v9 = stats::std(a2, a3, 1);
  if ((int)a3 < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v10 = a3;
    v11 = 0.0;
    do
    {
      v12 = *(float *)v5->cp_time;
      v5 = (stats *)((char *)v5 + 4);
      v13 = v12 - v6;
      v14 = *(float *)a2->cp_time;
      a2 = (stats *)((char *)a2 + 4);
      v11 = v11 + v13 * (v14 - v7);
      --v10;
    }
    while (v10);
  }
  return v11 / ((double)(int)a3 * v8 * v9);
}

void stats::median_filt(stats *this, const float *a2, float *a3, int a4, int a5)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  int *v16;
  int v17;
  int v18;
  float v19;
  unint64_t v20;
  float *v21;
  int v22;
  int *v23;
  uint64_t v24;
  int v25;
  int v27;
  void *__p;
  float *v29;
  uint64_t v30;

  if ((int)a3 <= 0)
    stats::median_filt();
  if (!this)
    stats::median_filt();
  if (!a2)
    stats::median_filt();
  v8 = a3;
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<float>::reserve(&__p, a3);
  if (a4 >= 1)
  {
    v9 = 0;
    v10 = a4;
    v11 = v8 >> 1;
    v23 = &this->cp_time[a4];
    v24 = a4 - (int)v11;
    v25 = v8 - v11;
    v12 = (v8 & 1) == 0;
    v13 = &this->cp_time[2 * a4 - (int)v11];
    if (v12)
      v14 = 0;
    else
      v14 = -1;
    v22 = v11 - a4;
    v15 = v11;
    v16 = &this->cp_time[v11];
    do
    {
      std::vector<float>::resize((uint64_t)&__p, 0);
      if (v9 >= v11)
      {
        if (v9 > v24)
        {
          if (a5)
          {
            v27 = 0;
            std::vector<float>::resize((uint64_t)&__p, v22 + (int)v9, &v27);
          }
          else
          {
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(v13, v23, (uint64_t)&__p);
          }
          v17 = v9 - v11;
          v18 = v10;
          goto LABEL_21;
        }
        v17 = v9 - v11;
      }
      else
      {
        if (a5)
        {
          v27 = 0;
          std::vector<float>::resize((uint64_t)&__p, v15, &v27);
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, v16, (uint64_t)&__p);
        }
        v17 = 0;
      }
      v18 = v25 + v9;
LABEL_21:
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(&this->cp_time[v17], &this->cp_time[v18], (uint64_t)&__p);
      v20 = (unint64_t)(v14 + (((char *)v29 - (_BYTE *)__p) >> 2)) >> 1;
      v21 = (float *)((char *)__p + 4 * v20);
      if (v21 != v29)
        std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v20, v29, v19);
      a2[v9++] = *v21;
      --v15;
      --v13;
      --v16;
    }
    while (v10 != v9);
  }
  if (__p)
  {
    v29 = (float *)__p;
    operator delete(__p);
  }
}

void sub_235FBD624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void sub_235FBD700(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v3;
  _DWORD *v4;
  uint64_t v6;

  v3 = a1;
  v6 = a3;
  if (a1 == a2)
    return a1;
  v4 = a2;
  do
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;

  v4 = *a1;
  v5 = *(_DWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_DWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 2;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v6, v12);
      v8 = *(_DWORD **)v4;
      v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = *a2;
    v7 = v14 + 4;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(_QWORD *)v4 = v14;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = *a2;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

float std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3, float result)
{
  float *v4;
  unint64_t v7;
  float *v8;
  float *v9;
  int v10;
  float *v11;
  float *v12;
  float *v13;
  float v14;
  float v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float *v21;
  float v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float *v27;
  float v28;
  float v29;
  float v30;

  if (a3 != a2)
  {
    v4 = a3;
    do
    {
      v7 = v4 - a1;
      if (v7 < 2)
        break;
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        result = *(v4 - 1);
        v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 31)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v4, result);
      v8 = &a1[v7 >> 1];
      v9 = v4 - 1;
      v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v8, v4 - 1);
      result = *a1;
      if (*a1 >= *v8)
      {
        v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9)
          return result;
        while (1)
        {
          v25 = *a1;
          do
          {
            v26 = *v21++;
            result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            v28 = *--v9;
            v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9)
            break;
          *v27 = v29;
          *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2)
          return result;
      }
      else
      {
        v11 = v4 - 1;
LABEL_13:
        v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          v16 = a1 + 1;
        }
        else
        {
          v13 = a1 + 1;
          while (1)
          {
            v14 = *v8;
            do
            {
              v15 = *v13++;
              result = v15;
            }
            while (v15 < v14);
            v16 = v13 - 1;
            do
            {
              v17 = *--v11;
              v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11)
              break;
            *v16 = v18;
            *v11 = result;
            ++v10;
            if (v16 == v8)
              v8 = v11;
          }
        }
        if (v16 != v8)
        {
          result = *v8;
          v19 = *v16;
          if (*v8 < *v16)
          {
            *v16 = result;
            *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2)
          return result;
        if (!v10)
        {
          if (v16 <= a2)
          {
            v23 = v16 + 1;
            while (v23 != v4)
            {
              v24 = *(v23 - 1);
              result = *v23++;
              if (result < v24)
                goto LABEL_29;
            }
          }
          else
          {
            while (v12 != v16)
            {
              v20 = *(v12 - 1);
              result = *v12++;
              if (result < v20)
                goto LABEL_29;
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
          a1 = v16 + 1;
        else
          v4 = v16;
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 >= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

float std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float result)
{
  float *v3;
  float *v4;
  float *v5;
  float *v6;
  float v7;
  float v8;

  while (a1 != a2 - 1)
  {
    v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      result = *v3;
      v4 = a1;
      v5 = v3;
      v6 = a1;
      do
      {
        v7 = *v6++;
        v8 = v7;
        if (v7 < result)
        {
          result = v8;
          v5 = v4;
        }
        v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        result = *v3;
        *v3 = *v5;
        *v5 = result;
      }
    }
  }
  return result;
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

Tellurium::tellurium_classifier_t *Tellurium::tellurium_classifier_t::tellurium_classifier_t(Tellurium::tellurium_classifier_t *this, int a2, int a3, char a4)
{
  NSObject *log_0;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)this = a2;
  *((_DWORD *)this + 1) = a3;
  *((_BYTE *)this + 8) = a4;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  Tellurium::PredictorWrapper_t::PredictorWrapper_t((Tellurium::tellurium_classifier_t *)((char *)this + 64));
  if (algs_get_log_0())
  {
    log_0 = algs_get_log_0();
    if (os_log_type_enabled(log_0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "0.0.5";
      _os_log_impl(&dword_235FAB000, log_0, OS_LOG_TYPE_DEFAULT, "Tellurium Alg Version: %s", (uint8_t *)&v12, 0xCu);
    }
  }
  __asm { FMOV            V0.2D, #-1.0 }
  *((_OWORD *)this + 3) = _Q0;
  return this;
}

void sub_235FBE7EC(_Unwind_Exception *a1)
{
  uint64_t v1;
  id **v2;
  void **v3;
  void *v5;

  Tellurium::PredictorWrapper_t::~PredictorWrapper_t(v2);
  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

double Tellurium::tellurium_classifier_t::get_core_analytics(Tellurium::tellurium_classifier_t *this)
{
  return *((double *)this + 6);
}

void Tellurium::tellurium_classifier_t::tellurium_classifier_process(uint64_t a1, const unsigned __int8 **a2)
{
  void *v4;
  uint64_t v5;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char v29;
  char v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  char *v35;
  void **v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  __int128 v43;
  char *v44;
  char *v45;
  char *v46;
  __int128 v47;
  stats *v48;
  _BYTE *v49;
  float v50;
  float v51;
  NSObject *log_0;
  float v53;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id **v60;
  uint64_t *v61;
  char v62;
  void *__p;
  char *v64;
  char *v65;
  void *v66;
  _BYTE *v67;
  uint64_t v68;
  uuid_t dst;
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a1 + 16;
  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    operator delete(v4);
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
  }
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_WORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v6 = *a2;
  v61 = (uint64_t *)a2[1];
  v58 = a1;
  if (*a2 == (const unsigned __int8 *)v61)
  {
    v49 = 0;
    v48 = 0;
  }
  else
  {
    v57 = a1 + 32;
    v59 = a1 + 8;
    v60 = (id **)(a1 + 64);
    do
    {
      __p = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v8 = *(_QWORD *)v6;
      v7 = *((_QWORD *)v6 + 1);
      if (*(_QWORD *)v6 != v7)
      {
        v9 = 0;
        do
        {
          v10 = *(_QWORD **)v8;
          v11 = *(_QWORD **)(v8 + 8);
          while (1)
          {
            v12 = v9;
            if (v10 == v11)
              break;
            if (v9 >= v65)
            {
              v13 = (char *)__p;
              v14 = (v9 - (_BYTE *)__p) >> 3;
              v15 = v14 + 1;
              if ((unint64_t)(v14 + 1) >> 61)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v16 = v65 - (_BYTE *)__p;
              if ((v65 - (_BYTE *)__p) >> 2 > v15)
                v15 = v16 >> 2;
              if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
                v17 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v17 = v15;
              if (v17)
              {
                v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v65, v17);
                v13 = (char *)__p;
                v12 = v64;
              }
              else
              {
                v18 = 0;
              }
              v19 = &v18[8 * v14];
              *(_QWORD *)v19 = *v10;
              v9 = v19 + 8;
              while (v12 != v13)
              {
                v20 = *((_QWORD *)v12 - 1);
                v12 -= 8;
                *((_QWORD *)v19 - 1) = v20;
                v19 -= 8;
              }
              __p = v19;
              v64 = v9;
              v65 = &v18[8 * v17];
              if (v13)
                operator delete(v13);
            }
            else
            {
              *(_QWORD *)v9 = *v10;
              v9 += 8;
            }
            v64 = v9;
            ++v10;
          }
          if (v9 >= v65)
          {
            v21 = (char *)__p;
            v22 = (v9 - (_BYTE *)__p) >> 3;
            v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 61)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v24 = v65 - (_BYTE *)__p;
            if ((v65 - (_BYTE *)__p) >> 2 > v23)
              v23 = v24 >> 2;
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
              v25 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v25 = v23;
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v65, v25);
              v21 = (char *)__p;
              v12 = v64;
            }
            else
            {
              v26 = 0;
            }
            v27 = &v26[8 * v22];
            *(_QWORD *)v27 = 0x7FF8000000000000;
            v9 = v27 + 8;
            while (v12 != v21)
            {
              v28 = *((_QWORD *)v12 - 1);
              v12 -= 8;
              *((_QWORD *)v27 - 1) = v28;
              v27 -= 8;
            }
            __p = v27;
            v64 = v9;
            v65 = &v26[8 * v25];
            if (v21)
              operator delete(v21);
          }
          else
          {
            *(_QWORD *)v9 = 0x7FF8000000000000;
            v9 += 8;
          }
          v64 = v9;
          v8 += 24;
        }
        while (v8 != v7);
      }
      v29 = Tellurium::PredictorWrapper_t::predict(v60, (uint64_t)&__p, (uint64_t)&v66, (uint64_t)&v62, v59);
      if (!v62)
      {
        v30 = v29;
        uuid_copy(dst, v6 + 32);
        v70 = v30;
        v31 = (_QWORD *)v58;
        v32 = *(_QWORD *)(v58 + 24);
        v33 = *(_QWORD *)(v58 + 32);
        if (v32 >= v33)
        {
          v36 = (void **)v5;
          v37 = 0xF0F0F0F0F0F0F0F1 * (v32 - *(_QWORD *)v5);
          v38 = v37 + 1;
          if (v37 + 1 >= 0xF0F0F0F0F0F0F10)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v39 = 0xF0F0F0F0F0F0F0F1 * (v33 - *(_QWORD *)v5);
          if (2 * v39 > v38)
            v38 = 2 * v39;
          if (v39 >= 0x787878787878787)
            v40 = 0xF0F0F0F0F0F0F0FLL;
          else
            v40 = v38;
          if (v40)
          {
            v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>(v57, v40);
            v36 = (void **)v5;
            v31 = (_QWORD *)v58;
          }
          else
          {
            v41 = 0;
          }
          v42 = &v41[17 * v37];
          v43 = *(_OWORD *)dst;
          v42[16] = v70;
          *(_OWORD *)v42 = v43;
          v45 = (char *)v31[2];
          v44 = (char *)v31[3];
          v46 = v42;
          if (v44 != v45)
          {
            do
            {
              v47 = *(_OWORD *)(v44 - 17);
              *(v46 - 1) = *(v44 - 1);
              *(_OWORD *)(v46 - 17) = v47;
              v46 -= 17;
              v44 -= 17;
            }
            while (v44 != v45);
            v44 = (char *)*v36;
          }
          v35 = v42 + 17;
          v31[2] = v46;
          v31[3] = v42 + 17;
          v31[4] = &v41[17 * v40];
          if (v44)
            operator delete(v44);
        }
        else
        {
          v34 = *(_OWORD *)dst;
          *(_BYTE *)(v32 + 16) = v70;
          *(_OWORD *)v32 = v34;
          v35 = (char *)(v32 + 17);
        }
        v31[3] = v35;
      }
      if (__p)
      {
        v64 = (char *)__p;
        operator delete(__p);
      }
      v6 += 48;
    }
    while (v6 != (const unsigned __int8 *)v61);
    v48 = (stats *)v66;
    v49 = v67;
  }
  v50 = stats::mean(v48, (const float *)((unint64_t)(v49 - (_BYTE *)v48) >> 2));
  v51 = stats::variance((stats *)v66, (const float *)((unint64_t)(v67 - (_BYTE *)v66) >> 2), 1);
  log_0 = algs_get_log_0();
  v53 = sqrtf(v51);
  if (os_log_type_enabled(log_0, OS_LOG_TYPE_DEBUG))
    Tellurium::tellurium_classifier_t::tellurium_classifier_process(log_0, v50, v53);
  if ((LODWORD(v50) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
    *(double *)(v58 + 48) = v50;
  if (SLODWORD(v53) > -1 && ((LODWORD(v53) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F
    || (LODWORD(v53) - 1) < 0x7FFFFF
    || (LODWORD(v53) & 0x7FFFFFFF) == 0)
  {
    *(double *)(v58 + 56) = v53;
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
}

void sub_235FBECD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Unwind_Resume(exception_object);
}

_QWORD *Tellurium::tellurium_classifier_t::tellurium_get_outputs@<X0>(Tellurium::tellurium_classifier_t *this@<X0>, uint64_t a2@<X8>)
{
  const void *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  _QWORD *result;
  unsigned int v11;

  v4 = (const void *)*((_QWORD *)this + 2);
  v5 = *((_QWORD *)this + 3);
  if (v4 == (const void *)v5)
    goto LABEL_8;
  v6 = 0;
  v7 = 0;
  v8 = 1;
  v9 = *((_QWORD *)this + 2);
  do
  {
    if (!*(_BYTE *)(v9 + 16))
      ++v7;
    v6 += *(unsigned __int8 *)(v9 + 16);
    v9 += 17;
    --v8;
  }
  while (v9 != v5);
  if (v8 == 1 || !(v8 | v6))
  {
LABEL_8:
    *((_WORD *)this + 20) = 0;
  }
  else if (v6 >= *(_DWORD *)this)
  {
    *((_WORD *)this + 20) = 1;
  }
  else
  {
    v11 = *((_DWORD *)this + 1);
    *((_BYTE *)this + 40) = 0;
    *((_BYTE *)this + 41) = v7 < v11;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  result = std::vector<Tellurium::tacho_classification_t>::__init_with_size[abi:ne180100]<Tellurium::tacho_classification_t*,Tellurium::tacho_classification_t*>((_QWORD *)a2, v4, v5, 0xF0F0F0F0F0F0F0F1 * (v5 - (_QWORD)v4));
  *(_WORD *)(a2 + 24) = *((_WORD *)this + 20);
  return result;
}

_QWORD *std::vector<Tellurium::tacho_classification_t>::__init_with_size[abi:ne180100]<Tellurium::tacho_classification_t*,Tellurium::tacho_classification_t*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<Tellurium::tacho_classification_t>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_235FBEE5C(_Unwind_Exception *exception_object)
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

char *std::vector<Tellurium::tacho_classification_t>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xF0F0F0F0F0F0F10)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[17 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xF0F0F0F0F0F0F10)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(17 * a2);
}

void sub_235FBF0B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_235FBF5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *__p,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_235FBFB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ***Tellurium::PredictorWrapper_t::PredictorWrapper_t(void ***this)
{
  id *v2;
  Predictor *v3;
  void *v4;
  std::logic_error *exception;
  id *v7;

  *this = 0;
  v2 = (id *)operator new();
  *v2 = 0;
  v7 = 0;
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](this, v2);
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](&v7, 0);
  v3 = objc_alloc_init(Predictor);
  v4 = **this;
  **this = v3;

  if (!**this)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Cannot allocate Predictor instance");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
    __cxa_throw(exception, (struct type_info *)off_2507589D0, MEMORY[0x24BEDAB88]);
  }
  return this;
}

void sub_235FBFDD0(_Unwind_Exception *a1)
{
  id **v1;
  void *v2;

  __cxa_free_exception(v2);
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void Tellurium::PredictorWrapper_t::~PredictorWrapper_t(id **this)
{
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](this, 0);
}

{
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](this, 0);
}

uint64_t Tellurium::PredictorWrapper_t::predict(id **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(**a1, "predict:afib:be_mode:with_error_status:", a2, a3, a5, a4);
}

id **std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](id **result, id *a2)
{
  id *v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {

    JUMPOUT(0x23B7E80D0);
  }
  return result;
}

uint64_t remove_nan(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 0.0)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    *(_DWORD *)(a2 + 4 * v4++) = *(_DWORD *)(a1 + 4 * v3++);
  while ((float)(int)v3 < a3);
  return v4;
}

uint64_t remove_nanD(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 0.0)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    *(_QWORD *)(a2 + 8 * v4++) = *(_QWORD *)(a1 + 8 * v3++);
  while ((float)(int)v3 < a3);
  return v4;
}

void vDSP_maxv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  const double *v8;
  double *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    v9 = (double *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  const double *v8;
  double *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    v9 = (double *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  const float *v10;
  float *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    v11 = (float *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxviD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, vDSP_Length *a4, uint64_t a5)
{
  const double *v10;
  double *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
  if (v10)
  {
    v11 = (double *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const double *)(a1 + 8 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxviD(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  const float *v10;
  float *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    v11 = (float *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minviD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, vDSP_Length *a4, uint64_t a5)
{
  const double *v10;
  double *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
  if (v10)
  {
    v11 = (double *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const double *)(a1 + 8 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minviD(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  const double *v8;
  double *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    v9 = (double *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

uint64_t algs_get_log_0()
{
  if (algs_get_log_onceToken_0 != -1)
    dispatch_once(&algs_get_log_onceToken_0, &__block_literal_global_2);
  return algs_get_log_log_0;
}

os_log_t __algs_get_log_block_invoke_0()
{
  os_log_t result;

  result = os_log_create("com.apple.Health.AFibBurden", "hid-algs-classification");
  algs_get_log_log_0 = (uint64_t)result;
  return result;
}

void stats::mean()
{
  __assert_rtn("mean", "stats.cpp", 18, "N > 0");
}

{
  __assert_rtn("mean", "stats.cpp", 19, "x != NULL");
}

void stats::variance()
{
  __assert_rtn("variance", "stats.cpp", 31, "N > 0");
}

{
  __assert_rtn("variance", "stats.cpp", 32, "x != NULL");
}

void stats::covariance()
{
  __assert_rtn("covariance", "stats.cpp", 52, "Nx > 0");
}

{
  __assert_rtn("covariance", "stats.cpp", 55, "x != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 56, "y != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 53, "Ny == Nx");
}

void stats::std()
{
  __assert_rtn("std", "stats.cpp", 80, "N > 0");
}

{
  __assert_rtn("std", "stats.cpp", 81, "x != NULL");
}

void stats::rmssd()
{
  __assert_rtn("rmssd", "stats.cpp", 93, "N > 0");
}

{
  __assert_rtn("rmssd", "stats.cpp", 94, "x != NULL");
}

void stats::madsd()
{
  __assert_rtn("madsd", "stats.cpp", 110, "N > 0");
}

{
  __assert_rtn("madsd", "stats.cpp", 111, "x != NULL");
}

void stats::mad()
{
  __assert_rtn("mad", "stats.cpp", 127, "N > 0");
}

{
  __assert_rtn("mad", "stats.cpp", 128, "x != NULL");
}

void stats::mad_median()
{
  __assert_rtn("mad_median", "stats.cpp", 145, "N > 0");
}

{
  __assert_rtn("mad_median", "stats.cpp", 146, "x != NULL");
}

void stats::median()
{
  __assert_rtn("median", "stats.cpp", 204, "N > 0");
}

{
  __assert_rtn("median", "stats.cpp", 205, "x != NULL");
}

void stats::range()
{
  __assert_rtn("range", "stats.cpp", 163, "N > 0");
}

{
  __assert_rtn("range", "stats.cpp", 164, "x != NULL");
}

void stats::max()
{
  __assert_rtn("max", "stats.cpp", 178, "N > 0");
}

{
  __assert_rtn("max", "stats.cpp", 179, "x != NULL");
}

void stats::min()
{
  __assert_rtn("min", "stats.cpp", 191, "N > 0");
}

{
  __assert_rtn("min", "stats.cpp", 192, "x != NULL");
}

void stats::median_vdsp()
{
  __assert_rtn("median_vdsp", "stats.cpp", 234, "N > 0");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 235, "x != NULL");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 236, "pI != NULL");
}

void stats::percentile()
{
  __assert_rtn("percentile", "stats.cpp", 427, "N > 0");
}

{
  __assert_rtn("percentile", "stats.cpp", 428, "x != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 429, "pI != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 430, "ptile >= 0 && ptile <= 100");
}

void stats::meanMag()
{
  __assert_rtn("meanMag", "stats.cpp", 256, "N > 0");
}

{
  __assert_rtn("meanMag", "stats.cpp", 257, "x != NULL");
}

void stats::measqv()
{
  __assert_rtn("measqv", "stats.cpp", 268, "N > 0");
}

{
  __assert_rtn("measqv", "stats.cpp", 269, "x != NULL");
}

void stats::meassq()
{
  __assert_rtn("meassq", "stats.cpp", 280, "N > 0");
}

{
  __assert_rtn("meassq", "stats.cpp", 281, "x != NULL");
}

void stats::rmsqv()
{
  __assert_rtn("rmsqv", "stats.cpp", 292, "N > 0");
}

{
  __assert_rtn("rmsqv", "stats.cpp", 293, "x != NULL");
}

void stats::kurt()
{
  __assert_rtn("kurt", "stats.cpp", 304, "N > 0");
}

{
  __assert_rtn("kurt", "stats.cpp", 305, "pX != NULL");
}

void stats::median_filt()
{
  __assert_rtn("median_filt", "stats.cpp", 365, "N > 0");
}

{
  __assert_rtn("median_filt", "stats.cpp", 366, "x != NULL");
}

{
  __assert_rtn("median_filt", "stats.cpp", 367, "y != NULL");
}

void Tellurium::tellurium_classifier_t::tellurium_classifier_process(os_log_t log, float a2, float a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_235FAB000, log, OS_LOG_TYPE_DEBUG, "AfibMean:%f AfibStd:%f ", (uint8_t *)&v3, 0x16u);
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump()
{
  __assert_rtn("dump", "serializer.hpp", 363, "false");
}

{
  __assert_rtn("dump", "serializer.hpp", 138, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 139, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 166, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 167, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 208, "not val.m_value.array->empty()");
}

{
  __assert_rtn("dump", "serializer.hpp", 229, "not val.m_value.array->empty()");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped()
{
  __assert_rtn("dump_escaped", "serializer.hpp", 625, "false");
}

{
  __assert_rtn("dump_escaped", "serializer.hpp", 562, "false");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>()
{
  __assert_rtn("dump_integer", "serializer.hpp", 726, "n_chars < number_buffer.size() - 1");
}

void nlohmann::detail::to_chars<double>()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1082, "last - first >= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1092, "len <= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1100, "last - first >= 2 + (-kMinExp - 1) + std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1101, "last - first >= std::numeric_limits<FloatType>::max_digits10 + 6");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1064, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2<double>()
{
  __assert_rtn("grisu2", "to_chars.hpp", 890, "value > 0");
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 889, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::format_buffer()
{
  __assert_rtn("format_buffer", "to_chars.hpp", 979, "min_exp < 0");
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 980, "max_exp > 0");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 926, "e > -1000");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 927, "e < 1000");
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 1006, "k > n");
}

void nlohmann::detail::dtoa_impl::compute_boundaries<double>()
{
  __assert_rtn("compute_boundaries", "to_chars.hpp", 186, "value > 0");
}

{
  __assert_rtn("compute_boundaries", "to_chars.hpp", 185, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2()
{
  __assert_rtn("grisu2", "to_chars.hpp", 828, "m_plus.e == v.e");
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 827, "m_plus.e == m_minus.e");
}

void nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 466, "e >= -1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 467, "e <= 1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 472, "index >= 0");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 476, "kAlpha <= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 477, "kGamma >= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 473, "static_cast<std::size_t>(index) < kCachedPowers.size()");
}

void nlohmann::detail::dtoa_impl::grisu2_digit_gen()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 601, "M_plus.e >= kAlpha");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 602, "M_plus.e <= kGamma");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 623, "p1 > 0");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 659, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 757, "p2 <= (std::numeric_limits<std::uint64_t>::max)() / 10");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 766, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 746, "p2 > delta");
}

void nlohmann::detail::dtoa_impl::grisu2_round()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 545, "len >= 1");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 546, "dist <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 547, "rest <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 548, "ten_k > 0");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 573, "buf[len - 1] != '0'");
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

{
  return (std::string *)MEMORY[0x24BEDB630](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_250758A20(__p);
}

uint64_t operator delete()
{
  return off_250758A28();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250758A30(__sz);
}

uint64_t operator new()
{
  return off_250758A38();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t espresso_enable_autoinitialize()
{
  return MEMORY[0x24BE2FB48]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x24BDAEFB8](a2, a1);
  return result;
}

float nanf(const char *a1)
{
  float result;

  MEMORY[0x24BDAF000](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3220](__A, __IA, __C, __N);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3228](__A, __I, __C, __N);
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3230](__A, __IA, __C, __I, __N);
}

void vDSP_maxviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3238](__A, __IA, __C, __I, __N);
}

void vDSP_meamgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3240](__A, __IA, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3250](__A, __IA, __C, __N);
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3258](__A, __IA, __C, __N);
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3260](__A, __IA, __C, __N);
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3268](__A, __IA, __C, __N);
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3270](__A, __IA, __C, __I, __N);
}

void vDSP_minviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3278](__A, __IA, __C, __I, __N);
}

void vDSP_mvessq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32A8](__A, __IA, __C, __N);
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32C0](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB32F8](__A, __IA, __C, __IC, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3310](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vrampD(const double *__A, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3460](__A, __B, __C, __IC, __N);
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34C8](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsortD(double *__C, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3508](__C, __N, *(_QWORD *)&__Order);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3510](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsortiD(const double *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3518](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3538](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vtrapzD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3560](__A, __IA, __B, __C, __IC, __N);
}

