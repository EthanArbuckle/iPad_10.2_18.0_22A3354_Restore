void sub_189B02680(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,geo::small_vector<GeoCodecsMetadata,2ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,geo::small_vector<GeoCodecsMetadata,2ul>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,geo::small_vector<GeoCodecsMetadata,2ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,geo::small_vector<GeoCodecsMetadata,2ul>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = (void *)v2[3];
      if (v3 != (void *)v2[5])
        free(v3);
    }
    operator delete(v2);
  }
  return a1;
}

uint64_t geo::codec::PBDataReaderObjC::resetBuffer(uint64_t this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    if (a3)
    {
      v3 = this;
      v4 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
      this = objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v4);
      *(_QWORD *)(v3 + 8) = this;
    }
  }
  return this;
}

BOOL geo::codec::PBDataReaderObjC::hasError(geo::codec::PBDataReaderObjC *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  return !v1 || *(_BYTE *)(v1 + (int)*MEMORY[0x1E0D82BC8]) != 0;
}

BOOL geo::codec::PBDataReaderObjC::hasMoreData(geo::codec::PBDataReaderObjC *this)
{
  uint64_t v2;

  if (((*(uint64_t (**)(geo::codec::PBDataReaderObjC *))(*(_QWORD *)this + 24))(this) & 1) != 0)
    return 0;
  v2 = *((_QWORD *)this + 1);
  return v2
      && *(_QWORD *)(v2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(v2 + (int)*MEMORY[0x1E0D82BD8])
      && *(_BYTE *)(v2 + (int)*MEMORY[0x1E0D82BC8]) == 0;
}

BOOL geo::codec::PBDataReaderObjC::skip(geo::codec::PBDataReaderObjC *this, uint64_t a2)
{
  uint64_t v2;
  int *v4;

  v2 = *((_QWORD *)this + 1);
  if (!v2)
    return 0;
  v4 = (int *)MEMORY[0x1E0D82BF0];
  *(_QWORD *)(v2 + (int)*MEMORY[0x1E0D82BF0]) += a2;
  return ((*(uint64_t (**)(geo::codec::PBDataReaderObjC *))(*(_QWORD *)this + 32))(this) & 1) != 0
      || *(_QWORD *)(*((_QWORD *)this + 1) + *v4) == *(_QWORD *)(*((_QWORD *)this + 1) + (int)*MEMORY[0x1E0D82BD8]);
}

unint64_t geo::codec::PBDataReaderObjC::readString@<X0>(geo::codec::PBDataReaderObjC *this@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;
  const char *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  result = *((_QWORD *)this + 1);
  if (!result || (result = PBReaderReadString()) == 0)
  {
    a2[23] = 0;
    *a2 = 0;
    return result;
  }
  v4 = (const char *)objc_msgSend((id)result, "UTF8String");
  result = strlen(v4);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    *((_QWORD *)a2 + 1) = v5;
    *((_QWORD *)a2 + 2) = v7 | 0x8000000000000000;
    *(_QWORD *)a2 = v8;
    a2 = v8;
  }
  else
  {
    a2[23] = result;
    if (!result)
      goto LABEL_12;
  }
  result = (unint64_t)memmove(a2, v4, v5);
LABEL_12:
  a2[v5] = 0;
  return result;
}

