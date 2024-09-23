uint64_t JetPack::signingChunkForDataBlock@<X0>(char **a1@<X0>, char **a2@<X1>, _QWORD *a3@<X8>)
{
  int64_t v6;
  int64_t v7;
  int64_t v8;
  char *v9;
  uint64_t result;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  __int16 v15;
  _QWORD *i;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v6 = a2[1] - *a2;
  v7 = a1[1] - *a1;
  v8 = v7 + v6;
  if (v7 + v6)
  {
    if (v8 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v9 = (char *)operator new(v7 + v6);
    *a3 = v9;
    a3[1] = v9;
    a3[2] = &v9[v8];
  }
  v15 = v6;
  i = a3;
  std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)&v15);
  result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)&v15 + 1);
  v12 = *a2;
  v11 = a2[1];
  for (i = a3; v12 != v11; ++v12)
    result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, v12);
  v14 = *a1;
  v13 = a1[1];
  for (i = a3; v14 != v13; ++v14)
    result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, v14);
  return result;
}

void sub_20DA5B348(_Unwind_Exception *exception_object)
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

_QWORD *JetPackCreateFileStream(const char *a1)
{
  const char *v2;

  v2 = a1;
  return makePublicRef<JetPackStream,JetPack::FileStream,char const*&>(&v2);
}

_QWORD *makePublicRef<JetPackStream,JetPack::FileStream,char const*&>(const char **a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)operator new();
  *v2 = 0;
  v2[1] = 0;
  v3 = operator new(0x30uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = &unk_24C804D00;
  *v2 = JetPack::FileStream::FileStream((JetPack::FileStream *)(v3 + 3), *a1);
  v2[1] = v3;
  return v2;
}

void sub_20DA5B4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  std::__shared_weak_count *v9;
  void *v12;
  void *v13;
  NSObject *GlobalLog;
  uint64_t v15;

  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  if (a2 == 1)
  {
    v13 = __cxa_begin_catch(a1);
    GlobalLog = getGlobalLog();
    if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
    {
      v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v13 + 16))(v13);
      LODWORD(a9) = 136446210;
      *(_QWORD *)((char *)&a9 + 4) = v15;
      _os_log_impl(&dword_20DA5A000, GlobalLog, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x20DA5B4BCLL);
  }
  _Unwind_Resume(a1);
}

JetPack::FileStream *JetPack::FileStream::FileStream(JetPack::FileStream *this, const char *__s)
{
  size_t v4;
  std::string::size_type v5;
  std::string *p_dst;
  uint64_t v7;
  uint64_t v8;
  int v9;
  FILE *File;
  std::string __dst;
  std::string v13;

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
    p_dst = (std::string *)operator new(v7 + 1);
    __dst.__r_.__value_.__l.__size_ = v5;
    __dst.__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v4;
  p_dst = &__dst;
  if (v4)
LABEL_8:
    memcpy(p_dst, __s, v5);
  p_dst->__r_.__value_.__s.__data_[v5] = 0;
  *(_QWORD *)this = &off_24C8040C8;
  v9 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v13, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v13 = __dst;
  File = JetPack::FileStream::makeFile((const char *)&v13);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  *((_QWORD *)this + 1) = File;
  *((_BYTE *)this + 16) = 1;
  if (v9 < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  return this;
}

void sub_20DA5B6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  operator delete(__p);
  _Unwind_Resume(a1);
}

FILE *JetPack::FileStream::makeFile(const char *a1)
{
  FILE *result;
  JetPack::UnableToOpenFileException *exception;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = fopen(a1, "rb");
  if (!result)
  {
    exception = (JetPack::UnableToOpenFileException *)__cxa_allocate_exception(0x20uLL);
    JetPack::UnableToOpenFileException::UnableToOpenFileException(exception);
  }
  return result;
}

void sub_20DA5B774(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t JetPack::readDataSegment(uint64_t a1, JetPack **a2)
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  char v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::exception v15[3];
  char v16;
  JetPack *v17;
  std::__shared_weak_count *v18;
  std::string buf;
  std::string v20;

  v20.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v20.__r_.__value_.__r.__words[1] = xmmword_20DA6E530;
  strcpy(v20.__r_.__value_.__l.__data_, "UnableToParseDataSegment");
  JetPack::ParseException::ParseException(v15, (uint64_t)&v20);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  v15[0].__vftable = (std::exception_vtbl *)&unk_24C804798;
  JetPack::parseDataSegmentHeader(*a2, (JetPack::BaseStream *)(a1 + 16), (char *)&v20);
  if (!*(_BYTE *)(a1 + 144))
  {
LABEL_20:
    v13 = 1;
    if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v4 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_20DA5A000, v4, OS_LOG_TYPE_DEBUG, "Found data segment handler", (uint8_t *)&buf, 2u);
    if (!*(_BYTE *)(a1 + 144))
      std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&buf, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
  else
    buf = v20;
  v5 = (std::__shared_weak_count *)a2[1];
  v17 = *a2;
  v18 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = *(_QWORD *)(a1 + 136);
  if (!v8)
    std::__throw_bad_function_call[abi:ne180100]();
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, JetPack **))(*(_QWORD *)v8 + 48))(v8, a1, &buf, &v17);
  v10 = v18;
  if (!v18)
    goto LABEL_17;
  v11 = (unint64_t *)&v18->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (v12)
  {
LABEL_17:
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_18;
LABEL_26:
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v9 & 1) != 0)
      goto LABEL_19;
    goto LABEL_27;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_26;
LABEL_18:
  if ((v9 & 1) != 0)
  {
LABEL_19:
    (*(void (**)(JetPack *))(*(_QWORD *)*a2 + 40))(*a2);
    goto LABEL_20;
  }
LABEL_27:
  v13 = 0;
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
LABEL_21:
    operator delete(v20.__r_.__value_.__l.__data_);
LABEL_22:
  v15[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v16 < 0)
    operator delete(v15[1].__vftable);
  std::exception::~exception(v15);
  return v13;
}

void sub_20DA5B9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;

  if (*(char *)(v20 - 33) < 0)
  {
    operator delete(*(void **)(v20 - 56));
    if (a2 != 1)
      goto LABEL_6;
  }
  else if (a2 != 1)
  {
LABEL_6:
    JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseDataSegmentException &>((uint64_t)&a9);
}

void sub_20DA5BA4C()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA5BA54);
}

void JetPack::parseDataSegmentHeader(JetPack *this@<X0>, JetPack::BaseStream *a2@<X1>, char *a3@<X8>)
{
  NSObject *v7;
  size_t v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  void *exception;
  std::exception v13[3];
  char v14;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x24BDAC8D0];
  HIBYTE(__p[2]) = 19;
  strcpy((char *)__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v13, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  v13[0].__vftable = (std::exception_vtbl *)&unk_24C804608;
  v7 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_20DA5A000, v7, OS_LOG_TYPE_DEFAULT, "Reading data segment header", (uint8_t *)__p, 2u);
  }
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  LOBYTE(__p[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(_QWORD *)this + 16))(this, __p, 1) != 1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v8 = LOBYTE(__p[0]);
  v9 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v8;
    _os_log_impl(&dword_20DA5A000, v9, OS_LOG_TYPE_DEBUG, "Name length is %{public}i", (uint8_t *)__p, 8u);
  }
  readString(this, v8, (char *)__p);
  *(_OWORD *)a3 = *(_OWORD *)__p;
  *((void **)a3 + 2) = __p[2];
  v10 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (a3[23] >= 0)
      v11 = a3;
    else
      v11 = *(char **)a3;
    LODWORD(__p[0]) = 136446210;
    *(void **)((char *)__p + 4) = v11;
    _os_log_impl(&dword_20DA5A000, v10, OS_LOG_TYPE_DEBUG, "Name is %{public}s", (uint8_t *)__p, 0xCu);
  }
  v13[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v14 < 0)
    operator delete(v13[1].__vftable);
  std::exception::~exception(v13);
}

void sub_20DA5BCD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA5BD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
  __cxa_end_catch();
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA5BD24(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA5BD2CLL);
  __clang_call_terminate(a1);
}

uint64_t std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void **v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  *(_OWORD *)__p = *(_OWORD *)a3;
  v20 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  v5 = *a4;
  v6 = (std::__shared_weak_count *)a4[1];
  *a4 = 0;
  a4[1] = 0;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v21 = v5;
    v22 = v6;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    v21 = v5;
    v22 = 0;
  }
  if (v20 >= 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  v12 = (*(uint64_t (**)(_QWORD, void **, uint64_t *))(a1 + 8))(*(_QWORD *)(a1 + 16), v11, &v21);
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v6)
  {
    v16 = (unint64_t *)&v6->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      if ((SHIBYTE(v20) & 0x80000000) == 0)
        return v12;
      goto LABEL_23;
    }
  }
  if (SHIBYTE(v20) < 0)
LABEL_23:
    operator delete(__p[0]);
  return v12;
}

void sub_20DA5BE98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v20;

  if (a17)
    std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(a17);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t dataSegmentFound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  JPStream *v9;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);

  JetPackReaderGetProperty(a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSegmentFound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (a2)
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a2);
    else
      v7 = &stru_24C805308;
    v9 = -[JPStream initWithBacking:releaseOnDealloc:]([JPStream alloc], "initWithBacking:releaseOnDealloc:", a3, 0);
    objc_msgSend(v5, "dataSegmentFound");
    v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8 = ((uint64_t (**)(_QWORD, __CFString *, JPStream *))v10)[2](v10, v7, v9);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t JetPackFileEntryGetPathname(JetPack::DiagnosticContext *a1, uint64_t a2, void *a3)
{
  JetPack::DiagnosticContext *v3;
  unsigned __int8 v4;
  unint64_t v5;
  int v7;
  char v9[8];
  uint64_t v10;

  v3 = a1;
  v9[0] = 4;
  v5 = 0x253DA4000uLL;
  if ((v4 & 1) == 0)
  {
    v5 = 0x253DA4000;
    v3 = a1;
    if (v7)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      v5 = 0x253DA4000;
      v3 = a1;
    }
  }
  v10 = *(_QWORD *)(v5 + 2504);
  return JetPack::FileEntryGetPathname((JetPack *)v9, v3, a3);
}

uint64_t JetPack::FileEntryGetPathname(JetPack *this, JetPack::DiagnosticContext *a2, void *a3)
{
  return archive_entry_pathname();
}

uint64_t JetPackFileEntryWriteToDirectory(uint64_t a1, JetPack::ArchiveStream **a2, char *__s)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unsigned __int8 v8;
  JetPack::ArchiveStream *v9;
  size_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *__dst[2];
  unint64_t v20;
  char v21[8];
  uint64_t v22;
  JetPack::ArchiveStream *v23;
  std::__shared_weak_count *v24;

  if (a2)
  {
    v5 = (std::__shared_weak_count *)a2[1];
    v23 = *a2;
    v24 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  v21[0] = 4;
  {
    JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
  }
  v22 = JetPack::getSharedOSLog(void)::log;
  v9 = v23;
  v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v12 = (void **)operator new(v13 + 1);
    __dst[1] = v11;
    v20 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_15;
  }
  HIBYTE(v20) = v10;
  v12 = __dst;
  if (v10)
LABEL_15:
    memcpy(v12, __s, (size_t)v11);
  *((_BYTE *)v11 + (_QWORD)v12) = 0;
  JetPack::FileEntryWriteToDirectory((uint64_t)v21, a1, v9, (uint64_t)__dst);
  if (SHIBYTE(v20) < 0)
    operator delete(__dst[0]);
  v15 = v24;
  if (v24)
  {
    v16 = (unint64_t *)&v24->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return 1;
}

void sub_20DA5C334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    if (!a19)
      JUMPOUT(0x20DA5C2D4);
    JUMPOUT(0x20DA5C2A4);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void JetPack::FileEntryWriteToDirectory(uint64_t a1, uint64_t a2, JetPack::ArchiveStream *a3, uint64_t a4)
{
  uint64_t v6;
  const char *v7;
  size_t v8;
  size_t v9;
  void **p_dst;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::string *v14;
  size_t v15;
  std::string *v16;
  uint64_t v17;
  std::string *v18;
  std::__fs::filesystem::path *v19;
  BOOL IsContainedBy;
  int v21;
  NSObject *GlobalLog;
  void **p_data;
  std::string *p_p;
  JetPack::PathOutsideOutputDestinationException *exception;
  uint64_t v26[4];
  uint64_t v27[4];
  std::string v28;
  std::string v29;
  std::string v30;
  std::string pn;
  std::string __p;
  std::__fs::filesystem::path v33;
  std::string *__dst;
  size_t v35;
  int64_t v36;
  char *v37;
  __int128 v38;
  uint64_t v39[4];
  std::string v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = archive_write_disk_new();
  if (archive_write_disk_set_standard_lookup())
  {
    HIBYTE(v39[2]) = 21;
    strcpy((char *)v39, "set standard settings");
    JetPack::throwLibArchiveException(v6, v39);
  }
  if (archive_write_disk_set_options())
  {
    v37 = (char *)operator new(0x20uLL);
    v38 = xmmword_20DA6E000;
    strcpy(v37, "set archive writer options");
    JetPack::throwLibArchiveException(v6, (uint64_t *)&v37);
  }
  v7 = (const char *)archive_entry_pathname();
  v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    v35 = v9;
    v36 = v12 | 0x8000000000000000;
    __dst = (std::string *)p_dst;
    goto LABEL_10;
  }
  HIBYTE(v36) = v8;
  p_dst = (void **)&__dst;
  if (v8)
LABEL_10:
    memmove(p_dst, v7, v9);
  *((_BYTE *)p_dst + v9) = 0;
  memset(&__p, 0, sizeof(__p));
  v13 = *(unsigned __int8 *)(a4 + 23);
  if ((v13 & 0x80u) == 0)
    v14 = (std::string *)a4;
  else
    v14 = *(std::string **)a4;
  if ((v13 & 0x80u) != 0)
    v13 = *(_QWORD *)(a4 + 8);
  std::string::append[abi:ne180100]<char const*,0>(&__p, v14, (std::string *)((char *)v14 + v13));
  memset(&v40, 0, sizeof(v40));
  v15 = HIBYTE(v36);
  if (v36 >= 0)
    v16 = (std::string *)&__dst;
  else
    v16 = __dst;
  if (v36 < 0)
    v15 = v35;
  std::string::append[abi:ne180100]<char const*,0>(&v40, v16, (std::string *)((char *)v16 + v15));
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v40, (uint64_t)&__p, &v33);
  if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_23;
LABEL_26:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_27;
  }
  operator delete(v40.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_26;
LABEL_23:
  if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_24:
    pn = v33.__pn_;
    goto LABEL_28;
  }
LABEL_27:
  std::string::__init_copy_ctor_external(&pn, v33.__pn_.__r_.__value_.__l.__data_, v33.__pn_.__r_.__value_.__l.__size_);
LABEL_28:
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&pn, (std::__fs::filesystem::path *)&__p);
  if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(pn.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_30;
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_30:
    v40 = __p;
    goto LABEL_33;
  }
  std::string::__init_copy_ctor_external(&v40, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
LABEL_33:
  archive_entry_set_pathname();
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v40.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_35;
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_35:
    v30 = __p;
    goto LABEL_38;
  }
  std::string::__init_copy_ctor_external(&v30, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
LABEL_38:
  memset(&v29, 0, sizeof(v29));
  v17 = *(unsigned __int8 *)(a4 + 23);
  if ((v17 & 0x80u) == 0)
    v18 = (std::string *)a4;
  else
    v18 = *(std::string **)a4;
  if ((v17 & 0x80u) != 0)
    v17 = *(_QWORD *)(a4 + 8);
  std::string::append[abi:ne180100]<char const*,0>(&v29, v18, (std::string *)((char *)v18 + v17));
  IsContainedBy = JetPack::detail::pathIsContainedBy(&v30, (std::__fs::filesystem::path *)&v29, v19);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_45:
      if (IsContainedBy)
        goto LABEL_46;
LABEL_57:
      archive_entry_set_pathname();
      GlobalLog = getGlobalLog();
      if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
      {
        p_data = (void **)&__dst;
        if (v36 < 0)
          p_data = (void **)&__dst->__r_.__value_.__l.__data_;
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        LODWORD(v40.__r_.__value_.__l.__data_) = 136446466;
        *(std::string::size_type *)((char *)v40.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_data;
        WORD2(v40.__r_.__value_.__r.__words[1]) = 2082;
        *(std::string::size_type *)((char *)&v40.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_p;
        _os_log_impl(&dword_20DA5A000, GlobalLog, OS_LOG_TYPE_ERROR, "Path is outside output directory. Raw: %{public}s Resolved: %{public}s", (uint8_t *)&v40, 0x16u);
      }
      exception = (JetPack::PathOutsideOutputDestinationException *)__cxa_allocate_exception(0x38uLL);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v28 = __p;
      JetPack::PathOutsideOutputDestinationException::PathOutsideOutputDestinationException(exception, (std::__fs::filesystem::path *)&v28);
    }
  }
  else if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_45;
  }
  operator delete(v30.__r_.__value_.__l.__data_);
  if (!IsContainedBy)
    goto LABEL_57;
LABEL_46:
  if ((archive_write_header() & 0x80000000) != 0)
  {
    archive_entry_set_pathname();
    HIBYTE(v27[2]) = 19;
    strcpy((char *)v27, "create file on disk");
    JetPack::throwLibArchiveException(v6, v27);
  }
  if (archive_entry_size() >= 1)
  {
    JetPack::ArchiveStream::getBackingArchive(a3);
    JetPack::detail::copyArchiveData();
  }
  v21 = archive_write_finish_entry();
  archive_entry_set_pathname();
  if (v21 < 0)
  {
    HIBYTE(v26[2]) = 18;
    strcpy((char *)v26, "write file to disk");
    JetPack::throwLibArchiveException(v6, v26);
  }
  archive_write_close();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_52:
      if ((SHIBYTE(v36) & 0x80000000) == 0)
        goto LABEL_53;
LABEL_67:
      operator delete(__dst);
      if (!v6)
        return;
      goto LABEL_68;
    }
  }
  else if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_52;
  }
  operator delete(v33.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36) < 0)
    goto LABEL_67;
LABEL_53:
  if (!v6)
    return;
LABEL_68:
  archive_write_free();
}

void sub_20DA5C940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54,void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60)
{
  uint64_t v60;
  void *v61;
  uint64_t v62;

  __cxa_free_exception(v61);
  if (a54 < 0)
    operator delete(__p);
  if (a60 < 0)
    operator delete(a55);
  if (*(char *)(v62 - 169) < 0)
    operator delete(*(void **)(v62 - 192));
  if (v60)
    archive_write_free();
  _Unwind_Resume(a1);
}

