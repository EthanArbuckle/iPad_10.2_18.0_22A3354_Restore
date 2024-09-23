@implementation ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_31(const void **result, uint64_t a2, int a3, uint64_t *a4, uint64_t a5)
{
  uint64_t *v6;
  const void **v9;
  const __CFDictionary *v10;
  const void *Value;
  const char *v12;
  CFTypeID v13;
  CFTypeRef v14;
  const void *v15;
  const char *v16;
  int v17;
  void *v18;
  __int128 v19;
  Security::CCHashInstance *v20;
  unsigned int *v21;
  unsigned int v22;
  size_t v23;
  Security *v24;
  int v25;
  uint64_t *v26;
  NSObject *v27;
  const char *v28;
  std::string v29;
  CFTypeRef cf;
  unint64_t v31;
  void *__p[5];
  int v33;
  char v34;
  _BYTE key[32];
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (*(_WORD *)(a2 + 88) == 8)
  {
    v6 = a4;
    v9 = result;
    cf = 0;
    v10 = (const __CFDictionary *)result[5];
    if (!v10)
      goto LABEL_15;
    if (*((char *)a4 + 23) < 0)
      std::string::__init_copy_ctor_external(&v29, (const std::string::value_type *)*a4, a4[1]);
    else
      v29 = *(std::string *)a4;
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)key, (char *)&v29);
    Value = CFDictionaryGetValue(v10, *(const void **)key);
    Security::CFRef<__CFString const*>::~CFRef((const void **)key);
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v29.__r_.__value_.__l.__data_);
      if (!Value)
        goto LABEL_14;
    }
    else if (!Value)
    {
LABEL_14:
      Value = cf;
      if (cf)
        goto LABEL_22;
LABEL_15:
      v16 = *(const char **)(a2 + 40);
      v31 = 0xAAAAAAAAFFFFFFFFLL;
      Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v31, v16, 0, 438);
      Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v31, v17, v18);
      v38 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v36 = v19;
      v37 = v19;
      *(_OWORD *)key = v19;
      *(_OWORD *)&key[16] = v19;
      v20 = Security::CodeSigning::CodeDirectory::hashFor((Security::CodeSigning::CodeDirectory *)1);
      Security::Mutex::Mutex((pthread_mutex_t *)&key[8]);
      v21 = (unsigned int *)((char *)v20 + 8);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
      *(_QWORD *)key = v20;
      v33 = v31;
      v34 = BYTE4(v31);
      __p[0] = (void *)MEMORY[0x1E0C809B0];
      __p[1] = (void *)0x40000000;
      __p[2] = ___ZN8Security11CodeSigning12hashFileDataINS_11DynamicHashEEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke_14810;
      __p[3] = &__block_descriptor_tmp_34_14811;
      __p[4] = v20;
      Security::CodeSigning::scanFileData(&v33, 0, (uint64_t)__p);
      memset(__p, 170, 24);
      v23 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)key + 16))(*(_QWORD *)key);
      std::vector<unsigned char>::vector(__p, v23);
      (*(void (**)(_QWORD, void *))(**(_QWORD **)key + 32))(*(_QWORD *)key, __p[0]);
      Value = CFDataCreate(0, (const UInt8 *)__p[0], (char *)__p[1] - (char *)__p[0]);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      Security::RefPointer<Security::DynamicHash>::~RefPointer(key);
      Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v31);
      v14 = cf;
      if (!cf)
        goto LABEL_21;
      goto LABEL_20;
    }
    v13 = CFGetTypeID(Value);
    if (v13 == CFDataGetTypeID())
    {
      CFRetain(Value);
      v14 = cf;
      if (!cf)
      {
LABEL_21:
        cf = Value;
LABEL_22:
        v24 = *(Security **)(*((_QWORD *)v9[4] + 1) + 40);
        v25 = *((char *)v6 + 23);
        v26 = v6;
        if ((a3 & 0xFFFFFFBF) != 0)
        {
          if (v25 < 0)
            v26 = (uint64_t *)*v6;
          Security::cfadd(v24, (__CFDictionary *)"{%s={hash=%O,optional=%B}}", v12, v26, Value, a3 & 1);
          v27 = secLogObjForScope("csresource");
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            return Security::CFRef<__CFData const*>::~CFRef(&cf);
          if (*((char *)v6 + 23) < 0)
            v6 = (uint64_t *)*v6;
          *(_DWORD *)key = 136315394;
          *(_QWORD *)&key[4] = v6;
          *(_WORD *)&key[12] = 2048;
          *(_QWORD *)&key[14] = a5;
          v28 = "%s added complex (rule %p)";
        }
        else
        {
          if (v25 < 0)
            v26 = (uint64_t *)*v6;
          Security::cfadd(v24, (__CFDictionary *)"{%s=%O}", v12, v26, Value);
          v27 = secLogObjForScope("csresource");
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            return Security::CFRef<__CFData const*>::~CFRef(&cf);
          if (*((char *)v6 + 23) < 0)
            v6 = (uint64_t *)*v6;
          *(_DWORD *)key = 136315394;
          *(_QWORD *)&key[4] = v6;
          *(_WORD *)&key[12] = 2048;
          *(_QWORD *)&key[14] = a5;
          v28 = "%s added simple (rule %p)";
        }
        _os_log_debug_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEBUG, v28, key, 0x16u);
        return Security::CFRef<__CFData const*>::~CFRef(&cf);
      }