uint64_t geo::codec::PBDataReaderObjC::readVarInt(geo::codec::PBDataReaderObjC *this)
{
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  int *v5;
  int *v6;
  int *v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = (int *)MEMORY[0x1E0D82BF0];
  v3 = (int)*MEMORY[0x1E0D82BF0];
  v4 = *(_QWORD *)(v1 + v3);
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (v4 == -1 || (v6 = (int *)MEMORY[0x1E0D82BD8], v4 >= *(_QWORD *)(v1 + (int)*MEMORY[0x1E0D82BD8])))
  {
    v10 = 0;
  }
  else
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    v8 = v4 + 1;
    v9 = *(_BYTE *)(*(_QWORD *)(v1 + (int)*MEMORY[0x1E0D82BB8]) + v4);
    *(_QWORD *)(v1 + v3) = v8;
    v10 = v9 & 0x7F;
    if ((v9 & 0x80) == 0)
      goto LABEL_5;
    v12 = *v2;
    v13 = *(_QWORD *)(v1 + v12);
    if (v13 == -1 || v13 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v14 = v13 + 1;
    v15 = *(char *)(*(_QWORD *)(v1 + *v7) + v13);
    *(_QWORD *)(v1 + v12) = v14;
    v10 |= (unint64_t)(v15 & 0x7F) << 7;
    if ((v15 & 0x80000000) == 0)
      goto LABEL_5;
    v16 = *v2;
    v17 = *(_QWORD *)(v1 + v16);
    if (v17 == -1 || v17 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v18 = v17 + 1;
    v19 = *(char *)(*(_QWORD *)(v1 + *v7) + v17);
    *(_QWORD *)(v1 + v16) = v18;
    v10 |= (unint64_t)(v19 & 0x7F) << 14;
    if ((v19 & 0x80000000) == 0)
      goto LABEL_5;
    v20 = *v2;
    v21 = *(_QWORD *)(v1 + v20);
    if (v21 == -1 || v21 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v22 = v21 + 1;
    v23 = *(char *)(*(_QWORD *)(v1 + *v7) + v21);
    *(_QWORD *)(v1 + v20) = v22;
    v10 |= (unint64_t)(v23 & 0x7F) << 21;
    if ((v23 & 0x80000000) == 0)
      goto LABEL_5;
    v24 = *v2;
    v25 = *(_QWORD *)(v1 + v24);
    if (v25 == -1 || v25 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v26 = v25 + 1;
    v27 = *(char *)(*(_QWORD *)(v1 + *v7) + v25);
    *(_QWORD *)(v1 + v24) = v26;
    v10 |= (unint64_t)(v27 & 0x7F) << 28;
    if ((v27 & 0x80000000) == 0)
      goto LABEL_5;
    v28 = *v2;
    v29 = *(_QWORD *)(v1 + v28);
    if (v29 == -1 || v29 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v30 = v29 + 1;
    v31 = *(char *)(*(_QWORD *)(v1 + *v7) + v29);
    *(_QWORD *)(v1 + v28) = v30;
    v10 |= (unint64_t)(v31 & 0x7F) << 35;
    if ((v31 & 0x80000000) == 0)
      goto LABEL_5;
    v32 = *v2;
    v33 = *(_QWORD *)(v1 + v32);
    if (v33 == -1 || v33 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v34 = v33 + 1;
    v35 = *(char *)(*(_QWORD *)(v1 + *v7) + v33);
    *(_QWORD *)(v1 + v32) = v34;
    v10 |= (unint64_t)(v35 & 0x7F) << 42;
    if ((v35 & 0x80000000) == 0)
      goto LABEL_5;
    v36 = *v2;
    v37 = *(_QWORD *)(v1 + v36);
    if (v37 == -1 || v37 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v38 = v37 + 1;
    v39 = *(char *)(*(_QWORD *)(v1 + *v7) + v37);
    *(_QWORD *)(v1 + v36) = v38;
    v10 |= (unint64_t)(v39 & 0x7F) << 49;
    if ((v39 & 0x80000000) == 0)
      goto LABEL_5;
    v40 = *v2;
    v41 = *(_QWORD *)(v1 + v40);
    if (v41 == -1 || v41 >= *(_QWORD *)(v1 + *v6))
      goto LABEL_9;
    v42 = v41 + 1;
    v43 = *(char *)(*(_QWORD *)(v1 + *v7) + v41);
    *(_QWORD *)(v1 + v40) = v42;
    v10 |= (unint64_t)(v43 & 0x7F) << 56;
    if ((v43 & 0x80000000) == 0)
    {
LABEL_5:
      if (*(_BYTE *)(v1 + *v5))
        return 0;
      else
        return v10;
    }
    v44 = *v2;
    v45 = *(_QWORD *)(v1 + v44);
    if (v45 != -1 && v45 < *(_QWORD *)(v1 + *v6))
    {
      v46 = *(unsigned __int8 *)(*(_QWORD *)(v1 + *v7) + v45);
      *(_QWORD *)(v1 + v44) = v45 + 1;
      if ((v46 & 0x80) == 0)
      {
        v47 = v10 | (v46 << 63);
        if (*(_BYTE *)(v1 + *v5))
          return 0;
        else
          return v47;
      }
      return 0;
    }
  }
LABEL_9:
  *(_BYTE *)(v1 + *v5) = 1;
  if (*(_BYTE *)(v1 + *v5))
    return 0;
  else
    return v10;
}

uint64_t geo::codec::PBDataReaderObjC::buffer(geo::codec::PBDataReaderObjC *this, const void **a2, unint64_t *a3)
{
  uint64_t v6;
  int *v7;

  if (((*(uint64_t (**)(geo::codec::PBDataReaderObjC *))(*(_QWORD *)this + 24))(this) & 1) != 0)
    return 0;
  v6 = *((_QWORD *)this + 1);
  if (!v6)
    return 0;
  v7 = (int *)MEMORY[0x1E0D82BF0];
  *a2 = (const void *)(*(_QWORD *)(v6 + (int)*MEMORY[0x1E0D82BB8]) + *(_QWORD *)(v6 + (int)*MEMORY[0x1E0D82BF0]));
  *a3 = *(_QWORD *)(v6 + (int)*MEMORY[0x1E0D82BD8]) - *(_QWORD *)(v6 + *v7);
  return 1;
}

int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x1E0DE4110](dest, destLen, source, *(_QWORD *)&sourceLen, *(_QWORD *)&blockSize100k, *(_QWORD *)&verbosity, *(_QWORD *)&workFactor);
}

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  return MEMORY[0x1E0DE4118](dest, destLen, source, *(_QWORD *)&sourceLen, *(_QWORD *)&small, *(_QWORD *)&verbosity);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  return MEMORY[0x1E0DE4150](bzerror, b, buf, *(_QWORD *)&len);
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
  MEMORY[0x1E0DE4158](bzerror, b);
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  return (BZFILE *)MEMORY[0x1E0DE4160](bzerror, f, *(_QWORD *)&verbosity, *(_QWORD *)&small, unused, *(_QWORD *)&nUnused);
}

const char *__cdecl BZ2_bzerror(BZFILE *b, int *errnum)
{
  return (const char *)MEMORY[0x1E0DE4180](b, errnum);
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

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
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

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
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

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C803A8](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x1E0C97F08](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1E0C97F20](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1E0C97F28](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1E0C97F38](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F48](heap);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D71050]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D71060]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
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

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFIndex CFSetGetCountOfValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98DB0](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
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

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
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

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x1E0CA5758](allocator, callback, context, pathsToWatch, sinceWhen, *(_QWORD *)&flags, latency);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0CA5768](streamRef);
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0CA5770](streamRef);
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  MEMORY[0x1E0CA5780](streamRef, q);
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x1E0CA5790](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0CA5798](streamRef);
}

