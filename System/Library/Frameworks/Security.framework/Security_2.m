CFDataRef Security::CodeSigning::SingleDiskRep::identification(Security::CodeSigning::SingleDiskRep *this)
{
  __int128 v2;
  unsigned int *v3;
  uint64_t v4;
  char v5;
  CC_SHA1_CTX v7;
  int v8;
  char v9;
  _BYTE md[24];
  void *v11;
  CC_SHA1_CTX *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.data[9] = v2;
  *(_OWORD *)&v7.data[13] = v2;
  *(_OWORD *)&v7.data[1] = v2;
  *(_OWORD *)&v7.data[5] = v2;
  *(_OWORD *)&v7.h0 = v2;
  *(_OWORD *)&v7.h4 = v2;
  CC_SHA1_Init(&v7);
  v3 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(_QWORD *)this + 144))(this);
  Security::UnixPlusPlus::FileDesc::seek((Security::UnixPlusPlus::FileDesc *)*v3, 0);
  v4 = (*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(_QWORD *)this + 144))(this);
  v5 = *(_BYTE *)(v4 + 4);
  v8 = *(_DWORD *)v4;
  v9 = v5;
  *(_QWORD *)md = MEMORY[0x1E0C809B0];
  *(_QWORD *)&md[8] = 0x40000000;
  *(_QWORD *)&md[16] = ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke;
  v11 = &__block_descriptor_tmp_14941;
  v12 = &v7;
  Security::CodeSigning::scanFileData(&v8, 0, (uint64_t)md);
  memset(md, 170, 20);
  CC_SHA1_Final(md, &v7);
  return CFDataCreate(0, md, 20);
}

void Security::CodeSigning::SingleDiskRep::mainExecutablePath(Security::CodeSigning::SingleDiskRep *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 39) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 2), *((_QWORD *)this + 3));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 1);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 4);
  }
}

CFURLRef Security::CodeSigning::SingleDiskRep::copyCanonicalPath(Security::CodeSigning::SingleDiskRep *this, uint64_t a2, uint64_t a3, const __CFURL *a4)
{
  char *v4;
  char *v5;
  char *v6;

  v6 = (char *)*((_QWORD *)this + 2);
  v4 = (char *)this + 16;
  v5 = v6;
  if (v4[23] < 0)
    v4 = v5;
  return Security::makeCFURL((Security *)v4, 0, 0, a4);
}

off_t Security::CodeSigning::SingleDiskRep::signingLimit(Security::CodeSigning::SingleDiskRep *this)
{
  unsigned int *v1;
  timespec v2;
  stat v4;

  v1 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(_QWORD *)this + 144))(this);
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v4.st_blksize = v2;
  *(timespec *)v4.st_qspare = v2;
  v4.st_birthtimespec = v2;
  *(timespec *)&v4.st_size = v2;
  v4.st_mtimespec = v2;
  v4.st_ctimespec = v2;
  *(timespec *)&v4.st_uid = v2;
  v4.st_atimespec = v2;
  *(timespec *)&v4.st_dev = v2;
  Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)*v1, &v4);
  return v4.st_size;
}

uint64_t Security::CodeSigning::SingleDiskRep::execSegLimit()
{
  return 0;
}

void Security::CodeSigning::SingleDiskRep::flush(Security::CodeSigning::SingleDiskRep *this)
{
  Security::UnixPlusPlus::FileDesc::close((Security::CodeSigning::SingleDiskRep *)((char *)this + 40));
}

void Security::CodeSigning::SingleDiskRep::recommendedIdentifier(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  Security::CodeSigning::DiskRep::canonicalIdentifier(a2, a1 + 16);
}

