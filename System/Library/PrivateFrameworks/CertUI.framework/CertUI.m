__CFDictionary *_CopyVersion2QueryDictionaryForDigestHostService(const void *a1, void *a2, void *a3, __CFString *a4)
{
  id v7;
  __CFDictionary *DictionaryForDigest;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  CFStringRef v13;
  const void **v14;
  const __CFString *v15;
  CFStringRef v16;

  v7 = a3;
  DictionaryForDigest = _CopyVersion2QueryDictionaryForDigest(a1, a2);
  if (a4 == CFSTR("CertUIServiceTypeHTTPS"))
  {
    v14 = (const void **)MEMORY[0x24BDE90C8];
    v15 = CFSTR("https: ");
LABEL_22:
    v16 = _CopyKeychainAccountForPrefixParticularDigest((uint64_t)v15, (uint64_t)v7, a2);

    CFDictionaryAddValue(DictionaryForDigest, (const void *)*MEMORY[0x24BDE8FA8], v16);
    CFRelease(v16);
    goto LABEL_23;
  }
  if (a4 == CFSTR("kCertUIServiceTypeIMAP"))
  {
    v14 = (const void **)MEMORY[0x24BDE90D0];
    v15 = CFSTR("imap: ");
    goto LABEL_22;
  }
  if (a4 == CFSTR("kCertUIServiceTypePOP3"))
  {
    v14 = (const void **)MEMORY[0x24BDE90E8];
    v15 = CFSTR("pop3: ");
    goto LABEL_22;
  }
  v9 = CFSTR("ssh: ");
  v10 = CFSTR("ldap: ");
  v11 = &stru_24C35DEB0;
  if (a4 == CFSTR("kCertUIServiceTypeLDAPS"))
    v11 = CFSTR("ldaps: ");
  if (a4 != CFSTR("kCertUIServiceTypeLDAP"))
    v10 = v11;
  if (a4 != CFSTR("kCertUIServiceTypeSSH"))
    v9 = v10;
  if (a4 == CFSTR("kCertUIServiceTypeSMTP"))
    v12 = CFSTR("smtp: ");
  else
    v12 = v9;
  v13 = _CopyKeychainAccountForPrefixParticularDigest((uint64_t)v12, (uint64_t)v7, a2);

  CFDictionaryAddValue(DictionaryForDigest, (const void *)*MEMORY[0x24BDE8FA8], v13);
  CFRelease(v13);
  if (a4 == CFSTR("kCertUIServiceTypePOP3"))
  {
    v14 = (const void **)MEMORY[0x24BDE90E8];
  }
  else if (a4 == CFSTR("kCertUIServiceTypeSMTP"))
  {
    v14 = (const void **)MEMORY[0x24BDE90F0];
  }
  else if (a4 == CFSTR("kCertUIServiceTypeSSH"))
  {
    v14 = (const void **)MEMORY[0x24BDE90F8];
  }
  else if (a4 == CFSTR("kCertUIServiceTypeLDAP"))
  {
    v14 = (const void **)MEMORY[0x24BDE90D8];
  }
  else
  {
    if (a4 != CFSTR("kCertUIServiceTypeLDAPS"))
      return DictionaryForDigest;
    v14 = (const void **)MEMORY[0x24BDE90E0];
  }
LABEL_23:
  if (*v14)
    CFDictionaryAddValue(DictionaryForDigest, (const void *)*MEMORY[0x24BDE9188], *v14);
  return DictionaryForDigest;
}