uint64_t GEOGetCuratedCollectionsLog()
{
  return MEMORY[0x1E0D27930]();
}

uint64_t GEOGetLaunchLog()
{
  return MEMORY[0x1E0D27938]();
}

uint64_t GEOGetMonotonicTime()
{
  return MEMORY[0x1E0D27940]();
}

uint64_t GEOGetOfflineDataAccessLog()
{
  return MEMORY[0x1E0D27948]();
}

uint64_t GEOGetOfflineServiceLog()
{
  return MEMORY[0x1E0D27950]();
}

uint64_t GEOGetOfflineStateLog()
{
  return MEMORY[0x1E0D27958]();
}

uint64_t GEOGetPOIBusynessLog()
{
  return MEMORY[0x1E0D27960]();
}

uint64_t GEOGetPlaceCardLayoutLog()
{
  return MEMORY[0x1E0D27968]();
}

uint64_t GEOGetPlaceRequestLog()
{
  return MEMORY[0x1E0D27970]();
}

uint64_t GEOGetResourceManifestLog()
{
  return MEMORY[0x1E0D27978]();
}

uint64_t GEOGetRoutePreloaderLog()
{
  return MEMORY[0x1E0D27980]();
}

uint64_t GEOGetSubscriptionsLog()
{
  return MEMORY[0x1E0D27988]();
}

uint64_t GEOGetTileLoadingLog()
{
  return MEMORY[0x1E0D27990]();
}

uint64_t j__GEOGetUserDefaultsLog()
{
  return MEMORY[0x1E0D27998]();
}

uint64_t GEOGetUserSessionLog()
{
  return MEMORY[0x1E0D279A0]();
}

uint64_t GEOMachAbsoluteTimeGetCurrent()
{
  return MEMORY[0x1E0D279A8]();
}

uint64_t GEORegisterPListStateCaptureAtFrequency()
{
  return MEMORY[0x1E0D279B0]();
}

uint64_t GEORegisterPListStateCaptureLegacy()
{
  return MEMORY[0x1E0D279B8]();
}