BOOL JetPack::detail::pathIsContainedBy(std::string *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  const std::__fs::filesystem::path *v4;
  const std::string_view::value_type *v5;
  const std::string_view::value_type *data;
  const std::__fs::filesystem::path *path_ptr;
  std::__fs::filesystem::path::iterator __p;
  std::__fs::filesystem::path::iterator v11;
  std::__fs::filesystem::path::iterator v12;
  std::__fs::filesystem::path::iterator v13;
  void *v14;
  char v15;
  const std::__fs::filesystem::path *v16;
  const std::string_view::value_type *v17;
  void *v18;
  char v19;
  std::string pn;
  std::__fs::filesystem::path v21;
  std::string v22;
  std::__fs::filesystem::path v23;

  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, this->__r_.__value_.__l.__data_, this->__r_.__value_.__l.__size_);
  else
    v22 = *this;
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&v22, &v23);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_6:
    pn = a2->__pn_;
    goto LABEL_9;
  }
  std::string::__init_copy_ctor_external(&pn, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
LABEL_9:
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&pn, &v21);
  if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
    operator delete(pn.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::begin(&v13, &v21);
  std::__fs::filesystem::path::end(&v12, &v21);
  std::__fs::filesystem::path::begin(&v11, &v23);
  std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v14);
  if ((SHIBYTE(v11.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v12.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_13;
LABEL_27:
    operator delete(v12.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
  operator delete(v11.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_27;
LABEL_13:
  if ((SHIBYTE(v13.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_14;
LABEL_28:
  operator delete(v13.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
LABEL_14:
  std::__fs::filesystem::path::end(&__p, &v21);
  v4 = v16;
  v5 = v17;
  path_ptr = __p.__path_ptr_;
  data = __p.__entry_.__data_;
  if (SHIBYTE(__p.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0)
    {
LABEL_16:
      if ((v15 & 0x80000000) == 0)
        goto LABEL_17;
      goto LABEL_31;
    }
  }
  else if ((v19 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(v18);
  if ((v15 & 0x80000000) == 0)
  {
LABEL_17:
    if ((SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_18;
LABEL_32:
    operator delete(v21.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return v4 == path_ptr && v5 == data;
    goto LABEL_33;
  }
LABEL_31:
  operator delete(v14);
  if (SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_32;
LABEL_18:
  if ((SHIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    return v4 == path_ptr && v5 == data;
LABEL_33:
  operator delete(v23.__pn_.__r_.__value_.__l.__data_);
  return v4 == path_ptr && v5 == data;
}

void sub_20DA5CCB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  uint64_t v46;

  if (*(char *)(v46 - 49) < 0)
    operator delete(*(void **)(v46 - 72));
  _Unwind_Resume(exception_object);
}

void sub_20DA5CD80()
{
  uint64_t v0;

  if (*(char *)(v0 - 121) < 0)
    JUMPOUT(0x20DA5CD60);
  JUMPOUT(0x20DA5CD64);
}

void sub_20DA5CD94()
{
  uint64_t v0;

  if (*(char *)(v0 - 73) < 0)
    JUMPOUT(0x20DA5CD70);
  JUMPOUT(0x20DA5CD78);
}

void JetPack::detail::resolvingAllSymlinksInNonExistentPath(const std::__fs::filesystem::path *this@<X0>, std::__fs::filesystem::path *a2@<X8>)
{
  BOOL v6;
  std::__fs::filesystem::path::__string_view v7;
  void *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v9;
  std::basic_string_view<_CharT, _Traits>::size_type v10;
  std::string v11;
  _OWORD v12[2];
  std::__fs::filesystem::path v13;
  std::string pn;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path::iterator __dst;
  std::__fs::filesystem::path::iterator v17;
  std::__fs::filesystem::path::iterator v18;
  std::__fs::filesystem::path::iterator v19;
  std::__fs::filesystem::path stashed_elem;

  memset(&stashed_elem, 0, sizeof(stashed_elem));
  std::__fs::filesystem::path::begin(&v19, this);
  std::__fs::filesystem::path::begin(&v18, this);
  std::__fs::filesystem::path::begin(&v17, this);
  while (1)
  {
    std::__fs::filesystem::path::end(&__dst, this);
    v6 = v17.__path_ptr_ != __dst.__path_ptr_ || v17.__entry_.__data_ != __dst.__entry_.__data_;
    if (SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (!v6)
      break;
    if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&pn, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
    else
      pn = v17.__stashed_elem_.__pn_;
    __p.__pn_ = pn;
    memset(&pn, 0, sizeof(pn));
    std::__fs::filesystem::operator/[abi:ne180100](&__p, (uint64_t)&stashed_elem, &__dst.__stashed_elem_);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
    stashed_elem = __dst.__stashed_elem_;
    *((_BYTE *)&__dst.__stashed_elem_.__pn_.__r_.__value_.__s + 23) = 0;
    __dst.__stashed_elem_.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__pn_.__r_.__value_.__l.__data_);
      if ((SHIBYTE(pn.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_18;
    }
    else if ((SHIBYTE(pn.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    operator delete(pn.__r_.__value_.__l.__data_);
LABEL_18:
    std::__fs::filesystem::__symlink_status(&stashed_elem, 0);
    if (__dst.__stashed_elem_.__pn_.__r_.__value_.__s.__data_[0] != 3)
      goto LABEL_34;
    v7 = std::__fs::filesystem::path::__parent_path(&stashed_elem);
    if (v7.__size_ >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v7.__size_ >= 0x17)
    {
      v9 = (v7.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7.__size_ | 7) != 0x17)
        v9 = v7.__size_ | 7;
      v10 = v9 + 1;
      p_dst = operator new(v9 + 1);
      __dst.__stashed_elem_.__pn_.__r_.__value_.__l.__size_ = v7.__size_;
      __dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
      __dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_28:
      memmove(p_dst, v7.__data_, v7.__size_);
      goto LABEL_29;
    }
    *((_BYTE *)&__dst.__stashed_elem_.__pn_.__r_.__value_.__s + 23) = v7.__size_;
    p_dst = &__dst;
    if (v7.__size_)
      goto LABEL_28;
LABEL_29:
    *((_BYTE *)p_dst + v7.__size_) = 0;
    __p = __dst.__stashed_elem_;
    std::__fs::filesystem::__read_symlink(&__dst.__stashed_elem_, &stashed_elem, 0);
    std::__fs::filesystem::operator/[abi:ne180100](&__dst.__stashed_elem_, (uint64_t)&__p, &v13);
    std::__fs::filesystem::path::lexically_normal((std::__fs::filesystem::path *)&pn, &v13);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
    stashed_elem.__pn_ = pn;
    *((_BYTE *)&pn.__r_.__value_.__s + 23) = 0;
    pn.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v13.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v13.__pn_.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_33:
        if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_34;
        goto LABEL_38;
      }
    }
    else if ((SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_33;
    }
    operator delete(__dst.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_34:
      if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_39;
      goto LABEL_35;
    }
LABEL_38:
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_39:
      std::string::__init_copy_ctor_external(&v11, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
      goto LABEL_40;
    }
LABEL_35:
    v11 = v17.__stashed_elem_.__pn_;
LABEL_40:
    v12[0] = *(_OWORD *)&v17.__path_ptr_;
    *(std::__fs::filesystem::path::__string_view *)((char *)v12 + 9) = *(std::__fs::filesystem::path::__string_view *)((char *)&v17.__entry_ + 1);
    std::__fs::filesystem::path::iterator::__increment(&v17);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::lexically_normal(a2, &stashed_elem);
  if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_49;
LABEL_46:
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0)
LABEL_50:
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
  }
  else
  {
    if ((SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_46;
LABEL_49:
    operator delete(v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_50;
  }
}

void sub_20DA5D104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  uint64_t v54;

  if (*(char *)(v54 - 217) < 0)
  {
    operator delete(*(void **)(v54 - 240));
    if ((*(char *)(v54 - 161) & 0x80000000) == 0)
    {
LABEL_3:
      if ((*(char *)(v54 - 105) & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if ((*(char *)(v54 - 161) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(v54 - 184));
  if ((*(char *)(v54 - 105) & 0x80000000) == 0)
LABEL_4:
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(*(void **)(v54 - 128));
  _Unwind_Resume(exception_object);
}

void readString(JetPack::BaseStream *a1@<X0>, size_t __sz@<X1>, char *a3@<X8>)
{
  __int128 *v6;
  char *v7;
  char *v8;
  size_t v9;
  size_t v10;
  char *v11;
  _OWORD *v12;
  __int128 *v13;
  size_t v14;
  __int128 v15;
  char v16;
  void *exception;
  __int128 *__p;

  __p = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v6 = (__int128 *)operator new(__sz);
    __p = v6;
    bzero(v6, __sz);
  }
  else
  {
    v6 = 0;
  }
  if ((*(uint64_t (**)(JetPack::BaseStream *, __int128 *, size_t))(*(_QWORD *)a1 + 16))(a1, v6, __sz) != __sz)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  if (__sz >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__sz >= 0x17)
  {
    v9 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v9 = __sz | 7;
    v10 = v9 + 1;
    v11 = (char *)operator new(v9 + 1);
    *((_QWORD *)a3 + 1) = __sz;
    *((_QWORD *)a3 + 2) = v10 | 0x8000000000000000;
    *(_QWORD *)a3 = v11;
    a3 = v11;
    if (__sz >= 0x20)
    {
      v7 = (char *)v6 + (__sz & 0xFFFFFFFFFFFFFFE0);
      v8 = &v11[__sz & 0xFFFFFFFFFFFFFFE0];
      v12 = v11 + 16;
      v13 = v6 + 1;
      v14 = __sz & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v15 = *v13;
        *(v12 - 1) = *(v13 - 1);
        *v12 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 32;
      }
      while (v14);
      a3 = &v11[__sz & 0xFFFFFFFFFFFFFFE0];
      if ((__sz & 0x7FFFFFFFFFFFFFE0) == __sz)
        goto LABEL_18;
      goto LABEL_16;
    }
LABEL_9:
    v7 = (char *)v6;
    v8 = a3;
LABEL_16:
    a3 = v8;
    do
    {
      v16 = *v7++;
      *a3++ = v16;
    }
    while (v7 != (char *)v6 + __sz);
    goto LABEL_18;
  }
  a3[23] = __sz;
  if (__sz)
    goto LABEL_9;
LABEL_18:
  *a3 = 0;
  if (__p)
    operator delete(__p);
}

void sub_20DA5D430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL JetPack::readSerializationSegment()
{
  uint64_t v0;
  void **v1;
  void **v2;
  uint64_t v3;
  uint64_t v4;
  int next_header;
  int v6;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  std::__shared_weak_count *size;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *exception;
  std::exception v27[3];
  char v28;
  std::string v29;
  std::string v30;
  uint64_t v31;
  uint64_t v32;
  void *__p;
  __int128 v34;
  uint64_t v35;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v35 = *MEMORY[0x24BDAC8D0];
  __p = operator new(0x28uLL);
  v34 = xmmword_20DA6E7C0;
  strcpy((char *)__p, "UnableToParseSerializationSegment");
  JetPack::ParseException::ParseException(v27, (uint64_t)&__p);
  if (SHIBYTE(v34) < 0)
    operator delete(__p);
  v27[0].__vftable = (std::exception_vtbl *)&unk_24C8049A0;
  __p = *v2;
  v4 = archive_read_new();
  v31 = 0;
  archive_read_support_format_all();
  if (archive_read_open())
  {
    v25 = archive_error_string();
    JetPack::archiveErrorToString(v25, &v30);
    exception = __cxa_allocate_exception(0x20uLL);
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v29, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
    else
      v29 = v30;
    JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v29);
  }
  while (1)
  {
    while (1)
    {
      next_header = archive_read_next_header();
      v6 = next_header;
      if (next_header == 1)
      {
        archive_read_close();
        goto LABEL_22;
      }
      if (next_header)
      {
        v23 = __cxa_allocate_exception(0x20uLL);
        v24 = archive_error_string();
        JetPack::archiveErrorToString(v24, &v30);
        JetPack::LibArchiveException::LibArchiveException(v23, (uint64_t)&v30);
      }
      v7 = (char *)operator new(0x58uLL);
      v8 = (std::__shared_weak_count *)v7;
      *((_QWORD *)v7 + 1) = 0;
      v9 = (unint64_t *)(v7 + 8);
      *((_QWORD *)v7 + 2) = 0;
      *(_QWORD *)v7 = &unk_24C804DA8;
      *((_QWORD *)v7 + 3) = &unk_24C804158;
      *((_QWORD *)v7 + 4) = v4;
      *(_OWORD *)(v7 + 40) = 0u;
      *(_OWORD *)(v7 + 56) = 0u;
      *(_OWORD *)(v7 + 65) = 0u;
      v30.__r_.__value_.__r.__words[0] = (std::string::size_type)(v7 + 24);
      v30.__r_.__value_.__l.__size_ = (std::string::size_type)v7;
      if (*(_BYTE *)(v3 + 184))
        break;
LABEL_17:
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v10 = v31;
    v29.__r_.__value_.__r.__words[0] = (std::string::size_type)(v7 + 24);
    v29.__r_.__value_.__l.__size_ = (std::string::size_type)v7;
    do
      v11 = __ldxr(v9);
    while (__stxr(v11 + 1, v9));
    v32 = v10;
    v12 = *(_QWORD *)(v3 + 176);
    if (!v12)
      std::__throw_bad_function_call[abi:ne180100]();
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, std::string *))(*(_QWORD *)v12 + 48))(v12, v3, &v32, &v29);
    size = (std::__shared_weak_count *)v29.__r_.__value_.__l.__size_;
    if (v29.__r_.__value_.__l.__size_)
    {
      v15 = (unint64_t *)(v29.__r_.__value_.__l.__size_ + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    if ((v13 & 1) == 0)
      break;
    v8 = (std::__shared_weak_count *)v30.__r_.__value_.__l.__size_;
    if (v30.__r_.__value_.__l.__size_)
      goto LABEL_17;
  }
  archive_read_close();
  v20 = (std::__shared_weak_count *)v30.__r_.__value_.__l.__size_;
  if (v30.__r_.__value_.__l.__size_)
  {
    v21 = (unint64_t *)(v30.__r_.__value_.__l.__size_ + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_22:
  if (v4)
    archive_read_free();
  v27[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v28 < 0)
    operator delete(v27[1].__vftable);
  std::exception::~exception(v27);
  return v6 == 1;
}

void sub_20DA5D804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;
  void *v33;

  __cxa_free_exception(v33);
  if (a24 < 0)
    operator delete(__p);
  if (v32)
    archive_read_free();
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseSerializationSegmentException &>((uint64_t)&a9);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
  _Unwind_Resume(a1);
}

void sub_20DA5D924()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA5D92CLL);
}

void sub_20DA5D93C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t fileEntryFound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  JPFileEntry *v7;
  JPStream *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;

  JetPackReaderGetProperty(a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileEntryFound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[JPFileEntry initWithBacking:releaseOnDealloc:]([JPFileEntry alloc], "initWithBacking:releaseOnDealloc:", a2, 0);
    v8 = -[JPStream initWithBacking:releaseOnDealloc:]([JPStream alloc], "initWithBacking:releaseOnDealloc:", a3, 0);
    objc_msgSend(v5, "fileEntryFound");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, JPFileEntry *, JPStream *))v9)[2](v9, v7, v8);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t JetPackReaderGetProperty(uint64_t a1, int a2)
{
  uint64_t *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  if (!a1)
  {
    v2 = 0;
    v3 = 0;
    if (a2)
      goto LABEL_6;
LABEL_9:
    v6 = *v2;
    if (!v3)
      return v6;
    goto LABEL_10;
  }
  v2 = *(uint64_t **)a1;
  v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  if (!a2)
    goto LABEL_9;
LABEL_6:
  v6 = 0;
  if (!v3)
    return v6;
LABEL_10:
  v7 = (unint64_t *)&v3->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return v6;
}

uint64_t std::__shared_ptr_emplace<JetPack::ArchiveStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t JetPackStreamIsFinished(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a1;
  v3 = (std::__shared_weak_count *)a1[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v6;
}

void sub_20DA5DD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t JetPack::ArchiveStream::isFinished(JetPack::ArchiveStream *this)
{
  return *((unsigned __int8 *)this + 56);
}

uint64_t JetPackStreamRead(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a1;
  v3 = (std::__shared_weak_count *)a1[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v6;
}

void sub_20DA5DDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

size_t JetPack::ArchiveStream::read(JetPack::ArchiveStream *this, unsigned __int8 *__dst, size_t a3)
{
  size_t v3;
  size_t v6;
  size_t *v7;
  int data_block;
  size_t v9;
  _QWORD *exception;
  unint64_t v12;
  _BYTE v13[24];

  if (*((_BYTE *)this + 56))
    return 0;
  v3 = a3;
  v7 = (size_t *)((char *)this + 24);
  v6 = *((_QWORD *)this + 3);
  if (!v6)
  {
    data_block = archive_read_data_block();
    if (data_block == 1)
    {
      v3 = 0;
      *((_BYTE *)this + 56) = 1;
      return v3;
    }
    if (data_block)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v12 = archive_error_string();
      JetPack::archiveErrorToString(v12, v13);
      JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)v13);
    }
    v6 = *v7;
  }
  if (v6 < v3)
    v3 = v6;
  memcpy(__dst, *((const void **)this + 2), v3);
  v9 = *((_QWORD *)this + 3) - v3;
  *((_QWORD *)this + 2) += v3;
  *((_QWORD *)this + 3) = v9;
  *((_QWORD *)this + 5) += v3;
  return v3;
}

void sub_20DA5DEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t JetPackStreamDestroy(uint64_t result)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  if (result)
  {
    v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1)
    {
      p_shared_owners = (unint64_t *)&v1->__shared_owners_;
      do
        v3 = __ldaxr(p_shared_owners);
      while (__stlxr(v3 - 1, p_shared_owners));
      if (!v3)
      {
        ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
        std::__shared_weak_count::__release_weak(v1);
      }
    }
    JUMPOUT(0x212BAD578);
  }
  return result;
}

uint64_t std::__shared_ptr_emplace<JetPack::FileStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void JetPack::FileStream::~FileStream(FILE **this)
{
  *this = (FILE *)&off_24C8040C8;
  if (*((_BYTE *)this + 16))
    fclose(this[1]);
}

{
  *this = (FILE *)&off_24C8040C8;
  if (*((_BYTE *)this + 16))
    fclose(this[1]);
}

{
  *this = (FILE *)&off_24C8040C8;
  if (*((_BYTE *)this + 16))
    fclose(this[1]);
  JUMPOUT(0x212BAD578);
}

uint64_t JetPack::detail::copyArchiveData()
{
  int data_block;
  unint64_t v1;
  NSObject *v2;
  std::string *v3;
  _QWORD *v4;
  unint64_t v6;
  NSObject *GlobalLog;
  std::string *v8;
  _QWORD *exception;
  std::string v10;
  std::string v11;
  std::string v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  std::string *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = 0;
  v13 = 0;
  while (1)
  {
    data_block = archive_read_data_block();
    if (data_block == 1)
      break;
    if (data_block < 0)
    {
      v6 = archive_error_string();
      JetPack::archiveErrorToString(v6, &v12);
      GlobalLog = getGlobalLog();
      if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
      {
        v8 = &v12;
        if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136446210;
        v17 = v8;
        _os_log_impl(&dword_20DA5A000, GlobalLog, OS_LOG_TYPE_ERROR, "Archive error occurred while reading data block: %{public}s", buf, 0xCu);
      }
      exception = __cxa_allocate_exception(0x20uLL);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v11, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
      else
        v11 = v12;
      JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v11);
    }
    if ((archive_write_data_block() & 0x80000000) != 0)
    {
      v1 = archive_error_string();
      JetPack::archiveErrorToString(v1, &v12);
      v2 = getGlobalLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = &v12;
        if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v3 = (std::string *)v12.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136446210;
        v17 = v3;
        _os_log_impl(&dword_20DA5A000, v2, OS_LOG_TYPE_ERROR, "Archive error occurred while writing data block: %{public}s", buf, 0xCu);
      }
      v4 = __cxa_allocate_exception(0x20uLL);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v10, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
      else
        v10 = v12;
      JetPack::LibArchiveException::LibArchiveException(v4, (uint64_t)&v10);
    }
  }
  return 0;
}

void sub_20DA5E22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;

  __cxa_free_exception(v28);
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t JetPack::ArchiveStream::getBackingArchive(JetPack::ArchiveStream *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t JetPack::detail::openCallback()
{
  return 0;
}

uint64_t JetPack::detail::closeCallback()
{
  return 0;
}

_QWORD *JetPack::UnownedPartialStream::UnownedPartialStream(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &off_24C804408;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  return a1;
}

{
  *a1 = &off_24C804408;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  return a1;
}

void JetPack::SignedStreamDecoder::fill(JetPack::SignedStreamDecoder *this, unint64_t a2)
{
  while (*((_QWORD *)this + 6) < a2)
  {
    if (((*(uint64_t (**)(JetPack::SignedStreamDecoder *))(*(_QWORD *)this + 64))(this) & 1) != 0)
      break;
    JetPack::SignedStreamDecoder::readBlock(this);
  }
}

uint64_t JetPack::readMultiSegmentContainer(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void *exception;
  std::exception v30;
  void *__p;
  char v32;
  uint64_t v33;
  _BYTE v34[24];
  _BYTE *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DA5A000, v6, OS_LOG_TYPE_DEFAULT, "Reading multi segment container", buf, 2u);
  }
  v7 = 0;
  do
  {
    v8 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl(&dword_20DA5A000, v8, OS_LOG_TYPE_DEBUG, "Reading segment %{public}i", buf, 8u);
    }
    JetPack::UnableToParseMultiSegmentException::UnableToParseMultiSegmentException((JetPack::UnableToParseMultiSegmentException *)&v30, v7);
    v33 = a1;
    v9 = a3[3];
    if (!v9)
      goto LABEL_9;
    if ((_QWORD *)v9 != a3)
    {
      v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
LABEL_9:
      v35 = (_BYTE *)v9;
      goto LABEL_11;
    }
    v35 = v34;
    (*(void (**)(_QWORD *, _BYTE *))(*a3 + 24))(a3, v34);
LABEL_11:
    v10 = *a2;
    v11 = (std::__shared_weak_count *)a2[1];
    v36 = *a2;
    v37 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
      v14 = v33;
      *(_QWORD *)buf = v36;
      v39 = v37;
      if (v37)
      {
        v15 = (unint64_t *)&v37->__shared_owners_;
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v17 = v35;
      if (!v35)
LABEL_41:
        std::__throw_bad_function_call[abi:ne180100]();
    }
    else
    {
      v14 = v33;
      *(_QWORD *)buf = v10;
      v39 = 0;
      v17 = v35;
      if (!v35)
        goto LABEL_41;
    }
    v18 = (*(uint64_t (**)(_BYTE *, uint64_t, uint8_t *))(*(_QWORD *)v17 + 48))(v17, v14, buf);
    v19 = v39;
    if (!v39)
      goto LABEL_24;
    v20 = (unint64_t *)&v39->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
      v22 = v37;
      if (!v37)
        goto LABEL_30;
    }
    else
    {
LABEL_24:
      v22 = v37;
      if (!v37)
        goto LABEL_30;
    }
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
LABEL_30:
    v25 = v35;
    if (v35 == v34)
    {
      v25 = v34;
      v26 = 4;
    }
    else
    {
      if (!v35)
        goto LABEL_35;
      v26 = 5;
    }
    (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_35:
    v30.__vftable = (std::exception_vtbl *)&unk_24C8049F0;
    if (v32 < 0)
      operator delete(__p);
    std::exception::~exception(&v30);
    if ((v18 & 1) == 0)
      break;
    v27 = *a2;
    buf[0] = 0;
    if ((*(uint64_t (**)(uint64_t, uint8_t *, uint64_t))(*(_QWORD *)v27 + 16))(v27, buf, 1) != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *((_WORD *)exception + 11) = 0;
      *((_BYTE *)exception + 31) = 13;
      *(_QWORD *)exception = &unk_24C804450;
      strcpy((char *)exception + 8, "NotEnoughData");
    }
    ++v7;
  }
  while (buf[0]);
  return v18;
}

void sub_20DA5E698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::exception a11)
{
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a11);
  _Unwind_Resume(a1);
}

void sub_20DA5E6A0(void *a1, int a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v12 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseMultiSegmentException &>((uint64_t)va);
  }
  JetPack::readMultiSegmentContainer(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>,std::function<BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>)::$_0::~$_0((uint64_t)va1);
  JUMPOUT(0x20DA5E6E0);
}

void sub_20DA5E6D0()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA5E6D8);
}

void sub_20DA5E6F0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *);
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;

  v3 = *(uint64_t (**)(uint64_t, __int128 *))(a1 + 8);
  v9 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v4 = v3(a2, &v9);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

void sub_20DA5E790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10)
    std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &unk_24C804A70;
  a2[1] = v2;
  return result;
}

JetPack::UnableToParseMultiSegmentException *JetPack::UnableToParseMultiSegmentException::UnableToParseMultiSegmentException(JetPack::UnableToParseMultiSegmentException *this, int a2)
{
  std::string *v4;
  std::string *p_p;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string __p;
  std::string v11;
  std::string v12;

  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v11.__r_.__value_.__r.__words[1] = xmmword_20DA6E540;
  strcpy(v11.__r_.__value_.__l.__data_, "UnableToParseMultiSegment");
  v4 = std::string::append(&v11, " index=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ParseException::ParseException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_12;
LABEL_15:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_13;
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_15;
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_16;
LABEL_13:
  *(_QWORD *)this = &unk_24C804838;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_20DA5E8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0)
LABEL_6:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

_QWORD *JetPack::ParseException::ParseException(_QWORD *a1, uint64_t a2)
{
  std::string *v3;
  std::string __p;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  *a1 = &unk_24C8049F0;
  v3 = (std::string *)(a1 + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v3, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    a1[3] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  *a1 = &unk_24C804288;
  return a1;
}

void sub_20DA5EA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::exception *v14;

  std::exception::~exception(v14);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t JetPack::readSegmentContainer(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  _QWORD *v11;
  char v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD *v25;
  std::__shared_weak_count *v26;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  char v32;

  v4 = a2[1];
  v29 = *a2;
  v30 = (std::__shared_weak_count *)v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v31 = JetPack::parseSegmentContainerHeader(&v29, a1 + 16);
  v7 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = (std::__shared_weak_count *)operator new(0x48uLL);
  std::__shared_ptr_emplace<JetPack::PartialStream>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<JetPack::BaseStream> &,unsigned int &,std::allocator<JetPack::PartialStream>,0>(v10, a2, (unsigned int *)&v31 + 1);
  v11 = &v10[1].__vftable;
  v27 = &v10[1].__vftable;
  v28 = v10;
  if (!*(_BYTE *)(a1 + 224))
    goto LABEL_19;
  v12 = v31;
  v13 = (unint64_t *)&v10->__shared_owners_;
  v25 = &v10[1].__vftable;
  v26 = v10;
  do
    v14 = __ldxr(v13);
  while (__stxr(v14 + 1, v13));
  v32 = v12;
  v15 = *(_QWORD *)(a1 + 216);
  if (!v15)
    std::__throw_bad_function_call[abi:ne180100]();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t, char *, _QWORD **))(*(_QWORD *)v15 + 48))(v15, a1, &v32, &v25);
  v17 = v16;
  v18 = v26;
  if (v26)
  {
    v19 = (unint64_t *)&v26->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
      if (!(_DWORD)v17)
        goto LABEL_20;
      goto LABEL_18;
    }
  }
  if ((_DWORD)v16)
  {
LABEL_18:
    v11 = v27;
LABEL_19:
    (*(void (**)(_QWORD *))(*v11 + 40))(v11);
    v17 = 1;
  }
LABEL_20:
  v21 = v28;
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return v17;
}

void sub_20DA5EBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t JetPack::UnownedPartialStream::seekToEnd(JetPack::UnownedPartialStream *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)this + 2);
  v3 = v2 - (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(_QWORD *)this + 24))(this);
  return (*(uint64_t (**)(JetPack::UnownedPartialStream *, uint64_t))(*(_QWORD *)this + 48))(this, v3);
}

uint64_t JetPack::UnownedPartialStream::seekForward(JetPack::UnownedPartialStream *this, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *((_QWORD *)this + 2);
  v5 = (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(_QWORD *)this + 24))(this);
  if (v4 - v5 >= a2)
    v6 = a2;
  else
    v6 = v4 - v5;
  return (*(uint64_t (**)(_QWORD, unint64_t))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v6);
}

unint64_t JetPack::BaseStream::seekForward(JetPack::BaseStream *this, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 24))(this);
  result = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 32))(this);
  if ((result & 1) == 0)
  {
    v6 = v4 + a2;
    do
    {
      result = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 24))(this);
      if (v6 <= result)
        break;
      v7 = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 24))(this);
      v8 = v6 - v7 >= 0x400 ? 1024 : v6 - v7;
      (*(void (**)(JetPack::BaseStream *, _BYTE *, uint64_t))(*(_QWORD *)this + 16))(this, v9, v8);
      result = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 32))(this);
    }
    while (!(_DWORD)result);
  }
  return result;
}

unint64_t JetPack::AESDecoderStream::read(JetPack::AESDecoderStream *this, unsigned __int8 *a2, unint64_t a3)
{
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  const void **v24;
  uint64_t v25;
  const void *v26;
  size_t v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  JetPack::CommonCryptoInvalidStatusException *v39;
  int v40;
  JetPack::InvalidEncryptionTagLengthException *exception;
  _BYTE v42[16];
  uint64_t v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  while (((*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1)) & 1) == 0)
  {
    if (*((_QWORD *)this + 13) >= a3)
      break;
    v6 = *((_DWORD *)this + 13);
    *((_DWORD *)this + 13) = v6 + 1;
    v43 = 0;
    v44 = v6;
    if ((*(uint64_t (**)(_QWORD, _BYTE *, uint64_t))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v42, 16) != 16)
    {
      exception = (JetPack::InvalidEncryptionTagLengthException *)__cxa_allocate_exception(0x20uLL);
      JetPack::InvalidEncryptionTagLengthException::InvalidEncryptionTagLengthException(exception);
    }
    v7 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), *((_QWORD *)this + 14), *((unsigned int *)this + 12));
    if ((*(unsigned int (**)(_QWORD, char *, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _BYTE *, uint64_t))(**((_QWORD **)this + 3) + 40))(*((_QWORD *)this + 3), (char *)this + 32, 16, &v43, 12, 0, 0, *((_QWORD *)this + 14), v7, *((_QWORD *)this + 17), v42, 16) != 1)
    {
      v39 = (JetPack::CommonCryptoInvalidStatusException *)__cxa_allocate_exception(0x28uLL);
      v40 = (*(uint64_t (**)(_QWORD, char *, uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _BYTE *, uint64_t))(**((_QWORD **)this + 3) + 40))(*((_QWORD *)this + 3), (char *)this + 32, 16, &v43, 12, 0, 0, *((_QWORD *)this + 14), v7, *((_QWORD *)this + 17), v42, 16);
      JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(v39, v40);
    }
    if (v7)
    {
      v8 = (char *)*((_QWORD *)this + 17);
      v9 = *((_QWORD *)this + 13);
      do
      {
        v11 = *((_QWORD *)this + 10);
        v12 = *((_QWORD *)this + 9);
        if (v11 == v12)
          v13 = 0;
        else
          v13 = ((v11 - v12) << 9) - 1;
        v14 = *((_QWORD *)this + 12) + v9;
        if (v13 == v14)
        {
          std::deque<unsigned char>::__add_back_capacity((uint64_t)this + 64);
          v12 = *((_QWORD *)this + 9);
          v14 = *((_QWORD *)this + 13) + *((_QWORD *)this + 12);
        }
        v10 = *v8++;
        *(_BYTE *)(*(_QWORD *)(v12 + ((v14 >> 9) & 0x7FFFFFFFFFFFF8)) + (v14 & 0xFFF)) = v10;
        v9 = *((_QWORD *)this + 13) + 1;
        *((_QWORD *)this + 13) = v9;
        --v7;
      }
      while (v7);
    }
  }
  if (*((_QWORD *)this + 13) >= a3)
    v15 = a3;
  else
    v15 = *((_QWORD *)this + 13);
  v16 = *((_QWORD *)this + 9);
  v17 = (_QWORD *)(v16 + 8 * (*((_QWORD *)this + 12) >> 12));
  if (*((_QWORD *)this + 10) == v16)
  {
    v18 = 0;
    if (!v15)
      goto LABEL_33;
  }
  else
  {
    v18 = (_BYTE *)(*v17 + (*((_QWORD *)this + 12) & 0xFFFLL));
    if (!v15)
      goto LABEL_33;
  }
  v19 = (unint64_t)&v18[v15 - *v17];
  if ((uint64_t)v19 >= 1)
  {
    v20 = v19 >> 12;
    v21 = (_BYTE *)(v17[v19 >> 12] + (v19 & 0xFFF));
    if (v19 >> 12)
      goto LABEL_23;
LABEL_31:
    v27 = v21 - v18;
    if (v21 == v18)
      goto LABEL_33;
    goto LABEL_32;
  }
  v28 = 4095 - v19;
  v29 = ~(_WORD)v28;
  v28 >>= 12;
  v20 = -(uint64_t)v28;
  v21 = (_BYTE *)(v17[-v28] + (v29 & 0xFFF));
  if (!v28)
    goto LABEL_31;
LABEL_23:
  v22 = *v17 + 4096;
  v23 = v22 - (_QWORD)v18;
  if ((_BYTE *)v22 != v18)
    memmove(a2, v18, v22 - (_QWORD)v18);
  a2 += v23;
  if (v20 != 1)
  {
    v24 = (const void **)(v17 + 1);
    v25 = 8 * v20 - 8;
    do
    {
      v26 = *v24++;
      memmove(a2, v26, 0x1000uLL);
      a2 += 4096;
      v25 -= 8;
    }
    while (v25);
  }
  v18 = (_BYTE *)v17[v20];
  if (v18 != v21)
  {
    v27 = v21 - v18;
LABEL_32:
    memmove(a2, v18, v27);
  }
LABEL_33:
  v30 = *((_QWORD *)this + 12);
  v31 = *((_QWORD *)this + 9);
  v32 = (char *)(v31 + 8 * (v30 >> 12));
  if (*((_QWORD *)this + 10) != v31)
  {
    v33 = (char *)(*(_QWORD *)v32 + (*((_QWORD *)this + 12) & 0xFFFLL));
    if (v15)
      goto LABEL_35;
LABEL_38:
    v36 = v33;
    v35 = (char *)(v31 + 8 * (v30 >> 12));
    goto LABEL_40;
  }
  v33 = 0;
  if (!v15)
    goto LABEL_38;
LABEL_35:
  v34 = (uint64_t)&v33[v15 - *(_QWORD *)v32];
  if (v34 < 1)
  {
    v37 = 4095 - v34;
    v35 = &v32[-8 * (v37 >> 12)];
    v36 = (char *)(*(_QWORD *)v35 + (~(_WORD)v37 & 0xFFF));
  }
  else
  {
    v35 = &v32[8 * ((unint64_t)v34 >> 12)];
    v36 = (char *)(*(_QWORD *)v35 + (v34 & 0xFFF));
  }
LABEL_40:
  std::deque<unsigned char>::erase((_QWORD *)this + 8, v32, v33, v35, v36);
  *((_QWORD *)this + 7) += v15;
  return v15;
}

void sub_20DA5F1B4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unint64_t JetPack::BufferedStream::read(JetPack::BufferedStream *this, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  const void **v14;
  uint64_t v15;
  const void *v16;
  size_t v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;

  if (((*(uint64_t (**)(JetPack::BufferedStream *))(*(_QWORD *)this + 64))(this) & 1) == 0)
  {
    do
    {
      if (*((_QWORD *)this + 6) >= a3)
        break;
      (*(void (**)(JetPack::BufferedStream *, unint64_t))(*(_QWORD *)this + 56))(this, a3);
    }
    while (!(*(unsigned int (**)(JetPack::BufferedStream *))(*(_QWORD *)this + 64))(this));
  }
  if (*((_QWORD *)this + 6) < a3)
    a3 = *((_QWORD *)this + 6);
  v6 = *((_QWORD *)this + 2);
  v7 = (_QWORD *)(v6 + 8 * (*((_QWORD *)this + 5) >> 12));
  if (*((_QWORD *)this + 3) == v6)
  {
    v8 = 0;
    if (!a3)
      goto LABEL_22;
  }
  else
  {
    v8 = (_BYTE *)(*v7 + (*((_QWORD *)this + 5) & 0xFFFLL));
    if (!a3)
      goto LABEL_22;
  }
  v9 = (unint64_t)&v8[a3 - *v7];
  if ((uint64_t)v9 >= 1)
  {
    v10 = v9 >> 12;
    v11 = (_BYTE *)(v7[v9 >> 12] + (v9 & 0xFFF));
    if (v9 >> 12)
      goto LABEL_12;
LABEL_20:
    v17 = v11 - v8;
    if (v11 == v8)
      goto LABEL_22;
    goto LABEL_21;
  }
  v18 = 4095 - v9;
  v19 = ~(_WORD)v18;
  v18 >>= 12;
  v10 = -(uint64_t)v18;
  v11 = (_BYTE *)(v7[-v18] + (v19 & 0xFFF));
  if (!v18)
    goto LABEL_20;
LABEL_12:
  v12 = *v7 + 4096;
  v13 = v12 - (_QWORD)v8;
  if ((_BYTE *)v12 != v8)
    memmove(a2, v8, v12 - (_QWORD)v8);
  a2 += v13;
  if (v10 != 1)
  {
    v14 = (const void **)(v7 + 1);
    v15 = 8 * v10 - 8;
    do
    {
      v16 = *v14++;
      memmove(a2, v16, 0x1000uLL);
      a2 += 4096;
      v15 -= 8;
    }
    while (v15);
  }
  v8 = (_BYTE *)v7[v10];
  if (v8 != v11)
  {
    v17 = v11 - v8;
LABEL_21:
    memmove(a2, v8, v17);
  }
LABEL_22:
  v20 = *((_QWORD *)this + 5);
  v21 = *((_QWORD *)this + 2);
  v22 = (char *)(v21 + 8 * (v20 >> 12));
  if (*((_QWORD *)this + 3) != v21)
  {
    v23 = (char *)(*(_QWORD *)v22 + (*((_QWORD *)this + 5) & 0xFFFLL));
    if (a3)
      goto LABEL_24;
LABEL_27:
    v26 = v23;
    v25 = (char *)(v21 + 8 * (v20 >> 12));
    goto LABEL_29;
  }
  v23 = 0;
  if (!a3)
    goto LABEL_27;
LABEL_24:
  v24 = (uint64_t)&v23[a3 - *(_QWORD *)v22];
  if (v24 < 1)
  {
    v27 = 4095 - v24;
    v25 = &v22[-8 * (v27 >> 12)];
    v26 = (char *)(*(_QWORD *)v25 + (~(_WORD)v27 & 0xFFF));
  }
  else
  {
    v25 = &v22[8 * ((unint64_t)v24 >> 12)];
    v26 = (char *)(*(_QWORD *)v25 + (v24 & 0xFFF));
  }
LABEL_29:
  std::deque<unsigned char>::erase((_QWORD *)this + 1, v22, v23, v25, v26);
  *((_QWORD *)this + 7) += a3;
  return a3;
}

uint64_t JetPack::SignedStreamDecoder::inputIsFinished(JetPack::SignedStreamDecoder *this)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 8) + 32))(*((_QWORD *)this + 8));
  if ((_DWORD)result)
    return *((_BYTE *)this + 128) != 0;
  return result;
}

BOOL JetPack::FileStream::isFinished(FILE **this)
{
  return feof(this[1]) != 0;
}