CFTypeRef _CopyExceptionsForMutableQuery(__CFDictionary *a1)
{
  void *v2;
  const void *v3;
  NSObject *v4;
  void *Value;
  const void *v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  CFTypeRef v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  const void *v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  CFTypeRef result;
  uint8_t buf[4];
  CFTypeRef v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  result = 0;
  CFDictionaryAddValue(a1, (const void *)*MEMORY[0x24BDE94C8], (const void *)*MEMORY[0x24BDBD270]);
  v2 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v3 = (const void *)*MEMORY[0x24BDE8FA8];
    v4 = v2;
    Value = (void *)CFDictionaryGetValue(a1, v3);
    v6 = (const void *)*MEMORY[0x24BDE8F50];
    v7 = Value;
    v8 = (const __CFString *)CFDictionaryGetValue(a1, v6);
    v9 = CFSTR("global");
    if (v8)
      v9 = v8;
    *(_DWORD *)buf = 138412546;
    v24 = Value;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_20AA96000, v4, OS_LOG_TYPE_INFO, "Copying exceptions for %@ in %@ access group", buf, 0x16u);

  }
  v10 = SecItemCopyMatching(a1, &result);
  if (v10 != -25300 && (v11 = v10) != 0)
  {
    v14 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v15 = (const void *)*MEMORY[0x24BDE8FA8];
      v16 = v14;
      v17 = (void *)CFDictionaryGetValue(a1, v15);
      v18 = (const void *)*MEMORY[0x24BDE8F50];
      v19 = v17;
      v20 = (const __CFString *)CFDictionaryGetValue(a1, v18);
      v21 = CFSTR("global");
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      if (v20)
        v21 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 1024;
      v28 = v11;
      _os_log_impl(&dword_20AA96000, v16, OS_LOG_TYPE_ERROR, "Couldn't copy matching item for %@ in %@ access group (%d)", buf, 0x1Cu);

    }
    v13 = result;
    if (result)
    {
      CFRelease(result);
      return 0;
    }
  }
  else
  {
    v12 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = result;
      _os_log_impl(&dword_20AA96000, v12, OS_LOG_TYPE_INFO, "Found exceptions %@", buf, 0xCu);
    }
    return result;
  }
  return v13;
}

__CFDictionary *_CopyVersion2QueryDictionaryForDigestSender(const void *a1, void *a2, void *a3)
{
  id v5;
  __CFDictionary *DictionaryForDigest;
  CFStringRef v7;

  v5 = a3;
  DictionaryForDigest = _CopyVersion2QueryDictionaryForDigest(a1, a2);
  v7 = _CopyKeychainAccountForPrefixParticularDigest((uint64_t)CFSTR("S/MIME: "), (uint64_t)v5, a2);

  CFDictionaryAddValue(DictionaryForDigest, (const void *)*MEMORY[0x24BDE8FA8], v7);
  CFRelease(v7);
  return DictionaryForDigest;
}

void _SaveExceptionsForMutableQuery(const __CFDictionary *a1, void *a2, const void *a3)
{
  void *v6;
  const void *v7;
  NSObject *v8;
  __CFString *Value;
  const void *v10;
  __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  OSStatus v16;
  NSObject *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  const void *v22;
  id v23;
  const __CFString *v24;
  const __CFString *v25;
  int v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v7 = (const void *)*MEMORY[0x24BDE8FA8];
    v8 = v6;
    Value = (__CFString *)CFDictionaryGetValue(a1, v7);
    v10 = (const void *)*MEMORY[0x24BDE8F50];
    v11 = Value;
    v12 = (const __CFString *)CFDictionaryGetValue(a1, v10);
    v13 = CFSTR("global");
    v26 = 138412802;
    v27 = a2;
    if (v12)
      v13 = v12;
    v28 = 2112;
    v29 = Value;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_20AA96000, v8, OS_LOG_TYPE_INFO, "Saving exceptions %@ for %@ in %@ access group", (uint8_t *)&v26, 0x20u);

  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v15 = Mutable;
  if (a2)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9550], a2);
  if (a3)
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BDE8F60], a3);
  v16 = SecItemUpdate(a1, v15);
  if (v16 == -25300)
  {
    v17 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_20AA96000, v17, OS_LOG_TYPE_INFO, "Don't already have the item, trying an add", (uint8_t *)&v26, 2u);
    }
    if (a2)
      CFDictionaryAddValue(a1, (const void *)*MEMORY[0x24BDE9550], a2);
    if (a3)
      CFDictionarySetValue(a1, (const void *)*MEMORY[0x24BDE8F60], a3);
    v16 = SecItemAdd(a1, 0);
  }
  if (v16)
  {
    v18 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v19 = (const void *)*MEMORY[0x24BDE8FA8];
      v20 = v18;
      v21 = (void *)CFDictionaryGetValue(a1, v19);
      v22 = (const void *)*MEMORY[0x24BDE8F50];
      v23 = v21;
      v24 = (const __CFString *)CFDictionaryGetValue(a1, v22);
      v25 = CFSTR("global");
      v26 = 138412802;
      v27 = v21;
      if (v24)
        v25 = v24;
      v28 = 2112;
      v29 = v25;
      v30 = 1024;
      LODWORD(v31) = v16;
      _os_log_impl(&dword_20AA96000, v20, OS_LOG_TYPE_ERROR, "Couldn't set exceptions for %@ in %@ access group (%d)", (uint8_t *)&v26, 0x1Cu);

    }
  }
  if (v15)
    CFRelease(v15);
}

