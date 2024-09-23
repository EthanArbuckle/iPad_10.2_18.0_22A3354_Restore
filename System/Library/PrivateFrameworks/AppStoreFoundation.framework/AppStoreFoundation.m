id _readStringDate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BDD1500];
    v2 = a1;
    v3 = objc_alloc_init(v1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
    objc_msgSend(v3, "dateFromString:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_20D885E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __readIdentifier_block_invoke(uint64_t result, _BYTE *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a4)
  {
    **(_BYTE **)(result + 40) = *a2 >> 6;
    if ((~*a2 & 0x1F) != 0)
    {
      **(_QWORD **)(result + 48) = 1;
      v5 = *a2 & 0x1F;
    }
    else
    {
      v5 = 0xFFFFLL;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v5;
  }
  *a5 = 1;
  return result;
}

void __readLength_block_invoke(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (((char)*a2 & 0x80000000) == 0)
    {
      **(_QWORD **)(a1 + 40) = 1;
      v6 = *a2;
LABEL_4:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
      goto LABEL_18;
    }
    v7 = *a2 & 0x7F;
    if (a4 <= v7)
    {
      **(_QWORD **)(a1 + 40) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    if (v7 <= 8)
    {
      if ((_DWORD)v7)
      {
        v8 = 0;
        v6 = 0;
        do
        {
          if (v8)
            v6 <<= 8;
          v6 |= a2[++v8];
        }
        while (v7 != v8);
      }
      else
      {
        v6 = 0;
      }
      **(_QWORD **)(a1 + 40) = (v7 + 1);
      goto LABEL_4;
    }
    if (ASFLogHandleForCategory_onceToken_0 != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken_0, &__block_literal_global_0);
    v9 = ASFLogHandleForCategory_logHandles_0_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0_0, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_20D881000, v9, OS_LOG_TYPE_ERROR, "Byte count would result in overflow: %d", (uint8_t *)v10, 8u);
    }
  }
LABEL_18:
  *a5 = 1;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecCmsContentInfoGetContent()
{
  return MEMORY[0x24BDE8980]();
}

uint64_t SecCmsContentInfoGetContentTypeTag()
{
  return MEMORY[0x24BDE8988]();
}

uint64_t SecCmsDecoderCreate()
{
  return MEMORY[0x24BDE8990]();
}

uint64_t SecCmsDecoderDestroy()
{
  return MEMORY[0x24BDE8998]();
}

uint64_t SecCmsDecoderFinish()
{
  return MEMORY[0x24BDE89A0]();
}

uint64_t SecCmsDecoderUpdate()
{
  return MEMORY[0x24BDE89A8]();
}

uint64_t SecCmsMessageContentLevel()
{
  return MEMORY[0x24BDE89B0]();
}

uint64_t SecCmsMessageContentLevelCount()
{
  return MEMORY[0x24BDE89B8]();
}

uint64_t SecCmsMessageDestroy()
{
  return MEMORY[0x24BDE89C0]();
}

uint64_t SecCmsMessageGetContent()
{
  return MEMORY[0x24BDE89C8]();
}

uint64_t SecCmsSignedDataGetCertificateList()
{
  return MEMORY[0x24BDE89D0]();
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C88](policyIdentifier, properties);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x24BDE8E60](trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