void Security::CodeSigning::SingleDiskRep::strictValidate(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int *v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  uint64_t *v18;
  unsigned int *v19;
  const char *v20;
  unsigned int *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  const __CFString *v25;
  const void *v26;

  Security::CodeSigning::DiskRep::strictValidate((uint64_t)a1, a2, a3, a4);
  if ((a4 & 0x1000000) != 0)
  {
    v8 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v8, "com.apple.ResourceFork"))
    {
      v9 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v9, "com.apple.ResourceFork");
    }
    v10 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v10, "com.apple.FinderInfo"))
    {
      v11 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v11, "com.apple.FinderInfo");
    }
  }
  if ((a4 & 0x200) != 0)
  {
    v14 = *(_QWORD *)(a3 + 8);
    v13 = a3 + 8;
    v12 = v14;
    if (!v14)
      goto LABEL_17;
    v15 = v13;
    do
    {
      v16 = *(_DWORD *)(v12 + 28);
      v17 = v16 < -66999;
      if (v16 >= -66999)
        v18 = (uint64_t *)v12;
      else
        v18 = (uint64_t *)(v12 + 8);
      if (!v17)
        v15 = v12;
      v12 = *v18;
    }
    while (*v18);
    if (v15 == v13 || *(int *)(v15 + 28) > -66999)
    {
LABEL_17:
      v19 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1);
      v20 = "com.apple.ResourceFork";
      if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v19, "com.apple.ResourceFork")|| (v21 = (unsigned int *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 144))(a1), v20 = "com.apple.FinderInfo", Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v21, "com.apple.FinderInfo")))
      {
        v24 = a1 + 16;
        if (a1[39] < 0)
          v24 = (_QWORD *)*v24;
        v25 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Disallowed xattr %s found on %s"), v20, v24);
        Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, (uint64_t)CFSTR("SecCSResourceHasSidebandData"), v25, v26);
      }
    }
  }
  if (a2)
  {
    if (bswap32(*(_DWORD *)(a2 + 8)) >> 8 >= 0x203 && (v22 = *(_QWORD *)(a2 + 56)) != 0)
      v23 = bswap64(v22);
    else
      v23 = bswap32(*(_DWORD *)(a2 + 32));
    if (v23 != (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1))
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
  }
}

uint64_t ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 32), a2, a3);
}

Security::UnixPlusPlus::FileDesc *Security::CodeSigning::SingleDiskRep::Writer::fd(Security::CodeSigning::SingleDiskRep::Writer *this)
{
  Security::UnixPlusPlus::FileDesc *v1;
  uint64_t v2;
  std::string *p_p;
  std::string __p;

  v1 = (Security::CodeSigning::SingleDiskRep::Writer *)((char *)this + 96);
  if (*((_DWORD *)this + 24) == -1)
  {
    v2 = *((_QWORD *)this + 3);
    if (*(char *)(v2 + 39) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v2 + 16), *(_QWORD *)(v2 + 24));
    else
      __p = *(std::string *)(v2 + 16);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    Security::UnixPlusPlus::FileDesc::open(v1, (const char *)p_p, 2, 438);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v1;
}

void sub_18AA50804(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::Requirement::Reader::getData(Security::CodeSigning::Requirement::Reader *this, const void **a2, unint64_t *a3)
{
  uint64_t result;
  uint64_t v7;

  result = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  *a3 = result;
  v7 = *((unsigned int *)this + 2);
  if (v7 + (unint64_t)result > bswap32(*(_DWORD *)(*(_QWORD *)this + 4)))
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  *a2 = (const void *)(*(_QWORD *)this + v7);
  *((_DWORD *)this + 2) = ((result - 1) & 0xFFFFFFFC) + v7 + 4;
  return result;
}

_QWORD *Security::CodeSigning::Requirement::Reader::getString(Security::CodeSigning::Requirement::Reader *this, Security::CodeSigning::Requirement::Reader *a2)
{
  size_t v4;
  void *v5;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(a2, (const void **)&v5, &v4);
  return std::string::basic_string[abi:ne180100](this, v5, v4);
}

void Security::CodeSigning::CSError::~CSError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E1FC8E38;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E1FC8E38;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x18D76FAA0);
}

void Security::CodeSigning::CSError::throwMe(Security::CodeSigning::CSError *this, uint64_t a2, const __CFString *a3, const void *a4)
{
  int v5;
  Security::CodeSigning::CSError *exception;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;

  v5 = (int)this;
  exception = (Security::CodeSigning::CSError *)__cxa_allocate_exception(0xA0uLL);
  v14 = Security::cfmake<__CFDictionary const*>((uint64_t)"{%O=%O}", v7, v8, v9, v10, v11, v12, v13, a2);
  Security::CodeSigning::CSError::CSError(exception, v5, v14);
}

void sub_18AA509BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::CSError::augment(Security::CodeSigning::CSError *this, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9;
  const void *v10;

  v9 = Security::cfmake<__CFDictionary const*>((uint64_t)"{+%O,%O=%O}", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *((_QWORD *)this + 19));
  v10 = (const void *)*((_QWORD *)this + 19);
  if (v10)
    CFRelease(v10);
  *((_QWORD *)this + 19) = v9;
}

