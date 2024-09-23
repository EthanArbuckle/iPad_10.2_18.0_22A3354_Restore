id hws_get_framework_log()
{
  if (hws_get_framework_log_onceToken != -1)
    dispatch_once(&hws_get_framework_log_onceToken, &__block_literal_global);
  return (id)hws_get_framework_log_log;
}

void __hws_get_framework_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BreathingAlgorithms", "framework");
  v1 = (void *)hws_get_framework_log_log;
  hws_get_framework_log_log = (uint64_t)v0;

}

void sub_23740D6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, BABreathingDisturbanceAnalysis *a11, void *a12, void *a13, uint64_t a14, void *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;

  if (__p)
    operator delete(__p);
  BABreathingDisturbanceAnalysis::~BABreathingDisturbanceAnalysis(a11);

  _Unwind_Resume(a1);
}

void std::vector<NebulaNotification::BDReport>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NebulaNotification::BDReport>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void BABreathingDisturbanceAnalysis::~BABreathingDisturbanceAnalysis(BABreathingDisturbanceAnalysis *this)
{

}

void std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2508A8410, MEMORY[0x24BEDAAF0]);
}

void sub_23740DA8C(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NebulaNotification::BDReport>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_23740DCCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23740DD58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23740E34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t *a41)
{
  void *v41;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a41);

  _Unwind_Resume(a1);
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(unsigned __int8 *a1, char *__s)
{
  int v4;
  _QWORD *v5;
  uint64_t **v6;
  uint64_t *v7;
  nlohmann::detail::exception *exception;
  char *v10;
  std::string v11;
  std::string __p;

  v4 = *a1;
  if (!*a1)
  {
    *a1 = 1;
    v5 = operator new(0x18uLL);
    v5[2] = 0;
    v5[1] = 0;
    *v5 = v5 + 1;
    *((_QWORD *)a1 + 1) = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    v4 = *a1;
  }
  if (v4 != 1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v10 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v11, v10);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("cannot use operator[] with a string argument with ", &v11, &__p);
    nlohmann::detail::type_error::create(305, (uint64_t)&__p, exception);
  }
  v6 = (uint64_t **)*((_QWORD *)a1 + 1);
  std::string::basic_string[abi:ne180100]<0>(&__p, __s);
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  v7 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v6, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, &v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v7 + 7;
}

void sub_23740E6F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t **nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(uint64_t **a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a1 + 1, *(unsigned __int8 *)a1);
  return a1;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::push_back(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  nlohmann::detail::exception *exception;
  char *v7;
  std::string v8;
  std::string v9;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v7 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v8, v7);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("cannot use push_back() with ", &v8, &v9);
      nlohmann::detail::type_error::create(308, (uint64_t)&v9, exception);
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
  return std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::push_back[abi:ne180100](*(uint64_t **)(a1 + 8), a2);
}

void sub_23740E870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  int v21;

  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

void writeJsonFile(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t *v6;
  char v7;
  _BYTE buf[408];
  _QWORD v9[20];

  v9[19] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  hws_get_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_23740B000, v4, OS_LOG_TYPE_DEFAULT, "writing to %{public}@", buf, 0xCu);
  }

  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "UTF8String");
  std::ofstream::basic_ofstream(buf);
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24) + 24] = 4;
  v6 = nlohmann::operator<<((uint64_t *)buf, a1);
  v7 = 10;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)&v7, 1);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)], *(_DWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24) + 32] | 4);
  *(_QWORD *)buf = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
  MEMORY[0x23B810EE4](&buf[8]);
  std::ostream::~ostream();
  MEMORY[0x23B810F74](v9);

}

void sub_23740EA50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23740F380(_Unwind_Exception *a1)
{
  BABreathingDisturbanceAnalysis *v1;
  void *v2;
  uint64_t v3;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)(v3 - 80));

  BABreathingDisturbanceAnalysis::~BABreathingDisturbanceAnalysis(v1);
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
  MEMORY[0x23B810ED8](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_23740F578(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x23B810F74](v1 + 416);
  _Unwind_Resume(a1);
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
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_2508A8690;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_2508A86E0;
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

void sub_23740F788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, std::locale a13, char a14)
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
  MEMORY[0x23B810EE4](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x23B810F74](a1 + 52);
  return a1;
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

  MEMORY[0x23B810F08](v13, a1);
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
  MEMORY[0x23B810F14](v13);
  return a1;
}

void sub_23740F924(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x23B810F14](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23740F904);
}

void sub_23740F96C(_Unwind_Exception *a1)
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