uint64_t GEOUnregisterStateCaptureLegacy()
{
  return MEMORY[0x1E0D279C0]();
}

uint64_t GEOXPCServerIdentifierForType()
{
  return MEMORY[0x1E0D279C8]();
}

uint64_t GEOXPCServerTypeForIdentifier()
{
  return MEMORY[0x1E0D279D0]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD50](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSGetNextSearchPathEnumeration()
{
  return MEMORY[0x1E0C805B8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStartSearchPathEnumerationPrivate()
{
  return MEMORY[0x1E0C805C0]();
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

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteSfixed32Field()
{
  return MEMORY[0x1E0D82C78]();
}

uint64_t PBDataWriterWriteSfixed64Field()
{
  return MEMORY[0x1E0D82C80]();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return MEMORY[0x1E0D82C88]();
}

uint64_t PBDataWriterWriteSint64Field()
{
  return MEMORY[0x1E0D82C90]();
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

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1E0D82CD0]();
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

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x1E0D82D30]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x1E0D82D38]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x1E0D82D40]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x1E0D82D48]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x1E0D82D50]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x1E0D82D58]();
}

uint64_t PBRepeatedBOOLSet()
{
  return MEMORY[0x1E0D82D60]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x1E0D82E80]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x1E0D82E88]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x1E0D82E90]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x1E0D82E98]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x1E0D82EA0]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x1E0D82EA8]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x1E0D82EB0]();
}

uint64_t PBUnknownFieldAdd()
{
  return MEMORY[0x1E0D82EB8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x1E0CD5F28]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _GEOCreateTransaction()
{
  return MEMORY[0x1E0D279E0]();
}

uint64_t _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable()
{
  return MEMORY[0x1E0D71078]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string::const_reference std::string::at(const std::string *this, std::string::size_type __n)
{
  return (std::string::const_reference)MEMORY[0x1E0DE41B0](this, __n);
}

std::string::size_type std::string::copy(const std::string *this, std::string::value_type *__s, std::string::size_type __n, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41B8](this, __s, __n, __pos);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41D0](this, __c, __pos);
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
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  MEMORY[0x1E0DE42A8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x1E0DE4400](this, __n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4430](this, __str, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4488](this, __pos, __n1, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
  MEMORY[0x1E0DE44D0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
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

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1E0DE45E0]();
}

{
  return MEMORY[0x1E0DE45E8]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1E0DE45F0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
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
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
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

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
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

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x1E0DE4B00]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, long double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D48](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D78](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E1BEFA28();
}

void operator delete(void *__p)
{
  off_1E1BEFA30(__p);
}

uint64_t operator delete()
{
  return off_1E1BEFA38();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1E1BEFA40(__sz);
}

uint64_t operator new[]()
{
  return off_1E1BEFA48();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E1BEFA50(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E1BEFA58(__sz, a2);
}

uint64_t operator new()
{
  return off_1E1BEFA60();
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

void __cxa_call_unexpected(void *a1)
{
  MEMORY[0x1E0DE5088](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
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

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x1E0D279E8]();
}

uint64_t _geo_isolate_lock_data()
{
  return MEMORY[0x1E0D279F0]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x1E0D279F8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1E0DE3DC0]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x1E0DE3DE0]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1E0DE3E38]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1E0DE3E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_data_skip()
{
  return MEMORY[0x1E0DE3E98]();
}

uint64_t archive_read_extract()
{
  return MEMORY[0x1E0DE3EE0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x1E0DE3F28]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1E0DE3F30]();
}

uint64_t archive_read_support_filter_bzip2()
{
  return MEMORY[0x1E0DE3F50]();
}

uint64_t archive_read_support_filter_gzip()
{
  return MEMORY[0x1E0DE3F60]();
}

uint64_t archive_read_support_format_cpio()
{
  return MEMORY[0x1E0DE3F78]();
}

uint64_t archive_read_support_format_tar()
{
  return MEMORY[0x1E0DE3F88]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int j__compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1E0DE9298](dest, destLen, source, sourceLen);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x1E0DE92A8](sourceLen);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5288](*(_QWORD *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return MEMORY[0x1E0C82C78]();
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
  MEMORY[0x1E0C82D50](channel, barrier);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D70](type, path, *(_QWORD *)&oflag, mode, queue, cleanup_handler);
}