uint64_t Security::CodeSigning::CSError::cfError(CFDictionaryRef *this, __CFError **a2)
{
  const __CFString *v4;
  int v5;

  if (a2)
  {
    v4 = (const __CFString *)*MEMORY[0x1E0C9AFC8];
    v5 = (*((uint64_t (**)(CFDictionaryRef *))*this + 3))(this);
    *a2 = CFErrorCreate(0, v4, v5, this[19]);
  }
  return (*((uint64_t (**)(CFDictionaryRef *))*this + 3))(this);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80088](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C80098](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C800A8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1E0C80100](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigest()
{
  return MEMORY[0x1E0C80128]();
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x1E0C80130]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x1E0C80138]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1E0C80140]();
}

uint64_t CCDigestOutputSize()
{
  return MEMORY[0x1E0C80150]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1E0C80158]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x1E0C801F8](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x1E0C80200](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x1E0C80218](ctx, data, dataLength);
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1E0C80240](*(_QWORD *)&algorithm, password, passwordLen, salt, saltLen, *(_QWORD *)&prf, *(_QWORD *)&rounds, derivedKey);
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x1E0C802B8]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  return MEMORY[0x1E0C802F0](md, c);
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  return MEMORY[0x1E0C802F8](c);
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80300](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
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

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80348](data, *(_QWORD *)&len, md);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80350](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80358](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80360](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80388](data, *(_QWORD *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80390](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80398](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803A0](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C803A8](data, *(_QWORD *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

uint64_t CEAcquireManagedContext()
{
  return MEMORY[0x1E0DDFEB0]();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x1E0DDFEB8]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x1E0DDFEC8]();
}

uint64_t CEDeserialize()
{
  return MEMORY[0x1E0DDFEE0]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x1E0DDFEE8]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x1E0DDFEF0]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x1E0DDFEF8]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x1E0DDFF10]();
}

uint64_t CESerializeWithOptions()
{
  return MEMORY[0x1E0DDFF18]();
}

uint64_t CESerializeXML()
{
  return MEMORY[0x1E0DDFF20]();
}

uint64_t CESizeDeserialization()
{
  return MEMORY[0x1E0DDFF28]();
}

uint64_t CESizeSerialization()
{
  return MEMORY[0x1E0DDFF30]();
}

uint64_t CESizeXMLSerialization()
{
  return MEMORY[0x1E0DDFF38]();
}

uint64_t CEValidate()
{
  return MEMORY[0x1E0DDFF40]();
}

uint64_t CEValidateWithOptions()
{
  return MEMORY[0x1E0DDFF48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  MEMORY[0x1E0C97CB8](allocator, context);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C97FF0](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980B0](bundle);
}

CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980C8](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1E0C98108](bundle, functionName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeID CFBundleGetTypeID(void)
{
  return MEMORY[0x1E0C98170]();
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x1E0C98190](bundle);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return MEMORY[0x1E0C98198](bundle);
}

void CFBundleUnloadExecutable(CFBundleRef bundle)
{
  MEMORY[0x1E0C981C0](bundle);
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

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982C0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x1E0C98360]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x1E0C983D0](theData, range.location, range.length);
}

CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x1E0C983D8](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x1E0C98428](theData, range.location, range.length, newBytes, newLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98480](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0C984C8](formatter, key, value);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  CFTimeInterval result;

  MEMORY[0x1E0C984E0](theDate, otherDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AC8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98DA0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetReplaceValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE8](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
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

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
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

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99290](allocator, ti);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99438](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
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

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD48](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
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

fat_arch *__cdecl NXFindBestFatArch(cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1E0C805D8](*(_QWORD *)&cputype, *(_QWORD *)&cpusubtype, fat_archs, *(_QWORD *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1E0C805E0](*(_QWORD *)&cputype, *(_QWORD *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1E0C805E8](name);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
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

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFBundleCreateWithExecutableURLIfMightBeBundle()
{
  return MEMORY[0x1E0C9A000]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x1E0C9A1C0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41E0](this, __pos1, __n1, __s);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string *__str, std::string::size_type __pos2, std::string::size_type __n2)
{
  return MEMORY[0x1E0DE41E8](this, __pos1, __n1, __str, __pos2, __n2);
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
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4298](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
  MEMORY[0x1E0DE42E0](this);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE42F0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x1E0DE42F8](this);
}

std::exception_ptr *__cdecl std::exception_ptr::operator=(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE4300](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
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
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1E0DE4DF0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x1E0DE4DF8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E1FC5CA0();
}

void operator delete(void *__p)
{
  off_1E1FC5CA8(__p);
}

uint64_t operator delete()
{
  return off_1E1FC5CB0();
}

uint64_t operator new[]()
{
  return off_1E1FC5CB8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E1FC5CC0(__sz);
}

uint64_t operator new()
{
  return off_1E1FC5CC8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t __dtoa()
{
  return MEMORY[0x1E0C80AB8]();
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __freedtoa()
{
  return MEMORY[0x1E0C80B08]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1E0C80BC0]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1E0C80E60](*(_QWORD *)&image_index);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
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

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C816E0](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1E0C81828](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C81870]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1E0C81878]();
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x1E0C81898]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1E0C818A0]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1E0C818A8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t ccansikdf_x963()
{
  return MEMORY[0x1E0C818D8]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x1E0C81910]();
}

