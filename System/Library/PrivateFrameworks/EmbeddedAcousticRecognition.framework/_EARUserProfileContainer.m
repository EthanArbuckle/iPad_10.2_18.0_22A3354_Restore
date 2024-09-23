@implementation _EARUserProfileContainer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARUserProfileContainer)initWithPath:(id)a3 userId:(id)a4 recognitionOnly:(BOOL)a5 error:(id *)a6
{

  return 0;
}

- (_EARUserProfileContainer)initWithPath:(id)a3 error:(id *)a4
{
  id v6;
  _EARUserProfileContainer *v7;
  _EARUserProfileContainer *v8;
  NSObject *v9;
  uint64_t **v10;
  EARLogger *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  _EARUserProfileContainer *v16;
  uint64_t *v17;
  std::__shared_weak_count *size;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  EARLogger *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  EARLogger *v32;
  NSObject *v33;
  std::string::size_type v34;
  uint64_t v35;
  uint64_t *v36;
  EARLogger *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  EARLogger *v42;
  NSObject *v44;
  NSObject *v45;
  __int128 v46;
  objc_super v47;
  std::string buf;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_EARUserProfileContainer;
  v7 = -[_EARUserProfileContainer init](&v47, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_47;
  if (!v6)
    goto LABEL_16;
  EARLogger::QuasarOSLogger((EARLogger *)v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138477827;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
    _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_INFO, "Reading user profile: path %{private}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "ear_toString");
  std::allocate_shared[abi:ne180100]<std::ifstream,std::allocator<std::ifstream>,std::string,void>(&v46);
  v10 = (uint64_t **)((char *)v8 + 8);
  v11 = (EARLogger *)std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v8 + 8, &v46);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
  if (*((_QWORD *)&v46 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if ((*((_BYTE *)*v10 + *(_QWORD *)(**v10 - 24) + 32) & 5) != 0)
  {
    EARLogger::QuasarOSLogger(v11);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_INFO, "Failed to read profile: stream failure", (uint8_t *)&buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&buf);
  v17 = (uint64_t *)((char *)v8 + 88);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v8 + 88, (__int128 *)&buf);
  size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
  if (buf.__r_.__value_.__l.__size_)
  {
    v19 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v21 = *v17;
  v22 = *v10;
  std::string::basic_string[abi:ne180100]<0>(&buf, "");
  v23 = (EARLogger *)quasar::LmeData::fromStream(v21, v22, 0, (unsigned __int8 *)&buf);
  v24 = (int)v23;
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if (v24 != 6)
  {
    EARLogger::QuasarOSLogger(v23);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v41, OS_LOG_TYPE_INFO, "Successfully read Quasar blob profile", (uint8_t *)&buf, 2u);
    }

    goto LABEL_43;
  }
  EARLogger::QuasarOSLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_INFO, "Failed to read Quasar blob profile: corrupt data or plist profile", (uint8_t *)&buf, 2u);
  }

  std::shared_ptr<quasar::LmeData>::reset[abi:ne180100]((_QWORD *)v8 + 11);
  std::shared_ptr<quasar::LmeData>::reset[abi:ne180100]((_QWORD *)v8 + 1);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v6, 0, a4);
  if (!v26)
  {
    EARLogger::QuasarOSLogger(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_INFO, "Failed to read plist profile: nil data", (uint8_t *)&buf, 2u);
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v26, 0, 0, a4);
  isKindOfClass = objc_claimAutoreleasedReturnValue();
  v28 = (void *)isKindOfClass;
  if (!isKindOfClass || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0))
  {
    EARLogger::QuasarOSLogger((EARLogger *)isKindOfClass);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v44, OS_LOG_TYPE_INFO, "Failed to read plist profile: nil or bad dict dict", (uint8_t *)&buf, 2u);
    }

    goto LABEL_16;
  }

  objc_msgSend(v28, "valueForKey:", CFSTR("language"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "valueForKey:", CFSTR("data"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {

    _ZNSt3__115allocate_sharedB8ne180100INS_18basic_stringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v46);
    v31 = objc_retainAutorelease(v30);
    objc_msgSend(v31, "bytes");
    objc_msgSend(v31, "length");
    v32 = (EARLogger *)std::ostream::write();
    EARLogger::QuasarOSLogger(v32);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v31, "length");
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v34;
      _os_log_impl(&dword_1AD756000, v33, OS_LOG_TYPE_INFO, "Read stream of %lu bytes", (uint8_t *)&buf, 0xCu);
    }

    _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&buf);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v8 + 88, (__int128 *)&buf);
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    v35 = *v17;
    v36 = (uint64_t *)v46;
    std::string::basic_string[abi:ne180100]<0>(&buf, "");
    v37 = (EARLogger *)quasar::LmeData::fromStream(v35, v36, 0, (unsigned __int8 *)&buf);
    v38 = (int)v37;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v38 != 6)
    {
      EARLogger::QuasarOSLogger(v37);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1AD756000, v39, OS_LOG_TYPE_INFO, "Successfully read plist profile", (uint8_t *)&buf, 2u);
      }

      v40 = *v17;
      if (v29)
        objc_msgSend(v29, "ear_toString");
      else
        memset(&buf, 0, sizeof(buf));
      std::string::operator=((std::string *)(v40 + 320), &buf);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
    }
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&v46);
  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v45, OS_LOG_TYPE_INFO, "Failed to read plist profile: nil profile", (uint8_t *)&buf, 2u);
    }

  }
  if (v30)
  {
LABEL_43:
    if (*(_DWORD *)(*v17 + 268) == 6)
    {
      EARLogger::QuasarOSLogger(v42);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_INFO, "Failed to read plist profile: corrupt data", (uint8_t *)&buf, 2u);
      }
      goto LABEL_15;
    }