void sub_23740FAA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
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
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2508A8690;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2508A8690;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B810FC8);
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
  JUMPOUT(0x23B810FC8);
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

void sub_2374107D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
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
  char *v28;
  std::string::size_type v29;
  std::string *v30;
  __int128 v31;
  uint64_t *v32;
  nlohmann::detail::exception *v33;
  std::string v34;
  std::string v35;
  std::string v36;
  __int128 v37;
  std::string::size_type v38;
  char __str[8];
  std::string::size_type v40;
  char v41;
  char v42;
  unsigned int v43[3];

  v42 = 0;
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
  v43[0] = 0;
  v12 = result + 90;
  do
  {
    if ((v3 & 1) != 0)
      v13 = (uint64_t *)*a2;
    else
      v13 = a2;
    v14 = *((unsigned __int8 *)v13 + v8);
    result = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(&v42, v43, v14);
    if ((_DWORD)result == 1)
    {
      v16 = *((_DWORD *)v7 + 158);
      if ((v16 - 1) >= 2)
      {
        if (!v16)
        {
          v41 = 3;
          *(_DWORD *)__str = 0;
          snprintf(__str, 3uLL, "%.2X", v14);
          exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
          std::to_string(&v34, v8);
          std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("invalid UTF-8 byte at index ", &v34, &v35);
          std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(": 0x", &v35, &v36);
          if (v41 >= 0)
            v28 = __str;
          else
            v28 = *(char **)__str;
          if (v41 >= 0)
            v29 = v41;
          else
            v29 = v40;
          v30 = std::string::append(&v36, v28, v29);
          v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          v38 = v30->__r_.__value_.__r.__words[2];
          v37 = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::type_error::create(316, (uint64_t)&v37, exception);
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
      v42 = 0;
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
      switch(v43[0])
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
          if (v43[0] == 34)
          {
            v15 = 8796;
            goto LABEL_43;
          }
          if (v43[0] == 92)
          {
            v15 = 23644;
LABEL_43:
            *(_WORD *)(v12 + v11) = v15;
            v11 += 2;
            goto LABEL_44;
          }
LABEL_29:
          if (v43[0] > 0x7E)
            v20 = a3;
          else
            v20 = 0;
          if (v43[0] < 0x20 || v20)
          {
            v24 = (char *)(v12 + v11);
            if (HIWORD(v43[0]))
            {
              result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v43[0] >> 10) - 10304), v43[0] & 0x3FF | 0xDC00);
              v11 += 12;
            }
            else
            {
              result = snprintf(v24, 7uLL, "\\u%04x", v43[0]);
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
  if (v42)
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
        v41 = 3;
        *(_DWORD *)__str = 0;
        v32 = (uint64_t *)*a2;
        if (v22 >= 0)
          v32 = a2;
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v32 + v23 - 1));
        v33 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        nlohmann::detail::type_error::create(316, (uint64_t)&v37, v33);
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

void sub_237410D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  void *v37;
  int v38;
  uint64_t v39;

  if (a37 < 0)
  {
    operator delete(__p);
    if ((v38 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v39 - 97) < 0)
        operator delete(*(void **)(v39 - 120));
      _Unwind_Resume(a1);
    }
  }
  else if (!v38)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v37);
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
  *(_QWORD *)a3 = &unk_2508A8768;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_23741138C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__n128 std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<Q0>(char *__s@<X1>, std::string *a2@<X0>, std::string *a3@<X8>)
{
  std::string::size_type v6;
  __n128 *v7;
  __n128 result;

  v6 = strlen(__s);
  v7 = (__n128 *)std::string::append(a2, __s, v6);
  result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

__n128 std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<Q0>(const char *a1@<X0>, std::string *a2@<X1>, std::string *a3@<X8>)
{
  std::string::size_type v6;
  __n128 *v7;
  __n128 result;

  v6 = strlen(a1);
  v7 = (__n128 *)std::string::insert(a2, 0, a1, v6);
  result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

void nlohmann::detail::type_error::~type_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_2508A8790;
  MEMORY[0x23B810E84](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_2508A8790;
  MEMORY[0x23B810E84](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x23B810FC8);
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
  v4 = std::string::append(&v12, ".", 1uLL);
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
  v10 = std::string::append(&v14, "] ", 2uLL);
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

void sub_2374115E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(_QWORD *)this = &unk_2508A8790;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x23B810E78]((char *)this + 16, a3);
  return this;
}

void sub_237411738(_Unwind_Exception *a1)
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
  this->__vftable = (std::exception_vtbl *)&unk_2508A8790;
  MEMORY[0x23B810E84](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_2508A8790;
  MEMORY[0x23B810E84](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x23B810FC8);
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
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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

void sub_2374127A0(_Unwind_Exception *a1, uint64_t a2, ...)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
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
    std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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

void sub_237412C90(_Unwind_Exception *a1, uint64_t a2, ...)
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

const char *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 9)
    return "number";
  else
    return off_2508A87A8[v1];
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, _OWORD **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v5 = a1 + 8;
  v6 = operator new(0x48uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  v7 = *a2;
  v8 = *((_QWORD *)*a2 + 2);
  v6[2] = **a2;
  *((_QWORD *)v6 + 6) = v8;
  *v7 = 0;
  v7[1] = 0;
  v7[2] = 0;
  *((_QWORD *)v6 + 8) = 0;
  *((_BYTE *)v6 + 56) = 0;
  v9 = (uint64_t)v6 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v6 + 56);
  result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
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

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
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

void sub_237413348(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[3],char [3],0>(uint64_t a1, char *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[3]>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[3]>(char *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_2374133D8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>(uint64_t a1, char *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[6]>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[6]>(char *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_237413468(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[4],char [4],0>(uint64_t a1, char *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[4]>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[4]>(char *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_2374134F8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
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

void sub_237413694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a3 + 8), *(void ***)(*v8 + 8), *(_QWORD *)(*v8 + 8), *v8 + 16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v7);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_23741375C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
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

void sub_2374137D0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[](uint64_t a1, uint64_t a2)
{
  nlohmann::detail::exception *exception;
  char *v5;
  std::string v6;
  std::string v7;

  if (*(_BYTE *)a1 != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v6, v5);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("cannot use operator[] with a numeric argument with ", &v6, &v7);
    nlohmann::detail::type_error::create(305, (uint64_t)&v7, exception);
  }
  return **(_QWORD **)(a1 + 8) + 16 * a2;
}

void sub_237413890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  int v21;

  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
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
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(_QWORD *)(a2 + 8));
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

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)operator new(0x18uLL);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](v2, a1);
  return v2;
}

void sub_237413A2C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(a1, *(void ***)a2, (void **)(a2 + 8));
  return a1;
}

void sub_237413A7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(uint64_t *result, void **a2, void **a3)
{
  void **v4;
  uint64_t **v5;
  uint64_t v6;
  void **v7;
  void **v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = (uint64_t)(result + 1);
    do
    {
      result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (void **)v4[2];
          v9 = *v8 == v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t **a1, uint64_t a2, void **a3, __int128 *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  void **v10;

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

void **std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(_QWORD *a1, uint64_t a2, void ***a3, uint64_t *a4, void **a5)
{
  void **v9;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void **v14;
  void **v15;
  _QWORD *v16;
  BOOL v17;
  void **v19;

  v9 = (void **)(a1 + 1);
  if (a1 + 1 == (_QWORD *)a2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, (void **)(a2 + 32)) & 0x80) != 0)
  {
    if (*a1 == a2)
    {
      v12 = (_QWORD *)a2;
    }
    else
    {
      v11 = *(_QWORD **)a2;
      if (*(_QWORD *)a2)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)v11[1];
        }
        while (v11);
      }
      else
      {
        v16 = (_QWORD *)a2;
        do
        {
          v12 = (_QWORD *)v16[2];
          v17 = *v12 == (_QWORD)v16;
          v16 = v12;
        }
        while (v17);
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v12 + 4, a5) & 0x80) == 0)
        return (void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
    }
    if (*(_QWORD *)a2)
    {
      *a3 = (void **)v12;
      return (void **)(v12 + 1);
    }
    else
    {
      *a3 = (void **)a2;
      return (void **)a2;
    }
  }
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((_QWORD *)(a2 + 32), a5) & 0x80) != 0)
  {
    a4 = (uint64_t *)(a2 + 8);
    v13 = *(_QWORD *)(a2 + 8);
    if (v13)
    {
      v14 = *(void ***)(a2 + 8);
      do
      {
        v15 = v14;
        v14 = (void **)*v14;
      }
      while (v14);
    }
    else
    {
      v19 = (void **)a2;
      do
      {
        v15 = (void **)v19[2];
        v17 = *v15 == v19;
        v19 = v15;
      }
      while (!v17);
    }
    if (v15 == v9)
      goto LABEL_27;
    if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, v15 + 4) & 0x80) != 0)
    {
      v13 = *a4;
LABEL_27:
      if (v13)
      {
        *a3 = v15;
        return v15;
      }
      else
      {
        *a3 = (void **)a2;
      }
      return (void **)a4;
    }
    return (void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  *a3 = (void **)a2;
  *a4 = a2;
  return (void **)a4;
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

void sub_237413D80(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
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

void sub_237413DF4(_Unwind_Exception *exception_object)
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

void sub_237413EE0(_Unwind_Exception *a1)
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

void sub_237413F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
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
    std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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

void sub_237414044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

void sub_237414148(_Unwind_Exception *a1)
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

void sub_2374141A4(_Unwind_Exception *a1)
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

void sub_237414214(_Unwind_Exception *exception_object)
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
    std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, void **a2, uint64_t a3, uint64_t a4)
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

void sub_2374143E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
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

void sub_23741448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
    v11 = v5 - *a1;
    v12 = v11 >> 3;
    if (v11 >> 3 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v19 = v4;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v4, v13);
    else
      v14 = 0;
    v15 = v14;
    v16 = &v14[16 * v10];
    v18 = &v14[16 * v13];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v16, a2);
    v17 = v16 + 16;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
    v9 = a1[1];
    result = std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(*(_QWORD *)(v4 - 8), a2);
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return result;
}