uint64_t cccurve25519_make_key_pair()
{
  return MEMORY[0x1E0C819A0]();
}

uint64_t cccurve25519_make_pub_with_rng()
{
  return MEMORY[0x1E0C819B8]();
}

uint64_t cccurve25519_with_rng()
{
  return MEMORY[0x1E0C819C0]();
}

uint64_t cccurve448()
{
  return MEMORY[0x1E0C819C8]();
}

uint64_t cccurve448_make_key_pair()
{
  return MEMORY[0x1E0C819D0]();
}

uint64_t cccurve448_make_pub()
{
  return MEMORY[0x1E0C819E0]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1E0C819E8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1E0C81A08]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1E0C81A10]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1E0C81A18]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x1E0C81A20]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1E0C81A28]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1E0C81A40]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1E0C81A58]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1E0C81A70]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1E0C81A88]();
}

uint64_t ccder_decode_seqii()
{
  return MEMORY[0x1E0C81A90]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x1E0C81A98]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1E0C81AA0]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1E0C81AA8]();
}

uint64_t ccder_decode_uint64()
{
  return MEMORY[0x1E0C81AB0]();
}

uint64_t ccder_encode_body()
{
  return MEMORY[0x1E0C81AB8]();
}

uint64_t ccder_encode_body_nocopy()
{
  return MEMORY[0x1E0C81AC0]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1E0C81AC8]();
}

uint64_t ccder_encode_implicit_raw_octet_string()
{
  return MEMORY[0x1E0C81AE0]();
}

uint64_t ccder_encode_integer()
{
  return MEMORY[0x1E0C81AE8]();
}

uint64_t ccder_encode_tl()
{
  return MEMORY[0x1E0C81B08]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1E0C81B10]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1E0C81B18]();
}

uint64_t ccder_sizeof_implicit_raw_octet_string()
{
  return MEMORY[0x1E0C81B20]();
}

uint64_t ccder_sizeof_integer()
{
  return MEMORY[0x1E0C81B30]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1E0C81B38]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1E0C81B40]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1E0C81B48]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1E0C81B50]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1E0C81B68]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81B70]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1E0C81B90]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1E0C81BA0]();
}

uint64_t ccdh_gp_size()
{
  return MEMORY[0x1E0C81BB8]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1E0C81BC0]();
}

uint64_t ccdh_init_gp_from_bytes()
{
  return MEMORY[0x1E0C81BC8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C81BD8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C81BE0]();
}

uint64_t ccec_compact_export()
{
  return MEMORY[0x1E0C81BF0]();
}

uint64_t ccec_compact_generate_key()
{
  return MEMORY[0x1E0C81C00]();
}

uint64_t ccec_compact_import_priv()
{
  return MEMORY[0x1E0C81C08]();
}

uint64_t ccec_compact_import_priv_size()
{
  return MEMORY[0x1E0C81C10]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1E0C81C18]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1E0C81C30]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1E0C81C38]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1E0C81C40]();
}

uint64_t ccec_compute_key()
{
  return MEMORY[0x1E0C81C48]();
}

uint64_t ccec_cp_192()
{
  return MEMORY[0x1E0C81C50]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1E0C81C58]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_curve_for_length_lookup()
{
  return MEMORY[0x1E0C81C78]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x1E0C81CA8]();
}

uint64_t ccec_der_import_priv_keytype()
{
  return MEMORY[0x1E0C81CB0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1E0C81CD8]();
}

uint64_t ccec_generate_key_deterministic()
{
  return MEMORY[0x1E0C81CF8]();
}