void **std::deque<unsigned char>::erase(_QWORD *a1, char *a2, char *a3, char *a4, char *a5)
{
  char *v5;
  uint64_t v8;
  unint64_t v9;
  void **i;
  void **v11;
  const void **v12;
  char *v13;
  int64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  const void **v18;
  uint64_t v19;
  uint64_t v20;
  const void **v21;
  _BYTE *v22;
  const void **v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const void **v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void **result;
  unint64_t v37;
  uint64_t v38;
  const void **v39[4];

  v5 = a3;
  if (a5 == a3)
    v8 = 0;
  else
    v8 = &a5[512 * (a4 - a2)] - a3 - *(_QWORD *)a4 + *(_QWORD *)a2;
  v9 = a1[4];
  i = (void **)a1[1];
  v11 = (void **)a1[2];
  v12 = (const void **)&i[v9 >> 12];
  if (v11 != i)
  {
    v13 = (char *)*v12 + (a1[4] & 0xFFFLL);
    if (v5 != v13)
      goto LABEL_6;
LABEL_11:
    v15 = 0;
    v17 = 1;
    goto LABEL_13;
  }
  v13 = 0;
  if (!v5)
    goto LABEL_11;
LABEL_6:
  v14 = &v5[512 * (a2 - (char *)v12)] - &v13[*(_QWORD *)a2];
  v15 = (char *)*v12 + v14;
  if (!v15)
  {
    v17 = 1;
    v5 = v13;
LABEL_13:
    v18 = (const void **)&i[v9 >> 12];
    if (v8 < 1)
      goto LABEL_35;
    goto LABEL_14;
  }
  v16 = (uint64_t)&v13[v14];
  if (v16 < 1)
  {
    v17 = 0;
    v26 = 4095 - v16;
    v18 = &v12[-(v26 >> 12)];
    v5 = (char *)*v18 + (~(_WORD)v26 & 0xFFF);
    if (v8 < 1)
      goto LABEL_35;
  }
  else
  {
    v17 = 0;
    v18 = &v12[(unint64_t)v16 >> 12];
    v5 = (char *)*v18 + (v16 & 0xFFF);
    if (v8 < 1)
      goto LABEL_35;
  }
LABEL_14:
  v19 = a1[5];
  v20 = v5 - (_BYTE *)*v18 + v8;
  if ((unint64_t)v15 <= (unint64_t)(v19 - v8) >> 1)
  {
    if (v20 < 1)
    {
      v23 = &v18[-((unint64_t)(4095 - v20) >> 12)];
      v24 = (char *)*v23;
      v25 = ~(4095 - (_WORD)v20) & 0xFFF;
    }
    else
    {
      v23 = &v18[(unint64_t)v20 >> 12];
      v24 = (char *)*v23;
      v25 = v20 & 0xFFF;
    }
    std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,0>(v12, v13, v18, v5, v23, &v24[v25], v39);
    v31 = a1[5] - v8;
    v9 = a1[4] + v8;
    a1[4] = v9;
    a1[5] = v31;
    for (i = (void **)a1[1]; v9 >= 0x2000; a1[4] = v9)
    {
      operator delete(*i);
      i = (void **)(a1[1] + 8);
      a1[1] = i;
      v9 = a1[4] - 4096;
    }
  }
  else
  {
    if (v20 < 1)
    {
      v27 = 4095 - v20;
      v21 = &v18[-(v27 >> 12)];
      v22 = (char *)*v21 + (~(_WORD)v27 & 0xFFF);
    }
    else
    {
      v21 = &v18[(unint64_t)v20 >> 12];
      v22 = (char *)*v21 + (v20 & 0xFFF);
    }
    v28 = v19 + v9;
    v29 = (const void **)&i[v28 >> 12];
    if (v11 == i)
      v30 = 0;
    else
      v30 = (char *)*v29 + (v28 & 0xFFF);
    v39[0] = v18;
    v39[1] = (const void **)v5;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v21, v22, v29, v30, (uint64_t)v39);
    i = (void **)a1[1];
    v32 = a1[2];
    v33 = ((v32 - (_QWORD)i) << 9) - 1;
    if ((void **)v32 == i)
      v33 = 0;
    v9 = a1[4];
    v34 = a1[5] - v8;
    a1[5] = v34;
    if (v33 - (v34 + v9) >= 0x2000)
    {
      do
      {
        operator delete(*(void **)(v32 - 8));
        i = (void **)a1[1];
        v32 = a1[2] - 8;
        v35 = ((v32 - (_QWORD)i) << 9) - 1;
        a1[2] = v32;
        if ((void **)v32 == i)
          v35 = 0;
        v9 = a1[4];
      }
      while ((v35 - (a1[5] + v9)) >> 13);
    }
  }
LABEL_35:
  result = &i[v9 >> 12];
  if ((void **)a1[2] == i)
  {
    v37 = 0;
    if ((v17 & 1) != 0)
      return result;
  }
  else
  {
    v37 = (unint64_t)*result + (v9 & 0xFFF);
    if ((v17 & 1) != 0)
      return result;
  }
  v38 = (uint64_t)&v15[v37 - (_QWORD)*result];
  if (v38 < 1)
    result -= (unint64_t)(4095 - v38) >> 12;
  else
    result += (unint64_t)v38 >> 12;
  return result;
}

uint64_t JetPack::detail::readCallback(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t result;

  v4 = a2 + 1;
  result = (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, a2 + 1, 0x20000);
  *a3 = v4;
  return result;
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::read(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  JetPack::BrotliUnknownDecoderResultException *v14;
  JetPack::BrotliAvailableInNotEmptyOnFillException *exception;
  JetPack::BrotliStreamNotFinishedAfterDecodingException *v16;

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1) & 1) != 0)
    return 0;
  *(_QWORD *)(a1 + 32) = a3;
  *(_QWORD *)(a1 + 40) = a2;
  while (1)
  {
    if (*(_DWORD *)(a1 + 48) == 2
      && ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      if (*(_QWORD *)(a1 + 16))
      {
        exception = (JetPack::BrotliAvailableInNotEmptyOnFillException *)__cxa_allocate_exception(0x20uLL);
        JetPack::BrotliAvailableInNotEmptyOnFillException::BrotliAvailableInNotEmptyOnFillException(exception);
      }
      v7 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72));
      v8 = *(_QWORD *)(a1 + 72);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v8;
    }
    v9 = *(_QWORD *)(a1 + 8);
    v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56));
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 16))(v9, a1 + 16, a1 + 24, a1 + 32, a1 + 40, v10);
    *(_DWORD *)(a1 + 48) = v11;
    if (v11 != 2)
      break;
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56)))
    {
      v12 = __cxa_allocate_exception(0x20uLL);
      *((_WORD *)v12 + 11) = 0;
      *((_BYTE *)v12 + 31) = 13;
      *(_QWORD *)v12 = &unk_24C804450;
      strcpy((char *)v12 + 8, "NotEnoughData");
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v11 == 1)
  {
    if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      v16 = (JetPack::BrotliStreamNotFinishedAfterDecodingException *)__cxa_allocate_exception(0x20uLL);
      JetPack::BrotliStreamNotFinishedAfterDecodingException::BrotliStreamNotFinishedAfterDecodingException(v16);
    }
  }
  else if (v11 != 3)
  {
    v14 = (JetPack::BrotliUnknownDecoderResultException *)__cxa_allocate_exception(0x28uLL);
    JetPack::BrotliUnknownDecoderResultException::BrotliUnknownDecoderResultException(v14, *(_DWORD *)(a1 + 48));
  }
  result = a3 - v13;
  *(_QWORD *)(a1 + 96) += a3 - v13;
  return result;
}

void sub_20DA5F9E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t JetPack::UnownedPartialStream::read(JetPack::UnownedPartialStream *this, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v6 = *((_QWORD *)this + 2);
  v7 = (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(_QWORD *)this + 24))(this);
  if (v6 - v7 >= a3)
    v8 = a3;
  else
    v8 = v6 - v7;
  return (*(uint64_t (**)(_QWORD, unsigned __int8 *, unint64_t))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), a2, v8);
}

BOOL JetPack::UnownedPartialStream::isFinished(JetPack::UnownedPartialStream *this)
{
  return ((*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1)) & 1) != 0
      || (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(_QWORD *)this + 24))(this) == *((_QWORD *)this + 2);
}

uint64_t JetPack::UnownedPartialStream::position(JetPack::UnownedPartialStream *this)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1));
  if (*((_QWORD *)this + 2) >= (unint64_t)(v2 - *((_QWORD *)this + 3)))
    return v2 - *((_QWORD *)this + 3);
  else
    return *((_QWORD *)this + 2);
}

uint64_t JetPack::BufferedStream::position(JetPack::BufferedStream *this)
{
  return *((_QWORD *)this + 7);
}

uint64_t JetPack::AESDecoderStream::position(JetPack::AESDecoderStream *this)
{
  return *((_QWORD *)this + 7);
}

uint64_t JetPack::AESDecoderStream::isFinished(JetPack::AESDecoderStream *this)
{
  if (*((_QWORD *)this + 13))
    return 0;
  else
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1));
}

uint64_t JetPack::AppleDecompressionInterface::process(JetPack::AppleDecompressionInterface *this, unint64_t *a2, const unsigned __int8 **a3, unint64_t *a4, unsigned __int8 **a5, BOOL flags)
{
  uint64_t v11;
  char *v12;
  uint64_t result;
  unsigned __int8 *v14;

  v11 = *a2;
  *((_QWORD *)this + 3) = *a3;
  *((_QWORD *)this + 1) = *a5;
  v12 = (char *)this + 8;
  *((_QWORD *)this + 4) = v11;
  *((_QWORD *)this + 2) = *a4;
  result = compression_stream_process((compression_stream *)((char *)this + 8), flags);
  *a2 = *((_QWORD *)v12 + 3);
  *a3 = (const unsigned __int8 *)*((_QWORD *)this + 3);
  v14 = *(unsigned __int8 **)v12;
  *a4 = *((_QWORD *)v12 + 1);
  *a5 = v14;
  if ((_DWORD)result == -1)
    return 0;
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1)
    {
      *((_BYTE *)this + 48) = 1;
      return result;
    }
    return 0;
  }
  if (!*((_QWORD *)this + 2))
    return 3;
  if (*((_QWORD *)this + 4))
    return 0;
  return 2;
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::position(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t JetPack::AppleDecompressionInterface::isFinished(JetPack::AppleDecompressionInterface *this)
{
  return *((unsigned __int8 *)this + 48);
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::isFinished(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
}

uint64_t JetPack::BufferedStream::isFinished(JetPack::BufferedStream *this)
{
  if (*((_QWORD *)this + 6))
    return 0;
  else
    return (*(uint64_t (**)(JetPack::BufferedStream *))(*(_QWORD *)this + 64))(this);
}

void JetPack::FileStream::position(JetPack::FileStream *this)
{
  JUMPOUT(0x212BAD770);
}

uint64_t JetPack::CommonCryptoBackend::aesGCMDecrypt(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, const unsigned __int8 *a6, unint64_t a7, const unsigned __int8 *a8, __int128 a9, unsigned __int8 *a10, unsigned __int8 *a11, unint64_t a12)
{
  if (CCCryptorGCMOneshotDecrypt())
    return 4294966296;
  else
    return 1;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, unsigned __int8 *a3, __int128 *a4)
{
  uint64_t (*v5)(uint64_t, uint64_t, __int128 *);
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;

  v5 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *))(a1 + 8);
  v6 = *a3;
  v12 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v7 = v5(a2, v6, &v12);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

void sub_20DA5FCE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10)
    std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::parseSegmentContainerHeader(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *exception;
  std::exception v12[3];
  char v13;
  char __p[20];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 19;
  strcpy(__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v12, (uint64_t)__p);
  if (v15 < 0)
    operator delete(*(void **)__p);
  v12[0].__vftable = (std::exception_vtbl *)&unk_24C804608;
  v4 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl(&dword_20DA5A000, v4, OS_LOG_TYPE_DEFAULT, "Reading segment container header", (uint8_t *)__p, 2u);
  }
  v5 = *a1;
  __p[0] = 0;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)v5 + 16))(v5, __p, 1) != 1)
    goto LABEL_14;
  v6 = __p[0];
  v7 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v6;
    _os_log_impl(&dword_20DA5A000, v7, OS_LOG_TYPE_DEBUG, "Tag is %{public}hhu", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(_QWORD, char *, uint64_t))(*(_QWORD *)*a1 + 16))(*a1, __p, 4) != 4)
  {
LABEL_14:
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v8 = *(unsigned int *)__p;
  v9 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v8;
    _os_log_impl(&dword_20DA5A000, v9, OS_LOG_TYPE_DEBUG, "Length is %{public}i", (uint8_t *)__p, 8u);
  }
  v12[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v13 < 0)
    operator delete(v12[1].__vftable);
  std::exception::~exception(v12);
  return v6 | (v8 << 32);
}

void sub_20DA5FF48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA5FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
  __cxa_end_catch();
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA5FF9C(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA5FFA4);
  __clang_call_terminate(a1);
}

uint64_t JetPack::readSegment(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t SerializationSegment;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  NSObject *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  NSObject *v30;
  JetPack::InvalidSegmentTagException *exception;
  JetPack *v32;
  std::__shared_weak_count *v33;
  JetPack *v34;
  std::__shared_weak_count *v35;
  JetPack *v36;
  std::__shared_weak_count *v37;
  JetPack *v38;
  std::__shared_weak_count *v39;
  uint8_t buf[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  SerializationSegment = 1;
  switch(a2)
  {
    case 1:
      return SerializationSegment;
    case 2:
      v6 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DA5A000, v6, OS_LOG_TYPE_DEBUG, "Reading data segment", buf, 2u);
      }
      v7 = *(std::__shared_weak_count **)(a3 + 8);
      v38 = *(JetPack **)a3;
      v39 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      SerializationSegment = JetPack::readDataSegment(a1, &v38);
      v10 = v39;
      if (!v39)
        return SerializationSegment;
      v11 = (unint64_t *)&v39->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      break;
    case 3:
      v18 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DA5A000, v18, OS_LOG_TYPE_DEBUG, "Reading serialization segment", buf, 2u);
      }
      v19 = *(std::__shared_weak_count **)(a3 + 8);
      v34 = *(JetPack **)a3;
      v35 = v19;
      if (v19)
      {
        v20 = (unint64_t *)&v19->__shared_owners_;
        do
          v21 = __ldxr(v20);
        while (__stxr(v21 + 1, v20));
      }
      SerializationSegment = JetPack::readSerializationSegment();
      v10 = v35;
      if (!v35)
        return SerializationSegment;
      v22 = (unint64_t *)&v35->__shared_owners_;
      do
        v12 = __ldaxr(v22);
      while (__stlxr(v12 - 1, v22));
      break;
    case 4:
      v23 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DA5A000, v23, OS_LOG_TYPE_DEBUG, "Reading brotli segment", buf, 2u);
      }
      v24 = *(std::__shared_weak_count **)(a3 + 8);
      v36 = *(JetPack **)a3;
      v37 = v24;
      if (v24)
      {
        v25 = (unint64_t *)&v24->__shared_owners_;
        do
          v26 = __ldxr(v25);
        while (__stxr(v26 + 1, v25));
      }
      SerializationSegment = JetPack::readBrotliSegment(a1, (uint64_t *)&v36);
      v10 = v37;
      if (!v37)
        return SerializationSegment;
      v27 = (unint64_t *)&v37->__shared_owners_;
      do
        v12 = __ldaxr(v27);
      while (__stlxr(v12 - 1, v27));
      break;
    case 7:
      v13 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DA5A000, v13, OS_LOG_TYPE_DEBUG, "Reading encryption segment", buf, 2u);
      }
      v14 = *(std::__shared_weak_count **)(a3 + 8);
      v32 = *(JetPack **)a3;
      v33 = v14;
      if (v14)
      {
        v15 = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      SerializationSegment = JetPack::readEncryptedSegment(a1, &v32);
      v10 = v33;
      if (!v33)
        return SerializationSegment;
      v17 = (unint64_t *)&v33->__shared_owners_;
      do
        v12 = __ldaxr(v17);
      while (__stlxr(v12 - 1, v17));
      break;
    default:
      v30 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        v41 = a2;
        _os_log_impl(&dword_20DA5A000, v30, OS_LOG_TYPE_ERROR, "Unable to find segment for tag %{public}i", buf, 8u);
      }
      exception = (JetPack::InvalidSegmentTagException *)__cxa_allocate_exception(0x28uLL);
      JetPack::InvalidSegmentTagException::InvalidSegmentTagException(exception, a2);
  }
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  return SerializationSegment;
}

void sub_20DA60348(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DA6035C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<JetPack::PartialStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void JetPack::PartialStream::~PartialStream(JetPack::PartialStream *this)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  *(_QWORD *)this = &unk_24C8041A0;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  *(_QWORD *)this = &unk_24C8041A0;
  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  JUMPOUT(0x212BAD578);
}

void JetPack::SignedStreamDecoder::readBlock(JetPack::SignedStreamDecoder *this)
{
  char *v2;
  size_t v3;
  _DWORD *v4;
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  size_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  void *v14;
  size_t v15;
  char v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  JetPack::BlockExceedsMaximumSizeException *v28;
  void *v29;
  JetPack::InvalidSignatureException *v30;
  JetPack::MissingTerminationBlockException *exception;
  JetPack::InvalidDataAfterTerminationBlockException *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  char *v37;
  void *v38;
  char *v39;
  char *v40;
  void *__p;
  void *v42;
  char *v43;
  void *v44;
  char *v45;
  char *v46;
  void *v47;
  _BYTE *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;

  if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 8) + 32))(*((_QWORD *)this + 8))
    && !*((_BYTE *)this + 128))
  {
    exception = (JetPack::MissingTerminationBlockException *)__cxa_allocate_exception(0x20uLL);
    JetPack::MissingTerminationBlockException::MissingTerminationBlockException(exception);
  }
  if ((*(uint64_t (**)(_QWORD, char **, uint64_t))(**((_QWORD **)this + 8) + 16))(*((_QWORD *)this + 8), &v51, 4) != 4)
  {
    v27 = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)v27 + 11) = 0;
    *((_BYTE *)v27 + 31) = 13;
    *(_QWORD *)v27 = &unk_24C804450;
    strcpy((char *)v27 + 8, "NotEnoughData");
  }
  if (v51 >= 0x8000001)
  {
    v28 = (JetPack::BlockExceedsMaximumSizeException *)__cxa_allocate_exception(0x20uLL);
    JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(v28);
  }
  readVector(*((JetPack::BaseStream **)this + 8), v51, 1, (uint64_t)&v51);
  if ((*(uint64_t (**)(_QWORD, char **, uint64_t))(**((_QWORD **)this + 8) + 16))(*((_QWORD *)this + 8), &v49, 2) != 2)
  {
    v29 = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)v29 + 11) = 0;
    *((_BYTE *)v29 + 31) = 13;
    *(_QWORD *)v29 = &unk_24C804450;
    strcpy((char *)v29 + 8, "NotEnoughData");
  }
  readVector(*((JetPack::BaseStream **)this + 8), (unsigned __int16)v49, 1, (uint64_t)&v49);
  v45 = 0;
  v46 = 0;
  v44 = 0;
  v2 = v51;
  v3 = v52 - v51;
  if (v52 != v51)
  {
    if ((v3 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v44 = operator new(v52 - v51);
    v46 = (char *)v44 + v3;
    memcpy(v44, v2, v3);
    v45 = (char *)v44 + v3;
  }
  v4 = operator new(7uLL);
  v5 = v4;
  *(_DWORD *)((char *)v4 + 3) = 1801675120;
  *v4 = 1886676298;
  if (*((_BYTE *)this + 120))
  {
    __p = 0;
    v42 = 0;
    v43 = 0;
    v7 = (_BYTE *)*((_QWORD *)this + 12);
    v6 = (_BYTE *)*((_QWORD *)this + 13);
    v8 = v6 - v7;
    if (v6 != v7)
    {
      if ((v8 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v9 = (char *)operator new(v6 - v7);
      v10 = &v9[v8];
      __p = v9;
      v43 = &v9[v8];
      memcpy(v9, v7, v8);
      v42 = v10;
    }
  }
  else
  {
    __p = v4;
    v42 = (char *)v4 + 7;
    v43 = (char *)v4 + 7;
    v5 = 0;
  }
  JetPack::signingChunkForDataBlock((char **)&v44, (char **)&__p, &v47);
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  if (v5)
    operator delete(v5);
  if (v44)
  {
    v45 = (char *)v44;
    operator delete(v44);
  }
  v11 = *((_QWORD *)this + 10);
  v39 = 0;
  v40 = 0;
  v38 = 0;
  v12 = v49;
  v13 = v50 - v49;
  if (v50 != v49)
  {
    if ((v13 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v38 = operator new(v50 - v49);
    v40 = (char *)v38 + v13;
    memcpy(v38, v12, v13);
    v39 = (char *)v38 + v13;
  }
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v14 = v47;
  v15 = v48 - (_BYTE *)v47;
  if (v48 != v47)
  {
    if ((v15 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v35 = operator new(v48 - (_BYTE *)v47);
    v37 = (char *)v35 + v15;
    memcpy(v35, v14, v15);
    v36 = (char *)v35 + v15;
  }
  v16 = (*(uint64_t (**)(uint64_t, void **, void **))(*(_QWORD *)v11 + 16))(v11, &v38, &v35);
  if (v35)
  {
    v36 = (char *)v35;
    operator delete(v35);
  }
  if (v38)
  {
    v39 = (char *)v38;
    operator delete(v38);
  }
  if ((v16 & 1) == 0)
  {
    v30 = (JetPack::InvalidSignatureException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InvalidSignatureException::InvalidSignatureException(v30);
  }
  v17 = v51;
  v18 = v52;
  if (v52 != v51)
    goto LABEL_36;
  readToEndVector(*((JetPack::BaseStream **)this + 8), &v33);
  v19 = v33;
  v20 = v34;
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }
  if (v20 != v19)
  {
    v32 = (JetPack::InvalidDataAfterTerminationBlockException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InvalidDataAfterTerminationBlockException::InvalidDataAfterTerminationBlockException(v32);
  }
  *((_BYTE *)this + 128) = 1;
  v17 = v51;
  v18 = v52;
  if (v51 != v52)
  {
LABEL_36:
    v21 = *((_QWORD *)this + 6);
    do
    {
      v23 = *((_QWORD *)this + 3);
      v24 = *((_QWORD *)this + 2);
      if (v23 == v24)
        v25 = 0;
      else
        v25 = ((v23 - v24) << 9) - 1;
      v26 = *((_QWORD *)this + 5) + v21;
      if (v25 == v26)
      {
        std::deque<unsigned char>::__add_back_capacity((uint64_t)this + 8);
        v24 = *((_QWORD *)this + 2);
        v26 = *((_QWORD *)this + 6) + *((_QWORD *)this + 5);
      }
      v22 = *v17++;
      *(_BYTE *)(*(_QWORD *)(v24 + ((v26 >> 9) & 0x7FFFFFFFFFFFF8)) + (v26 & 0xFFF)) = v22;
      v21 = *((_QWORD *)this + 6) + 1;
      *((_QWORD *)this + 6) = v21;
    }
    while (v17 != v18);
  }
  std::optional<std::vector<unsigned char>>::operator=[abi:ne180100]<std::vector<unsigned char>&,void>((uint64_t)this + 96, &v49);
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
}

void sub_20DA60918(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  uint64_t v25;
  void *v27;
  void *v28;

  if (__p)
    operator delete(__p);
  v27 = *(void **)(v25 - 96);
  if (v27)
  {
    *(_QWORD *)(v25 - 88) = v27;
    operator delete(v27);
    v28 = *(void **)(v25 - 72);
    if (!v28)
LABEL_5:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v28 = *(void **)(v25 - 72);
    if (!v28)
      goto LABEL_5;
  }
  *(_QWORD *)(v25 - 64) = v28;
  operator delete(v28);
  _Unwind_Resume(exception_object);
}

void std::deque<unsigned char>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  BOOL v35;
  int64_t v36;
  unint64_t v37;
  char *v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int64_t v43;
  unint64_t v44;
  char *v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 *v56;
  _OWORD *v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 *v64;
  _OWORD *v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 >= 0x1000;
  v4 = v2 - 4096;
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v6 + 1);
    v8 = *v6;
    *(_QWORD *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_56:
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v29 = (v5 - v9) >> 2;
      if (v5 == v9)
        v29 = 1;
      if (!(v29 >> 61))
      {
        v30 = v29 >> 2;
        v31 = 8 * v29;
        v32 = (char *)operator new(8 * v29);
        v33 = &v32[8 * v30];
        v34 = &v32[v31];
        v36 = v5 - v7;
        v35 = v5 == v7;
        v5 = v33;
        if (!v35)
        {
          v5 = &v33[v36 & 0xFFFFFFFFFFFFFFF8];
          v37 = v36 - 8;
          if ((unint64_t)(v36 - 8) >= 0x38)
          {
            v53 = &v32[8 * v30];
            v38 = v53;
            if ((unint64_t)(v53 - v7) >= 0x20)
            {
              v54 = (v37 >> 3) + 1;
              v55 = 8 * (v54 & 0x3FFFFFFFFFFFFFFCLL);
              v38 = &v33[v55];
              v7 += v55;
              v56 = (__int128 *)(v6 + 3);
              v57 = v53 + 16;
              v58 = v54 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v59 = *v56;
                *(v57 - 1) = *(v56 - 1);
                *v57 = v59;
                v56 += 2;
                v57 += 2;
                v58 -= 4;
              }
              while (v58);
              if (v54 == (v54 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_54;
            }
          }
          else
          {
            v38 = &v32[8 * v30];
          }
          do
          {
            v60 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v38 = v60;
            v38 += 8;
          }
          while (v38 != v5);
        }
        goto LABEL_54;
      }
LABEL_64:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    v11 = v10 >> 3;
    if (v11 >= -1)
      v12 = v11 + 1;
    else
      v12 = v11 + 2;
    v13 = v12 >> 1;
    v14 = -v13;
    v15 = &v7[-8 * v13];
    v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(_QWORD *)(a1 + 8) = &v7[8 * v14];
    *(_QWORD *)(a1 + 16) = &v15[v16];
    goto LABEL_56;
  }
  v18 = *(char **)(a1 + 8);
  v17 = *(char **)(a1 + 16);
  v19 = v17 - v18;
  v20 = (v17 - v18) >> 3;
  v21 = *(char **)(a1 + 24);
  v22 = (uint64_t)&v21[-*(_QWORD *)a1];
  if (v20 < (unint64_t)(v22 >> 3))
  {
    if (v21 != v17)
    {
      *(_QWORD *)&v69 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back((char **)a1, &v69);
      return;
    }
    *(_QWORD *)&v69 = operator new(0x1000uLL);
    std::__split_buffer<unsigned char *>::push_front((void **)a1, &v69);
    v39 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v39 + 1);
    v8 = *v39;
    *(_QWORD *)(a1 + 8) = v39 + 1;
    if (v5 != *(char **)(a1 + 24))
      goto LABEL_56;
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v40 = (v5 - v9) >> 2;
      if (v5 == v9)
        v40 = 1;
      if (!(v40 >> 61))
      {
        v41 = v40 >> 2;
        v42 = 8 * v40;
        v32 = (char *)operator new(8 * v40);
        v33 = &v32[8 * v41];
        v34 = &v32[v42];
        v43 = v5 - v7;
        v35 = v5 == v7;
        v5 = v33;
        if (!v35)
        {
          v5 = &v33[v43 & 0xFFFFFFFFFFFFFFF8];
          v44 = v43 - 8;
          if ((unint64_t)(v43 - 8) >= 0x38)
          {
            v61 = &v32[8 * v41];
            v45 = v61;
            if ((unint64_t)(v61 - v7) >= 0x20)
            {
              v62 = (v44 >> 3) + 1;
              v63 = 8 * (v62 & 0x3FFFFFFFFFFFFFFCLL);
              v45 = &v33[v63];
              v7 += v63;
              v64 = (__int128 *)(v39 + 3);
              v65 = v61 + 16;
              v66 = v62 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v67 = *v64;
                *(v65 - 1) = *(v64 - 1);
                *v65 = v67;
                v64 += 2;
                v65 += 2;
                v66 -= 4;
              }
              while (v66);
              if (v62 == (v62 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_54;
            }
          }
          else
          {
            v45 = &v32[8 * v41];
          }
          do
          {
            v68 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v45 = v68;
            v45 += 8;
          }
          while (v45 != v5);
        }
LABEL_54:
        *(_QWORD *)a1 = v32;
        *(_QWORD *)(a1 + 8) = v33;
        *(_QWORD *)(a1 + 16) = v5;
        *(_QWORD *)(a1 + 24) = v34;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_56;
      }
      goto LABEL_64;
    }
    goto LABEL_5;
  }
  v23 = v22 >> 2;
  if (v21 == *(char **)a1)
    v24 = 1;
  else
    v24 = v23;
  v71 = a1 + 24;
  if (v24 >> 61)
    goto LABEL_64;
  v25 = (char *)operator new(8 * v24);
  v26 = &v25[8 * v20];
  *(_QWORD *)&v69 = v25;
  *((_QWORD *)&v69 + 1) = v26;
  *(_QWORD *)&v70 = v26;
  *((_QWORD *)&v70 + 1) = &v25[8 * v24];
  v27 = operator new(0x1000uLL);
  if (v20 == v24)
  {
    if (v19 < 1)
    {
      if (v17 == v18)
        v46 = 1;
      else
        v46 = v19 >> 2;
      if (v46 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v47 = (char *)operator new(8 * v46);
      v26 = &v47[8 * (v46 >> 2)];
      *(_QWORD *)&v69 = v47;
      *((_QWORD *)&v69 + 1) = v26;
      *((_QWORD *)&v70 + 1) = &v47[8 * v46];
      operator delete(v25);
      v17 = *(char **)(a1 + 16);
    }
    else
    {
      v28 = v20 + 2;
      if (v20 >= -1)
        v28 = v20 + 1;
      v26 -= 8 * (v28 >> 1);
      *((_QWORD *)&v69 + 1) = v26;
    }
  }
  *(_QWORD *)v26 = v27;
  *(_QWORD *)&v70 = v26 + 8;
  v48 = -7 - (_QWORD)v17;
  while (v17 != *(char **)(a1 + 8))
  {
    v17 -= 8;
    v48 += 8;
    std::__split_buffer<unsigned char *>::push_front((void **)&v69, v17);
  }
  v49 = *(char **)a1;
  v50 = v69;
  v51 = v70;
  *(_QWORD *)&v69 = *(_QWORD *)a1;
  *((_QWORD *)&v69 + 1) = v17;
  v52 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a1 = v50;
  *(_OWORD *)(a1 + 16) = v51;
  v70 = v52;
  if (v17 != (char *)v52)
    *(_QWORD *)&v70 = v52 + (-(v52 + v48) & 0xFFFFFFFFFFFFFFF8);
  if (v49)
    operator delete(v49);
}

void sub_20DA60E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  void *v11;

  operator delete(v11);
  if (!__p)
    _Unwind_Resume(a1);
  operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<unsigned char *>::push_back(char **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_22;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    v11 = &v6[-8 * v9];
    v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      v4 = a1[1];
    }
    v13 = &v4[8 * v10];
    v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  v14 = (v4 - v5) >> 2;
  if (v4 == v5)
    v14 = 1;
  if (v14 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v15 = v14 >> 2;
  v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  v20 = v4 - v6;
  v19 = v4 == v6;
  v4 = v18;
  if (!v19)
  {
    v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        v31 = *(_QWORD *)v6;
        v6 += 8;
        *(_QWORD *)v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    v23 = &v17[8 * v15];
    v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20)
      goto LABEL_19;
    v24 = (v21 >> 3) + 1;
    v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    v22 = &v18[v25];
    v26 = &v6[v25];
    v27 = (__int128 *)(v6 + 16);
    v28 = v23 + 16;
    v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_19;
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    v4 = a1[2];
  }
LABEL_22:
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<unsigned char *>::push_front(void **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v7 >= v6)
    {
      v13 = v6 - v4;
      v12 = v13 == 0;
      v14 = v13 >> 2;
      if (v12)
        v14 = 1;
      if (v14 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (v14 + 3) >> 2;
      v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        v20 = v19 - 8;
        v21 = &v17[8 * v15];
        v22 = v4;
        if (v20 < 0x38)
          goto LABEL_27;
        v23 = &v17[8 * v15];
        v21 = v23;
        v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20)
          goto LABEL_27;
        v24 = (v20 >> 3) + 1;
        v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v21 = &v5[v25];
        v22 = &v4[v25];
        v26 = (__int128 *)(v4 + 16);
        v27 = v23 + 16;
        v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            v30 = *(_QWORD *)v22;
            v22 += 8;
            *(_QWORD *)v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      v8 = (v6 - v7) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((_QWORD *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

void readVector(JetPack::BaseStream *a1@<X0>, size_t __sz@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  char *v8;
  unint64_t v9;
  unint64_t v11;
  void *exception;

  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = (char *)operator new(__sz);
    *(_QWORD *)a4 = v8;
    *(_QWORD *)(a4 + 16) = &v8[__sz];
    bzero(v8, __sz);
    *(_QWORD *)(a4 + 8) = &v8[__sz];
  }
  else
  {
    v8 = 0;
  }
  v9 = (*(uint64_t (**)(JetPack::BaseStream *, char *, size_t))(*(_QWORD *)a1 + 16))(a1, v8, __sz);
  if (v9 != __sz && a3 != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v11 = *(_QWORD *)(a4 + 8) - *(_QWORD *)a4;
  if (v9 <= v11)
  {
    if (v9 < v11)
      *(_QWORD *)(a4 + 8) = *(_QWORD *)a4 + v9;
  }
  else
  {
    std::vector<unsigned char>::__append((void **)a4, v9 - v11);
  }
}

void sub_20DA6132C(_Unwind_Exception *exception_object)
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

size_t JetPack::FileStream::read(JetPack::FileStream *this, unsigned __int8 *__ptr, size_t a3)
{
  FILE *v3;
  unsigned __int8 v5;
  NSObject *v6;
  unsigned __int8 v7;
  uint8_t v8[16];

  v3 = (FILE *)*((_QWORD *)this + 1);
  if (v3)
    return fread(__ptr, 1uLL, a3, v3);
  {
    getGlobalLog(void)::sharedContext = 4;
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
    }
    qword_253DA4978 = JetPack::getSharedOSLog(void)::log;
  }
  v6 = qword_253DA4978;
  if (os_log_type_enabled((os_log_t)qword_253DA4978, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20DA5A000, v6, OS_LOG_TYPE_ERROR, "THIS IS A FATAL BUG: Trying to read from null file pointer", v8, 2u);
  }
  return 0;
}

uint64_t JetPack::readEncryptedSegment(uint64_t a1, JetPack **a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t MultiSegmentContainer;
  _QWORD *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  JetPack::KeyProviderNotSpecifiedException *exception;
  JetPack::MissingEncryptionKeyException *v20;
  JetPack::CommonCryptoInvalidStatusException *v21;
  int v22;
  struct type_info *v23;
  std::exception v24;
  void *v25;
  char v26;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  _QWORD *v29;
  std::__shared_weak_count *v30;
  void *__p;
  void *v32[2];
  char v33[8];
  uint64_t v34;
  void *v35;
  _QWORD v36[3];
  _QWORD *v37;
  unsigned __int8 v38[16];
  unsigned __int8 v39[23];
  __int128 v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  __p = operator new(0x20uLL);
  *(_OWORD *)v32 = xmmword_20DA6E940;
  strcpy((char *)__p, "UnableToParseEncryptedSegment");
  JetPack::ParseException::ParseException(&v24, (uint64_t)&__p);
  if (SHIBYTE(v32[1]) < 0)
    operator delete(__p);
  v24.__vftable = (std::exception_vtbl *)&unk_24C804928;
  v35 = &unk_24C804320;
  v33[0] = 4;
  {
    JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
  }
  v34 = JetPack::getSharedOSLog(void)::log;
  JetPack::parseEncryptedSegmentHeader(*a2, (JetPack::BaseStream *)v33, (uint64_t)&__p);
  if (!*(_BYTE *)(a1 + 64))
  {
    exception = (JetPack::KeyProviderNotSpecifiedException *)__cxa_allocate_exception(0x20uLL);
    JetPack::KeyProviderNotSpecifiedException::KeyProviderNotSpecifiedException(exception);
  }
  LOWORD(v36[0]) = (_WORD)__p;
  v5 = *(_QWORD *)(a1 + 56);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v5 + 48))(&v40, v5, a1, v36);
  if (!v41)
  {
    v20 = (JetPack::MissingEncryptionKeyException *)__cxa_allocate_exception(0x28uLL);
    JetPack::MissingEncryptionKeyException::MissingEncryptionKeyException(v20, (unsigned __int16)__p);
  }
  *(_OWORD *)v39 = v40;
  if (JetPack::CommonCryptoBackend::deriveKey((JetPack::CommonCryptoBackend *)&v35, (const unsigned __int8 *)v32[0], (char *)v32[1] - (char *)v32[0], v39, 0x10uLL, v38) != 1)
  {
    v21 = (JetPack::CommonCryptoInvalidStatusException *)__cxa_allocate_exception(0x28uLL);
    v22 = JetPack::CommonCryptoBackend::deriveKey((JetPack::CommonCryptoBackend *)&v35, (const unsigned __int8 *)v32[0], (char *)v32[1] - (char *)v32[0], v39, 0x10uLL, v38);
    JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(v21, v22);
    goto LABEL_38;
  }
  if (HIDWORD(__p) >= 0x8000001)
  {
    v21 = (JetPack::CommonCryptoInvalidStatusException *)__cxa_allocate_exception(0x20uLL);
    JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(v21);
LABEL_38:
    __cxa_throw(v21, v23, (void (*)(void *))JetPack::NotEnoughDataException::~NotEnoughDataException);
  }
  v6 = (std::__shared_weak_count *)operator new(0xB8uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E50;
  std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>((uint64_t)v36, (uint64_t)&v6[1], (uint64_t *)a2, (uint64_t *)v38, (unsigned int *)&__p + 1);
  v29 = &v6[1].__vftable;
  v30 = v6;
  v27 = &v6[1].__vftable;
  v28 = v6;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  v36[0] = &unk_24C804A70;
  v36[1] = JetPack::readSegmentContainer;
  v37 = v36;
  MultiSegmentContainer = JetPack::readMultiSegmentContainer(a1, (uint64_t *)&v27, v36);
  v10 = v37;
  if (v37 == v36)
  {
    v11 = 4;
    v10 = v36;
    goto LABEL_15;
  }
  if (v37)
  {
    v11 = 5;
LABEL_15:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  v12 = v28;
  if (v28)
  {
    v13 = (unint64_t *)&v28->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = v30;
  if (v30)
  {
    v16 = (unint64_t *)&v30->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v32[0])
  {
    v32[1] = v32[0];
    operator delete(v32[0]);
  }
  v24.__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v26 < 0)
    operator delete(v25);
  std::exception::~exception(&v24);
  return MultiSegmentContainer;
}

void sub_20DA61880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, void *a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  void *v28;

  __cxa_free_exception(v28);
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseEncryptedSegmentException &>((uint64_t)&a10);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a10);
  _Unwind_Resume(a1);
}

void sub_20DA61968()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA61970);
}

void sub_20DA61980(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA61988);
  __clang_call_terminate(a1);
}

BOOL keyForIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _BOOL8 v11;

  JetPackReaderGetProperty(a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyForIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "keyForIdentifier");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 != 0;
    if (v10)
      objc_msgSend(v10, "getBytes:length:", a3, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void JetPack::parseEncryptedSegmentHeader(JetPack *this@<X0>, JetPack::BaseStream *a2@<X1>, uint64_t a3@<X8>)
{
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  size_t v12;
  NSObject *v13;
  void *v14;
  void *exception;
  std::exception v16[3];
  char v17;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x24BDAC8D0];
  HIBYTE(__p[2]) = 19;
  strcpy((char *)__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v16, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  v16[0].__vftable = (std::exception_vtbl *)&unk_24C804608;
  v7 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_20DA5A000, v7, OS_LOG_TYPE_DEFAULT, "Reading encrypted segment header", (uint8_t *)__p, 2u);
  }
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(_QWORD *)this + 16))(this, __p, 2) != 2)
    goto LABEL_17;
  v8 = LOWORD(__p[0]);
  *(_WORD *)a3 = __p[0];
  v9 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v8;
    _os_log_impl(&dword_20DA5A000, v9, OS_LOG_TYPE_DEBUG, "Key identifier is %{public}i", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(_QWORD *)this + 16))(this, __p, 4) != 4)
    goto LABEL_17;
  v10 = (int)__p[0];
  *(_DWORD *)(a3 + 4) = __p[0];
  v11 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v10;
    _os_log_impl(&dword_20DA5A000, v11, OS_LOG_TYPE_DEBUG, "Block size is %{public}i", (uint8_t *)__p, 8u);
  }
  LOBYTE(__p[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(_QWORD *)this + 16))(this, __p, 1) != 1)
  {
LABEL_17:
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v12 = LOBYTE(__p[0]);
  v13 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v12;
    _os_log_impl(&dword_20DA5A000, v13, OS_LOG_TYPE_DEBUG, "Nonce length is %{public}i", (uint8_t *)__p, 8u);
  }
  readVector(this, v12, 1, (uint64_t)__p);
  v14 = __p[2];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)__p;
  *(_QWORD *)(a3 + 24) = v14;
  v16[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v17 < 0)
    operator delete(v16[1].__vftable);
  std::exception::~exception(v16);
}