void sub_237414608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

NebulaNotification::Processor *NebulaNotification::Processor::Processor(NebulaNotification::Processor *this)
{
  NebulaNotification *v2;
  NSObject *log;
  uint64_t v4;
  uint64_t v5;

  v2 = (NebulaNotification *)operator new();
  *(_QWORD *)this = v2;
  log = NebulaNotification::algs_get_log(v2);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    NebulaNotification::Processor::Processor(log, v4, v5);
  return this;
}

void sub_237414680(_Unwind_Exception *exception_object)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *v1 = 0;
  if (v3)
    MEMORY[0x23B810FC8](v3, 0xC400A2AC0F1);
  _Unwind_Resume(exception_object);
}

void NebulaNotification::Processor::~Processor(NebulaNotification::Processor *this)
{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  *(_QWORD *)this = 0;
  if (v2)
    MEMORY[0x23B810FC8](v2, 0xC400A2AC0F1);
}

void NebulaNotification::Processor::process(int **a1@<X1>, uint64_t a2@<X8>)
{
  NebulaNotification::Processor::Impl::process(a1, a2);
}

void NebulaNotification::Processor::Impl::process(int **a1@<X1>, uint64_t a2@<X8>)
{
  unint64_t v4;
  NebulaNotification *v5;
  NSObject *log;
  _BOOL4 v7;
  __int128 v8;
  int *v9;
  int *v10;
  float v11;
  const float *v12;
  _BYTE *v13;
  float v14;
  NebulaNotification *v15;
  NSObject *v16;
  __int128 v17;
  void *__p;
  _BYTE *v19;
  uint64_t v20;
  _OWORD v21[3];
  float v22;
  void **p_p;

  memset(v21, 0, 44);
  NebulaNotification::Processor::Impl::get_coreanalytics(a1, (uint64_t)v21);
  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a1[1] - (char *)*a1) >> 3);
  log = NebulaNotification::algs_get_log(v5);
  v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v4 > 9)
  {
    if (v7)
      NebulaNotification::Processor::Impl::process();
    __p = 0;
    v19 = 0;
    v20 = 0;
    v10 = *a1;
    v9 = a1[1];
    p_p = &__p;
    if (v10 == v9)
    {
      v13 = 0;
      v12 = 0;
    }
    else
    {
      do
      {
        if (*(float *)v10 < 11.0)
          v11 = 0.0;
        else
          v11 = 1.0;
        v22 = v11;
        std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&p_p, &v22);
        v10 += 6;
      }
      while (v10 != v9);
      v12 = (const float *)__p;
      v13 = v19;
    }
    v14 = NebulaNotification::mean<float>(v12, (v13 - (_BYTE *)v12) >> 2);
    LOBYTE(v21[0]) = v14 < 0.5;
    v16 = NebulaNotification::algs_get_log(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      NebulaNotification::Processor::Impl::process(v14 >= 0.5, v16, v14);
    *(_BYTE *)a2 = v14 >= 0.5;
    v17 = v21[1];
    *(_OWORD *)(a2 + 4) = v21[0];
    *(_OWORD *)(a2 + 20) = v17;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)((char *)&v21[1] + 12);
    if (__p)
    {
      v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (v7)
      NebulaNotification::Processor::Impl::process();
    LOBYTE(v21[0]) = 2;
    *(_BYTE *)a2 = 0;
    v8 = v21[0];
    *(_OWORD *)(a2 + 20) = v21[1];
    *(_OWORD *)(a2 + 32) = *(_OWORD *)((char *)&v21[1] + 12);
    *(_OWORD *)(a2 + 4) = v8;
  }
}