uint64_t ccec_generate_key_fips()
{
  return MEMORY[0x1E0C81D00]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1E0C81D18]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C81D28]();
}

uint64_t ccec_rfc6637_unwrap_key()
{
  return MEMORY[0x1E0C81D68]();
}

uint64_t ccec_rfc6637_wrap_key()
{
  return MEMORY[0x1E0C81D80]();
}

uint64_t ccec_rfc6637_wrap_key_size()
{
  return MEMORY[0x1E0C81D90]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1E0C81DA8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1E0C81DD0]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1E0C81DF0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C81E00]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1E0C81E08]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1E0C81E10]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81E20]();
}

uint64_t ccecies_decrypt_gcm()
{
  return MEMORY[0x1E0C81E28]();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return MEMORY[0x1E0C81E38]();
}

uint64_t ccecies_encrypt_gcm()
{
  return MEMORY[0x1E0C81E48]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1E0C81E50]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1E0C81E60]();
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1E0C81E70]();
}

uint64_t cced25519_make_pub_with_rng()
{
  return MEMORY[0x1E0C81E80]();
}

uint64_t cced25519_sign_with_rng()
{
  return MEMORY[0x1E0C81E90]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x1E0C81E98]();
}

uint64_t cced448_make_key_pair()
{
  return MEMORY[0x1E0C81EA0]();
}

uint64_t cced448_make_pub()
{
  return MEMORY[0x1E0C81EA8]();
}

uint64_t cced448_sign()
{
  return MEMORY[0x1E0C81EB0]();
}

uint64_t cced448_verify()
{
  return MEMORY[0x1E0C81EB8]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1E0C81EF8]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1E0C82090]();
}

uint64_t cchmac()
{
  return MEMORY[0x1E0C820A8]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1E0C820B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1E0C820B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1E0C820C0]();
}

uint64_t cckem_decapsulate()
{
  return MEMORY[0x1E0C82128]();
}

uint64_t cckem_encapsulate()
{
  return MEMORY[0x1E0C82130]();
}

uint64_t cckem_encapsulated_key_nbytes_ctx()
{
  return MEMORY[0x1E0C82138]();
}

uint64_t cckem_encapsulated_key_nbytes_info()
{
  return MEMORY[0x1E0C82140]();
}

uint64_t cckem_export_privkey()
{
  return MEMORY[0x1E0C82148]();
}

uint64_t cckem_export_pubkey()
{
  return MEMORY[0x1E0C82150]();
}

uint64_t cckem_full_ctx_init()
{
  return MEMORY[0x1E0C82158]();
}

uint64_t cckem_generate_key()
{
  return MEMORY[0x1E0C82160]();
}

uint64_t cckem_import_privkey()
{
  return MEMORY[0x1E0C82168]();
}

uint64_t cckem_import_pubkey()
{
  return MEMORY[0x1E0C82170]();
}

uint64_t cckem_kyber1024()
{
  return MEMORY[0x1E0C82178]();
}

uint64_t cckem_kyber768()
{
  return MEMORY[0x1E0C82180]();
}

uint64_t cckem_privkey_nbytes_ctx()
{
  return MEMORY[0x1E0C82188]();
}

uint64_t cckem_privkey_nbytes_info()
{
  return MEMORY[0x1E0C82190]();
}

uint64_t cckem_pubkey_nbytes_ctx()
{
  return MEMORY[0x1E0C821A0]();
}

uint64_t cckem_pubkey_nbytes_info()
{
  return MEMORY[0x1E0C821A8]();
}

uint64_t cckem_public_ctx()
{
  return MEMORY[0x1E0C821B0]();
}

uint64_t cckem_shared_key_nbytes_ctx()
{
  return MEMORY[0x1E0C821B8]();
}

uint64_t cckem_shared_key_nbytes_info()
{
  return MEMORY[0x1E0C821C0]();
}

uint64_t cckem_sizeof_full_ctx()
{
  return MEMORY[0x1E0C821C8]();
}

uint64_t cckem_sizeof_pub_ctx()
{
  return MEMORY[0x1E0C821D0]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C821F0]();
}

uint64_t ccn_add()
{
  return MEMORY[0x1E0C821F8]();
}

uint64_t ccn_add1()
{
  return MEMORY[0x1E0C82200]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1E0C82208]();
}

uint64_t ccn_cmpn()
{
  return MEMORY[0x1E0C82218]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C82220]();
}