void sub_20DA61D44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA61D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
  __cxa_end_catch();
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA61D98(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA61DA0);
  __clang_call_terminate(a1);
}

uint64_t JetPack::CommonCryptoBackend::deriveKey(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, unsigned __int8 *a6)
{
  CCKDFParametersCreateHkdf();
  if (CCDeriveKey())
    return 4294966296;
  else
    return 1;
}

void sub_20DA61E54(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    CCKDFParametersDestroy();
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::AESDecoderStream::AESDecoderStream(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, size_t __sz, uint64_t *a6)
{
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;

  *(_QWORD *)a1 = &off_24C8042D8;
  v8 = a2[1];
  *(_QWORD *)(a1 + 8) = *a2;
  *(_QWORD *)(a1 + 16) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = *a6;
  *a6 = 0;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = a3;
  *(_QWORD *)(a1 + 40) = a4;
  *(_DWORD *)(a1 + 48) = __sz;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_DWORD *)(a1 + 132) = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v12 = (char *)operator new(__sz);
    *(_QWORD *)(a1 + 112) = v12;
    v13 = &v12[__sz];
    *(_QWORD *)(a1 + 128) = &v12[__sz];
    bzero(v12, __sz);
    *(_QWORD *)(a1 + 120) = v13;
    *(_QWORD *)(a1 + 144) = 0;
    *(_QWORD *)(a1 + 152) = 0;
    *(_QWORD *)(a1 + 136) = 0;
    v14 = (char *)operator new(__sz);
    *(_QWORD *)(a1 + 136) = v14;
    v15 = &v14[__sz];
    *(_QWORD *)(a1 + 152) = &v14[__sz];
    bzero(v14, __sz);
    *(_QWORD *)(a1 + 144) = v15;
  }
  else
  {
    *(_QWORD *)(a1 + 136) = 0;
    *(_QWORD *)(a1 + 144) = 0;
    *(_QWORD *)(a1 + 152) = 0;
  }
  return a1;
}

void sub_20DA61F7C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;

  *(_QWORD *)(v1 + 120) = v3;
  operator delete(v3);
  std::deque<unsigned char>::~deque[abi:ne180100](v1 + 64);
  v5 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<JetPack::AESDecoderStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void JetPack::AESDecoderStream::~AESDecoderStream(JetPack::AESDecoderStream *this)
{
  void *v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  *(_QWORD *)this = &off_24C8042D8;
  v2 = (void *)*((_QWORD *)this + 17);
  if (v2)
  {
    *((_QWORD *)this + 18) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 14);
  if (v3)
  {
    *((_QWORD *)this + 15) = v3;
    operator delete(v3);
  }
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 64);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

{
  void *v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  *(_QWORD *)this = &off_24C8042D8;
  v2 = (void *)*((_QWORD *)this + 17);
  if (v2)
  {
    *((_QWORD *)this + 18) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 14);
  if (v3)
  {
    *((_QWORD *)this + 15) = v3;
    operator delete(v3);
  }
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 64);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  JUMPOUT(0x212BAD578);
}

void std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

uint64_t JetPackReaderDestroy(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 40) && *(char *)(result + 39) < 0)
      operator delete(*(void **)(result + 16));
    v2 = *(std::__shared_weak_count **)(v1 + 8);
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
    JUMPOUT(0x212BAD578);
  }
  return result;
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::__on_zero_shared(uint64_t a1)
{
  char v1;

  std::allocator<JetPack::ReaderConfig>::destroy[abi:ne180100]((uint64_t)&v1, a1 + 24);
}

uint64_t JetPackSignatureVerifierDestroy(uint64_t result)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  if (result)
  {
    v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1)
    {
      p_shared_owners = (unint64_t *)&v1->__shared_owners_;
      do
        v3 = __ldaxr(p_shared_owners);
      while (__stlxr(v3 - 1, p_shared_owners));
      if (!v3)
      {
        ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
        std::__shared_weak_count::__release_weak(v1);
      }
    }
    JUMPOUT(0x212BAD578);
  }
  return result;
}

uint64_t std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void JetPack::CommonCryptoSignatureVerifier::~CommonCryptoSignatureVerifier(JetPack::CommonCryptoSignatureVerifier *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;

  *(_QWORD *)this = &off_24C804630;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
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
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;

  *(_QWORD *)this = &off_24C804630;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
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
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_pointer<__SecTrust *,void (*)(void const*),std::allocator<__SecTrust>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t JetPackReaderProcess(uint64_t *a1, uint64_t *a2, uint64_t *a3, char a4)
{
  unsigned __int8 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  __int16 v42[16];
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;

  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  v9 = qword_253DA4958;
  if (os_log_type_enabled((os_log_t)qword_253DA4958, OS_LOG_TYPE_DEBUG))
  {
    v42[0] = 0;
    _os_log_impl(&dword_20DA5A000, v9, OS_LOG_TYPE_DEBUG, "JetPackReaderProcess() API called", (uint8_t *)v42, 2u);
  }
  if (!a1)
  {
    v10 = 0;
    v51 = 0;
    v52 = 0;
    if (a2)
      goto LABEL_9;
LABEL_19:
    v15 = 0;
    v14 = 0;
    v49 = 0;
    v50 = 0;
    if (a3)
      goto LABEL_13;
LABEL_20:
    v19 = 0;
    v18 = 0;
    v47 = 0;
    v48 = 0;
    v45 = v14;
    v46 = v15;
    if (!v15)
      goto LABEL_23;
    goto LABEL_21;
  }
  v10 = *a1;
  v11 = a1[1];
  v51 = *a1;
  v52 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  if (!a2)
    goto LABEL_19;
LABEL_9:
  v14 = *a2;
  v15 = (std::__shared_weak_count *)a2[1];
  v49 = *a2;
  v50 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  if (!a3)
    goto LABEL_20;
LABEL_13:
  v18 = *a3;
  v19 = (std::__shared_weak_count *)a3[1];
  v47 = *a3;
  v48 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v45 = v14;
  v46 = v15;
  if (v15)
  {
LABEL_21:
    v22 = (unint64_t *)&v15->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
LABEL_23:
  v43 = v18;
  v44 = v19;
  if (v19)
  {
    v24 = (unint64_t *)&v19->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  JetPack::readJetPackStream(v10, &v45, (a4 & 1) == 0, &v43);
  v26 = v44;
  if (v44)
  {
    v27 = (unint64_t *)&v44->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v46;
  if (v46)
  {
    v30 = (unint64_t *)&v46->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v48;
  if (v48)
  {
    v33 = (unint64_t *)&v48->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = v50;
  if (v50)
  {
    v36 = (unint64_t *)&v50->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v38 = v52;
  if (v52)
  {
    v39 = (unint64_t *)&v52->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  return 1;
}

void sub_20DA62698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20DA626B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22)
{
  uint64_t v22;
  uint64_t v23;
  const std::exception *v26;

  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  if (a2 == 1)
  {
    v26 = (const std::exception *)__cxa_begin_catch(a1);
    nestedExceptionString(v26, (std::string *)&__p);
    std::optional<std::string>::operator=[abi:ne180100]<std::string,void>(v22 + 16, (__int128 *)&__p);
    if (a14 < 0)
      operator delete(__p);
    __cxa_end_catch();
    if (!a21)
      JUMPOUT(0x20DA625E0);
    JUMPOUT(0x20DA625B0);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v23 - 64);
  _Unwind_Resume(a1);
}

void JetPack::readJetPackStream(uint64_t a1, uint64_t *a2, int a3, uint64_t *a4)
{
  NSObject *v8;
  NSObject *v9;
  uint8_t *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  JetPack::InputStreamRequiredException *exception;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint8_t buf[8];
  uint64_t (*v30)(uint64_t, int, uint64_t);
  uint8_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!*a2)
  {
    exception = (JetPack::InputStreamRequiredException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InputStreamRequiredException::InputStreamRequiredException(exception);
  }
  v8 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DA5A000, v8, OS_LOG_TYPE_DEFAULT, "Reading JetPack stream", buf, 2u);
  }
  if (!*(_BYTE *)(a1 + 224))
  {
    v9 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)
      && (*(_WORD *)buf = 0,
          _os_log_impl(&dword_20DA5A000, v9, OS_LOG_TYPE_DEBUG, "Setting readSegment to default implementation", buf, 2u), *(_BYTE *)(a1 + 224)))
    {
      *(_QWORD *)buf = &unk_24C804A18;
      v30 = JetPack::readSegment;
      v31 = buf;
      std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](buf, (_QWORD *)(a1 + 192));
      v10 = v31;
      if (v31 == buf)
      {
        v11 = 4;
        v10 = buf;
      }
      else
      {
        if (!v31)
          goto LABEL_13;
        v11 = 5;
      }
      (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
    }
    else
    {
      *(_QWORD *)(a1 + 192) = &unk_24C804A18;
      *(_QWORD *)(a1 + 200) = JetPack::readSegment;
      *(_QWORD *)(a1 + 216) = a1 + 192;
      *(_BYTE *)(a1 + 224) = 1;
    }
  }
LABEL_13:
  v12 = (std::__shared_weak_count *)a2[1];
  v27 = *a2;
  v28 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = a4[1];
  v25 = *a4;
  v26 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v16 = (unint64_t *)(v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  JetPack::readRootSegment(a1, (uint64_t)&v27, a3, &v25);
  v18 = v26;
  if (v26)
  {
    v19 = (unint64_t *)&v26->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v28;
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

void sub_20DA629D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DA629E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t JetPack::readRootSegment(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  JetPack::DiagnosticContext *v8;
  uint64_t v9;
  __int16 v10;
  unsigned __int8 v11;
  NSObject *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  NSObject *v33;
  _BYTE *exception;
  NSObject *v35;
  JetPack::UnsupportedJetPackVersionException *v36;
  NSObject *v37;
  _BYTE *v38;
  NSObject *v39;
  JetPack::SignatureVerifierRequiredException *v40;
  std::exception v41[3];
  char v42;
  JetPack *v43;
  std::__shared_weak_count *v44;
  JetPack *v45;
  std::__shared_weak_count *v46;
  void *__p;
  __int128 v48;
  void **p_p;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  __p = operator new(0x20uLL);
  v48 = xmmword_20DA6E530;
  strcpy((char *)__p, "UnableToParseRootSegment");
  JetPack::ParseException::ParseException(v41, (uint64_t)&__p);
  if (SHIBYTE(v48) < 0)
    operator delete(__p);
  v41[0].__vftable = (std::exception_vtbl *)&unk_24C8047C0;
  v9 = JetPack::parseRootHeader(*(JetPack **)a2, (JetPack::BaseStream *)(a1 + 16), v8);
  v11 = v10;
  v50 = v9;
  v51 = v10;
  if (v9 != 0xA6B63615074654ALL)
  {
    v33 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_20DA5A000, v33, OS_LOG_TYPE_ERROR, "Magic number does not match expectation", (uint8_t *)&__p, 2u);
    }
    exception = __cxa_allocate_exception(0x20uLL);
    exception[31] = 18;
    *(_QWORD *)exception = &unk_24C8045B8;
    strcpy(exception + 8, "InvalidMagicNumber");
  }
  if ((v10 & 0xFE) == 0)
  {
    v35 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 67240192;
      HIDWORD(__p) = v11;
      _os_log_impl(&dword_20DA5A000, v35, OS_LOG_TYPE_ERROR, "Unsupported version %{public}i", (uint8_t *)&__p, 8u);
    }
    v36 = (JetPack::UnsupportedJetPackVersionException *)__cxa_allocate_exception(0x20uLL);
    JetPack::UnsupportedJetPackVersionException::UnsupportedJetPackVersionException(v36);
  }
  if (*(_BYTE *)(a1 + 104))
  {
    v12 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_20DA5A000, v12, OS_LOG_TYPE_DEBUG, "Calling didReadHeader callback", (uint8_t *)&__p, 2u);
      if (!*(_BYTE *)(a1 + 104))
        std::__throw_bad_optional_access[abi:ne180100]();
    }
    v13 = *(_QWORD *)(a1 + 96);
    if (!v13)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v13 + 48))(v13, a1, &v50);
  }
  v14 = *(std::__shared_weak_count **)(a2 + 8);
  v45 = *(JetPack **)a2;
  v46 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  if (a3 && !HIBYTE(v51))
  {
    v37 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_20DA5A000, v37, OS_LOG_TYPE_ERROR, "JetPack is not signed even though a signature is required", (uint8_t *)&__p, 2u);
    }
    v38 = __cxa_allocate_exception(0x20uLL);
    v38[31] = 16;
    *(_QWORD *)v38 = &unk_24C8044E8;
    strcpy(v38 + 8, "MissingSignature");
  }
  if (!HIBYTE(v51))
  {
LABEL_24:
    v18 = v46;
    v43 = v45;
    v44 = v46;
    if (!v46)
      goto LABEL_29;
    goto LABEL_27;
  }
  v17 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(__p) = 0;
    _os_log_impl(&dword_20DA5A000, v17, OS_LOG_TYPE_DEBUG, "Header specifies JetPack is signed", (uint8_t *)&__p, 2u);
  }
  if (!*a4)
  {
    v39 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_20DA5A000, v39, OS_LOG_TYPE_ERROR, "JetPack is signed but no verifier is provided", (uint8_t *)&__p, 2u);
    }
    v40 = (JetPack::SignatureVerifierRequiredException *)__cxa_allocate_exception(0x20uLL);
    JetPack::SignatureVerifierRequiredException::SignatureVerifierRequiredException(v40);
  }
  v18 = (std::__shared_weak_count *)operator new(0xA0uLL);
  v18->__shared_weak_owners_ = 0;
  v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E88;
  v18->__shared_owners_ = 0;
  std::allocator<JetPack::SignedStreamDecoder>::construct[abi:ne180100]<JetPack::SignedStreamDecoder,std::shared_ptr<JetPack::BaseStream> &,std::shared_ptr<JetPack::SignatureVerifier> &>((uint64_t)&__p, (uint64_t)&v18[1], (uint64_t *)a2, a4);
  v45 = (JetPack *)&v18[1];
  v46 = v18;
  if (v14)
  {
    v19 = (unint64_t *)&v14->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    goto LABEL_24;
  }
  v43 = (JetPack *)&v18[1];
  v44 = v18;
LABEL_27:
  v21 = (unint64_t *)&v18->__shared_owners_;
  do
    v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
LABEL_29:
  __p = &unk_24C804A70;
  *(_QWORD *)&v48 = JetPack::readSegmentContainer;
  p_p = &__p;
  v23 = JetPack::readMultiSegmentContainer(a1, (uint64_t *)&v43, &__p);
  v24 = p_p;
  if (p_p == &__p)
  {
    v25 = 4;
    v24 = &__p;
    goto LABEL_33;
  }
  if (p_p)
  {
    v25 = 5;
LABEL_33:
    (*((void (**)(void))*v24 + v25))();
  }
  v26 = v44;
  if (v44)
  {
    v27 = (unint64_t *)&v44->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v46;
  if (v46)
  {
    v30 = (unint64_t *)&v46->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v41[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v42 < 0)
    operator delete(v41[1].__vftable);
  std::exception::~exception(v41);
  return v23;
}

void sub_20DA62FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23)
{
  void *v23;

  __cxa_free_exception(v23);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseRootSegmentException &>((uint64_t)&a9);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
  _Unwind_Resume(a1);
}

void sub_20DA63080()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA63088);
}

void sub_20DA63098(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA630A0);
  __clang_call_terminate(a1);
}

uint64_t JetPack::parseRootHeader(JetPack *this, JetPack::BaseStream *a2, JetPack::DiagnosticContext *a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  JetPack::DiagnosticContext *v11;
  void *exception;
  std::exception v14[3];
  char v15;
  char __p[20];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = 19;
  strcpy(__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v14, (uint64_t)__p);
  if (v17 < 0)
    operator delete(*(void **)__p);
  v14[0].__vftable = (std::exception_vtbl *)&unk_24C804608;
  v5 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl(&dword_20DA5A000, v5, OS_LOG_TYPE_DEFAULT, "Reading root header", (uint8_t *)__p, 2u);
  }
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(_QWORD *)this + 16))(this, __p, 8) != 8)
    goto LABEL_15;
  v6 = *(_QWORD *)__p;
  __p[0] = 0;
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(_QWORD *)this + 16))(this, __p, 1) != 1)
    goto LABEL_15;
  v7 = __p[0];
  v8 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v7;
    _os_log_impl(&dword_20DA5A000, v8, OS_LOG_TYPE_DEFAULT, "File format version is %{public}i", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(_QWORD *)this + 16))(this, __p, 4) != 4)
  {
LABEL_15:
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v9 = *(unsigned int *)__p;
  v10 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v9;
    _os_log_impl(&dword_20DA5A000, v10, OS_LOG_TYPE_DEBUG, "Dynamic region length is %{public}i", (uint8_t *)__p, 8u);
  }
  JetPack::UnownedPartialStream::UnownedPartialStream(__p, (uint64_t)this, v9);
  JetPack::parseRootDynamicRegion((JetPack *)__p, a2, v11);
  JetPack::UnownedPartialStream::seekToEnd((JetPack::UnownedPartialStream *)__p);
  v14[0].__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (v15 < 0)
    operator delete(v14[1].__vftable);
  std::exception::~exception(v14);
  return v6;
}

void sub_20DA63358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA63394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
  __cxa_end_catch();
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a9);
  _Unwind_Resume(a1);
}

void sub_20DA633AC(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20DA633B4);
  __clang_call_terminate(a1);
}

BOOL JetPack::parseRootDynamicRegion(JetPack *this, JetPack::BaseStream *a2, JetPack::DiagnosticContext *a3)
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  void *exception;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_20DA5A000, v5, OS_LOG_TYPE_DEBUG, "Reading root dynamic region", (uint8_t *)v10, 2u);
  }
  LOBYTE(v10[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, _DWORD *, uint64_t))(*(_QWORD *)this + 16))(this, v10, 1) != 1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *((_WORD *)exception + 11) = 0;
    *((_BYTE *)exception + 31) = 13;
    *(_QWORD *)exception = &unk_24C804450;
    strcpy((char *)exception + 8, "NotEnoughData");
  }
  v6 = LOBYTE(v10[0]);
  v7 = *((_QWORD *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67240192;
    v10[1] = v6;
    _os_log_impl(&dword_20DA5A000, v7, OS_LOG_TYPE_DEBUG, "Is signed flag is %{public}i", (uint8_t *)v10, 8u);
  }
  return v6 == 1;
}