void sub_2374148B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void NebulaNotification::Processor::Impl::get_coreanalytics(int **a1@<X1>, uint64_t a2@<X8>)
{
  int *v3;
  int *v4;
  float *v5;
  float *v6;
  uint64_t v7;
  float *v8;
  float v9;
  unint64_t v10;
  float v11;
  uint64_t v12;
  float *v13;
  float v14;
  uint64_t v15;
  float *v16;
  float v17;
  uint64_t v18;
  float *v19;
  float v20;
  float v21;
  float v22;
  float *v23;
  float *v24;
  const float *v25;
  float v26;
  float v27;
  const float *v28;
  const float *v29;
  float *v30;
  float v31;
  float v32;
  float *v33;
  float *v34;
  float v35;
  float v36;
  float *v37;
  const float *v38;
  uint64_t v39;
  int v40;
  const float **v41;

  *(_OWORD *)(a2 + 28) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_BYTE *)a2 = 2;
  v4 = *a1;
  v3 = a1[1];
  if (v3 == *a1)
    return;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v41 = (const float **)&v37;
  do
  {
    v40 = *v4;
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v41, &v40);
    v4 += 6;
  }
  while (v4 != v3);
  v5 = v37;
  v6 = (float *)v38;
  if (v37 == v38)
  {
    v10 = v38 - v37;
    v11 = (float)v10;
    *(float *)(a2 + 4) = (float)(0.0 / (float)v10) * 100.0;
  }
  else
  {
    v7 = 0;
    v8 = v37;
    do
    {
      v9 = *v8++;
      if (v9 >= 10.0)
        ++v7;
    }
    while (v8 != v38);
    v10 = v38 - v37;
    v11 = (float)v10;
    *(float *)(a2 + 4) = (float)((float)v7 / (float)v10) * 100.0;
    if (v6 != v5)
    {
      v12 = 0;
      v13 = v5;
      do
      {
        v14 = *v13++;
        if (v14 >= 11.0)
          ++v12;
      }
      while (v13 != v6);
      v15 = 0;
      *(float *)(a2 + 8) = (float)((float)v12 / v11) * 100.0;
      v16 = v5;
      do
      {
        v17 = *v16++;
        if (v17 >= 12.0)
          ++v15;
      }
      while (v16 != v6);
      v18 = 0;
      *(float *)(a2 + 12) = (float)((float)v15 / v11) * 100.0;
      v19 = v5;
      do
      {
        v20 = *v19++;
        if (v20 >= 13.0)
          ++v18;
      }
      while (v19 != v6);
      v21 = (float)v18;
      goto LABEL_25;
    }
  }
  v21 = 0.0;
  v22 = (float)(0.0 / v11) * 100.0;
  *(float *)(a2 + 8) = v22;
  *(float *)(a2 + 12) = v22;