LABEL_20:
      CFRelease(v14);
      goto LABEL_21;
    }
    v15 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("hash"));
    Security::CFRef<__CFArray const*>::operator=(&cf, v15);
    goto LABEL_14;
  }
  return result;
}

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_2(uint64_t a1)
{
  __CFDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  const Security::CFClass *v5;
  Security::CodeSigning::SecStaticCode *v6;
  char *v7;
  Security::CodeSigning::DiskRep *v8;
  unsigned __int8 *v9;
  unsigned __int8 v10;
  const void *v11;
  Security::CodeSigning::SecCodeSigner *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::string *p_p;
  void *v24;
  const char *v25;
  ssize_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Security::UnixError *v34;
  const void *Value;
  __CFDictionary *v36;
  __CFDictionary *v37;
  void *v38;
  const char *v39;
  Security::UnixPlusPlus::FileDesc *data_low;
  const char *v41;
  _QWORD *v42;
  char v43;
  int v44;
  void *v45;
  _BOOL8 hasExtendedAttribute;
  Security::UnixPlusPlus::FileDesc *v47;
  CFMutableDictionaryRef CFMutableDictionary;
  CFMutableDictionaryRef v49;
  NSObject *v50;
  int v51;
  int v52;
  _QWORD *v53;
  int *v55;
  const __CFString *v56;
  const void *v57;
  const __CFString *v58;
  const void *v59;
  std::string v60;
  std::string v61;
  CFTypeRef v62[3];
  CFTypeRef cf;
  __CFDictionary *v64;
  std::string __p;
  int v66;
  char v67;
  CFMutableDictionaryRef v68;
  Security::UnixPlusPlus::FileDesc *v69;
  std::string __b[43];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(__CFDictionary **)(a1 + 40);
  cf = 0;
  v64 = v2;
  if (*(_BYTE *)(a1 + 132))
  {
    v69 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAAAAAAAAALL;
    v4 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
    v6 = (Security::CodeSigning::SecStaticCode *)Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(_QWORD *)(v4 + 200), v5);
    if (*(char *)(a1 + 71) >= 0)
      v7 = (char *)(a1 + 48);
    else
      v7 = *(char **)(a1 + 48);
    v8 = (Security::CodeSigning::DiskRep *)Security::CodeSigning::DiskRep::bestGuess(v7, 0);
    Security::CodeSigning::SecStaticCode::SecStaticCode(v6, v8, 0);
    v9 = (unsigned __int8 *)v6 - 8;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(1u, v9));
    if ((v10 & 1) != 0)
    {
      v11 = (const void *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *))(*(_QWORD *)v6 + 16))(v6);
      CFRetain(v11);
    }
    v69 = v6;
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3) & 4) != 0)
    {
      v12 = *(Security::CodeSigning::SecCodeSigner **)(v3 + 8);
      v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
      Security::CodeSigning::SecCodeSigner::sign(v12, v69, v13);
    }
    memset(__b, 170, 24);
    v14 = Security::CodeSigning::SecStaticCode::designatedRequirement(v69);
    Security::CodeSigning::Dumper::dump(__b, (uint64_t)v14);
    if (!Security::CodeSigning::SecStaticCode::cdHash((CFDataRef *)v69))
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
    v15 = Security::CodeSigning::SecStaticCode::designatedRequirement(v69);
    Security::CodeSigning::Dumper::dump(&__p, (uint64_t)v15);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v24 = Security::cfmake<__CFDictionary const*>((uint64_t)"{requirement=%s,cdhash=%O}", v16, v17, v18, v19, v20, v21, v22, (uint64_t)p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(__b[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__b[0].__r_.__value_.__l.__data_);
    Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v69);
    goto LABEL_26;
  }
  if (*(_BYTE *)(a1 + 133))
  {
    memset(__b, 170, 0x400uLL);
    v25 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v25 = *(const char **)v25;
    v26 = readlink(v25, (char *)__b, 0x3FFuLL);
    if (v26 < 0)
    {
      v55 = __error();
      Security::UnixError::throwMe((Security::UnixError *)*v55);
    }
    __b[0].__r_.__value_.__s.__data_[v26] = 0;
    v24 = Security::cfmake<__CFDictionary const*>((uint64_t)"{symlink=%s}", v27, v28, v29, v30, v31, v32, v33, (uint64_t)__b);
    if (cf)
      CFRelease(cf);
LABEL_26:
    cf = v24;
    if (v24)
      goto LABEL_27;
LABEL_56:
    v50 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = *(unsigned __int8 *)(a1 + 132);
      v52 = *(unsigned __int8 *)(a1 + 133);
      v53 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v53 = (_QWORD *)*v53;
      LODWORD(__b[0].__r_.__value_.__l.__data_) = 67109634;
      HIDWORD(__b[0].__r_.__value_.__r.__words[0]) = v51;
      LOWORD(__b[0].__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&__b[0].__r_.__value_.__r.__words[1] + 2) = v52;
      HIWORD(__b[0].__r_.__value_.__r.__words[1]) = 2080;
      __b[0].__r_.__value_.__r.__words[2] = (std::string::size_type)v53;
      _os_log_impl(&dword_18A900000, v50, OS_LOG_TYPE_DEFAULT, "Failed to generate sealed resource: %d, %d, %s", (uint8_t *)__b, 0x18u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12);
  }
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3) & 0x1000000) != 0)
  {
    __b[0].__r_.__value_.__r.__words[0] = 0xAAAAAAAAFFFFFFFFLL;
    if (*(char *)(a1 + 71) >= 0)
      v39 = (const char *)(a1 + 48);
    else
      v39 = *(const char **)(a1 + 48);
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)__b, v39, 0, 438);
    data_low = (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0].__r_.__value_.__l.__data_), "com.apple.ResourceFork"))
    {
      Security::UnixPlusPlus::FileDesc::removeAttr(data_low, "com.apple.ResourceFork");
    }
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(data_low, "com.apple.FinderInfo"))
      Security::UnixPlusPlus::FileDesc::removeAttr(data_low, "com.apple.FinderInfo");
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)__b);
  }
  v41 = (const char *)(a1 + 96);
  if (*(char *)(a1 + 119) < 0)
    v41 = *(const char **)v41;
  v42 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)v62, v42);
  v43 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  v69 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v69, v41, 0, 438);
  Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v69, v44, v45);
  if (v43 < 0)
  {
    v47 = (Security::UnixPlusPlus::FileDesc *)v69;
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)v69, "com.apple.ResourceFork"))
    {
      v56 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Disallowed xattr %s found on %s"), "com.apple.ResourceFork", v41);
      Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, (uint64_t)CFSTR("SecCSResourceHasSidebandData"), v56, v57);
    }
    hasExtendedAttribute = Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(v47, "com.apple.FinderInfo");
    if (hasExtendedAttribute)
    {
      v58 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Disallowed xattr %s found on %s"), "com.apple.FinderInfo", v41);
      Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, (uint64_t)CFSTR("SecCSResourceHasSidebandData"), v58, v59);
    }
  }
  CFMutableDictionary = Security::makeCFMutableDictionary((Security *)hasExtendedAttribute);
  v68 = CFMutableDictionary;
  v66 = (int)v69;
  v67 = BYTE4(v69);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)&__p, v62);
  __b[0].__r_.__value_.__r.__words[0] = MEMORY[0x1E0C809B0];
  __b[0].__r_.__value_.__l.__size_ = 0x40000000;
  __b[0].__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN8Security11CodeSigning15ResourceBuilder8hashFileEPKcNSt3__13setIjNS4_4lessIjEENS4_9allocatorIjEEEEb_block_invoke;
  __b[1].__r_.__value_.__r.__words[0] = (std::string::size_type)&__block_descriptor_tmp_14818;
  __b[1].__r_.__value_.__l.__size_ = (std::string::size_type)CFMutableDictionary;
  Security::CodeSigning::CodeDirectory::multipleHashFileData((uint64_t)&v66, 0, &__p, (uint64_t)__b);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((_QWORD *)__p.__r_.__value_.__l.__size_);
  v49 = v68;
  v68 = 0;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v68);
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v69);
  if (cf)
    CFRelease(cf);
  cf = v49;
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((_QWORD *)v62[1]);
  v24 = (void *)cf;
  if (!cf)
    goto LABEL_56;