uint64_t std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void JetPack::SignedStreamDecoder::~SignedStreamDecoder(JetPack::SignedStreamDecoder *this)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  *(_QWORD *)this = &off_24C8043B0;
  if (*((_BYTE *)this + 120))
  {
    v2 = (void *)*((_QWORD *)this + 12);
    if (v2)
    {
      *((_QWORD *)this + 13) = v2;
      operator delete(v2);
    }
  }
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 11);
  if (!v3)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    v6 = (std::__shared_weak_count *)*((_QWORD *)this + 9);
    if (!v6)
      goto LABEL_14;
  }
  else
  {
LABEL_8:
    v6 = (std::__shared_weak_count *)*((_QWORD *)this + 9);
    if (!v6)
      goto LABEL_14;
  }
  v7 = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_14:
  *(_QWORD *)this = &unk_24C8041E8;
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 8);
}

{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  *(_QWORD *)this = &off_24C8043B0;
  if (*((_BYTE *)this + 120))
  {
    v2 = (void *)*((_QWORD *)this + 12);
    if (v2)
    {
      *((_QWORD *)this + 13) = v2;
      operator delete(v2);
    }
  }
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 11);
  if (!v3)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    v6 = (std::__shared_weak_count *)*((_QWORD *)this + 9);
    if (!v6)
      goto LABEL_14;
  }
  else
  {
LABEL_8:
    v6 = (std::__shared_weak_count *)*((_QWORD *)this + 9);
    if (!v6)
      goto LABEL_14;
  }
  v7 = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_14:
  *(_QWORD *)this = &unk_24C8041E8;
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x212BAD578);
}

uint64_t JetPack::DiagnosticContext::DiagnosticContext(uint64_t this)
{
  unsigned __int8 v1;
  unint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)this = 4;
  v2 = 0x253DA4000uLL;
  if ((v1 & 1) == 0)
  {
    v5 = this;
    v2 = 0x253DA4000;
    v4 = v3;
    this = v5;
    if (v4)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      v2 = 0x253DA4000;
      this = v5;
    }
  }
  *(_QWORD *)(this + 8) = *(_QWORD *)(v2 + 2504);
  return this;
}

_QWORD *JetPackSignatureVerifierCreateWithCertificateData(const void *a1, size_t __sz)
{
  char *v4;
  char *v5;
  _QWORD *v6;
  void *__p;
  void *v9;
  char *v10;

  __p = 0;
  v9 = 0;
  v10 = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v4 = (char *)operator new(__sz);
    v5 = &v4[__sz];
    __p = v4;
    v10 = &v4[__sz];
    memcpy(v4, a1, __sz);
    v9 = v5;
  }
  v6 = makePublicRef<JetPackSignatureVerifier,JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>((uint64_t)&__p);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  return v6;
}

void sub_20DA63774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *makePublicRef<JetPackSignatureVerifier,JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)operator new();
  *v2 = 0;
  v2[1] = 0;
  v3 = operator new(0x38uLL);
  v3[2] = 0;
  *v3 = &unk_24C804EF8;
  v3[1] = 0;
  std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>((uint64_t)v5, v3 + 3, a1);
  *v2 = v3 + 3;
  v2[1] = v3;
  return v2;
}

void sub_20DA63848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  std::__shared_weak_count *v9;
  void *v12;
  void *v13;
  NSObject *GlobalLog;
  uint64_t v15;

  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  if (a2 == 1)
  {
    v13 = __cxa_begin_catch(a1);
    GlobalLog = getGlobalLog();
    if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
    {
      v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v13 + 16))(v13);
      LODWORD(a9) = 136446210;
      *(_QWORD *)((char *)&a9 + 4) = v15;
      _os_log_impl(&dword_20DA5A000, GlobalLog, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x20DA63814);
  }
  _Unwind_Resume(a1);
}

_QWORD *JetPack::CommonCryptoSignatureVerifier::CommonCryptoSignatureVerifier(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  const void *v6;
  size_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *__p;
  void *v22;
  char *v23;
  JetPack::CommonCryptoBackend *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  __p = 0;
  v22 = 0;
  v23 = 0;
  v6 = *(const void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = v5 - *(_QWORD *)a2;
  if (v5 != *(_QWORD *)a2)
  {
    if ((v7 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = (char *)operator new(v5 - *(_QWORD *)a2);
    v9 = &v8[v7];
    __p = v8;
    v23 = &v8[v7];
    memcpy(v8, v6, v7);
    v22 = v9;
  }
  JetPack::CommonCryptoBackend::certificateForData((uint64_t)&__p, &v24);
  v10 = *a3;
  *a3 = 0;
  JetPack::CommonCryptoBackend::trustForCertificate(v24, &v26);
  *a1 = &off_24C804630;
  a1[1] = v10;
  v11 = v27;
  a1[2] = v26;
  a1[3] = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    v14 = v27;
    if (v27)
    {
      v15 = (unint64_t *)&v27->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  v17 = v25;
  if (v25)
  {
    v18 = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }
  return a1;
}

void sub_20DA63A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;

  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::certificateForData(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  const void *v4;
  size_t v5;
  char *v6;
  char *v7;
  const __CFAllocator *v8;
  CFDataRef v9;
  SecCertificateRef v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  CFDataRef data;
  std::__shared_weak_count *v15;

  v4 = *(const void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = v3 - *(_QWORD *)a1;
  if (v3 == *(_QWORD *)a1)
  {
    v7 = 0;
    v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v3 - *(_QWORD *)a1);
    v7 = &v6[v5];
    memcpy(v6, v4, v5);
  }
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v6, v7 - v6);
  JetPack::makeCFSharedPtr<__CFData const*>((uint64_t)v9, &data);
  if (v6)
    operator delete(v6);
  v10 = SecCertificateCreateWithData(v8, data);
  JetPack::makeCFSharedPtr<__SecCertificate *>((uint64_t)v10, a2);
  v11 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_20DA63BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::CommonCryptoSignatureVerifier::signatureIsValid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v6;
  uint64_t v7;
  const void *v8;
  size_t v9;
  const __CFAllocator *v10;
  CFDataRef v11;
  uint64_t v12;
  const void *v13;
  size_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  CFDataRef v18;
  BOOL v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  CFErrorRef error;
  char *v31;
  char *v32;
  char *v33;
  CFDataRef signature;
  std::__shared_weak_count *v35;
  CFDataRef signedData;
  std::__shared_weak_count *v37;
  void *__p;
  char *v39;
  char *v40;
  SecKeyRef key;
  std::__shared_weak_count *v42;
  UInt8 bytes[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  JetPack::CommonCryptoBackend::publicKeyForTrust(*(JetPack::CommonCryptoBackend **)(a1 + 16), &key);
  v6 = (const __CFString *)*MEMORY[0x24BDE9298];
  if (SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeVerify, (SecKeyAlgorithm)*MEMORY[0x24BDE9298]))
  {
    v45 = 0u;
    v46 = 0u;
    v7 = *(_QWORD *)(a1 + 8);
    v39 = 0;
    v40 = 0;
    __p = 0;
    v8 = *(const void **)a3;
    v9 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
    if (v9)
    {
      if ((v9 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      __p = operator new(v9);
      v40 = (char *)__p + v9;
      memcpy(__p, v8, v9);
      v39 = (char *)__p + v9;
    }
    (*(void (**)(__int128 *__return_ptr, uint64_t, void **))(*(_QWORD *)v7 + 48))(&v45, v7, &__p);
    if (__p)
    {
      v39 = (char *)__p;
      operator delete(__p);
    }
    *(_OWORD *)bytes = v45;
    v44 = v46;
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 32);
    JetPack::makeCFSharedPtr<__CFData const*>((uint64_t)v11, &signedData);
    v32 = 0;
    v33 = 0;
    v31 = 0;
    v13 = *(const void **)a2;
    v12 = *(_QWORD *)(a2 + 8);
    v14 = v12 - *(_QWORD *)a2;
    if (v12 == *(_QWORD *)a2)
    {
      v16 = 0;
      v15 = 0;
    }
    else
    {
      if ((v14 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v15 = (char *)operator new(v12 - *(_QWORD *)a2);
      v16 = &v15[v14];
      v31 = v15;
      v33 = &v15[v14];
      memcpy(v15, v13, v14);
      v32 = &v15[v14];
    }
    v18 = CFDataCreate(v10, (const UInt8 *)v15, v16 - v15);
    JetPack::makeCFSharedPtr<__CFData const*>((uint64_t)v18, &signature);
    if (v15)
    {
      v32 = v15;
      operator delete(v15);
    }
    error = 0;
    if (SecKeyVerifySignature(key, v6, signedData, signature, &error))
      v19 = error == 0;
    else
      v19 = 0;
    v17 = v19;
    v20 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = v37;
    if (v37)
    {
      v24 = (unint64_t *)&v37->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }
  else
  {
    puts("Unsupported algorithm");
    v17 = 0;
  }
  v26 = v42;
  if (v42)
  {
    v27 = (unint64_t *)&v42->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  return v17;
}

void sub_20DA63EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,char a21)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

void JetPack::CFReleaseIgnoringNull(CFTypeRef this, const void *a2)
{
  if (this)
    CFRelease(this);
}

_QWORD *JetPack::makeCFSharedPtr<__CFData const*>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C8050B8;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA63FB0(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA63FC8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

unsigned __int8 *JetPack::CommonCryptoBackend::computeSHA256Digest@<X0>(uint64_t a1@<X1>, unsigned __int8 *a2@<X8>)
{
  return CC_SHA256(*(const void **)a1, *(_DWORD *)(a1 + 8) - *(_QWORD *)a1, a2);
}

__SecKey *JetPack::CommonCryptoBackend::publicKeyForTrust@<X0>(JetPack::CommonCryptoBackend *this@<X0>, SecKeyRef *a2@<X8>)
{
  SecKeyRef v4;
  SecKeyRef v5;
  __SecKey *result;
  JetPack::FailedToDecodeX509CertificateException *exception;

  v4 = SecTrustCopyKey(this);
  if (!v4)
  {
    puts("Unable to copy public key");
    exception = (JetPack::FailedToDecodeX509CertificateException *)__cxa_allocate_exception(0x20uLL);
    JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(exception);
  }
  v5 = v4;
  *a2 = v4;
  result = (__SecKey *)operator new();
  *(_QWORD *)result = &unk_24C804FD8;
  *((_QWORD *)result + 1) = 0;
  *((_QWORD *)result + 2) = 0;
  *((_QWORD *)result + 3) = v5;
  *((_QWORD *)result + 4) = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA640AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DA640C0(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA640D4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *JetPack::makeCFSharedPtr<__SecKey *>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C804FD8;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA64148(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA64160(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__SecCertificate *,void (*)(void const*),std::allocator<__SecCertificate>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

_QWORD *JetPack::CommonCryptoBackend::trustForCertificate@<X0>(JetPack::CommonCryptoBackend *this@<X0>, _QWORD *a2@<X8>)
{
  JetPack::FailedToDecodeX509CertificateException *exception;
  SecTrustRef trust;

  trust = 0;
  if (SecTrustCreateWithCertificates(this, 0, &trust) || !trust)
  {
    puts("Unable to create trust");
    exception = (JetPack::FailedToDecodeX509CertificateException *)__cxa_allocate_exception(0x20uLL);
    JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(exception);
  }
  return JetPack::makeCFSharedPtr<__SecTrust *>((uint64_t)trust, a2);
}

void sub_20DA64210(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *JetPack::makeCFSharedPtr<__SecCertificate *>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C804FA0;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA64284(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA6429C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *JetPack::makeCFSharedPtr<__SecTrust *>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C804F68;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA64310(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA64328(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *JetPackSignatureVerifierCreateDefault()
{
  return JetPackSignatureVerifierCreateWithCertificateData(&JetPack::defaultCertificateData, 0x149uLL);
}

uint64_t JetPack::readBrotliSegment(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t MultiSegmentContainer;
  _QWORD *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  char v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (std::__shared_weak_count *)operator new(0x80uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804EC0;
  std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>((uint64_t)&v21, (uint64_t)&v4[1], a2);
  v19 = &v4[1].__vftable;
  v20 = v4;
  v17 = &v4[1].__vftable;
  v18 = v4;
  do
    v6 = __ldxr(p_shared_owners);
  while (__stxr(v6 + 1, p_shared_owners));
  v22[0] = &unk_24C804A70;
  v22[1] = JetPack::readSegmentContainer;
  v23 = v22;
  MultiSegmentContainer = JetPack::readMultiSegmentContainer(a1, (uint64_t *)&v17, v22);
  v8 = v23;
  if (v23 == v22)
  {
    v9 = 4;
    v8 = v22;
    goto LABEL_7;
  }
  if (v23)
  {
    v9 = 5;
LABEL_7:
    (*(void (**)(_QWORD *))(*v8 + 8 * v9))(v8);
  }
  v10 = v18;
  if (v18)
  {
    v11 = (unint64_t *)&v18->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v20;
  if (v20)
  {
    v14 = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return MultiSegmentContainer;
}

void sub_20DA64528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_20DA64570(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

JetPack::AppleDecompressionInterface *JetPack::AppleDecompressionInterface::AppleDecompressionInterface(JetPack::AppleDecompressionInterface *this)
{
  JetPack::CompressionUnableToInitException *exception;

  *(_QWORD *)this = &off_24C804560;
  *((_BYTE *)this + 48) = 0;
  if (compression_stream_init((compression_stream *)((char *)this + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_BROTLI))
  {
    exception = (JetPack::CompressionUnableToInitException *)__cxa_allocate_exception(0x20uLL);
    JetPack::CompressionUnableToInitException::CompressionUnableToInitException(exception);
  }
  return this;
}

{
  JetPack::CompressionUnableToInitException *exception;

  *(_QWORD *)this = &off_24C804560;
  *((_BYTE *)this + 48) = 0;
  if (compression_stream_init((compression_stream *)((char *)this + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_BROTLI))
  {
    exception = (JetPack::CompressionUnableToInitException *)__cxa_allocate_exception(0x20uLL);
    JetPack::CompressionUnableToInitException::CompressionUnableToInitException(exception);
  }
  return this;
}

void sub_20DA645F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::~BrotliDecoderStreamImpl(_QWORD *a1)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;

  *a1 = &unk_24C804478;
  v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = a1[1];
  a1[1] = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return a1;
}

void JetPack::AppleDecompressionInterface::~AppleDecompressionInterface(JetPack::AppleDecompressionInterface *this)
{
  JetPack::AppleDecompressionInterface::~AppleDecompressionInterface(this);
  JUMPOUT(0x212BAD578);
}

{
  unsigned __int8 v1;
  NSObject *v2;
  uint8_t v3[16];

  *(_QWORD *)this = &off_24C804560;
  if (compression_stream_destroy((compression_stream *)((char *)this + 8)))
  {
    {
      JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
    }
    v2 = qword_253DA4968;
    if (os_log_type_enabled((os_log_t)qword_253DA4968, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20DA5A000, v2, OS_LOG_TYPE_ERROR, "Unable to destroy compression stream", v3, 2u);
    }
  }
}

void sub_20DA64784(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t makePublicRef<JetPackReader,JetPack::ReaderConfig>()
{
  uint64_t v0;
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = operator new();
  *(_BYTE *)(v0 + 40) = 0;
  *(_QWORD *)v0 = 0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_BYTE *)(v0 + 16) = 0;
  _ZNSt3__115allocate_sharedB8ne180100IN7JetPack12ReaderConfigENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v2);
  *(_OWORD *)v0 = v2;
  return v0;
}

BOOL JetPackReaderSetProperty(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  if (!a1)
  {
    v4 = 0;
    v5 = 0;
    if (a2)
      goto LABEL_6;
LABEL_9:
    *v4 = a3;
    if (!v5)
      return a2 == 0;
    goto LABEL_10;
  }
  v4 = *(_QWORD **)a1;
  v5 = *(std::__shared_weak_count **)(a1 + 8);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  if (!a2)
    goto LABEL_9;
LABEL_6:
  if (!v5)
    return a2 == 0;
LABEL_10:
  v8 = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return a2 == 0;
}

void JetPackReaderSetKeyForIdentifierCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    v3 = (std::__shared_weak_count *)a1[1];
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  v6 = (_QWORD *)(v2 + 32);
  if (!*(_BYTE *)(v2 + 64))
  {
    *(_QWORD *)(v2 + 32) = &off_24C804C80;
    *(_QWORD *)(v2 + 40) = a2;
    *(_QWORD *)(v2 + 48) = a1;
    *(_QWORD *)(v2 + 56) = v6;
    *(_BYTE *)(v2 + 64) = 1;
    goto LABEL_12;
  }
  v11[0] = &off_24C804C80;
  v11[1] = a2;
  v11[2] = a1;
  v12 = v11;
  std::__function::__value_func<std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::swap[abi:ne180100](v11, v6);
  v7 = v12;
  if (v12 != v11)
  {
    if (v12)
    {
      v8 = 5;
      goto LABEL_15;
    }
LABEL_12:
    if (!v3)
      return;
    goto LABEL_16;
  }
  v8 = 4;
  v7 = v11;
LABEL_15:
  (*(void (**)(void))(*v7 + 8 * v8))();
  if (!v3)
    return;
LABEL_16:
  v9 = (unint64_t *)&v3->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void JetPackReaderSetFileEntryFoundCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    v3 = (std::__shared_weak_count *)a1[1];
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  v6 = (_QWORD *)(v2 + 152);
  if (!*(_BYTE *)(v2 + 184))
  {
    *(_QWORD *)(v2 + 152) = &off_24C804BD0;
    *(_QWORD *)(v2 + 160) = a2;
    *(_QWORD *)(v2 + 168) = a1;
    *(_QWORD *)(v2 + 176) = v6;
    *(_BYTE *)(v2 + 184) = 1;
    goto LABEL_12;
  }
  v11[0] = &off_24C804BD0;
  v11[1] = a2;
  v11[2] = a1;
  v12 = v11;
  std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::swap[abi:ne180100](v11, v6);
  v7 = v12;
  if (v12 != v11)
  {
    if (v12)
    {
      v8 = 5;
      goto LABEL_15;
    }
LABEL_12:
    if (!v3)
      return;
    goto LABEL_16;
  }
  v8 = 4;
  v7 = v11;
LABEL_15:
  (*(void (**)(void))(*v7 + 8 * v8))();
  if (!v3)
    return;
LABEL_16:
  v9 = (unint64_t *)&v3->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void JetPackReaderSetDataSegmentFoundCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    v3 = (std::__shared_weak_count *)a1[1];
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  v6 = (_QWORD *)(v2 + 112);
  if (!*(_BYTE *)(v2 + 144))
  {
    *(_QWORD *)(v2 + 112) = &off_24C804C28;
    *(_QWORD *)(v2 + 120) = a2;
    *(_QWORD *)(v2 + 128) = a1;
    *(_QWORD *)(v2 + 136) = v6;
    *(_BYTE *)(v2 + 144) = 1;
    goto LABEL_12;
  }
  v11[0] = &off_24C804C28;
  v11[1] = a2;
  v11[2] = a1;
  v12 = v11;
  std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](v11, v6);
  v7 = v12;
  if (v12 != v11)
  {
    if (v12)
    {
      v8 = 5;
      goto LABEL_15;
    }
LABEL_12:
    if (!v3)
      return;
    goto LABEL_16;
  }
  v8 = 4;
  v7 = v11;
LABEL_15:
  (*(void (**)(void))(*v7 + 8 * v8))();
  if (!v3)
    return;
LABEL_16:
  v9 = (unint64_t *)&v3->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t readStreamCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;

  objc_msgSend(a1, "readCallback");
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = v5[2](v5, a2, a3);

  return v6;
}

uint64_t std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804EC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804EC0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

double std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  JetPack::AppleDecompressionInterface *v8;
  char *v9;
  char *v10;
  double result;

  v5 = *a3;
  v4 = a3[1];
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (JetPack::AppleDecompressionInterface *)operator new();
  JetPack::AppleDecompressionInterface::AppleDecompressionInterface(v8);
  *(_QWORD *)a2 = &unk_24C804478;
  *(_QWORD *)(a2 + 8) = v8;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_DWORD *)(a2 + 48) = 2;
  *(_QWORD *)(a2 + 56) = v5;
  *(_QWORD *)(a2 + 64) = v4;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  v9 = (char *)operator new(0x20000uLL);
  *(_QWORD *)(a2 + 72) = v9;
  v10 = v9 + 0x20000;
  *(_QWORD *)(a2 + 88) = v9 + 0x20000;
  bzero(v9, 0x20000uLL);
  *(_QWORD *)(a2 + 80) = v10;
  *(_QWORD *)(a2 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  return result;
}

void sub_20DA6556C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v11 = v10;
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v11);
  v13 = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(v9 + 8) = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::~BrotliDecoderStreamImpl(_QWORD *a1)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;

  *a1 = &unk_24C804478;
  v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = a1[1];
  a1[1] = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  JUMPOUT(0x212BAD578);
}

uint64_t JetPack::BaseStream::seekToEnd(JetPack::BaseStream *this)
{
  uint64_t result;

  result = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 32))(this);
  if ((result & 1) == 0)
  {
    do
    {
      (*(void (**)(JetPack::BaseStream *, uint64_t))(*(_QWORD *)this + 48))(this, 1024);
      result = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)this + 32))(this);
    }
    while (!(_DWORD)result);
  }
  return result;
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C803390, MEMORY[0x24BEDAAF0]);
}

void sub_20DA65700(_Unwind_Exception *a1)
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

void JetPack::NotEnoughDataException::~NotEnoughDataException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

JetPack::BrotliStreamNotFinishedAfterDecodingException *JetPack::BrotliStreamNotFinishedAfterDecodingException::BrotliStreamNotFinishedAfterDecodingException(JetPack::BrotliStreamNotFinishedAfterDecodingException *this)
{
  char *v2;

  v2 = (char *)operator new(0x28uLL);
  strcpy(v2, "BrotliStreamNotFinishedAfterDecoding");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x24uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C8049C8;
  return this;
}

void sub_20DA65804(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::BrotliAvailableInNotEmptyOnFillException *JetPack::BrotliAvailableInNotEmptyOnFillException::BrotliAvailableInNotEmptyOnFillException(JetPack::BrotliAvailableInNotEmptyOnFillException *this)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "BrotliAvailableInNotEmptyOnFill");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x1FuLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C804950;
  return this;
}

void sub_20DA658AC(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void JetPack::BrotliAvailableInNotEmptyOnFillException::~BrotliAvailableInNotEmptyOnFillException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x212BAD578);
}

uint64_t JetPack::Exception::what(JetPack::Exception *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
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

JetPack::BrotliUnknownDecoderResultException *JetPack::BrotliUnknownDecoderResultException::BrotliUnknownDecoderResultException(JetPack::BrotliUnknownDecoderResultException *this, int a2)
{
  std::string *v4;
  std::string *p_p;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  std::string __p;
  std::string v12;
  std::string v13;

  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v12.__r_.__value_.__r.__words[1] = xmmword_20DA6E000;
  strcpy(v12.__r_.__value_.__l.__data_, "BrotliUnknownDecoderResult");
  v4 = std::string::append(&v12, " result=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  }
  *(_QWORD *)this = &unk_24C8049F0;
  v9 = (std::string *)((char *)this + 8);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 3) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_12;
LABEL_16:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
  std::string::__init_copy_ctor_external(v9, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
LABEL_12:
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
LABEL_13:
    operator delete(v12.__r_.__value_.__l.__data_);
LABEL_17:
  *(_QWORD *)this = &unk_24C804888;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_20DA65B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::exception *v26;

  std::exception::~exception(v26);
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0)
LABEL_6:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

void JetPack::BrotliUnknownDecoderResultException::~BrotliUnknownDecoderResultException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x212BAD578);
}

_QWORD *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &unk_24C804A70;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6E291
    || ((v3 & 0x800000020DA6E291 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6E291)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6E291 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

JetPack::InputStreamRequiredException *JetPack::InputStreamRequiredException::InputStreamRequiredException(JetPack::InputStreamRequiredException *this)
{
  char __p[20];
  char v4;

  v4 = 19;
  strcpy(__p, "InputStreamRequired");
  JetPack::ReaderException::ReaderException(this, (uint64_t)__p);
  if (v4 < 0)
    operator delete(*(void **)__p);
  *(_QWORD *)this = &unk_24C8045E0;
  return this;
}

void sub_20DA65D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *JetPack::ReaderException::ReaderException(_QWORD *a1, uint64_t a2)
{
  std::string *v3;
  std::string __p;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  *a1 = &unk_24C8049F0;
  v3 = (std::string *)(a1 + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v3, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    a1[3] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  *a1 = &unk_24C8042B0;
  return a1;
}

void sub_20DA65E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::exception *v14;

  std::exception::~exception(v14);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

JetPack::InvalidSegmentTagException *JetPack::InvalidSegmentTagException::InvalidSegmentTagException(JetPack::InvalidSegmentTagException *this, int a2)
{
  std::string *v4;
  std::string *v5;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string v10;
  std::string v11;
  std::string v12;

  *((_BYTE *)&v11.__r_.__value_.__s + 23) = 17;
  strcpy((char *)&v11, "InvalidSegmentTag");
  v4 = std::string::append(&v11, " tag=");
  std::to_string(&v10, a2);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v10;
  else
    v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  else
    size = v10.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_12;
LABEL_15:
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_13;
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_15;
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_16;
LABEL_13:
  *(_QWORD *)this = &unk_24C804538;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_20DA65F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a15 < 0)
    {
LABEL_5:
      operator delete(a10);
      if ((a21 & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  else if (a15 < 0)
  {
    goto LABEL_5;
  }
  if ((a21 & 0x80000000) == 0)
LABEL_6:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a16);
  _Unwind_Resume(a1);
}

_QWORD *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &unk_24C804A18;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &unk_24C804A18;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6E486
    || ((v3 & 0x800000020DA6E486 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6E486)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6E486 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

_QWORD *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_20DA66204(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseRootSegmentException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseRootSegmentException &,JetPack::UnableToParseRootSegmentException,true>::__do_throw[abi:ne180100](a1);
}

JetPack::UnsupportedJetPackVersionException *JetPack::UnsupportedJetPackVersionException::UnsupportedJetPackVersionException(JetPack::UnsupportedJetPackVersionException *this)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "UnsupportedJetPackVersion");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x19uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C804860;
  return this;
}

void sub_20DA662A4(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::SignatureVerifierRequiredException *JetPack::SignatureVerifierRequiredException::SignatureVerifierRequiredException(JetPack::SignatureVerifierRequiredException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x20uLL);
  v4 = xmmword_20DA6E540;
  strcpy((char *)__p, "SignatureVerifierRequired");
  JetPack::ReaderException::ReaderException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C804810;
  return this;
}

void sub_20DA66348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x212BAD578);
}

void std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::allocator<JetPack::SignedStreamDecoder>::construct[abi:ne180100]<JetPack::SignedStreamDecoder,std::shared_ptr<JetPack::BaseStream> &,std::shared_ptr<JetPack::SignatureVerifier> &>(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;

  v4 = *a3;
  v5 = (std::__shared_weak_count *)a3[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = *a4;
  v9 = (std::__shared_weak_count *)a4[1];
  if (v9)
  {
    v10 = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_QWORD *)a2 = &off_24C8043B0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = v4;
  *(_QWORD *)(a2 + 72) = v5;
  if (v5)
  {
    v12 = (unint64_t *)&v5->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *(_QWORD *)(a2 + 80) = v8;
  *(_QWORD *)(a2 + 88) = v9;
  if (!v9)
  {
    *(_BYTE *)(a2 + 96) = 0;
    *(_BYTE *)(a2 + 120) = 0;
    *(_BYTE *)(a2 + 128) = 0;
    if (!v5)
      return;
    goto LABEL_20;
  }
  v14 = (unint64_t *)&v9->__shared_owners_;
  do
    v15 = __ldxr(v14);
  while (__stxr(v15 + 1, v14));
  *(_BYTE *)(a2 + 96) = 0;
  *(_BYTE *)(a2 + 120) = 0;
  *(_BYTE *)(a2 + 128) = 0;
  do
    v16 = __ldaxr(v14);
  while (__stlxr(v16 - 1, v14));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v5)
  {
LABEL_20:
    v17 = (unint64_t *)&v5->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void std::__throw_with_nested<JetPack::UnableToParseRootSegmentException &,JetPack::UnableToParseRootSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  std::nested_exception *exception;

  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseRootSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_20DA665AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseRootSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  std::string *p_ptr;
  __int128 v4;

  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049F0;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8047C0;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8051B8;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_24C8051E0;
  return a1;
}

void sub_20DA6664C(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::__nested<JetPack::UnableToParseRootSegmentException>::~__nested(uint64_t a1)
{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 32));
  *(_QWORD *)a1 = &unk_24C8049F0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  std::exception::~exception((std::exception *)a1);
}

{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 32));
  *(_QWORD *)a1 = &unk_24C8049F0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  std::exception::~exception((std::exception *)a1);
  JUMPOUT(0x212BAD578);
}

void `non-virtual thunk to'std::__nested<JetPack::UnableToParseRootSegmentException>::~__nested(std::nested_exception *a1)
{
  uint64_t v1;
  std::exception *v2;

  std::nested_exception::~nested_exception(a1);
  *(_QWORD *)(v1 - 32) = &unk_24C8049F0;
  v2 = (std::exception *)(v1 - 32);
  if (*(char *)(v1 - 1) < 0)
    operator delete(*(void **)(v1 - 24));
  std::exception::~exception(v2);
}

{
  uint64_t v1;
  std::exception *v2;

  std::nested_exception::~nested_exception(a1);
  *(_QWORD *)(v1 - 32) = &unk_24C8049F0;
  v2 = (std::exception *)(v1 - 32);
  if (*(char *)(v1 - 1) < 0)
    operator delete(*(void **)(v1 - 24));
  std::exception::~exception(v2);
  JUMPOUT(0x212BAD578);
}

_QWORD *std::__shared_ptr_emplace<JetPack::PartialStream>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<JetPack::BaseStream> &,unsigned int &,std::allocator<JetPack::PartialStream>,0>(_QWORD *a1, uint64_t *a2, unsigned int *a3)
{
  _QWORD *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;

  a1[2] = 0;
  *a1 = &unk_24C804DE0;
  a1[1] = 0;
  v4 = a1 + 3;
  v6 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  JetPack::UnownedPartialStream::UnownedPartialStream(v4, v6, *a3);
  a1[3] = &unk_24C8041A0;
  a1[7] = v6;
  a1[8] = v5;
  if (v5)
  {
    v9 = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    do
      v11 = __ldaxr(v9);
    while (__stlxr(v11 - 1, v9));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return a1;
}

void sub_20DA6685C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  std::__shared_weak_count *v2;

  if (v2)
    std::__shared_ptr_emplace<JetPack::PartialStream>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<JetPack::BaseStream> &,unsigned int &,std::allocator<JetPack::PartialStream>,0>(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<JetPack::PartialStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804DE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::PartialStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804DE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseDataSegmentException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseDataSegmentException &,JetPack::UnableToParseDataSegmentException,true>::__do_throw[abi:ne180100](a1);
}

void std::__throw_with_nested<JetPack::UnableToParseDataSegmentException &,JetPack::UnableToParseDataSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  std::nested_exception *exception;

  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseDataSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_20DA66984(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseDataSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  std::string *p_ptr;
  __int128 v4;

  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049F0;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C804798;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C805170;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_24C805198;
  return a1;
}

void sub_20DA66A24(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseSerializationSegmentException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseSerializationSegmentException &,JetPack::UnableToParseSerializationSegmentException,true>::__do_throw[abi:ne180100](a1);
}

_QWORD *JetPack::LibArchiveException::LibArchiveException(_QWORD *a1, uint64_t a2)
{
  std::string *v4;
  int v5;
  const std::string::value_type *v6;
  std::string::size_type v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::string __p;
  std::string v13;

  *((_BYTE *)&__p.__r_.__value_.__s + 23) = 19;
  strcpy((char *)&__p, "LibArchiveException");
  v4 = std::string::append(&__p, " message=");
  v5 = *(char *)(a2 + 23);
  if (v5 >= 0)
    v6 = (const std::string::value_type *)a2;
  else
    v6 = *(const std::string::value_type **)a2;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a2 + 23);
  else
    v7 = *(_QWORD *)(a2 + 8);
  v8 = std::string::append(v4, v6, v7);
  if (SHIBYTE(v8->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v8->__r_.__value_.__l.__data_, v8->__r_.__value_.__l.__size_);
  }
  else
  {
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v9;
  }
  *a1 = &unk_24C8049F0;
  v10 = (std::string *)(a1 + 1);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v10, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v13.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_15:
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    a1[3] = *((_QWORD *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_15;
  }
LABEL_16:
  *a1 = &unk_24C804388;
  return a1;
}

void sub_20DA66B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::exception *v21;

  std::exception::~exception(v21);
  if (a21 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<JetPack::ArchiveStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804DA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::ArchiveStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804DA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::__throw_with_nested<JetPack::UnableToParseSerializationSegmentException &,JetPack::UnableToParseSerializationSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  std::nested_exception *exception;

  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseSerializationSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_20DA66C40(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseSerializationSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  std::string *p_ptr;
  __int128 v4;

  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049F0;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049A0;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C805290;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_24C8052B8;
  return a1;
}

void sub_20DA66CE0(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

JetPack::InvalidEncryptionTagLengthException *JetPack::InvalidEncryptionTagLengthException::InvalidEncryptionTagLengthException(JetPack::InvalidEncryptionTagLengthException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x20uLL);
  v4 = xmmword_20DA6E000;
  strcpy((char *)__p, "InvalidEncryptionTagLength");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C8048B0;
  return this;
}

void sub_20DA66D7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

JetPack::CommonCryptoInvalidStatusException *JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(JetPack::CommonCryptoInvalidStatusException *this, int a2)
{
  std::string *v4;
  std::string *p_p;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  std::string __p;
  std::string v12;
  std::string v13;

  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v12.__r_.__value_.__r.__words[1] = xmmword_20DA6E540;
  strcpy(v12.__r_.__value_.__l.__data_, "CommonCryptoInvalidStatus");
  v4 = std::string::append(&v12, " statusCode=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  }
  *(_QWORD *)this = &unk_24C8049F0;
  v9 = (std::string *)((char *)this + 8);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 3) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_12;
LABEL_16:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
  std::string::__init_copy_ctor_external(v9, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
LABEL_12:
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
LABEL_13:
    operator delete(v12.__r_.__value_.__l.__data_);
LABEL_17:
  *(_QWORD *)this = &unk_24C8047E8;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_20DA66FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::exception *v26;

  std::exception::~exception(v26);
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0)
LABEL_6:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

uint64_t std::deque<unsigned char>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  *(_QWORD *)(a1 + 40) = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 2048;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = 4096;
LABEL_7:
    *(_QWORD *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v8 != v9)
      *(_QWORD *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,0>@<X0>(const void **a1@<X1>, char *a2@<X2>, const void **a3@<X3>, char *a4@<X4>, const void **a5@<X5>, char *a6@<X6>, const void ***a7@<X8>)
{
  const void **v8;
  _BYTE *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  size_t v18;
  void *result;
  uint64_t v20;
  char *v21;
  const void **v22;
  char *v23;
  _BYTE *v24;
  char *v25;
  char *v26;
  size_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  size_t v38;
  uint64_t v39;
  char *v40;

  v8 = a5;
  if (a1 == a3)
  {
    if (a2 == a4)
      goto LABEL_46;
    v35 = (uint64_t)*a5;
    v36 = a4;
    while (1)
    {
      v37 = &a6[-v35];
      if (v36 - a2 >= (uint64_t)v37)
        v38 = (size_t)v37;
      else
        v38 = v36 - a2;
      v36 -= v38;
      a6 -= v38;
      if (v38)
        result = memmove(a6, v36, v38);
      if (v36 == a2)
        break;
      v39 = (uint64_t)*--v8;
      v35 = v39;
      a6 = (char *)(v39 + 4096);
    }
    goto LABEL_44;
  }
  v14 = *a3;
  if (*a3 != a4)
  {
    v15 = (uint64_t)*a5;
    v16 = a4;
    while (1)
    {
      v17 = &a6[-v15];
      if (v16 - v14 >= (uint64_t)v17)
        v18 = (size_t)v17;
      else
        v18 = v16 - v14;
      v16 -= v18;
      a6 -= v18;
      if (v18)
        result = memmove(a6, v16, v18);
      if (v16 == v14)
        break;
      v20 = (uint64_t)*--v8;
      v15 = v20;
      a6 = (char *)(v20 + 4096);
    }
    if ((char *)*v8 + 4096 == a6)
    {
      v21 = (char *)v8[1];
      ++v8;
      a6 = v21;
    }
  }
  v22 = a3 - 1;
  if (a3 - 1 != a1)
  {
    v23 = (char *)*v8;
    do
    {
      v24 = *v22;
      v25 = (char *)*v22 + 4096;
      while (1)
      {
        v26 = (char *)(a6 - v23);
        if (v25 - v24 >= (uint64_t)v26)
          v27 = (size_t)v26;
        else
          v27 = v25 - v24;
        v25 -= v27;
        a6 -= v27;
        if (v27)
          result = memmove(a6, v25, v27);
        if (v25 == v24)
          break;
        v28 = (char *)*--v8;
        v23 = v28;
        a6 = v28 + 4096;
      }
      v23 = (char *)*v8;
      if ((char *)*v8 + 4096 == a6)
      {
        v29 = (char *)v8[1];
        ++v8;
        v23 = v29;
        a6 = v29;
      }
      --v22;
    }
    while (v22 != a1);
  }
  v30 = (char *)*a1 + 4096;
  if (v30 != a2)
  {
    v31 = (uint64_t)*v8;
    while (1)
    {
      v32 = &a6[-v31];
      if (v30 - a2 >= (uint64_t)v32)
        v33 = (size_t)v32;
      else
        v33 = v30 - a2;
      v30 -= v33;
      a6 -= v33;
      if (v33)
        result = memmove(a6, v30, v33);
      if (v30 == a2)
        break;
      v34 = (uint64_t)*--v8;
      v31 = v34;
      a6 = (char *)(v34 + 4096);
    }
LABEL_44:
    if ((char *)*v8 + 4096 == a6)
    {
      v40 = (char *)v8[1];
      ++v8;
      a6 = v40;
    }
  }
LABEL_46:
  *a7 = a3;
  a7[1] = (const void **)a4;
  a7[2] = v8;
  a7[3] = (const void **)a6;
  return result;
}

const void **std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(const void **result, _BYTE *__src, const void **a3, _BYTE *a4, uint64_t a5)
{
  _BYTE *v7;
  char *v8;
  void **v9;
  const void **v11;
  _BYTE *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  const void **i;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  size_t v29;
  char *v30;
  _BYTE *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  size_t v35;
  char *v36;

  v7 = __src;
  v9 = *(void ***)a5;
  v8 = *(char **)(a5 + 8);
  if (result == a3)
  {
    if (__src == a4)
      goto LABEL_51;
    v19 = (char *)*v9++;
    v18 = v19;
    while (1)
    {
      v20 = v18 - v8 + 4096;
      if (a4 - v7 >= v20)
        v21 = v20;
      else
        v21 = a4 - v7;
      if (v21)
        result = (const void **)memmove(v8, v7, v21);
      v7 += v21;
      if (v7 == a4)
        break;
      v22 = (char *)*v9++;
      v18 = v22;
      v8 = v22;
    }
    v8 += v21;
    goto LABEL_48;
  }
  v11 = result;
  v12 = (char *)*result + 4096;
  if (v12 != __src)
  {
    v14 = (char *)*v9++;
    v13 = v14;
    while (1)
    {
      v15 = v13 - v8 + 4096;
      if (v12 - v7 >= v15)
        v16 = v15;
      else
        v16 = v12 - v7;
      if (v16)
        result = (const void **)memmove(v8, v7, v16);
      v7 += v16;
      if (v7 == v12)
        break;
      v17 = (char *)*v9++;
      v13 = v17;
      v8 = v17;
    }
    v8 += v16;
    if ((char *)*(v9 - 1) + 4096 == v8)
      v8 = (char *)*v9;
    else
      --v9;
  }
  *(_QWORD *)a5 = v9;
  *(_QWORD *)(a5 + 8) = v8;
  for (i = v11 + 1; i != a3; ++i)
  {
    v24 = 0;
    v25 = (char *)*i;
    v27 = (char *)*v9++;
    v26 = v27;
    while (1)
    {
      v28 = v26 - v8 + 4096;
      if (4096 - v24 >= v28)
        v29 = v28;
      else
        v29 = 4096 - v24;
      if (v29)
        result = (const void **)memmove(v8, &v25[v24], v29);
      v24 += v29;
      if (v24 == 4096)
        break;
      v30 = (char *)*v9++;
      v26 = v30;
      v8 = v30;
    }
    v8 += v29;
    if ((char *)*(v9 - 1) + 4096 == v8)
      v8 = (char *)*v9;
    else
      --v9;
    *(_QWORD *)a5 = v9;
    *(_QWORD *)(a5 + 8) = v8;
  }
  v31 = *a3;
  if (v31 != a4)
  {
    v33 = (char *)*v9++;
    v32 = v33;
    while (1)
    {
      v34 = v32 - v8 + 4096;
      v35 = a4 - v31 >= v34 ? v34 : a4 - v31;
      if (v35)
        result = (const void **)memmove(v8, v31, v35);
      v31 += v35;
      if (v31 == a4)
        break;
      v36 = (char *)*v9++;
      v32 = v36;
      v8 = v36;
    }
    v8 += v35;
LABEL_48:
    if ((char *)*(v9 - 1) + 4096 == v8)
      v8 = (char *)*v9;
    else
      --v9;
  }
LABEL_51:
  *(_QWORD *)a5 = v9;
  *(_QWORD *)(a5 + 8) = v8;
  return result;
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseEncryptedSegmentException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseEncryptedSegmentException &,JetPack::UnableToParseEncryptedSegmentException,true>::__do_throw[abi:ne180100](a1);
}

JetPack::KeyProviderNotSpecifiedException *JetPack::KeyProviderNotSpecifiedException::KeyProviderNotSpecifiedException(JetPack::KeyProviderNotSpecifiedException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x19uLL);
  v4 = xmmword_20DA6E950;
  strcpy((char *)__p, "KeyProviderNotSpecified");
  JetPack::ReaderException::ReaderException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C804720;
  return this;
}

void sub_20DA675E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

JetPack::BlockExceedsMaximumSizeException *JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(JetPack::BlockExceedsMaximumSizeException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x19uLL);
  v4 = xmmword_20DA6E950;
  strcpy((char *)__p, "BlockExceedsMaximumSize");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C8046A8;
  return this;
}

void sub_20DA6768C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

JetPack::MissingEncryptionKeyException *JetPack::MissingEncryptionKeyException::MissingEncryptionKeyException(JetPack::MissingEncryptionKeyException *this, int a2)
{
  std::string *v4;
  std::string *v5;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string v10;
  std::string v11;
  std::string v12;

  *((_BYTE *)&v11.__r_.__value_.__s + 23) = 20;
  strcpy((char *)&v11, "MissingEncryptionKey");
  v4 = std::string::append(&v11, " identifier=");
  std::to_string(&v10, a2);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v10;
  else
    v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  else
    size = v10.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_12;
LABEL_15:
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_13;
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_15;
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_16;
LABEL_13:
  *(_QWORD *)this = &unk_24C804658;
  *((_WORD *)this + 16) = a2;
  return this;
}

void sub_20DA677D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a15 < 0)
    {
LABEL_5:
      operator delete(a10);
      if ((a21 & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  else if (a15 < 0)
  {
    goto LABEL_5;
  }
  if ((a21 & 0x80000000) == 0)
LABEL_6:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a16);
  _Unwind_Resume(a1);
}

void JetPack::MissingEncryptionKeyException::~MissingEncryptionKeyException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x212BAD578);
}

void std::__shared_ptr_emplace<JetPack::AESDecoderStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::AESDecoderStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E50;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unsigned int *a5)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  v6 = (std::__shared_weak_count *)a3[1];
  v18 = *a3;
  v19 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *a4;
  v10 = a4[1];
  v11 = *a5;
  v12 = (_QWORD *)operator new();
  *v12 = &unk_24C804320;
  v17 = v12;
  JetPack::AESDecoderStream::AESDecoderStream(a2, &v18, v9, v10, v11, (uint64_t *)&v17);
  v13 = (uint64_t)v17;
  v17 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v14 = v19;
  if (v19)
  {
    v15 = (unint64_t *)&v19->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void sub_20DA679D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (a3)
    (*(void (**)(uint64_t))(*(_QWORD *)a3 + 8))(a3);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_with_nested<JetPack::UnableToParseEncryptedSegmentException &,JetPack::UnableToParseEncryptedSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  std::nested_exception *exception;

  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseEncryptedSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_20DA67A58(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseEncryptedSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  std::string *p_ptr;
  __int128 v4;

  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049F0;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C804928;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C805248;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_24C805270;
  return a1;
}

void sub_20DA67AF8(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t JetPack::readMultiSegmentContainer(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>,std::function<BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>)::$_0::~$_0(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
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
  v5 = *(_QWORD **)(a1 + 32);
  if (v5 == (_QWORD *)(a1 + 8))
  {
    v6 = 4;
    v5 = (_QWORD *)(a1 + 8);
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return a1;
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseMultiSegmentException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseMultiSegmentException &,JetPack::UnableToParseMultiSegmentException,true>::__do_throw[abi:ne180100](a1);
}

void std::__throw_with_nested<JetPack::UnableToParseMultiSegmentException &,JetPack::UnableToParseMultiSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  void *exception;

  exception = __cxa_allocate_exception(0x38uLL);
  std::__nested<JetPack::UnableToParseMultiSegmentException>::__nested[abi:ne180100]((uint64_t)exception, a1);
}

void sub_20DA67BDC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__nested<JetPack::UnableToParseMultiSegmentException>::__nested[abi:ne180100](uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;

  *(_QWORD *)a1 = &unk_24C8049F0;
  v4 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 8);
    v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  *(_QWORD *)a1 = &unk_24C804838;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::nested_exception::nested_exception((std::nested_exception *)(a1 + 40));
  *(_QWORD *)a1 = &unk_24C805200;
  *(_QWORD *)(a1 + 40) = &unk_24C805228;
  return a1;
}

void sub_20DA67C84(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::__nested<JetPack::UnableToParseMultiSegmentException>::~__nested(uint64_t a1)
{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 40));
  *(_QWORD *)a1 = &unk_24C8049F0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  std::exception::~exception((std::exception *)a1);
}

{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 40));
  *(_QWORD *)a1 = &unk_24C8049F0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  std::exception::~exception((std::exception *)a1);
  JUMPOUT(0x212BAD578);
}

void `non-virtual thunk to'std::__nested<JetPack::UnableToParseMultiSegmentException>::~__nested(std::nested_exception *a1)
{
  uint64_t v1;
  std::exception *v2;

  std::nested_exception::~nested_exception(a1);
  *(_QWORD *)(v1 - 40) = &unk_24C8049F0;
  v2 = (std::exception *)(v1 - 40);
  if (*(char *)(v1 - 9) < 0)
    operator delete(*(void **)(v1 - 32));
  std::exception::~exception(v2);
}

{
  uint64_t v1;
  std::exception *v2;

  std::nested_exception::~nested_exception(a1);
  *(_QWORD *)(v1 - 40) = &unk_24C8049F0;
  v2 = (std::exception *)(v1 - 40);
  if (*(char *)(v1 - 9) < 0)
    operator delete(*(void **)(v1 - 32));
  std::exception::~exception(v2);
  JUMPOUT(0x212BAD578);
}

JetPack::MissingTerminationBlockException *JetPack::MissingTerminationBlockException::MissingTerminationBlockException(JetPack::MissingTerminationBlockException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x19uLL);
  v4 = xmmword_20DA6E950;
  strcpy((char *)__p, "MissingTerminationBlock");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C804748;
  return this;
}

void sub_20DA67E60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

JetPack::InvalidSignatureException *JetPack::InvalidSignatureException::InvalidSignatureException(JetPack::InvalidSignatureException *this)
{
  char __p[17];
  char v4;

  v4 = 16;
  strcpy(__p, "InvalidSignature");
  JetPack::ReaderException::ReaderException(this, (uint64_t)__p);
  if (v4 < 0)
    operator delete(*(void **)__p);
  *(_QWORD *)this = &unk_24C8044C0;
  return this;
}

void sub_20DA67EE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void readToEndVector(JetPack::BaseStream *a1@<X0>, void **a2@<X8>)
{
  unint64_t i;
  char v5;
  char *v6;
  char *v7;
  char *v8;
  size_t v9;
  unint64_t v10;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<unsigned char>::__append(a2, 0x20000uLL);
  for (i = 0;
        ;
        i += (*(uint64_t (**)(JetPack::BaseStream *, char *, int64_t))(*(_QWORD *)a1 + 16))(a1, &v6[i], v8 - v7))
  {
    v5 = (*(uint64_t (**)(JetPack::BaseStream *))(*(_QWORD *)a1 + 32))(a1);
    v6 = (char *)*a2;
    if ((v5 & 1) != 0)
      break;
    v7 = &v6[i];
    v8 = (char *)a2[1];
    if ((unint64_t)((_BYTE *)a2[2] - &v6[i]) >> 10 <= 4)
    {
      v9 = v8 - v6;
      if (v8 - v6 < 1)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          v8 = &v6[2 * v9];
          a2[1] = v8;
        }
      }
      else
      {
        std::vector<unsigned char>::__append(a2, v9);
        v6 = (char *)*a2;
        v8 = (char *)a2[1];
        v7 = (char *)*a2 + i;
      }
    }
  }
  v10 = (_BYTE *)a2[1] - v6;
  if (i <= v10)
  {
    if (i < v10)
      a2[1] = &v6[i];
  }
  else
  {
    std::vector<unsigned char>::__append(a2, i - v10);
  }
}

void sub_20DA67FEC(_Unwind_Exception *exception_object)
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

JetPack::InvalidDataAfterTerminationBlockException *JetPack::InvalidDataAfterTerminationBlockException::InvalidDataAfterTerminationBlockException(JetPack::InvalidDataAfterTerminationBlockException *this)
{
  void *__p;
  __int128 v4;

  __p = operator new(0x28uLL);
  v4 = xmmword_20DA6EB20;
  strcpy((char *)__p, "InvalidDataAfterTerminationBlock");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0)
    operator delete(__p);
  *(_QWORD *)this = &unk_24C804978;
  return this;
}

void sub_20DA68094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::optional<std::vector<unsigned char>>::operator=[abi:ne180100]<std::vector<unsigned char>&,void>(uint64_t a1, char **a2)
{
  char *v3;
  char *v4;
  size_t v5;
  char *v6;
  char *v7;

  if (*(_BYTE *)(a1 + 24))
  {
    if ((char **)a1 != a2)
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)a1, *a2, a2[1], a2[1] - *a2);
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    v4 = *a2;
    v3 = a2[1];
    v5 = v3 - *a2;
    if (v3 != *a2)
    {
      if ((v5 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v6 = (char *)operator new(v3 - *a2);
      *(_QWORD *)a1 = v6;
      *(_QWORD *)(a1 + 8) = v6;
      v7 = &v6[v5];
      *(_QWORD *)(a1 + 16) = &v6[v5];
      memcpy(v6, v4, v5);
      *(_QWORD *)(a1 + 8) = v7;
    }
    *(_BYTE *)(a1 + 24) = 1;
  }
  return a1;
}

void sub_20DA68150(_Unwind_Exception *exception_object)
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

void std::vector<unsigned char>::__append(void **a1, size_t a2)
{
  _BYTE *v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;

  v5 = (char *)a1[1];
  v4 = a1[2];
  v6 = v5;
  if (v4 - v5 < a2)
  {
    v7 = (char *)*a1;
    v8 = v5 - (_BYTE *)*a1;
    v9 = v8 + a2;
    if ((uint64_t)(v8 + a2) < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v4 - v7;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v8];
    v14 = &v12[v11];
    v15 = &v12[v8 + a2];
    bzero(&v12[v8], a2);
    if (v5 == v7)
    {
      v12 += v8;
      goto LABEL_32;
    }
    if (v8 >= 8 && (unint64_t)(v7 - v12) >= 0x20)
    {
      if (v8 < 0x20)
      {
        v16 = 0;
        goto LABEL_24;
      }
      v16 = v8 & 0xFFFFFFFFFFFFFFE0;
      v17 = v5 - 16;
      v18 = &v12[v5 - 16 - v7];
      v19 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v20 = *(_OWORD *)v17;
        *((_OWORD *)v18 - 1) = *((_OWORD *)v17 - 1);
        *(_OWORD *)v18 = v20;
        v18 -= 32;
        v17 -= 32;
        v19 -= 32;
      }
      while (v19);
      if (v8 == v16)
        goto LABEL_31;
      if ((v8 & 0x18) != 0)
      {
LABEL_24:
        v6 = &v5[-(v8 & 0xFFFFFFFFFFFFFFF8)];
        v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
        v21 = &v5[-v16 - 8];
        v22 = &v12[v21 - v7];
        v23 = v16 - (v8 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v24 = *(_QWORD *)v21;
          v21 -= 8;
          *(_QWORD *)v22 = v24;
          v22 -= 8;
          v23 += 8;
        }
        while (v23);
        if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8))
          goto LABEL_31;
        goto LABEL_29;
      }
      v13 -= v16;
      v6 = &v5[-v16];
    }
LABEL_29:
    v25 = v13 - 1;
    do
    {
      v26 = *--v6;
      *v25-- = v26;
    }
    while (v6 != v7);
LABEL_31:
    v6 = (char *)*a1;
LABEL_32:
    *a1 = v12;
    a1[1] = v15;
    a1[2] = v14;
    if (v6)
      operator delete(v6);
    return;
  }
  if (a2)
  {
    bzero(v5, a2);
    v6 = &v5[a2];
  }
  a1[1] = v6;
}