LABEL_25:
  *(float *)(a2 + 16) = (float)(v21 / v11) * 100.0;
  *(_DWORD *)(a2 + 20) = v10;
  *(float *)(a2 + 24) = NebulaNotification::median<float>(v5, v10);
  *(float *)(a2 + 28) = NebulaNotification::mean<float>(v37, v38 - v37);
  *(float *)(a2 + 32) = NebulaNotification::standard_deviation<float>(v37, v38 - v37, 1);
  v23 = v37;
  v24 = (float *)v38;
  v25 = v37 + 1;
  v26 = *v37;
  if (v37 == v38 || v25 == v38)
  {
    *(float *)(a2 + 36) = v26;
  }
  else
  {
    v27 = *v37;
    v28 = v37 + 1;
    v29 = v37;
    v30 = v37 + 1;
    do
    {
      v31 = *v30++;
      v32 = v31;
      if (v27 < v31)
      {
        v27 = v32;
        v29 = v28;
      }
      v28 = v30;
    }
    while (v30 != v38);
    *(float *)(a2 + 36) = *v29;
    v33 = v23;
    v34 = (float *)v25;
    do
    {
      v35 = *v34++;
      v36 = v35;
      if (v35 < v26)
      {
        v26 = v36;
        v33 = (float *)v25;
      }
      v25 = v34;
    }
    while (v34 != v24);
    v26 = *v33;
  }
  *(float *)(a2 + 40) = v26;
  v38 = v23;
  operator delete(v23);
}