void _DeleteExceptionsForQuery(const __CFDictionary *a1)
{
  void *v2;
  const void *v3;
  NSObject *v4;
  __CFString *Value;
  const void *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  OSStatus v10;
  OSStatus v11;
  void *v12;
  const void *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v3 = (const void *)*MEMORY[0x24BDE8FA8];
    v4 = v2;
    Value = (__CFString *)CFDictionaryGetValue(a1, v3);
    v6 = (const void *)*MEMORY[0x24BDE8F50];
    v7 = Value;
    v8 = (const __CFString *)CFDictionaryGetValue(a1, v6);
    v9 = CFSTR("global");
    if (v8)
      v9 = v8;
    v19 = 138412546;
    v20 = Value;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_20AA96000, v4, OS_LOG_TYPE_INFO, "Removing exceptions for %@ in %@ access group", (uint8_t *)&v19, 0x16u);

  }
  v10 = SecItemDelete(a1);
  if (v10 != -25300)
  {
    v11 = v10;
    if (v10)
    {
      v12 = (void *)_CertUILogObjects;
      if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
      {
        v13 = (const void *)*MEMORY[0x24BDE8FA8];
        v14 = v12;
        v15 = (const __CFString *)CFDictionaryGetValue(a1, v13);
        if (v15)
          v16 = v15;
        else
          v16 = CFSTR("all");
        v17 = (const __CFString *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDE8F50]);
        v18 = CFSTR("global");
        v19 = 138412802;
        v20 = v16;
        if (v17)
          v18 = v17;
        v21 = 2112;
        v22 = v18;
        v23 = 1024;
        v24 = v11;
        _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "Couldn't delete trust settings for %@ in %@ access group (%d)", (uint8_t *)&v19, 0x1Cu);

      }
    }
  }
}

__CFDictionary *_CopyVersion2QueryDictionaryForDigest(const void *a1, const void *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = Mutable;
  if (a1)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], a1);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  if (a2)
    CFDictionaryAddValue(v5, (const void *)*MEMORY[0x24BDE9000], a2);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x24BDE9128], CFSTR("com.apple.certui"));
  return v5;
}

CFStringRef _CopyKeychainAccountForPrefixParticularDigest(uint64_t a1, uint64_t a2, void *a3)
{
  const __CFAllocator *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  char v15;
  _BYTE *v16;
  void *v17;
  CFStringRef v18;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  v9 = malloc_type_malloc(((9 * v8) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0xF1E328BAuLL);
  if (v8 < 5)
  {
    v10 = 0;
    v12 = v9;
    if (!v8)
      goto LABEL_12;
    goto LABEL_9;
  }
  v10 = 0;
  v11 = v7;
  v12 = v9;
  do
  {
    v13 = 0;
    ++v12;
    do
    {
      *(v12 - 1) = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v11 + v13) >> 4];
      *v12 = a0123456789abcd[*(_BYTE *)(v11 + v13) & 0xF];
      v12 += 2;
      ++v13;
    }
    while (v13 != 4);
    *(v12 - 1) = 32;
    v10 += 4;
    v8 -= 4;
    v11 += 4;
  }
  while (v8 > 4);
  if (v8)
  {
LABEL_9:
    v14 = (char *)(v7 + v10);
    do
    {
      *v12 = a0123456789abcd[(unint64_t)*v14 >> 4];
      v15 = *v14++;
      v16 = v12 + 2;
      v12[1] = a0123456789abcd[v15 & 0xF];
      v12 += 2;
      --v8;
    }
    while (v8);
    v12 = v16;
  }
LABEL_12:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, v12 - v9, 1, 1);

  v18 = CFStringCreateWithFormat(v5, 0, CFSTR("%@%@ - %@"), a1, a2, v17);
  return v18;
}

void CertUILoggingInitialize()
{
  if (CertUILoggingInitialize_onceToken != -1)
    dispatch_once(&CertUILoggingInitialize_onceToken, &__block_literal_global_0);
}

void sub_20AA9B58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x24BE04658]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x24BE04660]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x24BDE8880]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x24BDE88B8]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x24BDE8938]();
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return MEMORY[0x24BDE8960]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x24BDE8DA0](trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return MEMORY[0x24BDE8E38](trust, exceptions);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