uint64_t ccn_set_bit()
{
  return MEMORY[0x1E0C82228]();
}

uint64_t ccn_write_int()
{
  return MEMORY[0x1E0C82240]();
}

uint64_t ccn_write_int_size()
{
  return MEMORY[0x1E0C82248]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1E0C82250]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1E0C82258]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1E0C82268]();
}

uint64_t ccn_zero()
{
  return MEMORY[0x1E0C82270]();
}

uint64_t ccoid_equal()
{
  return MEMORY[0x1E0C82280]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1E0C82288]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x1E0C822C0]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x1E0C822C8]();
}

uint64_t ccrsa_eme_pkcs1v15_decode()
{
  return MEMORY[0x1E0C822D0]();
}

uint64_t ccrsa_eme_pkcs1v15_decode_safe()
{
  return MEMORY[0x1E0C822D8]();
}

uint64_t ccrsa_eme_pkcs1v15_encode()
{
  return MEMORY[0x1E0C822E0]();
}

uint64_t ccrsa_emsa_pkcs1v15_encode()
{
  return MEMORY[0x1E0C822E8]();
}

uint64_t ccrsa_emsa_pkcs1v15_verify()
{
  return MEMORY[0x1E0C822F0]();
}

uint64_t ccrsa_emsa_pss_decode()
{
  return MEMORY[0x1E0C822F8]();
}

uint64_t ccrsa_emsa_pss_encode()
{
  return MEMORY[0x1E0C82300]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x1E0C82310]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x1E0C82318]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x1E0C82320]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x1E0C82330]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x1E0C82338]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1E0C82340]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1E0C82348]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x1E0C82358]();
}

uint64_t ccrsa_oaep_decode()
{
  return MEMORY[0x1E0C82360]();
}

uint64_t ccrsa_oaep_encode()
{
  return MEMORY[0x1E0C82368]();
}

uint64_t ccrsa_priv_crypt()
{
  return MEMORY[0x1E0C82370]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1E0C82378]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1E0C82388]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1E0C823D8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C823E8]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1E0C825A0]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1E0C825A8]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1E0C825B0]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1E0C825B8]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1E0C82B38](s, *(_QWORD *)&flag, src);
}

uint64_t csops()
{
  return MEMORY[0x1E0C82B68]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C82B70]();
}