void sub_237414B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v6, v12);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void NebulaNotification::Processor::Processor(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "1.0.3";
  OUTLINED_FUNCTION_0_0(&dword_23740B000, a1, a3, "Nebula Notification Algs Version: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

void NebulaNotification::Processor::Impl::process()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  v3 = 134217984;
  v4 = v0 / v1;
  OUTLINED_FUNCTION_0_0(&dword_23740B000, v2, (uint64_t)v2, "Nebula Notification BD length lower than 10: %zu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_0(*MEMORY[0x24BDAC8D0]);
  v3 = 134217984;
  v4 = v0 / v1;
  OUTLINED_FUNCTION_0_0(&dword_23740B000, v2, (uint64_t)v2, "Nebula Notification BD length: %zu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

void NebulaNotification::Processor::Impl::process(char a1, NSObject *a2, float a3)
{
  const char *v3;
  double v4;
  int v5;
  double v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = "false";
  v4 = a3;
  if ((a1 & 1) != 0)
    v3 = "true";
  v5 = 134218242;
  v6 = v4;
  v7 = 2080;
  v8 = v3;
  _os_log_debug_impl(&dword_23740B000, a2, OS_LOG_TYPE_DEBUG, "Nebula Notification BD Portion: %f, Result: %s", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t NebulaNotification::algs_get_log(NebulaNotification *this)
{
  if (NebulaNotification::algs_get_log(void)::onceToken != -1)
    dispatch_once(&NebulaNotification::algs_get_log(void)::onceToken, &__block_literal_global_0);
  return NebulaNotification::algs_get_log(void)::log;
}

os_log_t ___ZN18NebulaNotification12algs_get_logEv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.BreathingAlgorithms", "nebula_notification_algs");
  NebulaNotification::algs_get_log(void)::log = (uint64_t)result;
  return result;
}

float NebulaNotification::mean<float>(const float *a1, vDSP_Length __N)
{
  float __C;

  if (!__N)
    NebulaNotification::mean<float>();
  if (!a1)
    NebulaNotification::mean<float>();
  __C = 0.0;
  vDSP_meanv(a1, 1, &__C, __N);
  return __C;
}

double NebulaNotification::mean<double>(const double *a1, vDSP_Length __N)
{
  double __C;

  if (!__N)
    NebulaNotification::mean<float>();
  if (!a1)
    NebulaNotification::mean<float>();
  __C = 0.0;
  vDSP_meanvD(a1, 1, &__C, __N);
  return __C;
}

float NebulaNotification::auc<float>(const float *a1, vDSP_Length __N, float a3)
{
  float __C;

  __C = 0.0;
  vDSP_sve(a1, 1, &__C, __N);
  return __C * a3;
}

double NebulaNotification::auc<double>(const double *a1, vDSP_Length __N, double a3)
{
  double __C;

  __C = 0.0;
  vDSP_sveD(a1, 1, &__C, __N);
  return __C * a3;
}

float NebulaNotification::variance<float>(const float *a1, unint64_t a2, int a3)
{
  float v6;
  float *__B[3];
  uint64_t __C;

  if (!a2)
    NebulaNotification::variance<float>();
  if (!a1)
    NebulaNotification::variance<float>();
  __C = 0;
  std::vector<float>::vector(__B, a2);
  vDSP_meanv(a1, 1, (float *)&__C + 1, a2);
  vDSP_vsub(a1, 1, (const float *)&__C + 1, 0, __B[0], 1, a2);
  vDSP_dotpr(__B[0], 1, __B[0], 1, (float *)&__C, a2);
  v6 = *(float *)&__C / (float)(a2 - (a3 ^ 1));
  *(float *)&__C = v6;
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
  return v6;
}

void sub_2374150F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double NebulaNotification::variance<double>(const double *a1, unint64_t a2, int a3)
{
  double v6;
  double *__B[3];
  double v9;
  double __C;

  if (!a2)
    NebulaNotification::variance<float>();
  if (!a1)
    NebulaNotification::variance<float>();
  v9 = 0.0;
  __C = 0.0;
  std::vector<double>::vector(__B, a2);
  vDSP_meanvD(a1, 1, &__C, a2);
  vDSP_vsubD(a1, 1, &__C, 0, __B[0], 1, a2);
  vDSP_dotprD(__B[0], 1, __B[0], 1, &v9, a2);
  v6 = v9 / (double)(a2 - (a3 ^ 1u));
  v9 = v6;
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
  return v6;
}

void sub_2374151E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float NebulaNotification::standard_deviation<float>(const float *a1, unint64_t a2, int a3)
{
  if (!a2)
    NebulaNotification::standard_deviation<float>();
  if (!a1)
    NebulaNotification::standard_deviation<float>();
  return sqrtf(NebulaNotification::variance<float>(a1, a2, a3));
}

double NebulaNotification::standard_deviation<double>(const double *a1, unint64_t a2, int a3)
{
  if (!a2)
    NebulaNotification::standard_deviation<float>();
  if (!a1)
    NebulaNotification::standard_deviation<float>();
  return sqrt(NebulaNotification::variance<double>(a1, a2, a3));
}

float NebulaNotification::range<float>(const float *__A, vDSP_Length __N)
{
  uint64_t __C;

  if (!__N)
    NebulaNotification::range<float>();
  if (!__A)
    NebulaNotification::range<float>();
  __C = 0;
  vDSP_maxv(__A, 1, (float *)&__C + 1, __N);
  vDSP_minv(__A, 1, (float *)&__C, __N);
  return *((float *)&__C + 1) - *(float *)&__C;
}

double NebulaNotification::range<double>(const double *__A, vDSP_Length __N)
{
  double v5;
  double __C;

  if (!__N)
    NebulaNotification::range<float>();
  if (!__A)
    NebulaNotification::range<float>();
  v5 = 0.0;
  __C = 0.0;
  vDSP_maxvD(__A, 1, &__C, __N);
  vDSP_minvD(__A, 1, &v5, __N);
  return __C - v5;
}

float NebulaNotification::median<float>(_DWORD *a1, unint64_t a2)
{
  float v4;
  float *v5;
  float *v6;
  unint64_t v7;
  unint64_t v8;
  float *v9;
  float v10;
  float *v11;
  float v12;
  unint64_t v13;
  float *v14;
  void *__p;
  float *v17;
  uint64_t v18;

  if (!a2)
    NebulaNotification::median<float>();
  if (!a1)
    NebulaNotification::median<float>();
  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<float>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(a1, &a1[a2], (uint64_t)&__p);
  v5 = (float *)__p;
  v6 = v17;
  v7 = ((char *)v17 - (_BYTE *)__p) >> 2;
  if ((a2 & 1) != 0)
  {
    v13 = (2 * v7 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    v14 = (float *)((char *)__p + v13);
    if ((char *)__p + v13 != (char *)v17)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v13), v17, v4);
    v12 = *v14;
  }
  else
  {
    v8 = v7 >> 1;
    v9 = (float *)((char *)__p + 4 * v8 - 4);
    if (v9 != v17)
    {
      v4 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v8 - 1, v17, v4);
      v5 = (float *)__p;
      v6 = v17;
      v8 = (unint64_t)(((char *)v17 - (_BYTE *)__p) >> 2) >> 1;
    }
    v10 = *v9;
    v11 = &v5[v8];
    if (v11 != v6)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v5, &v5[v8], v6, v4);
    v12 = (float)(v10 + *v11) * 0.5;
  }
  if (__p)
  {
    v17 = (float *)__p;
    operator delete(__p);
  }
  return v12;
}

void sub_237415430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
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
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
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

double NebulaNotification::median<double>(_QWORD *a1, unint64_t a2)
{
  double v4;
  double *v5;
  double *v6;
  unint64_t v7;
  unint64_t v8;
  double *v9;
  double v10;
  double *v11;
  double v12;
  unint64_t v13;
  double *v14;
  void *__p;
  double *v17;
  uint64_t v18;

  if (!a2)
    NebulaNotification::median<float>();
  if (!a1)
    NebulaNotification::median<float>();
  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<double>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,double const*,double const*,std::back_insert_iterator<std::vector<double>>,0>(a1, &a1[a2], (uint64_t)&__p);
  v5 = (double *)__p;
  v6 = v17;
  v7 = ((char *)v17 - (_BYTE *)__p) >> 3;
  if ((a2 & 1) != 0)
  {
    v13 = (4 * v7 - 4) & 0xFFFFFFFFFFFFFFF8;
    v14 = (double *)((char *)__p + v13);
    if ((char *)__p + v13 != (char *)v17)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)((char *)__p + v13), v17, v4);
    v12 = *v14;
  }
  else
  {
    v8 = v7 >> 1;
    v9 = (double *)((char *)__p + 8 * v8 - 8);
    if (v9 != v17)
    {
      v4 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)__p + v8 - 1, v17, v4);
      v5 = (double *)__p;
      v6 = v17;
      v8 = (unint64_t)(((char *)v17 - (_BYTE *)__p) >> 3) >> 1;
    }
    v10 = *v9;
    v11 = &v5[v8];
    if (v11 != v6)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v5, &v5[v8], v6, v4);
    v12 = (v10 + *v11) * 0.5;
  }
  if (__p)
  {
    v17 = (double *)__p;
    operator delete(__p);
  }
  return v12;
}