uint64_t std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](uint64_t a1, char *a2)
{
  _QWORD *v4;
  unint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  _BYTE *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  __int128 *v18;
  _OWORD *v19;
  unint64_t v20;
  __int128 v21;
  char *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;

  v4 = *(_QWORD **)a1;
  v6 = *(char **)(*(_QWORD *)a1 + 8);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = v6;
  if ((unint64_t)v6 < v5)
  {
    *v6 = *a2;
    v8 = (uint64_t)(v6 + 1);
    goto LABEL_32;
  }
  v9 = (char *)*v4;
  v10 = (unint64_t)&v6[-*v4];
  v11 = v10 + 1;
  if ((uint64_t)(v10 + 1) < 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v12 = v5 - (_QWORD)v9;
  if (2 * v12 > v11)
    v11 = 2 * v12;
  if (v12 >= 0x3FFFFFFFFFFFFFFFLL)
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v13 = v11;
  if (v13)
    v14 = operator new(v13);
  else
    v14 = 0;
  v15 = &v14[v10];
  v16 = &v14[v13];
  v14[v10] = *a2;
  v8 = (uint64_t)&v14[v10 + 1];
  if (v6 == v9)
  {
    v14 += v10;
    goto LABEL_30;
  }
  if (v10 >= 8 && (unint64_t)(v9 - v14) >= 0x20)
  {
    if (v10 < 0x20)
    {
      v17 = 0;
      goto LABEL_22;
    }
    v17 = v10 & 0xFFFFFFFFFFFFFFE0;
    v18 = (__int128 *)(v6 - 16);
    v19 = &v14[v6 - 16 - v9];
    v20 = v10 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v21 = *v18;
      *(v19 - 1) = *(v18 - 1);
      *v19 = v21;
      v19 -= 2;
      v18 -= 2;
      v20 -= 32;
    }
    while (v20);
    if (v10 == v17)
      goto LABEL_29;
    if ((v10 & 0x18) != 0)
    {
LABEL_22:
      v7 = &v6[-(v10 & 0xFFFFFFFFFFFFFFF8)];
      v15 -= v10 & 0xFFFFFFFFFFFFFFF8;
      v22 = &v6[-v17 - 8];
      v23 = &v14[v22 - v9];
      v24 = v17 - (v10 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v25 = *(_QWORD *)v22;
        v22 -= 8;
        *v23-- = v25;
        v24 += 8;
      }
      while (v24);
      if (v10 == (v10 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_29;
      goto LABEL_27;
    }
    v15 -= v17;
    v7 = &v6[-v17];
  }
LABEL_27:
  v26 = v15 - 1;
  do
  {
    v27 = *--v7;
    *v26-- = v27;
  }
  while (v7 != v9);
LABEL_29:
  v7 = (char *)*v4;
LABEL_30:
  *v4 = v14;
  v4[1] = v8;
  v4[2] = v16;
  if (v7)
    operator delete(v7);
LABEL_32:
  v4[1] = v8;
  return a1;
}

_QWORD *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  size_t v12;
  _BYTE *v13;
  size_t v14;
  char *v15;
  char *v16;

  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      goto LABEL_23;
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    v11 = v8 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v10;
    if ((v11 & 0x8000000000000000) != 0)
LABEL_23:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    result = operator new(v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v11;
    v12 = a3 - __src;
    if (v12)
      result = memcpy(result, __src, v12);
LABEL_21:
    v16 = &v9[v12];
    goto LABEL_22;
  }
  v13 = (_BYTE *)result[1];
  v14 = v13 - v9;
  if (v13 - v9 >= a4)
  {
    v12 = a3 - __src;
    if (v12)
      result = memmove((void *)*result, __src, v12);
    goto LABEL_21;
  }
  v15 = &__src[v14];
  if (v13 != v9)
  {
    result = memmove((void *)*result, __src, v14);
    v9 = (char *)v7[1];
  }
  if (a3 != v15)
    result = memmove(v9, v15, a3 - v15);
  v16 = &v9[a3 - v15];
LABEL_22:
  v7[1] = v16;
  return result;
}

uint64_t JetPack::UnsafeIgnoreSignatureVerifier::signatureIsValid()
{
  return 1;
}

void JetPack::UnsafeIgnoreSignatureVerifier::~UnsafeIgnoreSignatureVerifier(JetPack::UnsafeIgnoreSignatureVerifier *this)
{
  JUMPOUT(0x212BAD578);
}

_QWORD *makePublicRef<JetPackSignatureVerifier,JetPack::UnsafeIgnoreSignatureVerifier>()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = (_QWORD *)operator new();
  *v0 = 0;
  v0[1] = 0;
  v1 = operator new(0x20uLL);
  v1[1] = 0;
  v1[2] = 0;
  *v1 = &unk_24C804F30;
  v1[3] = &unk_24C804680;
  *v0 = v1 + 3;
  v0[1] = v1;
  return v0;
}