LABEL_47:
    v16 = v8;
    goto LABEL_48;
  }
LABEL_16:
  v16 = 0;
LABEL_48:

  return v16;
}

- (shared_ptr<const)lmeData
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<const quasar::LmeData> result;

  v3 = *((_QWORD *)self + 12);
  *v2 = *((_QWORD *)self + 11);
  v2[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (LmeData *)self;
  return result;
}

- (id)maskedUserIdWithMask:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = *((_QWORD *)self + 11);
  v6 = (_QWORD *)(v5 + 272);
  if (*(char *)(v5 + 295) < 0)
    v6 = (_QWORD *)*v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (shared_ptr<quasar::LmeContainer>)quasarContainerWithUserIdMask:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  LmeContainer *v13;
  __shared_weak_count *v14;
  unsigned int v15;
  void *__p[2];
  uint64_t v17;
  shared_ptr<quasar::LmeContainer> result;

  v5 = v3;
  v6 = a3;
  v8 = *((_QWORD *)self + 11);
  v7 = (uint64_t *)((char *)self + 88);
  v9 = (_QWORD *)(v8 + 272);
  if (*(char *)(v8 + 295) < 0)
    v9 = (_QWORD *)*v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v17 = 0;
  }
  v15 = 0;
  std::allocate_shared[abi:ne180100]<quasar::LmeContainer,std::allocator<quasar::LmeContainer>,std::shared_ptr<quasar::LmeData> &,std::string,quasar::LmeDataFactoryBase::LmeType,void>(v7, (uint64_t)__p, &v15, v5);
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);

  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (NSData)data
{
  uint64_t v3;
  std::mutex *v5;
  void *v6;
  void *v7;
  size_t size;

  if (!*((_QWORD *)self + 1))
    return (NSData *)0;
  v3 = *((_QWORD *)self + 11);
  if (*(char *)(v3 + 295) < 0)
  {
    if (*(_QWORD *)(v3 + 280))
      return (NSData *)0;
  }
  else if (*(_BYTE *)(v3 + 295))
  {
    return (NSData *)0;
  }
  v5 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  std::ios_base::clear((std::ios_base *)(*((_QWORD *)self + 1) + *(_QWORD *)(**((_QWORD **)self + 1) - 24)), 0);
  std::istream::seekg();
  std::istream::tellg();
  std::istream::seekg();
  v6 = malloc_type_malloc(size, 0xDC0D2451uLL);
  if (v6)
  {
    std::istream::read();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v6, size);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  std::mutex::unlock(v5);
  return (NSData *)v7;
}

- (NSString)userId
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *((_QWORD *)self + 11);
  v3 = (_QWORD *)(v2 + 272);
  if (*(char *)(v2 + 295) < 0)
    v3 = (_QWORD *)*v3;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
}

- (NSSet)experimentIds
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;

  if (*((_QWORD *)self + 11))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *(_QWORD *)(*((_QWORD *)self + 11) + 384));
    v4 = *((_QWORD *)self + 11);
    v5 = *(_QWORD **)(v4 + 368);
    v6 = (_QWORD *)(v4 + 376);
    if (v5 != (_QWORD *)(v4 + 376))
    {
      do
      {
        if (*((char *)v5 + 55) < 0)
        {
          v7 = (_QWORD *)v5[4];
          v8 = v5[5];
        }
        else
        {
          v7 = v5 + 4;
          v8 = *((unsigned __int8 *)v5 + 55);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        v10 = (_QWORD *)v5[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v5[2];
            v12 = *v11 == (_QWORD)v5;
            v5 = v11;
          }
          while (!v12);
        }
        v5 = v11;
      }
      while (v11 != v6);
    }
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)self + 88);
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)self + 8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (void)initWithPath:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "Failed to read profile: Internal C++ exception: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPath:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Failed to read profile: Internal unknown exception", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