void sub_2374155F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
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
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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

float NebulaNotification::percentile<float>(uint64_t a1, unint64_t a2, float a3)
{
  double v4;
  int v5;

  if (!a2)
    return NAN;
  if (!a1)
    NebulaNotification::percentile<float>();
  if (a2 == 1)
    return *(float *)a1;
  v4 = a3 / 100.0 * ((float)a2 + -1.0);
  v5 = vcvtmd_s64_f64(v4);
  return *(float *)(a1 + 4 * v5)
       + (float)((float)(*(float *)(a1 + 4 * v5 + 4) - *(float *)(a1 + 4 * v5)) * (float)(int)(v4 - (double)v5));
}

double NebulaNotification::percentile<double>(uint64_t a1, unint64_t a2, double a3)
{
  double v4;
  int v5;

  if (!a2)
    return NAN;
  if (!a1)
    NebulaNotification::percentile<float>();
  if (a2 == 1)
    return *(double *)a1;
  v4 = a3 / 100.0 * ((double)a2 + -1.0);
  v5 = vcvtmd_s64_f64(v4);
  return *(double *)(a1 + 8 * v5)
       + (*(double *)(a1 + 8 * v5 + 8) - *(double *)(a1 + 8 * v5)) * (double)(int)(v4 - (double)v5);
}