uint64_t JetPackReaderGetErrorMessage(uint64_t a1)
{
  uint64_t result;

  result = a1 + 16;
  if (*(char *)(a1 + 39) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t getGlobalLog(void)
{
  unsigned __int8 v0;

  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_253DA4958;
}

{
  unsigned __int8 v0;

  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_253DA4988;
}

{
  unsigned __int8 v0;

  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_253DA4998;
}

void sub_20DA688F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void nestedExceptionString(const std::exception *a1@<X0>, std::string *a2@<X8>)
{
  const std::string::value_type *v4;
  const std::nested_exception *v5;
  std::string v6;

  memset(&v6, 0, sizeof(v6));
  v4 = (const std::string::value_type *)((uint64_t (*)(const std::exception *))a1->what)(a1);
  std::string::append(&v6, v4);
  v5 = (const std::nested_exception *)__dynamic_cast(a1, MEMORY[0x24BEDB760], (const struct __class_type_info *)off_24C803398, -2);
  if (v5)
  {
    std::nested_exception::rethrow_nested(v5);
    __break(1u);
  }
  else
  {
    *a2 = v6;
  }
}

void sub_20DA6899C(void *__p, int a2, int a3, __int16 a4, char a5, char a6, std::string *a7, uint64_t a8, std::string::value_type *__pa, std::string::size_type a10, int a11, __int16 a12, char a13, unsigned __int8 a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::string *v20;
  const std::exception *v22;
  const std::exception *v23;
  std::string *v24;
  const std::string::value_type *p_pa;
  std::string::size_type v26;
  std::string *v27;
  __int128 v28;

  v22 = (const std::exception *)__cxa_begin_catch(__p);
  if (a2 == 2)
  {
    v23 = v22;
    v24 = std::string::append((std::string *)&a15, " -> ");
    nestedExceptionString(v23, (std::string *)&__pa);
    if ((a14 & 0x80u) == 0)
      p_pa = (const std::string::value_type *)&__pa;
    else
      p_pa = __pa;
    if ((a14 & 0x80u) == 0)
      v26 = a14;
    else
      v26 = a10;
    v27 = std::string::append(v24, p_pa, v26);
    if (SHIBYTE(v27->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v20, v27->__r_.__value_.__l.__data_, v27->__r_.__value_.__l.__size_);
    }
    else
    {
      v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v20->__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v28;
    }
    if ((char)a14 < 0)
      operator delete(__pa);
    __cxa_end_catch();
    if (a20 < 0)
      operator delete(a15);
    JUMPOUT(0x20DA68980);
  }
  __cxa_end_catch();
  JUMPOUT(0x20DA68970);
}

void sub_20DA68A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::optional<std::string>::operator=[abi:ne180100]<std::string,void>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;

  if (*(_BYTE *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    v4 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v4;
    *((_BYTE *)a2 + 23) = 0;
    *(_BYTE *)a2 = 0;
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v5;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return a1;
}

char *_ZNSt3__115allocate_sharedB8ne180100IN7JetPack12ReaderConfigENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  char *result;
  char *v3;
  unint64_t v4;
  unsigned __int8 v5;
  int v6;
  int v7;
  char *v8;
  char *v9;

  result = (char *)operator new(0x100uLL);
  *((_QWORD *)result + 2) = 0;
  *(_QWORD *)result = &unk_24C804D70;
  *((_QWORD *)result + 1) = 0;
  *(_OWORD *)(result + 24) = 0u;
  v3 = result + 24;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(_OWORD *)(result + 136) = 0u;
  *(_OWORD *)(result + 152) = 0u;
  *(_OWORD *)(result + 168) = 0u;
  *(_OWORD *)(result + 184) = 0u;
  *(_OWORD *)(result + 200) = 0u;
  *(_OWORD *)(result + 216) = 0u;
  *(_OWORD *)(result + 232) = 0u;
  *((_QWORD *)result + 31) = 0;
  result[32] = 4;
  result[40] = 4;
  v4 = 0x253DA4000uLL;
  if ((v5 & 1) == 0)
  {
    v8 = result + 24;
    v9 = result;
    v4 = 0x253DA4000;
    v7 = v6;
    v3 = v8;
    result = v9;
    if (v7)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      v4 = 0x253DA4000;
      v3 = v8;
      result = v9;
    }
  }
  *((_QWORD *)result + 6) = *(_QWORD *)(v4 + 2504);
  result[56] = 0;
  result[88] = 0;
  result[96] = 0;
  result[128] = 0;
  result[136] = 0;
  result[168] = 0;
  result[176] = 0;
  result[208] = 0;
  result[216] = 0;
  result[248] = 0;
  *a1 = v3;
  a1[1] = result;
  return result;
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::allocator<JetPack::ReaderConfig>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  if (*(_BYTE *)(a2 + 224))
  {
    v3 = *(_QWORD **)(a2 + 216);
    if (v3 == (_QWORD *)(a2 + 192))
    {
      v4 = 4;
      v3 = (_QWORD *)(a2 + 192);
    }
    else
    {
      if (!v3)
        goto LABEL_7;
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
LABEL_7:
  if (!*(_BYTE *)(a2 + 184))
    goto LABEL_13;
  v5 = *(_QWORD **)(a2 + 176);
  if (v5 == (_QWORD *)(a2 + 152))
  {
    v6 = 4;
    v5 = (_QWORD *)(a2 + 152);
  }
  else
  {
    if (!v5)
      goto LABEL_13;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_13:
  if (!*(_BYTE *)(a2 + 144))
    goto LABEL_19;
  v7 = *(_QWORD **)(a2 + 136);
  if (v7 == (_QWORD *)(a2 + 112))
  {
    v8 = 4;
    v7 = (_QWORD *)(a2 + 112);
  }
  else
  {
    if (!v7)
      goto LABEL_19;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_19:
  if (!*(_BYTE *)(a2 + 104))
    goto LABEL_25;
  v9 = *(_QWORD **)(a2 + 96);
  if (v9 == (_QWORD *)(a2 + 72))
  {
    v10 = 4;
    v9 = (_QWORD *)(a2 + 72);
  }
  else
  {
    if (!v9)
      goto LABEL_25;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_25:
  if (*(_BYTE *)(a2 + 64))
  {
    v11 = *(_QWORD **)(a2 + 56);
    if (v11 == (_QWORD *)(a2 + 32))
    {
      v12 = 4;
      v11 = (_QWORD *)(a2 + 32);
      goto LABEL_31;
    }
    if (v11)
    {
      v12 = 5;
LABEL_31:
      (*(void (**)(void))(*v11 + 8 * v12))();
    }
  }
}

void std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804EF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804EF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

void std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  size_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  void *__p;
  void *v13;
  char *v14;

  __p = 0;
  v13 = 0;
  v14 = 0;
  v5 = *(const void **)a3;
  v4 = *(_QWORD *)(a3 + 8);
  v6 = v4 - *(_QWORD *)a3;
  if (v4 != *(_QWORD *)a3)
  {
    if ((v6 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v7 = (char *)operator new(v4 - *(_QWORD *)a3);
    v8 = &v7[v6];
    __p = v7;
    v14 = &v7[v6];
    memcpy(v7, v5, v6);
    v13 = v8;
  }
  v9 = (_QWORD *)operator new();
  *v9 = &unk_24C804320;
  v11 = v9;
  JetPack::CommonCryptoSignatureVerifier::CommonCryptoSignatureVerifier(a2, (uint64_t)&__p, (uint64_t *)&v11);
  v10 = (uint64_t)v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
}

void sub_20DA68EE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804F30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804F30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804C28;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804C28;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0"
    || ((v3 & (unint64_t)"Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

_QWORD *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_20DA691B4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804BD0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804BD0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::operator()(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v5 = *a3;
  v6 = *a4;
  v7 = (std::__shared_weak_count *)a4[1];
  *a4 = 0;
  a4[1] = 0;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v19 = v6;
    v20 = v7;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    v19 = v6;
    v20 = 0;
  }
  v12 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t *))(a1 + 8))(*(_QWORD *)(a1 + 16), v5, &v19);
  v13 = v20;
  if (v20)
  {
    v14 = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v7)
  {
    v16 = (unint64_t *)&v7->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v12;
}

void sub_20DA6934C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v13;

  if (a10)
    std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z38JetPackReaderSetFileEntryFoundCallbackE3$_0"
    || ((v3 & (unint64_t)"Z38JetPackReaderSetFileEntryFoundCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z38JetPackReaderSetFileEntryFoundCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z38JetPackReaderSetFileEntryFoundCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::target_type()
{
}

_QWORD *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_20DA69560(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804C80;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804C80;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::operator()@<X0>(uint64_t a1@<X0>, unsigned __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = (*(uint64_t (**)(_QWORD, _QWORD, __int128 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 16), *a2, &v6, 16);
  if ((result & 1) != 0)
  {
    *(_OWORD *)a3 = v6;
    v5 = 1;
  }
  else
  {
    v5 = 0;
    *(_BYTE *)a3 = 0;
  }
  *(_BYTE *)(a3 + 16) = v5;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0"
    || ((v3 & (unint64_t)"Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::target_type()
{
}

_QWORD *std::__function::__value_func<std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_20DA69828(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 16))(v0);
}

void std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void sub_20DA699C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

JetPack::CompressionUnableToInitException *JetPack::CompressionUnableToInitException::CompressionUnableToInitException(JetPack::CompressionUnableToInitException *this)
{
  char *v2;

  v2 = (char *)operator new(0x28uLL);
  strcpy(v2, "CompressionUnableToInitException");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x20uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C8046D0;
  return this;
}

void sub_20DA69A5C(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseHeaderException &>(uint64_t a1)
{
  std::__throw_with_nested<JetPack::UnableToParseHeaderException &,JetPack::UnableToParseHeaderException,true>::__do_throw[abi:ne180100](a1);
}

void std::__throw_with_nested<JetPack::UnableToParseHeaderException &,JetPack::UnableToParseHeaderException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  std::nested_exception *exception;

  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseHeaderException>::__nested[abi:ne180100](exception, a1);
}

void sub_20DA69AC4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseHeaderException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  std::string *p_ptr;
  __int128 v4;

  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C8049F0;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C804608;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_24C805128;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_24C805150;
  return a1;
}

void sub_20DA69B64(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void JetPack::UnownedPartialStream::~UnownedPartialStream(JetPack::UnownedPartialStream *this)
{
  JUMPOUT(0x212BAD578);
}

JetPack::UnableToOpenFileException *JetPack::UnableToOpenFileException::UnableToOpenFileException(JetPack::UnableToOpenFileException *this)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "UnableToOpenFileException");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x19uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C804510;
  return this;
}

void sub_20DA69C9C(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

std::string *std::__fs::filesystem::operator/[abi:ne180100]@<X0>(std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  int v6;
  std::__fs::filesystem::path *v7;
  std::string::size_type size;

  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&a3->__pn_, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  if (std::__fs::filesystem::path::__root_directory(this).__size_)
    return std::string::operator=(&a3->__pn_, &this->__pn_);
  if (std::__fs::filesystem::path::__filename(a3).__size_)
    std::string::push_back(&a3->__pn_, 47);
  v6 = SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
  if (v6 >= 0)
    v7 = this;
  else
    v7 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
  if (v6 >= 0)
    size = HIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
  else
    size = this->__pn_.__r_.__value_.__l.__size_;
  return std::string::append(&a3->__pn_, (const std::string::value_type *)v7, size);
}

void sub_20DA69D54(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  std::string __p;
  _OWORD v9[2];
  std::string v10;
  _OWORD v11[2];
  std::string v12;
  _OWORD v13[2];

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v12 = *(std::string *)a1;
  v13[0] = *(_OWORD *)(a1 + 24);
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)(a1 + 33);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v10 = *(std::string *)a2;
  v11[0] = *(_OWORD *)(a2 + 24);
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)(a2 + 33);
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v9[0] = *(_OWORD *)(a3 + 24);
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)(a3 + 33);
  std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator,std::__equal_to>((uint64_t)&v12, (uint64_t)&v10, (uint64_t)&__p, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_12:
      if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return;
LABEL_16:
      operator delete(v12.__r_.__value_.__l.__data_);
      return;
    }
  }
  else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(v10.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_16;
}

void sub_20DA69EB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v25 - 89) & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((*(char *)(v25 - 89) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(v25 - 112));
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0)
  {
    operator delete(*(void **)(a1 + 56));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
LABEL_5:
    operator delete(*(void **)a1);
    return a1;
  }
  if (*(char *)(a1 + 23) < 0)
    goto LABEL_5;
  return a1;
}

void sub_20DA69FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void JetPack::throwLibArchiveException(uint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  unsigned __int8 v4;
  NSObject *v5;
  std::string *v6;
  _QWORD *exception;
  std::string v8;
  std::string v9;
  uint8_t buf[4];
  uint64_t *v11;
  __int16 v12;
  std::string *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = archive_error_string();
  JetPack::archiveErrorToString(v3, &v9);
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  v5 = qword_253DA4988;
  if (os_log_type_enabled((os_log_t)qword_253DA4988, OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a2 + 23) < 0)
      a2 = (uint64_t *)*a2;
    v6 = &v9;
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v6 = (std::string *)v9.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136446466;
    v11 = a2;
    v12 = 2082;
    v13 = v6;
    _os_log_impl(&dword_20DA5A000, v5, OS_LOG_TYPE_ERROR, "Failed to %{public}s: %{public}s", buf, 0x16u);
  }
  exception = __cxa_allocate_exception(0x20uLL);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v8, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
  else
    v8 = v9;
  JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v8);
}

void sub_20DA6A134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void JetPack::PathOutsideOutputDestinationException::~PathOutsideOutputDestinationException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_24C8048D8;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_24C8048D8;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  this->__vftable = (std::exception_vtbl *)&unk_24C8049F0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x212BAD578);
}

JetPack::PathOutsideOutputDestinationException *JetPack::PathOutsideOutputDestinationException::PathOutsideOutputDestinationException(JetPack::PathOutsideOutputDestinationException *this, std::__fs::filesystem::path *a2)
{
  std::string *v4;
  std::string *p_p;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::string __p;
  std::string v13;
  std::string v14;

  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v13.__r_.__value_.__r.__words[1] = xmmword_20DA6F430;
  strcpy(v13.__r_.__value_.__l.__data_, "PathOutsideOutputDestination");
  v4 = std::string::append(&v13, " path=");
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  else
    __p = a2->__pn_;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v14, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v14);
  if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_15;
LABEL_19:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_20;
  }
  operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_19;
LABEL_15:
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_16;
LABEL_20:
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_16:
  *(_QWORD *)this = &unk_24C8048D8;
  v9 = (std::string *)((char *)this + 32);
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v9, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  }
  else
  {
    v10 = *(_OWORD *)&a2->__pn_.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 6) = *((_QWORD *)&a2->__pn_.__r_.__value_.__l + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  return this;
}

void sub_20DA6A374(_Unwind_Exception *a1)
{
  std::exception *v1;

  JetPack::NotEnoughDataException::~NotEnoughDataException(v1);
  _Unwind_Resume(a1);
}

void sub_20DA6A388(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if ((a20 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

__n128 std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator,std::__equal_to>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _OWORD *v7;
  std::__fs::filesystem::path::__string_view v10;
  int v11;
  std::string *v12;
  __n128 result;
  std::string __p;
  std::string v15;

  v7 = (_OWORD *)(a1 + 24);
  while (*(_QWORD *)(a1 + 24) != *(_QWORD *)(a2 + 24) || *(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32))
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
      if ((*(char *)(a3 + 23) & 0x80000000) == 0)
      {
LABEL_7:
        __p = *(std::string *)a3;
        goto LABEL_10;
      }
    }
    else
    {
      v15 = *(std::string *)a1;
      if ((*(char *)(a3 + 23) & 0x80000000) == 0)
        goto LABEL_7;
    }
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
LABEL_10:
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10.__data_ = (const std::string_view::value_type *)&__p;
    else
      v10.__data_ = (const std::string_view::value_type *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10.__size_ = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v10.__size_ = __p.__r_.__value_.__l.__size_;
    v11 = std::__fs::filesystem::path::__compare((const std::__fs::filesystem::path *)&v15, v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      {
LABEL_21:
        operator delete(v15.__r_.__value_.__l.__data_);
        if (v11)
          break;
        goto LABEL_22;
      }
    }
    else if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_21;
    }
    if (v11)
      break;
LABEL_22:
    std::__fs::filesystem::path::iterator::__increment((std::__fs::filesystem::path::iterator *)a1);
    std::__fs::filesystem::path::iterator::__increment((std::__fs::filesystem::path::iterator *)a3);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a4, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a4 = *(_OWORD *)a1;
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(a1 + 16);
  }
  *(_OWORD *)(a4 + 24) = *v7;
  *(_OWORD *)(a4 + 33) = *(_OWORD *)((char *)v7 + 9);
  v12 = (std::string *)(a4 + 56);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *(_QWORD *)(a4 + 72) = *(_QWORD *)(a3 + 16);
  }
  *(_OWORD *)(a4 + 80) = *(_OWORD *)(a3 + 24);
  result = *(__n128 *)(a3 + 33);
  *(__n128 *)(a4 + 89) = result;
  return result;
}

void sub_20DA6A624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  uint64_t v18;

  if (*(char *)(v18 + 23) < 0)
    operator delete(*(void **)v18);
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, std::string *__src, std::string *a3)
{
  unint64_t v6;
  size_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **p_dst;
  std::string *v13;
  std::string::value_type *v14;
  unint64_t v15;
  std::string *v16;
  uint64_t v17;
  uint64_t v18;
  const std::string::value_type *v19;
  std::string::size_type v20;
  char *v21;
  _OWORD *v22;
  std::string::size_type *v23;
  unint64_t v24;
  __int128 v25;
  std::string::value_type v26;
  std::string::size_type v27;
  void **__dst;
  size_t v30;
  int64_t v31;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = (char *)a3 - (char *)__src;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == __src)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src)
      goto LABEL_12;
  }
  else
  {
    if (a3 == __src)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
    if (this > __src)
    {
LABEL_12:
      if (v9 - size < v7)
      {
        std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
        this->__r_.__value_.__l.__size_ = size;
        LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
      }
      v13 = this;
      if ((v6 & 0x80) != 0)
        v13 = (std::string *)this->__r_.__value_.__r.__words[0];
      v14 = (char *)v13 + size;
      v15 = (char *)a3 - (char *)__src;
      if (a3 == __src)
        goto LABEL_37;
      if (v15 >= 0x20)
      {
        v21 = (char *)v13 + size;
        if ((unint64_t)((char *)v13 + size - (char *)__src) >= 0x20)
        {
          v16 = (std::string *)((char *)__src + (v15 & 0xFFFFFFFFFFFFFFE0));
          v14 += v15 & 0xFFFFFFFFFFFFFFE0;
          v22 = v21 + 16;
          v23 = &__src->__r_.__value_.__r.__words[2];
          v24 = v15 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v25 = *(_OWORD *)v23;
            *(v22 - 1) = *((_OWORD *)v23 - 1);
            *v22 = v25;
            v22 += 2;
            v23 += 4;
            v24 -= 32;
          }
          while (v24);
          if (v15 == (v15 & 0xFFFFFFFFFFFFFFE0))
            goto LABEL_37;
        }
        else
        {
          v16 = __src;
        }
      }
      else
      {
        v16 = __src;
      }
      do
      {
        v26 = v16->__r_.__value_.__s.__data_[0];
        v16 = (std::string *)((char *)v16 + 1);
        *v14++ = v26;
      }
      while (v16 != a3);
LABEL_37:
      *v14 = 0;
      v27 = v7 + size;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = v27;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = v27 & 0x7F;
      return this;
    }
  }
  if ((std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= __src)
    goto LABEL_12;
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v7 > 0x16)
  {
    v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v17 = v7 | 7;
    v18 = v17 + 1;
    p_dst = (void **)operator new(v17 + 1);
    v30 = v7;
    v31 = v18 | 0x8000000000000000;
    __dst = p_dst;
    if (a3 == __src)
      goto LABEL_23;
    goto LABEL_22;
  }
  HIBYTE(v31) = v7;
  p_dst = (void **)&__dst;
  if (a3 != __src)
  {
LABEL_22:
    memcpy(p_dst, __src, v7);
    p_dst = (void **)((char *)p_dst + v7);
  }
LABEL_23:
  *(_BYTE *)p_dst = 0;
  if (v31 >= 0)
    v19 = (const std::string::value_type *)&__dst;
  else
    v19 = (const std::string::value_type *)__dst;
  if (v31 >= 0)
    v20 = HIBYTE(v31);
  else
    v20 = v30;
  std::string::append(this, v19, v20);
  if (SHIBYTE(v31) < 0)
    operator delete(__dst);
  return this;
}

void sub_20DA6A884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::ArchiveStream::position(JetPack::ArchiveStream *this)
{
  return *((_QWORD *)this + 5);
}

void JetPack::ArchiveStream::~ArchiveStream(JetPack::ArchiveStream *this)
{
  JUMPOUT(0x212BAD578);
}

unint64_t JetPack::CallbackStream::read(JetPack::CallbackStream *this, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t result;
  unint64_t v7;
  unsigned __int8 *v8;

  v7 = a3;
  v8 = a2;
  v4 = *((_QWORD *)this + 4);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  result = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unint64_t *))(*(_QWORD *)v4 + 48))(v4, &v8, &v7);
  *((_QWORD *)this + 15) += result;
  if (result < a3)
    *((_BYTE *)this + 128) = 1;
  return result;
}

uint64_t JetPack::CallbackStream::position(JetPack::CallbackStream *this)
{
  return *((_QWORD *)this + 15);
}

uint64_t JetPack::CallbackStream::isFinished(JetPack::CallbackStream *this)
{
  return *((unsigned __int8 *)this + 128);
}

unint64_t JetPack::CallbackStream::seekForward(JetPack::CallbackStream *this, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[129];

  v12[128] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 72))
  {
    v4 = *((_QWORD *)this + 15);
    v12[0] = a2;
    v5 = *((_QWORD *)this + 8);
    if (!v5)
      std::__throw_bad_function_call[abi:ne180100]();
    v6 = v4 + a2;
    result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 48))(v5, v12);
    *((_QWORD *)this + 15) = v6;
  }
  else
  {
    v8 = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 24))(this);
    result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 32))(this);
    if ((result & 1) == 0)
    {
      v9 = v8 + a2;
      do
      {
        result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 24))(this);
        if (v9 <= result)
          break;
        v10 = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 24))(this);
        v11 = v9 - v10 >= 0x400 ? 1024 : v9 - v10;
        (*(void (**)(JetPack::CallbackStream *, _QWORD *, uint64_t))(*(_QWORD *)this + 16))(this, v12, v11);
        result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 32))(this);
      }
      while (!(_DWORD)result);
    }
  }
  return result;
}

uint64_t JetPack::CallbackStream::seekToEnd(JetPack::CallbackStream *this)
{
  uint64_t v2;
  uint64_t result;

  if (*((_BYTE *)this + 112))
  {
    v2 = *((_QWORD *)this + 13);
    if (!v2)
      std::__throw_bad_function_call[abi:ne180100]();
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
    *((_QWORD *)this + 15) = result;
    *((_BYTE *)this + 128) = 1;
  }
  else
  {
    result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 32))(this);
    if ((result & 1) == 0)
    {
      do
      {
        (*(void (**)(JetPack::CallbackStream *, uint64_t))(*(_QWORD *)this + 48))(this, 1024);
        result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(_QWORD *)this + 32))(this);
      }
      while (!(_DWORD)result);
    }
  }
  return result;
}

void JetPack::CallbackStream::~CallbackStream(JetPack::CallbackStream *this)
{
  JetPack::CallbackStream *v2;
  uint64_t v3;
  JetPack::CallbackStream *v4;
  uint64_t v5;
  JetPack::CallbackStream *v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24C804240;
  if (*((_BYTE *)this + 112))
  {
    v2 = (JetPack::CallbackStream *)*((_QWORD *)this + 13);
    if (v2 == (JetPack::CallbackStream *)((char *)this + 80))
    {
      v3 = 4;
      v2 = (JetPack::CallbackStream *)((char *)this + 80);
    }
    else
    {
      if (!v2)
        goto LABEL_7;
      v3 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
  }
LABEL_7:
  if (!*((_BYTE *)this + 72))
    goto LABEL_13;
  v4 = (JetPack::CallbackStream *)*((_QWORD *)this + 8);
  if (v4 == (JetPack::CallbackStream *)((char *)this + 40))
  {
    v5 = 4;
    v4 = (JetPack::CallbackStream *)((char *)this + 40);
  }
  else
  {
    if (!v4)
      goto LABEL_13;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_13:
  v6 = (JetPack::CallbackStream *)*((_QWORD *)this + 4);
  if (v6 == (JetPack::CallbackStream *)((char *)this + 8))
  {
    v7 = 4;
    v6 = (JetPack::CallbackStream *)((char *)this + 8);
  }
  else
  {
    if (!v6)
      return;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
}

{
  JetPack::CallbackStream *v2;
  uint64_t v3;
  JetPack::CallbackStream *v4;
  uint64_t v5;
  JetPack::CallbackStream *v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24C804240;
  if (*((_BYTE *)this + 112))
  {
    v2 = (JetPack::CallbackStream *)*((_QWORD *)this + 13);
    if (v2 == (JetPack::CallbackStream *)((char *)this + 80))
    {
      v3 = 4;
      v2 = (JetPack::CallbackStream *)((char *)this + 80);
    }
    else
    {
      if (!v2)
        goto LABEL_7;
      v3 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
  }
LABEL_7:
  if (!*((_BYTE *)this + 72))
    goto LABEL_13;
  v4 = (JetPack::CallbackStream *)*((_QWORD *)this + 8);
  if (v4 == (JetPack::CallbackStream *)((char *)this + 40))
  {
    v5 = 4;
    v4 = (JetPack::CallbackStream *)((char *)this + 40);
  }
  else
  {
    if (!v4)
      goto LABEL_13;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_13:
  v6 = (JetPack::CallbackStream *)*((_QWORD *)this + 4);
  if (v6 == (JetPack::CallbackStream *)((char *)this + 8))
  {
    v7 = 4;
    v6 = (JetPack::CallbackStream *)((char *)this + 8);
  }
  else
  {
    if (!v6)
      goto LABEL_18;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_18:
  JUMPOUT(0x212BAD578);
}

size_t JetPack::BufferStream::read(JetPack::BufferStream *this, unsigned __int8 *a2, size_t a3)
{
  uint64_t v6;

  if (((*(uint64_t (**)(JetPack::BufferStream *))(*(_QWORD *)this + 32))(this) & 1) != 0)
    return 0;
  v6 = *((_QWORD *)this + 3);
  if (*((_QWORD *)this + 2) - v6 < a3)
    a3 = *((_QWORD *)this + 2) - v6;
  if (a3)
  {
    memmove(a2, (const void *)(*((_QWORD *)this + 1) + v6), a3);
    v6 = *((_QWORD *)this + 3);
  }
  *((_QWORD *)this + 3) = v6 + a3;
  return a3;
}

uint64_t JetPack::BufferStream::position(JetPack::BufferStream *this)
{
  return *((_QWORD *)this + 3);
}

BOOL JetPack::BufferStream::isFinished(JetPack::BufferStream *this)
{
  return *((_QWORD *)this + 2) == *((_QWORD *)this + 3);
}

void JetPack::BufferStream::~BufferStream(JetPack::BufferStream *this)
{
  JUMPOUT(0x212BAD578);
}

unint64_t JetPack::archiveErrorToString@<X0>(unint64_t this@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v3;
  const void *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = a2;
  if (!this)
  {
    a2[23] = 0;
    *a2 = 0;
    return this;
  }
  v4 = (const void *)this;
  this = strlen((const char *)this);
  if (this >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = this;
  if (this >= 0x17)
  {
    v6 = (this & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((this | 7) != 0x17)
      v6 = this | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v3[1] = v5;
    v3[2] = v7 | 0x8000000000000000;
    *v3 = v8;
    v3 = v8;
  }
  else
  {
    *((_BYTE *)v3 + 23) = this;
    if (!this)
      goto LABEL_11;
  }
  this = (unint64_t)memcpy(v3, v4, v5);
LABEL_11:
  *((_BYTE *)v3 + v5) = 0;
  return this;
}

_QWORD *JetPackStreamCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v17[3];
  _QWORD *v18;
  char v19;
  _QWORD v20[3];
  _QWORD *v21;
  char v22;
  _QWORD v23[3];
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = (_QWORD *)operator new();
  *v8 = 0;
  v8[1] = 0;
  v9 = operator new(0xA0uLL);
  v9[2] = 0;
  *v9 = &unk_24C804E18;
  v9[1] = 0;
  v23[0] = &off_24C804AC8;
  v23[1] = a1;
  v23[2] = a2;
  v24 = v23;
  v20[0] = &off_24C804B20;
  v20[1] = a1;
  v20[2] = a3;
  v21 = v20;
  v22 = 1;
  v17[0] = &off_24C804B78;
  v17[1] = a1;
  v17[2] = a4;
  v18 = v17;
  v19 = 1;
  JetPack::CallbackStream::CallbackStream((uint64_t)(v9 + 3), (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);
  if (v19)
  {
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_7;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
LABEL_7:
  if (!v22)
    goto LABEL_13;
  v12 = v21;
  if (v21 == v20)
  {
    v13 = 4;
    v12 = v20;
  }
  else
  {
    if (!v21)
      goto LABEL_13;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_13:
  v14 = v24;
  if (v24 == v23)
  {
    v15 = 4;
    v14 = v23;
    goto LABEL_17;
  }
  if (v24)
  {
    v15 = 5;
LABEL_17:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }
  *v8 = v9 + 3;
  v8[1] = v9;
  return v8;
}

void sub_20DA6AF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,__int16 *a22,char a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,__int16 *a30)
{
  std::__shared_weak_count *v30;
  __int16 *v33;
  uint64_t v34;
  __int16 *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  NSObject *v40;
  uint64_t v41;
  unsigned __int8 v42;

  if (a15)
    JetPackStreamCreate_cold_1(&a14, &a11);
  if (a23)
  {
    v33 = a22;
    if (a22 == &a17)
    {
      v34 = 4;
      v33 = &a17;
    }
    else
    {
      if (!a22)
        goto LABEL_9;
      v34 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v33 + 8 * v34))();
  }
LABEL_9:
  v35 = a30;
  if (a30 == &a25)
  {
    v36 = 4;
    v35 = &a25;
  }
  else
  {
    if (!a30)
      goto LABEL_14;
    v36 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v35 + 8 * v36))();
LABEL_14:
  std::__shared_weak_count::~__shared_weak_count(v30);
  operator delete(v37);
  if (a2 == 1)
  {
    v38 = __cxa_begin_catch(a1);
    {
      getGlobalLog(void)::sharedContext = 4;
      {
        JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      }
      qword_253DA4998 = JetPack::getSharedOSLog(void)::log;
    }
    v40 = qword_253DA4998;
    if (os_log_type_enabled((os_log_t)qword_253DA4998, OS_LOG_TYPE_ERROR))
    {
      v41 = (*(uint64_t (**)(void *))(*(_QWORD *)v38 + 16))(v38);
      LODWORD(a9) = 136446210;
      *(_QWORD *)((char *)&a9 + 4) = v41;
      _os_log_impl(&dword_20DA5A000, v40, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x20DA6AF58);
  }
  _Unwind_Resume(a1);
}

_QWORD *JetPackCreateDataStream(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2;
  v4 = a1;
  return makePublicRef<JetPackStream,JetPack::BufferStream,unsigned char const*&,unsigned long &>(&v4, &v3);
}

_QWORD *makePublicRef<JetPackStream,JetPack::BufferStream,unsigned char const*&,unsigned long &>(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)operator new();
  *v4 = 0;
  v4[1] = 0;
  v5 = operator new(0x38uLL);
  v5[2] = 0;
  *v5 = &unk_24C804D38;
  v5[1] = 0;
  v6 = *a1;
  v5[3] = &unk_24C804110;
  v7 = *a2;
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = 0;
  *v4 = v5 + 3;
  v4[1] = v5;
  return v4;
}

uint64_t JetPackStreamPosition(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a1;
  v3 = (std::__shared_weak_count *)a1[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v6;
}

void sub_20DA6B374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20DA6B3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<JetPack::CallbackStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::CallbackStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804E18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_emplace<JetPack::CallbackStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804AC8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804AC8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 8), *a2, *a3);
}

uint64_t std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_0"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::target_type()
{
}

void std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804B20;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804B20;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::operator()(uint64_t a1, _QWORD *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_1"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::target_type()
{
}

void std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::~__func()
{
  JUMPOUT(0x212BAD578);
}

__n128 std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C804B78;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C804B78;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 16))(*(_QWORD *)(a1 + 8));
}

uint64_t std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_2"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::target_type()
{
}

uint64_t JetPack::CallbackStream::CallbackStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = &off_24C804240;
  v7 = a1 + 8;
  v8 = *(_QWORD *)(a2 + 24);
  if (v8)
  {
    if (v8 == a2)
    {
      *(_QWORD *)(a1 + 32) = v7;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), v7);
    }
    else
    {
      *(_QWORD *)(a1 + 32) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_BYTE *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  if (*(_BYTE *)(a3 + 32))
  {
    v9 = *(_QWORD *)(a3 + 24);
    if (v9)
    {
      if (v9 == a3)
      {
        *(_QWORD *)(a1 + 64) = a1 + 40;
        (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a3 + 24) + 24))(*(_QWORD *)(a3 + 24), a1 + 40);
        goto LABEL_12;
      }
      v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
    }
    *(_QWORD *)(a1 + 64) = v9;
LABEL_12:
    *(_BYTE *)(a1 + 72) = 1;
  }
  *(_BYTE *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 112) = 0;
  if (*(_BYTE *)(a4 + 32))
  {
    v10 = *(_QWORD *)(a4 + 24);
    if (v10)
    {
      if (v10 == a4)
      {
        *(_QWORD *)(a1 + 104) = a1 + 80;
        (*(void (**)(_QWORD))(**(_QWORD **)(a4 + 24) + 24))(*(_QWORD *)(a4 + 24));
        goto LABEL_19;
      }
      v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
    }
    *(_QWORD *)(a1 + 104) = v10;
LABEL_19:
    *(_BYTE *)(a1 + 112) = 1;
  }
  *(_QWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = 0;
  return a1;
}

void sub_20DA6B82C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  if (*(_BYTE *)(v1 + 112))
    JetPack::CallbackStream::CallbackStream(v1, v1 + 80);
  if (*(_BYTE *)(v1 + 72))
  {
    v5 = *(_QWORD **)(v1 + 64);
    if (v5 == v3)
    {
      v6 = 4;
    }
    else
    {
      if (!v5)
        goto LABEL_9;
      v6 = 5;
      v3 = *(_QWORD **)(v1 + 64);
    }
    (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
  }
LABEL_9:
  v7 = *(_QWORD **)(v1 + 32);
  if (v7 == v2)
  {
    v8 = 4;
  }
  else
  {
    if (!v7)
      goto LABEL_14;
    v8 = 5;
    v2 = *(_QWORD **)(v1 + 32);
  }
  (*(void (**)(_QWORD *))(*v2 + 8 * v8))(v2);
LABEL_14:
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<JetPack::BufferStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D38;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::BufferStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D38;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_emplace<JetPack::BufferStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<JetPack::FileStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::FileStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804D00;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t JetPack::CCKDFParametersCreateHkdfWrapper(JetPack *this, const void *a2, unint64_t a3, const void *a4, _DWORD *a5, int *a6)
{
  *a5 = CCKDFParametersCreateHkdf();
  return 0;
}

uint64_t JetPack::CCKDFParametersDestroyWrapper(uint64_t result)
{
  if (result)
    return CCKDFParametersDestroy();
  return result;
}

uint64_t JetPack::CommonCryptoBackend::generateSecureRandomBytes(JetPack::CommonCryptoBackend *this, unsigned __int8 *bytes, size_t count)
{
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], count, bytes))
    return 4294966296;
  else
    return 1;
}