dispatch_fd_t dispatch_io_get_descriptor(dispatch_io_t channel)
{
  return MEMORY[0x1E0C82D78](channel);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
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

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int freelocale(locale_t a1)
{
  return MEMORY[0x1E0C834D8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t geo_assert_isolated()
{
  return MEMORY[0x1E0D27A00]();
}

uint64_t geo_assert_not_isolated()
{
  return MEMORY[0x1E0D27A08]();
}

uint64_t geo_dispatch_async_qos()
{
  return MEMORY[0x1E0D27A10]();
}

uint64_t geo_dispatch_block_clean_copy()
{
  return MEMORY[0x1E0D27A18]();
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x1E0D27A20]();
}

uint64_t geo_dispatch_queue_create_with_format()
{
  return MEMORY[0x1E0D27A28]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x1E0D27A30]();
}

uint64_t geo_dispatch_queue_create_with_target()
{
  return MEMORY[0x1E0D27A38]();
}

uint64_t geo_dispatch_queue_create_with_workloop_qos()
{
  return MEMORY[0x1E0D27A40]();
}

uint64_t geo_dispatch_timer_create_on_qos()
{
  return MEMORY[0x1E0D27A48]();
}

uint64_t geo_dispatch_timer_create_on_queue()
{
  return MEMORY[0x1E0D27A50]();
}

uint64_t geo_dispatch_workloop_create()
{
  return MEMORY[0x1E0D27A58]();
}

uint64_t geo_dispatch_workloop_create_with_format()
{
  return MEMORY[0x1E0D27A60]();
}

uint64_t geo_dispatch_workloop_create_with_qos()
{
  return MEMORY[0x1E0D27A68]();
}

uint64_t geo_get_global_operation_queue()
{
  return MEMORY[0x1E0D27A70]();
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x1E0D27A78]();
}

uint64_t geo_get_global_workloop()
{
  return MEMORY[0x1E0D27A80]();
}

uint64_t geo_isolate_async()
{
  return MEMORY[0x1E0D27A88]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x1E0D27A90]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x1E0D27A98]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x1E0D27AA0]();
}

uint64_t geo_isolater_create_with_format()
{
  return MEMORY[0x1E0D27AA8]();
}

uint64_t geo_reentrant_isolate_sync()
{
  return MEMORY[0x1E0D27AB0]();
}

uint64_t geo_reentrant_isolater_create()
{
  return MEMORY[0x1E0D27AB8]();
}

uint64_t geo_reentrant_isolater_create_with_format()
{
  return MEMORY[0x1E0D27AC0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1E0DE9338](file, errnum);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x1E0DE9358](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1E0DE9370](file, buf, *(_QWORD *)&len);
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  return MEMORY[0x1E0C83898](*(_QWORD *)&host, multiuser_mode);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
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

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
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

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
  MEMORY[0x1E0C83E90](zone);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x1E0C83ED8](zone, name);
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

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F20](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F28](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F40](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  MEMORY[0x1E0C83FA8](zone, stats);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x1E0C841E8](a2, a1);
  return result;
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x1E0C843A0](*(_QWORD *)&a1, a2, a3);
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

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3C8](url);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

void nw_parameters_prohibit_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x1E0CCFA38](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

uint64_t nw_path_evaluator_set_queue()
{
  return MEMORY[0x1E0CCFD50]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD58]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x1E0CCFD68]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
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

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int sched_yield(void)
{
  return MEMORY[0x1E0C85270]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
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

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_zeroblob64(sqlite3_stmt *a1, int a2, sqlite3_uint64 a3)
{
  return MEMORY[0x1E0DE8600](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return MEMORY[0x1E0DE8610](a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return MEMORY[0x1E0DE8618](a1, zDb, zTable, zColumn, iRow, *(_QWORD *)&flags, ppBlob);
}

int sqlite3_blob_write(sqlite3_blob *a1, const void *z, int n, int iOffset)
{
  return MEMORY[0x1E0DE8628](a1, z, *(_QWORD *)&n, *(_QWORD *)&iOffset);
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

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1E0DE8718](db, zName, p, pClientData);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1E0DE8770](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
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

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1E0DE8A10](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x1E0DE8A30](a1);
  return result;
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x1E0DE8A88](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int sscanf_l(const char *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1E0C854A0](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
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

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x1E0C85628](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
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

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1E0DE93F8](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C859F8](a1, a2);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
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

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C85EA8](xarray, index, bytes, length);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
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

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
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

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
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

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
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

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
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