float NebulaNotification::percentile<float>(uint64_t *a1, float a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  float v8;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 == v3)
    return NAN;
  v4 = v3 - v2;
  if (v4 == 4)
    return *(float *)v2;
  v6 = a2 / 100.0 * ((float)(unint64_t)(v4 >> 2) + -1.0);
  v7 = floor(v6);
  v8 = *(float *)(v2 + 4 * vcvtmd_u64_f64(v6));
  return v8 + (float)(*(float *)(v2 + 4 * (unint64_t)(v7 + 1.0)) - v8) * (v6 - v7);
}

double NebulaNotification::percentile<double>(uint64_t *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  unint64_t v8;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 == v3)
    return NAN;
  v4 = v3 - v2;
  if (v4 == 8)
    return *(double *)v2;
  v6 = a2 / 100.0 * ((double)(unint64_t)(v4 >> 3) + -1.0);
  v7 = floor(v6);
  v8 = vcvtmd_u64_f64(v6);
  return *(double *)(v2 + 8 * v8)
       + (*(double *)(v2 + 8 * (unint64_t)(v7 + 1.0)) - *(double *)(v2 + 8 * v8)) * (v6 - v7);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_237415908(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
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

void sub_2374159BC(_Unwind_Exception *exception_object)
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
    std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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
      std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
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

void NebulaNotification::mean<float>()
{
  __assert_rtn("mean", "statistics.cpp", 20, "N > 0");
}

{
  __assert_rtn("mean", "statistics.cpp", 21, "x != NULL");
}

void NebulaNotification::variance<float>()
{
  __assert_rtn("variance", "statistics.cpp", 34, "N > 0");
}

{
  __assert_rtn("variance", "statistics.cpp", 35, "x != NULL");
}

void NebulaNotification::standard_deviation<float>()
{
  __assert_rtn("standard_deviation", "statistics.cpp", 149, "N > 0");
}

{
  __assert_rtn("standard_deviation", "statistics.cpp", 150, "x != NULL");
}

void NebulaNotification::range<float>()
{
  __assert_rtn("range", "statistics.cpp", 134, "N > 0");
}

{
  __assert_rtn("range", "statistics.cpp", 135, "x != NULL");
}

void NebulaNotification::median<float>()
{
  __assert_rtn("median", "statistics.cpp", 54, "N > 0");
}

{
  __assert_rtn("median", "statistics.cpp", 55, "x != NULL");
}

void NebulaNotification::percentile<float>()
{
  __assert_rtn("percentile", "statistics.cpp", 119, "x != NULL");
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

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
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
  off_2508A8438(__p);
}

uint64_t operator delete()
{
  return off_2508A8440();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2508A8448(__sz);
}

uint64_t operator new()
{
  return off_2508A8450();
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

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D8](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3220](__A, __IA, __C, __N);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3228](__A, __I, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3250](__A, __IA, __C, __N);
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3260](__A, __IA, __C, __N);
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3268](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D8](__A, __I, __C, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3538](__B, __IB, __A, __IA, __C, __IC, __N);
}