uint64_t csr_check()
{
  return MEMORY[0x1E0C82B78]();
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x1E0DDFF50]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x1E0DDFF58]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x1E0DDFF60]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x1E0DDFF68]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x1E0DDFF70]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x1E0DDFF78]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x1E0DDFF80]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x1E0DDFF88]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x1E0DDFF90]();
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x1E0C82B98](a1, a2);
  return result;
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1E0C82BA0](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C833F8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

long double frexp(long double __x, int *__e)
{
  long double result;

  MEMORY[0x1E0C834E8](__e, __x);
  return result;
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1E0C835B8](a1, a2, *(_QWORD *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
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

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C844A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C84918](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C85080](a1, a2, *(_QWORD *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1E0C85090](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x1E0C85098](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1E0C85330](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
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

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
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

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_system_errno(sqlite3 *a1)
{
  return MEMORY[0x1E0DE89D0](a1);
}

uint64_t sslCipherSuiteGetMacSize()
{
  return MEMORY[0x1E0DE5338]();
}

uint64_t sslCipherSuiteGetSymmetricCipherBlockIvSize()
{
  return MEMORY[0x1E0DE5340]();
}

uint64_t sslCipherSuiteGetSymmetricCipherKeySize()
{
  return MEMORY[0x1E0DE5348]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C855D8](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1E0C85970](__b1, __b2, __len);
}

uint64_t tls_cache_cleanup()
{
  return MEMORY[0x1E0DE5350]();
}

uint64_t tls_cache_create()
{
  return MEMORY[0x1E0DE5358]();
}

uint64_t tls_cache_delete_session_data()
{
  return MEMORY[0x1E0DE5360]();
}

uint64_t tls_cache_empty()
{
  return MEMORY[0x1E0DE5368]();
}

uint64_t tls_cache_load_session_data()
{
  return MEMORY[0x1E0DE5370]();
}

uint64_t tls_cache_save_session_data()
{
  return MEMORY[0x1E0DE5378]();
}

uint64_t tls_handshake_close()
{
  return MEMORY[0x1E0DE5380]();
}

uint64_t tls_handshake_continue()
{
  return MEMORY[0x1E0DE5388]();
}

uint64_t tls_handshake_create()
{
  return MEMORY[0x1E0DE5390]();
}

uint64_t tls_handshake_destroy()
{
  return MEMORY[0x1E0DE5398]();
}

uint64_t tls_handshake_get_ciphersuites()
{
  return MEMORY[0x1E0DE53A0]();
}

uint64_t tls_handshake_get_max_protocol_version()
{
  return MEMORY[0x1E0DE53A8]();
}

uint64_t tls_handshake_get_min_dh_group_size()
{
  return MEMORY[0x1E0DE53B0]();
}

uint64_t tls_handshake_get_min_protocol_version()
{
  return MEMORY[0x1E0DE53B8]();
}

uint64_t tls_handshake_get_negotiated_cipherspec()
{
  return MEMORY[0x1E0DE53C0]();
}

uint64_t tls_handshake_get_negotiated_curve()
{
  return MEMORY[0x1E0DE53C8]();
}

uint64_t tls_handshake_get_peer_acceptable_client_auth_type()
{
  return MEMORY[0x1E0DE53D0]();
}

uint64_t tls_handshake_get_peer_acceptable_dn_list()
{
  return MEMORY[0x1E0DE53D8]();
}

uint64_t tls_handshake_get_peer_alpn_data()
{
  return MEMORY[0x1E0DE53E0]();
}

uint64_t tls_handshake_get_peer_hostname()
{
  return MEMORY[0x1E0DE53E8]();
}

uint64_t tls_handshake_get_peer_npn_data()
{
  return MEMORY[0x1E0DE53F0]();
}

uint64_t tls_handshake_get_peer_signature_algorithms()
{
  return MEMORY[0x1E0DE53F8]();
}

uint64_t tls_handshake_get_server_identity_change()
{
  return MEMORY[0x1E0DE5400]();
}

uint64_t tls_handshake_get_session_match()
{
  return MEMORY[0x1E0DE5408]();
}

uint64_t tls_handshake_get_session_warning()
{
  return MEMORY[0x1E0DE5410]();
}

uint64_t tls_handshake_get_sni_hostname()
{
  return MEMORY[0x1E0DE5418]();
}

uint64_t tls_handshake_internal_client_random()
{
  return MEMORY[0x1E0DE5420]();
}

uint64_t tls_handshake_internal_master_secret()
{
  return MEMORY[0x1E0DE5428]();
}

uint64_t tls_handshake_internal_prf()
{
  return MEMORY[0x1E0DE5430]();
}

uint64_t tls_handshake_internal_server_random()
{
  return MEMORY[0x1E0DE5438]();
}

uint64_t tls_handshake_internal_set_master_secret_function()
{
  return MEMORY[0x1E0DE5440]();
}

uint64_t tls_handshake_internal_set_session_ticket()
{
  return MEMORY[0x1E0DE5448]();
}

uint64_t tls_handshake_negotiate()
{
  return MEMORY[0x1E0DE5450]();
}

uint64_t tls_handshake_process()
{
  return MEMORY[0x1E0DE5458]();
}

uint64_t tls_handshake_request_renegotiation()
{
  return MEMORY[0x1E0DE5460]();
}

uint64_t tls_handshake_retransmit_timer_expired()
{
  return MEMORY[0x1E0DE5468]();
}

uint64_t tls_handshake_send_alert()
{
  return MEMORY[0x1E0DE5470]();
}

uint64_t tls_handshake_set_acceptable_dn_list()
{
  return MEMORY[0x1E0DE5478]();
}

uint64_t tls_handshake_set_alpn_data()
{
  return MEMORY[0x1E0DE5480]();
}

uint64_t tls_handshake_set_callbacks()
{
  return MEMORY[0x1E0DE5488]();
}

uint64_t tls_handshake_set_ciphersuites()
{
  return MEMORY[0x1E0DE5490]();
}

uint64_t tls_handshake_set_client_auth()
{
  return MEMORY[0x1E0DE5498]();
}

uint64_t tls_handshake_set_config()
{
  return MEMORY[0x1E0DE54A0]();
}

uint64_t tls_handshake_set_curves()
{
  return MEMORY[0x1E0DE54A8]();
}

uint64_t tls_handshake_set_dh_parameters()
{
  return MEMORY[0x1E0DE54B0]();
}

uint64_t tls_handshake_set_fallback()
{
  return MEMORY[0x1E0DE54B8]();
}

uint64_t tls_handshake_set_false_start()
{
  return MEMORY[0x1E0DE54C0]();
}

uint64_t tls_handshake_set_max_protocol_version()
{
  return MEMORY[0x1E0DE54C8]();
}

uint64_t tls_handshake_set_min_dh_group_size()
{
  return MEMORY[0x1E0DE54D0]();
}

uint64_t tls_handshake_set_min_protocol_version()
{
  return MEMORY[0x1E0DE54D8]();
}

uint64_t tls_handshake_set_mtu()
{
  return MEMORY[0x1E0DE54E0]();
}

uint64_t tls_handshake_set_npn_data()
{
  return MEMORY[0x1E0DE54E8]();
}

uint64_t tls_handshake_set_npn_enable()
{
  return MEMORY[0x1E0DE54F0]();
}

uint64_t tls_handshake_set_ocsp_enable()
{
  return MEMORY[0x1E0DE54F8]();
}

uint64_t tls_handshake_set_ocsp_response()
{
  return MEMORY[0x1E0DE5500]();
}

uint64_t tls_handshake_set_peer_hostname()
{
  return MEMORY[0x1E0DE5508]();
}

uint64_t tls_handshake_set_peer_trust()
{
  return MEMORY[0x1E0DE5510]();
}

uint64_t tls_handshake_set_psk_identity()
{
  return MEMORY[0x1E0DE5518]();
}

uint64_t tls_handshake_set_psk_secret()
{
  return MEMORY[0x1E0DE5520]();
}

uint64_t tls_handshake_set_renegotiation()
{
  return MEMORY[0x1E0DE5528]();
}

uint64_t tls_handshake_set_resumption()
{
  return MEMORY[0x1E0DE5530]();
}

uint64_t tls_handshake_set_sct_enable()
{
  return MEMORY[0x1E0DE5538]();
}

uint64_t tls_handshake_set_server_identity_change()
{
  return MEMORY[0x1E0DE5540]();
}

uint64_t tls_handshake_set_session_ticket_enabled()
{
  return MEMORY[0x1E0DE5548]();
}

uint64_t tls_helper_create_peer_trust()
{
  return MEMORY[0x1E0DE55D0]();
}

uint64_t tls_helper_set_identity_from_array()
{
  return MEMORY[0x1E0DE55D8]();
}

uint64_t tls_helper_set_peer_pubkey()
{
  return MEMORY[0x1E0DE55E0]();
}

uint64_t tls_record_advance_read_cipher()
{
  return MEMORY[0x1E0DE5550]();
}

uint64_t tls_record_advance_write_cipher()
{
  return MEMORY[0x1E0DE5558]();
}

uint64_t tls_record_create()
{
  return MEMORY[0x1E0DE5560]();
}

uint64_t tls_record_decrypt()
{
  return MEMORY[0x1E0DE5568]();
}

uint64_t tls_record_decrypted_size()
{
  return MEMORY[0x1E0DE5570]();
}

uint64_t tls_record_destroy()
{
  return MEMORY[0x1E0DE5578]();
}

uint64_t tls_record_encrypt()
{
  return MEMORY[0x1E0DE5580]();
}

uint64_t tls_record_encrypted_size()
{
  return MEMORY[0x1E0DE5588]();
}

uint64_t tls_record_get_header_size()
{
  return MEMORY[0x1E0DE5590]();
}

uint64_t tls_record_init_pending_ciphers()
{
  return MEMORY[0x1E0DE5598]();
}

uint64_t tls_record_parse_header()
{
  return MEMORY[0x1E0DE55A0]();
}

uint64_t tls_record_parse_ssl2_header()
{
  return MEMORY[0x1E0DE55A8]();
}

uint64_t tls_record_rollback_write_cipher()
{
  return MEMORY[0x1E0DE55B0]();
}

uint64_t tls_record_set_protocol_version()
{
  return MEMORY[0x1E0DE55B8]();
}

uint64_t tls_record_set_record_splitting()
{
  return MEMORY[0x1E0DE55C0]();
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C859C0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x1E0C85BB8](*(_QWORD *)&a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1E0C85E40](xarray, index, length);
}

uint64_t xpc_array_get_pointer()
{
  return MEMORY[0x1E0C85E68]();
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C85EA8](xarray, index, bytes, length);
}

uint64_t xpc_array_set_pointer()
{
  return MEMORY[0x1E0C85EC8]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_create_with_format()
{
  return MEMORY[0x1E0C86170]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C86748](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