LABEL_27:
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    CFDictionaryAddValue((CFMutableDictionaryRef)v24, CFSTR("optional"), (const void *)*MEMORY[0x1E0C9AE50]);
  __b[0].__r_.__value_.__r.__words[0] = v3 + 376;
  __b[0].__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  v34 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(v3 + 376));
  if ((_DWORD)v34)
    Security::UnixError::throwMe(v34);
  __b[0].__r_.__value_.__s.__data_[8] = 1;
  Value = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("hash"));
  if (Value && CFDictionaryGetCount((CFDictionaryRef)cf) == 1)
  {
    v36 = v64;
    if (*(char *)(a1 + 95) < 0)
      std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)(a1 + 72), *(_QWORD *)(a1 + 80));
    else
      v61 = *(std::string *)(a1 + 72);
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)&__p, (char *)&v61);
    CFDictionaryAddValue(v36, __p.__r_.__value_.__l.__data_, Value);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    {
      v38 = (void *)v61.__r_.__value_.__r.__words[0];
      goto LABEL_64;
    }
  }
  else
  {
    v37 = v64;
    if (*(char *)(a1 + 95) < 0)
      std::string::__init_copy_ctor_external(&v60, *(const std::string::value_type **)(a1 + 72), *(_QWORD *)(a1 + 80));
    else
      v60 = *(std::string *)(a1 + 72);
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)&__p, (char *)&v60);
    CFDictionaryAddValue(v37, __p.__r_.__value_.__l.__data_, cf);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    {
      v38 = (void *)v60.__r_.__value_.__r.__words[0];
LABEL_64:
      operator delete(v38);
    }
  }
  Security::CodeSigning::SecStaticCode::reportProgress(*(Security::CodeSigning::SecStaticCode **)(v3 + 16));
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)__b);
  Security::CFRef<__CFDictionary *>::~CFRef(&cf);
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v64);
}

@end