uint64_t JetPack::CommonCryptoBackend::convertCCStatusToCryptoStatus(JetPack::CommonCryptoBackend *this, int a2)
{
  if (a2)
    return 4294966296;
  else
    return 1;
}

uint64_t JetPack::CommonCryptoBackend::aesGCMEncrypt(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, const unsigned __int8 *a6, unint64_t a7, unsigned __int8 *a8, unsigned __int8 *a9, unint64_t a10)
{
  if (CCCryptorGCMOneshotEncrypt())
    return 4294966296;
  else
    return 1;
}

void JetPack::CommonCryptoBackend::generateSigningKey(_QWORD *a1@<X8>)
{
  CFNumberRef v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  void **v6;
  _QWORD *v7;
  const __CFData *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  UInt8 *BytePtr;
  CFIndex Length;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  JetPack::FailedToGenerateKeyPairException *exception;
  _BYTE *v24;
  CFErrorRef v25;
  CFDictionaryRef parameters;
  std::__shared_weak_count *v27;
  CFNumberRef v28;
  std::__shared_weak_count *v29;
  _QWORD v30[2];
  const __CFData *v31;
  std::__shared_weak_count *v32;
  void **valuePtr;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  LODWORD(valuePtr) = 256;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  v28 = v3;
  v4 = (std::__shared_weak_count *)operator new();
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C805010;
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)v3;
  v4[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  v29 = v4;
  v5 = (std::__shared_weak_count *)*MEMORY[0x24BDE9060];
  v31 = (const __CFData *)*MEMORY[0x24BDE9050];
  v32 = v5;
  valuePtr = (void **)&v31;
  v34 = 2;
  v30[0] = *MEMORY[0x24BDE9048];
  v30[1] = v3;
  v35 = v30;
  v36 = 2;
  JetPack::CFDictionaryWrapper::convert(&valuePtr, 2, &parameters);
  v25 = 0;
  v6 = (void **)SecKeyCreateRandomKey(parameters, &v25);
  valuePtr = v6;
  v7 = (_QWORD *)operator new();
  *v7 = &unk_24C804FD8;
  v7[1] = 0;
  v7[2] = 0;
  v7[3] = v6;
  v7[4] = JetPack::CFReleaseIgnoringNull;
  v34 = (uint64_t)v7;
  if (v25)
  {
    puts("An error occurred while generating the key");
    exception = (JetPack::FailedToGenerateKeyPairException *)__cxa_allocate_exception(0x20uLL);
    JetPack::FailedToGenerateKeyPairException::FailedToGenerateKeyPairException(exception);
  }
  v8 = SecKeyCopyExternalRepresentation((SecKeyRef)v6, &v25);
  v31 = v8;
  v9 = (std::__shared_weak_count *)operator new();
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8050B8;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  v9[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  v32 = v9;
  if (v25)
  {
    puts("An error occurred converting the key to a DER");
    v24 = __cxa_allocate_exception(0x20uLL);
    v24[31] = 18;
    *(_QWORD *)v24 = &unk_24C804590;
    strcpy(v24 + 8, "FailedToConvertKey");
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  BytePtr = (UInt8 *)CFDataGetBytePtr(v8);
  Length = CFDataGetLength(v8);
  for (v30[0] = a1; Length; --Length)
    std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)v30, (char *)BytePtr++);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  v14 = (std::__shared_weak_count *)v34;
  if (v34)
  {
    v15 = (unint64_t *)(v34 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v29;
  if (v29)
  {
    v21 = (unint64_t *)&v29->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_20DA6BDD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v6 = va_arg(va2, _QWORD);
  v8 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_20DA6BDDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  va_list va1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  v13 = va_arg(va2, _QWORD);
  __cxa_free_exception(v2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_20DA6BDEC(_Unwind_Exception *exception_object, int a2)
{
  const void *v2;

  if (a2)
  {
    __cxa_begin_catch(exception_object);
    if (v2)
      CFRelease(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA6BE10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v6 = va_arg(va2, _QWORD);
  v8 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  __cxa_end_catch();
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_20DA6BE20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v6 = va_arg(va2, _QWORD);
  v8 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t *)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_20DA6BE28(_Unwind_Exception *a1, int a2)
{
  const void *v2;

  if (a2)
  {
    __cxa_begin_catch(a1);
    if (v2)
      CFRelease(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_20DA6BE4C()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA6BEE4);
}

void sub_20DA6BE5C()
{
  JUMPOUT(0x20DA6BEE4);
}

void sub_20DA6BE64()
{
  JUMPOUT(0x20DA6BEECLL);
}

void sub_20DA6BE6C(_Unwind_Exception *a1, int a2)
{
  const void *v2;

  if (a2)
  {
    __cxa_begin_catch(a1);
    if (v2)
      CFRelease(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_20DA6BE90(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_20DA6BE9C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_20DA6BEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  JUMPOUT(0x20DA6BEDCLL);
}

void JetPack::CFDictionaryWrapper::convert(void ***a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;
  void ***v4;
  void ***v5;
  char *v6;
  void **v7;
  void **v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  void **v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  _OWORD *v20;
  __int128 *v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  void **v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  __int128 *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  const void **v42;
  const void **v43;
  CFDictionaryRef v44;
  char *v46;
  char *v47;
  char *v48;
  void **keys;
  char *v50;
  char *v51;

  v3 = a3;
  keys = 0;
  v50 = 0;
  v51 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  if (a2)
  {
    v4 = a1;
    v5 = &a1[2 * a2];
    do
    {
      v7 = *v4;
      v8 = (void **)v50;
      if (v50 >= v51)
      {
        v10 = (v50 - (char *)keys) >> 3;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          goto LABEL_56;
        v12 = v51 - (char *)keys;
        if ((v51 - (char *)keys) >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
        {
          if (v13 >> 61)
            goto LABEL_55;
          v14 = operator new(8 * v13);
        }
        else
        {
          v14 = 0;
        }
        v15 = (void **)&v14[8 * v10];
        *v15 = *v7;
        v9 = (char *)(v15 + 1);
        if (v50 != (char *)keys)
        {
          v16 = v50 - (char *)keys - 8;
          if (v16 < 0x58)
            goto LABEL_59;
          if ((unint64_t)((char *)keys - v14) < 0x20)
            goto LABEL_59;
          v17 = (v16 >> 3) + 1;
          v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
          v19 = (void **)&v50[-v18];
          v15 = (void **)((char *)v15 - v18);
          v20 = &v14[8 * v10 - 16];
          v21 = (__int128 *)(v50 - 16);
          v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v23 = *v21;
            *(v20 - 1) = *(v21 - 1);
            *v20 = v23;
            v20 -= 2;
            v21 -= 2;
            v22 -= 4;
          }
          while (v22);
          v8 = v19;
          if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_59:
            do
            {
              v24 = *--v8;
              *--v15 = v24;
            }
            while (v8 != keys);
          }
          v8 = keys;
        }
        keys = v15;
        v51 = &v14[8 * v13];
        if (v8)
          operator delete(v8);
      }
      else
      {
        *(_QWORD *)v50 = *v7;
        v9 = v50 + 8;
      }
      v50 = v9;
      v25 = *v4;
      v26 = v47;
      if (v47 < v48)
      {
        *(_QWORD *)v47 = v25[1];
        v6 = v47 + 8;
      }
      else
      {
        v27 = (v47 - v46) >> 3;
        v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 61)
LABEL_56:
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v29 = v48 - v46;
        if ((v48 - v46) >> 2 > v28)
          v28 = v29 >> 2;
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
          v30 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v30 = v28;
        if (v30)
        {
          if (v30 >> 61)
LABEL_55:
            std::__throw_bad_array_new_length[abi:ne180100]();
          v31 = (char *)operator new(8 * v30);
        }
        else
        {
          v31 = 0;
        }
        v32 = &v31[8 * v27];
        *(_QWORD *)v32 = v25[1];
        v6 = v32 + 8;
        if (v47 != v46)
        {
          v33 = v47 - v46 - 8;
          if (v33 < 0x58)
            goto LABEL_60;
          if ((unint64_t)(v46 - v31) < 0x20)
            goto LABEL_60;
          v34 = (v33 >> 3) + 1;
          v35 = 8 * (v34 & 0x3FFFFFFFFFFFFFFCLL);
          v36 = &v47[-v35];
          v32 -= v35;
          v37 = &v31[8 * v27 - 16];
          v38 = (__int128 *)(v47 - 16);
          v39 = v34 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v40 = *v38;
            *((_OWORD *)v37 - 1) = *(v38 - 1);
            *(_OWORD *)v37 = v40;
            v37 -= 32;
            v38 -= 2;
            v39 -= 4;
          }
          while (v39);
          v26 = v36;
          if (v34 != (v34 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_60:
            do
            {
              v41 = *((_QWORD *)v26 - 1);
              v26 -= 8;
              *((_QWORD *)v32 - 1) = v41;
              v32 -= 8;
            }
            while (v26 != v46);
          }
          v26 = v46;
        }
        v46 = v32;
        v48 = &v31[8 * v30];
        if (v26)
          operator delete(v26);
      }
      v47 = v6;
      v4 += 2;
    }
    while (v4 != v5);
    v42 = (const void **)keys;
    v3 = a3;
    v43 = (const void **)v46;
  }
  else
  {
    v6 = 0;
    v43 = 0;
    v42 = 0;
  }
  v44 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v42, v43, (v6 - (char *)v43) >> 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  JetPack::makeCFSharedPtr<__CFDictionary const*>((uint64_t)v44, v3);
  if (v43)
    operator delete(v43);
  if (v42)
    operator delete(v42);
}

void sub_20DA6C250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  void *v16;

  if (__p)
  {
    operator delete(__p);
    v16 = a14;
    if (!a14)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v16 = a14;
    if (!a14)
      goto LABEL_3;
  }
  operator delete(v16);
  _Unwind_Resume(exception_object);
}

JetPack::FailedToGenerateKeyPairException *JetPack::FailedToGenerateKeyPairException::FailedToGenerateKeyPairException(JetPack::FailedToGenerateKeyPairException *this)
{
  char *v2;

  v2 = (char *)operator new(0x19uLL);
  strcpy(v2, "FailedToGenerateKeyPair");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x17uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C8046F8;
  return this;
}

void sub_20DA6C31C(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::generateSelfSignedCertificate(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  const __CFAllocator *v4;
  CFStringRef v5;
  CFArrayRef v6;
  const void *v7;
  size_t v8;
  char *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  UInt8 *BytePtr;
  CFIndex Length;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  const __CFData *v33;
  __SecCertificate *SelfSignedCertificate;
  std::__shared_weak_count *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  void *values;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  void *v45;
  std::__shared_weak_count *v46;
  char cStr[23];
  char v48;
  const __CFString *v49;
  std::__shared_weak_count *v50;
  _QWORD *i;

  v48 = 12;
  strcpy(cStr, "JetPackTests");
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  JetPack::makeCFSharedPtr<__CFString const*>((uint64_t)v5, &v49);
  if (v48 < 0)
    operator delete(*(void **)cStr);
  JetPack::CommonCryptoBackend::subjectEntry((__CFString *)*MEMORY[0x24BDE93D0], v49, &v45);
  values = v45;
  v6 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  JetPack::makeCFSharedPtr<__CFArray const*>((uint64_t)v6, &v43);
  JetPack::CFDictionaryWrapper::convert(0, 0, &values);
  v37 = 0;
  v38 = 0;
  v36 = 0;
  v7 = *(const void **)a1;
  v8 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (v8)
  {
    if ((v8 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v9 = (char *)operator new(v8);
    v36 = v9;
    v38 = &v9[v8];
    memcpy(v9, v7, v8);
    v37 = &v9[v8];
  }
  else
  {
    v9 = 0;
  }
  JetPack::CommonCryptoBackend::keyFromData((uint64_t)&v36, &v39);
  if (v9)
  {
    v37 = v9;
    operator delete(v9);
  }
  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  v10 = (std::__shared_weak_count *)operator new();
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C804FA0;
  v10->__shared_owners_ = 0;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)SelfSignedCertificate;
  v10[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  v35 = v10;
  v33 = SecCertificateCopyData(SelfSignedCertificate);
  v11 = (std::__shared_weak_count *)operator new();
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8050B8;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v33;
  v11[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  BytePtr = (UInt8 *)CFDataGetBytePtr(v33);
  Length = CFDataGetLength(v33);
  for (i = a2; Length; --Length)
    std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)BytePtr++);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v35)
  {
    v16 = (unint64_t *)&v35->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v18 = v40;
  if (v40)
  {
    v19 = (unint64_t *)&v40->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v42;
  if (v42)
  {
    v22 = (unint64_t *)&v42->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v44;
  if (v44)
  {
    v25 = (unint64_t *)&v44->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v46;
  if (v46)
  {
    v28 = (unint64_t *)&v46->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = v50;
  if (v50)
  {
    v31 = (unint64_t *)&v50->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

void sub_20DA6C6F0()
{
  __break(1u);
}

void sub_20DA6C73C()
{
  __cxa_end_catch();
  JUMPOUT(0x20DA6C7E4);
}

void sub_20DA6C74C()
{
  JUMPOUT(0x20DA6C7E4);
}

void sub_20DA6C754(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;

  if (v15)
    operator delete(v15);
  JUMPOUT(0x20DA6C7ECLL);
}

void sub_20DA6C76C()
{
  JUMPOUT(0x20DA6C7F4);
}

void sub_20DA6C774()
{
  JUMPOUT(0x20DA6C804);
}

void sub_20DA6C77C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  JUMPOUT(0x20DA6C7ECLL);
}

void sub_20DA6C794(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  JUMPOUT(0x20DA6C7DCLL);
}

void JetPack::CommonCryptoBackend::subjectEntry(__CFString *a1@<X1>, const __CFString *a2@<X2>, _QWORD *a3@<X8>)
{
  const __CFAllocator *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  CFArrayRef v9;
  std::__shared_weak_count *v10;
  unint64_t *p_info;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  CFArrayRef v15;
  std::__shared_weak_count *v16;
  void *values;
  const __CFString *v18;

  values = a1;
  v18 = a2;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, 2, MEMORY[0x24BDBD690]);
  v6 = (std::__shared_weak_count *)operator new();
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C8050F0;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v15;
  v6[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  v16 = v6;
  values = v15;
  v18 = (const __CFString *)v6;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  v9 = CFArrayCreate(v5, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  JetPack::makeCFSharedPtr<__CFArray const*>((uint64_t)v9, a3);
  v10 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    p_info = (unint64_t *)&v18->info;
    do
      v12 = __ldaxr(p_info);
    while (__stlxr(v12 - 1, p_info));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v16)
  {
    v13 = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

void sub_20DA6C958(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA6C970(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_20DA6C984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::keyFromData(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  const __CFAllocator *v4;
  CFNumberRef v5;
  std::__shared_weak_count *v6;
  __CFError *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  size_t v11;
  char *v12;
  char *v13;
  CFDataRef v14;
  SecKeyRef v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  JetPack::FailedToDecodePrivateKeyException *exception;
  CFDictionaryRef attributes;
  std::__shared_weak_count *v27;
  CFNumberRef v28;
  std::__shared_weak_count *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  CFErrorRef error[2];
  CFErrorRef *valuePtr;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  LODWORD(valuePtr) = 256;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  v28 = v5;
  v6 = (std::__shared_weak_count *)operator new();
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C805010;
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v5;
  v6[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  v29 = v6;
  v7 = (__CFError *)*MEMORY[0x24BDE9060];
  error[0] = *(CFErrorRef *)MEMORY[0x24BDE9050];
  error[1] = v7;
  valuePtr = error;
  v34 = 2;
  v31[0] = *MEMORY[0x24BDE9048];
  v31[1] = v5;
  v35 = v31;
  v36 = 2;
  v8 = *MEMORY[0x24BDE9030];
  v30[0] = *MEMORY[0x24BDE9028];
  v30[1] = v8;
  v37 = v30;
  v38 = 2;
  JetPack::CFDictionaryWrapper::convert((void ***)&valuePtr, 3, &attributes);
  v10 = *(const void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v11 = v9 - *(_QWORD *)a1;
  if (v9 == *(_QWORD *)a1)
  {
    v13 = 0;
    v12 = 0;
  }
  else
  {
    if ((v11 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v12 = (char *)operator new(v9 - *(_QWORD *)a1);
    v13 = &v12[v11];
    memcpy(v12, v10, v11);
  }
  v14 = CFDataCreate(v4, (const UInt8 *)v12, v13 - v12);
  JetPack::makeCFSharedPtr<__CFData const*>((uint64_t)v14, &valuePtr);
  if (v12)
    operator delete(v12);
  error[0] = 0;
  v15 = SecKeyCreateWithData((CFDataRef)valuePtr, attributes, error);
  JetPack::makeCFSharedPtr<__SecKey *>((uint64_t)v15, a2);
  if (error[0])
  {
    puts("An error occurred importing the key");
    exception = (JetPack::FailedToDecodePrivateKeyException *)__cxa_allocate_exception(0x20uLL);
    JetPack::FailedToDecodePrivateKeyException::FailedToDecodePrivateKeyException(exception);
  }
  v16 = (std::__shared_weak_count *)v34;
  if (v34)
  {
    v17 = (unint64_t *)(v34 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v29;
  if (v29)
  {
    v23 = (unint64_t *)&v29->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
}

void sub_20DA6CC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  va_list va1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v9 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  v13 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v4);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_20DA6CC84()
{
  JUMPOUT(0x20DA6CD18);
}

void sub_20DA6CC8C(_Unwind_Exception *exception_object, int a2)
{
  const void *v2;

  if (a2)
  {
    __cxa_begin_catch(exception_object);
    if (v2)
      CFRelease(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20DA6CCB0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_20DA6CCBC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_20DA6CCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_20DA6CCFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  if (v4)
    JUMPOUT(0x20DA6CD0CLL);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t *)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](va1);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::exportPrivateKeyAsDER(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  const void *v4;
  size_t v5;
  char *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  const __CFData *Value;
  UInt8 *BytePtr;
  CFIndex Length;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const __CFDictionary *v16;
  char *v17;
  char *v18;
  char *v19;
  SecKeyRef key;
  std::__shared_weak_count *v21;
  _QWORD *i;

  v18 = 0;
  v19 = 0;
  v17 = 0;
  v4 = *(const void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = v3 - *(_QWORD *)a1;
  if (v3 == *(_QWORD *)a1)
  {
    v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v3 - *(_QWORD *)a1);
    v17 = v6;
    v19 = &v6[v5];
    memcpy(v6, v4, v5);
    v18 = &v6[v5];
  }
  JetPack::CommonCryptoBackend::keyFromData((uint64_t)&v17, &key);
  if (v6)
  {
    v18 = v6;
    operator delete(v6);
  }
  v16 = SecKeyCopyAttributes(key);
  v7 = (std::__shared_weak_count *)operator new();
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C805080;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v16;
  v7[1].__shared_owners_ = (uint64_t)JetPack::CFReleaseIgnoringNull;
  Value = (const __CFData *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x24BDE9550]);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  BytePtr = (UInt8 *)CFDataGetBytePtr(Value);
  Length = CFDataGetLength(Value);
  for (i = a2; Length; --Length)
    std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)BytePtr++);
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
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
}

void sub_20DA6CED8()
{
  __break(1u);
}

void sub_20DA6CEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __cxa_end_catch();
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *JetPack::makeCFSharedPtr<__CFDictionary const*>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C805080;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA6CFCC(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA6CFE4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

__n128 JetPack::CommonCryptoBackend::exportCertificateAsDER@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

JetPack::FailedToDecodePrivateKeyException *JetPack::FailedToDecodePrivateKeyException::FailedToDecodePrivateKeyException(JetPack::FailedToDecodePrivateKeyException *this)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "FailedToDecodePrivateKey");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x18uLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C804770;
  return this;
}

void sub_20DA6D09C(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::FailedToDecodeX509CertificateException *JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(JetPack::FailedToDecodeX509CertificateException *this)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "FailedToDecodeX509Certificate");
  *(_QWORD *)this = &unk_24C8049F0;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x1DuLL);
  operator delete(v2);
  *(_QWORD *)this = &unk_24C804900;
  return this;
}

void sub_20DA6D140(_Unwind_Exception *a1)
{
  std::exception *v1;
  void *v2;

  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

_QWORD *JetPack::makeCFSharedPtr<__CFString const*>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C805048;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA6D1BC(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA6D1D4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__CFString const*,void (*)(void const*),std::allocator<__CFString const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFString const*,void (*)(void const*),std::allocator<__CFString const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__CFDictionary const*,void (*)(void const*),std::allocator<__CFDictionary const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFDictionary const*,void (*)(void const*),std::allocator<__CFDictionary const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__CFNumber const*,void (*)(void const*),std::allocator<__CFNumber const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFNumber const*,void (*)(void const*),std::allocator<__CFNumber const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BAD578);
}

uint64_t std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

_QWORD *JetPack::makeCFSharedPtr<__CFArray const*>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;

  *a2 = a1;
  result = (_QWORD *)operator new();
  *result = &unk_24C8050F0;
  result[1] = 0;
  result[2] = 0;
  result[3] = a1;
  result[4] = JetPack::CFReleaseIgnoringNull;
  a2[1] = result;
  return result;
}

void sub_20DA6D45C(void *a1)
{
  const void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    CFRelease(v1);
  __cxa_rethrow();
}

void sub_20DA6D474(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__CFArray const*,void (*)(void const*),std::allocator<__CFArray const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFArray const*,void (*)(void const*),std::allocator<__CFArray const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__SecCertificate *,void (*)(void const*),std::allocator<__SecCertificate>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__SecTrust *,void (*)(void const*),std::allocator<__SecTrust>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000020DA6F2E6
    || ((v3 & 0x800000020DA6F2E6 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000020DA6F2E6)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000020DA6F2E6 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__shared_ptr_emplace<JetPack::PartialStream>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<JetPack::BaseStream> &,unsigned int &,std::allocator<JetPack::PartialStream>,0>(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    OUTLINED_FUNCTION_0();
    std::__shared_weak_count::__release_weak(a1);
  }
}

_QWORD *JetPackStreamCreate_cold_1(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  if ((_QWORD *)*result == a2)
  {
    v2 = 4;
  }
  else
  {
    if (!*result)
      return result;
    v2 = 5;
    a2 = (_QWORD *)*result;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*a2 + 8 * v2))(a2);
}

uint64_t JetPack::CallbackStream::CallbackStream(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 104);
  if (v2 == a2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 32))(a2);
  if (v2)
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(result + 104) + 40))(*(_QWORD *)(result + 104));
  return result;
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x24BDAC1A0]();
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x24BDAC268]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x24BDAC270]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x24BDE8A98](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x24BDE8B88](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::nested_exception::rethrow_nested(const std::nested_exception *this)
{
  MEMORY[0x24BEDA980](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA10](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_normal(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDAA20](retstr, this);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::end(std::__fs::filesystem::path::iterator *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x24BEDAA30](retstr, this);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::begin(std::__fs::filesystem::path::iterator *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x24BEDAA38](retstr, this);
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x24BEDAA48](this, a2.__data_, a2.__size_);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::nested_exception *__cdecl std::nested_exception::nested_exception(std::nested_exception *this)
{
  return (std::nested_exception *)MEMORY[0x24BEDAB98](this);
}

void std::nested_exception::~nested_exception(std::nested_exception *this)
{
  MEMORY[0x24BEDABA0](this);
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

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__read_symlink(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *a2, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDB240](retstr, a2, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__symlink_status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB258](a1, __ec);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::iterator::__increment(std::__fs::filesystem::path::iterator *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x24BEDB2E0](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
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
  off_24C8033C8(__p);
}

uint64_t operator delete()
{
  return off_24C8033D0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C8033D8(__sz);
}

uint64_t operator new()
{
  return off_24C8033E0();
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x24BEDA360]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x24BEDA3F8]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x24BEDA450]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x24BEDA460]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open()
{
  return MEMORY[0x24BEDA4E0]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x24BEDA540]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x24BEDA580]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x24BEDA590]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x24BEDA598]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x24BEDA5A0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x24BEDA5A8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x24BEDA5B8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

